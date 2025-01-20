unint64_t sub_25C6E1E8C(char a1)
{
  unint64_t result;

  result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      result = 0x54746E6572727563;
      break;
    case 2:
      result = 0x6E7275547478656ELL;
      break;
    case 3:
      result = 0x6552726573557369;
      break;
    case 4:
      return result;
    case 5:
      result = 0xD000000000000018;
      break;
    default:
      result = 0x6F69736E656D6964;
      break;
  }
  return result;
}

BOOL sub_25C6E1F88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25C6E1F9C()
{
  return sub_25C701630();
}

uint64_t sub_25C6E1FE4()
{
  return sub_25C701620();
}

uint64_t sub_25C6E2010()
{
  return sub_25C701630();
}

unint64_t sub_25C6E2054()
{
  return sub_25C6E1E8C(*v0);
}

uint64_t sub_25C6E205C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C6E310C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C6E2084()
{
  return 0;
}

void sub_25C6E2090(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25C6E209C(uint64_t a1)
{
  unint64_t v2 = sub_25C6E2454();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C6E20D8(uint64_t a1)
{
  unint64_t v2 = sub_25C6E2454();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProcessedSiriTurn.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6E2454();
  sub_25C701660();
  long long v9 = *(_OWORD *)(v3 + 16);
  long long v10 = *(_OWORD *)(v3 + 32);
  long long v11 = *(_OWORD *)(v3 + 48);
  uint64_t v12 = *(void *)(v3 + 64);
  uint64_t v13 = *(void *)(v3 + 72);
  v15[0] = *(_OWORD *)v3;
  v15[1] = v9;
  v15[2] = v10;
  v15[3] = v11;
  uint64_t v16 = v12;
  uint64_t v17 = v13;
  char v18 = 0;
  sub_25C6E24A8();
  sub_25C701570();
  if (!v2)
  {
    type metadata accessor for ProcessedSiriTurn();
    LOBYTE(v15[0]) = 1;
    sub_25C700D20();
    sub_25C6E4D8C(&qword_26A5C7BD0, MEMORY[0x263F07508]);
    sub_25C701550();
    LOBYTE(v15[0]) = 2;
    sub_25C701550();
    LOBYTE(v15[0]) = 3;
    sub_25C701530();
    LOBYTE(v15[0]) = 4;
    sub_25C701540();
    LOBYTE(v15[0]) = 5;
    sub_25C701540();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
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

unint64_t sub_25C6E2454()
{
  unint64_t result = qword_26A5C7BC0;
  if (!qword_26A5C7BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7BC0);
  }
  return result;
}

unint64_t sub_25C6E24A8()
{
  unint64_t result = qword_26A5C7BC8;
  if (!qword_26A5C7BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7BC8);
  }
  return result;
}

uint64_t type metadata accessor for ProcessedSiriTurn()
{
  uint64_t result = qword_26A5C7C20;
  if (!qword_26A5C7C20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ProcessedSiriTurn.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v32 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BE0);
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for ProcessedSiriTurn();
  MEMORY[0x270FA5388](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_25C6E2454();
  v36 = v11;
  sub_25C701650();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
  v32 = v6;
  uint64_t v16 = (int *)v12;
  char v44 = 0;
  sub_25C6E2ACC();
  uint64_t v17 = v35;
  sub_25C701510();
  long long v18 = v39;
  long long v19 = v40;
  long long v20 = v41;
  uint64_t v21 = v42;
  uint64_t v22 = v43;
  *(_OWORD *)v14 = v38;
  *((_OWORD *)v14 + 1) = v18;
  *((_OWORD *)v14 + 2) = v19;
  *((_OWORD *)v14 + 3) = v20;
  *((void *)v14 + 8) = v21;
  *((void *)v14 + 9) = v22;
  sub_25C700D20();
  LOBYTE(v38) = 1;
  sub_25C6E4D8C(&qword_26A5C7BF0, MEMORY[0x263F07508]);
  sub_25C7014F0();
  sub_25C6E2B20((uint64_t)v8, (uint64_t)&v14[*(int *)(v12 + 20)]);
  LOBYTE(v38) = 2;
  uint64_t v23 = (uint64_t)v32;
  sub_25C7014F0();
  sub_25C6E2B20(v23, (uint64_t)&v14[v16[6]]);
  LOBYTE(v38) = 3;
  v14[v16[7]] = sub_25C7014D0();
  LOBYTE(v38) = 4;
  uint64_t v24 = sub_25C7014E0();
  v25 = &v14[v16[8]];
  *(void *)v25 = v24;
  v25[8] = v26 & 1;
  LOBYTE(v38) = 5;
  uint64_t v27 = sub_25C7014E0();
  char v29 = v28;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v17);
  v30 = &v14[v16[9]];
  *(void *)v30 = v27;
  v30[8] = v29 & 1;
  sub_25C6E2B88((uint64_t)v14, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  return sub_25C6E2BEC((uint64_t)v14);
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

uint64_t sub_25C6E2A6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C6E2ACC()
{
  unint64_t result = qword_26A5C7BE8;
  if (!qword_26A5C7BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7BE8);
  }
  return result;
}

uint64_t sub_25C6E2B20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6E2B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProcessedSiriTurn();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6E2BEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ProcessedSiriTurn();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6E2C48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProcessedSiriTurn.init(from:)(a1, a2);
}

uint64_t sub_25C6E2C60(void *a1)
{
  return ProcessedSiriTurn.encode(to:)(a1);
}

uint64_t sub_25C6E2C78()
{
  return 1;
}

uint64_t sub_25C6E2C80()
{
  return sub_25C701630();
}

uint64_t sub_25C6E2CC4()
{
  return sub_25C701620();
}

uint64_t sub_25C6E2CEC()
{
  return sub_25C701630();
}

uint64_t sub_25C6E2D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C6E339C(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_25C6E2D5C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25C6E2D68(uint64_t a1)
{
  unint64_t v2 = sub_25C6E2F68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C6E2DA4(uint64_t a1)
{
  unint64_t v2 = sub_25C6E2F68();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProcessedSiriConversation.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BF8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6E2F68();
  sub_25C701660();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7C08);
  sub_25C6E4CF8(&qword_26A5C7C10, &qword_26A5C7C18);
  sub_25C701570();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_25C6E2F68()
{
  unint64_t result = qword_26A5C7C00;
  if (!qword_26A5C7C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C00);
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

void *ProcessedSiriConversation.init(from:)(void *a1)
{
  return sub_25C6E3460(a1);
}

void *sub_25C6E301C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25C6E3460(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C6E3048(void *a1)
{
  return ProcessedSiriConversation.encode(to:)(a1, *v1);
}

uint64_t variable initialization expression of SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores()
{
  return MEMORY[0x263F8EE78];
}

unint64_t variable initialization expression of SiriCoreMetricsJsonLoggingReporter.jsonResult()
{
  return sub_25C6E9964(MEMORY[0x263F8EE78]);
}

uint64_t variable initialization expression of SiriCoreMetricsV2.logger()
{
  return sub_25C701210();
}

uint64_t variable initialization expression of SiriCoreMetrics.logger()
{
  return sub_25C701210();
}

void sub_25C6E30EC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25C6E30F8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25C6E310C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x54746E6572727563 && a2 == 0xED000064496E7275 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E7275547478656ELL && a2 == 0xEA00000000006449 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6552726573557369 && a2 == 0xED00007473657571 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000025C703510 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025C703530)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_25C7015A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25C6E339C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65737365636F7270 && a2 == 0xEE00736E72755464)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25C7015A0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25C6E343C()
{
  return 0x65737365636F7270;
}

void *sub_25C6E3460(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7C70);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6E2F68();
  sub_25C701650();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7C08);
    sub_25C6E4CF8(&qword_26A5C7C78, &qword_26A5C7C80);
    sub_25C701510();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

void *initializeBufferWithCopyOfBuffer for ProcessedSiriTurn(void *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v7;
    uint64_t v8 = *((void *)a2 + 3);
    a1[2] = *((void *)a2 + 2);
    a1[3] = v8;
    uint64_t v9 = *((void *)a2 + 5);
    a1[4] = *((void *)a2 + 4);
    a1[5] = v9;
    uint64_t v10 = *((void *)a2 + 7);
    a1[6] = *((void *)a2 + 6);
    a1[7] = v10;
    uint64_t v11 = *((void *)a2 + 9);
    uint64_t v12 = a3[5];
    __dst = (char *)a1 + v12;
    v30 = &a2[v12];
    a1[8] = *((void *)a2 + 8);
    a1[9] = v11;
    uint64_t v13 = sub_25C700D20();
    uint64_t v31 = *(void *)(v13 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    uint64_t v15 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v30, 1, v15))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
      memcpy(__dst, v30, *(void *)(*(void *)(v16 - 8) + 64));
      uint64_t v17 = v31;
    }
    else
    {
      uint64_t v17 = v31;
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(__dst, v30, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(__dst, 0, 1, v15);
    }
    uint64_t v19 = a3[6];
    long long v20 = (char *)v4 + v19;
    uint64_t v21 = &a2[v19];
    if (v14(&a2[v19], 1, v15))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v21, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v15);
    }
    uint64_t v23 = a3[8];
    *((unsigned char *)v4 + a3[7]) = a2[a3[7]];
    uint64_t v24 = (char *)v4 + v23;
    v25 = &a2[v23];
    *(void *)uint64_t v24 = *(void *)v25;
    v24[8] = v25[8];
    uint64_t v26 = a3[9];
    uint64_t v27 = (char *)v4 + v26;
    char v28 = &a2[v26];
    *(void *)uint64_t v27 = *(void *)v28;
    v27[8] = v28[8];
  }
  return v4;
}

uint64_t destroy for ProcessedSiriTurn(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25C700D20();
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v5);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v7, v5);
  }
  return result;
}

void *initializeWithCopy for ProcessedSiriTurn(void *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *((void *)a2 + 3);
  a1[2] = *((void *)a2 + 2);
  a1[3] = v6;
  uint64_t v7 = *((void *)a2 + 5);
  a1[4] = *((void *)a2 + 4);
  a1[5] = v7;
  uint64_t v8 = *((void *)a2 + 7);
  a1[6] = *((void *)a2 + 6);
  a1[7] = v8;
  uint64_t v9 = *((void *)a2 + 9);
  uint64_t v10 = a3[5];
  __dst = (char *)a1 + v10;
  uint64_t v26 = &a2[v10];
  a1[8] = *((void *)a2 + 8);
  a1[9] = v9;
  uint64_t v11 = sub_25C700D20();
  uint64_t v27 = *(void *)(v11 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v26, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(__dst, v26, *(void *)(*(void *)(v13 - 8) + 64));
    uint64_t v14 = v27;
  }
  else
  {
    uint64_t v14 = v27;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(__dst, v26, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(__dst, 0, 1, v11);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = &a2[v15];
  if (v12(&a2[v15], 1, v11))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v16, v17, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v11);
  }
  uint64_t v19 = a3[8];
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  long long v20 = (char *)a1 + v19;
  uint64_t v21 = &a2[v19];
  *(void *)long long v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  return a1;
}

char *assignWithCopy for ProcessedSiriTurn(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C700D20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  v22[8] = v23[8];
  *(void *)uint64_t v22 = v24;
  uint64_t v25 = a3[9];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  return a1;
}

_OWORD *initializeWithTake for ProcessedSiriTurn(_OWORD *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 3);
  a1[2] = *((_OWORD *)a2 + 2);
  a1[3] = v6;
  a1[4] = *((_OWORD *)a2 + 4);
  long long v7 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_25C700D20();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = &a2[v15];
  if (v13(&a2[v15], 1, v11))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v16, v17, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
  }
  uint64_t v19 = a3[8];
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  return a1;
}

char *assignWithTake for ProcessedSiriTurn(char *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  int v13 = (char *)a2 + v11;
  uint64_t v14 = sub_25C700D20();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = a3[6];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = (char *)a2 + v20;
  int v23 = v16(&a1[v20], 1, v14);
  int v24 = v16(v22, 1, v14);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v21, v22, v14);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v14);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v22, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
LABEL_13:
  uint64_t v26 = a3[8];
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  uint64_t v27 = &a1[v26];
  uint64_t v28 = (char *)a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v28[8];
  uint64_t v29 = a3[9];
  v30 = &a1[v29];
  uint64_t v31 = (char *)a2 + v29;
  *(void *)v30 = *(void *)v31;
  v30[8] = v31[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessedSiriTurn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6E451C);
}

uint64_t sub_25C6E451C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ProcessedSiriTurn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6E45E4);
}

uint64_t sub_25C6E45E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25C6E4690()
{
  sub_25C6E4740();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25C6E4740()
{
  if (!qword_26A5C7C30)
  {
    sub_25C700D20();
    unint64_t v0 = sub_25C7013B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5C7C30);
    }
  }
}

ValueMetadata *type metadata accessor for ProcessedSiriConversation()
{
  return &type metadata for ProcessedSiriConversation;
}

void type metadata accessor for SISchemaDataSharingOptInState()
{
  if (!qword_26A5C7C38)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5C7C38);
    }
  }
}

uint64_t getEnumTagSinglePayload for ProcessedSiriConversation.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ProcessedSiriConversation.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C6E48F4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C6E491C()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProcessedSiriConversation.CodingKeys()
{
  return &type metadata for ProcessedSiriConversation.CodingKeys;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProcessedSiriTurn.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ProcessedSiriTurn.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C6E4AA0);
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

uint64_t sub_25C6E4AC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C6E4AD0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProcessedSiriTurn.CodingKeys()
{
  return &type metadata for ProcessedSiriTurn.CodingKeys;
}

unint64_t sub_25C6E4AEC()
{
  unint64_t result = qword_26A5C7C40;
  if (!qword_26A5C7C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C40);
  }
  return result;
}

unint64_t sub_25C6E4B44()
{
  unint64_t result = qword_26A5C7C48;
  if (!qword_26A5C7C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C48);
  }
  return result;
}

unint64_t sub_25C6E4B9C()
{
  unint64_t result = qword_26A5C7C50;
  if (!qword_26A5C7C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C50);
  }
  return result;
}

unint64_t sub_25C6E4BF4()
{
  unint64_t result = qword_26A5C7C58;
  if (!qword_26A5C7C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C58);
  }
  return result;
}

unint64_t sub_25C6E4C4C()
{
  unint64_t result = qword_26A5C7C60;
  if (!qword_26A5C7C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C60);
  }
  return result;
}

unint64_t sub_25C6E4CA4()
{
  unint64_t result = qword_26A5C7C68;
  if (!qword_26A5C7C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7C68);
  }
  return result;
}

uint64_t sub_25C6E4CF8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C7C08);
    sub_25C6E4D8C(a2, (void (*)(uint64_t))type metadata accessor for ProcessedSiriTurn);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C6E4D8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t SiriCoreMetricsResultsV2.eventStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResultsV2.eventStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResultsV2.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResultsV2.conversationStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResultsV2.conversationStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResultsV2.turns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C6E4E84()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C6E4E8C()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsCalculatorV2.__allocating_init(logger:bookmarkService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = a2;
  return v4;
}

uint64_t SiriCoreMetricsCalculatorV2.init(logger:bookmarkService:)(uint64_t a1, uint64_t a2)
{
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = a2;
  return v2;
}

uint64_t SiriCoreMetricsCalculatorV2.doWork(_:)(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_25C700CD0();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_25C700D20();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7CA8);
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6E51A8, 0, 0);
}

void sub_25C6E51A8()
{
  v0[5] = MEMORY[0x263F8EE88];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7CB0);
  uint64_t v1 = sub_25C700DF0();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[20];
    uint64_t v5 = *(void (**)(void, unint64_t, void))(v3 + 16);
    v3 += 16;
    uint64_t v4 = v5;
    uint64_t v64 = v1;
    unint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    v75 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    uint64_t v7 = v0[15];
    v70 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v66 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v67 = (void (**)(uint64_t, void, uint64_t))(v7 + 32);
    v65 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    v73 = v5;
    uint64_t v74 = *(void *)(v3 + 56);
    unint64_t v8 = 0x2654B6000uLL;
    v5(v0[21], v6, v0[19]);
    while (1)
    {
      uint64_t v9 = (void *)sub_25C700DD0();
      id v10 = objc_msgSend(v9, sel_eventData);

      if (v10)
      {
        uint64_t v11 = sub_25C700C60();
        unint64_t v13 = v12;

        id v10 = (id)sub_25C700C50();
        sub_25C6E5E18(v11, v13);
      }
      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ECE8]), *(SEL *)(v8 + 3264), v10);

      if (!v14)
      {
        __break(1u);
        return;
      }
      if (objc_msgSend(v14, sel_anyEventType) == 6)
      {
        id v15 = objc_msgSend(v14, sel_payload);
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = sub_25C700C60();
          unint64_t v19 = v18;

          uint64_t v20 = (void *)sub_25C700C50();
          unint64_t v21 = v19;
          unint64_t v8 = 0x2654B6000;
          sub_25C6E5E18(v17, v21);
        }
        else
        {
          uint64_t v20 = 0;
        }
        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), *(SEL *)(v8 + 3264), v20);

        if (v22)
        {
          id v23 = objc_msgSend(v22, sel_event);
          if (v23)
          {
            id v24 = v23;
            id v25 = objc_msgSend(v22, sel_metadata);

            id v14 = v24;
          }
        }
      }
      if (objc_msgSend(v14, sel_anyEventType, v64) != 1)
      {
        (*v75)(v0[21], v0[19]);

        goto LABEL_4;
      }
      id v26 = objc_msgSend(v14, sel_payload);
      if (v26)
      {
        uint64_t v27 = sub_25C700C60();
        unint64_t v29 = v28;

        id v26 = (id)sub_25C700C50();
        sub_25C6E5E18(v27, v29);
      }
      id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED20]), *(SEL *)(v8 + 3264), v26);

      if (!v30) {
        goto LABEL_26;
      }
      id v31 = objc_msgSend(v30, sel_eventMetadata);
      if (!v31) {
        break;
      }
      v32 = v31;
      id v33 = objc_msgSend(v31, sel_turnID);

      if (!v33) {
        break;
      }
      uint64_t v34 = v0[13];
      uint64_t v71 = v0[14];
      uint64_t v35 = sub_25C700C60();
      unint64_t v37 = v36;

      id v38 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      sub_25C6E5DC0(v35, v37);
      long long v39 = (void *)sub_25C700C50();
      id v40 = objc_msgSend(v38, sel_initWithBytesAsData_, v39);
      sub_25C6E5E18(v35, v37);

      sub_25C701370();
      if ((*v70)(v34, 1, v71) == 1)
      {
        uint64_t v41 = v0[13];
        (*v75)(v0[21], v0[19]);

        sub_25C6E5E18(v35, v37);
        sub_25C6E2A6C(v41);
      }
      else
      {
        uint64_t v45 = v0[18];
        uint64_t v72 = v0[17];
        v46 = (char *)v0[16];
        uint64_t v68 = v0[21];
        uint64_t v69 = v0[19];
        uint64_t v47 = v0[14];
        (*v67)(v45, v0[13], v47);
        (*v66)(v46, v45, v47);
        sub_25C6E5E70(v72, v46);

        sub_25C6E5E18(v35, v37);
        v48 = *v65;
        (*v65)(v72, v47);
        v48(v45, v47);
        (*v75)(v68, v69);
      }
      uint64_t v4 = v73;
      unint64_t v8 = 0x2654B6000;
LABEL_4:
      v6 += v74;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v49 = v0[5];
        goto LABEL_31;
      }
      v4(v0[21], v6, v0[19]);
    }

LABEL_26:
    uint64_t v42 = v0[21];
    uint64_t v43 = v0[19];

    uint64_t v44 = v43;
    uint64_t v4 = v73;
    (*v75)(v42, v44);
    unint64_t v8 = 0x2654B6000;
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  uint64_t v49 = MEMORY[0x263F8EE88];
LABEL_31:
  swift_bridgeObjectRetain();
  v50 = sub_25C701200();
  os_log_type_t v51 = sub_25C701390();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v52 = 134217984;
    v0[6] = *(void *)(v49 + 16);
    sub_25C7013C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C6E0000, v50, v51, "marker: read %ld Siri turns in this run", v52, 0xCu);
    MEMORY[0x261191AB0](v52, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_25C700F10();
  if (v53)
  {
    uint64_t v55 = v0[10];
    uint64_t v54 = v0[11];
    uint64_t v56 = v0[9];
    sub_25C700E50();
    sub_25C700C80();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
  }
  uint64_t v57 = v0[12];
  uint64_t v58 = v0[10];
  uint64_t v59 = v0[9];
  sub_25C700C70();
  uint64_t v60 = sub_25C700E10();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  swift_beginAccess();
  uint64_t v61 = v0[5];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v62 = (void (*)(uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v63 = MEMORY[0x263F8EE78];
  v62(v60, v63, v61);
}

uint64_t SiriCoreMetricsCalculatorV2.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_calendar;
  uint64_t v4 = sub_25C700DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsCalculatorV2.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_calendar;
  uint64_t v4 = sub_25C700DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_25C6E5AD0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C6E5B6C;
  return SiriCoreMetricsCalculatorV2.doWork(_:)(a2);
}

uint64_t sub_25C6E5B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    id v10 = *(void **)(v8 + 16);
    *id v10 = a1;
    v10[1] = a2;
    v10[2] = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_25C6E5C90(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C6E5CA0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C6E5CDC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_25C6E5D0C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_25C7014C0();
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

unsigned char **sub_25C6E5DB0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25C6E5DC0(uint64_t a1, unint64_t a2)
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

uint64_t sub_25C6E5E18(uint64_t a1, unint64_t a2)
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

uint64_t sub_25C6E5E70(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25C700D20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_25C6E655C(&qword_26A5C7CE0);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = sub_25C701250();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    id v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      unint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_25C6E655C(&qword_26A5C7CE8);
      char v22 = sub_25C701270();
      id v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      id v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25C6E6988((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

unint64_t sub_25C6E6170()
{
  unint64_t result = qword_26A5C7CB8;
  if (!qword_26A5C7CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7CB8);
  }
  return result;
}

unint64_t sub_25C6E61C8()
{
  unint64_t result = qword_26A5C7CC0;
  if (!qword_26A5C7CC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C7CB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7CC0);
  }
  return result;
}

uint64_t destroy for SiriCoreMetricsResultsV2()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s15SiriCoreMetrics24SiriCoreMetricsResultsV2VwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriCoreMetricsResultsV2(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriCoreMetricsResultsV2(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsResultsV2(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsResultsV2(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriCoreMetricsResultsV2()
{
  return &type metadata for SiriCoreMetricsResultsV2;
}

uint64_t sub_25C6E6430()
{
  return type metadata accessor for SiriCoreMetricsCalculatorV2();
}

uint64_t type metadata accessor for SiriCoreMetricsCalculatorV2()
{
  uint64_t result = qword_26A5C7CD0;
  if (!qword_26A5C7CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6E6484()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C700DC0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_25C6E655C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25C700D20();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C6E65A0()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_25C700D20();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7CF0);
  uint64_t v5 = sub_25C701410();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    id v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      id v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_25C6E655C(&qword_26A5C7CE0);
      uint64_t result = sub_25C701250();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v6;
  return result;
}

uint64_t sub_25C6E6988(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_25C700D20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_25C6E65A0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_25C6E6C00();
      goto LABEL_12;
    }
    sub_25C6E6EA4();
  }
  uint64_t v12 = *v3;
  sub_25C6E655C(&qword_26A5C7CE0);
  uint64_t v13 = sub_25C701250();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_25C6E655C(&qword_26A5C7CE8);
      char v21 = sub_25C701270();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_25C7015B0();
  __break(1u);
  return result;
}

void *sub_25C6E6C00()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_25C700D20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7CF0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25C701400();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *unint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_25C6E6EA4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_25C700D20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7CF0);
  uint64_t v7 = sub_25C701410();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_25C6E655C(&qword_26A5C7CE0);
    uint64_t result = sub_25C701250();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t SiriCoreMetricsCalculator.conversationTurnType.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SiriCoreMetricsCalculator.calendar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  uint64_t v4 = sub_25C700DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SiriCoreMetricsCalculator.__allocating_init(logger:conversationTurnType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v4 + 16) = a2;
  return v4;
}

uint64_t SiriCoreMetricsCalculator.init(logger:conversationTurnType:)(uint64_t a1, uint64_t a2)
{
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v2 + 16) = a2;
  return v2;
}

uint64_t SiriCoreMetricsCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  uint64_t v4 = type metadata accessor for SiriCountsAll(0);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v5 = sub_25C700EC0();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v3[22] = v6;
  v3[23] = *(void *)(v6 - 8);
  v3[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D08);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D10);
  v3[27] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ProcessedSiriTurn();
  v3[28] = v7;
  v3[29] = *(void *)(v7 - 8);
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  uint64_t v8 = sub_25C700CD0();
  v3[32] = v8;
  v3[33] = *(void *)(v8 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6E76E0, 0, 0);
}

