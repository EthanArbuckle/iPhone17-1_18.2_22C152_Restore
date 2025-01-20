uint64_t SiriSuggestionsXPCClient.__allocating_init()()
{
  swift_allocObject();
  return SiriSuggestionsXPCClient.init()();
}

uint64_t SiriSuggestionsXPCClient.init()()
{
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442918);
  MEMORY[0x1F4188790]();
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C69E1158();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C69E1148();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_1C698F39C((uint64_t)v2);
    OUTLINED_FUNCTION_2();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v7 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v7(v6, v2, v3);
    v7((char *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport24SiriSuggestionsXPCClient_bridge), v6, v3);
  }
  return v0;
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1C698F39C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442918);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SiriSuggestionsXPCClient.__allocating_init(connection:xpcInterface:)()
{
  OUTLINED_FUNCTION_9();
  swift_allocObject();
  uint64_t v2 = SiriSuggestionsXPCClient.init()();

  return v2;
}

uint64_t SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11 = (void *)swift_task_alloc();
  uint64_t v12 = OUTLINED_FUNCTION_0((uint64_t)v11);
  uint64_t v13 = sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  void *v11 = v5;
  v11[1] = sub_1C6990AC8;
  return MEMORY[0x1F4158DE0](a1, a2, a3, a4, a5, v12, v13);
}

uint64_t SiriSuggestionsXPCClient.getNextSuggestions(requestId:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = (void *)swift_task_alloc();
  uint64_t v5 = OUTLINED_FUNCTION_0((uint64_t)v4);
  uint64_t v6 = sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  *uint64_t v4 = v2;
  v4[1] = sub_1C6990AC8;
  uint64_t v7 = MEMORY[0x1E4FBC870];
  return MEMORY[0x1F4158DE0](v3, v1, v0, v7, 0, v5, v6);
}

uint64_t SiriSuggestionsXPCClient.logEngagement(for:intent:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  uint64_t v0 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v0);
  sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_7();
  *uint64_t v0 = v1;
  v0[1] = sub_1C6990AC8;
  uint64_t v2 = OUTLINED_FUNCTION_3();
  return MEMORY[0x1F4158DF8](v2);
}

uint64_t SiriSuggestionsXPCClient.getSuggestionsForApp(for:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  uint64_t v2 = (void *)swift_task_alloc();
  uint64_t v3 = OUTLINED_FUNCTION_0((uint64_t)v2);
  sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_6();
  void *v2 = v4;
  v2[1] = sub_1C698F848;
  return MEMORY[0x1F4158DD8](v1, v0, v3);
}

uint64_t sub_1C698F848()
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t SiriSuggestionsXPCClient.logShown(for:deliveryVehicle:generationId:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  uint64_t v0 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v0);
  sub_1C6990154(&qword_1EA442958, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_7();
  *uint64_t v0 = v1;
  v0[1] = sub_1C6990AC8;
  uint64_t v2 = OUTLINED_FUNCTION_3();
  return MEMORY[0x1F4159258](v2);
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  uint64_t v10 = OUTLINED_FUNCTION_0((uint64_t)v9);
  uint64_t v11 = sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  *uint64_t v9 = v4;
  v9[1] = sub_1C6990AC8;
  return MEMORY[0x1F4158DF0](a1, a2, a3, a4, v10, v11);
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:properties:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  uint64_t v0 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v0);
  sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_7();
  *uint64_t v0 = v1;
  v0[1] = sub_1C6990AC8;
  uint64_t v2 = OUTLINED_FUNCTION_3();
  return MEMORY[0x1F4158DE8](v2);
}

uint64_t SiriSuggestionsXPCClient.submitEngagement(for:with:)()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  uint64_t v0 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v0);
  sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_6();
  *uint64_t v0 = v1;
  v0[1] = sub_1C6990AC8;
  uint64_t v2 = OUTLINED_FUNCTION_8();
  return MEMORY[0x1F4158E08](v2);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  uint64_t v0 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v0);
  sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  OUTLINED_FUNCTION_6();
  *uint64_t v0 = v1;
  v0[1] = sub_1C6990AC8;
  uint64_t v2 = OUTLINED_FUNCTION_8();
  return MEMORY[0x1F4158E10](v2);
}

uint64_t SiriSuggestionsXPCClient.refreshService()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  uint64_t v2 = OUTLINED_FUNCTION_0((uint64_t)v1);
  uint64_t v3 = sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return MEMORY[0x1F4158E00](v2, v3);
}

uint64_t SiriSuggestionsXPCClient.warmup()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  uint64_t v2 = OUTLINED_FUNCTION_0((uint64_t)v1);
  uint64_t v3 = sub_1C6990154(&qword_1EA442930, MEMORY[0x1E4FA4340]);
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return MEMORY[0x1F4158E18](v2, v3);
}

uint64_t SiriSuggestionsXPCClient.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport24SiriSuggestionsXPCClient_bridge;
  sub_1C69E1158();
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t SiriSuggestionsXPCClient.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport24SiriSuggestionsXPCClient_bridge;
  sub_1C69E1158();
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1C699007C()
{
  return sub_1C6990154(&qword_1EA442990, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsXPCClient);
}

uint64_t type metadata accessor for SiriSuggestionsXPCClient()
{
  uint64_t result = qword_1EA442A00;
  if (!qword_1EA442A00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C699010C()
{
  return sub_1C6990154(qword_1EA442998, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsXPCClient);
}

uint64_t sub_1C6990154(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C699019C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.getNextSuggestions(requestId:)();
}

uint64_t sub_1C6990250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)(a1, a2, a3, a4, a5);
}

uint64_t sub_1C699031C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C698F848;
  return SiriSuggestionsXPCClient.refreshService()();
}

uint64_t sub_1C69903B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1C6990AC8;
  return MEMORY[0x1F4159030](a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C6990494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)(a1, a2, a3, a4);
}

uint64_t sub_1C6990554()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.submitAsync(for:properties:)();
}

uint64_t sub_1C6990604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6990AC8;
  return MEMORY[0x1F4159040](a1, a2, a3, a4);
}

uint64_t sub_1C69906C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.logShown(for:deliveryVehicle:generationId:)();
}

uint64_t sub_1C6990774()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.logEngagement(for:intent:)();
}

uint64_t sub_1C6990824()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.warmup()();
}

uint64_t sub_1C69908B4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.submitEngagement(for:with:)();
}

uint64_t sub_1C699095C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6990AC8;
  return SiriSuggestionsXPCClient.submitEngagement(for:with:)();
}

uint64_t sub_1C6990A04()
{
  return type metadata accessor for SiriSuggestionsXPCClient();
}

uint64_t sub_1C6990A0C()
{
  uint64_t result = sub_1C69E1158();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriSuggestionsXPCClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SiriSuggestionsXPCClient);
}

uint64_t dispatch thunk of SiriSuggestionsXPCClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_1C69E1158();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t sub_1C6990B98()
{
  OUTLINED_FUNCTION_32();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 8) + **(int **)(v0 + 8));
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28(v10);
  void *v11 = v12;
  v11[1] = sub_1C6995B5C;
  return v14(v9, v7, v5, v3, v1);
}

uint64_t sub_1C6990CAC()
{
  OUTLINED_FUNCTION_6_0();
  v1[14] = v2;
  v1[15] = v0;
  v1[12] = v3;
  v1[13] = v4;
  uint64_t v5 = sub_1C69E0F78();
  v1[16] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[17] = v6;
  v1[18] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C6990D3C()
{
  uint64_t v1 = v0[15];
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  if (sub_1C69E18F8())
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1C69E1C68();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085C0);
    uint64_t v3 = (void *)sub_1C69E1C48();
    os_log_type_t v4 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_22(v4))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_16(&dword_1C698D000, v5, v6, "Using SiriHelp with SMART");
      OUTLINED_FUNCTION_17();
    }
    uint64_t v7 = v0[15];

    uint64_t v8 = v7 + 136;
LABEL_13:
    sub_1C6995840(v8, (uint64_t)(v0 + 2));
    goto LABEL_19;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v9 = sub_1C69E15E8();
  v0[10] = v9;
  v0[11] = sub_1C69957F8(&qword_1EA442B38, MEMORY[0x1E4FA4618]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x1E4FA4608], v9);
  char v11 = sub_1C69E1918();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  if (v11)
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1C69E1C68();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EBC085C0);
    uint64_t v13 = (void *)sub_1C69E1C48();
    os_log_type_t v14 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_22(v14))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_16(&dword_1C698D000, v15, v16, "Using ResponseFramework 2.0");
      OUTLINED_FUNCTION_17();
    }
    uint64_t v17 = v0[15];

    uint64_t v8 = v17 + 96;
    goto LABEL_13;
  }
  sub_1C6995840(v0[15] + 56, (uint64_t)(v0 + 2));
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1C69E1C68();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EBC085C0);
  v19 = (void *)sub_1C69E1C48();
  os_log_type_t v20 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_22(v20))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_16(&dword_1C698D000, v21, v22, "Using ResponseFramework 1.0");
    OUTLINED_FUNCTION_17();
  }

LABEL_19:
  OUTLINED_FUNCTION_14();
  v23();
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_1C69E18E8();
  sub_1C69E0F08();
  uint64_t v24 = v0[5];
  uint64_t v25 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v24);
  v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 + 8) + **(int **)(v25 + 8));
  v26 = (void *)swift_task_alloc();
  v0[19] = v26;
  void *v26 = v0;
  v26[1] = sub_1C699117C;
  uint64_t v27 = v0[18];
  uint64_t v28 = v0[14];
  uint64_t v29 = v0[12];
  return v31(v29, v27, v28, v24, v25);
}

uint64_t sub_1C699117C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 160) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C6991258()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  v1();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v2();
}

uint64_t sub_1C69912D4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  v1();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t sub_1C6991354()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  return v0;
}

uint64_t sub_1C699138C()
{
  sub_1C6991354();
  return MEMORY[0x1F4186488](v0, 176, 7);
}

uint64_t type metadata accessor for SiriHelpResponseVersionInvoker()
{
  return self;
}

uint64_t sub_1C69913E4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6991498;
  return sub_1C6990CAC();
}

uint64_t sub_1C6991498()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C6991558(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_templatesUrl;
  sub_1C69E05E8();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, a1);
  *(void *)(v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals) = a2;
  sub_1C69958A4(a3, v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider);
  if (a4)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a4;
    *(void *)(v13 + 24) = a5;
    os_log_type_t v14 = &unk_1EA442B60;
  }
  else
  {
    os_log_type_t v14 = &unk_1EA442B40;
    uint64_t v13 = 0;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t v16 = (void *)(v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternExecutor);
  *uint64_t v16 = &unk_1EA442B50;
  v16[1] = v15;
  return v5;
}

uint64_t sub_1C699168C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int *a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v7 = *a3;
  uint64_t v8 = *a4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v9;
  *uint64_t v9 = v5;
  v9[1] = sub_1C6991780;
  return v11(a2, v7, v8);
}

uint64_t sub_1C6991780()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  void *v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_1C699185C(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  v4[7] = a1;
  v4[8] = a2;
  uint64_t v7 = sub_1C69E0CB8();
  v4[9] = v7;
  v4[10] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *a3;
  v4[11] = v8;
  v4[12] = v9;
  v4[13] = *a4;
  return MEMORY[0x1F4188298](sub_1C6991930, 0, 0);
}

uint64_t sub_1C6991930()
{
  OUTLINED_FUNCTION_20();
  sub_1C69E0C78();
  OUTLINED_FUNCTION_15();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6991A00;
  uint64_t v2 = OUTLINED_FUNCTION_38(*(void *)(v0 + 64));
  return MEMORY[0x1F4150810](v2, 0xD00000000000001ALL);
}

uint64_t sub_1C6991A00()
{
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  OUTLINED_FUNCTION_26();
  *uint64_t v7 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  if (!v0) {
    *(void *)(v5 + 128) = v3;
  }
  OUTLINED_FUNCTION_12();
  v8();
  sub_1C6995768(v5 + 16, &qword_1EA442AF8);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C6991B60()
{
  OUTLINED_FUNCTION_6_0();
  **(void **)(v0 + 56) = *(void *)(v0 + 128);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v1();
}

uint64_t sub_1C6991BC4()
{
  OUTLINED_FUNCTION_6_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v0();
}

uint64_t sub_1C6991C20(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v8 = (int *)((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[5] = v6;
  void *v6 = v4;
  v6[1] = sub_1C6991D28;
  return ((uint64_t (*)(void *, uint64_t, void *, void *))v8)(v4 + 4, a1, v4 + 2, v4 + 3);
}

uint64_t sub_1C6991D28()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 32);
    uint64_t v10 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v10(v9);
  }
}

uint64_t sub_1C6991E38()
{
  OUTLINED_FUNCTION_6_0();
  v1[4] = v2;
  v1[5] = v0;
  v1[2] = v3;
  v1[3] = v4;
  uint64_t v5 = sub_1C69E05E8();
  v1[6] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[7] = v6;
  v1[8] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C6991EC8()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = sub_1C69E0EE8();
  v0[9] = v5;
  uint64_t v6 = *(int **)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternExecutor);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_templatesUrl, v3);
  uint64_t v7 = *(void **)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals);
  if (v7)
  {
    uint64_t v8 = *(void *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals);
  }
  else
  {
    sub_1C69E0C28();
    uint64_t v8 = sub_1C69E0C18();
    uint64_t v7 = 0;
  }
  v0[10] = v8;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v6 + *v6);
  id v9 = v7;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1C6992044;
  uint64_t v11 = OUTLINED_FUNCTION_38(v0[8]);
  return v13(v11, v5, v8);
}

uint64_t sub_1C6992044()
{
  OUTLINED_FUNCTION_32();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  void *v6 = *v1;
  *(void *)(v5 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  uint64_t v8 = *(void **)(v7 + 80);
  if (!v0) {
    *(void *)(v5 + 104) = v3;
  }
  OUTLINED_FUNCTION_12();
  v9();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1C69921CC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = (uint64_t *)v0[2];
  __swift_project_boxed_opaque_existential_1((void *)(v0[5] + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider), *(void *)(v0[5]+ OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider+ 24));
  uint64_t v3 = sub_1C69E06E8();
  uint64_t v4 = sub_1C69E06D8();
  uint64_t v5 = MEMORY[0x1E4FA1740];
  v2[3] = v4;
  v2[4] = v5;

  uint64_t *v2 = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v6();
}

uint64_t sub_1C6992298()
{
  OUTLINED_FUNCTION_6_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v0();
}

uint64_t sub_1C69922F4()
{
  sub_1C69E05E8();
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = OUTLINED_FUNCTION_27();
  v2(v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider);
  swift_release();
  return v0;
}

uint64_t sub_1C699237C()
{
  return sub_1C6995180((void (*)(void))sub_1C69922F4);
}

uint64_t sub_1C6992394()
{
  return type metadata accessor for SiriHelpResponseFramework1Invoker(0);
}

uint64_t type metadata accessor for SiriHelpResponseFramework1Invoker(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EA442A50);
}

uint64_t sub_1C69923BC()
{
  uint64_t result = sub_1C69E05E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1C699246C()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C6991E38();
}

void sub_1C6992520()
{
  algn_1EA442A18[7] = -18;
}

uint64_t sub_1C6992550(uint64_t a1, uint64_t a2, long long *a3, char a4)
{
  uint64_t v9 = v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId;
  strcpy((char *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId), "com.apple.siri");
  *(unsigned char *)(v9 + 15) = -18;
  uint64_t v10 = v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_templatesUrl;
  sub_1C69E05E8();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v10, a1);
  *(void *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals) = a2;
  sub_1C69958A4(a3, v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher);
  *(unsigned char *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet) = a4;
  return v4;
}

uint64_t sub_1C699262C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E05E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_19();
  uint64_t v12 = v11 - v10;
  OUTLINED_FUNCTION_14();
  v13();
  sub_1C6995840(a3, (uint64_t)v16);
  type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  uint64_t v14 = OUTLINED_FUNCTION_35();
  sub_1C6992550(v12, a2, v16, 0);
  __swift_destroy_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v6);
  return v14;
}

uint64_t sub_1C6992730(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v113 = a5;
  uint64_t v110 = a3;
  unint64_t v111 = a4;
  v109 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B18);
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_23(v6);
  uint64_t v7 = sub_1C69E0E48();
  OUTLINED_FUNCTION_1_0();
  uint64_t v96 = v8;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v95 = (void (*)(void))((char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v112 = (char *)&v88 - v12;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_23((uint64_t)&v88 - v13);
  uint64_t v107 = sub_1C69E07B8();
  OUTLINED_FUNCTION_1_0();
  v105 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_11();
  uint64_t v106 = v16;
  uint64_t v103 = sub_1C69E0848();
  OUTLINED_FUNCTION_1_0();
  uint64_t v114 = v17;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_23(v19);
  uint64_t v20 = sub_1C69E0818();
  OUTLINED_FUNCTION_1_0();
  uint64_t v104 = v21;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_19();
  uint64_t v25 = v24 - v23;
  v108 = (void (**)(uint64_t, void (*)(void)))sub_1C69E0CB8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v27 = v26;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B20);
  OUTLINED_FUNCTION_8_0();
  uint64_t v30 = MEMORY[0x1F4188790](v29);
  uint64_t v32 = (uint64_t *)((char *)&v88 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v30);
  v34 = (char *)&v88 - v33;
  sub_1C69957F8(&qword_1EA442B28, MEMORY[0x1E4FA4270]);
  uint64_t v115 = sub_1C69E1C98();
  sub_1C69E0C48();
  uint64_t v118 = 0;
  memset(v117, 0, sizeof(v117));
  sub_1C69E0CA8();
  sub_1C69E0C38();
  (*(void (**)(uint64_t, void))(v27 + 8))(v5, v108);
  sub_1C6995768((uint64_t)v117, &qword_1EA442AF8);
  sub_1C6995700((uint64_t)v34, (uint64_t)v32);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v35 = (uint64_t)v34;
    v36 = (void *)*v32;
    if (qword_1EBC085D8 != -1) {
LABEL_53:
    }
      swift_once();
    uint64_t v37 = sub_1C69E1C68();
    __swift_project_value_buffer(v37, (uint64_t)qword_1EBC085C0);
    v38 = v36;
    v39 = v36;
    v40 = sub_1C69E1C48();
    os_log_type_t v41 = sub_1C69E1EE8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(void *)&v117[0] = swift_slowAlloc();
      *(_DWORD *)v42 = 136315138;
      swift_getErrorValue();
      uint64_t v43 = sub_1C69E21C8();
      uint64_t v116 = sub_1C69A8148(v43, v44, (uint64_t *)v117);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C698D000, v40, v41, "Error: %s", v42, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
    }
    sub_1C6995768(v35, &qword_1EA442B20);
    return v115;
  }
  uint64_t v45 = v104;
  (*(void (**)(uint64_t, void *, uint64_t))(v104 + 32))(v25, v32, v20);
  uint64_t v46 = sub_1C69E0808();
  v36 = (void *)v46;
  uint64_t v113 = *(void *)(v46 + 16);
  if (!v113)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = v115;
LABEL_48:
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v25, v20);
    sub_1C6995768((uint64_t)v34, &qword_1EA442B20);
    return v35;
  }
  uint64_t v88 = v25;
  uint64_t v89 = v20;
  v90 = v34;
  unint64_t v47 = 0;
  unint64_t v111 = v46 + ((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80));
  uint64_t v110 = v114 + 16;
  ++v105;
  v97 = (void (**)(uint64_t, uint64_t, uint64_t))(v96 + 32);
  v99 = (void (**)(void))(v96 + 16);
  v100 = (void (**)(char *, uint64_t))(v96 + 8);
  v108 = (void (**)(uint64_t, void (*)(void)))(v114 + 8);
  unsigned int v93 = *MEMORY[0x1E4FA4268];
  v92 = (void (**)(void (*)(void), void, uint64_t))(v96 + 104);
  v94 = "suggestionsDialog";
  unint64_t v91 = 0x80000001C69E48F0;
  uint64_t v35 = v115;
  v48 = (void (*)(void))v103;
  uint64_t v49 = v98;
  v109 = (void *)v46;
  while (1)
  {
    if (v47 >= v36[2])
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    uint64_t v50 = v7;
    (*(void (**)(uint64_t, unint64_t, void (*)(void)))(v114 + 16))(v49, v111 + *(void *)(v114 + 72) * v47, v48);
    uint64_t v51 = sub_1C69E0828();
    OUTLINED_FUNCTION_21(v51, v52);
    sub_1C69956B4();
    uint64_t v53 = sub_1C69E1F48();
    swift_bridgeObjectRelease();
    uint64_t v54 = *(void *)(v53 + 16);
    if (!v54)
    {
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    uint64_t v115 = v35;
    v48 = *(void (**)(void))(v53 + 16 * v54 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1C69E0838();
    uint64_t v55 = sub_1C69E07A8();
    uint64_t v45 = v56;
    v57 = *v105;
    OUTLINED_FUNCTION_13();
    v57();
    uint64_t v58 = v102;
    sub_1C69E0E38();
    if (__swift_getEnumTagSinglePayload(v58, 1, v7) == 1) {
      break;
    }
    uint64_t v69 = v55;
    (*v97)((uint64_t)v101, v58, v7);
    v48 = *v99;
    v36 = v112;
    OUTLINED_FUNCTION_14();
    v48();
    uint64_t v70 = v115;
    swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v117[0] = v70;
    unint64_t v71 = sub_1C69A8910();
    uint64_t v73 = *(void *)(v70 + 16);
    BOOL v74 = (v72 & 1) == 0;
    uint64_t v35 = v73 + v74;
    if (__OFADD__(v73, v74)) {
      goto LABEL_51;
    }
    unint64_t v75 = v71;
    v36 = v72;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B30);
    if (sub_1C69E2058())
    {
      unint64_t v76 = sub_1C69A8910();
      if ((v36 & 1) != (v77 & 1)) {
        goto LABEL_55;
      }
      unint64_t v75 = v76;
    }
    uint64_t v35 = *(void *)&v117[0];
    if (v36)
    {
      v78 = (uint64_t *)(*(void *)(*(void *)&v117[0] + 56) + 16 * v75);
      swift_bridgeObjectRelease();
      uint64_t *v78 = v69;
      v78[1] = v45;
    }
    else
    {
      *(void *)(*(void *)&v117[0] + 8 * (v75 >> 6) + 64) |= 1 << v75;
      OUTLINED_FUNCTION_14();
      v48();
      v79 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v75);
      uint64_t *v79 = v69;
      v79[1] = v45;
      uint64_t v80 = *(void *)(v35 + 16);
      BOOL v81 = __OFADD__(v80, 1);
      uint64_t v82 = v80 + 1;
      if (v81) {
        goto LABEL_52;
      }
      *(void *)(v35 + 16) = v82;
    }
    swift_bridgeObjectRelease();
    v83 = *v100;
    (*v100)(v112, v7);
    v83(v101, v7);
    OUTLINED_FUNCTION_33();
    uint64_t v49 = v98;
LABEL_28:
    v36 = v109;
    ++v47;
    (*v108)(v49, v48);
    if (v47 == v113)
    {
      swift_bridgeObjectRelease();
      v34 = v90;
      uint64_t v20 = v89;
      uint64_t v25 = v88;
      goto LABEL_48;
    }
  }
  swift_bridgeObjectRelease();
  sub_1C6995768(v58, &qword_1EA442B18);
  uint64_t v59 = sub_1C69E0828();
  OUTLINED_FUNCTION_21(v59, v60);
  uint64_t v61 = sub_1C69E1F48();
  swift_bridgeObjectRelease();
  uint64_t v62 = *(void *)(v61 + 16);
  if (!v62) {
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_31();
  if (v64 && v63 == v91 || (OUTLINED_FUNCTION_9_0() & 1) != 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    v48 = v95;
    uint64_t v7 = v50;
    (*v92)(v95, v93, v50);
    uint64_t v45 = v106;
    sub_1C69E0838();
    uint64_t v65 = sub_1C69E07A8();
    uint64_t v67 = v66;
    OUTLINED_FUNCTION_13();
    v57();
    uint64_t v68 = v115;
    swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v117[0] = v68;
    sub_1C69B69B4(v65, v67, (uint64_t)v48);
    uint64_t v35 = *(void *)&v117[0];
    swift_bridgeObjectRelease();
    (*v100)((char *)v48, v50);
LABEL_27:
    OUTLINED_FUNCTION_33();
    goto LABEL_28;
  }
  if (v62 == 1) {
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_31();
  if (v64)
  {
    OUTLINED_FUNCTION_37();
    if (v64) {
      goto LABEL_15;
    }
  }
  if (OUTLINED_FUNCTION_9_0()) {
    goto LABEL_15;
  }
  if (v62 == 2)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v35 = v115;
    goto LABEL_27;
  }
  uint64_t v84 = v61 + 72;
  uint64_t v85 = 2;
  while (1)
  {
    uint64_t v86 = v85 + 1;
    if (__OFADD__(v85, 1)) {
      break;
    }
    OUTLINED_FUNCTION_31();
    if (v64)
    {
      OUTLINED_FUNCTION_37();
      if (v64) {
        goto LABEL_15;
      }
    }
    if (OUTLINED_FUNCTION_9_0()) {
      goto LABEL_15;
    }
    v84 += 16;
    ++v85;
    uint64_t v45 = v104;
    if (v86 == v62)
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = v115;
      uint64_t v7 = v50;
      v48 = (void (*)(void))v103;
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_55:
  uint64_t result = sub_1C69E21B8();
  __break(1u);
  return result;
}

uint64_t sub_1C69932F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C699333C()
{
  OUTLINED_FUNCTION_6_0();
  v1[18] = v2;
  v1[19] = v0;
  v1[16] = v3;
  v1[17] = v4;
  v1[14] = v5;
  v1[15] = v6;
  uint64_t v7 = sub_1C69E05E8();
  v1[20] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[21] = v8;
  v1[22] = OUTLINED_FUNCTION_24();
  uint64_t v9 = sub_1C69E0CB8();
  v1[23] = v9;
  OUTLINED_FUNCTION_2_0(v9);
  v1[24] = v10;
  v1[25] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1C6993400()
{
  OUTLINED_FUNCTION_20();
  sub_1C69B7D68(0x61626C6C61467369, 0xEA00000000006B63, *(void *)(v0 + 136), (_OWORD *)(v0 + 56));
  if (*(void *)(v0 + 80))
  {
    if swift_dynamicCast() && (*(unsigned char *)(v0 + 248))
    {
      unint64_t v1 = 0xEE00707041646574;
      unint64_t v2 = 0x726F707075736E75;
      goto LABEL_10;
    }
  }
  else
  {
    sub_1C6995768(v0 + 56, qword_1EBC07810);
  }
  unint64_t v2 = 0x6974736567677573;
  if (*(unsigned char *)(*(void *)(v0 + 152)
                + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet))
    unint64_t v2 = 0xD000000000000011;
  unint64_t v1 = 0x80000001C69E48D0;
  if (!*(unsigned char *)(*(void *)(v0 + 152)
                 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet))
    unint64_t v1 = 0xEB00000000736E6FLL;
LABEL_10:
  *(void *)(v0 + 208) = v2;
  *(void *)(v0 + 216) = v1;
  sub_1C69E0C98();
  OUTLINED_FUNCTION_15();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C69935A8;
  uint64_t v4 = OUTLINED_FUNCTION_38(*(void *)(v0 + 112));
  return MEMORY[0x1F41508A0](v4);
}

uint64_t sub_1C69935A8()
{
  OUTLINED_FUNCTION_32();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  OUTLINED_FUNCTION_26();
  *uint64_t v7 = *v1;
  *(void *)(v5 + 232) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  if (v0) {

  }
  else {
    *(void *)(v5 + 240) = v3;
  }
  uint64_t v8 = OUTLINED_FUNCTION_25();
  v9(v8);
  sub_1C6995768(v5 + 16, &qword_1EA442AF8);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1C6993718()
{
  OUTLINED_FUNCTION_32();
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  id v3 = *(id *)(v0 + 240);
  id v4 = objc_msgSend(v3, sel_dialog);
  sub_1C6995674();
  unint64_t v5 = sub_1C69E1DB8();

  sub_1C6993C94(v5, v2, v1);
  uint64_t v6 = (void *)sub_1C69E1DA8();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setDialog_, v6);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(id))(v0 + 8);
  return v7(v3);
}

uint64_t sub_1C6993828()
{
  uint64_t v25 = v0;
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[20];
  uint64_t v5 = sub_1C69E1C68();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBC085C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1C69E1C48();
  os_log_type_t v7 = sub_1C69E1EE8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  unint64_t v9 = v0[27];
  if (v8)
  {
    uint64_t v21 = v0[26];
    os_log_type_t type = v7;
    log = v6;
    uint64_t v10 = v0[21];
    uint64_t v11 = v0[22];
    uint64_t v12 = v0[20];
    unint64_t v19 = v0[16];
    uint64_t v20 = v0[15];
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    sub_1C69957F8(&qword_1EA442B00, MEMORY[0x1E4F276F0]);
    uint64_t v14 = sub_1C69E2178();
    v0[11] = sub_1C69A8148(v14, v15, &v24);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[12] = sub_1C69A8148(v20, v19, &v24);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain();
    v0[13] = sub_1C69A8148(v21, v9, &v24);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, log, type, "Error loading siri help snippet dialog, dir: %s, cat id: %s,  dialogId %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_12();
    v16();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17(0);
}

uint64_t sub_1C6993B7C(id *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*a1, sel_id);
  sub_1C69E1CF8();

  sub_1C69956B4();
  uint64_t v6 = sub_1C69E1F48();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1C69932F4(v6);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    if (v7 == a2 && v9 == a3) {
      char v11 = 1;
    }
    else {
      char v11 = sub_1C69E2188();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_1C6993C94(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = 0;
      uint64_t v16 = a2;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v10 = (id)MEMORY[0x1C87A7240](v9, a1);
LABEL_7:
        char v11 = v10;
        unint64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_17;
        }
        id v17 = v10;
        char v13 = sub_1C6993B7C(&v17, a2, a3);
        if (v4)
        {
          swift_bridgeObjectRelease();

          uint64_t v14 = v18;
          swift_bridgeObjectRelease();
          swift_release();
          return v14;
        }
        if (v13)
        {
          sub_1C69E2008();
          sub_1C69E2038();
          uint64_t v4 = 0;
          sub_1C69E2048();
          sub_1C69E2018();
          a2 = v16;
        }
        else
        {
        }
        ++v9;
        if (v12 == v8)
        {
          uint64_t v14 = v18;
          goto LABEL_20;
        }
      }
      if (v9 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v8 = sub_1C69E2098();
      if (!v8) {
        goto LABEL_19;
      }
    }
    id v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v14 = MEMORY[0x1E4FBC860];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C6993E60(unint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AF0);
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_11();
  uint64_t v28 = v5;
  uint64_t v6 = sub_1C69E0E48();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_19();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_1C69E05E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_29();
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F96AC8]), sel_init);
  OUTLINED_FUNCTION_14();
  v17();
  uint64_t v18 = *(void **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals);
  if (v18)
  {
    unint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals);
  }
  else
  {
    sub_1C69E0C28();
    unint64_t v19 = (void *)sub_1C69E0C18();
    uint64_t v18 = 0;
  }
  id v20 = v18;
  uint64_t v21 = sub_1C6992730(v2, (void *)0xD00000000000002BLL, 0x80000001C69E48A0, a1, (uint64_t)v19);

  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v22(v2, v13);
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v12, *MEMORY[0x1E4FA4268], v6);
  uint64_t v23 = sub_1C69B7D10(v12, v21);
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  if (v25)
  {
    sub_1C69E05D8();
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v28, 1, v13) == 1)
    {
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v26 = (void *)sub_1C69E05A8();
      v22(v28, v13);
    }
    objc_msgSend(v29, sel_setPunchOutUri_, v26, v28);

    uint64_t v23 = sub_1C69E1EF8();
  }
  else
  {
  }
  return v23;
}

uint64_t sub_1C6994130()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AF0);
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2 - v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F96AC8]), sel_init);
  if (qword_1EA442900 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1EA442A10;
  uint64_t v6 = *(void *)algn_1EA442A18;
  swift_bridgeObjectRetain();
  sub_1C69955E4(v5, v6, v4);
  swift_bridgeObjectRelease();
  sub_1C69E1FA8();
  sub_1C69E1D58();
  swift_bridgeObjectRetain();
  sub_1C69E1D58();
  swift_bridgeObjectRelease();
  sub_1C69E05D8();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1C69E05E8();
  uint64_t v8 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) != 1)
  {
    uint64_t v8 = (void *)sub_1C69E05A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
  }
  objc_msgSend(v4, sel_setPunchOutUri_, v8, 0, 0xE000000000000000);

  uint64_t v9 = sub_1C69E1EF8();
  return v9;
}

uint64_t sub_1C6994334(unint64_t a1, char a2, char a3, char a4)
{
  if (a3 & 1) != 0 && (a2 & 1) != 0 && (a4) {
    return sub_1C6994130();
  }
  else {
    return sub_1C6993E60(a1);
  }
}

uint64_t sub_1C6994348()
{
  OUTLINED_FUNCTION_6_0();
  v1[36] = v2;
  v1[37] = v0;
  v1[34] = v3;
  v1[35] = v4;
  uint64_t v5 = sub_1C69E0FF8();
  v1[38] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[39] = v6;
  v1[40] = OUTLINED_FUNCTION_24();
  uint64_t v7 = sub_1C69E05E8();
  v1[41] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[42] = v8;
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  uint64_t v9 = sub_1C69E0F78();
  v1[45] = v9;
  OUTLINED_FUNCTION_2_0(v9);
  v1[46] = v10;
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1C6994468()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void *)(v0 + 296);
  OUTLINED_FUNCTION_14();
  v2();
  uint64_t v3 = sub_1C69E0EE8();
  *(void *)(v0 + 248) = v3;
  int v39 = *(unsigned __int8 *)(v1
                           + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet);
  if (v39 != 1) {
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v0 + 296);
  if (sub_1C69E0EB8() == *(void *)(v5
                                    + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId)
    && v6 == *(void *)(v5
                       + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId
                       + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v8 = sub_1C69E2188();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_9:
    long long v40 = 0u;
    long long v41 = 0u;
    sub_1C69A9CD8((uint64_t)&v40, 0x656D614E707061, 0xE700000000000000);
    uint64_t v4 = *(void *)(v0 + 248);
  }
  sub_1C69B7D68(0xD000000000000010, 0x80000001C69E4840, v4, (_OWORD *)(v0 + 216));
  if (*(void *)(v0 + 240))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D18);
    if (swift_dynamicCast())
    {
      uint64_t v10 = sub_1C69B9D5C(3, *(void *)(v0 + 264));
      uint64_t v14 = sub_1C69C73A8(v10, v11, v12, v13);
      *((void *)&v41 + 1) = v9;
      *(void *)&long long v40 = v14;
      sub_1C69A9CD8((uint64_t)&v40, 0xD000000000000010, 0x80000001C69E4840);
    }
  }
  else
  {
    sub_1C6995768(v0 + 216, qword_1EBC07810);
  }
LABEL_14:
  sub_1C69E0B38();
  if (qword_1EA442900 != -1) {
    swift_once();
  }
  uint64_t v15 = *(void *)(v0 + 352);
  uint64_t v16 = *(void *)(v0 + 336);
  uint64_t v17 = *(void *)(v0 + 296);
  char v18 = sub_1C69E0B28();
  unint64_t v19 = *(void *)(v0 + 248);
  swift_bridgeObjectRetain();
  char v20 = sub_1C69E0EF8();
  sub_1C6994334(v19, v39, v20 & 1, v18 & 1);
  swift_bridgeObjectRelease();
  sub_1C69E0F28();
  (*(void (**)(uint64_t))(v16 + 16))(v15);
  uint64_t v21 = *(void **)(v17 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals);
  uint64_t v37 = v21;
  if (v21)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = v21;
  }
  else
  {
    sub_1C69E0C28();
    swift_bridgeObjectRetain();
    uint64_t v21 = (void *)sub_1C69E0C18();
    uint64_t v22 = 0;
  }
  uint64_t v23 = *(void *)(v0 + 352);
  uint64_t v24 = *(void *)(v0 + 336);
  uint64_t v26 = *(void *)(v0 + 320);
  uint64_t v25 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 312);
  uint64_t v36 = *(void *)(v0 + 304);
  id v38 = v22;
  sub_1C6992730(v23, (void *)0xD000000000000021, 0x80000001C69E4810, v19, (uint64_t)v21);
  swift_bridgeObjectRelease();

  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  *(void *)(v0 + 392) = v28;
  *(void *)(v0 + 400) = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v28(v23, v25);
  OUTLINED_FUNCTION_14();
  v29();
  sub_1C69E0FE8();
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, *MEMORY[0x1E4FA42A8], v36);
  OUTLINED_FUNCTION_14();
  v30();
  *(void *)(v0 + 408) = *(void *)(v0 + 248);
  if (v37)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = v38;
    uint64_t v32 = (uint64_t)v38;
  }
  else
  {
    sub_1C69E0C28();
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_1C69E0C18();
    uint64_t v31 = v38;
  }
  *(void *)(v0 + 416) = v32;
  id v33 = v31;
  v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v34;
  void *v34 = v0;
  v34[1] = sub_1C6994908;
  OUTLINED_FUNCTION_38(*(void *)(v0 + 344));
  return sub_1C699333C();
}

uint64_t sub_1C6994908()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  uint64_t v4 = (void *)v3[52];
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v3[49];
  uint64_t v6 = v3[43];
  uint64_t v7 = v3[41];
  uint64_t v8 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v9 = v8;
  *(void *)(v11 + 432) = v10;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v5(v6, v7);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v12, v13, v14);
}

void sub_1C6994A74()
{
  uint64_t v1 = (void *)v0[54];
  if (v1)
  {
    uint64_t v3 = v0[39];
    uint64_t v2 = v0[40];
    uint64_t v4 = v0[38];
    sub_1C69E07F8();
    OUTLINED_FUNCTION_35();
    v0[55] = sub_1C69E07E8();
    v0[5] = v4;
    v0[6] = sub_1C69957F8(&qword_1EA442AD0, MEMORY[0x1E4FA42B0]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 16))(boxed_opaque_existential_1, v2, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AD8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1C69E2B70;
    *(void *)(v6 + 32) = v1;
    uint64_t v23 = v6;
    sub_1C69E1DD8();
    v0[56] = v23;
    id v7 = v1;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[57] = (uint64_t)v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1C6994D48;
    OUTLINED_FUNCTION_30();
    __asm { BR              X4 }
  }
  uint64_t v11 = v0[46];
  uint64_t v21 = v0[45];
  uint64_t v22 = v0[48];
  uint64_t v12 = v0[39];
  uint64_t v13 = v0[40];
  uint64_t v14 = v0[38];
  uint64_t v15 = (uint64_t *)v0[34];
  sub_1C6995840(v0[37] + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher, (uint64_t)(v0 + 7));
  sub_1C69E06C8();
  OUTLINED_FUNCTION_35();
  v0[32] = sub_1C69E06B8();
  uint64_t v16 = sub_1C69E06F8();
  swift_release();
  uint64_t v17 = sub_1C69E06D8();
  uint64_t v18 = MEMORY[0x1E4FA1740];
  v15[3] = v17;
  v15[4] = v18;
  *uint64_t v15 = v16;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v22, v21);
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1C6994D48()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  uint64_t v3 = v1 + 16;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

void sub_1C6994E58()
{
  uint64_t v1 = *(void **)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v13 = *(void *)(v0 + 360);
  uint64_t v14 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v12 = *(void *)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v5 = *(uint64_t **)(v0 + 272);
  sub_1C6995840(*(void *)(v0 + 296) + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher, v0 + 176);
  sub_1C6995840(v0 + 96, v0 + 136);
  uint64_t v6 = swift_allocObject();
  sub_1C69958A4((long long *)(v0 + 136), v6 + 16);
  uint64_t v7 = sub_1C69E06C8();
  OUTLINED_FUNCTION_35();
  uint64_t v8 = sub_1C69E06B8();
  uint64_t v9 = MEMORY[0x1E4FA1660];
  v5[3] = v7;
  v5[4] = v9;

  *uint64_t v5 = v8;
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v14, v13);
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1C6994FE0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1C6995000, 0, 0);
}

uint64_t sub_1C6995000()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69E0788();
  sub_1C69E0778();
  OUTLINED_FUNCTION_7_0();
  return v0();
}

uint64_t sub_1C6995068(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x1F4188298](sub_1C6995088, 0, 0);
}

uint64_t sub_1C6995088()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C6995840(*(void *)(v0 + 24), *(void *)(v0 + 16));
  OUTLINED_FUNCTION_7_0();
  return v1();
}

uint64_t sub_1C69950E0()
{
  sub_1C69E05E8();
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = OUTLINED_FUNCTION_27();
  v2(v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C6995168()
{
  return sub_1C6995180((void (*)(void))sub_1C69950E0);
}

uint64_t sub_1C6995180(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x1F4186488](v1, v2, v3);
}

uint64_t sub_1C69951DC()
{
  return type metadata accessor for SiriHelpResponseFramework2Invoker(0);
}

uint64_t type metadata accessor for SiriHelpResponseFramework2Invoker(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EA442A90);
}

uint64_t sub_1C6995204(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C6995238()
{
  uint64_t result = sub_1C69E05E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1C69952F0()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_1C69953A4;
  return sub_1C6994348();
}

uint64_t sub_1C69953A4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v3();
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

uint64_t sub_1C6995518()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C6995550()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_28(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_1C6995B5C;
  return sub_1C6995068(v2, v0 + 16);
}

void sub_1C69955E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C69E1CE8();
  objc_msgSend(a3, sel_setBundleId_, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1C6995674()
{
  unint64_t result = qword_1EA442B08;
  if (!qword_1EA442B08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA442B08);
  }
  return result;
}

unint64_t sub_1C69956B4()
{
  unint64_t result = qword_1EA442B10;
  if (!qword_1EA442B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442B10);
  }
  return result;
}

uint64_t sub_1C6995700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C6995768(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = OUTLINED_FUNCTION_27();
  v4(v3);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1C69957F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C6995840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C69958A4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1C69958BC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C69958F4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *(int **)(v0 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_1C69959BC;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA442B48 + dword_1EA442B48);
  return v10(v7, v5, v3, v8);
}

uint64_t sub_1C69959BC()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_1C6995A88()
{
  OUTLINED_FUNCTION_32();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *(int **)(v0 + 16);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28(v10);
  void *v11 = v12;
  v11[1] = sub_1C6991498;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t *, int *))((char *)&dword_1EA442B58
                                                                              + dword_1EA442B58);
  return v13(v8, v6, v4, v2, v9);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_1C69E2188();
}

uint64_t OUTLINED_FUNCTION_15()
{
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return sub_1C69E0CA8();
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_17()
{
  JUMPOUT(0x1C87A7AA0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_21(uint64_t result, uint64_t a2)
{
  *(void *)(v2 - 128) = result;
  *(void *)(v2 - 120) = a2;
  *(void *)(v2 - 176) = 35;
  *(void *)(v2 - 168) = 0xE100000000000000;
  return result;
}

BOOL OUTLINED_FUNCTION_22(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t NoOpFlow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NoOpFlow.init()()
{
  return v0;
}

uint64_t NoOpFlow.on(input:)()
{
  return 0;
}

uint64_t NoOpFlow.execute(completion:)(void (*a1)(char *))
{
  uint64_t v2 = sub_1C69E07D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  os_log_type_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA442908 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1C69E1C68();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EA442F38);
  uint64_t v7 = sub_1C69E1C48();
  os_log_type_t v8 = sub_1C69E1EE8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C698D000, v7, v8, "This method should never be called.", v9, 2u);
    MEMORY[0x1C87A7AA0](v9, -1, -1);
  }

  sub_1C69E07C8();
  a1(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t NoOpFlow.deinit()
{
  return v0;
}

uint64_t NoOpFlow.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C6996024()
{
  return 0;
}

uint64_t sub_1C699602C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1C69960DC;
  return MEMORY[0x1F4151AB0](a1, a2, a3);
}

uint64_t sub_1C69960DC(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1C69961B4(void (*a1)(char *))
{
  return NoOpFlow.execute(completion:)(a1);
}

uint64_t sub_1C69961CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1C698F848;
  return MEMORY[0x1F4151AA0](a1, a2, a3);
}

uint64_t sub_1C6996288(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t type metadata accessor for NoOpFlow()
{
  return self;
}

uint64_t method lookup function for NoOpFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NoOpFlow);
}

uint64_t dispatch thunk of NoOpFlow.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_1C69962E8()
{
  OUTLINED_FUNCTION_6_0();
  v1[8] = v2;
  v1[9] = v0;
  v1[7] = v3;
  uint64_t v4 = sub_1C69E1818();
  v1[10] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[11] = v5;
  v1[12] = swift_task_alloc();
  uint64_t v6 = sub_1C69E17A8();
  v1[13] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[14] = v7;
  v1[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  v1[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69963EC, 0, 0);
}

uint64_t sub_1C69963EC()
{
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085C0);
  uint64_t v2 = sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1EC8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C698D000, v2, v3, "Submiting suggestion to event dispatcher", v4, 2u);
    MEMORY[0x1C87A7AA0](v4, -1, -1);
  }
  uint64_t v5 = v0[16];

  sub_1C69E12D8();
  uint64_t v6 = sub_1C69E0678();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_1C69981E8(v0[16]);
    uint64_t v7 = sub_1C69E1C48();
    os_log_type_t v8 = sub_1C69E1EE8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C698D000, v7, v8, "No requestId set. Unable to dispatch suggestions", v9, 2u);
      MEMORY[0x1C87A7AA0](v9, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = v0[16];
    uint64_t v13 = v0[14];
    uint64_t v26 = v0[15];
    uint64_t v27 = v0[13];
    uint64_t v14 = v0[11];
    uint64_t v15 = v0[12];
    uint64_t v16 = (void *)v0[9];
    uint64_t v17 = v0[10];
    uint64_t v29 = v0[7];
    sub_1C69E0648();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v12, v6);
    sub_1C69E15C8();
    sub_1C69E17F8();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v17);
    sub_1C69969AC();
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v26, *MEMORY[0x1E4FA4840], v27);
    uint64_t v18 = v16[5];
    uint64_t v28 = v16[6];
    __swift_project_boxed_opaque_existential_1(v16 + 2, v18);
    __swift_project_boxed_opaque_existential_1(v16 + 7, v16[10]);
    sub_1C69E1A38();
    uint64_t v20 = v19;
    uint64_t v21 = type metadata accessor for PreFetchedSuggestionEvent();
    v0[5] = v21;
    v0[6] = sub_1C6998248(&qword_1EA442BE0, (void (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
    uint64_t v23 = (char *)boxed_opaque_existential_1 + *(int *)(v21 + 24);
    sub_1C69E1538();
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(char *, uint64_t))(v24 + 16))(v23, v29);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 16))(boxed_opaque_existential_1, v26, v27);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + *(int *)(v21 + 20)) = v20;
    uint64_t v25 = (void *)swift_task_alloc();
    v0[17] = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_1C6996840;
    return MEMORY[0x1F4159CE8](v0 + 2, v18, v28);
  }
}

uint64_t sub_1C6996840()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = v0 + 16;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return MEMORY[0x1F4188298](sub_1C6996920, 0, 0);
}

uint64_t sub_1C6996920()
{
  OUTLINED_FUNCTION_6_0();
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1C69969AC()
{
  sub_1C69E1D58();
  swift_bridgeObjectRelease();
  return sub_1C69E17E8();
}

uint64_t _s22SiriSuggestionsSupport32DispatchSuggestionServiceFactoryCfD_0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t sub_1C6996A8C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6996B34;
  return sub_1C69962E8();
}

uint64_t sub_1C6996B34()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t PreFetchedSuggestionEvent.deliveryVehicle.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1C69E17A8();
  OUTLINED_FUNCTION_8_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

double PreFetchedSuggestionEvent.receivedTS.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PreFetchedSuggestionEvent() + 20));
}

uint64_t type metadata accessor for PreFetchedSuggestionEvent()
{
  uint64_t result = qword_1EBC07CB8;
  if (!qword_1EBC07CB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PreFetchedSuggestionEvent.preFetchedSuggestions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreFetchedSuggestionEvent() + 24);
  sub_1C69E1538();
  OUTLINED_FUNCTION_8_0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

BOOL sub_1C6996D3C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C6996D4C()
{
  return sub_1C69E2228();
}

uint64_t sub_1C6996D74(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x79726576696C6564 && a2 == 0xEF656C6369686556;
  if (v3 || (sub_1C69E2188() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6465766965636572 && a2 == 0xEA00000000005354;
    if (v6 || (sub_1C69E2188() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x80000001C69E49C0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_1C69E2188();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1C6996ED4()
{
  return 3;
}

uint64_t sub_1C6996EDC()
{
  return sub_1C69E2238();
}

uint64_t sub_1C6996F24()
{
  return 0;
}

uint64_t sub_1C6996F30(char a1)
{
  if (!a1) {
    return 0x79726576696C6564;
  }
  if (a1 == 1) {
    return 0x6465766965636572;
  }
  return 0xD000000000000015;
}

BOOL sub_1C6996F9C(char *a1, char *a2)
{
  return sub_1C6996D3C(*a1, *a2);
}

uint64_t sub_1C6996FA8()
{
  return sub_1C6996EDC();
}

uint64_t sub_1C6996FB0()
{
  return sub_1C6996D4C();
}

uint64_t sub_1C6996FB8()
{
  return sub_1C69E2238();
}

uint64_t sub_1C6996FFC()
{
  return sub_1C6996F30(*v0);
}

uint64_t sub_1C6997004@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6996D74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C699702C()
{
  return sub_1C6996F24();
}

uint64_t sub_1C699704C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C6996ED4();
  *a1 = result;
  return result;
}

uint64_t sub_1C6997074(uint64_t a1)
{
  unint64_t v2 = sub_1C69972E4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C69970B0(uint64_t a1)
{
  unint64_t v2 = sub_1C69972E4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PreFetchedSuggestionEvent.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B78);
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_7_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C69972E4();
  sub_1C69E2258();
  sub_1C69E17A8();
  sub_1C6998248(&qword_1EA442B88, MEMORY[0x1E4FA4858]);
  sub_1C69E2148();
  if (!v1)
  {
    type metadata accessor for PreFetchedSuggestionEvent();
    sub_1C69E2138();
    sub_1C69E1538();
    sub_1C6998248(&qword_1EBC07C10, MEMORY[0x1E4FA44C8]);
    sub_1C69E2148();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1C69972E4()
{
  unint64_t result = qword_1EA442B80;
  if (!qword_1EA442B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442B80);
  }
  return result;
}

uint64_t PreFetchedSuggestionEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = sub_1C69E1538();
  OUTLINED_FUNCTION_1_0();
  uint64_t v23 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_19();
  uint64_t v8 = v7 - v6;
  uint64_t v28 = sub_1C69E17A8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v26 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_19();
  uint64_t v27 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B90);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_7_1();
  uint64_t v14 = type metadata accessor for PreFetchedSuggestionEvent();
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_19();
  uint64_t v18 = v17 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C69972E4();
  sub_1C69E2248();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_1C6998248(&qword_1EA442B98, MEMORY[0x1E4FA4858]);
  sub_1C69E2128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v18, v27, v28);
  sub_1C69E2118();
  *(void *)(v18 + *(int *)(v14 + 20)) = v19;
  sub_1C6998248(&qword_1EA442BA0, MEMORY[0x1E4FA44C8]);
  sub_1C69E2128();
  uint64_t v20 = OUTLINED_FUNCTION_5_1();
  v21(v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v18 + *(int *)(v14 + 24), v8, v25);
  sub_1C69976BC(v18, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1C6997720(v18);
}

uint64_t sub_1C69976BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C6997720(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C699777C()
{
  return sub_1C6998248(&qword_1EA442BA8, (void (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent);
}

uint64_t sub_1C69977C4()
{
  return sub_1C6998248(&qword_1EA442BB0, (void (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent);
}

uint64_t sub_1C6997814@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreFetchedSuggestionEvent.init(from:)(a1, a2);
}

uint64_t sub_1C699782C(void *a1)
{
  return PreFetchedSuggestionEvent.encode(to:)(a1);
}

uint64_t type metadata accessor for InAppEventDispatcher()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreFetchedSuggestionEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C69E17A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1C69E1538();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C69E17A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_1C69E1538();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E17A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C69E1538();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E17A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C69E1538();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E17A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C69E1538();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E17A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C69E1538();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C6997D38);
}

uint64_t sub_1C6997D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C69E17A8();
  OUTLINED_FUNCTION_3_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_1C69E1538();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C6997DC8);
}

uint64_t sub_1C6997DC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1C69E17A8();
  OUTLINED_FUNCTION_3_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_1C69E1538();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1C6997E74()
{
  uint64_t result = sub_1C69E17A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C69E1538();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreFetchedSuggestionEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreFetchedSuggestionEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C69980ACLL);
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

uint64_t sub_1C69980D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C69980E0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreFetchedSuggestionEvent.CodingKeys()
{
  return &type metadata for PreFetchedSuggestionEvent.CodingKeys;
}

unint64_t sub_1C69980FC()
{
  unint64_t result = qword_1EA442BB8;
  if (!qword_1EA442BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442BB8);
  }
  return result;
}

unint64_t sub_1C699814C()
{
  unint64_t result = qword_1EA442BC8;
  if (!qword_1EA442BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442BC8);
  }
  return result;
}

unint64_t sub_1C699819C()
{
  unint64_t result = qword_1EA442BD0;
  if (!qword_1EA442BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EA442BD0);
  }
  return result;
}

uint64_t sub_1C69981E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C6998248(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t sub_1C69982D8()
{
  OUTLINED_FUNCTION_6_0();
  v1[5] = v2;
  v1[6] = v0;
  v1[4] = v3;
  uint64_t v4 = sub_1C69E14C8();
  v1[7] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[8] = v5;
  v1[9] = OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  v1[10] = OUTLINED_FUNCTION_24();
  sub_1C69E1758();
  v1[11] = OUTLINED_FUNCTION_24();
  uint64_t v6 = sub_1C69E12E8();
  v1[12] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[13] = v7;
  v1[14] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1C69983E4()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6_1(v2[6]);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[15] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1C6998490;
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[5];
  return MEMORY[0x1F4158D98](v4, v5, v0, v1);
}

uint64_t sub_1C6998490()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C6998558()
{
  OUTLINED_FUNCTION_20();
  sub_1C69E1468();
  sub_1C69E14B8();
  sub_1C69E0638();
  swift_bridgeObjectRelease();
  sub_1C69E1298();
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  v0[16] = __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085C0);
  uint64_t v2 = sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1EC8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C698D000, v2, v3, "dispatching to sirisuggestion dispatcher", v4, 2u);
    OUTLINED_FUNCTION_17();
  }
  uint64_t v5 = v0[6];

  __swift_project_boxed_opaque_existential_1((void *)(v5 + 56), *(void *)(v5 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v6;
  void *v6 = v0;
  v6[1] = sub_1C6998704;
  uint64_t v7 = OUTLINED_FUNCTION_11_0(v0[4]);
  return MEMORY[0x1F4158FC8](v7);
}

uint64_t sub_1C6998704()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_0();
  *os_log_type_t v3 = v2;
  *(void *)(v4 + 144) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1C69987E4()
{
  OUTLINED_FUNCTION_20();
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_1C699887C()
{
  uint64_t v29 = v0;
  uint64_t v1 = (void *)v0[18];
  (*(void (**)(void, void, void))(v0[8] + 16))(v0[9], v0[5], v0[7]);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1C69E1C48();
  os_log_type_t v5 = sub_1C69E1EE8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[18];
    uint64_t v25 = v0[13];
    uint64_t v26 = v0[12];
    uint64_t v27 = v0[14];
    uint64_t v8 = v0[8];
    uint64_t v7 = v0[9];
    uint64_t v23 = v0[7];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = sub_1C69E14B8();
    v0[2] = sub_1C69A8148(v10, v11, &v28);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v23);
    *(_WORD *)(v9 + 12) = 2112;
    id v12 = v6;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v13;
    sub_1C69E1F28();
    *uint64_t v24 = v13;

    _os_log_impl(&dword_1C698D000, v4, v5, "Unable to dispatch suggestions for event: %s: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v14 = (void *)v0[18];
    uint64_t v16 = v0[13];
    uint64_t v15 = v0[14];
    uint64_t v17 = v0[12];
    uint64_t v19 = v0[8];
    uint64_t v18 = v0[9];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v21();
}

uint64_t sub_1C6998B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6998B90, 0);
}

uint64_t sub_1C6998B90()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6_1(v0[7]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6998C34;
  uint64_t v2 = OUTLINED_FUNCTION_25_0(v0[3]);
  return MEMORY[0x1F4158DA0](v2);
}

uint64_t sub_1C6998C34()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_0();
  *id v3 = v2;
  *(void *)(v4 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_10_0();
    return MEMORY[0x1F4188298](v5, v6, v7);
  }
  else
  {
    OUTLINED_FUNCTION_18();
    return v8();
  }
}

uint64_t sub_1C6998D30()
{
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = sub_1C69E1C68();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085C0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1C69E1C48();
  os_log_type_t v6 = sub_1C69E1EE8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 72);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v12;
    sub_1C69E1F28();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_1C698D000, v5, v6, "Unable to dispatch suggestions for event: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  OUTLINED_FUNCTION_18();
  return v13();
}

uint64_t sub_1C6998F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6998F48, 0);
}

uint64_t sub_1C6998F48()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6_1(v0[6]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[7] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6998FEC;
  uint64_t v2 = OUTLINED_FUNCTION_25_0(v0[2]);
  return MEMORY[0x1F4158DA8](v2);
}

uint64_t sub_1C6998FEC()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C69990AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C69990CC, 0);
}

uint64_t sub_1C69990CC()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6_1(v2[5]);
  uint64_t v3 = (void *)swift_task_alloc();
  v2[6] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1C699917C;
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[2];
  return MEMORY[0x1F4158DB0](v6, v4, v5, v0, v1);
}

uint64_t sub_1C699917C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C6999240()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6991498;
  return sub_1C69982D8();
}

uint64_t sub_1C69992EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6991498;
  return sub_1C6998B6C(a1, a2, a3, a4);
}

uint64_t sub_1C69993AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6995B5C;
  return sub_1C6998F24(a1, a2, a3, a4);
}

uint64_t sub_1C699946C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_1C6995B5C;
  return sub_1C69990AC(a1, a2, a3);
}

uint64_t DispatchSuggestionServiceFactory.create(refreshableService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699953C, 0);
}

uint64_t sub_1C699953C()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1C6999604;
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[14];
  return MEMORY[0x1F4158DB8](v0 + 2, v5, v6, v2, v3);
}

uint64_t sub_1C6999604()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69996CC()
{
  uint64_t v2 = *(void **)(v0 + 96);
  sub_1C6995840(*(void *)(v0 + 120) + 56, v0 + 56);
  type metadata accessor for DispatcherSuggestionService();
  uint64_t v3 = swift_allocObject();
  OUTLINED_FUNCTION_16_0(v3);
  v2[4] = sub_1C699ACE8(&qword_1EBC07CD0, (void (*)(void))type metadata accessor for DispatcherSuggestionService);
  void *v2 = v1;
  OUTLINED_FUNCTION_18();
  return v4();
}

uint64_t type metadata accessor for DispatcherSuggestionService()
{
  return self;
}

uint64_t DispatchSuggestionServiceFactory.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t sub_1C69997F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1C6995B5C;
  return DispatchSuggestionServiceFactory.create(refreshableService:)(a1, a2, a3);
}

uint64_t DispatchedServiceAPIProvider.allEntities.getter()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C69998C0, v0);
}

uint64_t sub_1C69998C0()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_14_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_20_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6999960;
  uint64_t v3 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F415A260](v3);
}

uint64_t sub_1C6999960()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_12_0();
  return v4(v3);
}

uint64_t DispatchedServiceAPIProvider.entities.getter()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6999A40, v0);
}

uint64_t sub_1C6999A40()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699B828;
  uint64_t v2 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F415A390](v2);
}

uint64_t DispatchedServiceAPIProvider.siriRemembersEntityExtractor.getter(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6999AFC, v1);
}

uint64_t sub_1C6999AFC()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_21_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_19_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C699B820;
  uint64_t v3 = OUTLINED_FUNCTION_24_0();
  return MEMORY[0x1F4158D48](v3);
}

uint64_t DispatchedServiceAPIProvider.getSystemEnvironmentService()(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6999BBC, v1);
}

uint64_t sub_1C6999BBC()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_21_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_19_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6999C60;
  uint64_t v3 = OUTLINED_FUNCTION_24_0();
  return MEMORY[0x1F4158DD0](v3);
}

uint64_t sub_1C6999C60()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)()
{
  OUTLINED_FUNCTION_22_0();
  uint64_t v3 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v3 + 112) = v2;
  *(void *)(v3 + 120) = v1;
  sub_1C69958A4(v0, v3 + 128);
  return v3;
}

uint64_t DispatchedServiceAPIProvider.init(provider:dispatcher:)()
{
  OUTLINED_FUNCTION_22_0();
  swift_defaultActor_initialize();
  *(void *)(v1 + 112) = v3;
  *(void *)(v1 + 120) = v2;
  sub_1C69958A4(v0, v1 + 128);
  return v1;
}

uint64_t DispatchedServiceAPIProvider.getEntity<A>(entityType:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6999DD0, v2);
}

uint64_t sub_1C6999DD0()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_19_0(v1);
  void *v2 = v3;
  v2[1] = sub_1C6999E70;
  uint64_t v4 = OUTLINED_FUNCTION_11_0(*(void *)(v0 + 16));
  return MEMORY[0x1F415A398](v4);
}

uint64_t sub_1C6999E70()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_12_0();
  return v4(v3);
}

uint64_t DispatchedServiceAPIProvider.addToLifeCycle(owner:localEntities:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C6999F54, v2);
}

uint64_t sub_1C6999F54()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_19_0(v1);
  void *v2 = v3;
  v2[1] = sub_1C6999C60;
  uint64_t v4 = OUTLINED_FUNCTION_11_0(*(void *)(v0 + 16));
  return MEMORY[0x1F415A370](v4);
}

uint64_t DispatchedServiceAPIProvider.getService()(uint64_t a1)
{
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A010, v1);
}

uint64_t sub_1C699A010()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t ObjectType = swift_getObjectType();
  v0[12] = v2;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  void *v6 = v0;
  v6[1] = sub_1C699A0E4;
  return MEMORY[0x1F4158DC8](v0 + 2, ObjectType, v5);
}

uint64_t sub_1C699A0E4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C699A1C4, v2, 0);
}

uint64_t sub_1C699A1C4()
{
  uint64_t v2 = *(void **)(v0 + 104);
  sub_1C6995840(*(void *)(v0 + 112) + 128, v0 + 56);
  type metadata accessor for DispatcherSuggestionService();
  uint64_t v3 = swift_allocObject();
  OUTLINED_FUNCTION_16_0(v3);
  v2[4] = sub_1C699ACE8(&qword_1EBC07CD0, (void (*)(void))type metadata accessor for DispatcherSuggestionService);
  void *v2 = v1;
  OUTLINED_FUNCTION_18();
  return v4();
}

uint64_t DispatchedServiceAPIProvider.refresh(owner:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A2B0, v1);
}

uint64_t sub_1C699A2B0()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_20_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C699B82C;
  uint64_t v3 = OUTLINED_FUNCTION_17_0();
  return MEMORY[0x1F4158D90](v3);
}

uint64_t DispatchedServiceAPIProvider.destroy(owner:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A36C, v1);
}

uint64_t sub_1C699A36C()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_20_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C699A408;
  uint64_t v3 = OUTLINED_FUNCTION_17_0();
  return MEMORY[0x1F415A388](v3);
}

uint64_t sub_1C699A408()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t DispatchedServiceAPIProvider.destroy()()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A4E4, v0);
}

uint64_t sub_1C699A4E4()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_14_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_20_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C699A408;
  uint64_t v3 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F4159920](v3);
}

uint64_t DispatchedServiceAPIProvider.refreshAsync()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A5A0, v0);
}

uint64_t sub_1C699A5A0()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699A648;
  uint64_t v2 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F4159778](v2);
}

uint64_t sub_1C699A648()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t DispatchedServiceAPIProvider.getAllOwners()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_1C699A724, v0);
}

uint64_t sub_1C699A724()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699A7C4;
  uint64_t v2 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F415A380](v2);
}

uint64_t sub_1C699A7C4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_12_0();
  return v4(v3);
}

uint64_t DispatchedServiceAPIProvider.deinit()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DispatchedServiceAPIProvider.__deallocating_deinit()
{
  DispatchedServiceAPIProvider.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t DispatchedServiceAPIProvider.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1C699A8F0()
{
  return DispatchedServiceAPIProvider.unownedExecutor.getter();
}

uint64_t sub_1C699A90C()
{
  return sub_1C699ACE8(&qword_1EBC08268, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t type metadata accessor for DispatchedServiceAPIProvider()
{
  return self;
}

uint64_t sub_1C699A978()
{
  return sub_1C699ACE8(&qword_1EBC08260, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699A9C0()
{
  return sub_1C699ACE8(&qword_1EBC08290, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699AA08()
{
  return sub_1C699ACE8(&qword_1EBC08278, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699AA50(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.refresh(owner:)(a1);
}

uint64_t sub_1C699AAE4()
{
  return sub_1C699ACE8(&qword_1EBC08270, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699AB2C()
{
  return sub_1C699ACE8(&qword_1EBC07CD8, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699AB74(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.getService()(a1);
}

uint64_t sub_1C699AC10()
{
  return sub_1C699ACE8(&qword_1EBC08288, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699AC58()
{
  return sub_1C699ACE8(&qword_1EBC08280, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699ACA0()
{
  return sub_1C699ACE8(&qword_1EBC08298, (void (*)(void))type metadata accessor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C699ACE8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C699AD2C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699B824;
  return DispatchedServiceAPIProvider.entities.getter();
}

uint64_t sub_1C699ADB8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.addToLifeCycle(owner:localEntities:)(a1, a2);
}

uint64_t sub_1C699AE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *v5;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_1C6995B5C;
  return MEMORY[0x1F415A3A0](a1, a2, v11, a3, a5);
}

uint64_t sub_1C699AF48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *v5;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_1C6995B5C;
  return MEMORY[0x1F415A3B0](a1, a2, a3, v11, a5);
}

uint64_t sub_1C699B034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1C6995B5C;
  return MEMORY[0x1F415A3A8](a1, v7, a3);
}

uint64_t sub_1C699B108(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C699B824;
  return DispatchedServiceAPIProvider.getEntity<A>(entityType:)(a1, a2);
}

uint64_t sub_1C699B1AC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.destroy(owner:)(a1);
}

uint64_t sub_1C699B240()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699B824;
  return DispatchedServiceAPIProvider.getAllOwners()();
}

uint64_t sub_1C699B2CC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.refreshAsync()();
}

uint64_t sub_1C699B358()
{
  return MEMORY[0x1F4159780](*v0);
}

uint64_t sub_1C699B384(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.siriRemembersEntityExtractor.getter(a1);
}

uint64_t sub_1C699B420(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.getSystemEnvironmentService()(a1);
}

uint64_t sub_1C699B4BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699B54C;
  return DispatchedServiceAPIProvider.allEntities.getter();
}

uint64_t sub_1C699B54C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_12_0();
  return v4(v3);
}

uint64_t sub_1C699B610()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return DispatchedServiceAPIProvider.destroy()();
}

uint64_t type metadata accessor for DispatchSuggestionServiceFactory()
{
  return self;
}

uint64_t method lookup function for DispatchSuggestionServiceFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DispatchSuggestionServiceFactory);
}

uint64_t method lookup function for DispatchedServiceAPIProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DispatchedServiceAPIProvider);
}

uint64_t dispatch thunk of DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1C699B708(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1C699B740(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1C699B768(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1C69E1F28();
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

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4188298](a1, a2, 0);
}

void *OUTLINED_FUNCTION_6_1@<X0>(uint64_t a1@<X8>)
{
  return __swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

void OUTLINED_FUNCTION_14_0()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  sub_1C69958A4(v2, a1 + 16);
  uint64_t result = sub_1C69958A4(v1, a1 + 56);
  *(void *)(v4 + 24) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

void OUTLINED_FUNCTION_21_0()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return *(void *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t SiriInvocationDispatcherFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriInvocationDispatcherFactory.init()()
{
  return v0;
}

uint64_t sub_1C699B9B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ExecutionDispatcher();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  a2[3] = v4;
  a2[4] = sub_1C699BABC();
  *a2 = v5;
  return swift_retain();
}

uint64_t SiriInvocationDispatcherFactory.deinit()
{
  return v0;
}

uint64_t SiriInvocationDispatcherFactory.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C699BA38(uint64_t *a1, uint64_t a2)
{
  sub_1C699B9B0(a2, a1);
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return sub_1C699BB80(v3);
}

unint64_t sub_1C699BABC()
{
  unint64_t result = qword_1EA442D18;
  if (!qword_1EA442D18)
  {
    type metadata accessor for ExecutionDispatcher();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442D18);
  }
  return result;
}

uint64_t type metadata accessor for SiriInvocationDispatcherFactory()
{
  return self;
}

uint64_t method lookup function for SiriInvocationDispatcherFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SiriInvocationDispatcherFactory);
}

uint64_t dispatch thunk of SiriInvocationDispatcherFactory.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SiriInvocationDispatcherFactory.createDispatcher(sink:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_1C699BB80(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C699BB88()
{
  OUTLINED_FUNCTION_6_0();
  v1[10] = v2;
  v1[11] = v0;
  v1[8] = v3;
  v1[9] = v4;
  v1[6] = v5;
  v1[7] = v6;
  uint64_t v7 = sub_1C69E1C68();
  v1[12] = v7;
  v1[13] = *(void *)(v7 - 8);
  v1[14] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C699BC4C, v0, 0);
}

void sub_1C699BC4C()
{
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = __swift_project_value_buffer(v0[12], (uint64_t)qword_1EBC085E8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1ED8();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[10];
  if (v4)
  {
    unint64_t v7 = v0[8];
    uint64_t v6 = v0[9];
    uint64_t v30 = v0[7];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[4] = sub_1C69A8148(v6, v5, &v32);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_1C69A8148(v30, v7, &v32);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v2, v3, "Retrieving property: %s for requestId: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = v0[11];
  uint64_t v10 = *(void *)(v9 + 144);
  if (!v10 || (*(void *)(v9 + 136) == v0[7] ? (BOOL v11 = v10 == v0[8]) : (BOOL v11 = 0), !v11 && (sub_1C69E2188() & 1) == 0))
  {
    (*(void (**)(void, uint64_t, void))(v0[13] + 16))(v0[14], v1, v0[12]);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v12 = sub_1C69E1C48();
    os_log_type_t v13 = sub_1C69E1EC8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315394;
      if (*(void *)(v9 + 144))
      {
        uint64_t v15 = *(void *)(v9 + 136);
        unint64_t v16 = *(void *)(v9 + 144);
      }
      else
      {
        unint64_t v16 = 0xE600000000000000;
        uint64_t v15 = 0x7465735F6F6ELL;
      }
      uint64_t v28 = v0[13];
      uint64_t v29 = v0[12];
      uint64_t v31 = v0[14];
      uint64_t v23 = v0[7];
      unint64_t v24 = v0[8];
      swift_bridgeObjectRetain();
      v0[2] = sub_1C69A8148(v15, v16, &v32);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[3] = sub_1C69A8148(v23, v24, &v32);
      sub_1C69E1F28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C698D000, v12, v13, "[warning] Current state store request id %s != %s. Properties not in state store ", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v29);
    }
    else
    {
      uint64_t v21 = v0[13];
      uint64_t v20 = v0[14];
      uint64_t v22 = v0[12];
      swift_release_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    }
    uint64_t v25 = (_OWORD *)v0[6];
    v25[1] = 0u;
    v25[2] = 0u;
    *uint64_t v25 = 0u;
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_4_1();
    __asm { BRAA            X1, X16 }
  }
  swift_getObjectType();
  uint64_t v17 = (void *)swift_task_alloc();
  v0[15] = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_1C699C1CC;
  OUTLINED_FUNCTION_4_1();
  __asm { BRAA            X8, X16 }
}

uint64_t sub_1C699C1CC()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1C699C2D0(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_1C69E1C68();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C699C394, v2, 0);
}

uint64_t sub_1C699C394()
{
  uint64_t v30 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[6];
  uint64_t v3 = *(void *)(v2 + 144);
  if (v3)
  {
    BOOL v4 = *(void *)(v2 + 136) == v1[4] && v3 == v1[5];
    if (v4 || (sub_1C69E2188() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_task_dealloc();
      OUTLINED_FUNCTION_4_1();
      __asm { BRAA            X3, X16 }
    }
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v8 = v1[8];
  uint64_t v7 = v1[9];
  uint64_t v9 = v1[7];
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EBC085E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  BOOL v11 = sub_1C69E1C48();
  os_log_type_t v12 = sub_1C69E1EC8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    if (*(void *)(v2 + 144))
    {
      uint64_t v14 = *(void *)(v2 + 136);
      unint64_t v15 = *(void *)(v2 + 144);
    }
    else
    {
      unint64_t v15 = 0xE600000000000000;
      uint64_t v14 = 0x7465735F6F6ELL;
    }
    uint64_t v25 = v1[4];
    uint64_t v26 = v1[8];
    uint64_t v27 = v1[7];
    uint64_t v28 = v1[9];
    unint64_t v19 = v1[5];
    swift_bridgeObjectRetain();
    v1[2] = sub_1C69A8148(v14, v15, &v29);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v1[3] = sub_1C69A8148(v25, v19, &v29);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v11, v12, "Request ids (%s != %s dont match. Clearing store", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    uint64_t v17 = v1[8];
    uint64_t v16 = v1[9];
    uint64_t v18 = v1[7];
    swift_release_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v20 = (void *)swift_task_alloc();
  v1[10] = v20;
  *uint64_t v20 = v1;
  v20[1] = sub_1C699C72C;
  OUTLINED_FUNCTION_4_1();
  return sub_1C699C8A4(v21, v22);
}

uint64_t sub_1C699C72C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *BOOL v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C699C80C, v2, 0);
}

uint64_t sub_1C699C80C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  *(void *)(v1 + 136) = v0[4];
  *(void *)(v1 + 144) = v2;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[4];
  swift_bridgeObjectRetain_n();
  swift_task_dealloc();
  BOOL v4 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v4(v3, v2);
}

uint64_t sub_1C699C8A4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_2_1((uint64_t)sub_1C699C8C0);
}

uint64_t sub_1C699C8C0()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(v0 + 32);
  *(void *)(v1 + 136) = 0;
  *(void *)(v1 + 144) = 0;
  swift_bridgeObjectRelease();
  swift_getObjectType();
  OUTLINED_FUNCTION_8_2();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  void *v2 = v0;
  v2[1] = sub_1C6999C60;
  uint64_t v3 = OUTLINED_FUNCTION_6_2();
  return v4(v3);
}

uint64_t sub_1C699C9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[4] = a5;
  v6[5] = v5;
  v6[2] = a3;
  v6[3] = a4;
  uint64_t v9 = (void *)swift_task_alloc();
  v6[6] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_1C699CA68;
  return sub_1C699C2D0(a1, a2);
}

uint64_t sub_1C699CA68()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *BOOL v4 = v3;
  *(void *)(v7 + 56) = v5;
  *(void *)(v7 + 64) = v6;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C699CB50, v2, 0);
}

uint64_t sub_1C699CB50()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = *(void *)(v1[5] + 120);
  swift_getObjectType();
  uint64_t v11 = (void *)(OUTLINED_FUNCTION_8_2() + 16);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v11 + *(int *)*v11);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[9] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C699CC58;
  uint64_t v4 = v1[8];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[7];
  return v10(v8, v4, v7, v5, v6, v0, v2);
}

uint64_t sub_1C699CC58()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C699CD34(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_2_1((uint64_t)sub_1C699CD50);
}

uint64_t sub_1C699CD50()
{
  OUTLINED_FUNCTION_5();
  swift_getObjectType();
  OUTLINED_FUNCTION_8_2();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C699CE40;
  uint64_t v2 = OUTLINED_FUNCTION_6_2();
  return v3(v2);
}

uint64_t sub_1C699CE40()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_1C699CF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return OUTLINED_FUNCTION_2_1((uint64_t)sub_1C699CF2C);
}

uint64_t sub_1C699CF2C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = *(void *)(v1[6] + 128);
  swift_getObjectType();
  uint64_t v10 = (void *)(OUTLINED_FUNCTION_8_2() + 40);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v10 + *(int *)*v10);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[7] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C6998FEC;
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = v1[2];
  uint64_t v6 = v1[3];
  return v9(v7, v6, v4, v5, v0, v2);
}

uint64_t sub_1C699D034()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1C699D064()
{
  sub_1C699D034();
  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for TurnProtectedHintsStateStore()
{
  return self;
}

uint64_t sub_1C699D0B4()
{
  return v0;
}

uint64_t sub_1C699D0C0()
{
  return sub_1C699D0B4();
}

uint64_t sub_1C699D0DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_1C6991498;
  return sub_1C699C9BC(a1, a2, a3, a4, a5);
}

uint64_t sub_1C699D1A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C699BB88();
}

uint64_t sub_1C699D268(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C6995B5C;
  return sub_1C699C8A4(a1, a2);
}

uint64_t sub_1C699D30C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C699D3B0;
  return sub_1C699CD34(a1, a2);
}

uint64_t sub_1C699D3B0()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_1C699D47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6995B5C;
  return sub_1C699CF0C(a1, a2, a3, a4);
}

unint64_t sub_1C699D538()
{
  unint64_t result = qword_1EBC08408;
  if (!qword_1EBC08408)
  {
    type metadata accessor for TurnProtectedHintsStateStore();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC08408);
  }
  return result;
}

unint64_t sub_1C699D584(uint64_t a1)
{
  unint64_t result = sub_1C699D538();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, v1, 0);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return v0;
}

uint64_t ExecutionDispatcher.__allocating_init(aceSink:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t ExecutionDispatcher.init(aceSink:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t ExecutionDispatcher.dispatch(suggestion:presentationContext:)()
{
  OUTLINED_FUNCTION_6_0();
  v1[8] = v2;
  v1[9] = v0;
  uint64_t v3 = sub_1C69E1588();
  v1[10] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[11] = v4;
  v1[12] = swift_task_alloc();
  uint64_t v5 = sub_1C69E1898();
  v1[13] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[14] = v6;
  v1[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C699D710, 0, 0);
}

uint64_t sub_1C699D710()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  type metadata accessor for InvocationContextHolder();
  sub_1C69E1408();
  sub_1C69E1568();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_1C699DC28();
  swift_bridgeObjectRelease();
  sub_1C69E1438();
  if (v0[5])
  {
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    uint64_t v4 = (void *)sub_1C69E1828();
    v0[16] = v4;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AD8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1C69E2B70;
    *(void *)(v5 + 32) = v4;
    uint64_t v16 = v5;
    sub_1C69E1DD8();
    v0[17] = v16;
    v0[7] = v16;
    id v6 = v4;
    uint64_t v7 = (void *)swift_task_alloc();
    v0[18] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1C699D9E8;
    return MEMORY[0x1F41594A0](v0 + 7);
  }
  else
  {
    sub_1C699DCBC((uint64_t)(v0 + 2));
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1C69E1C68();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EBC085C0);
    uint64_t v9 = sub_1C69E1C48();
    os_log_type_t v10 = sub_1C69E1EE8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1C698D000, v9, v10, "Could not get invocation command from suggestion", v11, 2u);
      MEMORY[0x1C87A7AA0](v11, -1, -1);
    }

    uint64_t v12 = OUTLINED_FUNCTION_2_2();
    v13(v12);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_1C699D9E8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  *(void *)(v1 + 152) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_1C699DB68;
  }
  else {
    uint64_t v2 = sub_1C699DAF0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C699DAF0()
{
  OUTLINED_FUNCTION_6_0();

  uint64_t v1 = OUTLINED_FUNCTION_2_2();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1C699DB68()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t type metadata accessor for InvocationContextHolder()
{
  return self;
}

uint64_t sub_1C699DC28()
{
  sub_1C69E08F8();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_1C69E0748();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  swift_bridgeObjectRetain();
  return sub_1C69E1888();
}

uint64_t sub_1C699DCBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA442D88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ExecutionDispatcher.deinit()
{
  swift_release();
  return v0;
}

uint64_t ExecutionDispatcher.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1C699DD74()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6996B34;
  return ExecutionDispatcher.dispatch(suggestion:presentationContext:)();
}

uint64_t sub_1C699DE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = sub_1C699DF80(&qword_1EA442DA0);
  *uint64_t v7 = v3;
  v7[1] = sub_1C699DFC0;
  return MEMORY[0x1F4159450](a1, a2, a3, v8);
}

uint64_t sub_1C699DEEC()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C699DEFC()
{
  return sub_1C699DF80((unint64_t *)&qword_1EA442D18);
}

uint64_t type metadata accessor for ExecutionDispatcher()
{
  return self;
}

uint64_t method lookup function for ExecutionDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ExecutionDispatcher);
}

uint64_t dispatch thunk of ExecutionDispatcher.__allocating_init(aceSink:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1C699DF80(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ExecutionDispatcher();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return *(void *)(v0 + 120);
}

uint64_t SiriHelpSuggestionsDispatcherFactory.__allocating_init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, long long *a6, long long *a7, long long *a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = OUTLINED_FUNCTION_6_3();
  SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(v15, v16, v17, v18, v19, a6, a7, a8, a9, a10, a11);
  return v14;
}

void *SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, long long *a6, long long *a7, long long *a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v35 = a7;
  v34 = a6;
  uint64_t v36 = a5;
  uint64_t v39 = a11;
  uint64_t v38 = a10;
  id v37 = a9;
  sub_1C69E05E8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v19 = v18;
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x1F4188790](v22);
  uint64_t v23 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[2] = a1;
  if (a3)
  {
    unint64_t v24 = (char *)swift_allocObject();
    *((void *)v24 + 2) = a3;
    *((void *)v24 + 3) = a4;
    swift_retain();
    sub_1C699E9E0(v38);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a2, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a8);
    uint64_t v25 = &unk_1EA442DD0;
  }
  else
  {
    sub_1C69958A4(a8, (uint64_t)v43);
    sub_1C69958A4(v34, (uint64_t)v42);
    sub_1C69958A4(v35, (uint64_t)v41);
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 32);
    v26((char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v11);
    sub_1C69958A4(v36, (uint64_t)v40);
    unint64_t v27 = (*(unsigned __int8 *)(v19 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    unint64_t v28 = (v21 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (char *)swift_allocObject();
    sub_1C69958A4(v43, (uint64_t)(v24 + 16));
    *((void *)v24 + 7) = v37;
    sub_1C69958A4(v42, (uint64_t)(v24 + 64));
    uint64_t v29 = v39;
    *((void *)v24 + 13) = v38;
    *((void *)v24 + 14) = v29;
    sub_1C69958A4(v41, (uint64_t)(v24 + 120));
    v26(&v24[v27], (uint64_t)v23, v11);
    sub_1C69958A4(v40, (uint64_t)&v24[v28]);
    swift_retain();
    uint64_t v25 = &unk_1EA442DB0;
  }
  uint64_t v30 = v25;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(void *)(v31 + 24) = v24;
  v12[3] = &unk_1EA442DC0;
  v12[4] = v31;
  swift_release();
  return v12;
}

uint64_t sub_1C699E344(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1C6995B5C;
  return v8(a1, v5);
}

uint64_t sub_1C699E42C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a8;
  v8[9] = v11;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[2] = a1;
  v8[3] = a3;
  uint64_t v9 = *a2;
  v8[10] = v12;
  v8[11] = v9;
  return MEMORY[0x1F4188298](sub_1C699E468, 0, 0);
}

uint64_t sub_1C699E468()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v14 = v0[9];
  uint64_t v15 = v0[11];
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = type metadata accessor for SiriHelpDispatcher();
  uint64_t v5 = OUTLINED_FUNCTION_6_3();
  sub_1C69B9F7C(v5, v6, v7, v8, v9, v2, v15, v14, v1, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
    (uint64_t)v0,
    v24);
  uint64_t v11 = v10;
  v3[3] = v4;
  v3[4] = sub_1C699F0CC();
  *uint64_t v3 = v11;
  OUTLINED_FUNCTION_18();
  return v12();
}

uint64_t sub_1C699E52C()
{
  sub_1C69E05E8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v5 + 64);
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);

  __swift_destroy_boxed_opaque_existential_1(v1 + 64);
  if (*(void *)(v1 + 104)) {
    swift_release();
  }
  uint64_t v7 = (v4 + 160) & ~v4;
  unint64_t v8 = (v6 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_1(v1 + 120);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v7, v0);
  __swift_destroy_boxed_opaque_existential_1(v1 + v8);
  return MEMORY[0x1F4186498](v1, v8 + 40, v4 | 7);
}

uint64_t sub_1C699E610(uint64_t a1, uint64_t *a2)
{
  sub_1C69E05E8();
  uint64_t v4 = v2[7];
  uint64_t v5 = v2[13];
  uint64_t v6 = v2[14];
  uint64_t v7 = swift_task_alloc();
  unint64_t v8 = (void *)OUTLINED_FUNCTION_28(v7);
  *unint64_t v8 = v9;
  v8[1] = sub_1C6995B5C;
  return sub_1C699E42C(a1, a2, (uint64_t)(v2 + 2), v4, (uint64_t)(v2 + 8), v5, v6, (uint64_t)(v2 + 15));
}

uint64_t sub_1C699E764(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a2;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1C699A648;
  return v7(a1, v3 + 16);
}

uint64_t sub_1C699E850()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C699E888()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  uint64_t v3 = OUTLINED_FUNCTION_3_2();
  return v4(v3);
}

uint64_t FlowSuggestionsDispatcherFactory.init()()
{
  return v0;
}

uint64_t sub_1C699E938()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6991498;
  uint64_t v3 = OUTLINED_FUNCTION_3_2();
  return v4(v3);
}

uint64_t sub_1C699E9E0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t SiriHelpSuggestionsDispatcherFactory.createDispatcher(sink:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_2_3((uint64_t)sub_1C699EA0C);
}

uint64_t sub_1C699EA0C()
{
  uint64_t v1 = v0[4];
  __swift_instantiateConcreteTypeFromMangledName(qword_1EA442DE0);
  uint64_t v2 = swift_allocObject();
  v0[5] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1C69E3560;
  uint64_t v3 = v2 + 32;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1 + 24) + **(int **)(v1 + 24));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1C699EB14;
  uint64_t v5 = v0[3];
  return v7(v3, v5);
}

uint64_t sub_1C699EB14()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C699EBE0, 0, 0);
}

uint64_t sub_1C699EBE0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = *(void *)(*(void *)(v0 + 32) + 16);
  uint64_t v3 = sub_1C69E1288();
  uint64_t v4 = MEMORY[0x1E4FA43E0];
  v1[12] = v3;
  v1[13] = v4;
  v1[9] = v2;
  swift_retain();
  sub_1C69E0FD8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
  return v5();
}

void SiriHelpSuggestionsDispatcherFactory.__allocating_init()()
{
}

void SiriHelpSuggestionsDispatcherFactory.init()()
{
}

uint64_t sub_1C699ECDC()
{
  swift_release();
  return swift_release();
}

uint64_t SiriHelpSuggestionsDispatcherFactory.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t FlowSuggestionsDispatcherFactory.deinit()
{
  return v0;
}

uint64_t SiriHelpSuggestionsDispatcherFactory.__deallocating_deinit()
{
  SiriHelpSuggestionsDispatcherFactory.deinit();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1C699ED70(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_2_3((uint64_t)sub_1C699ED88);
}

uint64_t sub_1C699ED88()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69E0FC8();
  OUTLINED_FUNCTION_18();
  return v0();
}

uint64_t FlowSuggestionsDispatcherFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FlowSuggestionsDispatcherFactory.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C699EE00(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 80)
                                                + **(int **)(**(void **)v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1C6995B5C;
  return v8(a1, a2);
}

uint64_t type metadata accessor for SiriHelpSuggestionsDispatcherFactory()
{
  return self;
}

uint64_t method lookup function for SiriHelpSuggestionsDispatcherFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SiriHelpSuggestionsDispatcherFactory);
}

uint64_t dispatch thunk of SiriHelpSuggestionsDispatcherFactory.__allocating_init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for FlowSuggestionsDispatcherFactory()
{
  return self;
}

uint64_t method lookup function for FlowSuggestionsDispatcherFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FlowSuggestionsDispatcherFactory);
}

uint64_t dispatch thunk of FlowSuggestionsDispatcherFactory.createDispatcher(sink:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 80) + **(int **)(*(void *)v2 + 80));
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_28(v5);
  void *v6 = v7;
  v6[1] = sub_1C6995B5C;
  return v9(a1, a2);
}

uint64_t dispatch thunk of FlowSuggestionsDispatcherFactory.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t sub_1C699F0CC()
{
  unint64_t result = qword_1EA442E00;
  if (!qword_1EA442E00)
  {
    type metadata accessor for SiriHelpDispatcher();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442E00);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t static Transformer<>.parseToProperties.getter()
{
  return sub_1C699F934(MEMORY[0x1E4FA1F68]);
}

uint64_t sub_1C699F1B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  void (*v26)(uint64_t *__return_ptr, char *);
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t *__return_ptr, char *);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t);
  os_log_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint8_t *v57;
  os_log_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  uint64_t v60 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E50);
  uint64_t v56 = *(void *)(v3 - 8);
  v57 = (uint8_t *)v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C69E08D8();
  uint64_t v58 = *(os_log_t *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E58);
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C69E0918();
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v50 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C69E08E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v48 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v55 = (char *)&v47 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v47 - v19;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v54 = a1;
  v21((char *)&v47 - v19, a1, v13);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v20, v13);
  if (v22 == *MEMORY[0x1E4FA1F38])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v20, v13);
    os_log_t v24 = v58;
    uint64_t v23 = v59;
    ((void (*)(char *, char *, uint64_t))v58[4].isa)(v8, v20, v59);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E08);
    sub_1C69E0A88();
    uint64_t v25 = v57;
    uint64_t v26 = (void (*)(uint64_t *__return_ptr, char *))sub_1C69E0A98();
    (*(void (**)(char *, uint8_t *))(v56 + 8))(v5, v25);
    unint64_t v27 = v61;
    v26(&v63, v8);
    if (v27)
    {
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v24[1].isa)(v8, v23);
    }
    swift_release();
    unint64_t result = ((uint64_t (*)(char *, uint64_t))v24[1].isa)(v8, v23);
LABEL_15:
    *uint64_t v60 = v63;
    return result;
  }
  if (v22 == *MEMORY[0x1E4FA1F48])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v20, v13);
    uint64_t v29 = v52;
    uint64_t v30 = v50;
    uint64_t v31 = v20;
    uint64_t v32 = v53;
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v50, v31, v53);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E08);
    sub_1C69E0A88();
    uint64_t v33 = v51;
    v34 = (void (*)(uint64_t *__return_ptr, char *))sub_1C69E0A98();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v33);
    uint64_t v35 = v61;
    v34(&v63, v30);
    if (v35)
    {
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v32);
    }
    swift_release();
    unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v32);
    goto LABEL_15;
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1C69E1C68();
  __swift_project_value_buffer(v36, (uint64_t)qword_1EBC085E8);
  id v37 = v55;
  v21(v55, v54, v13);
  uint64_t v38 = sub_1C69E1C48();
  uint64_t v39 = sub_1C69E1EC8();
  if (os_log_type_enabled(v38, v39))
  {
    long long v40 = swift_slowAlloc();
    uint64_t v58 = v38;
    long long v41 = (uint8_t *)v40;
    uint64_t v59 = swift_slowAlloc();
    uint64_t v63 = v59;
    *(_DWORD *)long long v41 = 136315138;
    v57 = v41 + 4;
    v21(v48, (uint64_t)v37, v13);
    uint64_t v42 = sub_1C69E1D08();
    uint64_t v62 = sub_1C69A8148(v42, v43, &v63);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    unint64_t v44 = *(void (**)(char *, uint64_t))(v14 + 8);
    v44(v55, v13);
    uint64_t v45 = v58;
    _os_log_impl(&dword_1C698D000, v58, v39, "Directly unsupported parse result: %s", v41, 0xCu);
    uint64_t v46 = v59;
    swift_arrayDestroy();
    MEMORY[0x1C87A7AA0](v46, -1, -1);
    MEMORY[0x1C87A7AA0](v41, -1, -1);
  }
  else
  {
    unint64_t v44 = *(void (**)(char *, uint64_t))(v14 + 8);
    v44(v37, v13);
  }
  *uint64_t v60 = 0;
  return ((uint64_t (*)(char *, uint64_t))v44)(v20, v13);
}

uint64_t static Transformer<>.usoToProperties.getter()
{
  return sub_1C699F934(MEMORY[0x1E4FA1F80]);
}

uint64_t sub_1C699F934(void (*a1)(void))
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E08);
  return sub_1C69E0A88();
}

void sub_1C699F9A4(uint64_t *a1@<X8>)
{
  v234 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E8);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v224 = (uint64_t)&v208 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v222 = (uint64_t)&v208 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E10);
  MEMORY[0x1F4188790](v5 - 8);
  v223 = (char *)&v208 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v216 = sub_1C69E0A38();
  uint64_t v219 = *(void *)(v216 - 8);
  MEMORY[0x1F4188790](v216);
  v213 = (char *)&v208 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E18);
  MEMORY[0x1F4188790](v215);
  uint64_t v220 = (uint64_t)&v208 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E20);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  v214 = (char *)&v208 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v217 = (uint64_t)&v208 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v218 = (uint64_t)&v208 - v14;
  uint64_t v230 = sub_1C69E1758();
  uint64_t v229 = *(void *)(v230 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v230);
  v221 = (char *)&v208 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  v228 = (char *)&v208 - v17;
  uint64_t v252 = sub_1C69E1C28();
  uint64_t v227 = *(void *)(v252 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v252);
  v240 = (char *)&v208 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v239 = (char *)&v208 - v21;
  MEMORY[0x1F4188790](v20);
  v244 = (char *)&v208 - v22;
  uint64_t v257 = sub_1C69E09D8();
  uint64_t v254 = *(void *)(v257 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v257);
  v241 = (char *)&v208 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  v236 = (char *)&v208 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v238 = (char *)&v208 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v243 = (char *)&v208 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v249 = (char *)&v208 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  isa = (char *)&v208 - v34;
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  v248 = (char *)&v208 - v36;
  MEMORY[0x1F4188790](v35);
  v250 = (char *)&v208 - v37;
  uint64_t v255 = sub_1C69E0998();
  os_log_t v251 = *(os_log_t *)(v255 - 8);
  MEMORY[0x1F4188790](v255);
  v247 = (char *)&v208 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v233 = sub_1C69E0938();
  uint64_t v235 = *(void *)(v233 - 8);
  uint64_t v39 = MEMORY[0x1F4188790](v233);
  v256 = (char *)&v208 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v39);
  uint64_t v42 = (char *)&v208 - v41;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E28);
  MEMORY[0x1F4188790](v43 - 8);
  uint64_t v45 = (char *)&v208 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1C69E0978();
  uint64_t v47 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46);
  uint64_t v49 = (char *)&v208 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1C69E0958();
  uint64_t v51 = *(void *)(v50 - 8);
  MEMORY[0x1F4188790](v50);
  uint64_t v53 = (char *)&v208 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C69E0908();
  uint64_t v54 = sub_1C69E0948();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
  sub_1C69BA200(v54, (uint64_t)v45);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46) == 1)
  {
    sub_1C69A3644((uint64_t)v45, &qword_1EA442E28);
    if (qword_1EA442908 != -1) {
      goto LABEL_111;
    }
    goto LABEL_3;
  }
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v49, v45, v46);
  uint64_t v59 = v247;
  v226 = v49;
  sub_1C69E0968();
  sub_1C69E0988();
  ((void (*)(char *, uint64_t))v251[1].isa)(v59, v255);
  if (qword_1EA442908 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_1C69E1C68();
  uint64_t v61 = __swift_project_value_buffer(v60, (uint64_t)qword_1EA442F38);
  uint64_t v62 = v235;
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v235 + 16);
  char v64 = v256;
  v231 = v42;
  uint64_t v65 = v42;
  uint64_t v66 = v233;
  v63(v256, v65, v233);
  uint64_t v225 = v61;
  uint64_t v67 = sub_1C69E1C48();
  os_log_type_t v68 = sub_1C69E1ED8();
  LODWORD(v255) = v68;
  BOOL v69 = os_log_type_enabled(v67, v68);
  uint64_t v212 = v47;
  uint64_t v211 = v46;
  uint64_t v209 = v60;
  if (v69)
  {
    os_log_t v251 = v67;
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    v260[0] = v71;
    *(_DWORD *)uint64_t v70 = 136315138;
    v247 = (char *)(v70 + 4);
    sub_1C69E0928();
    uint64_t v72 = v257;
    uint64_t v73 = MEMORY[0x1C87A7030]();
    unint64_t v75 = v74;
    swift_bridgeObjectRelease();
    uint64_t v76 = v73;
    uint64_t v77 = v235;
    *(void *)&long long v258 = sub_1C69A8148(v76, v75, v260);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    v210 = *(void (**)(char *, uint64_t))(v77 + 8);
    v210(v64, v66);
    os_log_t v78 = v251;
    _os_log_impl(&dword_1C698D000, v251, (os_log_type_t)v255, "Got identifiers: %s", v70, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87A7AA0](v71, -1, -1);
    MEMORY[0x1C87A7AA0](v70, -1, -1);
  }
  else
  {
    v210 = *(void (**)(char *, uint64_t))(v62 + 8);
    v210(v64, v66);

    uint64_t v72 = v257;
  }
  v79 = v250;
  uint64_t v80 = sub_1C69E0928();
  uint64_t v81 = MEMORY[0x1E4FBC860];
  v260[0] = MEMORY[0x1E4FBC860];
  v247 = *(char **)(v80 + 16);
  if (!v247)
  {
    uint64_t v102 = MEMORY[0x1E4FBC860];
LABEL_37:
    swift_bridgeObjectRelease();
    int64_t v103 = *(void *)(v102 + 16);
    if (v103)
    {
      v260[0] = v81;
      sub_1C69C3434(0, v103, 0);
      v256 = *(char **)(v254 + 16);
      unint64_t v104 = (*(unsigned __int8 *)(v254 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v254 + 80);
      isa = (char *)v102;
      unint64_t v105 = v102 + v104;
      uint64_t v255 = *(void *)(v254 + 72);
      uint64_t v106 = (void (**)(char *, uint64_t))(v254 + 8);
      do
      {
        uint64_t v107 = v249;
        ((void (*)(char *, unint64_t, uint64_t))v256)(v249, v105, v72);
        uint64_t v108 = sub_1C69E09B8();
        uint64_t v110 = v109;
        (*v106)(v107, v72);
        uint64_t v111 = v260[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C69C3434(0, *(void *)(v111 + 16) + 1, 1);
          uint64_t v111 = v260[0];
        }
        unint64_t v113 = *(void *)(v111 + 16);
        unint64_t v112 = *(void *)(v111 + 24);
        if (v113 >= v112 >> 1)
        {
          sub_1C69C3434((char *)(v112 > 1), v113 + 1, 1);
          uint64_t v111 = v260[0];
        }
        *(void *)(v111 + 16) = v113 + 1;
        uint64_t v114 = v111 + 16 * v113;
        *(void *)(v114 + 32) = v108;
        *(void *)(v114 + 40) = v110;
        v105 += v255;
        --v103;
        uint64_t v72 = v257;
      }
      while (v103);
      swift_release();
      uint64_t v81 = MEMORY[0x1E4FBC860];
    }
    else
    {
      swift_release();
      uint64_t v111 = MEMORY[0x1E4FBC860];
    }
    uint64_t v262 = v111;
    if (!*(void *)(v111 + 16))
    {
      os_log_t v115 = (os_log_t)sub_1C69E0928();
      uint64_t v261 = v81;
      isa = (char *)v115[2].isa;
      if (isa)
      {
        uint64_t v116 = 0;
        v250 = (char *)(v254 + 16);
        v249 = (char *)(v227 + 8);
        v246 = (void (**)(char *, char *, uint64_t))(v254 + 32);
        v248 = (char *)(v254 + 8);
        v247 = (char *)((v254 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
        os_log_t v251 = v115;
        v117 = (void (**)(char *, uint64_t))(v227 + 8);
        while (1)
        {
          if (v116 >= v115[2].isa) {
            goto LABEL_110;
          }
          uint64_t v118 = *(void *)(v254 + 72);
          v256 = (char *)((*(unsigned __int8 *)(v254 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v254 + 80));
          uint64_t v255 = v118;
          v119 = *(void (**)(char *, char *, uint64_t))(v254 + 16);
          v120 = v243;
          v119(v243, &v256[(void)v115 + v118 * (void)v116], v72);
          v121 = v239;
          sub_1C69E09C8();
          v122 = v240;
          sub_1C69E1BF8();
          char v123 = sub_1C69E1C08();
          v124 = *v117;
          v125 = v122;
          uint64_t v126 = v252;
          (*v117)(v125, v252);
          v127 = v121;
          v128 = v238;
          v124(v127, v126);
          uint64_t v72 = v257;
          v119(v128, v120, v257);
          if (v123)
          {
            v260[0] = sub_1C69E09B8();
            v260[1] = v129;
            *(void *)&long long v258 = 46;
            *((void *)&v258 + 1) = 0xE100000000000000;
            sub_1C69956B4();
            char v130 = sub_1C69E1F68();
            swift_bridgeObjectRelease();
            v131 = *(void (**)(char *, uint64_t))v248;
            (*(void (**)(char *, uint64_t))v248)(v128, v72);
            if (v130)
            {
              uint64_t v132 = v72;
              v133 = *v246;
              (*v246)(v236, v243, v132);
              uint64_t v134 = v261;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_1C69C3454();
                uint64_t v134 = v261;
              }
              unint64_t v135 = *(void *)(v134 + 16);
              if (v135 >= *(void *)(v134 + 24) >> 1)
              {
                sub_1C69C3454();
                uint64_t v134 = v261;
              }
              *(void *)(v134 + 16) = v135 + 1;
              uint64_t v136 = v257;
              v133(&v256[v134 + v135 * v255], v236, v257);
              uint64_t v72 = v136;
              uint64_t v261 = v134;
              goto LABEL_59;
            }
          }
          else
          {
            v131 = *(void (**)(char *, uint64_t))v248;
            (*(void (**)(char *, uint64_t))v248)(v128, v72);
          }
          v131(v243, v72);
LABEL_59:
          uint64_t v116 = (objc_class *)((char *)v116 + 1);
          os_log_t v115 = v251;
          if (isa == (char *)v116)
          {
            uint64_t v81 = v261;
            break;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v137 = *(void *)(v81 + 16);
      if (v137)
      {
        v256 = *(char **)(v254 + 16);
        unint64_t v138 = v81 + ((*(unsigned __int8 *)(v254 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v254 + 80));
        uint64_t v255 = *(void *)(v254 + 72);
        v139 = (void (**)(char *, uint64_t))(v254 + 8);
        uint64_t v254 = v81;
        swift_retain();
        uint64_t v140 = MEMORY[0x1E4FBC860];
        do
        {
          v141 = v241;
          ((void (*)(char *, unint64_t, uint64_t))v256)(v241, v138, v72);
          uint64_t v142 = sub_1C69E09B8();
          uint64_t v144 = v143;
          (*v139)(v141, v72);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1C69A74A4();
            uint64_t v140 = v147;
          }
          unint64_t v145 = *(void *)(v140 + 16);
          if (v145 >= *(void *)(v140 + 24) >> 1)
          {
            sub_1C69A74A4();
            uint64_t v140 = v148;
          }
          *(void *)(v140 + 16) = v145 + 1;
          uint64_t v146 = v140 + 16 * v145;
          *(void *)(v146 + 32) = v142;
          *(void *)(v146 + 40) = v144;
          v138 += v255;
          --v137;
          uint64_t v72 = v257;
        }
        while (v137);
        swift_release_n();
      }
      else
      {
        swift_release();
        uint64_t v140 = MEMORY[0x1E4FBC860];
      }
      swift_bridgeObjectRelease();
      uint64_t v262 = v140;
    }
    v149 = sub_1C69E1C48();
    os_log_type_t v150 = sub_1C69E1ED8();
    if (os_log_type_enabled(v149, v150))
    {
      v151 = (uint8_t *)swift_slowAlloc();
      uint64_t v152 = swift_slowAlloc();
      v260[0] = v152;
      *(_DWORD *)v151 = 136315138;
      swift_beginAccess();
      uint64_t v153 = swift_bridgeObjectRetain();
      uint64_t v154 = MEMORY[0x1C87A7030](v153, MEMORY[0x1E4FBB1A0]);
      unint64_t v156 = v155;
      swift_bridgeObjectRelease();
      *(void *)&long long v258 = sub_1C69A8148(v154, v156, v260);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C698D000, v149, v150, "Found mentioned app ids: %s", v151, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v152, -1, -1);
      MEMORY[0x1C87A7AA0](v151, -1, -1);
    }

    v157 = v232;
    v158 = v226;
    uint64_t v159 = sub_1C69E09E8();
    if (v157)
    {
      if (qword_1EBC085E0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v209, (uint64_t)qword_1EBC085E8);
      id v160 = v157;
      id v161 = v157;
      v162 = sub_1C69E1C48();
      os_log_type_t v163 = sub_1C69E1EE8();
      if (os_log_type_enabled(v162, v163))
      {
        v164 = (uint8_t *)swift_slowAlloc();
        uint64_t v165 = swift_slowAlloc();
        v260[0] = v165;
        *(_DWORD *)v164 = 136315138;
        *(void *)&long long v258 = v157;
        id v166 = v157;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
        uint64_t v167 = sub_1C69E1D08();
        *(void *)&long long v258 = sub_1C69A8148(v167, v168, v260);
        sub_1C69E1F28();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1C698D000, v162, v163, "Could not convert user dialog act to tasks: %s. Cant be a direct flow request", v164, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A7AA0](v165, -1, -1);
        MEMORY[0x1C87A7AA0](v164, -1, -1);

        v210(v231, v233);
        (*(void (**)(char *, uint64_t))(v212 + 8))(v226, v211);
      }
      else
      {

        v210(v231, v233);
        (*(void (**)(char *, uint64_t))(v212 + 8))(v158, v211);
      }
      swift_bridgeObjectRelease();
      goto LABEL_125;
    }
    unint64_t v169 = v159;
    v170 = *(void (**)(char *, void, uint64_t))(v229 + 104);
    v170(v228, *MEMORY[0x1E4FA4788], v230);
    if (v169 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v171 = sub_1C69E2098();
      if (v171)
      {
LABEL_80:
        sub_1C69C3024(0, (v169 & 0xC000000000000001) == 0, v169);
        if ((v169 & 0xC000000000000001) != 0) {
          MEMORY[0x1C87A7240](0, v169);
        }
        else {
          swift_retain();
        }
        swift_bridgeObjectRelease();
        uint64_t v172 = sub_1C69E0A58();
        uint64_t v174 = v173;
        sub_1C69E0AE8();
        if (v172 == sub_1C69E0AD8() && v174 == v175)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v177 = sub_1C69E2188();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v177 & 1) == 0)
          {
LABEL_92:
            swift_retain();
            sub_1C69E0A08();
            swift_release();
            if (v260[3])
            {
              sub_1C69E0A48();
              if (swift_dynamicCast())
              {
                v180 = (char *)v258;
                swift_retain();
                sub_1C69E0A18();
                v256 = v180;
                swift_release();
                uint64_t v257 = v171;
                if (v260[0] && (uint64_t v181 = sub_1C69E09F8(), swift_release(), v181))
                {
                  uint64_t v182 = v218;
                  sub_1C69E0A28();
                  swift_release();
                  uint64_t v183 = v216;
                }
                else
                {
                  uint64_t v182 = v218;
                  uint64_t v183 = v216;
                  __swift_storeEnumTagSinglePayload(v218, 1, 1, v216);
                }
                uint64_t v184 = v220;
                uint64_t v185 = v217;
                (*(void (**)(uint64_t, void, uint64_t))(v219 + 104))(v217, *MEMORY[0x1E4FA3228], v183);
                __swift_storeEnumTagSinglePayload(v185, 0, 1, v183);
                uint64_t v186 = v184 + *(int *)(v215 + 48);
                sub_1C69A35E0(v182, v184, &qword_1EA442E20);
                sub_1C69A35E0(v185, v186, &qword_1EA442E20);
                if (__swift_getEnumTagSinglePayload(v184, 1, v183) == 1)
                {
                  swift_release();
                  swift_release();
                  sub_1C69A3644(v185, &qword_1EA442E20);
                  sub_1C69A3644(v182, &qword_1EA442E20);
                  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v186, 1, v183);
                  uint64_t v171 = v257;
                  if (EnumTagSinglePayload == 1)
                  {
                    sub_1C69A3644(v184, &qword_1EA442E20);
LABEL_108:
                    v158 = v226;
                    goto LABEL_114;
                  }
                }
                else
                {
                  uint64_t v188 = (uint64_t)v214;
                  sub_1C69A35E0(v184, (uint64_t)v214, &qword_1EA442E20);
                  int v189 = __swift_getEnumTagSinglePayload(v186, 1, v183);
                  uint64_t v171 = v257;
                  if (v189 != 1)
                  {
                    uint64_t v190 = v219;
                    v191 = v213;
                    (*(void (**)(char *, uint64_t, uint64_t))(v219 + 32))(v213, v186, v183);
                    sub_1C69A370C(&qword_1EA442E48, MEMORY[0x1E4FA3240]);
                    sub_1C69E1CD8();
                    swift_release();
                    swift_release();
                    v192 = *(void (**)(char *, uint64_t))(v190 + 8);
                    v192(v191, v183);
                    sub_1C69A3644(v217, &qword_1EA442E20);
                    sub_1C69A3644(v218, &qword_1EA442E20);
                    v192(v214, v183);
                    sub_1C69A3644(v220, &qword_1EA442E20);
                    goto LABEL_108;
                  }
                  swift_release();
                  swift_release();
                  sub_1C69A3644(v217, &qword_1EA442E20);
                  sub_1C69A3644(v218, &qword_1EA442E20);
                  (*(void (**)(uint64_t, uint64_t))(v219 + 8))(v188, v183);
                  uint64_t v184 = v220;
                }
                sub_1C69A3644(v184, &qword_1EA442E18);
                goto LABEL_108;
              }
              swift_release();
            }
            else
            {
              swift_release();
              sub_1C69A3644((uint64_t)v260, qword_1EBC07810);
            }
            v158 = v226;
            goto LABEL_114;
          }
        }
        v178 = v228;
        uint64_t v179 = v230;
        (*(void (**)(char *, uint64_t))(v229 + 8))(v228, v230);
        v170(v178, *MEMORY[0x1E4FA4790], v179);
        goto LABEL_92;
      }
    }
    else
    {
      uint64_t v171 = *(void *)((v169 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v171) {
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRelease();
LABEL_114:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E38);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C69E3650;
    *(void *)(inited + 32) = sub_1C69E1948();
    *(void *)(inited + 40) = v194;
    swift_beginAccess();
    *(void *)(inited + 48) = v262;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D18);
    uint64_t v195 = sub_1C69E1C98();
    if (v171)
    {
      sub_1C69C3024(0, (v169 & 0xC000000000000001) == 0, v169);
      if ((v169 & 0xC000000000000001) != 0) {
        MEMORY[0x1C87A7240](0, v169);
      }
      else {
        swift_retain();
      }
      swift_bridgeObjectRelease();
      sub_1C69E0A58();
      swift_release();
      sub_1C69E0AF8();
      if (v259)
      {
        sub_1C69958A4(&v258, (uint64_t)v260);
        sub_1C69A9DF8(v195);
        uint64_t v257 = v196;
        swift_bridgeObjectRelease();
        sub_1C6995840((uint64_t)v260, (uint64_t)&v258);
        uint64_t v197 = v229;
        v198 = v228;
        (*(void (**)(char *, char *, uint64_t))(v229 + 16))(v221, v228, v230);
        uint64_t v199 = sub_1C69E0678();
        __swift_storeEnumTagSinglePayload(v222, 1, 1, v199);
        uint64_t v200 = (uint64_t)v223;
        sub_1C69E1298();
        uint64_t v201 = sub_1C69E12E8();
        __swift_storeEnumTagSinglePayload(v200, 0, 1, v201);
        uint64_t v202 = sub_1C69E1538();
        __swift_storeEnumTagSinglePayload(v224, 1, 1, v202);
        sub_1C69E1268();
        swift_allocObject();
        uint64_t v203 = sub_1C69E1218();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v260);
        (*(void (**)(char *, uint64_t))(v197 + 8))(v198, v230);
        v210(v231, v233);
        (*(void (**)(char *, uint64_t))(v212 + 8))(v158, v211);
        swift_bridgeObjectRelease();
        uint64_t *v234 = v203;
        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C69A3644((uint64_t)&v258, &qword_1EA442E40);
      v204 = sub_1C69E1C48();
      os_log_type_t v205 = sub_1C69E1EC8();
      if (os_log_type_enabled(v204, v205))
      {
        v206 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v206 = 0;
        v207 = "This is not a verb SiriSuggestions directly supports";
        goto LABEL_123;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v204 = sub_1C69E1C48();
      os_log_type_t v205 = sub_1C69E1EC8();
      if (os_log_type_enabled(v204, v205))
      {
        v206 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v206 = 0;
        v207 = "No verb attached to parse. Cant be a direct flow request";
LABEL_123:
        _os_log_impl(&dword_1C698D000, v204, v205, v207, v206, 2u);
        MEMORY[0x1C87A7AA0](v206, -1, -1);
      }
    }

    (*(void (**)(char *, uint64_t))(v229 + 8))(v228, v230);
    v210(v231, v233);
    (*(void (**)(char *, uint64_t))(v212 + 8))(v158, v211);
    swift_bridgeObjectRelease();
    goto LABEL_125;
  }
  unint64_t v82 = 0;
  v242 = (void (**)(char *, uint64_t))(v227 + 8);
  os_log_t v251 = (os_log_t)(v254 + 32);
  v245 = (void (**)(char *, uint64_t))(v254 + 8);
  uint64_t v237 = (v254 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v246 = (void (**)(char *, char *, uint64_t))(v254 + 16);
  while (v82 < *(void *)(v80 + 16))
  {
    uint64_t v83 = *(void *)(v254 + 72);
    uint64_t v84 = v80;
    v256 = (char *)((*(unsigned __int8 *)(v254 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v254 + 80));
    uint64_t v255 = v83;
    uint64_t v85 = *(void (**)(char *, char *, uint64_t))(v254 + 16);
    v85(v79, &v256[v80 + v83 * v82], v72);
    BOOL v87 = sub_1C69E09A8() == 0x746163696C707041 && v86 == 0xEC000000736E6F69;
    uint64_t v88 = v79;
    if (v87)
    {
      swift_bridgeObjectRelease();
      v90 = v248;
      v85(v248, v88, v72);
    }
    else
    {
      char v89 = sub_1C69E2188();
      swift_bridgeObjectRelease();
      v90 = v248;
      v85(v248, v88, v72);
      if ((v89 & 1) == 0)
      {
        unint64_t v91 = *v245;
        (*v245)(v90, v72);
        v79 = v250;
        uint64_t v80 = v84;
        goto LABEL_27;
      }
    }
    v92 = v244;
    sub_1C69E09C8();
    uint64_t v93 = sub_1C69E1C18();
    uint64_t v95 = v94;
    (*v242)(v92, v252);
    BOOL v96 = v93 == 0x64695F6D657469 && v95 == 0xE700000000000000;
    uint64_t v80 = v84;
    if (v96)
    {
      swift_bridgeObjectRelease();
      (*v245)(v90, v72);
LABEL_29:
      Class v98 = v251->isa;
      v79 = v250;
      ((void (*)(char *, char *, uint64_t))v251->isa)(isa, v250, v72);
      uint64_t v99 = v260[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C69C3454();
        uint64_t v99 = v260[0];
      }
      unint64_t v100 = *(void *)(v99 + 16);
      if (v100 >= *(void *)(v99 + 24) >> 1)
      {
        sub_1C69C3454();
        uint64_t v99 = v260[0];
      }
      *(void *)(v99 + 16) = v100 + 1;
      v101 = &v256[v99 + v100 * v255];
      uint64_t v72 = v257;
      ((void (*)(char *, char *, uint64_t))v98)(v101, isa, v257);
      v260[0] = v99;
      goto LABEL_34;
    }
    char v97 = sub_1C69E2188();
    swift_bridgeObjectRelease();
    unint64_t v91 = *v245;
    (*v245)(v90, v72);
    if (v97) {
      goto LABEL_29;
    }
    v79 = v250;
LABEL_27:
    v91(v79, v72);
LABEL_34:
    if (v247 == (char *)++v82)
    {
      uint64_t v102 = v260[0];
      uint64_t v81 = MEMORY[0x1E4FBC860];
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_110:
  __break(1u);
LABEL_111:
  swift_once();
LABEL_3:
  uint64_t v55 = sub_1C69E1C68();
  __swift_project_value_buffer(v55, (uint64_t)qword_1EA442F38);
  uint64_t v56 = sub_1C69E1C48();
  os_log_type_t v57 = sub_1C69E1EC8();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v58 = 0;
    _os_log_impl(&dword_1C698D000, v56, v57, "No user dialog acts attached to parse. Cant be a direct flow request", v58, 2u);
    MEMORY[0x1C87A7AA0](v58, -1, -1);
  }

LABEL_125:
  uint64_t *v234 = 0;
}

void sub_1C69A1D04(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t countAndFlagsBits = sub_1C69E1C68();
  uint64_t v136 = *(void *)(countAndFlagsBits - 8);
  MEMORY[0x1F4188790](countAndFlagsBits);
  v139 = (char *)&v122 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v130 = (uint64_t)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E60);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v133 = (uint64_t)&v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_1C69E1758();
  uint64_t v131 = *(void *)(v134 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v134);
  uint64_t v129 = (char *)&v122 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v132 = (char *)&v122 - v11;
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E8);
  uint64_t v12 = MEMORY[0x1F4188790](v135);
  uint64_t v137 = (uint64_t)&v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v141 = (uint64_t)&v122 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  unint64_t v138 = (char *)&v122 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v140 = (uint64_t)&v122 - v18;
  uint64_t v19 = sub_1C69E08D8();
  uint64_t v144 = *(void (***)(char *, void, uint64_t))(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v122 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E10);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)&v122 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  uint64_t v142 = (uint64_t)&v122 - v27;
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  uint64_t v143 = (uint64_t)&v122 - v29;
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  uint64_t v32 = (char *)&v122 - v31;
  MEMORY[0x1F4188790](v30);
  uint64_t v151 = (uint64_t)&v122 - v33;
  if (sub_1C69E08B8() == 0xD00000000000002FLL && v34 == 0x80000001C69E4D20)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v35 = sub_1C69E2188();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
    {
      if (qword_1EA442908 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(countAndFlagsBits, (uint64_t)qword_1EA442F38);
      uint64_t v54 = sub_1C69E1C48();
      os_log_type_t v55 = sub_1C69E1EC8();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl(&dword_1C698D000, v54, v55, "direct invocation is not of a known id", v56, 2u);
        MEMORY[0x1C87A7AA0](v56, -1, -1);
      }

      goto LABEL_34;
    }
  }
  uint64_t v36 = sub_1C69E08C8();
  if (!v36)
  {
    long long v148 = 0u;
    long long v149 = 0u;
    uint64_t v37 = v151;
    goto LABEL_11;
  }
  sub_1C69B7D68(0xD000000000000013, 0x80000001C69E4550, v36, &v148);
  swift_bridgeObjectRelease();
  uint64_t v37 = v151;
  if (!*((void *)&v149 + 1))
  {
LABEL_11:
    sub_1C69A3644((uint64_t)&v148, qword_1EBC07810);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v41 = sub_1C69E12E8();
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v41);
    goto LABEL_13;
  }
  v128 = a2;
  object = v147._object;
  uint64_t v127 = sub_1C69E05F8();
  if (v39 >> 60 == 15)
  {
    uint64_t v40 = sub_1C69E12E8();
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v40);
    swift_bridgeObjectRelease();
    a2 = v128;
  }
  else
  {
    unint64_t v58 = v39;
    v125 = v25;
    uint64_t v126 = (uint64_t)object;
    sub_1C69E0528();
    swift_allocObject();
    sub_1C69E0518();
    uint64_t v59 = sub_1C69E12E8();
    sub_1C69A370C(&qword_1EA442E80, MEMORY[0x1E4FA43F0]);
    uint64_t v60 = v146;
    sub_1C69E0508();
    if (v60)
    {

      swift_release();
      sub_1C69A36A0(v127, v58);
      uint64_t v37 = v151;
      __swift_storeEnumTagSinglePayload(v151, 1, 1, v59);
      swift_bridgeObjectRelease();
      uint64_t v146 = 0;
    }
    else
    {
      uint64_t v146 = 0;
      swift_release();
      sub_1C69A36A0(v127, v58);
      uint64_t v37 = v151;
      __swift_storeEnumTagSinglePayload(v151, 0, 1, v59);
      swift_bridgeObjectRelease();
    }
    a2 = v128;
    uint64_t v25 = v125;
  }
LABEL_13:
  uint64_t v42 = sub_1C69E08C8();
  if (!v42)
  {
    long long v148 = 0u;
    long long v149 = 0u;
    goto LABEL_22;
  }
  sub_1C69B7D68(0x6E6F69746361, 0xE600000000000000, v42, &v148);
  swift_bridgeObjectRelease();
  if (!*((void *)&v149 + 1))
  {
LABEL_22:
    sub_1C69A3644((uint64_t)&v148, qword_1EBC07810);
    goto LABEL_23;
  }
  if (swift_dynamicCast())
  {
    v128 = a2;
    Swift::String v43 = v147;
    swift_bridgeObjectRetain();
    DirectInvocationAction.init(rawValue:)(v43);
    if (v148 == 4)
    {
      uint64_t v44 = countAndFlagsBits;
      if (qword_1EA442908 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v44, (uint64_t)qword_1EA442F38);
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1C69E1C48();
      os_log_type_t v46 = sub_1C69E1EC8();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        *(void *)&long long v148 = v48;
        *(_DWORD *)uint64_t v47 = 136315138;
        swift_bridgeObjectRetain();
        v147._uint64_t countAndFlagsBits = sub_1C69A8148(v43._countAndFlagsBits, (unint64_t)v43._object, (uint64_t *)&v148);
        sub_1C69E1F28();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C698D000, v45, v46, "direct invocation is not set with a valid action field. Set with %s", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A7AA0](v48, -1, -1);
        MEMORY[0x1C87A7AA0](v47, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_1C69A3644(v151, &qword_1EA442E10);
      uint64_t v57 = 0;
      goto LABEL_82;
    }
    LODWORD(v127) = v148;
    swift_bridgeObjectRelease();
    uint64_t v61 = countAndFlagsBits;
    if (qword_1EA442908 != -1) {
      swift_once();
    }
    uint64_t v62 = __swift_project_value_buffer(v61, (uint64_t)qword_1EA442F38);
    sub_1C69A35E0(v151, (uint64_t)v32, &qword_1EA442E10);
    uint64_t v63 = v144;
    v144[2](v21, a1, v19);
    uint64_t v126 = v62;
    char v64 = sub_1C69E1C48();
    os_log_type_t v65 = sub_1C69E1ED8();
    LODWORD(v125) = v65;
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = swift_slowAlloc();
      uint64_t v124 = swift_slowAlloc();
      *(void *)&long long v148 = v124;
      *(_DWORD *)uint64_t v66 = 136315650;
      os_log_t v123 = v64;
      sub_1C69A35E0((uint64_t)v32, v143, &qword_1EA442E10);
      uint64_t v67 = sub_1C69E1D08();
      v147._uint64_t countAndFlagsBits = sub_1C69A8148(v67, v68, (uint64_t *)&v148);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      sub_1C69A3644((uint64_t)v32, &qword_1EA442E10);
      *(_WORD *)(v66 + 12) = 2080;
      int v69 = v127;
      LOBYTE(v147._countAndFlagsBits) = v127;
      uint64_t v70 = sub_1C69E1D08();
      v147._uint64_t countAndFlagsBits = sub_1C69A8148(v70, v71, (uint64_t *)&v148);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 22) = 2080;
      v147._uint64_t countAndFlagsBits = sub_1C69E08C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E78);
      uint64_t v72 = sub_1C69E1D08();
      v147._uint64_t countAndFlagsBits = sub_1C69A8148(v72, v73, (uint64_t *)&v148);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v144[1])(v21, v19);
      os_log_t v74 = v123;
      _os_log_impl(&dword_1C698D000, v123, (os_log_type_t)v125, "Got direct invocation properties: presentationContext: %s, action: %s, userData: %s", (uint8_t *)v66, 0x20u);
      uint64_t v75 = v124;
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v75, -1, -1);
      MEMORY[0x1C87A7AA0](v66, -1, -1);

      a2 = v128;
    }
    else
    {
      sub_1C69A3644((uint64_t)v32, &qword_1EA442E10);
      ((void (*)(char *, uint64_t))v63[1])(v21, v19);

      a2 = v128;
      int v69 = v127;
    }
    uint64_t v76 = v142;
    if (v69 != 1)
    {
      if (v69 == 2)
      {
        uint64_t v77 = sub_1C69E08C8();
        if (v77)
        {
          sub_1C69B7D68(0xD000000000000016, 0x80000001C69E4570, v77, &v148);
          swift_bridgeObjectRelease();
          uint64_t v78 = v140;
          uint64_t v79 = (uint64_t)v138;
          if (*((void *)&v149 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v80 = sub_1C69E05F8();
              if (v81 >> 60 == 15)
              {
                uint64_t v82 = sub_1C69E1538();
                __swift_storeEnumTagSinglePayload(v78, 1, 1, v82);
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v118 = v80;
                unint64_t v119 = v81;
                sub_1C69E0528();
                swift_allocObject();
                sub_1C69E0518();
                uint64_t v120 = sub_1C69E1538();
                sub_1C69A370C(&qword_1EA442BA0, MEMORY[0x1E4FA44C8]);
                v121 = v146;
                sub_1C69E0508();
                if (v121)
                {

                  swift_release();
                  sub_1C69A36A0(v118, v119);
                  __swift_storeEnumTagSinglePayload(v78, 1, 1, v120);
                  swift_bridgeObjectRelease();
                  uint64_t v146 = 0;
                }
                else
                {
                  uint64_t v146 = 0;
                  swift_release();
                  sub_1C69A36A0(v118, v119);
                  __swift_storeEnumTagSinglePayload(v78, 0, 1, v120);
                  swift_bridgeObjectRelease();
                }
                uint64_t v79 = (uint64_t)v138;
              }
              goto LABEL_75;
            }
LABEL_74:
            uint64_t v103 = sub_1C69E1538();
            __swift_storeEnumTagSinglePayload(v78, 1, 1, v103);
LABEL_75:
            sub_1C69A35E0(v78, v79, &qword_1EBC077E8);
            unint64_t v104 = sub_1C69E1C48();
            os_log_type_t v105 = sub_1C69E1ED8();
            if (os_log_type_enabled(v104, v105))
            {
              uint64_t v106 = (uint8_t *)swift_slowAlloc();
              uint64_t v107 = swift_slowAlloc();
              *(void *)&long long v148 = v107;
              *(_DWORD *)uint64_t v106 = 136315138;
              sub_1C69A35E0(v79, v141, &qword_1EBC077E8);
              uint64_t v108 = sub_1C69E1D08();
              v147._uint64_t countAndFlagsBits = sub_1C69A8148(v108, v109, (uint64_t *)&v148);
              uint64_t v78 = v140;
              sub_1C69E1F28();
              swift_bridgeObjectRelease();
              sub_1C69A3644(v79, &qword_1EBC077E8);
              _os_log_impl(&dword_1C698D000, v104, v105, "Got direct invocation properties: preComputedSuggestions: %s", v106, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1C87A7AA0](v107, -1, -1);
              MEMORY[0x1C87A7AA0](v106, -1, -1);
            }
            else
            {
              sub_1C69A3644(v79, &qword_1EBC077E8);
            }

            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
            uint64_t countAndFlagsBits = sub_1C69E1C98();
            sub_1C69E0AE8();
            sub_1C69E0AD8();
            uint64_t v110 = v137;
            sub_1C69A35E0(v78, v137, &qword_1EBC077E8);
            uint64_t v111 = sub_1C69E1538();
            if (__swift_getEnumTagSinglePayload(v110, 1, v111) == 1)
            {
              sub_1C69A3644(v110, &qword_1EBC077E8);
              uint64_t v112 = sub_1C69E1B58();
              *((void *)&v149 + 1) = sub_1C69E1678();
              uint64_t v150 = sub_1C69A370C(&qword_1EA442E70, MEMORY[0x1E4FA4728]);
              *(void *)&long long v148 = v112;
            }
            else
            {
              sub_1C69E14E8();
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v111 - 8) + 8))(v110, v111);
              sub_1C69958A4((long long *)&v147._countAndFlagsBits, (uint64_t)&v148);
            }
            uint64_t v113 = v151;
            sub_1C69A35E0(v151, v143, &qword_1EA442E10);
            uint64_t v114 = v140;
            sub_1C69A35E0(v140, v141, &qword_1EBC077E8);
            sub_1C69E1268();
            swift_allocObject();
            uint64_t v57 = sub_1C69E1218();
            sub_1C69A3644(v114, &qword_1EBC077E8);
            sub_1C69A3644(v113, &qword_1EA442E10);
LABEL_82:
            a2 = v128;
            goto LABEL_35;
          }
        }
        else
        {
          long long v148 = 0u;
          long long v149 = 0u;
          uint64_t v78 = v140;
          uint64_t v79 = (uint64_t)v138;
        }
        sub_1C69A3644((uint64_t)&v148, qword_1EBC07810);
        goto LABEL_74;
      }
      uint64_t v94 = v136;
      uint64_t v95 = v139;
      uint64_t v96 = countAndFlagsBits;
      (*(void (**)(char *, uint64_t, uint64_t))(v136 + 16))(v139, v126, countAndFlagsBits);
      char v97 = sub_1C69E1C48();
      os_log_type_t v98 = sub_1C69E1EC8();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = (uint8_t *)swift_slowAlloc();
        uint64_t v100 = swift_slowAlloc();
        *(void *)&long long v148 = v100;
        *(_DWORD *)uint64_t v99 = 136315138;
        if (v127) {
          uint64_t v101 = 0xD00000000000001ALL;
        }
        else {
          uint64_t v101 = 0xD000000000000011;
        }
        if (v127) {
          unint64_t v102 = 0x80000001C69E4520;
        }
        else {
          unint64_t v102 = 0x80000001C69E44E0;
        }
        v147._uint64_t countAndFlagsBits = sub_1C69A8148(v101, v102, (uint64_t *)&v148);
        sub_1C69E1F28();
        a2 = v128;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C698D000, v97, v98, "Unknown direct invocation action: %s", v99, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A7AA0](v100, -1, -1);
        MEMORY[0x1C87A7AA0](v99, -1, -1);

        (*(void (**)(char *, uint64_t))(v94 + 8))(v139, v96);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v96);
      }
      uint64_t v53 = v151;
      goto LABEL_28;
    }
    sub_1C69A35E0(v151, v142, &qword_1EA442E10);
    sub_1C69A35E0(v76, (uint64_t)v25, &qword_1EA442E10);
    uint64_t v83 = sub_1C69E12E8();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v83);
    sub_1C69A3644((uint64_t)v25, &qword_1EA442E10);
    if (EnumTagSinglePayload != 1)
    {
LABEL_86:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      sub_1C69E1C98();
      sub_1C69E0AE8();
      sub_1C69E0AD8();
      uint64_t v115 = sub_1C69E1348();
      uint64_t v116 = sub_1C69E1338();
      *((void *)&v149 + 1) = v115;
      uint64_t v150 = sub_1C69A370C(&qword_1EA442E68, MEMORY[0x1E4FA4568]);
      *(void *)&long long v148 = v116;
      sub_1C69A35E0(v76, v143, &qword_1EA442E10);
      uint64_t v117 = sub_1C69E1538();
      __swift_storeEnumTagSinglePayload(v141, 1, 1, v117);
      sub_1C69E1268();
      swift_allocObject();
      uint64_t v57 = sub_1C69E1218();
      sub_1C69A3644(v76, &qword_1EA442E10);
      sub_1C69A3644(v151, &qword_1EA442E10);
      goto LABEL_35;
    }
    uint64_t v85 = sub_1C69E08C8();
    if (v85)
    {
      sub_1C69B7D68(0x697461636F766E69, 0xEE00657079546E6FLL, v85, &v148);
      swift_bridgeObjectRelease();
      uint64_t v86 = v134;
      if (*((void *)&v149 + 1))
      {
        uint64_t v87 = v133;
        int v88 = swift_dynamicCast();
        __swift_storeEnumTagSinglePayload(v87, v88 ^ 1u, 1, v86);
        if (__swift_getEnumTagSinglePayload(v87, 1, v86) != 1)
        {
          uint64_t v89 = v131;
          (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v132, v87, v86);
          uint64_t v90 = sub_1C69E08C8();
          if (v90)
          {
            sub_1C69B7D68(0x6F43676F6C616964, 0xEF6449747865746ELL, v90, &v148);
            swift_bridgeObjectRelease();
            if (*((void *)&v149 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v144 = (void (**)(char *, void, uint64_t))v147._object;
                uint64_t countAndFlagsBits = v147._countAndFlagsBits;
                unint64_t v91 = v132;
                (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v129, v132, v86);
                uint64_t v92 = sub_1C69E0678();
                __swift_storeEnumTagSinglePayload(v130, 1, 1, v92);
                uint64_t v93 = v143;
                sub_1C69E1298();
                (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v86);
                sub_1C69A3644(v76, &qword_1EA442E10);
                __swift_storeEnumTagSinglePayload(v93, 0, 1, v83);
                sub_1C69A3578(v93, v76);
                goto LABEL_86;
              }
LABEL_91:
              (*(void (**)(char *, uint64_t))(v89 + 8))(v132, v86);
              goto LABEL_86;
            }
          }
          else
          {
            long long v148 = 0u;
            long long v149 = 0u;
          }
          sub_1C69A3644((uint64_t)&v148, qword_1EBC07810);
          goto LABEL_91;
        }
LABEL_85:
        sub_1C69A3644(v87, &qword_1EA442E60);
        goto LABEL_86;
      }
    }
    else
    {
      long long v148 = 0u;
      long long v149 = 0u;
      uint64_t v86 = v134;
    }
    sub_1C69A3644((uint64_t)&v148, qword_1EBC07810);
    uint64_t v87 = v133;
    __swift_storeEnumTagSinglePayload(v133, 1, 1, v86);
    goto LABEL_85;
  }
LABEL_23:
  if (qword_1EA442908 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(countAndFlagsBits, (uint64_t)qword_1EA442F38);
  uint64_t v49 = sub_1C69E1C48();
  os_log_type_t v50 = sub_1C69E1EC8();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v51 = 0;
    _os_log_impl(&dword_1C698D000, v49, v50, "direct invocation is not set with an action field", v51, 2u);
    uint64_t v52 = v51;
    uint64_t v37 = v151;
    MEMORY[0x1C87A7AA0](v52, -1, -1);
  }

  uint64_t v53 = v37;
LABEL_28:
  sub_1C69A3644(v53, &qword_1EA442E10);
LABEL_34:
  uint64_t v57 = 0;
LABEL_35:
  *a2 = v57;
}

uint64_t sub_1C69A3578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69A35E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C69A3644(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C69A36A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C69A36B4(a1, a2);
  }
  return a1;
}

uint64_t sub_1C69A36B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C69A370C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C69A3754(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C69E1C68();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBC085E8);
  OUTLINED_FUNCTION_5_2();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1C69E1C48();
  os_log_type_t v12 = sub_1C69E1ED8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C69A8148(a3, a4, v21);
    sub_1C69E1F28();
    OUTLINED_FUNCTION_6_4();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C69A8148(a1, a2, v21);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v11, v12, "Getting in memory property: %s for requestId: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_4_2();
  }
  OUTLINED_FUNCTION_3_3();
  uint64_t v14 = *(void *)(v5 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C69B7E10(a3, a4, v14, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C69A4CE8((uint64_t)a5, (uint64_t)v21);
  OUTLINED_FUNCTION_5_2();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1C69E1C48();
  os_log_type_t v16 = sub_1C69E1ED8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = a3;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 67109634;
    sub_1C69A4A40((uint64_t)v21);
    sub_1C69E1F28();
    *(_WORD *)(v18 + 8) = 2080;
    swift_bridgeObjectRetain();
    sub_1C69A8148(v17, a4, &v20);
    sub_1C69E1F28();
    OUTLINED_FUNCTION_6_4();
    *(_WORD *)(v18 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_1C69A8148(a1, a2, &v20);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v15, v16, "Found = %{BOOL}d for property: %s for requestId: %s", (uint8_t *)v18, 0x1Cu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    sub_1C69A4A40((uint64_t)v21);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_2();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C69A3B4C()
{
  uint64_t v1 = v0;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C69E1C68();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085E8);
  uint64_t v3 = sub_1C69E1C48();
  os_log_type_t v4 = sub_1C69E1EC8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C698D000, v3, v4, "Clearing suggestions state store", v5, 2u);
    OUTLINED_FUNCTION_17();
  }

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D00);
  sub_1C69E1CA8();
  swift_endAccess();
  swift_beginAccess();
  *(void *)(v1 + 120) = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69A3C88(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1C69E1C68();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EBC085E8);
  OUTLINED_FUNCTION_5_2();
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1C69E1C48();
  os_log_type_t v14 = sub_1C69E1ED8();
  uint64_t v24 = a5;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    sub_1C69A8148(a3, a4, v26);
    sub_1C69E1F28();
    OUTLINED_FUNCTION_6_4();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    v25[0] = sub_1C69A8148(a1, a2, v26);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v13, v14, "Setting propertyKey: %s for requestId: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_4_2();
  }
  sub_1C69A4C84(a5, (uint64_t)v26);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C69A9D68((uint64_t)v26, a3, a4);
  swift_endAccess();
  uint64_t result = OUTLINED_FUNCTION_3_3();
  uint64_t v17 = *(void *)(v6 + 120);
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain_n();
    sub_1C69956B4();
    for (uint64_t i = v17 + 56; ; i += 32)
    {
      uint64_t v20 = *(void (**)(uint64_t))(i - 8);
      v25[0] = a3;
      v25[1] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      if (sub_1C69E1F68()) {
        break;
      }
      swift_release();
      swift_bridgeObjectRelease();
      if (!--v18) {
        return swift_bridgeObjectRelease_n();
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_5_2();
    uint64_t v21 = sub_1C69E1C48();
    os_log_type_t v22 = sub_1C69E1EC8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      v25[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C69A8148(a3, a4, v25);
      sub_1C69E1F28();
      OUTLINED_FUNCTION_6_4();
      _os_log_impl(&dword_1C698D000, v21, v22, "Invoking late arrival of property: %s to listener", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {

      OUTLINED_FUNCTION_4_2();
    }
    v20(v24);
    return swift_release();
  }
  return result;
}

uint64_t sub_1C69A40A4()
{
  return sub_1C69A4108();
}

uint64_t sub_1C69A4108()
{
  uint64_t result = (uint64_t)sub_1C69C5758(v21);
  uint64_t v1 = v21[0];
  int64_t v2 = v21[3];
  unint64_t v3 = v21[4];
  uint64_t v19 = v21[1];
  int64_t v20 = (unint64_t)(v21[2] + 64) >> 6;
  uint64_t v18 = MEMORY[0x1E4FBC860];
  while (1)
  {
    if (v3)
    {
      unint64_t v4 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      unint64_t v5 = v4 | (v2 << 6);
      goto LABEL_20;
    }
    int64_t v6 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      break;
    }
    if (v6 >= v20) {
      goto LABEL_27;
    }
    unint64_t v7 = *(void *)(v19 + 8 * v6);
    int64_t v8 = v2 + 1;
    if (!v7)
    {
      int64_t v8 = v2 + 2;
      if (v2 + 2 >= v20) {
        goto LABEL_27;
      }
      unint64_t v7 = *(void *)(v19 + 8 * v8);
      if (!v7)
      {
        int64_t v8 = v2 + 3;
        if (v2 + 3 >= v20) {
          goto LABEL_27;
        }
        unint64_t v7 = *(void *)(v19 + 8 * v8);
        if (!v7)
        {
          int64_t v8 = v2 + 4;
          if (v2 + 4 >= v20) {
            goto LABEL_27;
          }
          unint64_t v7 = *(void *)(v19 + 8 * v8);
          if (!v7)
          {
            int64_t v8 = v2 + 5;
            if (v2 + 5 >= v20) {
              goto LABEL_27;
            }
            unint64_t v7 = *(void *)(v19 + 8 * v8);
            if (!v7)
            {
              int64_t v9 = v2 + 6;
              while (v9 < v20)
              {
                unint64_t v7 = *(void *)(v19 + 8 * v9++);
                if (v7)
                {
                  int64_t v8 = v9 - 1;
                  goto LABEL_19;
                }
              }
LABEL_27:
              swift_bridgeObjectRelease();
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_19:
    unint64_t v3 = (v7 - 1) & v7;
    unint64_t v5 = __clz(__rbit64(v7)) + (v8 << 6);
    int64_t v2 = v8;
LABEL_20:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v5);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    sub_1C69A4BEC();
    sub_1C69A4C38();
    swift_bridgeObjectRetain();
    if (sub_1C69E1CC8())
    {
      uint64_t v13 = v18;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v22 = v18;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1C69C3434(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v13 = v22;
      }
      unint64_t v15 = *(void *)(v13 + 16);
      unint64_t v14 = *(void *)(v13 + 24);
      unint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        uint64_t result = (uint64_t)sub_1C69C3434((char *)(v14 > 1), v15 + 1, 1);
        unint64_t v16 = v15 + 1;
        uint64_t v13 = v22;
      }
      *(void *)(v13 + 16) = v16;
      uint64_t v18 = v13;
      uint64_t v17 = v13 + 16 * v15;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v12;
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C69A4368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[20] = a4;
  v5[21] = v4;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  return MEMORY[0x1F4188298](sub_1C69A4390, v4, 0);
}

uint64_t sub_1C69A4390()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  OUTLINED_FUNCTION_3_3();
  uint64_t v4 = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C69B7E10(v3, v2, v4, (_OWORD *)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 88))
  {
    unint64_t v5 = *(void (**)(uint64_t))(v0 + 152);
    sub_1C69A4B74((long long *)(v0 + 64), (_OWORD *)(v0 + 16));
    v5(v0 + 16);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 160);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 144);
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v10 = *(void *)(v0 + 136);
    sub_1C69A4A40(v0 + 64);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    *(void *)(v11 + 24) = v6;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C69A4B18((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C69A73F8);
    uint64_t v12 = *(void *)(*(void *)(v7 + 120) + 16);
    sub_1C69A4BA4(v12, (uint64_t (*)(BOOL))sub_1C69A73F8);
    uint64_t v13 = *(void *)(v7 + 120);
    *(void *)(v13 + 16) = v12 + 1;
    unint64_t v14 = (void *)(v13 + 32 * v12);
    v14[4] = v10;
    v14[5] = v9;
    v14[6] = sub_1C69A4AD8;
    v14[7] = v11;
    swift_endAccess();
  }
  OUTLINED_FUNCTION_18();
  return v15();
}

uint64_t sub_1C69A4538()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1C69A4568()
{
  sub_1C69A4538();
  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for InMemoryHintsStateStore()
{
  return self;
}

uint64_t sub_1C69A45B8()
{
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 112) = sub_1C69E1C98();
  *(void *)(v0 + 120) = v1;
  return v0;
}

uint64_t sub_1C69A4614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](sub_1C69A463C, v5, 0);
}

uint64_t sub_1C69A463C()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69A3C88(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_1C69A469C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](sub_1C69A46C4, v5, 0);
}

uint64_t sub_1C69A46C4()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69A3754(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(_OWORD **)(v0 + 16));
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_1C69A4724(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1C69A4748, v2, 0);
}

uint64_t sub_1C69A4748()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69A3B4C();
  OUTLINED_FUNCTION_18();
  return v0();
}

uint64_t sub_1C69A47A0(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1C69A47C4, v2, 0);
}

uint64_t sub_1C69A47C4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = sub_1C69A40A4();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1C69A4824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C69A48E0;
  return sub_1C69A4368(a1, a2, a3, a4);
}

uint64_t sub_1C69A48E0()
{
  OUTLINED_FUNCTION_6_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v0();
}

unint64_t sub_1C69A49CC()
{
  unint64_t result = qword_1EBC08140;
  if (!qword_1EBC08140)
  {
    type metadata accessor for InMemoryHintsStateStore();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC08140);
  }
  return result;
}

unint64_t sub_1C69A4A18(uint64_t a1)
{
  unint64_t result = sub_1C69A49CC();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1C69A4A40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C69A4AA0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C69A4AD8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C69A4B00()
{
  return sub_1C69A4B18((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C69A75FC);
}

uint64_t sub_1C69A4B18(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

_OWORD *sub_1C69A4B74(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1C69A4B8C(uint64_t a1)
{
  return sub_1C69A4BA4(a1, (uint64_t (*)(BOOL))sub_1C69A75FC);
}

uint64_t sub_1C69A4BA4(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

unint64_t sub_1C69A4BEC()
{
  unint64_t result = qword_1EA442EB8;
  if (!qword_1EA442EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442EB8);
  }
  return result;
}

unint64_t sub_1C69A4C38()
{
  unint64_t result = qword_1EA442EC0;
  if (!qword_1EA442EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442EC0);
  }
  return result;
}

uint64_t sub_1C69A4C84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C69A4CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t InternalXPCSuggestionsLoggerFactory.__allocating_init(bookkeepingXPCClient:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1C69958A4(a1, v2 + 16);
  return v2;
}

uint64_t InternalXPCSuggestionsLoggerFactory.init(bookkeepingXPCClient:)(long long *a1)
{
  sub_1C69958A4(a1, v1 + 16);
  return v1;
}

uint64_t InternalXPCSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  a1[3] = v3;
  a1[4] = *(void *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  uint64_t v7 = *(uint64_t (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16);
  return v7(boxed_opaque_existential_1, v5, v3);
}

uint64_t InternalXPCSuggestionsLoggerFactory.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t InternalXPCSuggestionsLoggerFactory.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1C69A4EFC@<X0>(uint64_t *a1@<X8>)
{
  return InternalXPCSuggestionsLoggerFactory.create(featureService:)(a1);
}

uint64_t type metadata accessor for InternalXPCSuggestionsLoggerFactory()
{
  return self;
}

uint64_t method lookup function for InternalXPCSuggestionsLoggerFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InternalXPCSuggestionsLoggerFactory);
}

uint64_t dispatch thunk of InternalXPCSuggestionsLoggerFactory.__allocating_init(bookkeepingXPCClient:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t InServiceSuggestionsDispatcher.dispatch(suggestions:presentationContext:)(uint64_t a1, uint64_t a2)
{
  v3[26] = a2;
  v3[27] = v2;
  v3[25] = a1;
  sub_1C69E0678();
  v3[28] = swift_task_alloc();
  uint64_t v4 = sub_1C69E1538();
  v3[29] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v3[30] = v5;
  v3[31] = swift_task_alloc();
  v3[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED0);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  v3[44] = swift_task_alloc();
  uint64_t v6 = sub_1C69E17A8();
  v3[45] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v3[46] = v7;
  v3[47] = swift_task_alloc();
  uint64_t v8 = sub_1C69E1458();
  v3[48] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v3[49] = v9;
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69A5178, 0, 0);
}

uint64_t sub_1C69A5178()
{
  uint64_t v147 = v0;
  unint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = sub_1C69E14D8();
  v146[0] = MEMORY[0x1E4FBC868];
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 368);
    uint64_t v5 = *(unsigned __int8 *)(*(void *)(v0 + 392) + 80);
    uint64_t v6 = v2 + ((v5 + 32) & ~v5);
    uint64_t v140 = (v5 + 32) & ~v5;
    uint64_t v136 = (void *)(v5 | 7);
    uint64_t v142 = (void (*)(void))(*(void *)(v0 + 392) + 16);
    uint64_t v144 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 392) + 32);
    uint64_t v135 = v4 + 32;
    uint64_t v7 = MEMORY[0x1E4FBC868];
    uint64_t v138 = v4;
    uint64_t v134 = (void (**)(void, void))(v4 + 8);
    uint64_t v139 = *(void *)(*(void *)(v0 + 392) + 72);
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 376);
      OUTLINED_FUNCTION_14();
      v9();
      sub_1C69E1428();
      unint64_t v1 = sub_1C69A8B20(v8);
      uint64_t v11 = *(void *)(v7 + 16);
      BOOL v12 = (v10 & 1) == 0;
      uint64_t v13 = v11 + v12;
      if (__OFADD__(v11, v12)) {
        break;
      }
      char v14 = v10;
      if (*(void *)(v7 + 24) < v13)
      {
        uint64_t v15 = *(void *)(v0 + 376);
        sub_1C69A8D28(v13, 1);
        uint64_t v7 = v146[0];
        unint64_t v16 = sub_1C69A8B20(v15);
        if ((v14 & 1) != (v17 & 1))
        {
          OUTLINED_FUNCTION_3_4();
          return sub_1C69E21B8();
        }
        unint64_t v1 = v16;
      }
      uint64_t v18 = *(void *)(v0 + 408);
      if (v14)
      {
        uint64_t v19 = *(void *)(v0 + 400);
        uint64_t v20 = *(void *)(v0 + 384);
        (*v134)(*(void *)(v0 + 376), *(void *)(v0 + 360));
        uint64_t v7 = v146[0];
        uint64_t v21 = *(void *)(v146[0] + 56);
        uint64_t v22 = *v144;
        (*v144)(v19, v18, v20);
        uint64_t v23 = *(void *)(v21 + 8 * v1);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v21 + 8 * v1) = v23;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v23 = sub_1C69A721C();
          *(void *)(v21 + 8 * v1) = v23;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        if (v25 >= *(void *)(v23 + 24) >> 1)
        {
          uint64_t v23 = sub_1C69A721C();
          *(void *)(v21 + 8 * v1) = v23;
        }
        uint64_t v26 = *(void *)(v0 + 400);
        uint64_t v27 = *(void *)(v0 + 384);
        *(void *)(v23 + 16) = v25 + 1;
        uint64_t v28 = v23 + v140 + v25 * v139;
        uint64_t v29 = v139;
        v22(v28, v26, v27);
      }
      else
      {
        uint64_t v31 = *(void *)(v0 + 376);
        uint64_t v30 = *(void *)(v0 + 384);
        uint64_t v32 = *(void *)(v0 + 360);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED8);
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = xmmword_1C69E3650;
        (*v144)(v33 + v140, v18, v30);
        *(void *)(v7 + 8 * (v1 >> 6) + 64) |= 1 << v1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v138 + 32))(*(void *)(v7 + 48) + *(void *)(v138 + 72) * v1, v31, v32);
        *(void *)(*(void *)(v7 + 56) + 8 * v1) = v33;
        uint64_t v34 = *(void *)(v7 + 16);
        BOOL v35 = __OFADD__(v34, 1);
        uint64_t v36 = v34 + 1;
        if (v35) {
          goto LABEL_60;
        }
        *(void *)(v7 + 16) = v36;
        uint64_t v29 = v139;
      }
      v6 += v29;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    swift_once();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x1E4FBC868];
LABEL_18:
    uint64_t v37 = 0;
    uint64_t v132 = (long long *)(v0 + 56);
    uint64_t v135 = v0 + 96;
    uint64_t v136 = (void *)(v0 + 16);
    uint64_t v131 = v0 + 136;
    *(void *)(v0 + 416) = v7;
    char v38 = *(unsigned char *)(v7 + 32);
    *(unsigned char *)(v0 + 456) = v38;
    uint64_t v39 = 1 << v38;
    if (v39 < 64) {
      uint64_t v40 = ~(-1 << v39);
    }
    else {
      uint64_t v40 = -1;
    }
    if ((v40 & *(void *)(v7 + 64)) == 0) {
      goto LABEL_23;
    }
LABEL_22:
    OUTLINED_FUNCTION_23_0();
    uint64_t v43 = *(void *)(v0 + 416);
    while (1)
    {
      *(void *)(v0 + 424) = v41;
      *(void *)(v0 + 432) = v42;
      uint64_t v50 = *(void *)(v0 + 360);
      uint64_t v51 = *(void *)(v0 + 368);
      uint64_t v53 = *(void *)(v0 + 344);
      uint64_t v52 = *(void *)(v0 + 352);
      uint64_t v54 = *(void *)(v0 + 256);
      uint64_t v143 = *(void *)(v0 + 216);
      uint64_t v145 = *(void *)(v0 + 336);
      os_log_type_t v55 = *(void (**)(void))(v51 + 16);
      OUTLINED_FUNCTION_18_1();
      v55();
      uint64_t v56 = *(void (***)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 + 56) + 8 * v1);
      *(void *)(v52 + *(int *)(v54 + 48)) = v56;
      uint64_t v57 = *(int *)(v54 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v53, v52, v50);
      *(void *)(v53 + v57) = v56;
      uint64_t v58 = v145;
      uint64_t v59 = *(void *)(v143 + 16);
      uint64_t v60 = *(int *)(v54 + 48);
      uint64_t v142 = v55;
      ((void (*)(uint64_t, uint64_t, uint64_t))v55)(v145, v53, v50);
      *(void *)(v145 + v60) = v56;
      uint64_t v61 = *(void *)(v59 + 16);
      uint64_t v144 = v56;
      swift_bridgeObjectRetain_n();
      if (v61)
      {
        unint64_t v62 = sub_1C69A8B20(*(void *)(v0 + 336));
        if (v63) {
          break;
        }
      }
      uint64_t v141 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 368) + 8);
      v141(*(void *)(v0 + 336), *(void *)(v0 + 360));
      if (qword_1EBC085D8 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_30_0();
      uint64_t v65 = *(void *)(v0 + 264);
      uint64_t v64 = *(void *)(v0 + 272);
      uint64_t v66 = *(void *)(v0 + 256);
      uint64_t v67 = sub_1C69E1C68();
      __swift_project_value_buffer(v67, (uint64_t)qword_1EBC085C0);
      uint64_t v68 = OUTLINED_FUNCTION_15_0();
      ((void (*)(uint64_t))v55)(v68);
      *(void *)(v64 + v66) = v56;
      sub_1C69A8BF8(v64, v65);
      int v69 = sub_1C69E1C48();
      os_log_type_t v70 = sub_1C69E1EE8();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = *(void *)(v0 + 360);
        uint64_t v144 = *(void (***)(uint64_t, uint64_t, uint64_t))(v0 + 344);
        uint64_t v72 = *(void *)(v0 + 280);
        uint64_t v73 = *(void *)(v0 + 256);
        uint64_t v74 = *(void *)(v0 + 264);
        uint64_t v75 = swift_slowAlloc();
        uint64_t v139 = OUTLINED_FUNCTION_25_1();
        v146[0] = v139;
        *(_DWORD *)uint64_t v75 = 136315138;
        uint64_t v76 = *(int *)(v73 + 48);
        OUTLINED_FUNCTION_14();
        v55();
        uint64_t v77 = v74;
        *(void *)(v72 + v76) = *(void *)(v74 + v76);
        sub_1C69A9798((unint64_t *)&unk_1EA442EE0, 255, MEMORY[0x1E4FA4858]);
        uint64_t v78 = sub_1C69E2178();
        unint64_t v80 = v79;
        v141(v72, v71);
        *(void *)(v75 + 4) = sub_1C69A8148(v78, v80, v146);
        swift_bridgeObjectRelease();
        sub_1C69A8C60(v77);
        _os_log_impl(&dword_1C698D000, v69, v70, "Unknown vehicle of %s", (uint8_t *)v75, 0xCu);
        unint64_t v1 = v139;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_17();

        uint64_t v81 = (uint64_t)v144;
      }
      else
      {
        unint64_t v1 = *(void *)(v0 + 344);
        uint64_t v82 = *(void *)(v0 + 264);

        sub_1C69A8C60(v82);
        uint64_t v81 = v1;
      }
      sub_1C69A8C60(v81);
      uint64_t v37 = *(void *)(v0 + 424);
      if (*(void *)(v0 + 432)) {
        goto LABEL_22;
      }
LABEL_23:
      if (__OFADD__(v37, 1)) {
        goto LABEL_59;
      }
      OUTLINED_FUNCTION_34_0();
      uint64_t v43 = *(void *)(v0 + 416);
      if (v45 >= (uint64_t)(v44 >> 6))
      {
LABEL_45:
        OUTLINED_FUNCTION_12_1();
        OUTLINED_FUNCTION_11_1();
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_3_4();
        __asm { BRAA            X1, X16 }
      }
      uint64_t v46 = v43 + 64;
      if (!*(void *)(v43 + 64 + 8 * v45))
      {
        int64_t v47 = v44 >> 6;
        if (v45 + 1 >= v47) {
          goto LABEL_45;
        }
        if (!*(void *)(v46 + 8 * (v45 + 1)))
        {
          if (v45 + 2 >= v47) {
            goto LABEL_45;
          }
          if (!*(void *)(v46 + 8 * (v45 + 2)))
          {
            uint64_t v48 = v45 + 3;
            if (v48 >= v47) {
              goto LABEL_45;
            }
            if (!*(void *)(v46 + 8 * v48))
            {
              do
              {
                uint64_t v49 = v48 + 1;
                if (__OFADD__(v48, 1)) {
                  goto LABEL_61;
                }
                if (v49 >= v47) {
                  goto LABEL_45;
                }
                ++v48;
              }
              while (!*(void *)(v46 + 8 * v49));
            }
          }
        }
      }
      OUTLINED_FUNCTION_21_1();
    }
    uint64_t v85 = OUTLINED_FUNCTION_17_1(v62);
    sub_1C6995840(v85, (uint64_t)v132);
    sub_1C69958A4(v132, (uint64_t)v136);
    uint64_t v139 = *(void *)(v60 + 8);
    ((void (*)(uint64_t, uint64_t))v139)(v58, v61);
    if (qword_1EBC085D8 != -1) {
      goto LABEL_62;
    }
  }
  OUTLINED_FUNCTION_30_0();
  uint64_t v86 = *(void *)(v0 + 320);
  uint64_t v87 = *(void *)(v0 + 328);
  uint64_t v88 = *(void *)(v0 + 304);
  uint64_t v127 = *(void *)(v0 + 312);
  os_log_t log = *(os_log_t *)(v0 + 296);
  uint64_t v133 = *(void *)(v0 + 288);
  uint64_t v89 = *(void *)(v0 + 256);
  uint64_t v90 = sub_1C69E1C68();
  __swift_project_value_buffer(v90, (uint64_t)qword_1EBC085C0);
  uint64_t v91 = *(int *)(v89 + 48);
  OUTLINED_FUNCTION_28_0();
  v142();
  *(void *)(v87 + v91) = v144;
  sub_1C69A8CC0(v87, v86);
  sub_1C69A8BF8(v87, v127);
  uint64_t v92 = *(int *)(v89 + 48);
  OUTLINED_FUNCTION_28_0();
  v142();
  *(void *)(v88 + v92) = v144;
  sub_1C69A8CC0(v88, (uint64_t)log);
  sub_1C69A8BF8(v88, v133);
  sub_1C6995840((uint64_t)v136, v135);
  swift_bridgeObjectRetain_n();
  uint64_t v93 = sub_1C69E1C48();
  os_log_type_t v94 = sub_1C69E1ED8();
  if (os_log_type_enabled(v93, v94))
  {
    uint64_t v95 = *(void *)(v0 + 360);
    uint64_t v96 = *(void *)(v0 + 320);
    uint64_t v125 = *(void *)(v0 + 296);
    uint64_t v126 = *(void *)(v0 + 384);
    uint64_t v128 = *(void *)(v0 + 288);
    os_log_type_t type = v94;
    uint64_t v97 = *(void *)(v0 + 280);
    uint64_t v98 = *(void *)(v0 + 256);
    uint64_t v123 = v98;
    uint64_t v124 = *(void *)(v0 + 312);
    loga = v93;
    uint64_t v99 = OUTLINED_FUNCTION_25_1();
    v146[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v99 = 136315650;
    uint64_t v100 = *(int *)(v98 + 48);
    OUTLINED_FUNCTION_18_1();
    v142();
    *(void *)(v97 + v100) = *(void *)(v96 + v100);
    sub_1C69A9798((unint64_t *)&unk_1EA442EE0, 255, MEMORY[0x1E4FA4858]);
    uint64_t v101 = sub_1C69E2178();
    unint64_t v103 = v102;
    OUTLINED_FUNCTION_33_0();
    ((void (*)(void))v139)();
    *(void *)(v0 + 184) = sub_1C69A8148(v101, v103, v146);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69A8C60(v124);
    sub_1C69A8C60(v96);
    *(_WORD *)(v99 + 12) = 2080;
    uint64_t v104 = *(int *)(v123 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v142)(v97, v125, v95);
    uint64_t v105 = *(void *)(v125 + v104);
    *(void *)(v97 + v104) = v105;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_33_0();
    ((void (*)(void))v139)();
    uint64_t v106 = MEMORY[0x1C87A7030](v105, v126);
    unint64_t v108 = v107;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 176) = sub_1C69A8148(v106, v108, v146);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69A8C60(v128);
    sub_1C69A8C60(v125);
    *(_WORD *)(v99 + 22) = 2080;
    sub_1C6995840(v135, v131);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E0);
    uint64_t v109 = sub_1C69E1D08();
    *(void *)(v0 + 192) = sub_1C69A8148(v109, v110, v146);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v135);
    _os_log_impl(&dword_1C698D000, loga, type, "Dispatching %s of %s to %s", (uint8_t *)v99, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v113 = *(void *)(v0 + 320);
    uint64_t v115 = *(void *)(v0 + 288);
    uint64_t v114 = *(void *)(v0 + 296);
    sub_1C69A8C60(*(void *)(v0 + 312));
    sub_1C69A8C60(v113);
    sub_1C69A8C60(v115);
    sub_1C69A8C60(v114);
    __swift_destroy_boxed_opaque_existential_1(v135);
  }
  uint64_t v116 = *(void *)(v0 + 360);
  uint64_t v117 = *(void *)(v0 + 280);
  uint64_t v118 = *(void *)(v0 + 256);
  __swift_project_boxed_opaque_existential_1(v136, *(void *)(v0 + 40));
  uint64_t v119 = *(int *)(v118 + 48);
  OUTLINED_FUNCTION_14();
  v142();
  *(void *)(v117 + v119) = v144;
  sub_1C69E14E8();
  sub_1C69E1518();
  sub_1C69E1528();
  sub_1C69E14F8();
  ((void (*)(uint64_t, uint64_t))v139)(v117, v116);
  uint64_t v120 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v120;
  void *v120 = v0;
  v120[1] = sub_1C69A5EFC;
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_3_4();
  return MEMORY[0x1F4158FC8](v121);
}

uint64_t sub_1C69A5EFC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 448) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[30] + 8))(v2[31], v2[29]);
  if (v0) {
    uint64_t v3 = sub_1C69A6A94;
  }
  else {
    uint64_t v3 = sub_1C69A6064;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1C69A6064()
{
  uint64_t v97 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v87 = (uint64_t)(v0 + 12);
  uint64_t v88 = v0 + 2;
  uint64_t v85 = (long long *)(v0 + 7);
  sub_1C69A8C60(v0[43]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  while (1)
  {
    if (v0[54])
    {
      OUTLINED_FUNCTION_23_0();
      uint64_t v1 = v0[52];
    }
    else
    {
      if (__OFADD__(v0[53], 1))
      {
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      OUTLINED_FUNCTION_34_0();
      uint64_t v1 = v0[52];
      if (v6 >= (uint64_t)(v5 >> 6)) {
        goto LABEL_25;
      }
      uint64_t v7 = v1 + 64;
      if (!*(void *)(v1 + 64 + 8 * v6))
      {
        int64_t v8 = v5 >> 6;
        if (v6 + 1 >= v8) {
          goto LABEL_25;
        }
        if (!*(void *)(v7 + 8 * (v6 + 1)))
        {
          if (v6 + 2 >= v8) {
            goto LABEL_25;
          }
          if (!*(void *)(v7 + 8 * (v6 + 2)))
          {
            uint64_t v9 = v6 + 3;
            if (v9 >= v8)
            {
LABEL_25:
              OUTLINED_FUNCTION_12_1();
              OUTLINED_FUNCTION_11_1();
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
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              OUTLINED_FUNCTION_3_4();
              __asm { BRAA            X1, X16 }
            }
            if (!*(void *)(v7 + 8 * v9))
            {
              do
              {
                uint64_t v10 = v9 + 1;
                if (__OFADD__(v9, 1)) {
                  goto LABEL_36;
                }
                if (v10 >= v8) {
                  goto LABEL_25;
                }
                ++v9;
              }
              while (!*(void *)(v7 + 8 * v10));
            }
          }
        }
      }
      OUTLINED_FUNCTION_21_1();
    }
    v0[53] = v3;
    v0[54] = v4;
    uint64_t v11 = v0[45];
    uint64_t v12 = v0[46];
    uint64_t v14 = v0[43];
    uint64_t v13 = v0[44];
    uint64_t v15 = v0[32];
    uint64_t v92 = v0[27];
    uint64_t v93 = v0[42];
    unint64_t v16 = *(void (**)(void))(v12 + 16);
    OUTLINED_FUNCTION_31_0();
    v16();
    uint64_t v1 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    *(void *)(v13 + *(int *)(v15 + 48)) = v1;
    uint64_t v17 = *(int *)(v15 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v14, v13, v11);
    *(void *)(v14 + v17) = v1;
    uint64_t v18 = *(void *)(v92 + 16);
    uint64_t v19 = *(int *)(v15 + 48);
    uint64_t v95 = v16;
    OUTLINED_FUNCTION_31_0();
    v16();
    *(void *)(v93 + v19) = v1;
    uint64_t v20 = *(void *)(v18 + 16);
    swift_bridgeObjectRetain_n();
    if (v20)
    {
      unint64_t v21 = sub_1C69A8B20(v0[42]);
      if (v22) {
        break;
      }
    }
    os_log_type_t v94 = *(void (**)(uint64_t, uint64_t))(v0[46] + 8);
    v94(v0[42], v0[45]);
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_30_0();
    uint64_t v24 = v0[33];
    uint64_t v23 = v0[34];
    uint64_t v25 = v0[32];
    uint64_t v26 = sub_1C69E1C68();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EBC085C0);
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_31_0();
    v16();
    *(void *)(v23 + v25) = v1;
    sub_1C69A8BF8(v23, v24);
    uint64_t v27 = sub_1C69E1C48();
    os_log_type_t v28 = sub_1C69E1EE8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v1 = v0[45];
      uint64_t v92 = v0[43];
      uint64_t v29 = v0[35];
      uint64_t v30 = v0[32];
      uint64_t v31 = v0[33];
      uint64_t v32 = swift_slowAlloc();
      uint64_t v91 = OUTLINED_FUNCTION_25_1();
      v96[0] = v91;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v33 = *(int *)(v30 + 48);
      ((void (*)(uint64_t, uint64_t, uint64_t))v95)(v29, v31, v1);
      *(void *)(v29 + v33) = *(void *)(v31 + v33);
      sub_1C69A9798((unint64_t *)&unk_1EA442EE0, 255, MEMORY[0x1E4FA4858]);
      uint64_t v34 = sub_1C69E2178();
      unint64_t v36 = v35;
      v94(v29, v1);
      *(void *)(v32 + 4) = sub_1C69A8148(v34, v36, v96);
      swift_bridgeObjectRelease();
      sub_1C69A8C60(v31);
      _os_log_impl(&dword_1C698D000, v27, v28, "Unknown vehicle of %s", (uint8_t *)v32, 0xCu);
      uint64_t v2 = v91;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();

      uint64_t v37 = v92;
    }
    else
    {
      uint64_t v2 = v0[43];
      uint64_t v38 = v0[33];

      sub_1C69A8C60(v38);
      uint64_t v37 = v2;
    }
    sub_1C69A8C60(v37);
  }
  uint64_t v41 = OUTLINED_FUNCTION_17_1(v21);
  sub_1C6995840(v41, (uint64_t)v85);
  sub_1C69958A4(v85, (uint64_t)v88);
  uint64_t v92 = *(void *)(v19 + 8);
  ((void (*)(uint64_t, uint64_t))v92)(v93, v20);
  if (qword_1EBC085D8 == -1) {
    goto LABEL_29;
  }
LABEL_37:
  swift_once();
LABEL_29:
  OUTLINED_FUNCTION_30_0();
  uint64_t v42 = v0[40];
  uint64_t v43 = v0[41];
  uint64_t v44 = v0[38];
  os_log_t log = (os_log_t)v0[39];
  uint64_t v86 = v0[37];
  uint64_t v89 = v0[36];
  uint64_t v45 = v0[32];
  uint64_t v46 = sub_1C69E1C68();
  __swift_project_value_buffer(v46, (uint64_t)qword_1EBC085C0);
  uint64_t v47 = *(int *)(v45 + 48);
  OUTLINED_FUNCTION_28_0();
  v95();
  *(void *)(v43 + v47) = v1;
  sub_1C69A8CC0(v43, v42);
  sub_1C69A8BF8(v43, (uint64_t)log);
  uint64_t v48 = *(int *)(v45 + 48);
  OUTLINED_FUNCTION_28_0();
  v95();
  *(void *)(v44 + v48) = v1;
  sub_1C69A8CC0(v44, v86);
  sub_1C69A8BF8(v44, v89);
  sub_1C6995840((uint64_t)v88, v87);
  swift_bridgeObjectRetain_n();
  uint64_t v49 = sub_1C69E1C48();
  os_log_type_t v50 = sub_1C69E1ED8();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = v0[45];
    uint64_t v52 = v0[40];
    uint64_t v80 = v0[37];
    uint64_t v81 = v0[48];
    uint64_t v82 = v0[36];
    os_log_type_t type = v50;
    uint64_t v53 = v0[35];
    uint64_t v54 = v0[32];
    uint64_t v78 = v54;
    uint64_t v79 = v0[39];
    uint64_t v55 = OUTLINED_FUNCTION_25_1();
    v96[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136315650;
    loga = v49;
    uint64_t v56 = *(int *)(v54 + 48);
    OUTLINED_FUNCTION_31_0();
    v95();
    *(void *)(v53 + v56) = *(void *)(v52 + v56);
    sub_1C69A9798((unint64_t *)&unk_1EA442EE0, 255, MEMORY[0x1E4FA4858]);
    uint64_t v57 = sub_1C69E2178();
    unint64_t v59 = v58;
    OUTLINED_FUNCTION_33_0();
    ((void (*)(void))v92)();
    v0[23] = sub_1C69A8148(v57, v59, v96);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69A8C60(v79);
    sub_1C69A8C60(v52);
    *(_WORD *)(v55 + 12) = 2080;
    uint64_t v60 = *(int *)(v78 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v95)(v53, v80, v51);
    uint64_t v61 = *(void *)(v80 + v60);
    *(void *)(v53 + v60) = v61;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_33_0();
    ((void (*)(void))v92)();
    uint64_t v62 = MEMORY[0x1C87A7030](v61, v81);
    unint64_t v64 = v63;
    swift_bridgeObjectRelease();
    v0[22] = sub_1C69A8148(v62, v64, v96);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69A8C60(v82);
    sub_1C69A8C60(v80);
    *(_WORD *)(v55 + 22) = 2080;
    sub_1C6995840(v87, (uint64_t)(v0 + 17));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E0);
    uint64_t v65 = sub_1C69E1D08();
    v0[24] = sub_1C69A8148(v65, v66, v96);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v87);
    _os_log_impl(&dword_1C698D000, loga, type, "Dispatching %s of %s to %s", (uint8_t *)v55, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v67 = v0[40];
    uint64_t v69 = v0[36];
    uint64_t v68 = v0[37];
    sub_1C69A8C60(v0[39]);
    sub_1C69A8C60(v67);
    sub_1C69A8C60(v69);
    sub_1C69A8C60(v68);
    __swift_destroy_boxed_opaque_existential_1(v87);
  }
  uint64_t v70 = v0[45];
  uint64_t v71 = v0[35];
  uint64_t v72 = v0[32];
  __swift_project_boxed_opaque_existential_1(v88, v0[5]);
  uint64_t v73 = *(int *)(v72 + 48);
  OUTLINED_FUNCTION_14();
  v95();
  *(void *)(v71 + v73) = v1;
  sub_1C69E14E8();
  sub_1C69E1518();
  sub_1C69E1528();
  sub_1C69E14F8();
  ((void (*)(uint64_t, uint64_t))v92)(v71, v70);
  uint64_t v74 = (void *)swift_task_alloc();
  v0[55] = (uint64_t)v74;
  *uint64_t v74 = v0;
  v74[1] = sub_1C69A5EFC;
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_3_4();
  return MEMORY[0x1F4158FC8](v75);
}

uint64_t sub_1C69A6A94()
{
  sub_1C69A8C60(*(void *)(v0 + 344));
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static InServiceSuggestionsDispatcher.create(eventDispatcher:clock:selfLogger:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07808);
  uint64_t v6 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DC0) - 8);
  uint64_t v33 = *(void *)(*(void *)v6 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_1C69E37B0;
  unint64_t v8 = v35 + v7;
  uint64_t v9 = (uint64_t *)(v35 + v7 + v6[14]);
  uint64_t v10 = *MEMORY[0x1E4FA4578];
  uint64_t v11 = sub_1C69E1358();
  OUTLINED_FUNCTION_8_0();
  uint64_t v32 = *(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 104);
  v32(v35 + v7, v10, v11);
  uint64_t v13 = *MEMORY[0x1E4FA4850];
  uint64_t v14 = sub_1C69E17A8();
  OUTLINED_FUNCTION_8_0();
  uint64_t v29 = *(void (**)(void))(v15 + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v29)(v35 + v7, v13, v14);
  sub_1C6995840(a1, (uint64_t)v39);
  sub_1C6995840(a2, (uint64_t)v38);
  uint64_t v16 = type metadata accessor for InAppEventDispatcher();
  uint64_t v17 = swift_allocObject();
  sub_1C69958A4(v39, v17 + 16);
  sub_1C69958A4(v38, v17 + 56);
  v9[3] = v16;
  uint64_t v18 = sub_1C69A9798(&qword_1EBC08090, 255, (void (*)(uint64_t))type metadata accessor for InAppEventDispatcher);
  v9[4] = v18;
  *uint64_t v9 = v17;
  uint64_t v19 = (uint64_t *)(v8 + v33 + v6[14]);
  v32(v8 + v33, *MEMORY[0x1E4FA4570], v11);
  ((void (*)(unint64_t, uint64_t, uint64_t))v29)(v8 + v33, v13, v14);
  sub_1C6995840(a1, (uint64_t)v39);
  sub_1C6995840(a2, (uint64_t)v38);
  uint64_t v20 = swift_allocObject();
  sub_1C69958A4(v39, v20 + 16);
  sub_1C69958A4(v38, v20 + 56);
  v19[3] = v16;
  v19[4] = v18;
  uint64_t *v19 = v20;
  unint64_t v21 = (uint64_t *)(v8 + 2 * v33 + v6[14]);
  v29();
  sub_1C6995840(a3, (uint64_t)v39);
  uint64_t v22 = sub_1C69E1288();
  swift_allocObject();
  uint64_t v23 = sub_1C69E1278();
  uint64_t v24 = MEMORY[0x1E4FA43E0];
  uint64_t v21[3] = v22;
  v21[4] = v24;
  *unint64_t v21 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E0);
  sub_1C69A9798(&qword_1EBC07DB8, 255, MEMORY[0x1E4FA4858]);
  uint64_t v25 = sub_1C69E1C98();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  a4[3] = v36;
  uint64_t result = sub_1C69A9798(&qword_1EBC07EA8, v27, (void (*)(uint64_t))type metadata accessor for InServiceSuggestionsDispatcher);
  a4[4] = result;
  *a4 = v26;
  return result;
}

uint64_t InServiceSuggestionsDispatcher.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InServiceSuggestionsDispatcher.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1C69A7044(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1C69A70EC;
  return InServiceSuggestionsDispatcher.dispatch(suggestions:presentationContext:)(a1, a2);
}

uint64_t sub_1C69A70EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C69A71E0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C69A721C()
{
  OUTLINED_FUNCTION_20_1();
  if (v3)
  {
    OUTLINED_FUNCTION_6_5();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_19_1();
      if (v5)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_5_3();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *(void *)(v0 + 16);
  if (v4 <= v7) {
    uint64_t v8 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v8 = v4;
  }
  if (!v8)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED8);
  uint64_t v9 = sub_1C69E1458();
  OUTLINED_FUNCTION_2_0(v9);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (void *)swift_allocObject();
  size_t v15 = _swift_stdlib_malloc_size(v14);
  if (!v11 || (v15 - v13 == 0x8000000000000000 ? (BOOL v16 = v11 == -1) : (BOOL v16 = 0), v16))
  {
LABEL_23:
    OUTLINED_FUNCTION_1_3();
    uint64_t result = sub_1C69E2088();
    __break(1u);
    return result;
  }
  v14[2] = v7;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v11);
LABEL_18:
  uint64_t v17 = *(void *)(sub_1C69E1458() - 8);
  if (v1)
  {
    sub_1C69A7DD4(v0 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)), v7);
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    uint64_t v18 = OUTLINED_FUNCTION_7_2();
    sub_1C69A76B8(v18, v19, v20, v21);
  }
  return (uint64_t)v14;
}

void sub_1C69A73F8()
{
  OUTLINED_FUNCTION_20_1();
  if (v2)
  {
    OUTLINED_FUNCTION_6_5();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_5_3();
    }
  }
  OUTLINED_FUNCTION_10_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F08);
    char v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_27_0(v5);
    OUTLINED_FUNCTION_14_1(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_26_0();
    sub_1C69A7D28(v7, v8, v9);
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_7_2();
    sub_1C69A7818(v10, v11, v12, v13);
  }
}

void sub_1C69A74A4()
{
  OUTLINED_FUNCTION_20_1();
  if (v2)
  {
    OUTLINED_FUNCTION_6_5();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_5_3();
    }
  }
  OUTLINED_FUNCTION_10_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F30);
    char v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_27_0(v5);
    OUTLINED_FUNCTION_14_1(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_26_0();
    sub_1C69A7CCC(v7, v8, v9);
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_7_2();
    sub_1C69A7930(v10, v11, v12, v13);
  }
}

void sub_1C69A7550()
{
  OUTLINED_FUNCTION_20_1();
  if (v2)
  {
    OUTLINED_FUNCTION_6_5();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_5_3();
    }
  }
  OUTLINED_FUNCTION_10_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DA0);
    char v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_27_0(v5);
    OUTLINED_FUNCTION_14_1(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_26_0();
    sub_1C69A7EC0(v7, v8, v9);
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_7_2();
    sub_1C69A7A28(v10, v11, v12, v13);
  }
}

void sub_1C69A75FC()
{
  OUTLINED_FUNCTION_20_1();
  if (v3)
  {
    OUTLINED_FUNCTION_6_5();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_19_1();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_5_3();
    }
  }
  OUTLINED_FUNCTION_10_2();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D98);
    uint64_t v6 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_27_0(v6);
    *(void *)(v2 + 16) = v1;
    *(void *)(v2 + 24) = 2 * (v7 / 40);
  }
  if (v0)
  {
    uint64_t v8 = (char *)OUTLINED_FUNCTION_26_0();
    sub_1C69A7F54(v8, v9, v10);
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_7_2();
    sub_1C69A7B40(v11, v12, v13, v14);
  }
}

uint64_t sub_1C69A76B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1C69E1458() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_1C69E20E8();
  __break(1u);
  return result;
}

uint64_t sub_1C69A7818(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F10);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C69E20E8();
  __break(1u);
  return result;
}

uint64_t sub_1C69A7930(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C69E20E8();
  __break(1u);
  return result;
}

uint64_t sub_1C69A7A28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C69E20E8();
  __break(1u);
  return result;
}

uint64_t sub_1C69A7B40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C78);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C69E20E8();
  __break(1u);
  return result;
}

void sub_1C69A7C60(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7C78(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7C84(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7C9C(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7CB4(uint64_t a1, uint64_t a2)
{
}

char *sub_1C69A7CCC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_4();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_13_0(a3, result);
  }
  return result;
}

char *sub_1C69A7D28(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C69E20E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

void sub_1C69A7DBC(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7DD4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_2_4();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22_1();
    if (v6 && (v5(0), OUTLINED_FUNCTION_8_0(), v3 + *(void *)(v7 + 72) * v2 > v4))
    {
      if (v4 != v3)
      {
        OUTLINED_FUNCTION_4_3();
        swift_arrayInitWithTakeBackToFront();
      }
    }
    else
    {
      v5(0);
      OUTLINED_FUNCTION_4_3();
      swift_arrayInitWithTakeFrontToBack();
    }
  }
}

char *sub_1C69A7EC0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C69E20E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[64 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, a2 << 6);
  }
  return __src;
}

char *sub_1C69A7F54(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_4();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_13_0(a3, result);
  }
  return result;
}

void sub_1C69A7FB8(uint64_t a1, uint64_t a2)
{
}

void sub_1C69A7FC4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_2_4();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22_1();
    if (v6
      && (__swift_instantiateConcreteTypeFromMangledName(v5),
          OUTLINED_FUNCTION_8_0(),
          v3 + *(void *)(v7 + 72) * v2 > v4))
    {
      if (v4 != v3)
      {
        OUTLINED_FUNCTION_4_3();
        swift_arrayInitWithTakeBackToFront();
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v5);
      OUTLINED_FUNCTION_4_3();
      swift_arrayInitWithTakeFrontToBack();
    }
  }
}

uint64_t sub_1C69A80A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C69A80D0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1C69A8148(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1C69E1F28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C69A8148(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C69A821C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C69A973C((uint64_t)v12, *a3);
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
      sub_1C69A973C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C69A821C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C69A8374((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C69E1F38();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1C69A844C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1C69E1FF8();
    if (!v8)
    {
      uint64_t result = sub_1C69E2088();
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

void *sub_1C69A8374(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C69E20E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C69A844C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C69A84E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1C69A86C0(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1C69A86C0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C69A84E4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1C69E1D68();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1C69A8658(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1C69E1FB8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1C69E20E8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1C69E2088();
  __break(1u);
  return result;
}

void *sub_1C69A8658(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C69A86C0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DA8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C69A8870(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C69A8798(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C69A8798(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C69E20E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1C69A8870(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C69E20E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_1C69A8900(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_1C69A8910()
{
  OUTLINED_FUNCTION_29_0();
  sub_1C69E0E48();
  uint64_t v1 = (void (*)(uint64_t))MEMORY[0x1E4FA4270];
  sub_1C69A9798(&qword_1EA442B28, 255, MEMORY[0x1E4FA4270]);
  uint64_t v2 = sub_1C69E1CB8();
  return sub_1C69A9584(v0, v2, MEMORY[0x1E4FA4270], &qword_1EA442F18, v1, MEMORY[0x1E4FA4280]);
}

unint64_t sub_1C69A89DC(uint64_t a1, uint64_t a2)
{
  sub_1C69E2218();
  sub_1C69E1D48();
  uint64_t v4 = sub_1C69E2238();
  return sub_1C69A949C(a1, a2, v4);
}

unint64_t sub_1C69A8A54()
{
  OUTLINED_FUNCTION_29_0();
  sub_1C69E1818();
  uint64_t v1 = (void (*)(uint64_t))MEMORY[0x1E4FA48C8];
  sub_1C69A9798(&qword_1EBC07DC8, 255, MEMORY[0x1E4FA48C8]);
  uint64_t v2 = sub_1C69E1CB8();
  return sub_1C69A9584(v0, v2, MEMORY[0x1E4FA48C8], &qword_1EBC07C40, v1, MEMORY[0x1E4FA48D8]);
}

unint64_t sub_1C69A8B20(uint64_t a1)
{
  sub_1C69E17A8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4FA4858];
  sub_1C69A9798(&qword_1EBC07DB8, 255, MEMORY[0x1E4FA4858]);
  uint64_t v3 = sub_1C69E1CB8();
  return sub_1C69A9584(a1, v3, MEMORY[0x1E4FA4858], &qword_1EA442F28, v2, MEMORY[0x1E4FA4870]);
}

uint64_t sub_1C69A8BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69A8C60(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C69A8CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442ED0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69A8D28(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1C69E17A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F20);
  int v46 = a2;
  uint64_t v10 = sub_1C69E20C8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_40;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v44 = v11;
  if (!v16) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v21 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v21 | (v20 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v20 << 6))
  {
    uint64_t v27 = *(void *)(v45 + 72);
    unint64_t v28 = *(void *)(v11 + 48) + v27 * i;
    if (v46)
    {
      (*v17)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v11 + 56) + 8 * i);
    }
    else
    {
      (*v43)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v11 + 56) + 8 * i);
      swift_bridgeObjectRetain();
    }
    sub_1C69A9798(&qword_1EBC07DB8, 255, MEMORY[0x1E4FA4858]);
    uint64_t result = sub_1C69E1CB8();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6))) == 0)
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v30) >> 6;
      while (++v32 != v35 || (v34 & 1) == 0)
      {
        BOOL v36 = v32 == v35;
        if (v32 == v35) {
          unint64_t v32 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v32);
        if (v37 != -1)
        {
          unint64_t v33 = __clz(__rbit64(~v37)) + (v32 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v18 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v27 * v33, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v33) = v29;
    ++*(void *)(v12 + 16);
    uint64_t v11 = v44;
    if (v16) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      goto LABEL_42;
    }
    if (v23 >= v41)
    {
      swift_release();
      uint64_t v3 = v40;
      uint64_t v24 = v42;
      goto LABEL_35;
    }
    uint64_t v24 = v42;
    unint64_t v25 = v42[v23];
    ++v20;
    if (!v25)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v41) {
        goto LABEL_33;
      }
      unint64_t v25 = v42[v20];
      if (!v25) {
        break;
      }
    }
LABEL_18:
    unint64_t v16 = (v25 - 1) & v25;
  }
  int64_t v26 = v23 + 2;
  if (v26 < v41)
  {
    unint64_t v25 = v42[v26];
    if (!v25)
    {
      while (1)
      {
        int64_t v20 = v26 + 1;
        if (__OFADD__(v26, 1)) {
          goto LABEL_43;
        }
        if (v20 >= v41) {
          goto LABEL_33;
        }
        unint64_t v25 = v42[v20];
        ++v26;
        if (v25) {
          goto LABEL_18;
        }
      }
    }
    int64_t v20 = v26;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v40;
LABEL_35:
  if (v46)
  {
    uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
    if (v38 >= 64) {
      sub_1C69A9720(0, (unint64_t)(v38 + 63) >> 6, v24);
    }
    else {
      *uint64_t v24 = -1 << v38;
    }
    *(void *)(v11 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t type metadata accessor for InServiceSuggestionsDispatcher()
{
  return self;
}

uint64_t method lookup function for InServiceSuggestionsDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InServiceSuggestionsDispatcher);
}

uint64_t sub_1C69A9180(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF8);
  char v37 = a2;
  uint64_t v6 = sub_1C69E20C8();
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
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    int64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    int64_t v23 = (long long *)(*(void *)(v5 + 56) + 48 * i);
    if (v37)
    {
      sub_1C69A4B74(v23, v38);
    }
    else
    {
      sub_1C69A4C84((uint64_t)v23, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1C69E2218();
    sub_1C69E1D48();
    uint64_t result = sub_1C69E2238();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
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
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    unint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    *unint64_t v32 = v22;
    v32[1] = v21;
    uint64_t result = (uint64_t)sub_1C69A4B74(v38, (_OWORD *)(*(void *)(v7 + 56) + 48 * v27));
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_42;
    }
    if (v16 >= v35)
    {
      swift_release();
      uint64_t v3 = v34;
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_35;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v36 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v35)
  {
    unint64_t v18 = *(void *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_43;
        }
        if (v13 >= v35) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v36 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v34;
LABEL_35:
  if (v37)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_1C69A9720(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1C69A949C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C69E2188() & 1) == 0)
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
      while (!v14 && (sub_1C69E2188() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C69A9584(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  int64_t v20 = a4;
  v18[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  BOOL v11 = (char *)v18 - v10;
  uint64_t v19 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v18[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void (**)(void))(v9 + 16);
    do
    {
      OUTLINED_FUNCTION_18_1();
      v15();
      sub_1C69A9798(v20, 255, v21);
      char v16 = sub_1C69E1CD8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if (v16) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v18[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

uint64_t sub_1C69A9720(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1C69A973C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C69A9798(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_1C69E20E8();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  uint64_t v3 = v0[34];
  *(void *)(v1 - 152) = v0[35];
  *(void *)(v1 - 144) = v3;
  uint64_t v4 = v0[31];
  *(void *)(v1 - 136) = v0[33];
  *(void *)(v1 - 128) = v4;
  return swift_release();
}

void *OUTLINED_FUNCTION_13_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void OUTLINED_FUNCTION_14_1(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1)
{
  return *(void *)(v1 + 56) + 40 * a1;
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return v0 + 32;
}

size_t OUTLINED_FUNCTION_27_0(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return *(void *)(v0 + 248);
}

uint64_t sub_1C69A9A60(uint64_t a1)
{
  return sub_1C69A9B40(a1, qword_1EBC085A8);
}

uint64_t static Logger.xpcCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C69A9BDC(qword_1EBC08528, (uint64_t)qword_1EBC085A8, a1);
}

uint64_t sub_1C69A9A9C(uint64_t a1)
{
  return sub_1C69A9B40(a1, qword_1EBC085E8);
}

uint64_t static Logger.siriSuggestionsSupportCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C69A9BDC(&qword_1EBC085E0, (uint64_t)qword_1EBC085E8, a1);
}

uint64_t sub_1C69A9AE0(uint64_t a1)
{
  return sub_1C69A9B40(a1, qword_1EA442F38);
}

uint64_t static Logger.flowCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C69A9BDC(&qword_1EA442908, (uint64_t)qword_1EA442F38, a1);
}

uint64_t sub_1C69A9B1C(uint64_t a1)
{
  return sub_1C69A9B40(a1, qword_1EBC085C0);
}

uint64_t sub_1C69A9B40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1C69E1C68();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1C69E1C58();
}

uint64_t static Logger.dispatcherCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C69A9BDC(&qword_1EBC085D8, (uint64_t)qword_1EBC085C0, a1);
}

uint64_t sub_1C69A9BDC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C69E1C68();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
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

uint64_t sub_1C69A9CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C69B60C4((_OWORD *)a1, v6);
    sub_1C69B6818(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C69B74DC(a1, qword_1EBC07810);
    OUTLINED_FUNCTION_66();
    sub_1C69CDAE8();
    swift_bridgeObjectRelease();
    return sub_1C69B74DC((uint64_t)v6, qword_1EBC07810);
  }
}

uint64_t sub_1C69A9D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C69A4B74((long long *)a1, v6);
    sub_1C69B6924(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C69B74DC(a1, &qword_1EBC07D60);
    OUTLINED_FUNCTION_66();
    sub_1C69CDD3C();
    swift_bridgeObjectRelease();
    return sub_1C69B74DC((uint64_t)v6, &qword_1EBC07D60);
  }
}

void sub_1C69A9DF8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF8);
    uint64_t v2 = (void *)sub_1C69E20D8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v30 = a1 + 64;
  OUTLINED_FUNCTION_36();
  unint64_t v5 = v4 & v3;
  int64_t v29 = (unint64_t)(63 - v6) >> 6;
  swift_bridgeObjectRetain();
  int64_t v31 = 0;
  uint64_t v7 = &qword_1EBC07D18;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v9 = v8 | (v31 << 6);
      }
      else
      {
        int64_t v10 = v31 + 1;
        if (__OFADD__(v31, 1)) {
          goto LABEL_35;
        }
        if (v10 >= v29)
        {
LABEL_32:
          sub_1C69B60D4();
          return;
        }
        unint64_t v11 = *(void *)(v30 + 8 * v10);
        int64_t v12 = v31 + 1;
        if (!v11)
        {
          OUTLINED_FUNCTION_80();
          if (v13 == v14) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_77();
          if (!v11)
          {
            OUTLINED_FUNCTION_80();
            if (v13 == v14) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_77();
            if (!v11)
            {
              OUTLINED_FUNCTION_80();
              if (v13 == v14) {
                goto LABEL_32;
              }
              OUTLINED_FUNCTION_77();
              if (!v11)
              {
                int64_t v16 = v15 + 4;
                if (v16 >= v29) {
                  goto LABEL_32;
                }
                unint64_t v11 = *(void *)(v30 + 8 * v16);
                if (!v11)
                {
                  while (!__OFADD__(v16, 1))
                  {
                    OUTLINED_FUNCTION_80();
                    if (v13 == v14) {
                      goto LABEL_32;
                    }
                    OUTLINED_FUNCTION_77();
                    int64_t v16 = v17 + 1;
                    if (v11) {
                      goto LABEL_26;
                    }
                  }
                  goto LABEL_36;
                }
                int64_t v12 = v16;
              }
            }
          }
        }
LABEL_26:
        unint64_t v5 = (v11 - 1) & v11;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
        int64_t v31 = v12;
      }
      unint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
      uint64_t v32 = *v18;
      uint64_t v33 = v18[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(v7);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      swift_dynamicCast();
      sub_1C69A4B74(v34, v36);
      sub_1C69A4B74(v36, v37);
      sub_1C69A4B74(v37, &v35);
      unint64_t v19 = sub_1C69A89DC(v32, v33);
      unint64_t v20 = v19;
      if ((v21 & 1) == 0) {
        break;
      }
      uint64_t v22 = v7;
      int64_t v23 = (uint64_t *)(v2[6] + 16 * v19);
      swift_bridgeObjectRelease();
      *int64_t v23 = v32;
      v23[1] = v33;
      uint64_t v7 = v22;
      uint64_t v24 = (_OWORD *)(v2[7] + 48 * v20);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      sub_1C69A4B74(&v35, v24);
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    OUTLINED_FUNCTION_74((v19 >> 3) & 0x1FFFFFFFFFFFFFF8);
    unint64_t v26 = (uint64_t *)(v25 + 16 * v20);
    uint64_t *v26 = v32;
    v26[1] = v33;
    sub_1C69A4B74(&v35, (_OWORD *)(v2[7] + 48 * v20));
    uint64_t v27 = v2[2];
    BOOL v14 = __OFADD__(v27, 1);
    uint64_t v28 = v27 + 1;
    if (v14) {
      goto LABEL_34;
    }
    v2[2] = v28;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

unint64_t sub_1C69AA0F0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D88);
    uint64_t v2 = (void *)sub_1C69E20D8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v47;
  uint64_t v7 = v45;
  unint64_t v8 = &v41;
  unint64_t v9 = &v43;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v37 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v36 << 6);
      }
      else
      {
        int64_t v12 = v36 + 1;
        if (__OFADD__(v36, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v34)
        {
LABEL_31:
          sub_1C69B60D4();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v35 + 8 * v12);
        int64_t v14 = v36 + 1;
        if (!v13)
        {
          int64_t v14 = v36 + 2;
          if (v36 + 2 >= v34) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v35 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v36 + 3;
            if (v36 + 3 >= v34) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v35 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v36 + 4;
              if (v36 + 4 >= v34) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v35 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v36 + 5;
                if (v36 + 5 >= v34) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v35 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v34) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v35 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v36 + 5;
              }
            }
          }
        }
LABEL_25:
        int64_t v36 = v14;
        uint64_t v37 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      int64_t v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_1C69A973C(*(void *)(v1 + 56) + 32 * v11, (uint64_t)v6);
      *(void *)&long long v46 = v18;
      *((void *)&v46 + 1) = v17;
      v44[2] = v46;
      v45[0] = v47[0];
      v45[1] = v47[1];
      uint64_t v39 = v18;
      uint64_t v40 = v17;
      sub_1C69B60C4(v7, &v38);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DB0);
      swift_dynamicCast();
      uint64_t v20 = v39;
      uint64_t v19 = v40;
      sub_1C69B60C4(v8, v9);
      sub_1C69B60C4(v9, v44);
      sub_1C69B60C4(v44, &v42);
      unint64_t result = sub_1C69A89DC(v20, v19);
      unint64_t v21 = result;
      if ((v22 & 1) == 0) {
        break;
      }
      int64_t v23 = v9;
      uint64_t v24 = v8;
      uint64_t v25 = v1;
      unint64_t v26 = v7;
      uint64_t v27 = v6;
      uint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v28 = v20;
      v28[1] = v19;
      uint64_t v6 = v27;
      uint64_t v7 = v26;
      uint64_t v1 = v25;
      unint64_t v8 = v24;
      unint64_t v9 = v23;
      int64_t v29 = (_OWORD *)(v2[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
      unint64_t result = (unint64_t)sub_1C69B60C4(&v42, v29);
      unint64_t v5 = v37;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v30 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v30 = v20;
    v30[1] = v19;
    unint64_t result = (unint64_t)sub_1C69B60C4(&v42, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_33;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

unint64_t sub_1C69AA494(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430E8);
    uint64_t v2 = (void *)sub_1C69E20D8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v9 = v8 | (v7 << 6);
      }
      else
      {
        int64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_34;
        }
        if (v10 >= v27)
        {
LABEL_31:
          sub_1C69B60D4();
          return (unint64_t)v2;
        }
        unint64_t v11 = *(void *)(v28 + 8 * v10);
        int64_t v12 = v7 + 1;
        if (!v11)
        {
          int64_t v12 = v7 + 2;
          if (v7 + 2 >= v27) {
            goto LABEL_31;
          }
          unint64_t v11 = *(void *)(v28 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v7 + 3;
            if (v7 + 3 >= v27) {
              goto LABEL_31;
            }
            unint64_t v11 = *(void *)(v28 + 8 * v12);
            if (!v11)
            {
              int64_t v12 = v7 + 4;
              if (v7 + 4 >= v27) {
                goto LABEL_31;
              }
              unint64_t v11 = *(void *)(v28 + 8 * v12);
              if (!v11)
              {
                int64_t v13 = v7 + 5;
                if (v7 + 5 >= v27) {
                  goto LABEL_31;
                }
                unint64_t v11 = *(void *)(v28 + 8 * v13);
                if (!v11)
                {
                  while (1)
                  {
                    int64_t v12 = v13 + 1;
                    if (__OFADD__(v13, 1)) {
                      goto LABEL_35;
                    }
                    if (v12 >= v27) {
                      goto LABEL_31;
                    }
                    unint64_t v11 = *(void *)(v28 + 8 * v12);
                    ++v13;
                    if (v11) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v12 = v7 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v11 - 1) & v11;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
        int64_t v7 = v12;
      }
      int64_t v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      sub_1C69B752C(*(void *)(a1 + 56) + 40 * v9, (uint64_t)v39);
      *(void *)&long long v38 = v16;
      *((void *)&v38 + 1) = v15;
      v35[2] = v38;
      v36[0] = v39[0];
      v36[1] = v39[1];
      uint64_t v37 = v40;
      uint64_t v30 = v16;
      uint64_t v31 = v15;
      sub_1C69958A4(v36, (uint64_t)v29);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430F0);
      swift_dynamicCast();
      uint64_t v18 = v30;
      uint64_t v17 = v31;
      sub_1C69B60C4(&v32, v34);
      sub_1C69B60C4(v34, v35);
      sub_1C69B60C4(v35, &v33);
      unint64_t result = sub_1C69A89DC(v18, v17);
      unint64_t v19 = result;
      if ((v20 & 1) == 0) {
        break;
      }
      unint64_t v21 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v21 = v18;
      v21[1] = v17;
      char v22 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      unint64_t result = (unint64_t)sub_1C69B60C4(&v33, v22);
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int64_t v23 = (uint64_t *)(v2[6] + 16 * result);
    *int64_t v23 = v18;
    v23[1] = v17;
    unint64_t result = (unint64_t)sub_1C69B60C4(&v33, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_33;
    }
    v2[2] = v26;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_1C69AA804(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF8);
    uint64_t v2 = (void *)sub_1C69E20D8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v40 = v1 + 64;
  OUTLINED_FUNCTION_36();
  unint64_t v5 = v4 & v3;
  int64_t v39 = (unint64_t)(63 - v6) >> 6;
  int64_t v7 = v52;
  unint64_t v8 = v50;
  unint64_t v9 = (long long *)&v46;
  int64_t v10 = (long long *)&v48;
  swift_bridgeObjectRetain();
  int64_t v41 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v42 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v41 << 6);
      }
      else
      {
        int64_t v12 = v41 + 1;
        if (__OFADD__(v41, 1)) {
          goto LABEL_35;
        }
        if (v12 >= v39)
        {
LABEL_32:
          sub_1C69B60D4();
          return;
        }
        unint64_t v13 = *(void *)(v40 + 8 * v12);
        int64_t v14 = v41 + 1;
        if (!v13)
        {
          OUTLINED_FUNCTION_69();
          if (v15 == v16) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_79();
          if (!v13)
          {
            OUTLINED_FUNCTION_69();
            if (v15 == v16) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_79();
            if (!v13)
            {
              OUTLINED_FUNCTION_69();
              if (v15 == v16) {
                goto LABEL_32;
              }
              OUTLINED_FUNCTION_79();
              if (!v13)
              {
                int64_t v18 = v17 + 4;
                if (v18 >= v39) {
                  goto LABEL_32;
                }
                unint64_t v13 = *(void *)(v40 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    OUTLINED_FUNCTION_69();
                    if (v15 == v16) {
                      goto LABEL_32;
                    }
                    OUTLINED_FUNCTION_79();
                    int64_t v18 = v19 + 1;
                    if (v13) {
                      goto LABEL_26;
                    }
                  }
                  goto LABEL_36;
                }
                int64_t v14 = v18;
              }
            }
          }
        }
LABEL_26:
        int64_t v41 = v14;
        uint64_t v42 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      char v20 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      sub_1C69B7580(*(void *)(v1 + 56) + 48 * v11, (uint64_t)v7);
      *(void *)&long long v51 = v22;
      *((void *)&v51 + 1) = v21;
      v49[3] = v51;
      v50[0] = v52[0];
      v50[1] = v52[1];
      v50[2] = v52[2];
      uint64_t v44 = v22;
      uint64_t v45 = v21;
      sub_1C69A4B74(v8, v43);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      swift_dynamicCast();
      uint64_t v23 = v44;
      uint64_t v24 = v45;
      sub_1C69A4B74(v9, v10);
      sub_1C69A4B74(v10, v49);
      sub_1C69A4B74(v49, &v47);
      unint64_t v25 = sub_1C69A89DC(v23, v24);
      unint64_t v26 = v25;
      if ((v27 & 1) == 0) {
        break;
      }
      uint64_t v28 = v10;
      int64_t v29 = v9;
      uint64_t v30 = v1;
      uint64_t v31 = v8;
      long long v32 = v7;
      long long v33 = (uint64_t *)(v2[6] + 16 * v25);
      swift_bridgeObjectRelease();
      *long long v33 = v23;
      v33[1] = v24;
      int64_t v7 = v32;
      unint64_t v8 = v31;
      uint64_t v1 = v30;
      unint64_t v9 = v29;
      int64_t v10 = v28;
      int64_t v34 = (_OWORD *)(v2[7] + 48 * v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      sub_1C69A4B74(&v47, v34);
      unint64_t v5 = v42;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    OUTLINED_FUNCTION_74((v25 >> 3) & 0x1FFFFFFFFFFFFFF8);
    int64_t v36 = (uint64_t *)(v35 + 16 * v26);
    uint64_t *v36 = v23;
    v36[1] = v24;
    sub_1C69A4B74(&v47, (_OWORD *)(v2[7] + 48 * v26));
    uint64_t v37 = v2[2];
    BOOL v16 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v16) {
      goto LABEL_34;
    }
    v2[2] = v38;
    unint64_t v5 = v42;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t EventDrivenInteractionBuilder.__allocating_init(event:inAppIdentifier:deviceState:)(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v4 = swift_allocObject();
  unint64_t v5 = (long long *)OUTLINED_FUNCTION_53();
  EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(v5, v6, a3);
  return v4;
}

uint64_t EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(long long *a1, uint64_t a2, long long *a3)
{
  sub_1C69958A4(a1, v3 + 16);
  sub_1C69E1818();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_85();
  v5();
  sub_1C69958A4(a3, v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState);
  return v3;
}

uint64_t EventDrivenInteractionBuilder.build(requestId:)()
{
  OUTLINED_FUNCTION_6_0();
  v1[27] = v2;
  v1[28] = v0;
  v1[25] = v3;
  v1[26] = v4;
  uint64_t v5 = sub_1C69E1758();
  v1[29] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[30] = v6;
  v1[31] = OUTLINED_FUNCTION_24();
  uint64_t v7 = sub_1C69E18A8();
  v1[32] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[33] = v8;
  v1[34] = OUTLINED_FUNCTION_24();
  uint64_t v9 = sub_1C69E0678();
  OUTLINED_FUNCTION_44(v9);
  v1[35] = OUTLINED_FUNCTION_24();
  uint64_t v10 = sub_1C69E16F8();
  v1[36] = v10;
  OUTLINED_FUNCTION_2_0(v10);
  v1[37] = v11;
  v1[38] = OUTLINED_FUNCTION_24();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C80);
  OUTLINED_FUNCTION_44(v12);
  v1[39] = OUTLINED_FUNCTION_24();
  uint64_t v13 = sub_1C69E1B08();
  v1[40] = v13;
  OUTLINED_FUNCTION_2_0(v13);
  v1[41] = v14;
  v1[42] = OUTLINED_FUNCTION_57();
  v1[43] = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C58);
  OUTLINED_FUNCTION_44(v15);
  v1[44] = OUTLINED_FUNCTION_57();
  v1[45] = swift_task_alloc();
  uint64_t v16 = sub_1C69E16E8();
  v1[46] = v16;
  OUTLINED_FUNCTION_2_0(v16);
  v1[47] = v17;
  v1[48] = OUTLINED_FUNCTION_24();
  uint64_t v18 = sub_1C69E1C68();
  v1[49] = v18;
  OUTLINED_FUNCTION_2_0(v18);
  v1[50] = v19;
  v1[51] = OUTLINED_FUNCTION_24();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C70);
  OUTLINED_FUNCTION_44(v20);
  v1[52] = OUTLINED_FUNCTION_57();
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  uint64_t v21 = sub_1C69E06A8();
  v1[56] = v21;
  OUTLINED_FUNCTION_2_0(v21);
  v1[57] = v22;
  v1[58] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v23, v24, v25);
}

uint64_t sub_1C69AAEB0()
{
  uint64_t v78 = v0;
  uint64_t v1 = v0[55];
  uint64_t v2 = v0[28];
  uint64_t v73 = v2 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState;
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState), *(void *)(v2 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState + 24));
  sub_1C69E15D8();
  sub_1C69AB7EC();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_52();
  v3();
  uint64_t v72 = (void *)(v2 + 16);
  sub_1C69B752C(v2 + 16, (uint64_t)(v0 + 14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C78);
  uint64_t v4 = sub_1C69E19A8();
  OUTLINED_FUNCTION_24_1();
  int v5 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload(v1, v5 ^ 1u, 1, v4);
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v6 = v0[54];
  uint64_t v7 = v0[55];
  uint64_t v9 = v0[50];
  uint64_t v8 = v0[51];
  uint64_t v10 = v0[49];
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_1EBC085E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
  sub_1C69B73AC(v7, v6, &qword_1EBC07C70);
  uint64_t v12 = sub_1C69E1C48();
  os_log_type_t v13 = sub_1C69E1ED8();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = v0[54];
  if (v14)
  {
    uint64_t v16 = v0[53];
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    v74[0] = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_1C69B73AC(v15, v16, &qword_1EBC07C70);
    if (__swift_getEnumTagSinglePayload(v16, 1, v4) == 1)
    {
      sub_1C69B74DC(v0[53], &qword_1EBC07C70);
      unint64_t v18 = 0xE300000000000000;
      uint64_t v19 = 7104878;
    }
    else
    {
      uint64_t v23 = v0[47];
      uint64_t v24 = v0[48];
      uint64_t v69 = v0[46];
      sub_1C69E1988();
      OUTLINED_FUNCTION_9_2();
      OUTLINED_FUNCTION_37_0();
      v25();
      uint64_t v19 = sub_1C69E16A8();
      unint64_t v18 = v26;
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v69);
    }
    uint64_t v27 = v0[54];
    uint64_t v28 = v0[50];
    uint64_t v68 = v0[49];
    uint64_t v70 = v0[51];
    v0[24] = sub_1C69A8148(v19, v18, v74);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69B74DC(v27, &qword_1EBC07C70);
    _os_log_impl(&dword_1C698D000, v12, v13, "Building Interaction for OnInAppConnectionEvent with InAppDetails: %s", v17, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    uint64_t v21 = v68;
    uint64_t v20 = v70;
  }
  else
  {
    sub_1C69B74DC(v0[54], &qword_1EBC07C70);

    uint64_t v20 = OUTLINED_FUNCTION_65();
  }
  v22(v20, v21);
  uint64_t v29 = v0[52];
  uint64_t v30 = v0[45];
  sub_1C69E1878();
  OUTLINED_FUNCTION_75(v30, 1);
  uint64_t v31 = OUTLINED_FUNCTION_58();
  sub_1C69B73AC(v31, v32, v33);
  if (__swift_getEnumTagSinglePayload(v29, 1, v4) == 1)
  {
    uint64_t v34 = v0[39];
    sub_1C69B74DC(v0[52], &qword_1EBC07C70);
    OUTLINED_FUNCTION_75(v34, 1);
  }
  else
  {
    uint64_t v36 = v0[39];
    uint64_t v35 = v0[40];
    sub_1C69E1988();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_37_0();
    v37();
    sub_1C69E16B8();
    uint64_t v38 = OUTLINED_FUNCTION_65();
    v39(v38);
    OUTLINED_FUNCTION_71(v36, 1, v35);
    if (!v40)
    {
      uint64_t v41 = v0[44];
      uint64_t v71 = v0[45];
      uint64_t v42 = v0[38];
      uint64_t v44 = v0[36];
      uint64_t v43 = v0[37];
      (*(void (**)(void, void, void))(v0[41] + 32))(v0[43], v0[39], v0[40]);
      OUTLINED_FUNCTION_14();
      v45();
      (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v42, *MEMORY[0x1E4FA4740], v44);
      sub_1C69E1868();
      OUTLINED_FUNCTION_52();
      v46();
      sub_1C69B74DC(v71, &qword_1EBC07C58);
      OUTLINED_FUNCTION_75(v41, 0);
      sub_1C69B67C0(v41, v71, &qword_1EBC07C58);
      goto LABEL_14;
    }
  }
  sub_1C69B74DC(v0[39], &qword_1EBC07C80);
LABEL_14:
  uint64_t v67 = v0[55];
  uint64_t v65 = v0[45];
  uint64_t v66 = v0[44];
  uint64_t v47 = v0[33];
  uint64_t v63 = v0[34];
  uint64_t v64 = v0[32];
  uint64_t v48 = v0[28];
  swift_bridgeObjectRetain();
  sub_1C69E0668();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  sub_1C69E1C98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C69E3650;
  *(void *)(inited + 32) = 0x746E657665;
  *(void *)(inited + 40) = 0xE500000000000000;
  uint64_t v50 = *(void *)(v48 + 40);
  uint64_t v51 = *(void *)(v48 + 48);
  __swift_project_boxed_opaque_existential_1(v72, v50);
  *(void *)(inited + 72) = v50;
  *(void *)(inited + 80) = *(void *)(v51 + 8);
  *(void *)(inited + 88) = *(void *)(v51 + 16);
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 48));
  OUTLINED_FUNCTION_9_2();
  (*(void (**)(void))(v52 + 16))();
  uint64_t v53 = MEMORY[0x1E4FBB1A0];
  sub_1C69E1C98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D90);
  uint64_t v54 = sub_1C69E1718();
  OUTLINED_FUNCTION_2_0(v54);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C69E3650;
  uint64_t v55 = sub_1C69E17F8();
  uint64_t v75 = v53;
  uint64_t v76 = MEMORY[0x1E4FBB1D8];
  uint64_t v77 = MEMORY[0x1E4FBB1A8];
  v74[0] = v55;
  v74[1] = v56;
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v63, *MEMORY[0x1E4FA4A20], v64);
  sub_1C69E1708();
  sub_1C69B752C(v73, (uint64_t)(v0 + 19));
  sub_1C69E17F8();
  uint64_t v57 = sub_1C69E1BB8();
  OUTLINED_FUNCTION_35();
  uint64_t v58 = OUTLINED_FUNCTION_45();
  uint64_t v59 = MEMORY[0x1C87A6E10](v58);
  uint64_t v75 = v57;
  uint64_t v76 = sub_1C69B7454(&qword_1EBC07C88, MEMORY[0x1E4FA4EB0]);
  v74[0] = v59;
  OUTLINED_FUNCTION_86();
  v60();
  sub_1C69B73AC(v65, v66, &qword_1EBC07C58);
  sub_1C69E14A8();
  sub_1C69B74DC(v65, &qword_1EBC07C58);
  sub_1C69B74DC(v67, &qword_1EBC07C70);
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
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v61();
}

unint64_t sub_1C69AB7EC()
{
  sub_1C69E0688();
  sub_1C69E0C08();
  sub_1C69E0BE8();
  uint64_t v0 = (void *)sub_1C69E0BF8();
  swift_release();
  uint64_t v1 = sub_1C69E0BD8();

  unint64_t v2 = sub_1C69AA0F0(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t EventDrivenInteractionBuilder.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1C69E1818();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_37_0();
  v1();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState);
  return v0;
}

uint64_t EventDrivenInteractionBuilder.__deallocating_deinit()
{
  EventDrivenInteractionBuilder.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C69AB938()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return EventDrivenInteractionBuilder.build(requestId:)();
}

BOOL static CatPropertyKeys.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CatPropertyKeys.hash(into:)()
{
  return sub_1C69E2228();
}

SiriSuggestionsSupport::CatPropertyKeys_optional __swiftcall CatPropertyKeys.init(stringValue:)(Swift::String stringValue)
{
  object = stringValue._object;
  uint64_t v3 = v1;
  BOOL v4 = stringValue._countAndFlagsBits == 0x69747265706F7270 && stringValue._object == (void *)0xEA00000000007365;
  if (v4 || (uint64_t countAndFlagsBits = stringValue._countAndFlagsBits, (sub_1C69E2188() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else if (countAndFlagsBits == 0x614E656369766564 && object == (void *)0xEA0000000000656DLL)
  {
    result.value = swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v9 = sub_1C69E2188();
    result.value = swift_bridgeObjectRelease();
    if (v9) {
      char v7 = 1;
    }
    else {
      char v7 = 2;
    }
  }
  *uint64_t v3 = v7;
  return result;
}

SiriSuggestionsSupport::CatPropertyKeys_optional __swiftcall CatPropertyKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 2;
  return (SiriSuggestionsSupport::CatPropertyKeys_optional)intValue;
}

uint64_t CatPropertyKeys.hashValue.getter()
{
  return sub_1C69E2238();
}

uint64_t CatPropertyKeys.intValue.getter()
{
  return 0;
}

uint64_t CatPropertyKeys.stringValue.getter()
{
  if (*v0) {
    return 0x614E656369766564;
  }
  else {
    return 0x69747265706F7270;
  }
}

uint64_t sub_1C69ABBE4(uint64_t a1)
{
  unint64_t v2 = sub_1C69B75D4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C69ABC20(uint64_t a1)
{
  unint64_t v2 = sub_1C69B75D4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C69ABC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[43] = a3;
  v4[44] = v3;
  v4[41] = a1;
  v4[42] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E8);
  v4[45] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E10);
  v4[46] = swift_task_alloc();
  uint64_t v5 = sub_1C69E1128();
  v4[47] = v5;
  v4[48] = *(void *)(v5 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  v4[50] = swift_task_alloc();
  uint64_t v6 = sub_1C69E12E8();
  v4[51] = v6;
  v4[52] = *(void *)(v6 - 8);
  v4[53] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C60);
  v4[54] = swift_task_alloc();
  uint64_t v7 = sub_1C69E18C8();
  v4[55] = v7;
  v4[56] = *(void *)(v7 - 8);
  v4[57] = swift_task_alloc();
  uint64_t v8 = sub_1C69E18B8();
  v4[58] = v8;
  v4[59] = *(void *)(v8 - 8);
  v4[60] = swift_task_alloc();
  v4[61] = swift_task_alloc();
  v4[62] = swift_task_alloc();
  uint64_t v9 = sub_1C69E0A78();
  v4[63] = v9;
  v4[64] = *(void *)(v9 - 8);
  v4[65] = swift_task_alloc();
  v4[66] = swift_task_alloc();
  v4[67] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077D8);
  v4[68] = swift_task_alloc();
  v4[69] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF8);
  v4[70] = swift_task_alloc();
  v4[71] = swift_task_alloc();
  v4[72] = swift_task_alloc();
  v4[73] = swift_task_alloc();
  v4[74] = swift_task_alloc();
  v4[75] = swift_task_alloc();
  uint64_t v10 = sub_1C69E1758();
  v4[76] = v10;
  v4[77] = *(void *)(v10 - 8);
  v4[78] = swift_task_alloc();
  v4[79] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C00);
  v4[80] = swift_task_alloc();
  v4[81] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69AC0DC, 0, 0);
}

uint64_t sub_1C69AC0DC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = v0[44];
  v0[82] = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  v0[83] = v2;
  v0[84] = swift_getObjectType();
  v0[85] = *(void *)(v2 + 16);
  v0[86] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0x8B1C000000000000;
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[87] = v3;
  *uint64_t v3 = v4;
  v3[1] = sub_1C69AC214;
  OUTLINED_FUNCTION_26_1();
  return v5();
}

uint64_t sub_1C69AC214()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69AC2DC()
{
  uint64_t v29 = v0;
  uint64_t v1 = v0 + 36;
  if (!v0[11])
  {
    sub_1C69B74DC((uint64_t)(v0 + 8), &qword_1EBC07D60);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  sub_1C69E1268();
  OUTLINED_FUNCTION_87();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    *uint64_t v1 = 0;
    goto LABEL_13;
  }
  if (*v1)
  {
    if (qword_1EBC085E0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1C69E1C68();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_31_1(v2, (uint64_t)qword_1EBC085E8);
    os_log_type_t v4 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_22(v4))
    {
      uint64_t v5 = (_DWORD *)OUTLINED_FUNCTION_13_1();
      uint64_t v6 = OUTLINED_FUNCTION_25_1();
      *uint64_t v5 = 136315138;
      uint64_t v28 = v6;
      OUTLINED_FUNCTION_3_3();
      v0[38] = *v1;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E08);
      uint64_t v7 = sub_1C69E1D08();
      v0[37] = sub_1C69A8148(v7, v8, &v28);
      OUTLINED_FUNCTION_68();
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_39(&dword_1C698D000, v9, v10, "using intent properties as: %s");
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_3_3();
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
    uint64_t v11 = OUTLINED_FUNCTION_38_0();
    return v12(v11);
  }
LABEL_13:
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C69E1C68();
  v0[88] = __swift_project_value_buffer(v14, (uint64_t)qword_1EBC085E8);
  uint64_t v15 = (void *)sub_1C69E1C48();
  os_log_type_t v16 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_19_2(v16))
  {
    uint64_t v17 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v17);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v18, v19, "No explicit intent properties set. Checking if there is anything from the flow");
    OUTLINED_FUNCTION_17();
  }
  uint64_t v20 = (int *)v0[85];

  uint64_t v27 = (int *)((char *)v20 + *v20);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[89] = v21;
  *uint64_t v21 = v22;
  v21[1] = sub_1C69AC780;
  uint64_t v23 = v0[84];
  uint64_t v24 = v0[83];
  uint64_t v25 = v0[41];
  uint64_t v26 = v0[42];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))v27)(v0 + 2, v25, v26, 0xD000000000000014, 0x80000001C69E45E0, v23, v24);
}

uint64_t sub_1C69AC780()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69AC848()
{
  uint64_t v146 = v0;
  uint64_t v1 = *(void *)(v0 + 648);
  uint64_t v2 = *(void *)(v0 + 376);
  if (*(void *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    OUTLINED_FUNCTION_43();
    uint64_t v3 = swift_dynamicCast() ^ 1;
    uint64_t v4 = v1;
  }
  else
  {
    sub_1C69B74DC(v0 + 16, &qword_1EBC07D60);
    uint64_t v4 = v1;
    uint64_t v3 = 1;
  }
  __swift_storeEnumTagSinglePayload(v4, v3, 1, v2);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v6 = *(void (**)(void))(*(void *)(v0 + 616) + 104);
  OUTLINED_FUNCTION_73();
  v6();
  sub_1C69B73AC(v5, v0 + 152, &qword_1EBC07C08);
  if (!*(void *)(v0 + 176))
  {
    sub_1C69B74DC(v0 + 152, &qword_1EBC07C08);
    goto LABEL_45;
  }
  uint64_t v139 = v6;
  uint64_t v7 = *(void *)(v0 + 600);
  uint64_t v8 = *(void *)(v0 + 592);
  uint64_t v9 = *(void *)(v0 + 552);
  uint64_t v10 = *(void *)(v0 + 536);
  uint64_t v12 = *(void *)(v0 + 504);
  uint64_t v11 = *(void *)(v0 + 512);
  sub_1C69958A4((long long *)(v0 + 152), v0 + 112);
  uint64_t v142 = (void *)(v0 + 112);
  uint64_t v13 = v10;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 112), *(void *)(v0 + 136));
  sub_1C69E13B8();
  uint64_t v14 = *(void (**)(void))(v11 + 104);
  OUTLINED_FUNCTION_70();
  v14();
  __swift_storeEnumTagSinglePayload(v8, 0, 1, v12);
  uint64_t v15 = v9 + *(int *)(v10 + 48);
  sub_1C69B73AC(v7, v9, &qword_1EBC07BF8);
  sub_1C69B73AC(v8, v15, &qword_1EBC07BF8);
  OUTLINED_FUNCTION_71(v9, 1, v12);
  if (v16)
  {
    uint64_t v17 = *(void *)(v0 + 504);
    sub_1C69B74DC(*(void *)(v0 + 592), &qword_1EBC07BF8);
    OUTLINED_FUNCTION_71(v15, 1, v17);
    if (!v16) {
      goto LABEL_13;
    }
    sub_1C69B74DC(*(void *)(v0 + 552), &qword_1EBC07BF8);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 504);
    sub_1C69B73AC(*(void *)(v0 + 552), *(void *)(v0 + 584), &qword_1EBC07BF8);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v15, 1, v18);
    uint64_t v20 = *(void *)(v0 + 592);
    uint64_t v21 = *(void *)(v0 + 584);
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v22 = *(void *)(v0 + 504);
      uint64_t v23 = *(void *)(v0 + 512);
      sub_1C69B74DC(*(void *)(v0 + 592), &qword_1EBC07BF8);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
LABEL_13:
      sub_1C69B74DC(*(void *)(v0 + 552), &qword_1EBC077D8);
      goto LABEL_14;
    }
    uint64_t v137 = *(void *)(v0 + 552);
    uint64_t v44 = *(void *)(v0 + 528);
    uint64_t v46 = *(void *)(v0 + 504);
    uint64_t v45 = *(void *)(v0 + 512);
    uint64_t v47 = OUTLINED_FUNCTION_49();
    v48(v47);
    sub_1C69B7454(&qword_1EA4430B8, MEMORY[0x1E4FA51A0]);
    char v136 = OUTLINED_FUNCTION_54();
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v49(v44, v46);
    sub_1C69B74DC(v20, &qword_1EBC07BF8);
    v49(v21, v46);
    sub_1C69B74DC(v137, &qword_1EBC07BF8);
    if ((v136 & 1) == 0)
    {
LABEL_14:
      uint64_t v24 = *(void *)(v0 + 600);
      uint64_t v25 = *(void *)(v0 + 576);
      uint64_t v26 = *(void *)(v0 + 544);
      uint64_t v27 = *(void *)(v0 + 504);
      OUTLINED_FUNCTION_70();
      v14();
      __swift_storeEnumTagSinglePayload(v25, 0, 1, v27);
      uint64_t v28 = v26 + *(int *)(v13 + 48);
      sub_1C69B73AC(v24, v26, &qword_1EBC07BF8);
      sub_1C69B73AC(v25, v28, &qword_1EBC07BF8);
      OUTLINED_FUNCTION_71(v26, 1, v27);
      if (v16)
      {
        uint64_t v29 = *(void *)(v0 + 504);
        sub_1C69B74DC(*(void *)(v0 + 576), &qword_1EBC07BF8);
        OUTLINED_FUNCTION_71(v28, 1, v29);
        if (!v16) {
          goto LABEL_21;
        }
        sub_1C69B74DC(*(void *)(v0 + 544), &qword_1EBC07BF8);
      }
      else
      {
        uint64_t v30 = *(void *)(v0 + 504);
        sub_1C69B73AC(*(void *)(v0 + 544), *(void *)(v0 + 568), &qword_1EBC07BF8);
        int v31 = __swift_getEnumTagSinglePayload(v28, 1, v30);
        uint64_t v32 = *(void *)(v0 + 576);
        uint64_t v33 = *(void *)(v0 + 568);
        if (v31 == 1)
        {
          uint64_t v35 = *(void *)(v0 + 504);
          uint64_t v34 = *(void *)(v0 + 512);
          sub_1C69B74DC(*(void *)(v0 + 576), &qword_1EBC07BF8);
          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
LABEL_21:
          sub_1C69B74DC(*(void *)(v0 + 544), &qword_1EBC077D8);
LABEL_22:
          uint64_t v36 = *(void *)(v0 + 464);
          uint64_t v37 = *(void *)(v0 + 432);
          __swift_project_boxed_opaque_existential_1(v142, *(void *)(v0 + 136));
          OUTLINED_FUNCTION_68();
          sub_1C69E13A8();
          if (__swift_getEnumTagSinglePayload(v37, 1, v36) == 1)
          {
            sub_1C69B74DC(*(void *)(v0 + 432), &qword_1EBC07C60);
            uint64_t v38 = (void *)sub_1C69E1C48();
            os_log_type_t v39 = sub_1C69E1EC8();
            if (OUTLINED_FUNCTION_22(v39))
            {
              *(_WORD *)OUTLINED_FUNCTION_23_1() = 0;
              OUTLINED_FUNCTION_89(&dword_1C698D000, v40, v41, "[warning] No explicit turnState is provided. Assuming taskComplete initated from the user");
              OUTLINED_FUNCTION_17();
            }

            sub_1C69E18D8();
            OUTLINED_FUNCTION_8_0();
            OUTLINED_FUNCTION_86();
            v42();
            OUTLINED_FUNCTION_70();
            v43();
          }
          else
          {
            uint64_t v53 = *(void *)(v0 + 480);
            uint64_t v52 = *(void *)(v0 + 488);
            uint64_t v55 = *(void *)(v0 + 464);
            uint64_t v54 = *(void *)(v0 + 472);
            uint64_t v56 = *(void (**)(uint64_t, void, uint64_t))(v54 + 32);
            v56(v52, *(void *)(v0 + 432), v55);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v53, v52, v55);
            uint64_t v57 = sub_1C69E1C48();
            os_log_type_t v58 = sub_1C69E1ED8();
            if (os_log_type_enabled(v57, v58))
            {
              uint64_t v138 = v56;
              uint64_t v59 = (uint8_t *)OUTLINED_FUNCTION_13_1();
              v145[0] = OUTLINED_FUNCTION_25_1();
              *(_DWORD *)uint64_t v59 = 136315138;
              sub_1C69B7454(&qword_1EA4430B0, MEMORY[0x1E4FA4A38]);
              uint64_t v60 = sub_1C69E2178();
              *(void *)(v0 + 320) = sub_1C69A8148(v60, v61, v145);
              sub_1C69E1F28();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_52();
              v62();
              _os_log_impl(&dword_1C698D000, v57, v58, "Using explicit turnState from requestState: %s", v59, 0xCu);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_17();
              uint64_t v56 = v138;
              OUTLINED_FUNCTION_17();
            }
            else
            {
              (*(void (**)(void, void))(*(void *)(v0 + 472) + 8))(*(void *)(v0 + 480), *(void *)(v0 + 464));
            }

            v56(*(void *)(v0 + 496), *(void *)(v0 + 488), *(void *)(v0 + 464));
          }
          uint64_t v74 = *(void *)(v0 + 560);
          uint64_t v75 = *(void *)(v0 + 504);
          sub_1C69B73AC(*(void *)(v0 + 600), v74, &qword_1EBC07BF8);
          OUTLINED_FUNCTION_71(v74, 1, v75);
          if (!v16)
          {
            uint64_t v81 = *(void *)(v0 + 456);
            (*(void (**)(void, void, void))(*(void *)(v0 + 512) + 32))(*(void *)(v0 + 520), *(void *)(v0 + 560), *(void *)(v0 + 504));
            sub_1C69AD954(v81);
            uint64_t v82 = OUTLINED_FUNCTION_45();
            v83(v82);
LABEL_40:
            uint64_t v84 = *(void *)(v0 + 632);
            uint64_t v85 = *(void *)(v0 + 608);
            uint64_t v87 = *(void *)(v0 + 448);
            uint64_t v86 = *(void *)(v0 + 456);
            uint64_t v88 = *(void *)(v0 + 440);
            uint64_t v89 = OUTLINED_FUNCTION_45();
            v90(v89);
            uint64_t v91 = v84 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430A0) + 48);
            uint64_t v92 = OUTLINED_FUNCTION_60();
            v93(v92);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 32))(v91, v86, v88);
            ((void (*)(uint64_t, void, uint64_t))v139)(v84, *MEMORY[0x1E4FA4778], v85);
            goto LABEL_41;
          }
          sub_1C69B74DC(*(void *)(v0 + 560), &qword_1EBC07BF8);
          uint64_t v76 = (void *)sub_1C69E1C48();
          os_log_type_t v77 = sub_1C69E1EC8();
          if (OUTLINED_FUNCTION_22(v77))
          {
            *(_WORD *)OUTLINED_FUNCTION_23_1() = 0;
            OUTLINED_FUNCTION_89(&dword_1C698D000, v78, v79, "[warning] No explicit requestInputOrigin is provided. Assuming modality is voice");
            OUTLINED_FUNCTION_17();
          }

LABEL_39:
          OUTLINED_FUNCTION_70();
          v80();
          goto LABEL_40;
        }
        uint64_t v63 = *(void *)(v0 + 528);
        uint64_t v65 = *(void *)(v0 + 504);
        uint64_t v64 = *(void *)(v0 + 512);
        uint64_t v66 = OUTLINED_FUNCTION_49();
        v67(v66);
        sub_1C69B7454(&qword_1EA4430B8, MEMORY[0x1E4FA51A0]);
        char v68 = OUTLINED_FUNCTION_54();
        uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
        v69(v63, v65);
        sub_1C69B74DC(v32, &qword_1EBC07BF8);
        v69(v33, v65);
        uint64_t v70 = OUTLINED_FUNCTION_68();
        sub_1C69B74DC(v70, v71);
        if ((v68 & 1) == 0) {
          goto LABEL_22;
        }
      }
      sub_1C69E18D8();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_86();
      v72();
      OUTLINED_FUNCTION_73();
      v73();
      goto LABEL_39;
    }
  }
  sub_1C69E1748();
  uint64_t v50 = OUTLINED_FUNCTION_60();
  v51(v50);
LABEL_41:
  os_log_type_t v94 = sub_1C69E1C48();
  os_log_type_t v95 = sub_1C69E1EC8();
  if (os_log_type_enabled(v94, v95))
  {
    uint64_t v140 = *(void *)(v0 + 600);
    uint64_t v96 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    v145[0] = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v96 = 136315138;
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_3_3();
    sub_1C69B7454(&qword_1EA4430A8, MEMORY[0x1E4FA4798]);
    uint64_t v97 = sub_1C69E2178();
    *(void *)(v0 + 312) = sub_1C69A8148(v97, v98, v145);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C698D000, v94, v95, "Inferred invocationType as: %s", v96, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    uint64_t v99 = v140;
  }
  else
  {
    uint64_t v100 = *(void *)(v0 + 600);

    uint64_t v99 = v100;
  }
  sub_1C69B74DC(v99, &qword_1EBC07BF8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v142);
LABEL_45:
  uint64_t v101 = *(void *)(v0 + 640);
  uint64_t v102 = *(void *)(v0 + 632);
  uint64_t v103 = *(void *)(v0 + 624);
  uint64_t v104 = *(void *)(v0 + 616);
  uint64_t v105 = *(void *)(v0 + 608);
  uint64_t v141 = *(void *)(v0 + 648);
  uint64_t v143 = *(void *)(v0 + 376);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 16))(v103, v102, v105);
  sub_1C69E0638();
  sub_1C69E1298();
  sub_1C69B73AC(v141, v101, &qword_1EBC07C00);
  int v106 = __swift_getEnumTagSinglePayload(v101, 1, v143);
  uint64_t v107 = *(void *)(v0 + 408);
  if (v106 == 1)
  {
    uint64_t v109 = *(void *)(v0 + 360);
    uint64_t v108 = *(void *)(v0 + 368);
    sub_1C69B74DC(*(void *)(v0 + 640), &qword_1EBC07C00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    sub_1C69E1C98();
    uint64_t v110 = sub_1C69E1B58();
    v145[3] = sub_1C69E1678();
    v145[4] = sub_1C69B7454(&qword_1EA442E70, MEMORY[0x1E4FA4728]);
    v145[0] = v110;
    OUTLINED_FUNCTION_14();
    v111();
    __swift_storeEnumTagSinglePayload(v108, 0, 1, v107);
    uint64_t v112 = sub_1C69E1538();
    __swift_storeEnumTagSinglePayload(v109, 1, 1, v112);
    sub_1C69E1268();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_10_0();
    uint64_t v113 = sub_1C69E1218();
  }
  else
  {
    uint64_t v114 = *(void *)(v0 + 392);
    uint64_t v115 = *(void *)(v0 + 368);
    uint64_t v116 = *(void *)(v0 + 360);
    OUTLINED_FUNCTION_85();
    v117();
    sub_1C69ADC80(v114);
    sub_1C69E1108();
    sub_1C69E1118();
    OUTLINED_FUNCTION_14();
    v118();
    __swift_storeEnumTagSinglePayload(v115, 0, 1, v107);
    uint64_t v119 = sub_1C69E1538();
    __swift_storeEnumTagSinglePayload(v116, 1, 1, v119);
    sub_1C69E1268();
    OUTLINED_FUNCTION_35();
    uint64_t v113 = sub_1C69E1218();
    uint64_t v120 = OUTLINED_FUNCTION_43();
    v121(v120);
  }
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_52();
  v122();
  uint64_t v123 = *(void *)(v0 + 648);
  *(void *)(v0 + 288) = v113;
  swift_release();
  uint64_t v124 = OUTLINED_FUNCTION_65();
  v125(v124);
  sub_1C69B74DC(v123, &qword_1EBC07C00);
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v126 = sub_1C69E1C68();
  uint64_t v127 = (void *)OUTLINED_FUNCTION_31_1(v126, (uint64_t)qword_1EBC085E8);
  os_log_type_t v128 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_22(v128))
  {
    uint64_t v129 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    v145[0] = OUTLINED_FUNCTION_25_1();
    *uint64_t v129 = 136315138;
    OUTLINED_FUNCTION_3_3();
    *(void *)(v0 + 304) = *(void *)(v0 + 288);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E08);
    uint64_t v130 = sub_1C69E1D08();
    *(void *)(v0 + 296) = sub_1C69A8148(v130, v131, v145);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_39(&dword_1C698D000, v132, v133, "using intent properties as: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_3_3();
  uint64_t v144 = *(void *)(v0 + 288);
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
  OUTLINED_FUNCTION_67();
  return v134(v144);
}

uint64_t sub_1C69AD954@<X0>(uint64_t a1@<X8>)
{
  sub_1C69E0A78();
  OUTLINED_FUNCTION_5_4();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = *(void (**)(void))(v4 + 16);
  OUTLINED_FUNCTION_90();
  v7();
  uint64_t v8 = OUTLINED_FUNCTION_53();
  int v10 = v9(v8);
  if (v10 == *MEMORY[0x1E4FA5190]) {
    goto LABEL_12;
  }
  if (v10 == *MEMORY[0x1E4FA5140])
  {
    uint64_t v11 = (unsigned int *)MEMORY[0x1E4FA4A60];
LABEL_13:
    uint64_t v14 = *v11;
    sub_1C69E18C8();
    OUTLINED_FUNCTION_8_0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 104))(a1, v14);
  }
  BOOL v12 = v10 == *MEMORY[0x1E4FA5148] || v10 == *MEMORY[0x1E4FA5150];
  if (v12 || v10 == *MEMORY[0x1E4FA5160])
  {
LABEL_12:
    uint64_t v11 = (unsigned int *)MEMORY[0x1E4FA4A68];
    goto LABEL_13;
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1C69E1C68();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC085E8);
  OUTLINED_FUNCTION_90();
  v7();
  uint64_t v18 = sub_1C69E1C48();
  os_log_type_t v19 = sub_1C69E1EE8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = OUTLINED_FUNCTION_13_1();
    uint64_t v27 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v1 = (void (*)(uint64_t))(v20 + 12);
    uint64_t v21 = sub_1C69E0A68();
    sub_1C69A8148(v21, v22, &v27);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v23 = OUTLINED_FUNCTION_41();
    ((void (*)(uint64_t))(v20 + 12))(v23);
    _os_log_impl(&dword_1C698D000, v18, v19, "Unknown input origin of %s. Defaulting to voiced input", (uint8_t *)v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v24 = OUTLINED_FUNCTION_41();
    v1(v24);
  }

  sub_1C69E18C8();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_86();
  v25();
  uint64_t v26 = OUTLINED_FUNCTION_53();
  return ((uint64_t (*)(uint64_t))v1)(v26);
}

uint64_t sub_1C69ADC80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C18);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C69E1778();
  uint64_t v71 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C69E1128();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = a1;
  uint64_t v12 = sub_1C69E10F8();
  uint64_t v82 = v12;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1C69E1488();
  sub_1C69B7E10(v13, v14, v12, &v75);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v76)
  {
    sub_1C69A4B74(&v75, &v78);
    if (qword_1EBC085E0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C69E1C68();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EBC085E8);
    sub_1C69B7580((uint64_t)&v78, (uint64_t)&v75);
    char v16 = sub_1C69E1C48();
    os_log_type_t v17 = sub_1C69E1EC8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v74 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      sub_1C69B7580((uint64_t)&v75, (uint64_t)v73);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      uint64_t v20 = sub_1C69E1D08();
      v73[0] = sub_1C69A8148(v20, v21, &v74);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
      _os_log_impl(&dword_1C698D000, v16, v17, "Conversational continuer intent property of: %s already detected", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v19, -1, -1);
      MEMORY[0x1C87A7AA0](v18, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
  }
  else
  {
    char v68 = v4;
    uint64_t v69 = v7;
    sub_1C69B74DC((uint64_t)&v75, &qword_1EBC07D60);
    if (qword_1EBC085E0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1C69E1C68();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBC085E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v72, v8);
    uint64_t v23 = sub_1C69E1C48();
    os_log_type_t v24 = sub_1C69E1EC8();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v70 = v5;
    if (v25)
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(void *)&long long v75 = v67;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v66 = v26 + 4;
      sub_1C69E1118();
      uint64_t v27 = v79;
      uint64_t v28 = v80;
      __swift_project_boxed_opaque_existential_1(&v78, v79);
      uint64_t v29 = MEMORY[0x1C87A6CF0](v27, v28);
      unint64_t v31 = v30;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
      *(void *)&long long v78 = sub_1C69A8148(v29, v31, (uint64_t *)&v75);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      _os_log_impl(&dword_1C698D000, v23, v24, "Adding conversational continuer intent property of: %s", v26, 0xCu);
      uint64_t v32 = v67;
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v32, -1, -1);
      MEMORY[0x1C87A7AA0](v26, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }

    uint64_t v33 = sub_1C69E1488();
    uint64_t v35 = v34;
    sub_1C69E1118();
    uint64_t v36 = v76;
    uint64_t v37 = v77;
    __swift_project_boxed_opaque_existential_1(&v75, v76);
    uint64_t v38 = MEMORY[0x1C87A6CF0](v36, v37);
    uint64_t v79 = MEMORY[0x1E4FBB1A0];
    uint64_t v80 = MEMORY[0x1E4FBB1D8];
    uint64_t v81 = MEMORY[0x1E4FBB1A8];
    *(void *)&long long v78 = v38;
    *((void *)&v78 + 1) = v39;
    sub_1C69A9D68((uint64_t)&v78, v33, v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
    uint64_t v5 = v70;
    uint64_t v7 = v69;
    uint64_t v4 = v68;
  }
  uint64_t v40 = sub_1C69E1478();
  sub_1C69B7E10(v40, v41, v82, &v75);
  swift_bridgeObjectRelease();
  if (v76)
  {
    sub_1C69A4B74(&v75, &v78);
    if (qword_1EBC085E0 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_1C69E1C68();
    __swift_project_value_buffer(v42, (uint64_t)qword_1EBC085E8);
    sub_1C69B7580((uint64_t)&v78, (uint64_t)&v75);
    uint64_t v43 = sub_1C69E1C48();
    os_log_type_t v44 = sub_1C69E1EC8();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v74 = v46;
      *(_DWORD *)uint64_t v45 = 136315138;
      sub_1C69B7580((uint64_t)&v75, (uint64_t)v73);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      uint64_t v47 = sub_1C69E1D08();
      v73[0] = sub_1C69A8148(v47, v48, &v74);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
      _os_log_impl(&dword_1C698D000, v43, v44, "ExecutedAppIntentBundleId property of: %s already detected", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v46, -1, -1);
      MEMORY[0x1C87A7AA0](v45, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
  }
  else
  {
    sub_1C69B74DC((uint64_t)&v75, &qword_1EBC07D60);
    sub_1C69E10E8();
    uint64_t v49 = sub_1C69E1628();
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v49) == 1)
    {
      sub_1C69B74DC((uint64_t)v4, &qword_1EBC07C18);
    }
    else
    {
      uint64_t v51 = *(void *)(v49 - 8);
      if ((*(unsigned int (**)(char *, uint64_t))(v51 + 88))(v4, v49) == *MEMORY[0x1E4FA46A0])
      {
        (*(void (**)(char *, uint64_t))(v51 + 96))(v4, v49);
        uint64_t v52 = v71;
        (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v7, v4, v5);
        uint64_t v53 = sub_1C69E1768();
        uint64_t v55 = v5;
        if (v54)
        {
          uint64_t v56 = v53;
          unint64_t v57 = v54;
          uint64_t v70 = v55;
          if (qword_1EBC085E0 != -1) {
            swift_once();
          }
          uint64_t v58 = sub_1C69E1C68();
          __swift_project_value_buffer(v58, (uint64_t)qword_1EBC085E8);
          swift_bridgeObjectRetain_n();
          uint64_t v59 = sub_1C69E1C48();
          os_log_type_t v60 = sub_1C69E1EC8();
          if (os_log_type_enabled(v59, v60))
          {
            unint64_t v61 = (uint8_t *)swift_slowAlloc();
            uint64_t v62 = swift_slowAlloc();
            *(void *)&long long v78 = v62;
            *(_DWORD *)unint64_t v61 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)&long long v75 = sub_1C69A8148(v56, v57, (uint64_t *)&v78);
            sub_1C69E1F28();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C698D000, v59, v60, "Adding ExecutedAppIntentBundleId property of: %s", v61, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C87A7AA0](v62, -1, -1);
            uint64_t v63 = v61;
            uint64_t v52 = v71;
            MEMORY[0x1C87A7AA0](v63, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v64 = sub_1C69E1478();
          uint64_t v79 = MEMORY[0x1E4FBB1A0];
          uint64_t v80 = MEMORY[0x1E4FBB1D8];
          uint64_t v81 = MEMORY[0x1E4FBB1A8];
          *(void *)&long long v78 = v56;
          *((void *)&v78 + 1) = v57;
          sub_1C69A9D68((uint64_t)&v78, v64, v65);
          (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v70);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v5);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v51 + 8))(v4, v49);
      }
    }
  }
  return v82;
}

uint64_t sub_1C69AE758(uint64_t a1, uint64_t a2)
{
  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443070);
  v3[21] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69AE7F0, 0, 0);
}

uint64_t sub_1C69AE7F0()
{
  OUTLINED_FUNCTION_32();
  uint64_t v1 = *(void *)(v0[20] + 24);
  swift_getObjectType();
  sub_1C69E10B8();
  v0[22] = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 32) + **(int **)(v1 + 32));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[23] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C69AE908;
  uint64_t v4 = OUTLINED_FUNCTION_43();
  return v6(v4);
}

uint64_t sub_1C69AE908()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  *(void *)(v6 + 192) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69AE9F0()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443078);
  OUTLINED_FUNCTION_72(v2, v6, v7, v5);
  uint64_t v8 = (void *)swift_allocObject();
  v0[25] = v8;
  v8[2] = v1;
  v8[3] = v4;
  v8[4] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[26] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443028);
  *uint64_t v9 = v0;
  v9[1] = sub_1C69AEB18;
  uint64_t v11 = v0[24];
  uint64_t v12 = v0[21];
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  return MEMORY[0x1F4159CA8](v11, v12, &unk_1EA443088, v8, v13, v10);
}

uint64_t sub_1C69AEB18()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 168);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v7 = v6;
  *(void *)(v9 + 216) = v8;
  *(void *)(v9 + 224) = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C69B74DC(v5, &qword_1EA443070);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1C69AEC48()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = MEMORY[0x1E4FBC860];
    do
    {
      sub_1C69B73AC(v3, v0 + 16, &qword_1EA443028);
      uint64_t v5 = OUTLINED_FUNCTION_24_1();
      sub_1C69B67C0(v5, v6, &qword_1EA443028);
      if (*(void *)(v0 + 88))
      {
        long long v14 = *(_OWORD *)(v0 + 80);
        long long v15 = *(_OWORD *)(v0 + 96);
        long long v16 = *(_OWORD *)(v0 + 112);
        long long v17 = *(_OWORD *)(v0 + 128);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C69A7550();
          uint64_t v4 = v9;
        }
        unint64_t v7 = *(void *)(v4 + 16);
        if (v7 >= *(void *)(v4 + 24) >> 1)
        {
          sub_1C69A7550();
          uint64_t v4 = v10;
        }
        *(void *)(v4 + 16) = v7 + 1;
        uint64_t v8 = (_OWORD *)(v4 + (v7 << 6));
        v8[4] = v16;
        v8[5] = v17;
        v8[2] = v14;
        v8[3] = v15;
      }
      else
      {
        sub_1C69B74DC(v0 + 80, &qword_1EA443028);
      }
      v3 += 64;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x1E4FBC860];
  }
  uint64_t v11 = sub_1C69AF21C(v4);
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  return v12(v11);
}

uint64_t sub_1C69AEDEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a2;
  v4[23] = a3;
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  v4[24] = a4;
  v4[25] = v5;
  v4[26] = v6;
  return MEMORY[0x1F4188298](sub_1C69AEE18, 0, 0);
}

uint64_t sub_1C69AEE18()
{
  uint64_t v2 = v0[25];
  unint64_t v1 = v0[26];
  uint64_t v3 = v0[22];
  uint64_t v4 = sub_1C69E10B8();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v4;
  }
  uint64_t v8 = 7;
  if (((v6 >> 60) & ((v4 & 0x800000000000000) == 0)) != 0) {
    uint64_t v8 = 11;
  }
  unint64_t v9 = v8 | (v7 << 16);
  swift_bridgeObjectRetain();
  sub_1C69AF1D0(v9, v2, v1);
  swift_bridgeObjectRelease();
  uint64_t v10 = OUTLINED_FUNCTION_65();
  uint64_t v11 = MEMORY[0x1C87A6FA0](v10);
  uint64_t v13 = v12;
  v0[20] = v11;
  v0[21] = v12;
  swift_bridgeObjectRelease();
  v0[27] = v13;
  uint64_t v14 = *(void *)(v3 + 24);
  swift_getObjectType();
  uint64_t v19 = (uint64_t (*)(uint64_t))(*(void *)(v14 + 16) + **(int **)(v14 + 16));
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[28] = v15;
  *long long v15 = v16;
  v15[1] = sub_1C69AEFD0;
  uint64_t v17 = OUTLINED_FUNCTION_59();
  return v19(v17);
}

uint64_t sub_1C69AEFD0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69AF098()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  sub_1C69B73AC(v0 + 16, v0 + 112, &qword_1EBC07D60);
  uint64_t v1 = *(void *)(v0 + 216);
  if (*(void *)(v0 + 136))
  {
    uint64_t v2 = *(void *)(v0 + 160);
    sub_1C69A4B74((long long *)(v0 + 112), (_OWORD *)(v0 + 64));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443098);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1C69E3650;
    *(void *)(v3 + 32) = v2;
    *(void *)(v3 + 40) = v1;
    sub_1C69B7580(v0 + 64, v3 + 48);
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v4 = &qword_1EBC07D60;
    uint64_t v5 = v0 + 16;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = OUTLINED_FUNCTION_24_1();
    sub_1C69B74DC(v6, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443098);
    uint64_t v8 = (_OWORD *)swift_allocObject();
    v8[1] = xmmword_1C69E3650;
    v8[2] = 0u;
    v8[3] = 0u;
    v8[4] = 0u;
    v8[5] = 0u;
    uint64_t v5 = OUTLINED_FUNCTION_58();
  }
  sub_1C69B74DC(v5, v4);
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_48();
  return v11(v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_1C69AF1D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 < a1 >> 14) {
    __break(1u);
  }
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C69AF21C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF8);
    uint64_t v3 = sub_1C69E20D8();
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4FBC868];
  }
  uint64_t v6 = v3;
  sub_1C69B7190(a1, 1, &v6);
  uint64_t v4 = v6;
  if (v1) {
    swift_release();
  }
  return v4;
}

uint64_t sub_1C69AF2AC(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return MEMORY[0x1F4188298](sub_1C69AF2D0, 0, 0);
}

uint64_t sub_1C69AF2D0()
{
  OUTLINED_FUNCTION_5();
  swift_getObjectType();
  OUTLINED_FUNCTION_34_1();
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_1C69AF3E8;
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_26_1();
  return v3();
}

uint64_t sub_1C69AF3E8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69AF4B0()
{
  OUTLINED_FUNCTION_20();
  if (v0[5])
  {
    os_log_type_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430F8);
    if (OUTLINED_FUNCTION_18_2())
    {
      if (qword_1EBC085E0 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_1C69E1C68();
      uint64_t v3 = OUTLINED_FUNCTION_31_1(v2, (uint64_t)qword_1EBC085E8);
      os_log_type_t v4 = sub_1C69E1EC8();
      if (OUTLINED_FUNCTION_28_1(v4))
      {
        uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_23_1();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1C698D000, v3, v1, "Using salient entities from client", v5, 2u);
        OUTLINED_FUNCTION_17();
      }

      uint64_t v6 = OUTLINED_FUNCTION_38_0();
      return v7(v6);
    }
  }
  else
  {
    sub_1C69B74DC((uint64_t)(v0 + 2), &qword_1EBC07D60);
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C69E1C68();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_31_1(v9, (uint64_t)qword_1EBC085E8);
  os_log_type_t v11 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_19_2(v11))
  {
    uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v12);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v13, v14, "No salient entities sent from client. Computing directly");
    OUTLINED_FUNCTION_17();
  }
  uint64_t v15 = v0[11];

  __swift_project_boxed_opaque_existential_1((void *)(v15 + 32), *(void *)(v15 + 56));
  uint64_t v16 = (void *)swift_task_alloc();
  v0[13] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_1C69AF6E4;
  uint64_t v17 = OUTLINED_FUNCTION_24_1();
  return MEMORY[0x1F4159468](v17);
}

uint64_t sub_1C69AF6E4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_1C69AF7B0(uint64_t a1, uint64_t a2)
{
  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  uint64_t v4 = sub_1C69E11E8();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69AF874, 0, 0);
}

uint64_t sub_1C69AF874()
{
  OUTLINED_FUNCTION_5();
  swift_getObjectType();
  OUTLINED_FUNCTION_34_1();
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 136) = v1;
  *os_log_type_t v1 = v2;
  v1[1] = sub_1C69AF984;
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_26_1();
  return v3();
}

uint64_t sub_1C69AF984()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69AFA4C()
{
  unint64_t v30 = v1;
  if (v1[5])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    OUTLINED_FUNCTION_87();
    if (swift_dynamicCast())
    {
      uint64_t v3 = v1[8];
      unint64_t v2 = v1[9];
      if (qword_1EBC085E0 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_1C69E1C68();
      __swift_project_value_buffer(v4, (uint64_t)qword_1EBC085E8);
      uint64_t v5 = sub_1C69E1C48();
      os_log_type_t v6 = sub_1C69E1ED8();
      if (OUTLINED_FUNCTION_28_1(v6))
      {
        uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_23_1();
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1C698D000, v5, v0, "Deserialising catglobals from statestore", v7, 2u);
        OUTLINED_FUNCTION_17();
      }

      sub_1C69E0528();
      OUTLINED_FUNCTION_35();
      sub_1C69E0518();
      sub_1C69B7454(&qword_1EA4430D0, MEMORY[0x1E4FA43C8]);
      sub_1C69E0508();
      uint64_t v11 = sub_1C69E11D8();
      unint64_t v12 = sub_1C69AA494(v11);
      swift_bridgeObjectRelease();
      unint64_t v27 = v12;
      uint64_t v13 = sub_1C69E11C8();
      if (v14)
      {
        uint64_t v15 = v13;
        unint64_t v16 = v14;
        swift_bridgeObjectRetain_n();
        uint64_t v17 = sub_1C69E1C48();
        os_log_type_t v18 = sub_1C69E1EC8();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v26 = v15;
          uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_13_1();
          *(void *)&long long v28 = OUTLINED_FUNCTION_25_1();
          *(_DWORD *)uint64_t v19 = 136315138;
          swift_bridgeObjectRetain();
          v1[10] = sub_1C69A8148(v26, v16, (uint64_t *)&v28);
          sub_1C69E1F28();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C698D000, v17, v18, "Assigning deviceName: %s to GlobalProperties", v19, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_17();
          OUTLINED_FUNCTION_17();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        uint64_t v20 = sub_1C69E1D28();
        swift_bridgeObjectRelease();
        id v21 = objc_msgSend(objc_allocWithZone(NSString), sel_initWithUTF8String_, v20 + 32);
        swift_release();
        if (v21)
        {
          *((void *)&v29 + 1) = sub_1C69B749C();
          *(void *)&long long v28 = v21;
        }
        else
        {
          long long v28 = 0u;
          long long v29 = 0u;
        }
        uint64_t v23 = v1[15];
        uint64_t v22 = v1[16];
        uint64_t v24 = v1[14];
        sub_1C69A9CD8((uint64_t)&v28, 0x614E656369766564, 0xEA0000000000656DLL);
        swift_release();
        sub_1C69A36B4(v3, v2);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
        unint64_t v12 = v27;
      }
      else
      {
        (*(void (**)(void, void))(v1[15] + 8))(v1[16], v1[14]);
        swift_release();
        sub_1C69A36B4(v3, v2);
      }
      swift_task_dealloc();
      OUTLINED_FUNCTION_67();
      return v25(v12);
    }
  }
  else
  {
    sub_1C69B74DC((uint64_t)(v1 + 2), &qword_1EBC07D60);
  }
  sub_1C69B7408();
  swift_allocError();
  *uint64_t v8 = 0;
  swift_willThrow();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v9();
}

uint64_t sub_1C69AFEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  return MEMORY[0x1F4188298](sub_1C69AFF0C, 0, 0);
}

uint64_t sub_1C69AFF0C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(*(void *)(v0 + 176) + 24);
  swift_getObjectType();
  os_log_type_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 16) + **(int **)(v1 + 16));
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 184) = v2;
  void *v2 = v3;
  v2[1] = sub_1C69B0038;
  uint64_t v4 = OUTLINED_FUNCTION_59();
  return v6(v4);
}

uint64_t sub_1C69B0038()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B0100(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint8_t *a10, uint8_t *buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_61();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  long long v29 = (_OWORD *)(v26 + 64);
  if (!*(void *)(v26 + 40))
  {
    sub_1C69B74DC(v26 + 16, &qword_1EBC07D60);
    *long long v29 = 0u;
    *(_OWORD *)(v26 + 80) = 0u;
    *(void *)(v26 + 96) = 0;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430C8);
  if ((OUTLINED_FUNCTION_18_2() & 1) == 0)
  {
    *(void *)(v26 + 96) = 0;
    *long long v29 = 0u;
    *(_OWORD *)(v26 + 80) = 0u;
    goto LABEL_10;
  }
  if (!*(void *)(v26 + 88))
  {
LABEL_10:
    sub_1C69B74DC(v26 + 64, &qword_1EA442FD8);
    sub_1C69B7408();
    swift_allocError();
    *os_log_type_t v44 = 2;
    swift_willThrow();
    OUTLINED_FUNCTION_18();
    goto LABEL_11;
  }
  sub_1C69958A4((long long *)(v26 + 64), *(void *)(v26 + 152));
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1C69E1C68();
  __swift_project_value_buffer(v30, (uint64_t)qword_1EBC085E8);
  uint64_t v31 = OUTLINED_FUNCTION_45();
  sub_1C69B752C(v31, v32);
  uint64_t v33 = sub_1C69E1C48();
  os_log_type_t v34 = sub_1C69E1EC8();
  if (os_log_type_enabled(v33, v34))
  {
    a12 = v26 + 144;
    uint64_t v35 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    a13 = OUTLINED_FUNCTION_25_1();
    a14 = a13;
    *(_DWORD *)uint64_t v35 = 136315138;
    a10 = v35 + 4;
    buf = v35;
    uint64_t v36 = *(void *)(v26 + 128);
    a9 = *(void *)(v26 + 136);
    uint64_t v37 = __swift_project_boxed_opaque_existential_1((void *)(v26 + 104), v36);
    OUTLINED_FUNCTION_5_4();
    uint64_t v39 = v38;
    uint64_t v40 = OUTLINED_FUNCTION_24();
    (*(void (**)(uint64_t, void *, uint64_t))(v39 + 16))(v40, v37, v36);
    OUTLINED_FUNCTION_68();
    uint64_t v41 = sub_1C69E1D18();
    unint64_t v43 = v42;
    swift_task_dealloc();
    *(void *)(v26 + 144) = sub_1C69A8148(v41, v43, &a14);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v26 + 104);
    _os_log_impl(&dword_1C698D000, v33, v34, "Got deviceState as:\n%s", buf, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v26 + 104);
  }

  OUTLINED_FUNCTION_7_0();
LABEL_11:
  OUTLINED_FUNCTION_64();
  return v46(v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, buf, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1C69B03E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[26] = a3;
  v4[27] = v3;
  v4[24] = a1;
  v4[25] = a2;
  uint64_t v5 = sub_1C69E10D8();
  v4[28] = v5;
  v4[29] = *(void *)(v5 - 8);
  v4[30] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B04A4, 0, 0);
}

uint64_t sub_1C69B04A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  uint64_t v16 = v14[29];
  uint64_t v15 = v14[30];
  uint64_t v17 = v14[28];
  uint64_t v18 = *(void *)(v14[27] + 24);
  swift_getObjectType();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, *MEMORY[0x1E4FA4318], v17);
  sub_1C69E10C8();
  v14[31] = v19;
  OUTLINED_FUNCTION_52();
  v20();
  uint64_t v33 = *(void *)(v18 + 16) + **(int **)(v18 + 16);
  id v21 = (void *)swift_task_alloc();
  v14[32] = v21;
  *id v21 = v14;
  v21[1] = sub_1C69B0610;
  OUTLINED_FUNCTION_30();
  return v30(v22, v23, v24, v25, v26, v27, v28, v29, a9, v33, v18 + 16, a12, a13, a14);
}

uint64_t sub_1C69B0610()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B06F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_46();
  a20 = v22;
  uint64_t v25 = (_OWORD *)(v22 + 104);
  if (*(void *)(v22 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443100);
    if (OUTLINED_FUNCTION_18_2())
    {
      if (*(void *)(v22 + 128))
      {
        uint64_t v26 = (long long *)OUTLINED_FUNCTION_45();
        sub_1C69958A4(v26, v27);
        if (qword_1EBC085E0 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_1C69E1C68();
        __swift_project_value_buffer(v28, (uint64_t)qword_1EBC085E8);
        uint64_t v29 = OUTLINED_FUNCTION_24_1();
        sub_1C69B752C(v29, v30);
        uint64_t v31 = sub_1C69E1C48();
        os_log_type_t v32 = sub_1C69E1EC8();
        if (os_log_type_enabled(v31, v32))
        {
          a10 = v22 + 184;
          uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_13_1();
          a11 = OUTLINED_FUNCTION_25_1();
          *(_DWORD *)uint64_t v33 = 136315138;
          a9 = v33 + 4;
          __swift_project_boxed_opaque_existential_1((void *)(v22 + 144), *(void *)(v22 + 168));
          uint64_t v34 = sub_1C69E2178();
          *(void *)(v22 + 184) = sub_1C69A8148(v34, v35, &a11);
          sub_1C69E1F28();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1(v22 + 144);
          _os_log_impl(&dword_1C698D000, v31, v32, "Got siriRequestState as: %s", v33, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_17();
          OUTLINED_FUNCTION_17();
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1(v22 + 144);
        }

        sub_1C69958A4((long long *)(v22 + 64), *(void *)(v22 + 192));
        goto LABEL_15;
      }
    }
    else
    {
      *(void *)(v22 + 136) = 0;
      *uint64_t v25 = 0u;
      *(_OWORD *)(v22 + 120) = 0u;
    }
  }
  else
  {
    sub_1C69B74DC(v22 + 16, &qword_1EBC07D60);
    *uint64_t v25 = 0u;
    *(_OWORD *)(v22 + 120) = 0u;
    *(void *)(v22 + 136) = 0;
  }
  sub_1C69B74DC(v22 + 104, &qword_1EBC07C08);
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1C69E1C68();
  uint64_t v37 = (void *)OUTLINED_FUNCTION_31_1(v36, (uint64_t)qword_1EBC085E8);
  os_log_type_t v38 = sub_1C69E1EE8();
  if (OUTLINED_FUNCTION_19_2(v38))
  {
    uint64_t v39 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v39);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v40, v41, "No SiriRequestState set in state store");
    OUTLINED_FUNCTION_17();
  }
  uint64_t v42 = *(void *)(v22 + 192);

  *(void *)(v42 + 32) = 0;
  *(_OWORD *)uint64_t v42 = 0u;
  *(_OWORD *)(v42 + 16) = 0u;
LABEL_15:
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  return v44(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1C69B09CC()
{
  OUTLINED_FUNCTION_6_0();
  v1[46] = v2;
  v1[47] = v0;
  v1[44] = v3;
  v1[45] = v4;
  uint64_t v5 = sub_1C69E06A8();
  OUTLINED_FUNCTION_44(v5);
  v1[48] = OUTLINED_FUNCTION_24();
  uint64_t v6 = sub_1C69E1938();
  OUTLINED_FUNCTION_44(v6);
  v1[49] = OUTLINED_FUNCTION_24();
  uint64_t v7 = sub_1C69E17B8();
  v1[50] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[51] = v8;
  v1[52] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C69B0A9C()
{
  OUTLINED_FUNCTION_5();
  swift_getObjectType();
  OUTLINED_FUNCTION_34_1();
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 424) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_1C69B0BB0;
  OUTLINED_FUNCTION_26_1();
  return v3();
}

uint64_t sub_1C69B0BB0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B0C78()
{
  OUTLINED_FUNCTION_20();
  if (v0[5])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D18);
    if (OUTLINED_FUNCTION_18_2())
    {
      uint64_t v1 = v0[43];
      goto LABEL_6;
    }
  }
  else
  {
    sub_1C69B74DC((uint64_t)(v0 + 2), &qword_1EBC07D60);
  }
  uint64_t v1 = MEMORY[0x1E4FBC860];
LABEL_6:
  v0[54] = v1;
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[55] = v2;
  void *v2 = v3;
  v2[1] = sub_1C69B0D64;
  uint64_t v4 = OUTLINED_FUNCTION_35_0();
  return sub_1C69B03E0(v4, v5, v6);
}

uint64_t sub_1C69B0D64()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v0;
  *uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 448) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1C69B0EC0;
  uint64_t v6 = OUTLINED_FUNCTION_38(*(void *)(v1 + 360));
  return sub_1C69AF2AC(v6, v7);
}

uint64_t sub_1C69B0EC0()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  void *v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (v0) {

  }
  else {
    *(void *)(v5 + 456) = v3;
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C69B0FB4()
{
  OUTLINED_FUNCTION_6_0();
  v0[58] = v0[57];
  v0[59] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DB0);
  v0[39] = sub_1C69E1C98();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[60] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69B1080;
  uint64_t v2 = OUTLINED_FUNCTION_38(v0[45]);
  return sub_1C69AF7B0(v2, v3);
}

uint64_t sub_1C69B1080()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  void *v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 488) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 496) = v3;
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C69B1170()
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  unint64_t v1 = sub_1C69AA0F0(v0[62]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[39] = v1;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C69E1C68();
  uint64_t v3 = OUTLINED_FUNCTION_31_1(v2, (uint64_t)qword_1EBC085E8);
  os_log_type_t v4 = sub_1C69E1ED8();
  if (OUTLINED_FUNCTION_19_2(v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v5 = 136315138;
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRetain();
    sub_1C69E1C88();
    uint64_t v6 = swift_bridgeObjectRelease();
    v0[42] = OUTLINED_FUNCTION_56(v6, v7);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C698D000, v3, (os_log_type_t)v1, "CatGlobals computed as: %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_76();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[63] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1C69B1374;
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_30();
  return sub_1C69AFEE8(v9, v10, v11);
}

uint64_t sub_1C69B1374()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 512) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69B1450()
{
  OUTLINED_FUNCTION_32();
  sub_1C69B74DC((uint64_t)(v0 + 18), &qword_1EA442FD8);
  uint64_t v1 = OUTLINED_FUNCTION_24_1();
  sub_1C69B67C0(v1, v2, &qword_1EA442FD8);
  OUTLINED_FUNCTION_3_3();
  uint64_t v3 = v0[39];
  v0[65] = v3;
  uint64_t result = sub_1C69B73AC((uint64_t)(v0 + 18), (uint64_t)(v0 + 13), &qword_1EA442FD8);
  if (v0[16])
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[66] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1C69B1574;
    uint64_t v6 = OUTLINED_FUNCTION_51();
    return sub_1C69B1D5C(v6, v7, v8, v9, v3, v10, (uint64_t)(v0 + 13), (uint64_t)(v0 + 8));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C69B1574()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 536) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_1(v3 + 104);
  }
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_48();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69B16B4()
{
  OUTLINED_FUNCTION_20();
  sub_1C69B74DC(v0 + 144, &qword_1EA442FD8);
  sub_1C69B74DC(v0 + 64, &qword_1EBC07C08);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v1();
}

uint64_t sub_1C69B1758()
{
  OUTLINED_FUNCTION_6_0();
  v0[58] = 0;
  v0[59] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07DB0);
  v0[39] = sub_1C69E1C98();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[60] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69B1080;
  uint64_t v2 = OUTLINED_FUNCTION_38(v0[45]);
  return sub_1C69AF7B0(v2, v3);
}

uint64_t sub_1C69B1820()
{
  id v21 = v0;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[61];
  uint64_t v2 = sub_1C69E1C68();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085E8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = (void *)sub_1C69E1C48();
  os_log_type_t v6 = sub_1C69E1EC8();
  BOOL v7 = OUTLINED_FUNCTION_22(v6);
  uint64_t v8 = (void *)v0[61];
  if (v7)
  {
    uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v20 = OUTLINED_FUNCTION_25_1();
    *uint64_t v9 = 136315138;
    v0[40] = v8;
    id v10 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v11 = sub_1C69E1D08();
    v0[41] = sub_1C69A8148(v11, v12, &v20);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_39(&dword_1C698D000, v13, v14, "[warning] Unable to obtain Cat global properties from state store.\nError: %s. Using empty properties.\nIf this crashes, please ensure for each request a\nCatGlobalProperties dictionary is set to the statestore");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  OUTLINED_FUNCTION_76();
  uint64_t v15 = (void *)swift_task_alloc();
  v0[63] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_1C69B1374;
  uint64_t v16 = OUTLINED_FUNCTION_35_0();
  return sub_1C69AFEE8(v16, v17, v18);
}

uint64_t sub_1C69B1A3C()
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  uint64_t v2 = OUTLINED_FUNCTION_31_1(v1, (uint64_t)qword_1EBC085E8);
  os_log_type_t v3 = sub_1C69E1EE8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)OUTLINED_FUNCTION_23_1();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C698D000, v2, v3, "Unable to obtain DeviceState from state store. Assuming restrictive state", v4, 2u);
    OUTLINED_FUNCTION_17();
  }
  uint64_t v5 = (void *)v0[64];

  OUTLINED_FUNCTION_73();
  v6();
  sub_1C69E1928();
  sub_1C69E0698();
  v0[31] = sub_1C69E13E8();
  v0[32] = sub_1C69B7454(&qword_1EA442FD0, MEMORY[0x1E4FA45D8]);
  __swift_allocate_boxed_opaque_existential_1(v0 + 28);
  sub_1C69E13D8();

  sub_1C69B74DC((uint64_t)(v0 + 18), &qword_1EA442FD8);
  sub_1C69B67C0((uint64_t)(v0 + 28), (uint64_t)(v0 + 18), &qword_1EA442FD8);
  OUTLINED_FUNCTION_3_3();
  v0[65] = v0[39];
  uint64_t result = sub_1C69B73AC((uint64_t)(v0 + 18), (uint64_t)(v0 + 13), &qword_1EA442FD8);
  if (v0[16])
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[66] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1C69B1574;
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_30();
    return sub_1C69B1D5C(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C69B1CA8()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  sub_1C69B74DC(v0 + 144, &qword_1EA442FD8);
  sub_1C69B74DC(v0 + 64, &qword_1EBC07C08);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_48();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1C69B1D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[39] = a8;
  v9[40] = v8;
  v9[37] = a6;
  v9[38] = a7;
  v9[35] = a4;
  v9[36] = a5;
  v9[33] = a2;
  v9[34] = a3;
  v9[32] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C58);
  v9[41] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E10);
  v9[42] = swift_task_alloc();
  uint64_t v10 = sub_1C69E1758();
  v9[43] = v10;
  v9[44] = *(void *)(v10 - 8);
  v9[45] = swift_task_alloc();
  v9[46] = swift_task_alloc();
  sub_1C69E0678();
  v9[47] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C60);
  v9[48] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B1EF8, 0, 0);
}

uint64_t sub_1C69B1EF8()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  sub_1C69B73AC(v0[39], (uint64_t)(v0 + 2), &qword_1EBC07C08);
  uint64_t v1 = v0[48];
  if (!v0[5])
  {
    sub_1C69B74DC((uint64_t)(v0 + 2), &qword_1EBC07C08);
    uint64_t v14 = sub_1C69E18B8();
    OUTLINED_FUNCTION_72(v1, v15, v16, v14);
    goto LABEL_9;
  }
  uint64_t v2 = (void *)OUTLINED_FUNCTION_65();
  __swift_project_boxed_opaque_existential_1(v2, v3);
  OUTLINED_FUNCTION_43();
  sub_1C69E13A8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v4 = sub_1C69E18B8();
  OUTLINED_FUNCTION_71(v1, 1, v4);
  if (v5)
  {
LABEL_9:
    sub_1C69B74DC(v0[48], &qword_1EBC07C60);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_5_4();
  uint64_t v7 = v6;
  if ((*(unsigned int (**)(void))(v8 + 88))() == *MEMORY[0x1E4FA4A30])
  {
    uint64_t v9 = v0[40];
    (*(void (**)(void, uint64_t))(v7 + 96))(v0[48], v4);
    sub_1C69E18D8();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_37_0();
    v10();
    __swift_project_boxed_opaque_existential_1((void *)(v9 + 112), *(void *)(v9 + 136));
    OUTLINED_FUNCTION_24_1();
    if (sub_1C69E1908())
    {
      uint64_t v11 = (void *)swift_task_alloc();
      v0[49] = v11;
      void *v11 = v0;
      v11[1] = sub_1C69B21E8;
      OUTLINED_FUNCTION_48();
      return sub_1C69B2F4C();
    }
  }
  else
  {
    (*(void (**)(void, uint64_t))(v7 + 8))(v0[48], v4);
  }
LABEL_10:
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1C69E1C68();
  uint64_t v18 = (void *)OUTLINED_FUNCTION_31_1(v17, (uint64_t)qword_1EBC085E8);
  os_log_type_t v19 = sub_1C69E1ED8();
  if (OUTLINED_FUNCTION_19_2(v19))
  {
    uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v20);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v21, v22, "Do not need to wait for incoming data as the requestState.assistantTurnState is not taskComplete or SAE is disabled");
    OUTLINED_FUNCTION_17();
  }

  uint64_t v23 = (void *)swift_task_alloc();
  v0[51] = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_1C69B24A4;
  OUTLINED_FUNCTION_38(v0[33]);
  OUTLINED_FUNCTION_48();
  return sub_1C69ABC5C(v24, v25, v26);
}

uint64_t sub_1C69B21E8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 400) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1C69B22B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_46();
  a20 = v22;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C69E1C68();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBC085E8);
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)sub_1C69E1C48();
  os_log_type_t v27 = sub_1C69E1EC8();
  BOOL v28 = OUTLINED_FUNCTION_28_1(v27);
  uint64_t v29 = v22[50];
  if (v28)
  {
    uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    a11 = OUTLINED_FUNCTION_25_1();
    *uint64_t v30 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
    uint64_t v32 = MEMORY[0x1C87A7030](v29, v31);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    v22[31] = sub_1C69A8148(v32, v34, &a11);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_88(&dword_1C698D000, v35, v36, "Got all incoming data to finish the interaction building: %s");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v37 = (void *)swift_task_alloc();
  v22[51] = v37;
  *uint64_t v37 = v22;
  v37[1] = sub_1C69B24A4;
  OUTLINED_FUNCTION_38(v22[33]);
  OUTLINED_FUNCTION_30();
  return sub_1C69ABC5C(v38, v39, v40);
}

uint64_t sub_1C69B24A4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 416) = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    return v6();
  }
  else
  {
    OUTLINED_FUNCTION_10_0();
    return MEMORY[0x1F4188298](v8, v9, v10);
  }
}

uint64_t sub_1C69B25F4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = v0[52];
  if (!v1)
  {
    sub_1C69E1268();
    uint64_t v1 = sub_1C69E11F8();
  }
  v0[53] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[54] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1C69B269C;
  uint64_t v3 = OUTLINED_FUNCTION_38(v0[33]);
  return sub_1C69AE758(v3, v4);
}

uint64_t sub_1C69B269C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 440) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1C69B276C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, os_log_t log, uint64_t a13, os_log_type_t type, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_61();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1C69E1C68();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EBC085E8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1C69E1C48();
  os_log_type_t v31 = sub_1C69E1ED8();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = v26[34];
  if (v32)
  {
    a10 = v26 + 29;
    a11 = v26 + 30;
    os_log_type_t typea = v31;
    uint64_t v34 = v26[33];
    uint64_t v35 = swift_slowAlloc();
    a15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315906;
    os_log_t log = v30;
    swift_bridgeObjectRetain();
    v26[27] = sub_1C69A8148(v34, v33, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x1C87A7030](v36, MEMORY[0x1E4FBB1A0]);
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    v26[28] = sub_1C69A8148(v37, v39, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 22) = 2080;
    uint64_t v40 = sub_1C69E1208();
    v26[29] = sub_1C69A8148(v40, v41, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v35 + 32) = 2080;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    uint64_t v42 = sub_1C69E1C88();
    unint64_t v44 = v43;
    swift_bridgeObjectRelease();
    v26[30] = sub_1C69A8148(v42, v44, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, log, typea, "Creating suggestions interaction for requestId: %s with dialogId: %s, intent: %s, executionParameters %s", (uint8_t *)v35, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v45 = *(void *)(v26[40] + 24);
  swift_getObjectType();
  uint64_t v56 = *(void *)(v45 + 24) + **(int **)(v45 + 24);
  uint64_t v46 = (void *)swift_task_alloc();
  v26[56] = v46;
  *uint64_t v46 = v26;
  v46[1] = sub_1C69B2B80;
  OUTLINED_FUNCTION_38(v26[33]);
  OUTLINED_FUNCTION_64();
  return v52(v47, v48, v49, v50, v51, v52, v53, v54, a9, a10, a11, log, v56, v45 + 24, a15, a16, a17, a18);
}

uint64_t sub_1C69B2B80()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B2C48()
{
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[38];
  sub_1C69E1258();
  sub_1C69E0668();
  sub_1C69E1228();
  sub_1C69B752C(v2, (uint64_t)(v0 + 12));
  sub_1C69B752C((uint64_t)(v0 + 7), (uint64_t)(v0 + 17));
  swift_bridgeObjectRetain();
  sub_1C69E1248();
  sub_1C69E1238();
  uint64_t v3 = sub_1C69E12E8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v3);
  uint64_t v5 = v0[46];
  uint64_t v6 = v0[44];
  if (EnumTagSinglePayload == 1)
  {
    sub_1C69B74DC(v0[42], &qword_1EA442E10);
    OUTLINED_FUNCTION_73();
    v7();
  }
  else
  {
    uint64_t v8 = v0[45];
    uint64_t v9 = v0[43];
    sub_1C69E12C8();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_37_0();
    v10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v9);
  }
  uint64_t v22 = (uint64_t)(v0 + 22);
  uint64_t v11 = v0[41];
  uint64_t v12 = sub_1C69E1878();
  OUTLINED_FUNCTION_72(v11, v13, v14, v12);
  uint64_t v15 = OUTLINED_FUNCTION_66();
  sub_1C69B73AC(v15, v16, v17);
  if (v0[25])
  {
    uint64_t v18 = (void *)OUTLINED_FUNCTION_24_1();
    __swift_project_boxed_opaque_existential_1(v18, v19);
    sub_1C69E13C8();
    __swift_destroy_boxed_opaque_existential_1(v22);
  }
  else
  {
    sub_1C69B74DC(v22, &qword_1EBC07C08);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C69E1498();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v20();
}

uint64_t sub_1C69B2F4C()
{
  v1[3] = v0;
  uint64_t v2 = sub_1C69E1C38();
  void v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B300C, 0, 0);
}

uint64_t sub_1C69B300C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (void *)sub_1C69E1B38();
  sub_1C69E1B18();

  sub_1C69E15F8();
  uint64_t v2 = (void *)sub_1C69E1B38();
  sub_1C69E1B48();

  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C69E1C68();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_31_1(v3, (uint64_t)qword_1EBC085E8);
  os_log_type_t v5 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_19_2(v5))
  {
    uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v6);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v7, v8, "Adding listeners for flowIntentProperties and executionParamPrefix");
    OUTLINED_FUNCTION_17();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443000);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 56) = v9;
  *uint64_t v9 = v10;
  v9[1] = sub_1C69B31C8;
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_48();
  return MEMORY[0x1F4188080]();
}

uint64_t sub_1C69B31C8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

void sub_1C69B3290()
{
  OUTLINED_FUNCTION_32();
  sub_1C69E15F8();
  uint64_t v0 = (void *)sub_1C69E1B38();
  OUTLINED_FUNCTION_60();
  sub_1C69E1B28();

  uint64_t v1 = OUTLINED_FUNCTION_45();
  v2(v1);
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_50();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_1C69B334C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[43] = a2;
  v3[44] = a3;
  v3[42] = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[45] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1C69B3404;
  return sub_1C69B3BFC(0xD000000000000014, 0x80000001C69E45E0, a2);
}

uint64_t sub_1C69B3404()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B34CC()
{
  OUTLINED_FUNCTION_20();
  sub_1C69E10B8();
  *(void *)(v0 + 368) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v2;
  void *v2 = v0;
  v2[1] = sub_1C69B3574;
  uint64_t v3 = OUTLINED_FUNCTION_66();
  return sub_1C69B3BFC(v3, v4, v5);
}

uint64_t sub_1C69B3574()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  uint64_t *v2 = v1;
  uint64_t v3 = *v0;
  uint64_t *v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 384) = MEMORY[0x1E4FBC860];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 392) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443020);
  *uint64_t v4 = v3;
  v4[1] = sub_1C69B36F4;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_48();
  return MEMORY[0x1F4187E30](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_1C69B36F4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 400) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69B37D0()
{
  OUTLINED_FUNCTION_32();
  sub_1C69B73AC(v0 + 16, v0 + 144, &qword_1EA443028);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 384);
  if (!v1)
  {
    uint64_t v13 = *(void **)(v0 + 336);
    sub_1C69B74DC(v0 + 16, &qword_1EA443028);
    sub_1C69B74DC(v0 + 144, &qword_1EA443028);
    *uint64_t v13 = v2;
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_50();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v3 = *(void *)(v0 + 144);
  *(void *)(v0 + 80) = v3;
  *(void *)(v0 + 88) = v1;
  sub_1C69A4B74((long long *)(v0 + 160), (_OWORD *)(v0 + 96));
  *(void *)(v0 + 208) = v3;
  *(void *)(v0 + 216) = v1;
  sub_1C69B7580(v0 + 96, v0 + 224);
  *(void *)(v0 + 272) = v3;
  *(void *)(v0 + 280) = v1;
  sub_1C69A4B74((long long *)(v0 + 224), (_OWORD *)(v0 + 288));
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *(void *)(v0 + 384);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_1C69A7550();
    uint64_t v5 = v16;
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 >= *(void *)(v5 + 24) >> 1)
  {
    sub_1C69A7550();
    uint64_t v5 = v17;
  }
  *(void *)(v5 + 16) = v6 + 1;
  uint64_t v7 = (_OWORD *)(v5 + (v6 << 6));
  long long v8 = *(_OWORD *)(v0 + 272);
  long long v9 = *(_OWORD *)(v0 + 288);
  long long v10 = *(_OWORD *)(v0 + 320);
  v7[4] = *(_OWORD *)(v0 + 304);
  v7[5] = v10;
  v7[2] = v8;
  v7[3] = v9;
  sub_1C69B74DC(v0 + 80, &qword_1EA442EF0);
  sub_1C69B74DC(v0 + 16, &qword_1EA443028);
  *(void *)(v0 + 384) = v5;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443020);
  void *v11 = v0;
  v11[1] = sub_1C69B36F4;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_50();
  return MEMORY[0x1F4187E30]();
}

uint64_t sub_1C69B39F8()
{
  OUTLINED_FUNCTION_5();
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 400);
  uint64_t v2 = sub_1C69E1C68();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085E8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1C69E1C48();
  os_log_type_t v6 = sub_1C69E1EE8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  long long v8 = *(void **)(v0 + 400);
  if (v7)
  {
    uint64_t v9 = OUTLINED_FUNCTION_13_1();
    long long v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v9 + 4) = v12;
    *long long v10 = v12;

    _os_log_impl(&dword_1C698D000, v5, v6, "Caught error when waiting for interaction components: %@", (uint8_t *)v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443020);
  *uint64_t v13 = v0;
  v13[1] = sub_1C69B36F4;
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4187E30]();
}

uint64_t sub_1C69B3BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  v4[6] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B3C94, 0, 0);
}

uint64_t sub_1C69B3C94()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[2];
  uint64_t v5 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v1, v6, v7, v5);
  long long v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v2;
  v8[5] = v4;
  v8[6] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C69B5758(v1, (uint64_t)&unk_1EA443038, (uint64_t)v8);
  sub_1C69B74DC(v1, &qword_1EBC07D20);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v9();
}

uint64_t sub_1C69B3D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[61] = a5;
  v6[62] = a6;
  v6[59] = a1;
  v6[60] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  v6[63] = v7;
  v6[64] = *(void *)(v7 - 8);
  v6[65] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443040);
  v6[66] = swift_task_alloc();
  uint64_t v8 = sub_1C69E10A8();
  v6[67] = v8;
  v6[68] = *(void *)(v8 - 8);
  v6[69] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B3ED4, 0, 0);
}

uint64_t sub_1C69B3ED4()
{
  uint64_t v1 = *((void *)v0 + 63);
  uint64_t v2 = *((void *)v0 + 60);
  type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(0);
  uint64_t v3 = OUTLINED_FUNCTION_35();
  *((void *)v0 + 70) = v3;
  swift_defaultActor_initialize();
  uint64_t v4 = OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation;
  *((void *)v0 + 71) = OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation;
  __swift_storeEnumTagSinglePayload(v3 + v4, 1, 1, v1);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 72), *(void *)(v2 + 96));
  OUTLINED_FUNCTION_43();
  uint64_t v5 = sub_1C69E0AC8();
  uint64_t v6 = *((void *)v0 + 67);
  double v7 = MEMORY[0x1C87A6300](v5);
  uint64_t v8 = OUTLINED_FUNCTION_58();
  v9(v8);
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C69E1C68();
  *((void *)v0 + 72) = __swift_project_value_buffer(v10, (uint64_t)qword_1EBC085E8);
  uint64_t v11 = sub_1C69E1C48();
  os_log_type_t v12 = sub_1C69E1ED8();
  if (OUTLINED_FUNCTION_28_1(v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    *(_DWORD *)uint64_t v13 = 134217984;
    v0[58] = v7;
    sub_1C69E1F28();
    _os_log_impl(&dword_1C698D000, v11, (os_log_type_t)v6, "Using wait timeout of: %f", v13, 0xCu);
    OUTLINED_FUNCTION_17();
  }

  uint64_t v15 = *((void *)v0 + 61);
  uint64_t v14 = *((void *)v0 + 62);
  uint64_t v16 = *((void *)v0 + 60);
  uint64_t v17 = (void *)swift_allocObject();
  *((void *)v0 + 73) = v17;
  v17[2] = v3;
  v17[3] = v15;
  v17[4] = v14;
  v17[5] = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v18 = (void *)swift_task_alloc();
  *((void *)v0 + 74) = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
  *((void *)v0 + 75) = v19;
  *uint64_t v18 = v0;
  v18[1] = sub_1C69B434C;
  v20.n128_f64[0] = v7;
  return MEMORY[0x1F415AC08](v0 + 34, &unk_1EA443050, v17, v19, v20);
}

uint64_t sub_1C69B434C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 608) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69B4430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_61();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  uint64_t v29 = (long long *)(v26 + 288);
  uint64_t v30 = *(void *)(v26 + 280);
  *(void *)(v26 + 336) = *(void *)(v26 + 272);
  *(void *)(v26 + 344) = v30;
  sub_1C69B7580(v26 + 288, v26 + 352);
  sub_1C69B73AC(v26 + 336, v26 + 16, &qword_1EA442EF0);
  long long v31 = *(_OWORD *)(v26 + 352);
  *(_OWORD *)(v26 + 208) = *(_OWORD *)(v26 + 336);
  *(_OWORD *)(v26 + 224) = v31;
  long long v32 = *(_OWORD *)(v26 + 384);
  *(_OWORD *)(v26 + 240) = *(_OWORD *)(v26 + 368);
  *(_OWORD *)(v26 + 256) = v32;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v33 = sub_1C69E1C48();
  os_log_type_t v34 = sub_1C69E1ED8();
  if (os_log_type_enabled(v33, v34))
  {
    a10 = *(void *)(v26 + 600);
    a12 = v26 + 208;
    a13 = *(void *)(v26 + 560);
    a14 = v26 + 288;
    uint64_t v35 = *(void *)(v26 + 488);
    unint64_t v36 = *(void *)(v26 + 496);
    uint64_t v37 = swift_slowAlloc();
    a11 = v26 + 16;
    a15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v26 + 432) = sub_1C69A8148(v35, v36, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 2080;
    uint64_t v38 = *(void *)(v26 + 16);
    uint64_t v39 = *(void *)(v26 + 24);
    sub_1C69B7580(v26 + 32, v26 + 160);
    *(void *)(v26 + 80) = v38;
    *(void *)(v26 + 88) = v39;
    sub_1C69A4B74((long long *)(v26 + 160), (_OWORD *)(v26 + 96));
    uint64_t v29 = (long long *)(v26 + 288);
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_1C69E1D08();
    *(void *)(v26 + 456) = sub_1C69A8148(v40, v41, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69B74DC(v26 + 208, &qword_1EA442EF0);
    sub_1C69B74DC(v26 + 16, &qword_1EA442EF0);
    _os_log_impl(&dword_1C698D000, v33, v34, "Got results fopr %s: %s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1C69B74DC(v26 + 208, &qword_1EA442EF0);
    sub_1C69B74DC(v26 + 16, &qword_1EA442EF0);
    swift_release();
  }
  uint64_t v42 = *(void *)(v26 + 472);
  uint64_t v43 = *(void *)(v26 + 280);
  *(void *)uint64_t v42 = *(void *)(v26 + 272);
  *(void *)(v42 + 8) = v43;
  sub_1C69A4B74(v29, (_OWORD *)(v42 + 16));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_64();
  return v45(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1C69B4714()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3();
  uint64_t v0 = OUTLINED_FUNCTION_87();
  sub_1C69B73AC(v0, v1, v2);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B4798()
{
  OUTLINED_FUNCTION_32();
  uint64_t v1 = v0[66];
  uint64_t v2 = v0[63];
  if (__swift_getEnumTagSinglePayload(v1, 1, v2))
  {
    sub_1C69B74DC(v1, &qword_1EA443040);
  }
  else
  {
    uint64_t v3 = (void *)v0[77];
    uint64_t v4 = v0[65];
    uint64_t v5 = v0[64];
    OUTLINED_FUNCTION_14();
    v6();
    sub_1C69B74DC(v1, &qword_1EA443040);
    v0[56] = v3;
    id v7 = v3;
    OUTLINED_FUNCTION_66();
    sub_1C69E1E28();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v2);
  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v8();
}

uint64_t sub_1C69B48D8()
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 608);
  *(void *)(v0 + 616) = v2;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C69E1C68();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC085E8);
  swift_bridgeObjectRetain();
  id v4 = v2;
  swift_bridgeObjectRetain();
  id v5 = v2;
  uint64_t v6 = sub_1C69E1C48();
  os_log_type_t v7 = sub_1C69E1EE8();
  if (OUTLINED_FUNCTION_22(v7))
  {
    uint64_t v8 = OUTLINED_FUNCTION_42();
    uint64_t v9 = (void *)swift_slowAlloc();
    OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v12 = OUTLINED_FUNCTION_56(v10, v11);
    OUTLINED_FUNCTION_82(v12);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2112;
    id v13 = v2;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_83(v14);
    *uint64_t v9 = v14;

    _os_log_impl(&dword_1C698D000, v6, v1, "Error waiting for: %s. %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  OUTLINED_FUNCTION_30();
  return MEMORY[0x1F4188298](v15, v16, v17);
}

uint64_t sub_1C69B4AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x1F4188298](sub_1C69B4B08, 0, 0);
}

uint64_t sub_1C69B4B08()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
  *id v5 = v0;
  v5[1] = sub_1C69B4C08;
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1C69B4C08()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *long long v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_10_0();
    return MEMORY[0x1F4188298](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    return v10();
  }
}

uint64_t sub_1C69B4D08()
{
  OUTLINED_FUNCTION_6_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v0();
}

uint64_t sub_1C69B4D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = a3;
  uint64_t v23 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C69E1E58();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v18[v16], v11, v8);
  uint64_t v19 = &v18[v17];
  uint64_t v20 = v23;
  *(void *)uint64_t v19 = v22;
  *((void *)v19 + 1) = a4;
  *(void *)&v18[(v17 + 23) & 0xFFFFFFFFFFFFFFF8] = v20;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C69DA3CC((uint64_t)v14, (uint64_t)&unk_1EA443060, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_1C69B4F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  v8[11] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[12] = v10;
  v8[13] = *(void *)(v10 + 64);
  v8[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443040);
  v8[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69B5064, 0, 0);
}

uint64_t sub_1C69B5064()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[6];
  v0[16] = *(void *)(v2 + 16);
  v0[17] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  OUTLINED_FUNCTION_14();
  v4();
  OUTLINED_FUNCTION_75(v1, 0);
  return MEMORY[0x1F4188298](sub_1C69B5100, v3, 0);
}

uint64_t sub_1C69B5100()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = *(void *)(v0 + 120);
  swift_beginAccess();
  uint64_t v2 = OUTLINED_FUNCTION_24_1();
  sub_1C69B6554(v2, v3);
  swift_endAccess();
  sub_1C69B74DC(v1, &qword_1EA443040);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1C69B51AC()
{
  uint64_t v27 = v0;
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  v0[18] = v1;
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085C0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = (void *)sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1ED8();
  BOOL v4 = OUTLINED_FUNCTION_28_1(v3);
  unint64_t v5 = v0[9];
  if (v4)
  {
    uint64_t v6 = v0[8];
    uint64_t v7 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v26 = OUTLINED_FUNCTION_25_1();
    *uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_1C69A8148(v6, v5, &v26);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_88(&dword_1C698D000, v8, v9, "Starting listener task for %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t))v0[16];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[14];
  uint64_t v14 = v0[11];
  uint64_t v13 = v0[12];
  uint64_t v15 = v0[9];
  uint64_t v16 = v0[7];
  uint64_t v25 = v0[8];
  uint64_t v17 = *(void *)(v0[10] + 24);
  swift_getObjectType();
  v10(v12, v16, v14);
  unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = swift_allocObject();
  v0[19] = v19;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))(v19 + v18, v12, v14);
  uint64_t v20 = (void *)(v19 + ((v11 + v18 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v20 = v25;
  v20[1] = v15;
  uint64_t v24 = (uint64_t (*)(uint64_t))(*(void *)(v17 + 40) + **(int **)(v17 + 40));
  swift_bridgeObjectRetain();
  uint64_t v21 = (void *)swift_task_alloc();
  v0[20] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_1C69B54A8;
  uint64_t v22 = OUTLINED_FUNCTION_38(v0[8]);
  return v24(v22);
}

uint64_t sub_1C69B54A8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69B558C()
{
  OUTLINED_FUNCTION_20();
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)OUTLINED_FUNCTION_31_1(*(void *)(v0 + 144), (uint64_t)qword_1EBC085E8);
  os_log_type_t v2 = sub_1C69E1ED8();
  if (OUTLINED_FUNCTION_19_2(v2))
  {
    uint64_t v3 = (_WORD *)OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_40(v3);
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v4, v5, "Finished creating listener");
    OUTLINED_FUNCTION_17();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v6();
}

uint64_t sub_1C69B5670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = a3;
  v5[1] = a4;
  sub_1C69B7580(a1, (uint64_t)v6);
  v6[48] = 0;
  swift_bridgeObjectRetain();
  sub_1C69B56D0((uint64_t)v5);
  return sub_1C69B74DC((uint64_t)v5, &qword_1EA443068);
}

uint64_t sub_1C69B56D0(uint64_t a1)
{
  sub_1C69B73AC(a1, (uint64_t)&v2, &qword_1EA443068);
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
    return sub_1C69E1E28();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
    return sub_1C69E1E38();
  }
}

uint64_t sub_1C69B5758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C69B73AC(a1, (uint64_t)v9, &qword_1EBC07D20);
  uint64_t v10 = sub_1C69E1E58();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_1C69B74DC((uint64_t)v9, &qword_1EBC07D20);
  }
  else
  {
    sub_1C69E1E48();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v11 = sub_1C69E1E18();
    uint64_t v13 = v12;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442EF0);
  uint64_t v15 = (void *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v15 = v18;
    void v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t sub_1C69B5914()
{
  sub_1C69B74DC(v0 + OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation, &qword_1EA443040);
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

void sub_1C69B595C()
{
}

void sub_1C69B5964()
{
}

uint64_t sub_1C69B5990()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  return v0;
}

uint64_t sub_1C69B59C8()
{
  sub_1C69B5990();
  return MEMORY[0x1F4186488](v0, 152, 7);
}

uint64_t sub_1C69B59FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6991498;
  return sub_1C69B09CC();
}

unint64_t sub_1C69B5AB4()
{
  unint64_t result = qword_1EA442F60;
  if (!qword_1EA442F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442F60);
  }
  return result;
}

unint64_t sub_1C69B5B04()
{
  unint64_t result = qword_1EA442F68;
  if (!qword_1EA442F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442F68);
  }
  return result;
}

unint64_t sub_1C69B5B54()
{
  unint64_t result = qword_1EA442F70;
  if (!qword_1EA442F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA442F70);
  }
  return result;
}

uint64_t dispatch thunk of InteractionBuilder.build(requestId:)()
{
  OUTLINED_FUNCTION_32();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 8) + **(int **)(v0 + 8));
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28(v10);
  void *v11 = v12;
  v11[1] = sub_1C6991498;
  return v14(v9, v7, v5, v3, v1);
}

uint64_t sub_1C69B5CB4()
{
  return type metadata accessor for EventDrivenInteractionBuilder(0);
}

uint64_t type metadata accessor for EventDrivenInteractionBuilder(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EBC07CF0);
}

uint64_t sub_1C69B5CDC()
{
  uint64_t result = sub_1C69E1818();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for EventDrivenInteractionBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EventDrivenInteractionBuilder);
}

uint64_t dispatch thunk of EventDrivenInteractionBuilder.__allocating_init(event:inAppIdentifier:deviceState:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for CatPropertyKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CatPropertyKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C69B5EF8);
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

unsigned char *sub_1C69B5F20(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for CatPropertyKeys()
{
}

uint64_t type metadata accessor for StateStoreInteractionBuilder()
{
  return self;
}

uint64_t sub_1C69B5F5C()
{
  return type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(0);
}

uint64_t type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EA442F80);
}

void sub_1C69B5F84()
{
  sub_1C69B6020();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1C69B6020()
{
  if (!qword_1EA442F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA442F98);
    unint64_t v0 = sub_1C69E1F18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA442F90);
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

_OWORD *sub_1C69B60C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C69B60D4()
{
  return swift_release();
}

uint64_t sub_1C69B60DC()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = swift_task_alloc();
  unsigned int v6 = (void *)OUTLINED_FUNCTION_28(v5);
  void *v6 = v7;
  v6[1] = sub_1C6995B5C;
  return sub_1C69B334C(v4, v2, v0);
}

uint64_t sub_1C69B617C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C69B61C4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_28(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_1C6995B5C;
  uint64_t v5 = OUTLINED_FUNCTION_47();
  return sub_1C69B3D80(v5, v6, v7, v8, v9, v1);
}

uint64_t sub_1C69B626C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C69B62B4()
{
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_48();
  return sub_1C69B4AE0(v3, v4, v5, v6, v7);
}

uint64_t sub_1C69B6360(uint64_t a1)
{
  return sub_1C69B4D64(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1C69B636C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  OUTLINED_FUNCTION_5_4();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 40) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = (((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v9 + 8, v8);
}

uint64_t sub_1C69B6450()
{
  OUTLINED_FUNCTION_32();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  OUTLINED_FUNCTION_2_0(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_28(v1);
  void *v2 = v3;
  v2[1] = sub_1C6991498;
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_50();
  return sub_1C69B4F60(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1C69B6554(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69B65BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 80) | 7;
  OUTLINED_FUNCTION_37_0();
  v2();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_58();
  return MEMORY[0x1F4186498](v3, v4, v1);
}

uint64_t sub_1C69B6658(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F98);
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = v1 + v8;
  uint64_t v10 = (uint64_t *)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  return sub_1C69B5670(a1, v9, v11, v12);
}

uint64_t sub_1C69B66D8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C69B6718()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1C69959BC;
  uint64_t v5 = (uint64_t *)OUTLINED_FUNCTION_24_1();
  return sub_1C69AEDEC(v5, v6, v2, v3);
}

uint64_t sub_1C69B67C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_85();
  v4();
  return a2;
}

uint64_t sub_1C69B6818(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1C69B6B34(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69B68A8()
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = *v0;
  *uint64_t v0 = 0x8000000000000000;
  uint64_t v1 = OUTLINED_FUNCTION_53();
  sub_1C69B6C74(v1, v2);
  *uint64_t v0 = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69B6924(long long *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1C69B6E04(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69B69B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v24 = a2;
  uint64_t v7 = sub_1C69E0E48();
  OUTLINED_FUNCTION_5_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v3;
  unint64_t v13 = sub_1C69A8910();
  if (__OFADD__(*(void *)(v12 + 16), (v14 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v15 = v13;
  char v16 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B30);
  if ((sub_1C69E2058() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v17 = sub_1C69A8910();
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_10:
    uint64_t result = sub_1C69E21B8();
    __break(1u);
    return result;
  }
  unint64_t v15 = v17;
LABEL_5:
  uint64_t v19 = *v4;
  if (v16)
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v19 + 56) + 16 * v15);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v22 = v24;
    *uint64_t v20 = a1;
    v20[1] = v22;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a3, v7);
    return sub_1C69B6F48(v15, (uint64_t)v11, a1, v24, v19);
  }
  return result;
}

_OWORD *sub_1C69B6B34(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1C69A89DC(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430E0);
  if ((sub_1C69E2058() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1C69A89DC(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1C69E21B8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    char v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_1C69B60C4(a1, v16);
  }
  else
  {
    sub_1C69B6FFC(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C69B6C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_1C69E1818();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (void *)*v2;
  unint64_t v11 = sub_1C69A8A54();
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D78);
  if ((sub_1C69E2058() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1C69A8A54();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_1C69E21B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  unint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = v17[7];
    uint64_t result = swift_release();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1C69B7068(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

_OWORD *sub_1C69B6E04(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1C69A89DC(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443090);
  if ((sub_1C69E2058() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1C69A89DC(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1C69E21B8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    char v16 = (_OWORD *)(v15[7] + 48 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_1C69A4B74(a1, v16);
  }
  else
  {
    sub_1C69B7120(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C69B6F48(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a5 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  sub_1C69E0E48();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_85();
  uint64_t result = v9();
  unint64_t v11 = (void *)(*(void *)(a5 + 56) + 16 * a1);
  void *v11 = a3;
  v11[1] = a4;
  uint64_t v12 = *(void *)(a5 + 16);
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    *(void *)(a5 + 16) = v14;
  }
  return result;
}

_OWORD *sub_1C69B6FFC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1C69B60C4(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_1C69B7068(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1C69E1818();
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

_OWORD *sub_1C69B7120(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1C69A4B74(a4, (_OWORD *)(a5[7] + 48 * a1));
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

uint64_t sub_1C69B7190(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v30 = (long long *)&v29;
  uint64_t v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1C69B73AC(v6, (uint64_t)v28, &qword_1EA442EF0);
    uint64_t v7 = v28[0];
    uint64_t v8 = v28[1];
    sub_1C69A4B74(v30, v27);
    uint64_t v9 = *a3;
    unint64_t v11 = sub_1C69A89DC(v7, v8);
    uint64_t v12 = *(void *)(v9 + 16);
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (*(void *)(v9 + 24) >= v14)
    {
      if (a2)
      {
        if (v10) {
          goto LABEL_10;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443090);
        sub_1C69E2068();
        if (v15) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      sub_1C69A9180(v14, a2 & 1);
      unint64_t v16 = sub_1C69A89DC(v7, v8);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_20;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_10:
        sub_1C69B7580(*(void *)(*a3 + 56) + 48 * v11, (uint64_t)v25);
        sub_1C69B7580((uint64_t)v25, (uint64_t)v26);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
        swift_bridgeObjectRelease();
        uint64_t v18 = (_OWORD *)(*(void *)(*a3 + 56) + 48 * v11);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        sub_1C69A4B74(v26, v18);
        goto LABEL_14;
      }
    }
    uint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v7;
    v20[1] = v8;
    sub_1C69A4B74(v27, (_OWORD *)(v19[7] + 48 * v11));
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_19;
    }
    v19[2] = v23;
LABEL_14:
    v6 += 64;
    a2 = 1;
    if (!--v3) {
      return swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_1C69E21B8();
  __break(1u);
  return result;
}

uint64_t sub_1C69B73AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_1C69B7408()
{
  unint64_t result = qword_1EA4430C0;
  if (!qword_1EA4430C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4430C0);
  }
  return result;
}

uint64_t sub_1C69B7454(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C69B749C()
{
  unint64_t result = qword_1EA4430D8;
  if (!qword_1EA4430D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA4430D8);
  }
  return result;
}

uint64_t sub_1C69B74DC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_37_0();
  v3();
  return a1;
}

uint64_t sub_1C69B752C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = *(void *)(OUTLINED_FUNCTION_78(a1, a2) + 32);
  OUTLINED_FUNCTION_9_2();
  (*v3)(v2);
  return v2;
}

uint64_t sub_1C69B7580(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(OUTLINED_FUNCTION_78(a1, a2) + 32);
  OUTLINED_FUNCTION_9_2();
  (*v3)(v2);
  return v2;
}

unint64_t sub_1C69B75D4()
{
  unint64_t result = qword_1EA443108;
  if (!qword_1EA443108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443108);
  }
  return result;
}

unsigned char *sub_1C69B7620(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1C69B76ECLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for StateStoreInteractionBuilder.Errors()
{
}

unint64_t sub_1C69B7724()
{
  unint64_t result = qword_1EA443110;
  if (!qword_1EA443110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443110);
  }
  return result;
}

void OUTLINED_FUNCTION_11_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return swift_dynamicCast();
}

BOOL OUTLINED_FUNCTION_19_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_28_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31_1(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C69E1C48();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return v0 + 16;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return v0;
}

void OUTLINED_FUNCTION_39(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

_WORD *OUTLINED_FUNCTION_40(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return *(void *)(v0 + 352);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_1C69E1CD8();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_1C69A8148(v2, v3, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_66()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_68()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_72(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void OUTLINED_FUNCTION_74(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) |= v1;
}

uint64_t OUTLINED_FUNCTION_75(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

double OUTLINED_FUNCTION_76()
{
  *(void *)(v0 + 176) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_78(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_82(uint64_t a1)
{
  *(void *)(v1 + 440) = a1;
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_83(uint64_t a1)
{
  *(void *)(v1 + 424) = a1;
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

void OUTLINED_FUNCTION_88(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_89(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t sub_1C69B7D10(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_1C69A8910();
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void *)(*(void *)(a2 + 56) + 16 * v3);
  swift_bridgeObjectRetain();
  return v5;
}

double sub_1C69B7D68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1C69A89DC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1C69A973C(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_1C69B7DCC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_1C69A8A54(), (v2 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_1C69B7E10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1C69A89DC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 48 * v6;
    sub_1C69A4C84(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    a4[1] = 0u;
    a4[2] = 0u;
    *a4 = 0u;
  }
  return result;
}

uint64_t sub_1C69B7E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C69A89DC(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

unint64_t DirectInvocationUserDataKey.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0x697461636F766E69;
      break;
    case 4:
      unint64_t result = 0x6F43676F6C616964;
      break;
    case 5:
      unint64_t result = 0x6974736567677573;
      break;
    default:
      unint64_t result = 0x6E6F69746361;
      break;
  }
  return result;
}

SiriSuggestionsSupport::DirectInvocationAction_optional __swiftcall DirectInvocationAction.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_1C69E20F8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t DirectInvocationAction.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x69726953776F6873;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

SiriSuggestionsSupport::DirectInvocationUserDataKey_optional __swiftcall DirectInvocationUserDataKey.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_1C69E20F8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_1C69B80F0(unsigned __int8 *a1, char *a2)
{
  return sub_1C69DA538(*a1, *a2);
}

uint64_t sub_1C69B80FC()
{
  return sub_1C69DAAB8(*v0);
}

uint64_t sub_1C69B8104(uint64_t a1)
{
  return sub_1C69DAB38(a1, *v1);
}

uint64_t sub_1C69B810C(uint64_t a1)
{
  return sub_1C69DAE44(a1, *v1);
}

SiriSuggestionsSupport::DirectInvocationUserDataKey_optional sub_1C69B8114(Swift::String *a1)
{
  return DirectInvocationUserDataKey.init(rawValue:)(*a1);
}

unint64_t sub_1C69B8120@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationUserDataKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C69B8148(unsigned __int8 *a1, char *a2)
{
  return sub_1C69DA724(*a1, *a2);
}

uint64_t sub_1C69B8154()
{
  return sub_1C69DAAD0(*v0);
}

uint64_t sub_1C69B815C()
{
  return sub_1C69DAC38();
}

uint64_t sub_1C69B8164(uint64_t a1)
{
  return sub_1C69DAE2C(a1, *v1);
}

SiriSuggestionsSupport::DirectInvocationAction_optional sub_1C69B816C(Swift::String *a1)
{
  return DirectInvocationAction.init(rawValue:)(*a1);
}

unint64_t sub_1C69B8178@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id static DirectInvocationFactory.createExecute(suggestion:)()
{
  sub_1C69E1438();
  id v0 = v18;
  sub_1C699DCBC((uint64_t)&v16);
  if (v0)
  {
    sub_1C69E0568();
    swift_allocObject();
    sub_1C69E0558();
    sub_1C69E1458();
    sub_1C69B8D88(&qword_1EA443118, MEMORY[0x1E4FA4498]);
    uint64_t v1 = sub_1C69E0548();
    unint64_t v3 = v2;
    sub_1C69B8C70(v1, v2);
    uint64_t v4 = sub_1C69E0618();
    unint64_t v6 = v5;
    sub_1C69A36B4(v1, v3);
    swift_release();
    sub_1C69A36B4(v1, v3);
    sub_1C69B8CC8();
    id v7 = sub_1C69B84D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443128);
    uint64_t inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_1_4(inited, (__n128)xmmword_1C69E3560);
    uint64_t v16 = v9;
    unint64_t v17 = v10;
    unint64_t v11 = MEMORY[0x1E4FBB1A0];
    sub_1C69E1F98();
    inited[6].n128_u64[0] = v11;
    inited[4].n128_u64[1] = 0xD000000000000011;
    inited[5].n128_u64[0] = 0x80000001C69E44E0;
    uint64_t v16 = 0x6974736567677573;
    unint64_t v17 = 0xEA00000000006E6FLL;
    sub_1C69E1F98();
    inited[10].n128_u64[1] = v11;
    inited[9].n128_u64[0] = v4;
    inited[9].n128_u64[1] = v6;
    uint64_t v12 = sub_1C69E1C98();
    sub_1C69B8D08(v12, v7);
    BOOL v13 = self;
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1FA8]), sel_init);
    id v0 = objc_msgSend(v13, sel_runSiriKitExecutorCommandWithContext_payload_, v14, v7);
  }
  return v0;
}

id sub_1C69B84D4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1C69E1CE8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

id static DirectInvocationFactory.createShowMore(suggestions:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = sub_1C69E1758();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_19();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_1C69E12E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v38 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_19();
  uint64_t v16 = v15 - v14;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x1E4FA4790], v4);
  uint64_t v17 = sub_1C69E0678();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v17);
  sub_1C69E1298();
  sub_1C69E0568();
  swift_allocObject();
  sub_1C69E0558();
  sub_1C69B8D88(&qword_1EA443130, MEMORY[0x1E4FA43F0]);
  uint64_t v18 = sub_1C69E0548();
  unint64_t v20 = v19;
  sub_1C69B8C70(v18, v19);
  uint64_t v37 = sub_1C69E0618();
  unint64_t v22 = v21;
  sub_1C69A36B4(v18, v20);
  swift_release();
  sub_1C69A36B4(v18, v20);
  swift_allocObject();
  sub_1C69E0558();
  sub_1C69E1538();
  sub_1C69B8D88(&qword_1EBC07C10, MEMORY[0x1E4FA44C8]);
  uint64_t v24 = sub_1C69E0548();
  unint64_t v26 = v25;
  sub_1C69B8C70(v24, v25);
  uint64_t v36 = sub_1C69E0618();
  unint64_t v28 = v27;
  sub_1C69A36B4(v24, v26);
  swift_release();
  sub_1C69A36B4(v24, v26);
  sub_1C69B8CC8();
  id v29 = sub_1C69B84D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443128);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_1_4(inited, (__n128)xmmword_1C69E37B0);
  unint64_t v31 = MEMORY[0x1E4FBB1A0];
  OUTLINED_FUNCTION_2_5();
  inited[6].n128_u64[0] = v31;
  inited[4].n128_u64[1] = 0xD000000000000013;
  inited[5].n128_u64[0] = 0x80000001C69E4500;
  OUTLINED_FUNCTION_2_5();
  inited[10].n128_u64[1] = v31;
  inited[9].n128_u64[0] = v37;
  inited[9].n128_u64[1] = v22;
  OUTLINED_FUNCTION_2_5();
  inited[15].n128_u64[0] = v31;
  inited[13].n128_u64[1] = v36;
  inited[14].n128_u64[0] = v28;
  uint64_t v32 = sub_1C69E1C98();
  sub_1C69B8D08(v32, v29);
  unint64_t v33 = self;
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1FA8]), sel_init);
  id v35 = objc_msgSend(v33, sel_runSiriKitExecutorCommandWithContext_payload_, v34, v29);

  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v16, v11);
  return v35;
}

uint64_t Parse.DirectInvocation.getUserData(for:)@<X0>(unsigned __int8 *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = sub_1C69E08C8();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = 0x80000001C69E4550;
    unint64_t v7 = 0xD000000000000013;
    switch(v3)
    {
      case 1:
        break;
      case 2:
        unint64_t v7 = 0xD000000000000016;
        uint64_t v6 = 0x80000001C69E4570;
        break;
      case 3:
        uint64_t v6 = 0xEE00657079546E6FLL;
        uint64_t v8 = 0x61636F766E69;
        goto LABEL_9;
      case 4:
        uint64_t v6 = 0xEF6449747865746ELL;
        unint64_t v7 = 0x6F43676F6C616964;
        break;
      case 5:
        uint64_t v6 = 0xEA00000000006E6FLL;
        uint64_t v8 = 0x736567677573;
LABEL_9:
        unint64_t v7 = v8 & 0xFFFFFFFFFFFFLL | 0x6974000000000000;
        break;
      default:
        uint64_t v6 = 0xE600000000000000;
        unint64_t v7 = 0x6E6F69746361;
        break;
    }
    sub_1C69B7D68(v7, v6, v5, a2);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1C69B8C70(uint64_t a1, unint64_t a2)
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

unint64_t sub_1C69B8CC8()
{
  unint64_t result = qword_1EA443120;
  if (!qword_1EA443120)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA443120);
  }
  return result;
}

void sub_1C69B8D08(uint64_t a1, void *a2)
{
  id v3 = (id)sub_1C69E1C78();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);
}

uint64_t sub_1C69B8D88(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C69B8DD4()
{
  unint64_t result = qword_1EA443138;
  if (!qword_1EA443138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443138);
  }
  return result;
}

unint64_t sub_1C69B8E24()
{
  unint64_t result = qword_1EA443140;
  if (!qword_1EA443140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443140);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DirectInvocationUserDataKey(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DirectInvocationUserDataKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C69B8FC4);
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

void type metadata accessor for DirectInvocationUserDataKey()
{
}

uint64_t getEnumTagSinglePayload for DirectInvocationAction(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DirectInvocationAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C69B914CLL);
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

void type metadata accessor for DirectInvocationAction()
{
}

void type metadata accessor for DirectInvocationFactory()
{
}

__n128 *OUTLINED_FUNCTION_1_4(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_1C69E1F98();
}

id SiriSuggestionsServiceDelegate.__allocating_init(with:eventDrivenClient:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)(a1, a2);
}

id SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_client] = a1;
  sub_1C6995840(a2, (uint64_t)&v2[OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient]);
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SiriSuggestionsServiceDelegate();
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t type metadata accessor for SiriSuggestionsServiceDelegate()
{
  return self;
}

uint64_t sub_1C69B92A4(int a1, id a2)
{
  uint64_t v3 = v2;
  objc_msgSend(a2, sel_processIdentifier);
  sub_1C69E1038();
  sub_1C69E1028();
  id v5 = (void *)sub_1C69E1CE8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(a2, sel_valueForEntitlement_, v5);

  if (v6)
  {
    sub_1C69E1F78();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  sub_1C69B9778((uint64_t)&v33, (uint64_t)&v31);
  if (v32)
  {
    if (OUTLINED_FUNCTION_1_5() & 1) != 0 && (v29)
    {
      sub_1C69E1018();
      BOOL v7 = (void *)sub_1C69E1CE8();
      swift_bridgeObjectRelease();
      id v8 = objc_msgSend(a2, sel_valueForEntitlement_, v7);

      if (v8)
      {
        sub_1C69E1F78();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
      }
      sub_1C69B9778((uint64_t)&v33, (uint64_t)&v31);
      if (v32)
      {
        int v15 = OUTLINED_FUNCTION_1_5();
        if (v15) {
          uint64_t v16 = v29;
        }
        else {
          uint64_t v16 = 0;
        }
        if (v15) {
          uint64_t v17 = v30;
        }
        else {
          uint64_t v17 = 0;
        }
      }
      else
      {
        sub_1C69B97E0((uint64_t)&v31);
        uint64_t v16 = 0;
        uint64_t v17 = 0;
      }
      uint64_t v18 = self;
      unint64_t v19 = objc_msgSend(v18, sel_interfaceWithProtocol_, &unk_1F21944C0);
      uint64_t v10 = objc_msgSend(v18, sel_interfaceWithProtocol_, &unk_1F2194838);
      [v19 setInterface:v10 forSelector:sel_getSuggestionsForAppWithAppBundleId_placementId_entities_intentToSuggest_bridge_completionHandler_ argumentIndex:4 ofReply:0];
      objc_msgSend(a2, sel_setExportedInterface_, v19);
      uint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_client);
      sub_1C6995840(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient, (uint64_t)&v31);
      uint64_t v21 = qword_1EBC079A0;
      swift_retain();
      if (v21 != -1) {
        swift_once();
      }
      uint64_t v22 = qword_1EBC07CB0;
      type metadata accessor for XPCAccessList();
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v22;
      type metadata accessor for SiriSuggestionsXPCService();
      swift_allocObject();
      uint64_t v24 = sub_1C69D0AF8(v20, &v31, v16, v17, v23);
      swift_bridgeObjectRetain();
      objc_msgSend(a2, sel_setExportedObject_, v24);
      swift_release();
      objc_msgSend(a2, sel_resume);
      if (qword_1EBC08528[0] != -1) {
        swift_once();
      }
      uint64_t v25 = sub_1C69E1C68();
      __swift_project_value_buffer(v25, (uint64_t)qword_1EBC085A8);
      unint64_t v26 = sub_1C69E1C48();
      os_log_type_t v27 = sub_1C69E1EC8();
      if (os_log_type_enabled(v26, v27))
      {
        unint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v28 = 67240192;
        OUTLINED_FUNCTION_0_0();
        _os_log_impl(&dword_1C698D000, v26, v27, "process [%{public}d] is connected to siri suggestions xpc service", v28, 8u);
        MEMORY[0x1C87A7AA0](v28, -1, -1);

        uint64_t v13 = 1;
      }
      else
      {

        uint64_t v13 = 1;
        uint64_t v10 = v19;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_1C69B97E0((uint64_t)&v31);
  }
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C69E1C68();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBC085A8);
  uint64_t v10 = sub_1C69E1C48();
  os_log_type_t v11 = sub_1C69E1EE8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67240192;
    OUTLINED_FUNCTION_0_0();
    _os_log_impl(&dword_1C698D000, v10, v11, "process [%{public}d] is not entitled to call the Siri Suggestions service.\nAdd the proper entitlements and try again.", v12, 8u);
    MEMORY[0x1C87A7AA0](v12, -1, -1);
  }
  uint64_t v13 = 0;
LABEL_15:

  return v13;
}

uint64_t sub_1C69B9778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBC07810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69B97E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBC07810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SiriSuggestionsServiceDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SiriSuggestionsServiceDelegate.init()()
{
}

id SiriSuggestionsServiceDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSuggestionsServiceDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C69B9994()
{
  return sub_1C69E1F28();
}

uint64_t sub_1C69B99BC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t method lookup function for SiriSuggestionsServiceDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SiriSuggestionsServiceDelegate);
}

uint64_t dispatch thunk of SiriSuggestionsServiceDelegate.__allocating_init(with:eventDrivenClient:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SiriSuggestionsServiceDelegate.listener(_:shouldAcceptNewConnection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_dynamicCast();
}

uint64_t sub_1C69B9A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a2;
  uint64_t v34 = a4;
  uint64_t v27 = sub_1C69E1458();
  uint64_t v7 = *(void *)(v27 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v27);
  uint64_t v32 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t v35 = MEMORY[0x1E4FBC860];
  uint64_t v31 = *(void *)(a1 + 16);
  if (v31)
  {
    unint64_t v14 = 0;
    uint64_t v25 = a3;
    unint64_t v26 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v30 = v7 + 16;
    uint64_t v24 = a1;
    uint64_t v15 = v27;
    while (v14 < *(void *)(a1 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v17 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a1 + v16 + v17 * v14, v15);
      char v18 = sub_1C69BEF34((uint64_t)v12, v33, a3);
      if (v4)
      {
        (*v26)(v12, v15);
        swift_bridgeObjectRelease();
        uint64_t v13 = v35;
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if (v18)
      {
        unint64_t v28 = *v29;
        v28(v32, v12, v15);
        uint64_t v19 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C69C336C();
          uint64_t v19 = v35;
        }
        unint64_t v20 = *(void *)(v19 + 16);
        if (v20 >= *(void *)(v19 + 24) >> 1)
        {
          sub_1C69C336C();
          uint64_t v19 = v35;
        }
        *(void *)(v19 + 16) = v20 + 1;
        unint64_t v21 = v19 + v16 + v20 * v17;
        uint64_t v22 = v27;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v28)(v21, v32, v27);
        uint64_t v35 = v19;
        uint64_t v15 = v22;
        a1 = v24;
        a3 = v25;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v26)(v12, v15);
      }
      if (v31 == ++v14)
      {
        uint64_t v13 = v35;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_1C69B9D5C(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_1C69C570C(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C69B9DCC(uint64_t a1, unint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1C69E2098();
  swift_bridgeObjectRelease();
LABEL_4:
  uint64_t result = sub_1C69C570C(0, v3, v5);
  if (v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = result;
  }
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C69E2098();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 < 0)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C69E2098();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    sub_1C69C5C68(0, &qword_1EA4432D0);
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      sub_1C69E1FC8();
      uint64_t v11 = v12;
    }
    while (v8 != v12);
  }
  if (!v4) {
    return v2 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1C69E20A8();
  swift_bridgeObjectRelease_n();
  return v13;
}

void sub_1C69B9F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v67 = v21;
  uint64_t v23 = v22;
  uint64_t v60 = v22;
  uint64_t v62 = v24;
  uint64_t v64 = v25;
  uint64_t v27 = v26;
  uint64_t v66 = v28;
  uint64_t v30 = v29;
  sub_1C69E05E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v32 = v31;
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_23_2();
  uint64_t v36 = v34 - v35;
  MEMORY[0x1F4188790](v37);
  sub_1C69E1968();
  uint64_t v65 = sub_1C69E1958();
  sub_1C69BA920();
  type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  uint64_t v38 = *(void (**)(uint64_t))(v32 + 16);
  uint64_t v39 = OUTLINED_FUNCTION_14_2();
  v38(v39);
  sub_1C69C6114(v23, (uint64_t)v69);
  id v40 = v30;
  uint64_t v41 = OUTLINED_FUNCTION_59_0();
  uint64_t v61 = sub_1C699262C(v41, v42, v43);
  uint64_t v44 = OUTLINED_FUNCTION_14_2();
  v38(v44);
  sub_1C69C6114(v62, (uint64_t)v69);
  type metadata accessor for SiriHelpResponseFramework1Invoker(0);
  swift_allocObject();
  id v63 = v40;
  sub_1C69C5ECC(v27);
  uint64_t v45 = OUTLINED_FUNCTION_59_0();
  uint64_t v48 = sub_1C6991558(v45, v46, v47, v27, v64);
  uint64_t v49 = OUTLINED_FUNCTION_14_2();
  v38(v49);
  sub_1C69C6114(v60, (uint64_t)v69);
  swift_allocObject();
  uint64_t v50 = OUTLINED_FUNCTION_59_0();
  uint64_t v53 = sub_1C6992550(v50, v51, v52, 1);
  type metadata accessor for SiriHelpResponseVersionInvoker();
  uint64_t v54 = (void *)swift_allocObject();
  uint64_t v55 = sub_1C69C6080(v65, v48, v61, v53, v54);
  sub_1C69C6114(v66, (uint64_t)v69);
  uint64_t v56 = OUTLINED_FUNCTION_14_2();
  v38(v56);
  sub_1C69C6114(a21, (uint64_t)v68);
  uint64_t v57 = swift_allocObject();
  id v58 = v63;
  swift_retain();
  swift_retain();
  sub_1C69C5EDC((uint64_t)v55, (uint64_t)v30, (uint64_t)v69, v67, v36, (uint64_t)v68, v65, v57);
  OUTLINED_FUNCTION_37_0();
  v59();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69BA200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C69BA218(a1, MEMORY[0x1E4FA2858], a2);
}

uint64_t sub_1C69BA218@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = a2(0);
  if (v4)
  {
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_33_1();
    v6();
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v7, 1, v5);
}

void sub_1C69BA2BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v31 = a5;
  uint64_t v30 = sub_1C69E0E28();
  uint64_t v33 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a3;
  int64_t v32 = a4 >> 1;
  BOOL v11 = __OFSUB__(a4 >> 1, a3);
  uint64_t v12 = (a4 >> 1) - a3;
  if (v11) {
    goto LABEL_19;
  }
  if (v12)
  {
    uint64_t v35 = MEMORY[0x1E4FBC860];
    sub_1C69C33D0();
    if (v12 < 0)
    {
LABEL_20:
      __break(1u);
      return;
    }
    uint64_t v25 = v5;
    uint64_t v13 = v35;
    unint64_t v14 = self;
    uint64_t v15 = 0;
    uint64_t v27 = v33 + 32;
    id v28 = v14;
    uint64_t v26 = a2 + 8 * v34;
    uint64_t v29 = v12;
    while (1)
    {
      uint64_t v16 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      if (v34 + v15 >= v32 || v15 >= v12) {
        goto LABEL_18;
      }
      id v18 = *(id *)(v26 + 8 * v15);
      id v19 = objc_msgSend(v18, sel_fullPrint);
      sub_1C69E1CF8();

      sub_1C69E0D98();
      id v20 = objc_msgSend(v18, sel_fullPrint);
      if (!v20)
      {
        sub_1C69E1CF8();
        id v20 = (id)sub_1C69E1CE8();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      uint64_t v21 = (void *)sub_1C69E1CE8();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v28, sel_quote_forLocale_, v20, v21);

      sub_1C69E1CF8();
      sub_1C69E0DF8();
      id v23 = objc_msgSend(v18, sel_dialogId);
      sub_1C69E1CF8();

      sub_1C69E0DA8();
      uint64_t v35 = v13;
      unint64_t v24 = *(void *)(v13 + 16);
      if (v24 >= *(void *)(v13 + 24) >> 1)
      {
        sub_1C69C33D0();
        uint64_t v13 = v35;
      }
      *(void *)(v13 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v13+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v24, v10, v30);
      ++v15;
      uint64_t v12 = v29;
      if (v16 == v29) {
        return;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
}

uint64_t sub_1C69BA5F0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v22 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = sub_1C69E0E28();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  if (v11)
  {
    uint64_t v24 = MEMORY[0x1E4FBC860];
    sub_1C69C33D0();
    uint64_t v12 = v24;
    uint64_t v13 = sub_1C69E1458();
    OUTLINED_FUNCTION_2_0(v13);
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    uint64_t v20 = *(void *)(v16 + 72);
    while (1)
    {
      sub_1C69BF5DC(v15, v22);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v24 = v12;
      unint64_t v17 = *(void *)(v12 + 16);
      if (v17 >= *(void *)(v12 + 24) >> 1)
      {
        sub_1C69C33D0();
        uint64_t v12 = v24;
      }
      *(void *)(v12 + 16) = v17 + 1;
      OUTLINED_FUNCTION_28_2();
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v18 + *(void *)(v7 + 72) * v17, v10, v21);
      v15 += v20;
      if (!--v11) {
        return v12;
      }
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_1C69BA7A0(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1C69E2098())
  {
    uint64_t v7 = 4;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x1C87A7240](v7 - 4, a3);
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7);
        swift_retain();
      }
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v12 = v8;
      char v10 = a1(&v12);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return v8;
      }
      if (v10)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
      swift_release();
      ++v7;
      if (v9 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1C69BA8D4()
{
  return 0xD000000000000011;
}

void sub_1C69BA8F0()
{
  algn_1EA443228[7] = -18;
}

void sub_1C69BA920()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v36 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AF0);
  uint64_t v4 = OUTLINED_FUNCTION_44(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_49_0();
  uint64_t v5 = sub_1C69E05E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_36_0();
  uint64_t v38 = v9;
  OUTLINED_FUNCTION_84_0();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v36 - v13;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_78_0();
  MEMORY[0x1F4188790](v15);
  unint64_t v17 = (char *)&v36 - v16;
  sub_1C69E05C8();
  sub_1C69E0588();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void (**)(void))(v7 + 16);
  OUTLINED_FUNCTION_39_0();
  v18();
  sub_1C69E05B8();
  sub_1C69C5C68(0, &qword_1EA4432F8);
  uint64_t v39 = v0;
  OUTLINED_FUNCTION_39_0();
  v18();
  id v19 = sub_1C69BADA8((uint64_t)v14);
  uint64_t v20 = self;
  id v37 = v19;
  id v21 = objc_msgSend(v20, sel_bundleTemplateDir_, v19);
  if (v21)
  {
    id v22 = v21;
    sub_1C69E1CF8();

    sub_1C69E0598();
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v5);
  }
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_39_0();
  v18();
  OUTLINED_FUNCTION_71(v1, 1, v5);
  uint64_t v23 = v36;
  if (v24)
  {
    OUTLINED_FUNCTION_15_1();
    v25();
    sub_1C69B74DC(v1, &qword_1EA442AF0);
  }
  else
  {
    OUTLINED_FUNCTION_13();
    v26();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v23, v1, v5);
  }
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_1C69E1C68();
  __swift_project_value_buffer(v27, (uint64_t)qword_1EBC085C0);
  OUTLINED_FUNCTION_39_0();
  v18();
  id v28 = sub_1C69E1C48();
  os_log_type_t v29 = sub_1C69E1EC8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v31 = OUTLINED_FUNCTION_25_1();
    uint64_t v36 = v17;
    uint64_t v40 = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    sub_1C69C5E84(&qword_1EA442B00, MEMORY[0x1E4F276F0]);
    uint64_t v32 = sub_1C69E2178();
    uint64_t v34 = sub_1C69A8148(v32, v33, &v40);
    OUTLINED_FUNCTION_75_0(v34);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void (**)(void))(v7 + 8);
    OUTLINED_FUNCTION_17_2();
    v35();
    _os_log_impl(&dword_1C698D000, v28, v29, "Creating platform safe URL: %s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {

    uint64_t v35 = *(void (**)(void))(v7 + 8);
    OUTLINED_FUNCTION_17_2();
    v35();
  }
  OUTLINED_FUNCTION_17_2();
  v35();
  OUTLINED_FUNCTION_17_2();
  v35();
  OUTLINED_FUNCTION_7_3();
}

id sub_1C69BADA8(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_1C69E05A8();
  id v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  uint64_t v5 = sub_1C69E05E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_1C69BAE44(uint64_t a1, uint64_t a2)
{
  v3[119] = v2;
  v3[118] = a2;
  v3[117] = a1;
  OUTLINED_FUNCTION_2();
  v3[120] = v6;
  uint64_t v7 = sub_1C69E1538();
  v3[121] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v3[122] = v8;
  v3[123] = *(void *)(v9 + 64);
  v3[124] = OUTLINED_FUNCTION_24();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  OUTLINED_FUNCTION_44(v10);
  v3[125] = OUTLINED_FUNCTION_24();
  uint64_t v11 = sub_1C69E08A8();
  v3[126] = v11;
  OUTLINED_FUNCTION_2_0(v11);
  v3[127] = v12;
  v3[128] = OUTLINED_FUNCTION_24();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AF0);
  OUTLINED_FUNCTION_44(v13);
  v3[129] = OUTLINED_FUNCTION_24();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443290);
  OUTLINED_FUNCTION_44(v14);
  v3[130] = OUTLINED_FUNCTION_21_2();
  v3[131] = swift_task_alloc();
  uint64_t v15 = sub_1C69E1588();
  v3[132] = v15;
  OUTLINED_FUNCTION_2_0(v15);
  v3[133] = v16;
  v3[134] = OUTLINED_FUNCTION_24();
  uint64_t v17 = sub_1C69E1598();
  v3[135] = v17;
  OUTLINED_FUNCTION_2_0(v17);
  v3[136] = v18;
  v3[137] = OUTLINED_FUNCTION_21_2();
  v3[138] = swift_task_alloc();
  uint64_t v19 = sub_1C69E15B8();
  v3[139] = v19;
  OUTLINED_FUNCTION_2_0(v19);
  v3[140] = v20;
  v3[141] = OUTLINED_FUNCTION_24();
  uint64_t v21 = sub_1C69E1458();
  v3[142] = v21;
  OUTLINED_FUNCTION_2_0(v21);
  v3[143] = v22;
  v3[144] = OUTLINED_FUNCTION_21_2();
  v3[145] = swift_task_alloc();
  v3[146] = swift_task_alloc();
  v3[147] = swift_task_alloc();
  v3[148] = swift_task_alloc();
  uint64_t v23 = sub_1C69E0CB8();
  v3[149] = v23;
  OUTLINED_FUNCTION_2_0(v23);
  v3[150] = v24;
  v3[151] = OUTLINED_FUNCTION_24();
  uint64_t v25 = sub_1C69E05E8();
  v3[152] = v25;
  OUTLINED_FUNCTION_2_0(v25);
  v3[153] = v26;
  v3[154] = OUTLINED_FUNCTION_21_2();
  v3[155] = swift_task_alloc();
  v3[156] = swift_task_alloc();
  uint64_t v27 = sub_1C69E0F78();
  v3[157] = v27;
  OUTLINED_FUNCTION_2_0(v27);
  v3[158] = v28;
  v3[159] = OUTLINED_FUNCTION_21_2();
  v3[160] = swift_task_alloc();
  os_log_type_t v29 = (void *)swift_task_alloc();
  v3[161] = v29;
  *os_log_type_t v29 = v3;
  v29[1] = sub_1C69BB18C;
  return sub_1C69BDBC0(a1, a2);
}

uint64_t sub_1C69BB18C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  v1[67] = v0;
  v1[68] = v3;
  v1[69] = v4;
  v1[70] = v5;
  v1[71] = v6;
  void *v2 = *v0;
  v1[162] = v3;
  v1[163] = v4;
  v1[164] = v6;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69BB278()
{
  uint64_t v114 = v0;
  uint64_t v1 = *(void *)(v0 + 952);
  swift_bridgeObjectRetain();
  sub_1C69E0F68();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  if (v2)
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  }
  else
  {
    sub_1C69E0C28();
    uint64_t v3 = (void *)sub_1C69E0C18();
    uint64_t v2 = 0;
  }
  *(void *)(v0 + 1320) = v3;
  *(void *)(v0 + 872) = 0;
  *(void *)(v0 + 880) = 0xE000000000000000;
  id v4 = v2;
  uint64_t v5 = sub_1C69E0BD8();
  sub_1C69B7D68(0x656C61636F6CLL, 0xE600000000000000, v5, (_OWORD *)(v0 + 576));
  swift_bridgeObjectRelease();
  uint64_t v6 = &unk_1EBC08000;
  uint64_t v112 = v0;
  if (!*(void *)(v0 + 600))
  {
    sub_1C69B74DC(v0 + 576, qword_1EBC07810);
LABEL_8:
    if (qword_1EBC085D8 == -1) {
      goto LABEL_9;
    }
    goto LABEL_81;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(v0 + 888);
  uint64_t v8 = *(void *)(v0 + 896);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 872) = v7;
  *(void *)(v0 + 880) = v8;
  while (1)
  {
    uint64_t v111 = *(void **)(*(void *)(v0 + 1296) + 16);
    if (!v111) {
      break;
    }
    uint64_t v107 = v0 + 176;
    uint64_t v109 = *(void *)(v0 + 1296);
    sub_1C69E14E8();
    if (qword_1EA442910 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_70_0();
    sub_1C69BEAD0();
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
    sub_1C69E14E8();
    swift_bridgeObjectRetain();
    sub_1C69BEAD0();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
    BOOL v25 = v18 == v22 && v20 == v24;
    uint64_t v96 = v24;
    uint64_t v97 = v22;
    if (v25)
    {
      char v27 = 1;
      uint64_t v26 = v18;
    }
    else
    {
      uint64_t v26 = v18;
      char v27 = sub_1C69E2188();
    }
    uint64_t v36 = *(void *)(v0 + 1296);
    uint64_t v37 = *(void *)(v0 + 960);
    char v102 = sub_1C69E12A8();
    sub_1C69E14E8();
    sub_1C69BEDF8(v107);
    __swift_destroy_boxed_opaque_existential_1Tm(v107);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v100 = v20;
    uint64_t v101 = v26;
    uint64_t v38 = sub_1C69B9A90(v36, v26, v20, v37);
    uint64_t v3 = *(void **)(v38 + 16);
    char v39 = (v3 != 0) & v27;
    sub_1C69E0EA8();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_1C69E1C68();
    uint64_t v41 = OUTLINED_FUNCTION_31_1(v40, (uint64_t)qword_1EBC085C0);
    os_log_type_t v42 = sub_1C69E1ED8();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 67109120;
      swift_beginAccess();
      char v44 = sub_1C69E0E98();
      swift_endAccess();
      *(_DWORD *)(v112 + 1496) = v44 & 1;
      uint64_t v0 = v112;
      sub_1C69E1F28();
      _os_log_impl(&dword_1C698D000, v41, v42, "Return fallback suggestions? %{BOOL}d", v43, 8u);
      OUTLINED_FUNCTION_17();
    }

    BOOL v45 = v26 == qword_1EA443220 && v100 == *(void *)algn_1EA443228;
    uint64_t v46 = MEMORY[0x1E4FBC860];
    if (v45 || (sub_1C69E2188() & 1) != 0 || (v39 & 1) != 0 || !v3)
    {
      swift_bridgeObjectRelease();
      uint64_t v93 = *(void *)(v0 + 1296);
LABEL_54:
      v113[0] = v93;
      swift_bridgeObjectRetain();
      uint64_t v95 = swift_bridgeObjectRetain();
      sub_1C69C121C(v95);
      uint64_t v3 = (void *)v113[0];
      uint64_t v99 = v93;
      if ((v102 & 1) == 0) {
        goto LABEL_69;
      }
      v113[0] = v46;
      uint64_t v110 = v3[2];
      if (!v110)
      {
        uint64_t v6 = (void *)v46;
LABEL_68:
        swift_bridgeObjectRelease();
        uint64_t v3 = v6;
        uint64_t v46 = MEMORY[0x1E4FBC860];
LABEL_69:
        uint64_t v105 = (uint64_t *)(v0 + 872);
        OUTLINED_FUNCTION_18_3();
        sub_1C69E0E58();
        swift_endAccess();
        int64_t v70 = v3[2];
        if (v70)
        {
          uint64_t v71 = *(void *)(v0 + 1144);
          v113[0] = v46;
          sub_1C69C3434(0, v70, 0);
          OUTLINED_FUNCTION_28_2();
          uint64_t v73 = (char *)v3 + v72;
          uint64_t v108 = *(void *)(v71 + 72);
          do
          {
            OUTLINED_FUNCTION_14();
            v74();
            sub_1C69E1408();
            uint64_t v75 = sub_1C69E1548();
            uint64_t v77 = v76;
            OUTLINED_FUNCTION_37_0();
            v78();
            OUTLINED_FUNCTION_37_0();
            v79();
            uint64_t v80 = v113[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1C69C3434(0, *(void *)(v80 + 16) + 1, 1);
              uint64_t v80 = v113[0];
            }
            unint64_t v82 = *(void *)(v80 + 16);
            unint64_t v81 = *(void *)(v80 + 24);
            if (v82 >= v81 >> 1)
            {
              BOOL v84 = OUTLINED_FUNCTION_51_0(v81);
              sub_1C69C3434((char *)v84, v82 + 1, 1);
              uint64_t v80 = v113[0];
            }
            *(void *)(v80 + 16) = v82 + 1;
            uint64_t v83 = v80 + 16 * v82;
            *(void *)(v83 + 32) = v75;
            *(void *)(v83 + 40) = v77;
            v73 += v108;
            --v70;
            uint64_t v0 = v112;
          }
          while (v70);
        }
        swift_bridgeObjectRelease();
        uint64_t v85 = *(void *)(v0 + 960);
        OUTLINED_FUNCTION_18_3();
        sub_1C69E0E88();
        swift_endAccess();
        sub_1C69BA5F0(v99, v105, v85);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_18_3();
        sub_1C69E0ED8();
        swift_endAccess();
        sub_1C69BA5F0(v95, v105, v85);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_18_3();
        sub_1C69E0E78();
        sub_1C69E0F48();
        swift_endAccess();
        *(void *)(v0 + 1400) = v100;
        *(void *)(v0 + 1392) = v101;
        *(void *)(v0 + 1384) = v96;
        *(void *)(v0 + 1376) = v97;
        *(unsigned char *)(v0 + 1500) = v102 & 1;
        uint64_t v86 = *(void *)(v0 + 952);
        uint64_t v87 = OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils;
        *(void *)(v0 + 1408) = OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils;
        __swift_project_boxed_opaque_existential_1((void *)(v86 + v87), *(void *)(v86 + v87 + 24));
        sub_1C69E1BC8();
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 416), *(void *)(v0 + 440));
        uint64_t v88 = (void *)swift_task_alloc();
        *(void *)(v0 + 1416) = v88;
        *uint64_t v88 = v0;
        v88[1] = sub_1C69BC77C;
        OUTLINED_FUNCTION_58_0();
        return MEMORY[0x1F4159E60](v89, v90, v91);
      }
      unint64_t v59 = 0;
      uint64_t v104 = (void (**)(void))(*(void *)(v0 + 1088) + 8);
      uint64_t v103 = (void (**)(void))(*(void *)(v0 + 1144) + 32);
      uint64_t v6 = (void *)MEMORY[0x1E4FBC860];
      int v106 = v3;
      while (v59 < v3[2])
      {
        OUTLINED_FUNCTION_33_1();
        v60();
        sub_1C69E1448();
        sub_1C69E15A8();
        OUTLINED_FUNCTION_37_0();
        v61();
        OUTLINED_FUNCTION_86();
        v62();
        sub_1C69C5E84(&qword_1EA4432C8, MEMORY[0x1E4FA44F8]);
        char v63 = sub_1C69E1CD8();
        uint64_t v64 = *v104;
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_46_0();
        v64();
        uint64_t v0 = v112;
        OUTLINED_FUNCTION_46_0();
        v64();
        if (v63)
        {
          uint64_t v65 = OUTLINED_FUNCTION_19_3(*(void *)(v112 + 1168));
          v66(v65);
        }
        else
        {
          uint64_t v67 = *v103;
          OUTLINED_FUNCTION_52_0();
          v67();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_66_0();
            uint64_t v6 = (void *)v113[0];
          }
          unint64_t v69 = v6[2];
          unint64_t v68 = v6[3];
          if (v69 >= v68 >> 1)
          {
            OUTLINED_FUNCTION_51_0(v68);
            sub_1C69C336C();
            uint64_t v6 = (void *)v113[0];
          }
          _OWORD v6[2] = v69 + 1;
          OUTLINED_FUNCTION_15_1();
          v67();
          v113[0] = (uint64_t)v6;
        }
        ++v59;
        uint64_t v3 = v106;
        if (v110 == v59) {
          goto LABEL_68;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v98 = v38;
      uint64_t v6 = 0;
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)(v0 + 1144);
      v113[0] = v46;
      uint64_t v49 = (void (**)(char *, uint64_t, uint64_t))(v48 + 32);
      while ((unint64_t)v6 < *(void *)(v109 + 16))
      {
        uint64_t v3 = (void *)((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
        uint64_t v50 = *(void *)(v48 + 72);
        OUTLINED_FUNCTION_33_1();
        v51();
        if (sub_1C69BF060())
        {
          uint64_t v52 = *v49;
          (*v49)(*(char **)(v0 + 1176), *(void *)(v0 + 1184), *(void *)(v0 + 1136));
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_66_0();
            uint64_t v47 = v113[0];
          }
          unint64_t v54 = *(void *)(v47 + 16);
          unint64_t v53 = *(void *)(v47 + 24);
          if (v54 >= v53 >> 1)
          {
            OUTLINED_FUNCTION_51_0(v53);
            sub_1C69C336C();
            uint64_t v47 = v113[0];
          }
          uint64_t v0 = v112;
          uint64_t v55 = *(void *)(v112 + 1176);
          uint64_t v56 = *(void *)(v112 + 1136);
          *(void *)(v47 + 16) = v54 + 1;
          v52((char *)v3 + v47 + v54 * v50, v55, v56);
          v113[0] = v47;
        }
        else
        {
          uint64_t v57 = OUTLINED_FUNCTION_19_3(*(void *)(v0 + 1184));
          v58(v57);
        }
        uint64_t v6 = (void *)((char *)v6 + 1);
        if (v111 == v6)
        {
          swift_bridgeObjectRelease();
          uint64_t v93 = v98;
          uint64_t v46 = MEMORY[0x1E4FBC860];
          goto LABEL_54;
        }
      }
    }
    __break(1u);
LABEL_81:
    swift_once();
LABEL_9:
    uint64_t v9 = sub_1C69E1C68();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EBC085C0);
    uint64_t v10 = v3;
    uint64_t v11 = sub_1C69E1C48();
    os_log_type_t v12 = sub_1C69E1EE8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      v113[0] = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v13 = 136315138;
      sub_1C69E0BD8();
      uint64_t v14 = sub_1C69E1C88();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      *(void *)(v112 + 928) = sub_1C69A8148(v14, v16, v113);
      uint64_t v0 = v112;
      sub_1C69E1F28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C698D000, v11, v12, "Missing locale in %s, setting to empty", v13, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      uint64_t v6 = (void *)&unk_1EBC08000;
      OUTLINED_FUNCTION_17();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1EA442910 != -1) {
    swift_once();
  }
  uint64_t v28 = *(void *)algn_1EA443228;
  *(void *)(v0 + 1328) = qword_1EA443220;
  *(void *)(v0 + 1336) = v28;
  uint64_t v29 = v6[187];
  swift_bridgeObjectRetain_n();
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1C69E1C68();
  uint64_t v31 = OUTLINED_FUNCTION_31_1(v30, (uint64_t)qword_1EBC085C0);
  os_log_type_t v32 = sub_1C69E1EC8();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_23_1();
    *(_WORD *)unint64_t v33 = 0;
    _os_log_impl(&dword_1C698D000, v31, v32, "[warning] Not enough suggestions returned, falling back to static suggestions", v33, 2u);
    OUTLINED_FUNCTION_17();
  }

  sub_1C69E0C78();
  sub_1C69BA920();
  *(void *)(v0 + 1344) = sub_1C69E1C98();
  *(_OWORD *)(v0 + 296) = 0u;
  *(_OWORD *)(v0 + 312) = 0u;
  *(void *)(v0 + 328) = 0;
  sub_1C69E0CA8();
  uint64_t v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 1352) = v34;
  void *v34 = v0;
  v34[1] = sub_1C69BC224;
  OUTLINED_FUNCTION_58_0();
  return MEMORY[0x1F4150808]();
}

uint64_t sub_1C69BC224()
{
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v5 = v4;
  uint64_t v6 = v2 + 296;
  *(void *)(v2 + 1360) = v7;
  *(void *)(v2 + 1368) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_67_0();
    v8();
    sub_1C69B74DC(v6, &qword_1EA442AF8);
    OUTLINED_FUNCTION_46_0();
  }
  else
  {
    OUTLINED_FUNCTION_46_0();
    v10();
    sub_1C69B74DC(v6, &qword_1EA442AF8);
    OUTLINED_FUNCTION_53_0();
  }
  v9();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1C69BC448()
{
  id v1 = objc_msgSend(*(id *)(v0 + 1360), sel_dialog);
  sub_1C69C5C68(0, &qword_1EA4432D0);
  uint64_t v2 = sub_1C69E1DB8();

  if (v2 < 0 || (v2 & 0x4000000000000000) != 0) {
    goto LABEL_15;
  }
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1C69C39C8();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1C69B9DCC(3, v3);
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    unint64_t v10 = v9;
    uint64_t v11 = sub_1C69E0E58();
    unint64_t v36 = v10;
    int64_t v14 = v10 >> 1;
    BOOL v15 = __OFSUB__(v10 >> 1, v8);
    uint64_t v16 = (v10 >> 1) - v8;
    if (v15)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      return MEMORY[0x1F4159E60](v11, v12, v13);
    }
    uint64_t v35 = v8;
    if (!v16) {
      break;
    }
    uint64_t v37 = MEMORY[0x1E4FBC860];
    uint64_t v11 = (uint64_t)sub_1C69C3434(0, v16 & ~(v16 >> 63), 0);
    if (v16 < 0) {
      goto LABEL_17;
    }
    while (v8 < v14)
    {
      id v17 = *(id *)(v6 + 8 * v8);
      id v18 = objc_msgSend(v17, sel_fullSpeak);
      uint64_t v19 = sub_1C69E1CF8();
      uint64_t v21 = v20;

      unint64_t v23 = *(void *)(v37 + 16);
      unint64_t v22 = *(void *)(v37 + 24);
      if (v23 >= v22 >> 1) {
        sub_1C69C3434((char *)(v22 > 1), v23 + 1, 1);
      }
      *(void *)(v37 + 16) = v23 + 1;
      uint64_t v24 = v37 + 16 * v23;
      *(void *)(v24 + 32) = v19;
      *(void *)(v24 + 40) = v21;
      if (v14 == ++v8) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_15:
    unint64_t v33 = swift_bridgeObjectRetain();
    unint64_t v3 = (unint64_t)sub_1C69C310C(v33);
    swift_bridgeObjectRelease();
  }
LABEL_11:
  BOOL v25 = *(void **)(v0 + 1360);
  sub_1C69E0E88();
  sub_1C69BA2BC(v4, v6, v35, v36, v0 + 872);
  sub_1C69E0ED8();
  sub_1C69E0E78();
  swift_unknownObjectRelease();

  uint64_t v26 = *(void *)(v0 + 1336);
  uint64_t v27 = *(void *)(v0 + 1328);
  *(void *)(v0 + 1400) = v26;
  *(void *)(v0 + 1392) = v27;
  *(void *)(v0 + 1384) = v26;
  *(void *)(v0 + 1376) = v27;
  *(unsigned char *)(v0 + 1500) = 1;
  uint64_t v28 = *(void *)(v0 + 952);
  uint64_t v29 = OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils;
  *(void *)(v0 + 1408) = OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils;
  __swift_project_boxed_opaque_existential_1((void *)(v28 + v29), *(void *)(v28 + v29 + 24));
  sub_1C69E1BC8();
  uint64_t v30 = *(void *)(v0 + 440);
  uint64_t v31 = *(void *)(v0 + 448);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 416), v30);
  os_log_type_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 1416) = v32;
  *os_log_type_t v32 = v0;
  v32[1] = sub_1C69BC77C;
  uint64_t v11 = v0 + 496;
  uint64_t v12 = v30;
  uint64_t v13 = v31;
  return MEMORY[0x1F4159E60](v11, v12, v13);
}

uint64_t sub_1C69BC77C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69BC844()
{
  if (*(void *)(v0 + 520))
  {
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 496), *(void *)(v0 + 520));
    OUTLINED_FUNCTION_43();
    sub_1C69E1618();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 496);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 416);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 416);
    sub_1C69B74DC(v0 + 496, &qword_1EA4432A0);
    *(_OWORD *)(v0 + 456) = 0u;
    *(_OWORD *)(v0 + 472) = 0u;
    *(void *)(v0 + 488) = 0;
  }
  uint64_t v1 = (void *)(*(void *)(v0 + 952) + *(void *)(v0 + 1408));
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_1C69E1BC8();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 1424) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1C69BC9C4;
  return MEMORY[0x1F4159E60](v0 + 336, v2, v3);
}

uint64_t sub_1C69BC9C4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69BCA8C()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v41 = v0 + 216;
  if (v1)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 336), v1);
    sub_1C69E1618();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 336);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    sub_1C69B74DC(v0 + 336, &qword_1EA4432A0);
    *(_OWORD *)(v0 + 376) = 0u;
    *(_OWORD *)(v0 + 392) = 0u;
    *(void *)(v0 + 408) = 0;
  }
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_70_0();
  sub_1C69E0EC8();
  swift_endAccess();
  sub_1C69C5D2C(v0 + 456, v0 + 256, &qword_1EA4432A8);
  uint64_t v2 = *(void *)(v0 + 1048);
  if (*(void *)(v0 + 280))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4432C0);
    uint64_t v3 = sub_1C69E0B18();
    int v4 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v2, v4 ^ 1u, 1, v3);
    OUTLINED_FUNCTION_71(v2, 1, v3);
    if (!v5)
    {
      sub_1C69E0B08();
      OUTLINED_FUNCTION_9_2();
      OUTLINED_FUNCTION_37_0();
      v6();
      goto LABEL_9;
    }
  }
  else
  {
    sub_1C69B74DC(v0 + 256, &qword_1EA4432A8);
    uint64_t v7 = sub_1C69E0B18();
    OUTLINED_FUNCTION_72(v2, v8, v9, v7);
  }
  sub_1C69B74DC(*(void *)(v0 + 1048), &qword_1EA443290);
LABEL_9:
  OUTLINED_FUNCTION_18_3();
  sub_1C69E0F58();
  swift_endAccess();
  sub_1C69C5D2C(v0 + 376, v41, &qword_1EA4432A8);
  uint64_t v10 = *(void *)(v0 + 1040);
  if (*(void *)(v0 + 240))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4432C0);
    uint64_t v11 = sub_1C69E0B18();
    int v12 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v10, v12 ^ 1u, 1, v11);
    OUTLINED_FUNCTION_71(v10, 1, v11);
    if (!v5)
    {
      sub_1C69E0B08();
      OUTLINED_FUNCTION_9_2();
      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_37_0();
      v13();
      goto LABEL_14;
    }
  }
  else
  {
    sub_1C69B74DC(v41, &qword_1EA4432A8);
    uint64_t v14 = sub_1C69E0B18();
    OUTLINED_FUNCTION_72(v10, v15, v16, v14);
  }
  sub_1C69B74DC(*(void *)(v0 + 1040), &qword_1EA443290);
LABEL_14:
  char v17 = *(unsigned char *)(v0 + 1500);
  OUTLINED_FUNCTION_18_3();
  sub_1C69E0F18();
  swift_endAccess();
  sub_1C69E12B8();
  OUTLINED_FUNCTION_18_3();
  sub_1C69E0F38();
  swift_endAccess();
  if (v17)
  {
    uint64_t v18 = *(void *)(v0 + 1224);
    uint64_t v19 = *(void *)(v0 + 1216);
    uint64_t v20 = *(void *)(v0 + 1032);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F96AC8]), sel_init);
    sub_1C69BA920();
    sub_1C69BF644();
    unint64_t v22 = *(void (**)(void))(v18 + 8);
    OUTLINED_FUNCTION_67_0();
    v22();
    OUTLINED_FUNCTION_71(v20, 1, v19);
    if (v5)
    {
      uint64_t v23 = *(void *)(v0 + 1032);

      sub_1C69B74DC(v23, &qword_1EA442AF0);
    }
    else
    {
      uint64_t v26 = *(void *)(v0 + 1240);
      uint64_t v27 = *(void *)(v0 + 1216);
      OUTLINED_FUNCTION_15_1();
      v28();
      uint64_t v29 = (void *)sub_1C69E05A8();
      objc_msgSend(v21, sel_setPunchOutUri_, v29);

      sub_1C69E1EF8();
      OUTLINED_FUNCTION_76_0();
      OUTLINED_FUNCTION_18_3();
      sub_1C69E0F28();
      swift_endAccess();

      ((void (*)(uint64_t, uint64_t))v22)(v26, v27);
    }
  }
  else
  {
    id v24 = static DirectInvocationFactory.createShowMore(suggestions:)();
    if (v24)
    {
      BOOL v25 = v24;
      sub_1C69E1EF8();
      OUTLINED_FUNCTION_18_3();
      sub_1C69E0E68();
      swift_endAccess();
    }
  }
  uint64_t v42 = *(void *)(v0 + 1280);
  uint64_t v30 = *(void *)(v0 + 1272);
  uint64_t v31 = *(void *)(v0 + 1264);
  uint64_t v32 = *(void *)(v0 + 1256);
  uint64_t v33 = *(void *)(v0 + 952);
  sub_1C69E0F88();
  __swift_project_boxed_opaque_existential_1((void *)(v33 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_featureFlagProvider), *(void *)(v33 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_featureFlagProvider + 24));
  OUTLINED_FUNCTION_45_0();
  sub_1C69E18E8();
  sub_1C69BFD94();
  uint64_t v34 = *(void *)(v33 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker + 24);
  uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v33 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker), v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v42, v32);
  uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 + 8) + **(int **)(v35 + 8));
  unint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 1432) = v36;
  void *v36 = v0;
  v36[1] = sub_1C69BD0F4;
  uint64_t v37 = *(void *)(v0 + 1272);
  uint64_t v38 = *(void *)(v0 + 1024);
  return v40(v0 + 56, v37, v38, v34, v35);
}

uint64_t sub_1C69BD0F4()
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *int v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  v3[180] = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_68_0();
  if (v0)
  {
    v3[186] = v8;
    OUTLINED_FUNCTION_13();
    v9();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3[181] = v8;
    v3[182] = v7 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    OUTLINED_FUNCTION_13();
    v10();
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1C69BD22C()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 1464) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69BD2C8;
  return MEMORY[0x1F41594A0](v0 + 56);
}

uint64_t sub_1C69BD2C8()
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *int v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  v3[184] = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3[185] = v3[70];
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69BD3D8()
{
  id v21 = *(void (**)(uint64_t, uint64_t))(v0 + 1448);
  uint64_t v18 = *(void **)(v0 + 1320);
  uint64_t v16 = *(void *)(v0 + 1312);
  uint64_t v17 = *(void *)(v0 + 1480);
  uint64_t v20 = *(void *)(v0 + 1280);
  uint64_t v19 = *(void *)(v0 + 1256);
  uint64_t v1 = *(void *)(v0 + 1000);
  uint64_t v2 = *(void *)(v0 + 992);
  uint64_t v3 = *(void *)(v0 + 976);
  uint64_t v4 = *(void *)(v0 + 968);
  uint64_t v5 = *(void *)(v0 + 952);
  uint64_t v6 = sub_1C69E1E58();
  long long v15 = *(_OWORD *)(v0 + 1296);
  OUTLINED_FUNCTION_72(v1, v7, v8, v6);
  OUTLINED_FUNCTION_14();
  v9();
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  *(void *)(v11 + 32) = v5;
  *(_OWORD *)(v11 + 40) = v15;
  *(void *)(v11 + 56) = v17;
  *(void *)(v11 + 64) = v16;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v2, v4);
  swift_retain();
  sub_1C69DA3CC(v1, (uint64_t)&unk_1EA4432B8, v11);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  OUTLINED_FUNCTION_46_0();
  v12();
  sub_1C69B74DC(v0 + 376, &qword_1EA4432A8);
  sub_1C69B74DC(v0 + 456, &qword_1EA4432A8);
  swift_bridgeObjectRelease();
  v21(v20, v19);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v13();
}

uint64_t sub_1C69BD6E8()
{
  uint64_t v1 = *(void *)(v0 + 1264);

  swift_bridgeObjectRelease();
  (*(void (**)(void, void))(v1 + 8))(*(void *)(v0 + 1280), *(void *)(v0 + 1256));
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_63_0();
  return v2();
}

uint64_t sub_1C69BD8A8()
{
  OUTLINED_FUNCTION_40_0();
  v1();
  sub_1C69B74DC(v0 + 376, &qword_1EA4432A8);
  sub_1C69B74DC(v0 + 456, &qword_1EA4432A8);
  swift_bridgeObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_3_5();
  v3(v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_63_0();
  return v4();
}

uint64_t sub_1C69BDA30()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_53_0();
  v1();
  sub_1C69B74DC(v0 + 376, &qword_1EA4432A8);
  sub_1C69B74DC(v0 + 456, &qword_1EA4432A8);
  swift_bridgeObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_3_5();
  v3(v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_63_0();
  return v4();
}

uint64_t sub_1C69BDBC0(uint64_t a1, uint64_t a2)
{
  v2[6] = a1;
  v2[7] = a2;
  uint64_t v3 = sub_1C69E1588();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_1C69E0678();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_1C69E1598();
  v2[15] = v5;
  v2[16] = *(void *)(v5 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  uint64_t v6 = sub_1C69E15B8();
  v2[21] = v6;
  v2[22] = *(void *)(v6 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v7 = sub_1C69E1458();
  v2[25] = v7;
  v2[26] = *(void *)(v7 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69BDE9C, 0, 0);
}

void sub_1C69BDE9C()
{
  uint64_t v1 = sub_1C69E1508();
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v100 = MEMORY[0x1E4FBC860];
  uint64_t v81 = MEMORY[0x1E4FBC860];
  uint64_t v93 = *(void *)(v1 + 16);
  if (v93)
  {
    unint64_t v3 = 0;
    BOOL v84 = (void (**)(void))(v0[16] + 8);
    uint64_t v96 = (void (**)(void))(v0[26] + 32);
    uint64_t v83 = v1;
    while (1)
    {
      if (v3 >= *(void *)(v1 + 16))
      {
        __break(1u);
LABEL_68:
        __break(1u);
        goto LABEL_69;
      }
      OUTLINED_FUNCTION_33_1();
      v4();
      sub_1C69E1448();
      sub_1C69E15A8();
      OUTLINED_FUNCTION_37_0();
      v5();
      OUTLINED_FUNCTION_86();
      v6();
      sub_1C69C5E84(&qword_1EA443370, MEMORY[0x1E4FA44F8]);
      sub_1C69E1D88();
      sub_1C69E1D88();
      uint64_t v7 = v0[20];
      uint64_t v8 = v0[15];
      if (v0[2] == v0[4] && v0[3] == v0[5]) {
        break;
      }
      char v10 = sub_1C69E2188();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = *v84;
      OUTLINED_FUNCTION_40_0();
      v11();
      OUTLINED_FUNCTION_40_0();
      v11();
      if (v10) {
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_37_0();
      v12();
LABEL_16:
      uint64_t v1 = v83;
      if (v93 == ++v3) {
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v13 = *v84;
    OUTLINED_FUNCTION_40_0();
    v13();
    ((void (*)(uint64_t, uint64_t))v13)(v7, v8);
LABEL_11:
    uint64_t v14 = *v96;
    OUTLINED_FUNCTION_15_1();
    v14();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_20_2();
      uint64_t v2 = v100;
    }
    unint64_t v15 = *(void *)(v2 + 16);
    if (v15 >= *(void *)(v2 + 24) >> 1)
    {
      OUTLINED_FUNCTION_11_3();
      uint64_t v2 = v100;
    }
    *(void *)(v2 + 16) = v15 + 1;
    OUTLINED_FUNCTION_15_1();
    v14();
    uint64_t v100 = v2;
    goto LABEL_16;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  if (sub_1C69E12A8())
  {
    uint64_t v16 = sub_1C69E1508();
    uint64_t v17 = MEMORY[0x1E4FBC860];
    uint64_t v101 = MEMORY[0x1E4FBC860];
    uint64_t v94 = *(void *)(v16 + 16);
    if (v94)
    {
      unint64_t v18 = 0;
      OUTLINED_FUNCTION_50_0();
      uint64_t v86 = (void (**)(void))(v20 + 8);
      uint64_t v85 = (void (**)(void))(v21 + 32);
      uint64_t v98 = v2;
      uint64_t v92 = v19;
      while (v18 < *(void *)(v19 + 16))
      {
        OUTLINED_FUNCTION_33_1();
        v22();
        sub_1C69E1448();
        sub_1C69E15A8();
        OUTLINED_FUNCTION_37_0();
        v23();
        OUTLINED_FUNCTION_86();
        v24();
        sub_1C69C5E84(&qword_1EA4432C8, MEMORY[0x1E4FA44F8]);
        OUTLINED_FUNCTION_74_0();
        char v25 = sub_1C69E1CD8();
        uint64_t v26 = *v86;
        OUTLINED_FUNCTION_40_0();
        v26();
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_40_0();
        v26();
        if (v25)
        {
          uint64_t v27 = OUTLINED_FUNCTION_19_3(v0[33]);
          v28(v27);
          uint64_t v2 = v98;
        }
        else
        {
          uint64_t v29 = *v85;
          OUTLINED_FUNCTION_52_0();
          v29();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_20_2();
            uint64_t v17 = v101;
          }
          uint64_t v2 = v98;
          unint64_t v30 = *(void *)(v17 + 16);
          if (v30 >= *(void *)(v17 + 24) >> 1)
          {
            OUTLINED_FUNCTION_11_3();
            uint64_t v17 = v101;
          }
          *(void *)(v17 + 16) = v30 + 1;
          OUTLINED_FUNCTION_15_1();
          v29();
          uint64_t v101 = v17;
        }
        ++v18;
        uint64_t v19 = v92;
        if (v94 == v18) {
          goto LABEL_31;
        }
      }
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    sub_1C69C121C(v17);
    uint64_t v36 = MEMORY[0x1E4FBC860];
    uint64_t v102 = MEMORY[0x1E4FBC860];
    uint64_t v37 = *(void *)(v2 + 16);
    uint64_t v90 = v2;
    swift_bridgeObjectRetain();
    uint64_t v97 = v37;
    if (v37)
    {
      unint64_t v38 = 0;
      OUTLINED_FUNCTION_50_0();
      uint64_t v88 = (void (**)(void))(v39 + 8);
      uint64_t v87 = (void (**)(void))(v40 + 32);
      uint64_t v2 = MEMORY[0x1E4FBC860];
      uint64_t v41 = v90;
      while (v38 < *(void *)(v41 + 16))
      {
        OUTLINED_FUNCTION_28_2();
        OUTLINED_FUNCTION_33_1();
        v42();
        sub_1C69E1448();
        sub_1C69E15A8();
        OUTLINED_FUNCTION_37_0();
        v43();
        OUTLINED_FUNCTION_86();
        v44();
        sub_1C69C5E84(&qword_1EA4432C8, MEMORY[0x1E4FA44F8]);
        char v45 = sub_1C69E1CD8();
        uint64_t v46 = *v88;
        OUTLINED_FUNCTION_53_0();
        v46();
        OUTLINED_FUNCTION_53_0();
        v46();
        if (v45)
        {
          uint64_t v47 = OUTLINED_FUNCTION_19_3(v0[31]);
          v48(v47);
        }
        else
        {
          uint64_t v49 = *v87;
          OUTLINED_FUNCTION_52_0();
          v49();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_20_2();
            uint64_t v2 = v102;
          }
          unint64_t v50 = *(void *)(v2 + 16);
          if (v50 >= *(void *)(v2 + 24) >> 1)
          {
            OUTLINED_FUNCTION_11_3();
            uint64_t v2 = v102;
          }
          *(void *)(v2 + 16) = v50 + 1;
          OUTLINED_FUNCTION_15_1();
          v49();
          uint64_t v102 = v2;
        }
        ++v38;
        uint64_t v36 = MEMORY[0x1E4FBC860];
        uint64_t v41 = v90;
        if (v97 == v38) {
          goto LABEL_44;
        }
      }
LABEL_70:
      __break(1u);
      return;
    }
    uint64_t v2 = v36;
LABEL_44:
    swift_bridgeObjectRelease();
    sub_1C69E1518();
    uint64_t v51 = sub_1C69E0648();
    uint64_t v53 = v52;
    OUTLINED_FUNCTION_17_2();
    v54();
    swift_bridgeObjectRelease();
    sub_1C69E1D58();
    uint64_t v35 = v90;
    uint64_t v78 = v53;
    uint64_t v79 = v51;
  }
  else
  {
    swift_retain();
    sub_1C69E1518();
    uint64_t v31 = sub_1C69E0648();
    uint64_t v33 = v32;
    OUTLINED_FUNCTION_17_2();
    v34();
    swift_bridgeObjectRelease();
    sub_1C69E1D58();
    uint64_t v78 = v33;
    uint64_t v79 = v31;
    uint64_t v35 = v2;
    uint64_t v36 = MEMORY[0x1E4FBC860];
  }
  uint64_t v103 = v36;
  uint64_t v89 = *(void *)(v35 + 16);
  if (v89)
  {
    unint64_t v55 = 0;
    uint64_t v56 = v0[26];
    unint64_t v82 = (void (**)(void))(v56 + 8);
    uint64_t v80 = (void (**)(void))(v56 + 32);
    uint64_t v81 = MEMORY[0x1E4FBC860];
    uint64_t v99 = v2;
    uint64_t v91 = v35;
    do
    {
      if (v55 >= *(void *)(v35 + 16)) {
        goto LABEL_68;
      }
      unint64_t v57 = v0[29];
      uint64_t v95 = v0[28];
      uint64_t v58 = v0[25];
      OUTLINED_FUNCTION_28_2();
      uint64_t v62 = *(void (**)(uint64_t, unint64_t, uint64_t))(v61 + 16);
      v62(v57, v59 + v60 + *(void *)(v61 + 72) * v55, v58);
      sub_1C69E1408();
      uint64_t v63 = sub_1C69E1568();
      unint64_t v65 = v64;
      OUTLINED_FUNCTION_62();
      v66();
      swift_bridgeObjectRelease();
      if ((v65 & 0x2000000000000000) != 0) {
        uint64_t v67 = HIBYTE(v65) & 0xF;
      }
      else {
        uint64_t v67 = v63 & 0xFFFFFFFFFFFFLL;
      }
      v62(v95, v57, v58);
      if (v67)
      {
        sub_1C69E1408();
        uint64_t v68 = sub_1C69E1548();
        unint64_t v70 = v69;
        OUTLINED_FUNCTION_62();
        v71();
        swift_bridgeObjectRelease();
        if ((v70 & 0x2000000000000000) != 0) {
          uint64_t v72 = HIBYTE(v70) & 0xF;
        }
        else {
          uint64_t v72 = v68 & 0xFFFFFFFFFFFFLL;
        }
        uint64_t v73 = *v82;
        OUTLINED_FUNCTION_17_2();
        v73();
        if (v72)
        {
          uint64_t v74 = *v80;
          OUTLINED_FUNCTION_15_1();
          v74();
          uint64_t v75 = v81;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_20_2();
            uint64_t v75 = v103;
          }
          uint64_t v2 = v99;
          unint64_t v76 = *(void *)(v75 + 16);
          if (v76 >= *(void *)(v75 + 24) >> 1)
          {
            OUTLINED_FUNCTION_11_3();
            uint64_t v75 = v103;
          }
          *(void *)(v75 + 16) = v76 + 1;
          OUTLINED_FUNCTION_15_1();
          v74();
          uint64_t v81 = v75;
          uint64_t v103 = v75;
          uint64_t v35 = v91;
          goto LABEL_63;
        }
      }
      else
      {
        uint64_t v73 = *v82;
        ((void (*)(void, void))*v82)(v0[28], v0[25]);
      }
      ((void (*)(void, void))v73)(v0[29], v0[25]);
      uint64_t v2 = v99;
      uint64_t v35 = v91;
LABEL_63:
      ++v55;
    }
    while (v89 != v55);
  }
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v77 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[1];
  v77(v81, v2, v79, v78);
}

void sub_1C69BEAD0()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443360);
  uint64_t v1 = OUTLINED_FUNCTION_44(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_11();
  uint64_t v26 = v2;
  OUTLINED_FUNCTION_42_0();
  uint64_t v25 = sub_1C69E1818();
  OUTLINED_FUNCTION_1_0();
  uint64_t v24 = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_11();
  uint64_t v23 = v5;
  OUTLINED_FUNCTION_42_0();
  uint64_t v6 = sub_1C69E1738();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_19();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_1C69E1798();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v18 - v17, *MEMORY[0x1E4FA4800], v13);
  sub_1C69C0AA0();
  uint64_t v20 = v19;
  OUTLINED_FUNCTION_62();
  v21();
  if (!v20) {
    goto LABEL_8;
  }
  sub_1C69E1B68();
  sub_1C69E1728();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  sub_1C69C5DD4((uint64_t)v28, (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443368);
  if (!swift_dynamicCast())
  {
    sub_1C69C5DD4((uint64_t)v28, (uint64_t)v27);
    if (swift_dynamicCast())
    {
      __swift_storeEnumTagSinglePayload(v26, 0, 1, v25);
      OUTLINED_FUNCTION_70_0();
      OUTLINED_FUNCTION_15_1();
      v22();
      sub_1C69E17F8();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      goto LABEL_6;
    }
    __swift_storeEnumTagSinglePayload(v26, 1, 1, v25);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    sub_1C69B74DC(v26, &qword_1EA443360);
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  swift_release();
LABEL_6:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_9:
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69BEDF8(uint64_t a1)
{
  sub_1C69C6114(a1, (uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443358);
  sub_1C69E11B8();
  if (swift_dynamicCast())
  {
    char v1 = sub_1C69E11A8();
    swift_release();
  }
  else
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1C69E1C68();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EBC085C0);
    uint64_t v3 = sub_1C69E1C48();
    os_log_type_t v4 = sub_1C69E1EC8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1C698D000, v3, v4, "[warning] Owner is not a signalled siri help owner! Cant determine if this is a conversational continuer so assuming not", v5, 2u);
      MEMORY[0x1C87A7AA0](v5, -1, -1);
    }

    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_1C69BEF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C69E13F8();
  if (qword_1EA442910 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C69BEAD0();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  if (v6 == a2 && v8 == a3) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1C69E2188();
  }
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1C69BF060()
{
  sub_1C69E13F8();
  if (qword_1EA442910 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C69BEAD0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  if (v1 == qword_1EA443220 && v3 == *(void *)algn_1EA443228) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C69E2188();
  }
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C69BF17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a3;
  uint64_t v37 = a2;
  uint64_t v3 = sub_1C69E1AC8();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v39 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C69E04E8();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C69E1588();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v33 - v12;
  sub_1C69E1408();
  sub_1C69E1568();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v13, v7);
  sub_1C69E0D98();
  uint64_t v15 = self;
  sub_1C69E1408();
  sub_1C69E1568();
  v14(v13, v7);
  uint64_t v16 = (void *)sub_1C69E1CE8();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_1C69E1CE8();
  id v18 = objc_msgSend(v15, sel_quote_forLocale_, v16, v17);

  sub_1C69E1CF8();
  sub_1C69E0DF8();
  sub_1C69E1408();
  uint64_t v19 = sub_1C69E1558();
  uint64_t v21 = v20;
  v14(v11, v7);
  if (!v21) {
    goto LABEL_6;
  }
  uint64_t v42 = v19;
  uint64_t v43 = v21;
  uint64_t v22 = v34;
  sub_1C69E04D8();
  sub_1C69956B4();
  uint64_t v23 = sub_1C69E1F58();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v36);
  swift_bridgeObjectRelease();
  if (!v23 && v25 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v26 = sub_1C69E2188();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
LABEL_6:
    sub_1C69E1408();
    sub_1C69E1558();
    uint64_t v28 = v27;
    v14(v13, v7);
    if (v28) {
      sub_1C69E0D88();
    }
  }
LABEL_8:
  sub_1C69C1510();
  id v29 = static DirectInvocationFactory.createExecute(suggestion:)();
  if (v29)
  {
    unint64_t v30 = v29;
    sub_1C69E1EF8();
    sub_1C69E0DC8();
  }
  uint64_t v31 = v39;
  sub_1C69E1418();
  sub_1C69E1AB8();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v41);
  return sub_1C69E0DA8();
}

uint64_t sub_1C69BF5DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  sub_1C69BF17C(a1, v3, v4);
  return swift_bridgeObjectRelease();
}

void sub_1C69BF644()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v72 = v1;
  uint64_t v73 = v2;
  uint64_t v71 = v3;
  uint64_t v74 = v4;
  sub_1C69E07B8();
  OUTLINED_FUNCTION_1_0();
  v66[2] = v6;
  v66[3] = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_11();
  v66[1] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4432F0);
  uint64_t v9 = OUTLINED_FUNCTION_44(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_11();
  uint64_t v68 = v10;
  OUTLINED_FUNCTION_42_0();
  uint64_t v11 = sub_1C69E0818();
  OUTLINED_FUNCTION_1_0();
  uint64_t v70 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_36_0();
  v66[0] = v14;
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v67 = (char *)v66 - v16;
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x1F4188790](v17);
  unint64_t v69 = (char *)v66 - v18;
  OUTLINED_FUNCTION_42_0();
  sub_1C69E0CB8();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442B20);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_23_2();
  uint64_t v23 = (void **)(v21 - v22);
  MEMORY[0x1F4188790](v24);
  uint64_t v75 = (uint64_t)v66 - v25;
  char v26 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  if (v26)
  {
    uint64_t v27 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  }
  else
  {
    sub_1C69E0C28();
    uint64_t v27 = (void *)sub_1C69E0C18();
  }
  sub_1C69E0C48();
  memset(v76, 0, 40);
  id v28 = v26;
  sub_1C69E1C98();
  sub_1C69E0CA8();
  uint64_t v29 = v75;
  sub_1C69E0C38();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_53_0();
  v30();
  sub_1C69B74DC((uint64_t)v76, &qword_1EA442AF8);
  sub_1C69C5D2C(v29, (uint64_t)v23, &qword_1EA442B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v31 = *v23;
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_1C69E1C68();
    __swift_project_value_buffer(v32, (uint64_t)qword_1EBC085C0);
    id v33 = v31;
    id v34 = v31;
    uint64_t v35 = sub_1C69E1C48();
    os_log_type_t v36 = sub_1C69E1EE8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      v76[0] = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_getErrorValue();
      uint64_t v38 = sub_1C69E21C8();
      uint64_t v40 = sub_1C69A8148(v38, v39, v76);
      OUTLINED_FUNCTION_82_0(v40);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C698D000, v35, v36, "Error: %s", v37, 0xCu);
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
    }
    goto LABEL_19;
  }
  uint64_t v41 = v69;
  uint64_t v42 = v70;
  uint64_t v43 = v11;
  OUTLINED_FUNCTION_15_1();
  v44();
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_1C69E1C68();
  __swift_project_value_buffer(v45, (uint64_t)qword_1EBC085C0);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  uint64_t v47 = v67;
  v46(v67, v41, v11);
  uint64_t v48 = sub_1C69E1C48();
  os_log_type_t v49 = sub_1C69E1EC8();
  if (os_log_type_enabled(v48, v49))
  {
    unint64_t v50 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    v76[0] = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)unint64_t v50 = 136315138;
    uint64_t v73 = v50 + 4;
    v46((char *)v66[0], v47, v11);
    uint64_t v51 = sub_1C69E1D08();
    uint64_t v53 = sub_1C69A8148(v51, v52, v76);
    OUTLINED_FUNCTION_82_0(v53);
    uint64_t v54 = v70;
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    unint64_t v55 = *(void (**)(void))(v54 + 8);
    OUTLINED_FUNCTION_13();
    v55();
    _os_log_impl(&dword_1C698D000, v48, v49, "Extracting learn more URL from templating result: %s", v50, 0xCu);
    swift_arrayDestroy();
    uint64_t v56 = v69;
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v56 = v41;
    unint64_t v55 = *(void (**)(void))(v42 + 8);
    ((void (*)(char *, uint64_t))v55)(v47, v43);
  }

  uint64_t v57 = v68;
  uint64_t v58 = sub_1C69E0808();
  sub_1C69BA218(v58, MEMORY[0x1E4FA1C88], v57);
  swift_bridgeObjectRelease();
  uint64_t v59 = sub_1C69E0848();
  OUTLINED_FUNCTION_71(v57, 1, v59);
  if (v60)
  {
    sub_1C69B74DC(v57, &qword_1EA4432F0);
    ((void (*)(char *, uint64_t))v55)(v56, v43);
LABEL_19:
    sub_1C69B74DC(v75, &qword_1EA442B20);
    uint64_t v61 = sub_1C69E05E8();
    OUTLINED_FUNCTION_72(v74, v62, v63, v61);
    goto LABEL_20;
  }
  sub_1C69E0838();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_37_0();
  v64();
  sub_1C69E07A8();
  OUTLINED_FUNCTION_37_0();
  v65();
  sub_1C69E05D8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  v55();
  sub_1C69B74DC(v75, &qword_1EA442B20);
LABEL_20:
  OUTLINED_FUNCTION_7_3();
}

void sub_1C69BFD94()
{
  OUTLINED_FUNCTION_8_3();
  char v2 = v1;
  os_log_type_t v4 = v3;
  uint64_t v5 = sub_1C69E0798();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_48_0();
  uint64_t v9 = sub_1C69E0768();
  uint64_t v10 = OUTLINED_FUNCTION_44(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_49_0();
  sub_1C69E08A8();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_19();
  sub_1C69E0758();
  sub_1C69E0858();
  if (v2)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v0, *MEMORY[0x1E4FA1B88], v5);
    sub_1C69E0868();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1C69E1C68();
    uint64_t v13 = OUTLINED_FUNCTION_31_1(v12, (uint64_t)qword_1EBC085C0);
    os_log_type_t v14 = sub_1C69E1ED8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_23_1();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1C698D000, v13, v14, "SAE UI is enabled, setting response type to disambiguation to support tappable suggestions", v15, 2u);
      OUTLINED_FUNCTION_17();
    }
  }
  sub_1C69E0898();
  if (v4)
  {
    sub_1C69E0898();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C69E1C68();
    uint64_t v17 = OUTLINED_FUNCTION_31_1(v16, (uint64_t)qword_1EBC085C0);
    os_log_type_t v18 = sub_1C69E1ED8();
    if (OUTLINED_FUNCTION_22(v18))
    {
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_23_1();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1C698D000, v17, v4, "relying on FF for followup rather than listen after speaking(LAS)", v19, 2u);
      OUTLINED_FUNCTION_17();
    }
  }
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C69E1C68();
  uint64_t v21 = OUTLINED_FUNCTION_31_1(v20, (uint64_t)qword_1EBC085C0);
  os_log_type_t v22 = sub_1C69E1ED8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 67109120;
    swift_beginAccess();
    sub_1C69E0888();
    swift_endAccess();
    sub_1C69E1F28();
    _os_log_impl(&dword_1C698D000, v21, v22, "setting listenAfterSpeaking as %{BOOL}d in manifest", v23, 8u);
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_18_3();
  sub_1C69E0878();
  swift_endAccess();
  OUTLINED_FUNCTION_14();
  v24();
  OUTLINED_FUNCTION_67_0();
  v25();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69C0184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a6;
  v6[6] = v11;
  v6[4] = a4;
  uint64_t v7 = sub_1C69E0678();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  uint64_t v8 = sub_1C69E17A8();
  v6[10] = v8;
  v6[11] = *(void *)(v8 - 8);
  v6[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69C02AC, 0, 0);
}

uint64_t sub_1C69C02AC()
{
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085C0);
  char v2 = sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1ED8();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)OUTLINED_FUNCTION_23_1();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_1C698D000, v2, v3, "Donating interaction event", v4, 2u);
    OUTLINED_FUNCTION_17();
  }
  uint64_t v6 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v7 = v0[10];
  uint64_t v8 = (void *)v0[4];

  uint64_t v9 = v8 + 2;
  uint64_t v10 = v8[5];
  uint64_t v11 = v8[6];
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E4FA4848], v7);
  sub_1C69E1518();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[14] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_1C69C0468;
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[9];
  uint64_t v15 = v0[5];
  return MEMORY[0x1F4158FF8](v15, v13, v14, v10, v11);
}

uint64_t sub_1C69C0468()
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *os_log_type_t v4 = v3;
  uint64_t v6 = v5[9];
  uint64_t v7 = v5[8];
  uint64_t v8 = v5[7];
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v10 = v9;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_67_0();
  v11();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_55();
    __asm { BRAA            X1, X16 }
  }
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_55();
  return MEMORY[0x1F4188298](v12, v13, v14);
}

uint64_t sub_1C69C063C()
{
  uint64_t v17 = v0;
  uint64_t v2 = (void *)v0[15];
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_1C69E1C48();
  os_log_type_t v6 = sub_1C69E1EE8();
  if (OUTLINED_FUNCTION_22(v6))
  {
    uint64_t v7 = (void *)v0[15];
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v9 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v16 = v9;
    v0[2] = v7;
    id v10 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v11 = sub_1C69E1D08();
    v0[3] = sub_1C69A8148(v11, v12, &v16);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C698D000, v5, v1, "SirHelpDispatcher :: Error when donating interaction: %s", v8, 0xCu);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v13 = (void *)v0[15];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v14();
}

uint64_t sub_1C69C07F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_1C69C6114(a1, (uint64_t)v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443358);
  sub_1C69E11B8();
  if (swift_dynamicCast())
  {
    uint64_t v5 = a3();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C69E1C68();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EBC085C0);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_1C69E1C48();
    os_log_type_t v8 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_22(v8))
    {
      uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      v20[0] = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v10 = sub_1C69E1668();
      uint64_t v11 = swift_bridgeObjectRetain();
      MEMORY[0x1C87A7030](v11, v10);
      swift_bridgeObjectRelease();
      uint64_t v12 = OUTLINED_FUNCTION_45_0();
      sub_1C69A8148(v12, v13, v14);
      sub_1C69E1F28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C698D000, v7, v3, "signal stats: %s", v9, 0xCu);
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();

      swift_release();
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C69E1C68();
    uint64_t v16 = OUTLINED_FUNCTION_31_1(v15, (uint64_t)qword_1EBC085C0);
    os_log_type_t v17 = sub_1C69E1EE8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_23_1();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C698D000, v16, v17, "Owner is not a signalled siri help owner!", v18, 2u);
      OUTLINED_FUNCTION_17();
    }

    return MEMORY[0x1E4FBC860];
  }
  return v5;
}

void sub_1C69C0AA0()
{
  OUTLINED_FUNCTION_8_3();
  os_log_type_t v1 = v0;
  os_log_type_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C69E1668();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1C69C07F8(v9, v5, v3);
  swift_bridgeObjectRetain();
  sub_1C69C3B64(&v30);
  swift_bridgeObjectRelease();
  uint64_t v16 = v30;
  uint64_t v17 = *(void *)(v30 + 16);
  if (v17)
  {
    v26[1] = 0;
    v26[2] = v5;
    uint64_t v27 = v7;
    id v28 = v1;
    uint64_t v30 = MEMORY[0x1E4FBC860];
    sub_1C69E2028();
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    OUTLINED_FUNCTION_28_2();
    v26[0] = v16;
    uint64_t v19 = v16 + v18;
    uint64_t v20 = *(void *)(v12 + 72);
    do
    {
      v29(v15, v19, v10);
      sub_1C69E1658();
      OUTLINED_FUNCTION_76_0();
      OUTLINED_FUNCTION_62();
      v22(v21);
      sub_1C69E2008();
      sub_1C69E2038();
      sub_1C69E2048();
      sub_1C69E2018();
      v19 += v20;
      --v17;
    }
    while (v17);
    unint64_t v23 = v30;
    swift_release();
    uint64_t v7 = v27;
    os_log_type_t v1 = v28;
  }
  else
  {
    swift_release();
    unint64_t v23 = MEMORY[0x1E4FBC860];
  }
  unint64_t v24 = sub_1C69C0CB8(v23);
  uint64_t v25 = swift_bridgeObjectRelease();
  MEMORY[0x1F4188790](v25);
  v26[-2] = v7;
  sub_1C69BA7A0(v1, (uint64_t)&v26[-4], v24);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69C0CB8(unint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4FBC860];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C69E2098();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x1C87A7240](v4, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v5 = swift_retain();
      MEMORY[0x1C87A7000](v5);
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C69E1DE8();
      }
      ++v4;
      sub_1C69E1E08();
      sub_1C69E1DD8();
      sub_1C69E1B88();
      unint64_t v6 = sub_1C69C0CB8();
      swift_bridgeObjectRelease();
      sub_1C69C1348(v6);
      swift_release();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_1C69C0E48(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v2 = sub_1C69E1798();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v27 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443318);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443320);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  id v28 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v27 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v27 - v15;
  sub_1C69E1B78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443328);
  int v17 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, v17 ^ 1u, 1, v2);
  uint64_t v18 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v14, v29, v2);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v2);
  uint64_t v19 = (uint64_t)&v8[*(int *)(v6 + 56)];
  sub_1C69C5D2C((uint64_t)v16, (uint64_t)v8, &qword_1EA443320);
  sub_1C69C5D2C((uint64_t)v14, v19, &qword_1EA443320);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2) == 1)
  {
    sub_1C69B74DC((uint64_t)v14, &qword_1EA443320);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v19, 1, v2);
    if (EnumTagSinglePayload == 1) {
      uint64_t v21 = &qword_1EA443320;
    }
    else {
      uint64_t v21 = &qword_1EA443318;
    }
    if (EnumTagSinglePayload == 1) {
      char v22 = -1;
    }
    else {
      char v22 = 0;
    }
  }
  else
  {
    uint64_t v23 = (uint64_t)v28;
    sub_1C69C5D2C((uint64_t)v8, (uint64_t)v28, &qword_1EA443320);
    if (__swift_getEnumTagSinglePayload(v19, 1, v2) == 1)
    {
      sub_1C69B74DC((uint64_t)v14, &qword_1EA443320);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v23, v2);
      char v22 = 0;
      uint64_t v21 = &qword_1EA443318;
    }
    else
    {
      unint64_t v24 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v27, v19, v2);
      sub_1C69C5E84(&qword_1EA443330, MEMORY[0x1E4FA4818]);
      char v22 = sub_1C69E1CD8();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v18 + 8);
      v25(v24, v2);
      uint64_t v21 = &qword_1EA443320;
      sub_1C69B74DC((uint64_t)v14, &qword_1EA443320);
      v25(v28, v2);
    }
  }
  sub_1C69B74DC((uint64_t)v8, v21);
  sub_1C69B74DC((uint64_t)v16, &qword_1EA443320);
  return v22 & 1;
}

uint64_t sub_1C69C121C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    uint64_t result = sub_1C69A721C();
    uint64_t v3 = result;
  }
  if (!*(void *)(v5 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v6 = (*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16);
  uint64_t v7 = sub_1C69E1458();
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t result = v7 - 8;
  uint64_t v8 = v9;
  if (v6 < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t result = sub_1C69C2D8C(v5 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v2);
  if (!v2)
  {
LABEL_11:
    uint64_t result = swift_bridgeObjectRelease();
    *os_log_type_t v1 = v3;
    return result;
  }
  uint64_t v10 = *(void *)(v3 + 16);
  BOOL v11 = __OFADD__(v10, v2);
  uint64_t v12 = v10 + v2;
  if (!v11)
  {
    *(void *)(v3 + 16) = v12;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1C69C1348(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C69E2098();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C69E2098();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *os_log_type_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1C87A7250](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *os_log_type_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_1C69C51A8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C69E2098();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1C69E1DD8();
}

void sub_1C69C1510()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1C69E1AF8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v87 = v5;
  uint64_t v88 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_11();
  uint64_t v84 = v6;
  OUTLINED_FUNCTION_42_0();
  sub_1C69E1588();
  OUTLINED_FUNCTION_1_0();
  uint64_t v85 = v8;
  uint64_t v86 = v7;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_11();
  uint64_t v83 = v9;
  OUTLINED_FUNCTION_42_0();
  uint64_t v92 = sub_1C69E1458();
  OUTLINED_FUNCTION_1_0();
  uint64_t v89 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_48_0();
  uint64_t v81 = sub_1C69E1A48();
  OUTLINED_FUNCTION_1_0();
  uint64_t v79 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_36_0();
  uint64_t v80 = v14;
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x1F4188790](v15);
  v78[1] = (char *)v78 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443300);
  uint64_t v18 = OUTLINED_FUNCTION_44(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_23_2();
  uint64_t v21 = v19 - v20;
  MEMORY[0x1F4188790](v22);
  unint64_t v24 = (char *)v78 - v23;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443308);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_23_2();
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v29 = (void *)((char *)v78 - v28);
  MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)v78 - v30;
  sub_1C69C1D04(v1, (uint64_t)v78 - v30);
  uint64_t v32 = sub_1C69E1A78();
  OUTLINED_FUNCTION_71((uint64_t)v31, 1, v32);
  if (v33)
  {
LABEL_3:
    uint64_t v90 = v31;
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1C69E1C68();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBC085C0);
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_14();
    v35();
    os_log_type_t v36 = sub_1C69E1C48();
    os_log_type_t v37 = sub_1C69E1EE8();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      uint64_t v39 = OUTLINED_FUNCTION_25_1();
      uint64_t v91 = v3;
      uint64_t v81 = v39;
      uint64_t v93 = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v80 = v38 + 4;
      sub_1C69E1408();
      sub_1C69E1578();
      OUTLINED_FUNCTION_37_0();
      v40();
      sub_1C69E1AD8();
      OUTLINED_FUNCTION_37_0();
      v41();
      uint64_t v42 = sub_1C69E1D08();
      uint64_t v44 = sub_1C69A8148(v42, v43, &v93);
      OUTLINED_FUNCTION_75_0(v44);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46_0();
      v45();
      _os_log_impl(&dword_1C698D000, v36, v37, "Unknown icon asset: %s", v38, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      uint64_t v51 = OUTLINED_FUNCTION_76_0();
      v52(v51);
    }

    sub_1C69E0E18();
    sub_1C69B74DC((uint64_t)v90, &qword_1EA443308);
    uint64_t v92 = 0;
    goto LABEL_11;
  }
  uint64_t v91 = v3;
  sub_1C69C5D2C((uint64_t)v31, (uint64_t)v29, &qword_1EA443308);
  int v46 = (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v32 - 8) + 88))(v29, v32);
  if (v46 == *MEMORY[0x1E4FA4D88])
  {
    uint64_t v47 = OUTLINED_FUNCTION_25_2();
    v48(v47);
    uint64_t v49 = *v29;
    unint64_t v50 = v29[1];
    sub_1C69E0E18();
    uint64_t v92 = sub_1C69E0618();
    sub_1C69A36B4(v49, v50);
    sub_1C69B74DC((uint64_t)v31, &qword_1EA443308);
LABEL_11:
    OUTLINED_FUNCTION_41_0();
    goto LABEL_12;
  }
  uint64_t v90 = v31;
  if (v46 != *MEMORY[0x1E4FA4D90])
  {
    if (v46 == *MEMORY[0x1E4FA4D98])
    {
      uint64_t v60 = OUTLINED_FUNCTION_25_2();
      v61(v60);
      sub_1C69E0E18();
      sub_1C69B74DC((uint64_t)v90, &qword_1EA443308);
      uint64_t v92 = 0;
      OUTLINED_FUNCTION_41_0();
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_17_2();
    v72();
    uint64_t v31 = v90;
    uint64_t v3 = v91;
    goto LABEL_3;
  }
  uint64_t v53 = OUTLINED_FUNCTION_25_2();
  v54(v53);
  uint64_t v55 = *v29;
  uint64_t v56 = v29[1];
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443310);
  sub_1C69C5CA4((uint64_t)v29 + *(int *)(v57 + 48), (uint64_t)v24);
  sub_1C69E0E18();
  sub_1C69C5D2C((uint64_t)v24, v21, &qword_1EA443300);
  OUTLINED_FUNCTION_71(v21, 1, v81);
  uint64_t v88 = v56;
  uint64_t v89 = v55;
  if (v33)
  {
    sub_1C69B74DC((uint64_t)v24, &qword_1EA443300);
    uint64_t v58 = OUTLINED_FUNCTION_70_0();
    sub_1C69B74DC(v58, v59);
    uint64_t v87 = 0;
  }
  else
  {
    uint64_t v62 = v79;
    OUTLINED_FUNCTION_15_1();
    v63();
    unint64_t v64 = (uint64_t *)v80;
    OUTLINED_FUNCTION_45_0();
    OUTLINED_FUNCTION_14();
    v65();
    uint64_t v66 = OUTLINED_FUNCTION_74_0();
    int v68 = v67(v66);
    if (v68 == *MEMORY[0x1E4FA4D80])
    {
      OUTLINED_FUNCTION_13();
      v69();
      sub_1C69B74DC((uint64_t)v24, &qword_1EA443300);
      uint64_t v70 = OUTLINED_FUNCTION_61_0();
      v71(v70);
      uint64_t v87 = *v64;
    }
    else
    {
      int v73 = v68;
      int v74 = *MEMORY[0x1E4FA4D78];
      uint64_t v75 = *(void (**)(void))(v62 + 8);
      OUTLINED_FUNCTION_17_2();
      v75();
      sub_1C69B74DC((uint64_t)v24, &qword_1EA443300);
      if (v73 == v74)
      {
        uint64_t v76 = OUTLINED_FUNCTION_61_0();
        v77(v76);
        uint64_t v87 = 0;
      }
      else
      {
        OUTLINED_FUNCTION_74_0();
        OUTLINED_FUNCTION_17_2();
        v75();
        uint64_t v87 = 0x544C5541464544;
      }
    }
  }
  sub_1C69B74DC((uint64_t)v90, &qword_1EA443308);
  uint64_t v92 = 0;
LABEL_12:
  sub_1C69E0DB8();
  sub_1C69E0E08();
  sub_1C69E0D78();
  sub_1C69E0DE8();
  sub_1C69E0DD8();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69C1D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v37 = sub_1C69E1458();
  uint64_t v42 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790](v37);
  os_log_type_t v36 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443308);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v41 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1C69E1AF8();
  uint64_t v39 = *(void *)(v44 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v44);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v43 = sub_1C69E1588();
  uint64_t v11 = *(void *)(v43 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v43);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = sub_1C69E1798();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1;
  sub_1C69E13F8();
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E4FA4800], v17);
  sub_1C69C0AA0();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  swift_release();
  unint64_t v24 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v25 = (void (**)(char *, uint64_t))(v39 + 8);
  if (v23)
  {
    uint64_t v40 = v8;
    uint64_t v26 = v21;
    sub_1C69E1408();
    sub_1C69E1578();
    uint64_t v27 = *v24;
    (*v24)(v16, v43);
    uint64_t v28 = v41;
    sub_1C69E1AE8();
    uint64_t v29 = (uint64_t (*)(char *, uint64_t))*v25;
    (*v25)(v10, v44);
    uint64_t v30 = v36;
    uint64_t v31 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v36, v26, v37);
    uint64_t v32 = sub_1C69E1A78();
    if (__swift_getEnumTagSinglePayload(v28, 1, v32) == 1)
    {
      sub_1C69E1408();
      char v33 = v40;
      sub_1C69E1578();
      v27(v14, v43);
      sub_1C69E1AD8();
      v29(v33, v44);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v31);
      return sub_1C69B74DC(v41, &qword_1EA443308);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v31);
      uint64_t v35 = v38;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 32))(v38, v41, v32);
      return __swift_storeEnumTagSinglePayload(v35, 0, 1, v32);
    }
  }
  else
  {
    sub_1C69E1408();
    sub_1C69E1578();
    (*v24)(v14, v43);
    sub_1C69E1AD8();
    return ((uint64_t (*)(char *, uint64_t))*v25)(v8, v44);
  }
}

uint64_t sub_1C69C2254()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  sub_1C69E05E8();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_37_0();
  v1();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_featureFlagProvider);
  return v0;
}

uint64_t sub_1C69C230C()
{
  sub_1C69C2254();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1C69C2344(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C6991498;
  return sub_1C69BAE44(a1, a2);
}

void SiriSuggestions.Suggestion.toIntentSuggestion()()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v44 = sub_1C69E0678();
  OUTLINED_FUNCTION_1_0();
  uint64_t v40 = v0;
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_19();
  uint64_t v4 = v3 - v2;
  sub_1C69E1AC8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_78_0();
  MEMORY[0x1F4188790](v9);
  sub_1C69E1BD8();
  sub_1C69E1418();
  uint64_t v45 = sub_1C69E1AB8();
  uint64_t v42 = v10;
  uint64_t v11 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_37_1();
  v11();
  sub_1C69E1418();
  sub_1C69E1AB8();
  OUTLINED_FUNCTION_37_1();
  v11();
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v13 = sub_1C69C2948(v45, v42);
  sub_1C69E1418();
  uint64_t v14 = sub_1C69E1AA8();
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_37_1();
  v11();
  uint64_t v39 = v13;
  sub_1C69C5020(v14, v16, v13);
  sub_1C69E1418();
  uint64_t v17 = sub_1C69E1A98();
  OUTLINED_FUNCTION_37_1();
  v11();
  uint64_t v48 = MEMORY[0x1E4FBC860];
  sub_1C69C575C(v17, v49);
  uint64_t v46 = v49[0];
  int64_t v47 = v49[3];
  unint64_t v18 = v49[4];
  uint64_t v41 = v49[1];
  int64_t v43 = (unint64_t)(v49[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  if (!v18) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v19 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v20 = v19 | (v47 << 6);
  while (1)
  {
    uint64_t v28 = (uint64_t *)(*(void *)(v46 + 48) + 16 * v20);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C69E0668();
    uint64_t v31 = sub_1C69E0648();
    uint64_t v33 = v32;
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v4, v44);
    sub_1C69E1BE8();
    id v34 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    swift_bridgeObjectRetain();
    id v35 = sub_1C69C2948(v31, v33);
    swift_bridgeObjectRetain();
    sub_1C69C50F8(v29, v30, v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v36 = OUTLINED_FUNCTION_74_0();
    sub_1C69C5150(v36, v37, v35);
    swift_bridgeObjectRelease();
    uint64_t v38 = swift_bridgeObjectRelease_n();
    MEMORY[0x1C87A7000](v38);
    if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C69E1DE8();
    }
    sub_1C69E1E08();
    sub_1C69E1DD8();
    if (v18) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v21 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v21 >= v43) {
      goto LABEL_29;
    }
    unint64_t v22 = *(void *)(v41 + 8 * v21);
    int64_t v23 = v47 + 1;
    if (!v22)
    {
      OUTLINED_FUNCTION_73_0();
      if (v24 == v25) {
        goto LABEL_29;
      }
      OUTLINED_FUNCTION_72_0();
      if (!v22)
      {
        OUTLINED_FUNCTION_73_0();
        if (v24 == v25) {
          goto LABEL_29;
        }
        OUTLINED_FUNCTION_72_0();
        if (!v22)
        {
          OUTLINED_FUNCTION_73_0();
          if (v24 == v25) {
            goto LABEL_29;
          }
          OUTLINED_FUNCTION_72_0();
          if (!v22)
          {
            OUTLINED_FUNCTION_73_0();
            if (v24 == v25) {
              goto LABEL_29;
            }
            OUTLINED_FUNCTION_72_0();
            if (!v22)
            {
              int64_t v23 = v26 + 5;
              if (v26 + 5 >= v43) {
                goto LABEL_29;
              }
              unint64_t v22 = *(void *)(v41 + 8 * v23);
              if (!v22)
              {
                int64_t v27 = v47 + 7;
                while (v27 < v43)
                {
                  unint64_t v22 = *(void *)(v41 + 8 * v27++);
                  if (v22)
                  {
                    int64_t v23 = v27 - 1;
                    goto LABEL_24;
                  }
                }
LABEL_29:
                swift_release();
                swift_bridgeObjectRelease();
                sub_1C69C5084(v48, v39);
                OUTLINED_FUNCTION_7_3();
                return;
              }
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v18 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    int64_t v47 = v23;
  }
  __break(1u);
}

uint64_t static SiriHelpDispatcherErrors.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriHelpDispatcherErrors.hash(into:)()
{
  return sub_1C69E2228();
}

uint64_t SiriHelpDispatcherErrors.hashValue.getter()
{
  return sub_1C69E2238();
}

uint64_t sub_1C69C28D0()
{
  return 1;
}

uint64_t sub_1C69C28D8()
{
  return SiriHelpDispatcherErrors.hashValue.getter();
}

uint64_t sub_1C69C28F0()
{
  return SiriHelpDispatcherErrors.hash(into:)();
}

uint64_t sub_1C69C2908()
{
  return sub_1C69E2238();
}

id sub_1C69C2948(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_1C69E1CE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (void *)sub_1C69E1CE8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithIdentifier_displayString_, v3, v4);

  return v5;
}

uint64_t sub_1C69C29DC(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_1C69E2088();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_1C69E1668();
      uint64_t v2 = sub_1C69E1DF8();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x1E4FBC860];
    }
    sub_1C69E1668();
    return v2;
  }
  return result;
}

uint64_t sub_1C69C2ABC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_29_2();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_77_0();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_30_1();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1C69C2B6C(uint64_t a1, uint64_t a2)
{
  return sub_1C69C2D8C(a1, a2);
}

uint64_t sub_1C69C2B84(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1C69E20E8();
    __break(1u);
  }
  else
  {
    sub_1C69E1B98();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C69C2C80(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1C69E20E8();
    __break(1u);
  }
  else
  {
    sub_1C69C5C68(0, &qword_1EA4432D0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C69C2D8C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_29_2();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_77_0();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_64_0();
  v3(0);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_65_0();
  if (!v6 & v5) {
    BOOL v7 = v4 > v2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_30_1();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_38_1();
  return swift_arrayInitWithCopy();
}

uint64_t sub_1C69C2E50(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_29_2();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_77_0();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_64_0();
  if (v4 + 40 * v3 > v2 && v2 + 40 * v3 > v4)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_30_1();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C78);
  OUTLINED_FUNCTION_38_1();
  return swift_arrayInitWithCopy();
}

uint64_t sub_1C69C2F10(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_29_2();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_77_0();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_64_0();
  __swift_instantiateConcreteTypeFromMangledName(v3);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_65_0();
  if (!v6 & v5) {
    BOOL v7 = v4 > v2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_30_1();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_38_1();
  return swift_arrayInitWithCopy();
}

uint64_t sub_1C69C2FD0(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1C69C2FFC(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_1C69C3028(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1C69C304C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F30);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_1C69C2ABC(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

void *sub_1C69C310C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442AD8);
      uint64_t v3 = (void *)swift_allocObject();
      size_t v4 = _swift_stdlib_malloc_size(v3);
      v3[2] = v2;
      v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1C69C5344((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C69E2098();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

void sub_1C69C3200(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D98);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 40);
    }
    if (v4 != a3)
    {
      sub_1C69C2E50(a2 + 40 * a3, v5);
      return;
    }
    goto LABEL_9;
  }
}

void sub_1C69C32C4()
{
  sub_1C69C351C();
  *uint64_t v0 = v1;
}

void sub_1C69C3328()
{
  sub_1C69C3870();
  *uint64_t v0 = v1;
}

void sub_1C69C336C()
{
  sub_1C69C351C();
  *uint64_t v0 = v1;
}

void sub_1C69C33D0()
{
  sub_1C69C351C();
  *uint64_t v0 = v1;
}

char *sub_1C69C3434(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C69C36A0(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_1C69C3454()
{
  sub_1C69C351C();
  *uint64_t v0 = v1;
}

uint64_t sub_1C69C34B8(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C69C3784(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void sub_1C69C34D8()
{
  sub_1C69C3870();
  *uint64_t v0 = v1;
}

void sub_1C69C351C()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v4 = v3;
  char v6 = v5;
  uint64_t v7 = v1;
  char v9 = v8;
  if (v10)
  {
    unint64_t v11 = *(void *)(v1 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < v0)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v12 = v0;
      }
    }
  }
  else
  {
    uint64_t v12 = v0;
  }
  uint64_t v13 = *(void *)(v1 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v20 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v2);
  uint64_t v15 = v6(0);
  OUTLINED_FUNCTION_2_0(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v21 - v19 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_24;
  }
  v20[2] = v13;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  v6(0);
  OUTLINED_FUNCTION_28_2();
  uint64_t v24 = v7 + v23;
  if (v9)
  {
    v4(v24, v13, (char *)v20 + v23);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    sub_1C69C2D8C(v24, v13);
  }
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

char *sub_1C69C36A0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F30);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    char v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C69A7CCC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C69C2ABC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1C69C3784(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D98);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C69A7F54(v12, v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C69C2E50((uint64_t)v12, v8);
  }
  swift_release();
  return v10;
}

void sub_1C69C3870()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v7 = v1;
  char v9 = v8;
  if (v10)
  {
    unint64_t v11 = *(void *)(v1 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < v0)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v12 = v0;
      }
    }
  }
  else
  {
    uint64_t v12 = v0;
  }
  uint64_t v13 = *(void *)(v1 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v20 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v2);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(v6);
  OUTLINED_FUNCTION_2_0(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v21 - v19 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_24;
  }
  v20[2] = v13;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v6);
  OUTLINED_FUNCTION_26_2(v23);
  OUTLINED_FUNCTION_28_2();
  uint64_t v25 = v7 + v24;
  if (v9)
  {
    v4(v25, v13, (char *)v20 + v24);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    sub_1C69C2F10(v25, v13);
  }
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

void sub_1C69C39C8()
{
  unint64_t v1 = *(void *)(*v0 + 16);
  unint64_t v2 = v1 - 2;
  if (v1 >= 2)
  {
    unint64_t v3 = 0;
    while (1)
    {
      unint64_t v20 = 0;
      MEMORY[0x1C87A7AC0](&v20, 8);
      uint64_t v4 = (v20 * (unsigned __int128)v1) >> 64;
      if (v1 > v20 * v1)
      {
        unint64_t v5 = -(uint64_t)v1 % v1;
        if (v5 > v20 * v1)
        {
          do
          {
            unint64_t v20 = 0;
            MEMORY[0x1C87A7AC0](&v20, 8);
          }
          while (v5 > v20 * v1);
          uint64_t v4 = (v20 * (unsigned __int128)v1) >> 64;
        }
      }
      unint64_t v6 = v3 + v4;
      if (__OFADD__(v3, v4)) {
        break;
      }
      if (v3 != v6)
      {
        uint64_t v7 = *v0;
        unint64_t v8 = *(void *)(*v0 + 16);
        if (v3 >= v8) {
          goto LABEL_22;
        }
        if (v6 >= v8) {
          goto LABEL_23;
        }
        char v9 = *(void **)(v7 + 32 + 8 * v6);
        id v10 = *(id *)(v7 + 32 + 8 * v3);
        id v11 = v9;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *int64_t v0 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_1C69C5C54();
        }
        if (v3 >= *(void *)(v7 + 16)) {
          goto LABEL_24;
        }
        uint64_t v13 = v7 + 8 * v3;
        uint64_t v14 = *(void **)(v13 + 32);
        *(void *)(v13 + 32) = v11;

        sub_1C69E2018();
        uint64_t v15 = *v0;
        char v16 = swift_isUniquelyReferenced_nonNull_native();
        *int64_t v0 = v15;
        if ((v16 & 1) == 0) {
          sub_1C69C5C54();
        }
        if (v6 >= *(void *)(v15 + 16)) {
          goto LABEL_25;
        }
        uint64_t v17 = v15 + 8 * v6;
        uint64_t v18 = *(void **)(v17 + 32);
        *(void *)(v17 + 32) = v10;

        sub_1C69E2018();
      }
      --v1;
      if (v3++ == v2) {
        return;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
}

void sub_1C69C3B64(uint64_t *a1)
{
  uint64_t v2 = *(void *)(sub_1C69E1668() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C69C5BE8();
    uint64_t v3 = v4;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_1C69C3C0C(v6);
  *a1 = v3;
}

void sub_1C69C3C0C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C69E1668();
  uint64_t v135 = *(void **)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v132 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v146 = (char *)&v126 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v141 = (char *)&v126 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v142 = (char *)&v126 - v11;
  uint64_t v12 = a1[1];
  uint64_t v13 = sub_1C69E2168();
  if (v13 >= v12)
  {
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12) {
        sub_1C69C4700(0, v12, 1, a1);
      }
      return;
    }
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  uint64_t v14 = v13;
  uint64_t v128 = sub_1C69C29DC(v12 / 2);
  unint64_t v134 = v15;
  uint64_t v129 = v12;
  if (v12 <= 0)
  {
    uint64_t v17 = (char *)MEMORY[0x1E4FBC860];
    unint64_t v68 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_102:
    if (v68 < 2) {
      goto LABEL_116;
    }
    uint64_t v118 = *a1;
    while (1)
    {
      unint64_t v119 = v68 - 2;
      if (v68 < 2) {
        break;
      }
      if (!v118) {
        goto LABEL_148;
      }
      uint64_t v120 = v17;
      uint64_t v121 = v17 + 32;
      uint64_t v122 = *(void *)&v17[16 * v119 + 32];
      uint64_t v123 = *(void *)&v17[16 * v68 + 24];
      sub_1C69C49EC(v118 + v135[9] * v122, v118 + v135[9] * *(void *)&v121[16 * v68 - 16], v118 + v135[9] * v123, v134);
      if (v2) {
        goto LABEL_114;
      }
      if (v123 < v122) {
        goto LABEL_135;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v120 = sub_1C69C500C((uint64_t)v120);
      }
      if (v119 >= *((void *)v120 + 2)) {
        goto LABEL_136;
      }
      uint64_t v124 = &v120[16 * v119 + 32];
      *(void *)uint64_t v124 = v122;
      *((void *)v124 + 1) = v123;
      unint64_t v125 = *((void *)v120 + 2);
      if (v68 > v125) {
        goto LABEL_137;
      }
      uint64_t v17 = v120;
      memmove(&v120[16 * v68 + 16], &v120[16 * v68 + 32], 16 * (v125 - v68));
      *((void *)v120 + 2) = v125 - 1;
      unint64_t v68 = v125 - 1;
      if (v125 <= 2) {
        goto LABEL_116;
      }
    }
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
  uint64_t v127 = v14;
  char v16 = 0;
  uint64_t v139 = (void (**)(char *, uint64_t))(v135 + 1);
  uint64_t v140 = v135 + 2;
  uint64_t v150 = (char **)(v135 + 4);
  uint64_t v17 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v18 = v12;
  uint64_t v144 = a1;
  uint64_t v145 = v4;
  while (1)
  {
    uint64_t v19 = (uint64_t)(v16 + 1);
    uint64_t v133 = v16;
    if ((uint64_t)(v16 + 1) >= v18)
    {
      uint64_t v28 = v16;
    }
    else
    {
      uint64_t v20 = *a1;
      uint64_t v21 = v135[9];
      uint64_t v138 = (uint64_t)(v16 + 1);
      uint64_t v22 = v20 + v21 * v19;
      char v136 = (char *)v20;
      uint64_t v23 = (char *)v135[2];
      ((void (*)(char *, uint64_t, uint64_t))v23)(v142, v22, v4);
      uint64_t v149 = v18;
      uint64_t v24 = v141;
      uint64_t v143 = v23;
      ((void (*)(char *, uint64_t, uint64_t))v23)(v141, v20 + v21 * (void)v133, v4);
      uint64_t v25 = v142;
      long long v148 = (char *)sub_1C69E1648();
      uint64_t v147 = sub_1C69E1648();
      uint64_t v26 = v4;
      int64_t v27 = (void (*)(char *, uint64_t))v135[1];
      uint64_t v28 = v133;
      v27(v24, v26);
      v27(v25, v26);
      uint64_t v18 = v149;
      uint64_t v19 = (uint64_t)(v28 + 2);
      uint64_t v151 = v21;
      if ((uint64_t)(v28 + 2) < v149)
      {
        uint64_t v126 = v2;
        uint64_t v130 = v17;
        uint64_t v29 = v136;
        uint64_t v137 = v21 * v19;
        v138 *= v21;
        while (1)
        {
          int v30 = v147 < (uint64_t)v148;
          uint64_t v32 = v142;
          uint64_t v31 = v143;
          uint64_t v33 = v145;
          ((void (*)(char *, char *, uint64_t))v143)(v142, &v29[v137], v145);
          id v34 = v141;
          ((void (*)(char *, char *, uint64_t))v31)(v141, &v29[v138], v33);
          uint64_t v35 = sub_1C69E1648();
          int v36 = sub_1C69E1648() >= v35;
          v27(v34, v33);
          v27(v32, v33);
          if (v30 == v36) {
            break;
          }
          ++v19;
          v29 += v151;
          uint64_t v18 = v149;
          if (v19 >= v149)
          {
            uint64_t v19 = v149;
            uint64_t v17 = v130;
            a1 = v144;
            uint64_t v2 = v126;
            uint64_t v28 = v133;
            goto LABEL_12;
          }
        }
        uint64_t v17 = v130;
        a1 = v144;
        uint64_t v2 = v126;
        uint64_t v28 = v133;
        uint64_t v18 = v149;
      }
LABEL_12:
      uint64_t v4 = v145;
      if (v147 < (uint64_t)v148)
      {
        uint64_t v37 = v151;
        if (v19 < (uint64_t)v28) {
          goto LABEL_141;
        }
        if ((uint64_t)v28 < v19)
        {
          uint64_t v130 = v17;
          uint64_t v38 = v28;
          uint64_t v39 = 0;
          uint64_t v40 = v151 * (v19 - 1);
          uint64_t v41 = v19 * v151;
          uint64_t v42 = v38;
          uint64_t v43 = (void)v38 * v151;
          uint64_t v143 = (char *)v19;
          do
          {
            if (v42 != (char *)(v19 + v39 - 1))
            {
              uint64_t v44 = v136;
              if (!v136) {
                goto LABEL_147;
              }
              uint64_t v45 = v2;
              uint64_t v46 = &v136[v43];
              uint64_t v147 = (uint64_t)&v136[v40];
              uint64_t v47 = v145;
              long long v148 = *v150;
              ((void (*)(char *, char *, uint64_t))v148)(v132, &v136[v43], v145);
              if (v43 < v40 || v46 >= &v44[v41])
              {
                uint64_t v49 = v147;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v49 = v147;
                if (v43 != v40) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              ((void (*)(uint64_t, char *, uint64_t))v148)(v49, v132, v47);
              uint64_t v2 = v45;
              uint64_t v19 = (uint64_t)v143;
              uint64_t v37 = v151;
            }
            ++v42;
            --v39;
            v40 -= v37;
            v41 -= v37;
            v43 += v37;
          }
          while ((uint64_t)v42 < v19 + v39);
          uint64_t v17 = v130;
          a1 = v144;
          uint64_t v4 = v145;
          uint64_t v28 = v133;
          uint64_t v18 = v149;
        }
      }
    }
    if (v19 < v18)
    {
      if (__OFSUB__(v19, v28)) {
        goto LABEL_139;
      }
      if (v19 - (uint64_t)v28 < v127)
      {
        if (__OFADD__(v28, v127)) {
          goto LABEL_142;
        }
        if ((uint64_t)&v28[v127] >= v18) {
          unint64_t v50 = (char *)v18;
        }
        else {
          unint64_t v50 = &v28[v127];
        }
        if ((uint64_t)v50 < (uint64_t)v28) {
          goto LABEL_143;
        }
        if ((char *)v19 != v50)
        {
          uint64_t v130 = v17;
          uint64_t v126 = v2;
          uint64_t v51 = v135[9];
          char v136 = (char *)v135[2];
          uint64_t v137 = v51;
          uint64_t v151 = v51 * (v19 - 1);
          uint64_t v52 = v19 * v51;
          uint64_t v131 = (uint64_t)v50;
          do
          {
            uint64_t v53 = 0;
            uint64_t v143 = (char *)v19;
            uint64_t v138 = v52;
            while (1)
            {
              long long v148 = v28;
              uint64_t v54 = v144;
              uint64_t v55 = *v144;
              uint64_t v147 = v52 + v53;
              uint64_t v56 = v52 + v53 + v55;
              uint64_t v57 = v142;
              uint64_t v58 = (void (*)(char *, uint64_t, uint64_t))v136;
              ((void (*)(char *, uint64_t, uint64_t))v136)(v142, v56, v4);
              uint64_t v59 = v141;
              v58(v141, v151 + v53 + v55, v4);
              uint64_t v60 = sub_1C69E1648();
              uint64_t v149 = sub_1C69E1648();
              uint64_t v61 = *v139;
              (*v139)(v59, v4);
              v61(v57, v4);
              if (v149 >= v60) {
                break;
              }
              uint64_t v62 = *v54;
              if (!*v54) {
                goto LABEL_145;
              }
              uint64_t v52 = v138;
              uint64_t v63 = v62 + v151 + v53;
              unint64_t v64 = *v150;
              uint64_t v4 = v145;
              ((void (*)(char *, uint64_t, uint64_t))*v150)(v146, v62 + v138 + v53, v145);
              swift_arrayInitWithTakeFrontToBack();
              ((void (*)(uint64_t, char *, uint64_t))v64)(v63, v146, v4);
              v53 -= v137;
              uint64_t v28 = v148 + 1;
              unint64_t v65 = v143;
              if (v143 == v148 + 1) {
                goto LABEL_45;
              }
            }
            uint64_t v4 = v145;
            unint64_t v65 = v143;
            uint64_t v52 = v138;
LABEL_45:
            uint64_t v19 = (uint64_t)(v65 + 1);
            v151 += v137;
            v52 += v137;
            uint64_t v28 = v133;
          }
          while (v19 != v131);
          uint64_t v19 = v131;
          uint64_t v2 = v126;
          uint64_t v17 = v130;
          a1 = v144;
        }
      }
    }
    if (v19 < (uint64_t)v28) {
      goto LABEL_138;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v17 = sub_1C69C4F14(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v67 = *((void *)v17 + 2);
    unint64_t v66 = *((void *)v17 + 3);
    unint64_t v68 = v67 + 1;
    if (v67 >= v66 >> 1) {
      uint64_t v17 = sub_1C69C4F14((char *)(v66 > 1), v67 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v68;
    unint64_t v69 = v17 + 32;
    uint64_t v70 = &v17[16 * v67 + 32];
    *(void *)uint64_t v70 = v133;
    *((void *)v70 + 1) = v19;
    uint64_t v143 = (char *)v19;
    if (v67) {
      break;
    }
    unint64_t v68 = 1;
    uint64_t v4 = v145;
LABEL_96:
    uint64_t v18 = a1[1];
    char v16 = v143;
    if ((uint64_t)v143 >= v18) {
      goto LABEL_102;
    }
  }
  uint64_t v4 = v145;
  while (1)
  {
    unint64_t v71 = v68 - 1;
    if (v68 >= 4)
    {
      uint64_t v76 = &v69[16 * v68];
      uint64_t v77 = *((void *)v76 - 8);
      uint64_t v78 = *((void *)v76 - 7);
      BOOL v82 = __OFSUB__(v78, v77);
      uint64_t v79 = v78 - v77;
      if (v82) {
        goto LABEL_123;
      }
      uint64_t v81 = *((void *)v76 - 6);
      uint64_t v80 = *((void *)v76 - 5);
      BOOL v82 = __OFSUB__(v80, v81);
      uint64_t v74 = v80 - v81;
      char v75 = v82;
      if (v82) {
        goto LABEL_124;
      }
      unint64_t v83 = v68 - 2;
      uint64_t v84 = &v69[16 * v68 - 32];
      uint64_t v86 = *(void *)v84;
      uint64_t v85 = *((void *)v84 + 1);
      BOOL v82 = __OFSUB__(v85, v86);
      uint64_t v87 = v85 - v86;
      if (v82) {
        goto LABEL_125;
      }
      BOOL v82 = __OFADD__(v74, v87);
      uint64_t v88 = v74 + v87;
      if (v82) {
        goto LABEL_127;
      }
      if (v88 >= v79)
      {
        int v106 = &v69[16 * v71];
        uint64_t v108 = *(void *)v106;
        uint64_t v107 = *((void *)v106 + 1);
        BOOL v82 = __OFSUB__(v107, v108);
        uint64_t v109 = v107 - v108;
        if (v82) {
          goto LABEL_133;
        }
        BOOL v99 = v74 < v109;
        goto LABEL_85;
      }
    }
    else
    {
      if (v68 != 3)
      {
        uint64_t v100 = *((void *)v17 + 4);
        uint64_t v101 = *((void *)v17 + 5);
        BOOL v82 = __OFSUB__(v101, v100);
        uint64_t v93 = v101 - v100;
        char v94 = v82;
        goto LABEL_79;
      }
      uint64_t v73 = *((void *)v17 + 4);
      uint64_t v72 = *((void *)v17 + 5);
      BOOL v82 = __OFSUB__(v72, v73);
      uint64_t v74 = v72 - v73;
      char v75 = v82;
    }
    if (v75) {
      goto LABEL_126;
    }
    unint64_t v83 = v68 - 2;
    uint64_t v89 = &v69[16 * v68 - 32];
    uint64_t v91 = *(void *)v89;
    uint64_t v90 = *((void *)v89 + 1);
    BOOL v92 = __OFSUB__(v90, v91);
    uint64_t v93 = v90 - v91;
    char v94 = v92;
    if (v92) {
      goto LABEL_128;
    }
    uint64_t v95 = &v69[16 * v71];
    uint64_t v97 = *(void *)v95;
    uint64_t v96 = *((void *)v95 + 1);
    BOOL v82 = __OFSUB__(v96, v97);
    uint64_t v98 = v96 - v97;
    if (v82) {
      goto LABEL_130;
    }
    if (__OFADD__(v93, v98)) {
      goto LABEL_132;
    }
    if (v93 + v98 >= v74)
    {
      BOOL v99 = v74 < v98;
LABEL_85:
      if (v99) {
        unint64_t v71 = v83;
      }
      goto LABEL_87;
    }
LABEL_79:
    if (v94) {
      goto LABEL_129;
    }
    uint64_t v102 = &v69[16 * v71];
    uint64_t v104 = *(void *)v102;
    uint64_t v103 = *((void *)v102 + 1);
    BOOL v82 = __OFSUB__(v103, v104);
    uint64_t v105 = v103 - v104;
    if (v82) {
      goto LABEL_131;
    }
    if (v105 < v93) {
      goto LABEL_96;
    }
LABEL_87:
    unint64_t v110 = v71 - 1;
    if (v71 - 1 >= v68)
    {
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
      goto LABEL_134;
    }
    uint64_t v111 = *a1;
    if (!*a1) {
      goto LABEL_146;
    }
    uint64_t v112 = v17;
    uint64_t v113 = &v69[16 * v110];
    uint64_t v114 = *(void *)v113;
    uint64_t v115 = &v69[16 * v71];
    uint64_t v116 = *((void *)v115 + 1);
    sub_1C69C49EC(v111 + v135[9] * *(void *)v113, v111 + v135[9] * *(void *)v115, v111 + v135[9] * v116, v134);
    if (v2) {
      break;
    }
    if (v116 < v114) {
      goto LABEL_120;
    }
    if (v71 > *((void *)v112 + 2)) {
      goto LABEL_121;
    }
    *(void *)uint64_t v113 = v114;
    *(void *)&v69[16 * v110 + 8] = v116;
    unint64_t v117 = *((void *)v112 + 2);
    if (v71 >= v117) {
      goto LABEL_122;
    }
    uint64_t v17 = v112;
    unint64_t v68 = v117 - 1;
    memmove(&v69[16 * v71], v115 + 16, 16 * (v117 - 1 - v71));
    *((void *)v112 + 2) = v117 - 1;
    BOOL v99 = v117 > 2;
    a1 = v144;
    uint64_t v4 = v145;
    if (!v99) {
      goto LABEL_96;
    }
  }
LABEL_114:
  swift_bridgeObjectRelease();
  if (v129 >= -1) {
    goto LABEL_117;
  }
  __break(1u);
LABEL_116:
  swift_bridgeObjectRelease();
  if (v129 >= -1)
  {
LABEL_117:
    *(void *)(v128 + 16) = 0;
    swift_bridgeObjectRelease();
    return;
  }
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
}

uint64_t sub_1C69C4700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v35 = a1;
  uint64_t v7 = sub_1C69E1668();
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v45 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v40 = (char *)&v33 - v11;
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v39 = (char *)&v33 - v14;
  uint64_t v43 = a3;
  uint64_t v34 = a2;
  if (a3 != a2)
  {
    char v16 = *(void (**)(void, void, void))(v13 + 16);
    uint64_t v15 = v13 + 16;
    uint64_t v17 = *(void *)(v15 + 56);
    int v36 = (uint64_t (**)(char *, uint64_t))(v15 - 8);
    uint64_t v37 = (void (*)(char *, uint64_t, uint64_t))v16;
    uint64_t v38 = v15;
    uint64_t v44 = (uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v49 = v17 * (v43 - 1);
    uint64_t v41 = v17;
    uint64_t v18 = v17 * v43;
    uint64_t v48 = a4;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v46 = v35;
      uint64_t v42 = v18;
      do
      {
        uint64_t v20 = *v48;
        uint64_t v21 = v18 + v19 + *v48;
        uint64_t v22 = v39;
        uint64_t v23 = v37;
        v37(v39, v21, v7);
        uint64_t v24 = v7;
        uint64_t v25 = v40;
        v23(v40, v49 + v19 + v20, v24);
        uint64_t v47 = sub_1C69E1648();
        uint64_t v26 = sub_1C69E1648();
        int64_t v27 = *v36;
        uint64_t v28 = v25;
        uint64_t v7 = v24;
        (*v36)(v28, v24);
        uint64_t v29 = v22;
        uint64_t v18 = v42;
        uint64_t result = v27(v29, v24);
        if (v26 >= v47) {
          break;
        }
        uint64_t v30 = *v48;
        if (!*v48)
        {
          __break(1u);
          return result;
        }
        uint64_t v31 = (char *)(v30 + v49 + v19);
        uint64_t v32 = *v44;
        (*v44)(v45, v30 + v18 + v19, v24);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = v32(v31, (uint64_t)v45, v24);
        v19 -= v41;
        ++v46;
      }
      while (v43 != v46);
      v49 += v41;
      v18 += v41;
      if (++v43 != v34) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_1C69C49EC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v74 = sub_1C69E1668();
  uint64_t v8 = *(void *)(v74 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v74);
  unint64_t v71 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v70 = (char *)&v60 - v11;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  int64_t v14 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_76;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_77;
  }
  unint64_t v18 = a2;
  uint64_t v19 = v14 / v13;
  uint64_t v20 = v16 / v13;
  uint64_t v69 = v13;
  if (v14 / v13 >= v16 / v13)
  {
    sub_1C69A7C9C(v18, v16 / v13);
    uint64_t v37 = v20 * v13;
    unint64_t v38 = v18;
    uint64_t v21 = (char *)(a4 + v37);
    if (v37 >= 1 && a1 < v18)
    {
      uint64_t v64 = -v13;
      uint64_t v42 = *(void (**)(char *))(v8 + 16);
      uint64_t v68 = v8 + 16;
      uint64_t v62 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v63 = v42;
      unint64_t v61 = a4;
      unint64_t v72 = a1;
      uint64_t v43 = v71;
      do
      {
        uint64_t v44 = (char *)a3;
        uint64_t v46 = v63;
        uint64_t v45 = v64;
        unint64_t v67 = v44;
        uint64_t v73 = &v44[v64];
        uint64_t v47 = v70;
        unint64_t v66 = (void (**)(char *, uint64_t))&v21[v64];
        uint64_t v48 = v74;
        uint64_t v49 = (char *)v38;
        unint64_t v50 = v21;
        v63(v70);
        unint64_t v65 = v38 + v45;
        v46(v43);
        uint64_t v51 = sub_1C69E1648();
        uint64_t v52 = sub_1C69E1648();
        uint64_t v53 = *v62;
        (*v62)(v43, v48);
        v53(v47, v48);
        if (v52 >= v51)
        {
          a3 = (unint64_t)v73;
          BOOL v56 = v67 < v50 || v73 >= v50;
          unint64_t v38 = (unint64_t)v49;
          if (v56)
          {
            uint64_t v57 = v66;
            swift_arrayInitWithTakeFrontToBack();
            uint64_t v21 = (char *)v57;
            a4 = v61;
            uint64_t v13 = v69;
            unint64_t v55 = v72;
          }
          else
          {
            a4 = v61;
            uint64_t v13 = v69;
            unint64_t v55 = v72;
            if (v67 == v50)
            {
              uint64_t v21 = (char *)v66;
            }
            else
            {
              uint64_t v58 = v66;
              swift_arrayInitWithTakeBackToFront();
              uint64_t v21 = (char *)v58;
            }
          }
        }
        else
        {
          a3 = (unint64_t)v73;
          if (v67 < v49 || v73 >= v49)
          {
            unint64_t v38 = v65;
            swift_arrayInitWithTakeFrontToBack();
            a4 = v61;
            uint64_t v13 = v69;
            unint64_t v55 = v72;
          }
          else
          {
            a4 = v61;
            unint64_t v55 = v72;
            unint64_t v38 = v65;
            if (v67 != v49) {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v13 = v69;
          }
          uint64_t v21 = v50;
        }
      }
      while ((unint64_t)v21 > a4 && v38 > v55);
    }
  }
  else
  {
    sub_1C69A7C9C(a1, v14 / v13);
    uint64_t v21 = (char *)(a4 + v19 * v13);
    if (v19 * v13 >= 1 && v18 < a3)
    {
      unint64_t v23 = v18;
      uint64_t v73 = (char *)a3;
      unint64_t v67 = *(char **)(v8 + 16);
      uint64_t v68 = v8 + 16;
      unint64_t v65 = a4 + v19 * v13;
      unint64_t v66 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v24 = v74;
      do
      {
        unint64_t v72 = a1;
        uint64_t v25 = v70;
        uint64_t v26 = v67;
        ((void (*)(char *, unint64_t, uint64_t))v67)(v70, v23, v24);
        int64_t v27 = v71;
        ((void (*)(char *, unint64_t, uint64_t))v26)(v71, a4, v24);
        unint64_t v28 = v23;
        uint64_t v29 = sub_1C69E1648();
        uint64_t v30 = sub_1C69E1648();
        uint64_t v31 = *v66;
        (*v66)(v27, v24);
        v31(v25, v24);
        if (v30 >= v29)
        {
          uint64_t v13 = v69;
          unint64_t v33 = v72;
          if (v72 < a4 || v72 >= a4 + v69)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v72 != a4)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v32 = v28;
          a4 += v13;
        }
        else
        {
          uint64_t v13 = v69;
          unint64_t v32 = v28 + v69;
          unint64_t v33 = v72;
          if (v72 < v28 || v72 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v72 != v28)
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        uint64_t v21 = (char *)v65;
        a1 = v33 + v13;
        BOOL v36 = a4 >= v65 || v32 >= (unint64_t)v73;
        unint64_t v23 = v32;
      }
      while (!v36);
    }
  }
  uint64_t v40 = &v21[-a4];
  if (v13 != -1 || v40 != (char *)0x8000000000000000)
  {
    sub_1C69A7C9C(a4, (uint64_t)v40 / v13);
    return;
  }
LABEL_78:
  __break(1u);
}

char *sub_1C69C4F14(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443348);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1C69C500C(uint64_t a1)
{
  return sub_1C69C4F14(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_1C69C5020(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C69E1CE8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setActionIdentifier_, v4);
}

void sub_1C69C5084(uint64_t a1, void *a2)
{
  sub_1C69E1BE8();
  id v3 = (id)sub_1C69E1DA8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setParameters_, v3);
}

void sub_1C69C50F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C69E1CE8();
  objc_msgSend(a3, sel_setKey_, v4);
}

void sub_1C69C5150(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C69E1CE8();
  objc_msgSend(a3, sel_setValue_, v4);
}

uint64_t sub_1C69C51A8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C69E2098();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1C69E2098();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C69C5D84(&qword_1EA443340, &qword_1EA443338);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443338);
            uint64_t v10 = sub_1C69C54E0(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C69C2B84((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C69C5344(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C69E2098();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1C69E2098();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C69C5D84(&qword_1EA4432E0, &qword_1EA4432D8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4432D8);
            uint64_t v10 = sub_1C69C554C(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C69C2C80((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1C69C54E0(uint64_t **a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_1C69C55FC(v6, a2, a3);
  return sub_1C69C5548;
}

uint64_t (*sub_1C69C554C(void *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C69C5680(v6, a2, a3);
  return sub_1C69C5548;
}

void sub_1C69C55B4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1C69C55FC(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1C69C3028(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x1C87A7240](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return j__OUTLINED_FUNCTION_47_0;
}

void (*sub_1C69C5680(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1C69C3028(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1C87A7240](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_1C69C5700;
}

void sub_1C69C5700(id *a1)
{
}

uint64_t sub_1C69C570C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_1C69C575C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

unint64_t sub_1C69C5798()
{
  unint64_t result = qword_1EA443230;
  if (!qword_1EA443230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443230);
  }
  return result;
}

uint64_t sub_1C69C57E4()
{
  return type metadata accessor for SiriHelpDispatcher();
}

uint64_t type metadata accessor for SiriHelpDispatcher()
{
  uint64_t result = qword_1EA443270;
  if (!qword_1EA443270) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C69C5834()
{
  uint64_t result = sub_1C69E05E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriHelpDispatcherErrors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriHelpDispatcherErrors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C69C59F4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriHelpDispatcherErrors()
{
  return &type metadata for SiriHelpDispatcherErrors;
}

uint64_t sub_1C69C5A2C()
{
  sub_1C69E1538();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 72) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62();
  v8();
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1C69C5AEC()
{
  uint64_t v1 = sub_1C69E1538();
  OUTLINED_FUNCTION_26_2(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  void *v2 = v0;
  v2[1] = sub_1C6991498;
  OUTLINED_FUNCTION_55();
  return sub_1C69C0184(v3, v4, v5, v6, v7, v8);
}

void sub_1C69C5BE8()
{
}

void sub_1C69C5C54()
{
}

uint64_t sub_1C69C5C68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C69C5CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69C5D0C(uint64_t a1)
{
  return sub_1C69C0E48(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_1C69C5D2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_33_1();
  v4();
  return a2;
}

uint64_t sub_1C69C5D84(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C69C5DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return OUTLINED_FUNCTION_47_0();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1C69C5E84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C69C5ECC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C69C5EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = type metadata accessor for SiriHelpResponseVersionInvoker();
  uint64_t v26 = &off_1F218FCE8;
  *(void *)&long long v24 = a1;
  uint64_t v22 = sub_1C69E1968();
  uint64_t v23 = MEMORY[0x1E4FA4BC0];
  *(void *)(a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_staticSuggestionsCount) = 3;
  *(void *)&long long v21 = a7;
  *(void *)(a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals) = a2;
  sub_1C69C6114(a3, a8 + 16);
  *(void *)(a8 + 56) = a4;
  uint64_t v16 = a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_templatesUrl;
  uint64_t v17 = sub_1C69E05E8();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a5, v17);
  sub_1C69C6114(a6, a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils);
  sub_1C69E0FA8();
  uint64_t v19 = sub_1C69E0F98();
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a5, v17);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  *(void *)(a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_siriFeatureSupportPolicyProvider) = v19;
  sub_1C69958A4(&v24, a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker);
  sub_1C69958A4(&v21, a8 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_featureFlagProvider);
  return a8;
}

void *sub_1C69C6080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = sub_1C69E1968();
  uint64_t v11 = MEMORY[0x1E4FA4BC0];
  a5[5] = v10;
  a5[6] = v11;
  a5[2] = a1;
  a5[10] = type metadata accessor for SiriHelpResponseFramework1Invoker(0);
  a5[11] = &off_1F218FCD8;
  a5[7] = a2;
  uint64_t v12 = type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  a5[15] = v12;
  a5[16] = &off_1F218FCC8;
  a5[12] = a3;
  a5[20] = v12;
  a5[21] = &off_1F218FCC8;
  a5[17] = a4;
  return a5;
}

uint64_t sub_1C69C6114(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_9_2();
  (*v3)(a2);
  return a2;
}

uint64_t sub_1C69C6174(uint64_t a1)
{
  return sub_1C69C5D0C(a1) & 1;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return *(void *)(v0 + 1280);
}

void OUTLINED_FUNCTION_11_3()
{
  sub_1C69C336C();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_19_3@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void OUTLINED_FUNCTION_20_2()
{
  sub_1C69C336C();
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_51_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return v0 + 8;
}

void OUTLINED_FUNCTION_66_0()
{
  sub_1C69C336C();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return *(void *)(v0 + 1272);
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_77_0()
{
  return sub_1C69E20E8();
}

uint64_t OUTLINED_FUNCTION_82_0(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t sub_1C69C660C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_1C69E2188();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_1C69E2188() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C69C66D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D18);
  uint64_t result = sub_1C69E1C98();
  qword_1EBC07CB0 = result;
  return result;
}

uint64_t sub_1C69C671C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    BOOL v9 = a3 == a1 && a2 == a4;
    if (v9 || (sub_1C69E2188() & 1) != 0)
    {
      uint64_t v10 = qword_1EBC08528[0];
      swift_bridgeObjectRetain();
      if (v10 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1C69E1C68();
      OUTLINED_FUNCTION_2_6(v11, (uint64_t)qword_1EBC085A8);
      swift_bridgeObjectRetain();
      BOOL v12 = (void *)sub_1C69E1C48();
      os_log_type_t v13 = sub_1C69E1EC8();
      if (OUTLINED_FUNCTION_9_3(v13))
      {
        swift_slowAlloc();
        OUTLINED_FUNCTION_7_4();
        uint64_t v14 = OUTLINED_FUNCTION_6_6(4.8151e-34);
        OUTLINED_FUNCTION_3_6(v14);
        OUTLINED_FUNCTION_0_1();
        OUTLINED_FUNCTION_10_3();
        uint64_t v15 = OUTLINED_FUNCTION_4_4();
        OUTLINED_FUNCTION_5_5(v15);
        OUTLINED_FUNCTION_1_6();
        swift_bridgeObjectRelease_n();
        uint64_t v18 = "Access to %s is allowed for %s as it is the same process";
LABEL_11:
        OUTLINED_FUNCTION_11_4(&dword_1C698D000, v16, v17, v18);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_17();

        return 1;
      }
      goto LABEL_23;
    }
    uint64_t v24 = *(void *)(v4 + 16);
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)sub_1C69B7E7C(a3, a4, v24);
    if (v25)
    {
      char v26 = sub_1C69C660C(a1, a2, v25);
      swift_bridgeObjectRelease();
      if (v26)
      {
        if (qword_1EBC08528[0] != -1) {
          swift_once();
        }
        uint64_t v27 = sub_1C69E1C68();
        OUTLINED_FUNCTION_2_6(v27, (uint64_t)qword_1EBC085A8);
        swift_bridgeObjectRetain();
        BOOL v12 = (void *)sub_1C69E1C48();
        os_log_type_t v28 = sub_1C69E1EC8();
        if (OUTLINED_FUNCTION_9_3(v28))
        {
          swift_slowAlloc();
          OUTLINED_FUNCTION_7_4();
          uint64_t v29 = OUTLINED_FUNCTION_6_6(4.8151e-34);
          OUTLINED_FUNCTION_3_6(v29);
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_10_3();
          uint64_t v30 = OUTLINED_FUNCTION_4_4();
          OUTLINED_FUNCTION_5_5(v30);
          OUTLINED_FUNCTION_1_6();
          swift_bridgeObjectRelease_n();
          uint64_t v18 = "Access to %s is allowed for %s";
          goto LABEL_11;
        }
LABEL_23:

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        return 1;
      }
    }
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    uint64_t v32 = sub_1C69E1C68();
    OUTLINED_FUNCTION_2_6(v32, (uint64_t)qword_1EBC085A8);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1C69E1C48();
    os_log_type_t v33 = sub_1C69E1EE8();
    if (OUTLINED_FUNCTION_9_3(v33))
    {
      swift_slowAlloc();
      OUTLINED_FUNCTION_7_4();
      uint64_t v34 = OUTLINED_FUNCTION_6_6(4.8151e-34);
      OUTLINED_FUNCTION_3_6(v34);
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_10_3();
      uint64_t v35 = OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_5_5(v35);
      OUTLINED_FUNCTION_1_6();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_11_4(&dword_1C698D000, v36, v37, "Access to %s for %s is not allowed");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      goto LABEL_29;
    }

    swift_bridgeObjectRelease_n();
LABEL_31:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1C69E1C68();
  OUTLINED_FUNCTION_2_6(v19, (uint64_t)qword_1EBC085A8);
  uint64_t v20 = sub_1C69E1C48();
  os_log_type_t v21 = sub_1C69E1EE8();
  if (!os_log_type_enabled(v20, v21))
  {

    goto LABEL_31;
  }
  uint64_t v22 = (uint8_t *)swift_slowAlloc();
  swift_slowAlloc();
  *(_DWORD *)uint64_t v22 = 136315138;
  uint64_t v23 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3_6(v23);
  sub_1C69E1F28();
  OUTLINED_FUNCTION_10_3();
  _os_log_impl(&dword_1C698D000, v20, v21, "No remote application Id set. Refusing access to %s", v22, 0xCu);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_17();
LABEL_29:
  OUTLINED_FUNCTION_17();

  return 0;
}

uint64_t sub_1C69C6BE0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for XPCAccessList()
{
  return self;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_2_6(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_1C69A8148(v2, v1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_1C69A8148(v2, v1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_6_6(float a1)
{
  *unint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_9_3(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_11_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_1C69C6DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 16)
                                                                                              + **(int **)(a7 + 16));
  uint64_t v14 = swift_task_alloc();
  uint64_t v15 = (void *)OUTLINED_FUNCTION_3_7(v14);
  *uint64_t v15 = v16;
  v15[1] = sub_1C6990AC8;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C69C6ED4()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_3_7(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_1C6990AC8;
  uint64_t v3 = OUTLINED_FUNCTION_1_7();
  return v4(v3);
}

uint64_t sub_1C69C6FB8()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_3_7(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_1C69960DC;
  uint64_t v3 = OUTLINED_FUNCTION_1_7();
  return v4(v3);
}

uint64_t sub_1C69C709C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 40)
                                                                                     + **(int **)(a6 + 40));
  uint64_t v12 = swift_task_alloc();
  os_log_type_t v13 = (void *)OUTLINED_FUNCTION_3_7(v12);
  *os_log_type_t v13 = v14;
  v13[1] = sub_1C698F848;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t dispatch thunk of HintsStateStore.submit(for:propertyKey:propertyValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 16)
                                                                                              + **(int **)(a7 + 16));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1C69A70EC;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

INInteraction __swiftcall INInteraction.init(intent:response:donatedBySiri:)(INIntent intent, INIntentResponse response, Swift::Bool donatedBySiri)
{
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIntent_response_, intent.super.isa, response.super.isa);
  objc_msgSend(v6, sel__setDonatedBySiri_, donatedBySiri);

  return (INInteraction)v6;
}

uint64_t sub_1C69C73A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1C69C73C0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_1C69C304C);
}

uint64_t sub_1C69C73C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_1C69E2198();
  swift_unknownObjectRetain_n();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v10 = a5(a1, a2, a3, a4);
    goto LABEL_9;
  }
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v10;
}

uint64_t static EventDrivenSuggestionsClient.getInteractionBuilder@Sendable (event:inAppIdentifier:deviceState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  sub_1C69E1818();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C6995840(a1, (uint64_t)v13);
  OUTLINED_FUNCTION_38_2();
  v9();
  sub_1C6995840(a2, (uint64_t)v12);
  uint64_t v10 = type metadata accessor for EventDrivenInteractionBuilder(0);
  swift_allocObject();
  uint64_t result = EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(v13, (uint64_t)v8, v12);
  a3[3] = v10;
  a3[4] = (uint64_t)&protocol witness table for EventDrivenInteractionBuilder;
  *a3 = result;
  return result;
}

uint64_t EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v10 = swift_allocObject();
  EventDrivenSuggestionsClient.init(clock:suggestionService:interactionBuilder:requestIdProvider:)(v8, v7, v6, v5, a5);
  return v10;
}

void *EventDrivenSuggestionsClient.init(clock:suggestionService:interactionBuilder:requestIdProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v18 = a5;
  OUTLINED_FUNCTION_35_1();
  uint64_t v10 = sub_1C69E1198();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  sub_1C69E1818();
  type metadata accessor for Connection(0);
  sub_1C69D0564(&qword_1EBC07DC8, MEMORY[0x1E4FA48C8]);
  v5[14] = sub_1C69E1C98();
  sub_1C69E1168();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))((uint64_t)v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_eventConfig, v15, v10);
  sub_1C69958A4(v9, (uint64_t)(v5 + 15));
  sub_1C69958A4(v8, (uint64_t)(v5 + 20));
  v5[25] = v7;
  v5[26] = v6;
  sub_1C69958A4(v18, (uint64_t)v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider);
  return v5;
}

uint64_t type metadata accessor for Connection(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EBC07F58);
}

uint64_t sub_1C69C77BC()
{
  OUTLINED_FUNCTION_6_0();
  v1[6] = v2;
  v1[7] = v0;
  v1[5] = v3;
  uint64_t v4 = sub_1C69E1818();
  v1[8] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[9] = v5;
  v1[10] = OUTLINED_FUNCTION_9_4();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D70);
  OUTLINED_FUNCTION_44(v6);
  v1[13] = OUTLINED_FUNCTION_24();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D68);
  v1[14] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[15] = v8;
  v1[16] = OUTLINED_FUNCTION_9_4();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C69C78E0()
{
  uint64_t v60 = v0;
  uint64_t v4 = (void *)v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[5];
  OUTLINED_FUNCTION_3_3();
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1C69CDE34(v7, v6, v5);
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x1E4FBC860];
  uint64_t v58 = MEMORY[0x1E4FBC860];
  sub_1C69CE81C(v8, &v59);
  sub_1C69CE858(v4);
  uint64_t v53 = v9;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v3) != 1)
  {
    unint64_t v1 = v0[15];
    uint64_t v53 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v27 = (uint64_t *)v0[19];
      sub_1C69D04E8(v0[13], (uint64_t)v27, &qword_1EBC07D68);
      uint64_t v28 = v0[19];
      if (*v27 <= 1)
      {
        sub_1C6995768(v28, &qword_1EBC07D68);
      }
      else
      {
        sub_1C69D04E8(v28, v0[18], &qword_1EBC07D68);
        uint64_t v29 = v53;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C69C3328();
          uint64_t v29 = v58;
        }
        unint64_t v30 = *(void *)(v29 + 16);
        if (v30 >= *(void *)(v29 + 24) >> 1)
        {
          sub_1C69C3328();
          uint64_t v29 = v58;
        }
        uint64_t v31 = v0[18];
        *(void *)(v29 + 16) = v30 + 1;
        uint64_t v53 = v29;
        sub_1C69D04E8(v31, v29+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v30, &qword_1EBC07D68);
      }
      os_log_type_t v33 = (void *)v0[13];
      uint64_t v32 = v0[14];
      sub_1C69CE858(v33);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v32) != 1);
  }
  uint64_t v10 = v0[13];
  sub_1C69B60D4();
  sub_1C6995768(v10, &qword_1EBC07D70);
  uint64_t v11 = *(void *)(v53 + 16);
  BOOL v56 = v0;
  if (v11)
  {
    uint64_t v12 = v0[15];
    uint64_t v55 = v0[14];
    uint64_t v13 = v0[9];
    uint64_t v59 = v9;
    sub_1C69C32C4();
    uint64_t v14 = v53 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v54 = *(void *)(v12 + 72);
    uint64_t v2 = (void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32);
    uint64_t v15 = v59;
    do
    {
      uint64_t v57 = v11;
      uint64_t v16 = v0[16];
      uint64_t v17 = v0[17];
      unint64_t v18 = v0[12];
      uint64_t v19 = v2;
      uint64_t v20 = v0[8];
      sub_1C69C5D2C(v14, v17, &qword_1EBC07D68);
      uint64_t v21 = v16 + *(int *)(v55 + 48);
      OUTLINED_FUNCTION_33_1();
      v22();
      uint64_t v23 = *v19;
      uint64_t v24 = v20;
      uint64_t v2 = v19;
      (*v19)(v18, v21, v24);
      sub_1C6995768(v17, &qword_1EBC07D68);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C69C32C4();
        uint64_t v15 = v59;
      }
      unint64_t v1 = *(void *)(v15 + 16);
      uint64_t v0 = v56;
      if (v1 >= *(void *)(v15 + 24) >> 1)
      {
        sub_1C69C32C4();
        uint64_t v15 = v59;
      }
      uint64_t v25 = v56[12];
      uint64_t v26 = v56[8];
      *(void *)(v15 + 16) = v1 + 1;
      v23(v15+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v1, v25, v26);
      uint64_t v59 = v15;
      v14 += v54;
      uint64_t v11 = v57 - 1;
    }
    while (v57 != 1);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v15 = MEMORY[0x1E4FBC860];
  }
  v0[20] = v15;
  uint64_t v34 = *(void *)(v15 + 16);
  v0[21] = v34;
  if (v34)
  {
    uint64_t v35 = v0[9];
    uint64_t v36 = *(void *)(v35 + 16);
    v35 += 16;
    *((_DWORD *)v0 + 54) = *(_DWORD *)(v35 + 64);
    v0[22] = *(void *)(v35 + 56);
    v0[23] = v36;
    v0[24] = 0;
    OUTLINED_FUNCTION_38_2();
    v37();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v38 = OUTLINED_FUNCTION_60_0();
    __swift_project_value_buffer(v38, (uint64_t)qword_1EBC085C0);
    OUTLINED_FUNCTION_38_2();
    ((void (*)(void))v1)();
    swift_retain_n();
    uint64_t v39 = (void *)sub_1C69E1C48();
    os_log_type_t v40 = sub_1C69E1EC8();
    BOOL v41 = OUTLINED_FUNCTION_26_3(v40);
    uint64_t v42 = v0[10];
    if (v41)
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v59 = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v43 = 136315394;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v44 = OUTLINED_FUNCTION_43_0();
      uint64_t v2 = (void (**)(unint64_t, uint64_t, uint64_t))v45;
      *(void *)(v43 + 4) = sub_1C69A8148(v44, v45, &v59);
      swift_bridgeObjectRelease();
      uint64_t v46 = OUTLINED_FUNCTION_13_2();
      ((void (*)(uint64_t))v2)(v46);
      OUTLINED_FUNCTION_57_0();
      *(void *)(v43 + 14) = v42;
      swift_release();
      OUTLINED_FUNCTION_74_1(&dword_1C698D000, v47, v48, "Disconnecting expired connection: %s. # Remaining connections: %ld");
      OUTLINED_FUNCTION_20_3();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      swift_release();
      uint64_t v51 = OUTLINED_FUNCTION_13_2();
      ((void (*)(uint64_t))v2)(v51);
      swift_release();
    }

    v56[25] = v2;
    uint64_t v52 = (void *)swift_task_alloc();
    v56[26] = v52;
    *uint64_t v52 = v56;
    v52[1] = sub_1C69C7F1C;
    OUTLINED_FUNCTION_38(v56[11]);
    return sub_1C69C8E10();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_70_1();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    return v49();
  }
}

uint64_t sub_1C69C7F1C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69C7FF8()
{
  uint64_t v22 = v0;
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 192) + 1;
  (*(void (**)(void, void))(v0 + 200))(*(void *)(v0 + 88), *(void *)(v0 + 64));
  if (v4 == v3)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_70_1();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    return v5();
  }
  else
  {
    ++*(void *)(v0 + 192);
    OUTLINED_FUNCTION_38_2();
    v7();
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v8 = OUTLINED_FUNCTION_60_0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EBC085C0);
    OUTLINED_FUNCTION_38_2();
    v1();
    swift_retain_n();
    uint64_t v9 = (void *)sub_1C69E1C48();
    os_log_type_t v10 = sub_1C69E1EC8();
    BOOL v11 = OUTLINED_FUNCTION_26_3(v10);
    uint64_t v12 = *(void *)(v0 + 80);
    if (v11)
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v13 = 136315394;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v14 = OUTLINED_FUNCTION_43_0();
      uint64_t v2 = (void (*)(uint64_t))v15;
      *(void *)(v13 + 4) = sub_1C69A8148(v14, v15, &v21);
      swift_bridgeObjectRelease();
      uint64_t v16 = OUTLINED_FUNCTION_13_2();
      v2(v16);
      OUTLINED_FUNCTION_57_0();
      *(void *)(v13 + 14) = v12;
      swift_release();
      OUTLINED_FUNCTION_74_1(&dword_1C698D000, v17, v18, "Disconnecting expired connection: %s. # Remaining connections: %ld");
      OUTLINED_FUNCTION_20_3();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      swift_release();
      uint64_t v19 = OUTLINED_FUNCTION_13_2();
      v2(v19);
      swift_release();
    }

    *(void *)(v0 + 200) = v2;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_1C69C7F1C;
    OUTLINED_FUNCTION_38(*(void *)(v0 + 88));
    return sub_1C69C8E10();
  }
}

uint64_t sub_1C69C82FC()
{
  OUTLINED_FUNCTION_6_0();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = sub_1C69E1818();
  v1[9] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[10] = v4;
  v1[11] = *(void *)(v5 + 64);
  v1[12] = OUTLINED_FUNCTION_9_4();
  v1[13] = swift_task_alloc();
  uint64_t v6 = sub_1C69E1198();
  v1[14] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[15] = v7;
  v1[16] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1C69C83CC()
{
  OUTLINED_FUNCTION_20();
  sub_1C69E17F8();
  *(void *)(v0 + 136) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v2;
  void *v2 = v0;
  v2[1] = sub_1C69C847C;
  return sub_1C69C77BC();
}

uint64_t sub_1C69C847C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4188298](sub_1C69C8578, v2, 0);
}

uint64_t sub_1C69C8578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_49_1();
  uint64_t v35 = v16[16];
  uint64_t v34 = v16[13];
  uint64_t v17 = v16[12];
  uint64_t v33 = v16[11];
  uint64_t v19 = v16[9];
  uint64_t v18 = v16[10];
  uint64_t v20 = v16[8];
  (*(void (**)(void))(v16[15] + 16))();
  uint64_t v21 = *(void (**)(void))(v18 + 16);
  OUTLINED_FUNCTION_73_1();
  v21();
  sub_1C6995840(v20 + 120, (uint64_t)(v16 + 2));
  OUTLINED_FUNCTION_73_1();
  v21();
  unint64_t v22 = (*(unsigned __int8 *)(v18 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v20;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v23 + v22, v17, v19);
  type metadata accessor for Connection(0);
  swift_allocObject();
  swift_retain();
  sub_1C69CB97C(v35, v34, (uint64_t)(v16 + 2), (uint64_t)&unk_1EA443468, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23_3();
  return v26(v24, v25, v26, v27, v28, v29, v30, v31, a9, v33, v16 + 2, v34, v35, a14, a15, a16);
}

uint64_t sub_1C69C86FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C69CAC74();
}

uint64_t sub_1C69C87B4()
{
  OUTLINED_FUNCTION_6_0();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = sub_1C69E1818();
  v1[12] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[13] = v4;
  v1[14] = OUTLINED_FUNCTION_9_4();
  v1[15] = swift_task_alloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1C69C884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_49_1();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = v24[10];
  uint64_t v28 = v24[11];
  OUTLINED_FUNCTION_3_3();
  uint64_t v29 = *(void *)(v28 + 112);
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1C69B7DCC(v27, v29);
  swift_bridgeObjectRelease();
  if (v30)
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v31 = v24[15];
    uint64_t v33 = v24[12];
    uint64_t v32 = v24[13];
    uint64_t v34 = v24[10];
    uint64_t v35 = sub_1C69E1C68();
    __swift_project_value_buffer(v35, (uint64_t)qword_1EBC085C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v34, v33);
    uint64_t v36 = sub_1C69E1C48();
    os_log_type_t v37 = sub_1C69E1EC8();
    if (os_log_type_enabled(v36, v37))
    {
      a10 = v24 + 9;
      a12 = v30;
      uint64_t v38 = (_DWORD *)OUTLINED_FUNCTION_13_1();
      a11 = OUTLINED_FUNCTION_25_1();
      a13 = a11;
      _DWORD *v38 = 136315138;
      a9 = v38 + 1;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v39 = OUTLINED_FUNCTION_43_0();
      v24[9] = sub_1C69A8148(v39, v40, &a13);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      uint64_t v41 = OUTLINED_FUNCTION_31_2();
      v42(v41);
      OUTLINED_FUNCTION_28_3(&dword_1C698D000, v36, v43, "Getting existing connection for: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      uint64_t v47 = OUTLINED_FUNCTION_47_1();
      v48(v47);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_23_3();
    return v51(v49, v50, v51, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14, a15, a16);
  }
  else
  {
    uint64_t v44 = (void *)swift_task_alloc();
    v24[16] = v44;
    *uint64_t v44 = v24;
    v44[1] = sub_1C69C8B14;
    OUTLINED_FUNCTION_38(v24[10]);
    OUTLINED_FUNCTION_23_3();
    return sub_1C69C82FC();
  }
}

uint64_t sub_1C69C8B14()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  *(void *)(v6 + 136) = v5;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69C8BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_46();
  a20 = v22;
  uint64_t v25 = qword_1EBC085D8;
  swift_retain();
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1C69E1C68();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EBC085C0);
  uint64_t v27 = OUTLINED_FUNCTION_30_2();
  v28(v27);
  uint64_t v29 = (void *)sub_1C69E1C48();
  os_log_type_t v30 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_26_3(v30))
  {
    a10 = v22 + 64;
    uint64_t v31 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    a11 = OUTLINED_FUNCTION_25_1();
    *uint64_t v31 = 136315138;
    a9 = v31 + 1;
    sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
    uint64_t v32 = sub_1C69E2178();
    *(void *)(v22 + 64) = sub_1C69A8148(v32, v33, &a11);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v34 = OUTLINED_FUNCTION_44_0();
    v35(v34);
    OUTLINED_FUNCTION_75_1(&dword_1C698D000, v36, v37, "Created new connection for: %s");
    OUTLINED_FUNCTION_20_3();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v38 = OUTLINED_FUNCTION_58_1();
    v39(v38);
  }

  swift_beginAccess();
  sub_1C69B68A8();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  return v42(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1C69C8E10()
{
  OUTLINED_FUNCTION_6_0();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = sub_1C69E1818();
  v1[12] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[13] = v4;
  v1[14] = OUTLINED_FUNCTION_9_4();
  v1[15] = swift_task_alloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1C69C8EA8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint8_t *a9, uint64_t a10, os_log_t log, void *a12, void *a13, uint64_t *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_61();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  uint64_t v29 = v26[10];
  os_log_type_t v30 = (uint64_t *)(v26[11] + 112);
  OUTLINED_FUNCTION_3_3();
  uint64_t v31 = *v30;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1C69B7DCC(v29, v31);
  swift_bridgeObjectRelease();
  if (v32)
  {
    a13 = (void *)v32;
    a14 = v30;
    a12 = v26 + 5;
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v33 = v26[15];
    uint64_t v34 = v26[12];
    uint64_t v35 = v26[13];
    uint64_t v36 = v26[10];
    uint64_t v37 = sub_1C69E1C68();
    __swift_project_value_buffer(v37, (uint64_t)qword_1EBC085C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v33, v36, v34);
    uint64_t v38 = sub_1C69E1C48();
    os_log_type_t v39 = sub_1C69E1ED8();
    if (os_log_type_enabled(v38, v39))
    {
      os_log_t log = v38;
      uint64_t v40 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      a10 = OUTLINED_FUNCTION_25_1();
      a15 = a10;
      *(_DWORD *)uint64_t v40 = 136315138;
      a9 = v40 + 4;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v41 = sub_1C69E2178();
      v26[9] = sub_1C69A8148(v41, v42, &a15);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      uint64_t v43 = OUTLINED_FUNCTION_45_1();
      v44(v43);
      _os_log_impl(&dword_1C698D000, v38, v39, "Disconnecting: %s", v40, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      uint64_t v55 = OUTLINED_FUNCTION_45_1();
      v56(v55);
    }

    sub_1C69CC8DC();
    swift_beginAccess();
    sub_1C69CDBD4();
    swift_endAccess();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_1C69E1C68();
    __swift_project_value_buffer(v45, (uint64_t)qword_1EBC085C0);
    OUTLINED_FUNCTION_38_2();
    v46();
    uint64_t v47 = sub_1C69E1C48();
    os_log_type_t v48 = sub_1C69E1EC8();
    if (os_log_type_enabled(v47, v48))
    {
      a13 = v26 + 8;
      a14 = v26 + 9;
      uint64_t v49 = (_DWORD *)OUTLINED_FUNCTION_13_1();
      a15 = OUTLINED_FUNCTION_25_1();
      *uint64_t v49 = 136315138;
      a12 = v49 + 1;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v50 = sub_1C69E2178();
      v26[8] = sub_1C69A8148(v50, v51, &a15);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      uint64_t v52 = OUTLINED_FUNCTION_62_0();
      v53(v52);
      OUTLINED_FUNCTION_28_3(&dword_1C698D000, v47, v54, "no connection for %s found. Unable to disconnect");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      uint64_t v57 = OUTLINED_FUNCTION_62_0();
      v58(v57);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_64();
  return v60(v59, v60, v61, v62, v63, v64, v65, v66, a9, a10, log, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1C69C9308()
{
  OUTLINED_FUNCTION_6_0();
  v1[14] = v2;
  v1[15] = v0;
  v1[13] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D30);
  v1[16] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[17] = v5;
  v1[18] = OUTLINED_FUNCTION_24();
  uint64_t v6 = sub_1C69E17A8();
  v1[19] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[20] = v7;
  v1[21] = OUTLINED_FUNCTION_24();
  uint64_t v8 = sub_1C69E19A8();
  v1[22] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v1[23] = v9;
  v1[24] = OUTLINED_FUNCTION_24();
  uint64_t v10 = sub_1C69E16E8();
  v1[25] = v10;
  OUTLINED_FUNCTION_2_0(v10);
  v1[26] = v11;
  v1[27] = OUTLINED_FUNCTION_9_4();
  v1[28] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF0);
  OUTLINED_FUNCTION_44(v12);
  v1[29] = OUTLINED_FUNCTION_24();
  uint64_t v13 = sub_1C69E0678();
  v1[30] = v13;
  OUTLINED_FUNCTION_2_0(v13);
  v1[31] = v14;
  v1[32] = OUTLINED_FUNCTION_24();
  uint64_t v15 = sub_1C69E1818();
  v1[33] = v15;
  OUTLINED_FUNCTION_2_0(v15);
  v1[34] = v16;
  v1[35] = OUTLINED_FUNCTION_9_4();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  uint64_t v17 = sub_1C69E17D8();
  v1[38] = v17;
  OUTLINED_FUNCTION_2_0(v17);
  v1[39] = v18;
  v1[40] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v19, v20, v21);
}

uint64_t sub_1C69C9504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_49_1();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = *(void *)(v24 + 272);
  sub_1C69E16C8();
  sub_1C69E1698();
  sub_1C69E15C8();
  char v28 = sub_1C69E1808();
  uint64_t v29 = *(void (**)(void))(v27 + 8);
  *(void *)(v24 + 328) = v29;
  *(void *)(v24 + 336) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  OUTLINED_FUNCTION_33_2();
  v29();
  OUTLINED_FUNCTION_33_2();
  uint64_t v30 = ((uint64_t (*)(void))v29)();
  if (v28)
  {
    uint64_t v31 = MEMORY[0x1C87A6940](v30);
    sub_1C69B7E10(0x4974736575716572, 0xE900000000000064, v31, (_OWORD *)(v24 + 16));
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void *)(v24 + 232);
    uint64_t v32 = *(void *)(v24 + 240);
    if (*(void *)(v24 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
      int v34 = swift_dynamicCast();
      __swift_storeEnumTagSinglePayload(v33, v34 ^ 1u, 1, v32);
      if (__swift_getEnumTagSinglePayload(v33, 1, v32) != 1)
      {
        (*(void (**)(void, void, void))(*(void *)(v24 + 248) + 32))(*(void *)(v24 + 256), *(void *)(v24 + 232), *(void *)(v24 + 240));
        if (qword_1EBC085D8 != -1) {
          swift_once();
        }
        uint64_t v35 = sub_1C69E1C68();
        __swift_project_value_buffer(v35, (uint64_t)qword_1EBC085C0);
        uint64_t v36 = sub_1C69E1C48();
        os_log_type_t v37 = sub_1C69E1EC8();
        if (os_log_type_enabled(v36, v37))
        {
          *(_WORD *)swift_slowAlloc() = 0;
          OUTLINED_FUNCTION_52_1(&dword_1C698D000, v36, v38, "Mapping siri hints identifier");
          OUTLINED_FUNCTION_17();
        }
        uint64_t v39 = *(void *)(v24 + 272);
        uint64_t v59 = *(void *)(v24 + 264);
        uint64_t v60 = *(void *)(v24 + 288);
        uint64_t v40 = *(void *)(v24 + 248);
        uint64_t v41 = *(void *)(v24 + 256);
        uint64_t v61 = *(void *)(v24 + 240);
        uint64_t v62 = *(void *)(v24 + 296);

        sub_1C69E1698();
        sub_1C69E17F8();
        OUTLINED_FUNCTION_33_2();
        v29();
        sub_1C69E0648();
        sub_1C69969AC();
        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v61);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v62, v60, v59);
        goto LABEL_17;
      }
    }
    else
    {
      sub_1C6995768(v24 + 16, &qword_1EBC07D60);
      __swift_storeEnumTagSinglePayload(v33, 1, 1, v32);
    }
    sub_1C6995768(*(void *)(v24 + 232), &qword_1EBC07BF0);
  }
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_1C69E1C68();
  __swift_project_value_buffer(v42, (uint64_t)qword_1EBC085C0);
  uint64_t v43 = OUTLINED_FUNCTION_30_2();
  v44(v43);
  uint64_t v45 = (void *)sub_1C69E1C48();
  os_log_type_t v46 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_26_3(v46))
  {
    uint64_t v47 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    a13 = OUTLINED_FUNCTION_25_1();
    *uint64_t v47 = 136315138;
    sub_1C69D0564(&qword_1EBC07C20, MEMORY[0x1E4FA4730]);
    uint64_t v48 = sub_1C69E2178();
    *(void *)(v24 + 96) = sub_1C69A8148(v48, v49, &a13);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v50 = OUTLINED_FUNCTION_44_0();
    v51(v50);
    OUTLINED_FUNCTION_75_1(&dword_1C698D000, v52, v53, "using identifier for inapp as is. %s");
    OUTLINED_FUNCTION_20_3();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v54 = OUTLINED_FUNCTION_58_1();
    v55(v54);
  }

  sub_1C69E1698();
LABEL_17:
  uint64_t v56 = (void *)swift_task_alloc();
  *(void *)(v24 + 344) = v56;
  *uint64_t v56 = v24;
  v56[1] = sub_1C69C99B0;
  OUTLINED_FUNCTION_38(*(void *)(v24 + 296));
  OUTLINED_FUNCTION_23_3();
  return sub_1C69C87B4();
}

uint64_t sub_1C69C99B0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  *(void *)(v6 + 352) = v5;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69C9A90()
{
  uint64_t v47 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[41];
  uint64_t v3 = v0[35];
  uint64_t v2 = v0[36];
  uint64_t v4 = v0[33];
  sub_1C69E1698();
  sub_1C69E15C8();
  sub_1C69D0564(&qword_1EBC07C40, MEMORY[0x1E4FA48C8]);
  char v5 = sub_1C69E1CD8();
  v1(v3, v4);
  v1(v2, v4);
  if (v5)
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C69E1C68();
    uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EBC085C0);
    swift_retain_n();
    uint64_t v8 = sub_1C69E1C48();
    os_log_type_t v9 = sub_1C69E1EC8();
    BOOL v10 = OUTLINED_FUNCTION_19_2(v9);
    uint64_t v11 = v0[44];
    if (v10)
    {
      uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      uint64_t v46 = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v12 = 136315138;
      OUTLINED_FUNCTION_3_3();
      uint64_t v13 = *(void *)(v11 + 16);
      swift_bridgeObjectRetain();
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C78);
      uint64_t v15 = MEMORY[0x1C87A7030](v13, v14);
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      v0[11] = sub_1C69A8148(v15, v17, &v46);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1C698D000, v8, (os_log_type_t)v7, "SiriHints UI event fetch. Buffer = %s", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      swift_release_n();
    }

    OUTLINED_FUNCTION_22_2();
    OUTLINED_FUNCTION_21_3();
    uint64_t v43 = v34;
    uint64_t v35 = (void *)swift_task_alloc();
    OUTLINED_FUNCTION_76_1(v35);
    uint64_t v36 = OUTLINED_FUNCTION_56_0();
    uint64_t v38 = v37(v36);
    OUTLINED_FUNCTION_54_0(v38, v39, (uint64_t)sub_1C69CF430);
    swift_release();
    v44(v7, v43);
    uint64_t v40 = OUTLINED_FUNCTION_51_1();
    v41(v40);
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
    OUTLINED_FUNCTION_18();
    return v42();
  }
  else
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C69E1C68();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBC085C0);
    uint64_t v19 = sub_1C69E1C48();
    os_log_type_t v20 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_19_2(v20))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_52_1(&dword_1C698D000, v19, v21, "No event in buffer. Adding on generation event");
      OUTLINED_FUNCTION_17();
    }
    uint64_t v23 = v0[26];
    uint64_t v22 = v0[27];
    uint64_t v24 = v0[25];
    uint64_t v26 = v0[20];
    uint64_t v25 = v0[21];
    uint64_t v27 = v0[19];
    uint64_t v29 = v0[14];
    uint64_t v28 = v0[15];

    sub_1C69E1698();
    (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v25, *MEMORY[0x1E4FA4840], v27);
    __swift_project_boxed_opaque_existential_1((void *)(v28 + 120), *(void *)(v28 + 144));
    sub_1C69E1A38();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v29, v24);
    sub_1C69E1998();
    uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EA4433D8 + dword_1EA4433D8);
    uint64_t v30 = (void *)swift_task_alloc();
    v0[45] = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_1C69C9FB4;
    uint64_t v31 = OUTLINED_FUNCTION_38(v0[24]);
    return v45(v31, v32);
  }
}

uint64_t sub_1C69C9FB4()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = OUTLINED_FUNCTION_45();
  v6(v5);
  return MEMORY[0x1F4188298](sub_1C69CA0EC, v2, 0);
}

uint64_t sub_1C69CA0EC()
{
  OUTLINED_FUNCTION_22_2();
  uint64_t v11 = *(void *)(v1 + 264);
  OUTLINED_FUNCTION_21_3();
  uint64_t v2 = (void *)swift_task_alloc();
  OUTLINED_FUNCTION_76_1(v2);
  uint64_t v3 = OUTLINED_FUNCTION_56_0();
  uint64_t v5 = v4(v3);
  OUTLINED_FUNCTION_54_0(v5, v6, (uint64_t)sub_1C69CF430);
  swift_release();
  v12(v0, v11);
  uint64_t v7 = OUTLINED_FUNCTION_51_1();
  v8(v7);
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
  OUTLINED_FUNCTION_18();
  return v9();
}

void sub_1C69CA240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = sub_1C69E17D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  os_log_type_t v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C69CCCD4();
  swift_beginAccess();
  swift_retain();
  sub_1C69B68A8();
  swift_endAccess();
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C69E1C68();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBC085C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a5, v6);
  uint64_t v11 = sub_1C69E1C48();
  os_log_type_t v12 = sub_1C69E1EC8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v18[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_1C69D0564(&qword_1EBC07C28, MEMORY[0x1E4FA48B8]);
    uint64_t v15 = sub_1C69E2178();
    uint64_t v17 = sub_1C69A8148(v15, v16, v18);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_1C698D000, v11, v12, "Finished setting up connection for %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87A7AA0](v14, -1, -1);
    MEMORY[0x1C87A7AA0](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_1C69CA518()
{
  OUTLINED_FUNCTION_6_0();
  v1[8] = v2;
  v1[9] = v0;
  uint64_t v3 = sub_1C69E1818();
  v1[10] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[11] = v4;
  v1[12] = OUTLINED_FUNCTION_24();
  uint64_t v5 = sub_1C69E17A8();
  v1[13] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[14] = v6;
  v1[15] = OUTLINED_FUNCTION_9_4();
  v1[16] = swift_task_alloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69CA5E0()
{
  uint64_t v27 = v0;
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  __swift_project_boxed_opaque_existential_1((void *)v0[8], *(void *)(v0[8] + 24));
  sub_1C69E1A68();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2) == *MEMORY[0x1E4FA4840])
  {
    uint64_t v4 = v0[16];
    uint64_t v6 = v0[11];
    uint64_t v5 = v0[12];
    uint64_t v7 = v0[10];
    (*(void (**)(uint64_t, void))(v0[14] + 96))(v4, v0[13]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v4, v7);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[17] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1C69CA9A4;
    OUTLINED_FUNCTION_38(v0[12]);
    return sub_1C69C87B4();
  }
  else
  {
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v10 = v0[8];
    uint64_t v11 = sub_1C69E1C68();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBC085C0);
    sub_1C6995840(v10, (uint64_t)(v0 + 2));
    os_log_type_t v12 = sub_1C69E1C48();
    os_log_type_t v13 = sub_1C69E1EE8();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t type = v13;
      uint64_t v14 = v0[14];
      uint64_t v15 = v0[15];
      uint64_t v16 = v0[13];
      os_log_t log = v12;
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      uint64_t v26 = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v17 = 136315138;
      __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
      sub_1C69E1A68();
      sub_1C69D0564((unint64_t *)&unk_1EA442EE0, MEMORY[0x1E4FA4858]);
      uint64_t v18 = sub_1C69E2178();
      unint64_t v20 = v19;
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v21(v15, v16);
      v0[7] = sub_1C69A8148(v18, v20, &v26);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
      _os_log_impl(&dword_1C698D000, log, type, "We should not have a delivery vehicle of %s in EventDrivenSuggestionsClient. Ignoring suggestions", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      uint64_t v22 = v0[14];
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));

      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    }
    v21(v0[16], v0[13]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    return v23();
  }
}

uint64_t sub_1C69CA9A4(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v5 = v4;
  uint64_t v7 = *(void **)(v6 + 64);
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v9 = v8;
  *(void *)(v4 + 144) = a1;
  swift_task_dealloc();
  uint64_t v10 = v7[3];
  uint64_t v11 = v7[4];
  os_log_type_t v12 = __swift_project_boxed_opaque_existential_1(v7, v10);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EA4433E8 + dword_1EA4433E8);
  os_log_type_t v13 = (void *)swift_task_alloc();
  *(void *)(v4 + 152) = v13;
  *os_log_type_t v13 = v8;
  v13[1] = sub_1C69CAB00;
  return v15((uint64_t)v12, a1, v10, v11);
}

uint64_t sub_1C69CAB00()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CABDC()
{
  OUTLINED_FUNCTION_20();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_45();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t sub_1C69CAC74()
{
  OUTLINED_FUNCTION_6_0();
  v1[24] = v2;
  v1[25] = v0;
  v1[22] = v3;
  v1[23] = v4;
  uint64_t v5 = sub_1C69E0678();
  OUTLINED_FUNCTION_44(v5);
  v1[26] = OUTLINED_FUNCTION_24();
  uint64_t v6 = sub_1C69E14C8();
  v1[27] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[28] = v7;
  v1[29] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1C69CAD24()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = v1[23];
  uint64_t v3 = v1[24];
  __swift_project_boxed_opaque_existential_1(v1 + 20, v2);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 240) = v4;
  *uint64_t v4 = v5;
  v4[1] = sub_1C69CADE4;
  return MEMORY[0x1F4158DC8](v0 + 16, v2, v3);
}

uint64_t sub_1C69CADE4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CAEC0()
{
  OUTLINED_FUNCTION_20();
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 200) + 160), *(void *)(*(void *)(v0 + 200) + 184));
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 248) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_1C69CAF84;
  return MEMORY[0x1F4158DD0](v0 + 96);
}

uint64_t sub_1C69CAF84()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CB060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  uint64_t v15 = v14[24];
  uint64_t v16 = v14[25];
  uint64_t v17 = v14[23];
  __swift_project_boxed_opaque_existential_1(v14 + 12, v14[15]);
  sub_1C69E0BA8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v14 + 12));
  (*(void (**)(uint64_t, uint64_t, void *))(v16 + 200))(v17, v15, v14 + 7);
  uint64_t v18 = v14[21];
  __swift_project_boxed_opaque_existential_1(v14 + 17, v14[20]);
  uint64_t v19 = *(void *)(v16 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider + 24);
  uint64_t v20 = *(void *)(v16 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v16 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider), v19);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
  v14[32] = v21;
  uint64_t v33 = *(void *)(v18 + 8) + **(int **)(v18 + 8);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v14[33] = v22;
  *uint64_t v22 = v23;
  v22[1] = sub_1C69CB214;
  OUTLINED_FUNCTION_30();
  return v30(v24, v25, v26, v27, v28, v29, v30, v31, a9, v33, v18 + 8, a12, a13, a14);
}

uint64_t sub_1C69CB214()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_0();
  void *v6 = v5;
  *(void *)(v7 + 272) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 200);
  if (v0) {
    uint64_t v9 = sub_1C69CB59C;
  }
  else {
    uint64_t v9 = sub_1C69CB360;
  }
  return MEMORY[0x1F4188298](v9, v8, 0);
}

uint64_t sub_1C69CB360()
{
  OUTLINED_FUNCTION_20();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = (void *)OUTLINED_FUNCTION_45();
  __swift_project_boxed_opaque_existential_1(v3, v4);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[35] = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_1C69CB420;
  uint64_t v7 = v0[29];
  uint64_t v8 = v0[22];
  return MEMORY[0x1F4158D98](v8, v7, v1, v2);
}

uint64_t sub_1C69CB420()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CB4FC()
{
  OUTLINED_FUNCTION_20();
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_1C69CB59C()
{
  uint64_t v1 = *(void **)(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_1C69E1B58();
  sub_1C69E1678();
  sub_1C69D0564(&qword_1EA442E70, MEMORY[0x1E4FA4728]);
  sub_1C69E0668();
  sub_1C69E14F8();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t EventDrivenSuggestionsClient.deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  swift_release();
  sub_1C69E1198();
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = OUTLINED_FUNCTION_27();
  v2(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t EventDrivenSuggestionsClient.__deallocating_deinit()
{
  EventDrivenSuggestionsClient.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t EventDrivenSuggestionsClient.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1C69CB784()
{
  return EventDrivenSuggestionsClient.unownedExecutor.getter();
}

uint64_t sub_1C69CB7A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C69C9308();
}

uint64_t sub_1C69CB84C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C69C8E10();
}

uint64_t sub_1C69CB8E4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return sub_1C69CA518();
}

uint64_t sub_1C69CB97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_35_1();
  *(void *)(v5 + 16) = MEMORY[0x1E4FBC860];
  uint64_t v11 = v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  __swift_storeEnumTagSinglePayload(v11, 1, 1, v12);
  uint64_t v13 = OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_lock;
  *(void *)(v5 + v13) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E08]), sel_init);
  uint64_t v14 = v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_config;
  sub_1C69E1198();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v14, v9);
  uint64_t v16 = v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_key;
  sub_1C69E1818();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v17 + 32))(v16, v8);
  sub_1C69958A4(v7, v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock);
  uint64_t v18 = (void *)(v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_getSuggestions);
  *uint64_t v18 = v6;
  v18[1] = a5;
  return v5;
}

uint64_t sub_1C69CBABC(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4)
{
  uint64_t v34 = a4;
  uint64_t v31 = a3;
  uint64_t v6 = sub_1C69E1818();
  uint64_t v32 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = a1;
  uint64_t v16 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  sub_1C69C5D2C(v16, (uint64_t)v11, &qword_1EBC07D38);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_1C6995768((uint64_t)v11, &qword_1EBC07D38);
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C69E1C68();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBC085C0);
    uint64_t v18 = v32;
    (*(void (**)(char *, uint8_t *, uint64_t))(v32 + 16))(v8, v31, v6);
    uint64_t v19 = sub_1C69E1C48();
    os_log_type_t v20 = sub_1C69E1EC8();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v35[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v31 = v21 + 4;
      sub_1C69D0564(&qword_1EBC07C48, MEMORY[0x1E4FA48C8]);
      uint64_t v23 = sub_1C69E2178();
      v35[7] = sub_1C69A8148(v23, v24, v35);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
      _os_log_impl(&dword_1C698D000, v19, v20, "No connection for %s created yet. Adding to buffer", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A7AA0](v22, -1, -1);
      MEMORY[0x1C87A7AA0](v21, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
    }

    uint64_t v27 = v33;
    sub_1C69CC550();
    swift_beginAccess();
    sub_1C69A4B00();
    uint64_t v28 = *(void *)(*(void *)(v27 + 16) + 16);
    sub_1C69A4B8C(v28);
    uint64_t v29 = *(void *)(v27 + 16);
    *(void *)(v29 + 16) = v28 + 1;
    sub_1C6995840(v34, v29 + 40 * v28 + 32);
    return swift_endAccess();
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v15, v11, v12);
    sub_1C6995768(a2, &qword_1EBC07D38);
    v25((char *)a2, v15, v12);
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v12);
  }
}

id sub_1C69CBF3C(void (*a1)(id))
{
  a1(objc_msgSend(v1, sel_lock));
  return objc_msgSend(v1, sel_unlock);
}

uint64_t sub_1C69CBFB4()
{
  OUTLINED_FUNCTION_6_0();
  v1[19] = v2;
  v1[20] = v0;
  v1[18] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07CC8);
  OUTLINED_FUNCTION_44(v4);
  v1[21] = OUTLINED_FUNCTION_24();
  uint64_t v5 = type metadata accessor for PreFetchedSuggestionEvent();
  v1[22] = v5;
  OUTLINED_FUNCTION_44(v5);
  v1[23] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1C69CC05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_46();
  a20 = v22;
  sub_1C6995840(v22[19], (uint64_t)(v22 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C78);
  if (swift_dynamicCast())
  {
    uint64_t v25 = v22[23];
    uint64_t v26 = v22[21];
    __swift_storeEnumTagSinglePayload(v26, 0, 1, v22[22]);
    sub_1C69D0330(v26, v25);
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1C69E1C68();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBC085C0);
    uint64_t v28 = sub_1C69E1C48();
    os_log_type_t v29 = sub_1C69E1EC8();
    if (OUTLINED_FUNCTION_19_2(v29))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_52_1(&dword_1C698D000, v28, v30, "Got a pre fetched event. Returning suggestions");
      OUTLINED_FUNCTION_17();
    }
    uint64_t v31 = v22[23];

    sub_1C69E1538();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_33_1();
    v32();
    sub_1C6997720(v31);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_30();
    return v34(v33, v34, v35, v36, v37, v38, v39, v40, a9, a10, a11, a12, a13, a14);
  }
  else
  {
    uint64_t v42 = v22[21];
    __swift_storeEnumTagSinglePayload(v42, 1, 1, v22[22]);
    sub_1C6995768(v42, &qword_1EBC07CC8);
    if (qword_1EBC085D8 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1C69E1C68();
    __swift_project_value_buffer(v43, (uint64_t)qword_1EBC085C0);
    uint64_t v44 = OUTLINED_FUNCTION_45();
    sub_1C6995840(v44, v45);
    uint64_t v46 = sub_1C69E1C48();
    os_log_type_t v47 = sub_1C69E1EC8();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      a11 = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v48 = 136315138;
      sub_1C6995840((uint64_t)(v22 + 7), (uint64_t)(v22 + 12));
      uint64_t v49 = sub_1C69E1D08();
      v22[17] = sub_1C69A8148(v49, v50, &a11);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v22 + 7));
      _os_log_impl(&dword_1C698D000, v46, v47, "Got event of type: %s. Generating suggestions", v48, 0xCu);
      OUTLINED_FUNCTION_20_3();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v22 + 7));
    }

    uint64_t v62 = *(void *)(v22[20] + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_getSuggestions)
        + **(int **)(v22[20] + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_getSuggestions);
    uint64_t v51 = swift_task_alloc();
    uint64_t v52 = (void *)OUTLINED_FUNCTION_50_1(v51);
    *uint64_t v52 = v53;
    v52[1] = sub_1C69CC430;
    OUTLINED_FUNCTION_30();
    return v56(v54, v55, v56, v57, v58, v59, v60, v61, a9, v62, a11, a12, a13, a14);
  }
}

uint64_t sub_1C69CC430()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

void sub_1C69CC550()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock), *(void *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock + 24));
  sub_1C69E1A38();
  double v2 = v1;
  uint64_t v3 = (uint64_t *)(v0 + 16);
  swift_beginAccess();
  uint64_t v4 = *(void *)(*(void *)(v0 + 16) + 16);
  uint64_t v5 = v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_config;
  uint64_t v6 = sub_1C69E1178();
  uint64_t v7 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    uint64_t v8 = *v3;
    uint64_t v9 = MEMORY[0x1E4FBC860];
    uint64_t v31 = MEMORY[0x1E4FBC860];
    uint64_t v10 = *(void *)(v8 + 16);
    swift_bridgeObjectRetain();
    if (!v10)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_1C69CC870(v7, v9);
      *uint64_t v3 = sub_1C69C73C0(v18, v19, v20, v21, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_1C69C3200);
      swift_bridgeObjectRelease();
      uint64_t v5 = *(void *)(*v3 + 16);
      if (qword_1EBC085D8 == -1) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
    uint64_t v26 = v7;
    uint64_t v27 = v4;
    unint64_t v11 = 0;
    uint64_t v4 = v8 + 32;
    uint64_t v12 = MEMORY[0x1E4FBC860];
    while (v11 < *(void *)(v8 + 16))
    {
      sub_1C6995840(v4, (uint64_t)&v29);
      __swift_project_boxed_opaque_existential_1(&v29, v30);
      sub_1C69E1A58();
      double v14 = v2 - v13;
      sub_1C69E1188();
      if (v14 >= v15)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
      }
      else
      {
        sub_1C69958A4(&v29, (uint64_t)v28);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1C69C34B8(0, *(void *)(v12 + 16) + 1, 1);
        }
        uint64_t v12 = v31;
        unint64_t v17 = *(void *)(v31 + 16);
        unint64_t v16 = *(void *)(v31 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_1C69C34B8(v16 > 1, v17 + 1, 1);
          uint64_t v12 = v31;
        }
        *(void *)(v12 + 16) = v17 + 1;
        sub_1C69958A4(v28, v12 + 40 * v17 + 32);
      }
      ++v11;
      v4 += 40;
      if (v10 == v11)
      {
        uint64_t v9 = v31;
        uint64_t v4 = v27;
        uint64_t v7 = v26;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  swift_once();
LABEL_15:
  uint64_t v22 = sub_1C69E1C68();
  __swift_project_value_buffer(v22, (uint64_t)qword_1EBC085C0);
  uint64_t v23 = sub_1C69E1C48();
  os_log_type_t v24 = sub_1C69E1EC8();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134218240;
    *(void *)&long long v29 = v4;
    sub_1C69E1F28();
    *(_WORD *)(v25 + 12) = 2048;
    *(void *)&long long v29 = v5;
    sub_1C69E1F28();
    _os_log_impl(&dword_1C698D000, v23, v24, "before purging %ld elements, after purging %ld", (uint8_t *)v25, 0x16u);
    OUTLINED_FUNCTION_17();
  }
}

uint64_t sub_1C69CC870(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_1C69C5708(v3, -result, 0, a2);
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = result;
  }
  if (v3 < v5) {
    goto LABEL_9;
  }
  if ((v5 & 0x8000000000000000) == 0) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C69CC8DC()
{
  double v1 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_lock);
  swift_retain();
  objc_msgSend(v1, sel_lock);
  sub_1C69CC95C(v0);
  objc_msgSend(v1, sel_unlock);
  return swift_release();
}

uint64_t sub_1C69CC95C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v21 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBC085D8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1C69E1C68();
  v21[1] = __swift_project_value_buffer(v11, (uint64_t)qword_1EBC085C0);
  uint64_t v12 = sub_1C69E1C48();
  os_log_type_t v13 = sub_1C69E1ED8();
  if (os_log_type_enabled(v12, v13))
  {
    double v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_1C698D000, v12, v13, "Disconnecting connection", v14, 2u);
    MEMORY[0x1C87A7AA0](v14, -1, -1);
  }

  uint64_t v15 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  sub_1C69C5D2C(v15, (uint64_t)v7, &qword_1EBC07D38);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_1C6995768((uint64_t)v7, &qword_1EBC07D38);
  }
  else
  {
    uint64_t v16 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v10, v7, v8);
    unint64_t v17 = sub_1C69E1C48();
    os_log_type_t v18 = sub_1C69E1ED8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1C698D000, v17, v18, "Notifying downstream subscribers of events that connection is disconnected", v19, 2u);
      MEMORY[0x1C87A7AA0](v19, -1, -1);
    }

    v21[2] = 0;
    sub_1C69E1E88();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v8);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v8);
  swift_beginAccess();
  sub_1C69D02C8((uint64_t)v5, v15);
  return swift_endAccess();
}

id sub_1C69CCCD4()
{
  return sub_1C69CBF3C((void (*)(id))sub_1C69D002C);
}

void sub_1C69CCD34(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  uint64_t v70 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v58 = v4;
  uint64_t v57 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v50 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v48 = (char *)&v47 - v12;
  MEMORY[0x1F4188790](v11);
  double v14 = (char *)&v47 - v13;
  uint64_t v59 = a1;
  uint64_t v15 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  uint64_t v49 = v15;
  sub_1C69C5D2C(v15, (uint64_t)v14, &qword_1EBC07D38);
  uint64_t v60 = v3;
  LODWORD(a1) = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v3);
  sub_1C6995768((uint64_t)v14, &qword_1EBC07D38);
  if (a1 == 1
    && (uint64_t v16 = v59,
        sub_1C69CC550(),
        unint64_t v17 = (uint64_t *)(v16 + 16),
        swift_beginAccess(),
        *(void *)(*(void *)(v16 + 16) + 16)))
  {
    uint64_t v55 = v70 + 16;
    uint64_t v54 = v70 + 32;
    *(void *)&long long v18 = 136315138;
    long long v52 = v18;
    uint64_t v51 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v53 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v56 = (uint64_t *)(v16 + 16);
    uint64_t v19 = v57;
    uint64_t v20 = v60;
    while (1)
    {
      swift_beginAccess();
      uint64_t v21 = *v17;
      if (!*(void *)(*v17 + 16)) {
        break;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unint64_t v17 = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C69D0048();
        uint64_t v21 = v42;
        *unint64_t v17 = v42;
      }
      uint64_t v23 = *(void *)(v21 + 16);
      if (!v23) {
        goto LABEL_24;
      }
      uint64_t v24 = v23 - 1;
      sub_1C69958A4((long long *)(v21 + 40 * (v23 - 1) + 32), (uint64_t)&v66);
      *(void *)(v21 + 16) = v24;
      *unint64_t v17 = v21;
      sub_1C69958A4(&v66, (uint64_t)v69);
      swift_endAccess();
      if (qword_1EBC085D8 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_1C69E1C68();
      __swift_project_value_buffer(v25, (uint64_t)qword_1EBC085C0);
      sub_1C6995840((uint64_t)v69, (uint64_t)&v66);
      uint64_t v26 = sub_1C69E1C48();
      os_log_type_t v27 = sub_1C69E1EC8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        v68[0] = v29;
        *(_DWORD *)uint64_t v28 = v52;
        __swift_project_boxed_opaque_existential_1(&v66, v67);
        swift_getDynamicType();
        uint64_t v30 = sub_1C69E2288();
        *(void *)(v28 + 4) = sub_1C69A8148(v30, v31, v68);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v66);
        _os_log_impl(&dword_1C698D000, v26, v27, "sending event %s from buffer to new connection", (uint8_t *)v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A7AA0](v29, -1, -1);
        MEMORY[0x1C87A7AA0](v28, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v66);
      }

      uint64_t v32 = sub_1C69E1E58();
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v32);
      sub_1C6995840((uint64_t)v69, (uint64_t)&v66);
      uint64_t v33 = v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v19, v61, v20);
      unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
      uint64_t v35 = (char *)swift_allocObject();
      *((void *)v35 + 2) = 0;
      uint64_t v36 = v59;
      *((void *)v35 + 3) = 0;
      *((void *)v35 + 4) = v36;
      sub_1C69958A4(&v66, (uint64_t)(v35 + 40));
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v35[v34], v19, v20);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v32);
      swift_retain();
      if (EnumTagSinglePayload == 1)
      {
        sub_1C6995768((uint64_t)v7, &qword_1EBC07D20);
      }
      else
      {
        sub_1C69E1E48();
        (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v7, v32);
      }
      unint64_t v17 = v56;
      if (*((void *)v35 + 2))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v38 = sub_1C69E1E18();
        uint64_t v40 = v39;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v38 = 0;
        uint64_t v40 = 0;
      }
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = &unk_1EA443448;
      *(void *)(v41 + 24) = v35;
      if (v40 | v38)
      {
        uint64_t v63 = 0;
        uint64_t v62 = 0;
        uint64_t v64 = v38;
        uint64_t v65 = v40;
      }
      swift_task_create();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
      if (!*(void *)(*v17 + 16)) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_22:
    uint64_t v43 = (uint64_t)v48;
    uint64_t v44 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v48, v61, v60);
    __swift_storeEnumTagSinglePayload(v43, 0, 1, v44);
    uint64_t v45 = v50;
    sub_1C69D04E8(v43, v50, &qword_1EBC07D38);
    uint64_t v46 = v49;
    swift_beginAccess();
    sub_1C69D02C8(v45, v46);
    swift_endAccess();
  }
}

uint64_t sub_1C69CD4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6[2] = a6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D28);
  long long v6[3] = v7;
  v6[4] = *(void *)(v7 - 8);
  v6[5] = swift_task_alloc();
  uint64_t v8 = sub_1C69E1538();
  v6[6] = v8;
  v6[7] = *(void *)(v8 - 8);
  v6[8] = swift_task_alloc();
  v6[9] = swift_task_alloc();
  uint64_t v9 = (void *)swift_task_alloc();
  v6[10] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_1C69CD624;
  return sub_1C69CBFB4();
}

uint64_t sub_1C69CD624()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CD6EC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  (*(void (**)(void, void, void))(v0[7] + 16))(v0[8], v0[9], v0[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  sub_1C69E1E78();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_33_2();
  v4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v5();
}

uint64_t sub_1C69CD7E4()
{
  swift_bridgeObjectRelease();
  sub_1C6995768(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection, &qword_1EBC07D38);
  sub_1C69E1198();
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = OUTLINED_FUNCTION_27();
  v2(v1);
  sub_1C69E1818();
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = OUTLINED_FUNCTION_27();
  v4(v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock);

  swift_release();
  return v0;
}

uint64_t sub_1C69CD8C0()
{
  sub_1C69CD7E4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C69CD918()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_28(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_1C69CD9E8;
  return v7(v1);
}

uint64_t sub_1C69CD9E8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C69CDAAC(uint64_t a1)
{
  sub_1C69A4C84(a1, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  return sub_1C69E1D08();
}

double sub_1C69CDAE8()
{
  OUTLINED_FUNCTION_41_1();
  unint64_t v4 = sub_1C69A89DC(v3, v1);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_40_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4430E0);
    OUTLINED_FUNCTION_72_1();
    OUTLINED_FUNCTION_65_1();
    sub_1C69B60C4((_OWORD *)(*(void *)(v6 + 56) + 32 * v4), v2);
    sub_1C69E2078();
    *uint64_t v0 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    _OWORD *v2 = 0u;
    v2[1] = 0u;
  }
  return result;
}

uint64_t sub_1C69CDBD4()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_1C69A8A54();
  char v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D78);
  sub_1C69E2058();
  uint64_t v5 = *(void *)(v9 + 48);
  uint64_t v6 = sub_1C69E1818();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5 + *(void *)(*(void *)(v6 - 8) + 72) * v2, v6);
  uint64_t v7 = *(void *)(*(void *)(v9 + 56) + 8 * v2);
  type metadata accessor for Connection(0);
  sub_1C69D0564(&qword_1EBC07DC8, MEMORY[0x1E4FA48C8]);
  sub_1C69E2078();
  *uint64_t v1 = v9;
  swift_bridgeObjectRelease();
  return v7;
}

double sub_1C69CDD3C()
{
  OUTLINED_FUNCTION_41_1();
  unint64_t v4 = sub_1C69A89DC(v3, v1);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_40_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443090);
    OUTLINED_FUNCTION_72_1();
    OUTLINED_FUNCTION_65_1();
    sub_1C69A4B74((long long *)(*(void *)(v6 + 56) + 48 * v4), v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    sub_1C69E2078();
    *uint64_t v0 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    v2[1] = 0u;
    v2[2] = 0u;
    _OWORD *v2 = 0u;
  }
  return result;
}

uint64_t sub_1C69CDE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    uint64_t v11 = (void *)((char *)v15 - ((8 * v9 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1C69A9720(0, v9, v11);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1C69CE00C(v11, v9, a1, a2, a3);
    if (v3) {
      swift_willThrow();
    }
    else {
      a2 = v12;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v13 = (unint64_t *)swift_slowAlloc();
    sub_1C69A9720(0, v9, v13);
    swift_bridgeObjectRetain();
    a2 = sub_1C69CE00C(v13, v9, a1, a2, a3);
    MEMORY[0x1C87A7AA0](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_1C69CE00C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = a2;
  uint64_t v54 = a5;
  uint64_t v52 = a4;
  uint64_t v42 = a1;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C30);
  uint64_t v6 = MEMORY[0x1F4188790](v51);
  uint64_t v50 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v48 = (char *)&v40 - v8;
  uint64_t v9 = sub_1C69E1818();
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v14 = 0;
  uint64_t v53 = (void *)a3;
  uint64_t v15 = *(void *)(a3 + 64);
  uint64_t v43 = 0;
  uint64_t v44 = a3 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v47 = v11 + 16;
  uint64_t v49 = v11;
  int64_t v45 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v46 = v11 + 8;
  while (v18)
  {
    uint64_t v56 = (v18 - 1) & v18;
    int64_t v57 = v14;
    unint64_t v19 = __clz(__rbit64(v18)) | (v14 << 6);
LABEL_20:
    uint64_t v24 = v53;
    uint64_t v25 = v49;
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v49 + 16);
    v26(v13, v53[6] + *(void *)(v49 + 72) * v19, v9);
    uint64_t v27 = v24[7];
    unint64_t v55 = v19;
    uint64_t v28 = *(void *)(v27 + 8 * v19);
    uint64_t v29 = (uint64_t)v48;
    v26(v48, (unint64_t)v13, v9);
    uint64_t v30 = v50;
    uint64_t v31 = *(int *)(v51 + 48);
    *(void *)(v29 + v31) = v28;
    v26(v30, v29, v9);
    *(void *)&v30[v31] = v28;
    swift_retain_n();
    uint64_t v32 = sub_1C69E17F8();
    uint64_t v34 = v33;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v25 + 8);
    v35(v30, v9);
    if (v32 == v52 && v34 == v54)
    {
      swift_bridgeObjectRelease();
      sub_1C6995768(v29, &qword_1EBC07C30);
      swift_release();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v13, v9);
      int64_t v14 = v57;
      unint64_t v18 = v56;
LABEL_27:
      *(unint64_t *)((char *)v42 + ((v55 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v55;
      if (__OFADD__(v43++, 1))
      {
        __break(1u);
LABEL_30:
        uint64_t v39 = sub_1C69CE44C(v42, v41, v43, v53);
        swift_bridgeObjectRelease();
        return v39;
      }
    }
    else
    {
      char v37 = sub_1C69E2188();
      swift_bridgeObjectRelease();
      sub_1C6995768(v29, &qword_1EBC07C30);
      swift_release();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v13, v9);
      int64_t v14 = v57;
      unint64_t v18 = v56;
      if (v37) {
        goto LABEL_27;
      }
    }
  }
  int64_t v20 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v20 >= v45) {
    goto LABEL_30;
  }
  unint64_t v21 = *(void *)(v44 + 8 * v20);
  int64_t v22 = v14 + 1;
  if (v21) {
    goto LABEL_19;
  }
  int64_t v22 = v14 + 2;
  if (v14 + 2 >= v45) {
    goto LABEL_30;
  }
  unint64_t v21 = *(void *)(v44 + 8 * v22);
  if (v21) {
    goto LABEL_19;
  }
  int64_t v22 = v14 + 3;
  if (v14 + 3 >= v45) {
    goto LABEL_30;
  }
  unint64_t v21 = *(void *)(v44 + 8 * v22);
  if (v21)
  {
LABEL_19:
    uint64_t v56 = (v21 - 1) & v21;
    int64_t v57 = v22;
    unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    goto LABEL_20;
  }
  uint64_t v23 = v14 + 4;
  if (v14 + 4 >= v45) {
    goto LABEL_30;
  }
  unint64_t v21 = *(void *)(v44 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v14 + 4;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v22 >= v45) {
      goto LABEL_30;
    }
    unint64_t v21 = *(void *)(v44 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_19;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C69CE44C(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v47 = sub_1C69E1818();
  uint64_t v42 = *(void *)(v47 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v47);
  uint64_t v46 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v41 = (char *)&v36 - v10;
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443470);
  uint64_t result = sub_1C69E20D8();
  uint64_t v12 = result;
  char v37 = a1;
  uint64_t v38 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *a1;
  }
  uint64_t v14 = 0;
  uint64_t v39 = a4;
  uint64_t v40 = v42 + 16;
  uint64_t v45 = v42 + 32;
  uint64_t v15 = result + 64;
  uint64_t v16 = v47;
  while (1)
  {
    if (v13)
    {
      uint64_t v43 = (v13 - 1) & v13;
      uint64_t v44 = v14;
      unint64_t v17 = __clz(__rbit64(v13)) | (v14 << 6);
    }
    else
    {
      uint64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v18 >= v38) {
        return v12;
      }
      unint64_t v19 = v37[v18];
      uint64_t v20 = v14 + 1;
      if (!v19)
      {
        uint64_t v20 = v14 + 2;
        if (v14 + 2 >= v38) {
          return v12;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          uint64_t v20 = v14 + 3;
          if (v14 + 3 >= v38) {
            return v12;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v14 + 4;
            if (v14 + 4 >= v38) {
              return v12;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                uint64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_41;
                }
                if (v20 >= v38) {
                  return v12;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v20 = v14 + 4;
          }
        }
      }
LABEL_24:
      uint64_t v43 = (v19 - 1) & v19;
      uint64_t v44 = v20;
      unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    int64_t v22 = v41;
    uint64_t v23 = v42;
    uint64_t v24 = *(void *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v41, a4[6] + v24 * v17, v16);
    uint64_t v25 = *(void *)(a4[7] + 8 * v17);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v26(v46, v22, v16);
    sub_1C69D0564(&qword_1EBC07DC8, MEMORY[0x1E4FA48C8]);
    swift_retain();
    uint64_t result = sub_1C69E1CB8();
    uint64_t v27 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6))) == 0) {
      break;
    }
    unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v15 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v12 + 48) + v30 * v24, v46, v47);
    *(void *)(*(void *)(v12 + 56) + 8 * v30) = v25;
    ++*(void *)(v12 + 16);
    if (__OFSUB__(a3--, 1)) {
      goto LABEL_39;
    }
    a4 = v39;
    unint64_t v13 = v43;
    uint64_t v14 = v44;
    if (!a3) {
      return v12;
    }
  }
  char v31 = 0;
  unint64_t v32 = (unint64_t)(63 - v27) >> 6;
  while (++v29 != v32 || (v31 & 1) == 0)
  {
    BOOL v33 = v29 == v32;
    if (v29 == v32) {
      unint64_t v29 = 0;
    }
    v31 |= v33;
    uint64_t v34 = *(void *)(v15 + 8 * v29);
    if (v34 != -1)
    {
      unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C69CE81C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  uint64_t v7 = -1 << v2;
  if (-v7 < 64) {
    uint64_t v3 = ~(-1 << -(char)v7);
  }
  a2[1] = result;
  a2[2] = ~v7;
  a2[3] = 0;
  a2[4] = v3 & v5;
  a2[5] = 0;
  return result;
}

uint64_t sub_1C69CE858@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D68);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C69E1818();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C38);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C30);
  uint64_t result = MEMORY[0x1F4188790](v49);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *v1;
  uint64_t v17 = v1[1];
  uint64_t v19 = v1[2];
  int64_t v18 = v1[3];
  int64_t v20 = v18;
  unint64_t v21 = v1[4];
  uint64_t v44 = v15;
  uint64_t v45 = v5;
  uint64_t v50 = v19;
  if (!v21)
  {
    int64_t v32 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_29;
    }
    int64_t v33 = (unint64_t)(v19 + 64) >> 6;
    if (v32 < v33)
    {
      unint64_t v34 = *(void *)(v17 + 8 * v32);
      if (v34)
      {
LABEL_7:
        uint64_t v46 = v17;
        uint64_t v47 = v3;
        int64_t v22 = v9;
        uint64_t v23 = v6;
        uint64_t v48 = a1;
        uint64_t v24 = (v34 - 1) & v34;
        unint64_t v25 = __clz(__rbit64(v34)) + (v32 << 6);
        int64_t v20 = v32;
        goto LABEL_3;
      }
      int64_t v35 = v18 + 2;
      int64_t v20 = v18 + 1;
      if (v18 + 2 < v33)
      {
        unint64_t v34 = *(void *)(v17 + 8 * v35);
        if (v34)
        {
LABEL_10:
          int64_t v32 = v35;
          goto LABEL_7;
        }
        int64_t v20 = v18 + 2;
        if (v18 + 3 < v33)
        {
          unint64_t v34 = *(void *)(v17 + 8 * (v18 + 3));
          if (v34)
          {
            int64_t v32 = v18 + 3;
            goto LABEL_7;
          }
          int64_t v35 = v18 + 4;
          int64_t v20 = v18 + 3;
          if (v18 + 4 < v33)
          {
            unint64_t v34 = *(void *)(v17 + 8 * v35);
            if (v34) {
              goto LABEL_10;
            }
            int64_t v32 = v18 + 5;
            int64_t v20 = v18 + 4;
            if (v18 + 5 < v33)
            {
              unint64_t v34 = *(void *)(v17 + 8 * v32);
              if (v34) {
                goto LABEL_7;
              }
              int64_t v20 = v33 - 1;
              int64_t v36 = v18 + 6;
              while (v36 < v33)
              {
                unint64_t v34 = *(void *)(v17 + 8 * v36++);
                if (v34)
                {
                  int64_t v32 = v36 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t v31 = v49;
    uint64_t v27 = v16;
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v49);
    uint64_t v24 = 0;
    goto LABEL_23;
  }
  uint64_t v46 = v17;
  uint64_t v47 = v3;
  int64_t v22 = v9;
  uint64_t v23 = v6;
  uint64_t v48 = a1;
  uint64_t v24 = (v21 - 1) & v21;
  unint64_t v25 = __clz(__rbit64(v21)) | (v18 << 6);
LABEL_3:
  uint64_t v26 = v22;
  uint64_t v27 = v16;
  (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v22, *(void *)(v16 + 48) + *(void *)(v7 + 72) * v25, v23);
  uint64_t v28 = *(void *)(*(void *)(v27 + 56) + 8 * v25);
  uint64_t v29 = *(int *)(v49 + 48);
  unint64_t v30 = v26;
  uint64_t v31 = v49;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v30, v23);
  *(void *)&v12[v29] = v28;
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v31);
  swift_retain();
  uint64_t v3 = v47;
  a1 = v48;
  uint64_t v17 = v46;
LABEL_23:
  *uint64_t v1 = v27;
  v1[1] = v17;
  v1[2] = v50;
  v1[3] = v20;
  void v1[4] = v24;
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v31) == 1)
  {
    sub_1C6995768((uint64_t)v12, &qword_1EBC07C38);
    uint64_t v37 = (uint64_t)a1;
    uint64_t v38 = 1;
    return __swift_storeEnumTagSinglePayload(v37, v38, 1, v3);
  }
  uint64_t v39 = (uint64_t)v44;
  sub_1C69D04E8((uint64_t)v12, (uint64_t)v44, &qword_1EBC07C30);
  uint64_t v40 = (uint64_t)&v45[*(int *)(v3 + 48)];
  uint64_t v41 = v1[5];
  uint64_t result = sub_1C69D04E8(v39, v40, &qword_1EBC07C30);
  if (!__OFADD__(v41, 1))
  {
    v1[5] = v41 + 1;
    uint64_t v42 = (uint64_t)a1 + *(int *)(v3 + 48);
    *a1 = v41;
    sub_1C69D04E8(v40, v42, &qword_1EBC07C30);
    uint64_t v37 = (uint64_t)a1;
    uint64_t v38 = 0;
    return __swift_storeEnumTagSinglePayload(v37, v38, 1, v3);
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1C69CEC90(uint64_t a1, uint64_t a2)
{
  v2[8] = a2;
  sub_1C69E1538();
  v2[9] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D28);
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  uint64_t v6 = sub_1C69E1818();
  v2[18] = v6;
  v2[19] = *(void *)(v6 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  uint64_t v7 = sub_1C69E19A8();
  v2[5] = v7;
  v2[6] = sub_1C69D0564(&qword_1EBC07C68, MEMORY[0x1E4FA4BD8]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1, v7);
  return MEMORY[0x1F4188298](sub_1C69CEF1C, 0, 0);
}

#error "1C69CF140: call analysis failed (funcsize=188)"

uint64_t sub_1C69CF234()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CF2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  int64_t v32 = (void (*)(uint64_t, uint64_t))v14[23];
  uint64_t v15 = v14[21];
  uint64_t v16 = v14[18];
  uint64_t v17 = v14[14];
  uint64_t v18 = v14[15];
  uint64_t v20 = v14[12];
  uint64_t v19 = v14[13];
  uint64_t v21 = v14[10];
  uint64_t v22 = v14[11];
  sub_1C69E1E78();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  v32(v15, v16);
  sub_1C6995768(v14[17], &qword_1EBC07D38);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v14 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  return v24(v23, v24, v25, v26, v27, v28, v29, v30, a9, v32, v14 + 2, a12, a13, a14);
}

void sub_1C69CF430(uint64_t a1)
{
  sub_1C69CA240(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1C69CF43C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a2;
  sub_1C69E1538();
  v4[9] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D28);
  v4[10] = v8;
  v4[11] = *(void *)(v8 - 8);
  v4[12] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  v4[13] = v9;
  v4[14] = *(void *)(v9 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v10 = sub_1C69E1818();
  v4[18] = v10;
  v4[19] = *(void *)(v10 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[5] = a3;
  v4[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  return MEMORY[0x1F4188298](sub_1C69CF694, 0, 0);
}

#error "1C69CF8B8: call analysis failed (funcsize=188)"

uint64_t sub_1C69CF9AC()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69CFA74()
{
  return type metadata accessor for EventDrivenSuggestionsClient(0);
}

uint64_t type metadata accessor for EventDrivenSuggestionsClient(uint64_t a1)
{
  return sub_1C6995204(a1, (uint64_t *)&unk_1EBC077F0);
}

uint64_t sub_1C69CFA9C()
{
  uint64_t result = sub_1C69E1198();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for EventDrivenSuggestionsClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EventDrivenSuggestionsClient);
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.disconnect(for:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v0 + 192) + **(int **)(*(void *)v0 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1C6995B5C;
  return v6(v3);
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.getSuggestionsForApp(for:)()
{
  uint64_t v5 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 200) + **(int **)(*(void *)v0 + 200));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_28(v1);
  void *v2 = v3;
  v2[1] = sub_1C6991498;
  OUTLINED_FUNCTION_67_1();
  return v5();
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.submit(event:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v0 + 208) + **(int **)(*(void *)v0 + 208));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1C6995B5C;
  return v6(v3);
}

uint64_t sub_1C69CFE90()
{
  return type metadata accessor for Connection(0);
}

void sub_1C69CFE98()
{
  sub_1C69CFFD0();
  if (v0 <= 0x3F)
  {
    sub_1C69E1198();
    if (v1 <= 0x3F)
    {
      sub_1C69E1818();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_1C69CFFD0()
{
  if (!qword_1EBC07D40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBC07800);
    unint64_t v0 = sub_1C69E1F18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBC07D40);
    }
  }
}

void sub_1C69D002C()
{
  sub_1C69CCD34(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_1C69D0048()
{
}

uint64_t sub_1C69D005C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 80) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  uint64_t v8 = OUTLINED_FUNCTION_53_1();
  v9(v8);
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1C69D0104(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07800);
  OUTLINED_FUNCTION_26_2(v3);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)(v1 + 5);
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28(v10);
  void *v11 = v12;
  v11[1] = sub_1C6995B5C;
  return sub_1C69CD4A8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_1C69D01E4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C69D021C()
{
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6991498;
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1EA443450 + dword_1EA443450);
  return v3();
}

uint64_t sub_1C69D02C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69D0330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69D0394()
{
  sub_1C69E1818();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_53_1();
  v9(v8);
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1C69D0428()
{
  OUTLINED_FUNCTION_20();
  uint64_t v0 = sub_1C69E1818();
  OUTLINED_FUNCTION_26_2(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_28(v1);
  void *v2 = v3;
  v2[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_67_1();
  return sub_1C69C86FC();
}

uint64_t sub_1C69D04E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1C69D0544()
{
  return sub_1C69CBABC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint8_t **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1C69D0564(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C69D05B0()
{
  return sub_1C69D0544();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_26_3(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  uint64_t v3 = *(void *)(v1 + 136);
  return sub_1C6995768(v3, v0);
}

void OUTLINED_FUNCTION_28_3(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return *(void *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return *(void *)(v0 + 168);
}

void OUTLINED_FUNCTION_40_1()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_42_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  *a12 = a1;
  return sub_1C69E1F28();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_1C69E2178();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_1(uint64_t result)
{
  *(void *)(v1 + 192) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return v0;
}

void OUTLINED_FUNCTION_52_1(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4187F00](v4, v3, a3, v5, v4);
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  *(_WORD *)(v0 + 12) = 2048;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return sub_1C69E1C68();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return v0;
}

void OUTLINED_FUNCTION_63_1(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_65_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_70_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_72_1()
{
  return sub_1C69E2058();
}

void OUTLINED_FUNCTION_74_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

void OUTLINED_FUNCTION_75_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_76_1(void *a1)
{
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v1;
  a1[5] = v2;
  return sub_1C69E1538();
}

void *OUTLINED_FUNCTION_77_1(void *result)
{
  result[2] = v4;
  result[3] = v3;
  result[4] = v2;
  result[5] = v1;
  return result;
}

void *sub_1C69D0AF8(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[2] = a1;
  sub_1C69958A4(a2, (uint64_t)(v5 + 3));
  v5[8] = a3;
  v5[9] = a4;
  v5[10] = a5;
  return v5;
}

void sub_1C69D0B48()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v31 = v2;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v10 = v9;
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v16 = OUTLINED_FUNCTION_44(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_19();
  uint64_t v19 = v18 - v17;
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C69E1C68();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EBC085A8);
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_1C69E1C48();
  os_log_type_t v22 = sub_1C69E1ED8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v30 = v1;
    uint64_t v23 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v32 = OUTLINED_FUNCTION_25_1();
    *uint64_t v23 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1C69A8148(v12, v10, &v32);
    OUTLINED_FUNCTION_75_0(v24);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_24_2(&dword_1C698D000, v21, v22, "executing SiriSuggestionsXPCService suggestNext on request: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    uint64_t v1 = v30;
    OUTLINED_FUNCTION_17();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v25 = *(void *)(v1 + 16);
  uint64_t v26 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v19, v27, v28, v26);
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = v12;
  v29[5] = v10;
  v29[6] = v8;
  v29[7] = v6;
  v29[8] = v25;
  v29[9] = v4;
  v29[10] = v31;
  v29[11] = v14;
  swift_bridgeObjectRetain();
  sub_1C69B8C70(v8, v6);
  swift_retain();
  swift_retain();
  sub_1C69DA3CC(v19, (uint64_t)&unk_1EA443540, (uint64_t)v29);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D0DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v14;
  *(_OWORD *)(v8 + 72) = v13;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 32) = a4;
  uint64_t v9 = sub_1C69E1538();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  uint64_t v10 = sub_1C69E1C38();
  *(void *)(v8 + 120) = v10;
  *(void *)(v8 + 128) = *(void *)(v10 - 8);
  *(void *)(v8 + 136) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D0F04, 0, 0);
}

uint64_t sub_1C69D0F04()
{
  uint64_t v1 = (void *)sub_1C69E1B38();
  sub_1C69E1B18();

  sub_1C69E1608();
  uint64_t v2 = (void *)sub_1C69E1B38();
  sub_1C69E1B48();

  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C69D1004;
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[4];
  return sub_1C69D16EC(v8, v6, v7, v4, v5);
}

uint64_t sub_1C69D1004()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_10_0();
    return MEMORY[0x1F4188298](v7, v8, v9);
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v3 + 160) = v10;
    *uint64_t v10 = v5;
    v10[1] = sub_1C69D1148;
    return StatefulSuggestionsClient.suggestNext(requestId:)();
  }
}

uint64_t sub_1C69D1148()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69D1210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_46();
  a20 = v22;
  uint64_t v26 = (void *)v22[19];
  sub_1C69E0568();
  OUTLINED_FUNCTION_35();
  sub_1C69E0558();
  sub_1C69E0538();
  sub_1C69D9B1C(&qword_1EBC07C10, MEMORY[0x1E4FA44C8]);
  sub_1C69E0548();
  uint64_t v28 = v22[14];
  if (v26)
  {
    OUTLINED_FUNCTION_67_0();
    v29();
    swift_release();
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C69E1C68();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EBC085A8);
    id v31 = v26;
    id v32 = v26;
    int64_t v33 = sub_1C69E1C48();
    os_log_type_t v34 = sub_1C69E1EE8();
    if (OUTLINED_FUNCTION_22(v34))
    {
      uint64_t v23 = v22 + 3;
      OUTLINED_FUNCTION_13_1();
      a10 = OUTLINED_FUNCTION_25_1();
      OUTLINED_FUNCTION_59_1(4.8149e-34);
      v22[2] = v26;
      id v35 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
      uint64_t v36 = OUTLINED_FUNCTION_76_2();
      uint64_t v38 = sub_1C69A8148(v36, v37, &a10);
      OUTLINED_FUNCTION_22_3(v38);
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_24_2(&dword_1C698D000, v33, (os_log_type_t)v28, "could not suggest next turn info because of: %s");
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
    }
    uint64_t v42 = (void (*)(void, unint64_t, void *))v22[9];
    id v43 = v26;
    v42(0, 0xC000000000000000, v26);
  }
  else
  {
    uint64_t v23 = v27;
    ((void (*)(void))v22[9])();
    uint64_t v39 = OUTLINED_FUNCTION_68();
    sub_1C69A36B4(v39, v40);
    swift_release();
    OUTLINED_FUNCTION_67_0();
    v41();
  }
  sub_1C69E1608();
  sub_1C69E1B38();
  OUTLINED_FUNCTION_34_2();

  OUTLINED_FUNCTION_67_0();
  v44();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  return v46(v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1C69D14E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_8_4();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_19_4();
  a18 = v20;
  uint64_t v24 = (void *)v20[19];
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C69E1C68();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBC085A8);
  id v26 = v24;
  id v27 = v24;
  uint64_t v28 = sub_1C69E1C48();
  os_log_type_t v29 = sub_1C69E1EE8();
  if (OUTLINED_FUNCTION_22(v29))
  {
    uint64_t v21 = v20 + 3;
    uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    a9 = OUTLINED_FUNCTION_25_1();
    *uint64_t v30 = 136315138;
    v20[2] = v24;
    id v31 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v32 = OUTLINED_FUNCTION_76_2();
    uint64_t v34 = sub_1C69A8148(v32, v33, &a9);
    OUTLINED_FUNCTION_22_3(v34);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_35_2(&dword_1C698D000, v28, v35, "could not suggest next turn info because of: %s");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v36 = (void (*)(void, unint64_t, void *))v20[9];
  id v37 = v24;
  v36(0, 0xC000000000000000, v24);

  sub_1C69E1608();
  sub_1C69E1B38();
  OUTLINED_FUNCTION_34_2();

  OUTLINED_FUNCTION_67_0();
  v38();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_55();
  return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12);
}

uint64_t sub_1C69D16EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  uint64_t v6[2] = a1;
  long long v6[3] = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F00);
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4434D8);
  v6[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D1828, 0, 0);
}

uint64_t sub_1C69D1828()
{
  uint64_t v1 = sub_1C69D4BE0();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v48 = v0[8];
    uint64_t v59 = MEMORY[0x1E4FBC860];
    sub_1C69C34D8();
    uint64_t v3 = sub_1C69D94AC(v1);
    if ((v3 & 0x8000000000000000) == 0)
    {
      unint64_t v9 = v3;
      if (v3 < 1 << *(unsigned char *)(v1 + 32))
      {
        uint64_t v10 = v1 + 64;
        uint64_t v44 = v0[14];
        uint64_t v45 = v0[15];
        uint64_t v42 = v0[12];
        uint64_t v43 = v0[13];
        uint64_t v40 = v0[9];
        uint64_t v41 = v0[11];
        uint64_t v46 = v1;
        uint64_t v47 = v0;
        uint64_t v39 = v1 + 64;
        while ((*(void *)(v10 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
        {
          if (v4 != *(_DWORD *)(v1 + 36)) {
            goto LABEL_24;
          }
          uint64_t v51 = 1 << v9;
          unint64_t v52 = v9 >> 6;
          uint64_t v49 = v2;
          int v50 = v4;
          uint64_t v11 = (void *)v0[14];
          unint64_t v55 = (void *)v0[15];
          uint64_t v12 = (void *)v0[13];
          uint64_t v58 = (uint64_t *)v0[12];
          uint64_t v54 = (uint64_t *)v0[11];
          uint64_t v56 = v0[10];
          long long v13 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
          uint64_t v14 = *v13;
          uint64_t v15 = v13[1];
          uint64_t v16 = sub_1C69E1848();
          OUTLINED_FUNCTION_1_0();
          uint64_t v18 = v17;
          uint64_t v57 = v9;
          uint64_t v19 = *(void (**)(void))(v17 + 16);
          OUTLINED_FUNCTION_28_4();
          v19();
          void *v11 = v14;
          *(void *)(v44 + 8) = v15;
          *uint64_t v12 = v14;
          *(void *)(v43 + 8) = v15;
          OUTLINED_FUNCTION_28_4();
          v19();
          sub_1C69D952C((uint64_t)v12, (uint64_t)v58);
          swift_bridgeObjectRetain_n();
          sub_1C69D9CD8((uint64_t)v11, &qword_1EA442F00);
          uint64_t v20 = *(int *)(v48 + 48);
          uint64_t v53 = (char *)v55 + v20;
          uint64_t v21 = (char *)v54 + v20;
          uint64_t v22 = *v58;
          uint64_t v23 = *(void *)(v42 + 8);
          *uint64_t v54 = *v58;
          *(void *)(v41 + 8) = v23;
          OUTLINED_FUNCTION_68();
          OUTLINED_FUNCTION_28_4();
          v19();
          *unint64_t v55 = v22;
          *(void *)(v45 + 8) = v23;
          uint64_t v24 = v56 + *(int *)(v48 + 48);
          OUTLINED_FUNCTION_28_4();
          v19();
          (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v53, v24, v16);
          uint64_t v25 = *(void (**)(char *, uint64_t))(v18 + 8);
          swift_bridgeObjectRetain();
          v25(v21, v16);
          sub_1C69D9CD8((uint64_t)v58, &qword_1EA442F00);
          uint64_t v26 = v59;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1C69C34D8();
            uint64_t v26 = v59;
          }
          unint64_t v27 = *(void *)(v26 + 16);
          uint64_t v0 = v47;
          if (v27 >= *(void *)(v26 + 24) >> 1)
          {
            sub_1C69C34D8();
            uint64_t v26 = v59;
          }
          uint64_t v28 = v47[15];
          *(void *)(v26 + 16) = v27 + 1;
          uint64_t v3 = sub_1C69D952C(v28, v26+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v27);
          uint64_t v1 = v46;
          if (v57 >= -(-1 << *(unsigned char *)(v46 + 32))) {
            goto LABEL_25;
          }
          uint64_t v10 = v39;
          if ((*(void *)(v39 + 8 * v52) & v51) == 0) {
            goto LABEL_26;
          }
          if (v50 != *(_DWORD *)(v46 + 36)) {
            goto LABEL_28;
          }
          OUTLINED_FUNCTION_77_2();
          uint64_t v3 = sub_1C69E1F88();
          uint64_t v2 = v49 - 1;
          if (v49 == 1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_20;
          }
          unint64_t v9 = v3;
          if ((v3 & 0x8000000000000000) == 0)
          {
            uint64_t v4 = *(unsigned int *)(v46 + 36);
            if (v3 < 1 << *(unsigned char *)(v46 + 32)) {
              continue;
            }
          }
          goto LABEL_27;
        }
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = MEMORY[0x1E4FBC860];
LABEL_20:
    v0[17] = v26;
    uint64_t v29 = v0[16];
    uint64_t v30 = v0[6];
    uint64_t v32 = v0[2];
    uint64_t v31 = v0[3];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4434E0);
    OUTLINED_FUNCTION_72(v29, v34, v35, v33);
    uint64_t v36 = (void *)swift_allocObject();
    v0[18] = v36;
    long long v36[2] = v30;
    long long v36[3] = v32;
    v36[4] = v31;
    swift_retain();
    swift_bridgeObjectRetain();
    id v37 = (void *)swift_task_alloc();
    v0[19] = v37;
    *id v37 = v0;
    v37[1] = sub_1C69D1D80;
    uint64_t v4 = v0[16];
    uint64_t v7 = v0[8];
    uint64_t v8 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v5 = &unk_1EA4434F0;
    uint64_t v3 = v26;
    uint64_t v6 = v36;
  }
  return MEMORY[0x1F4159CA8](v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1C69D1D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_19_4();
  uint64_t v27 = v13;
  OUTLINED_FUNCTION_1();
  uint64_t v15 = *(void *)(v14 + 128);
  uint64_t v16 = *v12;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v17 = v16;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C69D9CD8(v15, &qword_1EA4434D8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_55();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, v27, a10, a11, a12);
}

void sub_1C69D1F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)sub_1C69E0608();
  if (a3) {
    uint64_t v7 = sub_1C69E0578();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

void sub_1C69D2018()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v16 = OUTLINED_FUNCTION_44(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_55_0();
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1C69E1C68();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC085A8);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_1C69E1C48();
  os_log_type_t v19 = sub_1C69E1ED8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v30 = v4;
    uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = OUTLINED_FUNCTION_77_2();
    uint64_t v24 = sub_1C69A8148(v21, v22, v23);
    OUTLINED_FUNCTION_75_0(v24);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v18, v19, "Executing SiriSuggestionsXPCService logIntent on request: %s", v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    uint64_t v4 = v30;
    OUTLINED_FUNCTION_17();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v25 = *(void *)(v2 + 16);
  uint64_t v26 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v1, v27, v28, v26);
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = v10;
  v29[5] = v8;
  v29[6] = v25;
  v29[7] = v14;
  v29[8] = v12;
  v29[9] = v6;
  v29[10] = v4;
  swift_bridgeObjectRetain();
  sub_1C69B8C70(v10, v8);
  swift_retain();
  swift_retain();
  sub_1C69D29F8(v1, (uint64_t)&unk_1EA443530, (uint64_t)v29);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D2290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = v13;
  v8[22] = v14;
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  uint64_t v9 = sub_1C69E1C38();
  v8[23] = v9;
  v8[24] = *(void *)(v9 - 8);
  v8[25] = swift_task_alloc();
  uint64_t v10 = sub_1C69E1848();
  v8[26] = v10;
  v8[27] = *(void *)(v10 - 8);
  v8[28] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D23C0, 0, 0);
}

uint64_t sub_1C69D23C0()
{
  OUTLINED_FUNCTION_19_4();
  sub_1C69E0528();
  OUTLINED_FUNCTION_35();
  *(void *)(v0 + 232) = sub_1C69E0518();
  sub_1C69D9B1C(&qword_1EBC07C50, MEMORY[0x1E4FA49D8]);
  OUTLINED_FUNCTION_77_2();
  sub_1C69E0508();
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  sub_1C69E1838();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (void *)sub_1C69E1B38();
  sub_1C69E1B18();

  sub_1C69E1608();
  uint64_t v5 = (void *)sub_1C69E1B38();
  sub_1C69E1B48();

  uint64_t v6 = *(void *)(v0 + 56);
  long long v10 = *(_OWORD *)(v0 + 40);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  *(_OWORD *)(v0 + 88) = v10;
  *(void *)(v0 + 104) = v6;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 64));
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_33_1();
  v7();
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v8;
  *unint64_t v8 = v0;
  v8[1] = sub_1C69D2628;
  return StatefulSuggestionsClient.logEngagement(for:intent:)();
}

uint64_t sub_1C69D2628()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 248) = v0;
  swift_task_dealloc();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_1(v3 + 64);
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69D270C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_19_4();
  uint64_t v14 = OUTLINED_FUNCTION_41_2();
  v15(v14);
  sub_1C69E1608();
  sub_1C69E1B38();
  OUTLINED_FUNCTION_36_2();

  swift_release();
  uint64_t v16 = OUTLINED_FUNCTION_47_2();
  v17(v16);
  __swift_destroy_boxed_opaque_existential_1(v12 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_55();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, v12 + 16, a10, a11, a12);
}

uint64_t sub_1C69D27C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_16_2();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_46();
  a20 = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v23 + 8));
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)v23[31];
  uint64_t v28 = sub_1C69E1C68();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EBC085A8);
  id v29 = v27;
  id v30 = v27;
  uint64_t v31 = sub_1C69E1C48();
  os_log_type_t v32 = sub_1C69E1EE8();
  BOOL v33 = OUTLINED_FUNCTION_28_1(v32);
  uint64_t v34 = (void *)v23[31];
  if (v33)
  {
    uint64_t v24 = 12;
    OUTLINED_FUNCTION_13_1();
    a11 = OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_59_1(4.8149e-34);
    v23[14] = v34;
    id v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v36 = OUTLINED_FUNCTION_76_2();
    v23[15] = sub_1C69A8148(v36, v37, &a11);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_24_2(&dword_1C698D000, v31, v22, "Could not logIntent info because of: %s");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v38 = (void *)v23[31];
  uint64_t v39 = (void (*)(void *))v23[21];
  id v40 = v38;
  v39(v38);

  sub_1C69E1608();
  sub_1C69E1B38();
  OUTLINED_FUNCTION_36_2();

  swift_release();
  uint64_t v41 = OUTLINED_FUNCTION_47_2();
  v42(v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v23 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_30();
  return v44(v43, v44, v45, v46, v47, v48, v49, v50, a9, v23 + 2, a11, a12, a13, a14);
}

uint64_t sub_1C69D29F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1C69E1E58();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1C69D9CD8(a1, &qword_1EBC07D20);
  }
  else
  {
    sub_1C69E1E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C69E1E18();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_1C69D2B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(void))
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v24 = v23;
  uint64_t v26 = v25;
  unint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  unint64_t v36 = v35;
  uint64_t v38 = v37;
  OUTLINED_FUNCTION_2();
  uint64_t v63 = v39;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v41 = OUTLINED_FUNCTION_44(v40);
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_19();
  uint64_t v44 = v43 - v42;
  sub_1C6995840(v22 + 24, (uint64_t)v66);
  if (sub_1C69C671C(v38, v36, *(void *)(v22 + 64), *(void *)(v22 + 72)))
  {
    uint64_t v45 = sub_1C69E1E58();
    OUTLINED_FUNCTION_72(v44, v46, v47, v45);
    sub_1C6995840((uint64_t)v66, (uint64_t)v64);
    uint64_t v48 = (void *)swift_allocObject();
    uint64_t v49 = v34;
    uint64_t v50 = (uint64_t)v48;
    v48[2] = 0;
    v48[3] = 0;
    v48[4] = v30;
    v48[5] = v28;
    v48[6] = v26;
    v48[7] = v24;
    v48[8] = v38;
    v48[9] = v36;
    v48[10] = v49;
    v48[11] = v32;
    sub_1C69958A4(v64, (uint64_t)(v48 + 12));
    *(void *)(v50 + 136) = a21;
    *(void *)(v50 + 144) = v63;
    sub_1C69B8C70(v30, v28);
    sub_1C69D9AAC(v26, v24);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C69DA3CC(v44, (uint64_t)&unk_1EA443520, v50);
    swift_release();
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    uint64_t v51 = sub_1C69E1C68();
    __swift_project_value_buffer(v51, (uint64_t)qword_1EBC085A8);
    unint64_t v52 = sub_1C69E1C48();
    os_log_type_t v53 = sub_1C69E1ED8();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)OUTLINED_FUNCTION_23_1();
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_1C698D000, v52, v53, "Finished in app request setup. Events will flow when ready through the bridge", v54, 2u);
      OUTLINED_FUNCTION_17();
    }

    ((void (*)(void))a22)(0);
  }
  else
  {
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    uint64_t v55 = sub_1C69E1C68();
    __swift_project_value_buffer(v55, (uint64_t)qword_1EBC085A8);
    swift_bridgeObjectRetain_n();
    uint64_t v56 = sub_1C69E1C48();
    os_log_type_t v57 = sub_1C69E1EE8();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = OUTLINED_FUNCTION_65_2();
      *(void *)&v64[0] = OUTLINED_FUNCTION_64_1();
      *(_DWORD *)uint64_t v58 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_1C69A8148(v38, v36, (uint64_t *)v64);
      sub_1C69E1F28();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v58 + 12) = 2080;
      sub_1C69E1038();
      uint64_t v59 = sub_1C69E1018();
      uint64_t v65 = sub_1C69A8148(v59, v60, (uint64_t *)v64);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C698D000, v56, v57, "Unauthorised access to query %s suggestions. Check entitlement of %s is set correctly", (uint8_t *)v58, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1C69D8FC4();
    uint64_t v61 = (void *)swift_allocError();
    *uint64_t v62 = 0;
    v62[1] = 0;
    a22();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D2F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 272) = v19;
  *(void *)(v8 + 280) = v20;
  *(_OWORD *)(v8 + 240) = v17;
  *(_OWORD *)(v8 + 256) = v18;
  *(void *)(v8 + 224) = a7;
  *(void *)(v8 + 232) = a8;
  *(void *)(v8 + 208) = a5;
  *(void *)(v8 + 216) = a6;
  *(void *)(v8 + 200) = a4;
  uint64_t v9 = sub_1C69E1538();
  *(void *)(v8 + 288) = v9;
  *(void *)(v8 + 296) = *(void *)(v9 - 8);
  *(void *)(v8 + 304) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077E8);
  *(void *)(v8 + 312) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D48);
  *(void *)(v8 + 320) = v10;
  *(void *)(v8 + 328) = *(void *)(v10 - 8);
  *(void *)(v8 + 336) = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D50);
  *(void *)(v8 + 344) = v11;
  *(void *)(v8 + 352) = *(void *)(v11 - 8);
  *(void *)(v8 + 360) = swift_task_alloc();
  sub_1C69E1818();
  *(void *)(v8 + 368) = swift_task_alloc();
  uint64_t v12 = sub_1C69E16E8();
  *(void *)(v8 + 376) = v12;
  *(void *)(v8 + 384) = *(void *)(v12 - 8);
  *(void *)(v8 + 392) = swift_task_alloc();
  uint64_t v13 = sub_1C69E1C68();
  *(void *)(v8 + 400) = v13;
  *(void *)(v8 + 408) = *(void *)(v13 - 8);
  *(void *)(v8 + 416) = swift_task_alloc();
  *(void *)(v8 + 424) = swift_task_alloc();
  *(void *)(v8 + 432) = swift_task_alloc();
  uint64_t v14 = sub_1C69E1848();
  *(void *)(v8 + 440) = v14;
  *(void *)(v8 + 448) = *(void *)(v14 - 8);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C80);
  *(void *)(v8 + 472) = swift_task_alloc();
  *(void *)(v8 + 480) = swift_task_alloc();
  *(void *)(v8 + 488) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D32F4, 0, 0);
}

uint64_t sub_1C69D32F4()
{
  uint64_t v59 = v0;
  uint64_t v1 = sub_1C69D4BE0();
  uint64_t v2 = v0[61];
  unint64_t v3 = v0[28];
  uint64_t v4 = sub_1C69D91CC(v1);
  v0[62] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1C69E1B08();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v5);
  uint64_t v57 = v4;
  if (v3 >> 60 != 15)
  {
    sub_1C69B8C70(v0[27], v0[28]);
    sub_1C69D4C9C();
    uint64_t v6 = v0[61];
    uint64_t v7 = v0[60];
    uint64_t v8 = v0[56];
    uint64_t v9 = v0[57];
    uint64_t v10 = v0[55];
    sub_1C69E1838();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
    int v11 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload(v7, v11 ^ 1u, 1, v5);
    sub_1C69D9B64(v7, v6);
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0[50], (uint64_t)qword_1EBC085A8);
    uint64_t v12 = sub_1C69E1C48();
    os_log_type_t v13 = sub_1C69E1EC8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v53 = v0[27];
      unint64_t v55 = v0[28];
      uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_13_1();
      v58[0] = OUTLINED_FUNCTION_25_1();
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_beginAccess();
      uint64_t v15 = sub_1C69E1F08();
      v0[24] = sub_1C69A8148(v15, v16, v58);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C698D000, v12, v13, "Decoded intentToSuggest: %s", v14, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
      uint64_t v17 = v53;
      unint64_t v18 = v55;
    }
    else
    {
      uint64_t v17 = v0[27];
      unint64_t v18 = v0[28];
    }
    sub_1C69A36A0(v17, v18);
  }
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v19 = v0[54];
  uint64_t v21 = v0[50];
  uint64_t v20 = v0[51];
  unint64_t v22 = v0[32];
  uint64_t v23 = __swift_project_value_buffer(v21, (uint64_t)qword_1EBC085A8);
  v0[63] = v23;
  unint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  v0[64] = v24;
  v0[65] = (v20 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v24(v19, v23, v21);
  unint64_t v56 = v22;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_1C69E1C48();
  os_log_type_t v26 = sub_1C69E1EC8();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = v0[54];
  uint64_t v30 = v0[50];
  uint64_t v29 = v0[51];
  if (v27)
  {
    uint64_t v52 = v0[50];
    uint64_t v54 = v0[54];
    uint64_t v49 = v0[32];
    uint64_t v50 = v0[31];
    os_log_type_t type = v26;
    uint64_t v32 = v0[29];
    unint64_t v31 = v0[30];
    uint64_t v33 = OUTLINED_FUNCTION_25_1();
    v58[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315650;
    swift_bridgeObjectRetain();
    v0[19] = sub_1C69A8148(v32, v31, v58);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    if (v49) {
      uint64_t v34 = v50;
    }
    else {
      uint64_t v34 = 4271950;
    }
    if (v49) {
      unint64_t v35 = v56;
    }
    else {
      unint64_t v35 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v0[20] = sub_1C69A8148(v34, v35, v58);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 22) = 2080;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
    uint64_t v36 = sub_1C69E1C88();
    unint64_t v38 = v37;
    swift_release();
    v0[21] = sub_1C69A8148(v36, v38, v58);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1C698D000, v25, type, "XPC Stream for appBundleId: %s, placementId: %s, entities: %s opened.", (uint8_t *)v33, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    uint64_t v41 = *(void (**)(void, void))(v29 + 8);
    uint64_t v40 = v29 + 8;
    uint64_t v39 = v41;
    v41(v54, v52);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();

    uint64_t v42 = *(void (**)(void, void))(v29 + 8);
    uint64_t v40 = v29 + 8;
    uint64_t v39 = v42;
    v42(v28, v30);
  }
  v0[67] = v39;
  v0[66] = v40;
  uint64_t v43 = v0[61];
  uint64_t v44 = v0[59];
  uint64_t v45 = (void *)v0[33];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C69E17E8();
  sub_1C69AA804(v57);
  swift_beginAccess();
  sub_1C69D9AC0(v43, v44, &qword_1EBC07C80);
  sub_1C69E1688();
  __swift_project_boxed_opaque_existential_1(v45, v45[3]);
  uint64_t v46 = (void *)swift_task_alloc();
  v0[68] = v46;
  *uint64_t v46 = v0;
  v46[1] = sub_1C69D3C28;
  OUTLINED_FUNCTION_57_1();
  return MEMORY[0x1F4158E20]();
}

uint64_t sub_1C69D3C28()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69D3CF0()
{
  OUTLINED_FUNCTION_6_0();
  sub_1C69E1E98();
  v0[69] = v0[67];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[70] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69D3D98;
  uint64_t v2 = OUTLINED_FUNCTION_39_1();
  return MEMORY[0x1F4187ED8](v2);
}

uint64_t sub_1C69D3D98()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 568) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69D3E7C()
{
  uint64_t v86 = v0;
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 288);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 504);
    uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
    uint64_t v5 = *(void *)(v0 + 424);
    uint64_t v6 = *(void *)(v0 + 400);
    (*(void (**)(void, void))(*(void *)(v0 + 328) + 8))(*(void *)(v0 + 336), *(void *)(v0 + 320));
    v4(v5, v3, v6);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v7 = sub_1C69E1C48();
    os_log_type_t v8 = sub_1C69E1EC8();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v11 = *(void *)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 400);
    unint64_t v13 = *(void *)(v0 + 256);
    if (v9)
    {
      uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
      uint64_t v70 = *(void *)(v0 + 248);
      os_log_type_t type = v8;
      uint64_t v14 = *(void *)(v0 + 232);
      unint64_t v15 = *(void *)(v0 + 240);
      uint64_t v77 = *(void *)(v0 + 400);
      uint64_t v16 = OUTLINED_FUNCTION_25_1();
      v85[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315650;
      uint64_t v75 = v11;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 120) = sub_1C69A8148(v14, v15, v85);
      sub_1C69E1F28();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2080;
      if (v13) {
        uint64_t v17 = v70;
      }
      else {
        uint64_t v17 = 4271950;
      }
      if (v13) {
        unint64_t v18 = v13;
      }
      else {
        unint64_t v18 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 128) = sub_1C69A8148(v17, v18, v85);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
      uint64_t v19 = sub_1C69E1C88();
      unint64_t v21 = v20;
      swift_release();
      *(void *)(v0 + 136) = sub_1C69A8148(v19, v21, v85);
      sub_1C69E1F28();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1C698D000, v7, type, "XPC Stream for appBundleId: %s, placementId: %s, entities: %s closed.", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();

      v81(v75, v77);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_release_n();

      swift_bridgeObjectRelease_n();
      v10(v11, v12);
    }
    OUTLINED_FUNCTION_73_2();
    objc_msgSend(*(id *)(v0 + 272), sel_finalise);
    uint64_t v40 = OUTLINED_FUNCTION_61_1();
    v41(v40);
    uint64_t v42 = OUTLINED_FUNCTION_52_2();
    v43(v42);
    sub_1C69D9CD8((uint64_t)v7, &qword_1EBC07C80);
    goto LABEL_22;
  }
  unint64_t v22 = *(void **)(v0 + 568);
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 296) + 32))(*(void *)(v0 + 304), v1, v2);
  sub_1C69E0568();
  OUTLINED_FUNCTION_35();
  sub_1C69E0558();
  sub_1C69E0538();
  sub_1C69D9B1C(&qword_1EBC07C10, MEMORY[0x1E4FA44C8]);
  uint64_t v23 = sub_1C69E0548();
  if (v22)
  {
    uint64_t v82 = *(void *)(v0 + 488);
    id v84 = v22;
    uint64_t v25 = *(void *)(v0 + 384);
    uint64_t v76 = *(void *)(v0 + 376);
    uint64_t v78 = *(void *)(v0 + 392);
    uint64_t v26 = *(void *)(v0 + 352);
    uint64_t v71 = *(void *)(v0 + 344);
    *(void *)typeb = *(void *)(v0 + 360);
    uint64_t v27 = *(void *)(v0 + 320);
    uint64_t v29 = *(void *)(v0 + 296);
    uint64_t v28 = *(void *)(v0 + 304);
    uint64_t v30 = *(void *)(v0 + 288);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    OUTLINED_FUNCTION_67_0();
    v31();
    (*(void (**)(os_log_type_t *, uint64_t))(v26 + 8))(*(os_log_type_t **)typeb, v71);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v78, v76);
    sub_1C69D9CD8(v82, &qword_1EBC07C80);
    if (qword_1EBC08528[0] != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 400), (uint64_t)qword_1EBC085A8);
    id v32 = v84;
    id v33 = v84;
    uint64_t v34 = sub_1C69E1C48();
    os_log_type_t v35 = sub_1C69E1EE8();
    if (OUTLINED_FUNCTION_22(v35))
    {
      uint64_t v36 = (_DWORD *)OUTLINED_FUNCTION_13_1();
      v85[0] = OUTLINED_FUNCTION_25_1();
      _DWORD *v36 = 136315138;
      *(void *)(v0 + 184) = v84;
      id v37 = v84;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
      uint64_t v38 = sub_1C69E1D08();
      *(void *)(v0 + 176) = sub_1C69A8148(v38, v39, v85);
      OUTLINED_FUNCTION_68();
      sub_1C69E1F28();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_24_2(&dword_1C698D000, v34, (os_log_type_t)v27, "could not suggest next turn info because of: %s");
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
    }
    uint64_t v50 = *(void **)(v0 + 272);
    uint64_t v51 = (void *)sub_1C69E0578();
    objc_msgSend(v50, sel_connectionErrorWithError_, v51);

LABEL_22:
    OUTLINED_FUNCTION_11_5();
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
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_54_1();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v44 = v23;
  unint64_t v45 = v24;
  (*(void (**)(void, void, void))(v0 + 512))(*(void *)(v0 + 416), *(void *)(v0 + 504), *(void *)(v0 + 400));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C69B8C70(v44, v45);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C69B8C70(v44, v45);
  uint64_t v46 = sub_1C69E1C48();
  os_log_type_t v47 = sub_1C69E1EC8();
  if (os_log_type_enabled(v46, v47))
  {
    os_log_type_t typea = v47;
    uint64_t v79 = v46;
    uint64_t v48 = swift_slowAlloc();
    *(void *)(v0 + 144) = swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 136315906;
    swift_bridgeObjectRetain();
    *(void *)(v48 + 4) = OUTLINED_FUNCTION_56_1();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v48 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v48 + 14) = OUTLINED_FUNCTION_56_1();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v48 + 22) = 2080;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
    sub_1C69E1C88();
    swift_release();
    *(void *)(v48 + 24) = OUTLINED_FUNCTION_56_1();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v48 + 32) = 2048;
    switch(v45 >> 62)
    {
      case 1uLL:
        OUTLINED_FUNCTION_27_3();
        LODWORD(v49) = HIDWORD(v44) - v44;
        if (__OFSUB__(HIDWORD(v44), v44))
        {
          __break(1u);
          JUMPOUT(0x1C69D4934);
        }
        uint64_t v49 = (int)v49;
        break;
      case 2uLL:
        uint64_t v56 = *(void *)(v44 + 16);
        uint64_t v57 = *(void *)(v44 + 24);
        OUTLINED_FUNCTION_27_3();
        uint64_t v49 = v57 - v56;
        if (__OFSUB__(v57, v56))
        {
          __break(1u);
          goto LABEL_31;
        }
        break;
      case 3uLL:
LABEL_31:
        OUTLINED_FUNCTION_27_3();
        uint64_t v49 = 0;
        break;
      default:
        OUTLINED_FUNCTION_27_3();
        uint64_t v49 = BYTE6(v45);
        break;
    }
    unint64_t v83 = (uint64_t *)(v0 + 536);
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v59 = *(void *)(v0 + 416);
    uint64_t v60 = *(void *)(v0 + 400);
    *(void *)(v48 + 34) = v49;
    OUTLINED_FUNCTION_27_3();
    _os_log_impl(&dword_1C698D000, v79, typea, "Got new suggestionlist for appBundleId: %s, placementId: %s, entities: %s. Sending %ld bytes of data to remote caller", (uint8_t *)v48, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    v58(v59, v60);
  }
  else
  {
    uint64_t v80 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
    unint64_t v83 = (uint64_t *)(v0 + 552);
    uint64_t v54 = *(void *)(v0 + 416);
    uint64_t v55 = *(void *)(v0 + 400);
    OUTLINED_FUNCTION_27_3();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    OUTLINED_FUNCTION_27_3();

    v80(v54, v55);
  }
  uint64_t v61 = *v83;
  uint64_t v63 = *(void *)(v0 + 296);
  uint64_t v62 = *(void *)(v0 + 304);
  uint64_t v64 = *(void *)(v0 + 288);
  uint64_t v65 = *(void **)(v0 + 272);
  long long v66 = (void *)sub_1C69E0608();
  objc_msgSend(v65, sel_sendSuggestionsWithSuggestions_, v66);

  swift_release();
  OUTLINED_FUNCTION_27_3();
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
  *(void *)(v0 + 552) = v61;
  uint64_t v67 = (void *)swift_task_alloc();
  *(void *)(v0 + 560) = v67;
  *uint64_t v67 = v0;
  v67[1] = sub_1C69D3D98;
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_54_1();
  return MEMORY[0x1F4187ED8]();
}

uint64_t sub_1C69D4944()
{
  unint64_t v22 = v1;
  OUTLINED_FUNCTION_73_2();
  (*(void (**)(void, void))(v1[41] + 8))(v1[42], v1[40]);
  uint64_t v2 = OUTLINED_FUNCTION_61_1();
  v3(v2);
  uint64_t v4 = OUTLINED_FUNCTION_52_2();
  v5(v4);
  sub_1C69D9CD8(v0, &qword_1EBC07C80);
  uint64_t v6 = (void *)v1[14];
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1[50], (uint64_t)qword_1EBC085A8);
  id v7 = v6;
  id v8 = v6;
  BOOL v9 = sub_1C69E1C48();
  os_log_type_t v10 = sub_1C69E1EE8();
  if (OUTLINED_FUNCTION_22(v10))
  {
    uint64_t v11 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v12 = OUTLINED_FUNCTION_25_1();
    _DWORD *v11 = 136315138;
    uint64_t v21 = v12;
    v1[23] = v6;
    id v13 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v14 = sub_1C69E1D08();
    v1[22] = sub_1C69A8148(v14, v15, &v21);
    OUTLINED_FUNCTION_68();
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_35_2(&dword_1C698D000, v9, v16, "could not suggest next turn info because of: %s");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v17 = (void *)v1[34];
  unint64_t v18 = (void *)sub_1C69E0578();
  objc_msgSend(v17, sel_connectionErrorWithError_, v18);

  OUTLINED_FUNCTION_11_5();
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
  OUTLINED_FUNCTION_18();
  return v19();
}

uint64_t sub_1C69D4BE0()
{
  sub_1C69E0528();
  swift_allocObject();
  sub_1C69E0518();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D08);
  sub_1C69D9680();
  sub_1C69E04F8();
  uint64_t result = swift_release();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1C69D4C9C()
{
  return swift_release();
}

void sub_1C69D4F10(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1C69E0578();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_1C69D4F74()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v15 = OUTLINED_FUNCTION_44(v14);
  MEMORY[0x1F4188790](v15);
  uint64_t v16 = OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_72(v1, v17, v18, v16);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v0;
  v19[5] = v13;
  v19[6] = v11;
  v19[7] = v9;
  v19[8] = v7;
  v19[9] = v5;
  v19[10] = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C69DA3CC(v1, (uint64_t)&unk_1EA443510, (uint64_t)v19);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D506C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v12;
  v8[8] = v13;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  uint64_t v9 = sub_1C69E1818();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D5140, 0, 0);
}

uint64_t sub_1C69D5140()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[6];
  uint64_t v3 = v1[7];
  __swift_project_boxed_opaque_existential_1(v1 + 3, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C69E17E8();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1C69D5248;
  uint64_t v5 = v0[11];
  return MEMORY[0x1F4158E28](v5, v2, v3);
}

uint64_t sub_1C69D5248()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_21_4();
  v4(v3);
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1C69D535C()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v0 = OUTLINED_FUNCTION_41_2();
  v1(v0);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t sub_1C69D54B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v6 = OUTLINED_FUNCTION_44(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_19();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = *(void *)(v2 + 16);
  uint64_t v11 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v9, v12, v13, v11);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v10;
  v14[5] = a1;
  v14[6] = a2;
  swift_retain();
  swift_retain();
  sub_1C69DA3CC(v9, (uint64_t)&unk_1EA443500, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1C69D559C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[6] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1C69D5634;
  return StatefulSuggestionsClient.refreshService()();
}

uint64_t sub_1C69D5634()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 56) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69D5710()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v0 = OUTLINED_FUNCTION_41_2();
  v1(v0);
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t sub_1C69D576C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_8_4();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_19_4();
  a18 = v21;
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  unint64_t v24 = (void *)v21[7];
  uint64_t v25 = sub_1C69E1C68();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBC085A8);
  id v26 = v24;
  id v27 = v24;
  uint64_t v28 = sub_1C69E1C48();
  os_log_type_t v29 = sub_1C69E1EE8();
  BOOL v30 = OUTLINED_FUNCTION_28_1(v29);
  unint64_t v31 = (void *)v21[7];
  if (v30)
  {
    OUTLINED_FUNCTION_13_1();
    a9 = OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_59_1(4.8149e-34);
    v21[2] = v31;
    id v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v33 = OUTLINED_FUNCTION_76_2();
    uint64_t v35 = sub_1C69A8148(v33, v34, &a9);
    OUTLINED_FUNCTION_22_3(v35);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_24_2(&dword_1C698D000, v28, v20, "Unable to refresh service: %s");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v36 = (void *)v21[7];
  id v37 = (void (*)(uint64_t))v21[4];
  id v38 = v36;
  uint64_t v39 = OUTLINED_FUNCTION_68_1();
  v37(v39);

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_55();
  return v41(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12);
}

uint64_t sub_1C69D59B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[21] = a3;
  v4[22] = a4;
  v4[19] = a1;
  v4[20] = a2;
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F00);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D5AA8, 0, 0);
}

uint64_t sub_1C69D5AA8()
{
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_46();
  uint64_t v1 = *(void **)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(uint64_t **)(v0 + 152);
  *(void *)(v0 + 112) = *(void *)(v0 + 160);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = *(int *)(v2 + 48);
  *(_DWORD *)(v0 + 312) = v6;
  uint64_t v7 = (char *)v1 + v6;
  uint64_t v8 = (char *)v3 + v6;
  *uint64_t v1 = v4;
  v1[1] = v5;
  uint64_t v9 = sub_1C69E1848();
  *(void *)(v0 + 256) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  *(void *)(v0 + 264) = v11;
  *(void *)(v0 + 272) = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v11(v7, v8, v9);
  sub_1C69E1838();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v10 + 8);
  *(void *)(v0 + 280) = v12;
  *(void *)(v0 + 288) = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v7, v9);
  uint64_t v13 = *(void *)(v0 + 104);
  long long v25 = *(_OWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 64), *(void *)(v0 + 88));
  *(_OWORD *)(v0 + 40) = v25;
  *(void *)(v0 + 56) = v13;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_33_1();
  v14();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v15;
  type metadata accessor for StatefulSuggestionsClient();
  sub_1C69D9B1C(&qword_1EA4434B8, (void (*)(uint64_t))type metadata accessor for StatefulSuggestionsClient);
  *uint64_t v15 = v0;
  v15[1] = sub_1C69D5CC0;
  OUTLINED_FUNCTION_30();
  return MEMORY[0x1F4159030](v16, v17, v18, v19, v20, v21, v22);
}

uint64_t sub_1C69D5CC0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    __swift_destroy_boxed_opaque_existential_1(v3 + 16);
    __swift_destroy_boxed_opaque_existential_1(v3 + 64);
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

void sub_1C69D5DB0()
{
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v1 = *(uint64_t **)(v0 + 152);
  uint64_t v2 = *(void (**)(char *, char *, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v4 = *(void **)(v0 + 240);
  uint64_t type = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = (char *)v1 + *(int *)(v0 + 312);
  uint64_t v8 = sub_1C69E1C68();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBC085A8);
  uint64_t v9 = (char *)v4 + *(int *)(v6 + 48);
  uint64_t v10 = *v1;
  uint64_t v11 = v1[1];
  *uint64_t v4 = v10;
  v4[1] = v11;
  v2(v9, v7, v3);
  sub_1C69D9AC0((uint64_t)v4, v5, &qword_1EA442F00);
  sub_1C69D952C((uint64_t)v4, type);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1C69E1C48();
  os_log_type_t v13 = sub_1C69E1EC8();
  if (os_log_type_enabled(v12, v13))
  {
    OUTLINED_FUNCTION_43_1();
    uint64_t v14 = *(uint64_t **)(v0 + 232);
    uint64_t v27 = *(void *)(v0 + 224);
    os_log_t log = v12;
    uint64_t v15 = *(uint64_t **)(v0 + 216);
    os_log_type_t typea = v13;
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v31 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v18 = *(int *)(v16 + 48);
    uint64_t v19 = (char *)v15 + v18;
    uint64_t v21 = *v14;
    unint64_t v20 = v14[1];
    *uint64_t v15 = *v14;
    v15[1] = v20;
    v25((char *)v15 + v18, (char *)v14 + v18, v6);
    swift_bridgeObjectRetain();
    v26(v19, v6);
    *(void *)(v0 + 144) = sub_1C69A8148(v21, v20, &v31);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69D9CD8(v27, &qword_1EA442F00);
    sub_1C69D9CD8((uint64_t)v14, &qword_1EA442F00);
    _os_log_impl(&dword_1C698D000, log, typea, "submitted %s to state store", v17, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v22 = *(void *)(v0 + 232);
    sub_1C69D9CD8(*(void *)(v0 + 224), &qword_1EA442F00);
    sub_1C69D9CD8(v22, &qword_1EA442F00);
  }
  OUTLINED_FUNCTION_74_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_54_1();
  __asm { BRAA            X2, X16 }
}

void sub_1C69D60A4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void (**)(char *, char *, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v5 = *(void **)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 184);
  os_log_t log = *(os_log_t *)(v0 + 192);
  uint64_t v8 = *(void **)(v0 + 152);
  uint64_t v9 = (char *)v8 + *(int *)(v0 + 312);
  uint64_t v10 = sub_1C69E1C68();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBC085A8);
  uint64_t v11 = (char *)v5 + *(int *)(v7 + 48);
  uint64_t v12 = v8[1];
  *uint64_t v5 = *v8;
  v5[1] = v12;
  v2(v11, v9, v4);
  sub_1C69D9AC0((uint64_t)v5, v6, &qword_1EA442F00);
  sub_1C69D952C((uint64_t)v5, (uint64_t)log);
  id v13 = v1;
  id v14 = v1;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1C69E1C48();
  os_log_type_t v16 = sub_1C69E1EE8();
  BOOL v17 = OUTLINED_FUNCTION_28_1(v16);
  uint64_t v18 = *(void **)(v0 + 304);
  if (v17)
  {
    OUTLINED_FUNCTION_43_1();
    loga = v15;
    uint64_t v19 = *(uint64_t **)(v0 + 216);
    unint64_t v20 = *(uint64_t **)(v0 + 200);
    uint64_t v37 = *(void *)(v0 + 192);
    os_log_type_t type = v5;
    uint64_t v21 = *(void *)(v0 + 184);
    uint64_t v22 = OUTLINED_FUNCTION_65_2();
    uint64_t v41 = OUTLINED_FUNCTION_64_1();
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v23 = *(int *)(v21 + 48);
    uint64_t v24 = (char *)v19 + v23;
    uint64_t v26 = *v20;
    unint64_t v25 = v20[1];
    uint64_t *v19 = *v20;
    v19[1] = v25;
    v35((char *)v19 + v23, (char *)v20 + v23, v3);
    swift_bridgeObjectRetain();
    v36(v24, v3);
    *(void *)(v0 + 120) = sub_1C69A8148(v26, v25, &v41);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    sub_1C69D9CD8(v37, &qword_1EA442F00);
    sub_1C69D9CD8((uint64_t)v20, &qword_1EA442F00);
    *(_WORD *)(v22 + 12) = 2080;
    *(void *)(v0 + 128) = v18;
    id v27 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v28 = sub_1C69E1D08();
    *(void *)(v0 + 136) = sub_1C69A8148(v28, v29, &v41);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C698D000, loga, type, "Unable to submit %s to state store: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 192);

    sub_1C69D9CD8(v30, &qword_1EA442F00);
    uint64_t v31 = OUTLINED_FUNCTION_77_2();
    sub_1C69D9CD8(v31, v32);
  }
  OUTLINED_FUNCTION_74_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_57_1();
  __asm { BRAA            X2, X16 }
}

void sub_1C69D643C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v29 = v12;
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v16 = OUTLINED_FUNCTION_44(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_19();
  uint64_t v19 = v18 - v17;
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C69E1C68();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EBC085A8);
  uint64_t v21 = sub_1C69E1C48();
  os_log_type_t v22 = sub_1C69E1EC8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)OUTLINED_FUNCTION_23_1();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1C698D000, v21, v22, "Submitting all local state store properties", v23, 2u);
    OUTLINED_FUNCTION_17();
  }

  uint64_t v24 = *(void *)(v1 + 16);
  uint64_t v25 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v19, v26, v27, v25);
  uint64_t v28 = (void *)swift_allocObject();
  long long v28[2] = 0;
  v28[3] = 0;
  v28[4] = v29;
  v28[5] = v11;
  v28[6] = v9;
  v28[7] = v7;
  v28[8] = v24;
  v28[9] = v5;
  v28[10] = v3;
  v28[11] = v14;
  swift_bridgeObjectRetain();
  sub_1C69B8C70(v9, v7);
  swift_retain();
  swift_retain();
  sub_1C69DA3CC(v19, (uint64_t)&unk_1EA4434C8, (uint64_t)v28);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D6634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = v17;
  v8[4] = v18;
  uint64_t v14 = (void *)swift_task_alloc();
  v8[5] = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_1C69D6708;
  return sub_1C69D16EC(a4, a5, a6, a7, a8);
}

uint64_t sub_1C69D6708()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 48) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69D67E4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v0 = OUTLINED_FUNCTION_41_2();
  v1(v0);
  OUTLINED_FUNCTION_18();
  return v2();
}

uint64_t sub_1C69D6840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_19_4();
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)v13[6];
  uint64_t v15 = sub_1C69E1C68();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EBC085A8);
  id v16 = v14;
  id v17 = v14;
  uint64_t v18 = sub_1C69E1C48();
  os_log_type_t v19 = sub_1C69E1EE8();
  BOOL v20 = OUTLINED_FUNCTION_28_1(v19);
  uint64_t v21 = (void *)v13[6];
  if (v20)
  {
    os_log_type_t v22 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v23 = (void *)OUTLINED_FUNCTION_48_1();
    *os_log_type_t v22 = 138412290;
    id v24 = v21;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    long long v13[2] = v25;
    sub_1C69E1F28();
    *uint64_t v23 = v25;

    OUTLINED_FUNCTION_24_2(&dword_1C698D000, v18, v12, "Error when submitting to state store: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    OUTLINED_FUNCTION_62_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v26 = (void *)v13[6];
  uint64_t v27 = (void (*)(uint64_t))v13[3];
  id v28 = v26;
  uint64_t v29 = OUTLINED_FUNCTION_68_1();
  v27(v29);

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_55();
  return v31(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12);
}

uint64_t sub_1C69D6A2C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = _Block_copy(v6);
  uint64_t v8 = sub_1C69E1CF8();
  uint64_t v10 = v9;
  id v11 = v5;
  swift_retain();
  uint64_t v12 = sub_1C69E0628();
  unint64_t v14 = v13;

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  v1(v8, v10, v12, v14, v3, v15);
  swift_release();
  sub_1C69A36B4(v12, v14);
  swift_release();
  OUTLINED_FUNCTION_7_3();
  return swift_bridgeObjectRelease();
}

void sub_1C69D6B18()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v3 = v2;
  uint64_t v24 = v4;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v18 = OUTLINED_FUNCTION_44(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_55_0();
  uint64_t v19 = *(void *)(v0 + 16);
  uint64_t v20 = sub_1C69E1E58();
  OUTLINED_FUNCTION_72(v1, v21, v22, v20);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v8;
  v23[5] = v6;
  v23[6] = v16;
  v23[7] = v14;
  v23[8] = v19;
  v23[9] = v12;
  v23[10] = v10;
  v23[11] = v24;
  v23[12] = v3;
  sub_1C69B8C70(v8, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C69DA3CC(v1, (uint64_t)&unk_1EA4434B0, (uint64_t)v23);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D6C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 296) = v13;
  *(void *)(v8 + 304) = v14;
  *(_OWORD *)(v8 + 280) = v12;
  *(void *)(v8 + 264) = a7;
  *(void *)(v8 + 272) = a8;
  *(void *)(v8 + 248) = a5;
  *(void *)(v8 + 256) = a6;
  *(void *)(v8 + 240) = a4;
  uint64_t v9 = sub_1C69E1848();
  *(void *)(v8 + 312) = v9;
  *(void *)(v8 + 320) = *(void *)(v9 - 8);
  *(void *)(v8 + 328) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D6D1C, 0, 0);
}

uint64_t sub_1C69D6D1C()
{
  uint64_t v27 = v0;
  sub_1C69E0528();
  OUTLINED_FUNCTION_35();
  *(void *)(v0 + 336) = sub_1C69E0518();
  sub_1C69D9B1C(&qword_1EBC07C50, MEMORY[0x1E4FA49D8]);
  sub_1C69E0508();
  uint64_t v1 = (void *)(v0 + 16);
  sub_1C69E1838();
  uint64_t v2 = OUTLINED_FUNCTION_21_4();
  v3(v2);
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C69E1C68();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC085A8);
  sub_1C69A4C84(v0 + 16, v0 + 112);
  swift_bridgeObjectRetain_n();
  unint64_t v5 = sub_1C69E1C48();
  os_log_type_t v6 = sub_1C69E1ED8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void *)(v0 + 264);
  if (v7)
  {
    uint64_t v9 = *(void *)(v0 + 256);
    uint64_t v10 = OUTLINED_FUNCTION_65_2();
    v26[0] = OUTLINED_FUNCTION_64_1();
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 216) = sub_1C69A8148(v9, v8, v26);
    uint64_t v1 = (void *)(v0 + 16);
    sub_1C69E1F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    sub_1C69A4C84(v0 + 112, v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
    uint64_t v11 = sub_1C69E1D08();
    *(void *)(v0 + 232) = sub_1C69A8148(v11, v12, v26);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 112);
    _os_log_impl(&dword_1C698D000, v5, v6, "executing SiriSuggestionsXPCService submit on request: %s with result: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  }

  *(void *)(v0 + 208) = *(void *)(v0 + 272);
  uint64_t v13 = *(void *)(v0 + 56);
  long long v25 = *(_OWORD *)(v0 + 40);
  __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 40));
  *(_OWORD *)(v0 + 184) = v25;
  *(void *)(v0 + 200) = v13;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 160));
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_33_1();
  v14();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v15;
  type metadata accessor for StatefulSuggestionsClient();
  sub_1C69D9B1C(&qword_1EA4434B8, (void (*)(uint64_t))type metadata accessor for StatefulSuggestionsClient);
  *uint64_t v15 = v0;
  v15[1] = sub_1C69D72D8;
  OUTLINED_FUNCTION_4_1();
  return MEMORY[0x1F4159030](v16, v17, v18, v19, v20, v21, v22);
}

uint64_t sub_1C69D72D8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 352) = v0;
  swift_task_dealloc();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_1(v3 + 160);
  }
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69D73BC()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = OUTLINED_FUNCTION_41_2();
  v2(v1);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v3();
}

uint64_t sub_1C69D7440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_19_4();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v12 + 20));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v12 + 2));
  uint64_t v13 = (void *)v12[44];
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C69E1C68();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EBC085A8);
  id v15 = v13;
  id v16 = v13;
  uint64_t v17 = sub_1C69E1C48();
  os_log_type_t v18 = sub_1C69E1EE8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v20 = (void *)OUTLINED_FUNCTION_48_1();
    _DWORD *v19 = 138412290;
    id v21 = v13;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    v12[28] = v22;
    sub_1C69E1F28();
    *uint64_t v20 = v22;

    OUTLINED_FUNCTION_35_2(&dword_1C698D000, v17, v23, "Error when submitting to state store: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    OUTLINED_FUNCTION_62_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  uint64_t v24 = (void (*)(uint64_t))v12[37];

  id v25 = v13;
  uint64_t v26 = OUTLINED_FUNCTION_68_1();
  v24(v26);

  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_55();
  return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

void sub_1C69D7740(uint64_t a1, void (**a2)(void, void))
{
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C69E1C68();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC085A8);
  uint64_t v4 = sub_1C69E1C48();
  os_log_type_t v5 = sub_1C69E1EC8();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_1C698D000, v4, v5, "warm up started!", v6, 2u);
    MEMORY[0x1C87A7AA0](v6, -1, -1);
  }

  a2[2](a2, 0);
  _Block_release(a2);
}

void sub_1C69D78A0()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v42 = v2;
  uint64_t v43 = v0;
  uint64_t v40 = v3;
  uint64_t v41 = v4;
  uint64_t v6 = v5;
  unint64_t v38 = v7;
  uint64_t v39 = v8;
  uint64_t v37 = v9;
  uint64_t v10 = sub_1C69E0678();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v15);
  id v16 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v18 = OUTLINED_FUNCTION_44(v17);
  MEMORY[0x1F4188790](v18);
  uint64_t v19 = OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_72(v1, v20, v21, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v6, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v23 = (v14 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = 0;
  *(void *)(v26 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v26 + v22, v16, v10);
  uint64_t v27 = (uint64_t *)(v26 + v23);
  uint64_t v28 = v37;
  unint64_t v29 = v38;
  *uint64_t v27 = v37;
  v27[1] = v29;
  uint64_t v30 = (void *)(v26 + v24);
  uint64_t v31 = v41;
  *uint64_t v30 = v40;
  v30[1] = v31;
  uint64_t v32 = (uint64_t *)(v26 + v25);
  uint64_t v33 = v39;
  unint64_t v35 = v42;
  uint64_t v34 = v43;
  *uint64_t v32 = v39;
  v32[1] = v35;
  *(void *)(v26 + ((v25 + 23) & 0xFFFFFFFFFFFFFFF8)) = v34;
  sub_1C69B8C70(v28, v29);
  swift_retain();
  sub_1C69B8C70(v33, v35);
  swift_retain();
  sub_1C69DA3CC(v1, (uint64_t)&unk_1EA443480, v26);
  swift_release();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_1C69D7A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 208) = v15;
  *(_OWORD *)(v8 + 192) = v14;
  *(void *)(v8 + 176) = a7;
  *(void *)(v8 + 184) = a8;
  *(void *)(v8 + 160) = a5;
  *(void *)(v8 + 168) = a6;
  *(void *)(v8 + 152) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443488);
  *(void *)(v8 + 216) = swift_task_alloc();
  uint64_t v9 = sub_1C69E17A8();
  *(void *)(v8 + 224) = v9;
  *(void *)(v8 + 232) = *(void *)(v9 - 8);
  *(void *)(v8 + 240) = swift_task_alloc();
  uint64_t v10 = sub_1C69E1848();
  *(void *)(v8 + 248) = v10;
  *(void *)(v8 + 256) = *(void *)(v10 - 8);
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  uint64_t v11 = sub_1C69E0678();
  *(void *)(v8 + 280) = v11;
  *(void *)(v8 + 288) = *(void *)(v11 - 8);
  *(void *)(v8 + 296) = swift_task_alloc();
  *(void *)(v8 + 304) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69D7C54, 0, 0);
}

uint64_t sub_1C69D7C54()
{
  uint64_t v71 = v0;
  if (qword_1EBC08528[0] != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[38];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v5 = sub_1C69E1C68();
  v0[39] = __swift_project_value_buffer(v5, (uint64_t)qword_1EBC085A8);
  uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v68(v2, v1, v3);
  uint64_t v6 = sub_1C69E1C48();
  os_log_type_t v7 = sub_1C69E1ED8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    v70[0] = OUTLINED_FUNCTION_25_1();
    *uint64_t v8 = 136315138;
    sub_1C69D9B1C(&qword_1EA4434A0, MEMORY[0x1E4F27990]);
    uint64_t v9 = sub_1C69E2178();
    v0[18] = sub_1C69A8148(v9, v10, v70);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v11 = OUTLINED_FUNCTION_51_2();
    v12(v11);
    OUTLINED_FUNCTION_24_2(&dword_1C698D000, v6, v7, "Received log XPC call for: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v13 = OUTLINED_FUNCTION_51_2();
    v14(v13);
  }

  sub_1C69E0528();
  OUTLINED_FUNCTION_35();
  v0[40] = sub_1C69E0518();
  sub_1C69D9B1C(&qword_1EBC07C50, MEMORY[0x1E4FA49D8]);
  sub_1C69E0508();
  uint64_t v15 = v0[34];
  uint64_t v17 = v0[31];
  uint64_t v16 = v0[32];
  sub_1C69E1838();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v19(v15, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443490);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v21 = sub_1C69E1C48();
    os_log_type_t v22 = sub_1C69E1EE8();
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)OUTLINED_FUNCTION_23_1() = 0;
      OUTLINED_FUNCTION_71_1(&dword_1C698D000, v23, v24, "unknown type of suggestions");
      OUTLINED_FUNCTION_17();
    }
    unint64_t v25 = (void (*)(void))v0[22];

    sub_1C69D8FC4();
    uint64_t v26 = (void *)swift_allocError();
    *uint64_t v27 = 0xD00000000000001CLL;
    v27[1] = 0x80000001C69E5AD0;
LABEL_11:
    v25();

    swift_release();
    OUTLINED_FUNCTION_30_3();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_4_1();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v20 = v0[14];
  v0[41] = v20;
  sub_1C69E0508();
  uint64_t v67 = v20;
  uint64_t v30 = v0[33];
  uint64_t v31 = v0[31];
  sub_1C69E1838();
  v19(v30, v31);
  char v32 = swift_dynamicCast();
  if ((v32 & 1) == 0)
  {
    uint64_t v53 = v0[27];
    OUTLINED_FUNCTION_72(v53, v33, v34, v0[28]);
    swift_bridgeObjectRelease();
    sub_1C69D9CD8(v53, &qword_1EA443488);
    uint64_t v54 = sub_1C69E1C48();
    os_log_type_t v55 = sub_1C69E1EE8();
    if (os_log_type_enabled(v54, v55))
    {
      *(_WORD *)OUTLINED_FUNCTION_23_1() = 0;
      OUTLINED_FUNCTION_71_1(&dword_1C698D000, v56, v57, "unknown type of deliveryVehicle");
      OUTLINED_FUNCTION_17();
    }
    unint64_t v25 = (void (*)(void))v0[22];

    sub_1C69D8FC4();
    uint64_t v26 = (void *)swift_allocError();
    *uint64_t v58 = xmmword_1C69E4170;
    goto LABEL_11;
  }
  uint64_t v35 = v0[37];
  uint64_t v36 = v0[35];
  uint64_t v38 = v0[29];
  uint64_t v37 = v0[30];
  uint64_t v40 = v0[27];
  uint64_t v39 = v0[28];
  uint64_t v41 = v0[19];
  __swift_storeEnumTagSinglePayload(v40, 0, 1, v39);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v37, v40, v39);
  v68(v35, v41, v36);
  swift_bridgeObjectRetain_n();
  unint64_t v42 = sub_1C69E1C48();
  os_log_type_t v43 = sub_1C69E1ED8();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = OUTLINED_FUNCTION_65_2();
    v70[0] = OUTLINED_FUNCTION_64_1();
    *(_DWORD *)uint64_t v44 = 136315394;
    os_log_type_t type = v43;
    sub_1C69D9B1C(&qword_1EA4434A0, MEMORY[0x1E4F27990]);
    uint64_t v45 = sub_1C69E2178();
    v0[16] = sub_1C69A8148(v45, v46, v70);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v47 = OUTLINED_FUNCTION_40_2();
    v48(v47);
    *(_WORD *)(v44 + 12) = 2080;
    uint64_t v49 = sub_1C69E1458();
    swift_bridgeObjectRetain();
    uint64_t v50 = MEMORY[0x1C87A7030](v67, v49);
    unint64_t v52 = v51;
    swift_bridgeObjectRelease();
    v0[17] = sub_1C69A8148(v50, v52, v70);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C698D000, v42, type, "executing SiriSuggestionsXPCService log on generationId: %s with suggestions: %s)", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v59 = OUTLINED_FUNCTION_40_2();
    v60(v59);
    swift_bridgeObjectRelease_n();
  }

  uint64_t v61 = (void *)swift_task_alloc();
  v0[42] = v61;
  *uint64_t v61 = v0;
  v61[1] = sub_1C69D855C;
  OUTLINED_FUNCTION_4_1();
  return StatefulSuggestionsClient.logShown(for:deliveryVehicle:generationId:)(v62, v63, v64);
}

uint64_t sub_1C69D855C()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 344) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1C69D8684()
{
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = OUTLINED_FUNCTION_41_2();
  v5(v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_30_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v6();
}

uint64_t sub_1C69D874C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_19_4();
  swift_release();
  uint64_t v13 = OUTLINED_FUNCTION_21_4();
  v14(v13);
  uint64_t v15 = (void *)v12[43];
  id v16 = v15;
  id v17 = v15;
  uint64_t v18 = sub_1C69E1C48();
  os_log_type_t v19 = sub_1C69E1EE8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (_DWORD *)OUTLINED_FUNCTION_13_1();
    uint64_t v21 = (void *)OUTLINED_FUNCTION_48_1();
    *uint64_t v20 = 138412290;
    id v22 = v15;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    v12[15] = v23;
    sub_1C69E1F28();
    *uint64_t v21 = v23;

    OUTLINED_FUNCTION_35_2(&dword_1C698D000, v18, v24, "Error when submitting to state store: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442D08);
    OUTLINED_FUNCTION_62_1();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
  }
  unint64_t v25 = (void (*)(uint64_t))v12[22];

  id v26 = v15;
  uint64_t v27 = OUTLINED_FUNCTION_68_1();
  v25(v27);

  OUTLINED_FUNCTION_30_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_55();
  return v29(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12);
}

uint64_t sub_1C69D8ABC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1C69D8AF4()
{
  sub_1C69D8ABC();
  uint64_t v0 = OUTLINED_FUNCTION_58_2();
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for SiriSuggestionsXPCService()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for XPCErrors(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCErrors()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for XPCErrors(void *a1, void *a2)
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

void *assignWithTake for XPCErrors(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCErrors(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for XPCErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_1C69D8CA4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C69D8CBC(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCErrors()
{
  return &type metadata for XPCErrors;
}

uint64_t sub_1C69D8CEC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C69D8D24(uint64_t a1)
{
  sub_1C69D4F10(a1, *(void *)(v1 + 16));
}

uint64_t sub_1C69D8D40()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = sub_1C69E0678();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (*(void *)(v5 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);
  sub_1C69A36B4(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8));
  swift_release();
  sub_1C69A36B4(*(void *)(v0 + ((((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_release();
  OUTLINED_FUNCTION_7_3();
  return MEMORY[0x1F4186498](v7, v8, v9);
}

uint64_t sub_1C69D8E34()
{
  OUTLINED_FUNCTION_19_4();
  sub_1C69E0678();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_55();
  return sub_1C69D7A70(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1C69D8F94@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_1C69D8FC4()
{
  unint64_t result = qword_1EA443498;
  if (!qword_1EA443498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA443498);
  }
  return result;
}

uint64_t sub_1C69D9010()
{
  swift_unknownObjectRelease();
  sub_1C69A36B4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 104, 7);
}

#error "1C69D90F0: call analysis failed (funcsize=43)"

uint64_t sub_1C69D9124()
{
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_25_4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_32_1();
  return sub_1C69D6634(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C69D91CC(uint64_t a1)
{
  uint64_t v36 = sub_1C69E1848();
  uint64_t v2 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v34 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D80);
  uint64_t result = sub_1C69E20B8();
  uint64_t v5 = (void *)result;
  int64_t v6 = 0;
  uint64_t v38 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  uint64_t v29 = v8;
  int64_t v30 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v35 = v2;
  uint64_t v32 = v2 + 8;
  uint64_t v33 = v2 + 16;
  uint64_t v31 = result + 64;
  uint64_t v13 = v2;
  long long v14 = v34;
  uint64_t v15 = v36;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v16 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v6 << 6))
  {
    uint64_t v21 = (uint64_t *)(*(void *)(v38 + 48) + 16 * i);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v14, *(void *)(v38 + 56) + *(void *)(v13 + 72) * i, v15);
    swift_bridgeObjectRetain();
    sub_1C69E1838();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v15);
    *(void *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v24 = (void *)(v5[6] + 16 * i);
    *uint64_t v24 = v22;
    v24[1] = v23;
    uint64_t result = (uint64_t)sub_1C69A4B74(v37, (_OWORD *)(v5[7] + 48 * i));
    uint64_t v25 = v5[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    void v5[2] = v27;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v18 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_24;
    }
    if (v18 >= v30) {
      return (uint64_t)v5;
    }
    unint64_t v19 = *(void *)(v29 + 8 * v18);
    ++v6;
    if (!v19)
    {
      int64_t v6 = v18 + 1;
      if (v18 + 1 >= v30) {
        return (uint64_t)v5;
      }
      unint64_t v19 = *(void *)(v29 + 8 * v6);
      if (!v19)
      {
        int64_t v6 = v18 + 2;
        if (v18 + 2 >= v30) {
          return (uint64_t)v5;
        }
        unint64_t v19 = *(void *)(v29 + 8 * v6);
        if (!v19) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v12 = (v19 - 1) & v19;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v30) {
    return (uint64_t)v5;
  }
  unint64_t v19 = *(void *)(v29 + 8 * v20);
  if (v19)
  {
    int64_t v6 = v20;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v6 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v6 >= v30) {
      return (uint64_t)v5;
    }
    unint64_t v19 = *(void *)(v29 + 8 * v6);
    ++v20;
    if (v19) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C69D94AC(uint64_t a1)
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
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1C69D952C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69D9594()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C69D95D4()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1C69959BC;
  return sub_1C69D59B4(v3, v4, v5, v6);
}

unint64_t sub_1C69D9680()
{
  unint64_t result = qword_1EBC07D10;
  if (!qword_1EBC07D10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBC07D08);
    sub_1C69D9B1C(&qword_1EBC07C50, MEMORY[0x1E4FA49D8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC07D10);
  }
  return result;
}

uint64_t sub_1C69D972C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C69D9774(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_28(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_1C6995B5C;
  return sub_1C69D559C(a1, v3, v4, v5, v6, v7);
}

uint64_t sub_1C69D9834()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_58_2();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C69D9884()
{
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_31_3();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_3_8();
  return sub_1C69D506C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C69D9940()
{
  swift_unknownObjectRelease();
  sub_1C69A36B4(v0[4], v0[5]);
  unint64_t v1 = v0[7];
  if (v1 >> 60 != 15) {
    sub_1C69A36B4(v0[6], v1);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 152, 7);
}

uint64_t sub_1C69D99B8()
{
  uint64_t v19 = v0[3];
  uint64_t v20 = v0[2];
  uint64_t v4 = v0[5];
  uint64_t v18 = v0[4];
  OUTLINED_FUNCTION_63_2();
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_28(v5);
  void *v6 = v7;
  v6[1] = sub_1C6991498;
  uint64_t v15 = OUTLINED_FUNCTION_72_2((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14, v17);
  return sub_1C69D2F7C(v15, v20, v19, v18, v4, v1, v2, v3);
}

uint64_t sub_1C69D9AAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C69B8C70(a1, a2);
  }
  return a1;
}

uint64_t sub_1C69D9AC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_33_1();
  v4();
  return a2;
}

uint64_t sub_1C69D9B1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C69D9B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69D9BCC()
{
  swift_unknownObjectRelease();
  sub_1C69A36B4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_58_2();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C69D9C1C()
{
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_31_3();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6991498;
  OUTLINED_FUNCTION_3_8();
  return sub_1C69D2290(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C69D9CD8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_9_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_1C69D9D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C69D1F94(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C69A36B4(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1C69D9D94()
{
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_25_4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_32_1();
  return sub_1C69D0DCC(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return *(void *)(v0 + 488);
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_1C69E1F28();
}

void OUTLINED_FUNCTION_24_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

__n128 OUTLINED_FUNCTION_25_4()
{
  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return sub_1C69A36B4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return sub_1C69E1B28();
}

void OUTLINED_FUNCTION_35_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return sub_1C69E1B28();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return *(void *)(v0 + 312);
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return sub_1C69E1E58();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_51_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  return sub_1C69A8148(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return v0;
}

void OUTLINED_FUNCTION_59_1(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return swift_arrayDestroy();
}

__n128 OUTLINED_FUNCTION_63_2()
{
  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_64_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_65_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  return v0;
}

void OUTLINED_FUNCTION_71_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_72_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(_OWORD *)(v10 + 16) = a9;
  return v9;
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_76_2()
{
  return sub_1C69E1D08();
}

uint64_t OUTLINED_FUNCTION_77_2()
{
  return v0;
}

unint64_t StatefulSuggestionsClient.DefaultKeys.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x7974697669746361;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x45746E65696C6173;
      break;
    case 6:
      unint64_t result = 0x7453656369766564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C69DA3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C69E1E58();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C69B74DC(a1, &qword_1EBC07D20);
  }
  else
  {
    sub_1C69E1E48();
    OUTLINED_FUNCTION_37_0();
    v7();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C69E1E18();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C69DA538(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0xD000000000000013;
  unint64_t v3 = (unint64_t)"uggestions";
  unint64_t v4 = 0x80000001C69E4550;
  uint64_t v5 = a1;
  uint64_t v6 = "preComputedSuggestions";
  uint64_t v7 = 0xD000000000000013;
  switch(v5)
  {
    case 1:
      break;
    case 2:
      uint64_t v7 = 0xD000000000000016;
      unint64_t v4 = 0x80000001C69E4570;
      break;
    case 3:
      OUTLINED_FUNCTION_47_3();
      uint64_t v8 = 0x61636F766E69;
      goto LABEL_7;
    case 4:
      OUTLINED_FUNCTION_46_2();
      uint64_t v7 = 0x6F43676F6C616964;
      break;
    case 5:
      unint64_t v4 = 0xEA00000000006E6FLL;
      uint64_t v8 = 0x736567677573;
LABEL_7:
      uint64_t v7 = v8 & 0xFFFFFFFFFFFFLL | 0x6974000000000000;
      break;
    default:
      unint64_t v4 = 0xE600000000000000;
      uint64_t v7 = 0x6E6F69746361;
      break;
  }
  unint64_t v9 = v3 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      v2 += 3;
      unint64_t v9 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 3:
      unint64_t v9 = 0xEE00657079546E6FLL;
      uint64_t v10 = 0x61636F766E69;
      goto LABEL_14;
    case 4:
      unint64_t v9 = 0xEF6449747865746ELL;
      uint64_t v2 = 0x6F43676F6C616964;
      break;
    case 5:
      unint64_t v9 = 0xEA00000000006E6FLL;
      uint64_t v10 = 0x736567677573;
LABEL_14:
      uint64_t v2 = v10 & 0xFFFFFFFFFFFFLL | 0x6974000000000000;
      break;
    default:
      unint64_t v9 = 0xE600000000000000;
      uint64_t v2 = 0x6E6F69746361;
      break;
  }
  if (v7 == v2 && v4 == v9) {
    char v12 = 1;
  }
  else {
    char v12 = sub_1C69E2188();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_1C69DA724(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x80000001C69E44E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x69726953776F6873;
      unint64_t v3 = 0xEC000000706C6548;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000013;
      uint64_t v6 = "executeSuggestion";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "showMoreSuggestions";
LABEL_5:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001C69E44E0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x69726953776F6873;
      unint64_t v7 = 0xEC000000706C6548;
      break;
    case 2:
      unint64_t v2 = 0xD000000000000013;
      uint64_t v8 = "executeSuggestion";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD00000000000001ALL;
      uint64_t v8 = "showMoreSuggestions";
LABEL_10:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1C69E2188();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1C69DA894(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x80000001C69E45C0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v6 = "intentProperties";
      goto LABEL_6;
    case 2:
      uint64_t v6 = "flowIntentProperties";
      goto LABEL_6;
    case 3:
      unint64_t v3 = 0xEC00000065707954;
      unint64_t v5 = 0x7974697669746361;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000013;
      uint64_t v6 = "dialogIdentifier";
LABEL_6:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v3 = 0xEF7365697469746ELL;
      unint64_t v5 = 0x45746E65696C6173;
      break;
    case 6:
      unint64_t v3 = 0xEB00000000657461;
      unint64_t v5 = 0x7453656369766564;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001C69E45C0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000014;
      uint64_t v8 = "intentProperties";
      goto LABEL_14;
    case 2:
      uint64_t v8 = "flowIntentProperties";
      goto LABEL_14;
    case 3:
      unint64_t v7 = 0xEC00000065707954;
      unint64_t v2 = 0x7974697669746361;
      break;
    case 4:
      unint64_t v2 = 0xD000000000000013;
      uint64_t v8 = "dialogIdentifier";
LABEL_14:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v7 = 0xEF7365697469746ELL;
      unint64_t v2 = 0x45746E65696C6173;
      break;
    case 6:
      unint64_t v7 = 0xEB00000000657461;
      unint64_t v2 = 0x7453656369766564;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1C69E2188();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1C69DAAB8(uint64_t a1)
{
  return sub_1C69DAAE8(a1, (void (*)(unsigned char *, uint64_t))sub_1C69DAB38);
}

uint64_t sub_1C69DAAD0(uint64_t a1)
{
  return sub_1C69DAAE8(a1, (void (*)(unsigned char *, uint64_t))sub_1C69DAC38);
}

uint64_t sub_1C69DAAE8(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_1C69E2218();
  a2(v5, a1);
  return sub_1C69E2238();
}

uint64_t sub_1C69DAB38(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 3:
      OUTLINED_FUNCTION_47_3();
      break;
    case 4:
      OUTLINED_FUNCTION_46_2();
      break;
    default:
      break;
  }
  sub_1C69E1D48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69DAC38()
{
  sub_1C69E1D48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69DAD04()
{
  sub_1C69E1D48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C69DAE2C(uint64_t a1, uint64_t a2)
{
  return sub_1C69DAE5C(a1, a2, (void (*)(unsigned char *, uint64_t))sub_1C69DAC38);
}

uint64_t sub_1C69DAE44(uint64_t a1, uint64_t a2)
{
  return sub_1C69DAE5C(a1, a2, (void (*)(unsigned char *, uint64_t))sub_1C69DAB38);
}

uint64_t sub_1C69DAE5C(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_1C69E2218();
  a3(v6, a2);
  return sub_1C69E2238();
}

uint64_t StatefulSuggestionsClient.suggestNext(requestId:)()
{
  OUTLINED_FUNCTION_6_0();
  v1[13] = v2;
  v1[14] = v0;
  v1[11] = v3;
  v1[12] = v4;
  uint64_t v5 = sub_1C69E0678();
  OUTLINED_FUNCTION_44(v5);
  v1[15] = OUTLINED_FUNCTION_24();
  uint64_t v6 = sub_1C69E1538();
  v1[16] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[17] = v7;
  v1[18] = OUTLINED_FUNCTION_57();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  uint64_t v8 = sub_1C69E14C8();
  v1[21] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v1[22] = v9;
  v1[23] = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1C69DAFA0()
{
  OUTLINED_FUNCTION_5();
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  v0[24] = __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085E8);
  uint64_t v2 = (void *)sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_19_2(v3))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v4, v5, "Start suggestNext.");
    OUTLINED_FUNCTION_17();
  }
  uint64_t v6 = (void *)v0[14];

  uint64_t v7 = v6 + 4;
  uint64_t v8 = v6[7];
  uint64_t v9 = v6[8];
  OUTLINED_FUNCTION_21_5(v7);
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 8) + **(int **)(v9 + 8));
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[25] = v10;
  *uint64_t v10 = v11;
  v10[1] = sub_1C69DB134;
  uint64_t v12 = v0[23];
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[13];
  return v16(v12, v13, v14, v8, v9);
}

uint64_t sub_1C69DB134()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *os_log_type_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69DB210()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34_3();
  *(void *)(v1 + 72) = v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 216) = v2;
  void *v2 = v1;
  v2[1] = sub_1C69DB2CC;
  uint64_t v3 = OUTLINED_FUNCTION_6_7();
  return MEMORY[0x1F4158DC8](v3, v4, v5);
}

uint64_t sub_1C69DB2CC()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DB394()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  OUTLINED_FUNCTION_21_5(v0 + 2);
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[28] = v3;
  *uint64_t v3 = v4;
  v3[1] = sub_1C69DB444;
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[20];
  return MEMORY[0x1F4158D98](v6, v5, v1, v2);
}

uint64_t sub_1C69DB444()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DB50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_61();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  uint64_t v30 = v26[19];
  uint64_t v29 = v26[20];
  uint64_t v31 = v26[16];
  uint64_t v32 = v26[17];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v26 + 2));
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
  v33(v30, v29, v31);
  uint64_t v34 = sub_1C69E1C48();
  os_log_type_t v35 = sub_1C69E1ED8();
  if (os_log_type_enabled(v34, v35))
  {
    a12 = v26[22];
    a13 = v26[21];
    a14 = v26[23];
    uint64_t v37 = v26[18];
    uint64_t v36 = v26[19];
    uint64_t v38 = v26[16];
    a10 = v26[17];
    uint64_t v39 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    a11 = OUTLINED_FUNCTION_25_1();
    a15 = a11;
    *(_DWORD *)uint64_t v39 = 136315138;
    a9 = v39 + 4;
    v33(v37, v36, v38);
    uint64_t v40 = sub_1C69E1D08();
    v26[10] = sub_1C69A8148(v40, v41, &a15);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_0();
    v42();
    _os_log_impl(&dword_1C698D000, v34, v35, "Determined suggestions: %s", v39, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    OUTLINED_FUNCTION_37_0();
    v43();
  }
  else
  {
    uint64_t v44 = v26[19];
    uint64_t v45 = v26[16];
    uint64_t v46 = v26[17];

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v45);
    uint64_t v47 = OUTLINED_FUNCTION_24_1();
    v48(v47);
  }
  (*(void (**)(void, void, void))(v26[17] + 32))(v26[11], v26[20], v26[16]);
  OUTLINED_FUNCTION_38_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_64();
  return v50(v49, v50, v51, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1C69DB760()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[26];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1C69E1C48();
  os_log_type_t v5 = sub_1C69E1EE8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[26];
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v8 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v7 = 136315138;
    v17[0] = v8;
    v0[7] = v6;
    id v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA442E30);
    uint64_t v10 = sub_1C69E1D08();
    v0[8] = sub_1C69A8148(v10, v11, v17);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C698D000, v4, v5, "Unable to create suggestions: %s", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v12 = (void *)v0[26];
  }
  uint64_t v13 = (void *)v0[26];
  uint64_t v14 = sub_1C69E1B58();
  v17[3] = sub_1C69E1678();
  void v17[4] = sub_1C69DFD4C(&qword_1EA442E70, 255, MEMORY[0x1E4FA4728]);
  v17[0] = v14;
  sub_1C69E0668();
  sub_1C69E14F8();

  OUTLINED_FUNCTION_38_3();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v15();
}

uint64_t StatefulSuggestionsClient.logEngagement(for:intent:)()
{
  OUTLINED_FUNCTION_6_0();
  v1[17] = v2;
  v1[18] = v0;
  v1[15] = v3;
  v1[16] = v4;
  uint64_t v5 = sub_1C69E1758();
  v1[19] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[20] = v6;
  v1[21] = OUTLINED_FUNCTION_24();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C18);
  v1[22] = v7;
  OUTLINED_FUNCTION_44(v7);
  v1[23] = OUTLINED_FUNCTION_57();
  v1[24] = swift_task_alloc();
  uint64_t v8 = sub_1C69E1628();
  v1[25] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v1[26] = v9;
  v1[27] = OUTLINED_FUNCTION_57();
  v1[28] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C00);
  OUTLINED_FUNCTION_44(v10);
  v1[29] = OUTLINED_FUNCTION_24();
  uint64_t v11 = sub_1C69E1128();
  v1[30] = v11;
  OUTLINED_FUNCTION_2_0(v11);
  v1[31] = v12;
  v1[32] = OUTLINED_FUNCTION_57();
  v1[33] = swift_task_alloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v13, v14, v15);
}

uint64_t sub_1C69DBB1C()
{
  uint64_t v39 = v0;
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085E8);
  uint64_t v2 = sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1ED8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C698D000, v2, v3, "Calling SuggestionService to logIntent", v4, 2u);
    OUTLINED_FUNCTION_17();
  }
  uint64_t v5 = v0[17];

  sub_1C69A4C84(v5, (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v15 = v0[29];
    __swift_storeEnumTagSinglePayload(v15, 1, 1, v0[30]);
    uint64_t v13 = &qword_1EBC07C00;
    uint64_t v14 = v15;
LABEL_9:
    sub_1C69B74DC(v14, v13);
    OUTLINED_FUNCTION_27_4();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_23_3();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v6 = v0[33];
  uint64_t v7 = v0[30];
  uint64_t v8 = v0[31];
  uint64_t v9 = v0[29];
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[25];
  __swift_storeEnumTagSinglePayload(v9, 0, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v9, v7);
  sub_1C69E10E8();
  if (__swift_getEnumTagSinglePayload(v11, 1, v10) == 1)
  {
    uint64_t v12 = v0[24];
    (*(void (**)(void, void))(v0[31] + 8))(v0[33], v0[30]);
    uint64_t v13 = &qword_1EBC07C18;
    uint64_t v14 = v12;
    goto LABEL_9;
  }
  (*(void (**)(void, void, void))(v0[26] + 32))(v0[28], v0[24], v0[25]);
  uint64_t v18 = OUTLINED_FUNCTION_40_3();
  v19(v18);
  uint64_t v20 = sub_1C69E1C48();
  os_log_type_t v21 = sub_1C69E1ED8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v24 = v0[31];
  uint64_t v23 = v0[32];
  if (v22)
  {
    uint64_t v37 = v0[30];
    uint64_t v25 = v0[23];
    BOOL v26 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v38 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)BOOL v26 = 136315138;
    sub_1C69E10E8();
    uint64_t v27 = sub_1C69E1F08();
    unint64_t v29 = v28;
    sub_1C69B74DC(v25, &qword_1EBC07C18);
    v0[14] = sub_1C69A8148(v27, v29, &v38);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v37);
    _os_log_impl(&dword_1C698D000, v20, v21, "logIntent for: %s", v26, 0xCu);
    OUTLINED_FUNCTION_36_3();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    (*(void (**)(void, void))(v24 + 8))(v0[32], v0[30]);
  }

  (*(void (**)(void, void, void))(v0[26] + 16))(v0[27], v0[28], v0[25]);
  sub_1C69E1108();
  sub_1C69E10F8();
  sub_1C69E1398();
  swift_allocObject();
  OUTLINED_FUNCTION_24_1();
  v0[34] = sub_1C69E1388();
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  v0[35] = v30;
  *uint64_t v30 = v31;
  v30[1] = sub_1C69DBFA4;
  OUTLINED_FUNCTION_23_3();
  return sub_1C69DD270(v32, v33, v34);
}

uint64_t sub_1C69DBFA4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DC06C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34_3();
  *(void *)(v1 + 104) = v0;
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v1 + 288) = v2;
  void *v2 = v3;
  v2[1] = sub_1C69DC124;
  uint64_t v4 = OUTLINED_FUNCTION_6_7();
  return MEMORY[0x1F4158DC8](v4, v5, v6);
}

uint64_t sub_1C69DC124()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DC1EC()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_21_5(v0 + 8);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[37] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69DC2A4;
  uint64_t v2 = v0[15];
  return MEMORY[0x1F4158DA0](v2);
}

uint64_t sub_1C69DC2A4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 304) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69DC380()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[19];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v7 = OUTLINED_FUNCTION_24_1();
  v8(v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
  OUTLINED_FUNCTION_27_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v9();
}

uint64_t sub_1C69DC4A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_61();
  uint64_t v19 = v18[33];
  uint64_t v20 = v18[31];
  uint64_t v35 = v18[32];
  uint64_t v21 = v18[30];
  uint64_t v22 = v18[28];
  uint64_t v36 = v18[29];
  uint64_t v37 = v18[27];
  uint64_t v24 = v18[25];
  uint64_t v23 = v18[26];
  uint64_t v38 = v18[24];
  uint64_t v39 = v18[23];
  swift_release();
  OUTLINED_FUNCTION_11_6();
  v25();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v18 + 8));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_64();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, v18 + 8, v35, v36, v37, v38, v39, a16, a17, a18);
}

uint64_t StatefulSuggestionsClient.refreshService()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_3((uint64_t)sub_1C69DC5D8);
}

uint64_t sub_1C69DC5D8()
{
  OUTLINED_FUNCTION_20();
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1C69E1C68();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBC085E8);
  uint64_t v2 = (void *)sub_1C69E1C48();
  os_log_type_t v3 = sub_1C69E1EC8();
  if (OUTLINED_FUNCTION_19_2(v3))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_11_2(&dword_1C698D000, v4, v5, "Refreshing services");
    OUTLINED_FUNCTION_17();
  }

  swift_getObjectType();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v6;
  void *v6 = v0;
  v6[1] = sub_1C69DC71C;
  uint64_t v7 = OUTLINED_FUNCTION_24_1();
  return MEMORY[0x1F4159778](v7);
}

uint64_t sub_1C69DC71C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v3();
}

uint64_t StatefulSuggestionsClient.logShown(for:deliveryVehicle:generationId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  return OUTLINED_FUNCTION_2_3((uint64_t)sub_1C69DC7F8);
}

uint64_t sub_1C69DC7F8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34_3();
  OUTLINED_FUNCTION_42_3();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C69DC8A8;
  uint64_t v2 = OUTLINED_FUNCTION_6_7();
  return MEMORY[0x1F4158DC8](v2, v3, v4);
}

uint64_t sub_1C69DC8A8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DC970()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  OUTLINED_FUNCTION_21_5(v0 + 2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[13] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C69DCA24;
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[8];
  return MEMORY[0x1F4158DB0](v6, v4, v5, v1, v2);
}

uint64_t sub_1C69DCA24()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69DCB00()
{
  OUTLINED_FUNCTION_6_0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_7_0();
  return v1();
}

uint64_t sub_1C69DCB58()
{
  OUTLINED_FUNCTION_6_0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_18();
  return v1();
}

SiriSuggestionsSupport::StatefulSuggestionsClient::DefaultKeys_optional __swiftcall StatefulSuggestionsClient.DefaultKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C69E20F8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_1C69DCC10(unsigned __int8 *a1, char *a2)
{
  return sub_1C69DA894(*a1, *a2);
}

uint64_t sub_1C69DCC1C()
{
  return sub_1C69DAAE8(*v0, (void (*)(unsigned char *, uint64_t))sub_1C69DAD04);
}

uint64_t sub_1C69DCC4C()
{
  return sub_1C69DAD04();
}

uint64_t sub_1C69DCC54(uint64_t a1)
{
  return sub_1C69DAE5C(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_1C69DAD04);
}

SiriSuggestionsSupport::StatefulSuggestionsClient::DefaultKeys_optional sub_1C69DCC84(Swift::String *a1)
{
  return StatefulSuggestionsClient.DefaultKeys.init(rawValue:)(*a1);
}

unint64_t sub_1C69DCC90@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = StatefulSuggestionsClient.DefaultKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *StatefulSuggestionsClient.__allocating_init(suggestionService:salientEntityService:runtimeConfigProvider:featureFlagProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for InMemoryHintsStateStore();
  swift_allocObject();
  uint64_t v10 = sub_1C69A45B8();
  type metadata accessor for TurnProtectedHintsStateStore();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = sub_1C69DFD4C(&qword_1EBC08148, 255, (void (*)(uint64_t))type metadata accessor for InMemoryHintsStateStore);
  uint64_t v13 = sub_1C69DFD4C(&qword_1EBC08150, 255, (void (*)(uint64_t))type metadata accessor for InMemoryHintsStateStore);
  swift_defaultActor_initialize();
  v11[17] = 0;
  v11[18] = 0;
  v11[14] = v10;
  v11[15] = v12;
  v11[16] = v13;
  sub_1C6995840(a3, (uint64_t)v18);
  sub_1C6995840(a4, (uint64_t)v17);
  sub_1C6995840(a5, (uint64_t)v16);
  uint64_t v14 = sub_1C69DF7B0(a1, a2, (uint64_t)v11, (uint64_t)v18, (uint64_t)v17, (uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v14;
}

uint64_t StatefulSuggestionsClient.submit(for:propertyKey:propertyValue:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07D20);
  uint64_t v17 = OUTLINED_FUNCTION_44(v16);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C69E1E58();
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v20);
  sub_1C69A4C84(a5, (uint64_t)v23);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  *(void *)(v21 + 32) = v8;
  *(void *)(v21 + 40) = a1;
  *(void *)(v21 + 48) = a2;
  *(void *)(v21 + 56) = a3;
  *(void *)(v21 + 64) = a4;
  sub_1C69A4B74(v23, (_OWORD *)(v21 + 72));
  *(void *)(v21 + 120) = a6;
  *(void *)(v21 + 128) = a7;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C69DA3CC((uint64_t)v19, (uint64_t)&unk_1EA443578, v21);
  return swift_release();
}

uint64_t sub_1C69DCF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = v20;
  v8[4] = v21;
  v8[2] = a4;
  uint64_t v13 = (void *)swift_task_alloc();
  v8[5] = v13;
  uint64_t v14 = type metadata accessor for StatefulSuggestionsClient();
  uint64_t v16 = sub_1C69DFD4C(&qword_1EA4434B8, v15, (void (*)(uint64_t))type metadata accessor for StatefulSuggestionsClient);
  *uint64_t v13 = v8;
  v13[1] = sub_1C69DD0A8;
  return MEMORY[0x1F4159030](a5, a6, a7, a8, v19, v14, v16);
}

uint64_t sub_1C69DD0A8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  *unint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *char v5 = v4;
  *(void *)(v6 + 48) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C69DD184()
{
  OUTLINED_FUNCTION_6_0();
  (*(void (**)(void, void))(v0 + 24))(0, 0);
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_1C69DD1E8()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void (**)(void *, uint64_t))(v0 + 24);
  id v3 = v1;
  v2(v1, 1);

  OUTLINED_FUNCTION_18();
  return v4();
}

uint64_t sub_1C69DD270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[17] = a1;
  uint64_t v6 = sub_1C69E18B8();
  v3[18] = v6;
  v3[19] = *(void *)(v6 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v7 = sub_1C69E18C8();
  v3[21] = v7;
  v3[22] = *(void *)(v7 - 8);
  v3[23] = swift_task_alloc();
  uint64_t v8 = sub_1C69E0A78();
  v3[24] = v8;
  v3[25] = *(void *)(v8 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC077D8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  uint64_t v9 = sub_1C69E18D8();
  v3[30] = v9;
  v3[31] = *(void *)(v9 - 8);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07C60);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v3[43] = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_1C69DD5B0;
  return sub_1C69DDE54((uint64_t)(v3 + 7), a2, a3);
}

uint64_t sub_1C69DD5B0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

#error "1C69DD814: call analysis failed (funcsize=486)"

uint64_t sub_1C69DDE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[21] = *v3;
  uint64_t v5 = sub_1C69E10D8();
  v4[22] = v5;
  v4[23] = *(void *)(v5 - 8);
  v4[24] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C69DDF40, 0, 0);
}

void sub_1C69DDF40()
{
  uint64_t v1 = *(void *)(v0[20] + 72);
  v0[25] = v1;
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(v1))
  {
    uint64_t v3 = v0[23];
    uint64_t v2 = v0[24];
    uint64_t v4 = v0[22];
    swift_getObjectType();
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x1E4FA4318], v4);
    swift_unknownObjectRetain();
    sub_1C69E10C8();
    v0[26] = v5;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[27] = v6;
    void *v6 = v0;
    v6[1] = sub_1C69DE28C;
    OUTLINED_FUNCTION_30();
    __asm { BRAA            X8, X16 }
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C69E1C68();
  os_log_type_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EBC085E8);
  swift_retain_n();
  uint64_t v11 = sub_1C69E1C48();
  os_log_type_t v12 = sub_1C69E1ED8();
  if (OUTLINED_FUNCTION_19_2(v12))
  {
    uint64_t v13 = v0[20];
    uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v19 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v14 = 136315138;
    v0[13] = v13;
    swift_retain();
    uint64_t v15 = sub_1C69E1D08();
    v0[14] = sub_1C69A8148(v15, v16, &v19);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1C698D000, v11, v10, "%s: Statestore is not of type HintsStateStoreConsumer", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_release_n();
  }

  OUTLINED_FUNCTION_35_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1C69DE28C()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

void sub_1C69DE370()
{
  uint64_t v1 = (_OWORD *)(v0 + 64);
  if (*(void *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC079A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA443100);
    if (swift_dynamicCast())
    {
      if (*(void *)(v0 + 88))
      {
        uint64_t v2 = *(void *)(v0 + 136);
        swift_unknownObjectRelease();
        sub_1C69958A4((long long *)(v0 + 64), v2);
        goto LABEL_13;
      }
    }
    else
    {
      *(void *)(v0 + 96) = 0;
      *uint64_t v1 = 0u;
      *(_OWORD *)(v0 + 80) = 0u;
    }
  }
  else
  {
    sub_1C69B74DC(v0 + 16, &qword_1EBC07D60);
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 80) = 0u;
    *(void *)(v0 + 96) = 0;
  }
  sub_1C69B74DC(v0 + 64, &qword_1EBC07C08);
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C69E1C68();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC085E8);
  swift_retain_n();
  uint64_t v4 = sub_1C69E1C48();
  os_log_type_t v5 = sub_1C69E1ED8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 160);
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v12 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v0 + 120) = v6;
    swift_retain();
    uint64_t v8 = sub_1C69E1D08();
    *(void *)(v0 + 128) = sub_1C69A8148(v8, v9, &v12);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1C698D000, v4, v5, "%s: No SiriRequestState in the stateStore", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release_n();
  }
  OUTLINED_FUNCTION_35_3();
LABEL_13:
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_30();
  __asm { BRAA            X1, X16 }
}

uint64_t StatefulSuggestionsClient.suggestNext(interaction:)(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return OUTLINED_FUNCTION_2_3((uint64_t)sub_1C69DE62C);
}

uint64_t sub_1C69DE62C()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_34_3();
  OUTLINED_FUNCTION_42_3();
  swift_task_alloc();
  OUTLINED_FUNCTION_29_1();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_1C69DE6D8;
  uint64_t v3 = OUTLINED_FUNCTION_6_7();
  return MEMORY[0x1F4158DC8](v3, v4, v5);
}

uint64_t sub_1C69DE6D8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DE7A0()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  OUTLINED_FUNCTION_21_5(v0 + 2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C69DE850;
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  return MEMORY[0x1F4158D98](v4, v5, v1, v2);
}

uint64_t sub_1C69DE850()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DE918()
{
  OUTLINED_FUNCTION_6_0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t StatefulSuggestionsClient.getNextSuggestions(requestId:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6995B5C;
  OUTLINED_FUNCTION_6_7();
  return StatefulSuggestionsClient.suggestNext(requestId:)();
}

uint64_t StatefulSuggestionsClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_1C6991498;
  OUTLINED_FUNCTION_6_7();
  return StatefulSuggestionsClient.suggestNext(requestId:)();
}

uint64_t StatefulSuggestionsClient.warmup()()
{
  return sub_1C69DFA88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t StatefulSuggestionsClient.submitAsync(for:propertyKey:propertyValue:)()
{
  OUTLINED_FUNCTION_6_0();
  v1[6] = v2;
  v1[7] = v0;
  void v1[4] = v3;
  v1[5] = v4;
  v1[3] = v5;
  uint64_t v6 = sub_1C69E1308();
  v1[8] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[9] = v7;
  v1[10] = OUTLINED_FUNCTION_57();
  v1[11] = swift_task_alloc();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

void sub_1C69DEB78()
{
  uint64_t v1 = (void (*)(uint64_t))(v0 + 3);
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v2, v0[3], v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v2, v3) == *MEMORY[0x1E4FA4430])
  {
    uint64_t v6 = v0[11];
    (*(void (**)(uint64_t, void))(v0[9] + 96))(v6, v0[8]);
    v0[12] = *(void *)(v6 + 8);
    swift_getObjectType();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[13] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1C69DEEFC;
    OUTLINED_FUNCTION_23_3();
    __asm { BRAA            X8, X16 }
  }
  if (qword_1EBC085E0 != -1) {
    swift_once();
  }
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[8];
  uint64_t v12 = v0[3];
  uint64_t v13 = sub_1C69E1C68();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBC085E8);
  v5(v10, v12, v11);
  uint64_t v14 = sub_1C69E1C48();
  os_log_type_t v15 = sub_1C69E1EE8();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_13_1();
    uint64_t v23 = OUTLINED_FUNCTION_25_1();
    *(_DWORD *)unint64_t v16 = 136315138;
    sub_1C69DFD4C(&qword_1EA4435A8, 255, MEMORY[0x1E4FA4438]);
    uint64_t v17 = sub_1C69E2178();
    v0[2] = sub_1C69A8148(v17, v18, &v23);
    sub_1C69E1F28();
    swift_bridgeObjectRelease();
    uint64_t v19 = OUTLINED_FUNCTION_20_4();
    v1(v19);
    _os_log_impl(&dword_1C698D000, v14, v15, "Unsupported interationId type of %s", v16, 0xCu);
    OUTLINED_FUNCTION_36_3();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v20 = OUTLINED_FUNCTION_20_4();
    v1(v20);
  }

  ((void (*)(void, void))v1)(v0[11], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23_3();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1C69DEEFC()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1C69DEFE0()
{
  OUTLINED_FUNCTION_6_0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v0();
}

uint64_t StatefulSuggestionsClient.deinit()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_unknownObjectRelease();
  return v0;
}

uint64_t StatefulSuggestionsClient.__deallocating_deinit()
{
  StatefulSuggestionsClient.deinit();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t sub_1C69DF0A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  os_log_type_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *os_log_type_t v15 = v7;
  v15[1] = sub_1C6995B5C;
  return MEMORY[0x1F4159030](a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C69DF184()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.submitAsync(for:propertyKey:propertyValue:)();
}

uint64_t sub_1C69DF244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_1C6995B5C;
  return MEMORY[0x1F4159028](a1, a2, a3, a4, a5);
}

uint64_t sub_1C69DF30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1C6995B5C;
  return MEMORY[0x1F4159040](a1, a2, a3, a4);
}

uint64_t sub_1C69DF3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.logShown(for:deliveryVehicle:generationId:)(a1, a2, a3);
}

uint64_t sub_1C69DF47C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.logEngagement(for:intent:)();
}

uint64_t sub_1C69DF52C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.warmup()();
}

uint64_t sub_1C69DF5B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.getNextSuggestions(requestId:)();
}

uint64_t sub_1C69DF66C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6995B5C;
  return StatefulSuggestionsClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)();
}

uint64_t sub_1C69DF720()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C6991498;
  return StatefulSuggestionsClient.refreshService()();
}

void *sub_1C69DF7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_1C69DFD4C(&qword_1EBC08410, 255, (void (*)(uint64_t))type metadata accessor for TurnProtectedHintsStateStore);
  uint64_t v12 = sub_1C69DFD4C(&qword_1EBC08418, 255, (void (*)(uint64_t))type metadata accessor for TurnProtectedHintsStateStore);
  sub_1C6995840(a4, (uint64_t)v19);
  sub_1C6995840(a5, (uint64_t)v18);
  sub_1C6995840(a6, (uint64_t)v17);
  uint64_t v13 = type metadata accessor for StateStoreInteractionBuilder();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v12;
  sub_1C69958A4(v19, v14 + 32);
  sub_1C69958A4(v18, v14 + 72);
  sub_1C69958A4(v17, v14 + 112);
  swift_unknownObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(a6);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  unint64_t result = (void *)swift_allocObject();
  result[7] = v13;
  result[8] = &off_1F218FFD0;
  result[2] = a1;
  result[3] = a2;
  result[4] = v14;
  result[9] = a3;
  result[10] = v11;
  return result;
}

uint64_t sub_1C69DF930()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  swift_release();
  return MEMORY[0x1F4186498](v0, 136, 7);
}

uint64_t sub_1C69DF990(uint64_t a1)
{
  uint64_t v14 = v1[2];
  uint64_t v3 = v1[4];
  uint64_t v12 = v1[3];
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[8];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_28(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_1C6995B5C;
  return sub_1C69DCF7C(a1, v14, v12, v3, v4, v5, v6, v7);
}

uint64_t sub_1C69DFA88(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_1C69DFA98()
{
  unint64_t result = qword_1EA4435B0[0];
  if (!qword_1EA4435B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA4435B0);
  }
  return result;
}

uint64_t type metadata accessor for StatefulSuggestionsClient()
{
  return self;
}

uint64_t method lookup function for StatefulSuggestionsClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StatefulSuggestionsClient);
}

uint64_t getEnumTagSinglePayload for StatefulSuggestionsClient.DefaultKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for StatefulSuggestionsClient.DefaultKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C69DFC74);
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

ValueMetadata *type metadata accessor for StatefulSuggestionsClient.DefaultKeys()
{
  return &type metadata for StatefulSuggestionsClient.DefaultKeys;
}

uint64_t sub_1C69DFCAC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C69DFCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC07BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C69DFD4C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return *(void *)(v0 + 208);
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
  return sub_1C69DFCE4(v0, v2);
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  __swift_project_boxed_opaque_existential_1(a15, *(void *)(v15 + 40));
  return sub_1C69E13B8();
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return v0;
}

void *OUTLINED_FUNCTION_21_5(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return sub_1C69E1CD8();
}

uint64_t OUTLINED_FUNCTION_34_3()
{
  return swift_getObjectType();
}

double OUTLINED_FUNCTION_35_3()
{
  uint64_t v1 = *(void *)(v0 + 136);
  *(void *)(v1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return v0;
}

void OUTLINED_FUNCTION_42_3()
{
  *(void *)(v1 + 56) = v0;
}

uint64_t NewUUIDRequestIdProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_1C69E0030()
{
  uint64_t v0 = sub_1C69E0678();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C69E0668();
  uint64_t v4 = sub_1C69E0648();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t NewUUIDRequestIdProvider.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1C69E0124()
{
  return sub_1C69E0030();
}

uint64_t StaticRequestIdProvider.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StaticRequestIdProvider.__allocating_init(requestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t StaticRequestIdProvider.init(requestId:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t StaticRequestIdProvider.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StaticRequestIdProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1C69E020C()
{
  return StaticRequestIdProvider.requestId.getter();
}

uint64_t dispatch thunk of RequestIdProvider.requestId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for NewUUIDRequestIdProvider()
{
  return self;
}

uint64_t method lookup function for NewUUIDRequestIdProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NewUUIDRequestIdProvider);
}

uint64_t dispatch thunk of NewUUIDRequestIdProvider.requestId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80))();
}

uint64_t dispatch thunk of NewUUIDRequestIdProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for StaticRequestIdProvider()
{
  return self;
}

uint64_t method lookup function for StaticRequestIdProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StaticRequestIdProvider);
}

uint64_t dispatch thunk of StaticRequestIdProvider.__allocating_init(requestId:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return v0;
}

uint64_t String.fromBase64String<A>()@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1C69E05F8();
  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = v4;
    unint64_t v8 = v5;
    sub_1C69E0528();
    swift_allocObject();
    sub_1C69E0518();
    uint64_t v6 = 0;
    sub_1C69E0508();
    swift_release();
    sub_1C69A36A0(v7, v8);
  }
  return __swift_storeEnumTagSinglePayload(a2, v6, 1, a1);
}

Swift::String_optional __swiftcall Encodable.toBase64String()()
{
  sub_1C69E0568();
  swift_allocObject();
  sub_1C69E0558();
  uint64_t v0 = sub_1C69E0548();
  unint64_t v2 = v1;
  sub_1C69B8C70(v0, v1);
  uint64_t v3 = sub_1C69E0618();
  unint64_t v5 = v4;
  sub_1C69A36B4(v0, v2);
  swift_release();
  sub_1C69A36B4(v0, v2);
  uint64_t v6 = v3;
  uint64_t v7 = v5;
  result.value._object = v7;
  result.value._uint64_t countAndFlagsBits = v6;
  return result;
}

uint64_t sub_1C69E04D8()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1C69E04E8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1C69E04F8()
{
  return MEMORY[0x1F40E41D0]();
}

uint64_t sub_1C69E0508()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C69E0518()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C69E0528()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C69E0538()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1C69E0548()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1C69E0558()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1C69E0568()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1C69E0578()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C69E0588()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1C69E0598()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1C69E05A8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C69E05B8()
{
  return MEMORY[0x1F40E4A08]();
}

uint64_t sub_1C69E05C8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C69E05D8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C69E05E8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C69E05F8()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1C69E0608()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C69E0618()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1C69E0628()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C69E0638()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C69E0648()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C69E0658()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C69E0668()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C69E0678()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C69E0688()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1C69E0698()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C69E06A8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C69E06B8()
{
  return MEMORY[0x1F41517A8]();
}

uint64_t sub_1C69E06C8()
{
  return MEMORY[0x1F41517B0]();
}

uint64_t sub_1C69E06D8()
{
  return MEMORY[0x1F41518F0]();
}

uint64_t sub_1C69E06E8()
{
  return MEMORY[0x1F41519C8]();
}

uint64_t sub_1C69E06F8()
{
  return MEMORY[0x1F4151A78]();
}

uint64_t sub_1C69E0708()
{
  return MEMORY[0x1F4151A98]();
}

uint64_t sub_1C69E0738()
{
  return MEMORY[0x1F4151AB8]();
}

uint64_t sub_1C69E0748()
{
  return MEMORY[0x1F4151DE8]();
}

uint64_t sub_1C69E0758()
{
  return MEMORY[0x1F4151DF8]();
}

uint64_t sub_1C69E0768()
{
  return MEMORY[0x1F4151E28]();
}

uint64_t sub_1C69E0778()
{
  return MEMORY[0x1F4151E40]();
}

uint64_t sub_1C69E0788()
{
  return MEMORY[0x1F4151E48]();
}

uint64_t sub_1C69E0798()
{
  return MEMORY[0x1F4151F48]();
}

uint64_t sub_1C69E07A8()
{
  return MEMORY[0x1F4152108]();
}

uint64_t sub_1C69E07B8()
{
  return MEMORY[0x1F4152110]();
}

uint64_t sub_1C69E07C8()
{
  return MEMORY[0x1F4152190]();
}

uint64_t sub_1C69E07D8()
{
  return MEMORY[0x1F41521A8]();
}

uint64_t sub_1C69E07E8()
{
  return MEMORY[0x1F41522A8]();
}

uint64_t sub_1C69E07F8()
{
  return MEMORY[0x1F41522B0]();
}

uint64_t sub_1C69E0808()
{
  return MEMORY[0x1F4152320]();
}

uint64_t sub_1C69E0818()
{
  return MEMORY[0x1F4152328]();
}

uint64_t sub_1C69E0828()
{
  return MEMORY[0x1F41523A8]();
}

uint64_t sub_1C69E0838()
{
  return MEMORY[0x1F41523B0]();
}

uint64_t sub_1C69E0848()
{
  return MEMORY[0x1F41523B8]();
}

uint64_t sub_1C69E0858()
{
  return MEMORY[0x1F41526E8]();
}

uint64_t sub_1C69E0868()
{
  return MEMORY[0x1F41526F8]();
}

uint64_t sub_1C69E0878()
{
  return MEMORY[0x1F4152700]();
}

uint64_t sub_1C69E0888()
{
  return MEMORY[0x1F4152718]();
}

uint64_t sub_1C69E0898()
{
  return MEMORY[0x1F4152720]();
}

uint64_t sub_1C69E08A8()
{
  return MEMORY[0x1F4152738]();
}

uint64_t sub_1C69E08B8()
{
  return MEMORY[0x1F4152968]();
}

uint64_t sub_1C69E08C8()
{
  return MEMORY[0x1F4152970]();
}

uint64_t sub_1C69E08D8()
{
  return MEMORY[0x1F4152978]();
}

uint64_t sub_1C69E08E8()
{
  return MEMORY[0x1F41529B8]();
}

uint64_t sub_1C69E08F8()
{
  return MEMORY[0x1F41529C0]();
}

uint64_t sub_1C69E0908()
{
  return MEMORY[0x1F41529F0]();
}

uint64_t sub_1C69E0918()
{
  return MEMORY[0x1F4152A08]();
}

uint64_t sub_1C69E0928()
{
  return MEMORY[0x1F4154F20]();
}

uint64_t sub_1C69E0938()
{
  return MEMORY[0x1F4154F60]();
}

uint64_t sub_1C69E0948()
{
  return MEMORY[0x1F4154FA0]();
}

uint64_t sub_1C69E0958()
{
  return MEMORY[0x1F4155020]();
}

uint64_t sub_1C69E0968()
{
  return MEMORY[0x1F41550F8]();
}

uint64_t sub_1C69E0978()
{
  return MEMORY[0x1F4155158]();
}

uint64_t sub_1C69E0988()
{
  return MEMORY[0x1F41551F0]();
}

uint64_t sub_1C69E0998()
{
  return MEMORY[0x1F4155218]();
}

uint64_t sub_1C69E09A8()
{
  return MEMORY[0x1F41553F8]();
}

uint64_t sub_1C69E09B8()
{
  return MEMORY[0x1F4155408]();
}

uint64_t sub_1C69E09C8()
{
  return MEMORY[0x1F4155410]();
}

uint64_t sub_1C69E09D8()
{
  return MEMORY[0x1F4155418]();
}

uint64_t sub_1C69E09E8()
{
  return MEMORY[0x1F41554B8]();
}

uint64_t sub_1C69E09F8()
{
  return MEMORY[0x1F41561F0]();
}

uint64_t sub_1C69E0A08()
{
  return MEMORY[0x1F41565D8]();
}

uint64_t sub_1C69E0A18()
{
  return MEMORY[0x1F41567F8]();
}

uint64_t sub_1C69E0A28()
{
  return MEMORY[0x1F4156860]();
}

uint64_t sub_1C69E0A38()
{
  return MEMORY[0x1F4156868]();
}

uint64_t sub_1C69E0A48()
{
  return MEMORY[0x1F4157298]();
}

uint64_t sub_1C69E0A58()
{
  return MEMORY[0x1F4157550]();
}

uint64_t sub_1C69E0A68()
{
  return MEMORY[0x1F415ABD8]();
}

uint64_t sub_1C69E0A78()
{
  return MEMORY[0x1F415ABE0]();
}

uint64_t sub_1C69E0A88()
{
  return MEMORY[0x1F415ABF0]();
}

uint64_t sub_1C69E0A98()
{
  return MEMORY[0x1F415ABF8]();
}

uint64_t sub_1C69E0AC8()
{
  return MEMORY[0x1F4158D50]();
}

uint64_t sub_1C69E0AD8()
{
  return MEMORY[0x1F4158D58]();
}

uint64_t sub_1C69E0AE8()
{
  return MEMORY[0x1F4158D60]();
}

uint64_t sub_1C69E0AF8()
{
  return MEMORY[0x1F4158D68]();
}

uint64_t sub_1C69E0B08()
{
  return MEMORY[0x1F4158D70]();
}

uint64_t sub_1C69E0B18()
{
  return MEMORY[0x1F4158D78]();
}

uint64_t sub_1C69E0B28()
{
  return MEMORY[0x1F4158D80]();
}

uint64_t sub_1C69E0B38()
{
  return MEMORY[0x1F4158D88]();
}

uint64_t sub_1C69E0BA8()
{
  return MEMORY[0x1F4158DC0]();
}

uint64_t sub_1C69E0BD8()
{
  return MEMORY[0x1F4150780]();
}

uint64_t sub_1C69E0BE8()
{
  return MEMORY[0x1F4150790]();
}

uint64_t sub_1C69E0BF8()
{
  return MEMORY[0x1F4150798]();
}

uint64_t sub_1C69E0C08()
{
  return MEMORY[0x1F41507A0]();
}

uint64_t sub_1C69E0C18()
{
  return MEMORY[0x1F41507A8]();
}

uint64_t sub_1C69E0C28()
{
  return MEMORY[0x1F41507B0]();
}

uint64_t sub_1C69E0C38()
{
  return MEMORY[0x1F41507F8]();
}

uint64_t sub_1C69E0C48()
{
  return MEMORY[0x1F4150800]();
}

uint64_t sub_1C69E0C78()
{
  return MEMORY[0x1F4150818]();
}

uint64_t sub_1C69E0C98()
{
  return MEMORY[0x1F41508A8]();
}

uint64_t sub_1C69E0CA8()
{
  return MEMORY[0x1F41508B0]();
}

uint64_t sub_1C69E0CB8()
{
  return MEMORY[0x1F41508B8]();
}

uint64_t sub_1C69E0D78()
{
  return MEMORY[0x1F4158E58]();
}

uint64_t sub_1C69E0D88()
{
  return MEMORY[0x1F4158E60]();
}

uint64_t sub_1C69E0D98()
{
  return MEMORY[0x1F4158E68]();
}

uint64_t sub_1C69E0DA8()
{
  return MEMORY[0x1F4158E70]();
}

uint64_t sub_1C69E0DB8()
{
  return MEMORY[0x1F4158E78]();
}

uint64_t sub_1C69E0DC8()
{
  return MEMORY[0x1F4158E80]();
}

uint64_t sub_1C69E0DD8()
{
  return MEMORY[0x1F4158E88]();
}

uint64_t sub_1C69E0DE8()
{
  return MEMORY[0x1F4158E90]();
}

uint64_t sub_1C69E0DF8()
{
  return MEMORY[0x1F4158E98]();
}

uint64_t sub_1C69E0E08()
{
  return MEMORY[0x1F4158EA0]();
}

uint64_t sub_1C69E0E18()
{
  return MEMORY[0x1F4158EA8]();
}

uint64_t sub_1C69E0E28()
{
  return MEMORY[0x1F4158EB0]();
}

uint64_t sub_1C69E0E38()
{
  return MEMORY[0x1F4158F00]();
}

uint64_t sub_1C69E0E48()
{
  return MEMORY[0x1F4158F08]();
}

uint64_t sub_1C69E0E58()
{
  return MEMORY[0x1F4158F18]();
}

uint64_t sub_1C69E0E68()
{
  return MEMORY[0x1F4158F20]();
}

uint64_t sub_1C69E0E78()
{
  return MEMORY[0x1F4158F28]();
}

uint64_t sub_1C69E0E88()
{
  return MEMORY[0x1F4158F30]();
}

uint64_t sub_1C69E0E98()
{
  return MEMORY[0x1F4158F38]();
}

uint64_t sub_1C69E0EA8()
{
  return MEMORY[0x1F4158F40]();
}

uint64_t sub_1C69E0EB8()
{
  return MEMORY[0x1F4158F48]();
}

uint64_t sub_1C69E0EC8()
{
  return MEMORY[0x1F4158F50]();
}

uint64_t sub_1C69E0ED8()
{
  return MEMORY[0x1F4158F58]();
}

uint64_t sub_1C69E0EE8()
{
  return MEMORY[0x1F4158F60]();
}

uint64_t sub_1C69E0EF8()
{
  return MEMORY[0x1F4158F68]();
}

uint64_t sub_1C69E0F08()
{
  return MEMORY[0x1F4158F70]();
}

uint64_t sub_1C69E0F18()
{
  return MEMORY[0x1F4158F78]();
}

uint64_t sub_1C69E0F28()
{
  return MEMORY[0x1F4158F80]();
}

uint64_t sub_1C69E0F38()
{
  return MEMORY[0x1F4158F88]();
}

uint64_t sub_1C69E0F48()
{
  return MEMORY[0x1F4158F90]();
}

uint64_t sub_1C69E0F58()
{
  return MEMORY[0x1F4158F98]();
}

uint64_t sub_1C69E0F68()
{
  return MEMORY[0x1F4158FA0]();
}

uint64_t sub_1C69E0F78()
{
  return MEMORY[0x1F4158FA8]();
}

uint64_t sub_1C69E0F88()
{
  return MEMORY[0x1F4158FB0]();
}

uint64_t sub_1C69E0F98()
{
  return MEMORY[0x1F4158FB8]();
}

uint64_t sub_1C69E0FA8()
{
  return MEMORY[0x1F4158FC0]();
}

uint64_t sub_1C69E0FC8()
{
  return MEMORY[0x1F4158FD0]();
}

uint64_t sub_1C69E0FD8()
{
  return MEMORY[0x1F4158FD8]();
}

uint64_t sub_1C69E0FE8()
{
  return MEMORY[0x1F4158FE0]();
}

uint64_t sub_1C69E0FF8()
{
  return MEMORY[0x1F4158FE8]();
}

uint64_t sub_1C69E1018()
{
  return MEMORY[0x1F4159010]();
}

uint64_t sub_1C69E1028()
{
  return MEMORY[0x1F4159018]();
}

uint64_t sub_1C69E1038()
{
  return MEMORY[0x1F4159020]();
}

uint64_t sub_1C69E1078()
{
  return MEMORY[0x1F4159048]();
}

uint64_t sub_1C69E1088()
{
  return MEMORY[0x1F4159050]();
}

uint64_t sub_1C69E1098()
{
  return MEMORY[0x1F41591F0]();
}

uint64_t sub_1C69E10A8()
{
  return MEMORY[0x1F4159210]();
}

uint64_t sub_1C69E10B8()
{
  return MEMORY[0x1F4159218]();
}

uint64_t sub_1C69E10C8()
{
  return MEMORY[0x1F4159220]();
}

uint64_t sub_1C69E10D8()
{
  return MEMORY[0x1F4159228]();
}

uint64_t sub_1C69E10E8()
{
  return MEMORY[0x1F4159230]();
}

uint64_t sub_1C69E10F8()
{
  return MEMORY[0x1F4159238]();
}

uint64_t sub_1C69E1108()
{
  return MEMORY[0x1F4159240]();
}

uint64_t sub_1C69E1118()
{
  return MEMORY[0x1F4159248]();
}

uint64_t sub_1C69E1128()
{
  return MEMORY[0x1F4159250]();
}

uint64_t sub_1C69E1148()
{
  return MEMORY[0x1F4159278]();
}

uint64_t sub_1C69E1158()
{
  return MEMORY[0x1F4159280]();
}

uint64_t sub_1C69E1168()
{
  return MEMORY[0x1F4159298]();
}

uint64_t sub_1C69E1178()
{
  return MEMORY[0x1F41592A0]();
}

uint64_t sub_1C69E1188()
{
  return MEMORY[0x1F41592A8]();
}

uint64_t sub_1C69E1198()
{
  return MEMORY[0x1F41592B0]();
}

uint64_t sub_1C69E11A8()
{
  return MEMORY[0x1F4159338]();
}

uint64_t sub_1C69E11B8()
{
  return MEMORY[0x1F4159348]();
}

uint64_t sub_1C69E11C8()
{
  return MEMORY[0x1F4159368]();
}

uint64_t sub_1C69E11D8()
{
  return MEMORY[0x1F4159370]();
}

uint64_t sub_1C69E11E8()
{
  return MEMORY[0x1F4159378]();
}

uint64_t sub_1C69E11F8()
{
  return MEMORY[0x1F4159380]();
}

uint64_t sub_1C69E1208()
{
  return MEMORY[0x1F4159388]();
}

uint64_t sub_1C69E1218()
{
  return MEMORY[0x1F4159390]();
}

uint64_t sub_1C69E1228()
{
  return MEMORY[0x1F4159398]();
}

uint64_t sub_1C69E1238()
{
  return MEMORY[0x1F41593A0]();
}

uint64_t sub_1C69E1248()
{
  return MEMORY[0x1F41593A8]();
}

uint64_t sub_1C69E1258()
{
  return MEMORY[0x1F41593B0]();
}

uint64_t sub_1C69E1268()
{
  return MEMORY[0x1F41593B8]();
}

uint64_t sub_1C69E1278()
{
  return MEMORY[0x1F41593D0]();
}

uint64_t sub_1C69E1288()
{
  return MEMORY[0x1F41593D8]();
}

uint64_t sub_1C69E1298()
{
  return MEMORY[0x1F41593F8]();
}

uint64_t sub_1C69E12A8()
{
  return MEMORY[0x1F4159400]();
}

uint64_t sub_1C69E12B8()
{
  return MEMORY[0x1F4159408]();
}

uint64_t sub_1C69E12C8()
{
  return MEMORY[0x1F4159410]();
}

uint64_t sub_1C69E12D8()
{
  return MEMORY[0x1F4159418]();
}

uint64_t sub_1C69E12E8()
{
  return MEMORY[0x1F4159420]();
}

uint64_t sub_1C69E1308()
{
  return MEMORY[0x1F4159458]();
}

uint64_t sub_1C69E1338()
{
  return MEMORY[0x1F4159758]();
}

uint64_t sub_1C69E1348()
{
  return MEMORY[0x1F4159760]();
}

uint64_t sub_1C69E1358()
{
  return MEMORY[0x1F4159770]();
}

uint64_t sub_1C69E1388()
{
  return MEMORY[0x1F4159788]();
}

uint64_t sub_1C69E1398()
{
  return MEMORY[0x1F41597A0]();
}

uint64_t sub_1C69E13A8()
{
  return MEMORY[0x1F41597B0]();
}

uint64_t sub_1C69E13B8()
{
  return MEMORY[0x1F41597B8]();
}

uint64_t sub_1C69E13C8()
{
  return MEMORY[0x1F41597C0]();
}

uint64_t sub_1C69E13D8()
{
  return MEMORY[0x1F41597C8]();
}

uint64_t sub_1C69E13E8()
{
  return MEMORY[0x1F41597E8]();
}

uint64_t sub_1C69E13F8()
{
  return MEMORY[0x1F41594B0]();
}

uint64_t sub_1C69E1408()
{
  return MEMORY[0x1F41594B8]();
}

uint64_t sub_1C69E1418()
{
  return MEMORY[0x1F41594C0]();
}

uint64_t sub_1C69E1428()
{
  return MEMORY[0x1F41594D0]();
}

uint64_t sub_1C69E1438()
{
  return MEMORY[0x1F41594D8]();
}

uint64_t sub_1C69E1448()
{
  return MEMORY[0x1F41594E0]();
}

uint64_t sub_1C69E1458()
{
  return MEMORY[0x1F41594E8]();
}

uint64_t sub_1C69E1468()
{
  return MEMORY[0x1F4159500]();
}

uint64_t sub_1C69E1478()
{
  return MEMORY[0x1F4159520]();
}

uint64_t sub_1C69E1488()
{
  return MEMORY[0x1F4159528]();
}

uint64_t sub_1C69E1498()
{
  return MEMORY[0x1F4159530]();
}

uint64_t sub_1C69E14A8()
{
  return MEMORY[0x1F4159538]();
}

uint64_t sub_1C69E14B8()
{
  return MEMORY[0x1F4159540]();
}

uint64_t sub_1C69E14C8()
{
  return MEMORY[0x1F4159548]();
}

uint64_t sub_1C69E14D8()
{
  return MEMORY[0x1F4159550]();
}

uint64_t sub_1C69E14E8()
{
  return MEMORY[0x1F4159558]();
}

uint64_t sub_1C69E14F8()
{
  return MEMORY[0x1F4159568]();
}

uint64_t sub_1C69E1508()
{
  return MEMORY[0x1F4159570]();
}

uint64_t sub_1C69E1518()
{
  return MEMORY[0x1F4159578]();
}

uint64_t sub_1C69E1528()
{
  return MEMORY[0x1F4159580]();
}

uint64_t sub_1C69E1538()
{
  return MEMORY[0x1F4159588]();
}

uint64_t sub_1C69E1548()
{
  return MEMORY[0x1F4159598]();
}

uint64_t sub_1C69E1558()
{
  return MEMORY[0x1F41595A0]();
}

uint64_t sub_1C69E1568()
{
  return MEMORY[0x1F41595A8]();
}

uint64_t sub_1C69E1578()
{
  return MEMORY[0x1F41595B8]();
}

uint64_t sub_1C69E1588()
{
  return MEMORY[0x1F41595C0]();
}

uint64_t sub_1C69E1598()
{
  return MEMORY[0x1F41595F0]();
}

uint64_t sub_1C69E15A8()
{
  return MEMORY[0x1F4159610]();
}

uint64_t sub_1C69E15B8()
{
  return MEMORY[0x1F4159628]();
}

uint64_t sub_1C69E15C8()
{
  return MEMORY[0x1F4159630]();
}

uint64_t sub_1C69E15D8()
{
  return MEMORY[0x1F41597F8]();
}

uint64_t sub_1C69E15E8()
{
  return MEMORY[0x1F4159820]();
}

uint64_t sub_1C69E15F8()
{
  return MEMORY[0x1F4159850]();
}

uint64_t sub_1C69E1608()
{
  return MEMORY[0x1F4159860]();
}

uint64_t sub_1C69E1618()
{
  return MEMORY[0x1F4159890]();
}

uint64_t sub_1C69E1628()
{
  return MEMORY[0x1F41598B8]();
}

uint64_t sub_1C69E1648()
{
  return MEMORY[0x1F41599C0]();
}

uint64_t sub_1C69E1658()
{
  return MEMORY[0x1F41599D0]();
}

uint64_t sub_1C69E1668()
{
  return MEMORY[0x1F41599D8]();
}

uint64_t sub_1C69E1678()
{
  return MEMORY[0x1F4159A38]();
}

uint64_t sub_1C69E1688()
{
  return MEMORY[0x1F4159A68]();
}

uint64_t sub_1C69E1698()
{
  return MEMORY[0x1F4159A70]();
}

uint64_t sub_1C69E16A8()
{
  return MEMORY[0x1F4159A78]();
}

uint64_t sub_1C69E16B8()
{
  return MEMORY[0x1F4159A80]();
}

uint64_t sub_1C69E16C8()
{
  return MEMORY[0x1F4159A88]();
}

uint64_t sub_1C69E16D8()
{
  return MEMORY[0x1F4159A90]();
}

uint64_t sub_1C69E16E8()
{
  return MEMORY[0x1F4159A98]();
}

uint64_t sub_1C69E16F8()
{
  return MEMORY[0x1F4159AA0]();
}

uint64_t sub_1C69E1708()
{
  return MEMORY[0x1F4159B40]();
}

uint64_t sub_1C69E1718()
{
  return MEMORY[0x1F4159B50]();
}

uint64_t sub_1C69E1728()
{
  return MEMORY[0x1F4159B98]();
}

uint64_t sub_1C69E1738()
{
  return MEMORY[0x1F4159BA0]();
}

uint64_t sub_1C69E1748()
{
  return MEMORY[0x1F4159BF8]();
}

uint64_t sub_1C69E1758()
{
  return MEMORY[0x1F4159C10]();
}

uint64_t sub_1C69E1768()
{
  return MEMORY[0x1F4159C68]();
}

uint64_t sub_1C69E1778()
{
  return MEMORY[0x1F4159C98]();
}

uint64_t sub_1C69E1798()
{
  return MEMORY[0x1F4159CB0]();
}

uint64_t sub_1C69E17A8()
{
  return MEMORY[0x1F4159CD8]();
}

uint64_t sub_1C69E17B8()
{
  return MEMORY[0x1F4159CE0]();
}

uint64_t sub_1C69E17D8()
{
  return MEMORY[0x1F4159CF0]();
}

uint64_t sub_1C69E17E8()
{
  return MEMORY[0x1F4159CF8]();
}

uint64_t sub_1C69E17F8()
{
  return MEMORY[0x1F4159D00]();
}

uint64_t sub_1C69E1808()
{
  return MEMORY[0x1F4159D08]();
}

uint64_t sub_1C69E1818()
{
  return MEMORY[0x1F4159D10]();
}

uint64_t sub_1C69E1828()
{
  return MEMORY[0x1F4159DE8]();
}

uint64_t sub_1C69E1838()
{
  return MEMORY[0x1F4159E50]();
}

uint64_t sub_1C69E1848()
{
  return MEMORY[0x1F4159E58]();
}

uint64_t sub_1C69E1868()
{
  return MEMORY[0x1F4159E80]();
}

uint64_t sub_1C69E1878()
{
  return MEMORY[0x1F4159E90]();
}

uint64_t sub_1C69E1888()
{
  return MEMORY[0x1F4159EA8]();
}

uint64_t sub_1C69E1898()
{
  return MEMORY[0x1F4159EB0]();
}

uint64_t sub_1C69E18A8()
{
  return MEMORY[0x1F4159F08]();
}

uint64_t sub_1C69E18B8()
{
  return MEMORY[0x1F4159F70]();
}

uint64_t sub_1C69E18C8()
{
  return MEMORY[0x1F4159FA8]();
}

uint64_t sub_1C69E18D8()
{
  return MEMORY[0x1F4159FC8]();
}

uint64_t sub_1C69E18E8()
{
  return MEMORY[0x1F415A0B0]();
}

uint64_t sub_1C69E18F8()
{
  return MEMORY[0x1F415A0B8]();
}

uint64_t sub_1C69E1908()
{
  return MEMORY[0x1F415A0C0]();
}

uint64_t sub_1C69E1918()
{
  return MEMORY[0x1F415A0D8]();
}

uint64_t sub_1C69E1928()
{
  return MEMORY[0x1F415A108]();
}

uint64_t sub_1C69E1938()
{
  return MEMORY[0x1F415A110]();
}

uint64_t sub_1C69E1948()
{
  return MEMORY[0x1F415A1C0]();
}

uint64_t sub_1C69E1958()
{
  return MEMORY[0x1F415A228]();
}

uint64_t sub_1C69E1968()
{
  return MEMORY[0x1F415A230]();
}

uint64_t sub_1C69E1988()
{
  return MEMORY[0x1F415A298]();
}

uint64_t sub_1C69E1998()
{
  return MEMORY[0x1F415A2A0]();
}

uint64_t sub_1C69E19A8()
{
  return MEMORY[0x1F415A2A8]();
}

uint64_t sub_1C69E1A38()
{
  return MEMORY[0x1F415A5C0]();
}

uint64_t sub_1C69E1A48()
{
  return MEMORY[0x1F415A5C8]();
}

uint64_t sub_1C69E1A58()
{
  return MEMORY[0x1F415A5D0]();
}

uint64_t sub_1C69E1A68()
{
  return MEMORY[0x1F415A5D8]();
}

uint64_t sub_1C69E1A78()
{
  return MEMORY[0x1F415A5E0]();
}

uint64_t sub_1C69E1A88()
{
  return MEMORY[0x1F415A5E8]();
}

uint64_t sub_1C69E1A98()
{
  return MEMORY[0x1F415A628]();
}

uint64_t sub_1C69E1AA8()
{
  return MEMORY[0x1F415A638]();
}

uint64_t sub_1C69E1AB8()
{
  return MEMORY[0x1F415A640]();
}

uint64_t sub_1C69E1AC8()
{
  return MEMORY[0x1F415A648]();
}

uint64_t sub_1C69E1AD8()
{
  return MEMORY[0x1F415A658]();
}

uint64_t sub_1C69E1AE8()
{
  return MEMORY[0x1F415A668]();
}

uint64_t sub_1C69E1AF8()
{
  return MEMORY[0x1F415A670]();
}

uint64_t sub_1C69E1B08()
{
  return MEMORY[0x1F415A698]();
}

uint64_t sub_1C69E1B18()
{
  return MEMORY[0x1F415A6C0]();
}

uint64_t sub_1C69E1B28()
{
  return MEMORY[0x1F415A6E0]();
}

uint64_t sub_1C69E1B38()
{
  return MEMORY[0x1F415A6E8]();
}

uint64_t sub_1C69E1B48()
{
  return MEMORY[0x1F415A6F0]();
}

uint64_t sub_1C69E1B58()
{
  return MEMORY[0x1F415A708]();
}

uint64_t sub_1C69E1B68()
{
  return MEMORY[0x1F415A710]();
}

uint64_t sub_1C69E1B78()
{
  return MEMORY[0x1F415A730]();
}

uint64_t sub_1C69E1B88()
{
  return MEMORY[0x1F415A750]();
}

uint64_t sub_1C69E1B98()
{
  return MEMORY[0x1F415A788]();
}

uint64_t sub_1C69E1BA8()
{
  return MEMORY[0x1F415A838]();
}

uint64_t sub_1C69E1BB8()
{
  return MEMORY[0x1F415A848]();
}

uint64_t sub_1C69E1BC8()
{
  return MEMORY[0x1F415A858]();
}

uint64_t sub_1C69E1BD8()
{
  return MEMORY[0x1F4150DA8]();
}

uint64_t sub_1C69E1BE8()
{
  return MEMORY[0x1F4150DB0]();
}

uint64_t sub_1C69E1BF8()
{
  return MEMORY[0x1F4126F28]();
}

uint64_t sub_1C69E1C08()
{
  return MEMORY[0x1F4126F30]();
}

uint64_t sub_1C69E1C18()
{
  return MEMORY[0x1F4126F38]();
}

uint64_t sub_1C69E1C28()
{
  return MEMORY[0x1F4126F50]();
}

uint64_t sub_1C69E1C38()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C69E1C48()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C69E1C58()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C69E1C68()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C69E1C78()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C69E1C88()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C69E1C98()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C69E1CA8()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1C69E1CB8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C69E1CC8()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1C69E1CD8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C69E1CE8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C69E1CF8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C69E1D08()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C69E1D18()
{
  return MEMORY[0x1F4183888]();
}

uint64_t sub_1C69E1D28()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C69E1D38()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C69E1D48()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C69E1D58()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C69E1D68()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C69E1D88()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C69E1D98()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C69E1DA8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C69E1DB8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C69E1DC8()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C69E1DD8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C69E1DE8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C69E1DF8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C69E1E08()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C69E1E18()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C69E1E28()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C69E1E38()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C69E1E48()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C69E1E58()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C69E1E78()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1C69E1E88()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1C69E1E98()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1C69E1EC8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C69E1ED8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C69E1EE8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C69E1EF8()
{
  return MEMORY[0x1F4152AE0]();
}

uint64_t sub_1C69E1F08()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1C69E1F18()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C69E1F28()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C69E1F38()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C69E1F48()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C69E1F58()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1C69E1F68()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1C69E1F78()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C69E1F88()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1C69E1F98()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C69E1FA8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C69E1FB8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C69E1FC8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1C69E1FD8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C69E1FE8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C69E1FF8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C69E2008()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C69E2018()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C69E2028()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C69E2038()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C69E2048()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C69E2058()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C69E2068()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1C69E2078()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C69E2088()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C69E2098()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C69E20A8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1C69E20B8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C69E20C8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C69E20D8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C69E20E8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C69E20F8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C69E2118()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C69E2128()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C69E2138()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C69E2148()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C69E2158()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C69E2168()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C69E2178()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C69E2188()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C69E2198()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C69E21B8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C69E21C8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C69E21D8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C69E21E8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C69E21F8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C69E2208()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C69E2218()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C69E2228()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C69E2238()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C69E2248()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C69E2258()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C69E2288()
{
  return MEMORY[0x1F4186318]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}