uint64_t variable initialization expression of EvaluationDataSearch.notificationsFromNotifStream()
{
  return MEMORY[0x263F8EE78];
}

uint64_t EvaluationDataSearch.notificationsFromNotifStream.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationDataSearch.notificationsFromNotifStream.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationDataSearch.notificationsFromNotifStream.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of EvaluationDataSearch.notificationsFromSubStream()
{
  return MEMORY[0x263F8EE78];
}

uint64_t EvaluationDataSearch.notificationsFromSubStream.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationDataSearch.notificationsFromSubStream.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationDataSearch.notificationsFromSubStream.modify())()
{
  return j__swift_endAccess;
}

void *EvaluationDataSearch.__allocating_init(numOffsets:notifStartDaysUntilNow:notifEndDaysUntilNow:labelDurationInDays:offsetTimeInterval:withBiomeManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, long long *a6)
{
  v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8EE78];
  v12[2] = MEMORY[0x263F8EE78];
  v12[3] = v13;
  v12[4] = a1;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = a4;
  v12[8] = a5;
  sub_262B633CC(a6, (uint64_t)(v12 + 9));
  return v12;
}

void *EvaluationDataSearch.init(numOffsets:notifStartDaysUntilNow:notifEndDaysUntilNow:labelDurationInDays:offsetTimeInterval:withBiomeManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, long long *a6)
{
  uint64_t v7 = MEMORY[0x263F8EE78];
  v6[2] = MEMORY[0x263F8EE78];
  v6[3] = v7;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = a4;
  v6[8] = a5;
  sub_262B633CC(a6, (uint64_t)(v6 + 9));
  return v6;
}

uint64_t sub_262B633CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

Swift::Bool __swiftcall EvaluationDataSearch.hasiCloudNotifsFromNotifStream()()
{
  uint64_t v1 = v0;
  sub_262B67A00();
  uint64_t v2 = sub_262B679F0();
  swift_beginAccess();
  *(void *)(v1 + 16) = v2;
  swift_bridgeObjectRelease();
  return *(void *)(*(void *)(v1 + 16) + 16) != 0;
}

Swift::Bool __swiftcall EvaluationDataSearch.hasiCloudNotifsFromSubStream()()
{
  uint64_t v1 = v0;
  sub_262B67A00();
  uint64_t v2 = sub_262B679E0();
  swift_beginAccess();
  *(void *)(v1 + 24) = v2;
  swift_bridgeObjectRelease();
  return *(void *)(*(void *)(v1 + 24) + 16) != 0;
}

uint64_t EvaluationDataSearch.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return v0;
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

uint64_t EvaluationDataSearch.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t variable initialization expression of RecipeParser.recipeJson()
{
  return 0;
}

uint64_t type metadata accessor for EvaluationDataSearch()
{
  return self;
}

uint64_t static LighthouseFilter.checkOptinStatus()()
{
  char v0 = MEMORY[0x263E5C920]();
  return MEMORY[0x263E5C890]() & 1 | ((v0 & 1) == 0);
}

ValueMetadata *type metadata accessor for LighthouseFilter()
{
  return &type metadata for LighthouseFilter;
}

uint64_t sub_262B6360C()
{
  return 1;
}

uint64_t sub_262B63614()
{
  return sub_262B67B80();
}

uint64_t sub_262B63658()
{
  return sub_262B67B70();
}

uint64_t sub_262B63680()
{
  return sub_262B67B80();
}

uint64_t sub_262B636D0()
{
  uint64_t v0 = sub_262B67940();
  __swift_allocate_value_buffer(v0, qword_26A994348);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A994348);
  type metadata accessor for RecipeParser();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994390);
  return sub_262B67950();
}

void *RecipeParser.__allocating_init(recipePath:)(uint64_t a1, uint64_t a2)
{
  v4 = (void *)swift_allocObject();
  v4[3] = a2;
  v4[4] = 0;
  v4[2] = a1;
  RecipeParser.parsing()();
  if (v5) {
    swift_release();
  }
  return v4;
}