uint64_t sub_25C6E76E0()
{
  uint64_t v246 = v0;
  uint64_t isUniquelyReferenced_nonNull_native = v0;
  id v2 = objc_allocWithZone((Class)sub_25C7011E0());
  v205 = (void *)sub_25C7011D0();
  unint64_t v3 = sub_25C700F70();
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v5 = (char *)sub_25C6E9278(MEMORY[0x263F8EE78]);
  v226 = (void *)sub_25C6E9278(v4);
  unint64_t v242 = sub_25C6E938C(v4);
  unint64_t v211 = sub_25C6E957C(v4);
  uint64_t v243 = v4;
  unint64_t v207 = v3;
  if (v3 >> 62) {
    goto LABEL_189;
  }
  uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
LABEL_3:
  v221 = (void *)isUniquelyReferenced_nonNull_native;
  uint64_t v209 = v6;
  if (v6)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = v207;
    while (1)
    {
      if ((v207 & 0xC000000000000001) != 0)
      {
        MEMORY[0x261191400](v8, v10);
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_185;
        }
      }
      else
      {
        if (v8 >= *(void *)((v207 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_191;
        }
        swift_retain();
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_185;
        }
      }
      unint64_t v218 = v11;
      unint64_t v12 = sub_25C701130();
      unint64_t v13 = v12;
      if (v12 >> 62) {
        break;
      }
      uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v14) {
        goto LABEL_14;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      unint64_t v8 = v218;
      unint64_t v10 = v207;
      if (v218 == v209) {
        goto LABEL_56;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25C701480();
    swift_bridgeObjectRelease();
    if (!v14) {
      goto LABEL_5;
    }
LABEL_14:
    unint64_t v227 = v8;
    uint64_t v15 = 0;
    uint64_t v236 = v14;
    unint64_t v239 = v13 & 0xC000000000000001;
    unint64_t v230 = v13;
    while (1)
    {
      if (v239)
      {
        MEMORY[0x261191400](v15, v13);
        uint64_t v16 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_172;
        }
      }
      else
      {
        swift_retain();
        uint64_t v16 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          swift_bridgeObjectRetain_n();
          uint64_t v6 = sub_25C701480();
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_3;
        }
      }
      char v17 = sub_25C701190();
      uint64_t v18 = swift_retain();
      if ((v17 & 1) == 0)
      {
        swift_retain();
        uint64_t v35 = sub_25C701200();
        os_log_type_t v36 = sub_25C7013A0();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          v245[0] = v38;
          *(_DWORD *)uint64_t v37 = 136315138;
          uint64_t v39 = sub_25C7011A0();
          *(void *)(v37 + 4) = sub_25C6EC85C(v39, v40, v245);
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_25C6E0000, v35, v36, "Turn: %s has an invalid timestamp", (uint8_t *)v37, 0xCu);
          swift_arrayDestroy();
          uint64_t v41 = v38;
          unint64_t v13 = v230;
          MEMORY[0x261191AB0](v41, -1, -1);
          uint64_t v42 = v37;
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
          MEMORY[0x261191AB0](v42, -1, -1);
          swift_release();
        }
        else
        {
          swift_release_n();
        }

        goto LABEL_17;
      }
      uint64_t v233 = v9;
      MEMORY[0x2611912C0](v18);
      if (*(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25C701330();
      }
      sub_25C701350();
      sub_25C701320();
      uint64_t v19 = sub_25C7011A0();
      uint64_t v21 = v20;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v245[0] = (uint64_t)v226;
      unint64_t v23 = sub_25C6ED094(v19, v21);
      uint64_t v24 = v226[2];
      BOOL v25 = (v22 & 1) == 0;
      uint64_t v26 = v24 + v25;
      if (__OFADD__(v24, v25)) {
        goto LABEL_173;
      }
      char v27 = v22;
      if (v226[3] >= v26)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t v28 = v226;
          if (v22) {
            goto LABEL_36;
          }
        }
        else
        {
          sub_25C6F0284();
          unint64_t v28 = (void *)v245[0];
          v226 = (void *)v245[0];
          if (v27) {
            goto LABEL_36;
          }
        }
      }
      else
      {
        sub_25C6EE0C0(v26, isUniquelyReferenced_nonNull_native);
        unint64_t v28 = (void *)v245[0];
        unint64_t v29 = sub_25C6ED094(v19, v21);
        if ((v27 & 1) != (v30 & 1)) {
          goto LABEL_168;
        }
        unint64_t v23 = v29;
        v226 = v28;
        if (v27)
        {
LABEL_36:
          *(void *)(v28[7] + 8 * v23) = v227;
          goto LABEL_37;
        }
      }
      v28[(v23 >> 6) + 8] |= 1 << v23;
      BOOL v31 = (uint64_t *)(v28[6] + 16 * v23);
      *BOOL v31 = v19;
      v31[1] = v21;
      *(void *)(v28[7] + 8 * v23) = v227;
      uint64_t v32 = v28[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_177;
      }
      v28[2] = v34;
      swift_bridgeObjectRetain();
LABEL_37:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v43 = sub_25C7011A0();
      uint64_t v45 = v44;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v245[0] = (uint64_t)v5;
      unint64_t v47 = sub_25C6ED094(v43, v45);
      uint64_t v48 = *((void *)v5 + 2);
      BOOL v49 = (v46 & 1) == 0;
      uint64_t v50 = v48 + v49;
      if (__OFADD__(v48, v49)) {
        goto LABEL_174;
      }
      char v51 = v46;
      if (*((void *)v5 + 3) >= v50)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
          if (v46) {
            goto LABEL_45;
          }
        }
        else
        {
          sub_25C6F0284();
          uint64_t v5 = (char *)v245[0];
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
          if (v51) {
            goto LABEL_45;
          }
        }
      }
      else
      {
        sub_25C6EE0C0(v50, isUniquelyReferenced_nonNull_native);
        uint64_t v5 = (char *)v245[0];
        unint64_t v52 = sub_25C6ED094(v43, v45);
        if ((v51 & 1) != (v53 & 1))
        {
LABEL_168:
          return sub_25C7015C0();
        }
        unint64_t v47 = v52;
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
        if (v51)
        {
LABEL_45:
          uint64_t v55 = v233;
          *(void *)(*((void *)v5 + 7) + 8 * v47) = v233;
          goto LABEL_46;
        }
      }
      *(void *)&v5[8 * (v47 >> 6) + 64] |= 1 << v47;
      uint64_t v54 = (uint64_t *)(*((void *)v5 + 6) + 16 * v47);
      *uint64_t v54 = v43;
      v54[1] = v45;
      uint64_t v55 = v233;
      *(void *)(*((void *)v5 + 7) + 8 * v47) = v233;
      uint64_t v56 = *((void *)v5 + 2);
      BOOL v33 = __OFADD__(v56, 1);
      uint64_t v57 = v56 + 1;
      if (v33) {
        goto LABEL_178;
      }
      *((void *)v5 + 2) = v57;
      swift_bridgeObjectRetain();
LABEL_46:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      BOOL v33 = __OFADD__(v55, 1);
      uint64_t v9 = v55 + 1;
      unint64_t v13 = v230;
      if (v33) {
        goto LABEL_175;
      }
LABEL_17:
      ++v15;
      if (v16 == v236) {
        goto LABEL_5;
      }
    }
  }
LABEL_56:
  swift_bridgeObjectRelease();
  sub_25C701160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v209)
  {
    unint64_t v58 = 0;
    uint64_t v228 = *(void *)(isUniquelyReferenced_nonNull_native + 96)
         + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
    v237 = (void (**)(uint64_t, uint64_t))(*(void *)(isUniquelyReferenced_nonNull_native + 264) + 8);
    uint64_t v216 = *(void *)(isUniquelyReferenced_nonNull_native + 232);
    v219 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      if ((v207 & 0xC000000000000001) != 0)
      {
        uint64_t v59 = MEMORY[0x261191400](v58, v207);
        BOOL v33 = __OFADD__(v58, 1);
        unint64_t v60 = v58 + 1;
        if (v33) {
          goto LABEL_176;
        }
      }
      else
      {
        if (v58 >= *(void *)((v207 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_183;
        }
        uint64_t v59 = *(void *)(v207 + 32 + 8 * v58);
        swift_retain();
        BOOL v33 = __OFADD__(v58, 1);
        unint64_t v60 = v58 + 1;
        if (v33) {
          goto LABEL_176;
        }
      }
      unint64_t v61 = sub_25C701130();
      unint64_t v62 = v61;
      if (v61 >> 62)
      {
        uint64_t v63 = sub_25C701480();
        v212 = (char *)v59;
        unint64_t v214 = v60;
        if (v63)
        {
LABEL_66:
          if (v63 < 1) {
            goto LABEL_180;
          }
          uint64_t v64 = 0;
          unint64_t v240 = v62 & 0xC000000000000001;
          unint64_t v224 = MEMORY[0x263F8EE78];
          unint64_t v231 = v62;
          uint64_t v234 = v63;
          do
          {
            if (v240) {
              MEMORY[0x261191400](v64, v62);
            }
            else {
              swift_retain();
            }
            if (sub_25C701190())
            {
              uint64_t v71 = *(void *)(isUniquelyReferenced_nonNull_native + 280);
              uint64_t v70 = *(void *)(isUniquelyReferenced_nonNull_native + 288);
              uint64_t v72 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
              sub_25C7011B0();
              sub_25C700C70();
              sub_25C700C90();
              v73 = *v237;
              (*v237)(v71, v72);
              if (MEMORY[0x261190DA0](v70, v228))
              {
                uint64_t v74 = sub_25C701200();
                os_log_type_t v75 = sub_25C701380();
                if (os_log_type_enabled(v74, v75))
                {
                  uint64_t v76 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v76 = 0;
                  _os_log_impl(&dword_25C6E0000, v74, v75, "Skipping turns that happen today or in the future.", v76, 2u);
                  MEMORY[0x261191AB0](v76, -1, -1);

                  swift_release();
                }
                else
                {
                  swift_release();
                }
                uint64_t v63 = v234;
                v73(*(void *)(isUniquelyReferenced_nonNull_native + 288), *(void *)(isUniquelyReferenced_nonNull_native + 256));
                unint64_t v62 = v231;
              }
              else
              {
                v80 = *(uint64_t **)(isUniquelyReferenced_nonNull_native + 216);
                uint64_t v79 = *(void *)(isUniquelyReferenced_nonNull_native + 224);
                swift_bridgeObjectRetain();
                SiriCoreMetricsCalculator.processTurn(turn:turnIdToConvIdx:counts:)((uint64_t)v226, (uint64_t *)&v242, v80);
                swift_bridgeObjectRelease();
                if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v216 + 48))(v80, 1, v79) == 1)
                {
                  sub_25C6F107C(*(void *)(isUniquelyReferenced_nonNull_native + 216), &qword_26A5C7D10);
                  swift_retain_n();
                  v81 = sub_25C701200();
                  os_log_type_t v82 = sub_25C7013A0();
                  BOOL v83 = os_log_type_enabled(v81, v82);
                  uint64_t v84 = *(void *)(isUniquelyReferenced_nonNull_native + 288);
                  uint64_t v85 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
                  if (v83)
                  {
                    uint64_t v86 = swift_slowAlloc();
                    uint64_t v87 = swift_slowAlloc();
                    v245[0] = v87;
                    *(_DWORD *)uint64_t v86 = 136315138;
                    uint64_t v88 = sub_25C7011A0();
                    *(void *)(v86 + 4) = sub_25C6EC85C(v88, v89, v245);
                    swift_bridgeObjectRelease();
                    swift_release_n();
                    _os_log_impl(&dword_25C6E0000, v81, v82, "    Could not create processed turn struct from featurizd turn:\n    %s", (uint8_t *)v86, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x261191AB0](v87, -1, -1);
                    uint64_t v90 = v86;
                    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
                    MEMORY[0x261191AB0](v90, -1, -1);

                    swift_release();
                  }
                  else
                  {
                    swift_release_n();
                  }
                  v73(v84, v85);
                }
                else
                {
                  uint64_t v92 = *(void *)(isUniquelyReferenced_nonNull_native + 240);
                  uint64_t v91 = *(void *)(isUniquelyReferenced_nonNull_native + 248);
                  sub_25C6F0154(*(void *)(isUniquelyReferenced_nonNull_native + 216), v91, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  sub_25C6F01BC(v91, v92, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                    unint64_t v224 = sub_25C6EC53C(0, *(void *)(v224 + 16) + 1, 1, v224, &qword_26A5C7DC0, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  }
                  unint64_t v94 = *(void *)(v224 + 16);
                  unint64_t v93 = *(void *)(v224 + 24);
                  if (v94 >= v93 >> 1) {
                    unint64_t v224 = sub_25C6EC53C(v93 > 1, v94 + 1, 1, v224, &qword_26A5C7DC0, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  }
                  uint64_t v95 = *(void *)(isUniquelyReferenced_nonNull_native + 288);
                  uint64_t v97 = *(void *)(isUniquelyReferenced_nonNull_native + 248);
                  uint64_t v96 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
                  uint64_t v98 = *(void *)(isUniquelyReferenced_nonNull_native + 240);
                  *(void *)(v224 + 16) = v94 + 1;
                  sub_25C6F0154(v98, v224+ ((*(unsigned __int8 *)(v216 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v216 + 80))+ *(void *)(v216 + 72) * v94, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  swift_release();
                  sub_25C6F0224(v97, (uint64_t (*)(void))type metadata accessor for ProcessedSiriTurn);
                  v73(v95, v96);
                }
                unint64_t v62 = v231;
                uint64_t v63 = v234;
              }
            }
            else
            {
              swift_retain_n();
              v77 = sub_25C701200();
              os_log_type_t v78 = sub_25C7013A0();
              if (os_log_type_enabled(v77, v78))
              {
                uint64_t v65 = swift_slowAlloc();
                uint64_t v66 = swift_slowAlloc();
                v245[0] = v66;
                *(_DWORD *)uint64_t v65 = 136315138;
                uint64_t v67 = sub_25C7011A0();
                *(void *)(v65 + 4) = sub_25C6EC85C(v67, v68, v245);
                swift_bridgeObjectRelease();
                swift_release_n();
                _os_log_impl(&dword_25C6E0000, v77, v78, "Turn: %s has an invalid timestamp", (uint8_t *)v65, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x261191AB0](v66, -1, -1);
                uint64_t v69 = v65;
                uint64_t v63 = v234;
                MEMORY[0x261191AB0](v69, -1, -1);
                swift_release();
              }
              else
              {
                swift_release_n();
              }
            }
            ++v64;
          }
          while (v63 != v64);
          goto LABEL_95;
        }
      }
      else
      {
        uint64_t v63 = *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v212 = (char *)v59;
        unint64_t v214 = v60;
        if (v63) {
          goto LABEL_66;
        }
      }
      unint64_t v224 = MEMORY[0x263F8EE78];
LABEL_95:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v219 = sub_25C6EC41C(0, v219[2] + 1, 1, v219);
      }
      uint64_t v5 = v212;
      unint64_t v58 = v214;
      unint64_t v100 = v219[2];
      unint64_t v99 = v219[3];
      if (v100 >= v99 >> 1) {
        v219 = sub_25C6EC41C((void *)(v99 > 1), v100 + 1, 1, v219);
      }
      v219[2] = v100 + 1;
      v219[v100 + 4] = v224;
      swift_release();
      if (v214 == v209) {
        goto LABEL_102;
      }
    }
  }
  v219 = (void *)MEMORY[0x263F8EE78];
LABEL_102:
  v213 = (void *)(isUniquelyReferenced_nonNull_native + 16);
  v210 = (void *)(isUniquelyReferenced_nonNull_native + 48);
  uint64_t v217 = *(void *)(isUniquelyReferenced_nonNull_native + 184);
  uint64_t v225 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
  uint64_t v5 = *(char **)(isUniquelyReferenced_nonNull_native + 136);
  uint64_t v222 = *(void *)(isUniquelyReferenced_nonNull_native + 112);
  uint64_t v223 = *(void *)(isUniquelyReferenced_nonNull_native + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C700E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D18);
  uint64_t v101 = swift_allocObject();
  *(_OWORD *)(v101 + 16) = xmmword_25C702040;
  *(void *)(v101 + 32) = sub_25C700F50();
  uint64_t v206 = sub_25C700E00();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25C6E9770(MEMORY[0x263F8EE78]);
  v102 = 0;
  int64_t v232 = 0;
  uint64_t v103 = *(void *)(v242 + 64);
  unint64_t v207 = v242 + 64;
  uint64_t v104 = -1;
  v226 = (void *)v242;
  uint64_t v105 = -1 << *(unsigned char *)(v242 + 32);
  v244 = (void *)result;
  if (-v105 < 64) {
    uint64_t v104 = ~(-1 << -(char)v105);
  }
  unint64_t v106 = v104 & v103;
  v238 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v220 = v5;
  v107 = (char **)(v5 + 8);
  int64_t v215 = (unint64_t)(63 - v105) >> 6;
  v208 = (uint64_t *)(isUniquelyReferenced_nonNull_native + 152);
  v108 = (uint64_t *)&unk_26A5C7D20;
  v229 = (uint64_t *)(isUniquelyReferenced_nonNull_native + 144);
  while (1)
  {
    if (v106)
    {
      unint64_t v111 = __clz(__rbit64(v106));
      uint64_t v112 = (v106 - 1) & v106;
      unint64_t v113 = v111 | (v232 << 6);
LABEL_111:
      uint64_t v114 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
      sub_25C6F01BC(v226[6] + *(void *)(v217 + 72) * v113, v114, type metadata accessor for SiriCoreMetricsAggregationKeys);
      uint64_t v115 = v226[7];
      uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(v108);
      *(void *)(v114 + *(int *)(v116 + 48)) = *(void *)(v115 + 8 * v113);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56))(v114, 0, 1, v116);
      goto LABEL_130;
    }
    int64_t v117 = v232 + 1;
    if (__OFADD__(v232, 1)) {
      goto LABEL_184;
    }
    if (v117 < v215)
    {
      unint64_t v118 = *(void *)(v207 + 8 * v117);
      if (v118) {
        goto LABEL_115;
      }
      int64_t v119 = v232 + 2;
      ++v232;
      if (v117 + 1 < v215)
      {
        unint64_t v118 = *(void *)(v207 + 8 * v119);
        if (v118) {
          goto LABEL_118;
        }
        int64_t v232 = v117 + 1;
        if (v117 + 2 < v215)
        {
          unint64_t v118 = *(void *)(v207 + 8 * (v117 + 2));
          if (v118)
          {
            v117 += 2;
            goto LABEL_115;
          }
          int64_t v119 = v117 + 3;
          int64_t v232 = v117 + 2;
          if (v117 + 3 < v215) {
            break;
          }
        }
      }
    }
LABEL_129:
    uint64_t v120 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
    uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(v108);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v120, 1, 1, v121);
    uint64_t v112 = 0;
LABEL_130:
    uint64_t v122 = *(void *)(isUniquelyReferenced_nonNull_native + 208);
    sub_25C6F10D8(*(void *)(isUniquelyReferenced_nonNull_native + 200), v122, &qword_26A5C7D08);
    uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(v108);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v123 - 8) + 48))(v122, 1, v123) == 1)
    {
      uint64_t v195 = *(void *)(isUniquelyReferenced_nonNull_native + 264);
      uint64_t v196 = *(void *)(isUniquelyReferenced_nonNull_native + 272);
      uint64_t v197 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
      uint64_t v198 = isUniquelyReferenced_nonNull_native;
      uint64_t v199 = *(void *)(isUniquelyReferenced_nonNull_native + 88);
      v200 = *(void **)(v198 + 80);
      swift_release();
      unint64_t v201 = *(void *)(v199 + *(int *)(type metadata accessor for SiriCoreMetricsDataRecord(0) + 20));
      uint64_t v202 = (uint64_t)v244;
      swift_bridgeObjectRetain();
      uint64_t v203 = SiriCoreMetricsCalculator.calculateTwoByThree(previousRequestCounts:totalCounts:)(v201, v202);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();

      (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v196, v197);
      swift_bridgeObjectRelease();
      sub_25C6EC52C((uint64_t)v102);
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
      void *v200 = v219;
      v200[1] = v211;
      v200[2] = MEMORY[0x263F8EE78];
      v200[3] = v206;
      v200[4] = v202;
      v200[5] = v203;
      v204 = *(uint64_t (**)(void))(v198 + 8);
      return v204();
    }
    unint64_t v235 = v112;
    v124 = v108;
    v125 = v107;
    uint64_t v126 = *(void *)(isUniquelyReferenced_nonNull_native + 208);
    uint64_t v127 = *(void *)(isUniquelyReferenced_nonNull_native + 192);
    uint64_t v128 = *(void *)(isUniquelyReferenced_nonNull_native + 168);
    uint64_t v129 = isUniquelyReferenced_nonNull_native;
    uint64_t v130 = *(void *)(isUniquelyReferenced_nonNull_native + 128);
    uint64_t v131 = *(void *)(v129 + 120);
    uint64_t v241 = *(void *)(v126 + *(int *)(v123 + 48));
    sub_25C6F0154(v126, v127, type metadata accessor for SiriCoreMetricsAggregationKeys);
    v132 = *v238;
    (*v238)(v128, v127, v130);
    v132(v131, v127, v130);
    v133 = (uint64_t *)(v127 + *(int *)(v225 + 20));
    uint64_t v135 = *v133;
    uint64_t v134 = v133[1];
    uint64_t v136 = v133[2];
    uint64_t v137 = v133[3];
    uint64_t v138 = v133[4];
    uint64_t v139 = v133[5];
    uint64_t v140 = v133[6];
    uint64_t v141 = v133[7];
    uint64_t v142 = v133[8];
    uint64_t v143 = v133[9];
    v144 = (void *)(v131 + *(int *)(v223 + 20));
    void *v144 = v135;
    v144[1] = v134;
    v144[2] = v136;
    v144[3] = v137;
    v144[4] = v138;
    v144[5] = v139;
    v144[6] = v140;
    v144[7] = v141;
    v144[8] = v142;
    v144[9] = v143;
    *(void *)(v131 + *(int *)(v223 + 24)) = v241;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C6EC52C((uint64_t)v102);
    uint64_t v5 = (char *)v211;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v245[0] = v211;
    unint64_t v146 = sub_25C6ED10C(v128);
    uint64_t v147 = *(void *)(v211 + 16);
    BOOL v148 = (v145 & 1) == 0;
    uint64_t v149 = v147 + v148;
    if (__OFADD__(v147, v148)) {
      goto LABEL_179;
    }
    char v150 = v145;
    if (*(void *)(v211 + 24) >= v149)
    {
      v107 = v125;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25C6EFEBC();
        uint64_t v5 = (char *)v245[0];
      }
    }
    else
    {
      uint64_t v151 = v221[21];
      sub_25C6EDC9C(v149, isUniquelyReferenced_nonNull_native);
      uint64_t v5 = (char *)v245[0];
      unint64_t v152 = sub_25C6ED10C(v151);
      if ((v150 & 1) != (v153 & 1)) {
        goto LABEL_168;
      }
      unint64_t v146 = v152;
      v107 = v125;
    }
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
    swift_bridgeObjectRelease();
    if (v150)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v154 = v221[21];
      uint64_t v155 = v221[16];
      *(void *)&v5[8 * (v146 >> 6) + 64] |= 1 << v146;
      v156 = v5;
      unint64_t v157 = *((void *)v5 + 6) + *((void *)v220 + 9) * v146;
      swift_bridgeObjectRetain();
      unint64_t v158 = v157;
      uint64_t v5 = v156;
      v132(v158, v154, v155);
      *(void *)(*((void *)v156 + 7) + 8 * v146) = MEMORY[0x263F8EE78];
      uint64_t v159 = *((void *)v156 + 2);
      BOOL v33 = __OFADD__(v159, 1);
      uint64_t v160 = v159 + 1;
      if (v33) {
        goto LABEL_182;
      }
      *((void *)v156 + 2) = v160;
    }
    uint64_t v161 = *((void *)v5 + 7);
    unint64_t v211 = (unint64_t)v5;
    swift_bridgeObjectRelease();
    unint64_t v162 = *(void *)(v161 + 8 * v146);
    char v163 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v161 + 8 * v146) = v162;
    if ((v163 & 1) == 0)
    {
      unint64_t v162 = sub_25C6EC53C(0, *(void *)(v162 + 16) + 1, 1, v162, &qword_26A5C7DE0, type metadata accessor for SiriCountsAll, type metadata accessor for SiriCountsAll);
      *(void *)(v161 + 8 * v146) = v162;
    }
    unint64_t v165 = *(void *)(v162 + 16);
    unint64_t v164 = *(void *)(v162 + 24);
    if (v165 >= v164 >> 1)
    {
      unint64_t v162 = sub_25C6EC53C(v164 > 1, v165 + 1, 1, v162, &qword_26A5C7DE0, type metadata accessor for SiriCountsAll, type metadata accessor for SiriCountsAll);
      *(void *)(v161 + 8 * v146) = v162;
    }
    uint64_t v166 = v221[21];
    uint64_t v167 = v221[15];
    uint64_t v168 = v221[16];
    *(void *)(v162 + 16) = v165 + 1;
    sub_25C6F0154(v167, v162+ ((*(unsigned __int8 *)(v222 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v222 + 80))+ *(void *)(v222 + 72) * v165, type metadata accessor for SiriCountsAll);
    uint64_t v5 = *v107;
    ((void (*)(uint64_t, uint64_t))*v107)(v166, v168);
    v169 = v244;
    if (!v244[2] || (sub_25C6ED10C(v221[24]), (v170 & 1) == 0))
    {
      uint64_t v181 = v221[18];
      v132(v181, v221[24], v221[16]);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v245[0] = (uint64_t)v169;
      unint64_t v183 = sub_25C6ED10C(v181);
      uint64_t v184 = v169[2];
      BOOL v185 = (v182 & 1) == 0;
      uint64_t v186 = v184 + v185;
      if (__OFADD__(v184, v185)) {
        goto LABEL_181;
      }
      char v187 = v182;
      if (v169[3] >= v186)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
          if ((v182 & 1) == 0) {
            goto LABEL_159;
          }
        }
        else
        {
          sub_25C6EFC1C();
          v169 = (void *)v245[0];
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
          if ((v187 & 1) == 0) {
            goto LABEL_159;
          }
        }
      }
      else
      {
        uint64_t v188 = *v229;
        sub_25C6ED874(v186, isUniquelyReferenced_nonNull_native);
        v169 = (void *)v245[0];
        unint64_t v189 = sub_25C6ED10C(v188);
        if ((v187 & 1) != (v190 & 1)) {
          goto LABEL_168;
        }
        unint64_t v183 = v189;
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v221;
        if ((v187 & 1) == 0)
        {
LABEL_159:
          uint64_t v191 = *(void *)(isUniquelyReferenced_nonNull_native + 144);
          uint64_t v192 = *(void *)(isUniquelyReferenced_nonNull_native + 128);
          v169[(v183 >> 6) + 8] |= 1 << v183;
          v132(v169[6] + *((void *)v220 + 9) * v183, v191, v192);
          *(void *)(v169[7] + 8 * v183) = v241;
          uint64_t v193 = v169[2];
          BOOL v33 = __OFADD__(v193, 1);
          uint64_t v194 = v193 + 1;
          if (v33) {
            goto LABEL_186;
          }
          v169[2] = v194;
LABEL_106:
          v244 = v169;
          swift_bridgeObjectRelease();
          v109 = v229;
LABEL_107:
          v108 = v124;
          goto LABEL_108;
        }
      }
      *(void *)(v169[7] + 8 * v183) = v241;
      goto LABEL_106;
    }
    v132(v221[20], v221[24], v221[16]);
    v172 = sub_25C6E9CF4(v213);
    if ((*(unsigned char *)(v171 + 8) & 1) == 0)
    {
      int v173 = *(_DWORD *)(v171 + 4);
      BOOL v174 = __CFADD__(v173, HIDWORD(v241));
      int v175 = v173 + HIDWORD(v241);
      if (v174) {
        goto LABEL_187;
      }
      *(_DWORD *)(v171 + 4) = v175;
    }
    ((void (*)(void *, void))v172)(v213, 0);
    uint64_t v176 = v221[24];
    uint64_t v177 = v221[19];
    uint64_t v178 = v221[16];
    ((void (*)(void, uint64_t))v5)(v221[20], v178);
    v132(v177, v176, v178);
    v180 = sub_25C6E9CF4(v210);
    if (*(unsigned char *)(v179 + 8))
    {
      ((void (*)(void *, void))v180)(v210, 0);
      v109 = v208;
      goto LABEL_107;
    }
    if (__CFADD__(*(_DWORD *)v179, v241)) {
      goto LABEL_188;
    }
    v108 = v124;
    *(_DWORD *)v179 += v241;
    ((void (*)(void *, void))v180)(v210, 0);
    v109 = v208;
LABEL_108:
    uint64_t v110 = *(void *)(isUniquelyReferenced_nonNull_native + 192);
    ((void (*)(uint64_t, void))v5)(*v109, *(void *)(isUniquelyReferenced_nonNull_native + 128));
    uint64_t result = sub_25C6F0224(v110, type metadata accessor for SiriCoreMetricsAggregationKeys);
    v102 = sub_25C6E9BC0;
    unint64_t v106 = v235;
  }
  unint64_t v118 = *(void *)(v207 + 8 * v119);
  if (v118)
  {
LABEL_118:
    int64_t v117 = v119;
LABEL_115:
    uint64_t v112 = (v118 - 1) & v118;
    unint64_t v113 = __clz(__rbit64(v118)) + (v117 << 6);
    int64_t v232 = v117;
    goto LABEL_111;
  }
  while (1)
  {
    int64_t v117 = v119 + 1;
    if (__OFADD__(v119, 1)) {
      break;
    }
    if (v117 >= v215)
    {
      int64_t v232 = v215 - 1;
      goto LABEL_129;
    }
    unint64_t v118 = *(void *)(v207 + 8 * v117);
    ++v119;
    if (v118) {
      goto LABEL_115;
    }
  }
