uint64_t dispatch thunk of IFSessionServiceClientProtocol.send(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of IFSessionServiceClientProtocol.subscribe(filtering:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of IFSessionServiceClientProtocol.currentSessionIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1C9E1DDFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E291CC();
  *a1 = result;
  return result;
}

BOOL sub_1C9E1DE24(uint64_t *a1, uint64_t *a2)
{
  return sub_1C9E315CC(*a1, *a2);
}

void *sub_1C9E1DE30@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C9E1DE3C(uint64_t a1@<X8>)
{
  sub_1C9E1DE70();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1C9E1DE78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void type metadata accessor for AFUserIdentityClassfication()
{
  if (!qword_1EA5C99F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA5C99F0);
    }
  }
}

uint64_t AsyncSequentialExecutor.__allocating_init(label:priority:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  AsyncSequentialExecutor.init(label:priority:logger:)(a1, a2, a3, a4);
  return v8;
}

uint64_t AsyncSequentialExecutor.init(label:priority:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B10);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11 - v10;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B18);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v17 = v16 - v15;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B30);
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v22 = v21 - v20;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x1E4FBD028], v7);
  sub_1C9E42A58();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v5 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_streamContinuation, v17, v25);
  sub_1C9E20644(a4, v5 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, &qword_1EBCB3AF0);
  uint64_t v23 = sub_1C9E1E23C(v22, a3, a1, a2, a4);
  swift_bridgeObjectRelease();
  sub_1C9E1E4B0(a4, &qword_1EBCB3AF0);
  sub_1C9E1E4B0(a3, &qword_1EBCB3B00);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v25);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v26);
  *(void *)(v5 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_task) = v23;
  return v5;
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

uint64_t sub_1C9E1E23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a5;
  uint64_t v22 = a1;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B30);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0) - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B00);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E20644(a2, (uint64_t)v13, &qword_1EBCB3B00);
  sub_1C9E20644(v21, (uint64_t)v11, &qword_1EBCB3AF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v6);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v15 = (v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + v15 + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  sub_1C9E20804((uint64_t)v11, v17 + v14);
  uint64_t v18 = (void *)(v17 + v15);
  uint64_t v19 = v24;
  *uint64_t v18 = v23;
  v18[1] = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v16, (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_1C9E42808();
  return sub_1C9E1F2FC((uint64_t)v13, (uint64_t)&unk_1EA5C9D08, v17);
}

uint64_t sub_1C9E1E4B0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_6();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1C9E1E508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  v7[14] = swift_task_alloc();
  v7[15] = swift_task_alloc();
  v7[16] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B28);
  v7[17] = v8;
  v7[18] = *(void *)(v8 - 8);
  v7[19] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C9E1E61C, 0, 0);
}

uint64_t sub_1C9E1E61C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B30);
  sub_1C9E42A98();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_9(v0);
  void *v1 = v2;
  v1[1] = sub_1C9E1E6D0;
  uint64_t v3 = OUTLINED_FUNCTION_2();
  return MEMORY[0x1F4187D58](v3);
}

uint64_t sub_1C9E1E6D0()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C9E1E7A0, 0, 0);
}

void sub_1C9E1E7A0()
{
  uint64_t v1 = v0[2];
  uint64_t v3 = v0[4];
  unint64_t v2 = v0[5];
  v0[21] = v0[3];
  v0[22] = v3;
  v0[23] = v2;
  if (v1)
  {
    uint64_t v4 = v0[16];
    sub_1C9E20644(v0[10], v4, &qword_1EBCB3AF0);
    uint64_t v5 = sub_1C9E426F8();
    v0[24] = v5;
    if (__swift_getEnumTagSinglePayload(v4, 1, v5) == 1)
    {
      sub_1C9E1E4B0(v0[16], &qword_1EBCB3AF0);
    }
    else
    {
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v11 = sub_1C9E426E8();
      os_log_type_t v12 = sub_1C9E42B18();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315138;
        sub_1C9E42808();
        *(void *)(v13 + 4) = sub_1C9E1F9C8(v3, v2, &v18);
        swift_bridgeObjectRelease_n();
        swift_release_n();
        _os_log_impl(&dword_1C9E1B000, v11, v12, "#AsyncSequentialExecutor Starting async task: %s", (uint8_t *)v13, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
      }
      OUTLINED_FUNCTION_6();
      (*(void (**)(void))(v14 + 8))();
    }
    unint64_t v15 = (void *)swift_task_alloc();
    v0[25] = v15;
    *unint64_t v15 = v0;
    v15[1] = sub_1C9E1EAB4;
    OUTLINED_FUNCTION_8();
    __asm { BRAA            X0, X16 }
  }
  uint64_t v7 = v0[11];
  unint64_t v6 = v0[12];
  uint64_t v8 = v0[10];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  sub_1C9E1F0D0(v8, v7, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1C9E1EAB4()
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_7();
  *uint64_t v3 = v2;
  *(void *)(v4 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_1C9E1EDE4;
  }
  else {
    uint64_t v5 = sub_1C9E1EB9C;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1C9E1EB9C()
{
  uint64_t v19 = v0;
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[15];
  sub_1C9E20644(v0[10], v2, &qword_1EBCB3AF0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v1);
  uint64_t v4 = v0[15];
  if (EnumTagSinglePayload == 1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C9E1E4B0(v4, &qword_1EBCB3AF0);
  }
  else
  {
    OUTLINED_FUNCTION_10();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_1C9E426E8();
    os_log_type_t v6 = sub_1C9E42B18();
    BOOL v7 = os_log_type_enabled(v5, v6);
    unint64_t v8 = v0[23];
    if (v7)
    {
      uint64_t v9 = v0[22];
      uint64_t v10 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_1C9E42808();
      *(void *)(v10 + 4) = sub_1C9E1F9C8(v9, v8, &v18);
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_10();
      swift_release_n();
      _os_log_impl(&dword_1C9E1B000, v5, v6, "#AsyncSequentialExecutor Ending async task: %s", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {

      OUTLINED_FUNCTION_11();
      swift_release_n();
    }
    OUTLINED_FUNCTION_6();
    (*(void (**)(uint64_t))(v11 + 8))(v12);
  }
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_9(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_1C9E1E6D0;
  uint64_t v16 = OUTLINED_FUNCTION_2();
  return MEMORY[0x1F4187D58](v16);
}

uint64_t sub_1C9E1EDE4()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[14];
  sub_1C9E20644(v0[10], v2, &qword_1EBCB3AF0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v1);
  uint64_t v4 = (void *)v0[26];
  uint64_t v5 = v0[14];
  if (EnumTagSinglePayload == 1)
  {

    swift_release();
    swift_bridgeObjectRelease();
    sub_1C9E1E4B0(v5, &qword_1EBCB3AF0);
  }
  else
  {
    swift_retain();
    sub_1C9E42808();
    id v6 = v4;
    swift_retain();
    sub_1C9E42808();
    id v7 = v4;
    unint64_t v8 = sub_1C9E426E8();
    os_log_type_t v9 = sub_1C9E42B28();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = (void *)v0[26];
    unint64_t v12 = v0[23];
    if (v10)
    {
      uint64_t v13 = v0[22];
      uint64_t v14 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315394;
      sub_1C9E42808();
      *(void *)(v14 + 4) = sub_1C9E1F9C8(v13, v12, &v24);
      OUTLINED_FUNCTION_11();
      swift_release_n();
      *(_WORD *)(v14 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v15 = sub_1C9E42E78();
      *(void *)(v14 + 14) = sub_1C9E1F9C8(v15, v16, &v24);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C9E1B000, v8, v9, "#AsyncSequentialExecutor async task \"%s\" threw an exception: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_release_n();
      OUTLINED_FUNCTION_11();
    }
    OUTLINED_FUNCTION_6();
    (*(void (**)(void))(v17 + 8))();
  }
  uint64_t v18 = swift_task_alloc();
  uint64_t v19 = (void *)OUTLINED_FUNCTION_9(v18);
  *uint64_t v19 = v20;
  v19[1] = sub_1C9E1E6D0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x1F4187D58](v21);
}

uint64_t sub_1C9E1F0D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  MEMORY[0x1F4188790]();
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E20644(a1, (uint64_t)v7, &qword_1EBCB3AF0);
  uint64_t v8 = sub_1C9E426F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1) {
    return sub_1C9E1E4B0((uint64_t)v7, &qword_1EBCB3AF0);
  }
  swift_bridgeObjectRetain_n();
  BOOL v10 = sub_1C9E426E8();
  os_log_type_t v11 = sub_1C9E42B18();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v15 = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    sub_1C9E42808();
    uint64_t v14 = sub_1C9E1F9C8(a2, a3, &v15);
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C9E1B000, v10, v11, "#AsyncSequentialExecutor ending main task: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB791240](v13, -1, -1);
    MEMORY[0x1CB791240](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_1C9E1F2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1C9E42A48();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1C9E1E4B0(a1, &qword_1EBCB3B00);
  }
  else
  {
    sub_1C9E42A38();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C9E42A28();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1C9E1F444(uint64_t a1, uint64_t a2)
{
  return sub_1C9E1F46C(0x6F6D796E6F6E613CLL, 0xEB000000003E7375, a1, a2);
}

uint64_t sub_1C9E1F46C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B08);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v17 = v16 - v15;
  sub_1C9E20644(v5 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, v16 - v15, &qword_1EBCB3AF0);
  uint64_t v18 = sub_1C9E426F8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v17, 1, v18);
  sub_1C9E42808();
  if (EnumTagSinglePayload == 1)
  {
    swift_retain();
    sub_1C9E1E4B0(v17, &qword_1EBCB3AF0);
  }
  else
  {
    uint64_t v26 = a1;
    OUTLINED_FUNCTION_10();
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v20 = sub_1C9E426E8();
    os_log_type_t v21 = sub_1C9E42B18();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v25 = v9;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v28[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      sub_1C9E42808();
      sub_1C9E1F9C8(v26, a2, v28);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v20, v21, "#AsyncSequentialExecutor Submitting async task: %s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      uint64_t v9 = v25;
      OUTLINED_FUNCTION_5();
    }
    else
    {

      OUTLINED_FUNCTION_10();
      swift_bridgeObjectRelease_n();
    }
    OUTLINED_FUNCTION_6();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v17, v18);
    a1 = v26;
  }
  v28[0] = a3;
  v28[1] = a4;
  v28[2] = a1;
  v28[3] = a2;
  sub_1C9E42808();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B18);
  sub_1C9E42A68();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v14, v9);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1C9E1F7A8()
{
  return sub_1C9E42A78();
}

uint64_t AsyncSequentialExecutor.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_streamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B18);
  sub_1C9E42A78();
  OUTLINED_FUNCTION_6();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_1C9E1E4B0(v1 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, &qword_1EBCB3AF0);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t AsyncSequentialExecutor.__deallocating_deinit()
{
  AsyncSequentialExecutor.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t AsyncSequentialExecutor.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1C9E1F8C0()
{
  return AsyncSequentialExecutor.unownedExecutor.getter();
}

uint64_t sub_1C9E1F8DC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1C9E1F8EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C9E1F928(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C9E1F950(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1C9E1F9C8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1C9E42C58();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C9E1F9C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C9E1FA9C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C9E205E4((uint64_t)v12, *a3);
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
      sub_1C9E205E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_1C9E42808();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C9E1FA9C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C9E1FBF4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C9E42C68();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1C9E1FCCC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1C9E42D08();
    if (!v8)
    {
      uint64_t result = sub_1C9E42DD8();
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

void *sub_1C9E1FBF4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9E42DF8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C9E1FCCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C9E1FD64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1C9E1FED8(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1C9E1FED8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C9E1FD64(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1C9E42918();
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
  unint64_t v3 = sub_1C9E415FC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1C9E42CD8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1C9E42DF8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1C9E42DD8();
  __break(1u);
  return result;
}

char *sub_1C9E1FED8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3478);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C9E20088(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9E1FFB0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C9E1FFB0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9E42DF8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1C9E20088(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C9E42DF8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_1C9E20118(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1C9E20128()
{
  return type metadata accessor for AsyncSequentialExecutor();
}

uint64_t type metadata accessor for AsyncSequentialExecutor()
{
  uint64_t result = qword_1EBCB3910;
  if (!qword_1EBCB3910) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C9E20178()
{
  sub_1C9E202F4();
  if (v0 <= 0x3F)
  {
    sub_1C9E20340();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AsyncSequentialExecutor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AsyncSequentialExecutor);
}

uint64_t dispatch thunk of AsyncSequentialExecutor.__allocating_init(label:priority:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.submit(task:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.submit(taskName:task:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

void sub_1C9E202F4()
{
  if (!qword_1EBCB3B20)
  {
    unint64_t v0 = sub_1C9E42A88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBCB3B20);
    }
  }
}

void sub_1C9E20340()
{
  if (!qword_1EBCB3AF8)
  {
    sub_1C9E426F8();
    unint64_t v0 = sub_1C9E42C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBCB3AF8);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AsyncSequentialExecutor.AsyncWork(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AsyncSequentialExecutor.AsyncWork()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AsyncSequentialExecutor.AsyncWork(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  sub_1C9E42808();
  return a1;
}

void *assignWithCopy for AsyncSequentialExecutor.AsyncWork(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_1C9E42808();
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

uint64_t assignWithTake for AsyncSequentialExecutor.AsyncWork(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncSequentialExecutor.AsyncWork(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for AsyncSequentialExecutor.AsyncWork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncSequentialExecutor.AsyncWork()
{
  return &type metadata for AsyncSequentialExecutor.AsyncWork;
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

uint64_t sub_1C9E205E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C9E20644(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_6();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1C9E206A4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  OUTLINED_FUNCTION_3(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B30);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = *(void *)(v11 + 64);
  swift_unknownObjectRelease();
  uint64_t v13 = sub_1C9E426F8();
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v13))
  {
    OUTLINED_FUNCTION_6();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0 + v4, v13);
  }
  uint64_t v15 = v3 | v10 | 7;
  unint64_t v16 = (((v6 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + v10 + 16) & ~v10;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v16, v7);
  return MEMORY[0x1F4186498](v0, v16 + v12, v15);
}

uint64_t sub_1C9E20804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9E2086C(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3AF0);
  OUTLINED_FUNCTION_3(v5);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v9 = (*(void *)(v8 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B30) - 8);
  unint64_t v11 = (v9 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v7;
  uint64_t v15 = v1 + v9;
  uint64_t v16 = *(void *)(v1 + v9);
  uint64_t v17 = *(void *)(v15 + 8);
  uint64_t v18 = v1 + v11;
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v19;
  *uint64_t v19 = v3;
  v19[1] = sub_1C9E209CC;
  return sub_1C9E1E508(a1, v12, v13, v14, v16, v17, v18);
}

uint64_t sub_1C9E209CC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_5()
{
  JUMPOUT(0x1CB791240);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t result)
{
  *(void *)(v1 + 160) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease_n();
}

void sub_1C9E20B8C()
{
  *(_WORD *)&algn_1EA5CA8C8[6] = -4864;
}

void sub_1C9E20BBC()
{
  *(_WORD *)&algn_1EA5C9D18[6] = -4864;
}

uint64_t static AutoBugCapture.ErrorType.orchestration.getter()
{
  if (qword_1EA5C98D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EA5C9D10;
  sub_1C9E42808();
  return v0;
}

unint64_t static AutoBugCapture.ErrorSubType.machineUtteranceFallback.getter()
{
  return 0xD000000000000021;
}

uint64_t static AutoBugCapture.ErrorContext.none.getter()
{
  return 0;
}

uint64_t static AutoBugCapture.generateSnapshot(type:subType:context:)()
{
  uint64_t result = AFIsInternalInstall();
  if (result)
  {
    if (qword_1EA5C98D0 != -1) {
      swift_once();
    }
    sub_1C9E42568();
    swift_allocObject();
    sub_1C9E42808();
    sub_1C9E42558();
    sub_1C9E42548();
    return swift_release();
  }
  return result;
}

void sub_1C9E20DB0()
{
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1C9E426F8();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBCB3C50);
  oslog = sub_1C9E426E8();
  os_log_type_t v1 = sub_1C9E42B48();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 67109120;
    sub_1C9E42C58();
    _os_log_impl(&dword_1C9E1B000, oslog, v1, "AutoBugCapture#generateSnapshot ABC result: %{BOOL}d", v2, 8u);
    MEMORY[0x1CB791240](v2, -1, -1);
  }
  else
  {
  }
}

void type metadata accessor for AutoBugCapture()
{
}

void type metadata accessor for AutoBugCapture.ErrorType()
{
}

void type metadata accessor for AutoBugCapture.ErrorSubType()
{
}

void type metadata accessor for AutoBugCapture.ErrorContext()
{
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void Bridge.defaultHandle(_:executionContextInfo:reply:)(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = a4;
  uint64_t v10 = sub_1C9E42528();
  uint64_t v43 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v42 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1C9E426F8();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EBCB3C50);
  swift_unknownObjectRetain_n();
  id v13 = a1;
  uint64_t v14 = sub_1C9E426E8();
  os_log_type_t v15 = sub_1C9E42B18();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    v39 = (void *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v49 = v40;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v41 = v10;
    uint64_t v18 = sub_1C9E42648();
    uint64_t v47 = sub_1C9E1F9C8(v18, v19, &v49);
    sub_1C9E42C58();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v47 = (uint64_t)v13;
    uint64_t v20 = a3;
    id v21 = v13;
    uint64_t v10 = v41;
    sub_1C9E42C58();
    uint64_t v22 = v13;
    void *v39 = v13;

    a3 = v20;
    _os_log_impl(&dword_1C9E1B000, v14, v15, "Bridge:%s received %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

    if (!v20) {
      return;
    }
  }
  else
  {

    uint64_t v22 = v13;
    swift_unknownObjectRelease_n();
    if (!a3) {
      return;
    }
  }
  id v23 = objc_allocWithZone(MEMORY[0x1E4F965B0]);
  swift_retain();
  id v24 = objc_msgSend(v23, sel_init);
  uint64_t v25 = v42;
  sub_1C9E42518();
  sub_1C9E424E8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v10);
  uint64_t v26 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setAceId_, v26);

  id v27 = v24;
  id v28 = objc_msgSend(v22, sel_aceId);
  objc_msgSend(v27, sel_setRefId_, v28);

  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_1C9E42CC8();
  swift_bridgeObjectRelease();
  uint64_t v49 = 0x20656764697242;
  unint64_t v50 = 0xE700000000000000;
  sub_1C9E42648();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E42908();
  id v29 = objc_msgSend(v22, sel_encodedClassName);
  if (v29)
  {
    v30 = v29;
    uint64_t v31 = sub_1C9E42898();
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
  }
  v34 = self;
  uint64_t v47 = v31;
  uint64_t v48 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9D20);
  sub_1C9E428D8();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  v35 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(v34, sel_errorWithCode_description_, 2000, v35);

  id v37 = v27;
  id v38 = v36;
  a3(v27, v36);

  sub_1C9E21660((uint64_t)a3);
}

uint64_t Bridge.aceCommandsGroups()()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t Bridge.aceCommands(forGroup:)()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t XPCListeningBridge.init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1C9E426F8();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBCB3C50);
  unint64_t v9 = sub_1C9E426E8();
  os_log_type_t v10 = sub_1C9E42B28();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1C9E1B000, v9, v10, "Attempting to initialize an XPCListeningBridge without an XPCListener, this is not supported. Please use a different implementation if an XPCListener is not required. ", v11, 2u);
    OUTLINED_FUNCTION_5();
  }

  sub_1C9E21750(a3, (uint64_t)v15);
  sub_1C9E21750(a6, (uint64_t)v14);
  type metadata accessor for EmptyBridgeConnectionListener();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F29280]), sel_init);
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F29280]), sel_init);
  sub_1C9E274A0();
  uint64_t v12 = sub_1C9E42628();
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v12;
}

uint64_t sub_1C9E21660(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1C9E21670(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1C9E21698(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1C9E42C58();
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

uint64_t sub_1C9E21750(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C9E217B4(uint64_t a1)
{
  sub_1C9E42718();
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return sub_1C9E218FC((uint64_t)v3);
}

uint64_t sub_1C9E21880@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1EBCB3C40;
  swift_beginAccess();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_1C9E218FC(uint64_t a1)
{
  uint64_t v3 = v1 + qword_1EBCB3C40;
  OUTLINED_FUNCTION_16();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

uint64_t (*sub_1C9E21978())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C9E219C0()
{
  uint64_t v0 = swift_retain();
  return sub_1C9E21A24(v0);
}

uint64_t sub_1C9E219EC()
{
  return swift_retain();
}

uint64_t sub_1C9E21A24(uint64_t a1)
{
  OUTLINED_FUNCTION_32();
  void *v1 = a1;
  return swift_release();
}

uint64_t (*sub_1C9E21A64())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C9E21AAC()
{
  uint64_t v0 = sub_1C9E42808();
  return sub_1C9E21B10(v0);
}

uint64_t sub_1C9E21AD8()
{
  return sub_1C9E42808();
}

uint64_t sub_1C9E21B10(uint64_t a1)
{
  OUTLINED_FUNCTION_32();
  void *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C9E21B50())()
{
  return j__swift_endAccess;
}

void CandidateRequestAwareBridgeBase.__allocating_init(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v18 = v17 - v16;
  sub_1C9E21750(v8, (uint64_t)v21);
  sub_1C9E21750(v2, (uint64_t)v20);
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v13, (uint64_t)qword_1EBCB3C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v19, v13);
  (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(v0 + 440))(v12, v10, v21, v6, v4, v20, v18, 1);
  __swift_destroy_boxed_opaque_existential_0(v2);
  __swift_destroy_boxed_opaque_existential_0(v8);
  OUTLINED_FUNCTION_3_0();
}

void CandidateRequestAwareBridgeBase.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
}

void CandidateRequestAwareBridgeBase.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  OUTLINED_FUNCTION_5_0();
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v24 = v7;
  uint64_t v25 = v8;
  uint64_t v10 = v9;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v13 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = v0 + qword_1EBCB3C40;
  *(void *)(v0 + qword_1EBCB3C40) = 500;
  uint64_t v20 = *MEMORY[0x1E4FBCAC8];
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v21 + 104))(v19, v20);
  *(void *)(v0 + qword_1EBCB3C38) = 0;
  *(void *)(v0 + qword_1EBCB3C30) = MEMORY[0x1E4FBC868];
  *(unsigned char *)(v0 + qword_1EBCB37A0) = v2;
  sub_1C9E21750(v10, (uint64_t)v27);
  sub_1C9E21750(v6, (uint64_t)v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v4, v13);
  MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(v22, v23, v27, v24, v25, v26, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v13);
  __swift_destroy_boxed_opaque_existential_0(v6);
  __swift_destroy_boxed_opaque_existential_0(v10);
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E21F08()
{
}

uint64_t sub_1C9E21F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C9E291D4(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

void sub_1C9E21F64()
{
}

void sub_1C9E21F7C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v23 = v3;
  uint64_t v24 = v2;
  os_log_type_t v4 = v0;
  uint64_t v22 = v5;
  uint64_t v7 = v6;
  uint64_t v8 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_26();
  char v21 = *v7;
  swift_getMetatypeMetadata();
  uint64_t v11 = sub_1C9E428D8();
  unint64_t v13 = v12;
  uint64_t v14 = sub_1C9E2C070();
  v25[0] = v11;
  v25[1] = v13;
  uint64_t v15 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  sub_1C9E42808();
  MEMORY[0x1CB790520](v26, v25, v14, MEMORY[0x1E4FBB1A0], v15, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = v26[0];
  swift_release();
  if (v16)
  {
    sub_1C9E42808();
    uint64_t v17 = sub_1C9E426E8();
    os_log_type_t v18 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_17(v18))
    {
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      v25[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v19 = 136315138;
      sub_1C9E42808();
      v26[0] = sub_1C9E1F9C8(v11, v13, v25);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v17, v4, "Message type: %s is already registered. Ignoring this request", v19, 0xCu);
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v1, v0 + qword_1EBCB3C20, v8);
    LOBYTE(v25[0]) = v21;
    uint64_t v20 = v23(v22, v24, v1, v25);
    v26[1] = v13;
    long long v26[2] = v20;
    v26[0] = v11;
    OUTLINED_FUNCTION_16();
    sub_1C9E42838();
    swift_retain();
    sub_1C9E42858();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E22268(void *a1)
{
  sub_1C9E425B8();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3
    || (os_log_type_t v4 = (void *)v3,
        id v5 = a1,
        LOBYTE(v4) = sub_1C9E23224(v4),
        v5,
        (v4 & 1) == 0))
  {
    uint64_t v6 = sub_1C9E2C470(a1);
    if ((*(uint64_t (**)(void))(*(void *)v6 + 120))())
    {
      id v7 = a1;
      uint64_t v8 = sub_1C9E426E8();
      os_log_type_t v9 = sub_1C9E42B18();
      if (OUTLINED_FUNCTION_17(v9))
      {
        uint64_t v10 = (_DWORD *)OUTLINED_FUNCTION_6_0();
        uint64_t v16 = OUTLINED_FUNCTION_4_0();
        *uint64_t v10 = 136315138;
        id v11 = objc_msgSend(v7, sel_debugDescription);
        uint64_t v12 = sub_1C9E42898();
        unint64_t v14 = v13;

        sub_1C9E1F9C8(v12, v14, &v16);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_23(&dword_1C9E1B000, v8, v15, "Could not find a handler for message: %s");
        OUTLINED_FUNCTION_36();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();

        swift_release();
        return;
      }
    }
    else
    {
      (*(void (**)(uint64_t, void *))(*(void *)v6 + 104))(v1, a1);
    }
    swift_release();
  }
}

uint64_t sub_1C9E224AC(uint64_t a1, uint64_t a2)
{
  sub_1C9E26198();
  swift_allocError();
  *os_log_type_t v4 = a1;
  v4[1] = a2;
  sub_1C9E42808();
  return swift_willThrow();
}

uint64_t sub_1C9E22510()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

void sub_1C9E22550()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v81 = v0;
  uint64_t v2 = v1;
  os_log_type_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11 - v10;
  sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_4();
  uint64_t v16 = v15 - v14;
  id v17 = objc_msgSend(v8, sel_refId);
  v84 = v6;
  if (v17)
  {
    os_log_type_t v18 = v17;
    uint64_t v78 = (uint64_t)v4;
    uint64_t v79 = v2;
    uint64_t v19 = sub_1C9E42898();
    uint64_t v21 = v20;

    if (sub_1C9E219EC())
    {
      uint64_t v22 = swift_dynamicCastClass();
      if (v22)
      {
        uint64_t v23 = v22;
        BOOL v24 = *(void *)(v22 + 64) == v19 && *(void *)(v22 + 72) == v21;
        if (v24 || (sub_1C9E42E48() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v25 = sub_1C9E426E8();
          os_log_type_t v26 = sub_1C9E42B18();
          if (os_log_type_enabled(v25, v26))
          {
            *(_WORD *)OUTLINED_FUNCTION_33() = 0;
            OUTLINED_FUNCTION_37(&dword_1C9E1B000, v27, v28, "Handling command through activeRequestProcessor");
            OUTLINED_FUNCTION_5();
          }

          v75 = *(void **)(v23 + 80);
          v76 = *(void **)(v23 + 88);
          id v29 = (void *)swift_allocObject();
          v30 = OUTLINED_FUNCTION_39(v29, v81);
          v30[8] = v8;
          v30[9] = v84;
          v30[10] = v4;
          v30[11] = v79;
          v89 = sub_1C9E26200;
          v90 = v30;
          uint64_t v85 = MEMORY[0x1E4F143A8];
          uint64_t v86 = 1107296256;
          v87 = sub_1C9E22D44;
          v88 = &block_descriptor_6;
          uint64_t v31 = _Block_copy(&v85);
          id v82 = v75;
          id v83 = v76;
          swift_retain();
          swift_retain();
          id v32 = v8;
          id v33 = v84;
          sub_1C9E2621C((uint64_t)v4);
          sub_1C9E42748();
          uint64_t v91 = MEMORY[0x1E4FBC860];
          sub_1C9E2622C();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
          sub_1C9E2627C();
          OUTLINED_FUNCTION_40();
          sub_1C9E42C88();
          MEMORY[0x1CB790880](v76, v16, v12, v31);
          _Block_release(v31);
          swift_release();

LABEL_20:
          OUTLINED_FUNCTION_8_0();
          v61();
          OUTLINED_FUNCTION_8_0();
          v62();
          swift_release();
          goto LABEL_29;
        }
      }
      swift_release();
    }
    uint64_t v45 = sub_1C9E21AD8();
    uint64_t v46 = sub_1C9E21F20(v19, v21, v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v46)
    {
      uint64_t v47 = swift_dynamicCastClass();
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = sub_1C9E426E8();
        os_log_type_t v50 = sub_1C9E42B18();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)OUTLINED_FUNCTION_33() = 0;
          OUTLINED_FUNCTION_37(&dword_1C9E1B000, v51, v52, "Handling command through candidateRequestProcessor");
          OUTLINED_FUNCTION_5();
        }

        v53 = *(void **)(v48 + 88);
        v77 = *(void **)(v48 + 80);
        v54 = (void *)swift_allocObject();
        v55 = OUTLINED_FUNCTION_39(v54, v81);
        v55[8] = v8;
        v55[9] = v84;
        v55[10] = v78;
        v55[11] = v79;
        v89 = sub_1C9E26200;
        v90 = v55;
        uint64_t v85 = MEMORY[0x1E4F143A8];
        uint64_t v86 = 1107296256;
        v87 = sub_1C9E22D44;
        v88 = &block_descriptor;
        v56 = _Block_copy(&v85);
        swift_retain();
        id v57 = v8;
        id v58 = v84;
        sub_1C9E2621C(v78);
        id v59 = v77;
        id v60 = v53;
        swift_retain();
        sub_1C9E42748();
        uint64_t v91 = MEMORY[0x1E4FBC860];
        sub_1C9E2622C();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
        sub_1C9E2627C();
        OUTLINED_FUNCTION_40();
        sub_1C9E42C88();
        MEMORY[0x1CB790880](v53, v16, v12, v56);
        _Block_release(v56);
        swift_release();

        goto LABEL_20;
      }
      swift_release();
    }
    id v65 = v8;
    v66 = (void *)sub_1C9E426E8();
    os_log_type_t v67 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_10_0(v67))
    {
      OUTLINED_FUNCTION_6_0();
      uint64_t v85 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_24(4.8149e-34);
      id v68 = objc_msgSend(v65, sel_debugDescription);
      uint64_t v69 = sub_1C9E42898();
      unint64_t v71 = v70;

      uint64_t v72 = sub_1C9E1F9C8(v69, v71, &v85);
      OUTLINED_FUNCTION_7_0(v72);
      OUTLINED_FUNCTION_31();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_0(&dword_1C9E1B000, v73, v74, "Could not find a RequestProcessor for this command: %s");
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
  }
  else
  {
    id v34 = v8;
    v35 = sub_1C9E426E8();
    os_log_type_t v36 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_17(v36))
    {
      id v37 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      uint64_t v80 = v2;
      uint64_t v85 = OUTLINED_FUNCTION_4_0();
      *id v37 = 136315138;
      id v38 = v4;
      id v39 = objc_msgSend(v34, sel_debugDescription);
      uint64_t v40 = sub_1C9E42898();
      unint64_t v42 = v41;

      os_log_type_t v4 = v38;
      uint64_t v43 = sub_1C9E1F9C8(v40, v42, &v85);
      OUTLINED_FUNCTION_7_0(v43);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23(&dword_1C9E1B000, v35, v44, "Could not find a refId on this command: %s");
      OUTLINED_FUNCTION_18();
      uint64_t v2 = v80;
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    uint64_t v63 = type metadata accessor for CandidateRequestAwareBridgeBase();
    uint64_t WitnessTable = swift_getWitnessTable();
    Bridge.defaultHandle(_:executionContextInfo:reply:)(v34, (uint64_t)v84, v4, v2, v63, WitnessTable);
  }
LABEL_29:
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E22D48(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4)
{
  OUTLINED_FUNCTION_11_0();
  sub_1C9E22550();
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = type metadata accessor for CandidateRequestAwareBridgeBase();
    uint64_t WitnessTable = swift_getWitnessTable();
    Bridge.defaultHandle(_:executionContextInfo:reply:)(a1, a2, a3, a4, v9, WitnessTable);
  }
}

void sub_1C9E22DFC()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v12);
  uint64_t v27 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_4();
  uint64_t v18 = v17 - v16;
  uint64_t v26 = *(void *)(v9 + 88);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v5;
  v19[3] = v25;
  v19[4] = v24;
  v19[5] = v7;
  v19[6] = v11;
  v19[7] = v0;
  uint64_t v28[4] = sub_1C9E26440;
  v28[5] = v19;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 1107296256;
  v28[2] = sub_1C9E22D44;
  v28[3] = &block_descriptor_12;
  uint64_t v20 = _Block_copy(v28);
  swift_retain();
  id v21 = v11;
  swift_retain();
  sub_1C9E42748();
  sub_1C9E2622C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
  sub_1C9E2627C();
  OUTLINED_FUNCTION_22();
  sub_1C9E42C88();
  MEMORY[0x1CB790880](v26, v18, v1, v20);
  _Block_release(v20);
  uint64_t v22 = OUTLINED_FUNCTION_30();
  v23(v22);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v27);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1C9E22FF0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1C9E23224(void *a1)
{
  uint64_t v2 = sub_1C9E2C470(a1);
  id v3 = a1;
  swift_retain_n();
  id v4 = v3;
  uint64_t v5 = sub_1C9E426E8();
  os_log_type_t v6 = sub_1C9E42B18();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = OUTLINED_FUNCTION_28();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_27();
    v46[0] = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)uint64_t v7 = 138412546;
    id v9 = v4;
    sub_1C9E42C58();
    *uint64_t v8 = v4;

    *(_WORD *)(v7 + 12) = 2080;
    unint64_t v10 = 0x80000001C9E446F0;
    uint64_t v11 = 0xD000000000000014;
    switch(*(unsigned char *)(v2 + 16))
    {
      case 1:
        break;
      case 2:
        uint64_t v11 = 0xD000000000000015;
        uint64_t v12 = "activeRequestFinisher";
        goto LABEL_8;
      case 3:
        uint64_t v11 = 0xD000000000000017;
        uint64_t v12 = "candidateRequestStarter";
        goto LABEL_8;
      case 4:
        uint64_t v11 = 0xD000000000000018;
        uint64_t v12 = "candidateRequestFinisher";
LABEL_8:
        unint64_t v10 = (unint64_t)(v12 - 32) | 0x8000000000000000;
        break;
      case 5:
        unint64_t v10 = 0xEF72656873696E69;
        uint64_t v11 = 0x4674736575716572;
        break;
      default:
        unint64_t v10 = 0xE700000000000000;
        uint64_t v11 = 0x636972656E6567;
        break;
    }
    sub_1C9E1F9C8(v11, v10, v46);
    OUTLINED_FUNCTION_35();
    sub_1C9E42C58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v5, v6, "MessageHandlerType for %@ is: %s", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
    swift_release_n();
  }
  switch(*(unsigned char *)(v2 + 16))
  {
    case 1:
      OUTLINED_FUNCTION_12();
      sub_1C9E23A88();
      goto LABEL_27;
    case 2:
      OUTLINED_FUNCTION_12();
      sub_1C9E2461C();
      goto LABEL_27;
    case 3:
      OUTLINED_FUNCTION_12();
      sub_1C9E25034();
      goto LABEL_27;
    case 4:
      uint64_t v28 = (void *)OUTLINED_FUNCTION_12();
      char v27 = sub_1C9E256B4(v28);
      goto LABEL_27;
    case 5:
      id v29 = (void *)OUTLINED_FUNCTION_12();
      char v27 = sub_1C9E25A24(v29);
LABEL_27:
      char v26 = v27;
      goto LABEL_28;
    default:
      uint64_t v13 = sub_1C9E219EC();
      if (!v13) {
        goto LABEL_20;
      }
      uint64_t v14 = v13;
      uint64_t v16 = *(void *)(v13 + 64);
      uint64_t v15 = *(void *)(v13 + 72);
      sub_1C9E42808();
      if (v16 == sub_1C9E425A8() && v15 == v17)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v19 = sub_1C9E42E48();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0 && ((*(uint64_t (**)(id))(*(void *)v14 + 224))(v4) & 1) == 0)
        {
          swift_release();
LABEL_20:
          uint64_t v20 = sub_1C9E425A8();
          uint64_t v22 = v21;
          uint64_t v23 = sub_1C9E21AD8();
          uint64_t v24 = sub_1C9E21F20(v20, v22, v23);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v24)
          {
            uint64_t v31 = sub_1C9E21AD8();
            id v32 = v4;
            sub_1C9E2389C(v31, v32);
            uint64_t v34 = v33;
            swift_bridgeObjectRelease();
            if (v34)
            {
              sub_1C9E25B84();
              char v26 = v35;
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              id v36 = v32;
              id v37 = sub_1C9E426E8();
              os_log_type_t v38 = sub_1C9E42B28();
              if (os_log_type_enabled(v37, v38))
              {
                uint64_t v39 = OUTLINED_FUNCTION_28();
                v46[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v39 = 136315394;
                id v40 = objc_msgSend(v36, sel_debugDescription);
                uint64_t v41 = sub_1C9E42898();
                unint64_t v43 = v42;

                sub_1C9E1F9C8(v41, v43, v46);
                sub_1C9E42C58();

                swift_bridgeObjectRelease();
                *(_WORD *)(v39 + 12) = 2080;
                uint64_t v44 = sub_1C9E425A8();
                sub_1C9E1F9C8(v44, v45, v46);
                sub_1C9E42C58();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_1C9E1B000, v37, v38, "Could not find a RequestProcessor for message: %s with requestId: %s", (uint8_t *)v39, 0x16u);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_5();
                OUTLINED_FUNCTION_5();
              }
              else
              {
              }
              swift_release();

              char v26 = 0;
            }
            return v26 & 1;
          }
        }
      }
      sub_1C9E25B84();
      char v26 = v25;
      swift_release();
LABEL_28:
      swift_release();
      return v26 & 1;
  }
}

uint64_t sub_1C9E2389C(uint64_t a1, void *a2)
{
  sub_1C9E396EC(v16);
  uint64_t v3 = v16[0];
  uint64_t v17 = v16[1];
  int64_t v4 = v16[3];
  unint64_t v5 = v16[4];
  int64_t v6 = (unint64_t)(v16[2] + 64) >> 6;
  uint64_t result = sub_1C9E42808();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = *(void *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *(uint64_t (**)(void *))(**(void **)(*(void *)(v3 + 56) + 8 * v9) + 224);
    sub_1C9E42808();
    swift_retain();
    if (v15(a2))
    {

      swift_release();
      return v14;
    }
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v10 >= v6) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v17 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v17 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v17 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v17 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              goto LABEL_23;
            }
            unint64_t v11 = *(void *)(v17 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v17 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_23:

              swift_release();
              return 0;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v4 = v12;
  }
  __break(1u);
  return result;
}

void sub_1C9E23A88()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  int64_t v4 = v3;
  uint64_t v5 = sub_1C9E42788();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v91 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v87 - v10;
  uint64_t v95 = sub_1C9E42718();
  OUTLINED_FUNCTION_0_1();
  uint64_t v89 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_2_0();
  uint64_t v88 = v14;
  uint64_t v97 = sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v96 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_2_0();
  uint64_t v98 = v17;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  uint64_t v103 = v19;
  v104 = v18;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_2_0();
  uint64_t v101 = v20;
  uint64_t v102 = sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  uint64_t v22 = v21;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_2_0();
  uint64_t v99 = v24;
  uint64_t v108 = v0;
  uint64_t v25 = v0 + qword_1EBCB3C20;
  id v26 = v4;
  uint64_t v107 = v25;
  char v27 = sub_1C9E426E8();
  os_log_type_t v28 = sub_1C9E42B18();
  BOOL v29 = os_log_type_enabled(v27, v28);
  v30 = &loc_1C9E43000;
  uint64_t v105 = v2;
  uint64_t v90 = v5;
  uint64_t v93 = v7;
  v92 = v11;
  uint64_t v100 = v22;
  if (v29)
  {
    uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    *(void *)&long long v109 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)uint64_t v31 = 136315138;
    LOBYTE(v30) = (_BYTE)v31 + 12;
    swift_getObjectType();
    uint64_t v32 = sub_1C9E42F48();
    uint64_t v34 = sub_1C9E1F9C8(v32, v33, (uint64_t *)&v109);
    OUTLINED_FUNCTION_7_0(v34);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v27, v28, "Starting active request with message: %s", v31, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  uint64_t v35 = sub_1C9E425A8();
  unint64_t v37 = v36;
  uint64_t v38 = sub_1C9E21AD8();
  sub_1C9E42808();
  uint64_t v39 = sub_1C9E21F20(v35, v37, v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v106 = v26;
  if (v39)
  {
    swift_bridgeObjectRetain_n();
    id v40 = sub_1C9E426E8();
    os_log_type_t v41 = sub_1C9E42B18();
    BOOL v42 = OUTLINED_FUNCTION_17(v41);
    uint64_t v94 = v35;
    if (v42)
    {
      unint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(void *)&long long v109 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)unint64_t v43 = 136315138;
      sub_1C9E42808();
      uint64_t v44 = sub_1C9E1F9C8(v35, v37, (uint64_t *)&v109);
      OUTLINED_FUNCTION_7_0(v44);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v40, (os_log_type_t)v30, "Found an existing candidate RequestProcessor for requestId: %s", v43, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v48 = *(void *)(v39 + 88);
    v111 = sub_1C9E26F08;
    uint64_t v112 = v39;
    *(void *)&long long v109 = MEMORY[0x1E4F143A8];
    *((void *)&v109 + 1) = 1107296256;
    *(void *)&long long v110 = sub_1C9E22D44;
    *((void *)&v110 + 1) = &block_descriptor_35;
    uint64_t v49 = _Block_copy(&v109);
    swift_retain();
    uint64_t v50 = v99;
    sub_1C9E42748();
    id v113 = (id)MEMORY[0x1E4FBC860];
    sub_1C9E2622C();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
    sub_1C9E2627C();
    uint64_t v51 = v101;
    sub_1C9E42C88();
    MEMORY[0x1CB790880](v48, v50, v51, v49);
    _Block_release(v49);
    OUTLINED_FUNCTION_8_0();
    v52();
    OUTLINED_FUNCTION_8_0();
    v53();
    swift_release();
    OUTLINED_FUNCTION_16();
    sub_1C9E26B04(v94, v37);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    v54 = &loc_1C9E43000;
  }
  else
  {
    id v113 = v26;
    sub_1C9E425B8();
    v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3928);
    if (swift_dynamicCast())
    {
      __swift_project_boxed_opaque_existential_1(&v109, *((uint64_t *)&v110 + 1));
      uint64_t v45 = sub_1C9E42618();
      uint64_t v47 = v46;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v109);
    }
    else
    {
      v111 = 0;
      long long v109 = 0u;
      long long v110 = 0u;
      sub_1C9E26CA0((uint64_t)&v109);
      uint64_t v45 = sub_1C9E425A8();
      uint64_t v47 = v68;
    }
    uint64_t v69 = sub_1C9E425D8();
    uint64_t v71 = v70;
    uint64_t v72 = v98;
    sub_1C9E425C8();
    OUTLINED_FUNCTION_11_0();
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v73 + 472))(v35, v37, v69, v71, v72, 0, v45, v47);
    OUTLINED_FUNCTION_8_0();
    v74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v54 = (void *)&loc_1C9E43000;
  }
  uint64_t v55 = sub_1C9E219EC();
  if (v55)
  {
    v56 = (void *)v55;
    if (*(unsigned char *)(v108 + qword_1EBCB37A0) != 1) {
      goto LABEL_21;
    }
    swift_retain_n();
    id v57 = sub_1C9E426E8();
    os_log_type_t v58 = sub_1C9E42B18();
    if (os_log_type_enabled(v57, v58))
    {
      id v59 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(void *)&long long v109 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)id v59 = v54[242];
      uint64_t v60 = v88;
      v104 = v56;
      sub_1C9E21880(v88);
      uint64_t v61 = sub_1C9E428D8();
      uint64_t v63 = sub_1C9E1F9C8(v61, v62, (uint64_t *)&v109);
      OUTLINED_FUNCTION_7_0(v63);
      sub_1C9E42C58();
      v56 = v104;
      swift_release_n();
      uint64_t v64 = v60;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v57, v58, "Will wait up to %s for the current active request to finish", v59, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      uint64_t v65 = v95;
      uint64_t v66 = v90;
      uint64_t v67 = v89;
    }
    else
    {
      swift_release_n();

      uint64_t v66 = v90;
      uint64_t v65 = v95;
      uint64_t v67 = v89;
      uint64_t v64 = v88;
    }
    v104 = (void *)v56[11];
    v75 = v91;
    sub_1C9E42778();
    sub_1C9E21880(v64);
    v76 = v92;
    MEMORY[0x1CB790470](v75, v64);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v64, v65);
    v77 = *(void (**)(char *, uint64_t))(v93 + 8);
    v77(v75, v66);
    sub_1C9E42B68();
    v77(v76, v66);
    if (sub_1C9E42728())
    {
      swift_retain_n();
      uint64_t v78 = (void *)sub_1C9E426E8();
      os_log_type_t v79 = sub_1C9E42B28();
      if (OUTLINED_FUNCTION_25(v79))
      {
        uint64_t v80 = (_DWORD *)OUTLINED_FUNCTION_6_0();
        *(void *)&long long v109 = OUTLINED_FUNCTION_4_0();
        *uint64_t v80 = 136315138;
        uint64_t v81 = v56[8];
        unint64_t v82 = v56[9];
        sub_1C9E42808();
        uint64_t v83 = sub_1C9E1F9C8(v81, v82, (uint64_t *)&v109);
        OUTLINED_FUNCTION_7_0(v83);
        sub_1C9E42C58();
        swift_release_n();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_38(&dword_1C9E1B000, v84, v85, "Timed out waiting for ActiveRequestProcessor with requestId: %s to finish processing.");
        OUTLINED_FUNCTION_18();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
        swift_release();
      }
      else
      {
        swift_release_n();
      }
    }
    else
    {
LABEL_21:
      swift_release();
    }
  }
  uint64_t v86 = swift_retain();
  sub_1C9E21A24(v86);
  sub_1C9E25B84();
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E2461C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_2_0();
  sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_2_0();
  id v6 = v3;
  uint64_t v7 = (void *)sub_1C9E426E8();
  os_log_type_t v8 = sub_1C9E42B18();
  if (OUTLINED_FUNCTION_25(v8))
  {
    uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_6_0();
    v46[0] = OUTLINED_FUNCTION_4_0();
    *uint64_t v9 = 136315138;
    swift_getObjectType();
    uint64_t v10 = sub_1C9E42F48();
    uint64_t v12 = sub_1C9E1F9C8(v10, v11, v46);
    OUTLINED_FUNCTION_34(v12);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_38(&dword_1C9E1B000, v13, v14, "Ending active request with message: %s");
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  uint64_t v15 = sub_1C9E219EC();
  if (!v15)
  {
LABEL_11:
    id v20 = v6;
    uint64_t v21 = sub_1C9E426E8();
    os_log_type_t v22 = sub_1C9E42B28();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      v46[0] = OUTLINED_FUNCTION_4_0();
      *uint64_t v23 = 136315138;
      uint64_t v24 = sub_1C9E425A8();
      uint64_t v26 = sub_1C9E1F9C8(v24, v25, v46);
      OUTLINED_FUNCTION_34(v26);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23(&dword_1C9E1B000, v21, v27, "Active RequestProcessor for requestId: %s could not be found");
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  if (sub_1C9E425A8() == *(void *)(v15 + 64) && v17 == *(void *)(v16 + 72))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      swift_release();
      goto LABEL_11;
    }
  }
  sub_1C9E25B84();
  uint64_t v28 = sub_1C9E425A8();
  uint64_t v30 = v29;
  if (*(unsigned char *)(v1 + qword_1EBCB37A0) == 1)
  {
    uint64_t v31 = v28;
    uint64_t v32 = (void *)swift_allocObject();
    v32[2] = v31;
    v32[3] = v30;
    v32[4] = v1;
    v32[5] = v6;
    v46[4] = (uint64_t)sub_1C9E26EFC;
    v46[5] = (uint64_t)v32;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 1107296256;
    uint64_t v46[2] = (uint64_t)sub_1C9E22D44;
    v46[3] = (uint64_t)&block_descriptor_32;
    unint64_t v33 = _Block_copy(v46);
    id v34 = v6;
    swift_retain();
    sub_1C9E42748();
    uint64_t v47 = MEMORY[0x1E4FBC860];
    sub_1C9E2622C();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
    sub_1C9E2627C();
    sub_1C9E42C88();
    sub_1C9E42B78();
    _Block_release(v33);
    OUTLINED_FUNCTION_8_0();
    v35();
    OUTLINED_FUNCTION_8_0();
    v36();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v37 = v6;
    swift_retain_n();
    id v38 = v37;
    uint64_t v39 = sub_1C9E426E8();
    os_log_type_t v40 = sub_1C9E42B18();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = OUTLINED_FUNCTION_28();
      v46[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315394;
      uint64_t v42 = sub_1C9E425A8();
      uint64_t v47 = sub_1C9E1F9C8(v42, v43, v46);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      uint64_t v44 = *(void *)(v1 + 16);
      unint64_t v45 = *(void *)(v1 + 24);
      sub_1C9E42808();
      uint64_t v47 = sub_1C9E1F9C8(v44, v45, v46);
      sub_1C9E42C58();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v39, v40, "Deiniting RequestProcessor with requestId %s for bridge %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_release_n();
    }
    sub_1C9E21A24(0);
  }
  swift_release();
LABEL_23:
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E24C40(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_1C9E219EC();
  if (!v8)
  {
LABEL_7:
    swift_bridgeObjectRetain_n();
    oslog = sub_1C9E426E8();
    os_log_type_t v13 = sub_1C9E42B18();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v27 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_1C9E42808();
      sub_1C9E1F9C8(a1, a2, &v27);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, oslog, v13, "RequestProcessor with requestId:%s has already been replaced or deinited", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB791240](v15, -1, -1);
      MEMORY[0x1CB791240](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    return;
  }
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v9 = *(void *)(v8 + 72);
  sub_1C9E42808();
  swift_release();
  if (v10 == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v16 = a4;
  swift_retain_n();
  id v17 = v16;
  uint64_t v18 = sub_1C9E426E8();
  os_log_type_t v19 = sub_1C9E42B18();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v27 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v22 = sub_1C9E425A8();
    sub_1C9E1F9C8(v22, v23, &v27);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v24 = *(void *)(a3 + 16);
    unint64_t v25 = *(void *)(a3 + 24);
    sub_1C9E42808();
    sub_1C9E1F9C8(v24, v25, &v27);
    sub_1C9E42C58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v18, v19, "Deiniting RequestProcessor with requestId %s for bridge %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1CB791240](v21, -1, -1);
    MEMORY[0x1CB791240](v20, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  sub_1C9E21A24(0);
}

uint64_t sub_1C9E24FF0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C9E25034()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_2_0();
  uint64_t v34 = v5;
  id v6 = v3;
  uint64_t v7 = sub_1C9E426E8();
  os_log_type_t v8 = sub_1C9E42B18();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    *(void *)&long long v35 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getObjectType();
    uint64_t v10 = sub_1C9E42F48();
    sub_1C9E1F9C8(v10, v11, (uint64_t *)&v35);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v7, v8, "Starting candidate request with message: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  uint64_t v12 = sub_1C9E425A8();
  unint64_t v14 = v13;
  uint64_t v15 = sub_1C9E21AD8();
  sub_1C9E42808();
  uint64_t v16 = sub_1C9E21F20(v12, v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    id v17 = v6;
    sub_1C9E42808();
    uint64_t v18 = sub_1C9E426E8();
    os_log_type_t v19 = sub_1C9E42B28();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = OUTLINED_FUNCTION_28();
      unint64_t v33 = (void *)OUTLINED_FUNCTION_27();
      *(void *)&long long v35 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v20 = 138412546;
      uint64_t v21 = v12;
      id v22 = v17;
      sub_1C9E42C58();
      *unint64_t v33 = v17;

      *(_WORD *)(v20 + 12) = 2080;
      sub_1C9E42808();
      sub_1C9E1F9C8(v21, v14, (uint64_t *)&v35);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v18, v19, "Not creating a CandidateRequestProcessor for message: %@ because there is already a candidate request started with requestId: %s", (uint8_t *)v20, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    sub_1C9E25B84();
  }
  else
  {
    sub_1C9E425B8();
    v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3928);
    uint64_t v23 = v12;
    if (swift_dynamicCast())
    {
      __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
      uint64_t v24 = sub_1C9E42618();
      uint64_t v26 = v25;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v35);
    }
    else
    {
      uint64_t v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      sub_1C9E26CA0((uint64_t)&v35);
      uint64_t v24 = sub_1C9E425A8();
      uint64_t v26 = v27;
    }
    uint64_t v28 = sub_1C9E425D8();
    uint64_t v30 = v29;
    sub_1C9E425C8();
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v1 + 472))(v23, v14, v28, v30, v34, 1, v24, v26);
    OUTLINED_FUNCTION_8_0();
    v31();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16();
    uint64_t v32 = swift_retain();
    sub_1C9E26C10(v32, v23, v14);
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_1C9E25B84();
  }
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1C9E256B4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = sub_1C9E426E8();
  os_log_type_t v4 = sub_1C9E42B18();
  if (OUTLINED_FUNCTION_25(v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    v27[0] = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getObjectType();
    uint64_t v6 = sub_1C9E42F48();
    sub_1C9E1F9C8(v6, v7, v27);
    OUTLINED_FUNCTION_35();
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v3, v1, "Ending candidate request with message: %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  uint64_t v8 = sub_1C9E425A8();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1C9E21AD8();
  uint64_t v12 = sub_1C9E21F20(v8, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
    sub_1C9E25B84();
    char v14 = v13;
    uint64_t v15 = sub_1C9E425A8();
    uint64_t v17 = v16;
    OUTLINED_FUNCTION_16();
    sub_1C9E26B04(v15, v17);
    swift_endAccess();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    id v18 = v2;
    os_log_type_t v19 = sub_1C9E426E8();
    os_log_type_t v20 = sub_1C9E42B28();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = OUTLINED_FUNCTION_28();
      id v22 = (void *)OUTLINED_FUNCTION_27();
      v27[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v21 = 138412546;
      uint64_t v28 = (uint64_t)v18;
      id v23 = v18;
      sub_1C9E42C58();
      *id v22 = v18;

      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v24 = sub_1C9E425A8();
      uint64_t v28 = sub_1C9E1F9C8(v24, v25, v27);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v19, v20, "Received finisher message: %@ while there is no CandidateRequestProcessor for requestId: %s", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_5();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    char v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_1C9E25A24(void *a1)
{
  sub_1C9E2461C();
  if (v2)
  {
    uint64_t v3 = sub_1C9E426E8();
    os_log_type_t v4 = sub_1C9E42B18();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "Ended an active request";
      unint64_t v7 = v3;
      os_log_type_t v8 = v4;
LABEL_7:
      _os_log_impl(&dword_1C9E1B000, v7, v8, v6, v5, 2u);
      uint64_t v12 = 1;
LABEL_11:
      OUTLINED_FUNCTION_5();
      goto LABEL_13;
    }
  }
  else
  {
    char v9 = sub_1C9E256B4(a1);
    uint64_t v3 = sub_1C9E426E8();
    os_log_type_t v10 = sub_1C9E42B18();
    BOOL v11 = os_log_type_enabled(v3, v10);
    if ((v9 & 1) == 0)
    {
      if (!v11)
      {
        uint64_t v12 = 0;
        goto LABEL_13;
      }
      char v13 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)char v13 = 0;
      _os_log_impl(&dword_1C9E1B000, v3, v10, "Could not find a RequestProcessor to end the request", v13, 2u);
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    if (v11)
    {
      uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)uint64_t v5 = 0;
      os_log_type_t v8 = v10;
      uint64_t v6 = "Ended a candidate request";
      unint64_t v7 = v3;
      goto LABEL_7;
    }
  }
  uint64_t v12 = 1;
LABEL_13:

  return v12;
}

void sub_1C9E25B84()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  uint64_t v8 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_26();
  if ((*(uint64_t (**)(void))(*(void *)v7 + 120))())
  {
    id v11 = v3;
    uint64_t v12 = (void *)sub_1C9E426E8();
    os_log_type_t v13 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_10_0(v13))
    {
      OUTLINED_FUNCTION_6_0();
      char v14 = (void *)OUTLINED_FUNCTION_27();
      id v15 = OUTLINED_FUNCTION_19(5.7779e-34);
      OUTLINED_FUNCTION_31();
      *char v14 = v11;

      id v18 = "Message %@ is not registered properly";
LABEL_8:
      OUTLINED_FUNCTION_9_0(&dword_1C9E1B000, v16, v17, v18);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (((*(uint64_t (**)(void *, uint64_t))(*(void *)v7 + 128))(v3, v5) & 1) == 0)
  {
    id v11 = v3;
    uint64_t v12 = (void *)sub_1C9E426E8();
    os_log_type_t v24 = sub_1C9E42B18();
    if (OUTLINED_FUNCTION_10_0(v24))
    {
      OUTLINED_FUNCTION_6_0();
      unint64_t v25 = (void *)OUTLINED_FUNCTION_27();
      id v26 = OUTLINED_FUNCTION_19(5.7779e-34);
      OUTLINED_FUNCTION_31();
      *unint64_t v25 = v11;

      id v18 = "RequestProcessor cannot handle message: %@";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v27 = *(void *)(v5 + 88);
  os_log_type_t v19 = (void *)swift_allocObject();
  v19[2] = v7;
  v19[3] = v5;
  v19[4] = v3;
  uint64_t v28[4] = sub_1C9E26AB8;
  v28[5] = v19;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 1107296256;
  v28[2] = sub_1C9E22D44;
  v28[3] = &block_descriptor_26;
  os_log_type_t v20 = _Block_copy(v28);
  swift_retain();
  swift_retain();
  id v21 = v3;
  sub_1C9E42748();
  sub_1C9E2622C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
  sub_1C9E2627C();
  OUTLINED_FUNCTION_22();
  sub_1C9E42C88();
  MEMORY[0x1CB790880](v27, v1, v0, v20);
  _Block_release(v20);
  uint64_t v22 = OUTLINED_FUNCTION_30();
  v23(v22);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
  swift_release();
LABEL_11:
  OUTLINED_FUNCTION_3_0();
}

void CandidateRequestAwareBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
}

void CandidateRequestAwareBridgeBase.init(_:_:_:_:_:_:)()
{
}

uint64_t sub_1C9E25F68()
{
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0();
  v0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t CandidateRequestAwareBridgeBase.deinit()
{
  uint64_t v0 = MessageDispatchingBridgeBase.deinit();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0();
  v1();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CandidateRequestAwareBridgeBase.__deallocating_deinit()
{
  uint64_t v0 = CandidateRequestAwareBridgeBase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9E260BC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 464))();
}

uint64_t sub_1C9E26108()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 472))();
}

uint64_t static RequestProcessorCreationError.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1C9E42E48();
  }
}

unint64_t sub_1C9E26198()
{
  unint64_t result = qword_1EA5C9D28;
  if (!qword_1EA5C9D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C9D28);
  }
  return result;
}

uint64_t type metadata accessor for CandidateRequestAwareBridgeBase()
{
  return __swift_instantiateGenericMetadata();
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

uint64_t sub_1C9E2621C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1C9E2622C()
{
  unint64_t result = qword_1EBCB3420;
  if (!qword_1EBCB3420)
  {
    sub_1C9E42738();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3420);
  }
  return result;
}

unint64_t sub_1C9E2627C()
{
  unint64_t result = qword_1EBCB3440;
  if (!qword_1EBCB3440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EBCB3430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3440);
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

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();

  if (*(void *)(v0 + 80)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1C9E2637C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 56));
  v5(v1, v2, v3, v4);
  return swift_release();
}

uint64_t sub_1C9E263F8()
{
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C9E26440()
{
  return sub_1C9E22FF0(*(uint64_t (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1C9E26450@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9E21880(a1);
}

void *sub_1C9E2647C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1C9E26488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E219EC();
  *a1 = result;
  return result;
}

uint64_t sub_1C9E264BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E21AD8();
  *a1 = result;
  return result;
}

uint64_t sub_1C9E264F4()
{
  uint64_t result = sub_1C9E42718();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CandidateRequestAwareBridgeBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CandidateRequestAwareBridgeBase);
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.registerMessageHandler<A, B>(_:messageHandlerType:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:rootRequestId:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.tryToDispatchCommandToRequestProcessor<A, B>(_:executionContextInfo:reply:handler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.dispatchCommandToRequestProcessor<A, B>(_:executionContextInfo:reply:handler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.dispatchAsync<A, B>(message:toRequestProcessor:usingHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

void *initializeBufferWithCopyOfBuffer for RequestProcessorCreationError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1C9E42808();
  return a1;
}

uint64_t destroy for RequestProcessorCreationError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RequestProcessorCreationError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_1C9E42808();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RequestProcessorCreationError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestProcessorCreationError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for RequestProcessorCreationError(uint64_t result, int a2, int a3)
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

uint64_t sub_1C9E269F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for RequestProcessorCreationError()
{
  return &type metadata for RequestProcessorCreationError;
}

uint64_t dispatch thunk of RequestProcessorFactory.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t dispatch thunk of RequestProcessorFactory.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 16))(a1, a2);
}

uint64_t sub_1C9E26A70()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C9E26AB8()
{
  return (*(uint64_t (**)(void, void))(**(void **)(v0 + 16) + 104))(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C9E26B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_1C9E42808();
  unint64_t v6 = sub_1C9E291D4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9D30);
  sub_1C9E42DB8();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  type metadata accessor for RequestProcessorBase();
  sub_1C9E42DC8();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C9E26C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1C9E26D44(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E26CA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3930);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
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

uint64_t sub_1C9E26D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1C9E291D4(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9D30);
  if ((sub_1C9E42DB8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1C9E291D4(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_1C9E42E68();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  id v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1C9E26E6C(v11, a2, a3, a1, v15);
    return sub_1C9E42808();
  }
  return result;
}

unint64_t sub_1C9E26E6C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

uint64_t sub_1C9E26EB4()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C9E26EFC()
{
  sub_1C9E24C40(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1C9E26F08()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_10_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_17(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_19(float a1)
{
  float *v1 = a1;
  *(void *)(v3 - 128) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_1C9E42768();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v0 - 136;
}

void OUTLINED_FUNCTION_23(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_24(float a1)
{
  float *v1 = a1;
}

BOOL OUTLINED_FUNCTION_25(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_37(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_38(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void *OUTLINED_FUNCTION_39@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  result[2] = v2;
  result[3] = a2;
  uint64_t v6 = *(void *)(v5 - 200);
  uint64_t v7 = *(void *)(v5 - 192);
  result[4] = v4;
  result[5] = v6;
  result[6] = v7;
  result[7] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0 - 96;
}

uint64_t ComponentIdGenerator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ComponentIdGenerator.init()()
{
  return v0;
}

void sub_1C9E2737C(uint64_t a1)
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_1C9E424F8();
  id v4 = objc_msgSend(v2, sel_derivedIdentifierForComponent_fromSourceIdentifier_, a1, v3);

  sub_1C9E42508();
}

uint64_t ComponentIdGenerator.deinit()
{
  return v0;
}

uint64_t ComponentIdGenerator.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ComponentIdGenerator()
{
  return self;
}

uint64_t method lookup function for ComponentIdGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ComponentIdGenerator);
}

uint64_t dispatch thunk of ComponentIdGenerator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of ComponentIdGenerator.derivedIdentifier(for:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

id sub_1C9E274A0()
{
  OUTLINED_FUNCTION_0_2();
  id v3 = objc_allocWithZone(v1);
  id v4 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_0();
  id v8 = [v6 v7];

  return v8;
}

id sub_1C9E27544()
{
  OUTLINED_FUNCTION_0_2();
  id v3 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1C9E42888();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for EmptyBridgeConnectionListener();
  OUTLINED_FUNCTION_1_0();
  id v7 = objc_msgSendSuper2(v5, v6, v1, v9);

  return v7;
}

void sub_1C9E2771C()
{
}

id sub_1C9E2775C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmptyBridgeConnectionListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmptyBridgeConnectionListener()
{
  return self;
}

uint64_t sub_1C9E277B4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IFFlowFeatureFlag(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IFFlowFeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9E2797CLL);
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

uint64_t sub_1C9E279A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C9E279AC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IFFlowFeatureFlag()
{
  return &type metadata for IFFlowFeatureFlag;
}

unint64_t sub_1C9E279CC()
{
  unint64_t result = qword_1EA5C9D38;
  if (!qword_1EA5C9D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C9D38);
  }
  return result;
}

const char *sub_1C9E27A18()
{
  return "Siri";
}

const char *sub_1C9E27A2C(char a1)
{
  if (a1) {
    return "reuseEagerChildRequestForIF";
  }
  else {
    return "siri_ifflow";
  }
}

BOOL sub_1C9E27A58(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1C9E27A68()
{
  return sub_1C9E42EE8();
}

uint64_t sub_1C9E27A90()
{
  return sub_1C9E42EF8();
}

BOOL sub_1C9E27AD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1C9E27A58(*a1, *a2);
}

uint64_t sub_1C9E27AE4()
{
  return sub_1C9E27A90();
}

uint64_t sub_1C9E27AEC()
{
  return sub_1C9E27A68();
}

uint64_t sub_1C9E27AF4()
{
  return sub_1C9E42EF8();
}

const char *sub_1C9E27B38()
{
  return sub_1C9E27A2C(*v0);
}

uint64_t InsightRequestSummaryLogger.init()()
{
  sub_1C9E29588(0, (unint64_t *)&qword_1EBCB3550);
  sub_1C9E42C28();
  return sub_1C9E42708();
}

uint64_t InsightRequestSummaryLogger.emitDebug(_:)(uint64_t (*a1)(void), uint64_t a2)
{
  return sub_1C9E280EC(a1, a2, MEMORY[0x1E4FBD390]);
}

void *static InsightRequestSummaryLogger.constructLogJsonString(_:)(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1C9E428C8();
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_4();
  int v3 = (void *)sub_1C9E427E8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_1C9E42808();
    uint64_t v36 = a1;
    uint64_t v5 = (uint64_t *)(a1 + 56);
    while (1)
    {
      uint64_t v7 = *(v5 - 3);
      uint64_t v6 = *(v5 - 2);
      uint64_t v8 = *v5;
      uint64_t v37 = *(v5 - 1);
      sub_1C9E42808();
      sub_1C9E42808();
      swift_isUniquelyReferenced_nonNull_native();
      id v38 = v3;
      unint64_t v9 = sub_1C9E291D4(v7, v6);
      if (__OFADD__(v3[2], (v10 & 1) == 0))
      {
        __break(1u);
LABEL_20:
        __break(1u);
      }
      unint64_t v11 = v9;
      char v12 = v10;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3510);
      if (sub_1C9E42DB8())
      {
        unint64_t v13 = sub_1C9E291D4(v7, v6);
        if ((v12 & 1) != (v14 & 1))
        {
          unint64_t result = (void *)sub_1C9E42E68();
          __break(1u);
          return result;
        }
        unint64_t v11 = v13;
      }
      int v3 = v38;
      if (v12)
      {
        id v15 = (void *)(v38[7] + 16 * v11);
        swift_bridgeObjectRelease();
        *id v15 = v37;
        v15[1] = v8;
      }
      else
      {
        v38[(v11 >> 6) + 8] |= 1 << v11;
        uint64_t v16 = (uint64_t *)(v3[6] + 16 * v11);
        *uint64_t v16 = v7;
        v16[1] = v6;
        uint64_t v17 = (void *)(v3[7] + 16 * v11);
        *uint64_t v17 = v37;
        v17[1] = v8;
        uint64_t v18 = v3[2];
        BOOL v19 = __OFADD__(v18, 1);
        uint64_t v20 = v18 + 1;
        if (v19) {
          goto LABEL_20;
        }
        v3[2] = v20;
        sub_1C9E42808();
      }
      v5 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v4)
      {
        a1 = v36;
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  id v21 = self;
  sub_1C9E42808();
  uint64_t v22 = (void *)sub_1C9E427B8();
  swift_bridgeObjectRelease();
  id v38 = 0;
  id v23 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v22, 0, &v38);

  os_log_type_t v24 = v38;
  if (v23)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_1C9E424C8();
    unint64_t v27 = v26;

    sub_1C9E428B8();
    uint64_t v28 = sub_1C9E428A8();
    if (v29)
    {
      uint64_t v30 = (void *)v28;
      sub_1C9E295C4(v25, v27);
    }
    else
    {
      id v38 = 0;
      unint64_t v39 = 0xE000000000000000;
      sub_1C9E42CC8();
      sub_1C9E42908();
      MEMORY[0x1CB7909D0](a1, &type metadata for InsightRequestSummaryKey, MEMORY[0x1E4FBB1A0]);
      sub_1C9E42908();
      swift_bridgeObjectRelease();
      sub_1C9E42908();
      sub_1C9E295C4(v25, v27);
      return v38;
    }
  }
  else
  {
    uint64_t v31 = v24;
    uint64_t v32 = (void *)sub_1C9E424B8();

    swift_willThrow();
    id v41 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB38E0);
    sub_1C9E29588(0, &qword_1EA5C9D70);
    swift_dynamicCast();
    swift_bridgeObjectRelease();
    unint64_t v33 = v40;
    id v38 = 0;
    unint64_t v39 = 0xE000000000000000;
    sub_1C9E42CC8();
    sub_1C9E42908();
    id v34 = objc_msgSend(v33, sel_description);
    sub_1C9E42898();

    sub_1C9E42908();
    swift_bridgeObjectRelease();
    sub_1C9E42908();
    MEMORY[0x1CB7909D0](a1, &type metadata for InsightRequestSummaryKey, MEMORY[0x1E4FBB1A0]);
    sub_1C9E42908();
    swift_bridgeObjectRelease();
    sub_1C9E42908();

    uint64_t v30 = v38;
  }
  return v30;
}

uint64_t InsightRequestSummaryLogger.emitError(_:)(uint64_t (*a1)(void), uint64_t a2)
{
  return sub_1C9E280EC(a1, a2, MEMORY[0x1E4FBD380]);
}

uint64_t sub_1C9E280EC(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11 - v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11 - v10, v3, v6);
  swift_retain_n();
  unint64_t v13 = sub_1C9E426E8();
  os_log_type_t v14 = a3();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v21 = v6;
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)id v15 = 136315138;
    uint64_t v16 = a1();
    uint64_t v17 = static InsightRequestSummaryLogger.constructLogJsonString(_:)(v16);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_1C9E1F9C8((uint64_t)v17, v19, &v22);
    sub_1C9E42C58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v13, v14, "%s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v21);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  }
}

uint64_t InsightRequestSummaryLogger.emitMarker(assistantId:sessionId:requestId:component:marker:)()
{
  uint64_t v1 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4();
  uint64_t v7 = v6 - v5;
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_4();
  uint64_t v39 = v12 - v11;
  uint64_t v14 = v13;
  (*(void (**)(void))(v9 + 16))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v7, v0, v1);
  sub_1C9E42808();
  sub_1C9E42808();
  sub_1C9E42808();
  id v15 = sub_1C9E426E8();
  os_log_type_t v16 = sub_1C9E42B48();
  if (os_log_type_enabled(v15, v16))
  {
    os_log_type_t v37 = v16;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    id v38 = v17;
    *(_DWORD *)uint64_t v17 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3B38);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1C9E43B70;
    if (qword_1EBCB3530 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)algn_1EBCB3648;
    *(void *)(v18 + 32) = qword_1EBCB3640;
    *(void *)(v18 + 40) = v19;
    sub_1C9E42808();
    uint64_t v40 = OUTLINED_FUNCTION_5_1();
    uint64_t v45 = v20;
    OUTLINED_FUNCTION_3_1();
    sub_1C9E42908();
    OUTLINED_FUNCTION_3_1();
    *(void *)(v18 + 48) = v40;
    *(void *)(v18 + 56) = v45;
    if (qword_1EBCB3718 != -1) {
      swift_once();
    }
    uint64_t v21 = unk_1EBCB3708;
    *(void *)(v18 + 64) = qword_1EBCB3700;
    *(void *)(v18 + 72) = v21;
    sub_1C9E42808();
    uint64_t v41 = OUTLINED_FUNCTION_5_1();
    uint64_t v46 = v22;
    OUTLINED_FUNCTION_3_1();
    sub_1C9E29B9C((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
    sub_1C9E42E18();
    sub_1C9E42908();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_1();
    *(void *)(v18 + 80) = v41;
    *(void *)(v18 + 88) = v46;
    if (qword_1EBCB36F8 != -1) {
      swift_once();
    }
    uint64_t v23 = unk_1EBCB36F0;
    *(void *)(v18 + 96) = qword_1EBCB36E8;
    *(void *)(v18 + 104) = v23;
    sub_1C9E42808();
    uint64_t v42 = OUTLINED_FUNCTION_5_1();
    uint64_t v47 = v24;
    OUTLINED_FUNCTION_3_1();
    sub_1C9E42908();
    OUTLINED_FUNCTION_3_1();
    *(void *)(v18 + 112) = v42;
    *(void *)(v18 + 120) = v47;
    if (qword_1EBCB3960 != -1) {
      swift_once();
    }
    uint64_t v25 = *(void *)algn_1EBCB3958;
    *(void *)(v18 + 128) = qword_1EBCB3950;
    *(void *)(v18 + 136) = v25;
    sub_1C9E42808();
    uint64_t v43 = OUTLINED_FUNCTION_5_1();
    uint64_t v48 = v26;
    OUTLINED_FUNCTION_3_1();
    sub_1C9E42908();
    OUTLINED_FUNCTION_3_1();
    *(void *)(v18 + 144) = v43;
    *(void *)(v18 + 152) = v48;
    if (qword_1EBCB3948 != -1) {
      swift_once();
    }
    uint64_t v27 = unk_1EBCB3940;
    *(void *)(v18 + 160) = qword_1EBCB3938;
    *(void *)(v18 + 168) = v27;
    sub_1C9E42808();
    uint64_t v44 = OUTLINED_FUNCTION_5_1();
    uint64_t v49 = v28;
    OUTLINED_FUNCTION_3_1();
    sub_1C9E42DA8();
    OUTLINED_FUNCTION_3_1();
    *(void *)(v18 + 176) = v44;
    *(void *)(v18 + 184) = v49;
    uint64_t v29 = static InsightRequestSummaryLogger.constructLogJsonString(_:)(v18);
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    sub_1C9E1F9C8((uint64_t)v29, v31, &v50);
    sub_1C9E42C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v15, v37, "%s", v38, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

    uint64_t v32 = OUTLINED_FUNCTION_6_1();
    v33(v32);
  }
  else
  {

    uint64_t v34 = OUTLINED_FUNCTION_6_1();
    v35(v34);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v39, v14);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t InsightRequestSummaryKey.rawValue.getter()
{
  uint64_t v1 = *v0;
  sub_1C9E42808();
  return v1;
}

void sub_1C9E28890()
{
  qword_1EBCB3640 = 0x6E61747369737361;
  *(void *)algn_1EBCB3648 = 0xEB00000000644974;
}

SiriRequestDispatcher::InsightRequestSummaryKey __swiftcall InsightRequestSummaryKey.init(rawValue:)(SiriRequestDispatcher::InsightRequestSummaryKey rawValue)
{
  SiriRequestDispatcher::InsightRequestSummaryKey *v1 = rawValue;
  return rawValue;
}

uint64_t static InsightRequestSummaryKey.assistantId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3530, &qword_1EBCB3640, (uint64_t *)algn_1EBCB3648, a1);
}

void sub_1C9E288EC()
{
  qword_1EBCB3630 = 0x614E656764697262;
  *(void *)algn_1EBCB3638 = 0xEA0000000000656DLL;
}

uint64_t static InsightRequestSummaryKey.bridgeName.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB34C8, &qword_1EBCB3630, (uint64_t *)algn_1EBCB3638, a1);
}

void sub_1C9E2893C()
{
  unk_1EBCB36A7 = -18;
}

uint64_t static InsightRequestSummaryKey.cdmSetupStatus.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB34F0, &qword_1EBCB3698, (uint64_t *)&unk_1EBCB36A0, a1);
}

void sub_1C9E28994()
{
  qword_1EA5C9D40 = 0x4E646E616D6D6F63;
  *(void *)algn_1EA5C9D48 = 0xEB00000000656D61;
}

uint64_t static InsightRequestSummaryKey.commandName.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EA5C98E8, &qword_1EA5C9D40, (uint64_t *)algn_1EA5C9D48, a1);
}

void sub_1C9E289E8()
{
  qword_1EBCB3950 = 0x6E656E6F706D6F63;
  *(void *)algn_1EBCB3958 = 0xE900000000000074;
}

uint64_t static InsightRequestSummaryKey.component.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3960, &qword_1EBCB3950, (uint64_t *)algn_1EBCB3958, a1);
}

void static InsightRequestSummaryKey.dismissUIForMitigation.getter(void *a1@<X8>)
{
}

void sub_1C9E28A4C()
{
  unk_1EBCB365D = 0;
  unk_1EBCB365E = -5120;
}

uint64_t static InsightRequestSummaryKey.endpointMode.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3668, qword_1EBCB3650, (uint64_t *)&unk_1EBCB3658, a1);
}

void sub_1C9E28AA0()
{
  qword_1EBCB36D8 = 0x646F43726F727265;
  unk_1EBCB36E0 = 0xE900000000000065;
}

uint64_t static InsightRequestSummaryKey.errorCode.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(qword_1EBCB3500, &qword_1EBCB36D8, &qword_1EBCB36E0, a1);
}

void sub_1C9E28AF0()
{
  *(_WORD *)&algn_1EBCB3678[6] = -4864;
}

uint64_t static InsightRequestSummaryKey.failureReason.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB34E8, &qword_1EBCB3670, (uint64_t *)algn_1EBCB3678, a1);
}

void sub_1C9E28B48()
{
  qword_1EA5C9D50 = 0x61676974694D7369;
  *(void *)algn_1EA5C9D58 = 0xEB00000000646574;
}

uint64_t static InsightRequestSummaryKey.isMitigated.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(qword_1EA5C98F0, &qword_1EA5C9D50, (uint64_t *)algn_1EA5C9D58, a1);
}

void sub_1C9E28B9C()
{
  qword_1EBCB3938 = 0x72656B72616DLL;
  unk_1EBCB3940 = 0xE600000000000000;
}

uint64_t static InsightRequestSummaryKey.marker.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3948, &qword_1EBCB3938, &qword_1EBCB3940, a1);
}

void static InsightRequestSummaryKey.messageDescription.getter(void *a1@<X8>)
{
}

void sub_1C9E28BF8()
{
  algn_1EA5C9D68[7] = -18;
}

uint64_t static InsightRequestSummaryKey.mitigatedByURS.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(qword_1EA5C9900, &qword_1EA5C9D60, (uint64_t *)algn_1EA5C9D68, a1);
}

void sub_1C9E28C50()
{
  unk_1EBCB3625 = 0;
  unk_1EBCB3626 = -5120;
}

uint64_t static InsightRequestSummaryKey.nluRequestId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3628, &qword_1EBCB3618, (uint64_t *)&unk_1EBCB3620, a1);
}

void sub_1C9E28CA4()
{
  *(_WORD *)&algn_1EBCB3688[6] = -4864;
}

uint64_t static InsightRequestSummaryKey.postSucceeded.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3690, &qword_1EBCB3680, (uint64_t *)algn_1EBCB3688, a1);
}

void static InsightRequestSummaryKey.preExecutionDecision.getter(void *a1@<X8>)
{
}

void sub_1C9E28D10()
{
  qword_1EBCB36E8 = 0x4974736575716572;
  unk_1EBCB36F0 = 0xE900000000000064;
}

uint64_t static InsightRequestSummaryKey.requestId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB36F8, &qword_1EBCB36E8, &qword_1EBCB36F0, a1);
}

void static InsightRequestSummaryKey.resultCandidateId.getter(void *a1@<X8>)
{
}

void sub_1C9E28D74()
{
  qword_1EBCB34D0 = 0x6F436E7275746572;
  unk_1EBCB34D8 = 0xEA00000000006564;
}

uint64_t static InsightRequestSummaryKey.returnCode.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(qword_1EBCB3520, &qword_1EBCB34D0, (uint64_t *)&unk_1EBCB34D8, a1);
}

void static InsightRequestSummaryKey.serverFallbackReason.getter(void *a1@<X8>)
{
}

void static InsightRequestSummaryKey.serverFallbackContextId.getter(void *a1@<X8>)
{
}

void sub_1C9E28DEC()
{
  qword_1EBCB3700 = 0x496E6F6973736573;
  unk_1EBCB3708 = 0xE900000000000064;
}

uint64_t static InsightRequestSummaryKey.sessionId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3718, &qword_1EBCB3700, (uint64_t *)&unk_1EBCB3708, a1);
}

void sub_1C9E28E3C()
{
  qword_1EBCB36A8 = 0x6449756374;
  *(void *)algn_1EBCB36B0 = 0xE500000000000000;
}

uint64_t static InsightRequestSummaryKey.tcuId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB36C0, &qword_1EBCB36A8, (uint64_t *)algn_1EBCB36B0, a1);
}

void sub_1C9E28E84()
{
  qword_1EBCB36C8 = 0x6449707274;
  unk_1EBCB36D0 = 0xE500000000000000;
}

uint64_t static InsightRequestSummaryKey.trpId.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB34F8, &qword_1EBCB36C8, &qword_1EBCB36D0, a1);
}

void sub_1C9E28ECC()
{
  qword_1EBCB3720 = 0x636E617265747475;
  *(void *)algn_1EBCB3728 = 0xE900000000000065;
}

uint64_t static InsightRequestSummaryKey.utterance.getter@<X0>(void *a1@<X8>)
{
  return sub_1C9E28F1C(&qword_1EBCB3730, &qword_1EBCB3720, (uint64_t *)algn_1EBCB3728, a1);
}

uint64_t sub_1C9E28F1C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return sub_1C9E42808();
}

void static InsightRequestSummaryKey.languageDetected.getter(void *a1@<X8>)
{
}

uint64_t sub_1C9E28F94@<X0>(Swift::String *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = InsightRequestSummaryKey.init(rawValue:)(*a1).rawValue._countAndFlagsBits;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_1C9E28FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = InsightRequestSummaryKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateReceived.getter()
{
  return OUTLINED_FUNCTION_2_1(26);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateReceivedFailure.getter()
{
  return OUTLINED_FUNCTION_2_1(33);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAccepted.getter()
{
  return OUTLINED_FUNCTION_2_1(26);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedFailure.getter()
{
  return OUTLINED_FUNCTION_2_1(33);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMUX.getter()
{
  return OUTLINED_FUNCTION_2_1(29);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMUXFailure.getter()
{
  return OUTLINED_FUNCTION_2_1(36);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMessagePosting.getter()
{
  return OUTLINED_FUNCTION_2_1(40);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMessagePostingFailure.getter()
{
  return OUTLINED_FUNCTION_2_1(47);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateWithEndpoint.getter()
{
  return OUTLINED_FUNCTION_2_1(30);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateWithEndpointFailure.getter()
{
  return OUTLINED_FUNCTION_2_1(37);
}

unint64_t static InsightRequestSummaryMessageDescription.executionMitigateRequest.getter()
{
  return OUTLINED_FUNCTION_2_1(24);
}

unint64_t static InsightRequestSummaryMessageDescription.executionPreExecutionDecision.getter()
{
  return OUTLINED_FUNCTION_2_1(29);
}

unint64_t static InsightRequestSummaryMessageDescription.executionServerFallbackInitiated.getter()
{
  return OUTLINED_FUNCTION_2_1(32);
}

BOOL static Marker.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Marker.hash(into:)()
{
  return sub_1C9E42EE8();
}

uint64_t Marker.hashValue.getter()
{
  return sub_1C9E42EF8();
}

uint64_t sub_1C9E291CC()
{
  return 0;
}

unint64_t sub_1C9E291D4(uint64_t a1, uint64_t a2)
{
  sub_1C9E42ED8();
  sub_1C9E428F8();
  uint64_t v4 = sub_1C9E42EF8();
  return sub_1C9E292E4(a1, a2, v4);
}

unint64_t sub_1C9E2924C(uint64_t a1)
{
  sub_1C9E42688();
  sub_1C9E29B9C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
  uint64_t v2 = sub_1C9E42868();
  return sub_1C9E293C8(a1, v2);
}

unint64_t sub_1C9E292E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C9E42E48() & 1) == 0)
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
      while (!v14 && (sub_1C9E42E48() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C9E293C8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_1C9E42688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
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
      sub_1C9E29B9C(&qword_1EA5C9D88, MEMORY[0x1E4FA26E0]);
      char v15 = sub_1C9E42878();
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

uint64_t sub_1C9E29588(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C9E295C4(uint64_t a1, unint64_t a2)
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

unint64_t sub_1C9E29620()
{
  unint64_t result = qword_1EA5C9D78;
  if (!qword_1EA5C9D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C9D78);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for InsightRequestSummaryLogger(uint64_t a1)
{
  uint64_t v2 = sub_1C9E426F8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9E298E0);
}

uint64_t sub_1C9E298E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9E2993C);
}

uint64_t sub_1C9E2993C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E426F8();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for InsightRequestSummaryLogger()
{
  uint64_t result = qword_1EBCB3538;
  if (!qword_1EBCB3538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9E299F8()
{
  uint64_t result = sub_1C9E426F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for InsightRequestSummaryKey()
{
}

void type metadata accessor for InsightRequestSummaryMessageDescription()
{
}

unsigned char *storeEnumTagSinglePayload for Marker(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9E29B68);
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

void type metadata accessor for Marker()
{
}

uint64_t sub_1C9E29B9C(unint64_t *a1, void (*a2)(uint64_t))
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

void OUTLINED_FUNCTION_1_1(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = (v2 - 32) | 0x8000000000000000;
}

unint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_1C9E42908();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return MEMORY[0x1F4185A08](0, 1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t InstrumentationUtil.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t InstrumentationUtil.init()()
{
  return v0;
}

id sub_1C9E29C5C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = sub_1C9E2AE74(a1, a2, a3, a4);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0D40]), sel_init);
  objc_msgSend(v8, sel_setEventMetadata_, v7);
  if ((a5 & 1) != 0 && v8)
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4FA0E58]);
    id v10 = v8;
    id v11 = objc_msgSend(v9, sel_init);
    if (v11)
    {
      id v12 = objc_allocWithZone(MEMORY[0x1E4FA0DB8]);
      id ru_maxrss = v11;
      id v13 = objc_msgSend(v12, sel_init);
      objc_msgSend(ru_maxrss, sel_setMemoryUsageMetadata_, v13);
    }
    v26.ru_utime.tv_sec = 0;
    v26.ru_utime.tv_usec = 0;
    v26.ru_stime.tv_sec = 0;
    v26.ru_stime.tv_usec = 0;
    memset(&v26.ru_maxrss, 0, 112);
    if (getrusage(0, &v26))
    {
      if (qword_1EBCB3548 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_1C9E426F8();
      char v15 = OUTLINED_FUNCTION_4_1(v14, (uint64_t)qword_1EBCB3C50);
      os_log_type_t v16 = sub_1C9E42B28();
      if (!OUTLINED_FUNCTION_3_2(v16)) {
        goto LABEL_11;
      }
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      uint64_t v18 = "Not logging maxRSS since getrusage() did not succeed";
      goto LABEL_10;
    }
    id ru_maxrss = (id)v26.ru_maxrss;
    if (v26.ru_maxrss < 0)
    {
      if (qword_1EBCB3548 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_1C9E426F8();
      char v15 = OUTLINED_FUNCTION_4_1(v24, (uint64_t)qword_1EBCB3C50);
      os_log_type_t v25 = sub_1C9E42B28();
      if (!OUTLINED_FUNCTION_3_2(v25)) {
        goto LABEL_11;
      }
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      uint64_t v18 = "Not logging maxRSS since it is negative";
LABEL_10:
      _os_log_impl(&dword_1C9E1B000, v15, (os_log_type_t)ru_maxrss, v18, v17, 2u);
      OUTLINED_FUNCTION_5();
LABEL_11:

LABEL_12:
      objc_msgSend(v10, sel_setResourceUtilizationMetadata_, v11);

      goto LABEL_13;
    }
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v20 = objc_msgSend(v11, sel_memoryUsageMetadata);
    if (!v20) {
      goto LABEL_12;
    }
    char v15 = v20;
    double v21 = ceil(log10((double)(unint64_t)ru_maxrss));
    if (v21 <= 2.0)
    {
LABEL_22:
      [v15 setMaxRSS:ru_maxrss];
      goto LABEL_11;
    }
    double v22 = __exp10(v21 + -2.0);
    double v23 = v22 * rint((double)(unint64_t)ru_maxrss / v22);
    if ((~*(void *)&v23 & 0x7FF0000000000000) != 0)
    {
      if (v23 > -1.0)
      {
        if (v23 < 1.84467441e19)
        {
          id ru_maxrss = (id)v23;
          goto LABEL_22;
        }
LABEL_29:
        __break(1u);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
LABEL_13:

  return v8;
}

id sub_1C9E29FA8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1C9E29C5C(a1, a2, 0, 0, a3);
}

NSObject *sub_1C9E29FB8(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA12F8]), sel_init);
  if (!v14)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1C9E426F8();
    char v15 = OUTLINED_FUNCTION_4_1(v23, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v24 = sub_1C9E42B28();
    if (os_log_type_enabled(v15, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v26 = sub_1C9E42BF8();
      uint64_t v50 = sub_1C9E1F9C8(v26, v27, &v51);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v28 = sub_1C9E42BF8();
      uint64_t v50 = sub_1C9E1F9C8(v28, v29, &v51);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v15, v24, "Failed to create RequestLink event for source component: %s and target component: %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    goto LABEL_18;
  }
  char v15 = v14;
  unsigned int v49 = a3;
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v16)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C9E426F8();
    unint64_t v31 = OUTLINED_FUNCTION_4_1(v30, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v32 = sub_1C9E42B28();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      uint64_t v51 = OUTLINED_FUNCTION_4_0();
      *unint64_t v33 = 136315138;
      uint64_t v34 = sub_1C9E42BF8();
      uint64_t v36 = sub_1C9E1F9C8(v34, v35, &v51);
      OUTLINED_FUNCTION_7_0(v36);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_1(&dword_1C9E1B000, v37, v38, "Failed to create source link event for source component: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
LABEL_17:

LABEL_18:
    return 0;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v18)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_1C9E426F8();
    unint64_t v31 = OUTLINED_FUNCTION_4_1(v39, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v40 = sub_1C9E42B28();
    if (!OUTLINED_FUNCTION_3_2(v40))
    {

      return 0;
    }
    uint64_t v41 = (_DWORD *)OUTLINED_FUNCTION_6_0();
    uint64_t v51 = OUTLINED_FUNCTION_4_0();
    *uint64_t v41 = 136315138;
    uint64_t v42 = sub_1C9E42BF8();
    uint64_t v44 = sub_1C9E1F9C8(v42, v43, &v51);
    OUTLINED_FUNCTION_7_0(v44);
    sub_1C9E42C58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_1(&dword_1C9E1B000, v45, v46, "Failed to create target link event for target component: %s");
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

    goto LABEL_17;
  }
  uint64_t v19 = v18;
  objc_msgSend(v17, sel_setComponent_, a1);
  sub_1C9E2AFE4();
  uint64_t v48 = a4;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v20(v13, a2, v8);
  id v21 = sub_1C9E2A4F0((uint64_t)v13);
  objc_msgSend(v17, sel_setUuid_, v21);

  objc_msgSend(v19, sel_setComponent_, v49);
  v20(v13, v48, v8);
  id v22 = sub_1C9E2A4F0((uint64_t)v13);
  objc_msgSend(v19, sel_setUuid_, v22);

  [v15 setSource:v17];
  [v15 setTarget:v19];

  return v15;
}

id sub_1C9E2A4F0(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int v3 = (void *)sub_1C9E424F8();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_1C9E42528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

NSObject *sub_1C9E2A58C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA12F8]), sel_init);
  if (!v12)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C9E426F8();
    id v13 = OUTLINED_FUNCTION_4_1(v21, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v22 = sub_1C9E42B28();
    if (os_log_type_enabled(v13, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v24 = sub_1C9E42BF8();
      sub_1C9E1F9C8(v24, v25, &v51);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v26 = sub_1C9E42BF8();
      sub_1C9E1F9C8(v26, v27, &v51);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v13, v22, "Failed to create RequestLink event for source component: %s and target component: %s during buildRequestLinkEvent", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    goto LABEL_30;
  }
  id v13 = v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v14)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1C9E426F8();
    unint64_t v29 = OUTLINED_FUNCTION_4_1(v28, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v30 = sub_1C9E42B28();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      uint64_t v51 = OUTLINED_FUNCTION_4_0();
      *unint64_t v31 = 136315138;
      uint64_t v32 = sub_1C9E42BF8();
      sub_1C9E1F9C8(v32, v33, &v51);
      OUTLINED_FUNCTION_2_2();
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_1(&dword_1C9E1B000, v34, v35, "Failed to create source link event for source component: %s during buildRequestLinkEvent");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    goto LABEL_29;
  }
  char v15 = v14;
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v16)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1C9E426F8();
    unint64_t v29 = OUTLINED_FUNCTION_4_1(v36, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v37 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_3_2(v37))
    {
      uint64_t v38 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      uint64_t v51 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v39 = sub_1C9E42BF8();
      sub_1C9E1F9C8(v39, v40, &v51);
      OUTLINED_FUNCTION_2_2();
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v29, (os_log_type_t)a2, "Failed to create target link event for target component: %s during buildRequestLinkEvent", v38, 0xCu);
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

LABEL_29:
LABEL_30:

      return 0;
    }

    goto LABEL_34;
  }
  uint64_t v17 = v16;
  id v18 = sub_1C9E2ACD0();
  if (!v18)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_1C9E426F8();
    __swift_project_value_buffer(v41, (uint64_t)qword_1EBCB3C50);
    swift_bridgeObjectRetain_n();
    unint64_t v29 = sub_1C9E426E8();
    os_log_type_t v42 = sub_1C9E42B28();
    if (os_log_type_enabled(v29, v42))
    {
      unint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      uint64_t v51 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)unint64_t v43 = 136315138;
      sub_1C9E42808();
      sub_1C9E1F9C8(a2, a3, &v51);
      OUTLINED_FUNCTION_2_2();
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v29, v42, "Invaid sourceUUID = %s during buildRequestLinkEvent ", v43, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
LABEL_28:

      goto LABEL_29;
    }

    swift_bridgeObjectRelease_n();
LABEL_34:

    return 0;
  }
  uint64_t v50 = v18;
  id v19 = sub_1C9E2ACD0();
  if (!v19)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_1C9E426F8();
    __swift_project_value_buffer(v44, (uint64_t)qword_1EBCB3C50);
    swift_bridgeObjectRetain_n();
    unint64_t v29 = sub_1C9E426E8();
    os_log_type_t v45 = sub_1C9E42B28();
    if (!OUTLINED_FUNCTION_3_2(v45))
    {

      swift_bridgeObjectRelease_n();
      return 0;
    }
    uint64_t v46 = (_DWORD *)OUTLINED_FUNCTION_6_0();
    uint64_t v51 = OUTLINED_FUNCTION_4_0();
    *uint64_t v46 = 136315138;
    sub_1C9E42808();
    sub_1C9E1F9C8(a5, a6, &v51);
    OUTLINED_FUNCTION_2_2();
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_9_1(&dword_1C9E1B000, v47, v48, "Invaid targetUUID = %s during buildRequestLinkEvent ");
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

    goto LABEL_28;
  }
  uint64_t v20 = v19;
  objc_msgSend(v15, sel_setComponent_, a1);
  objc_msgSend(v15, sel_setUuid_, v50);
  objc_msgSend(v17, sel_setComponent_, a4);
  objc_msgSend(v17, sel_setUuid_, v20);
  [v13 setSource:v15];
  [v13 setTarget:v17];

  return v13;
}

id sub_1C9E2ACD0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB2FF8);
  MEMORY[0x1F4188790](v0 - 8);
  id v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v14 - v10;
  sub_1C9E424D8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_1C9E2B024((uint64_t)v2);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v11, v2, v3);
    sub_1C9E2AFE4();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v3);
    id v12 = sub_1C9E2A4F0((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v3);
  }
  return v12;
}

void *sub_1C9E2AE74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = sub_1C9E2ACD0();
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0D48]), sel_init);
    uint64_t v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, sel_setRequestId_, v6);
      id v9 = v8;
      if (a4) {
        a4 = (void *)sub_1C9E42888();
      }
      objc_msgSend(v8, sel_setResultCandidateId_, a4);
    }
  }
  else
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C9E426F8();
    uint64_t v6 = OUTLINED_FUNCTION_4_1(v10, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v11 = sub_1C9E42B28();
    if (os_log_type_enabled(v6, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1C9E1B000, v6, v11, "The requestId is not a valid UUID. Will return a nil EventMetadata. We might still emit ORCHClientEvent for some events that are not in request grain", v12, 2u);
      OUTLINED_FUNCTION_5();
    }
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t InstrumentationUtil.deinit()
{
  return v0;
}

uint64_t InstrumentationUtil.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

unint64_t sub_1C9E2AFE4()
{
  unint64_t result = qword_1EBCB38B8;
  if (!qword_1EBCB38B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBCB38B8);
  }
  return result;
}

uint64_t sub_1C9E2B024(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB2FF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for InstrumentationUtil()
{
  return self;
}

uint64_t method lookup function for InstrumentationUtil(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InstrumentationUtil);
}

uint64_t dispatch thunk of InstrumentationUtil.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:_:logResourceUtilization:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:logResourceUtilization:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildRequestLinkEvent(sourceComponent:sourceUUID:targetComponent:targetUUID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InstrumentationUtil.powerLogger()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

BOOL OUTLINED_FUNCTION_3_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C9E426E8();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_10_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void IntelligenceFlowFeatureFlags.domain.getter()
{
}

void IntelligenceFlowFeatureFlags.feature.getter()
{
}

uint64_t IntelligenceFlowFeatureFlags.isEnabled.getter()
{
  uint64_t v3 = &type metadata for IntelligenceFlowFeatureFlags;
  unint64_t v4 = sub_1C9E2B2C8();
  char v0 = sub_1C9E42538();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_1C9E2B2C8()
{
  unint64_t result = qword_1EBCB3738;
  if (!qword_1EBCB3738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3738);
  }
  return result;
}

uint64_t static IntelligenceFlowFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t IntelligenceFlowFeatureFlags.hash(into:)()
{
  return sub_1C9E42EE8();
}

uint64_t IntelligenceFlowFeatureFlags.hashValue.getter()
{
  return sub_1C9E42EF8();
}

uint64_t sub_1C9E2B388()
{
  return 1;
}

uint64_t sub_1C9E2B390()
{
  return IntelligenceFlowFeatureFlags.hashValue.getter();
}

uint64_t sub_1C9E2B3A8()
{
  return IntelligenceFlowFeatureFlags.hash(into:)();
}

uint64_t sub_1C9E2B3C0()
{
  return sub_1C9E42EF8();
}

unint64_t sub_1C9E2B404()
{
  unint64_t result = qword_1EA5C9D90;
  if (!qword_1EA5C9D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C9D90);
  }
  return result;
}

const char *sub_1C9E2B450()
{
  return "IntelligenceFlow";
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for IntelligenceFlowFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C9E2B554);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceFlowFeatureFlags()
{
  return &type metadata for IntelligenceFlowFeatureFlags;
}

uint64_t sub_1C9E2B598()
{
  uint64_t v0 = sub_1C9E426F8();
  __swift_allocate_value_buffer(v0, qword_1EBCB3C50);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBCB3C50);
  sub_1C9E2BC7C();
  sub_1C9E42C28();
  return sub_1C9E42708();
}

void sub_1C9E2B62C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    sub_1C9E2BA5C(a1, a2, a3, a5, a6);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, void, void, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
  }
}

void sub_1C9E2B6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v12 = *(void (**)(uint64_t))(a10 + 8);
  uint64_t v13 = OUTLINED_FUNCTION_0_4();
  v12(v13);
  sub_1C9E426B8();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_1C9E42BD8();
    uint64_t v17 = OUTLINED_FUNCTION_0_4();
    id v19 = (id)((uint64_t (*)(uint64_t))v12)(v17);
    OUTLINED_FUNCTION_2_3();
    sub_1C9E426A8();
  }
  else
  {
    sub_1C9E42808();
    sub_1C9E42BD8();
    uint64_t v14 = OUTLINED_FUNCTION_0_4();
    char v15 = (void *)((uint64_t (*)(uint64_t))v12)(v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3480);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1C9E43E10;
    *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v16 + 64) = sub_1C9E2BB58();
    *(void *)(v16 + 32) = a7;
    *(void *)(v16 + 40) = a8;
    OUTLINED_FUNCTION_2_3();
    sub_1C9E42698();

    swift_bridgeObjectRelease();
  }
}

void sub_1C9E2B864()
{
}

void static SignpostLogger.end(_:_:)()
{
  sub_1C9E42BC8();
  uint64_t v0 = OUTLINED_FUNCTION_1_2();
  id v2 = (id)v1(v0);
  sub_1C9E426A8();
}

uint64_t sub_1C9E2B91C()
{
  return static SignpostLogger.event(_:)();
}

uint64_t static SignpostLogger.event(_:)()
{
  uint64_t v0 = sub_1C9E426D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E42BE8();
  uint64_t v4 = OUTLINED_FUNCTION_1_2();
  os_log_type_t v6 = (void *)v5(v4);
  sub_1C9E426C8();
  sub_1C9E426A8();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_1C9E2BA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_1C9E426B8();
  sub_1C9E42BD8();
  id v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_1C9E42698();
}

unint64_t sub_1C9E2BB58()
{
  unint64_t result = qword_1EBCB3428;
  if (!qword_1EBCB3428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3428);
  }
  return result;
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
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

unint64_t sub_1C9E2BC7C()
{
  unint64_t result = qword_1EBCB3550;
  if (!qword_1EBCB3550)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBCB3550);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

void *MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, long long *a6, uint64_t a7)
{
  uint64_t v11 = qword_1EBCB3C78;
  type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  OUTLINED_FUNCTION_31_0();
  sub_1C9E429F8();
  *(void *)((char *)v7 + v11) = sub_1C9E427E8();
  uint64_t v12 = qword_1EBCB3C88;
  sub_1C9E429F8();
  *(void *)((char *)v7 + v12) = sub_1C9E427E8();
  uint64_t v13 = qword_1EBCB3C80;
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase();
  uint64_t v14 = sub_1C9E42838();
  OUTLINED_FUNCTION_31_0();
  sub_1C9E429F8();
  *(void *)((char *)v7 + v13) = sub_1C9E427E8();
  v7[2] = a1;
  v7[3] = a2;
  sub_1C9E2F7CC(a3, (uint64_t)(v7 + 4));
  v7[9] = a4;
  v7[10] = a5;
  sub_1C9E2F7CC(a6, (uint64_t)(v7 + 11));
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v14, a7);
  return v7;
}

uint64_t sub_1C9E2BEAC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  return sub_1C9E2BEBC(a1, a2, a3, a4, 0);
}

uint64_t sub_1C9E2BEB4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  return sub_1C9E2BEBC(a1, a2, a3, a4, 1);
}

uint64_t sub_1C9E2BEBC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char a5)
{
  char v6 = *a4;
  return sub_1C9E2E614(a1, a2, a5, a3, &v6);
}

unint64_t MessageHandlerType.rawValue.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0x4674736575716572;
      break;
    default:
      unint64_t result = 0x636972656E6567;
      break;
  }
  return result;
}

uint64_t MessageDispatchingBridgeBase.deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 88);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_22_0();
  v2(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C9E2C064()
{
  return sub_1C9E2C088();
}

uint64_t sub_1C9E2C070()
{
  return sub_1C9E2C088();
}

uint64_t sub_1C9E2C07C()
{
  return sub_1C9E2C088();
}

uint64_t sub_1C9E2C088()
{
  return sub_1C9E42808();
}

uint64_t sub_1C9E2C0D0()
{
  uint64_t v1 = *v0;
  sub_1C9E2C070();
  uint64_t v2 = *(void *)(v1 + 80);
  type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  uint64_t v3 = sub_1C9E42828();
  swift_bridgeObjectRelease();
  v10[5] = v3;
  v10[2] = v2;
  uint64_t v4 = sub_1C9E42818();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3740);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = sub_1C9E2DCC4((void (*)(char *, char *))sub_1C9E2F7E4, (uint64_t)v10, v4, v5, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C9E2C200()
{
  return sub_1C9E42A18();
}

uint64_t sub_1C9E2C2F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9E2C07C();
  v10[0] = a1;
  v10[1] = a2;
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase();
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  uint64_t v6 = MEMORY[0x1E4FBB1B0];
  uint64_t v7 = sub_1C9E42838();
  sub_1C9E42808();
  MEMORY[0x1CB790520](&v11, v10, v4, v5, v7, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11)
  {
    OUTLINED_FUNCTION_31_0();
    sub_1C9E429F8();
    sub_1C9E427E8();
  }
  uint64_t v8 = sub_1C9E42808();
  swift_bridgeObjectRelease();
  v10[0] = v8;
  sub_1C9E427F8();
  swift_getWitnessTable();
  return sub_1C9E42A18();
}

uint64_t sub_1C9E2C470(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3488);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v5 = v4 - v3;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3740);
  uint64_t v6 = sub_1C9E428D8();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1C9E2C064();
  v16[0] = v6;
  v16[1] = v8;
  uint64_t v10 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  sub_1C9E42808();
  MEMORY[0x1CB790520](&v17, v16, v9, MEMORY[0x1E4FBB1A0], v10, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v17;
  if (v17)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v16[3] = sub_1C9E425F8();
    v16[0] = a1;
    id v12 = a1;
    sub_1C9E42F18();
    uint64_t v13 = sub_1C9E42F38();
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v13);
    sub_1C9E2CEB0();
    uint64_t v11 = v14;
    sub_1C9E301A0(v5);
    swift_release();
    OUTLINED_FUNCTION_20_0();
    sub_1C9E42838();
    swift_retain();
    sub_1C9E42858();
    swift_endAccess();
  }
  return v11;
}

void sub_1C9E2C654(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_11_0();
  id v11 = objc_msgSend(v10, sel_groupIdentifier);
  if (!v11)
  {
    id v38 = a1;
    uint64_t v39 = (void *)sub_1C9E426E8();
    os_log_type_t v40 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_9_2(v40))
    {
      uint64_t v41 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      uint64_t v89 = OUTLINED_FUNCTION_4_0();
      *uint64_t v41 = 136315138;
      id v42 = objc_msgSend(v38, sel_debugDescription);
      uint64_t v43 = sub_1C9E42898();
      unint64_t v45 = v44;

      uint64_t v91 = sub_1C9E1F9C8(v43, v45, &v89);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_29_0(&dword_1C9E1B000, v46, v47, "Commnad %s don't have group identifier, failed command");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    uint64_t v62 = type metadata accessor for MessageDispatchingBridgeBase();
    swift_getWitnessTable();
    uint64_t v63 = (void *)OUTLINED_FUNCTION_23_0();
    uint64_t v68 = v62;
    goto LABEL_24;
  }
  id v12 = v11;
  uint64_t v88 = a2;
  uint64_t v13 = sub_1C9E42898();
  uint64_t v15 = v14;

  uint64_t v16 = sub_1C9E2C07C();
  uint64_t v89 = v13;
  uint64_t v90 = v15;
  uint64_t v17 = type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase();
  uint64_t v18 = MEMORY[0x1E4FBB1A0];
  uint64_t v19 = MEMORY[0x1E4FBB1B0];
  uint64_t v20 = sub_1C9E42838();
  MEMORY[0x1CB790520](&v91, &v89, v16, v18, v20, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = v91;
  if (!v91)
  {
    id v48 = a1;
    swift_retain_n();
    id v49 = v48;
    uint64_t v50 = sub_1C9E426E8();
    os_log_type_t v51 = sub_1C9E42B28();
    if (OUTLINED_FUNCTION_9_2(v51))
    {
      uint64_t v52 = OUTLINED_FUNCTION_28();
      uint64_t v89 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v53 = *(void *)(v5 + 16);
      unint64_t v54 = *(void *)(v5 + 24);
      sub_1C9E42808();
      sub_1C9E1F9C8(v53, v54, &v89);
      OUTLINED_FUNCTION_10_2();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      id v55 = objc_msgSend(v49, sel_debugDescription);
      uint64_t v56 = sub_1C9E42898();
      unint64_t v58 = v57;

      sub_1C9E1F9C8(v56, v58, &v89);
      OUTLINED_FUNCTION_25_0();
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      id v59 = "%s was not able to handle: %s, group is not register. Falling back to super.handle()";
      uint64_t v60 = v50;
      os_log_type_t v61 = v15;
LABEL_17:
      _os_log_impl(&dword_1C9E1B000, v60, v61, v59, (uint8_t *)v52, 0x16u);
LABEL_18:
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
LABEL_23:

      uint64_t v86 = type metadata accessor for MessageDispatchingBridgeBase();
      swift_getWitnessTable();
      uint64_t v63 = (void *)OUTLINED_FUNCTION_23_0();
      uint64_t v68 = v86;
LABEL_24:
      Bridge.defaultHandle(_:executionContextInfo:reply:)(v63, v64, v65, v66, v68, v67);
      return;
    }
LABEL_19:

    swift_release_n();
    goto LABEL_23;
  }
  id v22 = objc_msgSend(a1, sel_encodedClassName);
  if (!v22)
  {
    swift_bridgeObjectRelease();
    id v69 = a1;
    uint64_t v50 = sub_1C9E426E8();
    os_log_type_t v70 = sub_1C9E42B28();
    if (!OUTLINED_FUNCTION_9_2(v70))
    {

      goto LABEL_23;
    }
    uint64_t v71 = (_DWORD *)OUTLINED_FUNCTION_6_0();
    uint64_t v89 = OUTLINED_FUNCTION_4_0();
    *uint64_t v71 = 136315138;
    id v72 = objc_msgSend(v69, sel_debugDescription);
    uint64_t v73 = sub_1C9E42898();
    unint64_t v75 = v74;

    sub_1C9E1F9C8(v73, v75, &v89);
    OUTLINED_FUNCTION_13();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_0(&dword_1C9E1B000, v76, v77, "Commnad %s don't have encodedClassName, failed command");
    goto LABEL_18;
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_1C9E42898();
  uint64_t v26 = v25;

  uint64_t v89 = v24;
  uint64_t v90 = v26;
  MEMORY[0x1CB790520](&v91, &v89, v21, MEMORY[0x1E4FBB1A0], v17, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = v91;
  if (!v91)
  {
    id v78 = a1;
    swift_retain_n();
    id v49 = v78;
    uint64_t v50 = sub_1C9E426E8();
    os_log_type_t v79 = sub_1C9E42B28();
    if (os_log_type_enabled(v50, v79))
    {
      uint64_t v52 = OUTLINED_FUNCTION_28();
      uint64_t v89 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v80 = *(void *)(v5 + 16);
      unint64_t v81 = *(void *)(v5 + 24);
      sub_1C9E42808();
      sub_1C9E1F9C8(v80, v81, &v89);
      OUTLINED_FUNCTION_10_2();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      id v82 = objc_msgSend(v49, sel_debugDescription);
      uint64_t v83 = sub_1C9E42898();
      unint64_t v85 = v84;

      sub_1C9E1F9C8(v83, v85, &v89);
      OUTLINED_FUNCTION_25_0();
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      id v59 = "%s was not able to handle: %s, command is not register. Falling back to super.handle()";
      uint64_t v60 = v50;
      os_log_type_t v61 = v79;
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  id v28 = a1;
  unint64_t v29 = sub_1C9E426E8();
  os_log_type_t v30 = sub_1C9E42B18();
  if (OUTLINED_FUNCTION_9_2(v30))
  {
    uint64_t v87 = a4;
    unint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    uint64_t v89 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)unint64_t v31 = 136315138;
    uint64_t v32 = a3;
    id v33 = objc_msgSend(v28, sel_debugDescription);
    uint64_t v34 = sub_1C9E42898();
    unint64_t v36 = v35;

    a3 = v32;
    uint64_t v37 = v34;
    a4 = v87;
    sub_1C9E1F9C8(v37, v36, &v89);
    OUTLINED_FUNCTION_13();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v29, (os_log_type_t)v23, "dispatch command %s to the handle method", v31, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(*(void *)v27 + 88))(v5, v28, v88, a3, a4);
  swift_release();
}

void sub_1C9E2CEB0()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3488);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v19[-1] - v7;
  uint64_t v9 = sub_1C9E42F38();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_18_0();
  sub_1C9E30138(v2, (uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_1C9E301A0((uint64_t)v8);
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
    LOBYTE(v19[0]) = 0;
    sub_1C9E2E56C(v19);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v0, v8, v9);
    v19[0] = sub_1C9E42F28();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3490);
    uint64_t v13 = sub_1C9E428D8();
    uint64_t v15 = v14;
    uint64_t v16 = sub_1C9E2C070();
    v19[0] = v13;
    v19[1] = v15;
    uint64_t v17 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
    MEMORY[0x1CB790520](&v20, v19, v16, MEMORY[0x1E4FBB1A0], v17, MEMORY[0x1E4FBB1B0]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v20)
    {
      sub_1C9E42F08();
      sub_1C9E2CEB0(v6);
      sub_1C9E301A0((uint64_t)v6);
    }
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v9);
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E2D0D0()
{
}

void sub_1C9E2D0D8()
{
}

void sub_1C9E2D0E0()
{
  OUTLINED_FUNCTION_5_0();
  char v20 = v2;
  uint64_t v21 = v3;
  uint64_t v19 = v4;
  uint64_t v5 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_17_0();
  swift_getMetatypeMetadata();
  uint64_t v9 = sub_1C9E428D8();
  unint64_t v11 = v10;
  uint64_t v12 = sub_1C9E2C070();
  v22[0] = v9;
  v22[1] = v11;
  uint64_t v13 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  sub_1C9E42808();
  MEMORY[0x1CB790520](v23, v22, v12, MEMORY[0x1E4FBB1A0], v13, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v23[0];
  swift_release();
  if (v14)
  {
    sub_1C9E42808();
    uint64_t v15 = sub_1C9E426E8();
    os_log_type_t v16 = sub_1C9E42B28();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      v22[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v17 = 136315138;
      sub_1C9E42808();
      v23[0] = sub_1C9E1F9C8(v9, v11, v22);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v15, v16, "Message type: %s is already registered so ignore this request", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v1, v0 + qword_1EBCB3C20, v5);
    LOBYTE(v22[0]) = 0;
    uint64_t v18 = sub_1C9E2BEBC(v19, v21, v1, (char *)v22, v20);
    v23[1] = v11;
    v23[2] = v18;
    v23[0] = v9;
    OUTLINED_FUNCTION_20_0();
    sub_1C9E42838();
    swift_retain();
    sub_1C9E42858();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E2D3C4()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11 - v10;
  id v53 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v13 = objc_msgSend(v53, sel_groupIdentifier);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v52 = v6;
    uint64_t v15 = sub_1C9E42898();
    unint64_t v17 = v16;

    id v18 = objc_msgSend(v53, sel_encodedClassName);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v47 = v8;
      uint64_t v48 = v5;
      uint64_t v49 = v3;
      uint64_t v50 = sub_1C9E42898();
      unint64_t v21 = v20;

      uint64_t v22 = sub_1C9E2C07C();
      uint64_t v51 = v15;
      uint64_t v54 = v15;
      unint64_t v55 = v17;
      uint64_t v23 = type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase();
      uint64_t v24 = MEMORY[0x1E4FBB1A0];
      uint64_t v25 = MEMORY[0x1E4FBB1B0];
      uint64_t v26 = sub_1C9E42838();
      sub_1C9E42808();
      MEMORY[0x1CB790520](v56, &v54, v22, v24, v26, v25);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = v56[0];
      if (!v56[0])
      {
        OUTLINED_FUNCTION_31_0();
        sub_1C9E429F8();
        uint64_t v27 = sub_1C9E427E8();
      }
      uint64_t v29 = v50;
      uint64_t v28 = v51;
      uint64_t v57 = v27;
      uint64_t v54 = v50;
      unint64_t v55 = v21;
      sub_1C9E42808();
      MEMORY[0x1CB790520](v56, &v54, v27, MEMORY[0x1E4FBB1A0], v23, MEMORY[0x1E4FBB1B0]);
      swift_bridgeObjectRelease();
      uint64_t v30 = v56[0];
      swift_release();
      unint64_t v31 = &unk_1EBCB3000;
      if (v30)
      {
        OUTLINED_FUNCTION_28_0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v32 = sub_1C9E426E8();
        os_log_type_t v33 = sub_1C9E42B28();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = OUTLINED_FUNCTION_28();
          uint64_t v54 = OUTLINED_FUNCTION_15_0();
          *(_DWORD *)uint64_t v34 = 136315394;
          sub_1C9E42808();
          v56[0] = sub_1C9E1F9C8(v51, v17, &v54);
          sub_1C9E42C58();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v34 + 12) = 2080;
          sub_1C9E42808();
          v56[0] = sub_1C9E1F9C8(v50, v21, &v54);
          uint64_t v29 = v50;
          sub_1C9E42C58();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C9E1B000, v32, v33, "There is already a method register to handle command: %s:%s, replacing", (uint8_t *)v34, 0x16u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_5();
          unint64_t v31 = (void *)&unk_1EBCB3000;
          OUTLINED_FUNCTION_5();

          uint64_t v28 = v51;
        }
        else
        {
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_28_0();
          swift_bridgeObjectRelease_n();
        }
      }
      type metadata accessor for MessageDispatchingBridgeBase.CommandHandler();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v12, v1 + v31[388], v52);
      v56[3] = sub_1C9E2E5A4(v48, v49, v12);
      uint64_t v54 = v29;
      unint64_t v55 = v21;
      swift_retain();
      sub_1C9E427D8();
      swift_bridgeObjectRelease();
      swift_release();
      v56[1] = v17;
      v56[2] = v57;
      v56[0] = v28;
      OUTLINED_FUNCTION_20_0();
      sub_1C9E42838();
      sub_1C9E42808();
      sub_1C9E427D8();
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    unint64_t v35 = sub_1C9E426E8();
    os_log_type_t v36 = sub_1C9E42B28();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      uint64_t v54 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_26_0(4.8149e-34);
      uint64_t v42 = sub_1C9E428D8();
      uint64_t v44 = sub_1C9E1F9C8(v42, v43, &v54);
      OUTLINED_FUNCTION_19_0(v44);
      swift_bridgeObjectRelease();
      uint64_t v41 = "Cannot get command encode name %s";
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v35 = sub_1C9E426E8();
    os_log_type_t v36 = sub_1C9E42B28();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      uint64_t v54 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_26_0(4.8149e-34);
      uint64_t v38 = sub_1C9E428D8();
      uint64_t v40 = sub_1C9E1F9C8(v38, v39, &v54);
      OUTLINED_FUNCTION_19_0(v40);
      swift_bridgeObjectRelease();
      uint64_t v41 = "Cannot get command group identifier %s";
LABEL_12:
      _os_log_impl(&dword_1C9E1B000, v35, v36, v41, v37, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

LABEL_18:
      OUTLINED_FUNCTION_3_0();
      return;
    }
  }

  OUTLINED_FUNCTION_3_0();
}

uint64_t MessageDispatchingBridgeBase.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1C9E42808();
  return v1;
}

uint64_t MessageDispatchingBridgeBase.messagePublisher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9E21750(v1 + 32, a1);
}

uint64_t MessageDispatchingBridgeBase.serviceHelper.getter()
{
  return swift_unknownObjectRetain();
}

id MessageDispatchingBridgeBase.queue.getter()
{
  return *(id *)(v0 + 80);
}

uint64_t MessageDispatchingBridgeBase.conversationSessionsManaging.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9E21750(v1 + 88, a1);
}

uint64_t MessageDispatchingBridgeBase.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1EBCB3C20;
  sub_1C9E426F8();
  OUTLINED_FUNCTION_14();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

void MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_17_0();
  sub_1C9E21750(v9, (uint64_t)v20);
  sub_1C9E21750(v3, (uint64_t)v19);
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_1EBCB3C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v18, v14);
  (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, unsigned char *, uint64_t))(v0 + 240))(v13, v11, v20, v7, v5, v19, v1);
  __swift_destroy_boxed_opaque_existential_0(v3);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_0();
}

uint64_t MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, long long *a6, uint64_t a7)
{
  uint64_t v14 = OUTLINED_FUNCTION_24_0();
  MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t sub_1C9E2DCC4(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v31 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = sub_1C9E42AE8();
  if (!v20) {
    return sub_1C9E429F8();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_1C9E42D88();
  uint64_t v38 = sub_1C9E42D98();
  sub_1C9E42D38();
  uint64_t v42 = a6;
  uint64_t result = sub_1C9E42AD8();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v40 = (void (**)(char *))(v39 + 2);
    uint64_t v41 = v14;
    ++v39;
    while (1)
    {
      uint64_t v23 = (void (*)(char *, void))sub_1C9E42B08();
      uint64_t v24 = v12;
      uint64_t v25 = v12;
      uint64_t v26 = AssociatedTypeWitness;
      (*v40)(v24);
      v23(v48, 0);
      uint64_t v27 = v47;
      v44(v25, v46);
      if (v27) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v25, v26);
      sub_1C9E42D78();
      sub_1C9E42AF8();
      --v21;
      uint64_t v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        uint64_t v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_1C9E42C98();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v49;
      }
    }
    (*v39)(v25, v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

void sub_1C9E2E138()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_28_0();
  swift_retain_n();
  id v9 = v4;
  uint64_t v10 = sub_1C9E426E8();
  os_log_type_t v11 = sub_1C9E42B18();
  uint64_t v12 = &loc_1C9E43000;
  uint64_t v29 = v7;
  uint64_t v30 = v5;
  uint64_t v28 = v1;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v13 = OUTLINED_FUNCTION_28();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v31 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v15 = *(void *)(v2 + 16);
    unint64_t v16 = *(void *)(v2 + 24);
    sub_1C9E42808();
    sub_1C9E1F9C8(v15, v16, &v31);
    OUTLINED_FUNCTION_27_0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    id v17 = v9;
    sub_1C9E42C58();
    *uint64_t v14 = v9;

    uint64_t v12 = (void *)&loc_1C9E43000;
    _os_log_impl(&dword_1C9E1B000, v10, v11, "Bridge \"%s\" received message: %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {

    swift_release_n();
  }

  uint64_t v18 = sub_1C9E2C470(v9);
  if ((*(uint64_t (**)(void))(*(void *)v18 + 120))())
  {
    id v19 = v9;
    uint64_t v20 = sub_1C9E426E8();
    os_log_type_t v21 = sub_1C9E42B28();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = OUTLINED_FUNCTION_28();
      uint64_t v31 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v22 = v12[243];
      swift_getObjectType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3740);
      uint64_t v23 = sub_1C9E428D8();
      sub_1C9E1F9C8(v23, v24, &v31);
      OUTLINED_FUNCTION_27_0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      sub_1C9E425E8();
      sub_1C9E2F888();
      uint64_t v25 = sub_1C9E42E18();
      unint64_t v27 = v26;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      sub_1C9E1F9C8(v25, v27, &v31);
      OUTLINED_FUNCTION_27_0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v20, v21, "handleMessage got message type %s with message id: %s which is not registered with the bridge", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
  }
  else
  {
    (*(void (**)(uint64_t, id))(*(void *)v18 + 104))(v2, v9);
  }
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E2E564(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1C9E2E56C(unsigned char *a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = *a1;
  return result;
}

uint64_t sub_1C9E2E5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_24_0();
  sub_1C9E2EF0C(a1, a2, a3);
  return v6;
}

uint64_t sub_1C9E2E5F0(unsigned char *a1)
{
  *(unsigned char *)(v1 + 16) = *a1;
  return OUTLINED_FUNCTION_21_0();
}

uint64_t sub_1C9E2E5FC()
{
  return sub_1C9E425F8();
}

uint64_t sub_1C9E2E608()
{
  return OUTLINED_FUNCTION_12_0(v0, 17);
}

uint64_t sub_1C9E2E614(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char *a5)
{
  char v9 = a3 & 1;
  OUTLINED_FUNCTION_24_0();
  return sub_1C9E2E674(a1, a2, v9, a4, a5);
}

uint64_t sub_1C9E2E674(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char *a5)
{
  char v7 = *a5;
  *(void *)(v5 + 24) = a1;
  *(void *)(v5 + 32) = a2;
  *(unsigned char *)(v5 + 40) = a3 & 1;
  uint64_t v8 = v5 + qword_1EBCB3C10;
  uint64_t v9 = sub_1C9E426F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a4, v9);
  *(unsigned char *)(v5 + 16) = v7;
  return v5;
}

void sub_1C9E2E6FC()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4();
  uint64_t v11 = v10 - v9;
  uint64_t v43 = v4;
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    uint64_t v12 = swift_dynamicCastClass();
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(uint64_t (**)(uint64_t))(v0 + 24);
      int v15 = *(unsigned __int8 *)(v0 + 40);
      id v16 = v2;
      sub_1C9E2FF04();
      uint64_t v17 = OUTLINED_FUNCTION_30_0();
      if (v15 == 1)
      {
        uint64_t v18 = (void (*)(uint64_t))v14(v17);
        v18(v13);
        sub_1C9E2FF1C();
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v41 = (void (*)(uint64_t))v14(v17);
        v41(v13);
        swift_release();
        swift_unknownObjectRelease();

        sub_1C9E2FF1C();
      }
    }
    else
    {
      id v28 = v2;
      uint64_t v29 = sub_1C9E426E8();
      os_log_type_t v30 = sub_1C9E42B28();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = OUTLINED_FUNCTION_4_0();
        uint64_t v43 = swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 136315650;
        sub_1C9E425E8();
        sub_1C9E2F888();
        uint64_t v32 = sub_1C9E42E18();
        os_log_type_t v42 = v30;
        unint64_t v34 = v33;
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
        sub_1C9E1F9C8(v32, v34, &v43);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        swift_getObjectType();
        uint64_t v35 = sub_1C9E42F48();
        uint64_t v37 = sub_1C9E1F9C8(v35, v36, &v43);
        OUTLINED_FUNCTION_33_0(v37);

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 22) = 2080;
        uint64_t v38 = sub_1C9E42F48();
        uint64_t v40 = sub_1C9E1F9C8(v38, v39, &v43);
        OUTLINED_FUNCTION_33_0(v40);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9E1B000, v29, v42, "Input message %s of type %s is not of type %s", (uint8_t *)v31, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
      }
      else
      {
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRetain_n();
    id v19 = sub_1C9E426E8();
    os_log_type_t v20 = sub_1C9E42B28();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = OUTLINED_FUNCTION_28();
      uint64_t v43 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_getObjectType();
      uint64_t v22 = sub_1C9E42F48();
      sub_1C9E1F9C8(v22, v23, &v43);
      sub_1C9E42C58();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v24 = sub_1C9E42F48();
      sub_1C9E1F9C8(v24, v25, &v43);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32_0(&dword_1C9E1B000, v26, v27, "Handler invoking object is of type %s and not of type %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_unknownObjectRelease_n();
    }
  }
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1C9E2ED78()
{
  return *(void *)(*(void *)v0 + 152);
}

uint64_t sub_1C9E2ED90()
{
  OUTLINED_FUNCTION_5_2();
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    swift_unknownObjectRelease();
    return swift_dynamicCastClass() != 0;
  }
  return result;
}

uint64_t sub_1C9E2EE28()
{
  sub_1C9E2FF1C();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  return v3(v0, v1);
}

uint64_t sub_1C9E2EE90()
{
  sub_1C9E2FF1C();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_22_0();
  v2(v1);
  return v0;
}

uint64_t sub_1C9E2EEE8()
{
  return sub_1C9E2F480((void (*)(void))sub_1C9E2EE90);
}

uint64_t sub_1C9E2EF00()
{
  return OUTLINED_FUNCTION_12_0(v0, 16);
}

uint64_t sub_1C9E2EF0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v5 = v3 + qword_1EBCB3C18;
  sub_1C9E426F8();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v5, a3);
  return v3;
}

void sub_1C9E2EF7C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v36 = v10;
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    uint64_t v11 = swift_dynamicCastUnknownClass();
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(uint64_t (**)())(v5 + 16);
      id v14 = a2;
      int v15 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13();
      v15(v12, a3, a4, a5);
      swift_unknownObjectRelease();

      swift_release();
    }
    else
    {
      id v25 = a2;
      uint64_t v26 = sub_1C9E426E8();
      os_log_type_t v27 = sub_1C9E42B28();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = OUTLINED_FUNCTION_4_0();
        uint64_t v36 = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 136315650;
        uint64_t v29 = sub_1C9E300D4(v25);
        if (v30)
        {
          unint64_t v31 = v30;
        }
        else
        {
          uint64_t v29 = 0x6449656361206F6ELL;
          unint64_t v31 = 0xE800000000000000;
        }
        sub_1C9E1F9C8(v29, v31, &v36);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2080;
        swift_getObjectType();
        uint64_t v32 = sub_1C9E42F48();
        sub_1C9E1F9C8(v32, v33, &v36);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 22) = 2080;
        uint64_t v34 = sub_1C9E42F48();
        sub_1C9E1F9C8(v34, v35, &v36);
        sub_1C9E42C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9E1B000, v26, v27, "Input command %s of type %s is not of type %s", (uint8_t *)v28, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
      }
      else
      {
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_28_0();
    swift_unknownObjectRetain_n();
    id v16 = sub_1C9E426E8();
    os_log_type_t v17 = sub_1C9E42B28();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = OUTLINED_FUNCTION_28();
      uint64_t v36 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v18 = 136315394;
      swift_getObjectType();
      uint64_t v19 = sub_1C9E42F48();
      sub_1C9E1F9C8(v19, v20, &v36);
      sub_1C9E42C58();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v21 = sub_1C9E42F48();
      sub_1C9E1F9C8(v21, v22, &v36);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32_0(&dword_1C9E1B000, v23, v24, "Handler invoking object is of type %s and not of type %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_1C9E2F398()
{
  swift_release();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  return v3(v0, v1);
}

uint64_t sub_1C9E2F3FC()
{
  swift_release();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_22_0();
  v2(v1);
  return v0;
}

uint64_t sub_1C9E2F450()
{
  return sub_1C9E2F480((void (*)(void))sub_1C9E2F3FC);
}

uint64_t MessageDispatchingBridgeBase.__deallocating_deinit()
{
  return sub_1C9E2F480((void (*)(void))MessageDispatchingBridgeBase.deinit);
}

uint64_t sub_1C9E2F480(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x1F4186488](v1, v2, v3);
}

uint64_t sub_1C9E2F4DC()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t sub_1C9E2F504()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t sub_1C9E2F530()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

SiriRequestDispatcher::MessageHandlerType_optional __swiftcall MessageHandlerType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C9E42E08();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1C9E2F5B8(unsigned __int8 *a1, char *a2)
{
  return sub_1C9E315D8(*a1, *a2);
}

uint64_t sub_1C9E2F5C4()
{
  return sub_1C9E2F5CC();
}

uint64_t sub_1C9E2F5CC()
{
  return sub_1C9E42EF8();
}

uint64_t sub_1C9E2F614()
{
  return sub_1C9E2F61C();
}

uint64_t sub_1C9E2F61C()
{
  sub_1C9E428F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E2F71C()
{
  return sub_1C9E2F724();
}

uint64_t sub_1C9E2F724()
{
  return sub_1C9E42EF8();
}

SiriRequestDispatcher::MessageHandlerType_optional sub_1C9E2F768(Swift::String *a1)
{
  return MessageHandlerType.init(rawValue:)(*a1);
}

unint64_t sub_1C9E2F774@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = MessageHandlerType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1C9E2F7CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1C9E2F7E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.MessageHandler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.CommandHandler()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_1C9E2F888()
{
  unint64_t result = qword_1EBCB2FF0;
  if (!qword_1EBCB2FF0)
  {
    sub_1C9E42528();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB2FF0);
  }
  return result;
}

uint64_t sub_1C9E2F8D8()
{
  return swift_getWitnessTable();
}

unint64_t sub_1C9E2F8F8()
{
  unint64_t result = qword_1EA5C9D98[0];
  if (!qword_1EA5C9D98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA5C9D98);
  }
  return result;
}

uint64_t sub_1C9E2F944()
{
  uint64_t result = sub_1C9E426F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MessageDispatchingBridgeBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessageDispatchingBridgeBase);
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.messageTypesForSubscription()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.aceCommandsGroups()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.aceCommands(forGroup:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.handleMessage(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.handle(_:executionContextInfo:reply:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerMessageHandler<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerCommandHandler<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t sub_1C9E2FBAC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1C9E2FBF0()
{
  uint64_t result = sub_1C9E426F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1C9E2FC8C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1C9E2FCC4()
{
  uint64_t result = sub_1C9E426F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageHandlerType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessageHandlerType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9E2FEB8);
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

unsigned char *sub_1C9E2FEE0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageHandlerType()
{
  return &type metadata for MessageHandlerType;
}

uint64_t sub_1C9E2FEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1C9E2FF04()
{
  return swift_retain();
}

uint64_t sub_1C9E2FF0C()
{
  return sub_1C9E2FF1C();
}

uint64_t sub_1C9E2FF1C()
{
  return swift_release();
}

uint64_t sub_1C9E2FF24(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1C9E2FF04();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1C9E2FF70(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1C9E2FF04();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1C9E2FF1C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_1C9E2FFDC(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1C9E2FF1C();
  return a1;
}

uint64_t sub_1C9E30024(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t sub_1C9E30064(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1C9E300A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1C9E300B0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.Method()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1C9E300D4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_aceId);
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  uint64_t v3 = sub_1C9E42898();

  return v3;
}

uint64_t sub_1C9E30138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9E301A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL OUTLINED_FUNCTION_9_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186488](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_1C9E426F8();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26_0(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 120) = v1;
  return swift_getMetatypeMetadata();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return v0;
}

void OUTLINED_FUNCTION_29_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_getTupleTypeMetadata2();
}

void OUTLINED_FUNCTION_32_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9E42C58();
}

uint64_t MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v24 = a7;
  OUTLINED_FUNCTION_1_3();
  uint64_t v14 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E21750(v7, (uint64_t)v26);
  sub_1C9E21750(a6, (uint64_t)v25);
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v14, (uint64_t)qword_1EBCB3C50);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v20, v14);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, unsigned char *, uint64_t, char *))(v8 + 352))(v11, v10, v26, v9, a5, v25, v24, v19);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(v7);
  return v21;
}

void *MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

void *MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v15 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v8 + qword_1EBCB3C48) = a7;
  sub_1C9E21750(a3, (uint64_t)v26);
  sub_1C9E21750(a6, (uint64_t)v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a8, v15);
  uint64_t v21 = MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(a1, a2, v26, v23, v24, v25, (uint64_t)v20);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a8, v15);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v21;
}

uint64_t MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = v7;
  OUTLINED_FUNCTION_1_3();
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C9E426F8();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBCB3C50);
  uint64_t v14 = sub_1C9E426E8();
  os_log_type_t v15 = sub_1C9E42B28();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1C9E1B000, v14, v15, "Attempting to initialize an XPCListeningBridge without an XPCListener, this is not supported. Please use a different implementation if an XPCListener is not required. ", v16, 2u);
    MEMORY[0x1CB791240](v16, -1, -1);
  }

  sub_1C9E21750(v6, (uint64_t)v22);
  sub_1C9E21750(a6, (uint64_t)v21);
  type metadata accessor for EmptyBridgeConnectionListener();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F29280]), sel_init);
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F29280]), sel_init);
  id v17 = sub_1C9E274A0();
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, unsigned char *, id))(v11 + 344))(v10, v9, v22, v8, a5, v21, v17);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(v6);
  return v18;
}

void MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
}

void MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:)()
{
}

void sub_1C9E309D8()
{
}

uint64_t MessageDispatchingXPCListeningBridgeBase.deinit()
{
  uint64_t v0 = MessageDispatchingBridgeBase.deinit();

  return v0;
}

uint64_t MessageDispatchingXPCListeningBridgeBase.__deallocating_deinit()
{
  uint64_t v0 = MessageDispatchingXPCListeningBridgeBase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9E30A74()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t sub_1C9E30A88()
{
  return swift_getWitnessTable();
}

uint64_t sub_1C9E30AA4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MessageDispatchingXPCListeningBridgeBase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for MessageDispatchingXPCListeningBridgeBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessageDispatchingXPCListeningBridgeBase);
}

uint64_t dispatch thunk of MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t FeatureChecker.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  FeatureChecker.init()();
  return v0;
}

unsigned char *FeatureChecker.init()()
{
  v0[16] = AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags();
  uint64_t v6 = &type metadata for IntelligenceFlowFeatureFlags;
  unint64_t v7 = sub_1C9E2B2C8();
  char v1 = sub_1C9E42538();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  v0[17] = v1 & 1;
  uint64_t v6 = &type metadata for IFFlowFeatureFlag;
  unint64_t v2 = sub_1C9E30C70();
  unint64_t v7 = v2;
  v5[0] = 0;
  char v3 = sub_1C9E42538();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  v0[18] = v3 & 1;
  uint64_t v6 = &type metadata for IFFlowFeatureFlag;
  unint64_t v7 = v2;
  v5[0] = 1;
  LOBYTE(v2) = sub_1C9E42538();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  v0[19] = v2 & 1;
  v0[20] = AFDeviceSupportsMuSessions();
  v0[21] = AFDeviceSupportsSiriMUX();
  v0[22] = AFDeviceSupportsBackgroundSession();
  return v0;
}

unint64_t sub_1C9E30C70()
{
  unint64_t result = qword_1EBCB3BE0;
  if (!qword_1EBCB3BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3BE0);
  }
  return result;
}

uint64_t FeatureChecker.isSystemAssistantExperienceSupported.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FeatureChecker.isIntelligenceFlowFeatureEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t FeatureChecker.isIFFlowEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t FeatureChecker.isReuseEagerChildRequestForIFEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t FeatureChecker.isMuSessionsEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t FeatureChecker.isMuxEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 21);
}

uint64_t FeatureChecker.isBackgroundSessionEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 22);
}

uint64_t FeatureChecker.isSystemAssistantExperienceEnabled.getter()
{
  return AFDeviceSupportsSAE();
}

uint64_t FeatureChecker.deinit()
{
  return v0;
}

uint64_t FeatureChecker.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 23, 7);
}

uint64_t sub_1C9E30D24()
{
  return FeatureChecker.isSystemAssistantExperienceSupported.getter() & 1;
}

uint64_t sub_1C9E30D4C()
{
  return FeatureChecker.isSystemAssistantExperienceEnabled.getter() & 1;
}

uint64_t sub_1C9E30D68()
{
  return FeatureChecker.isIntelligenceFlowFeatureEnabled.getter() & 1;
}

uint64_t sub_1C9E30D90()
{
  return FeatureChecker.isIFFlowEnabled.getter() & 1;
}

uint64_t sub_1C9E30DB8()
{
  return FeatureChecker.isReuseEagerChildRequestForIFEnabled.getter() & 1;
}

uint64_t sub_1C9E30DE0()
{
  return FeatureChecker.isMuSessionsEnabled.getter() & 1;
}

uint64_t sub_1C9E30E08()
{
  return FeatureChecker.isMuxEnabled.getter() & 1;
}

uint64_t sub_1C9E30E30()
{
  return FeatureChecker.isBackgroundSessionEnabled.getter() & 1;
}

uint64_t dispatch thunk of FeatureChecking.isSystemAssistantExperienceSupported.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureChecking.isSystemAssistantExperienceEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FeatureChecking.isIntelligenceFlowFeatureEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FeatureChecking.isIFFlowEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FeatureChecking.isReuseEagerChildRequestForIFEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FeatureChecking.isMuSessionsEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FeatureChecking.isMuxEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of FeatureChecking.isBackgroundSessionEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t type metadata accessor for FeatureChecker()
{
  return self;
}

uint64_t method lookup function for FeatureChecker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FeatureChecker);
}

uint64_t dispatch thunk of FeatureChecker.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t MUXErrors.hash(into:)()
{
  return sub_1C9E42EE8();
}

BOOL static MUXErrors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MUXErrors.hashValue.getter()
{
  return sub_1C9E42EF8();
}

unint64_t sub_1C9E30FDC()
{
  unint64_t result = qword_1EA5C9E20;
  if (!qword_1EA5C9E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C9E20);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MUXErrors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MUXErrors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9E31180);
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

ValueMetadata *type metadata accessor for MUXErrors()
{
  return &type metadata for MUXErrors;
}

uint64_t sub_1C9E311B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v41 = a4;
  uint64_t v45 = a3;
  uint64_t v43 = a2;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
  uint64_t v5 = MEMORY[0x1F4188790](v50);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v46 = (uint64_t)&v41 - v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v47 = (char *)&v41 - v9;
  sub_1C9E396F0(a1, v51);
  uint64_t v49 = v51[0];
  uint64_t v42 = v51[1];
  int64_t v52 = v51[3];
  unint64_t v10 = v51[4];
  int64_t v44 = (unint64_t)(v51[2] + 64) >> 6;
  uint64_t result = sub_1C9E42808();
  if (!v10) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  unint64_t v13 = v12 | (v52 << 6);
  while (1)
  {
    uint64_t v18 = v49;
    uint64_t v19 = *(void *)(v49 + 48);
    uint64_t v20 = sub_1C9E42688();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = v21;
    uint64_t v23 = v19 + *(void *)(v21 + 72) * v13;
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
    id v25 = v47;
    v24(v47, v23, v20);
    uint64_t v26 = *(void **)(*(void *)(v18 + 56) + 8 * v13);
    uint64_t v27 = v50;
    *(void *)&v25[*(int *)(v50 + 48)] = v26;
    uint64_t v28 = (uint64_t)v25;
    uint64_t v29 = v46;
    sub_1C9E398D4(v28, v46, &qword_1EA5C9E68);
    uint64_t v30 = *(int *)(v27 + 48);
    unint64_t v31 = v48;
    v24(v48, v29, v20);
    uint64_t v32 = *(void **)(v29 + v30);
    *(void *)&v31[v30] = v32;
    id v33 = v26;
    uint64_t v34 = sub_1C9E39380(v32, (SEL *)&selRef_personaIdentifier);
    if (v35)
    {
      if (v34 == v43 && v35 == v45)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v20);
LABEL_31:
        swift_release();
        uint64_t v40 = v41;
        sub_1C9E398D4(v29, v41, &qword_1EA5C9E68);
        uint64_t v38 = v40;
        uint64_t v39 = 0;
LABEL_32:
        __swift_storeEnumTagSinglePayload(v38, v39, 1, v50);
        return swift_bridgeObjectRelease();
      }
      char v37 = sub_1C9E42E48();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v20);
      if (v37) {
        goto LABEL_31;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v20);
    }
    uint64_t result = sub_1C9E39928(v29, &qword_1EA5C9E68);
    if (v10) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v14 = v52 + 1;
    if (__OFADD__(v52, 1)) {
      break;
    }
    if (v14 >= v44) {
      goto LABEL_29;
    }
    unint64_t v15 = *(void *)(v42 + 8 * v14);
    int64_t v16 = v52 + 1;
    if (!v15)
    {
      int64_t v16 = v52 + 2;
      if (v52 + 2 >= v44) {
        goto LABEL_29;
      }
      unint64_t v15 = *(void *)(v42 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v52 + 3;
        if (v52 + 3 >= v44) {
          goto LABEL_29;
        }
        unint64_t v15 = *(void *)(v42 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v52 + 4;
          if (v52 + 4 >= v44) {
            goto LABEL_29;
          }
          unint64_t v15 = *(void *)(v42 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v52 + 5;
            if (v52 + 5 >= v44) {
              goto LABEL_29;
            }
            unint64_t v15 = *(void *)(v42 + 8 * v16);
            if (!v15)
            {
              int64_t v17 = v52 + 6;
              while (v17 < v44)
              {
                unint64_t v15 = *(void *)(v42 + 8 * v17++);
                if (v15)
                {
                  int64_t v16 = v17 - 1;
                  goto LABEL_18;
                }
              }
LABEL_29:
              swift_release();
              uint64_t v38 = v41;
              uint64_t v39 = 1;
              goto LABEL_32;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v52 = v16;
  }
  __break(1u);
  return result;
}

BOOL sub_1C9E315CC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1C9E315D8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x80000001C9E446F0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000014;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v6 = "activeRequestStarter";
      goto LABEL_6;
    case 3:
      unint64_t v5 = 0xD000000000000017;
      uint64_t v6 = "activeRequestFinisher";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000018;
      uint64_t v6 = "candidateRequestStarter";
LABEL_6:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v3 = 0xEF72656873696E69;
      unint64_t v5 = 0x4674736575716572;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x636972656E6567;
      break;
  }
  unint64_t v7 = 0x80000001C9E446F0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v2 = 0xD000000000000015;
      uint64_t v8 = "activeRequestStarter";
      goto LABEL_13;
    case 3:
      unint64_t v2 = 0xD000000000000017;
      uint64_t v8 = "activeRequestFinisher";
      goto LABEL_13;
    case 4:
      unint64_t v2 = 0xD000000000000018;
      uint64_t v8 = "candidateRequestStarter";
LABEL_13:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v7 = 0xEF72656873696E69;
      unint64_t v2 = 0x4674736575716572;
      break;
    default:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x636972656E6567;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = OUTLINED_FUNCTION_41();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1C9E317A4()
{
  sub_1C9E42608();
  sub_1C9E39B7C(&qword_1EA5C9F68, MEMORY[0x1E4FA2460]);
  sub_1C9E42998();
  sub_1C9E42998();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_1C9E42E48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C9E31888()
{
  uint64_t v0 = sub_1C9E42688();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E42678();
  uint64_t v4 = sub_1C9E42668();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_1EA5C9E30 = v4;
  *(void *)algn_1EA5C9E38 = v6;
  return result;
}

uint64_t static MUXUtils.guestUserPersonaId.getter()
{
  if (qword_1EA5C9910 != -1) {
    swift_once();
  }
  sub_1C9E42808();
  return OUTLINED_FUNCTION_58();
}

uint64_t sub_1C9E319CC()
{
  uint64_t v0 = sub_1C9E42688();
  __swift_allocate_value_buffer(v0, qword_1EA5C9E40);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA5C9E40);
  return sub_1C9E42678();
}

uint64_t static MUXUtils.guestUserSharedUserId.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EA5C9918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C9E42688();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA5C9E40);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1C9E31AC0()
{
  uint64_t result = AFIsATVOnly();
  byte_1EA5C9E58 = result;
  return result;
}

uint64_t static MUXUtils.isATV.getter()
{
  if (qword_1EA5C9920 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return byte_1EA5C9E58;
}

uint64_t static MUXUtils.isATV.setter(char a1)
{
  if (qword_1EA5C9920 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_1EA5C9E58 = a1 & 1;
  return result;
}

uint64_t (*static MUXUtils.isATV.modify())()
{
  if (qword_1EA5C9920 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void static MUXUtils.logAllHomeMembers(from:)()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v2 = OUTLINED_FUNCTION_12_1(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_21_1();
  uint64_t v5 = v3 - v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_62();
  uint64_t v50 = v7;
  unint64_t v54 = 0xD000000000000019;
  unint64_t v55 = 0x80000001C9E45420;
  sub_1C9E42588();
  uint64_t v51 = 0;
  OUTLINED_FUNCTION_67();
  uint64_t v47 = v8;
  uint64_t v49 = v9;
  OUTLINED_FUNCTION_3_3();
  unint64_t v12 = v11 & v10;
  OUTLINED_FUNCTION_61();
  uint64_t v48 = v13;
  uint64_t v46 = v13 - 1;
  if (!v12) {
    goto LABEL_4;
  }
LABEL_2:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  uint64_t v15 = v50;
  unint64_t v16 = v14 | (v51 << 6);
  while (2)
  {
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_5_3();
    v17();
    uint64_t v18 = *(void *)(v49 + 56);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    uint64_t v20 = *(void **)(v18 + 8 * v16);
    *(void *)(v5 + *(int *)(v19 + 48)) = v20;
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v19);
    id v21 = v20;
    while (1)
    {
      sub_1C9E398D4(v5, v15, &qword_1EA5C9E60);
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      uint64_t v34 = OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_46(v34, v35, v33);
      if (v36)
      {
        swift_release();
        if (qword_1EBCB3548 == -1)
        {
LABEL_25:
          uint64_t v40 = sub_1C9E426F8();
          __swift_project_value_buffer(v40, (uint64_t)qword_1EBCB3C50);
          uint64_t v42 = v54;
          unint64_t v41 = v55;
          sub_1C9E42808();
          uint64_t v43 = sub_1C9E426E8();
          os_log_type_t v44 = sub_1C9E42B18();
          if (os_log_type_enabled(v43, v44))
          {
            uint64_t v45 = (uint8_t *)swift_slowAlloc();
            v52[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v45 = 136315138;
            sub_1C9E42808();
            id v53 = (id)sub_1C9E1F9C8(v42, v41, v52);
            sub_1C9E42C58();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C9E1B000, v43, v44, "%s", v45, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_5();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          OUTLINED_FUNCTION_3_0();
          return;
        }
LABEL_30:
        swift_once();
        goto LABEL_25;
      }
      char v37 = *(void **)(v15 + *(int *)(v33 + 48));
      OUTLINED_FUNCTION_10_3();
      v38();
      v52[0] = 91;
      v52[1] = 0xE100000000000000;
      sub_1C9E39B7C(&qword_1EA5C9E70, MEMORY[0x1E4FA26E0]);
      sub_1C9E42E18();
      sub_1C9E42908();
      swift_bridgeObjectRelease();
      sub_1C9E42908();
      id v53 = objc_msgSend(v37, sel_dictionary);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C9E78);
      sub_1C9E42C38();

      sub_1C9E42908();
      swift_bridgeObjectRelease();
      sub_1C9E42908();
      sub_1C9E42908();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_8_0();
      v39();
      if (v12) {
        goto LABEL_2;
      }
LABEL_4:
      uint64_t v15 = v50;
      uint64_t v22 = v51 + 1;
      if (__OFADD__(v51, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v22 < v48)
      {
        if (*(void *)(v47 + 8 * v22)) {
          goto LABEL_7;
        }
        uint64_t v27 = v51 + 2;
        ++v51;
        if (v22 + 1 < v48)
        {
          if (*(void *)(v47 + 8 * v27)) {
            goto LABEL_7;
          }
          uint64_t v51 = v22 + 1;
          if (v22 + 2 < v48)
          {
            if (*(void *)(v47 + 8 * (v22 + 2))) {
              goto LABEL_7;
            }
            uint64_t v28 = v22 + 3;
            uint64_t v51 = v22 + 2;
            if (v22 + 3 < v48) {
              break;
            }
          }
        }
      }
LABEL_20:
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      OUTLINED_FUNCTION_48(v5, v31, v32, v30);
      unint64_t v12 = 0;
    }
    if (*(void *)(v47 + 8 * v28))
    {
LABEL_7:
      OUTLINED_FUNCTION_15_1();
      unint64_t v12 = v24 & v23;
      unint64_t v16 = v26 + (v25 << 6);
      uint64_t v51 = v25;
      continue;
    }
    break;
  }
  while (!__OFADD__(v28, 1))
  {
    if (v28 + 1 >= v48)
    {
      uint64_t v51 = v46;
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_32_1();
    if (v29) {
      goto LABEL_7;
    }
  }
  __break(1u);
}

uint64_t static MUXUtils.isUnknownUser(_:)(void *a1)
{
  return sub_1C9E334C4(a1);
}

uint64_t static MUXUtils.isUnknownUser(withUserId:fromMUXContextMessage:)(uint64_t a1)
{
  uint64_t v2 = sub_1C9E42588();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_1C9E2924C(a1), (v4 & 1) != 0))
  {
    id v5 = *(id *)(*(void *)(v2 + 56) + 8 * v3);
    swift_bridgeObjectRelease();
    char v6 = static MUXUtils.isUnknownUser(_:)(v5);

    return v6 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 1;
  }
}

void static MUXUtils.getAllUserIds(from:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  v17[0] = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_21_1();
  uint64_t v7 = (char *)(v5 - v6);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v17 - v9;
  unint64_t v11 = sub_1C9E394AC(v1, (SEL *)&selRef_homeMembers, &qword_1EA5C9F88);
  v17[1] = MEMORY[0x1E4FBC870];
  if (!v11) {
    goto LABEL_16;
  }
  if (!(v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_1C9E42808();
    if (v12) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
LABEL_16:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  sub_1C9E42808();
  uint64_t v12 = sub_1C9E42DE8();
  if (!v12) {
    goto LABEL_15;
  }
LABEL_4:
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if ((v11 & 0xC000000000000001) != 0) {
        id v14 = (id)MEMORY[0x1CB7909C0](i, v11);
      }
      else {
        id v14 = *(id *)(v11 + 8 * i + 32);
      }
      uint64_t v15 = v14;
      sub_1C9E395A0(v14, (SEL *)&selRef_sharedUserId);
      if (v16)
      {
        sub_1C9E42658();
        sub_1C9E38224((uint64_t)v10, v7);

        (*(void (**)(char *, void))(v3 + 8))(v10, v17[0]);
      }
      else
      {
      }
    }
    goto LABEL_15;
  }
  __break(1u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  void *v51;
  void (*v52)(void);
  char *v53;
  void (*v54)(void);
  void (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_7_2();
  uint64_t v67 = v5;
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1F4188790](v6);
  uint64_t v66 = (char *)&v57 - v7;
  OUTLINED_FUNCTION_27_1();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_63(v9, v10, v11, v12, v13, v14, v15, v16, v57);
  int64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v18 = OUTLINED_FUNCTION_12_1(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x1F4188790](v19);
  id v21 = (char *)&v57 - v20;
  sub_1C9E42588();
  os_log_type_t v70 = MEMORY[0x1E4FBC870];
  OUTLINED_FUNCTION_67();
  id v59 = v22;
  OUTLINED_FUNCTION_3_3();
  uint64_t v25 = v24 & v23;
  OUTLINED_FUNCTION_61();
  id v69 = v3 + 16;
  uint64_t v60 = v26;
  os_log_type_t v61 = v3;
  uint64_t v63 = (void (**)(uint64_t))(v3 + 8);
  uint64_t v64 = v3 + 32;
  unint64_t v58 = v26 - 1;
  uint64_t v62 = v27;
  sub_1C9E42808();
  uint64_t v68 = 0;
  uint64_t v29 = v65;
  uint64_t v28 = (uint64_t)v66;
  if (!v25) {
    goto LABEL_4;
  }
LABEL_2:
  uint64_t v30 = __clz(__rbit64(v25));
  v25 &= v25 - 1;
  uint64_t v31 = v30 | (v68 << 6);
  while (2)
  {
    uint64_t v32 = v62;
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_5_3();
    v33();
    uint64_t v34 = *(void *)(v32 + 56);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    char v36 = *(void **)(v34 + 8 * v31);
    *(void *)(v0 + *(int *)(v35 + 48)) = v36;
    __swift_storeEnumTagSinglePayload(v0, 0, 1, v35);
    char v37 = v36;
    while (1)
    {
      sub_1C9E398D4(v0, (uint64_t)v21, &qword_1EA5C9E60);
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      OUTLINED_FUNCTION_46((uint64_t)v21, 1, v49);
      if (v50)
      {
        swift_release();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_0();
        return;
      }
      uint64_t v51 = *(void **)&v21[*(int *)(v49 + 48)];
      OUTLINED_FUNCTION_10_3();
      v52();
      id v53 = v67;
      OUTLINED_FUNCTION_5_3();
      v54();
      sub_1C9E38224(v28, v53);

      unint64_t v55 = *v63;
      uint64_t v56 = OUTLINED_FUNCTION_64();
      v55(v56);
      ((void (*)(uint64_t, uint64_t))v55)(v29, v1);
      if (v25) {
        goto LABEL_2;
      }
LABEL_4:
      uint64_t v38 = v68 + 1;
      if (__OFADD__(v68, 1))
      {
        __break(1u);
        goto LABEL_28;
      }
      if (v38 < v60)
      {
        if (*(void *)(v59 + 8 * v38)) {
          goto LABEL_7;
        }
        uint64_t v43 = v68 + 2;
        ++v68;
        if (v38 + 1 < v60)
        {
          if (*(void *)(v59 + 8 * v43)) {
            goto LABEL_7;
          }
          uint64_t v68 = v38 + 1;
          if (v38 + 2 < v60)
          {
            if (*(void *)(v59 + 8 * (v38 + 2))) {
              goto LABEL_7;
            }
            uint64_t v68 = v38 + 2;
            if (v38 + 3 < v60)
            {
              if (*(void *)(v59 + 8 * (v38 + 3))) {
                goto LABEL_7;
              }
              os_log_type_t v44 = v38 + 4;
              uint64_t v68 = v38 + 3;
              if (v38 + 4 < v60) {
                break;
              }
            }
          }
        }
      }
LABEL_22:
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      OUTLINED_FUNCTION_48(v0, v47, v48, v46);
      uint64_t v25 = 0;
    }
    if (*(void *)(v59 + 8 * v44))
    {
LABEL_7:
      OUTLINED_FUNCTION_15_1();
      uint64_t v25 = v40 & v39;
      uint64_t v31 = v42 + (v41 << 6);
      uint64_t v68 = v41;
      continue;
    }
    break;
  }
  while (!__OFADD__(v44, 1))
  {
    if (v44 + 1 >= v60)
    {
      uint64_t v68 = v58;
      goto LABEL_22;
    }
    OUTLINED_FUNCTION_32_1();
    if (v45) {
      goto LABEL_7;
    }
  }
LABEL_28:
  __break(1u);
}

void static MUXUtils.getUserIdToLoggableSharedUserIdDict(from:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v9 = OUTLINED_FUNCTION_12_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v67 - v11;
  uint64_t v13 = sub_1C9E427E8();
  sub_1C9E42588();
  OUTLINED_FUNCTION_67();
  uint64_t v69 = v14;
  OUTLINED_FUNCTION_3_3();
  uint64_t v17 = v16 & v15;
  OUTLINED_FUNCTION_61();
  uint64_t v73 = v3 + 16;
  uint64_t v74 = v3;
  uint64_t v78 = v3 + 32;
  uint64_t v79 = 0;
  uint64_t v76 = v18;
  uint64_t v77 = v3 + 8;
  uint64_t v70 = v19;
  uint64_t v71 = v7;
  uint64_t v68 = v19 - 1;
  unint64_t v75 = v12;
  uint64_t v72 = v0;
  if (!v17) {
    goto LABEL_4;
  }
LABEL_2:
  OUTLINED_FUNCTION_60();
  id v21 = (void *)(v20 | (v79 << 6));
  while (2)
  {
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_5_3();
    v22();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_35_0();
    *(void *)(v0 + v23) = v21;
    __swift_storeEnumTagSinglePayload(v0, 0, 1, v24);
    id v25 = v21;
    while (1)
    {
      sub_1C9E398D4(v0, (uint64_t)v12, &qword_1EA5C9E60);
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      uint64_t v38 = OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_46(v38, v39, v37);
      if (v40)
      {
        swift_release();
        OUTLINED_FUNCTION_3_0();
        return;
      }
      uint64_t v81 = v17;
      unint64_t v41 = *(void **)&v12[*(int *)(v37 + 48)];
      OUTLINED_FUNCTION_10_3();
      v42();
      uint64_t v43 = sub_1C9E42668();
      uint64_t v45 = v44;
      id v80 = v41;
      uint64_t v46 = sub_1C9E395A0(v41, (SEL *)&selRef_loggableMultiUserSharedUserId);
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = v46;
        uint64_t v50 = v1;
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v82 = v13;
        sub_1C9E291D4(v43, v45);
        OUTLINED_FUNCTION_51();
        if (v53)
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        unint64_t v54 = v51;
        char v55 = v52;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3510);
        if (sub_1C9E42DB8())
        {
          unint64_t v56 = sub_1C9E291D4(v43, v45);
          if ((v55 & 1) != (v57 & 1)) {
            goto LABEL_43;
          }
          unint64_t v54 = v56;
        }
        uint64_t v13 = v82;
        if (v55)
        {
          unint64_t v58 = (uint64_t *)(*(void *)(v82 + 56) + 16 * v54);
          swift_bridgeObjectRelease();
          *unint64_t v58 = v49;
          v58[1] = v48;
        }
        else
        {
          OUTLINED_FUNCTION_65(v82 + 8 * (v54 >> 6));
          uint64_t v62 = (uint64_t *)(v61 + 16 * v54);
          *uint64_t v62 = v43;
          v62[1] = v45;
          uint64_t v63 = (uint64_t *)(*(void *)(v13 + 56) + 16 * v54);
          *uint64_t v63 = v49;
          v63[1] = v48;
          uint64_t v64 = *(void *)(v13 + 16);
          BOOL v53 = __OFADD__(v64, 1);
          uint64_t v65 = v64 + 1;
          if (v53) {
            goto LABEL_41;
          }
          *(void *)(v13 + 16) = v65;
          sub_1C9E42808();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v1 = v50;
        uint64_t v0 = v72;
        uint64_t v12 = v75;
      }
      else
      {
        sub_1C9E42808();
        sub_1C9E291D4(v43, v45);
        char v60 = v59;
        swift_bridgeObjectRelease();
        if (v60)
        {
          swift_isUniquelyReferenced_nonNull_native();
          uint64_t v82 = v13;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3510);
          uint64_t v12 = v75;
          sub_1C9E42DB8();
          uint64_t v13 = v82;
          swift_bridgeObjectRelease();
          sub_1C9E42DC8();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v17 = v81;
      OUTLINED_FUNCTION_8_0();
      v66();
      if (v17) {
        goto LABEL_2;
      }
LABEL_4:
      uint64_t v26 = v79 + 1;
      if (__OFADD__(v79, 1)) {
        goto LABEL_40;
      }
      if (v26 < v70)
      {
        if (*(void *)(v69 + 8 * v26)) {
          goto LABEL_7;
        }
        uint64_t v31 = v79 + 2;
        ++v79;
        if (v26 + 1 < v70)
        {
          if (*(void *)(v69 + 8 * v31)) {
            goto LABEL_7;
          }
          uint64_t v79 = v26 + 1;
          if (v26 + 2 < v70)
          {
            if (*(void *)(v69 + 8 * (v26 + 2))) {
              goto LABEL_7;
            }
            uint64_t v32 = v26 + 3;
            uint64_t v79 = v26 + 2;
            if (v26 + 3 < v70) {
              break;
            }
          }
        }
      }
LABEL_20:
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      OUTLINED_FUNCTION_48(v0, v35, v36, v34);
      uint64_t v17 = 0;
    }
    if (*(void *)(v69 + 8 * v32))
    {
LABEL_7:
      OUTLINED_FUNCTION_15_1();
      uint64_t v17 = v28 & v27;
      id v21 = (void *)(v30 + (v29 << 6));
      uint64_t v79 = v29;
      continue;
    }
    break;
  }
  while (!__OFADD__(v32, 1))
  {
    if (v32 + 1 >= v70)
    {
      uint64_t v79 = v68;
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_32_1();
    if (v33) {
      goto LABEL_7;
    }
  }
LABEL_42:
  __break(1u);
LABEL_43:
  sub_1C9E42E68();
  __break(1u);
}

void static MUXUtils.getAllKnownUserIds(from:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9_3();
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v62 - v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v62 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v13 = OUTLINED_FUNCTION_12_1(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_29_1();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_62();
  uint64_t v76 = v15;
  uint64_t v16 = sub_1C9E42588();
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v65 = v16 + 64;
  v83[4] = MEMORY[0x1E4FBC870];
  uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  uint64_t v77 = v4 + 16;
  uint64_t v74 = v4 + 32;
  uint64_t v71 = v4;
  uint64_t v73 = (void (**)(char *, uint64_t))(v4 + 8);
  int64_t v69 = (unint64_t)(v18 + 63) >> 6;
  int64_t v63 = v69 - 1;
  uint64_t v21 = sub_1C9E42808();
  uint64_t v22 = 0;
  uint64_t v72 = v21;
  uint64_t v64 = v21 + 112;
  uint64_t v68 = v2;
  uint64_t v67 = v1;
  uint64_t v66 = v9;
  uint64_t v70 = v11;
  uint64_t v75 = v0;
  if (!v20) {
    goto LABEL_6;
  }
  while (2)
  {
    uint64_t v78 = (v20 - 1) & v20;
    int64_t v79 = v22;
    uint64_t v23 = (void *)(__clz(__rbit64(v20)) | (v22 << 6));
LABEL_5:
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_5_3();
    v24();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_35_0();
    *(void *)(v0 + v25) = v23;
    __swift_storeEnumTagSinglePayload(v0, 0, 1, v26);
    id v27 = v23;
LABEL_12:
    uint64_t v40 = v76;
    sub_1C9E398D4(v0, v76, &qword_1EA5C9E60);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_46(v40, 1, v41);
    if (v50)
    {
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_0();
      return;
    }
    uint64_t v42 = *(void **)(v40 + *(int *)(v41 + 48));
    OUTLINED_FUNCTION_10_3();
    v43();
    uint64_t v44 = sub_1C9E39324(v42);
    if (!v44) {
      goto LABEL_31;
    }
    uint64_t v45 = *(void *)(v44 + 16);
    if (!v45)
    {
LABEL_30:
      swift_bridgeObjectRelease();
      uint64_t v11 = v70;
LABEL_31:
      OUTLINED_FUNCTION_5_3();
      v52();
      sub_1C9E38224((uint64_t)v9, v1);

      BOOL v53 = *v73;
      (*v73)(v9, v2);
      v53(v11, v2);
      goto LABEL_32;
    }
    uint64_t v9 = (char *)(v44 + 32);
    sub_1C9E42808();
    while (1)
    {
      sub_1C9E205E4((uint64_t)v9, (uint64_t)v83);
      sub_1C9E205E4((uint64_t)v83, (uint64_t)&v82);
      int v46 = swift_dynamicCast();
      uint64_t v47 = v81;
      if (v46) {
        uint64_t v1 = v80;
      }
      else {
        uint64_t v1 = 0;
      }
      uint64_t v48 = sub_1C9E42898();
      if (!v46 || !v47)
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
        goto LABEL_28;
      }
      BOOL v50 = v1 == (char *)v48 && v47 == v49;
      if (v50) {
        break;
      }
      char v51 = sub_1C9E42E48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
      if (v51) {
        goto LABEL_35;
      }
LABEL_28:
      v9 += 32;
      if (!--v45)
      {
        swift_bridgeObjectRelease();
        uint64_t v2 = v68;
        OUTLINED_FUNCTION_66();
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
LABEL_35:
    swift_bridgeObjectRelease_n();
    uint64_t v11 = v70;
    uint64_t v2 = v68;
    OUTLINED_FUNCTION_8_0();
    v54();

    OUTLINED_FUNCTION_66();
LABEL_32:
    uint64_t v0 = v75;
    unint64_t v20 = v78;
    uint64_t v22 = v79;
    if (v78) {
      continue;
    }
    break;
  }
LABEL_6:
  if (!__OFADD__(v22, 1))
  {
    OUTLINED_FUNCTION_20_1();
    if (v29 == v30)
    {
      int64_t v36 = v28;
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_19_1();
    if (v32)
    {
LABEL_10:
      OUTLINED_FUNCTION_16_0();
      uint64_t v78 = v34;
      int64_t v79 = v33;
      uint64_t v23 = (void *)(v35 + (v33 << 6));
      goto LABEL_5;
    }
    int64_t v36 = v31;
    if (v31 + 1 < v69)
    {
      OUTLINED_FUNCTION_42();
      if (v57) {
        goto LABEL_10;
      }
      int64_t v36 = v56;
      if (v55 + 2 < v69)
      {
        if (*(void *)(v65 + 8 * (v55 + 2))) {
          goto LABEL_10;
        }
        int64_t v36 = v55 + 2;
        if (v55 + 3 < v69)
        {
          OUTLINED_FUNCTION_42();
          if (v59) {
            goto LABEL_10;
          }
          int64_t v36 = v58;
          OUTLINED_FUNCTION_20_1();
          if (v29 != v30)
          {
            OUTLINED_FUNCTION_19_1();
            if (v60) {
              goto LABEL_10;
            }
            while (1)
            {
              OUTLINED_FUNCTION_20_1();
              if (v29 == v30) {
                break;
              }
              if (*(void *)(v64 + 8 * v61)) {
                goto LABEL_10;
              }
            }
            int64_t v36 = v63;
          }
        }
      }
    }
LABEL_11:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_48(v0, v38, v39, v37);
    uint64_t v78 = 0;
    int64_t v79 = v36;
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t static MUXUtils.getUserIdForPrimaryUser(from:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_29;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_1C9E42808();
  if (!v2)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_3:
  uint64_t v3 = 0;
  unint64_t v4 = v1 & 0xC000000000000001;
  uint64_t v5 = v1 + 32;
  uint64_t v17 = v2;
  unint64_t v18 = v1;
  uint64_t v15 = v1 + 32;
  unint64_t v16 = v1 & 0xC000000000000001;
  while (1)
  {
    if (v4) {
      id v6 = (id)MEMORY[0x1CB7909C0](v3, v1);
    }
    else {
      id v6 = *(id *)(v5 + 8 * v3);
    }
    uint64_t v7 = v6;
    if (__OFADD__(v3++, 1))
    {
      __break(1u);
LABEL_29:
      OUTLINED_FUNCTION_52();
      uint64_t v2 = sub_1C9E42DE8();
      if (!v2) {
        goto LABEL_25;
      }
      goto LABEL_3;
    }
    uint64_t v9 = sub_1C9E39324(v6);
    if (v9) {
      break;
    }

LABEL_24:
    if (v3 == v2) {
      goto LABEL_25;
    }
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {

    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_14_1();
  while (1)
  {
    sub_1C9E205E4(v5, (uint64_t)v21);
    sub_1C9E205E4((uint64_t)v21, (uint64_t)v20);
    swift_dynamicCast();
    uint64_t v11 = OUTLINED_FUNCTION_33_1();
    if (!v4 || !v7)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      goto LABEL_20;
    }
    if (v2 == v11 && v7 == v12) {
      break;
    }
    uint64_t v2 = OUTLINED_FUNCTION_41();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
    if (v2) {
      goto LABEL_27;
    }
LABEL_20:
    v5 += 32;
    if (!--v10)
    {

      OUTLINED_FUNCTION_13_0();
      uint64_t v2 = v17;
      unint64_t v1 = v18;
      uint64_t v5 = v15;
      unint64_t v4 = v16;
      goto LABEL_24;
    }
  }
  OUTLINED_FUNCTION_28_1();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_27:
  OUTLINED_FUNCTION_13_0();
  swift_bridgeObjectRelease();
  return sub_1C9E39380(v19, (SEL *)&selRef_sharedUserId);
}

uint64_t static MUXUtils.isOwner(_:)(void *a1)
{
  return sub_1C9E334C4(a1);
}

uint64_t sub_1C9E334C4(void *a1)
{
  uint64_t result = sub_1C9E39324(a1);
  if (!result) {
    return result;
  }
  uint64_t v2 = *(void *)(result + 16);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v3 = result + 32;
  sub_1C9E42808();
  while (1)
  {
    sub_1C9E205E4(v3, (uint64_t)v13);
    sub_1C9E205E4((uint64_t)v13, (uint64_t)v12);
    int v4 = swift_dynamicCast();
    if (v4) {
      uint64_t v5 = v10;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = sub_1C9E42898();
    if (!v4 || !v11)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
      goto LABEL_16;
    }
    if (v5 == v6 && v11 == v7) {
      break;
    }
    char v9 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    if (v9) {
      goto LABEL_21;
    }
LABEL_16:
    v3 += 32;
    if (!--v2)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease_n();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
LABEL_21:
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t static MUXUtils.getUserIdForUnknownUserAsString(from:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_29;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_1C9E42808();
  if (!v2)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_3:
  uint64_t v3 = 0;
  unint64_t v4 = v1 & 0xC000000000000001;
  uint64_t v5 = v1 + 32;
  uint64_t v17 = v2;
  unint64_t v18 = v1;
  uint64_t v15 = v1 + 32;
  unint64_t v16 = v1 & 0xC000000000000001;
  while (1)
  {
    if (v4) {
      id v6 = (id)MEMORY[0x1CB7909C0](v3, v1);
    }
    else {
      id v6 = *(id *)(v5 + 8 * v3);
    }
    uint64_t v7 = v6;
    if (__OFADD__(v3++, 1))
    {
      __break(1u);
LABEL_29:
      OUTLINED_FUNCTION_52();
      uint64_t v2 = sub_1C9E42DE8();
      if (!v2) {
        goto LABEL_25;
      }
      goto LABEL_3;
    }
    uint64_t v9 = sub_1C9E39324(v6);
    if (v9) {
      break;
    }

LABEL_24:
    if (v3 == v2) {
      goto LABEL_25;
    }
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {

    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_14_1();
  while (1)
  {
    sub_1C9E205E4(v5, (uint64_t)v21);
    sub_1C9E205E4((uint64_t)v21, (uint64_t)v20);
    swift_dynamicCast();
    uint64_t v11 = OUTLINED_FUNCTION_33_1();
    if (!v4 || !v7)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      goto LABEL_20;
    }
    if (v2 == v11 && v7 == v12) {
      break;
    }
    uint64_t v2 = OUTLINED_FUNCTION_41();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
    if (v2) {
      goto LABEL_27;
    }
LABEL_20:
    v5 += 32;
    if (!--v10)
    {

      OUTLINED_FUNCTION_13_0();
      uint64_t v2 = v17;
      unint64_t v1 = v18;
      uint64_t v5 = v15;
      unint64_t v4 = v16;
      goto LABEL_24;
    }
  }
  OUTLINED_FUNCTION_28_1();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_27:
  OUTLINED_FUNCTION_13_0();
  swift_bridgeObjectRelease();
  return sub_1C9E39380(v19, (SEL *)&selRef_sharedUserId);
}

uint64_t static MUXUtils.getUserIdForUnknownUser(fromHomeMemberInfo:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  static MUXUtils.getUserIdForUnknownUserAsString(from:)(a1);
  if (v3)
  {
    sub_1C9E42658();
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  uint64_t v5 = sub_1C9E42688();
  return __swift_storeEnumTagSinglePayload(a2, v4, 1, v5);
}

uint64_t static MUXUtils.getUserIdForUnknownUser(fromHomeMemberInfoDict:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1C9E42808();
  uint64_t v3 = sub_1C9E3923C(v2);
  swift_bridgeObjectRelease();
  static MUXUtils.getUserIdForUnknownUserAsString(from:)((unint64_t)v3);
  if (v4)
  {
    sub_1C9E42658();
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = sub_1C9E42688();
  __swift_storeEnumTagSinglePayload(a1, v5, 1, v6);
  return swift_release();
}

void static MUXUtils.getUserIdForPersonaId(fromHomeMemberInfoDict:personaId:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v10 = OUTLINED_FUNCTION_12_1(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_30_1();
  uint64_t v11 = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_29_1();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_43();
  if (qword_1EA5C9910 != -1) {
    swift_once();
  }
  BOOL v16 = qword_1EA5C9E30 == v4 && *(void *)algn_1EA5C9E38 == v2;
  if (v16 || (sub_1C9E42E48() & 1) != 0)
  {
    if (qword_1EA5C9918 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v11, (uint64_t)qword_1EA5C9E40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v8, v17, v11);
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_3_0();
    __swift_storeEnumTagSinglePayload(v18, v19, v20, v21);
  }
  else
  {
    sub_1C9E42808();
    sub_1C9E311B8(v6, v4, v2, v0);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    uint64_t v24 = OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_46(v24, v25, v23);
    if (v16)
    {
      sub_1C9E39928(v0, &qword_1EA5C9E60);
      uint64_t v27 = v8;
      uint64_t v28 = 1;
    }
    else
    {

      uint64_t v26 = *(void (**)(void))(v13 + 32);
      OUTLINED_FUNCTION_34_0();
      v26();
      OUTLINED_FUNCTION_34_0();
      v26();
      OUTLINED_FUNCTION_34_0();
      v26();
      uint64_t v27 = v8;
      uint64_t v28 = 0;
    }
    __swift_storeEnumTagSinglePayload(v27, v28, 1, v11);
    OUTLINED_FUNCTION_3_0();
  }
}

void *static MUXUtils.homeMember(withUserId:from:)(uint64_t a1)
{
  uint64_t v2 = sub_1C9E42588();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_1C9E2924C(a1), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void **)(*(void *)(v2 + 56) + 8 * v3);
    id v6 = v5;
  }
  else
  {
    uint64_t v5 = 0;
  }
  swift_bridgeObjectRelease();
  return v5;
}

void static MUXUtils.singleKnownUserInHome(muxContextMessage:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E60);
  uint64_t v1 = OUTLINED_FUNCTION_12_1(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_21_1();
  uint64_t v4 = v2 - v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v47 - v6;
  sub_1C9E42588();
  int v55 = 0;
  int64_t v8 = 0;
  OUTLINED_FUNCTION_67();
  uint64_t v50 = v9;
  OUTLINED_FUNCTION_3_3();
  unint64_t v12 = v11 & v10;
  int64_t v51 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v52 = v14;
  int64_t v48 = v51 - 1;
  uint64_t v49 = v14 + 104;
  BOOL v53 = v7;
  uint64_t v54 = v4;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      uint64_t v16 = (v12 - 1) & v12;
      uint64_t v17 = (void *)(v15 | (v8 << 6));
      goto LABEL_4;
    }
    int64_t v22 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v22 >= v51)
    {
      int64_t v27 = v8;
LABEL_10:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
      uint64_t v28 = OUTLINED_FUNCTION_47();
      __swift_storeEnumTagSinglePayload(v28, v29, 1, v30);
      uint64_t v16 = 0;
      int64_t v8 = v27;
      goto LABEL_11;
    }
    if (!*(void *)(v50 + 8 * v22))
    {
      int64_t v27 = v8 + 1;
      if (v8 + 2 >= v51) {
        goto LABEL_10;
      }
      if (!*(void *)(v50 + 8 * (v8 + 2)))
      {
        int64_t v27 = v8 + 2;
        if (v8 + 3 >= v51) {
          goto LABEL_10;
        }
        if (!*(void *)(v50 + 8 * (v8 + 3)))
        {
          int64_t v27 = v8 + 3;
          if (v8 + 4 >= v51) {
            goto LABEL_10;
          }
          if (!*(void *)(v50 + 8 * (v8 + 4)))
          {
            while (v8 + 5 < v51)
            {
              if (*(void *)(v49 + 8 * v8++)) {
                goto LABEL_8;
              }
            }
            int64_t v27 = v48;
            goto LABEL_10;
          }
        }
      }
    }
LABEL_8:
    OUTLINED_FUNCTION_15_1();
    uint64_t v16 = v24 & v23;
    uint64_t v17 = (void *)(v26 + (v25 << 6));
    int64_t v8 = v25;
LABEL_4:
    sub_1C9E42688();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_5_3();
    v18();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_35_0();
    *(void *)(v4 + v19) = v17;
    __swift_storeEnumTagSinglePayload(v4, 0, 1, v20);
    id v21 = v17;
LABEL_11:
    sub_1C9E398D4(v4, (uint64_t)v7, &qword_1EA5C9E60);
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9E68);
    OUTLINED_FUNCTION_46((uint64_t)v7, 1, v31);
    if (v41)
    {
      swift_release();
      goto LABEL_49;
    }
    unint64_t v56 = v16;
    uint64_t v57 = v8;
    uint64_t v32 = *(void **)&v7[*(int *)(v31 + 48)];
    uint64_t v33 = sub_1C9E39324(v32);
    if (!v33)
    {

      goto LABEL_30;
    }
    uint64_t v34 = *(void *)(v33 + 16);
    if (!v34)
    {

      swift_bridgeObjectRelease();
LABEL_29:
      uint64_t v4 = v54;
LABEL_30:
      unint64_t v12 = v56;
      int64_t v8 = v57;
      if ((v55 & 1) == 0)
      {
        sub_1C9E42688();
        OUTLINED_FUNCTION_14();
        OUTLINED_FUNCTION_8_0();
        v43();
        int v55 = 1;
        continue;
      }
      swift_release();
      sub_1C9E42688();
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_8_0();
      v46();
LABEL_49:
      OUTLINED_FUNCTION_3_0();
      return;
    }
    uint64_t v35 = v33 + 32;
    sub_1C9E42808();
    while (1)
    {
      sub_1C9E205E4(v35, (uint64_t)v61);
      sub_1C9E205E4((uint64_t)v61, (uint64_t)&v60);
      int v36 = swift_dynamicCast();
      uint64_t v37 = v59;
      if (v36) {
        uint64_t v38 = v58;
      }
      else {
        uint64_t v38 = 0;
      }
      uint64_t v39 = sub_1C9E42898();
      if (!v36 || !v37)
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
        goto LABEL_27;
      }
      BOOL v41 = v38 == v39 && v37 == v40;
      if (v41) {
        break;
      }
      char v42 = OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
      if (v42) {
        goto LABEL_33;
      }
LABEL_27:
      v35 += 32;
      if (!--v34)
      {

        OUTLINED_FUNCTION_28_1();
        uint64_t v7 = v53;
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
LABEL_33:
    OUTLINED_FUNCTION_28_1();

    sub_1C9E42688();
    OUTLINED_FUNCTION_14();
    uint64_t v7 = v53;
    OUTLINED_FUNCTION_8_0();
    v44();
    uint64_t v4 = v54;
    unint64_t v12 = v56;
    int64_t v8 = v57;
  }
  __break(1u);
}

uint64_t static MUXUtils.isMUXEnabled()()
{
  return AFDeviceSupportsSiriMUX();
}

void static MUXUtils.convertToUserIDToSpeechPackageDict(sharedUserIdToSpeechRecognitionDict:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v51 = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_7_2();
  uint64_t v52 = v4;
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_43();
  uint64_t v43 = v6;
  uint64_t v44 = v2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  uint64_t v9 = v8 & *(void *)(v2 + 64);
  OUTLINED_FUNCTION_61();
  uint64_t v45 = v10;
  uint64_t v47 = v2;
  int64_t v48 = (void (**)(void))(v11 + 16);
  uint64_t v50 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  sub_1C9E42808();
  uint64_t v12 = 0;
  uint64_t v13 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v46 = v0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  OUTLINED_FUNCTION_60();
  uint64_t v49 = v12;
  for (unint64_t i = v14 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v47 + 56) + 8 * i);
    sub_1C9E42808();
    id v21 = v20;
    OUTLINED_FUNCTION_58();
    sub_1C9E42658();
    sub_1C9E29588(0, &qword_1EA5C9E88);
    id v22 = objc_allocWithZone(MEMORY[0x1E4F4E5E0]);
    id v23 = v21;
    id v24 = sub_1C9E345A4(v21, v21, objc_msgSend(v22, sel_init), 1, 0.0);
    uint64_t v25 = *v48;
    OUTLINED_FUNCTION_53();
    v25();
    if (v24)
    {
      id v26 = v24;
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v27 = sub_1C9E2924C(v52);
      if (__OFADD__(v13[2], (v28 & 1) == 0))
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      unint64_t v29 = v27;
      char v30 = v28;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C9E90);
      if (sub_1C9E42DB8())
      {
        unint64_t v31 = sub_1C9E2924C(v52);
        if ((v30 & 1) != (v32 & 1)) {
          goto LABEL_40;
        }
        unint64_t v29 = v31;
      }
      if (v30)
      {
        uint64_t v33 = v13[7];

        *(void *)(v33 + 8 * v29) = v26;
        uint64_t v34 = v51;
        uint64_t v35 = v52;
      }
      else
      {
        OUTLINED_FUNCTION_44((uint64_t)&v13[v29 >> 6]);
        uint64_t v34 = v51;
        uint64_t v35 = v52;
        OUTLINED_FUNCTION_53();
        v25();
        *(void *)(v13[7] + 8 * v29) = v26;
        uint64_t v40 = v13[2];
        BOOL v41 = __OFADD__(v40, 1);
        uint64_t v42 = v40 + 1;
        if (v41) {
          goto LABEL_38;
        }
        v13[2] = v42;
      }
      swift_bridgeObjectRelease();
      uint64_t v39 = *v50;
      (*v50)(v35, v34);
      uint64_t v12 = v49;
    }
    else
    {
      sub_1C9E42808();
      unint64_t v36 = sub_1C9E2924C(v52);
      char v38 = v37;
      swift_bridgeObjectRelease();
      if (v38)
      {
        swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C9E90);
        sub_1C9E42DB8();
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
        uint64_t v34 = v51;
        v39(v13[6] + *(void *)(v43 + 72) * v36, v51);
        id v26 = *(id *)(v13[7] + 8 * v36);
        sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
        sub_1C9E42DC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v26 = 0;
        uint64_t v34 = v51;
        uint64_t v39 = *v50;
      }
      uint64_t v12 = v49;
      v39(v52, v34);
    }

    v39(v46, v34);
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    uint64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_37;
    }
    if (v16 >= v45) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v44 + 8 * v16);
    uint64_t v18 = v12 + 1;
    if (!v17)
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v45) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v44 + 8 * v18);
      if (!v17)
      {
        uint64_t v18 = v12 + 3;
        if (v12 + 3 >= v45) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v44 + 8 * v18);
        if (!v17) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v9 = (v17 - 1) & v17;
    uint64_t v49 = v18;
  }
  uint64_t v19 = v12 + 4;
  if (v12 + 4 >= v45)
  {
LABEL_35:
    swift_release();
    OUTLINED_FUNCTION_3_0();
    return;
  }
  unint64_t v17 = *(void *)(v44 + 8 * v19);
  if (v17)
  {
    uint64_t v18 = v12 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    uint64_t v18 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v18 >= v45) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v44 + 8 * v18);
    ++v19;
    if (v17) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  sub_1C9E42E68();
  __break(1u);
}

id sub_1C9E345A4(void *a1, void *a2, void *a3, char a4, double a5)
{
  id v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4 & 1, a5);

  return v8;
}

void static MUXUtils.voiceIdentificationSignal(withRequestId:requestType:isPersonalRequest:isServerFallback:voiceIdClassification:voiceIdOverridden:selectedUserId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_5_0();
  char v72 = v23;
  char v76 = v24;
  uint64_t v75 = v25;
  char v27 = v26;
  char v74 = v28;
  uint64_t v73 = v29;
  uint64_t v31 = v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EA0);
  uint64_t v33 = OUTLINED_FUNCTION_12_1(v32);
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_30_1();
  uint64_t v34 = sub_1C9E42528();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v35;
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_4();
  uint64_t v40 = v39 - v38;
  uint64_t v41 = sub_1C9E42608();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_26();
  if (v27)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_1C9E426F8();
    uint64_t v46 = OUTLINED_FUNCTION_4_1(v45, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v47 = sub_1C9E42B18();
    if (!OUTLINED_FUNCTION_11_1(v47)) {
      goto LABEL_21;
    }
    int64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v48 = 0;
    uint64_t v49 = "Not sending VoiceIdentificationSignal in case of server fallback";
LABEL_20:
    _os_log_impl(&dword_1C9E1B000, v46, (os_log_type_t)v40, v49, v48, 2u);
    OUTLINED_FUNCTION_5();
LABEL_21:

    goto LABEL_30;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v22, *MEMORY[0x1E4FA2448], v41);
  char v50 = sub_1C9E317A4();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v22, v41);
  if ((v50 & 1) == 0)
  {
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_1C9E426F8();
    uint64_t v46 = OUTLINED_FUNCTION_4_1(v62, (uint64_t)qword_1EBCB3C50);
    os_log_type_t v63 = sub_1C9E42B18();
    if (!OUTLINED_FUNCTION_11_1(v63)) {
      goto LABEL_21;
    }
    int64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v48 = 0;
    uint64_t v49 = "Not sending VoiceIdentification since this is not a speech request";
    goto LABEL_20;
  }
  id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F969E0]), sel_init);
  sub_1C9E42518();
  uint64_t v52 = sub_1C9E424E8();
  uint64_t v54 = v53;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v40, v34);
  sub_1C9E395FC(v52, v54, v51, (SEL *)&selRef_setAceId_);
  id v55 = v51;
  sub_1C9E393EC(v31, v73, v55);

  objc_msgSend(v55, sel_setRecordUserAudio_, (v74 & 1) == 0);
  BOOL v57 = (v76 & 1) == 0 && (unint64_t)(v75 - 3) < 2;
  sub_1C9E39444(a21, v21);
  uint64_t v58 = sub_1C9E42688();
  uint64_t v59 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v59, v60, v58);
  if (v61)
  {
    sub_1C9E39928(v21, &qword_1EA5C9EA0);
  }
  else
  {
    uint64_t v64 = sub_1C9E42668();
    uint64_t v66 = v65;
    OUTLINED_FUNCTION_8_0();
    v67();
    if (v57 && (v72 & 1) == 0)
    {
      sub_1C9E395FC(v64, v66, v55, (SEL *)&selRef_setSelectedSharedUserId_);
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v68 = sub_1C9E426F8();
  int64_t v69 = OUTLINED_FUNCTION_4_1(v68, (uint64_t)qword_1EBCB3C50);
  os_log_type_t v70 = sub_1C9E42B18();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = swift_slowAlloc();
    *(_DWORD *)uint64_t v71 = 67109376;
    sub_1C9E42C58();
    *(_WORD *)(v71 + 8) = 1024;
    sub_1C9E42C58();
    _os_log_impl(&dword_1C9E1B000, v69, v70, "Not updating selectedSharedUserId in VoiceIdentificationSignal because either selectedUserId is nil or isConfidentEnough: %{BOOL}d, voiceIDOverridden: %{BOOL}d", (uint8_t *)v71, 0xEu);
    OUTLINED_FUNCTION_5();
  }

LABEL_30:
  OUTLINED_FUNCTION_3_0();
}

void static MUXUtils.selectUserForTextRequest(userIdToHomeMember:)(uint64_t a1)
{
  sub_1C9E396F0(a1, v29);
  uint64_t v4 = v29[0];
  uint64_t v5 = v29[1];
  OUTLINED_FUNCTION_54();
  swift_bridgeObjectRetain_n();
  uint64_t v23 = v4;
  uint64_t v20 = v2;
  uint64_t v21 = v5;
  while (1)
  {
    while (1)
    {
LABEL_2:
      if (v1)
      {
        OUTLINED_FUNCTION_31_1();
      }
      else
      {
        uint64_t v7 = v3 + 1;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          return;
        }
        if (v7 >= v2) {
          goto LABEL_43;
        }
        if (!*(void *)(v5 + 8 * v7))
        {
          if (v3 + 2 >= v2) {
            goto LABEL_43;
          }
          if (!*(void *)(v5 + 8 * (v3 + 2)))
          {
            if (v3 + 3 >= v2) {
              goto LABEL_43;
            }
            if (!*(void *)(v5 + 8 * (v3 + 3)))
            {
              if (v3 + 4 >= v2) {
                goto LABEL_43;
              }
              if (!*(void *)(v5 + 8 * (v3 + 4)))
              {
                if (v3 + 5 >= v2) {
                  goto LABEL_43;
                }
                if (!*(void *)(v5 + 8 * (v3 + 5)))
                {
                  if (v3 + 6 >= v2) {
                    goto LABEL_43;
                  }
                  if (!*(void *)(v5 + 8 * (v3 + 6)))
                  {
                    uint64_t v8 = v3 + 7;
                    while (v8 < v2)
                    {
                      if (*(void *)(v5 + 8 * v8++)) {
                        goto LABEL_20;
                      }
                    }
LABEL_43:
                    swift_bridgeObjectRelease();
                    swift_release();
                    goto LABEL_44;
                  }
                }
              }
            }
          }
        }
LABEL_20:
        OUTLINED_FUNCTION_24_1();
      }
      id v10 = *(id *)(*(void *)(v4 + 56) + 8 * v6);
      uint64_t v11 = sub_1C9E39324(v10);
      if (v11) {
        break;
      }
    }
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12) {
      break;
    }

    swift_bridgeObjectRelease();
  }
  char v24 = v10;
  OUTLINED_FUNCTION_14_1();
  while (1)
  {
    sub_1C9E205E4(v2, (uint64_t)v28);
    sub_1C9E205E4((uint64_t)v28, (uint64_t)v27);
    int v13 = swift_dynamicCast();
    if (v13) {
      uint64_t v14 = v25;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = sub_1C9E42898();
    if (!v13 || !v26)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
      goto LABEL_36;
    }
    if (v14 == v15 && v26 == v16) {
      break;
    }
    char v18 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    if (v18) {
      goto LABEL_41;
    }
LABEL_36:
    v2 += 32;
    if (!--v12)
    {

      OUTLINED_FUNCTION_13_0();
      uint64_t v3 = v22;
      uint64_t v4 = v23;
      uint64_t v2 = v20;
      uint64_t v5 = v21;
      goto LABEL_2;
    }
  }
  OUTLINED_FUNCTION_28_1();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
LABEL_41:
  OUTLINED_FUNCTION_13_0();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C9E39380(v24, (SEL *)&selRef_sharedUserId);
  if (v19)
  {
    sub_1C9E42658();
    return;
  }
LABEL_44:
  sub_1C9E42678();
}

id static MUXUtils.generateHighConfidenceScoreCardForTextRequest(userId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_26();
  sub_1C9E42678();
  uint64_t v9 = sub_1C9E42668();
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  if (v9 != a1 || v11 != a2)
  {
    char v13 = OUTLINED_FUNCTION_41();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_9;
    }
    sub_1C9E29588(0, &qword_1EA5C9EA8);
    sub_1C9E42C08();
    OUTLINED_FUNCTION_50();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EB0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C9E43E10;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    sub_1C9E42808();
    *(void *)(inited + 48) = sub_1C9E42C08();
    sub_1C9E427E8();
    OUTLINED_FUNCTION_38_0();
    id v15 = objc_allocWithZone(MEMORY[0x1E4F4E678]);
    uint64_t v16 = sub_1C9E42808();
    id result = OUTLINED_FUNCTION_6_2(v16, v17, v18, v19, v20, v21, v22, v23, v34, v35, v36);
    if (result) {
      return result;
    }
    __break(1u);
  }
  swift_bridgeObjectRelease();
LABEL_9:
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  sub_1C9E42C08();
  sub_1C9E42C08();
  sub_1C9E427E8();
  OUTLINED_FUNCTION_38_0();
  id v25 = objc_allocWithZone(MEMORY[0x1E4F4E678]);
  uint64_t v26 = sub_1C9E42808();
  id result = OUTLINED_FUNCTION_6_2(v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
  if (!result) {
    __break(1u);
  }
  return result;
}

void static MUXUtils.generateDefaultVoiceIdScoreCard(withRMVEnabled:_:_:_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  char v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EA0);
  uint64_t v8 = OUTLINED_FUNCTION_12_1(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = (uint64_t *)sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = (void (**)(uint64_t, uint64_t, uint64_t *))v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_4();
  uint64_t v18 = v17 - v16;
  if (v6)
  {
    sub_1C9E39444((uint64_t)v2, v11);
    OUTLINED_FUNCTION_46(v11, 1, (uint64_t)v12);
    if (v19)
    {
      sub_1C9E39928(v11, &qword_1EA5C9EA0);
      if (qword_1EBCB3548 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_1C9E426F8();
      uint64_t v21 = OUTLINED_FUNCTION_4_1(v20, (uint64_t)qword_1EBCB3C50);
      os_log_type_t v22 = sub_1C9E42B28();
      if (!OUTLINED_FUNCTION_11_1(v22)) {
        goto LABEL_32;
      }
      uint64_t v23 = (float *)OUTLINED_FUNCTION_40_0();
      *uint64_t v23 = 1.5047e-36;
      LODWORD(v81[0]) = 1;
      sub_1C9E42C58();
      char v24 = "generateDefaultIdentityScoreCard: Unknown user id not available when RMV=%{BOOL}d";
      goto LABEL_31;
    }
    v14[4](v18, v11, v12);
    if (v4 >> 62)
    {
      sub_1C9E42808();
      uint64_t v38 = sub_1C9E42DE8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v38 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v79 = (uint64_t)v14;
    id v80 = v12;
    if (v38)
    {
      uint64_t v78 = v18;
      v81[0] = MEMORY[0x1E4FBC860];
      uint64_t v2 = v81;
      sub_1C9E38120(0, v38 & ~(v38 >> 63), 0);
      if (v38 < 0)
      {
        __break(1u);
LABEL_61:
        swift_once();
LABEL_29:
        uint64_t v49 = sub_1C9E426F8();
        uint64_t v21 = OUTLINED_FUNCTION_4_1(v49, (uint64_t)qword_1EBCB3C50);
        os_log_type_t v50 = sub_1C9E42B28();
        if (OUTLINED_FUNCTION_11_1(v50))
        {
          uint64_t v23 = (float *)OUTLINED_FUNCTION_40_0();
          OUTLINED_FUNCTION_17_1(v23, 1.5047e-36);
          char v24 = "generateDefaultVoiceIdScoreCard: Primary user is missing from homemebers list when RMV=%{BOOL}d";
LABEL_31:
          _os_log_impl(&dword_1C9E1B000, v21, (os_log_type_t)v2, v24, (uint8_t *)v23, 8u);
          OUTLINED_FUNCTION_5();
          goto LABEL_32;
        }
        goto LABEL_32;
      }
      uint64_t v0 = 0;
      uint64_t v2 = (void *)v81[0];
      while ((void *)v38 != v0)
      {
        uint64_t v39 = v2;
        if ((v4 & 0xC000000000000001) != 0) {
          id v40 = (id)MEMORY[0x1CB7909C0](v0, v4);
        }
        else {
          id v40 = *(id *)(v4 + 8 * (void)v0 + 32);
        }
        uint64_t v41 = v40;
        uint64_t v42 = sub_1C9E395A0(v40, (SEL *)&selRef_sharedUserId);
        if (!v43)
        {
          __break(1u);
LABEL_63:
          sub_1C9E42E68();
          __break(1u);
          return;
        }
        uint64_t v44 = v42;
        uint64_t v45 = v43;

        uint64_t v2 = v39;
        v81[0] = v39;
        unint64_t v47 = v39[2];
        unint64_t v46 = v39[3];
        uint64_t v14 = (void (**)(uint64_t, uint64_t, uint64_t *))(v47 + 1);
        if (v47 >= v46 >> 1)
        {
          sub_1C9E38120((char *)(v46 > 1), v47 + 1, 1);
          uint64_t v2 = (void *)v81[0];
        }
        uint64_t v0 = (char *)v0 + 1;
        v2[2] = v14;
        int64_t v48 = &v2[2 * v47];
        v48[4] = v44;
        v48[5] = v45;
        if ((void *)v38 == v0) {
          goto LABEL_37;
        }
      }
    }
    else
    {
      uint64_t v2 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v14 = *(void (***)(uint64_t, uint64_t, uint64_t *))(MEMORY[0x1E4FBC860] + 16);
      if (!v14)
      {
        unint64_t v4 = MEMORY[0x1E4FBC868];
LABEL_48:
        swift_bridgeObjectRelease();
        uint64_t v70 = sub_1C9E42668();
        uint64_t v72 = v71;
        sub_1C9E29588(0, &qword_1EA5C9EA8);
        sub_1C9E42C08();
        OUTLINED_FUNCTION_50();
        uint64_t v73 = (void *)OUTLINED_FUNCTION_38_0();
        sub_1C9E42638();
        char v74 = (void *)sub_1C9E42EC8();
        sub_1C9E35844(v4, v70, v72, 0, v12, 0, v73, 0, 0, 0, 0, v74);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        (*(void (**)(uint64_t, uint64_t *))(v79 + 8))(v18, v80);
        goto LABEL_49;
      }
      uint64_t v78 = v18;
LABEL_37:
      sub_1C9E29588(0, &qword_1EA5C9EA8);
      sub_1C9E42808();
      uint64_t v77 = (uint64_t)v2;
      uint64_t v12 = v2 + 5;
      unint64_t v4 = MEMORY[0x1E4FBC868];
      while (1)
      {
        uint64_t v57 = *(v12 - 1);
        uint64_t v56 = *v12;
        sub_1C9E42808();
        uint64_t v58 = sub_1C9E42C08();
        swift_isUniquelyReferenced_nonNull_native();
        v81[0] = v4;
        LOBYTE(v2) = v4;
        sub_1C9E291D4(v57, v56);
        OUTLINED_FUNCTION_51();
        if (v61) {
          break;
        }
        unint64_t v62 = v59;
        uint64_t v0 = v60;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EB8);
        uint64_t v2 = v81;
        if (sub_1C9E42DB8())
        {
          LOBYTE(v2) = v81[0];
          unint64_t v63 = sub_1C9E291D4(v57, v56);
          if ((v0 & 1) != (v64 & 1)) {
            goto LABEL_63;
          }
          unint64_t v62 = v63;
        }
        unint64_t v4 = v81[0];
        if (v0)
        {
          uint64_t v65 = *(void *)(v81[0] + 56);

          *(void *)(v65 + 8 * v62) = v58;
        }
        else
        {
          OUTLINED_FUNCTION_65(v81[0] + 8 * (v62 >> 6));
          uint64_t v67 = (uint64_t *)(v66 + 16 * v62);
          *uint64_t v67 = v57;
          v67[1] = v56;
          *(void *)(*(void *)(v4 + 56) + 8 * v62) = v58;
          uint64_t v68 = *(void *)(v4 + 16);
          BOOL v61 = __OFADD__(v68, 1);
          uint64_t v69 = v68 + 1;
          if (v61) {
            goto LABEL_57;
          }
          *(void *)(v4 + 16) = v69;
          sub_1C9E42808();
        }
        v12 += 2;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v14 = (void (**)(uint64_t, uint64_t, uint64_t *))((char *)v14 - 1);
        if (!v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = v78;
          goto LABEL_48;
        }
      }
      __break(1u);
    }
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (qword_1EA5C9920 != -1) {
LABEL_58:
  }
    swift_once();
  swift_beginAccess();
  if (byte_1EA5C9E58 == 1)
  {
    static MUXUtils.getUserIdForPrimaryUser(from:)(v4);
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    if (!v26)
    {
      uint64_t v51 = static MUXUtils.getUserIdForUnknownUserAsString(from:)(v4);
      if (v52)
      {
        uint64_t v53 = v51;
        uint64_t v54 = v52;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EB0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1C9E43E10;
        *(void *)(inited + 32) = v53;
        *(void *)(inited + 40) = v54;
        sub_1C9E29588(0, &qword_1EA5C9EA8);
        sub_1C9E42808();
        *(void *)(inited + 48) = sub_1C9E42C08();
        sub_1C9E427E8();
        uint64_t v32 = (void *)OUTLINED_FUNCTION_50();
        sub_1C9E42C08();
        uint64_t v33 = (void *)OUTLINED_FUNCTION_38_0();
        sub_1C9E42638();
        sub_1C9E42EC8();
        uint64_t v34 = OUTLINED_FUNCTION_25_1();
        uint64_t v37 = 0;
        goto LABEL_13;
      }
      if (qword_1EBCB3548 != -1) {
        swift_once();
      }
      uint64_t v75 = sub_1C9E426F8();
      uint64_t v21 = OUTLINED_FUNCTION_4_1(v75, (uint64_t)qword_1EBCB3C50);
      os_log_type_t v76 = sub_1C9E42B28();
      if (OUTLINED_FUNCTION_11_1(v76))
      {
        uint64_t v23 = (float *)OUTLINED_FUNCTION_40_0();
        OUTLINED_FUNCTION_17_1(v23, 1.5047e-36);
        char v24 = "generateDefaultVoiceIdScoreCard: Unknown user missing from homemebers list when RMV=%{BOOL}d";
        goto LABEL_31;
      }
LABEL_32:

      goto LABEL_49;
    }
  }
  uint64_t v27 = static MUXUtils.getUserIdForPrimaryUser(from:)(v4);
  if (!v28)
  {
    if (qword_1EBCB3548 == -1) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
  uint64_t v29 = v27;
  uint64_t v30 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EB0);
  uint64_t v31 = swift_initStackObject();
  *(_OWORD *)(v31 + 16) = xmmword_1C9E43E10;
  *(void *)(v31 + 32) = v29;
  *(void *)(v31 + 40) = v30;
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  sub_1C9E42808();
  *(void *)(v31 + 48) = sub_1C9E42C08();
  sub_1C9E427E8();
  uint64_t v32 = (void *)OUTLINED_FUNCTION_50();
  sub_1C9E42C08();
  uint64_t v33 = (void *)OUTLINED_FUNCTION_38_0();
  sub_1C9E42638();
  sub_1C9E42EC8();
  uint64_t v34 = OUTLINED_FUNCTION_25_1();
  uint64_t v37 = 4;
LABEL_13:
  sub_1C9E35844(v34, v35, v36, v37, v32, v14, v33, 0, v77, v78, v79, v80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_49:
  OUTLINED_FUNCTION_3_0();
}

id sub_1C9E35844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = a5;
  v17[3] = a6;
  v17[4] = a1;
  v17[5] = a7;
  v17[6] = a8;
  v17[7] = a9;
  v17[8] = a10;
  v17[9] = a11;
  v17[10] = a2;
  v17[11] = a3;
  v17[12] = a4;
  v17[13] = a12;
  id v18 = objc_allocWithZone(MEMORY[0x1E4F4E678]);
  sub_1C9E42808();
  sub_1C9E42808();
  id v19 = a12;
  id v20 = a5;
  id v21 = a6;
  sub_1C9E42808();
  id v22 = a7;
  sub_1C9E42808();
  id v23 = sub_1C9E37DA8((uint64_t)sub_1C9E39890, (uint64_t)v17);
  swift_release();
  return v23;
}

id sub_1C9E35958(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (result)
  {
    uint64_t v16 = result;
    objc_msgSend(result, sel_setSpIdAudioProcessedDuration_, a2);
    objc_msgSend(v16, sel_setSpIdUnknownUserScore_, a3);
    sub_1C9E29588(0, &qword_1EA5C9EA8);
    uint64_t v17 = (void *)sub_1C9E427B8();
    objc_msgSend(v16, sel_setSpIdKnownUserScores_, v17);

    objc_msgSend(v16, sel_setSpIdUserScoresVersion_, a5);
    if (a7) {
      id v18 = (void *)sub_1C9E42888();
    }
    else {
      id v18 = 0;
    }
    objc_msgSend(v16, sel_setSpIdScoreThresholdingType_, v18);

    if (a9) {
      id v19 = (void *)sub_1C9E42888();
    }
    else {
      id v19 = 0;
    }
    objc_msgSend(v16, sel_setSpIdAssetVersion_, v19);

    id v20 = (void *)sub_1C9E42888();
    objc_msgSend(v16, sel_setUserClassified_, v20);

    objc_msgSend(v16, sel_setUserIdentityClassification_, a12);
    return objc_msgSend(v16, sel_setLowScoreThreshold_, a13);
  }
  return result;
}

uint64_t Dictionary<>.toEncodableDictionary()(uint64_t a1, uint64_t a2)
{
  v92[1] = *(id *)MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_2_0();
  uint64_t v80 = v8;
  uint64_t v9 = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_7_2();
  uint64_t v90 = v13;
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_62();
  uint64_t v91 = v15;
  uint64_t v84 = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v82 = sub_1C9E42C48();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v69 = a1 + 64;
  OUTLINED_FUNCTION_26_1();
  uint64_t v88 = (void (**)(void))(v11 + 16);
  uint64_t v71 = v6 + 16;
  uint64_t v81 = v20 + 32;
  uint64_t v78 = v6 + 32;
  uint64_t v79 = v11 + 32;
  uint64_t v72 = v6;
  uint64_t v83 = v11;
  os_log_type_t v76 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v77 = v6 + 8;
  uint64_t v22 = v21;
  OUTLINED_FUNCTION_49((uint64_t)&v93);
  uint64_t v73 = a1;
  sub_1C9E42808();
  uint64_t v23 = 0;
  char v24 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v74 = v22;
  uint64_t v75 = v19;
  if (!v2) {
    goto LABEL_4;
  }
LABEL_2:
  OUTLINED_FUNCTION_59();
  uint64_t v86 = v25;
  uint64_t v87 = v2;
LABEL_3:
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_5_3();
  v26();
  OUTLINED_FUNCTION_5_3();
  v27();
  uint64_t v28 = 0;
  while (1)
  {
    uint64_t v35 = TupleTypeMetadata2;
    __swift_storeEnumTagSinglePayload((uint64_t)v19, v28, 1, TupleTypeMetadata2);
    OUTLINED_FUNCTION_10_3();
    v36();
    if (__swift_getEnumTagSinglePayload(v22, 1, v35) == 1)
    {
      swift_release();
      return (uint64_t)v24;
    }
    OUTLINED_FUNCTION_10_3();
    v37();
    uint64_t v38 = self;
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_10_3();
    v39();
    OUTLINED_FUNCTION_64();
    uint64_t v40 = sub_1C9E42E38();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_8_0();
    v41();
    v92[0] = 0;
    id v42 = objc_msgSend(v38, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v40, 1, v92);
    swift_unknownObjectRelease();
    id v43 = v92[0];
    if (!v42)
    {
      uint64_t v65 = v43;
      swift_bridgeObjectRelease();
      sub_1C9E424B8();

      swift_willThrow();
      OUTLINED_FUNCTION_8_0();
      v66();
      swift_release();
      return (uint64_t)v24;
    }
    uint64_t v44 = sub_1C9E424C8();
    unint64_t v46 = v45;

    unint64_t v47 = *v88;
    uint64_t v48 = v90;
    OUTLINED_FUNCTION_53();
    v47();
    uint64_t v85 = v44;
    unint64_t v49 = v46;
    sub_1C9E39728(v44, v46);
    swift_isUniquelyReferenced_nonNull_native();
    v92[0] = v24;
    unint64_t v50 = sub_1C9E2924C(v48);
    if (__OFADD__(v24[2], (v51 & 1) == 0))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
    }
    unint64_t v52 = v50;
    char v53 = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EC0);
    char v54 = sub_1C9E42DB8();
    id v19 = v75;
    if (v54) {
      break;
    }
LABEL_17:
    char v24 = v92[0];
    if (v53)
    {
      uint64_t v57 = *((void *)v92[0] + 7) + 16 * v52;
      sub_1C9E295C4(*(void *)v57, *(void *)(v57 + 8));
      uint64_t v58 = v85;
      *(void *)uint64_t v57 = v85;
      *(void *)(v57 + 8) = v49;
    }
    else
    {
      OUTLINED_FUNCTION_44((uint64_t)v92[0] + 8 * (v52 >> 6));
      OUTLINED_FUNCTION_53();
      v47();
      unint64_t v59 = (uint64_t *)(v24[7] + 16 * v52);
      uint64_t v58 = v85;
      *unint64_t v59 = v85;
      v59[1] = v49;
      uint64_t v60 = v24[2];
      BOOL v32 = __OFADD__(v60, 1);
      uint64_t v61 = v60 + 1;
      if (v32) {
        goto LABEL_39;
      }
      v24[2] = v61;
    }
    swift_bridgeObjectRelease();
    unint64_t v62 = *v76;
    (*v76)(v90, v9);
    sub_1C9E295C4(v58, v49);
    v62(v91, v9);
    uint64_t v22 = v74;
    uint64_t v23 = v86;
    uint64_t v2 = v87;
    if (v87) {
      goto LABEL_2;
    }
LABEL_4:
    if (__OFADD__(v23, 1)) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_20_1();
    if (v31 == v32)
    {
      uint64_t v86 = v30;
LABEL_9:
      uint64_t v87 = 0;
      goto LABEL_10;
    }
    if (*(void *)(v69 + 8 * v29)) {
      goto LABEL_8;
    }
    if (v29 + 1 >= v70)
    {
      uint64_t v86 = v29;
      uint64_t v87 = 0;
LABEL_10:
      uint64_t v28 = 1;
    }
    else
    {
      if (*(void *)(v69 + 8 * (v29 + 1))) {
        goto LABEL_8;
      }
      uint64_t v63 = v29 + 2;
      if (v29 + 2 >= v70)
      {
        uint64_t v86 = v29 + 1;
        goto LABEL_9;
      }
      if (*(void *)(v69 + 8 * v63))
      {
LABEL_8:
        OUTLINED_FUNCTION_16_0();
        uint64_t v86 = v33;
        uint64_t v87 = v34;
        goto LABEL_3;
      }
      while (1)
      {
        if (__OFADD__(v63, 1)) {
          goto LABEL_41;
        }
        OUTLINED_FUNCTION_20_1();
        if (v31 == v32) {
          break;
        }
        OUTLINED_FUNCTION_32_1();
        if (v64) {
          goto LABEL_8;
        }
      }
      uint64_t v87 = 0;
      uint64_t v28 = 1;
      uint64_t v86 = v68;
    }
  }
  unint64_t v55 = sub_1C9E2924C(v90);
  if ((v53 & 1) == (v56 & 1))
  {
    unint64_t v52 = v55;
    goto LABEL_17;
  }
  uint64_t result = sub_1C9E42E68();
  __break(1u);
  return result;
}

void Dictionary<>.decodeWithValueAs<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_1C9E42C48();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_7_2();
  uint64_t v74 = v8;
  OUTLINED_FUNCTION_27_1();
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_63(v10, v11, v12, v13, v14, v15, v16, v17, v70);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_2_0();
  sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_43();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EC8);
  uint64_t v22 = OUTLINED_FUNCTION_12_1(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_21_1();
  uint64_t v25 = v23 - v24;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_62();
  uint64_t v77 = v27;
  sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
  uint64_t v72 = a2 + 64;
  sub_1C9E427A8();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_49((uint64_t)&v81);
  uint64_t v75 = a2;
  sub_1C9E42808();
  uint64_t v28 = 0;
  uint64_t v76 = v25;
  if (!v3) {
    goto LABEL_4;
  }
LABEL_2:
  OUTLINED_FUNCTION_59();
  uint64_t v78 = v29;
  uint64_t v79 = v3;
  uint64_t v31 = v30 | (v29 << 6);
  uint64_t v32 = v77;
  while (2)
  {
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_5_3();
    v33();
    uint64_t v34 = (uint64_t *)(*(void *)(v75 + 56) + 16 * v31);
    uint64_t v35 = (uint64_t *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9ED0) + 48));
    uint64_t v36 = *v34;
    unint64_t v37 = v34[1];
    uint64_t *v35 = v36;
    v35[1] = v37;
    uint64_t v38 = OUTLINED_FUNCTION_39_0();
    __swift_storeEnumTagSinglePayload(v38, v39, v40, v41);
    sub_1C9E39728(v36, v37);
    while (1)
    {
      sub_1C9E398D4(v25, v32, &qword_1EA5C9EC8);
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9ED0);
      if (__swift_getEnumTagSinglePayload(v32, 1, v53) == 1)
      {
        swift_release();
        return;
      }
      char v54 = (uint64_t *)(v32 + *(int *)(v53 + 48));
      uint64_t v56 = *v54;
      unint64_t v55 = v54[1];
      OUTLINED_FUNCTION_10_3();
      v57();
      sub_1C9E29588(0, &qword_1EA5C9ED8);
      sub_1C9E42B58();
      if (v4)
      {
        sub_1C9E295C4(v56, v55);
        OUTLINED_FUNCTION_8_0();
        v69();
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C9EE0);
      if (swift_dynamicCast())
      {
        uint64_t v58 = OUTLINED_FUNCTION_39_0();
        __swift_storeEnumTagSinglePayload(v58, v59, v60, a3);
        OUTLINED_FUNCTION_10_3();
        v61();
        OUTLINED_FUNCTION_5_3();
        v62();
        OUTLINED_FUNCTION_5_3();
        v63();
        __swift_storeEnumTagSinglePayload(v74, 0, 1, a3);
        sub_1C9E42838();
        uint64_t v4 = 0;
        sub_1C9E42858();
      }
      else
      {
        __swift_storeEnumTagSinglePayload(v80, 1, 1, a3);
      }
      sub_1C9E295C4(v56, v55);
      OUTLINED_FUNCTION_8_0();
      v64();
      OUTLINED_FUNCTION_8_0();
      v65();
      uint64_t v25 = v76;
      uint64_t v28 = v78;
      uint64_t v3 = v79;
      if (v79) {
        goto LABEL_2;
      }
LABEL_4:
      uint64_t v32 = v77;
      if (__OFADD__(v28, 1))
      {
        __break(1u);
        goto LABEL_36;
      }
      OUTLINED_FUNCTION_20_1();
      if (v43 == v44)
      {
LABEL_15:
        uint64_t v78 = v42;
        goto LABEL_16;
      }
      OUTLINED_FUNCTION_19_1();
      if (v46) {
        goto LABEL_8;
      }
      if (v45 + 1 < v73) {
        break;
      }
LABEL_32:
      uint64_t v78 = v45;
LABEL_16:
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9ED0);
      __swift_storeEnumTagSinglePayload(v25, 1, 1, v52);
      uint64_t v79 = 0;
    }
    OUTLINED_FUNCTION_42();
    if (v51) {
      goto LABEL_8;
    }
    if (v50 + 2 >= v73) {
      goto LABEL_15;
    }
    if (*(void *)(v72 + 8 * (v50 + 2))) {
      goto LABEL_8;
    }
    uint64_t v66 = v50 + 3;
    if (v50 + 3 >= v73)
    {
      uint64_t v78 = v50 + 2;
      goto LABEL_16;
    }
    if (*(void *)(v72 + 8 * v66))
    {
LABEL_8:
      OUTLINED_FUNCTION_16_0();
      uint64_t v78 = v47;
      uint64_t v79 = v48;
      uint64_t v31 = v49 + (v47 << 6);
      continue;
    }
    break;
  }
  while (!__OFADD__(v66, 1))
  {
    OUTLINED_FUNCTION_20_1();
    if (v43 == v44)
    {
      uint64_t v45 = v71;
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_19_1();
    uint64_t v66 = v67 + 1;
    if (v68) {
      goto LABEL_8;
    }
  }
LABEL_36:
  __break(1u);
}

Swift::OpaquePointer_optional __swiftcall SAMultiUserInfo.toUserIdToHomeMemberDictionary()()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v38 = sub_1C9E42688();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v1;
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = sub_1C9E394AC(v0, (SEL *)&selRef_homeMembers, &qword_1EA5C9F88);
  if (v5)
  {
    unint64_t v7 = v5;
    if (v5 >> 62)
    {
LABEL_30:
      sub_1C9E42808();
      uint64_t v8 = sub_1C9E42DE8();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8)
      {
LABEL_4:
        unint64_t v40 = v7 & 0xC000000000000001;
        uint64_t v35 = v36 + 16;
        uint64_t v9 = (void (**)(char *, uint64_t))(v36 + 8);
        uint64_t v10 = MEMORY[0x1E4FBC868];
        uint64_t v11 = 4;
        *(void *)&long long v6 = 138412290;
        long long v34 = v6;
        unint64_t v37 = v7;
        uint64_t v39 = v8;
        do
        {
          if (v40) {
            id v12 = (id)MEMORY[0x1CB7909C0](v11 - 4, v7);
          }
          else {
            id v12 = *(id *)(v7 + 8 * v11);
          }
          uint64_t v13 = v12;
          uint64_t v14 = v11 - 3;
          if (__OFADD__(v11 - 4, 1))
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
            goto LABEL_30;
          }
          sub_1C9E395A0(v12, (SEL *)&selRef_sharedUserId);
          if (v15)
          {
            sub_1C9E42658();
            uint64_t v16 = v13;
            swift_isUniquelyReferenced_nonNull_native();
            uint64_t v41 = v10;
            unint64_t v17 = sub_1C9E2924C((uint64_t)v4);
            if (__OFADD__(*(void *)(v10 + 16), (v18 & 1) == 0)) {
              goto LABEL_28;
            }
            unint64_t v19 = v17;
            unint64_t v7 = v18;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EF0);
            if (sub_1C9E42DB8())
            {
              unint64_t v20 = sub_1C9E2924C((uint64_t)v4);
              if ((v7 & 1) != (v21 & 1))
              {
                uint64_t v32 = (void *)sub_1C9E42E68();
                __break(1u);
                goto LABEL_34;
              }
              unint64_t v19 = v20;
            }
            uint64_t v10 = v41;
            if (v7)
            {
              uint64_t v22 = *(void *)(v41 + 56);

              *(void *)(v22 + 8 * v19) = v16;
            }
            else
            {
              OUTLINED_FUNCTION_44(v41 + 8 * (v19 >> 6));
              OUTLINED_FUNCTION_5_3();
              v28();
              *(void *)(*(void *)(v10 + 56) + 8 * v19) = v16;
              uint64_t v29 = *(void *)(v10 + 16);
              BOOL v30 = __OFADD__(v29, 1);
              uint64_t v31 = v29 + 1;
              if (v30) {
                goto LABEL_29;
              }
              *(void *)(v10 + 16) = v31;
            }
            swift_bridgeObjectRelease();
            (*v9)(v4, v38);
            unint64_t v7 = v37;
          }
          else
          {
            if (qword_1EBCB3548 != -1) {
              swift_once();
            }
            uint64_t v23 = sub_1C9E426F8();
            __swift_project_value_buffer(v23, (uint64_t)qword_1EBCB3C50);
            uint64_t v24 = v13;
            uint64_t v16 = sub_1C9E426E8();
            os_log_type_t v25 = sub_1C9E42B28();
            if (os_log_type_enabled(v16, v25))
            {
              uint64_t v26 = swift_slowAlloc();
              uint64_t v27 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v26 = v34;
              *(void *)(v26 + 4) = v24;
              *uint64_t v27 = v24;
              _os_log_impl(&dword_1C9E1B000, v16, v25, "Ignoring HomeMemberInfo: %@ for lack of sharedUserId", (uint8_t *)v26, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
              swift_arrayDestroy();
              unint64_t v7 = v37;
              OUTLINED_FUNCTION_5();
              OUTLINED_FUNCTION_5();
            }
            else
            {

              uint64_t v16 = v24;
            }
          }

          ++v11;
        }
        while (v14 != v39);
      }
    }
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3_0();
LABEL_34:
  result.value._rawValue = v32;
  result.is_nil = v33;
  return result;
}

void MUXContextMessage.userIdOfPrimaryUser()(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_1C9E42588();
  sub_1C9E396F0(v4, v33);
  uint64_t v5 = v33[0];
  uint64_t v6 = v33[1];
  OUTLINED_FUNCTION_54();
  sub_1C9E42808();
  uint64_t v28 = v5;
  uint64_t v24 = v2;
  uint64_t v25 = v6;
  while (1)
  {
    while (1)
    {
LABEL_2:
      if (v1)
      {
        OUTLINED_FUNCTION_31_1();
      }
      else
      {
        uint64_t v8 = v3 + 1;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          return;
        }
        if (v8 >= v2) {
          goto LABEL_43;
        }
        if (!*(void *)(v6 + 8 * v8))
        {
          if (v3 + 2 >= v2) {
            goto LABEL_43;
          }
          if (!*(void *)(v6 + 8 * (v3 + 2)))
          {
            if (v3 + 3 >= v2) {
              goto LABEL_43;
            }
            if (!*(void *)(v6 + 8 * (v3 + 3)))
            {
              if (v3 + 4 >= v2) {
                goto LABEL_43;
              }
              if (!*(void *)(v6 + 8 * (v3 + 4)))
              {
                if (v3 + 5 >= v2) {
                  goto LABEL_43;
                }
                if (!*(void *)(v6 + 8 * (v3 + 5)))
                {
                  if (v3 + 6 >= v2) {
                    goto LABEL_43;
                  }
                  if (!*(void *)(v6 + 8 * (v3 + 6)))
                  {
                    uint64_t v9 = v3 + 7;
                    while (v9 < v2)
                    {
                      if (*(void *)(v6 + 8 * v9++)) {
                        goto LABEL_20;
                      }
                    }
LABEL_43:
                    swift_bridgeObjectRelease();
                    swift_release();
                    goto LABEL_44;
                  }
                }
              }
            }
          }
        }
LABEL_20:
        OUTLINED_FUNCTION_24_1();
      }
      id v11 = *(id *)(*(void *)(v5 + 56) + 8 * v7);
      uint64_t v12 = sub_1C9E39324(v11);
      if (v12) {
        break;
      }
    }
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13) {
      break;
    }

    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_14_1();
  while (1)
  {
    sub_1C9E205E4(v2, (uint64_t)v32);
    sub_1C9E205E4((uint64_t)v32, (uint64_t)v31);
    int v14 = swift_dynamicCast();
    if (v14) {
      uint64_t v15 = v29;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = sub_1C9E42898();
    if (!v14 || !v30)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
      goto LABEL_36;
    }
    if (v15 == v16 && v30 == v17) {
      break;
    }
    char v19 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
    if (v19) {
      goto LABEL_41;
    }
LABEL_36:
    v2 += 32;
    if (!--v13)
    {

      OUTLINED_FUNCTION_13_0();
      uint64_t v3 = v27;
      uint64_t v5 = v28;
      uint64_t v2 = v24;
      uint64_t v6 = v25;
      goto LABEL_2;
    }
  }
  OUTLINED_FUNCTION_28_1();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
LABEL_41:
  OUTLINED_FUNCTION_13_0();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C9E39380(v11, (SEL *)&selRef_sharedUserId);
  if (v20)
  {
    uint64_t v21 = a1;
    sub_1C9E42658();
    uint64_t v22 = 0;
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v22 = 1;
  uint64_t v21 = a1;
LABEL_45:
  uint64_t v23 = sub_1C9E42688();
  __swift_storeEnumTagSinglePayload(v21, v22, 1, v23);
}

Swift::String __swiftcall AFUserIdentityClassfication.toAceUserIdentityClassification()()
{
  uint64_t v0 = sub_1C9E42898();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

id SAConfidenceScores.toVoiceIdScoreCard()()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  id v2 = objc_allocWithZone(MEMORY[0x1E4F4E678]);
  id v3 = v0;
  id v4 = sub_1C9E37DA8((uint64_t)sub_1C9E397B8, v1);
  swift_release();
  return v4;
}

void sub_1C9E36FD0(void *a1, id a2)
{
  if (a1)
  {
    objc_msgSend(a2, sel_processedAudioDurationMilliseconds);
    id v4 = (void *)sub_1C9E42AC8();
    objc_msgSend(a1, sel_setSpIdAudioProcessedDuration_, v4);

    sub_1C9E29588(0, &qword_1EA5C9EA8);
    uint64_t v5 = (void *)sub_1C9E42C08();
    objc_msgSend(a1, sel_setSpIdUnknownUserScore_, v5);

    sub_1C9E37230();
    uint64_t v6 = (void *)sub_1C9E427B8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setSpIdKnownUserScores_, v6);

    id v7 = objc_msgSend(a2, sel_scoringSchemeVersion);
    objc_msgSend(a1, sel_setSpIdUserScoresVersion_, v7);

    sub_1C9E395A0(a2, (SEL *)&selRef_thresholdType);
    if (v8)
    {
      uint64_t v9 = (void *)sub_1C9E42888();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
    }
    objc_msgSend(a1, sel_setSpIdScoreThresholdingType_, v9);

    sub_1C9E395A0(a2, (SEL *)&selRef_assetVersion);
    if (v10)
    {
      id v11 = (void *)sub_1C9E42888();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v11 = 0;
    }
    objc_msgSend(a1, sel_setSpIdAssetVersion_, v11);

    sub_1C9E395A0(a2, (SEL *)&selRef_classifiedUser);
    if (v12)
    {
      uint64_t v13 = (void *)sub_1C9E42888();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_msgSend(a1, sel_setUserClassified_, v13);

    objc_msgSend(a1, sel_setUserIdentityClassification_, sub_1C9E374D4());
    objc_msgSend(a2, sel_lowScoreThreshold);
    id v14 = (id)sub_1C9E42AC8();
    objc_msgSend(a1, sel_setLowScoreThreshold_, v14);
  }
}

uint64_t sub_1C9E37230()
{
  uint64_t v1 = v0;
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  id v2 = (void *)sub_1C9E427E8();
  unint64_t v3 = sub_1C9E394AC(v1, (SEL *)&selRef_scores, &qword_1EA5C9EF8);
  if (!v3) {
    return (uint64_t)v2;
  }
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
LABEL_26:
    sub_1C9E42808();
    uint64_t v5 = sub_1C9E42DE8();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
LABEL_4:
  unint64_t v28 = v4;
  unint64_t v29 = v4 & 0xC000000000000001;
  uint64_t v6 = 4;
  uint64_t v27 = v5;
  while (1)
  {
    if (v29) {
      id v7 = (id)MEMORY[0x1CB7909C0](v6 - 4, v4);
    }
    else {
      id v7 = *(id *)(v4 + 8 * v6);
    }
    uint64_t v8 = v7;
    uint64_t v9 = v6 - 3;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v10 = sub_1C9E395A0(v7, (SEL *)&selRef_sharedUserId);
    if (!v11)
    {

      goto LABEL_20;
    }
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    uint64_t v30 = v8;
    objc_msgSend(v8, sel_confidenceScore);
    uint64_t v14 = sub_1C9E42AC8();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = v12;
    unint64_t v16 = sub_1C9E291D4(v12, v13);
    if (__OFADD__(v2[2], (v17 & 1) == 0)) {
      goto LABEL_24;
    }
    unint64_t v18 = v16;
    unint64_t v4 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EB8);
    if (sub_1C9E42DB8()) {
      break;
    }
LABEL_14:
    if (v4)
    {
      uint64_t v21 = v2[7];

      *(void *)(v21 + 8 * v18) = v14;
    }
    else
    {
      v2[(v18 >> 6) + 8] |= 1 << v18;
      uint64_t v22 = (uint64_t *)(v2[6] + 16 * v18);
      *uint64_t v22 = v15;
      v22[1] = v13;
      *(void *)(v2[7] + 8 * v18) = v14;
      uint64_t v23 = v2[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_25;
      }
      v2[2] = v25;
      sub_1C9E42808();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = v27;
    unint64_t v4 = v28;
LABEL_20:
    ++v6;
    if (v9 == v5) {
      goto LABEL_21;
    }
  }
  unint64_t v19 = sub_1C9E291D4(v15, v13);
  if ((v4 & 1) == (v20 & 1))
  {
    unint64_t v18 = v19;
    goto LABEL_14;
  }
  uint64_t result = sub_1C9E42E68();
  __break(1u);
  return result;
}

uint64_t sub_1C9E374D4()
{
  uint64_t v1 = sub_1C9E395A0(v0, (SEL *)&selRef_userIdentityClassification);
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    if (sub_1C9E42898() == v1 && v4 == v5)
    {
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      return 4;
    }
    char v7 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_9;
    }
    if (sub_1C9E42898() == v3 && v4 == v9)
    {
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      return 3;
    }
    char v11 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_17;
    }
    if (sub_1C9E42898() == v3 && v4 == v12)
    {
      swift_bridgeObjectRelease();
LABEL_25:
      swift_bridgeObjectRelease();
      return 1;
    }
    char v14 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_25;
    }
    if (sub_1C9E42898() == v3 && v4 == v15)
    {
      swift_bridgeObjectRelease();
LABEL_33:
      swift_bridgeObjectRelease();
      return 2;
    }
    char v17 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_33;
    }
    if (sub_1C9E42898() != v3 || v4 != v18) {
      sub_1C9E42E48();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return 0;
}

id AFVoiceIdScoreCard.toSAConfidenceScores()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F965C0]), sel_init);
  id v2 = objc_msgSend(v0, sel_spIdAudioProcessedDuration);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_integerValue);
  }
  OUTLINED_FUNCTION_57((uint64_t)v2, sel_setProcessedAudioDurationMilliseconds_);
  id v4 = objc_msgSend(v0, sel_spIdUserScoresVersion);
  OUTLINED_FUNCTION_57((uint64_t)v4, sel_setScoringSchemeVersion_);

  uint64_t v5 = sub_1C9E37884();
  sub_1C9E395FC(v5, v6, v1, (SEL *)&selRef_setThresholdType_);
  uint64_t v7 = sub_1C9E395A0(v0, (SEL *)&selRef_spIdAssetVersion);
  if (v8)
  {
    uint64_t v9 = (void *)sub_1C9E42888();
    uint64_t v7 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  OUTLINED_FUNCTION_57(v7, sel_setAssetVersion_);

  uint64_t v10 = sub_1C9E395A0(v0, (SEL *)&selRef_userClassified);
  if (v11)
  {
    uint64_t v12 = (void *)sub_1C9E42888();
    uint64_t v10 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  OUTLINED_FUNCTION_57(v10, sel_setClassifiedUser_);

  objc_msgSend(v0, sel_userIdentityClassification);
  Swift::String v13 = AFUserIdentityClassfication.toAceUserIdentityClassification()();
  sub_1C9E395FC(v13._countAndFlagsBits, (uint64_t)v13._object, v1, (SEL *)&selRef_setUserIdentityClassification_);
  sub_1C9E37998();
  sub_1C9E39668(v14, v1);
  Swift::Int32 v15 = sub_1C9E42638();
  objc_msgSend(v1, sel_setLowScoreThreshold_, AFVoiceIdScoreCard.getLowScoreThresholdOrDefault(_:)(v15));
  return v1;
}

uint64_t sub_1C9E37884()
{
  uint64_t v1 = sub_1C9E395A0(v0, (SEL *)&selRef_spIdScoreThresholdingType);
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    if (v1 == 0xD000000000000025 && v2 == 0x80000001C9E45490
      || (sub_1C9E42E48() & 1) != 0
      || v3 == 0xD000000000000028 && v4 == 0x80000001C9E45460)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1C9E42E48();
      swift_bridgeObjectRelease();
    }
  }
  return sub_1C9E42898();
}

void sub_1C9E37998()
{
  uint64_t v22 = MEMORY[0x1E4FBC860];
  uint64_t v1 = sub_1C9E39520(v0);
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  int64_t v3 = 0;
  uint64_t v4 = v1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    char v17 = *(void **)(*(void *)(v2 + 56) + 8 * i);
    id v18 = objc_allocWithZone(MEMORY[0x1E4F96BB0]);
    sub_1C9E42808();
    id v19 = v17;
    id v20 = objc_msgSend(v18, sel_init);
    objc_msgSend(v20, sel_setConfidenceScore_, objc_msgSend(v19, sel_integerValue));
    sub_1C9E395FC(v15, v16, v20, (SEL *)&selRef_setSharedUserId_);
    id v21 = v20;
    MEMORY[0x1CB790680]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C9E429E8();
    }
    sub_1C9E42A08();
    sub_1C9E429D8();

    if (v7) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v7 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v8)
  {
LABEL_24:
    swift_release();
    return;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_27:
  __break(1u);
}

Swift::Int32 __swiftcall AFVoiceIdScoreCard.getLowScoreThresholdOrDefault(_:)(Swift::Int32 a1)
{
  id v3 = objc_msgSend(v1, sel_lowScoreThreshold);
  if (v3)
  {
    uint64_t v4 = v3;
    a1 = objc_msgSend(v3, sel_intValue);
  }
  return a1;
}

id sub_1C9E37C30(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unint64_t v12 = v11;
  if (a3)
  {
    sub_1C9E29588(0, &qword_1EA5C9EA8);
    id v18 = (void *)sub_1C9E427B8();
    swift_bridgeObjectRelease();
    if (a6)
    {
LABEL_3:
      id v19 = (void *)sub_1C9E42888();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    id v18 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  id v19 = 0;
LABEL_6:
  if (a8)
  {
    id v20 = (void *)sub_1C9E42888();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v20 = 0;
  }
  if (a10)
  {
    id v21 = (void *)sub_1C9E42888();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v21 = 0;
  }
  id v22 = objc_msgSend(v12, sel_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification_, a1, a2, v18, a4, v19, v20, v21, a11);

  return v22;
}

id sub_1C9E37DA8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    v9[4] = sub_1C9E397E0;
    v9[5] = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 1107296256;
    v9[2] = sub_1C9E37E90;
    v9[3] = &block_descriptor_0;
    uint64_t v6 = _Block_copy(v9);
    swift_release();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  return v7;
}

uint64_t sub_1C9E37E90(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

char *sub_1C9E37EE4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C9E42DF8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1C9E37F78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * a2 > a1) ? (v6 = a1 + 16 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_1C9E42DF8();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x1F4186418](v7, v5);
}

uint64_t sub_1C9E38058()
{
  return sub_1C9E42C58();
}

uint64_t sub_1C9E38080(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1C9E380AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C9E380D4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1C9E38104(uint64_t result, uint64_t a2, void *a3)
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

char *sub_1C9E38120(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C9E38140(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1C9E38140(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C9E37EE4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9E37F78((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1C9E38224(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C9E42688();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
  sub_1C9E42808();
  Swift::Bool v33 = a2;
  uint64_t v11 = sub_1C9E42868();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    char v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      id v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_1C9E39B7C(&qword_1EA5C9D88, MEMORY[0x1E4FA26E0]);
      char v21 = sub_1C9E42878();
      id v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    BOOL v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1C9E38940((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1C9E38548()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1C9E42688();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9F80);
  uint64_t v5 = sub_1C9E42CB8();
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
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
      uint64_t result = sub_1C9E42868();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_1C9E38104(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *unint64_t v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_1C9E38940(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_1C9E42688();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
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
    sub_1C9E38548();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1C9E38BE0();
      goto LABEL_12;
    }
    sub_1C9E38E90();
  }
  uint64_t v12 = *v3;
  sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
  uint64_t v13 = sub_1C9E42868();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    char v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_1C9E39B7C(&qword_1EA5C9D88, MEMORY[0x1E4FA26E0]);
      char v21 = sub_1C9E42878();
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
  uint64_t result = sub_1C9E42E58();
  __break(1u);
  return result;
}

void *sub_1C9E38BE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C9E42688();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9F80);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1C9E42CA8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C9E38E90()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C9E42688();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9F80);
  uint64_t v7 = sub_1C9E42CB8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v8;
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
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_1C9E39B7C(&qword_1EA5C9D80, MEMORY[0x1E4FA26E0]);
    uint64_t result = sub_1C9E42868();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_1C9E3923C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C9F70);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  uint64_t v5 = sub_1C9E39978(&v7, v3 + 4, v1, a1);
  sub_1C9E42808();
  sub_1C9E39B74();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1C9E39324(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attributes);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C9E429C8();

  return v3;
}

uint64_t sub_1C9E39380(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_1C9E42898();

  return v4;
}

void sub_1C9E393EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C9E42888();
  objc_msgSend(a3, sel_setRefId_, v4);
}

uint64_t sub_1C9E39444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C9EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9E394AC(void *a1, SEL *a2, unint64_t *a3)
{
  id v4 = [a1 *a2];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  sub_1C9E29588(0, a3);
  uint64_t v6 = sub_1C9E429C8();

  return v6;
}

uint64_t sub_1C9E39520(void *a1)
{
  id v1 = objc_msgSend(a1, sel_spIdKnownUserScores);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  uint64_t v3 = sub_1C9E427C8();

  return v3;
}

uint64_t sub_1C9E395A0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1C9E42898();
  }
  return OUTLINED_FUNCTION_58();
}

void sub_1C9E395FC(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_1C9E42888();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_1C9E39668(uint64_t a1, void *a2)
{
  sub_1C9E29588(0, &qword_1EA5C9EF8);
  id v3 = (id)sub_1C9E429B8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setScores_, v3);
}

uint64_t sub_1C9E396F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_1C9E39728(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C9E39780()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C9E397B8(void *a1)
{
  sub_1C9E36FD0(a1, *(id *)(v1 + 16));
}

ValueMetadata *type metadata accessor for MUXUtils()
{
  return &type metadata for MUXUtils;
}

uint64_t sub_1C9E397D0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C9E397E0()
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

uint64_t sub_1C9E39820()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 112, 7);
}

id sub_1C9E39890(void *a1)
{
  return sub_1C9E35958(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13]);
}

uint64_t sub_1C9E398D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_10_3();
  v4();
  return a2;
}

uint64_t sub_1C9E39928(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

void *sub_1C9E39978(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C9E39B74()
{
  return swift_release();
}

uint64_t sub_1C9E39B7C(unint64_t *a1, void (*a2)(uint64_t))
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

id OUTLINED_FUNCTION_6_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_1C9E37C30(v12, v13, v14, v11, 0, 0, 0, 0, a9, a10, a11);
}

BOOL OUTLINED_FUNCTION_11_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_1C9E42808();
}

uint64_t OUTLINED_FUNCTION_17_1(float *a1, float a2)
{
  *a1 = a2;
  *(_DWORD *)(v2 - 116) = 0;
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_1C9E42898();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return sub_1C9E42C08();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_1C9E42E48();
}

void OUTLINED_FUNCTION_44(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void OUTLINED_FUNCTION_49(uint64_t a1@<X8>)
{
  *(void *)(a1 - 256) = v1;
  *(void *)(v2 - 304) = v1 - 1;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_1C9E42C08();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_1C9E42808();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_1C9E42688();
}

id OUTLINED_FUNCTION_57(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

void OUTLINED_FUNCTION_63(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 128) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_64()
{
  return v0;
}

void OUTLINED_FUNCTION_65(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t sub_1C9E3A098()
{
  uint64_t v0 = swift_retain();
  return sub_1C9E3A110(v0);
}

uint64_t sub_1C9E3A0C4()
{
  return swift_retain();
}

uint64_t sub_1C9E3A110(uint64_t a1)
{
  OUTLINED_FUNCTION_29_2(qword_1EBCB3C00);
  swift_beginAccess();
  void *v1 = a1;
  return swift_release();
}

uint64_t (*sub_1C9E3A15C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1C9E3A1A4(uint64_t a1)
{
  uint64_t v2 = sub_1C9E42718();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_1C9E3A2E4((uint64_t)v4);
}

uint64_t sub_1C9E3A270@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_29_2(qword_1EBCB3C08);
  swift_beginAccess();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a1, v1);
}

uint64_t sub_1C9E3A2E4(uint64_t a1)
{
  OUTLINED_FUNCTION_29_2(qword_1EBCB3C08);
  swift_beginAccess();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v3 + 40))(v1, a1);
  return swift_endAccess();
}

uint64_t (*sub_1C9E3A360())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C9E3A3A8()
{
  return *(unsigned __int8 *)(v0 + qword_1EBCB3830);
}

uint64_t sub_1C9E3A3B8(uint64_t result)
{
  *(unsigned char *)(v1 + qword_1EBCB3830) = result;
  return result;
}

void RequestAwareBridgeBase.__allocating_init(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_9_4();
  sub_1C9E21750(v9, (uint64_t)v20);
  sub_1C9E21750(v3, (uint64_t)v19);
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_1EBCB3C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v18, v14);
  (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(v0 + 464))(v13, v11, v20, v7, v5, v19, 1, v1);
  __swift_destroy_boxed_opaque_existential_0(v3);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_0();
}

void RequestAwareBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
}

void RequestAwareBridgeBase.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v17 = v6;
  uint64_t v8 = v7;
  uint64_t v9 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_8_1();
  *(void *)(v0 + qword_1EBCB3C00) = 0;
  OUTLINED_FUNCTION_1_1((void *)(v0 + qword_1EBCB3050));
  OUTLINED_FUNCTION_1_1((void *)(v0 + qword_1EBCB3058));
  uint64_t v13 = (void *)(v0 + qword_1EBCB3C08);
  *(void *)(v0 + qword_1EBCB3C08) = 500;
  uint64_t v14 = *MEMORY[0x1E4FBCAC8];
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  (*(void (**)(void *, uint64_t))(v15 + 104))(v13, v14);
  uint64_t v16 = qword_1EBCB3830;
  *(unsigned char *)(v0 + qword_1EBCB3830) = 0;
  *(unsigned char *)(v0 + qword_1EBCB3828) = 1;
  *(unsigned char *)(v0 + v16) = 1;
  sub_1C9E21750(v8, (uint64_t)&v19);
  sub_1C9E21750(v5, (uint64_t)&v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v3, v9);
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_13_1((uint64_t)v17);
  swift_retain();
  sub_1C9E3A9E4();
  sub_1C9E3AC30();
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
  __swift_destroy_boxed_opaque_existential_0(v5);
  __swift_destroy_boxed_opaque_existential_0(v8);
  OUTLINED_FUNCTION_3_0();
}

void RequestAwareBridgeBase.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
}

void RequestAwareBridgeBase.init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v18 = v3;
  uint64_t v19 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_8_1();
  *(void *)(v0 + qword_1EBCB3C00) = 0;
  OUTLINED_FUNCTION_1_1((void *)(v0 + qword_1EBCB3050));
  OUTLINED_FUNCTION_1_1((void *)(v0 + qword_1EBCB3058));
  uint64_t v14 = v0 + qword_1EBCB3C08;
  *(void *)(v0 + qword_1EBCB3C08) = 500;
  uint64_t v15 = *MEMORY[0x1E4FBCAC8];
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v16 + 104))(v14, v15);
  uint64_t v17 = qword_1EBCB3830;
  *(unsigned char *)(v0 + qword_1EBCB3830) = 0;
  *(unsigned char *)(v0 + qword_1EBCB3828) = (_BYTE)v5;
  *(unsigned char *)(v0 + v17) = (_BYTE)v5;
  sub_1C9E21750(v9, (uint64_t)&v21);
  sub_1C9E21750(v7, (uint64_t)&v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v1, v18, v10);
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_13_1((uint64_t)v19);
  swift_retain();
  sub_1C9E3A9E4();
  sub_1C9E3AC30();
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v18, v10);
  __swift_destroy_boxed_opaque_existential_0(v7);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1C9E3A9E4()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  if (*(unsigned char *)(v0 + qword_1EBCB3828) == 1)
  {
    uint64_t v3 = swift_allocObject();
    uint64_t v4 = *(void *)(v2 + 328);
    *(void *)(v3 + 16) = v4;
    uint64_t v5 = *(void *)(v2 + 336);
    *(void *)(v3 + 24) = v5;
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v4;
    v6[3] = v5;
    v6[4] = sub_1C9E3E848;
    v6[5] = v3;
    sub_1C9E42598();
    sub_1C9E3AFC4();
    swift_release();
  }
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = *(void *)(v2 + 328);
  *(void *)(v7 + 16) = v8;
  uint64_t v9 = *(void *)(v2 + 336);
  *(void *)(v7 + 24) = v9;
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = v8;
  v10[3] = v9;
  v10[4] = sub_1C9E3E7DC;
  v10[5] = v7;
  sub_1C9E42578();
  sub_1C9E3AFC4();
  return swift_release();
}

uint64_t (*sub_1C9E3AB48(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  return sub_1C9E3E888;
}

uint64_t (*sub_1C9E3ABBC(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  return sub_1C9E3E8CC;
}

void sub_1C9E3AC30()
{
  uint64_t v1 = sub_1C9E42718();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (uint64_t *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = v0 + qword_1EBCB3050;
  uint64_t v8 = *(void *)(v0 + qword_1EBCB3050);
  uint64_t v9 = *(void *)(v7 + 8);
  objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  sub_1C9E42808();
  id v16 = sub_1C9E3E240(v8, v9);
  if (v16)
  {
    uint64_t v10 = (void *)sub_1C9E42888();
    id v11 = objc_msgSend(v16, sel_stringForKey_, v10);

    if (v11)
    {

      uint64_t v12 = (void *)sub_1C9E42888();
      id v13 = objc_msgSend(v16, sel_integerForKey_, v12);

      *uint64_t v6 = v13;
      (*(void (**)(void *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FBCAC8], v1);
      sub_1C9E3A2E4((uint64_t)v6);
    }
    else
    {
      id v14 = v16;
    }
  }
}

void sub_1C9E3ADE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C9E3ADFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C9E3AE14(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  sub_1C9E425B8();
  if (swift_dynamicCastMetatype())
  {
    osloga = sub_1C9E426E8();
    os_log_type_t v7 = sub_1C9E42B28();
    if (os_log_type_enabled(osloga, v7))
    {
      uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      uint64_t v13 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v9 = sub_1C9E42F48();
      sub_1C9E1F9C8(v9, v10, &v13);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, osloga, v7, "Cannot register message of type %s type for handling on top level Bridge class. Consider registering it with an implementation of RequestProcessorBase", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
  }
  else
  {
    a4(a1, a2, a3);
  }
}

void sub_1C9E3AFC4()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v19 = v2;
  uint64_t v20 = v3;
  uint64_t v4 = sub_1C9E426F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_9_4();
  swift_getMetatypeMetadata();
  uint64_t v8 = sub_1C9E428D8();
  unint64_t v10 = v9;
  uint64_t v11 = sub_1C9E2C070();
  v21[0] = v8;
  v21[1] = v10;
  uint64_t v12 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase();
  sub_1C9E42808();
  MEMORY[0x1CB790520](v22, v21, v11, MEMORY[0x1E4FBB1A0], v12, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v22[0];
  swift_release();
  if (v13)
  {
    sub_1C9E42808();
    id v14 = sub_1C9E426E8();
    os_log_type_t v15 = sub_1C9E42B28();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      v21[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)id v16 = 136315138;
      sub_1C9E42808();
      v22[0] = sub_1C9E1F9C8(v8, v10, v21);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v14, v15, "Message type: %s is already registered. Ignoring this request", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v17 = qword_1EBCB3830;
    if ((*(unsigned char *)(v0 + qword_1EBCB3830) & 1) == 0)
    {
      sub_1C9E42598();
      if (swift_dynamicCastMetatype()) {
        *(unsigned char *)(v0 + v17) = 1;
      }
    }
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v0 + qword_1EBCB3C20, v4);
    sub_1C9E30200(v21);
    uint64_t v18 = sub_1C9E2BEAC(v19, v20, v1, (char *)v21);
    v22[1] = v10;
    v22[2] = v18;
    v22[0] = v8;
    swift_beginAccess();
    sub_1C9E42838();
    swift_retain();
    sub_1C9E42858();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E3B32C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v61 = v2;
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_4();
  sub_1C9E425B8();
  if (swift_dynamicCastClass())
  {
    if (*(unsigned char *)(v0 + qword_1EBCB3830))
    {
      sub_1C9E42598();
      if (swift_dynamicCastClass())
      {
        v61;
        sub_1C9E3CCC0();
LABEL_39:
        OUTLINED_FUNCTION_3_0();

        return;
      }
      sub_1C9E42578();
      if (swift_dynamicCastClass())
      {
        v61;
        sub_1C9E3D488();
        goto LABEL_39;
      }
      uint64_t v13 = sub_1C9E3A0C4();
      if (v13)
      {
        uint64_t v15 = *(void *)(v13 + 64);
        uint64_t v14 = *(void *)(v13 + 72);
        id v16 = v61;
        sub_1C9E42808();
        swift_release();
      }
      else
      {
        id v17 = v61;
        uint64_t v15 = 0;
        uint64_t v14 = 0;
      }
      uint64_t v18 = sub_1C9E425A8();
      if (v14)
      {
        if (v15 == v18 && v14 == v19)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_31:
          sub_1C9E3C5E4();
          goto LABEL_39;
        }
        char v21 = sub_1C9E42E48();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_31;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if ((*(unsigned char *)(v0 + qword_1EBCB3828) & 1) != 0 || (uint64_t v22 = sub_1C9E3A0C4(), swift_release(), v22))
      {
        id v23 = v61;
        OUTLINED_FUNCTION_36_1();
        id v62 = v23;
        uint64_t v24 = sub_1C9E426E8();
        os_log_type_t v25 = sub_1C9E42B28();
        if (os_log_type_enabled(v24, v25))
        {
          os_log_type_t v60 = v25;
          uint64_t v26 = swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 136315906;
          sub_1C9E425E8();
          sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
          uint64_t v27 = sub_1C9E42E18();
          unint64_t v29 = v28;
          uint64_t v30 = OUTLINED_FUNCTION_23_1();
          v31(v30);
          uint64_t v32 = sub_1C9E1F9C8(v27, v29, &v63);
          OUTLINED_FUNCTION_24_2(v32);
          sub_1C9E42C58();

          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 12) = 2080;
          swift_getObjectType();
          uint64_t v33 = sub_1C9E42F48();
          uint64_t v35 = sub_1C9E1F9C8(v33, v34, &v63);
          OUTLINED_FUNCTION_34_1(v35);

          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 22) = 2080;
          uint64_t v36 = sub_1C9E425A8();
          uint64_t v38 = sub_1C9E1F9C8(v36, v37, &v63);
          OUTLINED_FUNCTION_15_2(v38);

          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 32) = 2080;
          uint64_t v39 = sub_1C9E3A0C4();
          if (v39)
          {
            uint64_t v41 = *(void *)(v39 + 64);
            unint64_t v40 = *(void *)(v39 + 72);
            sub_1C9E42808();
            swift_release();
          }
          else
          {
            unint64_t v40 = 0xE700000000000000;
            uint64_t v41 = 0x74657320746F4ELL;
          }
          uint64_t v57 = sub_1C9E1F9C8(v41, v40, &v63);
          OUTLINED_FUNCTION_15_2(v57);
          OUTLINED_FUNCTION_18_1();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C9E1B000, v24, v60, "Receiving message id: %s of type: %s for request Id: %s but current request id: %s", (uint8_t *)v26, 0x2Au);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_5();

          goto LABEL_10;
        }
        OUTLINED_FUNCTION_18_1();

LABEL_38:
        goto LABEL_39;
      }
      id v62 = v61;
      uint64_t v42 = sub_1C9E426E8();
      os_log_type_t v43 = sub_1C9E42B18();
      if (!os_log_type_enabled(v42, v43))
      {

        goto LABEL_38;
      }
      uint64_t v44 = OUTLINED_FUNCTION_4_0();
      uint64_t v63 = OUTLINED_FUNCTION_37_1();
      *(_DWORD *)uint64_t v44 = 136315650;
      sub_1C9E425E8();
      sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
      uint64_t v45 = sub_1C9E42E18();
      unint64_t v47 = v46;
      uint64_t v48 = OUTLINED_FUNCTION_23_1();
      v49(v48);
      uint64_t v50 = sub_1C9E1F9C8(v45, v47, &v63);
      OUTLINED_FUNCTION_24_2(v50);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      swift_getObjectType();
      uint64_t v51 = sub_1C9E42F48();
      uint64_t v53 = sub_1C9E1F9C8(v51, v52, &v63);
      OUTLINED_FUNCTION_34_1(v53);

      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 22) = 2080;
      uint64_t v54 = sub_1C9E425A8();
      uint64_t v56 = sub_1C9E1F9C8(v54, v55, &v63);
      OUTLINED_FUNCTION_15_2(v56);

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v42, v43, "Receiving message id: %s of type: %s for request Id: %s but current request id not set", (uint8_t *)v44, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      OUTLINED_FUNCTION_36_1();
      id v62 = v61;
      uint64_t v5 = (void *)sub_1C9E426E8();
      os_log_type_t v6 = sub_1C9E42B28();
      if (!OUTLINED_FUNCTION_16_1(v6))
      {
        OUTLINED_FUNCTION_18_1();

        goto LABEL_39;
      }
      uint64_t v7 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      uint64_t v63 = OUTLINED_FUNCTION_4_0();
      *uint64_t v7 = 136315138;
      uint64_t v8 = *(void *)(v1 + 16);
      unint64_t v9 = *(void *)(v1 + 24);
      sub_1C9E42808();
      uint64_t v10 = sub_1C9E1F9C8(v8, v9, &v63);
      OUTLINED_FUNCTION_7_0(v10);
      sub_1C9E42C58();
      OUTLINED_FUNCTION_18_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10_1(&dword_1C9E1B000, v11, v12, "Bridge: %s did not register any start request message so not handling any RequestMessageBase messages");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
LABEL_10:

    OUTLINED_FUNCTION_3_0();
    return;
  }
  OUTLINED_FUNCTION_3_0();
  sub_1C9E2E138();
}

uint64_t sub_1C9E3BB00()
{
  uint64_t v0 = sub_1C9E426E8();
  os_log_type_t v1 = sub_1C9E42B38();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1C9E1B000, v0, v1, "createRequestProcessor() method from base class called. Please implement this method in your RequestProcessorBase implementation", v2, 2u);
    OUTLINED_FUNCTION_5();
  }

  return 0;
}

void sub_1C9E3BB9C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v61 = v4;
  uint64_t v63 = v5;
  uint64_t v65 = v6;
  uint64_t v66 = v7;
  uint64_t v64 = v8;
  uint64_t v10 = v9;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_30_1();
  sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_4();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_1C9E3A0C4();
  if (v16)
  {
    id v17 = (void *)v16;
    uint64_t v60 = v1;
    uint64_t v19 = *(void *)(v16 + 64);
    uint64_t v18 = *(void *)(v16 + 72);
    sub_1C9E42808();
    id v20 = objc_msgSend(v10, sel_refId);
    if (v20)
    {
      char v21 = v20;
      uint64_t v22 = v3;
      uint64_t v23 = sub_1C9E42898();
      uint64_t v25 = v24;

      if (v19 == v23 && v18 == v25)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v28 = v22;
LABEL_17:
        unint64_t v47 = (void *)v17[11];
        uint64_t v58 = (void *)v17[10];
        uint64_t v48 = (void *)swift_allocObject();
        v48[2] = v28;
        v48[3] = v0;
        v48[4] = v61;
        v48[5] = v63;
        v48[6] = v17;
        v48[7] = v10;
        v48[8] = v64;
        v48[9] = v65;
        v48[10] = v66;
        v67[4] = (uint64_t)sub_1C9E3E348;
        v67[5] = (uint64_t)v48;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 1107296256;
        v67[2] = (uint64_t)sub_1C9E22D44;
        v67[3] = (uint64_t)&block_descriptor_1;
        uint64_t v49 = _Block_copy(v67);
        id v59 = v58;
        id v62 = v47;
        swift_retain();
        swift_retain();
        swift_retain();
        id v50 = v10;
        id v51 = v64;
        sub_1C9E2621C(v65);
        sub_1C9E42748();
        v67[6] = MEMORY[0x1E4FBC860];
        sub_1C9E3E398((unint64_t *)&qword_1EBCB3420, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
        sub_1C9E2627C();
        sub_1C9E42C88();
        MEMORY[0x1CB790880](v47, v15, v60, v49);
        _Block_release(v49);
        swift_release();

        OUTLINED_FUNCTION_8_0();
        v52();
        OUTLINED_FUNCTION_8_0();
        v53();
        swift_release();
        goto LABEL_21;
      }
      char v27 = sub_1C9E42E48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v28 = v22;
      if (v27) {
        goto LABEL_17;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    OUTLINED_FUNCTION_36_1();
    id v35 = v10;
    uint64_t v36 = sub_1C9E426E8();
    os_log_type_t v37 = sub_1C9E42B28();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = OUTLINED_FUNCTION_4_0();
      v67[0] = OUTLINED_FUNCTION_37_1();
      *(_DWORD *)uint64_t v38 = 136315650;
      uint64_t v39 = sub_1C9E42F48();
      uint64_t v41 = sub_1C9E1F9C8(v39, v40, v67);
      OUTLINED_FUNCTION_19_2(v41);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      id v42 = objc_msgSend(v35, sel_refId);
      if (v42)
      {
        os_log_type_t v43 = v42;
        uint64_t v44 = sub_1C9E42898();
        unint64_t v46 = v45;
      }
      else
      {
        unint64_t v46 = 0xE300000000000000;
        uint64_t v44 = 7104878;
      }
      uint64_t v54 = sub_1C9E1F9C8(v44, v46, v67);
      OUTLINED_FUNCTION_14_2(v54);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 22) = 2080;
      uint64_t v55 = v17[8];
      unint64_t v56 = v17[9];
      sub_1C9E42808();
      uint64_t v57 = sub_1C9E1F9C8(v55, v56, v67);
      OUTLINED_FUNCTION_14_2(v57);
      sub_1C9E42C58();
      OUTLINED_FUNCTION_18_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v36, v37, "Received %s with refId: %s whereas current requestId is: %s .. ignoring this command", (uint8_t *)v38, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      swift_release();
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    unint64_t v29 = sub_1C9E426E8();
    os_log_type_t v30 = sub_1C9E42B28();
    if (os_log_type_enabled(v29, v30))
    {
      BOOL v31 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      v67[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)BOOL v31 = 136315138;
      uint64_t v32 = sub_1C9E42F48();
      uint64_t v34 = sub_1C9E1F9C8(v32, v33, v67);
      OUTLINED_FUNCTION_7_0(v34);
      sub_1C9E42C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v29, v30, "There is no request processor to serve command: %s", v31, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
  }
LABEL_21:
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1C9E3C1A8(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_1C9E426E8();
  os_log_type_t v15 = sub_1C9E42B18();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v24 = a6;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = a8;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v26 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v18 = sub_1C9E42F48();
    sub_1C9E1F9C8(v18, v19, &v26);
    sub_1C9E42C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v14, v15, "Dispatching %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v17;
    a8 = v25;
    MEMORY[0x1CB791240](v20, -1, -1);
    char v21 = v16;
    a6 = v24;
    MEMORY[0x1CB791240](v21, -1, -1);
  }

  uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))a2(a4);
  v22(a5, a6, a7, a8);
  return swift_release();
}

void sub_1C9E3C384(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4)
{
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_11_0();
  sub_1C9E3BB9C();
  if ((v10 & 1) == 0)
  {
    OUTLINED_FUNCTION_36_1();
    id v11 = a1;
    uint64_t v12 = sub_1C9E426E8();
    os_log_type_t v13 = sub_1C9E42B28();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t type = v13;
      uint64_t v14 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v15 = *(void *)(v5 + 16);
      unint64_t v16 = *(void *)(v5 + 24);
      sub_1C9E42808();
      sub_1C9E1F9C8(v15, v16, &v25);
      sub_1C9E42C58();
      OUTLINED_FUNCTION_18_1();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      id v17 = objc_msgSend(v11, sel_debugDescription);
      uint64_t v18 = sub_1C9E42898();
      log = v12;
      unint64_t v20 = v19;

      sub_1C9E1F9C8(v18, v20, &v25);
      sub_1C9E42C58();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, log, type, "%s bridge was not able to handle: %s.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {

      OUTLINED_FUNCTION_18_1();
    }
    uint64_t v21 = type metadata accessor for RequestAwareBridgeBase();
    uint64_t WitnessTable = swift_getWitnessTable();
    Bridge.defaultHandle(_:executionContextInfo:reply:)(v11, a2, a3, a4, v21, WitnessTable);
  }
}

void sub_1C9E3C5E4()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_11_0();
  uint64_t v43 = v4;
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_4();
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  os_log_type_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v46 = v9;
  sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_2_0();
  uint64_t v45 = v11;
  uint64_t v12 = sub_1C9E3A0C4();
  if (v12)
  {
    uint64_t v13 = v12;
    swift_retain_n();
    id v14 = v3;
    uint64_t v15 = sub_1C9E426E8();
    os_log_type_t v16 = sub_1C9E42B18();
    if (OUTLINED_FUNCTION_16_1(v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v47[0] = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v42 = v13;
      uint64_t v19 = *(void *)(v1 + 16);
      unint64_t v20 = *(void *)(v1 + 24);
      sub_1C9E42808();
      sub_1C9E1F9C8(v19, v20, v47);
      sub_1C9E42C58();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      id v21 = v14;
      uint64_t v13 = v42;
      sub_1C9E42C58();
      *uint64_t v18 = v14;

      _os_log_impl(&dword_1C9E1B000, v15, v7, "Bridge \"%s\" received message: %@", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB38C0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {

      swift_release_n();
    }

    uint64_t v22 = sub_1C9E2C470(v14);
    if ((*(uint64_t (**)(void))(*(void *)v22 + 120))())
    {
      id v23 = v14;
      uint64_t v24 = sub_1C9E426E8();
      os_log_type_t v25 = sub_1C9E42B28();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        v47[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315394;
        swift_getObjectType();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3BF0);
        uint64_t v27 = sub_1C9E428D8();
        sub_1C9E1F9C8(v27, v28, v47);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        *(_WORD *)(v26 + 12) = 2080;
        sub_1C9E425E8();
        sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
        sub_1C9E42E18();
        unint64_t v30 = v29;
        OUTLINED_FUNCTION_8_0();
        v31();
        uint64_t v32 = OUTLINED_FUNCTION_31_2();
        sub_1C9E1F9C8(v32, v30, v33);
        sub_1C9E42C58();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9E1B000, v24, v25, "handleMessage got message type %s with message id: %s that is not registered in the bridge", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
      }
      else
      {
      }
      swift_release();
    }
    else
    {
      uint64_t v34 = *(void **)(v13 + 80);
      id v35 = *(void **)(v13 + 88);
      uint64_t v36 = (void *)swift_allocObject();
      v36[2] = *(void *)(v43 + 336);
      v36[3] = v22;
      v36[4] = v13;
      v36[5] = v14;
      v47[4] = (uint64_t)sub_1C9E3E78C;
      v47[5] = (uint64_t)v36;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 1107296256;
      v47[2] = (uint64_t)sub_1C9E22D44;
      v47[3] = (uint64_t)&block_descriptor_16;
      os_log_type_t v37 = _Block_copy(v47);
      id v38 = v14;
      id v39 = v34;
      id v44 = v35;
      swift_retain();
      swift_retain();
      sub_1C9E42748();
      sub_1C9E3E398((unint64_t *)&qword_1EBCB3420, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
      sub_1C9E2627C();
      sub_1C9E42C88();
      MEMORY[0x1CB790880](v35, v45, v46, v37);
      _Block_release(v37);
      swift_release();
      swift_release();

      OUTLINED_FUNCTION_8_0();
      v40();
      OUTLINED_FUNCTION_8_0();
      v41();
    }
    swift_release();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E3CCC0()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9E42718();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_30_1();
  uint64_t v79 = sub_1C9E42788();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v77 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v78 = (char *)&v73 - v14;
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  uint64_t v82 = v16;
  uint64_t v83 = v15;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_2_0();
  uint64_t v81 = v17;
  uint64_t v18 = sub_1C9E425A8();
  unint64_t v20 = v19;
  uint64_t v80 = sub_1C9E425D8();
  uint64_t v84 = v21;
  uint64_t v22 = sub_1C9E3A0C4();
  if (!v22)
  {
LABEL_7:
    unint64_t v75 = v20;
    uint64_t v76 = v18;
    uint64_t v32 = sub_1C9E3A0C4();
    if (!v32) {
      goto LABEL_23;
    }
    uint64_t v33 = v32;
    uint64_t v74 = (uint64_t)v4;
    uint64_t v73 = v2 + qword_1EBCB3C20;
    uint64_t v34 = sub_1C9E426E8();
    os_log_type_t v35 = sub_1C9E42B28();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_1C9E1B000, v34, v35, "We still have previous processor checking waiting for it to finish", v36, 2u);
      OUTLINED_FUNCTION_5();
    }

    id v37 = *(id *)(v33 + 88);
    unint64_t v38 = (unint64_t)v77;
    sub_1C9E42778();
    sub_1C9E3A270(v1);
    id v39 = v78;
    MEMORY[0x1CB790470](v38, v1);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
    uint64_t v41 = *(void (**)(unint64_t, uint64_t))(v10 + 8);
    uint64_t v40 = v10 + 8;
    uint64_t v42 = v79;
    v41(v38, v79);
    sub_1C9E42B68();

    v41((unint64_t)v39, v42);
    char v43 = sub_1C9E42728();
    swift_retain();
    id v44 = (void *)sub_1C9E426E8();
    if (v43)
    {
      os_log_type_t v45 = sub_1C9E42B28();
      if (OUTLINED_FUNCTION_16_1(v45))
      {
        OUTLINED_FUNCTION_6_0();
        uint64_t v85 = OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_25_2(4.8149e-34);
        uint64_t v46 = sub_1C9E1F9C8(v40, v38, &v85);
        OUTLINED_FUNCTION_21_2(v46);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v49 = "Previous processor for requestId: %s didn't finish processing all pending messages, creating a new processor";
LABEL_21:
        OUTLINED_FUNCTION_10_1(&dword_1C9E1B000, v47, v48, v49);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();

        swift_release();
        goto LABEL_23;
      }
    }
    else
    {
      os_log_type_t v64 = sub_1C9E42B18();
      if (OUTLINED_FUNCTION_16_1(v64))
      {
        OUTLINED_FUNCTION_6_0();
        uint64_t v85 = OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_25_2(4.8149e-34);
        uint64_t v65 = sub_1C9E1F9C8(v40, v38, &v85);
        OUTLINED_FUNCTION_21_2(v65);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v49 = "Previous processor for requestId: %s finished processing all pending messages";
        goto LABEL_21;
      }
    }
    swift_release_n();

LABEL_23:
    uint64_t v66 = v81;
    sub_1C9E425C8();
    uint64_t v67 = (*(uint64_t (**)(uint64_t, NSObject *, uint64_t, uint64_t, unint64_t))(*(void *)v2 + 496))(v80, v84, v66, v76, v75);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    v68();
    if (v67)
    {
      uint64_t v69 = swift_retain();
      sub_1C9E3A110(v69);
      sub_1C9E3C5E4();
      swift_release();
    }
    else
    {
      uint64_t v70 = sub_1C9E426E8();
      uint64_t v71 = sub_1C9E42B28();
      if (os_log_type_enabled(v70, (os_log_type_t)v71))
      {
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v72 = 0;
        _os_log_impl(&dword_1C9E1B000, v70, (os_log_type_t)v71, "Could not create an instance of RequestProcessor", v72, 2u);
        OUTLINED_FUNCTION_5();
      }

      sub_1C9E3A110(0);
    }
    goto LABEL_28;
  }
  uint64_t v74 = v1;
  uint64_t v23 = v7;
  uint64_t v24 = v10;
  uint64_t v25 = v5;
  uint64_t v26 = v0;
  uint64_t v27 = v4;
  uint64_t v29 = *(void *)(v22 + 64);
  uint64_t v28 = *(void *)(v22 + 72);
  sub_1C9E42808();
  swift_release();
  if (v29 == v18 && v28 == v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = v27;
  }
  else
  {
    char v31 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    uint64_t v4 = v27;
    uint64_t v2 = v26;
    uint64_t v5 = v25;
    uint64_t v10 = v24;
    uint64_t v7 = v23;
    uint64_t v1 = v74;
    if ((v31 & 1) == 0) {
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  id v50 = v4;
  sub_1C9E42808();
  uint64_t v84 = sub_1C9E426E8();
  os_log_type_t v51 = sub_1C9E42B28();
  if (os_log_type_enabled(v84, v51))
  {
    uint64_t v52 = OUTLINED_FUNCTION_4_0();
    uint64_t v85 = OUTLINED_FUNCTION_37_1();
    *(_DWORD *)uint64_t v52 = 136315650;
    sub_1C9E42808();
    uint64_t v53 = sub_1C9E1F9C8(v18, v20, &v85);
    OUTLINED_FUNCTION_19_2(v53);
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v52 + 12) = 2080;
    sub_1C9E425E8();
    sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
    uint64_t v54 = sub_1C9E42E18();
    unint64_t v56 = v55;
    OUTLINED_FUNCTION_8_0();
    v57();
    uint64_t v58 = sub_1C9E1F9C8(v54, v56, &v85);
    OUTLINED_FUNCTION_14_2(v58);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v52 + 22) = 2080;
    swift_getObjectType();
    uint64_t v59 = sub_1C9E42F48();
    uint64_t v61 = sub_1C9E1F9C8(v59, v60, &v85);
    OUTLINED_FUNCTION_14_2(v61);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v84, v51, "Got a duplicate start request message to requestId: %s messageId: %s type: %s ignoring the new start", (uint8_t *)v52, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();

LABEL_28:
    OUTLINED_FUNCTION_3_0();
    return;
  }

  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E3D488()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1C9E42738();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4();
  sub_1C9E42768();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_8_1();
  sub_1C9E42528();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9_4();
  uint64_t v50 = sub_1C9E425A8();
  unint64_t v8 = v7;
  uint64_t v9 = sub_1C9E3A0C4();
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = *(void *)(v9 + 72);
  sub_1C9E42808();
  swift_release();
  if (v10 == v50 && v11 == v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v13 = sub_1C9E42E48();
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_13:
    sub_1C9E3C5E4();
    uint64_t v29 = sub_1C9E3A0C4();
    if (v29)
    {
      id v30 = *(id *)(v29 + 88);
      swift_release();
      char v31 = (void *)swift_allocObject();
      v31[2] = v50;
      v31[3] = v8;
      v31[4] = v1;
      v51[4] = (uint64_t)sub_1C9E3E738;
      void v51[5] = (uint64_t)v31;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 1107296256;
      v51[2] = (uint64_t)sub_1C9E22D44;
      v51[3] = (uint64_t)&block_descriptor_10;
      uint64_t v32 = _Block_copy(v51);
      swift_retain();
      sub_1C9E42748();
      uint64_t v52 = MEMORY[0x1E4FBC860];
      sub_1C9E3E398((unint64_t *)&qword_1EBCB3420, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB3430);
      sub_1C9E2627C();
      sub_1C9E42C88();
      sub_1C9E42B78();
      _Block_release(v32);

      OUTLINED_FUNCTION_8_0();
      v33();
      OUTLINED_FUNCTION_8_0();
      v34();
      swift_release();
LABEL_24:
      OUTLINED_FUNCTION_3_0();
      return;
    }
    OUTLINED_FUNCTION_3_0();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_7:
  if ((*(unsigned char *)(v1 + qword_1EBCB3828) & 1) != 0 || (uint64_t v14 = sub_1C9E3A0C4(), swift_release(), v14))
  {
    id v15 = v3;
    swift_retain_n();
    id v16 = v15;
    unint64_t v17 = v8;
    sub_1C9E42808();
    uint64_t v49 = sub_1C9E426E8();
    os_log_type_t v18 = sub_1C9E42B28();
    if (os_log_type_enabled(v49, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315906;
      sub_1C9E425E8();
      sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
      sub_1C9E42E18();
      unint64_t v21 = v20;
      OUTLINED_FUNCTION_8_0();
      v22();
      uint64_t v23 = OUTLINED_FUNCTION_31_2();
      uint64_t v52 = sub_1C9E1F9C8(v23, v21, v24);
      OUTLINED_FUNCTION_27_2();

      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      swift_getObjectType();
      uint64_t v25 = sub_1C9E42F48();
      uint64_t v52 = sub_1C9E1F9C8(v25, v26, v51);
      OUTLINED_FUNCTION_27_2();

      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 22) = 2080;
      sub_1C9E42808();
      uint64_t v52 = sub_1C9E1F9C8(v50, v17, v51);
      OUTLINED_FUNCTION_27_2();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 32) = 2080;
      uint64_t v27 = sub_1C9E3A0C4();
      if (v27)
      {
        unint64_t v28 = *(void *)(v27 + 72);
        sub_1C9E42808();
        swift_release();
      }
      else
      {
        unint64_t v28 = 0xE700000000000000;
      }
      uint64_t v45 = OUTLINED_FUNCTION_31_2();
      uint64_t v52 = sub_1C9E1F9C8(v45, v28, v46);
      sub_1C9E42C58();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, v49, v18, "Got end request message to non exists request, messageId: %s type: %s requestId: %s, current requestId: %s dropping the message", (uint8_t *)v19, 0x2Au);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      goto LABEL_23;
    }
    swift_release_n();
  }
  else
  {
    id v16 = v3;
    sub_1C9E42808();
    uint64_t v49 = sub_1C9E426E8();
    os_log_type_t v36 = sub_1C9E42B48();
    if (os_log_type_enabled(v49, v36))
    {
      uint64_t v37 = OUTLINED_FUNCTION_4_0();
      v51[0] = OUTLINED_FUNCTION_37_1();
      *(_DWORD *)uint64_t v37 = 136315650;
      sub_1C9E425E8();
      sub_1C9E3E398((unint64_t *)&qword_1EBCB2FF0, MEMORY[0x1E4F27990]);
      sub_1C9E42E18();
      unint64_t v39 = v38;
      OUTLINED_FUNCTION_8_0();
      v40();
      uint64_t v41 = OUTLINED_FUNCTION_31_2();
      uint64_t v52 = sub_1C9E1F9C8(v41, v39, v42);
      OUTLINED_FUNCTION_26_2();

      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      swift_getObjectType();
      uint64_t v43 = sub_1C9E42F48();
      uint64_t v52 = sub_1C9E1F9C8(v43, v44, v51);
      OUTLINED_FUNCTION_26_2();

      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 22) = 2080;
      sub_1C9E42808();
      uint64_t v52 = sub_1C9E1F9C8(v50, v8, v51);
      OUTLINED_FUNCTION_26_2();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9E1B000, v49, v36, "Got end request message for non-existing request, messageId: %s type: %s requestId: %s, current requestId is not set. Dropping the message", (uint8_t *)v37, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
LABEL_23:
      OUTLINED_FUNCTION_5();

      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();

  OUTLINED_FUNCTION_3_0();
}

void sub_1C9E3DCA4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E3A0C4();
  if (!v6)
  {
LABEL_7:
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    oslog = sub_1C9E426E8();
    os_log_type_t v11 = sub_1C9E42B18();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v23 = v13;
      *(_DWORD *)uint64_t v12 = 136315394;
      sub_1C9E42808();
      sub_1C9E1F9C8(a1, a2, &v23);
      sub_1C9E42C58();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v14 = *(void *)(a3 + 16);
      unint64_t v15 = *(void *)(a3 + 24);
      sub_1C9E42808();
      sub_1C9E1F9C8(v14, v15, &v23);
      sub_1C9E42C58();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9E1B000, oslog, v11, "Request %s for bridge %s was already changed, not setting processor to 'nil'", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1CB791240](v13, -1, -1);
      MEMORY[0x1CB791240](v12, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
    return;
  }
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v7 = *(void *)(v6 + 72);
  sub_1C9E42808();
  swift_release();
  if (v8 == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_1C9E42E48();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  id v16 = sub_1C9E426E8();
  os_log_type_t v17 = sub_1C9E42B18();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v23 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_1C9E42808();
    sub_1C9E1F9C8(a1, a2, &v23);
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v20 = *(void *)(a3 + 16);
    unint64_t v21 = *(void *)(a3 + 24);
    sub_1C9E42808();
    sub_1C9E1F9C8(v20, v21, &v23);
    sub_1C9E42C58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v16, v17, "Setting request processor of requestId %s for bridge %s to 'nil'", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1CB791240](v19, -1, -1);
    MEMORY[0x1CB791240](v18, -1, -1);
  }
  else
  {
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }

  sub_1C9E3A110(0);
}

uint64_t sub_1C9E3E0B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + qword_1EBCB3C08;
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  return v4(v1, v2);
}

uint64_t RequestAwareBridgeBase.deinit()
{
  uint64_t v0 = MessageDispatchingBridgeBase.deinit();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C9E42718();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0();
  v1();
  return v0;
}

uint64_t RequestAwareBridgeBase.__deallocating_deinit()
{
  uint64_t v0 = RequestAwareBridgeBase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

id sub_1C9E3E240(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_1C9E42888();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1C9E3E2A4(void (*a1)(void))
{
  a1();
  return sub_1C9E42F48();
}

uint64_t sub_1C9E3E2E0()
{
  swift_release();
  swift_release();
  swift_release();

  if (*(void *)(v0 + 72)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1C9E3E348()
{
  return sub_1C9E3C1A8(*(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));
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

uint64_t sub_1C9E3E398(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for RequestAwareBridgeBase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1C9E3E3F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E3A0C4();
  *a1 = result;
  return result;
}

uint64_t sub_1C9E3E430@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9E3A270(a1);
}

uint64_t sub_1C9E3E460()
{
  uint64_t result = sub_1C9E42718();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for RequestAwareBridgeBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for RequestAwareBridgeBase);
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 464))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.registerMessageHandler<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.createRequestProcessor(_:_:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.tryToDipatchCommandToProcessor<A>(_:executionContextInfo:reply:handler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.dispatchCommandToProcessor<A>(_:executionContextInfo:reply:handler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t sub_1C9E3E6F8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1C9E3E738()
{
  sub_1C9E3DCA4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C9E3E744()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C9E3E78C()
{
  return (*(uint64_t (**)(void, void))(**(void **)(v0 + 24) + 104))(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t (*sub_1C9E3E7DC(uint64_t a1))()
{
  return sub_1C9E3ABBC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1C9E3E7E4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C9E3E81C()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t (*sub_1C9E3E848(uint64_t a1))()
{
  return sub_1C9E3AB48(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1C9E3E850()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C9E3E888()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + 32) + 200))();
}

uint64_t sub_1C9E3E8CC()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + 32) + 208))();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void *OUTLINED_FUNCTION_13_1(uint64_t a1)
{
  uint64_t v6 = *(void *)(v3 - 176);
  uint64_t v7 = *(void *)(v3 - 168);
  return MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(v6, v7, (long long *)(v3 - 120), v1, a1, (long long *)(v3 - 160), v2);
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9E42C58();
}

BOOL OUTLINED_FUNCTION_16_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_21_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_25_2(float a1)
{
  float *v1 = a1;
  return sub_1C9E42808();
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_29_2@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

__n128 OUTLINED_FUNCTION_30_2(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_34_1(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9E42C58();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_slowAlloc();
}

uint64_t RequestProcessorBase.serviceHelper.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t RequestProcessorBase.messagePublisher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9E21750(v1 + 24, a1);
}

uint64_t RequestProcessorBase.requestId.getter()
{
  return OUTLINED_FUNCTION_58();
}

id RequestProcessorBase.requestQueue.getter()
{
  return *(id *)(v0 + 80);
}

id RequestProcessorBase.requestDispatchGroup.getter()
{
  return *(id *)(v0 + 88);
}

uint64_t RequestProcessorBase.assistantId.getter()
{
  return OUTLINED_FUNCTION_58();
}

uint64_t RequestProcessorBase.sessionId.getter()
{
  sub_1C9E42528();
  OUTLINED_FUNCTION_14();
  uint64_t v0 = OUTLINED_FUNCTION_58();
  return v1(v0);
}

uint64_t RequestProcessorBase.rootLevelRequestId.getter()
{
  return OUTLINED_FUNCTION_58();
}

uint64_t sub_1C9E3EC6C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  sub_1C9E42808();
  return sub_1C9E3ED04(v1, v2);
}

uint64_t sub_1C9E3ECAC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1C9E42808();
  return v2;
}

uint64_t sub_1C9E3ED04(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C9E3ED64())()
{
  return j__swift_endAccess;
}

uint64_t RequestProcessorBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = OUTLINED_FUNCTION_8_2();
  RequestProcessorBase.init(_:_:_:_:_:_:)(v11, v12, v13, v14, v15, v16, v17, a8, a9);
  return v10;
}

uint64_t RequestProcessorBase.init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  sub_1C9E42B88();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_6_3(v17, v31);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = OUTLINED_FUNCTION_5_4(v19, v32);
  MEMORY[0x1F4188790](v20 - 8);
  v10[11] = OUTLINED_FUNCTION_13_2();
  unint64_t v21 = (void *)((char *)v10 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *unint64_t v21 = 0;
  v21[1] = 0;
  v10[12] = a1;
  v10[13] = a2;
  uint64_t v22 = sub_1C9E42528();
  OUTLINED_FUNCTION_1_4();
  uint64_t v24 = v23;
  uint64_t v25 = OUTLINED_FUNCTION_11_2();
  v26(v25);
  v10[8] = a4;
  v10[9] = a5;
  sub_1C9E21750(a8, (uint64_t)(v10 + 3));
  void v10[2] = a9;
  uint64_t v27 = (void *)((char *)v10 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *uint64_t v27 = 0;
  v27[1] = 0xE000000000000000;
  sub_1C9E42808();
  swift_unknownObjectRetain();
  sub_1C9E42CC8();
  swift_bridgeObjectRelease();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E3F0C8();
  sub_1C9E42908();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E42758();
  uint64_t v28 = OUTLINED_FUNCTION_10_5();
  v29(v28);
  sub_1C9E3F108();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3450);
  sub_1C9E3F158();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_7_3();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a8);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a3, v22);
  return OUTLINED_FUNCTION_12_2();
}

unint64_t sub_1C9E3F0C8()
{
  unint64_t result = qword_1EBCB3470;
  if (!qword_1EBCB3470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBCB3470);
  }
  return result;
}

unint64_t sub_1C9E3F108()
{
  unint64_t result = qword_1EBCB3468;
  if (!qword_1EBCB3468)
  {
    sub_1C9E42B88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3468);
  }
  return result;
}

unint64_t sub_1C9E3F158()
{
  unint64_t result = qword_1EBCB3458;
  if (!qword_1EBCB3458)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBCB3450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB3458);
  }
  return result;
}

uint64_t RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_1C9E3F560(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t))RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:));
}

uint64_t RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  sub_1C9E42B88();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_2_0();
  uint64_t v35 = sub_1C9E42B98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_2_0();
  uint64_t v32 = v23;
  uint64_t v24 = sub_1C9E42768();
  MEMORY[0x1F4188790](v24 - 8);
  OUTLINED_FUNCTION_2_0();
  v12[11] = dispatch_group_create();
  uint64_t v25 = (void *)((char *)v12 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *uint64_t v25 = 0;
  v25[1] = 0;
  v12[12] = a1;
  v12[13] = a2;
  unint64_t v26 = (char *)v12 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_sessionId;
  uint64_t v33 = sub_1C9E42528();
  OUTLINED_FUNCTION_1_4();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v27 + 16))(v26, a3);
  v12[8] = a4;
  v12[9] = a5;
  sub_1C9E21750(a8, (uint64_t)(v12 + 3));
  v12[2] = a9;
  swift_beginAccess();
  *uint64_t v25 = a10;
  v25[1] = a11;
  sub_1C9E42808();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = (void *)((char *)v12 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *uint64_t v29 = 0;
  v29[1] = 0xE000000000000000;
  sub_1C9E42CC8();
  swift_bridgeObjectRelease();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E3F0C8();
  sub_1C9E42908();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E42758();
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v32, *MEMORY[0x1E4FBCC68], v35);
  sub_1C9E3F108();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3450);
  sub_1C9E3F158();
  OUTLINED_FUNCTION_9_5();
  sub_1C9E42BB8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a8);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(a3, v33);
  return OUTLINED_FUNCTION_12_2();
}

uint64_t RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_1C9E3F560(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t))RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:));
}

uint64_t sub_1C9E3F560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t))
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = OUTLINED_FUNCTION_8_2();
  a12(v13);
  return v12;
}

uint64_t RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  sub_1C9E42B88();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_6_3(v19, v33);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = OUTLINED_FUNCTION_5_4(v21, v34);
  MEMORY[0x1F4188790](v22 - 8);
  v12[11] = OUTLINED_FUNCTION_13_2();
  uint64_t v23 = (void *)((char *)v12 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *uint64_t v23 = 0;
  v23[1] = 0;
  v12[12] = a1;
  v12[13] = a2;
  uint64_t v24 = sub_1C9E42528();
  OUTLINED_FUNCTION_1_4();
  uint64_t v26 = v25;
  uint64_t v27 = OUTLINED_FUNCTION_11_2();
  v28(v27);
  v12[8] = a4;
  v12[9] = a5;
  sub_1C9E21750(a8, (uint64_t)(v12 + 3));
  v12[2] = a9;
  uint64_t v29 = (void *)((char *)v12 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *uint64_t v29 = a10;
  v29[1] = a11;
  sub_1C9E42808();
  swift_unknownObjectRetain();
  sub_1C9E42CC8();
  swift_bridgeObjectRelease();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E3F0C8();
  sub_1C9E42908();
  sub_1C9E42908();
  swift_bridgeObjectRelease();
  sub_1C9E42758();
  uint64_t v30 = OUTLINED_FUNCTION_10_5();
  v31(v30);
  sub_1C9E3F108();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3450);
  sub_1C9E3F158();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_7_3();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a8);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(a3, v24);
  return OUTLINED_FUNCTION_12_2();
}

uint64_t sub_1C9E3F88C()
{
  if (sub_1C9E425A8() == *(void *)(v0 + 64) && v1 == *(void *)(v0 + 72)) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1C9E42E48();
  }
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t RequestProcessorBase.deinit()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_sessionId;
  sub_1C9E42528();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RequestProcessorBase.__deallocating_deinit()
{
  RequestProcessorBase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9E3FA00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E3ECAC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C9E3FA30()
{
  return type metadata accessor for RequestProcessorBase();
}

uint64_t type metadata accessor for RequestProcessorBase()
{
  uint64_t result = qword_1EBCB3008;
  if (!qword_1EBCB3008) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9E3FA80()
{
  uint64_t result = sub_1C9E42528();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for RequestProcessorBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for RequestProcessorBase);
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of RequestProcessorBase.handleStartRequest(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of RequestProcessorBase.handleEndRequest(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of RequestProcessorBase.transitionToActiveRequest()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of RequestProcessorBase.canHandleMessage(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t OUTLINED_FUNCTION_5_4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_1C9E42768();
}

uint64_t OUTLINED_FUNCTION_6_3@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_1C9E42B98();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_1C9E42BB8();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_1C9E42C88();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return *(void *)(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  *(void *)(v0 + 80) = v1;
  return v0;
}

dispatch_group_t OUTLINED_FUNCTION_13_2()
{
  return dispatch_group_create();
}

void sub_1C9E3FE2C()
{
  qword_1EA5C9F90 = 12589;
  *(void *)algn_1EA5C9F98 = 0xE200000000000000;
}

uint64_t static ResultCandidateConstants.selectedResultCandidateId.getter()
{
  if (qword_1EA5C9928 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EA5C9F90;
  sub_1C9E42808();
  return v0;
}

ValueMetadata *type metadata accessor for ResultCandidateConstants()
{
  return &type metadata for ResultCandidateConstants;
}

id SASRecognition.toAFSpeechPackage(utteranceStart:processedAudioDuration:isFinal:)(char a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1C9E40438(v3);
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = sub_1C9E40144(v8);
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = sub_1C9E40494(v4);
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1C9E426F8();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBCB3C50);
    uint64_t v23 = sub_1C9E426E8();
    os_log_type_t v24 = sub_1C9E42B18();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1C9E1B000, v23, v24, "Returning empty speech package as the recognition is empty.", v25, 2u);
      MEMORY[0x1CB791240](v25, -1, -1);
    }

    id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4E608]), sel_init);
    id v21 = result;
    if (result) {
      return v21;
    }
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  id v12 = objc_allocWithZone(MEMORY[0x1E4F4E618]);
  id v13 = sub_1C9E40260(v9, v11, a3);
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  uint64_t v14 = sub_1C9E427E8();
  sub_1C9E29588(0, &qword_1EA5C9FA0);
  uint64_t v15 = sub_1C9E427E8();
  id v16 = objc_allocWithZone(MEMORY[0x1E4F4E5E0]);
  id v17 = sub_1C9E4033C(v14, v15, 1.0);
  sub_1C9E29588(0, &qword_1EA5C9E88);
  id v18 = v17;
  id v19 = v13;
  id result = sub_1C9E345A4(v13, v13, v17, a1 & 1, a2);
  if (result)
  {
    id v21 = result;

    return v21;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_1C9E40144(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4FBC860];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1C9E42D48();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_1C9E205E4(i, (uint64_t)v5);
    sub_1C9E29588(0, (unint64_t *)&unk_1EA5C9FB0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_1C9E42D18();
    sub_1C9E42D58();
    sub_1C9E42D68();
    sub_1C9E42D28();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

id sub_1C9E40260(uint64_t a1, uint64_t a2, double a3)
{
  if (!a1)
  {
    uint64_t v6 = 0;
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  sub_1C9E29588(0, (unint64_t *)&unk_1EA5C9FB0);
  uint64_t v6 = (void *)sub_1C9E429B8();
  swift_bridgeObjectRelease();
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1C9E29588(0, &qword_1EA5C9FA8);
  uint64_t v7 = (void *)sub_1C9E429B8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v8 = objc_msgSend(v3, sel_initWithPhrases_utterances_processedAudioDuration_, v6, v7, a3);

  return v8;
}

id sub_1C9E4033C(uint64_t a1, uint64_t a2, double a3)
{
  if (!a1)
  {
    uint64_t v6 = 0;
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  uint64_t v6 = (void *)sub_1C9E427B8();
  swift_bridgeObjectRelease();
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1C9E29588(0, &qword_1EA5C9FA0);
  uint64_t v7 = (void *)sub_1C9E427B8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v8 = objc_msgSend(v3, sel_initWithSpeechRecognitionFeatures_acousticFeatures_snr_, v6, v7, a3);

  return v8;
}

uint64_t sub_1C9E40438(void *a1)
{
  id v1 = objc_msgSend(a1, sel_af_speechPhrases);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C9E429C8();

  return v3;
}

uint64_t sub_1C9E40494(void *a1)
{
  id v1 = objc_msgSend(a1, sel_af_speechUtterances);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1C9E29588(0, &qword_1EA5C9FA8);
  uint64_t v3 = sub_1C9E429C8();

  return v3;
}

uint64_t SASResultCandidate.toAFSpeechPackage(utteranceStart:processedAudioDuration:isFinal:)(char a1, double a2, double a3)
{
  uint64_t v4 = v3;
  sub_1C9E29588(0, &qword_1EA5C9EA8);
  uint64_t v8 = sub_1C9E427E8();
  sub_1C9E29588(0, &qword_1EA5C9FA0);
  uint64_t v9 = sub_1C9E427E8();
  id v10 = objc_allocWithZone(MEMORY[0x1E4F4E5E0]);
  id v11 = sub_1C9E4033C(v8, v9, 1.0);
  id v12 = objc_msgSend(v3, sel_recognition);
  if (!v12)
  {
LABEL_18:
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_1C9E426F8();
    __swift_project_value_buffer(v39, (uint64_t)qword_1EBCB3C50);
    uint64_t v40 = sub_1C9E426E8();
    os_log_type_t v41 = sub_1C9E42B28();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1C9E1B000, v40, v41, "Returning empty speech package as the recognition is empty.", v42, 2u);
      OUTLINED_FUNCTION_5();
    }

    uint64_t result = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4E608]), sel_init);
    if (result)
    {
      uint64_t v43 = result;

      return v43;
    }
    goto LABEL_102;
  }
  id v13 = v12;
  uint64_t v14 = sub_1C9E40438(v12);
  if (!v14 || (uint64_t v15 = sub_1C9E40144(v14), swift_bridgeObjectRelease(), !v15))
  {

    goto LABEL_18;
  }
  uint64_t v16 = sub_1C9E40494(v13);
  if (!v16)
  {

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v17 = v16;
  id v18 = objc_allocWithZone(MEMORY[0x1E4F4E618]);
  id v110 = sub_1C9E40260(v15, v17, a3);
  sub_1C9E40E8C();
  long long v109 = v19;
  id v20 = objc_msgSend(v4, sel_filteredRecognition);
  if (!v20)
  {
LABEL_27:
    if (qword_1EBCB3548 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_1C9E426F8();
    __swift_project_value_buffer(v44, (uint64_t)qword_1EBCB3C50);
    uint64_t v45 = sub_1C9E426E8();
    os_log_type_t v46 = sub_1C9E42B18();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_1C9E1B000, v45, v46, "No filtered recognition was found in SASResulCandidate.", v47, 2u);
      OUTLINED_FUNCTION_5();
    }

    uint64_t result = sub_1C9E41F20(v4, (SEL *)&selRef_resultId);
    if (!v48) {
      goto LABEL_103;
    }
    uint64_t v49 = v48;
    uint64_t v50 = HIBYTE(v48) & 0xF;
    uint64_t v51 = result & 0xFFFFFFFFFFFFLL;
    if ((v49 & 0x2000000000000000) != 0) {
      uint64_t v52 = v50;
    }
    else {
      uint64_t v52 = result & 0xFFFFFFFFFFFFLL;
    }
    if (!v52)
    {
      swift_bridgeObjectRelease();
      goto LABEL_92;
    }
    if ((v49 & 0x1000000000000000) != 0)
    {
      uint64_t v54 = (uint64_t)sub_1C9E416C0(result, v49, 10);
      os_log_type_t v46 = v103;
      goto LABEL_75;
    }
    if ((v49 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v53 = (unsigned __int8 *)((v49 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v53 = (unsigned __int8 *)sub_1C9E42D08();
      }
      uint64_t v54 = (uint64_t)sub_1C9E417A8(v53, v51, 10);
      os_log_type_t v46 = v55 & 1;
LABEL_75:
      swift_bridgeObjectRelease();
      if ((v46 & 1) == 0)
      {
        id v78 = objc_msgSend(v4, sel_speechProfileUsed);
        uint64_t v79 = (void *)sub_1C9E42C08();
        uint64_t v80 = v79;
        if (v78)
        {
          id v81 = v78;
          char v82 = sub_1C9E42C18();

          char v83 = v82 ^ 1;
        }
        else
        {

          char v83 = 1;
        }
        id v84 = objc_allocWithZone(MEMORY[0x1E4F4E608]);
        id v85 = v11;
        id v86 = v110;
        id v87 = v109;
        uint64_t result = (uint64_t)sub_1C9E41450(v110, v110, v110, v11, a1 & 1, v109, 0, v83 & 1, v54);
        if (result)
        {
          uint64_t v43 = result;

          return v43;
        }
        goto LABEL_104;
      }
LABEL_92:
      uint64_t v99 = sub_1C9E426E8();
      os_log_type_t v100 = sub_1C9E42B28();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = (uint8_t *)OUTLINED_FUNCTION_33();
        *(_WORD *)uint64_t v101 = 0;
        _os_log_impl(&dword_1C9E1B000, v99, v100, "Missing or malformed resultId in SASResultCandidate.", v101, 2u);
        OUTLINED_FUNCTION_5();
      }

      sub_1C9E29588(0, &qword_1EA5C9E88);
      id v102 = v11;
      id v70 = v110;
      uint64_t result = (uint64_t)sub_1C9E345A4(v110, v110, v11, a1 & 1, a2);
      if (result)
      {
        uint64_t v43 = result;

        goto LABEL_96;
      }
      goto LABEL_105;
    }
    if (result == 43)
    {
      if (v50)
      {
        if (v50 != 1)
        {
          OUTLINED_FUNCTION_7_4();
          if (!(!v59 & v58))
          {
            uint64_t v54 = v63;
            if (v62 != 2)
            {
              while (1)
              {
                OUTLINED_FUNCTION_5_5();
                if (!v59 & v58) {
                  goto LABEL_67;
                }
                OUTLINED_FUNCTION_0_5();
                if (!v59) {
                  goto LABEL_67;
                }
                uint64_t v54 = v65 + v64;
                if (__OFADD__(v65, v64)) {
                  goto LABEL_67;
                }
                OUTLINED_FUNCTION_3_5();
                if (v59) {
                  goto LABEL_75;
                }
              }
            }
            goto LABEL_74;
          }
        }
        goto LABEL_67;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v50 && (result - 48) <= 9u)
        {
          uint64_t v54 = (result - 48);
          if (v50 != 1)
          {
            while (1)
            {
              OUTLINED_FUNCTION_5_5();
              if (!v59 & v58) {
                goto LABEL_67;
              }
              OUTLINED_FUNCTION_0_5();
              if (!v59) {
                goto LABEL_67;
              }
              uint64_t v54 = v89 + v88;
              if (__OFADD__(v89, v88)) {
                goto LABEL_67;
              }
              OUTLINED_FUNCTION_3_5();
              if (v59) {
                goto LABEL_75;
              }
            }
          }
          goto LABEL_74;
        }
LABEL_67:
        uint64_t v54 = 0;
        os_log_type_t v46 = OS_LOG_TYPE_INFO;
        goto LABEL_75;
      }
      if (v50)
      {
        if (v50 != 1)
        {
          OUTLINED_FUNCTION_7_4();
          if (!(!v59 & v58))
          {
            uint64_t v54 = -(uint64_t)v57;
            if (v56 != 2)
            {
              while (1)
              {
                OUTLINED_FUNCTION_5_5();
                if (!v59 & v58) {
                  goto LABEL_67;
                }
                OUTLINED_FUNCTION_0_5();
                if (!v59) {
                  goto LABEL_67;
                }
                uint64_t v54 = v61 - v60;
                if (__OFSUB__(v61, v60)) {
                  goto LABEL_67;
                }
                OUTLINED_FUNCTION_3_5();
                if (v59) {
                  goto LABEL_75;
                }
              }
            }
LABEL_74:
            os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_75;
          }
        }
        goto LABEL_67;
      }
      __break(1u);
    }
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
    goto LABEL_107;
  }
  id v21 = v20;
  uint64_t v22 = sub_1C9E40438(v20);
  if (!v22 || (uint64_t v23 = sub_1C9E40144(v22), swift_bridgeObjectRelease(), !v23))
  {

    goto LABEL_27;
  }
  uint64_t v24 = sub_1C9E40494(v21);
  if (!v24)
  {

    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v107 = v24;
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C9E426F8();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBCB3C50);
  uint64_t v26 = sub_1C9E426E8();
  os_log_type_t v27 = sub_1C9E42B18();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)OUTLINED_FUNCTION_33();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_1C9E1B000, v26, v27, "Filtered recognition was found in SASResulCandidate.", v28, 2u);
    OUTLINED_FUNCTION_5();
  }

  id v29 = objc_allocWithZone(MEMORY[0x1E4F4E618]);
  id v30 = sub_1C9E40260(v23, v107, a3);
  uint64_t result = sub_1C9E41F20(v4, (SEL *)&selRef_resultId);
  if (!v32) {
    goto LABEL_106;
  }
  uint64_t v33 = sub_1C9E41200(result, v32);
  if (v34)
  {
    uint64_t v66 = sub_1C9E426E8();
    os_log_type_t v67 = sub_1C9E42B28();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)OUTLINED_FUNCTION_33();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl(&dword_1C9E1B000, v66, v67, "Missing or malformed resultId in SASResultCandidate.", v68, 2u);
      OUTLINED_FUNCTION_5();
    }

    id v69 = objc_allocWithZone(MEMORY[0x1E4F4E608]);
    id v70 = v30;
    id v71 = v110;
    id v72 = v11;
    OUTLINED_FUNCTION_6_4();
    uint64_t result = (uint64_t)sub_1C9E414F0(v73, v74, v75, v76, v77);
    if (result)
    {
      uint64_t v43 = result;

LABEL_96:
      uint64_t v98 = v109;
      goto LABEL_97;
    }
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  uint64_t v108 = v33;
  id v35 = objc_msgSend(v4, sel_speechProfileUsed);
  os_log_type_t v36 = (void *)sub_1C9E42C08();
  uint64_t v37 = v36;
  if (v35)
  {
    id v38 = v35;
    sub_1C9E42C18();
  }
  else
  {
  }
  id v90 = objc_allocWithZone(MEMORY[0x1E4F4E608]);
  id v106 = v30;
  id v105 = v110;
  id v104 = v109;
  id v91 = v11;
  OUTLINED_FUNCTION_6_4();
  uint64_t result = (uint64_t)sub_1C9E41450(v92, v93, v94, v95, v96, v109, 0, v97, v108);
  if (result)
  {
    uint64_t v43 = result;

    uint64_t v98 = v106;
LABEL_97:

    return v43;
  }
LABEL_108:
  __break(1u);
  return result;
}

void sub_1C9E40E8C()
{
  id v1 = v0;
  uint64_t v2 = sub_1C9E426F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C9E41F20(v1, (SEL *)&selRef_latticeRnnMitigatorModelId);
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    id v10 = objc_msgSend(v1, sel_latticeRnnMitigatorCalibrationScale);
    if (v10)
    {
      id v11 = v10;
      LODWORD(v34) = 0;
      BYTE4(v34) = 1;
      MEMORY[0x1CB790790](v10, &v34);

      if ((v34 & 0x100000000) == 0)
      {
        int v12 = v34;
        id v13 = objc_msgSend(v1, sel_latticeRnnMitigatorCalibrationOffset);
        if (v13)
        {
          uint64_t v14 = v13;
          LODWORD(v34) = 0;
          BYTE4(v34) = 1;
          MEMORY[0x1CB790790](v13, &v34);

          if ((v34 & 0x100000000) == 0)
          {
            int v23 = v34;
            objc_msgSend(v1, sel_latticeRnnMitigatorScore);
            float v25 = v24;
            objc_msgSend(v1, sel_latticeRnnMitigatorThreshold);
            float v27 = v26;
            id v28 = objc_allocWithZone(MEMORY[0x1E4F4E600]);
            *(float *)&double v29 = v25;
            *(float *)&double v30 = v27;
            LODWORD(v31) = v12;
            LODWORD(v32) = v23;
            sub_1C9E41568(v29, v30, v31, v32, v8, v9);
            return;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBCB3C50);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  id v16 = v1;
  uint64_t v17 = sub_1C9E426E8();
  os_log_type_t v18 = sub_1C9E42B18();
  if (!os_log_type_enabled(v17, v18))
  {

    goto LABEL_13;
  }
  id v19 = (uint8_t *)swift_slowAlloc();
  uint64_t v20 = swift_slowAlloc();
  uint64_t v34 = v20;
  *(_DWORD *)id v19 = 136315138;
  uint64_t v21 = sub_1C9E41F20(v16, (SEL *)&selRef_resultId);
  if (v22)
  {
    uint64_t v33 = sub_1C9E1F9C8(v21, v22, &v34);
    sub_1C9E42C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9E1B000, v17, v18, "Nil ModelId, CalibrationScale, or CalibrationOffset found in rc=%s.  Returning nil AFSpeechLatticeMitigatorResult.", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB791240](v20, -1, -1);
    MEMORY[0x1CB791240](v19, -1, -1);

LABEL_13:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }

  __break(1u);
}

uint64_t sub_1C9E41200(uint64_t result, unint64_t a2)
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
        uint64_t v6 = (unsigned __int8 *)sub_1C9E42D08();
      }
      uint64_t v7 = (uint64_t)sub_1C9E417A8(v6, v4, 10);
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
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
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
              id v11 = (unsigned __int8 *)v23 + 2;
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
        id v19 = (unsigned __int8 *)v23 + 1;
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
  uint64_t v7 = (uint64_t)sub_1C9E416C0(result, a2, 10);
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

id sub_1C9E41450(void *a1, void *a2, void *a3, void *a4, char a5, void *a6, char a7, char a8, uint64_t a9)
{
  BYTE1(v17) = a8;
  LOBYTE(v17) = a7;
  id v15 = objc_msgSend(v9, sel_initWithRecognition_unfilteredRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_latticeMitigatorResult_recognitionPaused_speechProfileUsed_resultCandidateId_, a1, a2, a3, a4, a5 & 1, a6, v17, a9);

  return v15;
}

id sub_1C9E414F0(void *a1, void *a2, void *a3, void *a4, char a5)
{
  id v10 = objc_msgSend(v5, sel_initWithRecognition_unfilteredRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4, a5 & 1);

  return v10;
}

id sub_1C9E41568(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  int v7 = LODWORD(a4);
  int v8 = LODWORD(a3);
  int v9 = LODWORD(a2);
  int v10 = LODWORD(a1);
  if (a6)
  {
    id v11 = (void *)sub_1C9E42888();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = 0;
  }
  LODWORD(a1) = v10;
  LODWORD(a2) = v9;
  LODWORD(a3) = v8;
  LODWORD(a4) = v7;
  id v12 = objc_msgSend(v6, sel_initWithResults_score_threshold_calibrationScale_calibrationOffset_, v11, a1, a2, a3, a4);

  return v12;
}

void *sub_1C9E415FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB3478);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C9E41664(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_1C9E42968();
    OUTLINED_FUNCTION_4_2(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x1CB790610](15, a1 >> 16);
    OUTLINED_FUNCTION_4_2(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_1C9E416C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  sub_1C9E42808();
  uint64_t v4 = sub_1C9E42978();
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    int v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  uint64_t v6 = sub_1C9E41A24(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    int v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int v8 = (unsigned __int8 *)sub_1C9E42D08();
  }
LABEL_7:
  id v12 = sub_1C9E417A8(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12;
}

unsigned __int8 *sub_1C9E417A8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          id v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
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
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
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
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
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
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9E41A24(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_1C9E41A90((uint64_t)sub_1C9E41A8C, 0, a1, a2);
  uint64_t v6 = sub_1C9E41AC4(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1C9E41A90(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x1F4183BA0](15, v5 | (v4 << 16));
}

uint64_t sub_1C9E41AC4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1C9E41C1C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1C9E415FC(v9, 0);
      unint64_t v12 = sub_1C9E41D1C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      sub_1C9E42808();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1C9E42D08();
LABEL_4:
        JUMPOUT(0x1CB7905C0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1CB7905C0](v11 + 4, v11[2]);
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
    return MEMORY[0x1CB7905C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1C9E41C1C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1C9E41664(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1C9E41664(v6, v5, v4);
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

unint64_t sub_1C9E41D1C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
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
    uint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      uint64_t result = sub_1C9E41664(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1C9E42958();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1C9E42D08();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      uint64_t result = sub_1C9E41664(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_1C9E42928();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1C9E41F20(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = v2;
  uint64_t v4 = sub_1C9E42898();

  return v4;
}

unint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

double OUTLINED_FUNCTION_6_4()
{
  return v0;
}

uint64_t dispatch thunk of ServerFallbackDisabling.shouldDisableServerFallback(isDomainDirected:requestId:siriInputLocale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t ServerFallbackDisablingUtils.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 514;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t ServerFallbackDisablingUtils.init(_:)(uint64_t a1)
{
  *(_WORD *)(v1 + 16) = 514;
  *(void *)(v1 + 24) = a1;
  return v1;
}

uint64_t sub_1C9E42058(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a5) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = 0;
  }
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  int v10 = *(unsigned __int8 *)(v5 + 16);
  if (v10 == 2)
  {
    uint64_t v11 = self;
    sub_1C9E42808();
    unint64_t v12 = (void *)sub_1C9E42888();
    int v13 = objc_msgSend(v11, sel_isNLServerFallbackDisabledForLocale_, v12);
  }
  else
  {
    int v13 = v10 & 1;
    sub_1C9E42808();
  }
  int v14 = *(unsigned __int8 *)(v5 + 17);
  if (v14 == 2)
  {
    uint64_t v15 = self;
    uint64_t v16 = (void *)sub_1C9E42888();
    int v17 = objc_msgSend(v15, sel_isDomainServerFallbackDisabledForLocale_, v16);
  }
  else
  {
    int v17 = v14 & 1;
  }
  if (a1) {
    int v18 = v17;
  }
  else {
    int v18 = v13;
  }
  char v19 = &selRef_shouldDisableServerFallbackDomain;
  if ((a1 & 1) == 0) {
    char v19 = &selRef_shouldDisableServerFallbackNL;
  }
  unsigned int v20 = [*(id *)(v5 + 24) *v19];
  if (qword_1EBCB3548 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C9E426F8();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBCB3C50);
  swift_bridgeObjectRetain_n();
  sub_1C9E42808();
  uint64_t v22 = sub_1C9E426E8();
  os_log_type_t v23 = sub_1C9E42B48();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v28 = v26;
    *(_DWORD *)uint64_t v24 = 67110146;
    sub_1C9E42C58();
    *(_WORD *)(v24 + 8) = 1024;
    sub_1C9E42C58();
    *(_WORD *)(v24 + 14) = 1024;
    sub_1C9E42C58();
    *(_WORD *)(v24 + 20) = 2080;
    sub_1C9E42808();
    sub_1C9E1F9C8(a2, a3, &v28);
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 30) = 2082;
    sub_1C9E42808();
    sub_1C9E1F9C8(v8, v9, &v28);
    sub_1C9E42C58();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C9E1B000, v22, v23, "[ServerFallbackUtils] shouldDisableServerFallback returns %{BOOL}d with disabledByFeatureFlag = %{BOOL}d and disabledByABExperiment = %{BOOL}d for requestId: %s and locale %{public}s", (uint8_t *)v24, 0x28u);
    swift_arrayDestroy();
    MEMORY[0x1CB791240](v26, -1, -1);
    MEMORY[0x1CB791240](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v18 & v20;
}

uint64_t ServerFallbackDisablingUtils.deinit()
{
  return v0;
}

uint64_t ServerFallbackDisablingUtils.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1C9E4241C(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_1C9E42058(a1, a2, a3, a4, a5) & 1;
}

uint64_t type metadata accessor for ServerFallbackDisablingUtils()
{
  return self;
}

uint64_t method lookup function for ServerFallbackDisablingUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ServerFallbackDisablingUtils);
}

uint64_t dispatch thunk of ServerFallbackDisablingUtils.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ServerFallbackDisablingUtils.shouldDisableServerFallback(isDomainDirected:requestId:siriInputLocale:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_1C9E424B8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C9E424C8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C9E424D8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C9E424E8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C9E424F8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C9E42508()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C9E42518()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C9E42528()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C9E42538()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1C9E42548()
{
  return MEMORY[0x1F415AEB0]();
}

uint64_t sub_1C9E42558()
{
  return MEMORY[0x1F415AEB8]();
}

uint64_t sub_1C9E42568()
{
  return MEMORY[0x1F415AEC0]();
}

uint64_t sub_1C9E42578()
{
  return MEMORY[0x1F4152AF0]();
}

uint64_t sub_1C9E42588()
{
  return MEMORY[0x1F4152B90]();
}

uint64_t sub_1C9E42598()
{
  return MEMORY[0x1F4152C98]();
}

uint64_t sub_1C9E425A8()
{
  return MEMORY[0x1F4154720]();
}

uint64_t sub_1C9E425B8()
{
  return MEMORY[0x1F4154728]();
}

uint64_t sub_1C9E425C8()
{
  return MEMORY[0x1F4154748]();
}

uint64_t sub_1C9E425D8()
{
  return MEMORY[0x1F41547E0]();
}

uint64_t sub_1C9E425E8()
{
  return MEMORY[0x1F4154800]();
}

uint64_t sub_1C9E425F8()
{
  return MEMORY[0x1F4154808]();
}

uint64_t sub_1C9E42608()
{
  return MEMORY[0x1F4154920]();
}

uint64_t sub_1C9E42618()
{
  return MEMORY[0x1F4154B38]();
}

uint64_t sub_1C9E42628()
{
  return MEMORY[0x1F4154C20]();
}

uint64_t sub_1C9E42638()
{
  return MEMORY[0x1F4154CD8]();
}

uint64_t sub_1C9E42648()
{
  return MEMORY[0x1F4154D88]();
}

uint64_t sub_1C9E42658()
{
  return MEMORY[0x1F4154D98]();
}

uint64_t sub_1C9E42668()
{
  return MEMORY[0x1F4154DA0]();
}

uint64_t sub_1C9E42678()
{
  return MEMORY[0x1F4154DA8]();
}

uint64_t sub_1C9E42688()
{
  return MEMORY[0x1F4154DB8]();
}

uint64_t sub_1C9E42698()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1C9E426A8()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1C9E426B8()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1C9E426C8()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1C9E426D8()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C9E426E8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C9E426F8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C9E42708()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C9E42718()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C9E42728()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1C9E42738()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C9E42748()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C9E42758()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C9E42768()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C9E42778()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C9E42788()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C9E42798()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1C9E427A8()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1C9E427B8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C9E427C8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C9E427D8()
{
  return MEMORY[0x1F4183328]();
}

uint64_t sub_1C9E427E8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C9E427F8()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1C9E42808()
{
  return MEMORY[0x1F41833A0]();
}

uint64_t sub_1C9E42818()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1C9E42828()
{
  return MEMORY[0x1F4183438]();
}

uint64_t sub_1C9E42838()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C9E42848()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1C9E42858()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1C9E42868()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C9E42878()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C9E42888()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C9E42898()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C9E428A8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C9E428B8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C9E428C8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C9E428D8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C9E428E8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C9E428F8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C9E42908()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C9E42918()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C9E42928()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C9E42938()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C9E42958()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C9E42968()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C9E42978()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C9E42998()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C9E429A8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C9E429B8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C9E429C8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C9E429D8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C9E429E8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C9E429F8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C9E42A08()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C9E42A18()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1C9E42A28()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C9E42A38()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C9E42A48()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C9E42A58()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_1C9E42A68()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C9E42A78()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1C9E42A88()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1C9E42A98()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C9E42AB8()
{
  return MEMORY[0x1F40E6410]();
}

uint64_t sub_1C9E42AC8()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C9E42AD8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C9E42AE8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C9E42AF8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C9E42B08()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C9E42B18()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C9E42B28()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C9E42B38()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C9E42B48()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C9E42B58()
{
  return MEMORY[0x1F40E6700]();
}

uint64_t sub_1C9E42B68()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1C9E42B78()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1C9E42B88()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C9E42B98()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C9E42BA8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C9E42BB8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C9E42BC8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C9E42BD8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C9E42BE8()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1C9E42BF8()
{
  return MEMORY[0x1F41514E0]();
}

uint64_t sub_1C9E42C08()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1C9E42C18()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C9E42C28()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C9E42C38()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1C9E42C48()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C9E42C58()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C9E42C68()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C9E42C78()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C9E42C88()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C9E42C98()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1C9E42CA8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C9E42CB8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C9E42CC8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C9E42CD8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C9E42CE8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C9E42CF8()
{
  return MEMORY[0x1F4184E20]();
}

uint64_t sub_1C9E42D08()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C9E42D18()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C9E42D28()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C9E42D38()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C9E42D48()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C9E42D58()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C9E42D68()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C9E42D78()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C9E42D88()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C9E42D98()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C9E42DA8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C9E42DB8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C9E42DC8()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C9E42DD8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C9E42DE8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C9E42DF8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C9E42E08()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C9E42E18()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C9E42E38()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C9E42E48()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C9E42E58()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C9E42E68()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C9E42E78()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C9E42E88()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C9E42E98()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C9E42EA8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C9E42EB8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C9E42EC8()
{
  return MEMORY[0x1F40E6E50]();
}

uint64_t sub_1C9E42ED8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C9E42EE8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C9E42EF8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C9E42F08()
{
  return MEMORY[0x1F4185F08]();
}

uint64_t sub_1C9E42F18()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1C9E42F28()
{
  return MEMORY[0x1F4185F20]();
}

uint64_t sub_1C9E42F38()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1C9E42F48()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFDeviceSupportsBackgroundSession()
{
  return MEMORY[0x1F410AC68]();
}

uint64_t AFDeviceSupportsMuSessions()
{
  return MEMORY[0x1F410ACA8]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1F410ACB8]();
}

uint64_t AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags()
{
  return MEMORY[0x1F410ACC0]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1F410ACD0]();
}

uint64_t AFIsATVOnly()
{
  return MEMORY[0x1F410AD38]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1F40CC508](*(void *)&a1, a2);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
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

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
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