void *RecipeParser.init(recipePath:)(uint64_t a1, uint64_t a2)
{
  v2[3] = a2;
  v2[4] = 0;
  v2[2] = a1;
  RecipeParser.parsing()();
  if (v3) {
    swift_release();
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RecipeParser.parsing()()
{
  v35[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v30 = sub_262B67940();
  MEMORY[0x270FA5388]();
  uint64_t v31 = (uint64_t)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_262B67890();
  uint64_t v2 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994360);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_262B678D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v29 = v0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F06E50], v32);
  swift_bridgeObjectRetain();
  uint64_t v32 = v11;
  sub_262B678B0();
  uint64_t v12 = v33;
  uint64_t v13 = sub_262B678E0();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v15 = v12;
LABEL_3:
    if (qword_26A994330 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v30, (uint64_t)qword_26A994348);
    uint64_t v17 = v31;
    sub_262B63D7C(v16, v31);
    v35[0] = 0;
    v35[1] = (id)0xE000000000000000;
    sub_262B67AE0();
    sub_262B67A90();
    swift_bridgeObjectRetain();
    sub_262B67A90();
    swift_bridgeObjectRelease();
    sub_262B67A90();
    uint64_t v34 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994368);
    sub_262B67AF0();
    sub_262B67A90();
    sub_262B67930();
    swift_bridgeObjectRelease();
    sub_262B63DE0(v17);
    sub_262B63E3C();
    swift_allocError();
    swift_willThrow();
    MEMORY[0x263E5CC00](v15);
    return;
  }
  uint64_t v18 = v13;
  unint64_t v19 = v14;
  uint64_t v20 = v29;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = self;
  v22 = (void *)sub_262B678F0();
  v35[0] = 0;
  id v23 = objc_msgSend(v21, sel_JSONObjectWithData_options_error_, v22, 0, v35);

  if (!v23)
  {
    id v27 = v35[0];
    uint64_t v15 = sub_262B67870();

    swift_willThrow();
    sub_262B63E90(v18, v19);
    goto LABEL_3;
  }
  id v24 = v35[0];
  sub_262B67AD0();
  sub_262B63E90(v18, v19);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994378);
  int v25 = swift_dynamicCast();
  uint64_t v26 = v34;
  if (!v25) {
    uint64_t v26 = 0;
  }
  *(void *)(v20 + 32) = v26;
  swift_bridgeObjectRelease();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_262B63D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_262B67940();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_262B63DE0(uint64_t a1)
{
  uint64_t v2 = sub_262B67940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_262B63E3C()
{
  unint64_t result = qword_26A994370;
  if (!qword_26A994370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A994370);
  }
  return result;
}

uint64_t sub_262B63E90(uint64_t a1, unint64_t a2)
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