LABEL_191:
  __break(1u);
  return result;
}

unint64_t sub_25C6E9084(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DA8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D80);
  uint64_t v6 = sub_25C7014B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25C6F1584(v12, (uint64_t)v5, &qword_26A5C7DA8);
    unint64_t result = sub_25C6ED10C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25C700EC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(unsigned char *)(v7[7] + v16) = v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_25C6E9278(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB8);
  uint64_t v2 = (void *)sub_25C7014B0();
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
    unint64_t result = sub_25C6ED094(v5, v6);
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

unint64_t sub_25C6E938C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E08);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB0);
  uint64_t v6 = sub_25C7014B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25C6F1584(v12, (uint64_t)v5, &qword_26A5C7E08);
    unint64_t result = sub_25C6ECEB4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
    unint64_t result = sub_25C6F0154((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, type metadata accessor for SiriCoreMetricsAggregationKeys);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_25C6E957C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E00);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD0);
  uint64_t v6 = sub_25C7014B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25C6F1584(v12, (uint64_t)v5, &qword_26A5C7E00);
    unint64_t result = sub_25C6ED10C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25C700EC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_25C6E9770(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DF0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD8);
  uint64_t v6 = sub_25C7014B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25C6F1584(v12, (uint64_t)v5, &qword_26A5C7DF0);
    unint64_t result = sub_25C6ED10C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25C700EC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_25C6E9964(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D70);
  uint64_t v2 = sub_25C7014B0();
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
    sub_25C6F1584(v6, (uint64_t)&v15, &qword_26A5C7D78);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25C6ED094(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25C6F104C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25C6E9A9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D68);
  uint64_t v2 = (void *)sub_25C7014B0();
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
    unint64_t result = sub_25C6ED094(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
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

void sub_25C6E9BC0(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

void (*sub_25C6E9BD0(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[4] = v6;
  sub_25C6F01BC(a2, (uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v4[5] = sub_25C6EE5F0(v4, (uint64_t)v6);
  return sub_25C6E9C84;
}

void sub_25C6E9C84(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 32);
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  sub_25C6F0224((uint64_t)v2, type metadata accessor for SiriCoreMetricsAggregationKeys);
  free(v2);
  free(v1);
}

void (*sub_25C6E9CF4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  uint64_t v3 = sub_25C700EC0();
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  v2[5] = v4;
  uint64_t v6 = malloc(*(void *)(v4 + 64));
  v2[6] = v6;
  (*(void (**)(void))(v5 + 16))();
  v2[7] = sub_25C6EE760(v2, (uint64_t)v6);
  return sub_25C6E9DE4;
}

void sub_25C6E9DE4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 48);
  uint64_t v3 = *(void *)(*a1 + 32);
  uint64_t v4 = *(void *)(*a1 + 40);
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);
  free(v1);
}

void (*SiriCoreMetricsCalculator.processTurn(turn:turnIdToConvIdx:counts:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t *a3@<X8>))(void *a1)
{
  v169 = a3;
  uint64_t v166 = a1;
  uint64_t v167 = a2;
  uint64_t v158 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v3 = MEMORY[0x270FA5388](v158);
  uint64_t v155 = (uint64_t)&v137 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v154 = (uint64_t)&v137 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v153 = (uint64_t)&v137 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v159 = (char *)&v137 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v137 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v137 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v161 = (char *)&v137 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D28);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v168 = (char *)&v137 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25C700D70();
  uint64_t v164 = *(void *)(v20 - 8);
  uint64_t v165 = v20;
  MEMORY[0x270FA5388](v20);
  char v22 = (char *)&v137 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25C700D90();
  uint64_t v162 = *(void *)(v23 - 8);
  uint64_t v163 = v23;
  MEMORY[0x270FA5388](v23);
  BOOL v25 = (char *)&v137 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25C700CD0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  char v30 = (char *)&v137 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v137 - v31;
  if ((sub_25C701190() & 1) == 0)
  {
    uint64_t v59 = v169;
    swift_retain_n();
    unint64_t v60 = sub_25C701200();
    os_log_type_t v61 = sub_25C7013A0();
    if (os_log_type_enabled(v60, v61))
    {
      unint64_t v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t v171 = v63;
      *(_DWORD *)unint64_t v62 = 136315138;
      uint64_t v64 = sub_25C7011A0();
      uint64_t v173 = sub_25C6EC85C(v64, v65, &v171);
      sub_25C7013C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C6E0000, v60, v61, "Turn %s has an invalid timestamp", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261191AB0](v63, -1, -1);
      MEMORY[0x261191AB0](v62, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v66 = type metadata accessor for ProcessedSiriTurn();
    uint64_t v67 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56);
    unint64_t v68 = v59;
    goto LABEL_27;
  }
  char v150 = v16;
  uint64_t v149 = v13;
  sub_25C7011B0();
  sub_25C700C70();
  v156 = v32;
  uint64_t v146 = v170 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  sub_25C700C90();
  BOOL v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  v144 = v30;
  uint64_t v152 = v26;
  uint64_t v160 = v27 + 8;
  unint64_t v157 = v33;
  v33(v30, v26);
  sub_25C701040();
  sub_25C701020();
  sub_25C701180();
  swift_bridgeObjectRelease();
  uint64_t v145 = v171;
  sub_25C701080();
  sub_25C701050();
  sub_25C701180();
  swift_bridgeObjectRelease();
  uint64_t v140 = v171;
  int v34 = v172;
  sub_25C701060();
  sub_25C701180();
  swift_bridgeObjectRelease();
  uint64_t v142 = v171;
  int v141 = v172;
  sub_25C701070();
  sub_25C701180();
  swift_bridgeObjectRelease();
  uint64_t v138 = v171;
  uint64_t v151 = v172;
  id v35 = objc_msgSend(self, sel_autoupdatingCurrentLocale);
  sub_25C700D50();

  sub_25C700D80();
  (*(void (**)(char *, uint64_t))(v162 + 8))(v25, v163);
  os_log_type_t v36 = v168;
  sub_25C700D60();
  (*(void (**)(char *, uint64_t))(v164 + 8))(v22, v165);
  uint64_t v37 = sub_25C700D40();
  uint64_t v38 = *(void *)(v37 - 8);
  unint64_t result = (void (*)(void *))(*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37);
  if (result != 1)
  {
    int v139 = v34;
    uint64_t v40 = sub_25C700D30();
    uint64_t v42 = v41;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v37);
    uint64_t v43 = @"ODMSIRIUIVIEWMODE_UNKNOWN";
    uint64_t v44 = @"ODMSIRIUIVIEWMODE_UNKNOWN";
    uint64_t v148 = sub_25C701290();
    uint64_t v165 = v45;

    char v46 = @"AUDIOINPUTROUTE_UNKNOWN";
    unint64_t v47 = @"AUDIOINPUTROUTE_UNKNOWN";
    uint64_t v162 = sub_25C701290();
    uint64_t v49 = v48;

    uint64_t v50 = @"UNKNOWN";
    char v51 = @"UNKNOWN";
    uint64_t v52 = sub_25C701290();
    uint64_t v168 = v53;

    uint64_t v54 = @"PRODUCT_UNKNOWN";
    uint64_t v55 = @"PRODUCT_UNKNOWN";
    uint64_t v163 = sub_25C701290();
    uint64_t v57 = v56;

    sub_25C7010D0();
    sub_25C7010C0();
    sub_25C701180();
    swift_bridgeObjectRelease();
    uint64_t v58 = v172;
    if (v172)
    {
      uint64_t v147 = v171;
      swift_bridgeObjectRelease();
      uint64_t v164 = v58;
    }
    else
    {
      uint64_t v164 = v42;
      uint64_t v147 = v40;
    }
    sub_25C7010B0();
    type metadata accessor for SISchemaDataSharingOptInState();
    sub_25C701180();
    swift_bridgeObjectRelease();
    if (BYTE4(v171) != 1)
    {
      unsigned int v69 = v171;
      swift_bridgeObjectRelease();
      if (v69 > 3)
      {
        uint64_t v71 = @"UNKNOWN";
        uint64_t v72 = @"UNKNOWN";
      }
      else
      {
        uint64_t v70 = (int)v69;
        uint64_t v71 = off_2654B6BE8[v70];
        uint64_t v72 = off_2654B6C08[v70];
      }
      v73 = v71;
      uint64_t v74 = v72;
      uint64_t v52 = sub_25C701290();
      uint64_t v168 = v75;
    }
    sub_25C701030();
    sub_25C701180();
    swift_bridgeObjectRelease();
    char v76 = v171;
    if (v171 != 2)
    {
      swift_bridgeObjectRelease();
      if (v76) {
        v77 = @"PRODUCT_DICTATION";
      }
      else {
        v77 = @"PRODUCT_ASSISTANT";
      }
      os_log_type_t v78 = v77;
      uint64_t v79 = v77;
      uint64_t v163 = sub_25C701290();
      uint64_t v57 = v80;
    }
    sub_25C7010A0();
    sub_25C701090();
    sub_25C701180();
    swift_bridgeObjectRelease();
    uint64_t v81 = v172;
    if (v172)
    {
      uint64_t v162 = v171;
      swift_bridgeObjectRelease();
      uint64_t v170 = v81;
    }
    else
    {
      uint64_t v170 = v49;
    }
    sub_25C7011A0();
    uint64_t v82 = (uint64_t)v161;
    sub_25C700CE0();
    swift_bridgeObjectRelease();
    uint64_t v83 = sub_25C700D20();
    uint64_t v84 = *(void *)(v83 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v82, 1, v83) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25C6F107C(v82, &qword_26A5C7BD8);
      uint64_t v85 = sub_25C701200();
      os_log_type_t v86 = sub_25C7013A0();
      if (os_log_type_enabled(v85, v86))
      {
        uint64_t v87 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v87 = 0;
        _os_log_impl(&dword_25C6E0000, v85, v86, "Turn Id is not available", v87, 2u);
        MEMORY[0x261191AB0](v87, -1, -1);
      }

      v157(v156, v152);
      uint64_t v66 = type metadata accessor for ProcessedSiriTurn();
      uint64_t v67 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56);
      unint64_t v68 = v169;
LABEL_27:
      uint64_t v88 = 1;
      return (void (*)(void *))v67(v68, v88, 1, v66);
    }
    v145 &= 1u;
    sub_25C6F107C(v82, &qword_26A5C7BD8);
    sub_25C7011A0();
    sub_25C700CE0();
    swift_bridgeObjectRelease();
    unint64_t v89 = v156;
    uint64_t v161 = v57;
    uint64_t v90 = v151;
    uint64_t v143 = v52;
    if (v151)
    {
      uint64_t v91 = v166;
      if (*(void *)(v166 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v92 = sub_25C6ED094(v138, v90);
        if (v93) {
          uint64_t v94 = *(void *)(*(void *)(v91 + 56) + 8 * v92);
        }
        else {
          uint64_t v94 = 0;
        }
        char v95 = v93 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v94 = 0;
        char v95 = 1;
      }
      uint64_t v96 = sub_25C7011A0();
      if (*(void *)(v166 + 16) && (unint64_t v98 = sub_25C6ED094(v96, v97), (v99 & 1) != 0))
      {
        uint64_t v100 = *(void *)(*(void *)(v166 + 56) + 8 * v98);
        swift_bridgeObjectRelease();
        if (!(v95 & 1 | (v94 != v100)))
        {
LABEL_38:
          sub_25C700CE0();
          swift_bridgeObjectRelease();
          unint64_t v89 = v156;
LABEL_42:
          uint64_t v101 = v144;
          uint64_t v102 = v164;
          swift_bridgeObjectRetain();
          uint64_t v103 = v165;
          swift_bridgeObjectRetain();
          uint64_t v104 = v170;
          swift_bridgeObjectRetain();
          uint64_t v105 = v161;
          swift_bridgeObjectRetain();
          unint64_t v106 = v168;
          swift_bridgeObjectRetain();
          sub_25C700C90();
          sub_25C700C80();
          uint64_t v107 = v152;
          v157(v101, v152);
          uint64_t v108 = (uint64_t)v159;
          sub_25C700E90();
          v109 = (uint64_t *)(v108 + *(int *)(v158 + 20));
          uint64_t *v109 = v147;
          v109[1] = v102;
          v109[2] = v148;
          v109[3] = v103;
          uint64_t v111 = v162;
          uint64_t v110 = v163;
          v109[4] = v162;
          v109[5] = v104;
          v109[6] = v110;
          v109[7] = (uint64_t)v105;
          v109[8] = v143;
          v109[9] = (uint64_t)v106;
          uint64_t v112 = *v167;
          if (!*(void *)(*v167 + 16) || (unint64_t v113 = sub_25C6ECEB4(v108), (v114 & 1) == 0))
          {
            uint64_t v122 = v155;
            sub_25C6F01BC(v108, v155, type metadata accessor for SiriCoreMetricsAggregationKeys);
            uint64_t v123 = v167;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v171 = *v123;
            *uint64_t v123 = 0x8000000000000000;
            char v118 = v145;
            sub_25C6F0B64((v145 << 32) | 1, v122, isUniquelyReferenced_nonNull_native);
            *uint64_t v123 = v171;
            swift_bridgeObjectRelease();
            uint64_t v125 = v122;
            uint64_t v117 = v143;
LABEL_56:
            sub_25C6F0224(v125, type metadata accessor for SiriCoreMetricsAggregationKeys);
            sub_25C6F0224(v108, type metadata accessor for SiriCoreMetricsAggregationKeys);
            v157(v89, v107);
            uint64_t v128 = v169;
            uint64_t v129 = v164;
            uint64_t *v169 = v147;
            v128[1] = v129;
            uint64_t v130 = v165;
            v128[2] = v148;
            v128[3] = v130;
            uint64_t v131 = v170;
            v128[4] = v111;
            v128[5] = v131;
            v132 = v161;
            v128[6] = v163;
            v128[7] = (uint64_t)v132;
            v133 = v168;
            v128[8] = v117;
            v128[9] = (uint64_t)v133;
            uint64_t v134 = (int *)type metadata accessor for ProcessedSiriTurn();
            sub_25C6F10D8((uint64_t)v150, (uint64_t)v128 + v134[5], &qword_26A5C7BD8);
            sub_25C6F10D8((uint64_t)v149, (uint64_t)v128 + v134[6], &qword_26A5C7BD8);
            *((unsigned char *)v128 + v134[7]) = v118;
            uint64_t v135 = (char *)v128 + v134[8];
            *(void *)uint64_t v135 = v140;
            v135[8] = v139;
            uint64_t v136 = (char *)v128 + v134[9];
            *(void *)uint64_t v136 = v142;
            v136[8] = v141;
            uint64_t v67 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*((void *)v134 - 1) + 56);
            unint64_t v68 = v128;
            uint64_t v88 = 0;
            uint64_t v66 = (uint64_t)v134;
            return (void (*)(void *))v67(v68, v88, 1, v66);
          }
          uint64_t v115 = (int *)(*(void *)(v112 + 56) + 8 * v113);
          int v116 = *v115;
          uint64_t v117 = v143;
          char v118 = v145;
          if (v145)
          {
            int v119 = v115[1];
            uint64_t v120 = v153;
            sub_25C6F01BC(v108, v153, type metadata accessor for SiriCoreMetricsAggregationKeys);
            unint64_t result = sub_25C6E9BD0(&v171, v120);
            if (*(unsigned char *)(v121 + 8))
            {
              ((void (*)(uint64_t *, void))result)(&v171, 0);
            }
            else
            {
              if (v119 == -1)
              {
LABEL_59:
                __break(1u);
                goto LABEL_60;
              }
              *(_DWORD *)(v121 + 4) = v119 + 1;
              ((void (*)(uint64_t *, void))result)(&v171, 0);
            }
            uint64_t v107 = v152;
            sub_25C6F0224(v153, type metadata accessor for SiriCoreMetricsAggregationKeys);
          }
          uint64_t v126 = v154;
          sub_25C6F01BC(v108, v154, type metadata accessor for SiriCoreMetricsAggregationKeys);
          unint64_t result = sub_25C6E9BD0(&v171, v126);
          if (*(unsigned char *)(v127 + 8))
          {
            ((void (*)(uint64_t *, void))result)(&v171, 0);
LABEL_55:
            unint64_t v89 = v156;
            uint64_t v125 = v154;
            goto LABEL_56;
          }
          if (v116 != -1)
          {
            *(_DWORD *)uint64_t v127 = v116 + 1;
            ((void (*)(uint64_t *, void))result)(&v171, 0);
            goto LABEL_55;
          }
          __break(1u);
          goto LABEL_59;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (v95) {
          goto LABEL_38;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v89 = v156;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v149, 1, 1, v83);
    goto LABEL_42;
  }
LABEL_60:
  __break(1u);
  return result;
}

uint64_t SiriCoreMetricsCalculator.calculateTwoByThree(previousRequestCounts:totalCounts:)(unint64_t a1, uint64_t a2)
{
  unint64_t v47 = a1;
  uint64_t v3 = sub_25C700EC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  char v46 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D30);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v48 = (char *)&v40 - v13;
  unint64_t v14 = sub_25C6E9084(MEMORY[0x263F8EE78]);
  uint64_t v15 = *(void *)(a2 + 64);
  uint64_t v42 = a2 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v50 = (void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v51 = a2;
  uint64_t v44 = v4;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  uint64_t v19 = (uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  int64_t v43 = (unint64_t)(v16 + 63) >> 6;
  int64_t v41 = v43 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v49 = 0;
  uint64_t v21 = &qword_26A5C7D38;
  if (!v18) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v29 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  uint64_t v30 = (uint64_t)v48;
  unint64_t v31 = v29 | (v49 << 6);
  while (2)
  {
    uint64_t v32 = v51;
    (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v12, *(void *)(v51 + 48) + *(void *)(v44 + 72) * v31, v3);
    uint64_t v33 = *(void *)(v32 + 56);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(v21);
    *(void *)&v12[*(int *)(v34 + 48)] = *(void *)(v33 + 8 * v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v12, 0, 1, v34);
    while (1)
    {
      sub_25C6F10D8((uint64_t)v12, v30, &qword_26A5C7D30);
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(v21);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48))(v30, 1, v39) == 1)
      {
        swift_release();
        return v14;
      }
      (*v45)(v8, v30, v3);
      char v22 = v21;
      uint64_t v23 = (uint64_t)v46;
      (*v50)(v46, v8, v3);
      sub_25C700E80();
      sub_25C6EB488(v47, v51);
      char v25 = v24;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v52 = v14;
      sub_25C6F0CE0(v25, v23, isUniquelyReferenced_nonNull_native);
      unint64_t v14 = v52;
      swift_bridgeObjectRelease();
      uint64_t v27 = *v19;
      uint64_t v28 = v23;
      uint64_t v21 = v22;
      (*v19)(v28, v3);
      uint64_t result = v27((uint64_t)v8, v3);
      if (v18) {
        goto LABEL_6;
      }
LABEL_8:
      uint64_t v30 = (uint64_t)v48;
      int64_t v35 = v49 + 1;
      if (__OFADD__(v49, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v35 < v43)
      {
        unint64_t v36 = *(void *)(v42 + 8 * v35);
        if (v36) {
          goto LABEL_11;
        }
        int64_t v37 = v49 + 2;
        ++v49;
        if (v35 + 1 < v43)
        {
          unint64_t v36 = *(void *)(v42 + 8 * v37);
          if (v36) {
            goto LABEL_14;
          }
          int64_t v49 = v35 + 1;
          if (v35 + 2 < v43)
          {
            unint64_t v36 = *(void *)(v42 + 8 * (v35 + 2));
            if (v36)
            {
              v35 += 2;
              goto LABEL_11;
            }
            int64_t v37 = v35 + 3;
            int64_t v49 = v35 + 2;
            if (v35 + 3 < v43) {
              break;
            }
          }
        }
      }
LABEL_25:
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(v21);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v12, 1, 1, v38);
      unint64_t v18 = 0;
    }
    unint64_t v36 = *(void *)(v42 + 8 * v37);
    if (v36)
    {
LABEL_14:
      int64_t v35 = v37;
LABEL_11:
      unint64_t v18 = (v36 - 1) & v36;
      unint64_t v31 = __clz(__rbit64(v36)) + (v35 << 6);
      int64_t v49 = v35;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v35 = v37 + 1;
    if (__OFADD__(v37, 1)) {
      break;
    }
    if (v35 >= v43)
    {
      int64_t v49 = v41;
      goto LABEL_25;
    }
    unint64_t v36 = *(void *)(v42 + 8 * v35);
    ++v37;
    if (v36) {
      goto LABEL_11;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_25C6EB488(unint64_t a1, uint64_t a2)
{
  unint64_t v105 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D90);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v107 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v100 - v6;
  uint64_t v117 = sub_25C700CD0();
  uint64_t v8 = *(void *)(v117 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v117);
  unint64_t v106 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v112 = (char *)&v100 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v115 = (char *)&v100 - v13;
  uint64_t v14 = sub_25C700EC0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D30);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v100 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (void (**)(char *, char *, uint64_t))((char *)&v100 - v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D98);
  uint64_t v24 = sub_25C701340();
  *(_DWORD *)(v24 + 32) = 33686018;
  uint64_t v109 = v24 + 32;
  uint64_t v110 = v24;
  *(void *)(v24 + 16) = 7;
  *(_DWORD *)(v24 + 35) = 33686018;
  uint64_t v25 = *(void *)(a2 + 64);
  uint64_t v108 = a2 + 64;
  uint64_t v26 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v27 = -1;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  unint64_t v28 = v27 & v25;
  char v114 = (char *)v125 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  unint64_t v122 = (unint64_t)v23 + 4;
  uint64_t v123 = v23;
  unint64_t v29 = (unint64_t)(v26 + 63) >> 6;
  uint64_t v118 = v15 + 16;
  uint64_t v119 = v15;
  uint64_t v121 = (void (**)(char *, uint64_t, uint64_t))(v15 + 32);
  uint64_t v30 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v104 = v8;
  int v116 = (void (**)(char *, uint64_t))(v8 + 8);
  unint64_t v101 = v29 - 1;
  swift_bridgeObjectRetain();
  unint64_t v31 = 0;
  int64_t v111 = v29;
  unint64_t v103 = v29 - 5;
  uint64_t v120 = a2;
  uint64_t v102 = a2 + 104;
  unint64_t v113 = v7;
  while (1)
  {
    if (v28)
    {
      unint64_t v32 = __clz(__rbit64(v28));
      uint64_t v33 = (v28 - 1) & v28;
      uint64_t v125 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v31;
      unint64_t v34 = v32 | ((void)v31 << 6);
      uint64_t v35 = (uint64_t)v123;
LABEL_8:
      uint64_t v36 = v120;
      (*(void (**)(char *, unint64_t, uint64_t))(v119 + 16))(v21, *(void *)(v120 + 48) + *(void *)(v119 + 72) * v34, v14);
      uint64_t v37 = *(void *)(v36 + 56);
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D38);
      *(void *)&v21[*(int *)(v38 + 48)] = *(void *)(v37 + 8 * v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v21, 0, 1, v38);
      goto LABEL_15;
    }
    uint64_t v39 = v31 + 1;
    uint64_t v35 = (uint64_t)v123;
    if (__OFADD__(v31, 1))
    {
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    if ((uint64_t)v39 >= v111)
    {
      int64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v31;
    }
    else
    {
      unint64_t v40 = *(void *)(v108 + 8 * (void)v39);
      if (v40) {
        goto LABEL_12;
      }
      int64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 1);
      if ((uint64_t)(v31 + 2) < v111)
      {
        unint64_t v40 = *(void *)(v108 + 8 * (void)(v31 + 2));
        if (v40)
        {
          uint64_t v39 = v31 + 2;
LABEL_12:
          uint64_t v33 = (v40 - 1) & v40;
          unint64_t v34 = __clz(__rbit64(v40)) + ((void)v39 << 6);
          uint64_t v125 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v39;
          goto LABEL_8;
        }
        int64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 2);
        if ((uint64_t)(v31 + 3) < v111)
        {
          unint64_t v40 = *(void *)(v108 + 8 * (void)(v31 + 3));
          if (v40)
          {
            uint64_t v39 = v31 + 3;
            goto LABEL_12;
          }
          uint64_t v39 = v31 + 4;
          int64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 3);
          if ((uint64_t)(v31 + 4) < v111)
          {
            unint64_t v40 = *(void *)(v108 + 8 * (void)v39);
            if (v40) {
              goto LABEL_12;
            }
            while ((char *)v103 != v31)
            {
              unint64_t v40 = *(void *)(v102 + 8 * (void)v31++);
              if (v40)
              {
                uint64_t v39 = v31 + 4;
                goto LABEL_12;
              }
            }
            int64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v101;
          }
        }
      }
    }
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D38);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v21, 1, 1, v42);
    uint64_t v33 = 0;
    uint64_t v125 = v41;
LABEL_15:
    sub_25C6F10D8((uint64_t)v21, v35, &qword_26A5C7D30);
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D38);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v35, 1, v43) == 1) {
      break;
    }
    v124 = (unsigned int (**)(char *, uint64_t, uint64_t))v33;
    unsigned int v44 = *(_DWORD *)(v122 + *(int *)(v43 + 48));
    (*v121)(v17, v35, v14);
    if (sub_25C700EA0() == 1)
    {
      sub_25C700E80();
      uint64_t v45 = v21;
      char v46 = v17;
      unint64_t v47 = v30;
      uint64_t v48 = v14;
      int64_t v49 = v115;
      sub_25C700C70();
      uint64_t v50 = v112;
      sub_25C700C70();
      uint64_t v51 = sub_25C700DB0();
      unint64_t v52 = *v116;
      char v53 = v50;
      uint64_t v54 = v117;
      (*v116)(v53, v117);
      uint64_t v55 = v49;
      uint64_t v14 = v48;
      uint64_t v30 = v47;
      uint64_t v17 = v46;
      uint64_t v21 = v45;
      v52(v55, v54);
      uint64_t v7 = v113;
      if ((unint64_t)(v51 - 8) >= 0xFFFFFFFFFFFFFFF9)
      {
        unint64_t v56 = v51 - 1;
        unint64_t v57 = *(void *)(v110 + 16);
        if (v44 >= 2)
        {
          if (v56 >= v57) {
            goto LABEL_67;
          }
          char v58 = 1;
        }
        else
        {
          if (v56 >= v57) {
            goto LABEL_66;
          }
          char v58 = 0;
        }
        *(unsigned char *)(v109 + v56) = v58;
      }
    }
    (*v30)(v17, v14);
    unint64_t v28 = (unint64_t)v124;
    unint64_t v31 = (char *)v125;
  }
  swift_release();
  uint64_t v14 = v105;
  if (!(v105 >> 62))
  {
    uint64_t v59 = *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    unint64_t v60 = v116;
    if (v59) {
      goto LABEL_37;
    }
LABEL_69:
    swift_bridgeObjectRelease();
    uint64_t v86 = v110;
    uint64_t v87 = *(void *)(v110 + 16);
    if (v87)
    {
      swift_bridgeObjectRetain();
      uint64_t v88 = 0;
      uint64_t v89 = MEMORY[0x263F8EE78];
      do
      {
        char v92 = *(unsigned char *)(v86 + v88 + 32);
        if (v92)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v126 = v89;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_25C6F105C(0, *(void *)(v89 + 16) + 1, 1);
            uint64_t v89 = v126;
          }
          unint64_t v91 = *(void *)(v89 + 16);
          unint64_t v90 = *(void *)(v89 + 24);
          if (v91 >= v90 >> 1)
          {
            sub_25C6F105C(v90 > 1, v91 + 1, 1);
            uint64_t v89 = v126;
          }
          *(void *)(v89 + 16) = v91 + 1;
          *(unsigned char *)(v89 + v91 + 32) = v92;
        }
        ++v88;
      }
      while (v87 != v88);
      swift_bridgeObjectRelease();
    }
    swift_release();
    uint64_t v94 = *(void *)(v86 + 16);
    if (v94)
    {
      swift_bridgeObjectRetain();
      uint64_t v95 = 0;
      uint64_t v96 = MEMORY[0x263F8EE78];
      do
      {
        if (*(unsigned char *)(v86 + v95 + 32) == 2)
        {
          char v99 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v126 = v96;
          if ((v99 & 1) == 0)
          {
            sub_25C6F105C(0, *(void *)(v96 + 16) + 1, 1);
            uint64_t v96 = v126;
          }
          unint64_t v98 = *(void *)(v96 + 16);
          unint64_t v97 = *(void *)(v96 + 24);
          if (v98 >= v97 >> 1)
          {
            sub_25C6F105C(v97 > 1, v98 + 1, 1);
            uint64_t v96 = v126;
          }
          *(void *)(v96 + 16) = v98 + 1;
          *(unsigned char *)(v96 + v98 + 32) = 2;
        }
        ++v95;
      }
      while (v94 != v95);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
LABEL_68:
  swift_bridgeObjectRetain();
  uint64_t v59 = sub_25C701480();
  unint64_t v60 = v116;
  if (!v59) {
    goto LABEL_69;
  }
LABEL_37:
  unint64_t v61 = v14 & 0xC000000000000001;
  v124 = (unsigned int (**)(char *, uint64_t, uint64_t))(v104 + 48);
  uint64_t v125 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v104 + 56);
  unint64_t v122 = v14 & 0xC000000000000001;
  uint64_t v123 = (void (**)(char *, char *, uint64_t))(v104 + 32);
  uint64_t v62 = 4;
  while (2)
  {
    if (v61) {
      id v63 = (id)MEMORY[0x261191400](v62 - 4, v14);
    }
    else {
      id v63 = *(id *)(v14 + 8 * v62);
    }
    uint64_t v64 = v63;
    uint64_t v65 = v62 - 3;
    if (__OFADD__(v62 - 4, 1))
    {
      __break(1u);
      goto LABEL_65;
    }
    id v66 = objc_msgSend(v63, sel_metadata);
    if (!v66 || (v67 = v66, unsigned int v68 = objc_msgSend(v66, sel_schedule), v67, v68 != 1))
    {

      goto LABEL_39;
    }
    id v69 = objc_msgSend(v64, sel_metadata);
    if (!v69)
    {
      (*v125)(v7, 1, 1, v117);
      goto LABEL_52;
    }
    uint64_t v70 = v69;
    id v71 = objc_msgSend(v69, sel_aggregationWindowStartTimestamp);

    if (v71)
    {
      uint64_t v72 = (uint64_t)v107;
      sub_25C700CC0();

      uint64_t v73 = 0;
    }
    else
    {
      uint64_t v73 = 1;
      uint64_t v72 = (uint64_t)v107;
    }
    uint64_t v74 = v117;
    (*v125)((char *)v72, v73, 1, v117);
    sub_25C6F10D8(v72, (uint64_t)v7, &qword_26A5C7D90);
    if ((*v124)(v7, 1, v74) == 1)
    {
LABEL_52:

      sub_25C6F107C((uint64_t)v7, &qword_26A5C7D90);
      goto LABEL_39;
    }
    os_log_type_t v75 = v60;
    char v76 = v106;
    (*v123)(v106, v7, v74);
    v77 = v115;
    sub_25C700C70();
    uint64_t v78 = sub_25C700DB0();
    uint64_t v79 = *v75;
    (*v75)(v77, v74);
    unint64_t v80 = v78 - 1;
    if (v78 < 1)
    {
      v79(v76, v74);

      uint64_t v14 = v105;
      uint64_t v7 = v113;
      unint64_t v60 = v75;
      unint64_t v61 = v122;
      goto LABEL_39;
    }
    if ((unint64_t)v78 > 7)
    {
      unint64_t v60 = v116;
      v79(v106, v117);

      uint64_t v14 = v105;
      uint64_t v7 = v113;
      unint64_t v61 = v122;
      goto LABEL_39;
    }
    id v81 = objc_msgSend(v64, sel_statistics);
    unint64_t v60 = v116;
    unint64_t v61 = v122;
    if (!v81) {
      goto LABEL_92;
    }
    uint64_t v82 = v81;
    unsigned int v83 = objc_msgSend(v81, sel_userRequestCount);

    unint64_t v84 = *(void *)(v110 + 16);
    if (v83 >= 2)
    {
      uint64_t v85 = v117;
      if (v80 >= v84) {
        goto LABEL_91;
      }
      *(unsigned char *)(v109 + v80) = 1;
LABEL_63:

      v79(v106, v85);
      uint64_t v14 = v105;
      uint64_t v7 = v113;
LABEL_39:
      ++v62;
      if (v65 == v59) {
        goto LABEL_69;
      }
      continue;
    }
    break;
  }
  uint64_t v85 = v117;
  if (v80 < v84)
  {
    *(unsigned char *)(v109 + v80) = 0;
    goto LABEL_63;
  }
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
}

uint64_t SiriCoreMetricsCalculator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  uint64_t v4 = sub_25C700DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetricsCalculator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  uint64_t v4 = sub_25C700DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_25C6EC250(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 72) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C6EC300;
  return SiriCoreMetricsCalculator.doWork(_:)(v2 + 16, a2);
}