uint64_t sub_262B63EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_262B67940();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v3 + 32);
  if (v10 && *(void *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_262B64FB4(a1, a2);
    if (v12)
    {
      unint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v19 = v13;
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        a3 = v18;
        if (qword_26A994330 != -1) {
          swift_once();
        }
        uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
        sub_262B63D7C(v14, (uint64_t)v9);
        unint64_t v19 = 0;
        unint64_t v20 = 0xE000000000000000;
        sub_262B67AE0();
        swift_bridgeObjectRelease();
        unint64_t v19 = 0x2074636172747845;
        unint64_t v20 = 0xE800000000000000;
        sub_262B67A90();
        sub_262B67A90();
        uint64_t v18 = a3;
        sub_262B67B00();
        sub_262B67A90();
        swift_bridgeObjectRelease();
        sub_262B67A90();
        sub_262B67920();
        swift_unknownObjectRelease();
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_26A994330 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
  sub_262B63D7C(v15, (uint64_t)v9);
  unint64_t v19 = 0;
  unint64_t v20 = 0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  unint64_t v19 = 0xD000000000000016;
  unint64_t v20 = 0x8000000262B68290;
  sub_262B67A90();
  sub_262B67A90();
  uint64_t v18 = a3;
  sub_262B67B00();
  sub_262B67A90();
  swift_bridgeObjectRelease();
  sub_262B67A90();
  sub_262B67920();
LABEL_13:
  swift_bridgeObjectRelease();
  sub_262B63DE0((uint64_t)v9);
  return a3;
}

unint64_t sub_262B64218(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = sub_262B67940();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v3 + 32);
  if (v10 && *(void *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_262B64FB4(a1, a2);
    if (v12)
    {
      uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17[1] = v13;
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        a3 = v18;
        if (qword_26A994330 != -1) {
          swift_once();
        }
        uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
        sub_262B63D7C(v14, (uint64_t)v9);
        unint64_t v18 = 0;
        unint64_t v19 = 0xE000000000000000;
        sub_262B67AE0();
        swift_bridgeObjectRelease();
        unint64_t v18 = 0x2074636172747845;
        unint64_t v19 = 0xE800000000000000;
        sub_262B67A90();
        sub_262B67A90();
        sub_262B67A90();
        sub_262B67A90();
        sub_262B67920();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        sub_262B63DE0((uint64_t)v9);
        return a3;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_26A994330 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
  sub_262B63D7C(v15, (uint64_t)v9);
  unint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  unint64_t v18 = 0xD000000000000016;
  unint64_t v19 = 0x8000000262B68290;
  sub_262B67A90();
  sub_262B67A90();
  sub_262B67A90();
  sub_262B67A90();
  sub_262B67920();
  swift_bridgeObjectRelease();
  sub_262B63DE0((uint64_t)v9);
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t sub_262B64520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_262B67940();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v3 + 32);
  if (v10 && *(void *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_262B64FB4(a1, a2);
    if (v12)
    {
      unint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v18 = v13;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A994388);
      if (swift_dynamicCast())
      {
        a3 = v17[1];
        if (qword_26A994330 != -1) {
          swift_once();
        }
        uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
        sub_262B63D7C(v14, (uint64_t)v9);
        unint64_t v18 = 0;
        unint64_t v19 = 0xE000000000000000;
        sub_262B67AE0();
        swift_bridgeObjectRelease();
        unint64_t v18 = 0x2074636172747845;
        unint64_t v19 = 0xE800000000000000;
        sub_262B67A90();
        sub_262B67A90();
        MEMORY[0x263E5C980](a3, MEMORY[0x263F8D6C8]);
        sub_262B67A90();
        swift_bridgeObjectRelease();
        sub_262B67A90();
        sub_262B67920();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        sub_262B63DE0((uint64_t)v9);
        return a3;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_26A994330 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
  sub_262B63D7C(v15, (uint64_t)v9);
  unint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  unint64_t v18 = 0xD000000000000016;
  unint64_t v19 = 0x8000000262B68290;
  sub_262B67A90();
  sub_262B67A90();
  MEMORY[0x263E5C980](a3, MEMORY[0x263F8D6C8]);
  sub_262B67A90();
  swift_bridgeObjectRelease();
  sub_262B67A90();
  sub_262B67920();
  swift_bridgeObjectRelease();
  sub_262B63DE0((uint64_t)v9);
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t sub_262B64850(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_262B67940();
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  char v12 = &v20[-v11];
  uint64_t v13 = *(void *)(v3 + 32);
  if (v13 && *(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_262B64FB4(a1, a2);
    if (v15)
    {
      unint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v21 = v16;
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        a3 = v20[15];
        if (qword_26A994330 != -1) {
          swift_once();
        }
        uint64_t v17 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
        sub_262B63D7C(v17, (uint64_t)v12);
        unint64_t v21 = 0;
        unint64_t v22 = 0xE000000000000000;
        sub_262B67AE0();
        swift_bridgeObjectRelease();
        unint64_t v21 = 0x2074636172747845;
        unint64_t v22 = 0xE800000000000000;
        sub_262B67A90();
        sub_262B67A90();
        sub_262B67A90();
        swift_bridgeObjectRelease();
        sub_262B67A90();
        sub_262B67920();
        swift_unknownObjectRelease();
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_26A994330 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v7, (uint64_t)qword_26A994348);
  sub_262B63D7C(v18, (uint64_t)v10);
  unint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  unint64_t v21 = 0xD000000000000016;
  unint64_t v22 = 0x8000000262B68290;
  sub_262B67A90();
  sub_262B67A90();
  sub_262B67A90();
  swift_bridgeObjectRelease();
  sub_262B67A90();
  sub_262B67920();
  char v12 = v10;
LABEL_13:
  swift_bridgeObjectRelease();
  sub_262B63DE0((uint64_t)v12);
  return a3 & 1;
}

Swift::Int64 __swiftcall RecipeParser.getNumOffsets()()
{
  return sub_262B63EE8(0x657366664F6D756ELL, 0xEA00000000007374, 23);
}

Swift::Int64 __swiftcall RecipeParser.getNotifStartDaysUntilNow()()
{
  return sub_262B63EE8(0xD000000000000016, 0x8000000262B68190, 10);
}

Swift::Int64 __swiftcall RecipeParser.getNotifEndDaysUntilNow()()
{
  return sub_262B63EE8(0xD000000000000014, 0x8000000262B681B0, 3);
}

Swift::Int64 __swiftcall RecipeParser.getLabelDurationInDays()()
{
  return sub_262B63EE8(0xD000000000000013, 0x8000000262B681D0, 3);
}

Swift::Int64 __swiftcall RecipeParser.getOffsetTimeInterval()()
{
  sub_262B67990();
  uint64_t v0 = sub_262B67970();
  return sub_262B63EE8(0xD000000000000012, 0x8000000262B681F0, v0);
}

Swift::String __swiftcall RecipeParser.getLabelingSource()()
{
  unint64_t v0 = *(void *)sub_262B67A30();
  swift_bridgeObjectRetain();
  unint64_t v1 = sub_262B64218(0x676E696C6562616CLL, 0xEE00656372756F53, v0);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = v1;
  uint64_t v5 = v3;
  result._object = v5;
  result._countAndFlagsBits = v4;
  return result;
}

uint64_t RecipeParser.getPercentileToChooseOffset()()
{
  uint64_t v0 = *(void *)sub_262B67A10();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_262B64520(0x69746E6563726570, 0xEB0000000073656CLL, v0);
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall RecipeParser.getDummyData()()
{
  return sub_262B64850(0x746144796D6D7564, 0xE900000000000061, 0);
}

Swift::Int64 __swiftcall RecipeParser.getMinsUntilOpen()()
{
  return sub_262B63EE8(0x69746E55736E696DLL, 0xED00006E65704F6CLL, 4320);
}

uint64_t RecipeParser.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RecipeParser.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for RecipeParser()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PluginAssetError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PluginAssetError(unsigned char *result, int a2, int a3)
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
        *Swift::String result = a2;
        return result;
      case 2:
        *(_WORD *)Swift::String result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)Swift::String result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *Swift::String result = 0;
      break;
    case 2:
      *(_WORD *)Swift::String result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x262B64F18);
    case 4:
      *(_DWORD *)Swift::String result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_262B64F40()
{
  return 0;
}

ValueMetadata *type metadata accessor for PluginAssetError()
{
  return &type metadata for PluginAssetError;
}

unint64_t sub_262B64F60()
{
  unint64_t result = qword_26A994380;
  if (!qword_26A994380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A994380);
  }
  return result;
}

unint64_t sub_262B64FB4(uint64_t a1, uint64_t a2)
{
  sub_262B67B60();
  sub_262B67A80();
  uint64_t v4 = sub_262B67B80();
  return sub_262B6502C(a1, a2, v4);
}

unint64_t sub_262B6502C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_262B67B10() & 1) == 0)
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
      while (!v14 && (sub_262B67B10() & 1) == 0);
    }
  }
  return v6;
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

uint64_t ShadowMetrics.modelMetrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ShadowMetrics()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s37iCloudSubscriptionOptimizerLighthouse13ShadowMetricsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ShadowMetrics(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for ShadowMetrics(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowMetrics(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowMetrics(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowMetrics()
{
  return &type metadata for ShadowMetrics;
}

uint64_t sub_262B6533C()
{
  uint64_t v0 = sub_262B67940();
  __swift_allocate_value_buffer(v0, qword_26A994398);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A994398);
  type metadata accessor for ShadowModelProvider();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9943C8);
  return sub_262B67950();
}

uint64_t ShadowModelProvider.modelPaths.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void *ShadowModelProvider.__allocating_init(modelPaths:withFileManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

void *ShadowModelProvider.init(modelPaths:withFileManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

void *ShadowModelProvider.getModels()()
{
  uint64_t v1 = v0;
  v78[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_262B679B0();
  uint64_t v71 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v74 = (uint64_t)&v55 - v6;
  uint64_t v70 = sub_262B67890();
  uint64_t v7 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  v69 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_262B67940();
  MEMORY[0x270FA5388](v9);
  BOOL v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_262B678D0();
  uint64_t v12 = MEMORY[0x270FA5388](v75);
  v68 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v73 = (char *)&v55 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v55 - v17;
  unint64_t v19 = v1[3];
  uint64_t v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0) {
    uint64_t v20 = v1[2] & 0xFFFFFFFFFFFFLL;
  }
  if (!v20) {
    return (void *)MEMORY[0x263F8EE78];
  }
  v64 = v5;
  uint64_t v57 = v16;
  sub_262B678A0();
  if (qword_26A994338 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v9, (uint64_t)qword_26A994398);
  unint64_t v22 = (uint64_t (*)(void))MEMORY[0x263F88E40];
  sub_262B65EDC(v21, (uint64_t)v11, MEMORY[0x263F88E40]);
  v78[0] = 0;
  v78[1] = (id)0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  v78[0] = (id)0xD000000000000010;
  v78[1] = (id)0x8000000262B682B0;
  sub_262B67880();
  sub_262B67A90();
  swift_bridgeObjectRelease();
  sub_262B67A90();
  sub_262B67920();
  swift_bridgeObjectRelease();
  sub_262B661E4((uint64_t)v11, v22);
  id v23 = (void *)v1[4];
  id v24 = (void *)sub_262B67A70();
  v78[0] = 0;
  id v25 = objc_msgSend(v23, sel_contentsOfDirectoryAtPath_error_, v24, v78);

  id v26 = v78[0];
  if (!v25)
  {
    id v48 = v78[0];
    v49 = v18;
    uint64_t v50 = sub_262B67870();

    swift_willThrow();
    v51 = (uint64_t (*)(void))MEMORY[0x263F88E40];
    sub_262B65EDC(v21, (uint64_t)v11, MEMORY[0x263F88E40]);
    v78[0] = 0;
    v78[1] = (id)0xE000000000000000;
    sub_262B67AE0();
    sub_262B67A90();
    swift_bridgeObjectRetain();
    sub_262B67A90();
    swift_bridgeObjectRelease();
    sub_262B67A90();
    uint64_t v76 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994368);
    sub_262B67AF0();
    sub_262B67930();
    swift_bridgeObjectRelease();
    MEMORY[0x263E5CC00](v50);
    sub_262B661E4((uint64_t)v11, v51);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v49, v75);
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v65 = v21;
  v67 = v11;
  uint64_t v27 = sub_262B67AA0();
  id v28 = v26;

  uint64_t v29 = *(void *)(v27 + 16);
  v66 = v18;
  if (v29)
  {
    unsigned int v63 = *MEMORY[0x263F06E50];
    v61 = (void (**)(char *, uint64_t))(v7 + 8);
    v62 = (void (**)(char *, void, uint64_t))(v7 + 104);
    v60 = (void (**)(char *, char *, uint64_t))(v57 + 16);
    v59 = (void (**)(char *, uint64_t))(v57 + 8);
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_262B65E30();
    uint64_t v56 = v27;
    uint64_t v31 = (void **)(v27 + 40);
    uint64_t v32 = (void *)MEMORY[0x263F8EE78];
    uint64_t v33 = v65;
    unint64_t v58 = v30;
    do
    {
      uint64_t v34 = *(v31 - 1);
      v35 = *v31;
      v78[0] = v34;
      v78[1] = v35;
      uint64_t v76 = 0x6C65646F6D6C6D2ELL;
      unint64_t v77 = 0xE900000000000063;
      swift_bridgeObjectRetain();
      if (sub_262B67AC0())
      {
        v78[0] = v34;
        v78[1] = v35;
        v36 = v69;
        uint64_t v37 = v33;
        uint64_t v38 = v70;
        (*v62)(v69, v63, v70);
        v72 = v32;
        v39 = v73;
        sub_262B678C0();
        (*v61)(v36, v38);
        (*v60)(v68, v39, v75);
        uint64_t v40 = v74;
        sub_262B679A0();
        v41 = (uint64_t (*)(void))MEMORY[0x263F88E40];
        uint64_t v42 = v37;
        uint64_t v43 = (uint64_t)v67;
        sub_262B65EDC(v42, (uint64_t)v67, MEMORY[0x263F88E40]);
        v78[0] = 0;
        v78[1] = (id)0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_262B67AE0();
        swift_bridgeObjectRelease();
        strcpy((char *)v78, "Load model ");
        HIDWORD(v78[1]) = -352321536;
        sub_262B67A90();
        swift_bridgeObjectRelease();
        sub_262B67A90();
        sub_262B65E84();
        uint64_t v32 = v72;
        sub_262B67B00();
        sub_262B67A90();
        swift_bridgeObjectRelease();
        sub_262B67A90();
        sub_262B67920();
        swift_bridgeObjectRelease();
        v44 = v41;
        uint64_t v45 = (uint64_t)v64;
        sub_262B661E4(v43, v44);
        sub_262B65EDC(v40, v45, MEMORY[0x263F88E78]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v32 = (void *)sub_262B65FAC(0, v32[2] + 1, 1, v32);
        }
        unint64_t v47 = v32[2];
        unint64_t v46 = v32[3];
        uint64_t v33 = v65;
        if (v47 >= v46 >> 1) {
          uint64_t v32 = (void *)sub_262B65FAC(v46 > 1, v47 + 1, 1, v32);
        }
        v32[2] = v47 + 1;
        sub_262B66180(v45, (uint64_t)v32+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v47);
        sub_262B661E4(v74, MEMORY[0x263F88E78]);
        (*v59)(v73, v75);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v31 += 2;
      --v29;
    }
    while (v29);
    uint64_t v27 = v56;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x263F8EE78];
    uint64_t v33 = v65;
  }
  v52 = (uint64_t (*)(void))MEMORY[0x263F88E40];
  uint64_t v53 = (uint64_t)v67;
  sub_262B65EDC(v33, (uint64_t)v67, MEMORY[0x263F88E40]);
  v78[0] = 0;
  v78[1] = (id)0xE000000000000000;
  sub_262B67AE0();
  swift_bridgeObjectRelease();
  strcpy((char *)v78, "Found files: ");
  HIWORD(v78[1]) = -4864;
  MEMORY[0x263E5C980](v27, MEMORY[0x263F8D310]);
  sub_262B67A90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_262B67A90();
  sub_262B67920();
  swift_bridgeObjectRelease();
  sub_262B661E4(v53, v52);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v66, v75);
  return v32;
}

unint64_t sub_262B65E30()
{
  unint64_t result = qword_26A9943B0;
  if (!qword_26A9943B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9943B0);
  }
  return result;
}

unint64_t sub_262B65E84()
{
  unint64_t result = qword_26A9943B8;
  if (!qword_26A9943B8)
  {
    sub_262B678D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9943B8);
  }
  return result;
}

uint64_t sub_262B65EDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t ShadowModelProvider.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ShadowModelProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

size_t sub_262B65FAC(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9943C0);
  uint64_t v10 = *(void *)(sub_262B679B0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_262B679B0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_262B66180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_262B679B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262B661E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ShadowModelProvider()
{
  return self;
}

uint64_t ShadowModeMain.trialSet.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_262B67530(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, a1, MEMORY[0x263F88E50]);
}

uint64_t ShadowModeMain.recipePath.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_recipePath);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShadowModeMain.modelPaths.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_262B66320()
{
  uint64_t v0 = sub_262B67940();
  __swift_allocate_value_buffer(v0, qword_26A9943D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A9943D0);
  type metadata accessor for ShadowModeMain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994458);
  return sub_262B67950();
}

uint64_t ShadowModeMain.__allocating_init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  uint64_t v16 = swift_allocObject();
  ShadowModeMain.init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t ShadowModeMain.init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  uint64_t v9 = v8;
  uint64_t v14 = (void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_recipePath);
  *uint64_t v14 = a1;
  v14[1] = a2;
  uint64_t v15 = (void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  *uint64_t v15 = a3;
  v15[1] = a4;
  uint64_t v16 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet;
  sub_262B67530(a5, v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, MEMORY[0x263F88E50]);
  uint64_t v17 = OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager;
  *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager) = a7;
  *(unsigned char *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_skipPublishMetrics) = a8;
  type metadata accessor for RecipeParser();
  inited = (void *)swift_initStackObject();
  inited[3] = a2;
  inited[4] = 0;
  inited[2] = a1;
  swift_bridgeObjectRetain();
  id v19 = a7;
  RecipeParser.parsing()();
  if (v20)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1(a6);
    uint64_t v21 = (uint64_t (*)(void))MEMORY[0x263F88E50];
    sub_262B67598(a5, MEMORY[0x263F88E50]);
    sub_262B67598(v16, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    type metadata accessor for ShadowModeMain();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_numOffsets) = sub_262B63EE8(0x657366664F6D756ELL, 0xEA00000000007374, 23);
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifStartDaysUntilNow) = sub_262B63EE8(0xD000000000000016, 0x8000000262B68190, 10);
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifEndDaysUntilNow) = sub_262B63EE8(0xD000000000000014, 0x8000000262B681B0, 3);
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelDurationInDays) = sub_262B63EE8(0xD000000000000013, 0x8000000262B681D0, 3);
    sub_262B67990();
    uint64_t v22 = sub_262B67970();
    sub_262B63EE8(0xD000000000000012, 0x8000000262B681F0, v22);
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_offsetTimeInterval) = sub_262B67980();
    uint64_t v23 = *(void *)sub_262B67A10();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_262B64520(0x69746E6563726570, 0xEB0000000073656CLL, v23);
    swift_bridgeObjectRelease();
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_percentiles) = v24;
    unint64_t v25 = *(void *)sub_262B67A30();
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_262B64218(0x676E696C6562616CLL, 0xEE00656372756F53, v25);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v29 = (unint64_t *)(v9
                             + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource);
    *uint64_t v29 = v26;
    v29[1] = v28;
    *(void *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_minsUntilOpen) = sub_262B63EE8(0x69746E55736E696DLL, 0xED00006E65704F6CLL, 4320);
    char v30 = sub_262B64850(0x746144796D6D7564, 0xE900000000000061, 0);
    *(unsigned char *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_dummyData) = v30 & 1;
    if (v30)
    {
      uint64_t v31 = sub_262B679D0();
      uint64_t v32 = swift_allocObject();
      v38[3] = v31;
      v38[4] = MEMORY[0x263F88E80];

      swift_release();
      v38[0] = v32;
      __swift_destroy_boxed_opaque_existential_1(a6);
      sub_262B67598(a5, MEMORY[0x263F88E50]);
      uint64_t v33 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager;
      uint64_t v34 = (long long *)v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_bridgeObjectRelease();

      sub_262B67598(a5, MEMORY[0x263F88E50]);
      uint64_t v33 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager;
      uint64_t v34 = (long long *)a6;
    }
    sub_262B633CC(v34, v33);
  }
  return v9;
}