uint64_t sub_25C6EC300()
{
  uint64_t v1 = (_OWORD *)*v0;
  uint64_t v2 = *(_OWORD **)(*v0 + 64);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  long long v3 = v1[1];
  long long v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *uint64_t v2 = v3;
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

void *sub_25C6EC41C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DF8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25C6F12EC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C6EC52C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C6EC53C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t result = sub_25C701460();
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
    sub_25C6F13E0(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_25C6EC7BC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C6EC7E4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C6EC85C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C7013C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C6EC85C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C6EC930(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C6F1290((uint64_t)v12, *a3);
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
      sub_25C6F1290((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C6EC930(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25C7013D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C6ECAEC(a5, a6);
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
  uint64_t v8 = sub_25C701450();
  if (!v8)
  {
    sub_25C701460();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C7014C0();
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

uint64_t sub_25C6ECAEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C6ECB84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C6ECD64(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C6ECD64(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C6ECB84(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25C6ECCFC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C701430();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C701460();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C7012F0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C7014C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C701460();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C6ECCFC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C6ECD64(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DC8);
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
  uint64_t result = sub_25C7014C0();
  __break(1u);
  return result;
}

unint64_t sub_25C6ECEB4(uint64_t a1)
{
  sub_25C701610();
  sub_25C700EC0();
  sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
  sub_25C701260();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v2 = sub_25C701630();
  return sub_25C6EF194(a1, v2);
}

unint64_t sub_25C6ED094(uint64_t a1, uint64_t a2)
{
  sub_25C701610();
  sub_25C7012D0();
  uint64_t v4 = sub_25C701630();
  return sub_25C6EF464(a1, a2, v4);
}

unint64_t sub_25C6ED10C(uint64_t a1)
{
  sub_25C700EC0();
  sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
  uint64_t v2 = sub_25C701250();
  return sub_25C6EF548(a1, v2);
}

uint64_t sub_25C6ED1A4(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB0);
  uint64_t v10 = (void *)sub_25C7014A0();
  if (*(void *)(v9 + 16))
  {
    uint64_t v26 = v3;
    uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v12 = (void *)(v9 + 64);
    uint64_t v13 = -1;
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    unint64_t v14 = v13 & *(void *)(v9 + 64);
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v18 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v19 = v18 | (v17 << 6);
      }
      else
      {
        int64_t v20 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v20 >= v15) {
          goto LABEL_23;
        }
        unint64_t v21 = v12[v20];
        ++v17;
        if (!v21)
        {
          int64_t v17 = v20 + 1;
          if (v20 + 1 >= v15) {
            goto LABEL_23;
          }
          unint64_t v21 = v12[v17];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v26;
                goto LABEL_30;
              }
              uint64_t v24 = 1 << *(unsigned char *)(v9 + 32);
              if (v24 >= 64) {
                bzero((void *)(v9 + 64), ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v12 = -1 << v24;
              }
              unint64_t v3 = v26;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v21 = v12[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v17 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_32;
                }
                if (v17 >= v15) {
                  goto LABEL_23;
                }
                unint64_t v21 = v12[v17];
                ++v22;
                if (v21) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v22;
          }
        }
LABEL_20:
        unint64_t v14 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
      }
      uint64_t v23 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v19;
      if (a2) {
        sub_25C6F0154(v23, (uint64_t)v8, type metadata accessor for SiriCoreMetricsAggregationKeys);
      }
      else {
        sub_25C6F01BC(v23, (uint64_t)v8, type metadata accessor for SiriCoreMetricsAggregationKeys);
      }
      uint64_t result = sub_25C6EEC84((uint64_t)v8, *(void *)(*(void *)(v9 + 56) + 8 * v19), v10);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  *unint64_t v3 = v10;
  return result;
}

uint64_t sub_25C6ED450(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_25C700EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D80);
  int v42 = a2;
  uint64_t v10 = sub_25C7014A0();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    unint64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      char v28 = *(unsigned char *)(*(void *)(v9 + 56) + v21);
      sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
      uint64_t result = sub_25C701250();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(unsigned char *)(*(void *)(v11 + 56) + v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

uint64_t sub_25C6ED874(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_25C700EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD8);
  int v44 = a2;
  uint64_t v10 = sub_25C7014A0();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    unint64_t v40 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    int v42 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v41 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v46 = v5;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v41) {
          goto LABEL_34;
        }
        unint64_t v23 = v42[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v41) {
            goto LABEL_34;
          }
          unint64_t v23 = v42[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v41)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v40;
              if (v44)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v9 + 32);
                if (v38 >= 64) {
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int v42 = -1 << v38;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v42[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v41) {
                  goto LABEL_34;
                }
                unint64_t v23 = v42[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = v9;
      uint64_t v26 = *(void *)(v9 + 48);
      uint64_t v27 = v6;
      uint64_t v28 = *(void *)(v6 + 72);
      uint64_t v29 = v26 + v28 * v21;
      if (v44) {
        (*v45)(v8, v29, v46);
      }
      else {
        (*v43)(v8, v29, v46);
      }
      uint64_t v30 = *(void *)(*(void *)(v25 + 56) + 8 * v21);
      sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
      uint64_t result = sub_25C701250();
      uint64_t v31 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v16 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v45)(*(void *)(v11 + 48) + v28 * v19, v8, v46);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v30;
      ++*(void *)(v11 + 16);
      uint64_t v6 = v27;
      uint64_t v9 = v25;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

uint64_t sub_25C6EDC9C(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_25C700EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD0);
  int v46 = a2;
  uint64_t v10 = sub_25C7014A0();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  int v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  unint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
    }
    sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
    uint64_t result = sub_25C701250();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  unint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v12;
  return result;
}

uint64_t sub_25C6EE0C0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB8);
  char v37 = a2;
  uint64_t v6 = sub_25C7014A0();
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
  char v34 = v2;
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
          unint64_t v3 = v34;
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
    sub_25C701610();
    sub_25C7012D0();
    uint64_t result = sub_25C701630();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v34;
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
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25C6EE3CC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t result = sub_25C6F0154(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, type metadata accessor for SiriCoreMetricsAggregationKeys);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_25C6EE480(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25C700EC0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(unsigned char *)(a4[7] + a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_25C6EE538(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25C700EC0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void (*sub_25C6EE5F0(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x58uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[8] = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25C6F01BC(a2, (uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v4[9] = sub_25C6EEC18(v4);
  v4[10] = sub_25C6EE918(v4 + 4, (uint64_t)v6, isUniquelyReferenced_nonNull_native);
  return sub_25C6EE6D0;
}

void sub_25C6EE6D0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  unint64_t v3 = *(void **)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 80))();
  sub_25C6F0224((uint64_t)v3, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v2(v1, 0);
  free(v3);
  free(v1);
}

void (*sub_25C6EE760(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x68uLL);
  *a1 = v4;
  uint64_t v5 = sub_25C700EC0();
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  v4[9] = v6;
  uint64_t v8 = malloc(*(void *)(v6 + 64));
  v4[10] = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v8, a2, v5);
  v4[11] = sub_25C6EEC48(v4);
  v4[12] = sub_25C6EEA70(v4 + 4, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  return sub_25C6EE880;
}

void sub_25C6EE880(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 88);
  uint64_t v4 = *(void *)(*(void *)a1 + 72);
  unint64_t v3 = *(void **)(*(void *)a1 + 80);
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 96))();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0);
  free(v3);
  free(v1);
}

void (*sub_25C6EE918(void *a1, uint64_t a2, char a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[2] = a2;
  v8[3] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_25C6ECEB4(a2);
  *((unsigned char *)v8 + 9) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  char v13 = v10 ^ 1;
  uint64_t v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    unsigned __int8 v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[4] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        void *v8 = v17;
        *((unsigned char *)v8 + 8) = v13 & 1;
        return sub_25C6EEA58;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_25C6EF708();
      goto LABEL_7;
    }
    sub_25C6ED1A4(v14, a3 & 1);
    unint64_t v18 = sub_25C6ECEB4(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[4] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t result = (void (*)(void *, uint64_t))sub_25C7015C0();
  __break(1u);
  return result;
}

void sub_25C6EEA58(void *a1, uint64_t a2)
{
}

void (*sub_25C6EEA70(void *a1, uint64_t a2, char a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[2] = a2;
  v8[3] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_25C6ED10C(a2);
  *((unsigned char *)v8 + 9) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  char v13 = v10 ^ 1;
  uint64_t v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    unsigned __int8 v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[4] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        void *v8 = v17;
        *((unsigned char *)v8 + 8) = v13 & 1;
        return sub_25C6EEBB0;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_25C6EFC1C();
      goto LABEL_7;
    }
    sub_25C6ED874(v14, a3 & 1);
    unint64_t v18 = sub_25C6ED10C(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[4] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  sub_25C700EC0();
  uint64_t result = (void (*)(void *, uint64_t))sub_25C7015C0();
  __break(1u);
  return result;
}

void sub_25C6EEBB0(void *a1, uint64_t a2)
{
}

void sub_25C6EEBC8(void *a1, uint64_t a2, void (*a3)(void, void, void, void, void))
{
  unint64_t v3 = (void *)*a1;
  a3(*a1, *(unsigned __int8 *)(*a1 + 9), *(void *)(*a1 + 24), *(void *)(*a1 + 32), *(void *)(*a1 + 16));
  free(v3);
}

uint64_t (*sub_25C6EEC18(void *a1))()
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25C6F15E8;
}

uint64_t (*sub_25C6EEC48(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25C6EEC78;
}

uint64_t sub_25C6EEC78(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_25C6EEC84(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25C701610();
  sub_25C700EC0();
  sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
  sub_25C701260();
  uint64_t v4 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_25C701630();
  unint64_t v5 = sub_25C7013F0();
  *(void *)((char *)a3 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v5;
  uint64_t result = sub_25C6F0154(a1, a3[6] + *(void *)(*(void *)(v4 - 8) + 72) * v5, type metadata accessor for SiriCoreMetricsAggregationKeys);
  *(void *)(a3[7] + 8 * v5) = a2;
  ++a3[2];
  return result;
}

unint64_t sub_25C6EEEDC(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  unint64_t result = MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 8))
  {
    if (a2)
    {
      swift_arrayDestroy();
      uint64_t v14 = *a3;
      return sub_25C6F0434(a4, v14);
    }
  }
  else
  {
    uint64_t v15 = *(void *)a1;
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v15;
    }
    else
    {
      uint64_t v16 = (void *)*a3;
      sub_25C6F01BC(a5, (uint64_t)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SiriCoreMetricsAggregationKeys);
      return sub_25C6EE3CC(a4, (uint64_t)v13, v15, v16);
    }
  }
  return result;
}

unint64_t sub_25C6EF03C(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_25C700EC0();
  unint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 8))
  {
    if (a2)
    {
      swift_arrayDestroy();
      uint64_t v15 = *a3;
      return sub_25C6F086C(a4, v15);
    }
  }
  else
  {
    uint64_t v16 = *(void *)a1;
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v16;
    }
    else
    {
      uint64_t v17 = (void *)*a3;
      (*(void (**)(char *, uint64_t))(v12 + 16))(v14, a5);
      return sub_25C6EE538(a4, (uint64_t)v14, v16, v17);
    }
  }
  return result;
}

unint64_t sub_25C6EF194(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = a1;
  uint64_t v29 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  MEMORY[0x270FA5388](v29);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = v2 + 64;
  uint64_t v41 = v2;
  uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v8 = a2 & ~v7;
  if ((*(void *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v9 = *(void *)(v4 + 72);
    uint64_t v38 = ~v7;
    uint64_t v39 = v9;
    while (1)
    {
      sub_25C6F01BC(*(void *)(v41 + 48) + v39 * v8, (uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
      if (sub_25C700EB0())
      {
        uint64_t v10 = *(int *)(v29 + 20);
        uint64_t v11 = *(void *)&v6[v10];
        uint64_t v12 = *(void *)&v6[v10 + 8];
        uint64_t v13 = *(void *)&v6[v10 + 16];
        uint64_t v14 = *(void *)&v6[v10 + 24];
        uint64_t v16 = *(void *)&v6[v10 + 32];
        uint64_t v15 = *(void *)&v6[v10 + 40];
        uint64_t v17 = *(void *)&v6[v10 + 48];
        uint64_t v33 = *(void *)&v6[v10 + 56];
        uint64_t v18 = *(void *)&v6[v10 + 64];
        uint64_t v31 = *(void *)&v6[v10 + 72];
        char v19 = (uint64_t *)(v42 + v10);
        uint64_t v20 = *v19;
        uint64_t v21 = v19[1];
        uint64_t v22 = v19[2];
        uint64_t v23 = v19[3];
        uint64_t v25 = v19[4];
        uint64_t v24 = v19[5];
        uint64_t v36 = v19[6];
        uint64_t v37 = v17;
        uint64_t v32 = v19[7];
        uint64_t v27 = v19[8];
        uint64_t v26 = v19[9];
        uint64_t v34 = v27;
        uint64_t v35 = v18;
        uint64_t v30 = v26;
        if (v11 == v20 && v12 == v21) {
          goto LABEL_3;
        }
        if (sub_25C7015A0())
        {
LABEL_3:
          if (v13 == v22 && v14 == v23 || (sub_25C7015A0())
            && (v16 == v25 && v15 == v24 || (sub_25C7015A0() & 1) != 0)
            && (v37 == v36 && v33 == v32 || (sub_25C7015A0() & 1) != 0)
            && (v35 == v34 && v31 == v30 || (sub_25C7015A0() & 1) != 0))
          {
            break;
          }
        }
      }
      sub_25C6F0224((uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
      unint64_t v8 = (v8 + 1) & v38;
      if (((*(void *)(v40 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        return v8;
      }
    }
    sub_25C6F0224((uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  }
  return v8;
}

unint64_t sub_25C6EF464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C7015A0() & 1) == 0)
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
      while (!v14 && (sub_25C7015A0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C6EF548(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25C700EC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25C6F153C(&qword_26A5C7DE8, MEMORY[0x263F395E0]);
      char v15 = sub_25C701270();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_25C6EF708()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25C701490();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v26 = v1;
  unint64_t result = (void *)(v7 + 64);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    unint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v16) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v22);
    ++v12;
    if (!v23)
    {
      int64_t v12 = v22 + 1;
      if (v22 + 1 >= v16) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v10 + 8 * v12);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_25C6F01BC(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for SiriCoreMetricsAggregationKeys);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v6 + 56) + v20);
    unint64_t result = (void *)sub_25C6F0154((uint64_t)v5, *(void *)(v8 + 48) + v19, type metadata accessor for SiriCoreMetricsAggregationKeys);
    *(void *)(*(void *)(v8 + 56) + v20) = v21;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v26;
    goto LABEL_25;
  }
  unint64_t v23 = *(void *)(v10 + 8 * v24);
  if (v23)
  {
    int64_t v12 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v12);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25C6EF98C()
{
  uint64_t v1 = sub_25C700EC0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D80);
  int64_t v22 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25C701490();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *int64_t v22 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v23 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v26 = v2 + 16;
  int64_t v24 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v25 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    char v17 = *(unsigned char *)(*(void *)(v5 + 56) + v15);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(unsigned char *)(*(void *)(v7 + 56) + v15) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v24) {
    goto LABEL_23;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_25C6EFC1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C700EC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25C701490();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v23 = v1;
  unint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    unint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v6 + 56) + v18);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    *(void *)(*(void *)(v8 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25C6EFEBC()
{
  uint64_t v1 = sub_25C700EC0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DD0);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25C701490();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *uint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25C6F0154(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C6F01BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C6F0224(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_25C6F0284()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C701490();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

unint64_t sub_25C6F0434(int64_t a1, uint64_t a2)
{
  uint64_t v37 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  uint64_t v4 = *(void *)(v37 - 8);
  unint64_t result = MEMORY[0x270FA5388](v37);
  uint64_t v36 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + 64;
  uint64_t v8 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(void *)(a2 + 64 + 8 * (v9 >> 6))) != 0)
  {
    uint64_t v10 = ~v8;
    unint64_t result = sub_25C7013E0();
    if ((*(void *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      uint64_t v11 = *(void *)(v4 + 72);
      uint64_t v32 = a2 + 64;
      uint64_t v33 = a2;
      uint64_t v34 = (result + 1) & v10;
      uint64_t v35 = v10;
      uint64_t v31 = v11;
      uint64_t v12 = (uint64_t)v36;
      do
      {
        uint64_t v13 = *(void *)(a2 + 48);
        int64_t v38 = v11 * v9;
        uint64_t v41 = type metadata accessor for SiriCoreMetricsAggregationKeys;
        int64_t v42 = a1;
        sub_25C6F01BC(v13 + v11 * v9, v12, type metadata accessor for SiriCoreMetricsAggregationKeys);
        sub_25C701610();
        sub_25C700EC0();
        sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
        sub_25C701260();
        uint64_t v14 = v12 + *(int *)(v37 + 20);
        uint64_t v15 = *(void *)(v14 + 64);
        uint64_t v39 = *(void *)(v14 + 48);
        uint64_t v40 = v15;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25C7012D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_25C7012D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_25C7012D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_25C7012D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_25C7012D0();
        swift_bridgeObjectRelease();
        a1 = v42;
        swift_bridgeObjectRelease();
        uint64_t v16 = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v17 = sub_25C701630();
        unint64_t v18 = v34;
        uint64_t v19 = v17;
        unint64_t result = sub_25C6F0224(v12, v41);
        unint64_t v20 = v19 & v16;
        if (a1 >= (uint64_t)v18)
        {
          if (v20 < v18)
          {
            uint64_t v7 = v32;
            a2 = v33;
            uint64_t v11 = v31;
          }
          else
          {
            uint64_t v7 = v32;
            a2 = v33;
            uint64_t v11 = v31;
            if (a1 >= (uint64_t)v20) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v7 = v32;
          a2 = v33;
          uint64_t v11 = v31;
          if (v20 >= v18 || a1 >= (uint64_t)v20)
          {
LABEL_12:
            uint64_t v21 = *(void *)(a2 + 48);
            unint64_t result = v21 + v11 * a1;
            if (v11 * a1 < v38 || result >= v21 + v38 + v11)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v11 * a1 != v38)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            int64_t v23 = (void *)(v22 + 8 * a1);
            unint64_t v24 = (void *)(v22 + 8 * v9);
            if (a1 != v9 || (a1 = v9, v23 >= v24 + 1))
            {
              *int64_t v23 = *v24;
              a1 = v9;
            }
          }
        }
        unint64_t v9 = (v9 + 1) & v16;
      }
      while (((*(void *)(v7 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
    int64_t v25 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v25 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25C6F086C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C700EC0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_25C7013E0();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_25C6F153C((unint64_t *)&qword_26A5C7D88, MEMORY[0x263F395E0]);
        uint64_t v17 = sub_25C701250();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            int64_t v23 = (void *)(v22 + 8 * a1);
            unint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *int64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    int64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25C6F0B64(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_25C6ECEB4(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t result = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      *(void *)(v19[7] + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25C6EF708();
    goto LABEL_7;
  }
  sub_25C6ED1A4(result, a3 & 1);
  uint64_t result = sub_25C6ECEB4(a2);
  if ((v17 & 1) != (v20 & 1))
  {
LABEL_14:
    uint64_t result = sub_25C7015C0();
    __break(1u);
    return result;
  }
  unint64_t v13 = result;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_25C6F01BC(a2, (uint64_t)v10, type metadata accessor for SiriCoreMetricsAggregationKeys);
  return sub_25C6EE3CC(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_25C6F0CE0(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25C700EC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (void *)*v3;
  unint64_t v14 = sub_25C6ED10C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    char v20 = *v4;
    if (v18)
    {
LABEL_8:
      *(unsigned char *)(v20[7] + v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25C6EF98C();
    goto LABEL_7;
  }
  sub_25C6ED450(result, a3 & 1);
  uint64_t result = sub_25C6ED10C(a2);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = sub_25C7015C0();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  char v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25C6EE480(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_25C6F0E7C()
{
  return sub_25C6F153C((unint64_t *)&qword_26A5C7D40, (void (*)(uint64_t))type metadata accessor for SiriCoreMetricsDataRecord);
}

unint64_t sub_25C6F0EC8()
{
  unint64_t result = qword_26A5C7D48;
  if (!qword_26A5C7D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7D48);
  }
  return result;
}

uint64_t sub_25C6F0F1C()
{
  return type metadata accessor for SiriCoreMetricsCalculator();
}

uint64_t type metadata accessor for SiriCoreMetricsCalculator()
{
  uint64_t result = qword_26A5C7D58;
  if (!qword_26A5C7D58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6F0F70()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C700DC0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

_OWORD *sub_25C6F104C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25C6F105C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C6F113C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25C6F107C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C6F10D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C6F113C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7DA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  char v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C7014C0();
  __break(1u);
  return result;
}

uint64_t sub_25C6F1290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C6F12EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25C7014C0();
  __break(1u);
  return result;
}

uint64_t sub_25C6F13E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_25C7014C0();
  __break(1u);
  return result;
}

uint64_t sub_25C6F153C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6F1584(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t SiriCoreMetricsResults.init(processedConversations:countsReportedAll:totalCounts:conversationStreamMetadata:eventStreamMetadata:twoByThreeResults:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a5;
  a7[3] = a4;
  a7[4] = a3;
  a7[5] = a6;
  return result;
}

__n128 SiriCoreMetricsAggregationKeys.init(aggregationStartTimeSince2001:aggregationIntervalInDays:siriInputLocale:viewMode:audioInputRoute:product:siriDataSharingOptInStatus:)@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, __n128 a9, uint64_t a10)
{
  sub_25C700E90();
  uint64_t v18 = a8 + *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  *(void *)uint64_t v18 = a1;
  *(void *)(v18 + 8) = a2;
  *(void *)(v18 + 16) = a3;
  *(void *)(v18 + 24) = a4;
  *(void *)(v18 + 32) = a5;
  *(void *)(v18 + 40) = a6;
  *(void *)(v18 + 48) = a7;
  __n128 result = a9;
  *(__n128 *)(v18 + 56) = a9;
  *(void *)(v18 + 72) = a10;
  return result;
}

uint64_t TwoByThreeSegment.getODMSegment()(uint64_t result)
{
  return result;
}

BOOL static TwoByThreeSegment.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TwoByThreeSegment.hash(into:)()
{
  return sub_25C701620();
}

uint64_t TwoByThreeSegment.hashValue.getter()
{
  return sub_25C701630();
}

uint64_t DynamicDimensionsSiriCoreMetrics.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25C6F1818(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65646F4D77656976;
      break;
    case 2:
      unint64_t result = 0x746E496F69647561;
      break;
    case 3:
      unint64_t result = 0x746375646F7270;
      break;
    case 4:
      return result;
    default:
      unint64_t result = 0x75706E4969726973;
      break;
  }
  return result;
}

unint64_t sub_25C6F18E4()
{
  return sub_25C6F1818(*v0);
}

uint64_t sub_25C6F18EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C6F3B18(a1, a2);
  *a3 = result;
  return result;
}

void sub_25C6F1914(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_25C6F1920(uint64_t a1)
{
  unint64_t v2 = sub_25C6F379C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C6F195C(uint64_t a1)
{
  unint64_t v2 = sub_25C6F379C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicDimensionsSiriCoreMetrics.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E10);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F379C();
  sub_25C701660();
  v8[15] = 0;
  sub_25C701560();
  if (!v1)
  {
    v8[14] = 1;
    sub_25C701560();
    v8[13] = 2;
    sub_25C701560();
    v8[12] = 3;
    sub_25C701560();
    v8[11] = 4;
    sub_25C701560();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DynamicDimensionsSiriCoreMetrics.hashValue.getter()
{
  return sub_25C701630();
}

__n128 DynamicDimensionsSiriCoreMetrics.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C6F3D44(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_25C6F1CB4()
{
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C7012D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6F1DC0()
{
  return sub_25C701630();
}

__n128 sub_25C6F1ECC@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C6F3D44(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_25C6F1F18(void *a1)
{
  return DynamicDimensionsSiriCoreMetrics.encode(to:)(a1);
}

uint64_t sub_25C6F1F30(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  void v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return _s15SiriCoreMetrics017DynamicDimensionsabC0V23__derived_struct_equalsySbAC_ACtFZ_0(v8, v9) & 1;
}

__n128 SiriCoreMetricsAggregationKeys.init(aggregationInterval:dimension:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 48) = v8;
  *(_OWORD *)(v7 + 64) = *(_OWORD *)(a2 + 64);
  __n128 result = *(__n128 *)(a2 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
  *(__n128 *)(v7 + 16) = result;
  return result;
}

uint64_t type metadata accessor for SiriCoreMetricsAggregationKeys(uint64_t a1)
{
  return sub_25C6F4474(a1, (uint64_t *)&unk_26A5C7E80);
}

uint64_t SiriCoreMetricsAggregationKeys.description.getter()
{
  sub_25C701420();
  sub_25C7012E0();
  uint64_t v1 = sub_25C700EA0();
  sub_25C701590();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  sub_25C7012E0();
  sub_25C700E80();
  sub_25C701360();
  sub_25C7012E0();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  sub_25C7012E0();
  swift_bridgeObjectRetain();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  sub_25C7012E0();
  swift_bridgeObjectRetain();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  sub_25C7012E0();
  swift_bridgeObjectRetain();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  sub_25C7012E0();
  swift_bridgeObjectRetain();
  sub_25C7012E0();
  swift_bridgeObjectRelease();
  return HIDWORD(v1);
}

uint64_t SiriCoreMetricsAggregationKeys.hash(into:)()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t SiriCoreMetricsAggregationKeys.hashValue.getter()
{
  return sub_25C701630();
}

uint64_t sub_25C6F25FC()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25C6F27A0()
{
  return sub_25C701630();
}

BOOL static SiriRequestCounts.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25C6F295C(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x65757165526C6C61;
  }
}

BOOL sub_25C6F29A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25C6F29BC()
{
  return sub_25C6F295C(*v0);
}

uint64_t sub_25C6F29C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C6F41B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_25C6F29EC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25C6F29F8(uint64_t a1)
{
  unint64_t v2 = sub_25C6F415C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C6F2A34(uint64_t a1)
{
  unint64_t v2 = sub_25C6F415C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriRequestCounts.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E20);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F415C();
  sub_25C701660();
  v8[15] = 0;
  sub_25C701580();
  if (!v1)
  {
    v8[14] = 1;
    sub_25C701580();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SiriRequestCounts.init(from:)(void *a1)
{
  return sub_25C6F42B0(a1);
}

uint64_t sub_25C6F2BE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C6F42B0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C6F2C14(void *a1)
{
  return SiriRequestCounts.encode(to:)(a1);
}

BOOL sub_25C6F2C30(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t SiriCountsAll.aggregationInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C700EC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

void *SiriCountsAll.dimensions.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for SiriCountsAll(0) + 20));
  return sub_25C6F44AC(v3, a1);
}

void *SiriCountsAll.dimensions.setter(void *a1)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for SiriCountsAll(0) + 20));
  return sub_25C6F44E4(a1, v3);
}

uint64_t (*SiriCountsAll.dimensions.modify())()
{
  return nullsub_1;
}

uint64_t SiriCountsAll.requestCounts.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriCountsAll(0) + 24));
}

uint64_t SiriCountsAll.requestCounts.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for SiriCountsAll(0);
  *(void *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SiriCountsAll.requestCounts.modify())()
{
  return nullsub_1;
}

uint64_t sub_25C6F2E1C(char a1)
{
  if (!a1) {
    return 0xD000000000000013;
  }
  if (a1 == 1) {
    return 0x6F69736E656D6964;
  }
  return 0x4374736575716572;
}

uint64_t sub_25C6F2E88()
{
  return sub_25C6F2E1C(*v0);
}

uint64_t sub_25C6F2E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C6F6324(a1, a2);
  *a3 = result;
  return result;
}

void sub_25C6F2EB8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25C6F2EC4(uint64_t a1)
{
  unint64_t v2 = sub_25C6F451C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C6F2F00(uint64_t a1)
{
  unint64_t v2 = sub_25C6F451C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriCountsAll.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E30);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F451C();
  sub_25C701660();
  LOBYTE(v20) = 0;
  sub_25C700EC0();
  sub_25C6F4570(&qword_26A5C7E40, MEMORY[0x263F395E0]);
  sub_25C701570();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for SiriCountsAll(0);
    uint64_t v10 = (long long *)(v3 + *(int *)(v9 + 20));
    long long v11 = *v10;
    long long v12 = v10[1];
    long long v13 = v10[2];
    long long v14 = v10[3];
    uint64_t v16 = *((void *)v10 + 8);
    uint64_t v15 = *((void *)v10 + 9);
    long long v20 = v11;
    long long v21 = v12;
    long long v22 = v13;
    long long v23 = v14;
    uint64_t v24 = v16;
    uint64_t v25 = v15;
    char v19 = 1;
    sub_25C6E24A8();
    sub_25C701570();
    *(void *)&long long v20 = *(void *)(v3 + *(int *)(v9 + 24));
    char v19 = 2;
    sub_25C6F45B8();
    sub_25C701570();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SiriCountsAll.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v4 = sub_25C700EC0();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v29 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7E50);
  uint64_t v27 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriCountsAll(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F451C();
  sub_25C701650();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v12 = v27;
  uint64_t v11 = v28;
  uint64_t v25 = a1;
  LOBYTE(v31) = 0;
  sub_25C6F4570(&qword_26A5C7E58, MEMORY[0x263F395E0]);
  sub_25C701510();
  long long v13 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v24 = v10;
  v13(v10, v29, v4);
  char v37 = 1;
  sub_25C6E2ACC();
  sub_25C701510();
  long long v14 = v32;
  long long v15 = v33;
  long long v16 = v34;
  uint64_t v17 = v35;
  uint64_t v18 = v36;
  BOOL v29 = (char *)v8;
  uint64_t v19 = *(int *)(v8 + 20);
  uint64_t v20 = (uint64_t)v24;
  long long v21 = &v24[v19];
  *(_OWORD *)long long v21 = v31;
  *((_OWORD *)v21 + 1) = v14;
  *((_OWORD *)v21 + 2) = v15;
  *((_OWORD *)v21 + 3) = v16;
  *((void *)v21 + 8) = v17;
  *((void *)v21 + 9) = v18;
  char v37 = 2;
  sub_25C6F460C();
  sub_25C701510();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v30);
  *(void *)(v20 + *((int *)v29 + 6)) = v31;
  sub_25C6F4660(v20, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return sub_25C6F46C4(v20);
}

uint64_t sub_25C6F3584@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriCountsAll.init(from:)(a1, a2);
}

uint64_t sub_25C6F359C(void *a1)
{
  return SiriCountsAll.encode(to:)(a1);
}

uint64_t SiriCoreMetricsResults.processedConversations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.countsReportedAll.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.eventStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResults.eventStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResults.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.conversationStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResults.conversationStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResults.totalCounts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.twoByThreeResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C6F3680()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C6F3688()
{
  return swift_bridgeObjectRetain();
}

uint64_t _s15SiriCoreMetrics017DynamicDimensionsabC0V23__derived_struct_equalsySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_25C7015A0(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_25C7015A0(), uint64_t result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_25C7015A0(), uint64_t result = 0, (v9 & 1) != 0))
      {
        if (a1[6] == a2[6] && a1[7] == a2[7] || (v10 = sub_25C7015A0(), uint64_t result = 0, (v10 & 1) != 0))
        {
          if (a1[8] == a2[8] && a1[9] == a2[9])
          {
            return 1;
          }
          else
          {
            return sub_25C7015A0();
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_25C6F379C()
{
  unint64_t result = qword_26A5C7E18;
  if (!qword_26A5C7E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E18);
  }
  return result;
}

BOOL _s15SiriCoreMetrics0A9CountsAllV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_25C700EB0() & 1) == 0) {
    return 0;
  }
  uint64_t v34 = type metadata accessor for SiriCountsAll(0);
  uint64_t v4 = *(int *)(v34 + 20);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = *(void *)(a1 + v4 + 16);
  uint64_t v8 = *(void *)(a1 + v4 + 24);
  uint64_t v9 = *(void *)(a1 + v4 + 32);
  uint64_t v10 = *(void *)(a1 + v4 + 40);
  uint64_t v41 = *(void *)(a1 + v4 + 56);
  uint64_t v42 = *(void *)(a1 + v4 + 48);
  uint64_t v37 = *(void *)(a1 + v4 + 72);
  uint64_t v38 = *(void *)(a1 + v4 + 64);
  uint64_t v11 = (void *)(a2 + v4);
  uint64_t v12 = v11[2];
  uint64_t v13 = v11[3];
  uint64_t v15 = v11[4];
  uint64_t v14 = v11[5];
  uint64_t v39 = v11[7];
  uint64_t v40 = v11[6];
  uint64_t v35 = v11[9];
  uint64_t v36 = v11[8];
  BOOL v16 = v5 == *v11 && v6 == v11[1];
  if (v16 || (v17 = sub_25C7015A0(), BOOL result = 0, (v17 & 1) != 0))
  {
    BOOL v19 = v7 == v12 && v8 == v13;
    if (v19 || (v20 = sub_25C7015A0(), BOOL result = 0, (v20 & 1) != 0))
    {
      BOOL v21 = v9 == v15 && v10 == v14;
      if (v21 || (v22 = sub_25C7015A0(), BOOL result = 0, (v22 & 1) != 0))
      {
        BOOL v23 = v42 == v40 && v41 == v39;
        if (v23 || (v24 = sub_25C7015A0(), BOOL result = 0, (v24 & 1) != 0))
        {
          BOOL v25 = v38 == v36 && v37 == v35;
          if (v25 || (v26 = sub_25C7015A0(), BOOL result = 0, (v26 & 1) != 0))
          {
            uint64_t v27 = *(int *)(v34 + 24);
            int v29 = *(_DWORD *)(a1 + v27);
            int v28 = *(_DWORD *)(a1 + v27 + 4);
            uint64_t v30 = (int *)(a2 + v27);
            int v32 = *v30;
            int v31 = v30[1];
            return v29 == v32 && v28 == v31;
          }
        }
      }
    }
  }
  return result;
}

uint64_t _s15SiriCoreMetrics0abC15AggregationKeysV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_25C700EB0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = *(void *)(a1 + v4 + 16);
  uint64_t v8 = *(void *)(a1 + v4 + 24);
  uint64_t v9 = *(void *)(a1 + v4 + 32);
  uint64_t v10 = *(void *)(a1 + v4 + 40);
  uint64_t v28 = *(void *)(a1 + v4 + 56);
  uint64_t v29 = *(void *)(a1 + v4 + 48);
  uint64_t v26 = *(void *)(a1 + v4 + 72);
  uint64_t v27 = *(void *)(a1 + v4 + 64);
  uint64_t v11 = (void *)(a2 + v4);
  uint64_t v12 = v11[2];
  uint64_t v13 = v11[3];
  uint64_t v14 = v11[4];
  uint64_t v15 = v11[5];
  uint64_t v16 = v11[6];
  uint64_t v17 = v11[7];
  uint64_t v24 = v11[9];
  uint64_t v25 = v11[8];
  BOOL v18 = v5 == *v11 && v6 == v11[1];
  if (v18 || (sub_25C7015A0())
    && (v7 == v12 ? (BOOL v19 = v8 == v13) : (BOOL v19 = 0),
        (v19 || (sub_25C7015A0() & 1) != 0)
     && (v9 == v14 ? (BOOL v20 = v10 == v15) : (BOOL v20 = 0),
         (v20 || (sub_25C7015A0() & 1) != 0)
      && (v29 == v16 ? (BOOL v21 = v28 == v17) : (BOOL v21 = 0),
          (v21 || (sub_25C7015A0() & 1) != 0)
       && (v27 == v25 ? (BOOL v22 = v26 == v24) : (BOOL v22 = 0), v22 || (sub_25C7015A0() & 1) != 0)))))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_25C6F3B18(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x75706E4969726973 && a2 == 0xEF656C61636F4C74;
  if (v3 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F4D77656976 && a2 == 0xE800000000000000 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E496F69647561 && a2 == 0xEE00656361667265 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746375646F7270 && a2 == 0xE700000000000000 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025C703AC0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25C7015A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_25C6F3D44@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7EF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F379C();
  sub_25C701650();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v38 = 0;
  uint64_t v9 = sub_25C701500();
  uint64_t v11 = v10;
  uint64_t v32 = v9;
  char v37 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25C701500();
  uint64_t v33 = v13;
  uint64_t v29 = v12;
  char v36 = 2;
  swift_bridgeObjectRetain();
  uint64_t v31 = 0;
  uint64_t v28 = sub_25C701500();
  char v35 = 3;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_25C701500();
  uint64_t v30 = v15;
  uint64_t v27 = v16;
  char v34 = 4;
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_25C701500();
  uint64_t v21 = v20;
  BOOL v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v31 = v19;
  v22(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v23 = v33;
  swift_bridgeObjectRetain();
  uint64_t v24 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v29;
  a2[3] = v23;
  a2[4] = v28;
  a2[5] = v24;
  a2[6] = v27;
  a2[7] = v18;
  a2[8] = v31;
  a2[9] = v21;
  return result;
}

unint64_t sub_25C6F415C()
{
  unint64_t result = qword_26A5C7E28;
  if (!qword_26A5C7E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E28);
  }
  return result;
}

uint64_t sub_25C6F41B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65757165526C6C61 && a2 == 0xEF746E756F437473;
  if (v3 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C703AE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C7015A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C6F42B0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7EE8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C6F415C();
  sub_25C701650();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v10[15] = 0;
  unsigned int v7 = sub_25C701520();
  v10[14] = 1;
  uint64_t v8 = sub_25C701520();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7 | (unint64_t)(v8 << 32);
}

uint64_t type metadata accessor for SiriCountsAll(uint64_t a1)
{
  return sub_25C6F4474(a1, (uint64_t *)&unk_26A5C7E90);
}

uint64_t sub_25C6F4474(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_25C6F44AC(void *a1, void *a2)
{
  return a2;
}

void *sub_25C6F44E4(void *a1, void *a2)
{
  return a2;
}

unint64_t sub_25C6F451C()
{
  unint64_t result = qword_26A5C7E38;
  if (!qword_26A5C7E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E38);
  }
  return result;
}

uint64_t sub_25C6F4570(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C6F45B8()
{
  unint64_t result = qword_26A5C7E48;
  if (!qword_26A5C7E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E48);
  }
  return result;
}

unint64_t sub_25C6F460C()
{
  unint64_t result = qword_26A5C7E60;
  if (!qword_26A5C7E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E60);
  }
  return result;
}

uint64_t sub_25C6F4660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriCountsAll(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6F46C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriCountsAll(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C6F4724()
{
  unint64_t result = qword_26A5C7E68;
  if (!qword_26A5C7E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E68);
  }
  return result;
}

unint64_t sub_25C6F477C()
{
  unint64_t result = qword_26A5C7E70;
  if (!qword_26A5C7E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7E70);
  }
  return result;
}

uint64_t sub_25C6F47D0()
{
  return sub_25C6F4570(&qword_26A5C7E78, (void (*)(uint64_t))type metadata accessor for SiriCoreMetricsAggregationKeys);
}

ValueMetadata *type metadata accessor for TwoByThreeSegment()
{
  return &type metadata for TwoByThreeSegment;
}

uint64_t initializeBufferWithCopyOfBuffer for DynamicDimensionsSiriCoreMetrics(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DynamicDimensionsSiriCoreMetrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DynamicDimensionsSiriCoreMetrics(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DynamicDimensionsSiriCoreMetrics(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for DynamicDimensionsSiriCoreMetrics(void *a1, void *a2)
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
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensionsSiriCoreMetrics()
{
  return &type metadata for DynamicDimensionsSiriCoreMetrics;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCoreMetricsAggregationKeys(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C700EC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = v10[3];
    void v9[2] = v10[2];
    v9[3] = v12;
    uint64_t v13 = v10[5];
    v9[4] = v10[4];
    _OWORD v9[5] = v13;
    uint64_t v14 = v10[7];
    v9[6] = v10[6];
    v9[7] = v14;
    uint64_t v15 = v10[9];
    v9[8] = v10[8];
    v9[9] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t initializeWithCopy for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  _OWORD v8[5] = v12;
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  uint64_t v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  _OWORD v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  v8[9] = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[3];
  v8[2] = v9[2];
  v8[3] = v10;
  v8[4] = v9[4];
  long long v11 = v9[1];
  _OWORD *v8 = *v9;
  v8[1] = v11;
  return a1;
}

uint64_t assignWithTake for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  _OWORD v8[5] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_25C6F4FE8()
{
  uint64_t result = sub_25C700EC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriRequestCounts(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SiriRequestCounts(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestCounts()
{
  return &type metadata for SiriRequestCounts;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCountsAll(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C700EC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = v11[3];
    v10[2] = v11[2];
    v10[3] = v13;
    uint64_t v14 = v11[5];
    v10[4] = v11[4];
    v10[5] = v14;
    uint64_t v15 = v11[7];
    v10[6] = v11[6];
    v10[7] = v15;
    uint64_t v16 = v11[9];
    v10[8] = v11[8];
    v10[9] = v16;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s15SiriCoreMetrics30SiriCoreMetricsAggregationKeysVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = v10[3];
  void v9[2] = v10[2];
  v9[3] = v12;
  uint64_t v13 = v10[5];
  v9[4] = v10[4];
  _OWORD v9[5] = v13;
  uint64_t v14 = v10[7];
  v9[6] = v10[6];
  v9[7] = v14;
  uint64_t v15 = v10[9];
  v9[8] = v10[8];
  v9[9] = v15;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  _OWORD v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  v8[9] = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (_DWORD *)(a1 + v10);
  uint64_t v12 = (_DWORD *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

uint64_t initializeWithTake for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[3];
  void v9[2] = v10[2];
  v9[3] = v11;
  v9[4] = v10[4];
  long long v12 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v12;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  void *v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  _OWORD v8[5] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6F5648);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700EC0();
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
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6F5724);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25C700EC0();
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

uint64_t sub_25C6F57E8()
{
  uint64_t result = sub_25C700EC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for SiriCoreMetricsResults()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriCoreMetricsResults(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriCoreMetricsResults(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for SiriCoreMetricsResults(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsResults(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsResults(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsResults()
{
  return &type metadata for SiriCoreMetricsResults;
}

uint64_t _s15SiriCoreMetrics17TwoByThreeSegmentOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15SiriCoreMetrics17TwoByThreeSegmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C6F5CA0);
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

ValueMetadata *type metadata accessor for SiriCountsAll.CodingKeys()
{
  return &type metadata for SiriCountsAll.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriRequestCounts.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriRequestCounts.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25C6F5E34);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_25C6F5E5C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestCounts.CodingKeys()
{
  return &type metadata for SiriRequestCounts.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25C6F5FD4);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensionsSiriCoreMetrics.CodingKeys()
{
  return &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys;
}

unint64_t sub_25C6F6010()
{
  unint64_t result = qword_26A5C7EA0;
  if (!qword_26A5C7EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EA0);
  }
  return result;
}

unint64_t sub_25C6F6068()
{
  unint64_t result = qword_26A5C7EA8;
  if (!qword_26A5C7EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EA8);
  }
  return result;
}

unint64_t sub_25C6F60C0()
{
  unint64_t result = qword_26A5C7EB0;
  if (!qword_26A5C7EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EB0);
  }
  return result;
}

unint64_t sub_25C6F6118()
{
  unint64_t result = qword_26A5C7EB8;
  if (!qword_26A5C7EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EB8);
  }
  return result;
}

unint64_t sub_25C6F6170()
{
  unint64_t result = qword_26A5C7EC0;
  if (!qword_26A5C7EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EC0);
  }
  return result;
}

unint64_t sub_25C6F61C8()
{
  unint64_t result = qword_26A5C7EC8;
  if (!qword_26A5C7EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EC8);
  }
  return result;
}

unint64_t sub_25C6F6220()
{
  unint64_t result = qword_26A5C7ED0;
  if (!qword_26A5C7ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7ED0);
  }
  return result;
}

unint64_t sub_25C6F6278()
{
  unint64_t result = qword_26A5C7ED8;
  if (!qword_26A5C7ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7ED8);
  }
  return result;
}

unint64_t sub_25C6F62D0()
{
  unint64_t result = qword_26A5C7EE0;
  if (!qword_26A5C7EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7EE0);
  }
  return result;
}

uint64_t sub_25C6F6324(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025C703B00 || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_25C7015A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4374736575716572 && a2 == 0xED000073746E756FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_25C7015A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t SiriCoreMetricsSELFReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v4 = sub_25C700D20();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.getter()
{
  return sub_25C6F659C();
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.setter(uint64_t a1)
{
  return sub_25C6F65F0(a1, &OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll);
}

uint64_t (*SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.modify())()
{
  return j__swift_endAccess;
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.getter()
{
  return sub_25C6F659C();
}

uint64_t sub_25C6F659C()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.setter(uint64_t a1)
{
  return sub_25C6F65F0(a1, &OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores);
}

uint64_t sub_25C6F65F0(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SiriCoreMetricsSELFReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = MEMORY[0x263F8EE78];
  *(void *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v5;
  uint64_t v6 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  uint64_t v7 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a1, v7);
  uint64_t v8 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v9 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a2, v9);
  return v4;
}

uint64_t SiriCoreMetricsSELFReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = MEMORY[0x263F8EE78];
  *(void *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v5;
  uint64_t v6 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  uint64_t v7 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a1, v7);
  uint64_t v8 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v9 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a2, v9);
  return v2;
}

uint64_t SiriCoreMetricsSELFReporter.report(_:)(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_25C700D20();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6F6930, 0, 0);
}

uint64_t sub_25C6F6930()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = _s15SiriCoreMetrics0abC20SELFMessageConverterO28convertToODMSiriClientEvents17countsReportedAll17twoByThreeResults5odmId6loggerSaySo0h6SchemahI5EventCGSDy11DeepThought19AggregationIntervalVSayAA0a6CountsM0VGG_SDyAnA03TwooP7SegmentOG10Foundation4UUIDV2os6LoggerVtFZ_0(*(void *)(*(void *)(v0 + 72) + 8), *(void *)(*(void *)(v0 + 72) + 40), v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId, v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger);
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C701480();
    uint64_t v5 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_13;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  unint64_t v7 = v4 & 0xC000000000000001;
  uint64_t v8 = self;
  uint64_t v9 = 0;
  int v46 = v8;
  do
  {
    if (v7) {
      id v10 = (id)MEMORY[0x261191400](v9, v4);
    }
    else {
      id v10 = *(id *)(v4 + 8 * v9 + 32);
    }
    uint64_t v11 = v10;
    id v12 = objc_msgSend(v8, sel_sharedAnalytics);
    id v13 = objc_msgSend(v12, sel_defaultMessageStream);

    id v14 = v11;
    uint64_t v15 = sub_25C701200();
    os_log_type_t v16 = sub_25C701390();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      unint64_t v18 = v7;
      uint64_t v19 = v5;
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      *(void *)(v17 + 4) = v14;
      *uint64_t v20 = v14;

      _os_log_impl(&dword_25C6E0000, v15, v16, "SELF reporter: reported task with message = %@", (uint8_t *)v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F08);
      swift_arrayDestroy();
      uint64_t v21 = v20;
      uint64_t v5 = v19;
      unint64_t v7 = v18;
      MEMORY[0x261191AB0](v21, -1, -1);
      uint64_t v22 = v17;
      uint64_t v8 = v46;
      MEMORY[0x261191AB0](v22, -1, -1);
    }
    else
    {
    }
    ++v9;

    objc_msgSend(v13, sel_emitMessage_, v14);
  }
  while (v5 != v9);
LABEL_13:
  uint64_t v23 = v45;
  uint64_t v24 = (uint64_t *)v45[9];
  swift_bridgeObjectRelease();
  uint64_t v25 = *v24;
  v45[8] = *v24;
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    uint64_t v27 = v45 + 5;
    uint64_t v28 = v45[10] + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores;
    uint64_t v29 = (uint64_t *)(v25 + 32);
    unint64_t v47 = (void (**)(void, void))(v45[12] + 8);
    swift_bridgeObjectRetain();
    int v44 = (void *)v28;
    do
    {
      uint64_t v31 = v23[13];
      uint64_t v32 = *v29;
      swift_bridgeObjectRetain();
      _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
      uint64_t v33 = (void *)_s15SiriCoreMetrics0abC20SELFMessageConverterO27convertToODMSiriClientEvent21processedConversation5odmId6loggerSo0h6SchemahiJ0CSgAA09ProcessedaL0V_10Foundation4UUIDV2os6LoggerVtFZ_0(v32, v31);
      swift_bridgeObjectRelease();
      if (v33)
      {
        id v34 = objc_msgSend(self, sel_sharedAnalytics);
        id v35 = objc_msgSend(v34, sel_defaultMessageStream);

        id v36 = v33;
        char v37 = sub_25C701200();
        os_log_type_t v38 = sub_25C701390();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = swift_slowAlloc();
          uint64_t v40 = v27;
          uint64_t v41 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v39 = 138412290;
          *(void *)(v39 + 4) = v36;
          *uint64_t v41 = v33;

          _os_log_impl(&dword_25C6E0000, v37, v38, "SELF reporter: reported task with message = %@", (uint8_t *)v39, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F08);
          swift_arrayDestroy();
          uint64_t v42 = v41;
          uint64_t v27 = v40;
          MEMORY[0x261191AB0](v42, -1, -1);
          MEMORY[0x261191AB0](v39, -1, -1);
        }
        else
        {
        }
        objc_msgSend(v35, sel_emitMessage_, v36);

        swift_beginAccess();
        id v30 = v36;
        MEMORY[0x2611912C0]();
        if (*(void *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C701330();
        }
        sub_25C701350();
        sub_25C701320();
        swift_endAccess();

        uint64_t v23 = v45;
      }
      (*v47)(v23[13], v23[11]);
      ++v29;
      --v26;
    }
    while (v26);
    sub_25C6F92BC((uint64_t)(v45 + 8));
  }
  swift_task_dealloc();
  uint64_t v43 = (uint64_t (*)(void))v23[1];
  return v43();
}

uint64_t sub_25C6F6E74()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v2 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  uint64_t v4 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SiriCoreMetricsSELFReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v2 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  uint64_t v4 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriCoreMetricsSELFReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  uint64_t v2 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  uint64_t v4 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

void sub_25C6F7110(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25C7013C0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t _s15SiriCoreMetrics0abC20SELFMessageConverterO28convertToODMSiriClientEvents17countsReportedAll17twoByThreeResults5odmId6loggerSaySo0h6SchemahI5EventCGSDy11DeepThought19AggregationIntervalVSayAA0a6CountsM0VGG_SDyAnA03TwooP7SegmentOG10Foundation4UUIDV2os6LoggerVtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v131 = a3;
  uint64_t v130 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v123 = (char *)&v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C700D20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v122 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F20);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v129 = (char *)&v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = type metadata accessor for SiriCountsAll(0);
  uint64_t v125 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v137 = (char *)&v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25C700EC0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v150 = (uint64_t)&v117 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F30);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v117 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v117 - v21;
  if (!*(void *)(a1 + 16))
  {
    char v114 = sub_25C701200();
    os_log_type_t v115 = sub_25C701380();
    if (os_log_type_enabled(v114, v115))
    {
      int v116 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v116 = 0;
      _os_log_impl(&dword_25C6E0000, v114, v115, "no aggregations to report", v116, 2u);
      MEMORY[0x261191AB0](v116, -1, -1);
    }

    return MEMORY[0x263F8EE78];
  }
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v133 = a1 + 64;
  uint64_t v24 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v153 = MEMORY[0x263F8EE78];
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  else {
    uint64_t v25 = -1;
  }
  unint64_t v149 = v25 & v23;
  uint64_t v141 = v15 + 16;
  uint64_t v147 = (void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  uint64_t v121 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  uint64_t v119 = (void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  uint64_t v118 = (void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v142 = v15;
  uint64_t v146 = (uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  int64_t v136 = (unint64_t)(v24 + 63) >> 6;
  int64_t v117 = v136 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v148 = 0;
  uint64_t v120 = 0x800000025C703BC0;
  uint64_t v124 = MEMORY[0x263F8EE58] + 8;
  uint64_t v138 = v14;
  uint64_t v139 = v8;
  uint64_t v135 = a4;
  uint64_t v128 = a1;
  v144 = v22;
  uint64_t v145 = v20;
LABEL_8:
  if (v149)
  {
    unint64_t v27 = __clz(__rbit64(v149));
    v149 &= v149 - 1;
    unint64_t v28 = v27 | (v148 << 6);
LABEL_10:
    (*(void (**)(char *, unint64_t, uint64_t))(v142 + 16))(v20, *(void *)(a1 + 48) + *(void *)(v142 + 72) * v28, v14);
    uint64_t v29 = *(void *)(a1 + 56);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F38);
    *(void *)&v20[*(int *)(v30 + 48)] = *(void *)(v29 + 8 * v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v20, 0, 1, v30);
    swift_bridgeObjectRetain();
LABEL_29:
    sub_25C6F9490((uint64_t)v20, (uint64_t)v22);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F38);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v22, 1, v35) == 1)
    {
      swift_release();
      return v153;
    }
    uint64_t v36 = *(void *)&v22[*(int *)(v35 + 48)];
    (*v147)(v150, v22, v14);
    unint64_t v37 = 0x2654B6000uLL;
    id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A8]), sel_init);
    if (!v38) {
      goto LABEL_117;
    }
    uint64_t v39 = v38;
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7D0]), sel_init);
    if (!v40) {
      goto LABEL_116;
    }
    id v41 = v40;
    id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7C8]), sel_init);
    if (!v42) {
      goto LABEL_115;
    }
    uint64_t v43 = v42;
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A0]), sel_init);
    if (!v44)
    {
      uint64_t v45 = v43;
      goto LABEL_114;
    }
    uint64_t v45 = v44;
    id v134 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F8]), sel_init);
    if (!v134)
    {

      uint64_t v39 = v41;
      id v41 = v43;
LABEL_114:

      uint64_t v39 = v41;
      id v41 = v45;
LABEL_115:

      uint64_t v39 = v41;
LABEL_116:

LABEL_117:
      swift_bridgeObjectRelease();
      uint64_t v72 = sub_25C701200();
      os_log_type_t v73 = sub_25C7013A0();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl(&dword_25C6E0000, v72, v73, "Unable to create ODMSiriSchemaODMSiriClientEvent SELF message", v74, 2u);
        os_log_type_t v75 = v74;
        uint64_t v14 = v138;
        MEMORY[0x261191AB0](v75, -1, -1);
      }
      uint64_t v22 = v144;
      uint64_t v20 = v145;
      goto LABEL_7;
    }
    id v140 = v43;
    v132 = v41;
    objc_msgSend(v45, sel_setAggregationIntervalInDays_, sub_25C700EA0());
    sub_25C700E80();
    objc_msgSend(v45, sel_setAggregationIntervalStartTimestampInSecondsSince2001_);
    uint64_t v46 = v36;
    uint64_t v47 = *(void *)(v36 + 16);
    if (!v47)
    {
      swift_bridgeObjectRelease();
      goto LABEL_120;
    }
    uint64_t v127 = v45;
    unint64_t v48 = (*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80);
    uint64_t v126 = v46;
    uint64_t v49 = v46 + v48;
    uint64_t v50 = *(void *)(v125 + 72);
    uint64_t v51 = (uint64_t)v137;
    while (1)
    {
      sub_25C6F4660(v49, v51);
      uint64_t v54 = [objc_allocWithZone(MEMORY[0x263F6E7B8]) *(SEL *)(v37 + 3392)];
      if (!v54) {
        goto LABEL_48;
      }
      uint64_t v55 = v54;
      unint64_t v56 = [objc_allocWithZone(MEMORY[0x263F6E798]) *(SEL *)(v37 + 3392)];
      if (!v56) {
        break;
      }
      unint64_t v57 = v56;
      id v58 = [objc_allocWithZone(MEMORY[0x263F6E7D8]) *(SEL *)(v37 + 3392)];
      if (!v58)
      {

        unint64_t v37 = 0x2654B6000;
        goto LABEL_47;
      }
      uint64_t v59 = v58;
      unint64_t v60 = (void *)MEMORY[0x261190E90](*(void *)(v51 + *(int *)(v143 + 20)), *(void *)(v51 + *(int *)(v143 + 20) + 8));
      [v57 setSiriInputLocale:v60];

      id v61 = (id)sub_25C701280();
      if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_UNKNOWN"])
      {
        uint64_t v62 = 0;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_COMPACT"])
      {
        uint64_t v62 = 1;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_TV"])
      {
        uint64_t v62 = 2;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_BLUETOOTH_CAR"])
      {
        uint64_t v62 = 3;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_EYES_FREE"])
      {
        uint64_t v62 = 4;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_CARPLAY"])
      {
        uint64_t v62 = 5;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_VOX"])
      {
        uint64_t v62 = 6;
      }
      else if ([v61 isEqualToString:@"ODMSIRIUIVIEWMODE_NOT_APPLICABLE"])
      {
        uint64_t v62 = 7;
      }
      else
      {
        uint64_t v62 = 0;
      }

      [v57 setViewMode:v62];
      id v66 = (id)sub_25C701280();
      if ([v66 isEqualToString:@"AUDIOINPUTROUTE_UNKNOWN"])
      {
        uint64_t v67 = 0;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_DEVICE"])
      {
        uint64_t v67 = 1;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH"])
      {
        uint64_t v67 = 3;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH"])
      {
        uint64_t v67 = 4;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_APPLE_WIRED"])
      {
        uint64_t v67 = 5;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_WIRED"])
      {
        uint64_t v67 = 6;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_CARPLAY"])
      {
        uint64_t v67 = 7;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH_DO_AP_DEVICE"])
      {
        uint64_t v67 = 8;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_DO_AP_DEVICE"])
      {
        uint64_t v67 = 9;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH_HANDS_FREE_DEVICE"])
      {
        uint64_t v67 = 10;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_HANDS_FREE_DEVICE"])
      {
        uint64_t v67 = 11;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_USB_AUDIO"])
      {
        uint64_t v67 = 12;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_SIRI_ACCESSORY"])
      {
        uint64_t v67 = 13;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_AUDIO_INJECTION"])
      {
        uint64_t v67 = 14;
      }
      else if ([v66 isEqualToString:@"AUDIOINPUTROUTE_DARWIN"])
      {
        uint64_t v67 = 15;
      }
      else
      {
        uint64_t v67 = 0;
      }

      [v57 setAudioInterface:v67];
      id v68 = (id)sub_25C701280();
      if ([v68 isEqualToString:@"PRODUCT_UNKNOWN"])
      {
        uint64_t v69 = 0;
      }
      else if ([v68 isEqualToString:@"PRODUCT_ASSISTANT"])
      {
        uint64_t v69 = 1;
      }
      else if ([v68 isEqualToString:@"PRODUCT_DICTATION"])
      {
        uint64_t v69 = 2;
      }
      else
      {
        uint64_t v69 = 0;
      }

      [v57 setProduct:v69];
      id v70 = (id)sub_25C701280();
      if ([v70 isEqualToString:@"UNKNOWN"])
      {
        uint64_t v52 = 0;
        uint64_t v51 = (uint64_t)v137;
      }
      else
      {
        char v71 = [v70 isEqualToString:@"OPTED_IN"];
        uint64_t v51 = (uint64_t)v137;
        if (v71)
        {
          uint64_t v52 = 1;
        }
        else if ([v70 isEqualToString:@"OPTED_OUT"])
        {
          uint64_t v52 = 2;
        }
        else if ([v70 isEqualToString:@"DISMISSED"])
        {
          uint64_t v52 = 3;
        }
        else
        {
          uint64_t v52 = 0;
        }
      }

      [v57 setSiriDataSharingOptInStatus:v52];
      char v53 = (unsigned int *)(v51 + *(int *)(v143 + 24));
      objc_msgSend(v59, sel_setAllRequestCount_, *v53);
      objc_msgSend(v59, sel_setUserRequestCount_, v53[1]);
      [v55 setDimensions:v57];
      [v55 setRequestCounts:v59];

      objc_msgSend(v140, sel_addSiriCountsAll_, v55);
      uint64_t v8 = v139;
      unint64_t v37 = 0x2654B6000uLL;
LABEL_39:

      sub_25C6F46C4(v51);
      v49 += v50;
      if (!--v47)
      {
        swift_bridgeObjectRelease();
        uint64_t v45 = v127;
LABEL_120:
        uint64_t v76 = v130;
        uint64_t v77 = (uint64_t)v129;
        uint64_t v78 = v132;
        if (*(void *)(v130 + 16) && (unint64_t v79 = sub_25C6ED10C(v150), (v80 & 1) != 0)) {
          uint64_t v81 = *(unsigned __int8 *)(*(void *)(v76 + 56) + v79);
        }
        else {
          uint64_t v81 = 2;
        }
        id v82 = v140;
        objc_msgSend(v140, sel_addSegments_, v81);
        objc_msgSend(v82, sel_setAggregationInterval_, v45);
        sub_25C700FD0();
        uint64_t v83 = sub_25C700FF0();
        uint64_t v84 = *(void *)(v83 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v77, 1, v83) == 1)
        {
          sub_25C6F107C(v77, &qword_26A5C7F20);
          uint64_t v85 = 0;
          uint64_t v72 = 0;
        }
        else
        {
          uint64_t v86 = sub_25C700FE0();
          uint64_t v87 = v77;
          uint64_t v72 = v86;
          (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v87, v83);
          id v88 = [v72 bmltTaskId];
          sub_25C701290();

          uint64_t v85 = (void *)sub_25C701280();
          swift_bridgeObjectRelease();
        }
        id v89 = v134;
        objc_msgSend(v134, sel_setExperimentId_, v85);

        if (v72)
        {
          id v90 = [v72 treatmentId];
          if (v90)
          {
            unint64_t v91 = v90;
            sub_25C701290();

            uint64_t v92 = (uint64_t)v123;
            sub_25C700CE0();
            swift_bridgeObjectRelease();
            if ((*v121)(v92, 1, v8) == 1)
            {
              sub_25C6F107C(v92, &qword_26A5C7BD8);
              id v93 = 0;
            }
            else
            {
              uint64_t v95 = v122;
              (*v119)(v122, v92, v8);
              id v96 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
              unint64_t v97 = (void *)sub_25C700D00();
              id v98 = objc_msgSend(v96, sel_initWithNSUUID_, v97);

              uint64_t v99 = v8;
              id v93 = v98;
              (*v118)(v95, v99);
            }
            id v89 = v134;
          }
          else
          {
            id v93 = 0;
          }
          objc_msgSend(v89, sel_setTreatmentId_, v93);
          signed int v94 = [v72 deploymentId];
        }
        else
        {
          objc_msgSend(v89, sel_setTreatmentId_, 0);
          id v93 = 0;
          signed int v94 = -1;
        }
        objc_msgSend(v89, sel_setDeploymentId_, v94);
        id v100 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        unint64_t v101 = (void *)sub_25C700D00();
        id v102 = objc_msgSend(v100, sel_initWithNSUUID_, v101);

        objc_msgSend(v78, sel_setOdmId_, v102);
        objc_msgSend(v78, sel_setTrialExperimentIdentifiers_, v89);
        id v103 = objc_msgSend(self, sel_mainBundle);
        id v104 = objc_msgSend(v103, sel_infoDictionary);

        if (!v104)
        {
          long long v151 = 0u;
          long long v152 = 0u;
LABEL_145:
          uint64_t v108 = v78;
          sub_25C6F107C((uint64_t)&v151, &qword_26A5C7F28);
          goto LABEL_146;
        }
        uint64_t v105 = sub_25C701230();

        if (*(void *)(v105 + 16) && (unint64_t v106 = sub_25C6ED094(0xD00000000000001DLL, v120), (v107 & 1) != 0))
        {
          sub_25C6F1290(*(void *)(v105 + 56) + 32 * v106, (uint64_t)&v151);
        }
        else
        {
          long long v151 = 0u;
          long long v152 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((void *)&v152 + 1)) {
          goto LABEL_145;
        }
        uint64_t v108 = v78;
        if (swift_dynamicCast())
        {
          uint64_t v109 = v93;
          uint64_t v110 = v45;
          int64_t v111 = (void *)sub_25C701280();
          swift_bridgeObjectRelease();
          goto LABEL_147;
        }
LABEL_146:
        uint64_t v109 = v93;
        uint64_t v110 = v45;
        int64_t v111 = 0;
LABEL_147:
        objc_msgSend(v108, sel_setPluginVersion_, v111);

        objc_msgSend(v39, sel_setEventMetadata_, v108);
        id v112 = v140;
        objc_msgSend(v39, sel_setCountsReportedAll_, v140);
        id v113 = v39;
        MEMORY[0x2611912C0]();
        if (*(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C701330();
        }
        sub_25C701350();
        sub_25C701320();

        uint64_t v14 = v138;
        uint64_t v8 = v139;
        uint64_t v22 = v144;
        uint64_t v20 = v145;
        a1 = v128;
LABEL_7:

        uint64_t result = (*v146)(v150, v14);
        goto LABEL_8;
      }
    }
    unint64_t v57 = v55;
LABEL_47:

LABEL_48:
    uint64_t v55 = sub_25C701200();
    os_log_type_t v63 = sub_25C7013A0();
    if (os_log_type_enabled(v55, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_25C6E0000, v55, v63, "Unable to create ODMSiriSchemaODMSiriCountsAll SELF message", v64, 2u);
      uint64_t v65 = v64;
      unint64_t v37 = 0x2654B6000;
      MEMORY[0x261191AB0](v65, -1, -1);
    }
    goto LABEL_39;
  }
  int64_t v31 = v148 + 1;
  if (!__OFADD__(v148, 1))
  {
    if (v31 < v136)
    {
      unint64_t v32 = *(void *)(v133 + 8 * v31);
      if (v32)
      {
LABEL_14:
        int64_t v148 = v31;
        unint64_t v149 = (v32 - 1) & v32;
        unint64_t v28 = __clz(__rbit64(v32)) + (v31 << 6);
        goto LABEL_10;
      }
      int64_t v33 = v148 + 2;
      ++v148;
      if (v31 + 1 < v136)
      {
        unint64_t v32 = *(void *)(v133 + 8 * v33);
        if (v32)
        {
LABEL_17:
          int64_t v31 = v33;
          goto LABEL_14;
        }
        int64_t v148 = v31 + 1;
        if (v31 + 2 < v136)
        {
          unint64_t v32 = *(void *)(v133 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_14;
          }
          int64_t v33 = v31 + 3;
          int64_t v148 = v31 + 2;
          if (v31 + 3 < v136)
          {
            unint64_t v32 = *(void *)(v133 + 8 * v33);
            if (v32) {
              goto LABEL_17;
            }
            while (1)
            {
              int64_t v31 = v33 + 1;
              if (__OFADD__(v33, 1)) {
                goto LABEL_155;
              }
              if (v31 >= v136) {
                break;
              }
              unint64_t v32 = *(void *)(v133 + 8 * v31);
              ++v33;
              if (v32) {
                goto LABEL_14;
              }
            }
            int64_t v148 = v117;
          }
        }
      }
    }
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F38);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v20, 1, 1, v34);
    unint64_t v149 = 0;
    goto LABEL_29;
  }
  __break(1u);
LABEL_155:
  __break(1u);
  return result;
}

void *sub_25C6F85C0(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v31 - v5;
  uint64_t v7 = sub_25C700D20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7E8]), sel_init);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = (int *)type metadata accessor for ProcessedSiriTurn();
    sub_25C6F9428(v34 + v16[5], (uint64_t)v6);
    int64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    if (v33(v6, 1, v7) == 1)
    {
      sub_25C6F107C((uint64_t)v6, &qword_26A5C7BD8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
      id v20 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v21 = sub_25C700D00();
      unint64_t v32 = v11;
      uint64_t v22 = (void *)v21;
      id v23 = objc_msgSend(v20, sel_initWithNSUUID_, v21);

      uint64_t v11 = v32;
      objc_msgSend(v15, sel_setCurrentTurnId_, v23);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    sub_25C6F9428(v34 + v16[6], (uint64_t)v4);
    if (v33(v4, 1, v7) == 1)
    {
      sub_25C6F107C((uint64_t)v4, &qword_26A5C7BD8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v4, v7);
      id v24 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v25 = (void *)sub_25C700D00();
      id v26 = objc_msgSend(v24, sel_initWithNSUUID_, v25);

      objc_msgSend(v15, sel_setNextTurnId_, v26);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
    int v27 = *(unsigned __int8 *)(v34 + v16[7]);
    if (v27 != 2) {
      objc_msgSend(v15, sel_setIsUserRequest_, v27 & 1);
    }
    uint64_t v28 = v34 + v16[8];
    if ((*(unsigned char *)(v28 + 8) & 1) == 0) {
      objc_msgSend(v15, sel_setUtteranceRestatementScore_, *(double *)v28);
    }
    uint64_t v29 = v34 + v16[9];
    if ((*(unsigned char *)(v29 + 8) & 1) == 0) {
      objc_msgSend(v15, sel_setPhoneticRestatementScore_, *(double *)v29);
    }
  }
  else
  {
    uint64_t v17 = sub_25C701200();
    os_log_type_t v18 = sub_25C7013A0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25C6E0000, v17, v18, "Unable to create ODMSiriSchemaODMSiriTurnRestatementScore SELF message", v19, 2u);
      MEMORY[0x261191AB0](v19, -1, -1);
    }

    return 0;
  }
  return v15;
}

uint64_t sub_25C6F89E8(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(type metadata accessor for ProcessedSiriTurn() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v7 = sub_25C6F85C0(v5);
      if (v7)
      {
        id v8 = v7;
        MEMORY[0x2611912C0]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C701330();
        }
        sub_25C701350();
        sub_25C701320();
      }
      v5 += v6;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

unint64_t _s15SiriCoreMetrics0abC20SELFMessageConverterO27convertToODMSiriClientEvent21processedConversation5odmId6loggerSo0h6SchemahiJ0CSgAA09ProcessedaL0V_10Foundation4UUIDV2os6LoggerVtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C700D20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F20);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A8]), sel_init);
  if (!v14) {
    return (unint64_t)v14;
  }
  uint64_t v67 = v10;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7D0]), sel_init);
  if (!v15) {
    goto LABEL_42;
  }
  uint64_t v16 = v15;
  uint64_t v66 = v8;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F0]), sel_init);
  if (!v17)
  {

    return 0;
  }
  os_log_type_t v18 = v17;
  uint64_t v65 = v7;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F8]), sel_init);
  if (!v19)
  {

    return 0;
  }
  id v20 = v19;
  uint64_t v64 = a2;
  unint64_t result = sub_25C6F89E8(a1);
  unint64_t v22 = result;
  if (!(result >> 62))
  {
    uint64_t v23 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v23) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
  unint64_t result = sub_25C701480();
  uint64_t v23 = result;
  if (!result)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    uint64_t v59 = sub_25C701200();
    os_log_type_t v60 = sub_25C701380();
    if (os_log_type_enabled(v59, v60))
    {
      id v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v61 = 0;
      _os_log_impl(&dword_25C6E0000, v59, v60, "No restatement scores to report", v61, 2u);
      MEMORY[0x261191AB0](v61, -1, -1);
    }

LABEL_42:
    return 0;
  }
LABEL_7:
  id v62 = v20;
  os_log_type_t v63 = v16;
  if (v23 >= 1)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if ((v22 & 0xC000000000000001) != 0) {
        id v25 = (id)MEMORY[0x261191400](i, v22);
      }
      else {
        id v25 = *(id *)(v22 + 8 * i + 32);
      }
      id v26 = v25;
      objc_msgSend(v18, sel_addSiriTurnRestatementScores_, v25, v62);
    }
    swift_bridgeObjectRelease();
    sub_25C700FD0();
    uint64_t v27 = sub_25C700FF0();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v13, 1, v27) == 1)
    {
      sub_25C6F107C((uint64_t)v13, &qword_26A5C7F20);
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = (void *)sub_25C700FE0();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v27);
      id v31 = objc_msgSend(v30, sel_bmltTaskId);
      sub_25C701290();

      uint64_t v29 = (void *)sub_25C701280();
      swift_bridgeObjectRelease();
    }
    id v33 = v62;
    unint64_t v32 = v63;
    objc_msgSend(v62, sel_setExperimentId_, v29);

    unint64_t v34 = 0x263F6E000;
    unint64_t v35 = 0x2654B6000;
    if (v30)
    {
      id v36 = objc_msgSend(v30, sel_treatmentId);
      if (v36)
      {
        unint64_t v37 = v36;
        sub_25C701290();

        sub_25C700CE0();
        swift_bridgeObjectRelease();
        uint64_t v38 = v65;
        uint64_t v39 = v66;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v6, 1, v65) == 1)
        {
          sub_25C6F107C((uint64_t)v6, &qword_26A5C7BD8);
          id v40 = 0;
          unint64_t v35 = 0x2654B6000;
          unint64_t v34 = 0x263F6E000;
        }
        else
        {
          id v42 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
          os_log_type_t v63 = v30;
          uint64_t v43 = v67;
          v42(v67, v6, v38);
          id v44 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          uint64_t v45 = (void *)sub_25C700D00();
          uint64_t v46 = v44;
          unint64_t v34 = 0x263F6E000uLL;
          id v40 = objc_msgSend(v46, sel_initWithNSUUID_, v45);

          uint64_t v47 = v43;
          uint64_t v30 = v63;
          uint64_t v48 = v38;
          unint64_t v35 = 0x2654B6000uLL;
          (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v48);
        }
      }
      else
      {
        id v40 = 0;
      }
      objc_msgSend(v33, sel_setTreatmentId_, v40);
      uint64_t v41 = (int)objc_msgSend(v30, sel_deploymentId);
    }
    else
    {
      objc_msgSend(v33, sel_setTreatmentId_, 0);
      id v40 = 0;
      uint64_t v41 = -1;
    }
    objc_msgSend(v33, sel_setDeploymentId_, v41);
    id v49 = objc_allocWithZone(*(Class *)(v34 + 3808));
    uint64_t v50 = (void *)sub_25C700D00();
    id v51 = objc_msgSend(v49, *(SEL *)(v35 + 3432), v50);

    objc_msgSend(v32, sel_setOdmId_, v51);
    objc_msgSend(v32, sel_setTrialExperimentIdentifiers_, v33);
    id v52 = objc_msgSend(self, sel_mainBundle);
    id v53 = objc_msgSend(v52, sel_infoDictionary);

    if (v53)
    {
      uint64_t v54 = sub_25C701230();

      if (*(void *)(v54 + 16) && (unint64_t v55 = sub_25C6ED094(0xD00000000000001DLL, 0x800000025C703BC0), (v56 & 1) != 0))
      {
        sub_25C6F1290(*(void *)(v54 + 56) + 32 * v55, (uint64_t)&v68);
      }
      else
      {
        long long v68 = 0u;
        long long v69 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v69 + 1))
      {
        if (swift_dynamicCast())
        {
          unint64_t v57 = (void *)sub_25C701280();
          swift_bridgeObjectRelease();
LABEL_37:
          objc_msgSend(v32, sel_setPluginVersion_, v57);

          objc_msgSend(v14, sel_setEventMetadata_, v32);
          id v58 = v18;
          objc_msgSend(v14, sel_setTurnRestatementScoresReported_, v58);

          return (unint64_t)v14;
        }
LABEL_36:
        unint64_t v57 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      long long v68 = 0u;
      long long v69 = 0u;
    }
    sub_25C6F107C((uint64_t)&v68, &qword_26A5C7F28);
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C6F92BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C6F92E8()
{
  return type metadata accessor for SiriCoreMetricsSELFReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsSELFReporter()
{
  uint64_t result = qword_26A5C7F10;
  if (!qword_26A5C7F10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6F933C()
{
  uint64_t result = sub_25C700D20();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C701220();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsSELFMessageConverter()
{
  return &type metadata for SiriCoreMetricsSELFMessageConverter;
}

uint64_t sub_25C6F9428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6F9490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6F94FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SiriCoreMetricsJsonLoggingReporter.jsonResult.getter()
{
  return swift_bridgeObjectRetain();
}

void *SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE.unsafeMutableAddressor()
{
  return &static SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE;
}

uint64_t static SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE.getter()
{
  return 0;
}

void *SiriCoreMetricsJsonLoggingReporter.FILE_PATH.unsafeMutableAddressor()
{
  return &static SiriCoreMetricsJsonLoggingReporter.FILE_PATH;
}

unint64_t static SiriCoreMetricsJsonLoggingReporter.FILE_PATH.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_25C6E9964(MEMORY[0x263F8EE78]);
  uint64_t v3 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  uint64_t v4 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.init(_:)(uint64_t a1)
{
  swift_retain();
  *(void *)(v1 + 16) = sub_25C6E9964(MEMORY[0x263F8EE78]);
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  uint64_t v4 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  swift_release();
  return v1;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.report(_:)(uint64_t a1)
{
  v2[56] = a1;
  v2[57] = v1;
  sub_25C7012C0();
  v2[58] = swift_task_alloc();
  sub_25C700BE0();
  v2[59] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6F97B8, 0, 0);
}

uint64_t sub_25C6F97B8()
{
  id v36 = v0;
  uint64_t v2 = (uint64_t *)v0[56];
  uint64_t v1 = v0[57];
  sub_25C700C20();
  swift_allocObject();
  sub_25C700C10();
  sub_25C700BD0();
  sub_25C700BF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C702850;
  *(void *)(inited + 32) = 0xD000000000000016;
  *(void *)(inited + 40) = 0x800000025C703EF0;
  uint64_t v4 = *v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F58);
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0xD000000000000011;
  *(void *)(inited + 88) = 0x800000025C703F10;
  uint64_t v6 = v2[1];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F60);
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 128) = 0x756F436C61746F74;
  *(void *)(inited + 136) = 0xEB0000000073746ELL;
  uint64_t v8 = v2[4];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F68);
  *(void *)(inited + 144) = v8;
  *(void *)(inited + 168) = v9;
  *(void *)(inited + 176) = 0xD000000000000011;
  *(void *)(inited + 184) = 0x800000025C703F30;
  uint64_t v10 = v2[5];
  *(void *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F70);
  *(void *)(inited + 192) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_25C6E9964(inited);
  swift_beginAccess();
  *(void *)(v1 + 16) = v11;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F78);
  uint64_t v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_25C702850;
  *(void *)(v12 + 32) = 0xD000000000000016;
  *(void *)(v12 + 40) = 0x800000025C703EF0;
  *(void *)(v12 + 48) = MEMORY[0x2611912D0](v4, &type metadata for ProcessedSiriConversation);
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = 0xD000000000000011;
  *(void *)(v12 + 72) = 0x800000025C703F10;
  sub_25C700EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F80);
  sub_25C6F9EC8();
  *(void *)(v12 + 80) = sub_25C701240();
  *(void *)(v12 + 88) = v14;
  *(void *)(v12 + 96) = 0x756F436C61746F74;
  *(void *)(v12 + 104) = 0xEB0000000073746ELL;
  *(void *)(v12 + 112) = sub_25C701240();
  *(void *)(v12 + 120) = v15;
  *(void *)(v12 + 128) = 0xD000000000000011;
  *(void *)(v12 + 136) = 0x800000025C703F30;
  *(void *)(v12 + 144) = sub_25C701240();
  *(void *)(v12 + 152) = v16;
  v0[53] = sub_25C6E9A9C(v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F88);
  sub_25C6F9F20();
  uint64_t v17 = sub_25C700C00();
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  sub_25C7012B0();
  uint64_t v20 = sub_25C7012A0();
  if (v21)
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    swift_bridgeObjectRetain();
    id v24 = sub_25C701200();
    os_log_type_t v25 = sub_25C701390();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v34 = v22;
      id v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v35 = v27;
      *(_DWORD *)id v26 = 136315138;
      swift_bridgeObjectRetain();
      v0[55] = sub_25C6EC85C(v34, v23, &v35);
      sub_25C7013C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C6E0000, v24, v25, "json_string=%s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261191AB0](v27, -1, -1);
      MEMORY[0x261191AB0](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v28 = sub_25C701200();
    os_log_type_t v29 = sub_25C7013A0();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_10;
    }
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    id v31 = "Unable to convert JSON string to data.";
  }
  else
  {
    uint64_t v28 = sub_25C701200();
    os_log_type_t v29 = sub_25C7013A0();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_10;
    }
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    id v31 = "Extracting results to JSON failed";
  }
  _os_log_impl(&dword_25C6E0000, v28, v29, v31, v30, 2u);
  MEMORY[0x261191AB0](v30, -1, -1);