uint64_t type metadata accessor for ShadowModeMain()
{
  uint64_t result = qword_26A994448;
  if (!qword_26A994448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_262B66914()
{
  uint64_t v1 = v0;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_dummyData) == 1)
  {
    if (qword_26A994340 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  if (qword_26A994340 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  uint64_t v2 = sub_262B67940();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A9943D0);
  sub_262B67920();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_numOffsets);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifStartDaysUntilNow);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifEndDaysUntilNow);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelDurationInDays);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_offsetTimeInterval);
  sub_262B674CC(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager, (uint64_t)v11);
  type metadata accessor for EvaluationDataSearch();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8EE78];
  v8[2] = MEMORY[0x263F8EE78];
  v8[3] = v9;
  v8[4] = v3;
  v8[5] = v4;
  v8[6] = v5;
  v8[7] = v6;
  v8[8] = v7;
  sub_262B633CC(v11, (uint64_t)(v8 + 9));
  return v8;
}

uint64_t ShadowModeMain.run()()
{
  uint64_t v1 = v0;
  uint64_t v56 = sub_262B67910();
  uint64_t v2 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v4 = (char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_262B67900();
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v7 = (char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_262B67960();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = MEMORY[0x263E5C920](v9);
  char v13 = MEMORY[0x263E5C890]();
  if ((v12 & 1) != 0 && (v13 & 1) == 0)
  {
    if (qword_26A994340 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_262B67940();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A9943D0);
    sub_262B67920();
    return 0;
  }
  v54 = v11;
  uint64_t v52 = v5;
  uint64_t v15 = sub_262B66914();
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource);
  uint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource + 8);
  uint64_t v18 = (void *)sub_262B67A30();
  if (v16 == *v18 && v17 == v18[1]) {
    int v20 = 1;
  }
  else {
    int v20 = sub_262B67B10();
  }
  sub_262B67A00();
  uint64_t v21 = sub_262B679F0();
  swift_beginAccess();
  v15[2] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(v15[2] + 16);
  uint64_t v23 = sub_262B679E0();
  swift_beginAccess();
  v15[3] = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = v15[3];
  if (v20)
  {
    if (v22) {
      goto LABEL_14;
    }
LABEL_22:
    if (qword_26A994340 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_262B67940();
    __swift_project_value_buffer(v36, (uint64_t)qword_26A9943D0);
    sub_262B67920();
    goto LABEL_28;
  }
  if (!*(void *)(v24 + 16)) {
    goto LABEL_22;
  }
LABEL_14:
  LODWORD(v51) = v20;
  v50[0] = v2;
  uint64_t v25 = v15[2];
  uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  uint64_t v26 = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths + 8);
  unint64_t v28 = *(void **)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager);
  type metadata accessor for ShadowModelProvider();
  inited = (void *)swift_initStackObject();
  inited[2] = v27;
  inited[3] = v26;
  inited[4] = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v30 = v28;
  uint64_t v53 = inited;
  if (!ShadowModelProvider.getModels()()[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A994340 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_262B67940();
    __swift_project_value_buffer(v37, (uint64_t)qword_26A9943D0);
    sub_262B67920();
    uint64_t v38 = v53;
    swift_setDeallocating();
    swift_bridgeObjectRelease();

LABEL_28:
    swift_release();
    return 0;
  }
  BOOL v31 = (v51 & 1) == 0;
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (v51) {
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  else {
    uint64_t v33 = v24;
  }
  uint64_t v51 = v33;
  if (!v31) {
    uint64_t v32 = v25;
  }
  v50[2] = v32;
  swift_bridgeObjectRelease();
  sub_262B674CC(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager, (uint64_t)&v57);
  v50[1] = *(void *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_numOffsets);
  sub_262B67530(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, (uint64_t)v54, MEMORY[0x263F88E50]);
  sub_262B67A60();
  swift_allocObject();
  sub_262B67A40();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_262B67A20();
  uint64_t v35 = (*(uint64_t (**)(void))(*(void *)v34 + 336))();
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(*(void *)v34 + 376))(v35);
  uint64_t v41 = *(void *)(v40 + 16);
  v54 = (char *)v40;
  uint64_t v51 = v34;
  if (v41)
  {
    uint64_t v42 = v40 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
    uint64_t v43 = *(void *)(v52 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_262B67530(v42, (uint64_t)v7, MEMORY[0x263F88D60]);
      if (qword_26A994340 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_262B67940();
      __swift_project_value_buffer(v44, (uint64_t)qword_26A9943D0);
      uint64_t v57 = 0;
      unint64_t v58 = 0xE000000000000000;
      sub_262B67AE0();
      sub_262B67A90();
      sub_262B67AF0();
      sub_262B67A90();
      sub_262B67920();
      swift_bridgeObjectRelease();
      sub_262B67598((uint64_t)v7, MEMORY[0x263F88D60]);
      v42 += v43;
      --v41;
    }
    while (v41);
    swift_bridgeObjectRelease();
    uint64_t v34 = v51;
  }
  uint64_t v45 = (*(uint64_t (**)(void))(*(void *)v34 + 368))();
  uint64_t v46 = *(void *)(v45 + 16);
  if (v46)
  {
    uint64_t v47 = v45 + ((*(unsigned __int8 *)(v50[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50[0] + 80));
    uint64_t v48 = *(void *)(v50[0] + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_262B67530(v47, (uint64_t)v4, MEMORY[0x263F88D80]);
      if (qword_26A994340 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_262B67940();
      __swift_project_value_buffer(v49, (uint64_t)qword_26A9943D0);
      uint64_t v57 = 0;
      unint64_t v58 = 0xE000000000000000;
      sub_262B67AE0();
      sub_262B67A90();
      sub_262B67AF0();
      sub_262B67A90();
      sub_262B67920();
      swift_bridgeObjectRelease();
      sub_262B67598((uint64_t)v4, MEMORY[0x263F88D80]);
      v47 += v48;
      --v46;
    }
    while (v46);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return (uint64_t)v54;
}

uint64_t sub_262B674CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_262B67530(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_262B67598(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t ShadowModeMain.deinit()
{
  sub_262B67598(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, MEMORY[0x263F88E50]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ShadowModeMain.__deallocating_deinit()
{
  sub_262B67598(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, MEMORY[0x263F88E50]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_262B67784()
{
  return type metadata accessor for ShadowModeMain();
}

uint64_t sub_262B6778C()
{
  uint64_t result = sub_262B67960();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_262B67870()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_262B67880()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_262B67890()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_262B678A0()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_262B678B0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_262B678C0()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_262B678D0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_262B678E0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_262B678F0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_262B67900()
{
  return MEMORY[0x270F885F0]();
}

uint64_t sub_262B67910()
{
  return MEMORY[0x270F886B8]();
}

uint64_t sub_262B67920()
{
  return MEMORY[0x270F88810]();
}

uint64_t sub_262B67930()
{
  return MEMORY[0x270F88830]();
}

uint64_t sub_262B67940()
{
  return MEMORY[0x270F88838]();
}

uint64_t sub_262B67950()
{
  return MEMORY[0x270F88840]();
}

uint64_t sub_262B67960()
{
  return MEMORY[0x270F888B8]();
}

uint64_t sub_262B67970()
{
  return MEMORY[0x270F88910]();
}

uint64_t sub_262B67980()
{
  return MEMORY[0x270F88918]();
}

uint64_t sub_262B67990()
{
  return MEMORY[0x270F889C8]();
}

uint64_t sub_262B679A0()
{
  return MEMORY[0x270F889D0]();
}

uint64_t sub_262B679B0()
{
  return MEMORY[0x270F889D8]();
}

uint64_t sub_262B679C0()
{
  return MEMORY[0x270F889E0]();
}

uint64_t sub_262B679D0()
{
  return MEMORY[0x270F889E8]();
}

uint64_t sub_262B679E0()
{
  return MEMORY[0x270F889F0]();
}

uint64_t sub_262B679F0()
{
  return MEMORY[0x270F889F8]();
}

uint64_t sub_262B67A00()
{
  return MEMORY[0x270F88A00]();
}

uint64_t sub_262B67A10()
{
  return MEMORY[0x270F88A08]();
}

uint64_t sub_262B67A20()
{
  return MEMORY[0x270F88A10]();
}

uint64_t sub_262B67A30()
{
  return MEMORY[0x270F88A18]();
}

uint64_t sub_262B67A40()
{
  return MEMORY[0x270F88A20]();
}

uint64_t sub_262B67A50()
{
  return MEMORY[0x270F88A28]();
}

uint64_t sub_262B67A60()
{
  return MEMORY[0x270F88A30]();
}

uint64_t sub_262B67A70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_262B67A80()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_262B67A90()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_262B67AA0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_262B67AB0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_262B67AC0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_262B67AD0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_262B67AE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_262B67AF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_262B67B00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_262B67B10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_262B67B20()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_262B67B30()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_262B67B40()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_262B67B50()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_262B67B60()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_262B67B70()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_262B67B80()
{
  return MEMORY[0x270F9FC90]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
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