LABEL_10:
  sub_25C6E5E18(v17, v19);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

unint64_t sub_25C6F9EC8()
{
  unint64_t result = qword_26A5C7D88;
  if (!qword_26A5C7D88)
  {
    sub_25C700EC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7D88);
  }
  return result;
}

unint64_t sub_25C6F9F20()
{
  unint64_t result = qword_26A5C7F90;
  if (!qword_26A5C7F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C7F88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7F90);
  }
  return result;
}

uint64_t sub_25C6F9F8C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  uint64_t v2 = sub_25C701220();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t SiriCoreMetricsJsonLoggingReporter.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C6FA114@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C6FA164()
{
  return type metadata accessor for SiriCoreMetricsJsonLoggingReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsJsonLoggingReporter()
{
  uint64_t result = qword_26A5C7F98;
  if (!qword_26A5C7F98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6FA1B8()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t SiriCoreMetricsReporter.deinit()
{
  return v0;
}

uint64_t SiriCoreMetricsReporter.report(_:)()
{
  return MEMORY[0x270FA2498](sub_25C6FA27C, 0, 0);
}

uint64_t sub_25C6FA27C()
{
  return sub_25C701470();
}

uint64_t SiriCoreMetricsReporter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25C6FA30C(_OWORD *a1)
{
  long long v3 = a1[1];
  *(_OWORD *)(v2 + 16) = *a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = a1[2];
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 80) + **(int **)(**(void **)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C6FA424;
  return v6(v2 + 16);
}

uint64_t sub_25C6FA424()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for SiriCoreMetricsReporter()
{
  return self;
}

uint64_t SiriCoreMetricsSELFReporterV2.__allocating_init(stream:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
  *(void *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = a1;
  return v4;
}

uint64_t SiriCoreMetricsSELFReporterV2.init(stream:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  uint64_t v6 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
  *(void *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = a1;
  return v2;
}

uint64_t SiriCoreMetricsSELFReporterV2.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = sub_25C700D20();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6FA720, 0, 0);
}

uint64_t sub_25C6FA720()
{
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
  unint64_t v4 = sub_25C6FB048(v3, v1, v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(*(id *)(v0[6] + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream), sel_emitMessage_, v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25C701200();
    os_log_type_t v7 = sub_25C701390();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = v0[5];
    if (v8)
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134217984;
      v0[2] = *(void *)(v9 + 16);
      sub_25C7013C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C6E0000, v6, v7, "marker: reported %ld Siri turns from this run", v10, 0xCu);
      MEMORY[0x261191AB0](v10, -1, -1);
      unint64_t v11 = v6;
      uint64_t v6 = v5;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v11 = v5;
    }
  }
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t SiriCoreMetricsSELFReporterV2.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t SiriCoreMetricsSELFReporterV2.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C6FAA3C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25C6FAAE8;
  return SiriCoreMetricsSELFReporterV2.report(_:)(v2, v3, v4);
}

uint64_t sub_25C6FAAE8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C6FABE0(uint64_t a1, uint64_t a2)
{
  v29[1] = a2;
  uint64_t v3 = sub_25C700D20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v30 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v36 = a1;
  uint64_t v37 = MEMORY[0x263F8EE78];
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v10;
  uint64_t v34 = v4 + 16;
  uint64_t v35 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v33 = v4 + 48;
  int64_t v31 = (unint64_t)(v11 + 63) >> 6;
  unint64_t v32 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v21 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_25;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v23 >= v31) {
      goto LABEL_29;
    }
    unint64_t v24 = *(void *)(v30 + 8 * v23);
    ++v15;
    if (!v24)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v31) {
        goto LABEL_29;
      }
      unint64_t v24 = *(void *)(v30 + 8 * v15);
      if (!v24)
      {
        int64_t v15 = v23 + 2;
        if (v23 + 2 >= v31) {
          goto LABEL_29;
        }
        unint64_t v24 = *(void *)(v30 + 8 * v15);
        if (!v24) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, *(void *)(v36 + 48) + *(void *)(v4 + 72) * v22, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1) {
      goto LABEL_30;
    }
    (*v32)(v6, v9, v3);
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7E8]), sel_init);
    if (v26)
    {
      uint64_t v16 = v26;
      id v17 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      unint64_t v18 = (void *)sub_25C700D00();
      id v19 = objc_msgSend(v17, sel_initWithNSUUID_, v18);

      objc_msgSend(v16, sel_setCurrentTurnId_, v19);
      uint64_t v20 = v16;
      MEMORY[0x2611912C0]();
      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25C701330();
      }
      sub_25C701350();
      sub_25C701320();
    }
    else
    {
      uint64_t v20 = sub_25C701200();
      os_log_type_t v27 = sub_25C7013A0();
      if (os_log_type_enabled(v20, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_25C6E0000, v20, v27, "Unable to create ODMSiriSchemaODMSiriTurnRestatementScore SELF message", v28, 2u);
        MEMORY[0x261191AB0](v28, -1, -1);
      }
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v31)
  {
LABEL_29:
    (*v35)(v9, 1, 1, v3);
LABEL_30:
    swift_release();
    return v37;
  }
  unint64_t v24 = *(void *)(v30 + 8 * v25);
  if (v24)
  {
    int64_t v15 = v25;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v15 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v15 >= v31) {
      goto LABEL_29;
    }
    unint64_t v24 = *(void *)(v30 + 8 * v15);
    ++v25;
    if (v24) {
      goto LABEL_24;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_25C6FB048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7BD8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C700D20();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7F20);
  MEMORY[0x270FA5388](v13 - 8);
  int64_t v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A8]), sel_init);
  if (!v16) {
    return (unint64_t)v16;
  }
  long long v69 = v12;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7D0]), sel_init);
  if (!v17) {
    goto LABEL_42;
  }
  unint64_t v18 = v17;
  uint64_t v68 = v10;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F0]), sel_init);
  if (!v19)
  {

    return 0;
  }
  uint64_t v20 = v19;
  uint64_t v67 = v9;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F8]), sel_init);
  if (!v21)
  {

    return 0;
  }
  unint64_t v22 = v21;
  uint64_t v66 = a2;
  unint64_t result = sub_25C6FABE0(a1, a3);
  unint64_t v24 = result;
  if (!(result >> 62))
  {
    uint64_t v25 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v25) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
  unint64_t result = sub_25C701480();
  uint64_t v25 = result;
  if (!result)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    id v61 = sub_25C701200();
    os_log_type_t v62 = sub_25C701380();
    if (os_log_type_enabled(v61, v62))
    {
      os_log_type_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v63 = 0;
      _os_log_impl(&dword_25C6E0000, v61, v62, "No restatement scores to report", v63, 2u);
      MEMORY[0x261191AB0](v63, -1, -1);
    }

LABEL_42:
    return 0;
  }
LABEL_7:
  id v64 = v22;
  uint64_t v65 = v18;
  if (v25 >= 1)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if ((v24 & 0xC000000000000001) != 0) {
        id v27 = (id)MEMORY[0x261191400](i, v24);
      }
      else {
        id v27 = *(id *)(v24 + 8 * i + 32);
      }
      uint64_t v28 = v27;
      objc_msgSend(v20, sel_addSiriTurnRestatementScores_, v27, v64);
    }
    swift_bridgeObjectRelease();
    sub_25C700FD0();
    uint64_t v29 = sub_25C700FF0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v15, 1, v29) == 1)
    {
      sub_25C6F107C((uint64_t)v15, &qword_26A5C7F20);
      int64_t v31 = 0;
      unint64_t v32 = 0;
    }
    else
    {
      unint64_t v32 = (void *)sub_25C700FE0();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v29);
      id v33 = objc_msgSend(v32, sel_bmltTaskId);
      sub_25C701290();

      int64_t v31 = (void *)sub_25C701280();
      swift_bridgeObjectRelease();
    }
    id v35 = v64;
    uint64_t v34 = v65;
    objc_msgSend(v64, sel_setExperimentId_, v31);

    unint64_t v36 = 0x263F6E000;
    unint64_t v37 = 0x2654B6000;
    if (v32)
    {
      id v38 = objc_msgSend(v32, sel_treatmentId);
      if (v38)
      {
        uint64_t v39 = v38;
        sub_25C701290();

        sub_25C700CE0();
        swift_bridgeObjectRelease();
        uint64_t v40 = v67;
        uint64_t v41 = v68;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v8, 1, v67) == 1)
        {
          sub_25C6F107C((uint64_t)v8, &qword_26A5C7BD8);
          id v42 = 0;
          unint64_t v37 = 0x2654B6000;
          unint64_t v36 = 0x263F6E000;
        }
        else
        {
          id v44 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
          uint64_t v65 = v32;
          uint64_t v45 = v69;
          v44(v69, v8, v40);
          id v46 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          uint64_t v47 = (void *)sub_25C700D00();
          uint64_t v48 = v46;
          unint64_t v36 = 0x263F6E000uLL;
          id v42 = objc_msgSend(v48, sel_initWithNSUUID_, v47);

          id v49 = v45;
          unint64_t v32 = v65;
          uint64_t v50 = v40;
          unint64_t v37 = 0x2654B6000uLL;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v49, v50);
        }
      }
      else
      {
        id v42 = 0;
      }
      objc_msgSend(v35, sel_setTreatmentId_, v42);
      uint64_t v43 = (int)objc_msgSend(v32, sel_deploymentId);
    }
    else
    {
      objc_msgSend(v35, sel_setTreatmentId_, 0);
      id v42 = 0;
      uint64_t v43 = -1;
    }
    objc_msgSend(v35, sel_setDeploymentId_, v43);
    id v51 = objc_allocWithZone(*(Class *)(v36 + 3808));
    id v52 = (void *)sub_25C700D00();
    id v53 = objc_msgSend(v51, *(SEL *)(v37 + 3432), v52);

    objc_msgSend(v34, sel_setOdmId_, v53);
    objc_msgSend(v34, sel_setTrialExperimentIdentifiers_, v35);
    id v54 = objc_msgSend(self, sel_mainBundle);
    id v55 = objc_msgSend(v54, sel_infoDictionary);

    if (v55)
    {
      uint64_t v56 = sub_25C701230();

      if (*(void *)(v56 + 16) && (unint64_t v57 = sub_25C6ED094(0xD00000000000001DLL, 0x800000025C703BC0), (v58 & 1) != 0))
      {
        sub_25C6F1290(*(void *)(v56 + 56) + 32 * v57, (uint64_t)&v70);
      }
      else
      {
        long long v70 = 0u;
        long long v71 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v71 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v59 = (void *)sub_25C701280();
          swift_bridgeObjectRelease();
LABEL_37:
          objc_msgSend(v34, sel_setPluginVersion_, v59);

          objc_msgSend(v16, sel_setEventMetadata_, v34);
          id v60 = v20;
          objc_msgSend(v16, sel_setTurnRestatementScoresReported_, v60);

          return (unint64_t)v16;
        }
LABEL_36:
        uint64_t v59 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
    }
    sub_25C6F107C((uint64_t)&v70, &qword_26A5C7F28);
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C6FB7DC()
{
  return type metadata accessor for SiriCoreMetricsSELFReporterV2();
}

uint64_t type metadata accessor for SiriCoreMetricsSELFReporterV2()
{
  uint64_t result = qword_26A5C7FD8;
  if (!qword_26A5C7FD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6FB830()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsSELFMessageConverterV2()
{
  return &type metadata for SiriCoreMetricsSELFMessageConverterV2;
}

uint64_t SiriCoreMetricsBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  uint64_t v7 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  uint64_t v8 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  uint64_t v9 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  uint64_t v10 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  return v6;
}

uint64_t SiriCoreMetricsBiomeReporter.init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  uint64_t v7 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a2, v7);
  uint64_t v8 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  uint64_t v9 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a3, v9);
  return v3;
}

uint64_t SiriCoreMetricsBiomeReporter.report(_:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_25C700EC0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D30);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6FBB7C, 0, 0);
}

uint64_t sub_25C6FBB7C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v0[2] + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v30 = v2 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  uint64_t v32 = v0[5];
  uint64_t v7 = (void (**)(uint64_t, void, uint64_t))(v1 + 32);
  uint64_t v8 = (uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  int64_t v31 = (unint64_t)(63 - v5) >> 6;
  uint64_t v33 = *(void *)(v0[2] + 32);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v11 = &qword_26A5C7D38;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v18 = v17 | (v10 << 6);
  while (2)
  {
    uint64_t v19 = v0[7];
    (*(void (**)(uint64_t, unint64_t, void))(v32 + 16))(v19, *(void *)(v33 + 48) + *(void *)(v32 + 72) * v18, v0[4]);
    uint64_t v20 = *(void *)(v33 + 56);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(v11);
    *(void *)(v19 + *(int *)(v21 + 48)) = *(void *)(v20 + 8 * v18);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 0, 1, v21);
    while (1)
    {
      uint64_t v27 = v0[8];
      sub_25C6FBF2C(v0[7], v27);
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(v11);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v27, 1, v28) == 1)
      {
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v29 = (uint64_t (*)(void))v0[1];
        return v29();
      }
      uint64_t v12 = v0[6];
      uint64_t v13 = v11;
      uint64_t v14 = v0[4];
      (*v7)(v12, v0[8], v14);
      id v15 = _s15SiriCoreMetrics0abC13BiomeReporterC06createdA18RequestCountsEvent5odmId19aggregationInterval07requestH0So06BMSirigH0C10Foundation4UUIDV_11DeepThought011AggregationM0VAA0agH0VtFZ_0();
      sub_25C700E30();

      uint64_t v16 = v14;
      uint64_t v11 = v13;
      uint64_t result = (*v8)(v12, v16);
      if (v6) {
        goto LABEL_6;
      }
LABEL_8:
      int64_t v22 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v22 < v31)
      {
        unint64_t v23 = *(void *)(v30 + 8 * v22);
        if (v23) {
          goto LABEL_11;
        }
        int64_t v24 = v10 + 2;
        ++v10;
        if (v22 + 1 < v31)
        {
          unint64_t v23 = *(void *)(v30 + 8 * v24);
          if (v23) {
            goto LABEL_14;
          }
          int64_t v10 = v22 + 1;
          if (v22 + 2 < v31)
          {
            unint64_t v23 = *(void *)(v30 + 8 * (v22 + 2));
            if (v23)
            {
              v22 += 2;
              goto LABEL_11;
            }
            int64_t v24 = v22 + 3;
            int64_t v10 = v22 + 2;
            if (v22 + 3 < v31) {
              break;
            }
          }
        }
      }
LABEL_25:
      uint64_t v25 = v0[7];
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
      unint64_t v6 = 0;
    }
    unint64_t v23 = *(void *)(v30 + 8 * v24);
    if (v23)
    {
LABEL_14:
      int64_t v22 = v24;
LABEL_11:
      unint64_t v6 = (v23 - 1) & v23;
      unint64_t v18 = __clz(__rbit64(v23)) + (v22 << 6);
      int64_t v10 = v22;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v22 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v22 >= v31)
    {
      int64_t v10 = v31 - 1;
      goto LABEL_25;
    }
    unint64_t v23 = *(void *)(v30 + 8 * v22);
    ++v24;
    if (v23) {
      goto LABEL_11;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25C6FBF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static BMSiriRequestCountsMetadataSchedule.fromIntervalInDays(intervalInDays:)(int a1)
{
  if (a1 == 7) {
    int v1 = 2;
  }
  else {
    int v1 = 0;
  }
  if (a1 == 30) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t sub_25C6FBFBC()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  uint64_t v4 = sub_25C700D20();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t SiriCoreMetricsBiomeReporter.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  uint64_t v4 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetricsBiomeReporter.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  uint64_t v4 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

id _s15SiriCoreMetrics0abC13BiomeReporterC06createdA18RequestCountsEvent5odmId19aggregationInterval07requestH0So06BMSirigH0C10Foundation4UUIDV_11DeepThought011AggregationM0VAA0agH0VtFZ_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C7D90);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25C700CD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C700E80();
  sub_25C700C70();
  int v7 = sub_25C700EA0();
  if (v7 == 7) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = v7 == 1;
  }
  if (v7 == 30) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v8;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v6, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_25C700CF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    int64_t v10 = 0;
  }
  else
  {
    int64_t v10 = (void *)sub_25C700CB0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  id v11 = objc_allocWithZone(MEMORY[0x263F2A4C0]);
  uint64_t v12 = (void *)sub_25C701280();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithSchedule_aggregationWindowStartTimestamp_odmId_, v9, v10, v12);

  uint64_t v14 = (void *)sub_25C701640();
  id v15 = (void *)sub_25C701640();
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A4C8]), sel_initWithAllRequestCount_userRequestCount_, v14, v15);

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A4B8]), sel_initWithMetadata_statistics_, v13, v16);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v17;
}

uint64_t sub_25C6FC4D8()
{
  return type metadata accessor for SiriCoreMetricsBiomeReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsBiomeReporter()
{
  uint64_t result = qword_26A5C8000;
  if (!qword_26A5C8000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6FC52C()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C700D20();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t static SiriCoreMetricsError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t SiriCoreMetricsError.hash(into:)()
{
  return sub_25C701620();
}

uint64_t SiriCoreMetricsError.hashValue.getter()
{
  return sub_25C701630();
}

uint64_t SiriCoreMetricsV2.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SiriCoreMetricsV2.init()();
  return v0;
}

uint64_t SiriCoreMetricsV2.init()()
{
  uint64_t v1 = sub_25C700DC0();
  uint64_t v55 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v53 = (char *)v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_25C700CD0();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v4 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C701220();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v51 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v56 = (char *)v46 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v46 - v11;
  uint64_t v61 = v0;
  uint64_t v13 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  sub_25C701210();
  id v14 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v15 = (void *)sub_25C701280();
  id v16 = objc_msgSend(v14, sel_initWithSuiteName_, v15);

  if (!v16)
  {
    uint64_t v25 = sub_25C701200();
    os_log_type_t v26 = sub_25C7013A0();
    uint64_t v23 = v13;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25C6E0000, v25, v26, "Can't get user defaults initialized", v27, 2u);
      uint64_t v28 = v27;
      uint64_t v23 = v13;
      MEMORY[0x261191AB0](v28, -1, -1);
    }

    sub_25C6FCED4();
    swift_allocError();
    swift_willThrow();
    uint64_t v24 = v61;
    uint64_t v22 = v6;
    goto LABEL_8;
  }
  uint64_t v49 = v1;
  uint64_t v17 = sub_25C701150();
  swift_allocObject();
  id v18 = v16;
  uint64_t v19 = sub_25C701140();
  uint64_t v59 = v17;
  uint64_t v60 = MEMORY[0x263F396C0];
  uint64_t v58 = v19;
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v50(v12, v13, v5);
  sub_25C700F40();
  swift_allocObject();
  uint64_t v20 = v57;
  uint64_t v21 = sub_25C700F00();
  uint64_t v22 = v6;
  uint64_t v23 = v13;
  if (v20)
  {

    uint64_t v24 = v61;
LABEL_8:
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v5);
    type metadata accessor for SiriCoreMetricsV2();
    swift_deallocPartialClassInstance();
    return v24;
  }
  id v47 = v18;
  uint64_t v48 = v6;
  uint64_t v29 = v21;
  sub_25C701010();
  uint64_t v30 = v53;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_25C700F30();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v30, v49);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v4, v54);
  v50(v56, v13, v5);
  id v31 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v32 = objc_msgSend(v31, sel_PrivateLearning);
  swift_unknownObjectRelease();
  id v33 = objc_msgSend(v32, sel_SELFEvent);
  uint64_t v34 = v5;
  uint64_t v57 = v13;
  id v35 = v33;
  swift_unknownObjectRelease();
  objc_msgSend(v35, sel_source);

  uint64_t v36 = v29;
  sub_25C700EE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8020);
  swift_allocObject();
  uint64_t v38 = sub_25C700E60();
  uint64_t v24 = v61;
  *(void *)(v61 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsDataProvider) = v38;
  uint64_t v39 = v51;
  v50(v51, v57, v34);
  type metadata accessor for SiriCoreMetricsCalculatorV2();
  uint64_t v40 = swift_allocObject();
  v46[1] = v36;
  swift_retain();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v56 = *(char **)(v48 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v56)(v40 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger, v39, v34);
  *(void *)(v40 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = v36;
  *(void *)(v24 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsCalculator) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8038);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_25C702A00;
  id v42 = objc_msgSend(self, sel_sharedAnalytics);
  id v43 = objc_msgSend(v42, sel_defaultMessageStream);

  v50(v39, v57, v34);
  type metadata accessor for SiriCoreMetricsSELFReporterV2();
  uint64_t v44 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v56)(v44 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger, v39, v34);
  *(void *)(v44 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = v43;
  *(void *)(v41 + 32) = v44;
  uint64_t v58 = v41;
  sub_25C701320();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8040);
  swift_allocObject();
  uint64_t v58 = sub_25C700E40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8048);
  swift_allocObject();
  uint64_t v45 = sub_25C700E70();

  *(void *)(v24 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsReporter) = v45;
  return v24;
}

unint64_t sub_25C6FCED4()
{
  unint64_t result = qword_26A5C8018;
  if (!qword_26A5C8018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C8018);
  }
  return result;
}

uint64_t type metadata accessor for SiriCoreMetricsV2()
{
  uint64_t result = qword_26A5C80A8;
  if (!qword_26A5C80A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriCoreMetricsV2.loadData()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25C6FCF94, 0, 0);
}

uint64_t sub_25C6FCF94()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395C8] + MEMORY[0x263F395C8]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6FD04C;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4(v2);
}

uint64_t sub_25C6FD04C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t SiriCoreMetricsV2.doWork(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25C6FD160, 0, 0);
}

uint64_t sub_25C6FD160()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6FD208;
  uint64_t v2 = *(void *)(v0 + 16);
  return SiriCoreMetricsCalculatorV2.doWork(_:)(v2);
}

uint64_t sub_25C6FD208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *v4;
  uint64_t v8 = swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 8);
  if (!v3)
  {
    uint64_t v8 = a1;
    uint64_t v9 = a2;
    uint64_t v10 = a3;
  }
  return v11(v8, v9, v10);
}

uint64_t SiriCoreMetricsV2.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  return MEMORY[0x270FA2498](sub_25C6FD344, 0, 0);
}

uint64_t sub_25C6FD344()
{
  uint64_t v1 = *(void *)(v0 + 56);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395D8] + MEMORY[0x263F395D8]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C6FD40C;
  return v4(v0 + 16);
}

uint64_t sub_25C6FD40C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C6FD540, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C6FD540()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriCoreMetricsV2.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsV2.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C6FD6BC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25C6FCF94, 0, 0);
}

uint64_t sub_25C6FD6E0(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_25C6FD708, 0, 0);
}

uint64_t sub_25C6FD708()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6FD7B0;
  uint64_t v2 = *(void *)(v0 + 24);
  return SiriCoreMetricsCalculatorV2.doWork(_:)(v2);
}

uint64_t sub_25C6FD7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    uint64_t v10 = *(void **)(v8 + 16);
    *uint64_t v10 = a1;
    v10[1] = a2;
    v10[2] = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_25C6FD8D4(uint64_t a1)
{
  *(_OWORD *)(v2 + 40) = *(_OWORD *)a1;
  uint64_t v3 = *v1;
  *(void *)(v2 + 56) = *(void *)(a1 + 16);
  *(void *)(v2 + 64) = v3;
  return MEMORY[0x270FA2498](sub_25C6FD344, 0, 0);
}

unint64_t sub_25C6FD908()
{
  unint64_t result = qword_26A5C8070;
  if (!qword_26A5C8070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C8070);
  }
  return result;
}

uint64_t sub_25C6FD95C()
{
  return sub_25C6FD9F8(&qword_26A5C8078);
}

uint64_t sub_25C6FD990()
{
  return sub_25C6FD9F8(&qword_26A5C8080);
}

uint64_t sub_25C6FD9C4()
{
  return sub_25C6FD9F8(qword_26A5C8088);
}

uint64_t sub_25C6FD9F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriCoreMetricsV2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SiriCoreMetricsError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C6FDAD8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsError()
{
  return &type metadata for SiriCoreMetricsError;
}

uint64_t sub_25C6FDB10()
{
  return type metadata accessor for SiriCoreMetricsV2();
}

uint64_t sub_25C6FDB18()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t SiriCoreMetricsDataRecord.featurizedConversationData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C700F80();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t SiriCoreMetricsDataRecord.previousRequestCounts.getter()
{
  type metadata accessor for SiriCoreMetricsDataRecord(0);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SiriCoreMetricsDataRecord(uint64_t a1)
{
  return sub_25C6F4474(a1, (uint64_t *)&unk_26A5C80E0);
}

uint64_t SiriCoreMetricsDataProvider.__allocating_init(conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = a1;
  uint64_t v7 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  uint64_t v8 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a3, v8);
  *(void *)(v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = a2;
  return v6;
}

uint64_t SiriCoreMetricsDataProvider.init(conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = a1;
  uint64_t v6 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  uint64_t v7 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a3, v7);
  *(void *)(v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = a2;
  return v3;
}

uint64_t SiriCoreMetricsDataProvider.loadData()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_25C700F80();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = sub_25C700FA0();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v5 = sub_25C700CD0();
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v6 = sub_25C700DC0();
  v2[13] = v6;
  v2[14] = *(void *)(v6 - 8);
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C6FDF80, 0, 0);
}

uint64_t sub_25C6FDF80()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_25C701010();
  sub_25C700F20();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v10 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F39608] + MEMORY[0x263F39608]);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25C6FE0C0;
  uint64_t v8 = v0[9];
  return v10(v8);
}

uint64_t sub_25C6FE0C0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25C6FE348;
  }
  else {
    uint64_t v2 = sub_25C6FE1D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C6FE1D4()
{
  uint64_t v1 = v0[17];
  unint64_t v2 = SiriCoreMetricsDataProvider.loadRequestCountsData()();
  if (v1)
  {
    (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  }
  else
  {
    unint64_t v4 = v2;
    uint64_t v6 = v0[8];
    uint64_t v5 = v0[9];
    uint64_t v8 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v10 = v0[4];
    uint64_t v9 = v0[5];
    uint64_t v11 = v0[2];
    sub_25C700F90();
    sub_25C700F60();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v11, v8, v10);
    *(void *)(v11 + *(int *)(type metadata accessor for SiriCoreMetricsDataRecord(0) + 20)) = v4;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25C6FE348()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t SiriCoreMetricsDataProvider.loadRequestCountsData()()
{
  uint64_t v1 = sub_25C700CD0();
  uint64_t v43 = *(void *)(v1 - 8);
  uint64_t v44 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v45 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v38 - v5;
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v38 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = sub_25C700DC0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v38 - v17;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  uint64_t v19 = sub_25C700EE0();
  if (v0) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }
  uint64_t v21 = (void *)v19;
  uint64_t v40 = 0;
  uint64_t v41 = v16;
  uint64_t v46 = v12;
  id v47 = v18;
  id v42 = v11;
  sub_25C7010E0();
  char v23 = v22;

  if (v23)
  {
    sub_25C701010();
    uint64_t v24 = v47;
    sub_25C700CA0();
    uint64_t v25 = v44;
    os_log_type_t v26 = *(void (**)(char *, uint64_t))(v43 + 8);
    v26(v6, v44);
    sub_25C700C90();
    v26(v9, v25);
  }
  else
  {
    sub_25C700C70();
    uint64_t v24 = v47;
  }
  uint64_t v27 = v41;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_25C700CA0();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v29 = v46;
  uint64_t v41 = (char *)(v13 + 8);
  uint64_t v39 = v28;
  v28(v27, v46);
  sub_25C701100();
  sub_25C700C80();
  id v38 = (id)sub_25C7010F0();
  unint64_t result = sub_25C701000();
  unint64_t v30 = result;
  uint64_t v48 = MEMORY[0x263F8EE78];
  if (!(result >> 62))
  {
    uint64_t v31 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v31) {
      goto LABEL_8;
    }
LABEL_19:
    swift_bridgeObjectRelease();

    uint64_t v36 = v44;
    unint64_t v37 = *(void (**)(char *, uint64_t))(v43 + 8);
    v37(v45, v44);
    v37(v42, v36);
    v39(v24, v29);
    return v48;
  }
  unint64_t result = sub_25C701480();
  uint64_t v31 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_8:
  if (v31 >= 1)
  {
    uint64_t v32 = 0;
    do
    {
      if ((v30 & 0xC000000000000001) != 0) {
        id v33 = (id)MEMORY[0x261191400](v32, v30);
      }
      else {
        id v33 = *(id *)(v30 + 8 * v32 + 32);
      }
      uint64_t v34 = v33;
      id v35 = (void *)sub_25C7011F0();
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x2611912C0](v35);
        if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C701330();
        }
        sub_25C701350();
        sub_25C701320();
        uint64_t v29 = v46;
      }
      ++v32;

      uint64_t v24 = v47;
    }
    while (v31 != v32);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t SiriCoreMetricsDataProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsDataProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

unint64_t sub_25C6FE9B4()
{
  unint64_t result = qword_26A5C7D40;
  if (!qword_26A5C7D40)
  {
    type metadata accessor for SiriCoreMetricsDataRecord(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C7D40);
  }
  return result;
}

uint64_t sub_25C6FEA0C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C6FEAA8;
  return SiriCoreMetricsDataProvider.loadData()(a1);
}

uint64_t sub_25C6FEAA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCoreMetricsDataRecord(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25C700F80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriCoreMetricsDataRecord(uint64_t a1)
{
  uint64_t v2 = sub_25C700F80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6FEF00);
}

uint64_t sub_25C6FEF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C700F80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6FEFD4);
}

uint64_t sub_25C6FEFD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25C700F80();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25C6FF090()
{
  uint64_t result = sub_25C700F80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C6FF128()
{
  return type metadata accessor for SiriCoreMetricsDataProvider(0);
}

uint64_t type metadata accessor for SiriCoreMetricsDataProvider(uint64_t a1)
{
  return sub_25C6F4474(a1, (uint64_t *)&unk_26A5C80F0);
}

uint64_t sub_25C6FF150()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION.unsafeMutableAddressor()
{
  return &static SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION;
}

unint64_t static SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION.getter()
{
  return 0xD000000000000043;
}

void sub_25C6FF218()
{
  qword_26A5CA190 = 0x65726F4369726953;
  *(void *)algn_26A5CA198 = 0xEF7363697274654DLL;
}

uint64_t SiriCoreMetrics.__allocating_init(bookmarkLocation:conversationType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SiriCoreMetrics.init(bookmarkLocation:conversationType:)(a1, a2, a3);
  return v6;
}

uint64_t SiriCoreMetrics.init(bookmarkLocation:conversationType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v78 = a3;
  uint64_t v6 = sub_25C700D20();
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v76 = v6;
  MEMORY[0x270FA5388](v6);
  long long v70 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_25C701220();
  uint64_t v81 = *(void *)(v74 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v74);
  uint64_t v68 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v72 = (char *)v64 - v10;
  uint64_t v11 = sub_25C700C40();
  uint64_t v82 = *(void *)(v11 - 8);
  uint64_t v83 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  long long v71 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v64 - v14;
  uint64_t v16 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  sub_25C701210();
  uint64_t v17 = v3;
  uint64_t v79 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
  uint64_t v18 = v16;
  if (a2) {
    uint64_t v19 = a1;
  }
  else {
    uint64_t v19 = 0xD000000000000043;
  }
  if (a2) {
    unint64_t v20 = a2;
  }
  else {
    unint64_t v20 = 0x800000025C7041E0;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_25C701200();
  os_log_type_t v22 = sub_25C701390();
  BOOL v23 = os_log_type_enabled(v21, v22);
  char v80 = v15;
  uint64_t v84 = v18;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v86 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v85 = sub_25C6EC85C(v19, v20, &v86);
    sub_25C7013C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C6E0000, v21, v22, "marker: streams bookmark path=%s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261191AB0](v25, -1, -1);
    os_log_type_t v26 = v24;
    uint64_t v15 = v80;
    MEMORY[0x261191AB0](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_25C700C30();
  swift_bridgeObjectRelease();
  sub_25C700F40();
  uint64_t v27 = v81;
  if (qword_26A5C7BB0 != -1) {
    swift_once();
  }
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v71, v15, v83);
  uint64_t v28 = v74;
  uint64_t v77 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v77(v72, v84, v74);
  swift_bridgeObjectRetain();
  uint64_t v29 = v73;
  uint64_t v30 = sub_25C700EF0();
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v83);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v84, v28);
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v79, v76);
    type metadata accessor for SiriCoreMetrics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v69 = v17;
    *(void *)(v17 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_conversationType) = v78;
    uint64_t v73 = v30;
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8038);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_25C702CB0;
    id v32 = objc_allocWithZone((Class)sub_25C701110());
    long long v71 = 0;
    *(void *)(v31 + 32) = objc_msgSend(v32, sel_init);
    *(void *)(v31 + 40) = objc_msgSend(objc_allocWithZone((Class)sub_25C7011C0()), sel_init);
    *(void *)(v31 + 48) = objc_msgSend(objc_allocWithZone((Class)sub_25C701120()), sel_init);
    *(void *)(v31 + 56) = objc_msgSend(objc_allocWithZone((Class)sub_25C701170()), sel_init);
    uint64_t v86 = v31;
    sub_25C701320();
    id v33 = v68;
    uint64_t v34 = v84;
    id v35 = v77;
    v77(v68, v84, v28);
    sub_25C700FB0();
    swift_allocObject();
    swift_retain();
    uint64_t v36 = sub_25C700FC0();
    v35(v33, v34, v28);
    type metadata accessor for SiriCoreMetricsDataProvider(0);
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = v36;
    uint64_t v66 = v36;
    uint64_t v72 = *(char **)(v27 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v72)(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger, v33, v28);
    *(void *)(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = v73;
    *(void *)(v69 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsDataProvider) = v37;
    v35(v33, v34, v28);
    type metadata accessor for SiriCoreMetricsCalculator();
    uint64_t v38 = swift_allocObject();
    swift_retain();
    swift_retain();
    _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
    ((void (*)(uint64_t, char *, uint64_t))v72)(v38 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger, v33, v28);
    *(void *)(v38 + 16) = v78;
    *(void *)(v69 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsCalculator) = v38;
    uint64_t v39 = v33;
    uint64_t v40 = v34;
    uint64_t v41 = v34;
    id v42 = v77;
    v77(v33, v41, v28);
    type metadata accessor for SiriCoreMetricsJsonLoggingReporter();
    uint64_t v43 = swift_allocObject();
    swift_retain();
    *(void *)(v43 + 16) = sub_25C6E9964(MEMORY[0x263F8EE78]);
    uint64_t v78 = v43;
    uint64_t v44 = (void (*)(uint64_t, char *, uint64_t))v72;
    ((void (*)(uint64_t, char *, uint64_t))v72)(v43 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger, v33, v28);
    swift_release();
    v42(v33, v40, v28);
    uint64_t v81 = v27 + 32;
    uint64_t v45 = v75;
    uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v75 + 16);
    v64[1] = v75 + 16;
    uint64_t v65 = v46;
    id v47 = v70;
    uint64_t v48 = v76;
    v46(v70, v79, v76);
    type metadata accessor for SiriCoreMetricsSELFReporter();
    uint64_t v49 = swift_allocObject();
    uint64_t v50 = MEMORY[0x263F8EE78];
    *(void *)(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = MEMORY[0x263F8EE78];
    *(void *)(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v50;
    v64[0] = v49;
    v44(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger, v39, v28);
    uint64_t v51 = v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
    uint64_t v52 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v52(v51, v47, v48);
    id v53 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
    swift_unknownObjectRelease();
    id v54 = objc_msgSend(v53, sel_SiriRequestCounts);
    swift_unknownObjectRelease();
    id v55 = objc_msgSend(v54, sel_source);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8100);
    swift_allocObject();
    uint64_t v56 = v28;
    uint64_t v57 = sub_25C700E20();
    v77(v39, v84, v56);
    uint64_t v58 = v70;
    v65(v70, v79, v48);
    type metadata accessor for SiriCoreMetricsBiomeReporter();
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = v57;
    ((void (*)(uint64_t, char *, uint64_t))v72)(v59 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger, v39, v56);
    v52(v59 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId, v58, v48);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_25C702CC0;
    *(void *)(v60 + 32) = v64[0];
    *(void *)(v60 + 40) = v59;
    *(void *)(v60 + 48) = v78;
    uint64_t v86 = v60;
    sub_25C701320();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8108);
    swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v86 = sub_25C700E40();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C8110);
    swift_allocObject();
    uint64_t v61 = sub_25C700E70();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v62 = v69;
    swift_release();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v83);
    uint64_t v17 = v62;
    *(void *)(v62 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsReporter) = v61;
  }
  return v17;
}

uint64_t type metadata accessor for SiriCoreMetrics()
{
  uint64_t result = qword_26A5C8160;
  if (!qword_26A5C8160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriCoreMetrics.loadData()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25C6FFE58, 0, 0);
}

uint64_t sub_25C6FFE58()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6FD04C;
  uint64_t v2 = *(void *)(v0 + 16);
  return SiriCoreMetricsDataProvider.loadData()(v2);
}

uint64_t SiriCoreMetrics.doWork(_:)(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return MEMORY[0x270FA2498](sub_25C6FFF24, 0, 0);
}

uint64_t sub_25C6FFF24()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6FFFD4;
  uint64_t v2 = *(void *)(v0 + 72);
  return SiriCoreMetricsCalculator.doWork(_:)(v0 + 16, v2);
}

uint64_t sub_25C6FFFD4()
{
  uint64_t v1 = (_OWORD *)*v0;
  uint64_t v2 = *(_OWORD **)(*v0 + 64);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  long long v3 = v1[1];
  long long v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *uint64_t v2 = v3;
  int v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t SiriCoreMetrics.report(_:)(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = v1;
  return MEMORY[0x270FA2498](sub_25C70010C, 0, 0);
}

uint64_t sub_25C70010C()
{
  uint64_t v1 = *(_OWORD **)(v0 + 64);
  long long v3 = v1[1];
  long long v2 = v1[2];
  uint64_t v6 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395D8] + MEMORY[0x263F395D8]);
  *(_OWORD *)(v0 + 16) = *v1;
  *(_OWORD *)(v0 + 32) = v3;
  *(_OWORD *)(v0 + 48) = v2;
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  *long long v4 = v0;
  v4[1] = sub_25C7001D8;
  return v6(v0 + 16);
}

uint64_t sub_25C7001D8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C70030C, 0, 0);
  }
  else
  {
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C70030C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriCoreMetrics.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  uint64_t v4 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetrics.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  uint64_t v2 = sub_25C701220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  uint64_t v4 = sub_25C700D20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_25C700510(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25C6FFE58, 0, 0);
}

uint64_t sub_25C700534(uint64_t a1, uint64_t a2)
{
  v3[8] = a1;
  v3[9] = a2;
  v3[10] = *v2;
  return MEMORY[0x270FA2498](sub_25C70055C, 0, 0);
}

uint64_t sub_25C70055C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C70060C;
  uint64_t v2 = *(void *)(v0 + 72);
  return SiriCoreMetricsCalculator.doWork(_:)(v0 + 16, v2);
}

uint64_t sub_25C70060C()
{
  uint64_t v1 = (_OWORD *)*v0;
  uint64_t v2 = *(_OWORD **)(*v0 + 64);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  long long v3 = v1[1];
  long long v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *uint64_t v2 = v3;
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_25C700728(_OWORD *a1)
{
  long long v3 = a1[1];
  *(_OWORD *)(v2 + 64) = *a1;
  *(_OWORD *)(v2 + 80) = v3;
  *(_OWORD *)(v2 + 96) = a1[2];
  *(void *)(v2 + 112) = *v1;
  return MEMORY[0x270FA2498](sub_25C70075C, 0, 0);
}

uint64_t sub_25C70075C()
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395D8] + MEMORY[0x263F395D8]);
  long long v1 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  long long v2 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v0 + 48) = v2;
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v3;
  *long long v3 = v0;
  v3[1] = sub_25C700828;
  return v5(v0 + 16);
}

uint64_t sub_25C700828()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C70095C, 0, 0);
  }
  else
  {
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C70095C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C700974()
{
  return sub_25C700A94(&qword_26A5C8130, (void (*)(uint64_t))type metadata accessor for SiriCoreMetrics);
}

uint64_t sub_25C7009BC()
{
  return sub_25C700A94(&qword_26A5C8138, (void (*)(uint64_t))type metadata accessor for SiriCoreMetrics);
}

uint64_t sub_25C700A04()
{
  return sub_25C700A94(qword_26A5C8140, (void (*)(uint64_t))type metadata accessor for SiriCoreMetrics);
}

uint64_t sub_25C700A4C()
{
  return sub_25C700A94((unint64_t *)&qword_26A5C7D40, (void (*)(uint64_t))type metadata accessor for SiriCoreMetricsDataRecord);
}

uint64_t sub_25C700A94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C700ADC()
{
  return type metadata accessor for SiriCoreMetrics();
}

uint64_t sub_25C700AE4()
{
  uint64_t result = sub_25C701220();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C700D20();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_25C700BD0()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_25C700BE0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25C700BF0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25C700C00()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25C700C10()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25C700C20()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25C700C30()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25C700C40()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C700C50()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C700C60()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25C700C70()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25C700C80()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25C700C90()
{
  return MEMORY[0x270F25420]();
}

uint64_t sub_25C700CA0()
{
  return MEMORY[0x270F25448]();
}

uint64_t sub_25C700CB0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C700CC0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25C700CD0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C700CE0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25C700CF0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C700D00()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C700D20()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C700D30()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_25C700D40()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_25C700D50()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_25C700D60()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_25C700D70()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25C700D80()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25C700D90()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA873LL10Foundation8CalendarVvpfi_0()
{
  return MEMORY[0x270F25458]();
}

uint64_t sub_25C700DB0()
{
  return MEMORY[0x270F25460]();
}

uint64_t sub_25C700DC0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25C700DD0()
{
  return MEMORY[0x270F25468]();
}

uint64_t sub_25C700DE0()
{
  return MEMORY[0x270F25470]();
}

uint64_t sub_25C700DF0()
{
  return MEMORY[0x270F25488]();
}

uint64_t sub_25C700E00()
{
  return MEMORY[0x270F25490]();
}

uint64_t sub_25C700E10()
{
  return MEMORY[0x270F25498]();
}

uint64_t sub_25C700E20()
{
  return MEMORY[0x270F254A8]();
}

uint64_t sub_25C700E30()
{
  return MEMORY[0x270F254C0]();
}

uint64_t sub_25C700E40()
{
  return MEMORY[0x270F254D0]();
}

uint64_t sub_25C700E50()
{
  return MEMORY[0x270F254D8]();
}

uint64_t sub_25C700E60()
{
  return MEMORY[0x270F254E8]();
}

uint64_t sub_25C700E70()
{
  return MEMORY[0x270F254F0]();
}

uint64_t sub_25C700E80()
{
  return MEMORY[0x270F25500]();
}

uint64_t sub_25C700E90()
{
  return MEMORY[0x270F25508]();
}

uint64_t sub_25C700EA0()
{
  return MEMORY[0x270F25510]();
}

uint64_t sub_25C700EB0()
{
  return MEMORY[0x270F25518]();
}

uint64_t sub_25C700EC0()
{
  return MEMORY[0x270F25520]();
}

uint64_t sub_25C700ED0()
{
  return MEMORY[0x270F25528]();
}

uint64_t sub_25C700EE0()
{
  return MEMORY[0x270F25538]();
}

uint64_t sub_25C700EF0()
{
  return MEMORY[0x270F25540]();
}

uint64_t sub_25C700F00()
{
  return MEMORY[0x270F25550]();
}

uint64_t sub_25C700F10()
{
  return MEMORY[0x270F25558]();
}

uint64_t sub_25C700F20()
{
  return MEMORY[0x270F25560]();
}

uint64_t sub_25C700F30()
{
  return MEMORY[0x270F25570]();
}

uint64_t sub_25C700F40()
{
  return MEMORY[0x270F25578]();
}

uint64_t sub_25C700F50()
{
  return MEMORY[0x270F25588]();
}

uint64_t sub_25C700F60()
{
  return MEMORY[0x270F25590]();
}

uint64_t sub_25C700F70()
{
  return MEMORY[0x270F25598]();
}

uint64_t sub_25C700F80()
{
  return MEMORY[0x270F255A0]();
}

uint64_t sub_25C700F90()
{
  return MEMORY[0x270F255A8]();
}

uint64_t sub_25C700FA0()
{
  return MEMORY[0x270F255B0]();
}

uint64_t sub_25C700FB0()
{
  return MEMORY[0x270F255B8]();
}

uint64_t sub_25C700FC0()
{
  return MEMORY[0x270F255C0]();
}

uint64_t sub_25C700FD0()
{
  return MEMORY[0x270F8C5C0]();
}

uint64_t sub_25C700FE0()
{
  return MEMORY[0x270F8C5D0]();
}

uint64_t sub_25C700FF0()
{
  return MEMORY[0x270F8C5D8]();
}

uint64_t sub_25C701000()
{
  return MEMORY[0x270F25610]();
}

uint64_t sub_25C701010()
{
  return MEMORY[0x270F25638]();
}

uint64_t sub_25C701020()
{
  return MEMORY[0x270F25658]();
}

uint64_t sub_25C701030()
{
  return MEMORY[0x270F25660]();
}

uint64_t sub_25C701040()
{
  return MEMORY[0x270F25668]();
}

uint64_t sub_25C701050()
{
  return MEMORY[0x270F25670]();
}

uint64_t sub_25C701060()
{
  return MEMORY[0x270F25678]();
}

uint64_t sub_25C701070()
{
  return MEMORY[0x270F25680]();
}

uint64_t sub_25C701080()
{
  return MEMORY[0x270F25688]();
}

uint64_t sub_25C701090()
{
  return MEMORY[0x270F25690]();
}

uint64_t sub_25C7010A0()
{
  return MEMORY[0x270F25698]();
}

uint64_t sub_25C7010B0()
{
  return MEMORY[0x270F256B0]();
}

uint64_t sub_25C7010C0()
{
  return MEMORY[0x270F256B8]();
}

uint64_t sub_25C7010D0()
{
  return MEMORY[0x270F256C0]();
}

uint64_t sub_25C7010E0()
{
  return MEMORY[0x270F25768]();
}

uint64_t sub_25C7010F0()
{
  return MEMORY[0x270F25790]();
}

uint64_t sub_25C701100()
{
  return MEMORY[0x270F257A8]();
}

uint64_t sub_25C701110()
{
  return MEMORY[0x270F257C8]();
}

uint64_t sub_25C701120()
{
  return MEMORY[0x270F257D0]();
}

uint64_t sub_25C701130()
{
  return MEMORY[0x270F257F8]();
}

uint64_t sub_25C701140()
{
  return MEMORY[0x270F25810]();
}

uint64_t sub_25C701150()
{
  return MEMORY[0x270F25828]();
}

uint64_t sub_25C701160()
{
  return MEMORY[0x270F25840]();
}

uint64_t sub_25C701170()
{
  return MEMORY[0x270F25848]();
}

uint64_t sub_25C701180()
{
  return MEMORY[0x270F25858]();
}

uint64_t sub_25C701190()
{
  return MEMORY[0x270F25860]();
}

uint64_t sub_25C7011A0()
{
  return MEMORY[0x270F25868]();
}

uint64_t sub_25C7011B0()
{
  return MEMORY[0x270F25878]();
}

uint64_t sub_25C7011C0()
{
  return MEMORY[0x270F25890]();
}

uint64_t sub_25C7011D0()
{
  return MEMORY[0x270F258B0]();
}

uint64_t sub_25C7011E0()
{
  return MEMORY[0x270F258B8]();
}

uint64_t sub_25C7011F0()
{
  return MEMORY[0x270F25928]();
}

uint64_t sub_25C701200()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C701210()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C701220()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C701230()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C701240()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25C701250()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C701260()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25C701270()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C701280()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C701290()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C7012A0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25C7012B0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25C7012C0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25C7012D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C7012E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C7012F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C701300()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C701310()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C701320()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C701330()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C701340()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C701350()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C701360()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25C701370()
{
  return MEMORY[0x270F66218]();
}

uint64_t sub_25C701380()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C701390()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C7013A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C7013B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C7013C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C7013D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C7013E0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25C7013F0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C701400()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C701410()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C701420()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C701430()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C701440()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C701450()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C701460()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C701470()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C701480()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C701490()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25C7014A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C7014B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C7014C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C7014D0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25C7014E0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25C7014F0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25C701500()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25C701510()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C701520()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25C701530()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25C701540()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25C701550()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25C701560()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25C701570()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C701580()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25C701590()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C7015A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C7015B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C7015C0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C7015D0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C7015E0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C7015F0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C701600()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C701610()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C701620()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C701630()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C701640()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_25C701650()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C701660()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}