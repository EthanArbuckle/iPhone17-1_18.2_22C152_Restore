unint64_t sub_1A2BC6B54()
{
  unint64_t result;

  result = qword_1EB555078[0];
  if (!qword_1EB555078[0])
  {
    self;
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EB555078);
  }
  return result;
}

uint64_t sub_1A2BC6B94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id BiomeSELFStreamProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id BiomeSELFStreamProvider.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC13SiriAnalytics23BiomeSELFStreamProvider_excludedAnyEventTypes;
  v2 = v0;
  *(void *)&v0[v1] = sub_1A2BC7750((uint64_t)&unk_1EF5C3530);
  id v3 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v3, sel_SELFProcessedEvent);
  swift_unknownObjectRelease();
  id v5 = objc_msgSend(v4, sel_source);

  *(void *)&v2[OBJC_IVAR____TtC13SiriAnalytics23BiomeSELFStreamProvider_biomeSource] = v5;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for BiomeSELFStreamProvider();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_1A2BC6D34(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1A2C0DCE0();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_11;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  uint64_t v6 = OBJC_IVAR____TtC13SiriAnalytics23BiomeSELFStreamProvider_biomeSource;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x1A623C120](v5, a1);
    }
    else {
      id v7 = *(id *)(a1 + 8 * v5 + 32);
    }
    v8 = v7;
    id v9 = sub_1A2BC6E50(v7);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v1 + v6);
      sub_1A2BC70B4();
      v13 = v12;
      objc_msgSend(v11, sel_sendEvent_, v12);
    }
    ++v5;
  }
  while (v3 != v5);
LABEL_11:
  return swift_bridgeObjectRelease();
}

id sub_1A2BC6E50(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC13SiriAnalytics23BiomeSELFStreamProvider_excludedAnyEventTypes);
  id result = (id)sub_1A2C0CF50();
  if (!result)
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int v7 = objc_msgSend(result, sel_getAnyEventType);

  sub_1A2B45228(v7, v4);
  if (v8) {
    return 0;
  }
  id result = (id)sub_1A2C0CF50();
  if (!result) {
    goto LABEL_20;
  }
  v10 = result;
  unsigned int v11 = objc_msgSend(result, sel_getAnyEventType);

  if (v11 != 1) {
    return a1;
  }
  uint64_t v12 = sub_1A2C0CF70();
  if (!v12) {
    return a1;
  }
  v13 = (void *)v12;
  self;
  uint64_t v14 = swift_dynamicCastObjCClass();

  if (!v14) {
    return a1;
  }
  objc_msgSend(a1, sel_copy);
  sub_1A2C0DA50();
  swift_unknownObjectRelease();
  sub_1A2C0D000();
  swift_dynamicCast();
  id v9 = v30;
  v15 = (void *)sub_1A2C0CF70();

  if (!v15) {
    return v9;
  }
  self;
  v16 = (void *)swift_dynamicCastObjCClass();
  if (!v16 || (id v17 = objc_msgSend(v16, sel_location), v17, !v17))
  {
LABEL_16:

    return v9;
  }
  id result = OUTLINED_FUNCTION_1_24();
  if (!result) {
    goto LABEL_21;
  }
  v18 = result;
  objc_msgSend(result, sel_latitude);
  float v20 = v19;

  id result = OUTLINED_FUNCTION_1_24();
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v21 = result;
  objc_msgSend(result, sel_longitude);
  float v23 = v22;

  id result = OUTLINED_FUNCTION_1_24();
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v24 = result;
  *(float *)&double v25 = OUTLINED_FUNCTION_0_25(v20);
  objc_msgSend(v26, sel_setLatitude_, v25);

  id result = OUTLINED_FUNCTION_1_24();
  if (result)
  {
    v27 = result;
    *(float *)&double v28 = OUTLINED_FUNCTION_0_25(v23);
    objc_msgSend(v29, sel_setLongitude_, v28);

    goto LABEL_16;
  }
LABEL_24:
  __break(1u);
  return result;
}

void sub_1A2BC70B4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v42 - v4;
  MEMORY[0x1F4188790](v6);
  char v8 = (char *)&v42 - v7;
  MEMORY[0x1F4188790](v9);
  unsigned int v11 = (char *)&v42 - v10;
  uint64_t v12 = sub_1A2C0CFB0();
  if (!v12)
  {
    __break(1u);
    goto LABEL_18;
  }
  v13 = (void *)v12;
  sub_1A2C0D050();

  uint64_t v14 = (void *)sub_1A2C0DEF0();
  uint64_t v15 = sub_1A2C0CFB0();
  if (!v15)
  {
LABEL_18:
    __break(1u);
LABEL_19:

    __break(1u);
LABEL_20:

    __break(1u);
    goto LABEL_21;
  }
  v16 = (void *)v15;
  sub_1A2C0D030();

  uint64_t v17 = sub_1A2C0CE20();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v17);
  id v18 = objc_allocWithZone(MEMORY[0x1E4F50130]);
  id v19 = sub_1A2BC7484(v14, (uint64_t)v11);
  uint64_t v20 = sub_1A2C0CFE0();
  if (v20)
  {
    v21 = (void *)v20;
    sub_1A2C0D090();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v17);
    sub_1A2C0D070();
    float v22 = (void *)sub_1A2C0DE70();
    id v23 = objc_allocWithZone(MEMORY[0x1E4F50128]);
    char v8 = (char *)sub_1A2BC7544((uint64_t)v8, v22);
  }
  else
  {
    char v8 = 0;
  }
  v24 = (void *)sub_1A2C0CF50();
  if (!v24) {
    goto LABEL_19;
  }
  double v25 = v24;
  id v26 = objc_msgSend(v24, sel_getComponentId);

  if (v26)
  {
    sub_1A2C0D800();
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v17);
  }
  v27 = (void *)sub_1A2C0CF50();
  if (!v27) {
    goto LABEL_20;
  }
  double v28 = v27;
  objc_msgSend(v27, sel_getComponentName);

  id v29 = (void *)sub_1A2C0DE70();
  id v30 = objc_allocWithZone(MEMORY[0x1E4F50128]);
  id v31 = sub_1A2BC7544((uint64_t)v5, v29);
  v32 = (void *)sub_1A2C0CF50();
  if (!v32)
  {
LABEL_21:

    __break(1u);
    goto LABEL_22;
  }
  v33 = v32;
  objc_msgSend(v32, sel_getAnyEventType);

  v34 = (void *)sub_1A2C0DE70();
  sub_1A2C0CF60();
  if (v35) {
    v36 = 0;
  }
  else {
    v36 = (void *)sub_1A2C0D760();
  }
  sub_1A2C0CF80();
  v37 = (void *)sub_1A2C0CF50();
  if (v37)
  {
    uint64_t v38 = sub_1A2BC7924(v37);
    unint64_t v40 = v39;
    id v41 = objc_allocWithZone(MEMORY[0x1E4F50120]);
    sub_1A2BC7604(v19, v8, v31, v34, v36, (uint64_t)v2, v38, v40);
    return;
  }
LABEL_22:

  __break(1u);
}

id BiomeSELFStreamProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BiomeSELFStreamProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1A2BC7484(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = 0;
  if (__swift_getEnumTagSinglePayload(a2, 1, v6) != 1)
  {
    uint64_t v7 = (void *)sub_1A2C0CDE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a2, v6);
  }
  id v8 = objc_msgSend(v3, sel_initWithTimestampInNanoseconds_clockIdentifier_, a1, v7);

  return v8;
}

id sub_1A2BC7544(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) != 1)
  {
    uint64_t v7 = (void *)sub_1A2C0CDE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  id v8 = objc_msgSend(v3, sel_initWithUuid_componentName_, v7, a2);

  return v8;
}

id sub_1A2BC7604(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v16 = sub_1A2C0CE20();
  uint64_t v17 = 0;
  if (__swift_getEnumTagSinglePayload(a6, 1, v16) != 1)
  {
    uint64_t v17 = (void *)sub_1A2C0CDE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a6, v16);
  }
  if (a8 >> 60 == 15)
  {
    id v18 = 0;
  }
  else
  {
    id v18 = (void *)sub_1A2C0CD20();
    sub_1A2B48634(a7, a8);
  }
  id v19 = objc_msgSend(v21, sel_initWithLogicalTimestamp_clusterRepresentativeId_componentId_anyEventType_innerType_messageUuid_eventData_, a1, a2, a3, a4, a5, v17, v18);

  return v19;
}

uint64_t sub_1A2BC7750(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x1E4FBC870];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595B10);
  uint64_t result = sub_1A2C0DB40();
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 56;
  while (v5 < *(void *)(a1 + 16))
  {
    int v7 = *(_DWORD *)(a1 + 32 + 4 * v5);
    sub_1A2C0DE90();
    sub_1A2C0DEC0();
    uint64_t result = sub_1A2C0DEE0();
    uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
    uint64_t v12 = 1 << v9;
    uint64_t v13 = *(void *)(v3 + 48);
    if (((1 << v9) & v11) != 0)
    {
      if (*(_DWORD *)(v13 + 4 * v9) == v7) {
        goto LABEL_13;
      }
      uint64_t v14 = ~v8;
      while (1)
      {
        unint64_t v9 = (v9 + 1) & v14;
        unint64_t v10 = v9 >> 6;
        uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
        uint64_t v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0) {
          break;
        }
        if (*(_DWORD *)(v13 + 4 * v9) == v7) {
          goto LABEL_13;
        }
      }
    }
    *(void *)(v6 + 8 * v10) = v12 | v11;
    *(_DWORD *)(v13 + 4 * v9) = v7;
    uint64_t v15 = *(void *)(v3 + 16);
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_18;
    }
    *(void *)(v3 + 16) = v17;
LABEL_13:
    if (++v5 == v4) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BiomeSELFStreamProvider()
{
  return self;
}

uint64_t method lookup function for BiomeSELFStreamProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BiomeSELFStreamProvider);
}

uint64_t dispatch thunk of BiomeSELFStreamProvider.store(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t sub_1A2BC7924(void *a1)
{
  id v2 = objc_msgSend(a1, sel_data);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1A2C0CD30();

  return v3;
}

id OUTLINED_FUNCTION_1_24()
{
  return [v0 (SEL)(v1 + 2200)];
}

unint64_t sub_1A2BC79AC()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock) + 16);
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection);
  if (v2 && (int v3 = objc_msgSend(v2, sel_processIdentifier), v3 >= 1))
  {
    unsigned int v4 = v3;
    os_unfair_lock_unlock(v1);
    unsigned __int8 v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    os_unfair_lock_unlock(v1);
    uint64_t v6 = 0;
    unsigned __int8 v5 = 1;
  }
  return v6 | ((unint64_t)v5 << 32);
}

uint64_t sub_1A2BC7A40()
{
  OUTLINED_FUNCTION_2_0();
  v1[17] = v2;
  v1[18] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CC8);
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_1A2C0CEE0();
  v1[20] = v3;
  OUTLINED_FUNCTION_0_8(v3);
  v1[21] = v4;
  v1[22] = swift_task_alloc();
  uint64_t v5 = sub_1A2C0CF00();
  v1[23] = v5;
  OUTLINED_FUNCTION_0_8(v5);
  v1[24] = v6;
  v1[25] = swift_task_alloc();
  uint64_t v7 = sub_1A2C0CEB0();
  v1[26] = v7;
  OUTLINED_FUNCTION_0_8(v7);
  v1[27] = v8;
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A2BC7B88, 0, 0);
}

uint64_t sub_1A2BC7B88()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[27];
  uint64_t v20 = v0[26];
  uint64_t v21 = v0[28];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  uint64_t v19 = v0[23];
  uint64_t v6 = v0[17];
  uint64_t v5 = v0[18];
  uint64_t v7 = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection;
  v0[30] = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection;
  *(void *)(v5 + v7) = 0;
  uint64_t v8 = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_proxy;
  v0[31] = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_proxy;
  *(void *)(v5 + v8) = 0;
  uint64_t v9 = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock;
  v0[32] = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5551C0);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  *(void *)(v5 + v9) = v10;
  uint64_t v11 = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_continuationsLock;
  v0[33] = OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_continuationsLock;
  sub_1A2C0CE20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  sub_1A2BA8018();
  uint64_t v12 = sub_1A2C0D410();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CE0);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = 0;
  *(void *)(v13 + 16) = v12;
  *(void *)(v5 + v11) = v13;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[34] = v14;
  v0[35] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v14(v4, v6, v19);
  sub_1A2C0CEA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v21, v1, v20);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[36] = v15;
  void *v15 = v0;
  v15[1] = sub_1A2BC7D7C;
  uint64_t v16 = v0[28];
  uint64_t v17 = v0[19];
  return MEMORY[0x1F40E0958](v17, v16);
}

uint64_t sub_1A2BC7D7C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v5 = v4;
  *(void *)(v6 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v7 = sub_1A2BC85B8;
  }
  else
  {
    uint64_t v7 = sub_1A2BC7E68;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_1A2BC7E68()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    sub_1A2BCA474(v0[19], &qword_1E9595CC8);
    if (qword_1EB556678 != -1) {
      swift_once();
    }
    uint64_t v82 = v0[30];
    uint64_t v80 = v0[29];
    uint64_t v3 = v0[26];
    uint64_t v4 = v0[27];
    uint64_t v5 = v0[18];
    OUTLINED_FUNCTION_9_12();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    sub_1A2C0CEF0();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_25();
    sub_1A2BAB6C8(v6, v7, v8, v9, v10, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = OUTLINED_FUNCTION_10_13();
    v13(v12);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v80, v3);

    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    type metadata accessor for ExtensionConnection();
    OUTLINED_FUNCTION_3_0();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = (void *)v0[37];
    uint64_t v15 = (void (*)(uint64_t, uint64_t, uint64_t))v0[34];
    uint64_t v16 = v0[22];
    uint64_t v17 = v0[23];
    uint64_t v18 = v0[20];
    uint64_t v19 = v0[21];
    uint64_t v20 = v0[18];
    uint64_t v21 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 32))(v16, v0[19], v18);
    v15(v20 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_identity, v21, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v20 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_process, v16, v18);
    uint64_t v22 = sub_1A2C0CED0();
    if (v14)
    {

      if (qword_1EB556678 != -1) {
        swift_once();
      }
      uint64_t v23 = v0[27];
      uint64_t v89 = v0[26];
      uint64_t v92 = v0[29];
      uint64_t v25 = v0[23];
      uint64_t v24 = v0[24];
      uint64_t v26 = v0[21];
      uint64_t v83 = v0[20];
      uint64_t v86 = v0[22];
      uint64_t v27 = v0[17];
      OUTLINED_FUNCTION_9_12();
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      sub_1A2C0CEF0();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_1_25();
      sub_1A2BAB6C8(v28, v29, v30, v31, v32, v33);
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v27, v25);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v86, v83);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v92, v89);
    }
    else
    {
      v34 = (void *)v22;
      id v35 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1EF5D9FE0);
      objc_msgSend(v34, sel_setRemoteObjectInterface_, v35);

      objc_msgSend(v34, sel_resume);
      uint64_t v36 = swift_allocObject();
      swift_weakInit();
      v0[6] = sub_1A2BCA4F8;
      v0[7] = v36;
      v0[2] = MEMORY[0x1E4F143A8];
      v0[3] = 1107296256;
      v0[4] = sub_1A2B70338;
      v0[5] = &block_descriptor_12;
      v37 = _Block_copy(v0 + 2);
      swift_release();
      id v38 = objc_msgSend(v34, sel_synchronousRemoteObjectProxyWithErrorHandler_, v37);
      _Block_release(v37);
      sub_1A2C0DA50();
      swift_unknownObjectRelease();
      sub_1A2BAC548((uint64_t)(v0 + 8), (uint64_t)(v0 + 12));
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CB0);
      if (swift_dynamicCast())
      {
        uint64_t v39 = v0[27];
        uint64_t v90 = v0[26];
        uint64_t v93 = v0[29];
        uint64_t v40 = v0[24];
        uint64_t v78 = v0[23];
        uint64_t v84 = v0[20];
        uint64_t v87 = v0[22];
        uint64_t v42 = v0[17];
        uint64_t v41 = v0[18];
        uint64_t v43 = v0[16];
        v44 = (os_unfair_lock_s *)(*(void *)(v41 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock)
                                 + 16);
        os_unfair_lock_lock(v44);
        v45 = *(void **)(v41 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection);
        *(void *)(v41 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection) = v34;
        id v46 = v34;

        *(void *)(v41 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_proxy) = v43;
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        os_unfair_lock_unlock(v44);

        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v78);
        uint64_t v47 = __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
        uint64_t v55 = OUTLINED_FUNCTION_15_8(v47, v48, v49, v50, v51, v52, v53, v54, v78, (uint64_t)(v0 + 8), v84, v87);
        v56(v55);
        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v93, v90);
        swift_unknownObjectRelease();
        goto LABEL_15;
      }
      if (qword_1EB556678 != -1) {
        swift_once();
      }
      uint64_t v57 = v0[27];
      uint64_t v91 = v0[26];
      uint64_t v94 = v0[29];
      uint64_t v58 = v0[24];
      uint64_t v88 = v0[22];
      uint64_t v81 = v0[23];
      uint64_t v85 = v0[20];
      uint64_t v59 = v0[17];
      uint64_t v79 = v0[18];
      OUTLINED_FUNCTION_9_12();
      sub_1A2C0DB60();
      sub_1A2C0D530();
      sub_1A2C0CEF0();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_1_25();
      sub_1A2BAB6C8(v60, v61, v62, v63, v64, v65);
      swift_bridgeObjectRelease();

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v59, v81);
      uint64_t v66 = __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
      uint64_t v74 = OUTLINED_FUNCTION_15_8(v66, v67, v68, v69, v70, v71, v72, v73, v79, v81, v85, v88);
      v75(v74);
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v94, v91);
    }
  }
  uint64_t v41 = 0;
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v76 = (uint64_t (*)(uint64_t))v0[1];
  return v76(v41);
}

uint64_t sub_1A2BC85B8()
{
  __swift_storeEnumTagSinglePayload(v0[19], 1, 1, v0[20]);
  sub_1A2BCA474(v0[19], &qword_1E9595CC8);
  if (qword_1EB556678 != -1) {
    swift_once();
  }
  uint64_t v9 = v0[30];
  uint64_t v1 = v0[27];
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[29];
  uint64_t v2 = v0[18];
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  sub_1A2C0CEF0();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2BAB6C8(0xD000000000000024, 0x80000001A2C16650, 0xD000000000000072, 0x80000001A2C16520, 0x6564692874696E69, 0xEF293A797469746ELL);
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_10_13();
  v4(v3);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v8, v7);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  type metadata accessor for ExtensionConnection();
  OUTLINED_FUNCTION_3_0();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5(0);
}

uint64_t sub_1A2BC87F4(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2BC8854(a1);
    return swift_release();
  }
  return result;
}

void sub_1A2BC8854(uint64_t *a1)
{
  uint64_t v2 = v1;
  if (qword_1EB556678 != -1) {
    swift_once();
  }
  uint64_t v4 = (os_unfair_lock_s *)qword_1EB5573B0;
  sub_1A2C0DB60();
  sub_1A2C0D530();
  sub_1A2C0CEF0();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
  sub_1A2C0DC40();
  OUTLINED_FUNCTION_10();
  sub_1A2BAB6C8(v5, 0xE000000000000000, v6, v7, v8, 0x80000001A2C16630);
  swift_bridgeObjectRelease();
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v1 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock) + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(v2
                                                   + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connectionLock)
                                       + 16));
  *(void *)(v2 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_proxy) = 0;
  swift_unknownObjectRelease();
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection);
  *(void *)(v2 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_connection) = 0;

  os_unfair_lock_unlock(v9);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_14_7(v12);
  sub_1A2BCA458(a1);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_1A2BC8A34(uint64_t *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*a1 + 64);
  uint64_t v24 = *a1 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v25 = (unint64_t)(v10 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 56) + *(void *)(v5 + 72) * i, v4);
    uint64_t v26 = a2;
    id v20 = a2;
    sub_1A2C0D650();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v25) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v24 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v18 = *(void *)(v24 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v25) {
          goto LABEL_23;
        }
        unint64_t v18 = *(void *)(v24 + 8 * v14);
        if (!v18)
        {
          int64_t v14 = v17 + 3;
          if (v17 + 3 >= v25) {
            goto LABEL_23;
          }
          unint64_t v18 = *(void *)(v24 + 8 * v14);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v25)
  {
LABEL_23:
    swift_release();
    sub_1A2C0CE20();
    sub_1A2BA8018();
    uint64_t v21 = sub_1A2C0D410();
    uint64_t v22 = v23;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v22 = v21;
    return result;
  }
  unint64_t v18 = *(void *)(v24 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v25) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v24 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_1A2BC8CF0(uint64_t a1)
{
  sub_1A2C0CE10();
  OUTLINED_FUNCTION_14_7(*(os_unfair_lock_s **)(v1
                                              + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_continuationsLock));
  sub_1A2BCA43C(a1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_1A2BC8D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595D88);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A2C0CE20();
  double v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, double))(v12 + 16))(v11, a2, v9);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a3, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  return sub_1A2B80D44((uint64_t)v7, (uint64_t)v11);
}

void sub_1A2BC8ED4()
{
  OUTLINED_FUNCTION_14_7(*(os_unfair_lock_s **)(v1
                                              + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_continuationsLock));
  sub_1A2BCA0DC(v0);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_1A2BC8F30(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595D88);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2BCA2AC((uint64_t)v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  uint64_t result = sub_1A2BCA474((uint64_t)v6, &qword_1E9595D88);
  if (EnumTagSinglePayload != 1) {
    return a3(result);
  }
  return result;
}

uint64_t sub_1A2BC901C(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x1F4188298](sub_1A2BC9040, 0, 0);
}

uint64_t sub_1A2BC9040()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC13SiriAnalytics19ExtensionConnection_proxy);
  *(void *)(v0 + 48) = v2;
  if (v2)
  {
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 56) = v3;
    long long v4 = *(_OWORD *)(v0 + 24);
    *(void *)(v3 + 16) = v1;
    *(_OWORD *)(v3 + 24) = v4;
    *(void *)(v3 + 40) = v2;
    swift_unknownObjectRetain();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v5;
    uint64_t v6 = type metadata accessor for StagingReport();
    *uint64_t v5 = v0;
    v5[1] = sub_1A2BC91E0;
    return MEMORY[0x1F4188160](v0 + 16, 0, 0, 0x786F725068746977, 0xED0000293A5F2879, sub_1A2BC9EF0, v3, v6);
  }
  else
  {
    sub_1A2BC9EA4();
    swift_allocError();
    *uint64_t v7 = 0;
    swift_willThrow();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_1A2BC91E0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_2();
  *long long v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_1A2BC9330;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = sub_1A2BC92CC;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_1A2BC92CC()
{
  OUTLINED_FUNCTION_2_0();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1A2BC9330()
{
  OUTLINED_FUNCTION_2_0();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A2BC9398(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, void (*)(), uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a5;
  uint64_t v27 = a4;
  uint64_t v28 = a3;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  uint64_t v7 = *(void *)(v25 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v25);
  unint64_t v29 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A2C0CE20();
  uint64_t v24 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v24 - v14;
  sub_1A2BC8CF0(a1);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  uint64_t v16 = a1;
  uint64_t v17 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v29, v16, v25);
  unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v19 = (v11 + *(unsigned __int8 *)(v7 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  uint64_t v21 = v12;
  uint64_t v22 = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v20 + v18, v21, v24);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v19, v29, v17);
  swift_retain();
  v28(v26, sub_1A2BCA008, v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v22);
}

void sub_1A2BC9628()
{
}

uint64_t sub_1A2BC9678(void *a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v3 = a1;
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
    return sub_1A2C0D650();
  }
  if (!a3)
  {
    sub_1A2BC9EA4();
    swift_allocError();
    *uint64_t v6 = 1;
    goto LABEL_3;
  }
  id v5 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  return sub_1A2C0D660();
}

void sub_1A2BC9718()
{
  v26[2] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v0 = sub_1A2BC79AC();
  if ((v0 & 0x100000000) != 0
    || (id v1 = objc_msgSend(self, sel_identifierWithPid_, v0)) == 0)
  {
    if (qword_1EB556678 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_5_16();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    v26[0] = (id)0xD000000000000027;
    sub_1A2C0CEF0();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10();
    sub_1A2BAB6C8(v15, 0x80000001A2C164F0, v16, v17, 0xD000000000000012, 0x80000001A2C165A0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = v1;
    sub_1A2B521B8(0, &qword_1E9597080);
    swift_bridgeObjectRetain();
    id v3 = sub_1A2BC9B7C();
    objc_msgSend(v3, sel_setReportType_, 0);
    objc_msgSend(v3, sel_setMaximumTerminationResistance_, 20);
    id v4 = objc_msgSend(self, sel_predicateMatchingIdentifier_, v2);
    sub_1A2B521B8(0, &qword_1E9597088);
    id v5 = v4;
    id v6 = v3;
    id v7 = sub_1A2BC9BF0(v5, v6);
    if (qword_1EB556678 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_5_16();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    v26[1] = (id)0x80000001A2C165C0;
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_9();
    sub_1A2BAB6E0(v8, v9, v10, v11, v12, v13);
    swift_bridgeObjectRelease();
    v26[0] = 0;
    if (objc_msgSend(v7, sel_execute_, v26))
    {
      id v14 = v26[0];
    }
    else
    {
      id v18 = v26[0];
      unint64_t v19 = (void *)sub_1A2C0CC40();

      swift_willThrow();
      OUTLINED_FUNCTION_5_16();
      sub_1A2C0DB60();
      sub_1A2C0D530();
      __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
      sub_1A2C0DC40();
      OUTLINED_FUNCTION_12_9();
      sub_1A2BAB6C8(v20, v21, v22, v23, v24, v25);
      swift_bridgeObjectRelease();
    }
  }
}

id sub_1A2BC9B7C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithExplanation_, v1);

  return v2;
}

id sub_1A2BC9BF0(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPredicate_context_, a1, a2);

  return v4;
}

uint64_t sub_1A2BC9C4C()
{
  sub_1A2C0CF00();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_13_9();
  v2(v1);
  sub_1A2C0CEE0();
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_13_9();
  v4(v3);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1A2BC9D14()
{
  sub_1A2BC9C4C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A2BC9D6C()
{
  return type metadata accessor for ExtensionConnection();
}

uint64_t type metadata accessor for ExtensionConnection()
{
  uint64_t result = qword_1E9595D68;
  if (!qword_1E9595D68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BC9DBC()
{
  uint64_t result = sub_1A2C0CF00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1A2C0CEE0();
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

unint64_t sub_1A2BC9EA4()
{
  unint64_t result = qword_1E9597090;
  if (!qword_1E9597090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9597090);
  }
  return result;
}

uint64_t sub_1A2BC9EF0(uint64_t a1)
{
  return sub_1A2BC9398(a1, *(void *)(v1 + 16), *(void (**)(uint64_t, void (*)(), uint64_t))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1A2BC9EFC()
{
  uint64_t v1 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v7 = v5 + *(void *)(v6 + 64);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  OUTLINED_FUNCTION_9();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v7 + v13) & ~v13;
  uint64_t v15 = v14 + *(void *)(v12 + 64);
  uint64_t v16 = v4 | v13 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);
  return MEMORY[0x1F4186498](v0, v15, v16);
}

void sub_1A2BCA008()
{
  uint64_t v0 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_0_8(v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
  sub_1A2BC9628();
}

uint64_t sub_1A2BCA0D0()
{
  return sub_1A2BC9678(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1A2BCA0DC(uint64_t a1)
{
  return sub_1A2BC8F30(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1A2BCA0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1A2B55210(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_7_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596A30);
  OUTLINED_FUNCTION_6_18();
  sub_1A2B3EB94(*(void *)(*(void *)(v10 + 48) + 16 * v6), *(void *)(*(void *)(v10 + 48) + 16 * v6 + 8));
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  sub_1A2B796AC();
  sub_1A2C0DC60();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

double sub_1A2BCA1E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5 = sub_1A2B552C8(a1, a2);
  if (v6)
  {
    unint64_t v7 = v5;
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_7_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596A38);
    OUTLINED_FUNCTION_6_18();
    *a3 = *(_OWORD *)(*(void *)(v9 + 56) + 16 * v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554210);
    sub_1A2B796F8();
    sub_1A2C0DC60();
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = xmmword_1A2C1C190;
  }
  return result;
}

uint64_t sub_1A2BCA2AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1A2B54F70();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(qword_1E9595DA0);
    OUTLINED_FUNCTION_6_18();
    uint64_t v7 = *(void *)(v17 + 48);
    uint64_t v8 = sub_1A2C0CE20();
    OUTLINED_FUNCTION_14();
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v7 + *(void *)(v9 + 72) * v4, v8);
    uint64_t v10 = *(void *)(v17 + 56);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
    OUTLINED_FUNCTION_14();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 32))(a1, v10 + *(void *)(v12 + 72) * v4, v11);
    sub_1A2BA8018();
    sub_1A2C0DC60();
    uint64_t *v2 = v17;
    swift_bridgeObjectRelease();
    uint64_t v13 = a1;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595CD8);
    uint64_t v13 = a1;
    uint64_t v14 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v13, v14, 1, v15);
}

uint64_t sub_1A2BCA43C(uint64_t a1)
{
  return sub_1A2BC8D54(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1A2BCA458(uint64_t *a1)
{
  return sub_1A2BC8A34(a1, *(void **)(v1 + 16));
}

uint64_t sub_1A2BCA474(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_13_9();
  v4(v3);
  return a1;
}

uint64_t sub_1A2BCA4C0()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2BCA4F8(uint64_t *a1)
{
  return sub_1A2BC87F4(a1);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

unsigned char *storeEnumTagSinglePayload for ExtensionConnectionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x1A2BCA5E4);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionConnectionError()
{
  return &type metadata for ExtensionConnectionError;
}

unint64_t sub_1A2BCA620()
{
  unint64_t result = qword_1E95970A0;
  if (!qword_1E95970A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E95970A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return sub_1A2C0DC50();
}

void OUTLINED_FUNCTION_7_13()
{
  void *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  return v0;
}

void OUTLINED_FUNCTION_14_7(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 6);
}

uint64_t OUTLINED_FUNCTION_15_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return a12;
}

void sub_1A2BCA754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1A2C0CCF0();
  OUTLINED_FUNCTION_9();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  swift_defaultActor_initialize();
  *(void *)(v2 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_internalTelemetry) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapped) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapContinuations) = MEMORY[0x1E4FBC860];
  uint64_t v10 = *(void (**)(void))(v8 + 16);
  OUTLINED_FUNCTION_6_19();
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596268);
  OUTLINED_FUNCTION_6_19();
  v10();
  id v11 = (id)*MEMORY[0x1E4F28358];
  uint64_t v12 = sub_1A2C0D260();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v6);
  *(void *)(v3 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_stream) = v12;
  uint64_t v13 = *(void **)(v3 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_internalTelemetry);
  *(void *)(v3 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_internalTelemetry) = a2;

  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A2BCA8C4()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1A2BCA8E4, v0, 0);
}

uint64_t sub_1A2BCA8E4()
{
  OUTLINED_FUNCTION_2_0();
  if (*(unsigned char *)(v0[2] + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapped))
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    sub_1A2BCB60C(&qword_1E95970C0, (void (*)(uint64_t))type metadata accessor for MessageStagingStream);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[3] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_1A2BCAA30;
    return MEMORY[0x1F41880D8]();
  }
}

uint64_t sub_1A2BCAA30()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](OUTLINED_FUNCTION_0_17, v2, 0);
}

uint64_t sub_1A2BCAB10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(a2 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapContinuations);
  swift_beginAccess();
  sub_1A2B865AC();
  uint64_t v4 = *(void *)(*v3 + 16);
  sub_1A2B86838();
  uint64_t v5 = *v3;
  *(void *)(v5 + 16) = v4 + 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554228);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v5+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80))+ *(void *)(*(void *)(v6 - 8) + 72) * v4, a1, v6);
  return swift_endAccess();
}

uint64_t sub_1A2BCABDC()
{
  OUTLINED_FUNCTION_2_0();
  v1[5] = v2;
  v1[6] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[7] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1A2BCAC68;
  return sub_1A2BCA8C4();
}

uint64_t sub_1A2BCAC68()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A2BCAD48, v2, 0);
}

uint64_t sub_1A2BCAD48()
{
  sub_1A2C0D280();
  uint64_t v1 = *(void **)(*(void *)(v0 + 48) + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_internalTelemetry);
  if (v1) {
    objc_msgSend(v1, sel_trackMessageStagedWithSuccess_, 1);
  }
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(1);
}

void sub_1A2BCAF08()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554228);
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersistentStorage();
  if (sub_1A2BD1584())
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_1_26();
    sub_1A2BAB6F8(v7, v8, v9, v10, v11, v12);
    *(unsigned char *)(v0 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapped) = 1;
    uint64_t v13 = (uint64_t *)(v0 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_bootstrapContinuations);
    swift_beginAccess();
    uint64_t v14 = *v13;
    uint64_t v15 = *(void *)(*v13 + 16);
    if (v15)
    {
      unint64_t v29 = v13;
      id v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      uint64_t v16 = v3 + 16;
      uint64_t v17 = v18;
      uint64_t v19 = v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
      uint64_t v20 = *(void *)(v16 + 56);
      swift_bridgeObjectRetain();
      do
      {
        v17(v6, v19, v1);
        sub_1A2C0D660();
        (*(void (**)(char *, uint64_t))(v16 - 8))(v6, v1);
        v19 += v20;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      uint64_t v13 = v29;
    }
    uint64_t *v13 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    if (qword_1EB556808 != -1) {
      swift_once();
    }
    if (*(unsigned char *)(sub_1A2BAB628() + 24) == 1)
    {
      swift_retain();
      sub_1A2BCB2BC();
      OUTLINED_FUNCTION_1_26();
      sub_1A2BAB6C8(v21, v22, v23, v24, v25, v26);
      swift_release();
      swift_release();
      OUTLINED_FUNCTION_7();
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_7();
      swift_release();
    }
  }
}

unint64_t sub_1A2BCB2BC()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_1A2BCB38C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13SiriAnalytics20MessageStagingStream_streamURL;
  uint64_t v2 = sub_1A2C0CCF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1A2BCB428()
{
  sub_1A2BCB38C();
  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1A2BCB454()
{
  return type metadata accessor for MessageStagingStream();
}

uint64_t type metadata accessor for MessageStagingStream()
{
  uint64_t result = qword_1E9596248;
  if (!qword_1E9596248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BCB4A4()
{
  uint64_t result = sub_1A2C0CCF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1A2BCB570()
{
  OUTLINED_FUNCTION_2_0();
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_1A2B79504;
  return sub_1A2BCABDC();
}

uint64_t sub_1A2BCB604(uint64_t a1)
{
  return sub_1A2BCAB10(a1, v1);
}

uint64_t sub_1A2BCB60C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t TimestampRange.init(_:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  if (a2)
  {
    if (a4)
    {
      *(void *)a5 = 0;
      *(void *)(a5 + 8) = 0;
      char v5 = -1;
    }
    else
    {
      *(void *)a5 = a3;
      *(void *)(a5 + 8) = 0;
      char v5 = 2;
    }
  }
  else
  {
    *(void *)a5 = result;
    if ((a4 & 1) == 0)
    {
      *(void *)(a5 + 8) = a3;
      *(unsigned char *)(a5 + 16) = 0;
      return result;
    }
    *(void *)(a5 + 8) = 0;
    char v5 = 1;
  }
  *(unsigned char *)(a5 + 16) = v5;
  return result;
}

uint64_t TimestampRange.init(start:end:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a3) {
    a2 = 0;
  }
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3 & 1;
  return result;
}

Swift::Bool __swiftcall TimestampRange.contains(timestamp:)(Swift::UInt64 timestamp)
{
  Swift::UInt64 v2 = *(void *)v1;
  if (*(unsigned char *)(v1 + 16))
  {
    BOOL v6 = v2 >= timestamp;
    Swift::Bool v3 = v2 <= timestamp;
    Swift::Bool v4 = v6;
    if (*(unsigned char *)(v1 + 16) == 1) {
      return v3;
    }
    else {
      return v4;
    }
  }
  else
  {
    return v2 <= timestamp && *(void *)(v1 + 8) >= timestamp;
  }
}

BOOL static TimestampRange.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 16) > 1u) {
    return 1;
  }
  return *(unsigned __int8 *)(a2 + 16) < 2u && *(void *)a1 < *(void *)a2;
}

BOOL static TimestampRange.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = *((unsigned __int8 *)a2 + 16);
  if (*((unsigned char *)a1 + 16))
  {
    BOOL v6 = v4 == 1 && v2 == v3;
    BOOL v8 = v4 == 2 && v2 == v3;
    if (*((unsigned char *)a1 + 16) == 1) {
      return v6;
    }
    else {
      return v8;
    }
  }
  else
  {
    if (*((unsigned char *)a2 + 16)) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v2 == v3;
    }
    return v10 && a1[1] == a2[1];
  }
}

unint64_t sub_1A2BCB7F4()
{
  unint64_t result = qword_1E95970C8;
  if (!qword_1E95970C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E95970C8);
  }
  return result;
}

uint64_t sub_1A2BCB844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2BCB97C(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_1A2BCB85C);
}

BOOL sub_1A2BCB85C(unint64_t a1, uint64_t a2, unsigned __int8 a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  BOOL v7 = a3 > 1u || a4 >= a1;
  return a6 <= 1u && v7;
}

BOOL sub_1A2BCB87C(unint64_t a1, char a2, unint64_t a3, char a4)
{
  unint64_t Nanoseconds = a3;
  if ((a4 & 1) == 0) {
    unint64_t Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a3);
  }
  if ((a2 & 1) == 0) {
    a1 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a1);
  }
  return Nanoseconds >= a1;
}

uint64_t sub_1A2BCB8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2BCB97C(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_1A2BCB8EC);
}

BOOL sub_1A2BCB8EC(unint64_t a1, uint64_t a2, unsigned __int8 a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  BOOL v7 = a6 > 1u || a1 >= a4;
  return a3 <= 1u && v7;
}

BOOL sub_1A2BCB90C(unint64_t a1, char a2, unint64_t a3, char a4)
{
  unint64_t Nanoseconds = a1;
  if ((a2 & 1) == 0) {
    unint64_t Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a1);
  }
  if ((a4 & 1) == 0) {
    a3 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a3);
  }
  return Nanoseconds >= a3;
}

uint64_t sub_1A2BCB964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2BCB97C(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_1A2BCB9C0);
}

uint64_t sub_1A2BCB97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16));
}

uint64_t sub_1A2BCB9A0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1A2BCB9A8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TimestampRange()
{
  return &type metadata for TimestampRange;
}

uint64_t sub_1A2BCB9C0(unint64_t a1, uint64_t a2, unsigned __int8 a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  BOOL v7 = a3 < 2u && a4 < a1;
  return a6 > 1u || v7;
}

BOOL sub_1A2BCB9E4(unint64_t a1, char a2, unint64_t a3, char a4)
{
  unint64_t Nanoseconds = a3;
  if ((a4 & 1) == 0) {
    unint64_t Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a3);
  }
  if ((a2 & 1) == 0) {
    a1 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a1);
  }
  return Nanoseconds < a1;
}

void type metadata accessor for TagsTable()
{
}

void sub_1A2BCBA48()
{
  qword_1EB5572C8 = (uint64_t)&unk_1EF5C4220;
}

void sub_1A2BCBA5C()
{
  qword_1EB557398 = (uint64_t)&unk_1EF5C42D0;
}

void sub_1A2BCBA70()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  uint64_t v6 = OUTLINED_FUNCTION_18(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5_3();
  uint64_t v125 = v7;
  uint64_t v124 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v122 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_5_3();
  uint64_t v121 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_0();
  uint64_t v120 = v12;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_59();
  uint64_t v123 = v14;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)v114 - v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)v114 - v19;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)v114 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v25 = OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_9();
  uint64_t v127 = v26;
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_4_0();
  uint64_t v126 = v28;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_50_4(v30, v31, v32, v33, v34, v35, v36, v37, v114[0]);
  uint64_t v38 = type metadata accessor for TagsTable.Record(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v39);
  uint64_t v41 = (char *)v114 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + 16) && (uint64_t v42 = OUTLINED_FUNCTION_6_3(), sub_1A2B54DF8(v42, v43), (v44 & 1) != 0))
  {
    v118 = v41;
    uint64_t v119 = v38;
    uint64_t v117 = v4;
    OUTLINED_FUNCTION_32_0();
    uint64_t v4 = *(void *)v45;
    unint64_t v46 = *(void *)(v45 + 8);
    int v47 = *(unsigned __int8 *)(v45 + 16);
    if (*(unsigned char *)(v45 + 16))
    {
      if (v47 == 3)
      {
        uint64_t v50 = OUTLINED_FUNCTION_45_3();
        sub_1A2B3EA24(v50, v51, 3);
        OUTLINED_FUNCTION_45_3();
        sub_1A2C0CD10();
      }
      else
      {
        if (v47 == 4 && !(v46 | v4))
        {
          OUTLINED_FUNCTION_27_6(v0);
          uint64_t v38 = v119;
          goto LABEL_9;
        }
        OUTLINED_FUNCTION_3_22((uint64_t)v23);
        sub_1A2B3EA24(v4, v46, v47);
      }
    }
    else
    {
      uint64_t v48 = OUTLINED_FUNCTION_45_3();
      sub_1A2B3EA24(v48, v49, 0);
      OUTLINED_FUNCTION_45_3();
      sub_1A2C0CDB0();
    }
    OUTLINED_FUNCTION_26_4();
    int v52 = OUTLINED_FUNCTION_40_4();
    __swift_storeEnumTagSinglePayload(v0, v52 ^ 1u, 1, v25);
    sub_1A2B3EB74(v4, v46, v47);
    OUTLINED_FUNCTION_21_1(v0, 1, v25);
    uint64_t v4 = v117;
    uint64_t v38 = v119;
    if (!v53)
    {
      uint64_t v55 = v127;
      uint64_t v54 = v128;
      v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 32);
      v116(v128, v0, v25);
      v115 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
      v115(v118, v54, v25);
      if (!*(void *)(v2 + 16)) {
        goto LABEL_25;
      }
      sub_1A2B54DF8(0x636170735F676174, 0xE900000000000065);
      if ((v56 & 1) == 0) {
        goto LABEL_25;
      }
      OUTLINED_FUNCTION_32_0();
      v114[1] = v55 + 16;
      uint64_t v58 = *(void *)v57;
      unint64_t v59 = *(void *)(v57 + 8);
      char v60 = *(unsigned char *)(v57 + 16);
      sub_1A2B3EA24(*(void *)v57, v59, v60);
      OUTLINED_FUNCTION_30_4();
      uint64_t v61 = sub_1A2BBBB44();
      unint64_t v62 = v59;
      uint64_t v4 = v117;
      char v63 = v60;
      uint64_t v55 = v127;
      sub_1A2B3EB74(v58, v62, v63);
      if ((v61 & 0x100000000) != 0)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        uint64_t v70 = *(void (**)(void))(v55 + 8);
        ((void (*)(uint64_t, uint64_t))v70)(v128, v25);
LABEL_26:
        int v71 = 0;
        int v72 = 0;
        uint64_t v38 = v119;
LABEL_27:
        ((void (*)(char *, uint64_t))v70)(v118, v25);
        if (v71) {
          ((void (*)(char *, uint64_t))v70)(&v118[*(int *)(v38 + 24)], v25);
        }
        if (v72) {
          sub_1A2B3EB94(*(void *)&v118[*(int *)(v38 + 28)], *(void *)&v118[*(int *)(v38 + 28) + 8]);
        }
        goto LABEL_10;
      }
      *(_DWORD *)&v118[*(int *)(v119 + 20)] = v61;
      if (*(void *)(v2 + 16))
      {
        uint64_t v64 = OUTLINED_FUNCTION_17_12();
        sub_1A2B54DF8(v64, v65);
        if (v66)
        {
          OUTLINED_FUNCTION_32_0();
          unint64_t v69 = *(void *)v67;
          unint64_t v68 = *(void *)(v67 + 8);
          uint64_t v4 = *(unsigned __int8 *)(v67 + 16);
          if (*(unsigned char *)(v67 + 16))
          {
            if (v4 != 3)
            {
              if (v4 != 4 || v68 | v69)
              {
                OUTLINED_FUNCTION_3_22((uint64_t)v17);
                sub_1A2B3EA24(v69, v68, v4);
                goto LABEL_36;
              }
              OUTLINED_FUNCTION_27_6((uint64_t)v20);
LABEL_33:
              swift_bridgeObjectRelease();
              uint64_t v70 = *(void (**)(void))(v55 + 8);
              OUTLINED_FUNCTION_12_10();
              v70();
              sub_1A2B653F8((uint64_t)v20, &qword_1EB555500);
              goto LABEL_26;
            }
            uint64_t v75 = OUTLINED_FUNCTION_43_5();
            sub_1A2B3EA24(v75, v76, 3);
            OUTLINED_FUNCTION_43_5();
            sub_1A2C0CD10();
          }
          else
          {
            uint64_t v73 = OUTLINED_FUNCTION_43_5();
            sub_1A2B3EA24(v73, v74, 0);
            OUTLINED_FUNCTION_43_5();
            sub_1A2C0CDB0();
          }
LABEL_36:
          int v77 = OUTLINED_FUNCTION_40_4();
          __swift_storeEnumTagSinglePayload((uint64_t)v20, v77 ^ 1u, 1, v25);
          sub_1A2B3EB74(v69, v68, v4);
          OUTLINED_FUNCTION_21_1((uint64_t)v20, 1, v25);
          uint64_t v4 = v117;
          if (!v53)
          {
            v116(v126, (uint64_t)v20, v25);
            uint64_t v38 = v119;
            OUTLINED_FUNCTION_19_0();
            v78();
            if (!*(void *)(v2 + 16)) {
              goto LABEL_50;
            }
            sub_1A2B54DF8(0x617461645F676174, 0xE800000000000000);
            if ((v79 & 1) == 0) {
              goto LABEL_50;
            }
            OUTLINED_FUNCTION_37_6();
            if (v4 != 4 || v69 | v68)
            {
              if (v4 == 3)
              {
                sub_1A2B3EA24(v68, v69, 3);
                unint64_t v80 = v68;
                unint64_t v81 = v69;
              }
              else
              {
                unint64_t v80 = 0;
                unint64_t v81 = 0xF000000000000000;
              }
              unint64_t v129 = v80;
              unint64_t v130 = v81;
              sub_1A2B3EA24(v68, v69, v4);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554FA0);
              if ((swift_dynamicCast() & 1) == 0) {
                long long v131 = xmmword_1A2C1C190;
              }
              sub_1A2B3EB74(v68, v69, v4);
            }
            else
            {
              long long v131 = xmmword_1A2C1C190;
              sub_1A2B3EA24(0, 0, 4);
            }
            unint64_t v82 = *((void *)&v131 + 1);
            uint64_t v4 = v117;
            uint64_t v83 = v125;
            if (*((void *)&v131 + 1) >> 60 == 15)
            {
LABEL_50:
              swift_bridgeObjectRelease();
              uint64_t v70 = *(void (**)(void))(v55 + 8);
              OUTLINED_FUNCTION_12_10();
              v70();
              OUTLINED_FUNCTION_12_10();
              v70();
              int v72 = 0;
              int v71 = 1;
              goto LABEL_27;
            }
            uint64_t v84 = v131;
            uint64_t v85 = &v118[*(int *)(v38 + 28)];
            *(void *)uint64_t v85 = v131;
            *((void *)v85 + 1) = v82;
            uint64_t v86 = *(void *)(v2 + 16);
            sub_1A2BCDF90(v84, v82);
            if (v86 && (uint64_t v87 = OUTLINED_FUNCTION_8_2(), sub_1A2B54DF8(v87, v88), (v89 & 1) != 0))
            {
              OUTLINED_FUNCTION_37_6();
              sub_1A2B3EA24(v86, v83, v4);
              sub_1A2BBB940(v86, v83, v4, v125);
              unint64_t v90 = v83;
              uint64_t v83 = v125;
              char v91 = v4;
              uint64_t v4 = v117;
              sub_1A2B3EB74(v86, v90, v91);
              OUTLINED_FUNCTION_21_1(v83, 1, v124);
              if (!v53)
              {
                OUTLINED_FUNCTION_54_0();
                v92();
                OUTLINED_FUNCTION_19_0();
                v93();
                if (!*(void *)(v2 + 16) || (uint64_t v94 = OUTLINED_FUNCTION_15_9(), sub_1A2B54DF8(v94, v95), (v96 & 1) == 0))
                {
                  swift_bridgeObjectRelease();
                  sub_1A2B48634(v84, v82);
                  OUTLINED_FUNCTION_38_5();
                  v101();
                  v102 = *(void (**)(void))(v127 + 8);
                  OUTLINED_FUNCTION_24_9();
                  v102();
                  OUTLINED_FUNCTION_24_9();
                  v102();
                  uint64_t v103 = v123;
                  OUTLINED_FUNCTION_3_22(v123);
LABEL_71:
                  uint64_t v112 = (uint64_t)v118;
                  uint64_t v111 = v119;
                  sub_1A2B4B2CC(v103, (uint64_t)&v118[*(int *)(v119 + 36)], &qword_1EB555500);
                  uint64_t v113 = v117;
                  sub_1A2BCDFA4(v112, v117);
                  __swift_storeEnumTagSinglePayload(v113, 0, 1, v111);
                  sub_1A2BCE008(v112);
                  goto LABEL_11;
                }
                OUTLINED_FUNCTION_32_0();
                uint64_t v98 = *(void *)v97;
                unint64_t v99 = *(void *)(v97 + 8);
                int v100 = *(unsigned __int8 *)(v97 + 16);
                sub_1A2B3EA24(*(void *)v97, v99, *(unsigned char *)(v97 + 16));
                swift_bridgeObjectRelease();
                if (v100)
                {
                  if (v100 == 3)
                  {
                    uint64_t v104 = OUTLINED_FUNCTION_26_4();
                    sub_1A2B3EA44(v104, v105);
                    OUTLINED_FUNCTION_26_4();
                    sub_1A2C0CD10();
                    uint64_t v106 = OUTLINED_FUNCTION_26_4();
                    sub_1A2B3EB74(v106, v107, 3);
                  }
                  else
                  {
                    if (v100 == 4 && !(v99 | v98))
                    {
                      OUTLINED_FUNCTION_3_22(v123);
LABEL_70:
                      sub_1A2B48634(v84, v82);
                      (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v121, v124);
                      v110 = *(void (**)(void))(v127 + 8);
                      OUTLINED_FUNCTION_24_9();
                      v110();
                      OUTLINED_FUNCTION_24_9();
                      v110();
                      uint64_t v103 = v123;
                      goto LABEL_71;
                    }
                    OUTLINED_FUNCTION_3_22(v120);
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_26_4();
                  sub_1A2C0CDB0();
                }
                if (OUTLINED_FUNCTION_40_4())
                {
                  uint64_t v108 = v123;
                  uint64_t v109 = 0;
                }
                else
                {
                  uint64_t v108 = v123;
                  uint64_t v109 = 1;
                }
                __swift_storeEnumTagSinglePayload(v108, v109, 1, v25);
                sub_1A2B3EB74(v98, v99, v100);
                goto LABEL_70;
              }
            }
            else
            {
              __swift_storeEnumTagSinglePayload(v83, 1, 1, v124);
            }
            swift_bridgeObjectRelease();
            sub_1A2B48634(v84, v82);
            uint64_t v70 = *(void (**)(void))(v55 + 8);
            OUTLINED_FUNCTION_12_10();
            v70();
            OUTLINED_FUNCTION_12_10();
            v70();
            sub_1A2B653F8(v83, &qword_1EB554320);
            int v71 = 1;
            int v72 = 1;
            goto LABEL_27;
          }
          goto LABEL_33;
        }
      }
      OUTLINED_FUNCTION_3_22((uint64_t)v20);
      goto LABEL_33;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_22(v0);
  }
LABEL_9:
  swift_bridgeObjectRelease();
  sub_1A2B653F8(v0, &qword_1EB555500);
LABEL_10:
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v38);
LABEL_11:
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A2BCC470()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v3 = OUTLINED_FUNCTION_18(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_5_3();
  uint64_t v62 = v4;
  sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v60 = v6;
  uint64_t v61 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_5_3();
  uint64_t v59 = v7;
  uint64_t v8 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_0();
  uint64_t v58 = v12;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v55 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554288);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1A2C1F180;
  *(void *)(v16 + 32) = 0x64695F6B636F6C63;
  *(void *)(v16 + 40) = 0xE800000000000000;
  *(_WORD *)(v16 + 48) = 0;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v63 = v8;
  v17(v15, v1, v8);
  uint64_t v18 = sub_1A2C0CDC0();
  uint64_t v20 = v19;
  uint64_t v57 = v10;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v15, v8);
  *(_OWORD *)(v16 + 56) = xmmword_1A2C1CE50;
  *(void *)(v16 + 72) = v18;
  *(void *)(v16 + 80) = v20;
  *(unsigned char *)(v16 + 88) = 0;
  *(void *)(v16 + 96) = 0x636170735F676174;
  *(void *)(v16 + 104) = 0xE900000000000065;
  *(_WORD *)(v16 + 112) = 2;
  uint64_t v22 = (int *)type metadata accessor for TagsTable.Record(0);
  uint64_t v23 = *(unsigned int *)(v1 + v22[5]);
  *(_OWORD *)(v16 + 120) = xmmword_1A2C1F190;
  *(void *)(v16 + 136) = v23;
  *(void *)(v16 + 144) = 0;
  *(unsigned char *)(v16 + 152) = 1;
  *(void *)(v16 + 160) = 0x64695F676174;
  *(void *)(v16 + 168) = 0xE600000000000000;
  *(_WORD *)(v16 + 176) = 0;
  uint64_t v24 = v1 + v22[6];
  uint64_t v25 = v1;
  uint64_t v26 = v63;
  v55[1] = v17;
  v55[2] = v10 + 16;
  v17(v15, v24, v63);
  uint64_t v27 = v15;
  uint64_t v28 = sub_1A2C0CDC0();
  uint64_t v30 = v29;
  v55[3] = v10 + 8;
  char v56 = (void (*)(uint64_t, uint64_t))v21;
  v21(v27, v26);
  *(_OWORD *)(v16 + 184) = xmmword_1A2C1F1A0;
  *(void *)(v16 + 200) = v28;
  *(void *)(v16 + 208) = v30;
  *(unsigned char *)(v16 + 216) = 0;
  *(void *)(v16 + 224) = 0x617461645F676174;
  *(void *)(v16 + 232) = 0xE800000000000000;
  *(_WORD *)(v16 + 240) = 4;
  uint64_t v31 = (uint64_t *)(v25 + v22[7]);
  uint64_t v32 = *v31;
  unint64_t v33 = v31[1];
  *(_OWORD *)(v16 + 248) = xmmword_1A2C1F1B0;
  *(void *)(v16 + 264) = v32;
  *(void *)(v16 + 272) = v33;
  *(unsigned char *)(v16 + 280) = 3;
  *(void *)(v16 + 288) = 0x5F64657461657263;
  *(void *)(v16 + 296) = 0xEA00000000006E6FLL;
  *(_WORD *)(v16 + 304) = 3;
  uint64_t v34 = v59;
  uint64_t v35 = v60;
  uint64_t v36 = v61;
  OUTLINED_FUNCTION_19_0();
  v37();
  sub_1A2B3EA44(v32, v33);
  sub_1A2C0CD70();
  uint64_t v39 = v38;
  uint64_t v40 = v34;
  uint64_t v42 = v62;
  uint64_t v41 = v63;
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v40, v36);
  *(void *)(v16 + 312) = 0x5F64657461657263;
  *(void *)(v16 + 320) = 0xEA00000000006E6FLL;
  *(void *)(v16 + 328) = v39;
  *(void *)(v16 + 336) = 0;
  *(unsigned char *)(v16 + 344) = 2;
  sub_1A2B6544C(v25 + v22[9], v42, &qword_1EB555500);
  OUTLINED_FUNCTION_21_1(v42, 1, v41);
  if (v43)
  {
    sub_1A2B653F8(v42, &qword_1EB555500);
  }
  else
  {
    uint64_t v44 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v58, v42, v41);
    OUTLINED_FUNCTION_19_0();
    v45();
    uint64_t v46 = sub_1A2C0CDC0();
    uint64_t v48 = v47;
    unint64_t v49 = v27;
    uint64_t v50 = v56;
    v56((uint64_t)v49, v41);
    unint64_t v51 = *(void *)(v16 + 16);
    if (v51 >= *(void *)(v16 + 24) >> 1)
    {
      sub_1A2B86D68();
      uint64_t v16 = v54;
    }
    *(void *)(v16 + 16) = v51 + 1;
    uint64_t v52 = v16 + (v51 << 6);
    strcpy((char *)(v52 + 32), "component_uuid");
    *(unsigned char *)(v52 + 47) = -18;
    *(_WORD *)(v52 + 48) = 256;
    *(_OWORD *)(v52 + 56) = xmmword_1A2C1F1C0;
    *(void *)(v52 + 72) = v46;
    *(void *)(v52 + 80) = v48;
    *(unsigned char *)(v52 + 88) = 0;
    v50(v44, v41);
  }
  return v16;
}

void sub_1A2BCC928()
{
  OUTLINED_FUNCTION_8_0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5543D0);
  uint64_t v10 = OUTLINED_FUNCTION_18(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_17();
  sub_1A2B6544C(v8, v0, &qword_1EB5543D0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5543C8);
  OUTLINED_FUNCTION_21_1(v0, 1, v11);
  if (v12)
  {
    sub_1A2B653F8(v0, &qword_1EB5543D0);
  }
  else
  {
    sub_1A2B62BC4();
    int v14 = ~v13;
    sub_1A2B653F8(v0, &qword_1EB5543C8);
    if (v14)
    {
      uint64_t v15 = OUTLINED_FUNCTION_32_7();
      sub_1A2B3EA24(v15, v16, v17);
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = OUTLINED_FUNCTION_32_7();
      sub_1A2B6D53C(v18, v19, v20, 0x64695F6B636F6C63, 0xE800000000000000, 0);
      swift_bridgeObjectRelease();
      uint64_t v21 = OUTLINED_FUNCTION_32_7();
      sub_1A2B3EB60(v21, v22, v23);
    }
  }
  if ((v6 & 0x10000000000) == 0)
  {
    uint64_t v24 = OUTLINED_FUNCTION_31_7();
    sub_1A2B3EA24(v24, v25, v26);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = OUTLINED_FUNCTION_31_7();
    sub_1A2B6D53C(v27, v28, v29, 0x636170735F676174, 0xE900000000000065, 2);
    swift_bridgeObjectRelease();
    uint64_t v30 = OUTLINED_FUNCTION_31_7();
    sub_1A2B3EB74(v30, v31, v32);
  }
  if (v2 >> 60 != 11)
  {
    sub_1A2BCE0AC(v4, v2);
    if (v2 >> 60 == 15) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = v4;
    }
    if (v2 >> 60 == 15) {
      unint64_t v34 = 0;
    }
    else {
      unint64_t v34 = v2;
    }
    if (v2 >> 60 == 15) {
      char v35 = 4;
    }
    else {
      char v35 = 3;
    }
    sub_1A2B3EA24(v33, v34, v35);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v36 = OUTLINED_FUNCTION_30_4();
    sub_1A2B6D53C(v36, v37, v38, 0x617461645F676174, 0xE800000000000000, 4);
    swift_bridgeObjectRelease();
    sub_1A2BCE0C0(v4, v2);
    uint64_t v39 = OUTLINED_FUNCTION_30_4();
    sub_1A2B3EB74(v39, v40, v41);
  }
  sub_1A2B653F8(v8, &qword_1EB5543D0);
  OUTLINED_FUNCTION_7();
}

void sub_1A2BCCB84()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v0;
  uint64_t v3 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v152 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_4_0();
  v146[2] = v6;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_59();
  uint64_t v150 = v8;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v9);
  v146[1] = (char *)v146 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
  uint64_t v12 = OUTLINED_FUNCTION_18(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_5_3();
  uint64_t v160 = v13;
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_21_4();
  uint64_t v17 = v15 - v16;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_59();
  uint64_t v148 = v19;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v20);
  v159 = (char *)v146 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v23 = OUTLINED_FUNCTION_18(v22);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_21_4();
  uint64_t v26 = v24 - v25;
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_59();
  uint64_t v154 = v28;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v29);
  uint64_t v30 = OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_9();
  uint64_t v32 = v31;
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_4_0();
  uint64_t v151 = v34;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_59();
  uint64_t v147 = v36;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_59();
  uint64_t v164 = v38;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v39);
  char v41 = (void *)((char *)v146 - v40);
  MEMORY[0x1F4188790](v42);
  uint64_t v44 = (char *)v146 - v43;
  uint64_t v168 = MEMORY[0x1E4FBC860];
  char v169 = 0;
  uint64_t v170 = MEMORY[0x1E4FBC860];
  sub_1A2B6544C(v2, (uint64_t)v1, &qword_1EB555500);
  OUTLINED_FUNCTION_21_1((uint64_t)v1, 1, v30);
  v165 = v41;
  uint64_t v155 = v26;
  uint64_t v149 = v17;
  if (v121)
  {
    sub_1A2B653F8((uint64_t)v1, &qword_1EB555500);
  }
  else
  {
    OUTLINED_FUNCTION_54_0();
    v45();
    OUTLINED_FUNCTION_19_0();
    v46();
    sub_1A2C0CDC0();
    uint64_t v47 = OUTLINED_FUNCTION_13_10();
    v1(v47);
    char v41 = &v168;
    uint64_t v48 = OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_9_13(v48, v49);
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v1)(v44, v30);
  }
  uint64_t v50 = (int *)type metadata accessor for TagsTable.Predicate(0);
  uint64_t v51 = *(void *)(v2 + v50[5]);
  uint64_t v166 = v30;
  v161 = v50;
  uint64_t v156 = v32;
  uint64_t v157 = v2;
  if (v51)
  {
    uint64_t v52 = *(void *)(v51 + 16);
    uint64_t v53 = MEMORY[0x1E4FBC860];
    if (v52)
    {
      uint64_t v153 = v3;
      uint64_t v167 = MEMORY[0x1E4FBC860];
      sub_1A2BE0470(0, v52, 0);
      OUTLINED_FUNCTION_39_5();
      uint64_t v55 = v51 + v54;
      uint64_t v162 = *(void *)(v32 + 72);
      v163 = v56;
      do
      {
        uint64_t v57 = v163;
        OUTLINED_FUNCTION_47_5();
        v57();
        OUTLINED_FUNCTION_47_5();
        v57();
        uint64_t v58 = sub_1A2C0CDC0();
        unint64_t v1 = v59;
        uint64_t v60 = *(void (**)(void))(v32 + 8);
        OUTLINED_FUNCTION_23_6();
        v60();
        OUTLINED_FUNCTION_23_6();
        v60();
        uint64_t v53 = v167;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_36_6();
          uint64_t v53 = v167;
        }
        unint64_t v62 = *(void *)(v53 + 16);
        unint64_t v61 = *(void *)(v53 + 24);
        if (v62 >= v61 >> 1)
        {
          sub_1A2BE0470(v61 > 1, v62 + 1, 1);
          uint64_t v53 = v167;
        }
        *(void *)(v53 + 16) = v62 + 1;
        uint64_t v63 = v53 + 24 * v62;
        *(void *)(v63 + 32) = v58;
        *(void *)(v63 + 40) = v1;
        *(unsigned char *)(v63 + 48) = 0;
        v55 += v162;
        --v52;
      }
      while (v52);
      uint64_t v32 = v156;
      uint64_t v2 = v157;
      uint64_t v3 = v153;
      uint64_t v30 = v166;
    }
    char v41 = &v168;
    uint64_t v64 = OUTLINED_FUNCTION_6_3();
    sub_1A2B3E5D4(v64, v65, 0, v53);
    swift_bridgeObjectRelease();
    uint64_t v50 = v161;
  }
  uint64_t v66 = v154;
  sub_1A2B6544C(v2 + v50[6], v154, &qword_1EB555500);
  OUTLINED_FUNCTION_21_1(v66, 1, v30);
  if (v121)
  {
    uint64_t v75 = sub_1A2B653F8(v66, &qword_1EB555500);
  }
  else
  {
    uint64_t v67 = v3;
    uint64_t v68 = v147;
    OUTLINED_FUNCTION_54_0();
    v69();
    OUTLINED_FUNCTION_42_3();
    OUTLINED_FUNCTION_19_0();
    v70();
    sub_1A2C0CDC0();
    uint64_t v71 = OUTLINED_FUNCTION_13_10();
    v1(v71);
    char v41 = &v168;
    uint64_t v72 = OUTLINED_FUNCTION_17_12();
    OUTLINED_FUNCTION_9_13(v72, v73);
    swift_bridgeObjectRelease();
    uint64_t v74 = v68;
    uint64_t v3 = v67;
    uint64_t v2 = v157;
    uint64_t v75 = ((uint64_t (*)(uint64_t, uint64_t))v1)(v74, v30);
  }
  uint64_t v79 = v160;
  uint64_t v80 = *(void *)(v2 + v50[7]);
  if (v80)
  {
    uint64_t v81 = *(void *)(v80 + 16);
    uint64_t v82 = MEMORY[0x1E4FBC860];
    if (v81)
    {
      uint64_t v153 = v3;
      uint64_t v167 = MEMORY[0x1E4FBC860];
      OUTLINED_FUNCTION_49_3();
      OUTLINED_FUNCTION_39_5();
      uint64_t v84 = v80 + v83;
      uint64_t v162 = *(void *)(v32 + 72);
      v163 = v85;
      do
      {
        uint64_t v86 = v163;
        OUTLINED_FUNCTION_47_5();
        v86();
        OUTLINED_FUNCTION_47_5();
        v86();
        uint64_t v87 = sub_1A2C0CDC0();
        uint64_t v89 = v88;
        unint64_t v90 = *(void (**)(void))(v32 + 8);
        OUTLINED_FUNCTION_23_6();
        v90();
        OUTLINED_FUNCTION_23_6();
        v90();
        uint64_t v82 = v167;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_36_6();
          uint64_t v82 = v167;
        }
        unint64_t v92 = *(void *)(v82 + 16);
        unint64_t v91 = *(void *)(v82 + 24);
        if (v92 >= v91 >> 1)
        {
          sub_1A2BE0470(v91 > 1, v92 + 1, 1);
          uint64_t v82 = v167;
        }
        *(void *)(v82 + 16) = v92 + 1;
        uint64_t v93 = v82 + 24 * v92;
        *(void *)(v93 + 32) = v87;
        *(void *)(v93 + 40) = v89;
        *(unsigned char *)(v93 + 48) = 0;
        v84 += v162;
        --v81;
      }
      while (v81);
      uint64_t v32 = v156;
      uint64_t v2 = v157;
      uint64_t v3 = v153;
      uint64_t v30 = v166;
      uint64_t v79 = v160;
      uint64_t v50 = v161;
    }
    char v41 = &v168;
    uint64_t v94 = OUTLINED_FUNCTION_17_12();
    sub_1A2B3E5D4(v94, v95, 0, v82);
    uint64_t v75 = swift_bridgeObjectRelease();
  }
  char v96 = (unsigned int *)(v2 + v50[8]);
  if ((v96[1] & 1) == 0)
  {
    char v41 = &v168;
    OUTLINED_FUNCTION_8_13(v75, v76, v77, v78, *v96);
  }
  uint64_t v97 = *(void *)(v2 + v50[9]);
  uint64_t v98 = (uint64_t)v159;
  if (v97)
  {
    uint64_t v99 = *(void *)(v97 + 16);
    uint64_t v100 = MEMORY[0x1E4FBC860];
    if (v99)
    {
      uint64_t v167 = MEMORY[0x1E4FBC860];
      OUTLINED_FUNCTION_49_3();
      uint64_t v100 = v167;
      v101 = (unsigned int *)(v97 + 32);
      unint64_t v102 = *(void *)(v167 + 16);
      uint64_t v103 = 24 * v102;
      do
      {
        unsigned int v105 = *v101++;
        uint64_t v104 = v105;
        uint64_t v167 = v100;
        unint64_t v106 = *(void *)(v100 + 24);
        unint64_t v107 = v102 + 1;
        if (v102 >= v106 >> 1)
        {
          sub_1A2BE0470(v106 > 1, v102 + 1, 1);
          uint64_t v100 = v167;
        }
        *(void *)(v100 + 16) = v107;
        uint64_t v108 = v100 + v103;
        *(void *)(v108 + 32) = v104;
        *(void *)(v108 + 40) = 0;
        *(unsigned char *)(v108 + 48) = 1;
        v103 += 24;
        unint64_t v102 = v107;
        --v99;
      }
      while (v99);
      uint64_t v30 = v166;
      uint64_t v32 = v156;
      uint64_t v98 = (uint64_t)v159;
      uint64_t v79 = v160;
    }
    char v41 = &v168;
    uint64_t v109 = OUTLINED_FUNCTION_18_8();
    sub_1A2B3E5D4(v109, v110, v111, v100);
    swift_bridgeObjectRelease();
    uint64_t v50 = v161;
  }
  sub_1A2B6544C(v2 + v50[10], v79, &qword_1EB554318);
  uint64_t v112 = v158;
  OUTLINED_FUNCTION_21_1(v79, 1, v158);
  if (v121)
  {
    sub_1A2B653F8(v79, &qword_1EB554318);
  }
  else
  {
    uint64_t v113 = *(int *)(v112 + 48);
    uint64_t v114 = v98 + v113;
    uint64_t v115 = v79;
    uint64_t v116 = v112;
    uint64_t v117 = v115 + v113;
    sub_1A2B4B2CC(v115, v98, &qword_1EB554320);
    sub_1A2B4B2CC(v117, v114, &qword_1EB554320);
    uint64_t v118 = *(int *)(v116 + 48);
    uint64_t v119 = v148;
    uint64_t v120 = v148 + v118;
    sub_1A2B6544C(v98, v148, &qword_1EB554320);
    sub_1A2B6544C(v114, v120, &qword_1EB554320);
    OUTLINED_FUNCTION_21_1(v119, 1, v3);
    if (v121)
    {
      sub_1A2B653F8(v120, &qword_1EB554320);
      sub_1A2B653F8(v119, &qword_1EB554320);
    }
    else
    {
      uint64_t v122 = v152;
      OUTLINED_FUNCTION_54_0();
      v123();
      sub_1A2B653F8(v120, &qword_1EB554320);
      OUTLINED_FUNCTION_41_3();
      OUTLINED_FUNCTION_19_0();
      v124();
      sub_1A2C0CD70();
      uint64_t v125 = *(void (**)(void))(v122 + 8);
      OUTLINED_FUNCTION_21_8();
      v125();
      uint64_t v126 = OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_52_5(v126, v127, 15678);
      OUTLINED_FUNCTION_21_8();
      v125();
      uint64_t v98 = (uint64_t)v159;
    }
    uint64_t v128 = v149;
    uint64_t v129 = v149 + *(int *)(v158 + 48);
    char v41 = &qword_1EB554320;
    sub_1A2B6544C(v98, v149, &qword_1EB554320);
    sub_1A2B6544C(v114, v129, &qword_1EB554320);
    OUTLINED_FUNCTION_21_1(v129, 1, v3);
    if (v121)
    {
      sub_1A2B653F8(v98, &qword_1EB5540E0);
      sub_1A2B653F8(v129, &qword_1EB554320);
      uint64_t v138 = v128;
      v137 = &qword_1EB554320;
    }
    else
    {
      uint64_t v130 = v128;
      uint64_t v131 = v152;
      OUTLINED_FUNCTION_54_0();
      v132();
      sub_1A2B653F8(v130, &qword_1EB554320);
      OUTLINED_FUNCTION_41_3();
      OUTLINED_FUNCTION_19_0();
      v133();
      sub_1A2C0CD70();
      v134 = *(void (**)(void))(v131 + 8);
      OUTLINED_FUNCTION_21_8();
      v134();
      char v41 = &v168;
      uint64_t v135 = OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_52_5(v135, v136, 15676);
      OUTLINED_FUNCTION_21_8();
      v134();
      v137 = &qword_1EB5540E0;
      uint64_t v138 = v98;
    }
    sub_1A2B653F8(v138, v137);
    uint64_t v50 = v161;
  }
  uint64_t v139 = v155;
  sub_1A2B6544C(v2 + v50[11], v155, &qword_1EB555500);
  OUTLINED_FUNCTION_21_1(v139, 1, v30);
  if (v121)
  {
    sub_1A2B653F8(v139, &qword_1EB555500);
  }
  else
  {
    OUTLINED_FUNCTION_54_0();
    v140();
    OUTLINED_FUNCTION_42_3();
    OUTLINED_FUNCTION_19_0();
    v141();
    sub_1A2C0CDC0();
    v142 = *(void (**)(uint64_t *, uint64_t))(v32 + 8);
    v142(v41, v30);
    uint64_t v143 = OUTLINED_FUNCTION_15_9();
    OUTLINED_FUNCTION_9_13(v143, v144);
    swift_bridgeObjectRelease();
    uint64_t v145 = OUTLINED_FUNCTION_26_4();
    ((void (*)(uint64_t))v142)(v145);
  }
  sub_1A2B3E8F8();
  OUTLINED_FUNCTION_53();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_7();
}

void sub_1A2BCD698()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_17();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
  uint64_t v8 = OUTLINED_FUNCTION_18(v7);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v26[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v12 = OUTLINED_FUNCTION_18(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_21_4();
  uint64_t v15 = v13 - v14;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v26[-1] - v17;
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_33_6((uint64_t)v18);
  OUTLINED_FUNCTION_33_6(v15);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  uint64_t v20 = (uint64_t)&v10[*(int *)(v19 + 48)];
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v3);
  sub_1A2C0CD90();
  sub_1A2C0CD40();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  __swift_storeEnumTagSinglePayload(v20, 0, 1, v3);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v19);
  uint64_t v21 = (int *)type metadata accessor for TagsTable.Predicate(0);
  id v26[3] = (uint64_t)v21;
  v26[4] = (uint64_t)&off_1EF5C59D8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  OUTLINED_FUNCTION_33_6((uint64_t)boxed_opaque_existential_1 + v21[11]);
  sub_1A2B4B2CC((uint64_t)v18, (uint64_t)boxed_opaque_existential_1, &qword_1EB555500);
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v21[5]) = 0;
  sub_1A2B4B2CC(v15, (uint64_t)boxed_opaque_existential_1 + v21[6], &qword_1EB555500);
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v21[7]) = 0;
  uint64_t v23 = (char *)boxed_opaque_existential_1 + v21[8];
  *(_DWORD *)uint64_t v23 = 0;
  v23[4] = 1;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v21[9]) = 0;
  sub_1A2B4B2CC((uint64_t)v10, (uint64_t)boxed_opaque_existential_1 + v21[10], &qword_1EB554318);
  v2[3] = (uint64_t)&type metadata for SQLDelete;
  v2[4] = (uint64_t)&off_1EF5C5770;
  uint64_t v24 = swift_allocObject();
  uint64_t *v2 = v24;
  *(void *)(v24 + 16) = 1936154996;
  *(void *)(v24 + 24) = 0xE400000000000000;
  sub_1A2B4B2CC((uint64_t)v26, v24 + 32, &qword_1EB554110);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A2BCD940()
{
  return 1936154996;
}

_UNKNOWN **sub_1A2BCD954()
{
  return &off_1EF5C59A0;
}

_UNKNOWN **sub_1A2BCD960()
{
  return &off_1EF5C59D8;
}

_UNKNOWN **sub_1A2BCD96C()
{
  return &off_1EF5C5978;
}

_UNKNOWN **sub_1A2BCD978()
{
  return &off_1EF5C5940;
}

uint64_t type metadata accessor for TagsTable.Predicate(uint64_t a1)
{
  return sub_1A2B4B1E4(a1, (uint64_t *)&unk_1EB5545D0);
}

uint64_t sub_1A2BCD9A4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2)
    {
      uint64_t v10 = MEMORY[0x1E4FBC860];
      sub_1A2BE0384();
      uint64_t v3 = (uint64_t *)(a1 + 40);
      do
      {
        uint64_t v5 = *(v3 - 1);
        uint64_t v4 = *v3;
        unint64_t v6 = *(void *)(v10 + 16);
        unint64_t v7 = *(void *)(v10 + 24);
        swift_bridgeObjectRetain();
        if (v6 >= v7 >> 1) {
          sub_1A2BE0384();
        }
        v3 += 3;
        *(void *)(v10 + 16) = v6 + 1;
        uint64_t v8 = v10 + 16 * v6;
        *(void *)(v8 + 32) = v5;
        *(void *)(v8 + 40) = v4;
        --v2;
      }
      while (v2);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
    sub_1A2B3EA9C();
    sub_1A2C0D440();
    swift_bridgeObjectRelease();
  }
  sub_1A2BCDC68();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0DB60();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  sub_1A2C0D530();
  sub_1A2C0D530();
  sub_1A2C0D530();
  OUTLINED_FUNCTION_29_7();
  sub_1A2C0D530();
  OUTLINED_FUNCTION_29_7();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  return 0;
}

void sub_1A2BCDC68()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v55 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v54 = v9;
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_50_4(v11, v12, v13, v14, v15, v16, v17, v18, v51);
  if ((v5 & 0x100000000) == 0) {
    OUTLINED_FUNCTION_8_13(v19, v20, v21, v22, v5);
  }
  if (v3)
  {
    uint64_t v23 = *(void *)(v3 + 16);
    uint64_t v24 = MEMORY[0x1E4FBC860];
    if (v23)
    {
      uint64_t v56 = MEMORY[0x1E4FBC860];
      sub_1A2BE0470(0, v23, 0);
      uint64_t v24 = v56;
      uint64_t v25 = (unsigned int *)(v3 + 32);
      unint64_t v26 = *(void *)(v56 + 16);
      uint64_t v27 = 24 * v26;
      do
      {
        unsigned int v29 = *v25++;
        uint64_t v28 = v29;
        unint64_t v30 = *(void *)(v56 + 24);
        unint64_t v31 = v26 + 1;
        if (v26 >= v30 >> 1) {
          sub_1A2BE0470(v30 > 1, v26 + 1, 1);
        }
        *(void *)(v56 + 16) = v31;
        uint64_t v32 = v56 + v27;
        *(void *)(v32 + 32) = v28;
        *(void *)(v32 + 40) = 0;
        *(unsigned char *)(v32 + 48) = 1;
        v27 += 24;
        unint64_t v26 = v31;
        --v23;
      }
      while (v23);
    }
    uint64_t v33 = OUTLINED_FUNCTION_18_8();
    sub_1A2B3E5D4(v33, v34, v35, v24);
    swift_bridgeObjectRelease();
  }
  uint64_t v36 = *(void *)(v1 + 16);
  uint64_t v37 = MEMORY[0x1E4FBC860];
  if (v36)
  {
    uint64_t v57 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1A2BE0470(0, v36, 0);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    uint64_t v39 = v7 + 16;
    uint64_t v38 = v40;
    OUTLINED_FUNCTION_39_5();
    uint64_t v42 = v1 + v41;
    uint64_t v52 = *(void *)(v39 + 56);
    uint64_t v43 = (void (**)(void))(v39 - 8);
    do
    {
      v38(v53, v42, v55);
      v38(v54, v53, v55);
      uint64_t v44 = sub_1A2C0CDC0();
      uint64_t v46 = v45;
      uint64_t v47 = *v43;
      OUTLINED_FUNCTION_38_5();
      v47();
      OUTLINED_FUNCTION_38_5();
      v47();
      uint64_t v37 = v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2BE0470(0, *(void *)(v57 + 16) + 1, 1);
        uint64_t v37 = v57;
      }
      unint64_t v49 = *(void *)(v37 + 16);
      unint64_t v48 = *(void *)(v37 + 24);
      if (v49 >= v48 >> 1)
      {
        sub_1A2BE0470(v48 > 1, v49 + 1, 1);
        uint64_t v37 = v57;
      }
      *(void *)(v37 + 16) = v49 + 1;
      uint64_t v50 = v37 + 24 * v49;
      *(void *)(v50 + 32) = v44;
      *(void *)(v50 + 40) = v46;
      *(unsigned char *)(v50 + 48) = 0;
      v42 += v52;
      --v36;
    }
    while (v36);
    swift_bridgeObjectRelease();
  }
  sub_1A2B3E5D4(0xD000000000000011, 0x80000001A2C10D00, 0, v37);
  swift_bridgeObjectRelease();
  sub_1A2B3E8F8();
  OUTLINED_FUNCTION_53();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for TagsTable.Record(uint64_t a1)
{
  return sub_1A2B4B1E4(a1, (uint64_t *)&unk_1EB5545A0);
}

uint64_t sub_1A2BCDF90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1A2B3EA44(a1, a2);
  }
  return a1;
}

uint64_t sub_1A2BCDFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TagsTable.Record(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2BCE008(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TagsTable.Record(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2BCE064()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 56)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  }
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2BCE0AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 11) {
    return sub_1A2BCDF90(a1, a2);
  }
  return a1;
}

uint64_t sub_1A2BCE0C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 11) {
    return sub_1A2B48634(a1, a2);
  }
  return a1;
}

uint64_t *sub_1A2BCE0D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A2C0CE20();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
    uint64_t v14 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
    v15[4] = v16[4];
    uint64_t v17 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_1A2C0CDA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v22))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v18, v19, v22);
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v22);
      }
      uint64_t v24 = *(int *)(v20 + 48);
      uint64_t v25 = &v18[v24];
      unint64_t v26 = &v19[v24];
      if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v22))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v25, v26, v22);
        __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v22);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    uint64_t v28 = a3[11];
    unsigned int v29 = (char *)a1 + v28;
    unint64_t v30 = (char *)a2 + v28;
    if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v7))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v29, v30, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_1A2BCE520(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A2C0CE20();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  if (!__swift_getEnumTagSinglePayload(v5, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v5, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[10];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    uint64_t v8 = sub_1A2C0CDA0();
    if (!__swift_getEnumTagSinglePayload(v6, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    }
    uint64_t v9 = v6 + *(int *)(v7 + 48);
    if (!__swift_getEnumTagSinglePayload(v9, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v9, v8);
    }
  }
  uint64_t v10 = a1 + a2[11];
  uint64_t result = __swift_getEnumTagSinglePayload(v10, 1, v4);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v12(v10, v4);
  }
  return result;
}

char *sub_1A2BCE748(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  v13[4] = v14[4];
  uint64_t v15 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = sub_1A2C0CDA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
      memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v16, v17, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v20);
    }
    uint64_t v22 = *(int *)(v18 + 48);
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v20))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v23, v24, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v20);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  }
  uint64_t v26 = a3[11];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v6))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v27, v28, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v6);
  }
  return a1;
}

char *sub_1A2BCEB44(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v12, v13, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
LABEL_13:
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = *(_DWORD *)v20;
  v19[4] = v20[4];
  *(_DWORD *)uint64_t v19 = v21;
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  int v26 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v25);
  int v27 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25);
  if (v26)
  {
    if (!v27)
    {
      uint64_t v28 = sub_1A2C0CDA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v28))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v23, v24, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v28);
      }
      uint64_t v36 = *(int *)(v25 + 48);
      uint64_t v37 = &v23[v36];
      uint64_t v38 = &v24[v36];
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v28))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v37, v38, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v28);
      }
      uint64_t v40 = (uint64_t)v23;
      uint64_t v41 = v25;
      goto LABEL_31;
    }
    goto LABEL_19;
  }
  if (v27)
  {
    sub_1A2B653F8((uint64_t)v23, &qword_1EB5540E0);
LABEL_19:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318) - 8) + 64);
    uint64_t v31 = v23;
    uint64_t v32 = v24;
LABEL_20:
    memcpy(v31, v32, v30);
    goto LABEL_32;
  }
  uint64_t v33 = sub_1A2C0CDA0();
  int v34 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v33);
  int v35 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v33);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v23, v24, v33);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v33);
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  uint64_t v50 = *(void *)(v33 - 8);
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v23, v33);
LABEL_42:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
    memcpy(v23, v24, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_43;
  }
  (*(void (**)(char *, char *, uint64_t))(v50 + 24))(v23, v24, v33);
LABEL_43:
  uint64_t v52 = *(int *)(v25 + 48);
  uint64_t v53 = (uint64_t)&v23[v52];
  uint64_t v54 = (uint64_t)&v24[v52];
  int v55 = __swift_getEnumTagSinglePayload(v53, 1, v33);
  int v56 = __swift_getEnumTagSinglePayload(v54, 1, v33);
  if (v55)
  {
    if (!v56)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v53, v54, v33);
      uint64_t v40 = v53;
      uint64_t v41 = v33;
LABEL_31:
      __swift_storeEnumTagSinglePayload(v40, 0, 1, v41);
      goto LABEL_32;
    }
    goto LABEL_48;
  }
  uint64_t v57 = *(void *)(v33 - 8);
  if (v56)
  {
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v53, v33);
LABEL_48:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320) - 8) + 64);
    uint64_t v31 = (void *)v53;
    uint64_t v32 = (const void *)v54;
    goto LABEL_20;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 24))(v53, v54, v33);
LABEL_32:
  uint64_t v42 = a3[11];
  uint64_t v43 = &a1[v42];
  uint64_t v44 = &a2[v42];
  int v45 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v42], 1, v6);
  int v46 = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, v6);
  if (!v45)
  {
    uint64_t v47 = *(void *)(v6 - 8);
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 24))(v43, v44, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v43, v6);
    goto LABEL_37;
  }
  if (v46)
  {
LABEL_37:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v43, v44, *(void *)(*(void *)(v48 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v43, v44, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v6);
  return a1;
}

char *sub_1A2BCF344(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v13 = &a1[v12];
  int v14 = &a2[v12];
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  v13[4] = v14[4];
  uint64_t v15 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = sub_1A2C0CDA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
      memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v16, v17, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v20);
    }
    uint64_t v22 = *(int *)(v18 + 48);
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v20))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v23, v24, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v20);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  }
  uint64_t v26 = a3[11];
  int v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v6))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v27, v28, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v6);
  }
  return a1;
}

char *sub_1A2BCF730(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v12, v13, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
LABEL_13:
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v18];
  uint64_t v21 = &a2[v18];
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  v20[4] = v21[4];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  int v26 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v25);
  int v27 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25);
  if (v26)
  {
    if (!v27)
    {
      uint64_t v28 = sub_1A2C0CDA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v28))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v23, v24, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v28);
      }
      uint64_t v36 = *(int *)(v25 + 48);
      uint64_t v37 = &v23[v36];
      uint64_t v38 = &v24[v36];
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v28))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
        memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v37, v38, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v28);
      }
      uint64_t v40 = (uint64_t)v23;
      uint64_t v41 = v25;
      goto LABEL_31;
    }
    goto LABEL_19;
  }
  if (v27)
  {
    sub_1A2B653F8((uint64_t)v23, &qword_1EB5540E0);
LABEL_19:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318) - 8) + 64);
    uint64_t v31 = v23;
    uint64_t v32 = v24;
LABEL_20:
    memcpy(v31, v32, v30);
    goto LABEL_32;
  }
  uint64_t v33 = sub_1A2C0CDA0();
  int v34 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v33);
  int v35 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v33);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v23, v24, v33);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v33);
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  uint64_t v50 = *(void *)(v33 - 8);
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v23, v33);
LABEL_42:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
    memcpy(v23, v24, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_43;
  }
  (*(void (**)(char *, char *, uint64_t))(v50 + 40))(v23, v24, v33);
LABEL_43:
  uint64_t v52 = *(int *)(v25 + 48);
  uint64_t v53 = (uint64_t)&v23[v52];
  uint64_t v54 = (uint64_t)&v24[v52];
  int v55 = __swift_getEnumTagSinglePayload(v53, 1, v33);
  int v56 = __swift_getEnumTagSinglePayload(v54, 1, v33);
  if (v55)
  {
    if (!v56)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 32))(v53, v54, v33);
      uint64_t v40 = v53;
      uint64_t v41 = v33;
LABEL_31:
      __swift_storeEnumTagSinglePayload(v40, 0, 1, v41);
      goto LABEL_32;
    }
    goto LABEL_48;
  }
  uint64_t v57 = *(void *)(v33 - 8);
  if (v56)
  {
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v53, v33);
LABEL_48:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320) - 8) + 64);
    uint64_t v31 = (void *)v53;
    uint64_t v32 = (const void *)v54;
    goto LABEL_20;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 40))(v53, v54, v33);
LABEL_32:
  uint64_t v42 = a3[11];
  uint64_t v43 = &a1[v42];
  uint64_t v44 = &a2[v42];
  int v45 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v42], 1, v6);
  int v46 = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, v6);
  if (!v45)
  {
    uint64_t v47 = *(void *)(v6 - 8);
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 40))(v43, v44, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v43, v6);
    goto LABEL_37;
  }
  if (v46)
  {
LABEL_37:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v43, v44, *(void *)(*(void *)(v48 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v43, v44, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v6);
  return a1;
}

uint64_t sub_1A2BCFF14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A2BCFF28);
}

uint64_t sub_1A2BCFF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
    uint64_t v9 = a1 + *(int *)(a3 + 40);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t sub_1A2BCFFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A2BD0000);
}

void sub_1A2BD0000()
{
  OUTLINED_FUNCTION_27_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    if (v3 == 2147483646)
    {
      *(void *)(v1 + *(int *)(v2 + 20)) = v0;
      return;
    }
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554318);
    uint64_t v7 = v1 + *(int *)(v2 + 40);
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_1A2BD00A8()
{
  sub_1A2B61D88();
  if (v0 <= 0x3F)
  {
    sub_1A2B61DE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for TagsTable.UpdateRecord()
{
}

uint64_t *sub_1A2BD0194(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A2C0CE20();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    v8((uint64_t *)((char *)a1 + v9), (uint64_t *)((char *)a2 + v9), v7);
    uint64_t v10 = a3[7];
    int v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    sub_1A2B3EA44(*v12, v14);
    uint64_t *v11 = v13;
    v11[1] = v14;
    uint64_t v15 = a3[8];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_1A2C0CDA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[9];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v7))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v20, (uint64_t *)v21, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_1A2BD0378(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A2C0CE20();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v4 - 8), a1, v4);
  v9(a1 + a2[6], v4);
  sub_1A2B3EB94(*(void *)(a1 + a2[7]), *(void *)(a1 + a2[7] + 8));
  uint64_t v5 = a1 + a2[8];
  uint64_t v6 = sub_1A2C0CDA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[9];
  uint64_t result = __swift_getEnumTagSinglePayload(v7, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v4);
  }
  return result;
}

uint64_t sub_1A2BD04B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  uint64_t v9 = a3[7];
  uint64_t v10 = (uint64_t *)(a1 + v9);
  int v11 = (uint64_t *)(a2 + v9);
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  sub_1A2B3EA44(*v11, v13);
  uint64_t *v10 = v12;
  v10[1] = v13;
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_1A2C0CDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v6))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v19, (uint64_t)v20, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v6);
  }
  return a1;
}

char *sub_1A2BD0644(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(_DWORD *)&a1[a3[5]] = *(_DWORD *)&a2[a3[5]];
  v8(&a1[a3[6]], &a2[a3[6]], v6);
  uint64_t v9 = a3[7];
  uint64_t v10 = (uint64_t *)&a1[v9];
  int v11 = (uint64_t *)&a2[v9];
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  sub_1A2B3EA44(*v11, v13);
  uint64_t v14 = *v10;
  unint64_t v15 = v10[1];
  uint64_t *v10 = v12;
  v10[1] = v13;
  sub_1A2B3EB94(v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_1A2C0CDA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  LODWORD(v17) = __swift_getEnumTagSinglePayload((uint64_t)&a1[v20], 1, v6);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v6);
  if (!v17)
  {
    if (!EnumTagSinglePayload)
    {
      v8(v21, v22, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v6);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v22, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v6);
  return a1;
}

char *sub_1A2BD0864(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)&a1[a3[5]] = *(_DWORD *)&a2[a3[5]];
  v7(&a1[v8], &a2[v8], v6);
  uint64_t v9 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v10 = &a1[v9];
  int v11 = &a2[v9];
  uint64_t v12 = sub_1A2C0CDA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = &a1[v13];
  unint64_t v15 = &a2[v13];
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v6))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v7(v14, v15, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v6);
  }
  return a1;
}

char *sub_1A2BD09D8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(_DWORD *)&a1[a3[5]] = *(_DWORD *)&a2[a3[5]];
  v8(&a1[v9], &a2[v9], v6);
  uint64_t v10 = a3[7];
  uint64_t v11 = *(void *)&a1[v10];
  unint64_t v12 = *(void *)&a1[v10 + 8];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  sub_1A2B3EB94(v11, v12);
  uint64_t v13 = a3[8];
  uint64_t v14 = &a1[v13];
  unint64_t v15 = &a2[v13];
  uint64_t v16 = sub_1A2C0CDA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  LODWORD(v14) = __swift_getEnumTagSinglePayload((uint64_t)&a1[v17], 1, v6);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v6);
  if (!v14)
  {
    if (!EnumTagSinglePayload)
    {
      v8(v18, v19, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v18, v19, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v6);
  return a1;
}

uint64_t sub_1A2BD0BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A2BD0BF8);
}

uint64_t sub_1A2BD0BF8(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 12)
    {
      uint64_t v10 = *(void *)(a1 + a3[7] + 8) >> 60;
      if (((4 * v10) & 0xC) != 0) {
        return 16 - ((4 * v10) & 0xC | (v10 >> 2));
      }
      else {
        return 0;
      }
    }
    sub_1A2C0CDA0();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v14 = a3[8];
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      uint64_t v14 = a3[9];
    }
    uint64_t v9 = a1 + v14;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_1A2BD0CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A2BD0CF4);
}

void sub_1A2BD0CF4()
{
  OUTLINED_FUNCTION_27_2();
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    if (v3 == 12)
    {
      uint64_t v8 = (void *)(v1 + v2[7]);
      void *v8 = 0;
      v8[1] = (unint64_t)(((-(int)v0 >> 2) & 3) - 4 * v0) << 60;
      return;
    }
    sub_1A2C0CDA0();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v10 + 84) == v3)
    {
      uint64_t v6 = v9;
      uint64_t v11 = v2[8];
    }
    else
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
      uint64_t v11 = v2[9];
    }
    uint64_t v7 = v1 + v11;
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_1A2BD0DC8()
{
  sub_1A2C0CE20();
  if (v0 <= 0x3F)
  {
    sub_1A2C0CDA0();
    if (v1 <= 0x3F)
    {
      sub_1A2B61D88();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void type metadata accessor for TagsTable.Columns()
{
}

uint64_t OUTLINED_FUNCTION_3_22(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_8_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1A2B3E3B8(0x636170735F676174, 0xE900000000000065, 61, 0xE100000000000000, a5, 0, 1);
}

void OUTLINED_FUNCTION_9_13(uint64_t a1, uint64_t a2)
{
  sub_1A2B3E3B8(a1, a2, 61, 0xE100000000000000, v2, v3, 0);
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return 0x6E656E6F706D6F63;
}

uint64_t OUTLINED_FUNCTION_17_12()
{
  return 0x64695F676174;
}

uint64_t OUTLINED_FUNCTION_18_8()
{
  return 0x636170735F676174;
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_6(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
  return sub_1A2B3EA24(0, 0, 4);
}

uint64_t OUTLINED_FUNCTION_29_7()
{
  return sub_1A2C0D530();
}

uint64_t OUTLINED_FUNCTION_30_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_6(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_36_6()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_1A2BE0470(0, v2, 1);
}

uint64_t OUTLINED_FUNCTION_40_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  return *(void *)(v0 - 256);
}

uint64_t OUTLINED_FUNCTION_42_3()
{
  return *(void *)(v0 - 136);
}

uint64_t OUTLINED_FUNCTION_43_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return v0;
}

void OUTLINED_FUNCTION_49_3()
{
  sub_1A2BE0470(0, v0, 0);
}

void OUTLINED_FUNCTION_50_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 136) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_51_5()
{
  return sub_1A2C0CE20();
}

void OUTLINED_FUNCTION_52_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2B3E3B8(a1, a2, a3, 0xE200000000000000, v3, 0, 2);
}

id static PersistentStorage.dataVault.getter()
{
  uint64_t v0 = sub_1A2C0CCF0();
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2 - v1;
  type metadata accessor for DataVault();
  sub_1A2BD1BE0();
  return sub_1A2B9C07C(v3);
}

uint64_t sub_1A2BD1288()
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v0 = sub_1A2C0CCF0();
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  sub_1A2C0CCB0();
  id v7 = objc_msgSend(self, sel_defaultManager);
  uint64_t v8 = (void *)sub_1A2C0CC80();
  v14[0] = 0;
  unsigned __int8 v9 = objc_msgSend(v7, sel_removeItemAtURL_error_, v8, v14);

  if (v9)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
    id v11 = v14[0];
    return v10(v6, v0);
  }
  else
  {
    id v13 = v14[0];
    sub_1A2C0CC40();

    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  }
}

uint64_t sub_1A2BD1404()
{
  uint64_t v0 = sub_1A2C0CCF0();
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4 - v3;
  sub_1A2C0CCB0();
  sub_1A2BD1584();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v0);
  return 1;
}

uint64_t sub_1A2BD14BC()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  char v4 = 0;
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_1A2C0CCE0();
  uint64_t v1 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  unsigned __int8 v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v4);

  return (v2 & v4);
}

uint64_t sub_1A2BD1584()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  if ((sub_1A2BD14BC() & 1) == 0)
  {
    id v0 = objc_msgSend(self, sel_defaultManager);
    uint64_t v1 = (void *)sub_1A2C0CC80();
    v6[0] = 0;
    unsigned int v2 = objc_msgSend(v0, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v1, 1, 0, v6);

    if (v2)
    {
      id v3 = v6[0];
    }
    else
    {
      id v4 = v6[0];
      sub_1A2C0CC40();

      swift_willThrow();
    }
  }
  return 1;
}

void sub_1A2BD1680()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v0 = self;
  id v1 = objc_msgSend(v0, sel_defaultManager);
  sub_1A2C0CCE0();
  unsigned int v2 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  unsigned int v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  if (v3)
  {
    if (qword_1EB556808 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_5_16();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    unint64_t v24 = 0xE700000000000000;
    sub_1A2C0CCF0();
    sub_1A2B52168();
    OUTLINED_FUNCTION_4_20();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    OUTLINED_FUNCTION_1_27(0x20676E69766F4DLL, 0xE700000000000000);
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v0, sel_defaultManager);
    uint64_t v5 = (void *)sub_1A2C0CC80();
    uint64_t v6 = (void *)sub_1A2C0CC80();
    id v23 = 0;
    unsigned int v7 = objc_msgSend(v4, sel_moveItemAtURL_toURL_error_, v5, v6, &v23);

    id v8 = v23;
    if (v7)
    {
      id v9 = v8;
    }
    else
    {
      id v10 = v23;
      uint64_t v11 = sub_1A2C0CC40();

      id v22 = (id)v11;
      swift_willThrow();
      OUTLINED_FUNCTION_5_16();
      sub_1A2C0DB60();
      uint64_t v12 = (void *)OUTLINED_FUNCTION_4_20();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      id v23 = v12;
      unint64_t v24 = v14;
      sub_1A2C0D530();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      OUTLINED_FUNCTION_1_27((uint64_t)v23, v24);
      swift_bridgeObjectRelease();
      id v15 = objc_msgSend(v0, sel_defaultManager);
      uint64_t v16 = (void *)sub_1A2C0CC80();
      id v23 = 0;
      unsigned int v17 = objc_msgSend(v15, sel_removeItemAtURL_error_, v16, &v23);

      if (v17)
      {
        id v18 = v23;
        uint64_t v19 = v22;
      }
      else
      {
        id v20 = v23;
        uint64_t v21 = sub_1A2C0CC40();

        swift_willThrow();
        OUTLINED_FUNCTION_5_16();
        sub_1A2C0DB60();
        swift_bridgeObjectRelease();
        id v23 = (id)0xD000000000000011;
        unint64_t v24 = 0x80000001A2C16980;
        OUTLINED_FUNCTION_4_20();
        sub_1A2C0D530();
        swift_bridgeObjectRelease();
        sub_1A2BAB6C8((uint64_t)v23, v24, 0xD000000000000061, 0x80000001A2C16910, 0x6F72662865766F6DLL, 0xEE00293A6F743A6DLL);

        swift_bridgeObjectRelease();
        uint64_t v19 = (void *)v21;
      }
    }
  }
}

void *sub_1A2BD1B1C()
{
  uint64_t result = (void *)CPSharedResourcesDirectory();
  if (result)
  {
    id v1 = result;
    sub_1A2C0D480();

    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    sub_1A2C0CC60();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2BD1BE0()
{
  uint64_t v0 = sub_1A2C0CCF0();
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  sub_1A2BD1B1C();
  sub_1A2C0CCA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
}

id PersistentStorage.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PersistentStorage.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistentStorage();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PersistentStorage()
{
  return self;
}

id PersistentStorage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistentStorage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void OUTLINED_FUNCTION_1_27(uint64_t a1, unint64_t a2)
{
  sub_1A2BAB6F8(a1, a2, 0xD000000000000061, v2, 0x6F72662865766F6DLL, 0xEE00293A6F743A6DLL);
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return sub_1A2C0DD60();
}

id sub_1A2BD1E0C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  return v2;
}

uint64_t sub_1A2BD1E80(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v18 = MEMORY[0x1E4FBC860];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v15 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v16 = v4 & 0xC000000000000001;
      unint64_t v14 = v4;
      while (v16)
      {
        uint64_t v9 = MEMORY[0x1A623C120](v8, v4);
LABEL_7:
        unint64_t v10 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        uint64_t v17 = v9;
        uint64_t v11 = a2;
        char v12 = a1(&v17);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          return v11;
        }
        if (v12)
        {
          sub_1A2C0DBB0();
          sub_1A2C0DBE0();
          unint64_t v4 = v14;
          sub_1A2C0DBF0();
          sub_1A2C0DBC0();
        }
        else
        {
          swift_release();
        }
        ++v8;
        if (v10 == v7)
        {
          uint64_t v11 = v18;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v15 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_1A2C0DCE0();
      if (!v7) {
        goto LABEL_19;
      }
    }
    uint64_t v9 = *(void *)(v4 + 8 * v8 + 32);
    swift_retain();
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_20:
  swift_bridgeObjectRelease();
  return v11;
}

void sub_1A2BD2038(uint64_t (*a1)(_OWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v20 = MEMORY[0x1E4FBC860];
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v8 = a3 + 32;
    uint64_t v14 = *(void *)(a3 + 16);
    while (v7 < *(void *)(v4 + 16))
    {
      sub_1A2B8CABC(v8, (uint64_t)v19);
      char v9 = a1(v19);
      if (v3)
      {
        sub_1A2B8CB18((uint64_t)v19);
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      if (v9)
      {
        unint64_t v10 = a1;
        long long v16 = v19[0];
        long long v17 = v19[1];
        long long v18 = v19[2];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          OUTLINED_FUNCTION_16_9();
        }
        uint64_t v11 = v20;
        unint64_t v12 = *(void *)(v20 + 16);
        if (v12 >= *(void *)(v20 + 24) >> 1)
        {
          sub_1A2BE0554();
          uint64_t v11 = v20;
        }
        *(void *)(v11 + 16) = v12 + 1;
        unint64_t v13 = (_OWORD *)(v11 + 48 * v12);
        v13[2] = v16;
        v13[3] = v17;
        v13[4] = v18;
        a1 = v10;
        uint64_t v5 = v14;
        uint64_t v4 = a3;
      }
      else
      {
        sub_1A2B8CB18((uint64_t)v19);
      }
      ++v7;
      v8 += 48;
      if (v5 == v7) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
  }
}

void sub_1A2BD21B8(uint64_t (*a1)(long long *), uint64_t a2, uint64_t a3)
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v24 = MEMORY[0x1E4FBC860];
  while (1)
  {
    while (1)
    {
      if (!v6) {
        goto LABEL_5;
      }
      unint64_t v8 = *(void *)(v6 + 16);
      if (v5 == v8) {
        break;
      }
      if (v5 >= v8) {
        goto LABEL_23;
      }
      sub_1A2B8CABC(v6 + 48 * v5 + 32, (uint64_t)v17);
      sub_1A2BD53E4((uint64_t)v17, (uint64_t)&v18);
      if (!(void)v20) {
        goto LABEL_20;
      }
      long long v21 = v18;
      long long v22 = v19;
      long long v23 = v20;
      char v11 = a1(&v21);
      if (v3)
      {
        sub_1A2B8CB18((uint64_t)&v21);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      if (v11)
      {
        long long v18 = v21;
        long long v19 = v22;
        long long v20 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          OUTLINED_FUNCTION_16_9();
        }
        uint64_t v12 = v24;
        unint64_t v13 = *(void *)(v24 + 16);
        unint64_t v14 = v13 + 1;
        if (v13 >= *(void *)(v24 + 24) >> 1)
        {
          sub_1A2BE0554();
          unint64_t v14 = v13 + 1;
          uint64_t v12 = v24;
        }
        *(void *)(v12 + 16) = v14;
        uint64_t v15 = (_OWORD *)(v12 + 48 * v13);
        v15[2] = v18;
        v15[3] = v19;
        v15[4] = v20;
      }
      else
      {
        sub_1A2B8CB18((uint64_t)&v21);
      }
      ++v5;
    }
    memset(v17, 0, sizeof(v17));
    sub_1A2BCA474((uint64_t)v17, &qword_1E9595FC0);
LABEL_5:
    unint64_t v9 = *(void *)(a3 + 16);
    if (v7 == v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1A2BCA474((uint64_t)&v18, &qword_1E9595FC0);
      return;
    }
    if (v7 >= v9) {
      break;
    }
    uint64_t v10 = *(void *)(a3 + 8 * v7 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v5 = 0;
    uint64_t v6 = v10;
    ++v7;
  }
  __break(1u);
LABEL_23:
  __break(1u);
}

uint64_t sub_1A2BD23E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A2C0CCF0();
  OUTLINED_FUNCTION_9();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (char *)&v16 - v12;
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = a1;
  sub_1A2B58194(a2, v2 + 120);
  type metadata accessor for PersistentStorage();
  type metadata accessor for DataVault();
  swift_retain();
  sub_1A2BD1BE0();
  id v14 = sub_1A2B9C07C((uint64_t)v10);
  sub_1A2C0CC90();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v2 + OBJC_IVAR____TtC13SiriAnalytics21ExternalDataIngestion_poolUrl, v13, v5);
  return v2;
}

uint64_t sub_1A2BD2560()
{
  v1[8] = v0;
  uint64_t v2 = type metadata accessor for StagingPoolEntry();
  OUTLINED_FUNCTION_18(v2);
  v1[9] = OUTLINED_FUNCTION_42_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5543F0);
  OUTLINED_FUNCTION_18(v3);
  v1[10] = OUTLINED_FUNCTION_42_0();
  uint64_t v4 = type metadata accessor for StagedMessage();
  v1[11] = v4;
  OUTLINED_FUNCTION_18(v4);
  v1[12] = OUTLINED_FUNCTION_42_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596360);
  v1[13] = v5;
  OUTLINED_FUNCTION_0_8(v5);
  v1[14] = v6;
  v1[15] = OUTLINED_FUNCTION_42_0();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596368);
  OUTLINED_FUNCTION_18(v7);
  v1[16] = OUTLINED_FUNCTION_42_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554458);
  OUTLINED_FUNCTION_18(v8);
  v1[17] = OUTLINED_FUNCTION_42_0();
  uint64_t v9 = sub_1A2C0CCF0();
  v1[18] = v9;
  OUTLINED_FUNCTION_0_8(v9);
  v1[19] = v10;
  v1[20] = OUTLINED_FUNCTION_42_0();
  return MEMORY[0x1F4188298](sub_1A2BD26D8, v0, 0);
}

uint64_t sub_1A2BD26D8()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB556640);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v4 = OUTLINED_FUNCTION_12_11();
  v3(v4);
  id v5 = (id)*MEMORY[0x1E4F28358];
  v0[21] = sub_1A2C0D260();
  id v6 = objc_allocWithZone((Class)type metadata accessor for StagingReport());
  v0[22] = sub_1A2B58C94(1);
  type metadata accessor for StagingPoolHost();
  uint64_t v7 = OUTLINED_FUNCTION_12_11();
  v3(v7);
  id v8 = sub_1A2B995B4(v1);
  v0[23] = v8;
  type metadata accessor for ExtensionOrchestratorConnection();
  uint64_t v9 = swift_allocObject();
  v0[24] = sub_1A2BD4FE4(v8, v9);
  if (qword_1EB5541E8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  sub_1A2BAB6F8(0xD000000000000014, v10, v11, v12, 0x2928747365676E69, 0xE800000000000000);
  unint64_t v13 = (void *)swift_task_alloc();
  v0[25] = v13;
  void *v13 = v0;
  v13[1] = sub_1A2BD28CC;
  return sub_1A2B6F97C();
}

uint64_t sub_1A2BD28CC(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[26] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[8];
  if (v1)
  {
    id v6 = sub_1A2BD3770;
  }
  else
  {
    v4[27] = a1;
    id v6 = sub_1A2BD2A08;
  }
  return MEMORY[0x1F4188298](v6, v5, 0);
}

uint64_t sub_1A2BD2A08()
{
  *(_OWORD *)(v0 + 224) = *(_OWORD *)(v0 + 208);
  *(void *)(v0 + 240) = *(void *)(*(void *)(v0 + 64) + 112);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595B70);
  sub_1A2BD5298((unint64_t *)&qword_1E9595A70, &qword_1E9595B70);
  uint64_t v2 = sub_1A2C0D640();
  return MEMORY[0x1F4188298](sub_1A2BD2AD0, v2, v1);
}

uint64_t sub_1A2BD2AD0()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[8];
  uint64_t v3 = type metadata accessor for LogicalClocksTable.Predicate(0);
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v3);
  v0[31] = sub_1A2BBF680(v1);
  sub_1A2BCA474(v1, &qword_1EB554458);
  return MEMORY[0x1F4188298](sub_1A2BD2B80, v2, 0);
}

void sub_1A2BD2B80()
{
  uint64_t v1 = v0[28];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13();
  sub_1A2BAB6F8(v2, v3, v4, v5, v6, v7);
  swift_retain();
  v0[32] = sub_1A2C0D290();
  if (v1)
  {
    uint64_t v8 = (void *)v0[23];
    uint64_t v9 = v0[21];
    unint64_t v10 = (void *)v0[22];
    swift_release();
    swift_bridgeObjectRelease();

    swift_release();
    swift_bridgeObjectRelease();
    sub_1A2B92074(v9, 0);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_14_8();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v13 = v0[16];
  uint64_t v14 = v0[13];
  swift_release();
  swift_retain();
  v0[33] = sub_1A2C0D320();
  swift_retain();
  sub_1A2C0D330();
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
  {
    swift_release_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = v0[13];
    uint64_t v16 = *(void (**)(void, void, uint64_t))(v0[14] + 32);
    v0[34] = v16;
    unint64_t v17 = v0[31];
    uint64_t v19 = v0[10];
    uint64_t v18 = v0[11];
    uint64_t v20 = v0[9];
    v16(v0[15], v0[16], v15);
    sub_1A2C0D350();
    sub_1A2BD3910(v20, v17, v19);
    sub_1A2BD533C(v20, (void (*)(void))type metadata accessor for StagingPoolEntry);
    if (__swift_getEnumTagSinglePayload(v19, 1, v18) != 1)
    {
      uint64_t v37 = OUTLINED_FUNCTION_15_10();
      sub_1A2BD52DC(v37, v38, (void (*)(void))type metadata accessor for StagedMessage);
      OUTLINED_FUNCTION_21_9();
      uint64_t v39 = (void *)swift_task_alloc();
      v0[35] = v39;
      *uint64_t v39 = v0;
      v39[1] = sub_1A2BD3114;
      OUTLINED_FUNCTION_13_11();
      OUTLINED_FUNCTION_14_8();
      __asm { BRAA            X4, X16 }
    }
    uint64_t v21 = v0[14];
    uint64_t v43 = v0[15];
    uint64_t v22 = v0[13];
    uint64_t v23 = v0[10];
    swift_release();
    swift_bridgeObjectRelease();
    sub_1A2BCA474(v23, &qword_1EB5543F0);
    sub_1A2C0DB60();
    v0[4] = 0;
    v0[5] = 0xE000000000000000;
    sub_1A2C0D530();
    sub_1A2C0DC40();
    OUTLINED_FUNCTION_13();
    sub_1A2BAB6C8(v24, v25, v26, v27, v28, v29);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v43, v22);
  }
  size_t v30 = (void *)v0[22];
  uint64_t v42 = (void *)v0[23];
  uint64_t v31 = v0[21];
  sub_1A2C0DB60();
  sub_1A2C0D530();
  uint64_t v32 = sub_1A2C0D300();
  swift_release();
  v0[7] = v32;
  sub_1A2C0DD60();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  OUTLINED_FUNCTION_4_21(0, v33, v34, 0x80000001A2C16A30);
  swift_bridgeObjectRelease();
  sub_1A2B99464();
  swift_release();

  sub_1A2B92074(v31, 0);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_13();
  OUTLINED_FUNCTION_14_8();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_1A2BD3114(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  *(unsigned char *)(*(void *)v1 + 288) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A2BD322C, v2, 0);
}

uint64_t sub_1A2BD322C()
{
  if ((*(unsigned char *)(v0 + 288) & 1) == 0)
  {
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 104);
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_13();
    sub_1A2BAB6C8(v10, v11, v12, v13, v14, v15);
    swift_release();
    sub_1A2BD533C(v9, (void (*)(void))type metadata accessor for StagedMessage);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);
  sub_1A2C0D310();
  sub_1A2BD533C(v5, (void (*)(void))type metadata accessor for StagedMessage);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_1A2C0D330();
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
    swift_release_n();
    swift_bridgeObjectRelease();
LABEL_7:
    unint64_t v29 = *(void **)(v0 + 184);
    uint64_t v30 = *(void *)(v0 + 168);
    uint64_t v31 = *(void **)(v0 + 176);
    sub_1A2C0DB60();
    sub_1A2C0D530();
    uint64_t v32 = sub_1A2C0D300();
    swift_release();
    *(void *)(v0 + 56) = v32;
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    OUTLINED_FUNCTION_4_21(0, v33, v34, 0x80000001A2C16A30);
    swift_bridgeObjectRelease();
    sub_1A2B99464();
    swift_release();

    sub_1A2B92074(v30, 0);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = OUTLINED_FUNCTION_17_13();
    return v36(v35);
  }
  unint64_t v16 = *(void *)(v0 + 248);
  uint64_t v18 = *(void *)(v0 + 80);
  uint64_t v17 = *(void *)(v0 + 88);
  uint64_t v19 = *(void *)(v0 + 72);
  (*(void (**)(void, void, void))(v0 + 272))(*(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 104));
  sub_1A2C0D350();
  sub_1A2BD3910(v19, v16, v18);
  sub_1A2BD533C(v19, (void (*)(void))type metadata accessor for StagingPoolEntry);
  if (__swift_getEnumTagSinglePayload(v18, 1, v17) == 1)
  {
    uint64_t v20 = *(void *)(v0 + 112);
    uint64_t v44 = *(void *)(v0 + 120);
    uint64_t v21 = *(void *)(v0 + 104);
    uint64_t v22 = *(void *)(v0 + 80);
    swift_release();
    swift_bridgeObjectRelease();
    sub_1A2BCA474(v22, &qword_1EB5543F0);
    sub_1A2C0DB60();
    *(void *)(v0 + 32) = 0;
    *(void *)(v0 + 40) = 0xE000000000000000;
    sub_1A2C0D530();
    sub_1A2C0DC40();
    OUTLINED_FUNCTION_13();
    sub_1A2BAB6C8(v23, v24, v25, v26, v27, v28);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v44, v21);
    goto LABEL_7;
  }
  uint64_t v38 = OUTLINED_FUNCTION_15_10();
  sub_1A2BD52DC(v38, v39, (void (*)(void))type metadata accessor for StagedMessage);
  OUTLINED_FUNCTION_21_9();
  uint64_t v43 = (uint64_t (*)(uint64_t))((char *)v40 + *v40);
  uint64_t v41 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v41;
  *uint64_t v41 = v0;
  v41[1] = sub_1A2BD3114;
  uint64_t v42 = OUTLINED_FUNCTION_13_11();
  return v43(v42);
}

uint64_t sub_1A2BD3770()
{
  uint64_t v1 = (void *)v0[26];
  sub_1A2C0DB60();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  OUTLINED_FUNCTION_11();
  sub_1A2C0D530();
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
  sub_1A2C0DC40();
  unint64_t v2 = v0[3];
  OUTLINED_FUNCTION_10();
  sub_1A2BAB6F8(v3, v2, v4, v5, 0x2928747365676E69, 0xE800000000000000);

  swift_bridgeObjectRelease();
  uint64_t v6 = MEMORY[0x1E4FBC868];
  v0[28] = 0;
  v0[29] = v6;
  v0[30] = *(void *)(v0[8] + 112);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595B70);
  sub_1A2BD5298((unint64_t *)&qword_1E9595A70, &qword_1E9595B70);
  uint64_t v8 = sub_1A2C0D640();
  return MEMORY[0x1F4188298](sub_1A2BD2AD0, v8, v7);
}

void sub_1A2BD3910(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v82 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555508);
  uint64_t v6 = OUTLINED_FUNCTION_18(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v16 = OUTLINED_FUNCTION_18(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_1();
  uint64_t v19 = v18 - v17;
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v80 = v20;
  uint64_t v81 = v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v79 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)&v78 - v24;
  MEMORY[0x1F4188790](v26);
  unint64_t v28 = (char *)&v78 - v27;
  MEMORY[0x1F4188790](v29);
  uint64_t v31 = (char *)&v78 - v30;
  id v32 = *(id *)(a1 + *(int *)(type metadata accessor for StagingPoolEntry() + 20));
  if (objc_msgSend(v32, sel_anyEventType) == 6)
  {
    id v33 = objc_msgSend(v32, sel_unwrap);
    if (v33)
    {
      uint64_t v34 = v33;
      self;
      uint64_t v35 = (void *)swift_dynamicCastObjCClass();
      if (v35)
      {
        uint64_t v36 = v35;
        id v37 = objc_msgSend(v35, sel_metadata);
        if (v37
          && (uint64_t v38 = v37, v39 = objc_msgSend(v37, sel_eventId),
                         v38,
                         v39))
        {
          sub_1A2C0D800();

          uint64_t v40 = v80;
          if (__swift_getEnumTagSinglePayload(v19, 1, v80) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v81 + 32))(v31, v19, v40);
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v40 = v80;
          __swift_storeEnumTagSinglePayload(v19, 1, 1, v80);
        }
        sub_1A2C0CE10();
        sub_1A2BCA474(v19, &qword_1EB555500);
LABEL_24:
        id v57 = objc_msgSend(v36, sel_event);
        if (v57)
        {
          id v58 = v57;
          (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v28, v31, v40);
          id v59 = objc_msgSend(v36, (SEL)&selRef_ingest_);
          uint64_t v60 = v59;
          if (v59)
          {
            id v61 = objc_msgSend(v59, sel_timestamp);

            if (v61)
            {
              sub_1A2C0D060();
              uint64_t v60 = (void *)sub_1A2C0D020();
            }
            else
            {
              uint64_t v60 = 0;
            }
          }

          uint64_t v74 = v81;
          (*(void (**)(char *, uint64_t))(v81 + 8))(v31, v40);
          uint64_t v75 = type metadata accessor for StagedMessage();
          uint64_t v76 = v82;
          uint64_t v77 = sub_1A2C0CDA0();
          OUTLINED_FUNCTION_19_7(v77);
          (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v76, v28, v40);
          *(void *)(v76 + *(int *)(v75 + 20)) = v60;
          *(void *)(v76 + *(int *)(v75 + 24)) = v58;
          uint64_t v66 = v76;
          uint64_t v67 = 0;
          uint64_t v68 = 1;
          uint64_t v69 = v75;
        }
        else
        {
          if (qword_1EB5541E8 != -1) {
            swift_once();
          }
          OUTLINED_FUNCTION_11();
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_20_6(v70, v71, v72, v73, (uint64_t)"prepareForStaging(_:allClocks:)");

          (*(void (**)(char *, uint64_t))(v81 + 8))(v31, v40);
          type metadata accessor for StagedMessage();
          uint64_t v66 = OUTLINED_FUNCTION_18_9();
        }
LABEL_33:
        __swift_storeEnumTagSinglePayload(v66, v67, v68, v69);
        return;
      }
    }
    if (qword_1EB5541E8 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_20_6(v62, v63, v64, v65, (uint64_t)"prepareForStaging(_:allClocks:)");

    type metadata accessor for StagedMessage();
    uint64_t v66 = OUTLINED_FUNCTION_18_9();
    goto LABEL_33;
  }
  sub_1A2B98D6C(a1, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    sub_1A2BCA474(v9, &qword_1EB555508);
    id v41 = 0;
    uint64_t v42 = v82;
    uint64_t v43 = v79;
    uint64_t v44 = v80;
  }
  else
  {
    sub_1A2BD52DC(v9, v14, (void (*)(void))type metadata accessor for MonotonicTimestamp);
    if (a2 && (swift_bridgeObjectRetain(), uint64_t v45 = sub_1A2BD42A4(v14, a2), swift_bridgeObjectRelease(), v45))
    {
      sub_1A2B521B8(0, &qword_1EB554630);
      uint64_t v46 = *(void *)(v14 + *(int *)(v10 + 20));
      (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v25, v45 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, v80);
      id v41 = sub_1A2BD4B28(v46, (uint64_t)v25);
      if (qword_1EB5541E8 != -1) {
        swift_once();
      }
      unint64_t v84 = 0;
      unint64_t v85 = 0xE000000000000000;
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      unint64_t v84 = 0x2064656E67696C41;
      unint64_t v85 = 0xE800000000000000;
      uint64_t v83 = v46;
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      sub_1A2BAD000();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      uint64_t v44 = v80;
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_8_14(v47, v48, v49, (uint64_t)"prepareForStaging(_:allClocks:)");
      swift_release();
      swift_bridgeObjectRelease();
      sub_1A2BD533C(v14, (void (*)(void))type metadata accessor for MonotonicTimestamp);
      uint64_t v42 = v82;
      uint64_t v43 = v79;
    }
    else
    {
      uint64_t v42 = v82;
      uint64_t v43 = v79;
      if (qword_1EB5541E8 != -1) {
        swift_once();
      }
      unint64_t v84 = 0;
      unint64_t v85 = 0xE000000000000000;
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      unint64_t v84 = 0xD000000000000023;
      unint64_t v85 = 0x80000001A2C16A00;
      uint64_t v83 = *(void *)(v14 + *(int *)(v10 + 20));
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      sub_1A2BAD000();
      uint64_t v44 = v80;
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_8_14(v50, v51, v52, (uint64_t)"prepareForStaging(_:allClocks:)");
      swift_bridgeObjectRelease();
      sub_1A2BD533C(v14, (void (*)(void))type metadata accessor for MonotonicTimestamp);
      id v41 = 0;
    }
  }
  sub_1A2C0CE10();
  if (v41)
  {
    id v53 = v41;
    uint64_t v54 = sub_1A2BD5E08();
  }
  else
  {
    uint64_t v54 = 0;
  }
  uint64_t v55 = type metadata accessor for StagedMessage();
  uint64_t v56 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_19_7(v56);
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v42, v43, v44);
  *(void *)(v42 + *(int *)(v55 + 20)) = v54;
  *(void *)(v42 + *(int *)(v55 + 24)) = v32;
  __swift_storeEnumTagSinglePayload(v42, 0, 1, v55);
}

uint64_t sub_1A2BD42A4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A2C0CE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MonotonicTimestamp();
  if (*(unsigned char *)(a1 + *(int *)(v8 + 24)))
  {
    if (qword_1EB5541E8 != -1) {
      swift_once();
    }
    sub_1A2BAB6F8(0xD000000000000036, 0x80000001A2C16B30, 0xD00000000000006BLL, 0x80000001A2C16A30, 0x2874694674736562, 0xED0000293A726F66);
    return 0;
  }
  uint64_t v64 = v7;
  uint64_t v65 = v4;
  uint64_t v60 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v61 = a1;
  *(&v46 - 2) = a1;
  *((unsigned char *)&v46 - 8) = 1;
  swift_bridgeObjectRetain();
  unint64_t v62 = a2;
  uint64_t v10 = sub_1A2BD1E80((uint64_t (*)(uint64_t *))sub_1A2BD4F64, (uint64_t)(&v46 - 4), a2);
  uint64_t v58 = 0;
  uint64_t v66 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596390);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95962B8);
  uint64_t v13 = *(void *)(*(void *)(v12 - 8) + 72);
  uint64_t v14 = *(unsigned __int8 *)(*(void *)(v12 - 8) + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v57 = v11;
  uint64_t v54 = v14 | 7;
  uint64_t v55 = v15 + v13;
  uint64_t v16 = swift_allocObject();
  long long v52 = xmmword_1A2C1B9E0;
  *(_OWORD *)(v16 + 16) = xmmword_1A2C1B9E0;
  uint64_t v56 = v15;
  swift_getKeyPath();
  sub_1A2C0CBB0();
  uint64_t v68 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596380);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596370);
  uint64_t v19 = sub_1A2BD5298(&qword_1E9596388, &qword_1E9596380);
  uint64_t v20 = sub_1A2BD5298(&qword_1E9596378, &qword_1E9596370);
  uint64_t v21 = sub_1A2BD5298(&qword_1E95962B0, &qword_1E95962B8);
  uint64_t v53 = v17;
  uint64_t v50 = v19;
  uint64_t v51 = v18;
  uint64_t v59 = v12;
  unint64_t v22 = sub_1A2C0D580();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v23 = v22 >> 62;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1A2C0DCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v25 = v61;
  unint64_t v26 = v62;
  if (v24 <= 1) {
    goto LABEL_17;
  }
  unint64_t v47 = v22 >> 62;
  unint64_t v63 = v22;
  uint64_t v48 = v21;
  uint64_t v49 = v20;
  if (qword_1E95963C0 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v46 = qword_1E9597820;
    uint64_t v66 = 0;
    unint64_t v67 = 0xE000000000000000;
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    uint64_t v66 = 0xD000000000000018;
    unint64_t v67 = 0x80000001A2C16B70;
    uint64_t v68 = MEMORY[0x1E4FBC860];
    sub_1A2BE04D0(0, v24, 0);
    uint64_t v27 = 0;
    uint64_t v28 = v68;
    unint64_t v29 = v63;
    uint64_t v30 = v64;
    unint64_t v31 = v63 & 0xC000000000000001;
    id v32 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v33 = v65;
    do
    {
      if (v31)
      {
        uint64_t v34 = MEMORY[0x1A623C120](v27, v29);
        (*v32)(v30, v34 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, v33);
        unint64_t v29 = v63;
        swift_unknownObjectRelease();
      }
      else
      {
        (*v32)(v30, *(void *)(v29 + 8 * v27 + 32) + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, v33);
      }
      uint64_t v68 = v28;
      unint64_t v36 = *(void *)(v28 + 16);
      unint64_t v35 = *(void *)(v28 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_1A2BE04D0(v35 > 1, v36 + 1, 1);
        unint64_t v29 = v63;
        uint64_t v28 = v68;
      }
      ++v27;
      *(void *)(v28 + 16) = v36 + 1;
      unint64_t v37 = v28
          + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
          + *(void *)(v5 + 72) * v36;
      uint64_t v30 = v64;
      uint64_t v33 = v65;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v37, v64, v65);
    }
    while (v24 != v27);
    MEMORY[0x1A623BB90](v28, v33);
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    uint64_t v25 = v61;
    uint64_t v68 = *(void *)(v61 + *(int *)(v60 + 20));
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2BAB6C8(v66, v67, 0xD00000000000006BLL, 0x80000001A2C16A30, 0x2874694674736562, 0xED0000293A726F66);
    unint64_t v22 = v63;
    swift_bridgeObjectRelease();
    unint64_t v26 = v62;
    unint64_t v23 = v47;
LABEL_17:
    if (v23) {
      break;
    }
    if (!*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_23;
    }
LABEL_19:
    if ((v22 & 0xC000000000000001) != 0)
    {
      uint64_t v45 = MEMORY[0x1A623C120](0, v22);
LABEL_39:
      uint64_t v9 = v45;
      goto LABEL_29;
    }
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v9 = *(void *)(v22 + 32);
LABEL_28:
      swift_retain();
      goto LABEL_29;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_1A2C0DCE0();
  swift_bridgeObjectRelease();
  if (v38) {
    goto LABEL_19;
  }
LABEL_23:
  uint64_t v39 = swift_bridgeObjectRelease();
  MEMORY[0x1F4188790](v39);
  *(&v46 - 2) = v25;
  *((unsigned char *)&v46 - 8) = 0;
  swift_bridgeObjectRetain();
  uint64_t v66 = sub_1A2BD1E80((uint64_t (*)(uint64_t *))sub_1A2BD4F64, (uint64_t)(&v46 - 4), v26);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = v52;
  swift_getKeyPath();
  sub_1A2C0CBB0();
  uint64_t v68 = v40;
  unint64_t v41 = sub_1A2C0D580();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v41 >> 62))
  {
    uint64_t v9 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9) {
      goto LABEL_29;
    }
LABEL_25:
    BOOL v42 = __OFSUB__(v9, 1);
    unint64_t v43 = v9 - 1;
    if (v42)
    {
      __break(1u);
    }
    else
    {
      sub_1A2BD4FC0(v43, (v41 & 0xC000000000000001) == 0, v41);
      if ((v41 & 0xC000000000000001) == 0)
      {
        uint64_t v9 = *(void *)(v41 + 8 * v43 + 32);
        goto LABEL_28;
      }
    }
    uint64_t v45 = MEMORY[0x1A623C120](v43, v41);
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1A2C0DCE0();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_25;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  return v9;
}

id sub_1A2BD4B28(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1A2C0CDE0();
  id v6 = objc_msgSend(v4, sel_initWithNanosecondsSinceBoot_clockIdentifier_, a1, v5);

  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
  return v6;
}

uint64_t sub_1A2BD4BCC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  sub_1A2C0CCF0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_13_9();
  v2(v1);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1A2BD4C38()
{
  sub_1A2BD4BCC();
  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1A2BD4C64()
{
  return type metadata accessor for ExternalDataIngestion();
}

uint64_t type metadata accessor for ExternalDataIngestion()
{
  uint64_t result = qword_1E95959C8;
  if (!qword_1E95959C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BD4CB4()
{
  uint64_t result = sub_1A2C0CCF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_1A2BD4D68(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  if ((sub_1A2C0CDF0() & 1) == 0) {
    return 0;
  }
  if (a2)
  {
    sub_1A2BD4EB8((uint64_t)&v16);
    unint64_t v9 = v16;
    unint64_t v10 = v17;
    int v11 = v18;
    sub_1A2B66610(a1, v8);
    if (v11)
    {
      sub_1A2BD533C(v8, (void (*)(void))type metadata accessor for MonotonicTimestamp);
      return 0;
    }
    unint64_t v14 = *(void *)(v8 + *(int *)(v4 + 20));
    sub_1A2BD533C(v8, (void (*)(void))type metadata accessor for MonotonicTimestamp);
    return v14 >= v9 && v10 >= v14;
  }
  sub_1A2BD4F04((uint64_t)&v16);
  unint64_t v13 = *(void *)(a1 + *(int *)(v4 + 20));
  if (!v18) {
    return v13 >= v16 && v17 >= v13;
  }
  if (v18 == 1) {
    return v13 >= v16;
  }
  else {
    return v16 >= v13;
  }
}

uint64_t sub_1A2BD4EB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
  uint64_t result = sub_1A2BBC92C();
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = result;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t sub_1A2BD4F04@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1A2BBC92C();
  if ((v4 & 1) == 0)
  {
    unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
LABEL_4:
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = result;
    *(unsigned char *)(a1 + 16) = 0;
    return result;
  }
  unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
  uint64_t result = v5 + 300000000000;
  if (v5 < 0xFFFFFFBA269B4800) {
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

BOOL sub_1A2BD4F64()
{
  return sub_1A2BD4F84();
}

BOOL sub_1A2BD4F84()
{
  return sub_1A2BD4D68(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_1A2BD4FC0(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_1A2BD4FE4(void *a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  *(void *)(a2 + 112) = 0;
  if (qword_1E9595A90 != -1) {
    swift_once();
  }
  sub_1A2BAB6F8(0x292874696E69, 0xE600000000000000, 0xD00000000000007ELL, 0x80000001A2C133A0, 0x736F682874696E69, 0xEB00000000293A74);
  sub_1A2B521B8(0, (unint64_t *)&unk_1E9595AE8);
  id v4 = sub_1A2BD1E0C();
  unint64_t v5 = *(void **)(a2 + 112);
  *(void *)(a2 + 112) = v4;
  id v6 = v4;

  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_1EF5DA040);
  sub_1A2B6F450();
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v8);
  id v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_1EF5D3748);
  objc_msgSend(v6, sel_setExportedInterface_, v9);

  objc_msgSend(v6, sel_setExportedObject_, a1);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  v13[4] = sub_1A2BD53C4;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1A2B8F7A4;
  v13[3] = &block_descriptor_13;
  int v11 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v6, sel_setInvalidationHandler_, v11);
  _Block_release(v11);
  objc_msgSend(v6, sel_resume);

  return a2;
}

uint64_t sub_1A2BD5298(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1A2BD52DC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1A2BD533C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_13_9();
  v4(v3);
  return a1;
}

uint64_t sub_1A2BD538C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2BD53C4()
{
  return sub_1A2B6F650();
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_1A2BD53E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_4_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A2BAB6F8(a1, v4, 0xD00000000000006BLL, a4, 0x2928747365676E69, 0xE800000000000000);
}

void OUTLINED_FUNCTION_8_14(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  sub_1A2BAB6F8(a1, v4, a2, a3, 0xD00000000000001FLL, (a4 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_11()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return *(void *)(v0 + 80);
}

void OUTLINED_FUNCTION_16_9()
{
  sub_1A2BE0554();
}

uint64_t OUTLINED_FUNCTION_17_13()
{
  return *(void *)(v0 + 232);
}

uint64_t OUTLINED_FUNCTION_18_9()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_19_7(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_20_6(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_1A2BAB6C8(a1, a2, a3, a4, 0xD00000000000001FLL, (a5 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 152);
  __swift_project_boxed_opaque_existential_1(v0, v2);
  return v3 + 16;
}

void sub_1A2BD55BC(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v5 = OUTLINED_FUNCTION_18(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  unint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = type metadata accessor for StagedMessagesTable.Record(0);
  if (*(void *)(v1 + *(int *)(v18 + 32)) != 1)
  {
    if (qword_1EB554570 == -1) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  uint64_t v19 = v18;
  uint64_t v40 = a1;
  uint64_t v20 = (uint64_t *)(v1 + *(int *)(v18 + 28));
  uint64_t v21 = *v20;
  unint64_t v22 = v20[1];
  objc_allocWithZone(MEMORY[0x1E4FA1248]);
  sub_1A2B3EA44(v21, v22);
  id v23 = sub_1A2B48BBC(v21, v22);
  if (v23)
  {
    id v24 = v23;
    if ((*(unsigned char *)(v2 + *(int *)(v19 + 24) + 8) & 1) == 0)
    {
      sub_1A2B5D9DC(v2, v8);
      if (__swift_getEnumTagSinglePayload(v8, 1, v9) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v17, v8, v9);
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v17, v9);
        id v33 = objc_allocWithZone((Class)sub_1A2C0D060());
        uint64_t v25 = sub_1A2C0D040();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v9);
        goto LABEL_14;
      }
      sub_1A2B3C61C(v8);
    }
    uint64_t v25 = 0;
LABEL_14:
    uint64_t v34 = v2 + *(int *)(v19 + 20);
    uint64_t v35 = v40;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v40, v34, v9);
    unint64_t v36 = (int *)type metadata accessor for StagedMessage();
    uint64_t v37 = v35 + v36[7];
    uint64_t v38 = sub_1A2C0CDA0();
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v38);
    *(void *)(v35 + v36[5]) = v25;
    *(void *)(v35 + v36[6]) = v24;
    __swift_storeEnumTagSinglePayload(v35, 0, 1, (uint64_t)v36);
    OUTLINED_FUNCTION_7();
    return;
  }
  if (qword_1EB554570 != -1) {
LABEL_15:
  }
    swift_once();
LABEL_10:
  OUTLINED_FUNCTION_9_14();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_28(v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriAnalytics/SiriAnalytics/Storage/Staging/StagedMessage+Mapping.swift");
  type metadata accessor for StagedMessage();
  OUTLINED_FUNCTION_7();
  __swift_storeEnumTagSinglePayload(v28, v29, v30, v31);
}

uint64_t sub_1A2BD5950()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v4 = OUTLINED_FUNCTION_18(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_2_3();
  uint64_t v5 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = type metadata accessor for StagedMessage();
  uint64_t v10 = *(void **)(v0 + *(int *)(v9 + 20));
  if (!v10)
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_9_14();
    OUTLINED_FUNCTION_11();
    sub_1A2BAB6E0(v16, v17, 0xD00000000000006DLL, 0x80000001A2C16D30, 0x292870616DLL, 0xE500000000000000);
    return 0;
  }
  uint64_t v11 = *(void **)(v0 + *(int *)(v9 + 24));
  id v12 = v10;
  if (!objc_msgSend(v11, sel_unwrap))
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_9_14();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_1_28(v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriAnalytics/SiriAnalytics/Storage/Staging/StagedMessage+Mapping.swift");

    return 0;
  }
  sub_1A2C0D030();
  sub_1A2C0D050();
  id v13 = objc_allocWithZone((Class)sub_1A2C0D060());
  sub_1A2C0D040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v1, v2, v5);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
  id v14 = objc_allocWithZone((Class)sub_1A2C0D000());
  uint64_t v15 = sub_1A2C0CFA0();

  return v15;
}

uint64_t sub_1A2BD5BC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_5_18();
  id v8 = objc_msgSend(v1, sel_underlyingMessage);
  id v9 = objc_msgSend(v8, sel_wrapAsAnyEvent);

  if (v9)
  {
    id v10 = objc_msgSend(v1, sel_messageUUID);
    sub_1A2C0CE00();

    id v11 = objc_msgSend(v1, sel_logicalTimestamp);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = sub_1A2BD5E08();
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v18 = (int *)type metadata accessor for StagedMessage();
    uint64_t v19 = a1 + v18[7];
    sub_1A2C0CD90();
    uint64_t v20 = sub_1A2C0CDA0();
    __swift_storeEnumTagSinglePayload(v19, 0, 1, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, v2, v4);
    *(void *)(a1 + v18[5]) = v13;
    *(void *)(a1 + v18[6]) = v9;
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, (uint64_t)v18);
  }
  else
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_2_26(0xD000000000000020, v14, v15, 0x80000001A2C16D30);
    uint64_t v16 = type metadata accessor for StagedMessage();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v16);
  }
}

uint64_t sub_1A2BD5E08()
{
  uint64_t v1 = sub_1A2C0CE20();
  uint64_t v2 = OUTLINED_FUNCTION_18(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_1();
  id v3 = objc_msgSend(v0, sel_clockIdentifier);
  sub_1A2C0CE00();

  objc_msgSend(v0, sel_nanoSecondsSinceBoot);
  id v4 = objc_allocWithZone((Class)sub_1A2C0D060());
  return sub_1A2C0D040();
}

void sub_1A2BD5EC4(uint64_t a1@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  uint64_t v6 = OUTLINED_FUNCTION_18(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_2_3();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v8 = OUTLINED_FUNCTION_18(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_5_18();
  uint64_t v9 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for StagedMessage();
  id v17 = objc_msgSend(*(id *)(v1 + *(int *)(v16 + 24)), sel_data);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_1A2C0CD30();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v15, v1, v9);
    if (*(void *)(v1 + *(int *)(v16 + 20)))
    {
      sub_1A2C0D030();
      __swift_storeEnumTagSinglePayload(v3, 0, 1, v9);
      sub_1A2C0D050();
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v3, 1, 1, v9);
    }
    uint64_t v26 = sub_1A2C0CDA0();
    __swift_storeEnumTagSinglePayload(v2, 1, 1, v26);
    sub_1A2BAF53C();
    uint64_t v27 = type metadata accessor for StagedMessagesTable.Record(0);
    __swift_storeEnumTagSinglePayload(a1, 0, 1, v27);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_2_26(0xD00000000000001CLL, v19, v20, 0x80000001A2C16D30);
    type metadata accessor for StagedMessagesTable.Record(0);
    OUTLINED_FUNCTION_7();
    __swift_storeEnumTagSinglePayload(v21, v22, v23, v24);
  }
}

void OUTLINED_FUNCTION_1_28(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1A2BAB6C8(a1, a2, 0xD00000000000006DLL, (a3 - 32) | 0x8000000000000000, 0x292870616DLL, 0xE500000000000000);
}

void OUTLINED_FUNCTION_2_26(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A2BAB6C8(a1, a2, a3, a4, 0x292870616DLL, 0xE500000000000000);
}

uint64_t sub_1A2BD61EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  id v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = a1;
  return sub_1A2BDA63C(0xD000000000000024, 0x80000001A2C16EA0, v7, (uint64_t)sub_1A2BD6690, (uint64_t)v6);
}

uint64_t sub_1A2BD628C(int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  uint64_t v22 = &type metadata for EmbeddedDeviceLockState;
  uint64_t v23 = (uint64_t (*)())&off_1EF5C3560;
  if (a2) {
    LODWORD(aBlock) = MKBGetDeviceLockState();
  }
  else {
    LODWORD(aBlock) = a1;
  }
  sub_1A2BD66A0((uint64_t)v27);
  sub_1A2BD6700((uint64_t)&aBlock, (uint64_t)v27);
  sub_1A2BD6768((uint64_t)v27, (uint64_t)&aBlock);
  if (v22)
  {
    v19[2] = a3;
    sub_1A2B4D72C(&aBlock, (uint64_t)v26);
    sub_1A2B58194((uint64_t)v26, (uint64_t)v25);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a4;
    *(void *)(v8 + 24) = a5;
    sub_1A2B4D72C(v25, v8 + 32);
    uint64_t v23 = sub_1A2BD6810;
    uint64_t v24 = v8;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v21 = sub_1A2B8F7A4;
    uint64_t v22 = (ValueMetadata *)&block_descriptor_14;
    uint64_t v9 = _Block_copy(&aBlock);
    uint64_t v10 = sub_1A2C0D3A0();
    v19[1] = v19;
    uint64_t v11 = *(void *)(v10 - 8);
    MEMORY[0x1F4188790](v10);
    uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_1A2C0D390();
    uint64_t v14 = sub_1A2C0D380();
    uint64_t v15 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v14);
    id v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    _OWORD v19[3] = MEMORY[0x1E4FBC860];
    sub_1A2B8FA50();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB556810);
    sub_1A2B8FA94();
    sub_1A2C0DA70();
    MEMORY[0x1A623BE10](0, v13, v17, v9);
    _Block_release(v9);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    sub_1A2BD66A0((uint64_t)v27);
    return swift_release();
  }
  else
  {
    sub_1A2BD66A0((uint64_t)v27);
    return sub_1A2BD66A0((uint64_t)&aBlock);
  }
}

uint64_t sub_1A2BD65FC()
{
  uint64_t v0 = sub_1A2BDA938();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t type metadata accessor for DeviceLockStateNotificationObserver()
{
  return self;
}

uint64_t sub_1A2BD6650()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2BD6690(int a1, char a2)
{
  return sub_1A2BD628C(a1, a2 & 1, v2[2], v2[3], v2[4]);
}

uint64_t sub_1A2BD66A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95970D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2BD6700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95970D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2BD6768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95970D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2BD67D0()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2BD6810()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

void sub_1A2BD6858()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v100 = v1;
  uint64_t v3 = v2;
  uint64_t v99 = v4;
  uint64_t v6 = v5;
  uint64_t v102 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v104 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_5_3();
  uint64_t v105 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  uint64_t v11 = OUTLINED_FUNCTION_18(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_0();
  uint64_t v101 = v12;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v92 - v14;
  uint64_t v107 = type metadata accessor for TagsTable.Record(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_5_3();
  uint64_t v103 = v17;
  uint64_t v18 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v92 - v25;
  MEMORY[0x1F4188790](v27);
  uint64_t v108 = (char *)&v92 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v30 = OUTLINED_FUNCTION_18(v29);
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_4_0();
  uint64_t v106 = v31;
  MEMORY[0x1F4188790](v32);
  uint64_t v34 = (char *)&v92 - v33;
  MEMORY[0x1F4188790](v35);
  uint64_t v37 = (char *)&v92 - v36;
  if ((sub_1A2B68658(0) & 1) != 0 && (uint64_t v38 = *(void *)(v0 + OBJC_IVAR___SiriAnalyticsMetastore_db)) != 0)
  {
    uint64_t v98 = v20;
    swift_retain();
    sub_1A2BD9274();
    sub_1A2B58194(v3, (uint64_t)v112);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596020);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596080);
    if (!swift_dynamicCast())
    {
      uint64_t v110 = 0;
      memset(v109, 0, sizeof(v109));
      swift_release();
      sub_1A2B653F8((uint64_t)v37, &qword_1EB555500);
      sub_1A2B653F8((uint64_t)v109, &qword_1E9596090);
      uint64_t v47 = v6;
      goto LABEL_15;
    }
    uint64_t v94 = v38;
    uint64_t v97 = v37;
    uint64_t v96 = v18;
    uint64_t v95 = v6;
    sub_1A2B4D72C(v109, (uint64_t)v111);
    OUTLINED_FUNCTION_16_10();
    OUTLINED_FUNCTION_6_20();
    v39();
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F94098]), sel_init);
    if (v40)
    {
      unint64_t v41 = v40;
      __swift_project_boxed_opaque_existential_1(v111, v111[3]);
      sub_1A2C0D2B0();
      uint64_t v48 = sub_1A2BEFEB0(v41);
      uint64_t v18 = v96;
      uint64_t v50 = (uint64_t)v97;
      if (v49 >> 60 != 15)
      {
        uint64_t v51 = v48;
        unint64_t v52 = v49;

        uint64_t v93 = v51;
        BOOL v53 = sub_1A2B80ED4(v51, v52);
        uint64_t v54 = v108;
        if (!v53)
        {
          unint64_t v92 = v52;
          sub_1A2BDA3EC(v99, (uint64_t)v34, &qword_1EB555500);
          if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v18) == 1)
          {
            sub_1A2C0CE10();
            sub_1A2B653F8((uint64_t)v34, &qword_1EB555500);
            uint64_t v61 = v18;
            uint64_t v62 = v98;
          }
          else
          {
            uint64_t v62 = v98;
            (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v54, v34, v18);
            uint64_t v61 = v18;
          }
          unint64_t v63 = *(void (**)(void))(v62 + 16);
          OUTLINED_FUNCTION_9_15();
          v63();
          OUTLINED_FUNCTION_16_10();
          OUTLINED_FUNCTION_6_20();
          v64();
          int v65 = LOBYTE(v112[0]);
          OUTLINED_FUNCTION_9_15();
          v63();
          uint64_t v66 = OUTLINED_FUNCTION_8_15();
          uint64_t v67 = v102;
          __swift_storeEnumTagSinglePayload(v66, v68, v69, v102);
          sub_1A2BDA3EC((uint64_t)v97, v106, &qword_1EB555500);
          uint64_t v70 = v103;
          OUTLINED_FUNCTION_9_15();
          v63();
          uint64_t v71 = v107;
          *(_DWORD *)(v70 + *(int *)(v107 + 20)) = v65;
          OUTLINED_FUNCTION_9_15();
          v63();
          uint64_t v72 = (void *)(v70 + *(int *)(v71 + 28));
          uint64_t v73 = v93;
          unint64_t v74 = v92;
          *uint64_t v72 = v93;
          v72[1] = v74;
          uint64_t v75 = v101;
          sub_1A2BDA3EC((uint64_t)v15, v101, &qword_1EB554320);
          int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v75, 1, v67);
          sub_1A2BCDF90(v73, v74);
          if (EnumTagSinglePayload == 1)
          {
            uint64_t v77 = v105;
            sub_1A2C0CD90();
            sub_1A2B653F8((uint64_t)v15, &qword_1EB554320);
            uint64_t v78 = *(void (**)(char *, uint64_t))(v98 + 8);
            v78(v23, v61);
            uint64_t v100 = v78;
            v78(v26, v61);
            sub_1A2B653F8(v75, &qword_1EB554320);
            uint64_t v79 = *(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32);
          }
          else
          {
            sub_1A2B653F8((uint64_t)v15, &qword_1EB554320);
            uint64_t v80 = *(void (**)(char *, uint64_t))(v98 + 8);
            v80(v23, v61);
            uint64_t v100 = v80;
            v80(v26, v61);
            uint64_t v77 = v105;
            uint64_t v79 = *(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32);
            v79(v105, v75, v67);
          }
          uint64_t v81 = v107;
          v79(v70 + *(int *)(v107 + 32), v77, v67);
          sub_1A2BDA39C(v106, v70 + *(int *)(v81 + 36), &qword_1EB555500);
          uint64_t v82 = sub_1A2BCC470();
          uint64_t v83 = v70;
          if (qword_1EB5545C8 != -1) {
            swift_once();
          }
          uint64_t v84 = qword_1EB557398;
          uint64_t v85 = swift_bridgeObjectRetain();
          uint64_t v86 = sub_1A2BA251C(v85);
          v112[0] = 1936154996;
          v112[1] = 0xE400000000000000;
          v112[2] = v82;
          v112[3] = v84;
          v112[4] = v86;
          uint64_t v87 = sub_1A2BE88D0();
          unsigned __int8 v90 = sub_1A2BE6C6C(v87, v88, v89);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1A2B48634(v93, v92);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1A2BDA4E4(v83, (void (*)(void))type metadata accessor for TagsTable.Record);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v111);
          sub_1A2B653F8((uint64_t)v97, &qword_1EB555500);
          if (v90)
          {
            (*(void (**)(uint64_t, char *, uint64_t))(v98 + 32))(v95, v108, v96);
            uint64_t v47 = OUTLINED_FUNCTION_21_10();
          }
          else
          {
            uint64_t v91 = v96;
            v100(v108, v96);
            uint64_t v47 = v95;
            uint64_t v58 = 1;
            uint64_t v59 = 1;
            uint64_t v60 = v91;
          }
          goto LABEL_16;
        }
        if (qword_1EB554588 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_10();
        sub_1A2BAB6C8(0xD00000000000001DLL, v55, v56, v57, 0xD00000000000001DLL, 0x80000001A2C16F60);
        swift_release();
        sub_1A2B48634(v93, v52);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v111);
        sub_1A2B653F8(v50, &qword_1EB555500);
        uint64_t v47 = v95;
LABEL_15:
        uint64_t v58 = 1;
        uint64_t v59 = 1;
        uint64_t v60 = v18;
LABEL_16:
        __swift_storeEnumTagSinglePayload(v47, v58, v59, v60);
        OUTLINED_FUNCTION_7();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_7();
    __swift_storeEnumTagSinglePayload(v42, v43, v44, v45);
  }
}

void sub_1A2BD7298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_8_0();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v29 = OUTLINED_FUNCTION_18(v28);
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_11_11();
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&a9 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545E0);
  uint64_t v34 = OUTLINED_FUNCTION_18(v33);
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_5_18();
  int v35 = *v25;
  BOOL v36 = v35 == 2;
  uint64_t v37 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_14();
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v32, v27, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v37);
  uint64_t v39 = OUTLINED_FUNCTION_8_15();
  __swift_storeEnumTagSinglePayload(v39, v40, v41, v37);
  int v42 = v35 & 1;
  uint64_t v43 = (int *)type metadata accessor for TagsTable.Predicate(0);
  uint64_t v44 = v20 + v43[10];
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  __swift_storeEnumTagSinglePayload(v44, 1, 1, v45);
  __swift_storeEnumTagSinglePayload(v20 + v43[11], 1, 1, v37);
  sub_1A2BDA39C((uint64_t)v32, v20, &qword_1EB555500);
  *(void *)(v20 + v43[5]) = 0;
  sub_1A2BDA39C(v21, v20 + v43[6], &qword_1EB555500);
  *(void *)(v20 + v43[7]) = 0;
  uint64_t v46 = v20 + v43[8];
  *(_DWORD *)uint64_t v46 = v42;
  *(unsigned char *)(v46 + 4) = v36;
  uint64_t v47 = OUTLINED_FUNCTION_17_14(v43[9]);
  __swift_storeEnumTagSinglePayload(v47, v48, v49, (uint64_t)v43);
  uint64_t v50 = sub_1A2BD9E70();
  sub_1A2B653F8(v20, &qword_1EB5545E0);
  if (v50)
  {
    sub_1A2BD8F40(v50);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A2BD74A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5543F8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IdentifiableTag();
  uint64_t v71 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v73 = (uint64_t)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v55 - v8;
  uint64_t v10 = type metadata accessor for TagsTable.Record(0);
  uint64_t v56 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95970E0);
  MEMORY[0x1F4188790](v60);
  uint64_t v69 = (char *)v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v68 = (uint64_t)v55 - v15;
  MEMORY[0x1F4188790](v16);
  uint64_t v59 = (char *)v55 - v17;
  uint64_t v18 = MEMORY[0x1E4FBC868];
  uint64_t v79 = MEMORY[0x1E4FBC868];
  sub_1A2BC60E0(a1);
  uint64_t v61 = v74;
  uint64_t v57 = v75;
  int64_t v64 = v77;
  unint64_t v19 = v78;
  v55[0] = v76;
  int64_t v58 = (unint64_t)(v76 + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v72 = v5;
  if (!v19) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v66 = (v19 - 1) & v19;
  unint64_t v21 = __clz(__rbit64(v19)) | (v64 << 6);
  while (1)
  {
    uint64_t v26 = v61;
    uint64_t v27 = *(void *)(v61 + 48);
    uint64_t v28 = sub_1A2C0CE20();
    uint64_t v67 = *(void **)(v28 - 8);
    uint64_t v65 = v67[9];
    uint64_t v29 = (void (*)(char *, unint64_t))v67[2];
    uint64_t v30 = v59;
    uint64_t v70 = v28;
    v29(v59, v27 + v65 * v21);
    uint64_t v31 = v60;
    *(void *)&v30[*(int *)(v60 + 48)] = *(void *)(*(void *)(v26 + 56) + 8 * v21);
    uint64_t v32 = (uint64_t)v30;
    uint64_t v33 = v68;
    sub_1A2BDA39C(v32, v68, &qword_1E95970E0);
    uint64_t v34 = *(int *)(v31 + 48);
    uint64_t v35 = *(void *)(v33 + v34);
    uint64_t v36 = *(void *)(v35 + 16);
    if (v36)
    {
      uint64_t v63 = v34;
      uint64_t v37 = v56;
      uint64_t v38 = v35 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
      swift_bridgeObjectRetain();
      uint64_t v62 = v35;
      swift_bridgeObjectRetain();
      uint64_t v39 = *(void *)(v37 + 72);
      uint64_t v40 = MEMORY[0x1E4FBC860];
      do
      {
        sub_1A2BDA43C(v38, (uint64_t)v12, (void (*)(void))type metadata accessor for TagsTable.Record);
        sub_1A2BD85D4((uint64_t)v4);
        sub_1A2BDA4E4((uint64_t)v12, (void (*)(void))type metadata accessor for TagsTable.Record);
        if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
        {
          sub_1A2B653F8((uint64_t)v4, (uint64_t *)&unk_1EB5543F8);
        }
        else
        {
          sub_1A2BDA490((uint64_t)v4, (uint64_t)v9, (void (*)(void))type metadata accessor for IdentifiableTag);
          sub_1A2BDA490((uint64_t)v9, v73, (void (*)(void))type metadata accessor for IdentifiableTag);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v40 = sub_1A2B875DC(0, *(void *)(v40 + 16) + 1, 1, v40);
          }
          unint64_t v42 = *(void *)(v40 + 16);
          unint64_t v41 = *(void *)(v40 + 24);
          if (v42 >= v41 >> 1) {
            uint64_t v40 = sub_1A2B875DC(v41 > 1, v42 + 1, 1, v40);
          }
          *(void *)(v40 + 16) = v42 + 1;
          sub_1A2BDA490(v73, v40+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v42, (void (*)(void))type metadata accessor for IdentifiableTag);
          uint64_t v5 = v72;
        }
        v38 += v39;
        --v36;
      }
      while (v36);
      swift_bridgeObjectRelease();
      uint64_t v43 = v69;
      uint64_t v34 = v63;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v40 = MEMORY[0x1E4FBC860];
      uint64_t v43 = v69;
    }
    uint64_t v44 = v68;
    uint64_t v45 = (void (*)(char *, uint64_t, uint64_t))v67[4];
    v45(v43, v68, v70);
    uint64_t v67 = *(void **)(v44 + v34);
    uint64_t v18 = v79;
    if (*(void *)(v79 + 24) <= *(void *)(v79 + 16))
    {
      sub_1A2BA6C74();
      uint64_t v18 = v79;
    }
    sub_1A2BA8018();
    uint64_t result = sub_1A2C0D420();
    uint64_t v46 = v18 + 64;
    uint64_t v47 = -1 << *(unsigned char *)(v18 + 32);
    unint64_t v48 = result & ~v47;
    unint64_t v49 = v48 >> 6;
    if (((-1 << v48) & ~*(void *)(v18 + 64 + 8 * (v48 >> 6))) == 0) {
      break;
    }
    unint64_t v50 = __clz(__rbit64((-1 << v48) & ~*(void *)(v18 + 64 + 8 * (v48 >> 6)))) | v48 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
    *(void *)(v46 + ((v50 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v50;
    v45((char *)(*(void *)(v18 + 48) + v50 * v65), (uint64_t)v69, v70);
    *(void *)(*(void *)(v18 + 56) + 8 * v50) = v40;
    ++*(void *)(v18 + 16);
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v19 = v66;
    if (v66) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v22 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      goto LABEL_46;
    }
    if (v22 >= v58) {
      goto LABEL_44;
    }
    unint64_t v23 = *(void *)(v57 + 8 * v22);
    int64_t v24 = v64 + 1;
    if (!v23)
    {
      int64_t v24 = v64 + 2;
      if (v64 + 2 >= v58) {
        goto LABEL_44;
      }
      unint64_t v23 = *(void *)(v57 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v64 + 3;
        if (v64 + 3 >= v58) {
          goto LABEL_44;
        }
        unint64_t v23 = *(void *)(v57 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v64 + 4;
          if (v64 + 4 >= v58) {
            goto LABEL_44;
          }
          unint64_t v23 = *(void *)(v57 + 8 * v24);
          if (!v23)
          {
            int64_t v24 = v64 + 5;
            if (v64 + 5 >= v58) {
              goto LABEL_44;
            }
            unint64_t v23 = *(void *)(v57 + 8 * v24);
            if (!v23)
            {
              int64_t v25 = v64 + 6;
              while (v25 < v58)
              {
                unint64_t v23 = *(void *)(v57 + 8 * v25++);
                if (v23)
                {
                  int64_t v24 = v25 - 1;
                  goto LABEL_18;
                }
              }
LABEL_44:
              sub_1A2BA80D0();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    uint64_t v66 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    int64_t v64 = v24;
  }
  char v51 = 0;
  unint64_t v52 = (unint64_t)(63 - v47) >> 6;
  while (++v49 != v52 || (v51 & 1) == 0)
  {
    BOOL v53 = v49 == v52;
    if (v49 == v52) {
      unint64_t v49 = 0;
    }
    v51 |= v53;
    uint64_t v54 = *(void *)(v46 + 8 * v49);
    if (v54 != -1)
    {
      unint64_t v50 = __clz(__rbit64(~v54)) + (v49 << 6);
      goto LABEL_42;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_1A2BD7C58(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540F8);
  MEMORY[0x1F4188790](v44);
  uint64_t v47 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v50 = (uint64_t)v40 - v6;
  MEMORY[0x1F4188790](v7);
  uint64_t v43 = (char *)v40 - v8;
  uint64_t v55 = MEMORY[0x1E4FBC868];
  sub_1A2BC60E0(a1);
  uint64_t v45 = v51[1];
  int64_t v9 = v53;
  unint64_t v10 = v54;
  v40[1] = v52;
  int64_t v41 = (unint64_t)(v52 + 64) >> 6;
  uint64_t v42 = v51[2];
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v46 = v9;
    if (v10)
    {
      uint64_t v48 = (v10 - 1) & v10;
      int64_t v49 = v9;
      unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
    }
    else
    {
      int64_t v13 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v41) {
        goto LABEL_38;
      }
      unint64_t v14 = *(void *)(v42 + 8 * v13);
      if (!v14)
      {
        int64_t v15 = v9 + 2;
        if (v9 + 2 >= v41) {
          goto LABEL_38;
        }
        unint64_t v14 = *(void *)(v42 + 8 * v15);
        if (v14) {
          goto LABEL_13;
        }
        int64_t v15 = v9 + 3;
        if (v9 + 3 >= v41) {
          goto LABEL_38;
        }
        unint64_t v14 = *(void *)(v42 + 8 * v15);
        if (v14) {
          goto LABEL_13;
        }
        int64_t v15 = v9 + 4;
        if (v9 + 4 >= v41) {
          goto LABEL_38;
        }
        unint64_t v14 = *(void *)(v42 + 8 * v15);
        if (v14)
        {
LABEL_13:
          int64_t v13 = v15;
        }
        else
        {
          int64_t v13 = v9 + 5;
          if (v9 + 5 >= v41) {
            goto LABEL_38;
          }
          unint64_t v14 = *(void *)(v42 + 8 * v13);
          if (!v14)
          {
            int64_t v39 = v9 + 6;
            while (v39 < v41)
            {
              unint64_t v14 = *(void *)(v42 + 8 * v39++);
              if (v14)
              {
                int64_t v13 = v39 - 1;
                goto LABEL_14;
              }
            }
LABEL_38:
            sub_1A2BA80D0();
            return v55;
          }
        }
      }
LABEL_14:
      uint64_t v48 = (v14 - 1) & v14;
      int64_t v49 = v13;
      unint64_t v12 = __clz(__rbit64(v14)) + (v13 << 6);
    }
    uint64_t v16 = v45;
    uint64_t v17 = *(void *)(v45 + 48);
    uint64_t v18 = sub_1A2C0CE20();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)(v19 + 72);
    uint64_t v22 = (uint64_t)v43;
    (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v43, v17 + v21 * v12, v18);
    uint64_t v23 = v44;
    *(void *)(v22 + *(int *)(v44 + 48)) = *(void *)(*(void *)(v16 + 56) + 8 * v12);
    uint64_t v24 = v50;
    sub_1A2BDA39C(v22, v50, &qword_1EB5540F8);
    uint64_t v25 = v24 + *(int *)(v23 + 48);
    swift_bridgeObjectRetain();
    sub_1A2BD9F30(v25, v51);
    if (v2)
    {
      sub_1A2B653F8(v50, &qword_1EB5540F8);
      swift_release();
      return sub_1A2BA80D0();
    }
    uint64_t v26 = v51[0];
    if (!v51[0])
    {
      sub_1A2B653F8(v50, &qword_1EB5540F8);
      goto LABEL_30;
    }
    uint64_t v46 = 0;
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
    v27(v47, v50, v18);
    uint64_t v28 = v55;
    if (*(void *)(v55 + 24) <= *(void *)(v55 + 16))
    {
      sub_1A2BA6C74();
      uint64_t v28 = v55;
    }
    sub_1A2BA8018();
    uint64_t result = sub_1A2C0D420();
    uint64_t v29 = v28 + 64;
    uint64_t v30 = -1 << *(unsigned char *)(v28 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v28 + 64 + 8 * (v31 >> 6))) == 0) {
      break;
    }
    unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v28 + 64 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    uint64_t v2 = v46;
    uint64_t v34 = v47;
LABEL_29:
    *(void *)(v29 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v27((char *)(*(void *)(v28 + 48) + v33 * v21), (uint64_t)v34, v18);
    *(void *)(*(void *)(v28 + 56) + 8 * v33) = v26;
    ++*(void *)(v28 + 16);
LABEL_30:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v10 = v48;
    int64_t v9 = v49;
  }
  char v35 = 0;
  unint64_t v36 = (unint64_t)(63 - v30) >> 6;
  uint64_t v2 = v46;
  uint64_t v34 = v47;
  while (++v32 != v36 || (v35 & 1) == 0)
  {
    BOOL v37 = v32 == v36;
    if (v32 == v36) {
      unint64_t v32 = 0;
    }
    v35 |= v37;
    uint64_t v38 = *(void *)(v29 + 8 * v32);
    if (v38 != -1)
    {
      unint64_t v33 = __clz(__rbit64(~v38)) + (v32 << 6);
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1A2BD8124()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v29 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v8 = OUTLINED_FUNCTION_18(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_11_11();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545E0);
  uint64_t v13 = OUTLINED_FUNCTION_18(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_5_18();
  int v14 = *v4;
  uint64_t v15 = sub_1A2C0CE20();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v15);
  uint64_t v16 = OUTLINED_FUNCTION_8_15();
  __swift_storeEnumTagSinglePayload(v16, v17, v18, v15);
  uint64_t v19 = (int *)type metadata accessor for TagsTable.Predicate(0);
  uint64_t v20 = v1 + v19[10];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
  __swift_storeEnumTagSinglePayload(v20, 1, 1, v21);
  uint64_t v22 = v1 + v19[11];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v22, v6, v15);
  __swift_storeEnumTagSinglePayload(v22, 0, 1, v15);
  sub_1A2BDA39C((uint64_t)v11, v1, &qword_1EB555500);
  *(void *)(v1 + v19[5]) = 0;
  sub_1A2BDA39C(v2, v1 + v19[6], &qword_1EB555500);
  *(void *)(v1 + v19[7]) = 0;
  uint64_t v23 = v1 + v19[8];
  *(_DWORD *)uint64_t v23 = v14 & 1;
  *(unsigned char *)(v23 + 4) = v14 == 2;
  uint64_t v24 = OUTLINED_FUNCTION_17_14(v19[9]);
  __swift_storeEnumTagSinglePayload(v24, v25, v26, (uint64_t)v19);
  uint64_t v27 = sub_1A2BD9E70();
  sub_1A2B653F8(v1, &qword_1EB5545E0);
  if (v27)
  {
    sub_1A2BD8F40(v27);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A2BD8344(unsigned __int8 *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545E0);
  uint64_t v3 = OUTLINED_FUNCTION_18(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  int v7 = *a1;
  if (v7 == 2)
  {
    type metadata accessor for TagsTable.Predicate(0);
    uint64_t v8 = OUTLINED_FUNCTION_21_7();
  }
  else
  {
    sub_1A2C0CE20();
    OUTLINED_FUNCTION_11_9(v6);
    uint64_t v12 = (int *)type metadata accessor for TagsTable.Predicate(0);
    OUTLINED_FUNCTION_11_9(v6 + v12[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5540E0);
    uint64_t v13 = OUTLINED_FUNCTION_8_15();
    __swift_storeEnumTagSinglePayload(v13, v14, v15, v16);
    OUTLINED_FUNCTION_11_9(v6 + v12[11]);
    *(void *)(v6 + v12[5]) = 0;
    *(void *)(v6 + v12[7]) = 0;
    uint64_t v17 = v6 + v12[8];
    *(_DWORD *)uint64_t v17 = v7 & 1;
    *(unsigned char *)(v17 + 4) = 0;
    *(void *)(v6 + v12[9]) = 0;
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    uint64_t v10 = 1;
    uint64_t v11 = (uint64_t)v12;
  }
  __swift_storeEnumTagSinglePayload(v8, v9, v10, v11);
  uint64_t v18 = sub_1A2BD9E70();
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = sub_1A2BD89CC(v18);
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_1A2BD74A0(v20);
    swift_bridgeObjectRelease();
  }
  sub_1A2B653F8(v6, &qword_1EB5545E0);
  return v19;
}

uint64_t sub_1A2BD84BC(uint64_t a1)
{
  uint64_t v3 = 0;
  if (sub_1A2B68658(0))
  {
    if (*(void *)(v1 + OBJC_IVAR___SiriAnalyticsMetastore_db) && *(void *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v4 = sub_1A2BCD9A4(0);
      uint64_t v3 = sub_1A2BE6D8C(v4, v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v3)
      {
        uint64_t v7 = sub_1A2BE5B90(v3);
        swift_bridgeObjectRelease();
        uint64_t v3 = sub_1A2BD7C58(v7);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_1A2BD85D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TagsTable.Record(0);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v1 + *(int *)(v4 + 20));
  if (v6)
  {
    if (v6 != 1)
    {
      if (qword_1EB554588 != -1) {
        swift_once();
      }
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      *(void *)&long long v39 = 0xD000000000000013;
      *((void *)&v39 + 1) = 0x80000001A2C16EE0;
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_2_27();
      sub_1A2BAB6C8(v13, v14, v15, v16, v17, v18);
      swift_bridgeObjectRelease();
      type metadata accessor for IdentifiableTag();
      uint64_t v19 = OUTLINED_FUNCTION_21_7();
      return __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
    }
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
  }
  uint64_t v8 = (uint64_t *)(v1 + *(int *)(v4 + 28));
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  objc_allocWithZone(MEMORY[0x1E4F94090]);
  sub_1A2B3EA44(v9, v10);
  id v11 = sub_1A2B48BBC(v9, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    if (v7)
    {
      uint64_t v40 = &type metadata for DataClassificationTag;
      int64_t v41 = &protocol witness table for DataClassificationTag;
      *(void *)&long long v39 = swift_allocObject();
      static DataClassificationTag.read(from:)(v39 + 16);
    }
    else
    {
      uint64_t v40 = &type metadata for SensitiveConditionTag;
      int64_t v41 = &protocol witness table for SensitiveConditionTag;
      static SensitiveConditionTag.read(from:)();
    }

    uint64_t v34 = v2 + *(int *)(v5 + 24);
    uint64_t v35 = sub_1A2C0CE20();
    OUTLINED_FUNCTION_14();
    BOOL v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
    v37(a1, v34, v35);
    uint64_t v38 = type metadata accessor for IdentifiableTag();
    v37(a1 + *(int *)(v38 + 20), v2, v35);
    sub_1A2B4D72C(&v39, a1 + *(int *)(v38 + 24));
    uint64_t v19 = OUTLINED_FUNCTION_21_10();
    return __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
  }
  if (qword_1EB554588 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_27();
  sub_1A2BAB6C8(v23, v24, v25, v26, v27, v28);
  type metadata accessor for IdentifiableTag();
  uint64_t v29 = OUTLINED_FUNCTION_21_7();
  return __swift_storeEnumTagSinglePayload(v29, v30, v31, v32);
}

uint64_t sub_1A2BD89CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A2C0CE20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)v44 - v10;
  uint64_t v12 = type metadata accessor for TagsTable.Record(0) - 8;
  MEMORY[0x1F4188790](v12);
  unint64_t v14 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  unint64_t v18 = (char *)v44 - v17;
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return MEMORY[0x1E4FBC868];
  }
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = *(void *)(v16 + 72);
  unint64_t v52 = v20;
  uint64_t v53 = v22;
  uint64_t v55 = (void (**)(char *, char *, uint64_t))(v6 + 16);
  char v51 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v45 = v6;
  uint64_t v46 = (void (**)(char *, uint64_t))(v6 + 8);
  v44[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v23 = (void *)MEMORY[0x1E4FBC868];
  int64_t v49 = v11;
  uint64_t v50 = v4;
  uint64_t v47 = v18;
  uint64_t v48 = v14;
  while (1)
  {
    sub_1A2BDA43C(v21, (uint64_t)v18, (void (*)(void))type metadata accessor for TagsTable.Record);
    unint64_t v54 = *v55;
    v54(v4, v18, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_1A2BDA4E4((uint64_t)v18, (void (*)(void))type metadata accessor for TagsTable.Record);
      sub_1A2B653F8((uint64_t)v4, &qword_1EB555500);
      goto LABEL_22;
    }
    (*v51)(v11, v4, v5);
    if (v23[2])
    {
      unint64_t v24 = sub_1A2B54F70();
      uint64_t v25 = MEMORY[0x1E4FBC860];
      if (v26)
      {
        uint64_t v25 = *(void *)(v23[7] + 8 * v24);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      uint64_t v25 = MEMORY[0x1E4FBC860];
    }
    sub_1A2BDA43C((uint64_t)v18, (uint64_t)v14, (void (*)(void))type metadata accessor for TagsTable.Record);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = sub_1A2B87594(0, *(void *)(v25 + 16) + 1, 1, v25);
    }
    unint64_t v28 = *(void *)(v25 + 16);
    unint64_t v27 = *(void *)(v25 + 24);
    if (v28 >= v27 >> 1) {
      uint64_t v25 = sub_1A2B87594(v27 > 1, v28 + 1, 1, v25);
    }
    *(void *)(v25 + 16) = v28 + 1;
    sub_1A2BDA490((uint64_t)v14, v25 + v52 + v28 * v53, (void (*)(void))type metadata accessor for TagsTable.Record);
    uint64_t v29 = v5;
    v54(v8, v11, v5);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v56 = v23;
    uint64_t v30 = v8;
    unint64_t v31 = sub_1A2B54F70();
    if (__OFADD__(v23[2], (v32 & 1) == 0)) {
      break;
    }
    unint64_t v33 = v31;
    char v34 = v32;
    __swift_instantiateConcreteTypeFromMangledName(qword_1E95970E8);
    if (sub_1A2C0DC50())
    {
      unint64_t v35 = sub_1A2B54F70();
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_28;
      }
      unint64_t v33 = v35;
    }
    uint64_t v23 = v56;
    if (v34)
    {
      uint64_t v37 = v56[7];
      swift_bridgeObjectRelease();
      *(void *)(v37 + 8 * v33) = v25;
      uint64_t v8 = v30;
      uint64_t v5 = v29;
    }
    else
    {
      v56[(v33 >> 6) + 8] |= 1 << v33;
      uint64_t v8 = v30;
      uint64_t v38 = v30;
      uint64_t v5 = v29;
      v54((char *)(v23[6] + *(void *)(v45 + 72) * v33), v38, v29);
      *(void *)(v23[7] + 8 * v33) = v25;
      uint64_t v39 = v23[2];
      BOOL v40 = __OFADD__(v39, 1);
      uint64_t v41 = v39 + 1;
      if (v40) {
        goto LABEL_27;
      }
      v23[2] = v41;
    }
    swift_bridgeObjectRelease();
    uint64_t v42 = *v46;
    (*v46)(v8, v5);
    id v11 = v49;
    v42(v49, v5);
    unint64_t v18 = v47;
    sub_1A2BDA4E4((uint64_t)v47, (void (*)(void))type metadata accessor for TagsTable.Record);
    uint64_t v4 = v50;
    unint64_t v14 = v48;
LABEL_22:
    v21 += v53;
    if (!--v19)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v23;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  uint64_t result = sub_1A2C0DDE0();
  __break(1u);
  return result;
}

uint64_t sub_1A2BD8F40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5543F8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IdentifiableTag();
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v22 - v9;
  uint64_t v11 = type metadata accessor for TagsTable.Record(0) - 8;
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v16 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v17 = *(void *)(v12 + 72);
  v22[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v18 = MEMORY[0x1E4FBC860];
  uint64_t v23 = v5;
  do
  {
    sub_1A2BDA43C(v16, (uint64_t)v14, (void (*)(void))type metadata accessor for TagsTable.Record);
    sub_1A2BD85D4((uint64_t)v4);
    sub_1A2BDA4E4((uint64_t)v14, (void (*)(void))type metadata accessor for TagsTable.Record);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_1A2B653F8((uint64_t)v4, (uint64_t *)&unk_1EB5543F8);
    }
    else
    {
      sub_1A2BDA490((uint64_t)v4, (uint64_t)v10, (void (*)(void))type metadata accessor for IdentifiableTag);
      sub_1A2BDA490((uint64_t)v10, (uint64_t)v7, (void (*)(void))type metadata accessor for IdentifiableTag);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v18 = sub_1A2B875DC(0, *(void *)(v18 + 16) + 1, 1, v18);
      }
      unint64_t v20 = *(void *)(v18 + 16);
      unint64_t v19 = *(void *)(v18 + 24);
      if (v20 >= v19 >> 1) {
        uint64_t v18 = sub_1A2B875DC(v19 > 1, v20 + 1, 1, v18);
      }
      *(void *)(v18 + 16) = v20 + 1;
      sub_1A2BDA490((uint64_t)v7, v18+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v20, (void (*)(void))type metadata accessor for IdentifiableTag);
      uint64_t v5 = v23;
    }
    v16 += v17;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease();
  return v18;
}

void sub_1A2BD9274()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for ComponentId(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_5_18();
  uint64_t v14 = type metadata accessor for MessageGroupIdentifier(0);
  uint64_t v15 = OUTLINED_FUNCTION_18(v14);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v18);
  unint64_t v20 = &v24[-v19];
  sub_1A2B58194(v2, (uint64_t)&v26);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596020);
  if (!swift_dynamicCast()) {
    goto LABEL_5;
  }
  unint64_t v21 = v25;
  if (v25 >> 61 != 1)
  {
    sub_1A2B5E470(v25);
LABEL_5:
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
    goto LABEL_6;
  }
  uint64_t v22 = swift_projectBox();
  sub_1A2BDA43C(v22, (uint64_t)v20, (void (*)(void))type metadata accessor for MessageGroupIdentifier);
  sub_1A2BDA43C((uint64_t)v20, (uint64_t)v17, (void (*)(void))type metadata accessor for MessageGroupIdentifier);
  sub_1A2BDA490((uint64_t)v17, v0, (void (*)(void))type metadata accessor for ComponentId);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, v0 + *(int *)(v12 + 20), v5);
  objc_allocWithZone((Class)sub_1A2C0D0A0());
  sub_1A2B5E424(v21);
  uint64_t v23 = (void *)sub_1A2C0D080();
  sub_1A2C0D090();

  sub_1A2B5E470(v21);
  sub_1A2BDA4E4(v0, (void (*)(void))type metadata accessor for ComponentId);
  sub_1A2BDA4E4((uint64_t)v20, (void (*)(void))type metadata accessor for MessageGroupIdentifier);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v5);
  sub_1A2B5E470(v21);
LABEL_6:
  OUTLINED_FUNCTION_7();
}

uint64_t Metastore.createTag(shim:onClock:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v1 = OUTLINED_FUNCTION_18(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_1A2C0CE20();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
  sub_1A2BD6858();
  return sub_1A2B653F8(v4, &qword_1EB555500);
}

uint64_t *sub_1A2BD976C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A2C0CE20();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    long long v10 = *(_OWORD *)((char *)a2 + v9 + 24);
    *(_OWORD *)((char *)a1 + v9 + 24) = v10;
    (**(void (***)(void))(v10 - 8))();
  }
  return a1;
}

uint64_t sub_1A2BD98A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A2C0CE20();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  return __swift_destroy_boxed_opaque_existential_1(v6);
}

uint64_t sub_1A2BD9948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  long long v9 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)(a1 + v8 + 24) = v9;
  (**(void (***)(void))(v9 - 8))();
  return a1;
}

uint64_t sub_1A2BD9A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 24)), (uint64_t *)(a2 + *(int *)(a3 + 24)));
  return a1;
}

uint64_t sub_1A2BD9ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  return a1;
}

uint64_t sub_1A2BD9B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  __swift_destroy_boxed_opaque_existential_1(a1 + v8);
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  return a1;
}

uint64_t sub_1A2BD9C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A2BD9C60);
}

uint64_t sub_1A2BD9C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_1A2BD9CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A2BD9D04);
}

void sub_1A2BD9D04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  }
}

uint64_t type metadata accessor for IdentifiableTag()
{
  uint64_t result = qword_1EB554128;
  if (!qword_1EB554128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BD9DD8()
{
  uint64_t result = sub_1A2C0CE20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A2BD9E70()
{
  uint64_t v1 = 0;
  if (sub_1A2B68658(0))
  {
    if (*(void *)(v0 + OBJC_IVAR___SiriAnalyticsMetastore_db))
    {
      swift_retain();
      sub_1A2BBB4AC();
      uint64_t v2 = (void *)MEMORY[0x1A623C670]();
      uint64_t v1 = sub_1A2BC07FC();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_1A2BD9F30(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5545B0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TagsTable.Record(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5543F8);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for IdentifiableTag();
  uint64_t v26 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v28 = (uint64_t)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v25 = (uint64_t)v23 - v17;
  uint64_t v27 = *(void *)(*(void *)a1 + 16);
  if (v27)
  {
    v23[0] = a2;
    v23[1] = v2;
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
    uint64_t v19 = MEMORY[0x1E4FBC860];
    uint64_t v24 = v8;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1A2BCBA70();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
      {
        sub_1A2B653F8((uint64_t)v7, (uint64_t *)&unk_1EB5545B0);
        __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
      }
      else
      {
        sub_1A2BDA490((uint64_t)v7, (uint64_t)v10, (void (*)(void))type metadata accessor for TagsTable.Record);
        sub_1A2BD85D4((uint64_t)v13);
        sub_1A2BDA4E4((uint64_t)v10, (void (*)(void))type metadata accessor for TagsTable.Record);
      }
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
      {
        sub_1A2B653F8((uint64_t)v13, (uint64_t *)&unk_1EB5543F8);
      }
      else
      {
        uint64_t v20 = v25;
        sub_1A2BDA490((uint64_t)v13, v25, (void (*)(void))type metadata accessor for IdentifiableTag);
        sub_1A2BDA490(v20, v28, (void (*)(void))type metadata accessor for IdentifiableTag);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_1A2B875DC(0, *(void *)(v19 + 16) + 1, 1, v19);
        }
        unint64_t v22 = *(void *)(v19 + 16);
        unint64_t v21 = *(void *)(v19 + 24);
        if (v22 >= v21 >> 1) {
          uint64_t v19 = sub_1A2B875DC(v21 > 1, v22 + 1, 1, v19);
        }
        *(void *)(v19 + 16) = v22 + 1;
        sub_1A2BDA490(v28, v19+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v22, (void (*)(void))type metadata accessor for IdentifiableTag);
        uint64_t v8 = v24;
      }
      ++v18;
    }
    while (v27 != v18);
    swift_bridgeObjectRelease();
    a2 = (uint64_t *)v23[0];
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4FBC860];
  }
  *a2 = v19;
}

uint64_t sub_1A2BDA308()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A2B5E470(*(void *)(v0 + 56));
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x1A623D310);
  }
  return result;
}

uint64_t sub_1A2BDA39C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  uint64_t v4 = OUTLINED_FUNCTION_23_7();
  v5(v4);
  return a2;
}

uint64_t sub_1A2BDA3EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  uint64_t v4 = OUTLINED_FUNCTION_22_6();
  v5(v4);
  return a2;
}

uint64_t sub_1A2BDA43C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14();
  uint64_t v4 = OUTLINED_FUNCTION_22_6();
  v5(v4);
  return a2;
}

uint64_t sub_1A2BDA490(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14();
  uint64_t v4 = OUTLINED_FUNCTION_23_7();
  v5(v4);
  return a2;
}

uint64_t sub_1A2BDA4E4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_10()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_17_14@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_7()
{
  return v0;
}

uint64_t sub_1A2BDA63C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  *(_DWORD *)(v6 + 48) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AA8);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 0;
  *(void *)(v6 + 56) = v12;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  uint64_t v13 = qword_1E9596038;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_20();
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_26();
  OUTLINED_FUNCTION_2_28();
  sub_1A2BAB6F8(v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_bridgeObjectRetain();
  swift_unownedRetain();
  uint64_t v20 = a3;
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRetain();
  swift_release();
  unint64_t v21 = (void *)swift_allocObject();
  v21[2] = a1;
  v21[3] = a2;
  v21[4] = v6;
  aBlock[4] = sub_1A2BDAF60;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A2BDAE74;
  aBlock[3] = &block_descriptor_15;
  unint64_t v22 = _Block_copy(aBlock);
  swift_release();
  uint64_t v23 = (const char *)(sub_1A2C0D500() + 32);
  swift_beginAccess();
  uint32_t v24 = notify_register_dispatch(v23, (int *)(v6 + 48), v20, v22);
  swift_endAccess();
  swift_release();
  _Block_release(v22);

  if (v24)
  {
    OUTLINED_FUNCTION_20();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_26();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_28();
    sub_1A2BAB6C8(v25, v26, v27, v28, v29, v30);
    swift_release();
    swift_bridgeObjectRelease();

    swift_release();
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();

    swift_release();
  }
  return v6;
}

uint64_t sub_1A2BDA938()
{
  sub_1A2BDA96C();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1A2BDA96C()
{
  OUTLINED_FUNCTION_3_23();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v1 + 136);
  uint64_t v3 = swift_retain();
  atomic_store(1u, (unsigned __int8 *)v2(v3));
  swift_release();
  swift_beginAccess();
  return notify_cancel(*(_DWORD *)(v0 + 48));
}

uint64_t sub_1A2BDA9EC()
{
  state64[4] = *MEMORY[0x1E4F143B8];
  state64[0] = 0;
  swift_beginAccess();
  if (!notify_get_state(*(_DWORD *)(v0 + 48), state64)) {
    return state64[0];
  }
  if (qword_1E9596038 != -1) {
    swift_once();
  }
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2BAB6C8(0xD000000000000020, 0x80000001A2C170F0, 0xD00000000000006ALL, 0x80000001A2C16FF0, 0x53746E6572727563, 0xEC00000065746174);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1A2BDAB70()
{
  OUTLINED_FUNCTION_3_23();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v1 + 136);
  uint64_t v3 = swift_retain();
  LOBYTE(v2) = atomic_load((unsigned __int8 *)v2(v3));
  uint64_t result = swift_release();
  if ((v2 & 1) == 0)
  {
    uint64_t v5 = sub_1A2BDA9EC();
    uint64_t v7 = v6 & 1;
    if (qword_1E9596038 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_20();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5542B8);
    sub_1A2C0D4F0();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2BAB6F8(0x6E69796669746F4ELL, 0xEF3A656D616E2067, 0xD00000000000006ALL, 0x80000001A2C16FF0, 0xD000000000000014, 0x80000001A2C170D0);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v5, v7);
  }
  return result;
}

uint64_t sub_1A2BDAD4C()
{
  if (qword_1E9596038 != -1) {
    swift_once();
  }
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2BAB6F8(0xD00000000000001ALL, 0x80000001A2C170B0, 0xD00000000000006ALL, 0x80000001A2C16FF0, 0xD00000000000001ALL, 0x80000001A2C17060);
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  sub_1A2BDAB70();
  return swift_release();
}

uint64_t sub_1A2BDAE74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1A2BDAEC8()
{
  sub_1A2BDA938();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t type metadata accessor for DarwinNotificationObserver()
{
  return self;
}

uint64_t sub_1A2BDAF20()
{
  swift_bridgeObjectRelease();
  swift_unownedRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2BDAF60()
{
  return sub_1A2BDAD4C();
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_1A2BDAFB0()
{
  OUTLINED_FUNCTION_2_0();
  v1[6] = v2;
  v1[7] = v0;
  v1[5] = v3;
  type metadata accessor for StagedMessage();
  v1[8] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596270);
  v1[9] = v4;
  v1[10] = *(void *)(v4 - 8);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596358);
  v1[12] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v1[13] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1A2BDB0FC;
  return sub_1A2BCA8C4();
}

uint64_t sub_1A2BDB0FC()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A2BDB1DC, v2, 0);
}

uint64_t sub_1A2BDB1DC()
{
  v0[14] = sub_1A2C0D290();
  v0[15] = sub_1A2C0D320();
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  sub_1A2C0D330();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_1();
    return v3();
  }
  else
  {
    uint64_t v5 = OUTLINED_FUNCTION_1_29();
    v6(v5);
    sub_1A2C0D350();
    OUTLINED_FUNCTION_2_29();
    uint64_t v10 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[16] = v8;
    void *v8 = v0;
    v8[1] = sub_1A2BDB478;
    uint64_t v9 = OUTLINED_FUNCTION_5_19();
    return v10(v9);
  }
}

uint64_t sub_1A2BDB478()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v5 = v4;
  *(unsigned char *)(v7 + 136) = v6;
  swift_task_dealloc();
  sub_1A2B9BE1C(v2);
  return MEMORY[0x1F4188298](sub_1A2BDB57C, v3, 0);
}

uint64_t sub_1A2BDB57C()
{
  if (*(unsigned __int8 *)(v0 + 136) < 2u && (sub_1A2C0D310() & 1) == 0)
  {
    if (qword_1EB554570 != -1) {
      swift_once();
    }
    sub_1A2BAB6C8(0xD000000000000019, 0x80000001A2C171E0, 0xD00000000000007ALL, 0x80000001A2C17140, 0xD000000000000013, 0x80000001A2C11350);
  }
  char v1 = *(unsigned char *)(v0 + 136);
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  if (((v1 - 1) & 0xFD) != 0
    && (uint64_t v2 = *(void *)(v0 + 96),
        uint64_t v3 = *(void *)(v0 + 72),
        sub_1A2C0D330(),
        __swift_getEnumTagSinglePayload(v2, 1, v3) != 1))
  {
    uint64_t v6 = OUTLINED_FUNCTION_1_29();
    v7(v6);
    sub_1A2C0D350();
    OUTLINED_FUNCTION_2_29();
    uint64_t v11 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1A2BDB478;
    uint64_t v10 = OUTLINED_FUNCTION_5_19();
    return v11(v10);
  }
  else
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_3_1();
    return v4();
  }
}

uint64_t sub_1A2BDB7A0()
{
  *(void *)(v1 + 40) = v0;
  return MEMORY[0x1F4188298](sub_1A2BDB7C0, v0, 0);
}

uint64_t sub_1A2BDB7C0()
{
  sub_1A2C0D2A0();
  OUTLINED_FUNCTION_3_1();
  return v0();
}

uint64_t sub_1A2BDB950()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A2B683B8;
  return sub_1A2BDAFB0();
}

uint64_t sub_1A2BDB9F8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A2B68040;
  return sub_1A2BDB7A0();
}

unint64_t sub_1A2BDBA88(uint64_t a1)
{
  unint64_t result = sub_1A2BDBAB0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A2BDBAB0()
{
  unint64_t result = qword_1E9596340;
  if (!qword_1E9596340)
  {
    type metadata accessor for MessageStagingStream();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9596340);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_29()
{
  return *(void *)(v0 + 88);
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_1A2BDBB4C()
{
  OUTLINED_FUNCTION_2_0();
  v1[6] = v0;
  uint64_t v2 = sub_1A2C0CDA0();
  v1[7] = v2;
  OUTLINED_FUNCTION_0_8(v2);
  v1[8] = v3;
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A2BDBBF4, v0, 0);
}

uint64_t sub_1A2BDBBF4()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  sub_1A2C0CD90();
  sub_1A2C0CD40();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v0[11] = v5;
  v0[12] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v3);
  uint64_t v6 = swift_task_alloc();
  v0[13] = v6;
  *(void *)(v6 + 16) = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1A2BDBCFC;
  return sub_1A2BDC8CC();
}

uint64_t sub_1A2BDBCFC()
{
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v8 + 120) = v7;
  *(void *)(v8 + 128) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v10 = sub_1A2BDBFD4;
  }
  else {
    uint64_t v10 = sub_1A2BDBE44;
  }
  return MEMORY[0x1F4188298](v10, v9, 0);
}

void sub_1A2BDBE44()
{
  if (qword_1EB554570 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[15];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[11];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[7];
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  v0[5] = v1;
  sub_1A2C0DD60();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  sub_1A2C0D530();
  OUTLINED_FUNCTION_10();
  sub_1A2BAB6E0(v5, 0x80000001A2C17310, v6, v7, v8, 0x80000001A2C172F0);
  swift_bridgeObjectRelease();
  v2(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_22();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1A2BDBFD4()
{
  (*(void (**)(void, void))(v0 + 88))(*(void *)(v0 + 80), *(void *)(v0 + 56));
  if (qword_1EB554570 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = sub_1A2C0DB60();
  OUTLINED_FUNCTION_6_21(v2, v3, v4, v5, v6, v7, v8, v9, v16, 0, 0xE000000000000000);
  OUTLINED_FUNCTION_11();
  sub_1A2C0D530();
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
  sub_1A2C0DC40();
  unint64_t v10 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_10();
  sub_1A2BAB6C8(v11, v10, v12, v13, 0xD00000000000001DLL, 0x80000001A2C172F0);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_1();
  return v14();
}

uint64_t sub_1A2BDC148()
{
  OUTLINED_FUNCTION_2_0();
  *(void *)(v1 + 48) = v0;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_1E9597118 + dword_1E9597118);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  void *v2 = v1;
  v2[1] = sub_1A2BDC1EC;
  return v4(v0);
}

uint64_t sub_1A2BDC1EC()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 48);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v7 = v6;
  *(void *)(v9 + 64) = v8;
  *(void *)(v9 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v10 = sub_1A2BDC43C;
  }
  else {
    unint64_t v10 = sub_1A2BDC2E8;
  }
  return MEMORY[0x1F4188298](v10, v5, 0);
}

uint64_t sub_1A2BDC2E8()
{
  if (qword_1EB554570 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 64);
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 40) = v1;
  sub_1A2C0DD60();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  sub_1A2C0D530();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_20();
  sub_1A2BAB6E0(v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_1();
  return v8();
}

uint64_t sub_1A2BDC43C()
{
  if (qword_1EB554570 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = sub_1A2C0DB60();
  OUTLINED_FUNCTION_6_21(v2, v3, v4, v5, v6, v7, v8, v9, v18, 0, 0xE000000000000000);
  OUTLINED_FUNCTION_11();
  sub_1A2C0D530();
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
  sub_1A2C0DC40();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_20();
  sub_1A2BAB6C8(v10, v11, v12, v13, v14, v15);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_3_1();
  return v16();
}

uint64_t sub_1A2BDC580(uint64_t a1)
{
  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596358);
  v1[3] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v1[4] = v2;
  void *v2 = v1;
  v2[1] = sub_1A2BDC644;
  return sub_1A2BCA8C4();
}

uint64_t sub_1A2BDC644()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A2BDC728, v2, 0);
}

void sub_1A2BDC728()
{
  sub_1A2C0D290();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_1A2C0D320();
  sub_1A2C0D330();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596270);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) != 1)
  {
    do
    {
      uint64_t v3 = *(void *)(v0 + 24);
      sub_1A2B5AF94(v3, &qword_1E9596358);
      sub_1A2C0D310();
      sub_1A2C0D330();
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596270);
    }
    while (__swift_getEnumTagSinglePayload(v3, 1, v4) != 1);
  }
  swift_release();
  sub_1A2C0D2A0();
  sub_1A2C0D300();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_4_22();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_1A2BDC8CC()
{
  OUTLINED_FUNCTION_2_0();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596270);
  v1[5] = v4;
  OUTLINED_FUNCTION_0_8(v4);
  v1[6] = v5;
  v1[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596358);
  v1[8] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v1[9] = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1A2BDC9C8;
  return sub_1A2BCA8C4();
}

uint64_t sub_1A2BDC9C8()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A2BDCAAC, v2, 0);
}

uint64_t sub_1A2BDCAAC()
{
  sub_1A2C0D290();
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  sub_1A2C0D320();
  sub_1A2C0D330();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) != 1)
  {
    uint64_t v3 = v0[6];
    uint64_t v4 = *(void (**)(uint64_t, void, void))(v3 + 32);
    do
    {
      uint64_t v5 = v0[7];
      uint64_t v6 = (uint64_t (*)(uint64_t))v0[2];
      v4(v5, v0[8], v0[5]);
      if (v6(v5)) {
        sub_1A2C0D310();
      }
      uint64_t v7 = v0[8];
      uint64_t v8 = v0[5];
      (*(void (**)(void, uint64_t))(v3 + 8))(v0[7], v8);
      sub_1A2C0D330();
    }
    while (__swift_getEnumTagSinglePayload(v7, 1, v8) != 1);
  }
  swift_release();
  sub_1A2C0D2A0();
  sub_1A2C0D300();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = OUTLINED_FUNCTION_59_0();
  return v10(v9);
}

uint64_t sub_1A2BDCC9C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for StagedMessage();
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A2C0CDA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596270);
  sub_1A2C0D350();
  sub_1A2BAAE64((uint64_t)&v6[*(int *)(v4 + 36)], (uint64_t)v2);
  sub_1A2B9BE1C((uint64_t)v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v7) == 1)
  {
    sub_1A2B5AF94((uint64_t)v2, &qword_1EB554320);
    char v11 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v2, v7);
    char v11 = sub_1A2C0CD50();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11 & 1;
}

uint64_t sub_1A2BDCE8C()
{
  return sub_1A2BDCC9C();
}

void OUTLINED_FUNCTION_6_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(v11 + 16) = a10;
  *(void *)(v11 + 24) = a11;
}

uint64_t sub_1A2BDCEDC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1A2BDCEE4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Timestamp()
{
  return &type metadata for Timestamp;
}

BOOL sub_1A2BDCF00(unint64_t a1, char a2, unint64_t a3, char a4)
{
  unint64_t Nanoseconds = a1;
  if ((a2 & 1) == 0) {
    unint64_t Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a1);
  }
  if ((a4 & 1) == 0) {
    a3 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a3);
  }
  return Nanoseconds < a3;
}

uint64_t sub_1A2BDCF58(uint64_t a1, int a2, uint64_t a3, char a4)
{
  return (((a4 & 1) == 0) ^ a2) & (a1 == a3);
}

BOOL sub_1A2BDCF74(uint64_t a1, uint64_t a2)
{
  return sub_1A2BDCF00(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

BOOL sub_1A2BDCF90(uint64_t a1, uint64_t a2)
{
  return sub_1A2BCB87C(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

BOOL sub_1A2BDCFAC(uint64_t a1, uint64_t a2)
{
  return sub_1A2BCB90C(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

BOOL sub_1A2BDCFC8(uint64_t a1, uint64_t a2)
{
  return sub_1A2BCB9E4(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_1A2BDCFE4(uint64_t a1, uint64_t a2)
{
  return sub_1A2BDCF58(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

unint64_t sub_1A2BDD004()
{
  unint64_t result = qword_1E9597130;
  if (!qword_1E9597130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597130);
  }
  return result;
}

uint64_t sub_1A2BDD050(uint64_t a1, unint64_t a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_46;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v3;
      }
      uint64_t v31 = BYTE6(a2);
      unint64_t v30 = HIDWORD(a1);
      uint64_t v47 = MEMORY[0x1E4FBC860];
      uint64_t v8 = v5 & ~(v5 >> 63);
      sub_1A2BE0384();
      uint64_t v9 = a1;
      uint64_t v3 = v47;
      char v32 = a2;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v10 = (int)a1;
        }
        else {
          uint64_t v10 = *(void *)(a1 + 16);
        }
        if (v5 < 0)
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
        }
      }
      else
      {
        if (v5 < 0) {
          goto LABEL_48;
        }
        uint64_t v10 = 0;
      }
      unint64_t v28 = a2 >> 16;
      unint64_t v29 = a2 >> 8;
      unint64_t v26 = HIDWORD(a2);
      unint64_t v27 = a2 >> 24;
      unint64_t v25 = a2 >> 40;
      int v34 = v2;
      do
      {
        if (!v8)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v10 < (int)a1 || v10 >= a1 >> 32) {
              goto LABEL_39;
            }
            uint64_t v12 = sub_1A2C0CB70();
            if (!v12) {
              goto LABEL_49;
            }
            uint64_t v13 = v12;
            uint64_t v14 = sub_1A2C0CB90();
            uint64_t v15 = v10 - v14;
            if (__OFSUB__(v10, v14)) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v10 < *(void *)(v9 + 16)) {
              goto LABEL_41;
            }
            if (v10 >= *(void *)(v9 + 24)) {
              goto LABEL_43;
            }
            uint64_t v17 = sub_1A2C0CB70();
            if (!v17) {
              goto LABEL_50;
            }
            uint64_t v13 = v17;
            uint64_t v18 = sub_1A2C0CB90();
            uint64_t v15 = v10 - v18;
            if (__OFSUB__(v10, v18)) {
              goto LABEL_44;
            }
          }
          char v16 = *(unsigned char *)(v13 + v15);
          uint64_t v9 = a1;
        }
        else
        {
          if (v10 >= v31) {
            goto LABEL_40;
          }
          char v35 = v9;
          __int16 v36 = *(_WORD *)((char *)&a1 + 1);
          char v37 = BYTE3(a1);
          char v38 = v30;
          __int16 v39 = *(_WORD *)((char *)&a1 + 5);
          char v40 = HIBYTE(a1);
          char v41 = v32;
          char v42 = v29;
          char v43 = v28;
          char v44 = v27;
          char v45 = v26;
          char v46 = v25;
          char v16 = *(&v35 + v10);
        }
        __swift_instantiateConcreteTypeFromMangledName(qword_1E9597140);
        uint64_t v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = xmmword_1A2C1B9E0;
        *(void *)(v19 + 56) = MEMORY[0x1E4FBC358];
        *(void *)(v19 + 64) = MEMORY[0x1E4FBC3B0];
        *(unsigned char *)(v19 + 32) = v16;
        uint64_t v20 = sub_1A2C0D490();
        uint64_t v22 = v21;
        uint64_t v47 = v3;
        unint64_t v2 = *(void *)(v3 + 16);
        if (v2 >= *(void *)(v3 + 24) >> 1)
        {
          sub_1A2BE0384();
          uint64_t v9 = a1;
          uint64_t v3 = v47;
        }
        *(void *)(v3 + 16) = v2 + 1;
        uint64_t v23 = v3 + 16 * v2;
        *(void *)(v23 + 32) = v20;
        *(void *)(v23 + 40) = v22;
        ++v10;
        --v8;
        --v5;
        LODWORD(v2) = v34;
      }
      while (v5);
      return v3;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_47;
    case 3uLL:
      return v3;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

void sub_1A2BDD400()
{
  sub_1A2BDDA8C();
  uint64_t v0 = (void *)sub_1A2C0CFD0();
  if (v0)
  {
    id v8 = v0;
    id v1 = objc_msgSend(v0, sel_whichEvent_Type);
    switch((unint64_t)v1)
    {
      case 'e':
        int v2 = OUTLINED_FUNCTION_1_30();
        sub_1A2BDDCAC(v2, v3);
        goto LABEL_11;
      case 'f':
        uint64_t v4 = OUTLINED_FUNCTION_1_30();
        sub_1A2BDDDB4(v4, v5);
        goto LABEL_11;
      case 'g':
        uint64_t v6 = OUTLINED_FUNCTION_1_30();
        sub_1A2BDDACC(v6, v7);
        goto LABEL_11;
      case 'h':
        goto LABEL_11;
      default:
        if (v1)
        {
          if (qword_1E95963D0 != -1) {
            swift_once();
          }
          OUTLINED_FUNCTION_20();
          sub_1A2C0DB60();
          sub_1A2C0D530();
          objc_msgSend(v8, sel_whichEvent_Type);
          type metadata accessor for SUTSchemaTestExecutionEvent_WhichEvent_Type(0);
          sub_1A2C0DC40();
          sub_1A2BAB6C8(v9, v10, 0xD000000000000062, 0x80000001A2C17370, 0x28737365636F7270, 0xEB00000000293A5FLL);
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_11:
        }
        break;
    }
  }
}

uint64_t sub_1A2BDD5D8()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1A2C0CE20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v22[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1A2C0CFB0();
  if (result)
  {
    id v8 = (void *)result;
    sub_1A2C0D030();

    uint64_t v9 = *v1;
    if (*(void *)(*v1 + 16))
    {
      unint64_t v10 = sub_1A2B54F70();
      if (v11)
      {
        uint64_t v12 = *(void *)(v9 + 56) + 24 * v10;
        uint64_t v13 = *(void *)(v12 + 8);
        unint64_t v14 = *(void *)(v12 + 16);
        goto LABEL_10;
      }
    }
    uint64_t result = sub_1A2C0CFB0();
    if (result)
    {
      uint64_t v15 = (void *)result;
      unint64_t v16 = sub_1A2C0D050();

      sub_1A2BDE52C((uint64_t)v22, v16, v16, v1[3]);
      if (v23) {
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
      uint64_t v17 = v1[2];
      if (!*(void *)(v17 + 16)) {
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
      unint64_t v18 = sub_1A2B552C8(v22[0], v22[1]);
      if ((v19 & 1) == 0) {
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
      uint64_t v20 = (uint64_t *)(*(void *)(v17 + 56) + 16 * v18);
      uint64_t v13 = *v20;
      unint64_t v14 = v20[1];
LABEL_10:
      sub_1A2B3EA44(v13, v14);
      sub_1A2C0CD10();
      sub_1A2C0CF90();
      sub_1A2B3EB94(v13, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1A2BDD7D8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = result;
  BOOL v6 = result == a3;
  if (result < a3)
  {
    a2 = a3 - 1;
    BOOL v6 = a3 - 1 == result;
    if (a3 - 1 >= result) {
      return result;
    }
    __break(1u);
  }
  unint64_t v7 = a2;
  if (v6)
  {
    if (qword_1E95963D0 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_20();
    sub_1A2C0DB60();
    sub_1A2C0D530();
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_24();
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_30();
    sub_1A2BAB6C8(v8, v9, v10, v11, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
    if (v7 == a4)
    {
      OUTLINED_FUNCTION_20();
      sub_1A2C0DB60();
      sub_1A2C0D530();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_24();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_30();
      sub_1A2BAB6C8(v14, v15, v16, v17, v18, v19);
      swift_bridgeObjectRelease();
      return v5;
    }
    if (v7 < a4) {
      return v5;
    }
    if (a4 != -1)
    {
      if (a4 + 1 <= v7) {
        return v5;
      }
      goto LABEL_22;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    return result;
  }
  if (!result)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (result - 1 < a3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return a3;
}

unint64_t sub_1A2BDDA8C()
{
  unint64_t result = qword_1E95963A8;
  if (!qword_1E95963A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E95963A8);
  }
  return result;
}

void sub_1A2BDDACC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1A2C0CE20();
  uint64_t v6 = *(void *)(v5 - 8);
  double v7 = MEMORY[0x1F4188790](v5);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a2, sel_metadata, v7);
  if (!v10) {
    return;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_fingerprint);

  if (!v12) {
    return;
  }
  uint64_t v13 = sub_1A2BDE7D4(v12);
  if (v14 >> 60 == 15) {
    return;
  }
  uint64_t v15 = v13;
  unint64_t v16 = v14;
  uint64_t v17 = sub_1A2C0CFB0();
  if (!v17)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v18 = (void *)v17;
  sub_1A2C0D030();

  uint64_t v19 = sub_1A2C0CFB0();
  if (!v19)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v20 = (void *)v19;
  unint64_t v21 = sub_1A2C0D050();

  uint64_t v22 = *v3;
  if (*(void *)(*v3 + 16)
    && (unint64_t v23 = sub_1A2B54F70(), (v24 & 1) != 0)
    && *(void *)(*(void *)(v22 + 56) + 24 * v23) < v21)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    sub_1A2B48634(v15, v16);
  }
  else
  {
    sub_1A2B8258C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

void sub_1A2BDDCAC(int a1, id a2)
{
  id v2 = objc_msgSend(a2, sel_metadata);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_fingerprint);

    if (v4)
    {
      uint64_t v5 = sub_1A2BDE7D4(v4);
      if (v6 >> 60 != 15)
      {
        uint64_t v7 = v5;
        unint64_t v8 = v6;
        uint64_t v9 = sub_1A2C0CFB0();
        if (v9)
        {
          id v10 = (void *)v9;
          uint64_t v11 = sub_1A2C0D050();

          sub_1A2B3EA44(v7, v8);
          sub_1A2B825E0(v11, v7, v8);
          sub_1A2B48634(v7, v8);
          sub_1A2B48634(v7, v8);
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

void sub_1A2BDDDB4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  double v6 = MEMORY[0x1F4188790](v5 - 8);
  unint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(a2, sel_metadata, v6);
  if (!v9) {
    return;
  }
  id v10 = v9;
  id v11 = objc_msgSend(v9, sel_fingerprint);

  if (!v11) {
    return;
  }
  uint64_t v12 = sub_1A2BDE7D4(v11);
  if (v13 >> 60 == 15) {
    return;
  }
  uint64_t v14 = v12;
  unint64_t v15 = v13;
  uint64_t v16 = sub_1A2C0CFB0();
  if (!v16)
  {
    __break(1u);
    return;
  }
  uint64_t v17 = (void *)v16;
  unint64_t v18 = sub_1A2C0D050();

  uint64_t v19 = *(void *)(v3 + 8);
  sub_1A2B3EA44(v14, v15);
  unint64_t v20 = sub_1A2B80780(v14, v15, v19);
  char v22 = v21;
  sub_1A2B48634(v14, v15);
  if (v22)
  {
    sub_1A2C0CD10();
    uint64_t v23 = sub_1A2C0CE20();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v23) != 1)
    {
      sub_1A2C0CDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v8, v23);
      if (qword_1E95963D0 != -1) {
        swift_once();
      }
      uint64_t v39 = 0;
      uint64_t v40 = 0xE000000000000000;
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      uint64_t v39 = 0xD00000000000002CLL;
      uint64_t v40 = 0x80000001A2C174F0;
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      uint64_t v24 = v39;
      unint64_t v25 = v40;
      goto LABEL_15;
    }
    sub_1A2B3C61C((uint64_t)v8);
    uint64_t v39 = sub_1A2BDD050(v14, v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
    sub_1A2B3EA9C();
    unint64_t v20 = 0xE000000000000000;
    sub_1A2C0D440();
    swift_bridgeObjectRelease();
    if (qword_1E95963D0 == -1)
    {
LABEL_11:
      uint64_t v39 = 0;
      uint64_t v40 = v20;
      sub_1A2C0DB60();
      sub_1A2C0D530();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      uint64_t v24 = v39;
      unint64_t v25 = v40;
LABEL_15:
      sub_1A2BAB6C8(v24, v25, 0xD000000000000062, 0x80000001A2C17370, 0xD00000000000001ALL, 0x80000001A2C174D0);
      sub_1A2B48634(v14, v15);
      swift_bridgeObjectRelease();
      return;
    }
LABEL_24:
    swift_once();
    goto LABEL_11;
  }
  sub_1A2BCA0FC(v14, v15);
  if (v18 < v20)
  {
    __break(1u);
    goto LABEL_24;
  }
  sub_1A2BDE3A8(v20, v18, (uint64_t)v38);
  sub_1A2BDE844((uint64_t)v38, (uint64_t)&v39);
  if (v43)
  {
    sub_1A2B82650();
  }
  else
  {
    uint64_t v26 = v39;
    uint64_t v27 = v40;
    uint64_t v28 = *(void *)(v3 + 16);
    if (*(void *)(v28 + 16) && (uint64_t v29 = v41, v30 = v42, v31 = sub_1A2B552C8(v39, v40), (v32 & 1) != 0))
    {
      v36[1] = v30;
      v36[2] = v29;
      unint64_t v33 = (uint64_t *)(*(void *)(v28 + 56) + 16 * v31);
      uint64_t v35 = *v33;
      unint64_t v34 = v33[1];
      sub_1A2B3EA44(*v33, v34);
      sub_1A2BCA1E8(v26, v27, &v37);
      sub_1A2B48634(v37, *((unint64_t *)&v37 + 1));
      sub_1A2B3EA44(v35, v34);
      sub_1A2B82650();
      sub_1A2B82650();
      sub_1A2B3EB94(v35, v34);
    }
    else
    {
      if (qword_1E95963D0 != -1) {
        swift_once();
      }
      *(void *)&long long v37 = 0;
      *((void *)&v37 + 1) = 0xE000000000000000;
      sub_1A2C0DB60();
      sub_1A2C0D530();
      sub_1A2BDE8AC();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      sub_1A2BAB6C8(v37, *((unint64_t *)&v37 + 1), 0xD000000000000062, 0x80000001A2C17370, 0xD00000000000001ALL, 0x80000001A2C174D0);
      swift_bridgeObjectRelease();
      sub_1A2B48634(v14, v15);
    }
  }
}

void sub_1A2BDE3A8(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = v3;
  v27[0] = a1;
  v27[1] = a2;
  uint64_t v9 = *v4;
  unint64_t v8 = (void (*)(uint64_t *, uint64_t *, void *, void *))v4[1];
  uint64_t v10 = sub_1A2BDE52C((uint64_t)&v24, a1, a2, *v4);
  unint64_t v11 = v10;
  char v18 = v26;
  if (v26)
  {
    if (*(void *)(v9 + 16) < v10)
    {
      __break(1u);
    }
    else if ((v10 & 0x8000000000000000) == 0)
    {
      sub_1A2BDE6BC(v10, v10, a1, a2);
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
LABEL_9:
      *(void *)a3 = v12;
      *(void *)(a3 + 8) = v13;
      *(void *)(a3 + 16) = v14;
      *(void *)(a3 + 24) = v15;
      *(void *)(a3 + 32) = v16;
      *(void *)(a3 + 40) = v17;
      *(unsigned char *)(a3 + 48) = v18;
      return;
    }
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v12 = v24;
  uint64_t v13 = v25;
  v23[0] = v24;
  v23[1] = v25;
  v8(&v21, &v19, v23, v27);
  sub_1A2BDE630(v11);
  if (*(void *)(*v4 + 16) < (int64_t)v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v16 = v19;
  uint64_t v17 = v20;
  sub_1A2BDE6BC(v11, v11, v19, v20);
  if (*(void *)(*v4 + 16) >= v11)
  {
    uint64_t v14 = v21;
    uint64_t v15 = v22;
    sub_1A2BDE6BC(v11, v11, v21, v22);
    goto LABEL_9;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1A2BDE52C(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a4 + 16);
  if ((unint64_t)v4 >= 2)
  {
    int64_t v5 = 0;
    uint64_t v6 = v4 - 1;
    uint64_t v7 = a4 + 32;
    int64_t v8 = v4 - 1;
    do
    {
      uint64_t v9 = v6 / 2;
      if (v6 < -1 || v9 >= v4)
      {
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      long long v11 = *(_OWORD *)(v7 + 16 * v9);
      if ((unint64_t)v11 <= a3 && *((void *)&v11 + 1) >= a2)
      {
        *(_OWORD *)unint64_t result = *(_OWORD *)(v7 + 16 * v9);
        *(unsigned char *)(result + 16) = 0;
        return v9;
      }
      if ((unint64_t)v11 <= a3) {
        uint64_t v13 = v8;
      }
      else {
        uint64_t v13 = v9 - 1;
      }
      if (*((void *)&v11 + 1) >= a2) {
        int64_t v8 = v13;
      }
      else {
        int64_t v5 = v9 + 1;
      }
      uint64_t v6 = v5 + v8;
      if (__OFADD__(v5, v8)) {
        goto LABEL_35;
      }
    }
    while (v5 < v8);
    if (v5 < v4) {
      goto LABEL_23;
    }
    goto LABEL_30;
  }
  int64_t v5 = 0;
  if (v4 != 1)
  {
LABEL_30:
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
    return v5;
  }
LABEL_23:
  if (v5 < v4)
  {
    long long v14 = *(_OWORD *)(a4 + 16 * v5 + 32);
    if ((unint64_t)v14 <= a3 && *((void *)&v14 + 1) >= a2)
    {
      *(_OWORD *)unint64_t result = *(_OWORD *)(a4 + 16 * v5 + 32);
      *(unsigned char *)(result + 16) = 0;
      return v5;
    }
    if (*((void *)&v14 + 1) < a2)
    {
      uint64_t v9 = v5 + 1;
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 1;
      return v9;
    }
    goto LABEL_30;
  }
LABEL_36:
  __break(1u);
  return result;
}

void sub_1A2BDE630(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A2BDE7C0();
    uint64_t v3 = v6;
  }
  unint64_t v4 = *(void *)(v3 + 16);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    sub_1A2BDF334((char *)(v3 + 16 * a1 + 48), v4 - 1 - a1, (char *)(v3 + 16 * a1 + 32));
    *(void *)(v3 + 16) = v5;
    *id v1 = v3;
  }
}

void sub_1A2BDE6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v10 > *(void *)(v6 + 24) >> 1)
  {
    sub_1A2B86FC0();
    uint64_t v6 = v13;
  }
  uint64_t v14 = v6 + 32 + 16 * a1;
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v15 = *(void *)(v6 + 16);
  if (__OFSUB__(v15, a2)) {
    goto LABEL_19;
  }
  sub_1A2BDF334((char *)(v6 + 32 + 16 * a2), v15 - a2, (char *)(v14 + 16));
  uint64_t v16 = *(void *)(v6 + 16);
  BOOL v17 = __OFADD__(v16, v10);
  uint64_t v18 = v16 + v10;
  if (!v17)
  {
    *(void *)(v6 + 16) = v18;
LABEL_13:
    *(void *)uint64_t v14 = a3;
    *(void *)(v14 + 8) = a4;
    *unint64_t v4 = v6;
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_1A2BDE7C0()
{
}

uint64_t sub_1A2BDE7D4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_value);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1A2C0CD30();

  return v3;
}

uint64_t sub_1A2BDE844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9597138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2BDE8AC()
{
  return 0;
}

uint64_t destroy for SUTProcessor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SUTProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SUTProcessor(void *a1, void *a2)
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
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SUTProcessor(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SUTProcessor(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
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

uint64_t storeEnumTagSinglePayload for SUTProcessor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SUTProcessor()
{
  return &type metadata for SUTProcessor;
}

uint64_t destroy for SUTProcessor.EventMetadata(uint64_t a1)
{
  return sub_1A2B3EB94(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

void *_s13SiriAnalytics12SUTProcessorV13EventMetadataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  unint64_t v4 = a2[2];
  sub_1A2B3EA44(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for SUTProcessor.EventMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = a2[2];
  sub_1A2B3EA44(v3, v4);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_1A2B3EB94(v5, v6);
  return a1;
}

uint64_t assignWithTake for SUTProcessor.EventMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  sub_1A2B3EB94(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUTProcessor.EventMetadata(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SUTProcessor.EventMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SUTProcessor.EventMetadata()
{
  return &type metadata for SUTProcessor.EventMetadata;
}

uint64_t sub_1A2BDED60()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1A2BDED9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_1A2BDEDE0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A2BDEE40(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for ClosedRangeSet()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_24()
{
  return sub_1A2C0D530();
}

uint64_t sub_1A2BDEEEC@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  if (!a2)
  {
    sub_1A2C0D530();
    sub_1A2C0D530();
    uint64_t v12 = *(void *)(a5 + 16);
    if (v12)
    {
      uint64_t v19 = a3;
      uint64_t v20 = a4;
      char v21 = a6;
      uint64_t v22 = MEMORY[0x1E4FBC860];
      sub_1A2BE0384();
      uint64_t v13 = (uint64_t *)(a5 + 40);
      do
      {
        uint64_t v14 = *(v13 - 1);
        uint64_t v15 = *v13;
        unint64_t v17 = *(void *)(v22 + 16);
        unint64_t v16 = *(void *)(v22 + 24);
        swift_bridgeObjectRetain();
        if (v17 >= v16 >> 1) {
          sub_1A2BE0384();
        }
        v13 += 3;
        *(void *)(v22 + 16) = v17 + 1;
        uint64_t v18 = v22 + 16 * v17;
        *(void *)(v18 + 32) = v14;
        *(void *)(v18 + 40) = v15;
        --v12;
      }
      while (v12);
      a6 = v21;
      a3 = v19;
      a4 = v20;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
    sub_1A2B3EA9C();
    sub_1A2C0D440();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t result = 1601725545;
    a2 = 0xE400000000000000;
  }
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(unsigned char *)(a7 + 40) = a6 & 1;
  return result;
}

uint64_t sub_1A2BDF0B4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v11 = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1A2BE0384();
    uint64_t v3 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = *(void *)(v10 + 16);
      unint64_t v6 = *(void *)(v10 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1) {
        sub_1A2BE0384();
      }
      v3 += 3;
      *(void *)(v10 + 16) = v7 + 1;
      uint64_t v8 = v10 + 16 * v7;
      *(void *)(v8 + 32) = v5;
      *(void *)(v8 + 40) = v4;
      --v2;
    }
    while (v2);
    sub_1A2BE03D4((uint64_t)&v11);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
  sub_1A2B3EA9C();
  sub_1A2C0D440();
  swift_bridgeObjectRelease();
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  swift_bridgeObjectRetain();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  swift_bridgeObjectRetain();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  return 0x20455441455243;
}

uint64_t sub_1A2BDF30C()
{
  return sub_1A2BDF0B4();
}

void sub_1A2BDF328(uint64_t a1, uint64_t a2)
{
}

char *sub_1A2BDF334(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

void sub_1A2BDF394(uint64_t a1, uint64_t a2)
{
}

char *sub_1A2BDF3A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A2C0DD20();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_1A2BDF440(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

char *sub_1A2BDF4A0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[64 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

char *sub_1A2BDF4FC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

char *sub_1A2BDF55C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

void sub_1A2BDF5B8(uint64_t a1, uint64_t a2)
{
}

char *sub_1A2BDF5D0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

char *sub_1A2BDF62C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

void sub_1A2BDF690(uint64_t a1, uint64_t a2)
{
}

void sub_1A2BDF6A8(uint64_t a1, uint64_t a2)
{
}

void sub_1A2BDF6C0(uint64_t a1, uint64_t a2)
{
}

void sub_1A2BDF6D8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    uint64_t v8 = OUTLINED_FUNCTION_2_31();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x1F4186420](v8);
    return;
  }
  OUTLINED_FUNCTION_13_12();
  if (v6
    && (__swift_instantiateConcreteTypeFromMangledName(v5), OUTLINED_FUNCTION_14(), v3 + *(void *)(v7 + 72) * v2 > v4))
  {
    if (v4 != v3)
    {
      uint64_t v8 = OUTLINED_FUNCTION_6_22();
      goto _swift_arrayInitWithTakeBackToFront;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(v5);
    uint64_t v9 = OUTLINED_FUNCTION_6_22();
    MEMORY[0x1F4186428](v9);
  }
}

void sub_1A2BDF7BC(uint64_t a1, uint64_t a2)
{
}

void sub_1A2BDF7D4(uint64_t a1, uint64_t a2)
{
}

void sub_1A2BDF7EC(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    uint64_t v8 = OUTLINED_FUNCTION_2_31();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x1F4186420](v8);
    return;
  }
  OUTLINED_FUNCTION_13_12();
  if (v6 && (v5(0), OUTLINED_FUNCTION_14(), v3 + *(void *)(v7 + 72) * v2 > v4))
  {
    if (v4 != v3)
    {
      uint64_t v8 = OUTLINED_FUNCTION_6_22();
      goto _swift_arrayInitWithTakeBackToFront;
    }
  }
  else
  {
    v5(0);
    uint64_t v9 = OUTLINED_FUNCTION_6_22();
    MEMORY[0x1F4186428](v9);
  }
}

char *sub_1A2BDF8D8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_2_31();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_31(a3, result);
  }
  return result;
}

char *sub_1A2BDF93C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A2C0DD20();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_1A2BDF9D0()
{
  OUTLINED_FUNCTION_11_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_9_16();
  if (!v4 & v3) {
    BOOL v5 = v2 > v1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BDFA70()
{
  OUTLINED_FUNCTION_11_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (v2 + 40 * v1 > v0 && v0 + 40 * v1 > v2)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BDFB20()
{
  OUTLINED_FUNCTION_11_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_9_16();
  if (!v4 & v3) {
    BOOL v5 = v2 > v1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BDFBC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1A2C0DD20();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A2BDFCA4()
{
  OUTLINED_FUNCTION_11_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (v2 + 24 * v1 > v0 && v0 + 24 * v1 > v2)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BDFD4C()
{
  OUTLINED_FUNCTION_11_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (v2 + 8 * v1 > v0 && v0 + 8 * v1 > v2)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BDFDF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (a3 + 8 * a2 > a1 && a1 + 8 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  sub_1A2C0D0A0();
  OUTLINED_FUNCTION_17_15();
  return swift_arrayInitWithCopy();
}

void *sub_1A2BDFEB8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = (void *)OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (&__dst[4 * a2] > __src && &__src[4 * a2] > __dst)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return memcpy(__dst, __src, 4 * a2);
}

uint64_t sub_1A2BDFF64()
{
  OUTLINED_FUNCTION_11_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  if (v2 + 48 * v1 > v0 && v0 + 48 * v1 > v2)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BE0014()
{
  OUTLINED_FUNCTION_11_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_9_16();
  if (!v4 & v3) {
    BOOL v5 = v2 > v1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A2BE00B4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9596B58) - 8) + 72) * a2,
         unint64_t v6 = a3 + v5,
         unint64_t v7 = a1 + v5,
         v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_1A2C0DD20();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A2BE01D0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_17_6();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_38_3();
    __break(1u);
    return result;
  }
  a4(0);
  OUTLINED_FUNCTION_14();
  uint64_t v8 = *(void *)(v7 + 72) * a2;
  unint64_t v9 = a3 + v8;
  unint64_t v10 = a1 + v8;
  if (v9 > a1 && v10 > a3)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_16_4();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_17_15();
  return swift_arrayInitWithCopy();
}

void *sub_1A2BE02A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A2C0DD20();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

void sub_1A2BE0384()
{
  sub_1A2BE0E48();
  void *v0 = v1;
}

uint64_t sub_1A2BE03D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A2BE0400(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2BE077C(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

void sub_1A2BE0420()
{
  sub_1A2BE0A20();
  void *v0 = v1;
}

void sub_1A2BE0470(char a1, uint64_t a2, char a3)
{
  sub_1A2BE0860(a1, a2, a3, *v3, &qword_1EB554270);
  *BOOL v3 = v4;
}

void sub_1A2BE04A0(char a1, uint64_t a2, char a3)
{
  sub_1A2BE0860(a1, a2, a3, *v3, &qword_1EB554280);
  *BOOL v3 = v4;
}

void sub_1A2BE04D0(char a1, uint64_t a2, char a3)
{
  sub_1A2BE0CA0(a1, a2, a3, *v3, &qword_1EB554658, MEMORY[0x1E4F27990], MEMORY[0x1E4F27990], MEMORY[0x1E4F27990]);
  *BOOL v3 = v4;
}

char *sub_1A2BE0534(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2BE093C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

void sub_1A2BE0554()
{
  sub_1A2BE0A20();
  void *v0 = v1;
}

size_t sub_1A2BE05A4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1A2BE0AF0(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

void sub_1A2BE05C4(char a1, uint64_t a2, char a3)
{
  sub_1A2BE0CA0(a1, a2, a3, *v3, &qword_1E9595B20, type metadata accessor for ComponentIdentifiersTable.Record, (uint64_t)type metadata accessor for ComponentIdentifiersTable.Record, (void (*)(void))type metadata accessor for ComponentIdentifiersTable.Record);
  *BOOL v3 = v4;
}

void sub_1A2BE0628()
{
  sub_1A2BE0F10();
  void *v0 = v1;
}

void sub_1A2BE0678()
{
  sub_1A2BE0E48();
  void *v0 = v1;
}

void sub_1A2BE06C8()
{
  sub_1A2BE0F10();
  void *v0 = v1;
}

void sub_1A2BE0718(char a1, uint64_t a2, char a3)
{
  sub_1A2BE0CA0(a1, a2, a3, *v3, &qword_1E9596198, (uint64_t (*)(void))type metadata accessor for IdentifiableTag, (uint64_t)type metadata accessor for IdentifiableTag, (void (*)(void))type metadata accessor for IdentifiableTag);
  *BOOL v3 = v4;
}

uint64_t sub_1A2BE077C(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596B80);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    sub_1A2BDF334((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2BDFB20();
  }
  swift_release();
  return v10;
}

void sub_1A2BE0860(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  if (a3)
  {
    OUTLINED_FUNCTION_3_13();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_11_5();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_10();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v12 = swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size((const void *)v12);
    *(void *)(v12 + 16) = v10;
    *(void *)(v12 + 24) = 2 * ((uint64_t)(v13 - 32) / 24);
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
  }
  if (a1)
  {
    sub_1A2BDF440((char *)(a4 + 32), v10, (char *)(v12 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2BDFCA4();
  }
  swift_release();
}

char *sub_1A2BE093C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E95961D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  size_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2BDF5D0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2BDFEB8(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_1A2BE0A20()
{
  OUTLINED_FUNCTION_10_14();
  if (v6)
  {
    OUTLINED_FUNCTION_3_13();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_11_5();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_10();
    }
  }
  OUTLINED_FUNCTION_15_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(v9);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  uint64_t v12 = OUTLINED_FUNCTION_12_12();
  if (v3)
  {
    v2(v12);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v12);
  }
  swift_release();
}

size_t sub_1A2BE0AF0(size_t result, int64_t a2, char a3, uint64_t a4)
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
LABEL_25:
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
  if (!v9)
  {
    size_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95971C8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9596B58) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9596B58) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = a4 + v16;
  if (v5)
  {
    sub_1A2BDF6D8(v17, v8);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2BE00B4(v17, v8, (unint64_t)v13 + v16);
  }
  swift_release();
  return (size_t)v13;
}

void sub_1A2BE0CA0(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t a7, void (*a8)(void))
{
  if (a3)
  {
    OUTLINED_FUNCTION_3_13();
    if (v13 != v14)
    {
      OUTLINED_FUNCTION_11_5();
      if (v13)
      {
LABEL_24:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_10();
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v15 = *(void *)(a4 + 16);
  if (v12 <= v15) {
    uint64_t v16 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v16 = v12;
  }
  if (!v16)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v17 = *(void *)(a6(0) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v18)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v21 - v19 == 0x8000000000000000 && v18 == -1) {
    goto LABEL_23;
  }
  v20[2] = v15;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v18);
LABEL_18:
  uint64_t v23 = *(void *)(a6(0) - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v25 = a4 + v24;
  if (a1)
  {
    sub_1A2BDF7EC(v25, v15);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2BE01D0(v25, v15, (unint64_t)v20 + v24, a8);
  }
  swift_release();
}

void sub_1A2BE0E48()
{
  OUTLINED_FUNCTION_10_14();
  if (v6)
  {
    OUTLINED_FUNCTION_3_13();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_11_5();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_10();
    }
  }
  OUTLINED_FUNCTION_15_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(v9);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  uint64_t v12 = OUTLINED_FUNCTION_12_12();
  if (v3)
  {
    v2(v12);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v12);
  }
  swift_release();
}

void sub_1A2BE0F10()
{
  OUTLINED_FUNCTION_10_14();
  if (v6)
  {
    OUTLINED_FUNCTION_3_13();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_11_5();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_10();
    }
  }
  OUTLINED_FUNCTION_15_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(v9);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  uint64_t v12 = OUTLINED_FUNCTION_12_12();
  if (v3)
  {
    v2(v12);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v12);
  }
  swift_release();
}

uint64_t destroy for SQLCreateIndex()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLCreateIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLCreateIndex(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for SQLCreateIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLCreateIndex(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
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

uint64_t storeEnumTagSinglePayload for SQLCreateIndex(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)size_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLCreateIndex()
{
  return &type metadata for SQLCreateIndex;
}

void *OUTLINED_FUNCTION_1_31@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return sub_1A2C0DD20();
}

uint64_t OUTLINED_FUNCTION_6_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  return v0;
}

unint64_t static UnifiedMessageStreamHelper.identifier()()
{
  uint64_t v1 = type metadata accessor for ResourceType(0);
  uint64_t v2 = OUTLINED_FUNCTION_18(v1);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A2C0CCF0();
  uint64_t v6 = OUTLINED_FUNCTION_18(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0_27();
  type metadata accessor for PersistentStorage();
  type metadata accessor for DataVault();
  sub_1A2BD1BE0();
  id v7 = sub_1A2B9C07C(v0);
  sub_1A2B9C1C8((uint64_t)v4);

  sub_1A2B51F90((uint64_t)v4);
  return 0xD000000000000014;
}

uint64_t static UnifiedMessageStreamHelper.ensureDirectoryExists(at:)()
{
  type metadata accessor for PersistentStorage();
  uint64_t result = sub_1A2BD1584();
  if ((result & 1) == 0)
  {
    if (qword_1EB556808 != -1) {
      swift_once();
    }
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    sub_1A2C0CC50();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2C0D530();
    sub_1A2BAB6C8(0x726F746365726944, 0xEA00000000002079, 0xD000000000000079, 0x80000001A2C175A0, 0xD00000000000001ALL, 0x80000001A2C17620);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static UnifiedMessageStreamHelper.fileURL()()
{
  uint64_t v1 = type metadata accessor for ResourceType(0);
  uint64_t v2 = OUTLINED_FUNCTION_18(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_0_27();
  uint64_t v3 = sub_1A2C0CCF0();
  uint64_t v4 = OUTLINED_FUNCTION_18(v3);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersistentStorage();
  type metadata accessor for DataVault();
  sub_1A2BD1BE0();
  id v7 = sub_1A2B9C07C((uint64_t)v6);
  sub_1A2B9C1C8(v0);

  sub_1A2B97744();
  return sub_1A2B51F90(v0);
}

id UnifiedMessageStreamHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id UnifiedMessageStreamHelper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnifiedMessageStreamHelper();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UnifiedMessageStreamHelper()
{
  return self;
}

id UnifiedMessageStreamHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnifiedMessageStreamHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1A2BE18FC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1;
    uint64_t v31 = MEMORY[0x1E4FBC860];
    sub_1A2BE0384();
    uint64_t v4 = v31;
    uint64_t v5 = sub_1A2B798A0(v3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      unint64_t v7 = v5;
      if (v5 < 1 << *(unsigned char *)(v3 + 32))
      {
        uint64_t v8 = v3 + 64;
        uint64_t v23 = v3 + 64;
        uint64_t v24 = v3;
        while ((*(void *)(v8 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
        {
          if (v6 != *(_DWORD *)(v3 + 36)) {
            goto LABEL_21;
          }
          uint64_t v26 = v2;
          int v27 = v6;
          uint64_t v9 = *(void *)(v3 + 48) + 24 * v7;
          uint64_t v10 = *(void *)(v9 + 8);
          uint64_t v28 = *(void *)v9;
          uint64_t v30 = v4;
          unsigned int v11 = *(unsigned __int8 *)(v9 + 16);
          int v12 = *(unsigned __int8 *)(v9 + 17);
          uint64_t v13 = *(void *)(v3 + 56) + 24 * v7;
          uint64_t v15 = *(void *)v13;
          unint64_t v14 = *(void *)(v13 + 8);
          uint64_t v16 = *(unsigned __int8 *)(v13 + 16);
          swift_bridgeObjectRetain();
          sub_1A2B3EA24(v15, v14, v16);
          swift_bridgeObjectRetain();
          sub_1A2B3EA24(v15, v14, v16);
          swift_bridgeObjectRelease();
          sub_1A2B3EB74(v15, v14, v16);
          if (v12) {
            int v17 = 256;
          }
          else {
            int v17 = 0;
          }
          uint64_t v4 = v30;
          uint64_t v29 = a2(v28, v10, v17 | v11, v15, v14, v16);
          uint64_t v19 = v18;
          swift_bridgeObjectRelease();
          sub_1A2B3EB74(v15, v14, v16);
          unint64_t v20 = *(void *)(v30 + 16);
          if (v20 >= *(void *)(v30 + 24) >> 1)
          {
            sub_1A2BE0384();
            uint64_t v4 = v30;
          }
          *(void *)(v4 + 16) = v20 + 1;
          uint64_t v21 = v4 + 16 * v20;
          *(void *)(v21 + 32) = v29;
          *(void *)(v21 + 40) = v19;
          uint64_t v3 = v24;
          if ((uint64_t)v7 >= -(-1 << *(unsigned char *)(v24 + 32))) {
            goto LABEL_22;
          }
          uint64_t v8 = v23;
          if ((*(void *)(v23 + 8 * (v7 >> 6)) & (1 << v7)) == 0) {
            goto LABEL_23;
          }
          if (v27 != *(_DWORD *)(v24 + 36)) {
            goto LABEL_24;
          }
          uint64_t v22 = sub_1A2C0DA90();
          uint64_t v2 = v26 - 1;
          if (v26 == 1) {
            return;
          }
          unint64_t v7 = v22;
          if ((v22 & 0x8000000000000000) == 0)
          {
            int v6 = *(_DWORD *)(v24 + 36);
            if (v22 < 1 << *(unsigned char *)(v24 + 32)) {
              continue;
            }
          }
          goto LABEL_25;
        }
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
    }
LABEL_25:
    __break(1u);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1A2BE1B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1A2BE1C18()
{
  return 542393683;
}

uint64_t sub_1A2BE1CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6 == 4 && (a5 | a4) == 0)
  {
    uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
  }
  else
  {
    sub_1A2C0D530();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A2B3EA24(a4, a5, a6);
    sub_1A2B86518();
    uint64_t v14 = *(void *)(*(void *)(a9 + 24) + 16);
    sub_1A2B867C0();
    uint64_t v15 = *(void *)(a9 + 24);
    *(void *)(v15 + 16) = v14 + 1;
    uint64_t v16 = v15 + 40 * v14;
    *(void *)(v16 + 32) = 64;
    *(void *)(v16 + 40) = 0xE100000000000000;
    *(void *)(v16 + 48) = a4;
    *(void *)(v16 + 56) = a5;
    *(unsigned char *)(v16 + 64) = a6;
    uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
  }
  return v18;
}

uint64_t sub_1A2BE1E6C(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, unint64_t a5, char a6)
{
  return sub_1A2BE1CDC(a1, a2, a3 & 0x1FF, a4, a5, a6, v6[2], v6[3], v6[4]);
}

uint64_t sub_1A2BE1E9C()
{
  return sub_1A2BE1C18();
}

uint64_t destroy for SQLSetValue(uint64_t result)
{
  if ((*(unsigned char *)(result + 32) & 0x78) == 0) {
    return sub_1A2B9E158(*(void *)result, *(void *)(result + 8), *(void *)(result + 16), *(void *)(result + 24), *(unsigned char *)(result + 32));
  }
  return result;
}

uint64_t initializeWithCopy for SQLSetValue(uint64_t a1, uint64_t *a2)
{
  char v3 = *((unsigned char *)a2 + 32);
  if ((v3 & 0x78) != 0)
  {
    long long v4 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  }
  else
  {
    uint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    uint64_t v7 = a2[2];
    unint64_t v8 = a2[3];
    sub_1A2B9E0E4(*a2, v6, v7, v8, v3);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v8;
    *(unsigned char *)(a1 + 32) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for SQLSetValue(uint64_t a1, long long *a2)
{
  char v4 = *((unsigned char *)a2 + 32);
  if ((*(unsigned char *)(a1 + 32) & 0x78) == 0)
  {
    if ((v4 & 0x78) == 0)
    {
      uint64_t v12 = *(void *)a2;
      unint64_t v13 = *((void *)a2 + 1);
      uint64_t v15 = *((void *)a2 + 2);
      unint64_t v14 = *((void *)a2 + 3);
      sub_1A2B9E0E4(*(void *)a2, v13, v15, v14, v4);
      uint64_t v16 = *(void *)a1;
      unint64_t v17 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      unint64_t v19 = *(void *)(a1 + 24);
      *(void *)a1 = v12;
      *(void *)(a1 + 8) = v13;
      *(void *)(a1 + 16) = v15;
      *(void *)(a1 + 24) = v14;
      char v20 = *(unsigned char *)(a1 + 32);
      *(unsigned char *)(a1 + 32) = v4;
      sub_1A2B9E158(v16, v17, v18, v19, v20);
      return a1;
    }
    sub_1A2B9E158(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
    goto LABEL_6;
  }
  if ((v4 & 0x78) != 0)
  {
LABEL_6:
    long long v9 = *a2;
    long long v10 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v10;
    return a1;
  }
  uint64_t v5 = *(void *)a2;
  unint64_t v6 = *((void *)a2 + 1);
  uint64_t v8 = *((void *)a2 + 2);
  unint64_t v7 = *((void *)a2 + 3);
  sub_1A2B9E0E4(*(void *)a2, v6, v8, v7, v4);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v4;
  return a1;
}

uint64_t assignWithTake for SQLSetValue(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  if ((v4 & 0x78) == 0)
  {
    char v5 = *(unsigned char *)(a2 + 32);
    if ((v5 & 0x78) == 0)
    {
      uint64_t v8 = *(void *)a1;
      unint64_t v9 = *(void *)(a1 + 8);
      uint64_t v10 = *(void *)(a1 + 16);
      unint64_t v11 = *(void *)(a1 + 24);
      long long v12 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v12;
      *(unsigned char *)(a1 + 32) = v5;
      sub_1A2B9E158(v8, v9, v10, v11, v4);
      return a1;
    }
    sub_1A2B9E158(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), v4);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLSetValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x1E && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 30);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 32) >> 2) & 0x1E | (*(unsigned __int8 *)(a1 + 32) >> 7)) ^ 0x1F;
  if (v3 >= 0x1E) {
    unsigned int v3 = -1;
  }
  if (v3 + 1 >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SQLSetValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 30;
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 32) = (4 * (a2 ^ 0x1F)) & 0xF8 | ((a2 ^ 0x1F) << 7);
    }
  }
  return result;
}

uint64_t sub_1A2BE2150(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 32);
  if (((v1 >> 2) & 0x1E) != 0) {
    return 32 - ((v1 >> 2) & 0x1E | (v1 >> 7));
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2BE2174(uint64_t result, unsigned int a2)
{
  if (a2 > 0x1E)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 31;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(unsigned char *)(result + 32) = 8 * (((-a2 >> 1) & 0xF) - 16 * a2);
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLSetValue()
{
  return &type metadata for SQLSetValue;
}

uint64_t destroy for SQLSetters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SQLSetters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SQLSetters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
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

uint64_t assignWithTake for SQLSetters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLSetters(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for SQLSetters(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLSetters()
{
  return &type metadata for SQLSetters;
}

#error "1A2BE23F0: call analysis failed (funcsize=22)"

uint64_t MonotonicTimestamp.MonotonicClockType.rawValue.getter()
{
  return *v0;
}

SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional __swiftcall MonotonicTimestamp.MonotonicClockType.init(rawValue:)(SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional rawValue)
{
  if (rawValue.value == SiriAnalytics_MonotonicTimestamp_MonotonicClockType_continuous) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (rawValue.value == SiriAnalytics_MonotonicTimestamp_MonotonicClockType_suspending) {
    char v2 = 0;
  }
  *unsigned int v1 = v2;
  return rawValue;
}

void MonotonicTimestamp.init(bootSessionUUID:nanoSecondsSinceBoot:clockType:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v7 = OUTLINED_FUNCTION_18(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3_14();
  uint64_t v8 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_19_4();
  sub_1A2B5D9DC(v3, v0);
  OUTLINED_FUNCTION_20_7(v0);
  if (v12)
  {
    if (qword_1E9595CF0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v8, (uint64_t)qword_1E95977C8);
    OUTLINED_FUNCTION_18_10();
    OUTLINED_FUNCTION_11_13();
    v13();
    sub_1A2B3C61C(v3);
    sub_1A2B3C61C(v0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v5, v1, v8);
  }
  else
  {
    sub_1A2B3C61C(v3);
    unint64_t v14 = *(void (**)(void))(v10 + 32);
    OUTLINED_FUNCTION_21_11();
    v14();
    ((void (*)(uint64_t, uint64_t, uint64_t))v14)(v5, v1, v8);
  }
  uint64_t v15 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_12_13(v15);
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for MonotonicTimestamp()
{
  uint64_t result = qword_1EB556E60;
  if (!qword_1EB556E60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1A2BE2610(unint64_t result)
{
  unint64_t v1 = result;
  if (result == -1) {
    return v1;
  }
  if (qword_1E9596420 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1E95971D0 == HIDWORD(qword_1E95971D0)) {
    return v1;
  }
  if (!is_mul_ok(v1, qword_1E95971D0)) {
    return -1;
  }
  if (HIDWORD(qword_1E95971D0)) {
    return v1 * qword_1E95971D0 / HIDWORD(qword_1E95971D0);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2BE26A4()
{
  return sub_1A2B3C1F4();
}

uint64_t sub_1A2BE26AC()
{
  return sub_1A2B83654();
}

uint64_t sub_1A2BE26B4()
{
  return sub_1A2B838DC();
}

SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional sub_1A2BE26BC(Swift::UInt8 *a1)
{
  return MonotonicTimestamp.MonotonicClockType.init(rawValue:)(*a1);
}

uint64_t sub_1A2BE26C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = MonotonicTimestamp.MonotonicClockType.rawValue.getter();
  *a1 = result;
  return result;
}

void MonotonicTimestamp.init(cpuTicks:clockType:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v28 = v6;
  uint64_t v7 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_2_3();
  uint64_t v11 = type metadata accessor for MonotonicTimestamp();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_3_14();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v13 = OUTLINED_FUNCTION_18(v12);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = &v26[-v17];
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = &v26[-v20];
  int v27 = *v3;
  __swift_storeEnumTagSinglePayload((uint64_t)&v26[-v20], 1, 1, v7);
  unint64_t v22 = sub_1A2BE2610(v5);
  sub_1A2B5D9DC((uint64_t)v21, (uint64_t)v18);
  sub_1A2B5D9DC((uint64_t)v18, (uint64_t)v15);
  OUTLINED_FUNCTION_19_8((uint64_t)v15);
  if (v23)
  {
    if (qword_1E9595CF0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_1E95977C8);
    OUTLINED_FUNCTION_18_10();
    v24(v0);
    sub_1A2B3C61C((uint64_t)v18);
    sub_1A2B3C61C((uint64_t)v15);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 32))(v1, v0, v7);
  }
  else
  {
    sub_1A2B3C61C((uint64_t)v18);
    unint64_t v25 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32);
    v25(v0, v15, v7);
    v25((unsigned char *)v1, v0, v7);
  }
  *(void *)(v1 + *(int *)(v11 + 20)) = v22;
  *(unsigned char *)(v1 + *(int *)(v11 + 24)) = v27;
  sub_1A2B7AFB8(v1, v28);
  sub_1A2B3C61C((uint64_t)v21);
  OUTLINED_FUNCTION_7();
}

void MonotonicTimestamp.init(bootSessionUUID:cpuTicks:clockType:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v27 = v8;
  uint64_t v9 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_5_18();
  uint64_t v13 = type metadata accessor for MonotonicTimestamp();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_19_4();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v15 = OUTLINED_FUNCTION_18(v14);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v26 - v19;
  char v21 = *v3;
  unint64_t v22 = sub_1A2BE2610(v5);
  sub_1A2B5D9DC(v7, (uint64_t)v20);
  sub_1A2B5D9DC((uint64_t)v20, (uint64_t)v17);
  OUTLINED_FUNCTION_20_7((uint64_t)v17);
  if (v23)
  {
    if (qword_1E9595CF0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v9, (uint64_t)qword_1E95977C8);
    OUTLINED_FUNCTION_11_13();
    v24();
    sub_1A2B3C61C((uint64_t)v20);
    sub_1A2B3C61C((uint64_t)v17);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v1, v0, v9);
  }
  else
  {
    sub_1A2B3C61C((uint64_t)v20);
    unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    uint64_t v26 = v13;
    v25(v0, v17, v9);
    uint64_t v13 = v26;
    v25((char *)v1, v0, v9);
  }
  *(void *)(v1 + *(int *)(v13 + 20)) = v22;
  *(unsigned char *)(v1 + *(int *)(v13 + 24)) = v21;
  sub_1A2B7AFB8(v1, v27);
  sub_1A2B3C61C(v7);
  OUTLINED_FUNCTION_7();
}

void MonotonicTimestamp.init(nanoSecondsSinceBoot:clockType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_8_0();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v26 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v28 = v27;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_5_18();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v31 = OUTLINED_FUNCTION_18(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_11_11();
  MEMORY[0x1F4188790](v32);
  unint64_t v34 = (char *)&a9 - v33;
  __swift_storeEnumTagSinglePayload((uint64_t)&a9 - v33, 1, 1, v26);
  sub_1A2B5D9DC((uint64_t)v34, v21);
  OUTLINED_FUNCTION_20_7(v21);
  if (v35)
  {
    if (qword_1E9595CF0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v26, (uint64_t)qword_1E95977C8);
    OUTLINED_FUNCTION_18_10();
    OUTLINED_FUNCTION_11_13();
    v36();
    sub_1A2B3C61C((uint64_t)v34);
    sub_1A2B3C61C(v21);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v25, v20, v26);
  }
  else
  {
    sub_1A2B3C61C((uint64_t)v34);
    long long v37 = *(void (**)(void))(v28 + 32);
    OUTLINED_FUNCTION_21_11();
    v37();
    ((void (*)(uint64_t, uint64_t, uint64_t))v37)(v25, v20, v26);
  }
  uint64_t v38 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_12_13(v38);
  OUTLINED_FUNCTION_7();
}

double sub_1A2BE2D48()
{
  v1[1] = *(mach_timebase_info *)MEMORY[0x1E4F143B8];
  v1[0] = (mach_timebase_info)0x100000001;
  mach_timebase_info(v1);
  double result = *(double *)v1;
  qword_1E95971D0 = (uint64_t)v1[0];
  return result;
}

void static MonotonicTimestamp.now(forClock:)(unsigned char *a1)
{
  if (*a1) {
    mach_continuous_time();
  }
  else {
    mach_absolute_time();
  }
  MonotonicTimestamp.init(cpuTicks:clockType:)();
}

void static MonotonicTimestamp.+ infix(_:_:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v6 = OUTLINED_FUNCTION_22_7();
  OUTLINED_FUNCTION_9();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_3();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v11 = OUTLINED_FUNCTION_18(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_11_11();
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = *(void *)(v4 + *(int *)(OUTLINED_FUNCTION_13_13() + 20));
  BOOL v14 = __CFADD__(v13, v5);
  uint64_t v15 = (uint64_t)v5 + v13;
  if (v14)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v16 = OUTLINED_FUNCTION_6_23(v15);
  v5(v16);
  OUTLINED_FUNCTION_8_16();
  OUTLINED_FUNCTION_19_8(v2);
  if (v17)
  {
    if (qword_1E9595CF0 == -1)
    {
LABEL_5:
      __swift_project_value_buffer(v6, (uint64_t)qword_1E95977C8);
      uint64_t v18 = OUTLINED_FUNCTION_17_16();
      v5(v18);
      sub_1A2B3C61C((uint64_t)v3);
      sub_1A2B3C61C(v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v0, v1, v6);
      goto LABEL_6;
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  sub_1A2B3C61C((uint64_t)v3);
  uint64_t v19 = OUTLINED_FUNCTION_7_14();
  v3(v19);
  ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v0, v1, v6);
LABEL_6:
  OUTLINED_FUNCTION_9_17();
  OUTLINED_FUNCTION_7();
}

void static MonotonicTimestamp.- infix(_:_:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v6 = OUTLINED_FUNCTION_22_7();
  OUTLINED_FUNCTION_9();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_3();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  uint64_t v11 = OUTLINED_FUNCTION_18(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_11_11();
  MEMORY[0x1F4188790](v12);
  unint64_t v13 = *(void *)(v4 + *(int *)(OUTLINED_FUNCTION_13_13() + 20));
  BOOL v14 = v13 >= (unint64_t)v5;
  uint64_t v15 = v13 - (void)v5;
  if (!v14)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v16 = OUTLINED_FUNCTION_6_23(v15);
  v5(v16);
  OUTLINED_FUNCTION_8_16();
  OUTLINED_FUNCTION_19_8(v2);
  if (v17)
  {
    if (qword_1E9595CF0 == -1)
    {
LABEL_6:
      __swift_project_value_buffer(v6, (uint64_t)qword_1E95977C8);
      uint64_t v18 = OUTLINED_FUNCTION_17_16();
      v5(v18);
      sub_1A2B3C61C((uint64_t)v3);
      sub_1A2B3C61C(v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v0, v1, v6);
      goto LABEL_7;
    }
LABEL_8:
    swift_once();
    goto LABEL_6;
  }
  sub_1A2B3C61C((uint64_t)v3);
  uint64_t v19 = OUTLINED_FUNCTION_7_14();
  v3(v19);
  ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v0, v1, v6);
LABEL_7:
  OUTLINED_FUNCTION_9_17();
  OUTLINED_FUNCTION_7();
}

uint64_t MonotonicInterval.init(seconds:minutes:hours:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v4 = 1000000000 * result;
  if ((result & 0x100000000) != 0) {
    uint64_t v4 = 0;
  }
  if ((a2 & 0x100000000) == 0)
  {
    if (is_mul_ok(60 * a2, 0x3B9ACA00uLL))
    {
      BOOL v5 = __CFADD__(v4, 60000000000 * a2);
      v4 += 60000000000 * a2;
      if (!v5) {
        goto LABEL_6;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_6:
  if ((a3 & 0x100) != 0
    || (v6 = 3600000000000 * a3, BOOL v5 = __CFADD__(v4, v6), v4 += v6, !v5))
  {
    *a4 = v4;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1A2BE3158()
{
  unint64_t result = qword_1E95971D8;
  if (!qword_1E95971D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95971D8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for MonotonicTimestamp(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A2C0CE20();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  }
  return a1;
}

uint64_t initializeWithCopy for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A2C0CE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A2BE34A0);
}

uint64_t sub_1A2BE34A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 2) {
      return v9 - 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A2BE353C);
}

void sub_1A2BE353C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
}

uint64_t sub_1A2BE35C4()
{
  uint64_t result = sub_1A2C0CE20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MonotonicTimestamp.MonotonicClockType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2BE3734);
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

ValueMetadata *type metadata accessor for MonotonicTimestamp.MonotonicClockType()
{
  return &type metadata for MonotonicTimestamp.MonotonicClockType;
}

ValueMetadata *type metadata accessor for MonotonicInterval()
{
  return &type metadata for MonotonicInterval;
}

uint64_t OUTLINED_FUNCTION_6_23@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 88) = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_7_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v0);
  return sub_1A2B5D9DC(v2, v1);
}

void OUTLINED_FUNCTION_9_17()
{
  *(void *)(v0 + *(int *)(v1 + 20)) = *(void *)(v3 - 88);
  *(unsigned char *)(v0 + *(int *)(v1 + 24)) = v2;
}

uint64_t OUTLINED_FUNCTION_12_13(uint64_t result)
{
  *(void *)(v1 + *(int *)(result + 20)) = v2;
  *(unsigned char *)(v1 + *(int *)(result + 24)) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t OUTLINED_FUNCTION_17_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_8(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_20_7(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_22_7()
{
  return sub_1A2C0CE20();
}

uint64_t sub_1A2BE3910(unsigned int a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x302010004uLL >> (8 * a1));
  }
}

uint64_t sub_1A2BE3934@<X0>(unsigned int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1A2BE3910(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1A2BE3960(uint64_t a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_2_32();
  sub_1A2C0D7F0();
  uint64_t result = type metadata accessor for StagedMessage();
  uint64_t v14 = result;
  uint64_t v15 = *(void **)(v4 + *(int *)(result + 20));
  if (!v15
    || (v18[3] = sub_1A2C0D060(),
        v18[4] = sub_1A2BE4544(&qword_1E9596350, MEMORY[0x1E4F9FF30]),
        v18[0] = v15,
        id v16 = v15,
        sub_1A2C0D7D0(),
        v16,
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18),
        !v2))
  {
    MEMORY[0x1F4188790](result);
    *(&v17 - 2) = v4;
    *(&v17 - 1) = a1;
    uint64_t result = sub_1A2C0D7C0();
    if (!v2)
    {
      sub_1A2B6544C(v4 + *(int *)(v14 + 28), (uint64_t)v8, &qword_1EB554320);
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
      {
        return sub_1A2B653F8((uint64_t)v8, &qword_1EB554320);
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v3, v8, v9);
        sub_1A2C0D7E0();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
      }
    }
  }
  return result;
}

id sub_1A2BE3BB4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + *(int *)(type metadata accessor for StagedMessage() + 24)), sel_writeTo_, a2);
}

uint64_t sub_1A2BE3C08@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v6 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_32();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v31 - v17;
  __swift_storeEnumTagSinglePayload((uint64_t)&v31 - v17, 1, 1, v6);
  id v39 = 0;
  id v38 = 0;
  uint64_t v19 = sub_1A2C0CDA0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v19);
  uint64_t v33 = v18;
  uint64_t v34 = a1;
  char v35 = &v39;
  __int16 v36 = &v38;
  long long v37 = v12;
  sub_1A2BE4464();
  sub_1A2C0D770();
  if (v2) {
    goto LABEL_8;
  }
  sub_1A2B6544C((uint64_t)v18, (uint64_t)v15, &qword_1EB555500);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v6) == 1)
  {
    sub_1A2B653F8((uint64_t)v15, &qword_1EB555500);
LABEL_7:
    uint64_t v28 = sub_1A2C0D2F0();
    sub_1A2BE4544(qword_1E9596768, MEMORY[0x1E4F5F280]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v28 - 8) + 104))(v29, *MEMORY[0x1E4F5F270], v28);
    swift_willThrow();
LABEL_8:
    uint64_t v27 = (uint64_t)v12;
    goto LABEL_9;
  }
  uint64_t v32 = a2;
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v20(v3, v15, v6);
  if (!v38)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v3, v6);
    goto LABEL_7;
  }
  uint64_t v21 = v32;
  id v22 = v38;
  v20(v32, v3, v6);
  id v23 = v39;
  uint64_t v24 = (int *)type metadata accessor for StagedMessage();
  sub_1A2B6544C((uint64_t)v12, (uint64_t)&v21[v24[7]], &qword_1EB554320);
  *(void *)&v21[v24[5]] = v23;
  *(void *)&v21[v24[6]] = v22;
  id v25 = v23;
  id v26 = v22;
  uint64_t v27 = (uint64_t)v12;
LABEL_9:
  sub_1A2B653F8(v27, &qword_1EB554320);

  return sub_1A2B653F8((uint64_t)v18, &qword_1EB555500);
}

void sub_1A2BE3F90(unsigned char *a1, uint64_t a2, uint64_t a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554320);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*a1)
  {
    case 1:
      sub_1A2C0D060();
      sub_1A2BE4544(&qword_1E9596350, MEMORY[0x1E4F9FF30]);
      sub_1A2C0D790();
      if (!v6)
      {
        id v23 = *a4;
        *a4 = (void *)v24[1];
      }
      break;
    case 2:
      MEMORY[0x1F4188790](v17);
      v24[-2] = a3;
      v24[-1] = a5;
      sub_1A2C0D780();
      break;
    case 3:
      sub_1A2C0D7A0();
      uint64_t v20 = &qword_1EB554320;
      uint64_t v21 = (uint64_t)v15;
      uint64_t v22 = a6;
      goto LABEL_7;
    default:
      sub_1A2C0D7B0();
      uint64_t v20 = &qword_1EB555500;
      uint64_t v21 = (uint64_t)v19;
      uint64_t v22 = a2;
LABEL_7:
      sub_1A2BE44CC(v21, v22, v20);
      break;
  }
}

void sub_1A2BE41B0(uint64_t a1, void **a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1248]), sel_init);
  if (v4)
  {
    uint64_t v5 = v4;
    if (objc_msgSend(v4, sel_readFrom_, a1))
    {
      uint64_t v6 = *a2;
      *a2 = v5;
    }
    else
    {
      uint64_t v7 = sub_1A2C0D2F0();
      sub_1A2BE4544(qword_1E9596768, MEMORY[0x1E4F5F280]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(v8, *MEMORY[0x1E4F5F270], v7);
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A2BE42D0(uint64_t a1)
{
  return sub_1A2BE3960(a1);
}

uint64_t sub_1A2BE42E8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1A2BE3C08(a1, a2);
}

uint64_t sub_1A2BE4300()
{
  return sub_1A2C0D2D0();
}

uint64_t sub_1A2BE4368()
{
  return sub_1A2C0D2C0();
}

uint64_t sub_1A2BE43F8()
{
  return sub_1A2BE4544(&qword_1E95962D0, (void (*)(uint64_t))type metadata accessor for StagedMessage);
}

void sub_1A2BE4440(unsigned char *a1)
{
  sub_1A2BE3F90(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void ***)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

unint64_t sub_1A2BE4464()
{
  unint64_t result = qword_1E95962C0;
  if (!qword_1E95962C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95962C0);
  }
  return result;
}

void sub_1A2BE44B0()
{
  sub_1A2BE41B0(*(void *)(v0 + 16), *(void ***)(v0 + 24));
}

uint64_t sub_1A2BE44CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

id sub_1A2BE4528()
{
  return sub_1A2BE3BB4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2BE4544(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *_s6FieldsOwst_3(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1A2BE4658);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s6FieldsOMa_4()
{
  return &_s6FieldsON_3;
}

unint64_t sub_1A2BE4694()
{
  unint64_t result = qword_1E95971E0;
  if (!qword_1E95971E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95971E0);
  }
  return result;
}

void *sub_1A2BE46FC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PersistentIdentifiersDataCollectionPolicy(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for PersistentIdentifiersDataCollectionPolicy(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PersistentIdentifiersDataCollectionPolicy()
{
  return &type metadata for PersistentIdentifiersDataCollectionPolicy;
}

id sub_1A2BE47E4(void *a1)
{
  if (objc_msgSend(a1, sel_respondsToSelector_, sel_removePersistentIdentifiers)) {
    return objc_msgSend(a1, sel_removePersistentIdentifiers);
  }
  if (qword_1E9595AA0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1A2BAB628();
  sub_1A2BABBD0(0xD000000000000083, 0x80000001A2C17670, 0xD00000000000001BLL, 0x80000001A2C17780, v3);
  swift_release();
  return 0;
}

uint64_t sub_1A2BE48B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1A2BE48D8, 0, 0);
}

uint64_t sub_1A2BE48D8()
{
  if (sub_1A2BE47E4(*(void **)(v0 + 24)))
  {
    if (qword_1E9595AA0 != -1) {
      swift_once();
    }
    uint64_t v1 = *(void *)(v0 + 16);
    sub_1A2BAB628();
    uint64_t v2 = swift_task_alloc();
    *(void *)(v2 + 16) = v1;
    sub_1A2BABC2C(0xD000000000000083, 0x80000001A2C17670, 0xD000000000000026, 0x80000001A2C155A0, sub_1A2BE4E24, v2);
    swift_release();
    swift_task_dealloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595B70);
    sub_1A2B793B8();
    uint64_t v4 = sub_1A2C0D640();
    return MEMORY[0x1F4188298](sub_1A2BE4B10, v4, v3);
  }
  else
  {
    if (qword_1E9595AA0 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void *)(v0 + 16);
    sub_1A2BAB628();
    uint64_t v6 = swift_task_alloc();
    *(void *)(v6 + 16) = v5;
    sub_1A2BABC2C(0xD000000000000083, 0x80000001A2C17670, 0xD000000000000026, 0x80000001A2C155A0, sub_1A2BE4DEC, v6);
    swift_release();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_1A2BE4B10()
{
  sub_1A2BE4B84(*(void *)(v0 + 32) + 24, 8, 0xA000000000000008);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A2BE4B84(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v13 - v9;
  uint64_t v11 = sub_1A2C0CE20();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v11);
  uint64_t v16 = &type metadata for SensitiveConditionTag;
  uint64_t v17 = &protocol witness table for SensitiveConditionTag;
  int v14 = a2;
  unint64_t v15 = a3;
  sub_1A2B5E424(a3);
  sub_1A2BD6858();
  sub_1A2B3C61C((uint64_t)v7);
  sub_1A2B3C61C((uint64_t)v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
}

uint64_t sub_1A2BE4CA8()
{
  return 0;
}

uint64_t sub_1A2BE4D44(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1A2B70614;
  return sub_1A2BE48B4(a1, v5, v4);
}

uint64_t sub_1A2BE4DEC()
{
  return sub_1A2BE4CA8();
}

uint64_t sub_1A2BE4E24()
{
  return sub_1A2BE4CA8();
}

void *sub_1A2BE4E5C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBC860];
  v1[3] = 0;
  v1[4] = v2;
  mach_timebase_info v1[2] = a1;
  return v1;
}

uint64_t sub_1A2BE4E74()
{
  if (*(void *)(v0 + 24)) {
    return 1;
  }
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  type metadata accessor for DarwinNotificationObserver();
  swift_allocObject();
  *(void *)(v1 + 24) = sub_1A2BDA63C(0xD000000000000029, 0x80000001A2C17810, v2, (uint64_t)sub_1A2BE5B84, v3);
  swift_release();
  if (*(void *)(v1 + 24)) {
    return 1;
  }
  if (qword_1E9595AA0 != -1) {
    swift_once();
  }
  sub_1A2BAB6C8(0xD000000000000035, 0x80000001A2C17840, 0xD00000000000007CLL, 0x80000001A2C17880, 0xD000000000000010, 0x80000001A2C17900);
  return 0;
}

uint64_t sub_1A2BE4FD0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2BE51C0();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2BE5028(uint64_t a1, uint64_t a2)
{
  char v5 = sub_1A2BE4E74();
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    swift_beginAccess();
    swift_retain();
    sub_1A2B86710();
    uint64_t v7 = *(void *)(*(void *)(v2 + 32) + 16);
    sub_1A2B86968();
    uint64_t v8 = *(void *)(v2 + 32);
    *(void *)(v8 + 16) = v7 + 1;
    uint64_t v9 = v8 + 16 * v7;
    *(void *)(v9 + 32) = &unk_1E9597220;
    *(void *)(v9 + 40) = v6;
    swift_endAccess();
  }
  return v5 & 1;
}

uint64_t sub_1A2BE50F4(uint64_t a1, int *a2)
{
  char v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1A2B59EEC;
  return v5();
}

uint64_t sub_1A2BE51C0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB556F50);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1A2C0D6B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  char v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_1A2BA0308((uint64_t)v2, (uint64_t)&unk_1E9597210, (uint64_t)v5);
  swift_release();
  return sub_1A2B587DC((uint64_t)v2);
}

uint64_t sub_1A2BE52B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x1F4188298](sub_1A2BE52D8, 0, 0);
}

uint64_t sub_1A2BE52D8()
{
  OUTLINED_FUNCTION_2_0();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    void *v2 = v0;
    v2[1] = sub_1A2BE53CC;
    return sub_1A2BE54B4();
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_1A2BE53CC()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1A2B6F8D0, 0, 0);
}

uint64_t sub_1A2BE54B4()
{
  OUTLINED_FUNCTION_2_0();
  v1[5] = v0;
  type metadata accessor for UserHistoryDeletionRequestObserver();
  sub_1A2BADD48();
  uint64_t v3 = sub_1A2C0D640();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x1F4188298](sub_1A2BE5534, v3, v2);
}

uint64_t sub_1A2BE5534()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0[5];
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 32);
  v0[8] = v2;
  uint64_t v3 = v2[2];
  v0[9] = v3;
  if (v3)
  {
    v0[10] = 0;
    uint64_t v4 = (int *)v2[4];
    v0[11] = v2[5];
    uint64_t v8 = (uint64_t (*)(void))((char *)v4 + *v4);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[12] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1A2BE5680;
    return v8();
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1A2BE5680()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_release();
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = *(void *)(v1 + 48);
  return MEMORY[0x1F4188298](sub_1A2BE57B8, v5, v4);
}

uint64_t sub_1A2BE57B8()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0[10] + 1;
  if (v1 == v0[9])
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    v0[10] = v1;
    uint64_t v4 = v0[8] + 16 * v1;
    uint64_t v5 = *(int **)(v4 + 32);
    v0[11] = *(void *)(v4 + 40);
    uint64_t v7 = (uint64_t (*)(void))((char *)v5 + *v5);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[12] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1A2BE5680;
    return v7();
  }
}

uint64_t sub_1A2BE58E8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2BE5918()
{
  sub_1A2BE58E8();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for UserHistoryDeletionRequestObserver()
{
  return self;
}

uint64_t sub_1A2BE5970()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2BE59A8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2BE59E8()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1A2B59624;
  return sub_1A2BE52B8(v3, v4, v5, v6);
}

uint64_t sub_1A2BE5A98()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2BE5AD0()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  uint64_t v4 = *(int **)(v0 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1A2B59EEC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9597218 + dword_1E9597218);
  return v6(v3, v4);
}

uint64_t sub_1A2BE5B84()
{
  return sub_1A2BE4FD0();
}

uint64_t sub_1A2BE5B90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = sub_1A2C0CE20();
  MEMORY[0x1F4188790](v9);
  uint64_t v59 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v57 = (char *)&v50 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v53 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  unint64_t v54 = (void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v55 = v5;
  uint64_t v50 = v12;
  char v51 = (void (**)(char *, uint64_t))(v12 + 8);
  swift_bridgeObjectRetain();
  uint64_t v15 = 0;
  uint64_t v56 = v2;
  uint64_t v16 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v60 = 0x80000001A2C10D00;
  uint64_t v52 = a1;
  uint64_t v58 = v14;
  while (1)
  {
    uint64_t v17 = *(void *)(a1 + 8 * v15 + 32);
    uint64_t v18 = *(void *)(v17 + 16);
    swift_bridgeObjectRetain();
    if (!v18 || (uint64_t v19 = sub_1A2B54DF8(0xD000000000000011, v60), (v20 & 1) == 0))
    {
LABEL_12:
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
LABEL_13:
      swift_bridgeObjectRelease();
      sub_1A2B3C61C((uint64_t)v8);
      goto LABEL_14;
    }
    uint64_t v21 = *(void *)(v17 + 56) + 24 * v19;
    uint64_t v22 = *(void *)v21;
    unint64_t v23 = *(void *)(v21 + 8);
    int v24 = *(unsigned __int8 *)(v21 + 16);
    if (*(unsigned char *)(v21 + 16))
    {
      if (v24 == 3)
      {
        sub_1A2B3EA44(*(void *)v21, *(void *)(v21 + 8));
        OUTLINED_FUNCTION_20_8();
        sub_1A2C0CD10();
      }
      else
      {
        if (v24 == 4 && (v23 | v22) == 0) {
          goto LABEL_12;
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v55, 1, 1, v9);
        sub_1A2B3EA24(v22, v23, v24);
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_20_8();
      sub_1A2C0CDB0();
    }
    int v26 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, v26 ^ 1u, 1, v9);
    sub_1A2B3EB74(v22, v23, v24);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
    uint64_t v14 = v58;
    if (EnumTagSinglePayload == 1) {
      goto LABEL_13;
    }
    uint64_t v28 = v57;
    (*v53)(v57, v8, v9);
    if (v16[2])
    {
      unint64_t v29 = sub_1A2B54F70();
      uint64_t v30 = MEMORY[0x1E4FBC860];
      if (v31)
      {
        uint64_t v30 = *(void *)(v16[7] + 8 * v29);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      uint64_t v30 = MEMORY[0x1E4FBC860];
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_33_5();
      sub_1A2B86C10();
      uint64_t v30 = v47;
    }
    unint64_t v32 = *(void *)(v30 + 16);
    if (v32 >= *(void *)(v30 + 24) >> 1)
    {
      sub_1A2B86C10();
      uint64_t v30 = v48;
    }
    *(void *)(v30 + 16) = v32 + 1;
    *(void *)(v30 + 8 * v32 + 32) = v17;
    uint64_t v33 = *v54;
    (*v54)(v59, v28, v9);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v16;
    unint64_t v34 = sub_1A2B54F70();
    if (__OFADD__(v16[2], (v35 & 1) == 0)) {
      break;
    }
    unint64_t v36 = v34;
    char v37 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9597228);
    char v38 = sub_1A2C0DC50();
    id v39 = v57;
    if (v38)
    {
      unint64_t v40 = sub_1A2B54F70();
      if ((v37 & 1) != (v41 & 1)) {
        goto LABEL_40;
      }
      unint64_t v36 = v40;
    }
    uint64_t v16 = v61;
    if (v37)
    {
      uint64_t v42 = v61[7];
      swift_bridgeObjectRelease();
      *(void *)(v42 + 8 * v36) = v30;
    }
    else
    {
      OUTLINED_FUNCTION_13_14((uint64_t)&v61[v36 >> 6]);
      v33((char *)(v16[6] + *(void *)(v50 + 72) * v36), v59, v9);
      *(void *)(v16[7] + 8 * v36) = v30;
      uint64_t v43 = v16[2];
      BOOL v44 = __OFADD__(v43, 1);
      uint64_t v45 = v43 + 1;
      if (v44) {
        goto LABEL_39;
      }
      v16[2] = v45;
    }
    swift_bridgeObjectRelease();
    char v46 = *v51;
    (*v51)(v59, v9);
    v46(v39, v9);
    a1 = v52;
    uint64_t v14 = v58;
LABEL_14:
    if (v14 == ++v15)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v16;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_1A2C0DDE0();
  __break(1u);
  return result;
}

void sub_1A2BE60B0()
{
  qword_1EB5572E8 = -1;
}

uint64_t sub_1A2BE60C0(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v6 = v4;
  *(void *)(v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle) = 0;
  type metadata accessor for PersistentStorage();
  char v11 = sub_1A2BD1404();
  if (v5)
  {
    sub_1A2C0CCF0();
    OUTLINED_FUNCTION_14();
    (*(void (**)(uint64_t))(v12 + 8))(a1);
    type metadata accessor for DbStorage();
    OUTLINED_FUNCTION_3_0();
    swift_deallocPartialClassInstance();
  }
  else if (v11)
  {
    uint64_t v13 = v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storagePath;
    sub_1A2C0CCF0();
    OUTLINED_FUNCTION_14();
    (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v13, a1);
    *(unsigned char *)(v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storageProtectionClass) = a2;
    uint64_t v15 = v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_pageSize;
    *(void *)uint64_t v15 = a3;
    *(unsigned char *)(v15 + 8) = a4 & 1;
  }
  else
  {
    sub_1A2C0CCF0();
    OUTLINED_FUNCTION_14();
    (*(void (**)(uint64_t))(v16 + 8))(a1);
    type metadata accessor for DbStorage();
    OUTLINED_FUNCTION_3_0();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v6;
}

const char *sub_1A2BE624C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v7 = dword_1EF5C4180 == a1 || unk_1EF5C4184 == a1 || dword_1EF5C4188 == a1;
  uint64_t v8 = v7;
  if (v7) {
    return (const char *)v8;
  }
  uint64_t v12 = (sqlite3 **)(v5 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  OUTLINED_FUNCTION_2_23();
  int v13 = sqlite3_extended_errcode(*v12);
  uint64_t result = sqlite3_errstr(a1);
  if (result)
  {
    sub_1A2C0D460();
    if (v15)
    {
      if (qword_1EB554580 != -1) {
        swift_once();
      }
      uint64_t v39 = qword_1E9597790;
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_24();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_23();
      HIDWORD(v43) = v13;
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      sub_1A2C0D530();
      sub_1A2C0D530();
      uint64_t v16 = swift_bridgeObjectRelease();
      uint64_t v24 = OUTLINED_FUNCTION_22_8(v16, v17, v18, v19, v20, v21, v22, v23, v39, a4, a5, a3, v43, 0);
      uint64_t v29 = v41;
    }
    else
    {
      if (qword_1EB554580 != -1) {
        swift_once();
      }
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_24();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_23();
      HIDWORD(v43) = v13;
      sub_1A2C0DD60();
      sub_1A2C0D530();
      uint64_t v30 = swift_bridgeObjectRelease();
      uint64_t v24 = OUTLINED_FUNCTION_22_8(v30, v31, v32, v33, v34, v35, v36, v37, v38, v40, a5, a3, v43, 0);
      uint64_t v29 = a4;
    }
    sub_1A2BAB6C8(v24, v25, v26, v27, v29, v28);
    swift_bridgeObjectRelease();
    sub_1A2BE8110();
    return (const char *)v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2BE6500()
{
  uint64_t v1 = v0;
  sub_1A2C0CCE0();
  int v2 = (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storageProtectionClass) << 20) + 1048582;
  uint64_t v3 = sub_1A2C0D500();
  swift_bridgeObjectRelease();
  uint64_t v4 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  swift_beginAccess();
  int v5 = sqlite3_open_v2((const char *)(v3 + 32), v4, v2, 0);
  swift_endAccess();
  swift_release();
  if (sub_1A2BE624C(v5, 0xD00000000000005CLL, 0x80000001A2C17980, 0x7243724F6E65706FLL, 0xEE00292865746165))
  {
    if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_pageSize + 8) & 1) == 0)
    {
      OUTLINED_FUNCTION_7_15();
      sub_1A2C0DB60();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23_8();
      sub_1A2C0DD60();
      sub_1A2C0D530();
      swift_bridgeObjectRelease();
      char v6 = sub_1A2BE6BB4();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        if (qword_1EB554580 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_7_15();
        sub_1A2C0DB60();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_23_8();
        sub_1A2C0DD60();
        sub_1A2C0D530();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_1_32();
        sub_1A2BAB6C8(v7, v8, v9, v10, v11, v12);
        swift_bridgeObjectRelease();
      }
    }
    char v13 = sub_1A2BE6BB4();
  }
  else
  {
    if (qword_1EB554580 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_7_15();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    sub_1A2C0CCF0();
    sub_1A2B52168();
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_32();
    sub_1A2BAB6F8(v14, v15, v16, v17, v18, v19);
    swift_bridgeObjectRelease();
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1A2BE682C()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  OUTLINED_FUNCTION_2_23();
  if (*v1) {
    char v2 = 1;
  }
  else {
    char v2 = sub_1A2BE6500();
  }
  return v2 & 1;
}

uint64_t sub_1A2BE6880()
{
  uint64_t v0 = sub_1A2BE6D8C(0xD000000000000010, 0x80000001A2C17A10, 0);
  if (!v0) {
    goto LABEL_9;
  }
  if (!*(void *)(v0 + 16))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1A2BE8304(v1);
  if ((v4 & 1) == 0)
  {
    if (*(_DWORD *)(v1 + 36) == v3)
    {
      if (result != 1 << *(unsigned char *)(v1 + 32))
      {
        sub_1A2BE8388(result, v3, v1, (uint64_t)v11);
        swift_bridgeObjectRelease();
        uint64_t v5 = v11[0];
        unint64_t v6 = v11[1];
        char v7 = v12;
        uint64_t v8 = sub_1A2BBBC50();
        char v10 = v9;
        sub_1A2B3EB74(v5, v6, v7);
        if ((v10 & 1) == 0) {
          return v8;
        }
LABEL_9:
        if (qword_1EB554580 != -1) {
          swift_once();
        }
        sub_1A2BAB6C8(0xD000000000000021, 0x80000001A2C17A30, 0xD00000000000005CLL, 0x80000001A2C17980, 0xD000000000000011, 0x80000001A2C17A60);
        return 0;
      }
      goto LABEL_8;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2BE6A10()
{
  if (sub_1A2BE682C())
  {
    if (qword_1EB554580 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_7_15();
    sub_1A2C0DB60();
    swift_bridgeObjectRelease();
    sub_1A2C0CCF0();
    sub_1A2B52168();
    sub_1A2C0DD60();
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2BAB6F8(0xD000000000000014, 0x80000001A2C17B00, 0xD00000000000005CLL, 0x80000001A2C17980, 0x696F706B63656863, 0xEC0000002928746ELL);
    swift_bridgeObjectRelease();
    uint64_t v1 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
    OUTLINED_FUNCTION_2_23();
    int v2 = sqlite3_wal_checkpoint_v2(*v1, 0, 1, 0, 0);
    unsigned __int8 v3 = sub_1A2BE624C(v2, 0xD00000000000005CLL, 0x80000001A2C17980, 0x696F706B63656863, 0xEC0000002928746ELL);
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_1A2BE6BB4()
{
  if (sub_1A2BE682C())
  {
    OUTLINED_FUNCTION_2_23();
    uint64_t v0 = sub_1A2C0D500();
    int v1 = OUTLINED_FUNCTION_9_18(v0);
    swift_release();
    OUTLINED_FUNCTION_24_10();
    unsigned __int8 v3 = sub_1A2BE624C(v1, 0xD00000000000005CLL, v2, 0x2865747563657865, 0xEB00000000293A5FLL);
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  return v3 & 1;
}

const char *sub_1A2BE6C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_1A2BE682C() & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return (const char *)(v6 & 1);
  }
  if (!a3)
  {
    OUTLINED_FUNCTION_2_23();
    uint64_t v14 = sub_1A2C0D500();
    OUTLINED_FUNCTION_9_18(v14);
    swift_release();
    OUTLINED_FUNCTION_24_10();
    int v15 = OUTLINED_FUNCTION_18_11();
    LOBYTE(v6) = sub_1A2BE624C(v15, v16, v17, v18, v19);
    return (const char *)(v6 & 1);
  }
  unint64_t v6 = sub_1A2BE7410(a1, a2, a3);
  if (!v6) {
    return (const char *)(v6 & 1);
  }
  char v7 = v6;
  sqlite3_step(v6);
  sqlite3_finalize(v7);
  OUTLINED_FUNCTION_24_10();
  int v8 = OUTLINED_FUNCTION_18_11();
  return sub_1A2BE624C(v8, v9, v10, v11, v12);
}

uint64_t sub_1A2BE6D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (sub_1A2BE682C())
  {
    unint64_t v6 = sub_1A2BE7410(a1, a2, a3);
    if (v6)
    {
      char v7 = v6;
      int v8 = sqlite3_column_count(v6);
      if (v8)
      {
        unsigned int v9 = v8;
        if (v8 < 0) {
          goto LABEL_64;
        }
        int v10 = 0;
        uint64_t v85 = (void *)MEMORY[0x1E4FBC860];
        uint64_t v83 = v7;
        do
        {
          if (v9 == v10) {
            goto LABEL_63;
          }
          if (!sqlite3_column_name(v7, v10)) {
            goto LABEL_65;
          }
          uint64_t v11 = sub_1A2C0D540();
          uint64_t v13 = v12;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_33_5();
            sub_1A2B869E0();
            uint64_t v85 = v17;
          }
          unint64_t v15 = v85[2];
          unint64_t v14 = v85[3];
          if (v15 >= v14 >> 1)
          {
            OUTLINED_FUNCTION_21_12(v14);
            sub_1A2B869E0();
            uint64_t v85 = v18;
          }
          ++v10;
          v85[2] = v15 + 1;
          uint64_t v16 = &v85[2 * v15];
          v16[4] = v11;
          v16[5] = v13;
          char v7 = v83;
        }
        while (v9 != v10);
        if (sqlite3_step(v83) != 100)
        {
          uint64_t v19 = MEMORY[0x1E4FBC860];
          goto LABEL_58;
        }
        uint64_t v21 = v9;
        uint64_t v19 = MEMORY[0x1E4FBC860];
        uint64_t v82 = v9;
        while (1)
        {
          uint64_t v81 = v19;
          unint64_t v22 = 0;
          uint64_t v23 = v85 + 5;
          uint64_t v24 = (void *)MEMORY[0x1E4FBC868];
          do
          {
            if (v21 == v22)
            {
              __break(1u);
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
            }
            unint64_t v25 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
            int v27 = sqlite3_column_type(v25, v26) - 1;
            double v28 = 0.0;
            unint64_t v29 = 0;
            char v30 = 0;
            char v31 = 4;
            switch(v27)
            {
              case 0:
                uint64_t v32 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
                double v28 = COERCE_DOUBLE(sqlite3_column_int64(v32, v33));
                unint64_t v29 = 0;
                char v30 = 0;
                char v31 = 1;
                break;
              case 1:
                BOOL v44 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
                unint64_t v29 = 0;
                char v30 = 0;
                double v28 = sqlite3_column_double(v44, v45);
                char v31 = 2;
                break;
              case 2:
                char v46 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
                if (!sqlite3_column_text(v46, v47)) {
                  goto LABEL_30;
                }
                double v28 = COERCE_DOUBLE(sub_1A2C0D550());
                unint64_t v29 = v48;
                char v30 = 0;
                char v31 = 0;
                break;
              case 3:
                uint64_t v34 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
                uint64_t v36 = sqlite3_column_blob(v34, v35);
                if (!v36) {
                  goto LABEL_30;
                }
                uint64_t v37 = v36;
                uint64_t v38 = (sqlite3_stmt *)OUTLINED_FUNCTION_12_14();
                int v40 = sqlite3_column_bytes(v38, v39);
                if (v40)
                {
                  uint64_t v41 = v40;
                  if (v40 < 15)
                  {
                    memset(__dst, 0, sizeof(__dst));
                    unsigned __int8 v88 = v40;
                    memcpy(__dst, v37, v40);
                    char v30 = 0;
                    double v28 = *(double *)__dst;
                    unint64_t v29 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v88 << 48);
                  }
                  else
                  {
                    sub_1A2C0CBA0();
                    swift_allocObject();
                    if (v41 == 0x7FFFFFFF)
                    {
                      uint64_t v42 = sub_1A2C0CB60();
                      sub_1A2C0CD00();
                      uint64_t v43 = swift_allocObject();
                      char v30 = 0;
                      *(_OWORD *)(v43 + 16) = xmmword_1A2C1F8F0;
                      unint64_t v29 = v42 | 0x8000000000000000;
                      double v28 = *(double *)&v43;
                    }
                    else
                    {
                      char v30 = 0;
                      *(void *)&double v28 = v41 << 32;
                      unint64_t v29 = sub_1A2C0CB60() | 0x4000000000000000;
                    }
                  }
                  char v31 = 3;
                }
                else
                {
                  double v28 = 0.0;
                  char v30 = 0;
                  char v31 = 3;
                  unint64_t v29 = 0xC000000000000000;
                }
                break;
              case 4:
                break;
              default:
LABEL_30:
                double v28 = 0.0;
                unint64_t v29 = 0;
                char v31 = -1;
                char v30 = 1;
                break;
            }
            if (v85[2] <= v22) {
              goto LABEL_60;
            }
            char v86 = v31;
            uint64_t v50 = *(v23 - 1);
            uint64_t v49 = *v23;
            swift_bridgeObjectRetain();
            if (v30)
            {
              swift_bridgeObjectRetain();
              uint64_t v51 = sub_1A2B54DF8(v50, v49);
              char v53 = v52;
              swift_bridgeObjectRelease();
              if (v53)
              {
                swift_isUniquelyReferenced_nonNull_native();
                *(void *)__dst = v24;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554268);
                sub_1A2C0DC50();
                uint64_t v24 = *(void **)__dst;
                swift_bridgeObjectRelease();
                uint64_t v54 = v24[7] + 24 * v51;
                uint64_t v55 = *(void *)v54;
                unint64_t v56 = *(void *)(v54 + 8);
                char v57 = *(unsigned char *)(v54 + 16);
                sub_1A2C0DC60();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v58 = v56;
                char v59 = v57;
                uint64_t v21 = v82;
                char v7 = v83;
                sub_1A2B3EB74(v55, v58, v59);
              }
              else
              {
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              uint64_t v84 = v23;
              unint64_t v60 = v29;
              uint64_t v61 = *(void *)&v28;
              unint64_t v62 = v60;
              sub_1A2B3EB38(*(uint64_t *)&v28, v60, v86);
              swift_isUniquelyReferenced_nonNull_native();
              *(void *)__dst = v24;
              uint64_t v63 = sub_1A2B54DF8(v50, v49);
              if (__OFADD__(v24[2], (v64 & 1) == 0)) {
                goto LABEL_61;
              }
              unint64_t v65 = v63;
              char v66 = v64;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EB554268);
              uint64_t v21 = v82;
              if (sub_1A2C0DC50())
              {
                uint64_t v67 = sub_1A2B54DF8(v50, v49);
                if ((v66 & 1) != (v68 & 1))
                {
                  sub_1A2C0DDE0();
                  __break(1u);
                  JUMPOUT(0x1A2BE73FCLL);
                }
                unint64_t v65 = v67;
              }
              uint64_t v24 = *(void **)__dst;
              if (v66)
              {
                uint64_t v69 = *(void *)(*(void *)__dst + 56) + 24 * v65;
                sub_1A2B3EB74(*(void *)v69, *(void *)(v69 + 8), *(unsigned char *)(v69 + 16));
                *(void *)uint64_t v69 = v61;
                *(void *)(v69 + 8) = v62;
                char v70 = v86;
                *(unsigned char *)(v69 + 16) = v86;
              }
              else
              {
                OUTLINED_FUNCTION_13_14(*(void *)__dst + 8 * (v65 >> 6));
                uint64_t v71 = (uint64_t *)(v24[6] + 16 * v65);
                *uint64_t v71 = v50;
                v71[1] = v49;
                uint64_t v72 = v24[7] + 24 * v65;
                *(void *)uint64_t v72 = v61;
                *(void *)(v72 + 8) = v62;
                char v70 = v86;
                *(unsigned char *)(v72 + 16) = v86;
                uint64_t v73 = v24[2];
                BOOL v74 = __OFADD__(v73, 1);
                uint64_t v75 = v73 + 1;
                if (v74) {
                  goto LABEL_62;
                }
                void v24[2] = v75;
                swift_bridgeObjectRetain();
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_1A2B3EB60(v61, v62, v70);
              char v7 = v83;
              uint64_t v23 = v84;
            }
            ++v22;
            v23 += 2;
          }
          while (v21 != v22);
          uint64_t v19 = v81;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_33_5();
            sub_1A2B86C10();
            uint64_t v19 = v79;
          }
          unint64_t v78 = *(void *)(v19 + 16);
          unint64_t v77 = *(void *)(v19 + 24);
          if (v78 >= v77 >> 1)
          {
            OUTLINED_FUNCTION_21_12(v77);
            sub_1A2B86C10();
            uint64_t v19 = v80;
          }
          *(void *)(v19 + 16) = v78 + 1;
          *(void *)(v19 + 8 * v78 + 32) = v24;
          if (sqlite3_step(v7) != 100)
          {
LABEL_58:
            sqlite3_finalize(v7);
            swift_bridgeObjectRelease();
            return v19;
          }
        }
      }
    }
  }
  return 0;
}

sqlite3_stmt *sub_1A2BE7410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x1E4F143B8];
  ppStmt[0] = 0;
  uint64_t v5 = 0;
  if (sub_1A2BE682C())
  {
    unint64_t v6 = (sqlite3 **)(v3 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
    OUTLINED_FUNCTION_2_23();
    char v7 = *v6;
    int v8 = (void *)sub_1A2C0D470();
    unsigned int v9 = (const char *)objc_msgSend(v8, sel_UTF8String);
    id v10 = v8;
    sqlite3_prepare_v2(v7, v9, 0x80000000, ppStmt, 0);
    OUTLINED_FUNCTION_24_10();
    uint64_t v5 = 0;
    if (sub_1A2BE624C(v11, v12, v13, 0xD000000000000021, 0x80000001A2C179E0))
    {
      uint64_t v5 = ppStmt[0];
      if (ppStmt[0])
      {
        if (a3 && (sub_1A2BE7550(a3, ppStmt[0]) & 1) == 0)
        {
          sqlite3_finalize(v5);
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_1A2BE7550(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v2 = a2;
  int v4 = sqlite3_bind_parameter_count(a2);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 > v4) {
    return 0;
  }
  if (!v5) {
    return 1;
  }
  unint64_t v7 = 0;
  uint64_t v8 = a1 + 32;
  uint64_t v148 = *(void *)(a1 + 16);
  uint64_t v149 = (uint64_t)v2;
  uint64_t v150 = a1 + 32;
  while (1)
  {
    unint64_t v9 = v7++;
    unint64_t v10 = v8 + 40 * v9;
    unint64_t v12 = *(void *)(v10 + 8);
    uint64_t v11 = *(void *)(v10 + 16);
    unint64_t v13 = *(void *)(v10 + 24);
    char v14 = *(unsigned char *)(v10 + 32);
    uint64_t v159 = v14;
    if ((v14 & 0x80000000) == 0) {
      break;
    }
    if (v9 > 0x7FFFFFFE) {
      goto LABEL_96;
    }
    sqlite3_int64 v32 = *(void *)v10;
    switch(*(void *)(v10 + 16))
    {
      case 1u:
        char v59 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
        int v61 = sqlite3_bind_int64(v59, v60, v32);
        goto LABEL_30;
      case 2u:
        unint64_t v62 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
        int v61 = sqlite3_bind_double(v62, v63, v64);
        goto LABEL_30;
      case 3u:
        switch(v12 >> 62)
        {
          case 1uLL:
            uint64_t v157 = *(void *)(v10 + 16);
            if ((int)v32 > v32 >> 32) {
              goto LABEL_104;
            }
            swift_retain();
            uint64_t v130 = (char *)sub_1A2C0CB70();
            if (!v130) {
              goto LABEL_75;
            }
            uint64_t v131 = sub_1A2C0CB90();
            if (__OFSUB__((int)v32, v131)) {
              goto LABEL_109;
            }
            v130 += (int)v32 - v131;
LABEL_75:
            sub_1A2C0CB80();
            if (__OFSUB__(HIDWORD(v32), v32)) {
              goto LABEL_105;
            }
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            int v43 = sqlite3_bind_blob(v2, v7, v130, HIDWORD(v32) - v32, (void (__cdecl *)(void *))qword_1EB5572E8);
            uint64_t v44 = OUTLINED_FUNCTION_2_33();
            uint64_t v46 = v157;
            goto LABEL_31;
          case 2uLL:
            uint64_t v132 = *(void *)(v32 + 16);
            uint64_t v133 = OUTLINED_FUNCTION_2_33();
            uint64_t v158 = v11;
            sub_1A2B9E0E4(v133, v134, v11, v13, v159);
            swift_retain();
            swift_retain();
            uint64_t v135 = (char *)sub_1A2C0CB70();
            unint64_t v155 = v13;
            if (!v135) {
              goto LABEL_82;
            }
            uint64_t v136 = sub_1A2C0CB90();
            if (__OFSUB__(v132, v136)) {
              goto LABEL_110;
            }
            v135 += v132 - v136;
LABEL_82:
            sub_1A2C0CB80();
            uint64_t v138 = *(void *)(v32 + 16);
            uint64_t v137 = *(void *)(v32 + 24);
            uint64_t v139 = v137 - v138;
            if (__OFSUB__(v137, v138)) {
              goto LABEL_106;
            }
            if (v139 < (uint64_t)0xFFFFFFFF80000000) {
              goto LABEL_107;
            }
            if (v139 > 0x7FFFFFFF) {
              goto LABEL_108;
            }
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            int v43 = sqlite3_bind_blob(v2, v7, v135, v139, (void (__cdecl *)(void *))qword_1EB5572E8);
            swift_release();
            swift_release();
            uint64_t v44 = OUTLINED_FUNCTION_2_33();
            unint64_t v78 = v155;
            uint64_t v46 = v158;
            break;
          case 3uLL:
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            v140 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
            sqlite3_bind_blob(v140, v141, v142, 0, v143);
            uint64_t v144 = OUTLINED_FUNCTION_14_9();
            sub_1A2B9E158(v144, v145, v146, v147, v159);
            sub_1A2B9E158(v32, v12, v11, v13, v159);
            sub_1A2B3EB74(v32, v12, 3);
            uint64_t v124 = OUTLINED_FUNCTION_2_33();
LABEL_91:
            sub_1A2B3EB74(v124, v125, 3);
            if (v11) {
              return 0;
            }
            goto LABEL_50;
          default:
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            unint64_t v65 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
            sqlite3_bind_blob(v65, v66, v67, v68, v69);
            uint64_t v70 = OUTLINED_FUNCTION_14_9();
            sub_1A2B9E158(v70, v71, v72, v73, v159);
            sub_1A2B9E158(v32, v12, v11, v13, v159);
            sub_1A2B3EB74(v32, v12, 3);
            uint64_t v74 = OUTLINED_FUNCTION_2_33();
LABEL_45:
            sub_1A2B3EB74(v74, v75, 3);
            if (v11) {
              return 0;
            }
            goto LABEL_50;
        }
        goto LABEL_32;
      case 4u:
        uint64_t v76 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
        int v61 = sqlite3_bind_null(v76, v77);
LABEL_30:
        int v43 = v61;
        uint64_t v44 = OUTLINED_FUNCTION_2_33();
        break;
      default:
        uint64_t v33 = OUTLINED_FUNCTION_2_33();
        sub_1A2B3EA24(v33, v34, 0);
        uint64_t v35 = v5;
        uint64_t v36 = v8;
        uint64_t v37 = v11;
        uint64_t v38 = (void *)sub_1A2C0D470();
        int v39 = (const char *)objc_msgSend(v38, sel_UTF8String);
        id v40 = v38;
        uint64_t v41 = (sqlite3_stmt *)OUTLINED_FUNCTION_26_4();
        int v43 = sqlite3_bind_text(v41, v42, v39, -1, 0);
        uint64_t v44 = OUTLINED_FUNCTION_2_33();
        uint64_t v46 = v37;
        uint64_t v8 = v36;
        uint64_t v5 = v35;
        break;
    }
LABEL_31:
    unint64_t v78 = v13;
LABEL_32:
    sub_1A2B9E158(v44, v45, v46, v78, v159);
    if (v43) {
      return 0;
    }
LABEL_50:
    if (v7 == v5) {
      return 1;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v154 = v13;
  uint64_t v156 = v11;
  sub_1A2B3EA24(v11, v13, v14);
  swift_bridgeObjectRelease();
  int v15 = *(char *)(v10 + 32);
  if (v15 < 0) {
    goto LABEL_36;
  }
  uint64_t v16 = OUTLINED_FUNCTION_2_33();
  uint64_t v151 = v17;
  unint64_t v152 = v18;
  unint64_t v153 = v7;
  sub_1A2B9E0E4(v16, v19, v17, v18, v15);
  uint64_t v20 = qword_1EB554530;
  swift_bridgeObjectRetain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1EB557330;
  uint64_t v22 = *(void *)(qword_1EB557330 + 16);
  if (!v22)
  {
LABEL_22:
    OUTLINED_FUNCTION_2_33();
    sub_1A2C0D530();
    uint64_t v51 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_17(v51, v52, v53, v54, v55, v56, v57, v58, v148, v149, v150, v151, v152);
    unint64_t v7 = v153;
    goto LABEL_36;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v23 = sub_1A2C0D570();
  swift_bridgeObjectRelease();
  if (v23)
  {
    uint64_t v24 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_17(v24, v25, v26, v27, v28, v29, v30, v31, v148, v149, v150, v151, v152);
    goto LABEL_35;
  }
  if (v22 == 1)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v5 = v148;
    uint64_t v2 = (sqlite3_stmt *)v149;
    uint64_t v8 = v150;
    goto LABEL_22;
  }
  uint64_t v47 = v21 + 56;
  uint64_t v48 = 1;
  while (1)
  {
    uint64_t v49 = v48 + 1;
    if (__OFADD__(v48, 1))
    {
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
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
    }
    swift_bridgeObjectRetain();
    char v50 = sub_1A2C0D570();
    swift_bridgeObjectRelease();
    if (v50) {
      break;
    }
    ++v48;
    v47 += 16;
    if (v49 == v22) {
      goto LABEL_21;
    }
  }
  uint64_t v79 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_17(v79, v80, v81, v82, v83, v84, v85, v86, v148, v149, v150, v151, v152);
  uint64_t v5 = v148;
  uint64_t v2 = (sqlite3_stmt *)v149;
LABEL_35:
  uint64_t v8 = v150;
  unint64_t v7 = v153;
LABEL_36:
  uint64_t v87 = (void *)sub_1A2C0D470();
  unsigned __int8 v88 = (const char *)objc_msgSend(v87, sel_UTF8String);
  id v89 = v87;
  int v90 = sqlite3_bind_parameter_index(v2, v88);
  unint64_t v91 = v154;
  if (v90)
  {
    int v92 = v90;
    switch(v159)
    {
      case 1:
        uint64_t v97 = (sqlite3_stmt *)OUTLINED_FUNCTION_15_11();
        int v100 = sqlite3_bind_int64(v97, v98, v99);
        goto LABEL_48;
      case 2:
        uint64_t v101 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_9();
        int v100 = sqlite3_bind_double(v101, v102, v103);
        goto LABEL_48;
      case 3:
        switch(v154 >> 62)
        {
          case 1uLL:
            if ((int)v156 > v156 >> 32) {
              goto LABEL_97;
            }
            swift_retain();
            if (sub_1A2C0CB70() && __OFSUB__((int)v156, sub_1A2C0CB90())) {
              goto LABEL_102;
            }
            unint64_t v91 = v154;
            sub_1A2C0CB80();
            if (__OFSUB__(HIDWORD(v156), v156)) {
              goto LABEL_98;
            }
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            uint64_t v111 = (sqlite3_stmt *)OUTLINED_FUNCTION_15_11();
            LODWORD(v11) = sqlite3_bind_blob(v111, v112, v113, HIDWORD(v156) - v156, v114);
            swift_bridgeObjectRelease();
            uint64_t v115 = v156;
LABEL_70:
            sub_1A2B3EB74(v115, v91, 3);
            uint64_t v124 = v115;
            unint64_t v125 = v91;
            goto LABEL_91;
          case 2uLL:
            uint64_t v116 = *(void *)(v156 + 16);
            sub_1A2B3EA24(v156, v154, 3);
            swift_retain();
            swift_retain();
            if (sub_1A2C0CB70() && __OFSUB__(v116, sub_1A2C0CB90())) {
              goto LABEL_103;
            }
            sub_1A2C0CB80();
            uint64_t v118 = *(void *)(v156 + 16);
            uint64_t v117 = *(void *)(v156 + 24);
            uint64_t v119 = v117 - v118;
            if (__OFSUB__(v117, v118)) {
              goto LABEL_99;
            }
            if (v119 < (uint64_t)0xFFFFFFFF80000000) {
              goto LABEL_100;
            }
            if (v119 > 0x7FFFFFFF) {
              goto LABEL_101;
            }
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            uint64_t v120 = (sqlite3_stmt *)OUTLINED_FUNCTION_15_11();
            LODWORD(v11) = sqlite3_bind_blob(v120, v121, v122, v119, v123);
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            sub_1A2B3EB74(v156, v154, 3);
            uint64_t v124 = v156;
            unint64_t v125 = v154;
            break;
          case 3uLL:
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            uint64_t v126 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_9();
            LODWORD(v11) = sqlite3_bind_blob(v126, v127, v128, 0, v129);
            uint64_t v115 = v156;
            sub_1A2B3EB74(v156, v154, 3);
            swift_bridgeObjectRelease();
            goto LABEL_70;
          default:
            if (qword_1EB554408 != -1) {
              swift_once();
            }
            uint64_t v104 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_9();
            LODWORD(v11) = sqlite3_bind_blob(v104, v105, v106, v107, v108);
            sub_1A2B3EB74(v156, v154, 3);
            swift_bridgeObjectRelease();
            sub_1A2B3EB74(v156, v154, 3);
            uint64_t v74 = v156;
            unint64_t v75 = v154;
            goto LABEL_45;
        }
        goto LABEL_91;
      case 4:
        uint64_t v109 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_9();
        int v100 = sqlite3_bind_null(v109, v110);
LABEL_48:
        int v96 = v100;
        break;
      default:
        uint64_t v93 = (void *)sub_1A2C0D470();
        uint64_t v94 = (const char *)objc_msgSend(v93, sel_UTF8String);
        id v95 = v93;
        int v96 = sqlite3_bind_text(v2, v92, v94, -1, 0);
        sub_1A2B3EB74(v156, v154, 0);
        break;
    }
    swift_bridgeObjectRelease();
    if (!v96) {
      goto LABEL_50;
    }
  }
  else
  {
    sub_1A2B3EB74(v156, v154, v14);
    swift_bridgeObjectRelease();
  }
  return 0;
}

sqlite3 *sub_1A2BE8110()
{
  int v1 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  swift_beginAccess();
  uint64_t result = *v1;
  if (*v1)
  {
    uint64_t result = (sqlite3 *)sqlite3_close_v2(result);
    *int v1 = 0;
  }
  return result;
}

uint64_t sub_1A2BE8164()
{
  sub_1A2BE8110();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storagePath;
  sub_1A2C0CCF0();
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1A2BE8200()
{
  return type metadata accessor for DbStorage();
}

uint64_t type metadata accessor for DbStorage()
{
  uint64_t result = qword_1EB554590;
  if (!qword_1EB554590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BE8250()
{
  uint64_t result = sub_1A2C0CCF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1A2BE8304(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
LABEL_3:
    uint64_t v3 = __clz(__rbit64(v1)) + v2;
    return OUTLINED_FUNCTION_16_11(v3);
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return OUTLINED_FUNCTION_16_11(v3);
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    goto LABEL_3;
  }
  uint64_t v2 = 64;
  uint64_t v7 = 10;
  while (v7 - 8 < (unint64_t)(v3 + 63) >> 6)
  {
    unint64_t v1 = *(void *)(a1 + 8 * v7);
    v2 += 64;
    ++v7;
    if (v1) {
      goto LABEL_3;
    }
  }
  return OUTLINED_FUNCTION_16_11(v3);
}

uint64_t sub_1A2BE8378(uint64_t a1)
{
  return OUTLINED_FUNCTION_16_11(1 << *(unsigned char *)(a1 + 32));
}

uint64_t sub_1A2BE8388@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (result < 0 || 1 << *(unsigned char *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a3 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    uint64_t v4 = *(void *)(a3 + 56) + 24 * result;
    uint64_t v5 = *(void *)v4;
    unint64_t v6 = *(void *)(v4 + 8);
    *(void *)a4 = *(void *)v4;
    *(void *)(a4 + 8) = v6;
    char v7 = *(unsigned char *)(v4 + 16);
    *(unsigned char *)(a4 + 16) = v7;
    return sub_1A2B3EA24(v5, v6, v7);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1A2BE83EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_5_21(a1, a2, a3);
  uint64_t v5 = v4(v3);
  unsigned __int8 v8 = sub_1A2BE6C6C(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1A2BE8440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_5_21(a1, a2, a3);
  uint64_t v5 = v4(v3);
  uint64_t v8 = sub_1A2BE6D8C(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_23()
{
  return sub_1A2C0D530();
}

uint64_t OUTLINED_FUNCTION_5_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t OUTLINED_FUNCTION_8_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13)
{
  return sub_1A2B9E158(v15, v14, a12, a13, v13);
}

uint64_t OUTLINED_FUNCTION_9_18(uint64_t a1)
{
  return sqlite3_exec(v1, (const char *)(a1 + 32), 0, 0, 0);
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return v0;
}

void OUTLINED_FUNCTION_13_14(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= 1 << v1;
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_11@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_18_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_8()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_21_12@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_22_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return a14;
}

uint64_t sub_1A2BE8674(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
    sub_1A2BE0384();
    uint64_t v2 = v11;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_1A2BE0384();
      }
      v4 += 8;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1A2BE874C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void, void *))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v3)
  {
    uint64_t v25 = MEMORY[0x1E4FBC860];
    sub_1A2BE0384();
    uint64_t result = v25;
    uint64_t v5 = (unsigned char *)(a1 + 88);
    do
    {
      uint64_t v6 = *((void *)v5 - 6);
      uint64_t v20 = *((void *)v5 - 7);
      uint64_t v22 = result;
      unsigned int v19 = *(v5 - 40);
      int v7 = *(v5 - 39);
      unint64_t v9 = *((void *)v5 - 3);
      uint64_t v10 = *((void *)v5 - 2);
      unint64_t v11 = *((void *)v5 - 1);
      v23[0] = *((void *)v5 - 4);
      uint64_t v8 = v23[0];
      v23[1] = v9;
      void v23[2] = v10;
      v23[3] = v11;
      char v24 = *v5;
      char v12 = v24;
      swift_bridgeObjectRetain();
      sub_1A2BE90BC(v8, v9, v10, v11, v12);
      if (v7) {
        int v13 = 256;
      }
      else {
        int v13 = 0;
      }
      uint64_t v14 = a2(v20, v6, v13 | v19, v23);
      uint64_t v21 = v15;
      swift_bridgeObjectRelease();
      sub_1A2BE90D0(v8, v9, v10, v11, v12);
      uint64_t result = v22;
      uint64_t v25 = v22;
      unint64_t v16 = *(void *)(v22 + 16);
      if (v16 >= *(void *)(v22 + 24) >> 1)
      {
        sub_1A2BE0384();
        uint64_t result = v25;
      }
      v5 += 64;
      *(void *)(result + 16) = v16 + 1;
      uint64_t v17 = result + 16 * v16;
      *(void *)(v17 + 32) = v14;
      *(void *)(v17 + 40) = v21;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_1A2BE88D0()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_1A2BE8674(v1);
  swift_bridgeObjectRelease();
  v9[0] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
  sub_1A2B3EA9C();
  OUTLINED_FUNCTION_0_28();
  swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_1A2BE874C(v3, (uint64_t (*)(uint64_t, uint64_t, void, void *))sub_1A2BE8D40);
  swift_bridgeObjectRelease();
  v9[0] = v4;
  OUTLINED_FUNCTION_0_28();
  swift_bridgeObjectRelease();
  sub_1A2BE8D4C(v0 + 24, (uint64_t)v8);
  sub_1A2BE8D4C((uint64_t)v8, (uint64_t)v9);
  if (v9[0]) {
    sub_1A2BE8DB4(v9[0], v9[1]);
  }
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  strcpy((char *)v6, "INSERT INTO ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  if (!*(void *)(v7 + 16)) {
    swift_bridgeObjectRelease();
  }
  return v6[0];
}

uint64_t sub_1A2BE8B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  sub_1A2BE90E4(a4, (uint64_t)v20);
  uint64_t v8 = v20[0];
  unint64_t v7 = v20[1];
  uint64_t v9 = v20[2];
  unint64_t v10 = v20[3];
  int v11 = v21;
  sub_1A2BE90E4(a4, (uint64_t)v22);
  if (v22[32] > 0xF7u) {
    return 1280070990;
  }
  sub_1A2BE9140((uint64_t)v22, (uint64_t)v23);
  sub_1A2B9E0E4(v8, v7, v9, v10, v11);
  sub_1A2B86518();
  uint64_t v12 = *(void *)(*a5 + 16);
  sub_1A2B867C0();
  uint64_t v13 = *a5;
  *(void *)(v13 + 16) = v12 + 1;
  sub_1A2BE9140((uint64_t)v23, v13 + 40 * v12 + 32);
  if (v11 < 0) {
    return 63;
  }
  sub_1A2BE919C(a4, (void (*)(void, void, void, void, void))sub_1A2BE90BC);
  uint64_t v14 = qword_1EB554530;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1EB557330;
  uint64_t v16 = *(void *)(qword_1EB557330 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = v15 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      char v18 = sub_1A2C0D570();
      swift_bridgeObjectRelease();
      if (v18) {
        break;
      }
      v17 += 16;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    sub_1A2BE919C(a4, (void (*)(void, void, void, void, void))sub_1A2BE90D0);
  }
  else
  {
LABEL_11:
    sub_1A2C0D530();
    swift_bridgeObjectRelease();
    sub_1A2BE919C(a4, (void (*)(void, void, void, void, void))sub_1A2BE90D0);
    return 64;
  }
  return v8;
}

uint64_t sub_1A2BE8D40(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  return sub_1A2BE8B2C(a1, a2, a3 & 0x1FF, a4, *(uint64_t **)(v4 + 16));
}

uint64_t sub_1A2BE8D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5541C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2BE8DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3) {
    return 0;
  }
  v20[0] = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRetain();
  sub_1A2BE0384();
  uint64_t v5 = v20[0];
  uint64_t v6 = (uint64_t *)(a1 + 40);
  do
  {
    uint64_t v8 = *(v6 - 1);
    uint64_t v7 = *v6;
    v20[0] = v5;
    unint64_t v9 = *(void *)(v5 + 16);
    unint64_t v10 = *(void *)(v5 + 24);
    swift_bridgeObjectRetain();
    if (v9 >= v10 >> 1)
    {
      sub_1A2BE0384();
      uint64_t v5 = v20[0];
    }
    v6 += 3;
    *(void *)(v5 + 16) = v9 + 1;
    uint64_t v11 = v5 + 16 * v9;
    *(void *)(v11 + 32) = v8;
    *(void *)(v11 + 40) = v7;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  v20[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5545F0);
  sub_1A2B3EA9C();
  sub_1A2C0D440();
  swift_bridgeObjectRelease();
  uint64_t v21 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRetain();
  sub_1A2BE0384();
  uint64_t v13 = v21;
  uint64_t v14 = (uint64_t *)(a2 + 40);
  do
  {
    uint64_t v15 = *(v14 - 1);
    uint64_t v16 = *v14;
    swift_bridgeObjectRetain();
    sub_1A2C0DB60();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20[0] = v15;
    v20[1] = v16;
    sub_1A2C0D530();
    swift_bridgeObjectRetain();
    sub_1A2C0D530();
    swift_bridgeObjectRelease_n();
    uint64_t v21 = v13;
    unint64_t v17 = *(void *)(v13 + 16);
    if (v17 >= *(void *)(v13 + 24) >> 1)
    {
      sub_1A2BE0384();
      uint64_t v13 = v21;
    }
    v14 += 3;
    *(void *)(v13 + 16) = v17 + 1;
    uint64_t v18 = v13 + 16 * v17;
    *(void *)(v18 + 32) = v15;
    *(void *)(v18 + 40) = v16;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  sub_1A2C0D440();
  swift_bridgeObjectRelease();
  sub_1A2C0DB60();
  swift_bridgeObjectRelease();
  strcpy((char *)v20, "ON CONFLICT(");
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  return v20[0];
}

uint64_t sub_1A2BE90BC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  if (a5 <= 0xF7u) {
    return sub_1A2B9E0E4(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1A2BE90D0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  if (a5 <= 0xF7u) {
    return sub_1A2B9E158(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1A2BE90E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A2BE9140(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A2BE919C(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

void *assignWithCopy for SQLInsertConflictClause(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SQLInsertConflictClause()
{
  return &type metadata for SQLInsertConflictClause;
}

void sub_1A2BE924C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id FBFStorageShim.__allocating_init(applicationIdentifier:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  uint64_t v8 = &v7[OBJC_IVAR___SiriAnalyticsFBFStorage_underlying];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 3) = &type metadata for FBFStorageConcrete;
  *((void *)v8 + 4) = &off_1EF5C2D80;
  *((void *)v8 + 2) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id FBFStorageShim.init(applicationIdentifier:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = &v3[OBJC_IVAR___SiriAnalyticsFBFStorage_underlying];
  *(void *)id v4 = a1;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 3) = &type metadata for FBFStorageConcrete;
  *((void *)v4 + 4) = &off_1EF5C2D80;
  *((void *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for FBFStorageShim();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for FBFStorageShim()
{
  return self;
}

void sub_1A2BE9404(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void (**a5)(void, void))
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a5;
  _Block_copy(a5);
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  OffDeviceTopic.init(rawValue:)(v11);
  if (v18 == 4)
  {
    sub_1A2BE9678();
    uint64_t v12 = (void *)swift_allocError();
    uint64_t v13 = (void *)sub_1A2C0CC30();
    ((void (**)(void, void *))a5)[2](a5, v13);
  }
  else
  {
    uint64_t v14 = (void *)(a4 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying);
    uint64_t v15 = *(void *)(a4 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 24);
    uint64_t v16 = v14[4];
    __swift_project_boxed_opaque_existential_1(v14, v15);
    char v17 = v18;
    (*(void (**)(uint64_t, char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v16 + 8))(a1, &v17, sub_1A2BEAE44, v10, v15, v16);
  }
  swift_release();
  _Block_release(a5);
}

void sub_1A2BE955C(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  OffDeviceTopic.init(rawValue:)(v11);
  if (v16 == 4)
  {
    sub_1A2BE9678();
    uint64_t v12 = (void *)swift_allocError();
    a4();
  }
  else
  {
    uint64_t v13 = *(void *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 24);
    uint64_t v14 = *(void *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying), v13);
    char v15 = v16;
    (*(void (**)(uint64_t, char *, void (*)(void), uint64_t, uint64_t, uint64_t))(v14 + 8))(a1, &v15, a4, a5, v13, v14);
  }
}

unint64_t sub_1A2BE9678()
{
  unint64_t result = qword_1E9597238;
  if (!qword_1E9597238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597238);
  }
  return result;
}

void sub_1A2BE976C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1A2C0CC30();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id FBFStorageShim.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void FBFStorageShim.init()()
{
}

id FBFStorageShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBFStorageShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t dispatch thunk of FBFStorage.store(_:topic:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of FBFStorage.store(_:topic:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::String v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_1A2B59624;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for FBFStorageShim(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FBFStorageShim);
}

uint64_t dispatch thunk of FBFStorageShim.__allocating_init(applicationIdentifier:telemetry:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of FBFStorageShim.store(_:topic:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

unsigned char *storeEnumTagSinglePayload for FBFStorageError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A2BE9AA4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FBFStorageError()
{
  return &type metadata for FBFStorageError;
}

void destroy for FBFStorageConcrete(uint64_t a1)
{
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 16);
}

void *_s13SiriAnalytics18FBFStorageConcreteVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unsigned int v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for FBFStorageConcrete(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for FBFStorageConcrete(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for FBFStorageConcrete(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for FBFStorageConcrete(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FBFStorageConcrete()
{
  return &type metadata for FBFStorageConcrete;
}

unint64_t sub_1A2BE9C98()
{
  unint64_t result = qword_1E9597248;
  if (!qword_1E9597248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597248);
  }
  return result;
}

void sub_1A2BE9CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = objc_msgSend(self, sel_sharedLogger);
  uint64_t v14 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  char v15 = (void *)swift_allocObject();
  v15[2] = a5;
  v15[3] = a6;
  v15[4] = a7;
  v15[5] = a1;
  v15[6] = a3;
  v15[7] = a4;
  void v19[4] = sub_1A2BEADFC;
  v19[5] = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  v19[2] = sub_1A2BE924C;
  _OWORD v19[3] = &block_descriptor_17;
  char v16 = _Block_copy(v19);
  id v17 = a7;
  id v18 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v13, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v18, v14, v16);
  _Block_release(v16);
}

uint64_t sub_1A2BE9ED4(id a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t (*a6)(id))
{
  if (a1)
  {
    id v11 = a1;
    if (qword_1EB556808 != -1) {
      swift_once();
    }
    sub_1A2C0DB60();
    sub_1A2C0D530();
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
    sub_1A2C0DC40();
    sub_1A2BAB6C8(0, 0xE000000000000000, 0xD000000000000064, 0x80000001A2C17BB0, 0xD00000000000001ALL, 0x80000001A2C17C20);
    swift_bridgeObjectRelease();
    sub_1A2BEA05C((uint64_t)a1, a5, a2, a3, a4);
  }
  return a6(a1);
}

void sub_1A2BEA05C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a5)
  {
    id v6 = a5;
    id v7 = (id)sub_1A2C0CC30();
    unsigned __int8 v8 = sub_1A2BEA838(v7);
    uint64_t v9 = sub_1A2BEACF8(a2);
    if (v10 >> 60 == 15)
    {
      id v13 = 0;
      objc_msgSend(v6, sel_trackFBFError_forEventData_, v8, 0);
    }
    else
    {
      uint64_t v11 = v9;
      unint64_t v12 = v10;
      id v13 = (id)sub_1A2C0CD20();
      sub_1A2B48634(v11, v12);
      objc_msgSend(v6, sel_trackFBFError_forEventData_, v8, v13);
    }
  }
}

uint64_t sub_1A2BEA12C(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a3;
  *(unsigned char *)(v5 + 72) = *a2;
  return MEMORY[0x1F4188298](sub_1A2BEA158, 0, 0);
}

uint64_t sub_1A2BEA158()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 40);
  long long v8 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  *(void *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 24) = v1;
  *(_OWORD *)(v4 + 32) = v8;
  *(void *)(v4 + 48) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1A2BEA27C;
  uint64_t v6 = MEMORY[0x1E4FBC848] + 8;
  return MEMORY[0x1F4188160](v5, 0, 0, 0x3A5F2865726F7473, 0xEF293A6369706F74, sub_1A2BEAB70, v4, v6);
}

uint64_t sub_1A2BEA27C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v5 = v4;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_1A2BEA380;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = sub_1A2BEA368;
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t sub_1A2BEA368()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A2BEA380()
{
  OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1A2BEA3E0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v21 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AD8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(self, sel_sharedLogger);
  id v13 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v21, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  char v15 = (char *)swift_allocObject();
  uint64_t v16 = v23;
  *((void *)v15 + 2) = v22;
  *((void *)v15 + 3) = v16;
  *((void *)v15 + 4) = a6;
  *((void *)v15 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v15[v14], v11, v8);
  aBlock[4] = sub_1A2BEAC64;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A2BE924C;
  aBlock[3] = &block_descriptor_16;
  id v17 = _Block_copy(aBlock);
  id v18 = a6;
  id v19 = a2;
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v12, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v19, v13, v17);
  _Block_release(v17);
}

uint64_t sub_1A2BEA688(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (a1)
  {
    id v10 = a1;
    if (qword_1EB556808 != -1) {
      swift_once();
    }
    sub_1A2C0DB60();
    sub_1A2C0D530();
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
    sub_1A2C0DC40();
    sub_1A2BAB6C8(0, 0xE000000000000000, 0xD000000000000064, 0x80000001A2C17BB0, 0x3A5F2865726F7473, 0xEF293A6369706F74);
    swift_bridgeObjectRelease();
    sub_1A2BEA05C((uint64_t)a1, a5, a2, a3, a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AD8);
    return sub_1A2C0D650();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AD8);
    return sub_1A2C0D660();
  }
}

uint64_t sub_1A2BEA838(void *a1)
{
  type metadata accessor for FLError(0);
  sub_1A2BEAD5C();
  sub_1A2C0CC00();

  uint64_t result = 1;
  switch(v3)
  {
    case -9:
      uint64_t result = 39;
      break;
    case -8:
      uint64_t result = 38;
      break;
    case -7:
      uint64_t result = 7;
      break;
    case -6:
      uint64_t result = 6;
      break;
    case -5:
      uint64_t result = 5;
      break;
    case -4:
      uint64_t result = 4;
      break;
    case -3:
      uint64_t result = 3;
      break;
    case -2:
      uint64_t result = 2;
      break;
    case -1:
      return result;
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t result = 8;
      break;
    case 2:
      uint64_t result = 9;
      break;
    case 3:
      uint64_t result = 10;
      break;
    case 4:
      uint64_t result = 11;
      break;
    case 5:
      uint64_t result = 12;
      break;
    case 6:
      uint64_t result = 13;
      break;
    case 7:
      uint64_t result = 14;
      break;
    case 8:
      uint64_t result = 15;
      break;
    case 9:
      uint64_t result = 16;
      break;
    case 10:
      uint64_t result = 17;
      break;
    case 11:
      uint64_t result = 18;
      break;
    case 12:
      uint64_t result = 19;
      break;
    case 13:
      uint64_t result = 20;
      break;
    case 14:
      uint64_t result = 21;
      break;
    case 15:
      uint64_t result = 22;
      break;
    case 16:
      uint64_t result = 23;
      break;
    case 17:
      uint64_t result = 24;
      break;
    case 18:
      uint64_t result = 25;
      break;
    case 19:
      uint64_t result = 26;
      break;
    case 20:
      uint64_t result = 27;
      break;
    case 21:
      uint64_t result = 28;
      break;
    case 22:
      uint64_t result = 29;
      break;
    case 23:
      uint64_t result = 30;
      break;
    case 24:
      uint64_t result = 31;
      break;
    case 25:
      uint64_t result = 32;
      break;
    case 26:
      uint64_t result = 33;
      break;
    case 27:
      uint64_t result = 34;
      break;
    case 28:
      uint64_t result = 35;
      break;
    default:
      if (v3 == 100)
      {
        uint64_t result = 36;
      }
      else if (v3 == 101)
      {
        uint64_t result = 37;
      }
      else
      {
LABEL_6:
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

void sub_1A2BEAAA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A2BE9CE4(a1, a2, a3, a4, *(void *)v4, *(void *)(v4 + 8), *(void **)(v4 + 16));
}

uint64_t sub_1A2BEAAB0(uint64_t a1, unsigned char *a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_1A2B59624;
  return sub_1A2BEA12C(a1, a2, v6, v7, v8);
}

void sub_1A2BEAB70(uint64_t a1)
{
  sub_1A2BEA3E0(a1, *(void **)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_1A2BEAB84()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AD8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1A2BEAC64(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595AD8);
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (void *)v1[4];
  uint64_t v6 = (void *)v1[5];
  return sub_1A2BEA688(a1, v3, v4, v5, v6);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1A2BEACF8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_data);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A2C0CD30();

  return v3;
}

unint64_t sub_1A2BEAD5C()
{
  unint64_t result = qword_1E9596570;
  if (!qword_1E9596570)
  {
    type metadata accessor for FLError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9596570);
  }
  return result;
}

uint64_t sub_1A2BEADAC()
{
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1A2BEADFC(void *a1)
{
  return sub_1A2BE9ED4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), *(uint64_t (**)(id))(v1 + 48));
}

uint64_t sub_1A2BEAE0C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1A2BEAE44(uint64_t a1)
{
  sub_1A2BE976C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1A2BEAE54(uint64_t a1, void (*a2)(uint64_t *, char *), uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595F70);
  MEMORY[0x1F4188790](v27);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v34 = a1;
  sub_1A2BC60E0(a4);
  uint64_t v12 = v29;
  int64_t v13 = v32;
  unint64_t v14 = v33;
  uint64_t v25 = v30;
  int64_t v26 = (unint64_t)(v31 + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v14) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v16 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  unint64_t v17 = v16 | (v13 << 6);
  while (1)
  {
    uint64_t v21 = *(void *)(v12 + 48);
    uint64_t v22 = type metadata accessor for PreprocessorCounterKey(0);
    sub_1A2B4B218(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v17, (uint64_t)v11, (void (*)(void))type metadata accessor for PreprocessorCounterKey);
    *(void *)&v11[*(int *)(v27 + 48)] = *(void *)(*(void *)(v12 + 56) + 8 * v17);
    sub_1A2B4B2CC((uint64_t)v11, (uint64_t)v8, &qword_1E9595F70);
    v28(&v34, v8);
    if (v4)
    {
      swift_bridgeObjectRelease();
      sub_1A2B653F8((uint64_t)v8, &qword_1E9595F70);
      return swift_release();
    }
    uint64_t result = sub_1A2B653F8((uint64_t)v8, &qword_1E9595F70);
    if (v14) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v18 >= v26) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v25 + 8 * v18);
    if (!v19)
    {
      int64_t v20 = v13 + 2;
      if (v13 + 2 >= v26) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v25 + 8 * v20);
      if (v19) {
        goto LABEL_12;
      }
      int64_t v20 = v13 + 3;
      if (v13 + 3 >= v26) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v25 + 8 * v20);
      if (v19) {
        goto LABEL_12;
      }
      int64_t v20 = v13 + 4;
      if (v13 + 4 >= v26) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v25 + 8 * v20);
      if (v19)
      {
LABEL_12:
        int64_t v18 = v20;
      }
      else
      {
        int64_t v18 = v13 + 5;
        if (v13 + 5 >= v26) {
          goto LABEL_24;
        }
        unint64_t v19 = *(void *)(v25 + 8 * v18);
        if (!v19)
        {
          int64_t v23 = v13 + 6;
          while (v23 < v26)
          {
            unint64_t v19 = *(void *)(v25 + 8 * v23++);
            if (v19)
            {
              int64_t v18 = v23 - 1;
              goto LABEL_13;
            }
          }
LABEL_24:
          swift_release();
          return v34;
        }
      }
    }
LABEL_13:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v18 << 6);
    int64_t v13 = v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2BEB114(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  char v59 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595FA8);
  MEMORY[0x1F4188790](v7);
  uint64_t v55 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v62 = (uint64_t)&v51 - v10;
  MEMORY[0x1F4188790](v11);
  uint64_t v58 = (uint64_t)&v51 - v12;
  sub_1A2BC60E0(a2);
  uint64_t v60 = v63;
  int64_t v61 = v66;
  unint64_t v13 = v67;
  uint64_t v56 = v64;
  int64_t v57 = (unint64_t)(v65 + 64) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  uint64_t v52 = v7;
  if (!v13) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v14 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  unint64_t v15 = v14 | (v61 << 6);
  while (1)
  {
    uint64_t v20 = v60;
    uint64_t v21 = *(void *)(v60 + 48);
    uint64_t v22 = type metadata accessor for PreprocessorResultCounterKey(0);
    uint64_t v23 = v21 + *(void *)(*(void *)(v22 - 8) + 72) * v15;
    uint64_t v24 = v58;
    sub_1A2B4B218(v23, v58, (void (*)(void))type metadata accessor for PreprocessorResultCounterKey);
    *(void *)(v24 + *(int *)(v7 + 48)) = *(void *)(*(void *)(v20 + 56) + 8 * v15);
    uint64_t v25 = v62;
    sub_1A2B4B2CC(v24, v62, &qword_1E9595FA8);
    if ((a3(v25) & 1) == 0) {
      goto LABEL_33;
    }
    uint64_t v26 = *(int *)(v7 + 48);
    uint64_t v27 = v55;
    sub_1A2B4B218(v25, v55, (void (*)(void))type metadata accessor for PreprocessorResultCounterKey);
    *(void *)(v27 + v26) = *(void *)(v25 + v26);
    uint64_t v28 = v27 + *(int *)(v22 + 20);
    uint64_t v29 = v25;
    int v30 = *(_DWORD *)v28;
    uint64_t v31 = *(void *)(v28 + 8);
    sub_1A2BED994(v27);
    uint64_t v32 = *(void *)(v29 + v26);
    unint64_t v33 = v59;
    swift_isUniquelyReferenced_nonNull_native();
    int v68 = v33;
    unint64_t v34 = sub_1A2B55038(v30, v31);
    if (__OFADD__(v33[2], (v35 & 1) == 0)) {
      break;
    }
    unint64_t v36 = v34;
    char v37 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9596170);
    char v38 = sub_1A2C0DC50();
    int v39 = v68;
    if (v38)
    {
      unint64_t v40 = sub_1A2B55038(v30, v31);
      if ((v37 & 1) != (v41 & 1)) {
        goto LABEL_40;
      }
      unint64_t v36 = v40;
    }
    swift_bridgeObjectRelease();
    if (v37)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v39[(v36 >> 6) + 8] |= 1 << v36;
      uint64_t v42 = v39[6] + 16 * v36;
      *(_DWORD *)uint64_t v42 = v30;
      *(void *)(v42 + 8) = v31;
      *(void *)(v39[7] + 8 * v36) = 0;
      uint64_t v43 = v39[2];
      uint64_t v44 = v43 + 1;
      BOOL v45 = __OFADD__(v43, 1);
      swift_bridgeObjectRetain();
      if (v45) {
        goto LABEL_39;
      }
      v39[2] = v44;
    }
    uint64_t v46 = v39[7];
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void *)(v46 + 8 * v36);
    BOOL v48 = __CFADD__(v47, v32);
    uint64_t v49 = v47 + v32;
    uint64_t v25 = v62;
    if (v48) {
      goto LABEL_37;
    }
    char v59 = v39;
    *(void *)(v46 + 8 * v36) = v49;
    a3 = v53;
    uint64_t v7 = v52;
LABEL_33:
    sub_1A2B653F8(v25, &qword_1E9595FA8);
    if (v13) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v16 = v61 + 1;
    if (__OFADD__(v61, 1)) {
      goto LABEL_38;
    }
    if (v16 >= v57) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v56 + 8 * v16);
    int64_t v18 = v61 + 1;
    if (!v17)
    {
      int64_t v18 = v61 + 2;
      if (v61 + 2 >= v57) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v56 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v61 + 3;
        if (v61 + 3 >= v57) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v56 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v61 + 4;
          if (v61 + 4 >= v57) {
            goto LABEL_35;
          }
          unint64_t v17 = *(void *)(v56 + 8 * v18);
          if (!v17)
          {
            int64_t v18 = v61 + 5;
            if (v61 + 5 >= v57) {
              goto LABEL_35;
            }
            unint64_t v17 = *(void *)(v56 + 8 * v18);
            if (!v17)
            {
              int64_t v19 = v61 + 6;
              while (v19 < v57)
              {
                unint64_t v17 = *(void *)(v56 + 8 * v19++);
                if (v17)
                {
                  int64_t v18 = v19 - 1;
                  goto LABEL_18;
                }
              }
LABEL_35:
              swift_release();
              return (uint64_t)v59;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v13 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
    int64_t v61 = v18;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_1A2C0DDE0();
  __break(1u);
  return result;
}

uint64_t sub_1A2BEB57C()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_14((uint64_t)sub_1A2BEB594);
}

uint64_t sub_1A2BEB594()
{
  id v1 = sub_1A2BECA58();
  v0[3] = v1;
  id v2 = sub_1A2BECC48();
  v0[4] = v2;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F20]), sel_init);
  objc_msgSend(v2, sel_setStartedOrChanged_, v3);

  id v4 = objc_msgSend(v2, sel_startedOrChanged);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v0[2];
    uint64_t v7 = type metadata accessor for PreprocessorTelemetry(0);
    objc_msgSend(v5, sel_setReason_, sub_1A2B3D1BC(*(void *)(v6 + *(int *)(v7 + 20))));
  }
  objc_msgSend(v1, sel_setPreprocessorExecutionContext_, v2);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[5] = v8;
  void *v8 = v0;
  v8[1] = sub_1A2BEB6E0;
  uint64_t v9 = OUTLINED_FUNCTION_9_19();
  return sub_1A2BECE54(v9);
}

uint64_t sub_1A2BEB6E0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1A2BEB7A8()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void **)(v0 + 24);

  OUTLINED_FUNCTION_3_1();
  return v2();
}

uint64_t sub_1A2BEB804()
{
  OUTLINED_FUNCTION_2_0();
  v1[11] = v2;
  v1[12] = v0;
  uint64_t v3 = sub_1A2C0CE20();
  v1[13] = v3;
  OUTLINED_FUNCTION_0_8(v3);
  v1[14] = v4;
  v1[15] = swift_task_alloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

void sub_1A2BEB898()
{
  id v32 = sub_1A2BECA58();
  v0[16] = v32;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F28]), sel_init);
  v0[17] = v1;
  if (!v1)
  {
LABEL_29:
    __break(1u);
    return;
  }
  uint64_t v2 = v1;
  uint64_t v4 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v6 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v31 = v0;
  uint64_t v7 = v0[11];
  sub_1A2B521B8(0, qword_1EB555078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  id v8 = sub_1A2B85C0C(v3);
  objc_msgSend(v2, sel_setContextId_, v8);

  uint64_t v33 = v7 + 64;
  uint64_t v9 = -1;
  uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
  if (-v10 < 64) {
    uint64_t v9 = ~(-1 << -(char)v10);
  }
  unint64_t v11 = v9 & *(void *)(v7 + 64);
  int64_t v34 = (unint64_t)(63 - v10) >> 6;
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (!v11) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v13 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    int64_t v18 = (uint64_t *)(*(void *)(v7 + 48) + 16 * i);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = *(void **)(*(void *)(v7 + 56) + 8 * i);
    id v22 = objc_allocWithZone(MEMORY[0x1E4FA0ED8]);
    swift_bridgeObjectRetain();
    uint64_t v23 = v21;
    id v24 = objc_msgSend(v22, sel_init);
    if (!v24) {
      goto LABEL_28;
    }
    uint64_t v25 = v24;
    sub_1A2BED854(v19, v20, v24);
    uint64_t v26 = (unsigned int *)&v23[OBJC_IVAR____TtC13SiriAnalytics13StagingReport_addedCount];
    swift_beginAccess();
    objc_msgSend(v25, sel_setMessageCount_, *v26);
    uint64_t v27 = (unsigned int *)&v23[OBJC_IVAR____TtC13SiriAnalytics13StagingReport_missingTimestampCount];
    swift_beginAccess();
    objc_msgSend(v25, sel_setMissingTimestampCount_, *v27);
    uint64_t v28 = (unsigned int *)&v23[OBJC_IVAR____TtC13SiriAnalytics13StagingReport_result];
    swift_beginAccess();
    objc_msgSend(v25, sel_setResult_, *v28);
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addOrchestratorStatistics_, v25);

    if (v11) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (v15 >= v34) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v34) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v11 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 < v34)
  {
    unint64_t v16 = *(void *)(v33 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v12 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_27;
        }
        if (v12 >= v34) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v12);
        ++v17;
        if (v16) {
          goto LABEL_19;
        }
      }
    }
    int64_t v12 = v17;
    goto LABEL_19;
  }
LABEL_23:
  swift_release();
  objc_msgSend(v32, sel_setOrchestratorResultsStatsReported_, v2);
  uint64_t v29 = (void *)swift_task_alloc();
  v31[18] = v29;
  *uint64_t v29 = v31;
  v29[1] = sub_1A2BEBC74;
  uint64_t v30 = OUTLINED_FUNCTION_9_19();
  sub_1A2BECE54(v30);
}

uint64_t sub_1A2BEBC74()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1A2BEBD3C()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void **)(v0 + 128);

  swift_task_dealloc();
  OUTLINED_FUNCTION_3_1();
  return v2();
}

uint64_t sub_1A2BEBDA4()
{
  OUTLINED_FUNCTION_2_0();
  mach_timebase_info v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_1A2C0CE20();
  v1[4] = v3;
  OUTLINED_FUNCTION_0_8(v3);
  v1[5] = v4;
  v1[6] = swift_task_alloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

id sub_1A2BEBE38()
{
  id v1 = sub_1A2BECA58();
  v0[7] = v1;
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F38]), sel_init);
  v0[8] = result;
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v5 = v0[5];
    uint64_t v4 = v0[6];
    uint64_t v6 = v0[3];
    uint64_t v7 = v0[4];
    uint64_t v8 = v0[2];
    sub_1A2B521B8(0, qword_1EB555078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8, v7);
    id v9 = sub_1A2B85C0C(v4);
    objc_msgSend(v3, sel_setClockIdentifier_, v9);

    sub_1A2B49C2C();
    unsigned int v11 = sub_1A2B80738(v8, v10);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v11;
    }
    objc_msgSend(v3, sel_setMessageCount_, v14);
    uint64_t v15 = *(void *)(v6 + *(int *)(type metadata accessor for PreprocessorTelemetry(0) + 32));
    uint64_t v16 = swift_task_alloc();
    *(void *)(v16 + 16) = v8;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1A2BEAE54(MEMORY[0x1E4FBC868], (void (*)(uint64_t *, char *))sub_1A2BED8F8, v16, v15);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v18 = sub_1A2BED3C0(v17);
    swift_bridgeObjectRelease();
    sub_1A2BBAC8C(v18, v3, &qword_1E95960F8, 0x1E4FA0EC8, (SEL *)&selRef_setAnyEventTypeStatistics_);
    objc_msgSend(v1, sel_setPreprocessorSessionStartStatsReported_, v3);
    uint64_t v19 = (void *)swift_task_alloc();
    v0[9] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_1A2BEC07C;
    uint64_t v20 = OUTLINED_FUNCTION_9_19();
    return (id)sub_1A2BECE54(v20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2BEC07C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1A2BEC144()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void **)(v0 + 56);

  swift_task_dealloc();
  OUTLINED_FUNCTION_3_1();
  return v2();
}

uint64_t sub_1A2BEC1AC()
{
  *(void *)(v1 + 96) = v0;
  return OUTLINED_FUNCTION_2_14((uint64_t)sub_1A2BEC1C4);
}

uint64_t sub_1A2BEC1C4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  id v2 = sub_1A2BECA58();
  *(void *)(v0 + 104) = v2;
  id v3 = sub_1A2BECC48();
  *(void *)(v0 + 112) = v3;
  id v4 = sub_1A2BECD50();
  *(void *)(v0 + 120) = v4;
  uint64_t v5 = type metadata accessor for PreprocessorTelemetry(0);
  sub_1A2BECA10(*(void *)(v1 + *(int *)(v5 + 40)), v0 + 56);
  sub_1A2B4B2CC(v0 + 56, v0 + 16, &qword_1E9595E48);
  if (*(unsigned char *)(v0 + 32) == 0xFF)
  {
    int v6 = 5;
  }
  else
  {
    int v6 = *(unsigned __int8 *)(v0 + 16);
    if (v6 == 4)
    {
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F08]), sel_init);
      objc_msgSend(v3, sel_setEnded_, v7);

      id v8 = objc_msgSend(v3, sel_ended);
      goto LABEL_11;
    }
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F10]), sel_init);
  objc_msgSend(v3, sel_setFailed_, v9);

  id v10 = objc_msgSend(v3, sel_failed);
  if (v10)
  {
    unsigned int v11 = v10;
    if (v6 == 5 || (unint64_t v12 = sub_1A2B3D210(v6), (v12 & 0x100000000) != 0)) {
      unint64_t v12 = 0;
    }
    objc_msgSend(v11, sel_setFailedAtStep_, v12);
  }
  id v8 = objc_msgSend(v3, sel_failed);
LABEL_11:
  id v13 = v8;
  uint64_t v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, sel_setPreprocessorExecutionMetrics_, v4);
  }
  objc_msgSend(v2, sel_setPreprocessorExecutionContext_, v3);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v15;
  void *v15 = v0;
  v15[1] = sub_1A2BEC3FC;
  uint64_t v16 = OUTLINED_FUNCTION_9_19();
  return sub_1A2BECE54(v16);
}

uint64_t sub_1A2BEC3FC()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1A2BEC4C4()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void **)(v0 + 112);
  id v2 = *(void **)(v0 + 104);

  OUTLINED_FUNCTION_3_1();
  return v3();
}

uint64_t sub_1A2BEC528()
{
  OUTLINED_FUNCTION_2_0();
  mach_timebase_info v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_1A2C0CE20();
  v1[4] = v3;
  OUTLINED_FUNCTION_0_8(v3);
  v1[5] = v4;
  v1[6] = swift_task_alloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

id sub_1A2BEC5BC()
{
  id v1 = sub_1A2BECA58();
  v0[7] = v1;
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F30]), sel_init);
  v0[8] = result;
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v27 = result;
  id v29 = v1;
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F40]), sel_init);
  v0[9] = result;
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v7 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v8 = v0[2];
  sub_1A2B521B8(0, qword_1EB555078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v8, v6);
  id v9 = sub_1A2B85C0C(v5);
  objc_msgSend(v3, sel_setClockIdentifier_, v9);

  sub_1A2B4A43C();
  unsigned int v11 = sub_1A2B80738(v8, v10);
  char v13 = v12;
  swift_bridgeObjectRelease();
  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v11;
  }
  objc_msgSend(v3, sel_setMessageCount_, v14, v27);
  uint64_t v15 = swift_task_alloc();
  *(void *)(v15 + 16) = v8;
  uint64_t v16 = *(int *)(type metadata accessor for PreprocessorTelemetry(0) + 36);
  uint64_t v17 = *(void *)(v7 + v16);
  swift_bridgeObjectRetain();
  uint64_t v18 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v19 = sub_1A2BEB114(MEMORY[0x1E4FBC868], v17, sub_1A2BED984, v15);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v20 = sub_1A2BED3C0(v19);
  swift_bridgeObjectRelease();
  uint64_t v21 = swift_task_alloc();
  *(void *)(v21 + 16) = v8;
  uint64_t v22 = *(void *)(v7 + v16);
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1A2BEB114(v18, v22, sub_1A2BED98C, v21);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v24 = sub_1A2BED3C0(v23);
  swift_bridgeObjectRelease();
  sub_1A2BBAC8C(v20, v3, &qword_1E95960F8, 0x1E4FA0EC8, (SEL *)&selRef_setPublishedEventStatistics_);
  sub_1A2BBAC8C(v24, v3, &qword_1E95960F8, 0x1E4FA0EC8, (SEL *)&selRef_setRedactedEventStatistics_);
  objc_msgSend(v28, sel_setOffDeviceClockStatistics_, v3);
  objc_msgSend(v29, sel_setPreprocessorSessionEndStatsReported_, v28);
  uint64_t v25 = (void *)swift_task_alloc();
  v0[10] = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_1A2BEC8D0;
  uint64_t v26 = OUTLINED_FUNCTION_9_19();
  return (id)sub_1A2BECE54(v26);
}

uint64_t sub_1A2BEC8D0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_7();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1A2BEC998()
{
  uint64_t v1 = *(void **)(v0 + 64);
  uint64_t v2 = *(void **)(v0 + 56);

  swift_task_dealloc();
  OUTLINED_FUNCTION_3_1();
  return v3();
}

uint64_t sub_1A2BECA10@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(result + 40 * v2);
    uint64_t v2 = *((unsigned __int8 *)v3 - 8);
    uint64_t v4 = *v3;
    uint64_t v5 = *((unsigned __int8 *)v3 + 8);
    uint64_t v6 = v3[2];
    char v7 = *((unsigned char *)v3 + 24);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    char v7 = 0;
    uint64_t v5 = 255;
  }
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return result;
}

id sub_1A2BECA58()
{
  uint64_t v0 = sub_1A2C0CDA0();
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0EE8]), sel_init);
  if (!result) {
    goto LABEL_13;
  }
  char v7 = result;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0EF8]), sel_init);
  objc_msgSend(v7, sel_setEventMetadata_, v8);

  id v9 = objc_msgSend(v7, sel_eventMetadata);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_1A2B521B8(0, &qword_1E95960E8);
    id v11 = static PFAPFADeviceDimensions.current()();
    objc_msgSend(v10, sel_setDeviceDimensions_, v11);
  }
  id v12 = objc_msgSend(v7, sel_eventMetadata);
  if (!v12) {
    return v7;
  }
  char v13 = v12;
  sub_1A2C0CD80();
  sub_1A2C0CD70();
  double v15 = v14;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  double v16 = v15 * 1000.0;
  if ((~COERCE__INT64(v15 * 1000.0) & 0x7FF0000000000000) != 0)
  {
    if (v16 > -9.22337204e18)
    {
      if (v16 < 9.22337204e18)
      {
        objc_msgSend(v13, sel_setEventTimestampInMsSince1970_, (uint64_t)v16);

        return v7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

id sub_1A2BECC48()
{
  uint64_t v1 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F00]), sel_init);
  if (result)
  {
    id v8 = result;
    sub_1A2B521B8(0, qword_1EB555078);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0, v1);
    id v9 = sub_1A2B85C0C((uint64_t)v6);
    objc_msgSend(v8, sel_setContextId_, v9);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1A2BECD50()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0F18]), sel_init);
  if (result)
  {
    uint64_t v2 = result;
    sub_1A2B499FC();
    objc_msgSend(v2, sel_setStagedMessageCount_, v3);
    sub_1A2B4A05C();
    objc_msgSend(v2, sel_setProcessedMessageCount_, v4);
    uint64_t v5 = type metadata accessor for PreprocessorTelemetry(0);
    sub_1A2BECA10(*(void *)(v0 + *(int *)(v5 + 40)), (uint64_t)v9);
    id result = (id)sub_1A2B4B2CC((uint64_t)v9, (uint64_t)v10, &qword_1E9595E48);
    unsigned __int8 v6 = v12;
    if (v12 == 255) {
      return v2;
    }
    unint64_t v7 = v11;
    unint64_t v8 = v13;
    if ((v14 & 1) == 0)
    {
      id result = (id)SiriAnalyticsMachAbsoluteTimeGetNanoseconds(v13);
      unint64_t v8 = (unint64_t)result;
    }
    if ((v6 & 1) == 0)
    {
      id result = (id)SiriAnalyticsMachAbsoluteTimeGetNanoseconds(v7);
      unint64_t v7 = (unint64_t)result;
    }
    if (!__OFSUB__(v8, v7))
    {
      objc_msgSend(v2, sel_setExecutionTimeInNs_, v8 - v7);
      return v2;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2BECE54(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return OUTLINED_FUNCTION_2_14((uint64_t)sub_1A2BECE6C);
}

uint64_t sub_1A2BECE6C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 40), sel_wrapAsAnyEvent);
  *(void *)(v0 + 56) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    uint64_t v3 = (void *)(v2 + *(int *)(type metadata accessor for PreprocessorTelemetry(0) + 28));
    uint64_t v21 = (uint64_t (*)(uint64_t))(*v3 + *(int *)*v3);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_1A2BED118;
    uint64_t v5 = OUTLINED_FUNCTION_9_19();
    return v21(v5);
  }
  else
  {
    if (qword_1EB5541E8 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_7_16();
    sub_1A2BAB6C8(v7, v8, v9, v10, v11, v12);
    sub_1A2BED8AC();
    unint64_t v13 = (void *)swift_allocError();
    swift_willThrow();
    if (qword_1EB5541E8 != -1) {
      swift_once();
    }
    sub_1A2C0DB60();
    *(void *)(v0 + 16) = 0;
    *(void *)(v0 + 24) = 0xE000000000000000;
    sub_1A2C0D530();
    *(void *)(v0 + 32) = v13;
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
    sub_1A2C0DC40();
    OUTLINED_FUNCTION_7_16();
    sub_1A2BAB6C8(v14, v15, v16, v17, v18, v19);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_3_1();
    return v20();
  }
}

uint64_t sub_1A2BED118()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_1_7();
  *uint64_t v3 = v2;
  *(void *)(v4 + 72) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10_2();
  return MEMORY[0x1F4188298](v5, v6, v7);
}

uint64_t sub_1A2BED1F8()
{
  OUTLINED_FUNCTION_2_0();

  OUTLINED_FUNCTION_3_1();
  return v1();
}

uint64_t sub_1A2BED250()
{
  id v1 = *(void **)(v0 + 72);
  if (qword_1EB5541E8 != -1) {
    swift_once();
  }
  sub_1A2C0DB60();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  sub_1A2C0D530();
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB556EF0);
  sub_1A2C0DC40();
  sub_1A2BAB6C8(*(void *)(v0 + 16), *(void *)(v0 + 24), 0xD000000000000077, 0x80000001A2C17C70, 0x293A5F2874696D65, 0xE800000000000000);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_3_1();
  return v2();
}

uint64_t sub_1A2BED3C0(uint64_t a1)
{
  uint64_t v38 = a1 + 64;
  uint64_t v1 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v2 = -1;
  if (v1 < 64) {
    uint64_t v2 = ~(-1 << v1);
  }
  unint64_t v3 = v2 & *(void *)(a1 + 64);
  int64_t v39 = (unint64_t)(v1 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    if (v3)
    {
      unint64_t v6 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      unint64_t v7 = v6 | (v4 << 6);
    }
    else
    {
      int64_t v8 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_45;
      }
      if (v8 >= v39)
      {
LABEL_41:
        swift_release();
        swift_bridgeObjectRetain();
        sub_1A2BC5314();
        uint64_t v36 = v35;
        swift_bridgeObjectRelease_n();
        return v36;
      }
      unint64_t v9 = *(void *)(v38 + 8 * v8);
      ++v4;
      if (!v9)
      {
        int64_t v4 = v8 + 1;
        if (v8 + 1 >= v39) {
          goto LABEL_41;
        }
        unint64_t v9 = *(void *)(v38 + 8 * v4);
        if (!v9)
        {
          int64_t v4 = v8 + 2;
          if (v8 + 2 >= v39) {
            goto LABEL_41;
          }
          unint64_t v9 = *(void *)(v38 + 8 * v4);
          if (!v9)
          {
            int64_t v10 = v8 + 3;
            if (v10 >= v39) {
              goto LABEL_41;
            }
            unint64_t v9 = *(void *)(v38 + 8 * v10);
            if (!v9)
            {
              while (1)
              {
                int64_t v4 = v10 + 1;
                if (__OFADD__(v10, 1)) {
                  goto LABEL_46;
                }
                if (v4 >= v39) {
                  goto LABEL_41;
                }
                unint64_t v9 = *(void *)(v38 + 8 * v4);
                ++v10;
                if (v9) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v4 = v10;
          }
        }
      }
LABEL_19:
      unint64_t v3 = (v9 - 1) & v9;
      unint64_t v7 = __clz(__rbit64(v9)) + (v4 << 6);
    }
    uint64_t v11 = (unsigned int *)(*(void *)(a1 + 48) + 16 * v7);
    uint64_t v12 = *v11;
    unint64_t v13 = *((void *)v11 + 1);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v7);
    if (v5[2] && (unint64_t v15 = sub_1A2B5520C(*v11), (v16 & 1) != 0))
    {
      id v17 = *(id *)(v5[7] + 8 * v15);
    }
    else
    {
      id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0EC8]), sel_init);
      if (!v17) {
        goto LABEL_48;
      }
    }
    objc_msgSend(v17, sel_setAnyEventType_, v12);
    unsigned int v18 = objc_msgSend(v17, sel_messageCount);
    if (__CFADD__(v18, v14)) {
      break;
    }
    objc_msgSend(v17, sel_setMessageCount_, v18 + v14);
    uint64_t v19 = sub_1A2BED914(v17);
    uint64_t v20 = MEMORY[0x1E4FBC860];
    if (v19) {
      uint64_t v20 = v19;
    }
    uint64_t v41 = v20;
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0ED0]), sel_init);
    if (!v21) {
      goto LABEL_47;
    }
    if ((v13 & 0x8000000000000000) != 0 || HIDWORD(v13)) {
      goto LABEL_49;
    }
    uint64_t v22 = v21;
    objc_msgSend(v21, sel_setOrdinal_, v13);
    objc_msgSend(v22, sel_setMessageCount_, v14);
    id v23 = v22;
    MEMORY[0x1A623BB60]();
    if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1A2C0D610();
    }
    sub_1A2C0D630();
    sub_1A2C0D600();
    sub_1A2BBAC8C(v41, v17, (unint64_t *)&unk_1E95960D0, 0x1E4FA0ED0, (SEL *)&selRef_setEventStatistics_);
    id v24 = v17;
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = sub_1A2B5520C(v12);
    if (__OFADD__(v5[2], (v26 & 1) == 0)) {
      goto LABEL_43;
    }
    unint64_t v27 = v25;
    char v28 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595D30);
    if (sub_1A2C0DC50())
    {
      unint64_t v29 = sub_1A2B5520C(v12);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_50;
      }
      unint64_t v27 = v29;
    }
    if (v28)
    {
      uint64_t v31 = v5[7];

      *(void *)(v31 + 8 * v27) = v24;
    }
    else
    {
      v5[(v27 >> 6) + 8] |= 1 << v27;
      *(_DWORD *)(v5[6] + 4 * v27) = v12;
      *(void *)(v5[7] + 8 * v27) = v24;
      uint64_t v32 = v5[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_44;
      }
      v5[2] = v34;
    }

    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  OUTLINED_FUNCTION_1_1();
  sub_1A2C0DCB0();
  __break(1u);
LABEL_50:
  type metadata accessor for SISchemaAnyEventType(0);
  uint64_t result = sub_1A2C0DDE0();
  __break(1u);
  return result;
}

void sub_1A2BED854(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1A2C0D470();
  objc_msgSend(a3, sel_setBundleId_, v4);
}

unint64_t sub_1A2BED8AC()
{
  unint64_t result = qword_1E9597270;
  if (!qword_1E9597270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9597270);
  }
  return result;
}

uint64_t sub_1A2BED8F8(void *a1, uint64_t a2)
{
  return sub_1A2B4AAB0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1A2BED914(void *a1)
{
  id v1 = objc_msgSend(a1, sel_eventStatistics);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1A2B521B8(0, (unint64_t *)&unk_1E95960D0);
  uint64_t v3 = sub_1A2C0D5E0();

  return v3;
}

uint64_t sub_1A2BED984(uint64_t a1)
{
  return sub_1A2B4ADA0(a1);
}

uint64_t sub_1A2BED98C(uint64_t a1)
{
  return sub_1A2B4AF90(a1);
}

uint64_t sub_1A2BED994(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreprocessorResultCounterKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for PreprocessorTelemetryError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A2BEDA8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreprocessorTelemetryError()
{
  return &type metadata for PreprocessorTelemetryError;
}

unint64_t sub_1A2BEDAC8()
{
  unint64_t result = qword_1E9597298;
  if (!qword_1E9597298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597298);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return v0;
}

ValueMetadata *type metadata accessor for EmbeddedDeviceLockState()
{
  return &type metadata for EmbeddedDeviceLockState;
}

BOOL sub_1A2BEDB54(int a1)
{
  return a1 == 0;
}

BOOL sub_1A2BEDB60()
{
  return sub_1A2BEDB54(*v0);
}

unint64_t sub_1A2BEDB68(uint64_t a1)
{
  unint64_t result = 0x7078456B636F6C63;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x61727473746F6F62;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x75526C61756E616DLL;
      break;
    default:
      sub_1A2C0DDC0();
      __break(1u);
      JUMPOUT(0x1A2BEDC40);
  }
  return result;
}

uint64_t sub_1A2BEDC50(unint64_t a1)
{
  if (a1 < 4) {
    return dword_1A2C1B750[a1];
  }
  uint64_t result = sub_1A2C0DDC0();
  __break(1u);
  return result;
}

unint64_t ProcessingReason.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_1A2BEDCBC()
{
  unint64_t result = qword_1E95972A0;
  if (!qword_1E95972A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95972A0);
  }
  return result;
}

uint64_t sub_1A2BEDD08()
{
  return sub_1A2B3C278();
}

uint64_t sub_1A2BEDD10()
{
  return sub_1A2B8367C();
}

uint64_t sub_1A2BEDD18()
{
  return sub_1A2B83898();
}

unint64_t sub_1A2BEDD20@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ProcessingReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1A2BEDD54(void *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ProcessingReason()
{
  return &type metadata for ProcessingReason;
}

uint64_t ComponentId.init(identifierType:uuid:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  *a3 = a1;
  char v4 = (char *)a3 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_14();
  unint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 32);
  return v7(v4, a2, v5);
}

uint64_t type metadata accessor for ComponentId(uint64_t a1)
{
  return sub_1A2B4B1E4(a1, qword_1EB554338);
}

uint64_t static TagPredicate.== infix(_:_:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = type metadata accessor for MessageGroupIdentifier(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v9 = (char *)&v36 - v8;
  unint64_t v10 = *a1;
  unint64_t v11 = *a2;
  switch(v10 >> 61)
  {
    case 1uLL:
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595F48);
      uint64_t v20 = swift_projectBox();
      if (v11 >> 61 != 1) {
        goto LABEL_22;
      }
      uint64_t v21 = v20;
      uint64_t v22 = *(int *)(v19 + 48);
      char v23 = *(unsigned char *)(v20 + v22);
      uint64_t v24 = swift_projectBox();
      char v25 = *(unsigned char *)(v24 + v22);
      sub_1A2B5C9B4(v21, (uint64_t)v9);
      sub_1A2B5C9B4(v24, (uint64_t)v6);
      sub_1A2B5E424(v11);
      sub_1A2B5E424(v10);
      LOBYTE(v21) = static MessageGroupIdentifier.== infix(_:_:)((uint64_t)v9, (uint64_t)v6);
      sub_1A2BEE478((uint64_t)v6, (void (*)(void))type metadata accessor for MessageGroupIdentifier);
      sub_1A2BEE478((uint64_t)v9, (void (*)(void))type metadata accessor for MessageGroupIdentifier);
      OUTLINED_FUNCTION_1_33();
      if ((v21 & 1) == 0) {
        goto LABEL_23;
      }
      char v26 = v23 ^ v25 ^ 1;
      return v26 & 1;
    case 2uLL:
      if (v11 >> 61 == 2) {
        goto LABEL_12;
      }
      goto LABEL_22;
    case 3uLL:
      if (v11 >> 61 != 3) {
        goto LABEL_22;
      }
LABEL_12:
      uint64_t v27 = *(void *)((v10 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v28 = *(void *)((v11 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      sub_1A2B5E424(v11);
      sub_1A2B5E424(v10);
      char v29 = sub_1A2BEE374(v27, v28);
      goto LABEL_15;
    case 4uLL:
      if (v11 >> 61 != 4) {
        goto LABEL_22;
      }
      uint64_t v30 = *(void *)((v10 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v36 = *(void *)((v11 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v37 = v30;
      sub_1A2B5E424(v11);
      sub_1A2B5E424(v10);
      char v29 = static TagPredicate.== infix(_:_:)(&v37, &v36);
LABEL_15:
      char v26 = v29;
      OUTLINED_FUNCTION_1_33();
      return v26 & 1;
    case 5uLL:
      if (v10 == 0xA000000000000000)
      {
        if (v11 == 0xA000000000000000)
        {
          sub_1A2B5E470(0xA000000000000000);
          unint64_t v31 = 0xA000000000000000;
LABEL_21:
          sub_1A2B5E470(v31);
          goto LABEL_40;
        }
      }
      else if (v11 == 0xA000000000000008)
      {
        sub_1A2B5E470(0xA000000000000008);
        unint64_t v31 = 0xA000000000000008;
        goto LABEL_21;
      }
LABEL_22:
      sub_1A2B5E424(v11);
      sub_1A2B5E424(v10);
      OUTLINED_FUNCTION_1_33();
      goto LABEL_23;
    default:
      if (v11 >> 61) {
        goto LABEL_22;
      }
      uint64_t v12 = *(void *)(v10 + 16);
      uint64_t v13 = *(void *)(v10 + 24);
      int v14 = *(unsigned __int8 *)(v10 + 32);
      uint64_t v15 = *(void *)(v11 + 16);
      uint64_t v16 = *(void *)(v11 + 24);
      int v17 = *(unsigned __int8 *)(v11 + 32);
      sub_1A2B5E424(v11);
      sub_1A2B5E424(v10);
      OUTLINED_FUNCTION_1_33();
      if (!v14)
      {
        if (v17) {
          BOOL v33 = 0;
        }
        else {
          BOOL v33 = v12 == v15;
        }
        if (!v33 || v13 != v16) {
          goto LABEL_23;
        }
LABEL_40:
        char v26 = 1;
        return v26 & 1;
      }
      if (v14 == 1) {
        BOOL v18 = v17 == 1;
      }
      else {
        BOOL v18 = v17 == 2;
      }
      if (v18 && v12 == v15) {
        goto LABEL_40;
      }
LABEL_23:
      char v26 = 0;
      return v26 & 1;
  }
}

uint64_t TagPredicate.init(requestIdentifier:clustered:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595F48);
  uint64_t v7 = swift_allocBox();
  unint64_t v9 = v8;
  uint64_t v10 = *(int *)(v6 + 48);
  _DWORD *v8 = 1;
  unint64_t v11 = (char *)v8 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_14();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 32))(v11, a1);
  *((unsigned char *)v9 + v10) = a2;
  *a3 = v7 | 0x2000000000000000;
  return result;
}

uint64_t type metadata accessor for MessageGroupIdentifier(uint64_t a1)
{
  return sub_1A2B4B1E4(a1, (uint64_t *)&unk_1E9595F58);
}

BOOL static MessageGroupIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ComponentId(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (_DWORD *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v7);
  unint64_t v9 = (_DWORD *)((char *)&v17 - v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95972A8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t)&v12[*(int *)(v13 + 56)];
  sub_1A2B5C9B4(a1, (uint64_t)v12);
  sub_1A2B5C9B4(a2, v14);
  sub_1A2B95754((uint64_t)v12, (uint64_t)v9);
  sub_1A2B95754(v14, (uint64_t)v6);
  BOOL v15 = *v9 == *v6 && (sub_1A2C0CDF0() & 1) != 0;
  sub_1A2BEE478((uint64_t)v6, (void (*)(void))type metadata accessor for ComponentId);
  sub_1A2BEE478((uint64_t)v9, (void (*)(void))type metadata accessor for ComponentId);
  return v15;
}

uint64_t sub_1A2BEE374(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v9 = 1;
    }
    else
    {
      int v3 = (uint64_t *)(a1 + 32);
      uint64_t v4 = (uint64_t *)(a2 + 32);
      uint64_t v5 = v2 - 1;
      do
      {
        uint64_t v7 = *v3++;
        uint64_t v6 = v7;
        uint64_t v8 = *v4++;
        uint64_t v13 = v8;
        uint64_t v14 = v6;
        char v9 = static TagPredicate.== infix(_:_:)(&v14, &v13);
        BOOL v11 = v5-- != 0;
      }
      while ((v9 & 1) != 0 && v11);
    }
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

uint64_t static ComponentId.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  type metadata accessor for ComponentId(0);
  return sub_1A2C0CDF0();
}

uint64_t sub_1A2BEE478(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t *initializeBufferWithCopyOfBuffer for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1A2B5E424(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for TagPredicate(unint64_t *a1)
{
  return sub_1A2B5E470(*a1);
}

unint64_t *assignWithCopy for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1A2B5E424(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_1A2B5E470(v4);
  return a1;
}

unint64_t *assignWithTake for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_1A2B5E470(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for TagPredicate(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7B && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 122;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7A) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TagPredicate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7A)
  {
    *(void *)uint64_t result = a2 - 123;
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1A2BEE620(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 4) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 5;
  }
}

void *sub_1A2BEE63C(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_1A2BEE64C(unint64_t *result, uint64_t a2)
{
  if (a2 < 5)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 61;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 5);
    unint64_t v3 = 0xA000000000000000;
  }
  *uint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for TagPredicate()
{
  return &type metadata for TagPredicate;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageGroupIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v6 = *(int *)(type metadata accessor for ComponentId(0) + 20);
    uint64_t v7 = (char *)v4 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1A2C0CE20();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return v4;
}

uint64_t destroy for MessageGroupIdentifier(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  uint64_t v2 = sub_1A2C0CE20();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

_DWORD *initializeWithCopy for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageGroupIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595E38);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MessageGroupIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595E38);
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v6);
}

uint64_t sub_1A2BEEA98(uint64_t a1)
{
  uint64_t result = type metadata accessor for ComponentId(319);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ComponentId(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1A2C0CE20();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ComponentId(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1A2C0CE20();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

_DWORD *initializeWithCopy for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A2C0CE20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentId(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A2BEEE74);
}

uint64_t sub_1A2BEEE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_1A2C0CE20();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ComponentId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A2BEEED4);
}

uint64_t sub_1A2BEEED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_1A2C0CE20();
  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

uint64_t sub_1A2BEEF24()
{
  uint64_t result = sub_1A2C0CE20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t OUTLINED_FUNCTION_1_33()
{
  sub_1A2B5E470(v1);
  return sub_1A2B5E470(v0);
}

uint64_t TagShim.__allocating_init(identifier:underlying:)(uint64_t a1, uint64_t a2)
{
  return sub_1A2BEF0A4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A2BEFF14);
}

SiriAnalytics::TagSpace_optional __swiftcall TagSpace.init(rawValue:)(Swift::UInt32 rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *unint64_t v1 = v2;
  return (SiriAnalytics::TagSpace_optional)rawValue;
}

uint64_t TagSpace.rawValue.getter()
{
  return *v0;
}

uint64_t sub_1A2BEF02C(uint64_t a1)
{
  return sub_1A2B8CDE8(a1, *v1);
}

SiriAnalytics::TagSpace_optional sub_1A2BEF034(Swift::UInt32 *a1)
{
  return TagSpace.init(rawValue:)(*a1);
}

uint64_t sub_1A2BEF03C@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = TagSpace.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t TagShim.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2B5D9DC(v1 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, a1);
}

uint64_t TagShim.underlying.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2B58194(v1 + OBJC_IVAR___SiriAnalyticsTagShim_underlying, a1);
}

uint64_t TagShim.init(identifier:underlying:)(uint64_t a1, uint64_t a2)
{
  return sub_1A2BEF0A4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A2BEFFFC);
}

uint64_t sub_1A2BEF0A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(a2, v7);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11 - v10;
  (*(void (**)(uint64_t))(v13 + 16))(v11 - v10);
  uint64_t v14 = a3(a1, v12, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v14;
}

uint64_t static TagShim.supportsSecureCoding.getter()
{
  return byte_1E95972B0;
}

uint64_t static TagShim.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1E95972B0 = a1;
  return result;
}

uint64_t (*static TagShim.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1A2BEF29C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1A2C0CE20();
  OUTLINED_FUNCTION_0_5();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_14();
  uint64_t v13 = v1 + OBJC_IVAR___SiriAnalyticsTagShim_underlying;
  sub_1A2B58194(v1 + OBJC_IVAR___SiriAnalyticsTagShim_underlying, (uint64_t)v36);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596020);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596080);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v35 = 0;
    memset(v34, 0, sizeof(v34));
    BOOL v18 = &qword_1E9596090;
    uint64_t v19 = v34;
    return sub_1A2B653F8((uint64_t)v19, v18);
  }
  sub_1A2B4D72C(v34, (uint64_t)v38);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F94098]), sel_init);
  if (v14)
  {
    BOOL v15 = v14;
    uint64_t v32 = v11;
    BOOL v33 = a1;
    sub_1A2B58194(v13, (uint64_t)v36);
    uint64_t v16 = OUTLINED_FUNCTION_6_25();
    uint64_t v17 = v37;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v17 + 8))(v34, v16, v17);
    __swift_project_boxed_opaque_existential_1(v38, v38[3]);
    sub_1A2C0D2B0();
    uint64_t v21 = sub_1A2BEFEB0(v15);
    unint64_t v23 = v22;
    sub_1A2B58194(v13, (uint64_t)v36);
    uint64_t v24 = OUTLINED_FUNCTION_6_25();
    uint64_t v25 = v37;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v25 + 8))(v34, v24, v25);
    uint64_t v26 = LOBYTE(v34[0]);
    uint64_t v27 = (void *)OUTLINED_FUNCTION_7_17();
    objc_msgSend(v33, sel_encodeInt32_forKey_, v26, v27);

    if (v23 >> 60 == 15)
    {
      uint64_t v28 = 0;
    }
    else
    {
      sub_1A2B3EA44(v21, v23);
      uint64_t v28 = sub_1A2C0CD20();
      sub_1A2B48634(v21, v23);
    }
    char v29 = (void *)OUTLINED_FUNCTION_1_18();
    objc_msgSend(v33, sel_encodeObject_forKey_, v28, v29);
    swift_unknownObjectRelease();

    sub_1A2B5D9DC(v3 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, v8);
    if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
      sub_1A2B48634(v21, v23);

      BOOL v18 = &qword_1EB555500;
      uint64_t v19 = (long long *)v8;
      return sub_1A2B653F8((uint64_t)v19, v18);
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v2, v8, v9);
    uint64_t v30 = (void *)sub_1A2C0CDE0();
    unint64_t v31 = (void *)OUTLINED_FUNCTION_1_34();
    objc_msgSend(v33, sel_encodeObject_forKey_, v30, v31);

    sub_1A2B48634(v21, v23);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v2, v9);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
}

uint64_t TagShim.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TagShim.init(coder:)(a1);
}

uint64_t TagShim.init(coder:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v31 - v7;
  id v9 = v1;
  uint64_t v10 = (void *)OUTLINED_FUNCTION_7_17();
  unsigned int v11 = objc_msgSend(a1, sel_decodeInt32ForKey_, v10);

  if ((v11 & 0x80000000) != 0) {
    goto LABEL_28;
  }
  if (v11)
  {
    if (v11 != 1) {
      goto LABEL_15;
    }
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
  }
  uint64_t v13 = (void *)OUTLINED_FUNCTION_1_18();
  id v14 = objc_msgSend(a1, sel_decodeObjectForKey_, v13);

  if (v14)
  {
    sub_1A2C0DA50();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v37, 0, sizeof(v37));
  }
  sub_1A2B4B2CC((uint64_t)v37, (uint64_t)&v32, &qword_1E95961F8);
  if (!v33)
  {

    sub_1A2B653F8((uint64_t)&v32, &qword_1E95961F8);
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:

LABEL_17:
    type metadata accessor for TagShim();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v15 = v35;
  unint64_t v16 = v36;
  uint64_t v17 = (void *)OUTLINED_FUNCTION_1_34();
  unsigned int v18 = objc_msgSend(a1, sel_containsValueForKey_, v17);

  if (v18 && (sub_1A2BF0160(), (uint64_t v19 = sub_1A2C0D9A0()) != 0))
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = sub_1A2C0CE20();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v21);
    sub_1A2B8DD04();
    sub_1A2C0DD30();

    if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v21) == 1)
    {
      uint64_t v22 = (uint64_t)v8;
      uint64_t v23 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v8, v5, v21);
      uint64_t v22 = (uint64_t)v8;
      uint64_t v23 = 0;
    }
    uint64_t v26 = v21;
  }
  else
  {
    uint64_t v26 = sub_1A2C0CE20();
    uint64_t v22 = (uint64_t)v8;
    uint64_t v23 = 1;
  }
  __swift_storeEnumTagSinglePayload(v22, v23, 1, v26);
  sub_1A2B4B2CC((uint64_t)v8, (uint64_t)v9 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, &qword_1EB555500);
  id v27 = objc_allocWithZone(MEMORY[0x1E4F94090]);
  sub_1A2B3EA44(v15, v16);
  id v28 = sub_1A2B48BBC(v15, v16);
  if (v28)
  {
    char v29 = v28;
    if (v12)
    {
      BOOL v33 = &type metadata for DataClassificationTag;
      uint64_t v34 = &protocol witness table for DataClassificationTag;
      *(void *)&long long v32 = swift_allocObject();
      static DataClassificationTag.read(from:)(v32 + 16);
    }
    else
    {
      BOOL v33 = &type metadata for SensitiveConditionTag;
      uint64_t v34 = &protocol witness table for SensitiveConditionTag;
      static SensitiveConditionTag.read(from:)();
    }
    sub_1A2B3EB94(v15, v16);

    sub_1A2B4D72C(&v32, (uint64_t)v9 + OBJC_IVAR___SiriAnalyticsTagShim_underlying);
    uint64_t v30 = (objc_class *)type metadata accessor for TagShim();
    v31.receiver = v9;
    v31.super_class = v30;
    id v24 = objc_msgSendSuper2(&v31, sel_init);

    return (uint64_t)v24;
  }
  __break(1u);
LABEL_28:
  uint64_t result = sub_1A2C0DCB0();
  __break(1u);
  return result;
}

uint64_t sub_1A2BEFC3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB555500);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3 - v2;
  sub_1A2C0DB60();
  sub_1A2C0D530();
  swift_getObjectType();
  sub_1A2C0DF20();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  sub_1A2B5D9DC(v0 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, v4);
  sub_1A2C0D4F0();
  sub_1A2C0D530();
  swift_bridgeObjectRelease();
  sub_1A2C0D530();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596020);
  sub_1A2C0DC40();
  sub_1A2C0D530();
  return 0;
}

id TagShim.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TagShim.init()()
{
}

id TagShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A2BEFEB0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_immutableData);
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_1A2C0CD30();

  return v3;
}

id sub_1A2BEFF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0_5();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_14();
  id v13 = objc_allocWithZone((Class)type metadata accessor for TagShim());
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v5, a2, a4);
  id v14 = sub_1A2BEFFFC(a1, v5, v13, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, a4);
  return v14;
}

id sub_1A2BEFFFC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v13[3] = a4;
  v13[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  sub_1A2B5D9DC(a1, (uint64_t)a3 + OBJC_IVAR___SiriAnalyticsTagShim_identifier);
  sub_1A2B58194((uint64_t)v13, (uint64_t)a3 + OBJC_IVAR___SiriAnalyticsTagShim_underlying);
  v12.receiver = a3;
  v12.super_class = (Class)type metadata accessor for TagShim();
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  sub_1A2B653F8(a1, &qword_1EB555500);
  return v10;
}

uint64_t type metadata accessor for TagShim()
{
  uint64_t result = qword_1EB5571E0;
  if (!qword_1EB5571E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A2BF0120()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A2B5E470(*(void *)(v0 + 56));
  return MEMORY[0x1F4186498](v0, 64, 7);
}

unint64_t sub_1A2BF0160()
{
  unint64_t result = qword_1EB5542F0;
  if (!qword_1EB5542F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5542F0);
  }
  return result;
}

unint64_t sub_1A2BF01A4()
{
  unint64_t result = qword_1E95972C0;
  if (!qword_1E95972C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E95972C0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TagSpace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2BF02BCLL);
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

ValueMetadata *type metadata accessor for TagSpace()
{
  return &type metadata for TagSpace;
}

uint64_t dispatch thunk of static Tag.space.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A2BF0308()
{
  return type metadata accessor for TagShim();
}

void sub_1A2BF0310()
{
  sub_1A2B61D88();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TagShim(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TagShim);
}

uint64_t dispatch thunk of TagShim.__allocating_init(identifier:underlying:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of TagShim.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TagShim.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t OUTLINED_FUNCTION_1_34()
{
  return sub_1A2C0D470();
}

uint64_t OUTLINED_FUNCTION_6_25()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 - 168), *(void *)(v0 - 144));
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_7_17()
{
  return sub_1A2C0D470();
}

uint64_t sub_1A2BF049C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1A2BF05BC();
  if (!v1)
  {
    sub_1A2BF0720((uint64_t)&v6);
    if (v7)
    {
      sub_1A2BF1404((uint64_t)v9, &qword_1E9595F00);
      sub_1A2B4D72C(&v6, (uint64_t)v8);
      return sub_1A2B4D72C(v8, a1);
    }
    else
    {
      sub_1A2BF1404((uint64_t)&v6, &qword_1E9596090);
      uint64_t v4 = sub_1A2C0D2F0();
      sub_1A2B4E984();
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 104))(v5, *MEMORY[0x1E4F5F270], v4);
      swift_willThrow();
      return sub_1A2BF1404((uint64_t)v9, &qword_1E9595F00);
    }
  }
  return result;
}

uint64_t sub_1A2BF05BC()
{
  sub_1A2BF1300();
  sub_1A2C0D770();
  if (!v0)
  {
    uint64_t v1 = sub_1A2C0D2F0();
    sub_1A2B4E984();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, *MEMORY[0x1E4F5F270], v1);
    swift_willThrow();
  }
  return sub_1A2B48634(0, 0xF000000000000000);
}

uint64_t sub_1A2BF0720@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + 40;
  sub_1A2BF145C(v1 + 40, (uint64_t)&v15, &qword_1E9596090);
  if (*((void *)&v16 + 1)) {
    return sub_1A2B4D72C(&v15, a1);
  }
  sub_1A2BF1404((uint64_t)&v15, &qword_1E9596090);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v8 = sub_1A2C0DA10();
  unsigned int v18 = &v13;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v13 - v9;
  uint64_t result = sub_1A2C0D2E0();
  if (!v2)
  {
    uint64_t v11 = v14;
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v7) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v8);
      uint64_t v17 = 0;
      long long v15 = 0u;
      long long v16 = 0u;
    }
    else
    {
      *((void *)&v16 + 1) = v7;
      uint64_t v17 = v6;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v15);
      (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(boxed_opaque_existential_1, v10, v7);
    }
    sub_1A2BF14BC((uint64_t)&v15, v4, &qword_1E9596090);
    return sub_1A2BF145C(v4, a1, &qword_1E9596090);
  }
  return result;
}

uint64_t sub_1A2BF0920(char a1, unsigned char *a2, ValueMetadata **a3, uint64_t *a4, void *a5)
{
  char v9 = a1 & 1;
  if (a1)
  {
    id v10 = &type metadata for InternalPlatformClassifications;
    unint64_t v11 = sub_1A2B9ED60();
  }
  else
  {
    id v10 = &type metadata for SearchRequestDataClassification;
    unint64_t v11 = sub_1A2BA0120();
  }
  *a2 = v9;
  *a3 = v10;
  a3[1] = (ValueMetadata *)v11;
  id v12 = objc_msgSend(a5, sel_readData);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_1A2C0CD30();
    unint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v16 = 0xF000000000000000;
  }
  uint64_t v17 = *a4;
  unint64_t v18 = a4[1];
  *a4 = v14;
  a4[1] = v16;
  return sub_1A2B48634(v17, v18);
}

uint64_t static DataClassificationTag.read(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  unint64_t v11 = 0xF000000000000007;
  sub_1A2BF0ED0();
  sub_1A2C0D770();
  if (!v1)
  {
    sub_1A2BF145C((uint64_t)v9, (uint64_t)&v6, &qword_1E9595F10);
    if (v7)
    {
      sub_1A2B4D72C(&v6, (uint64_t)v8);
      unint64_t v3 = v11;
      if ((~v11 & 0xF000000000000007) != 0)
      {
        sub_1A2B4D72C(v8, a1);
        *(void *)(a1 + 40) = v3;
        return sub_1A2BF1404((uint64_t)v9, &qword_1E9595F10);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    }
    else
    {
      sub_1A2BF1404((uint64_t)&v6, &qword_1E9595F10);
    }
    sub_1A2C0D2F0();
    sub_1A2B4E984();
    swift_allocError();
    OUTLINED_FUNCTION_3();
    (*(void (**)(void))(v4 + 104))();
    swift_willThrow();
  }
  sub_1A2B5EB0C(v11);
  return sub_1A2BF1404((uint64_t)v9, &qword_1E9595F10);
}

uint64_t sub_1A2BF0B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  double v4 = MEMORY[0x1F4188790](a1);
  long long v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v3 + 16))(v6, v4);
  if (swift_dynamicCast())
  {
    uint64_t v7 = 0;
  }
  else if (swift_dynamicCast())
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 2;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, a2);
  return v7;
}

ValueMetadata *sub_1A2BF0C80(char a1)
{
  if (a1)
  {
    uint64_t v1 = &type metadata for InternalPlatformClassifications;
    sub_1A2B9ED60();
  }
  else
  {
    uint64_t v1 = &type metadata for SearchRequestDataClassification;
    sub_1A2BA0120();
  }
  return v1;
}

uint64_t sub_1A2BF0CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2BF0B5C(a1, a2);
  *a3 = result;
  return result;
}

ValueMetadata *sub_1A2BF0CEC()
{
  return sub_1A2BF0C80(*v0);
}

uint64_t DataClassificationTag.write(to:)()
{
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v2);
  v10[3] = v2;
  v10[4] = *(void *)(v3 + 8);
  __swift_allocate_boxed_opaque_existential_1(v10);
  OUTLINED_FUNCTION_3();
  (*(void (**)(void))(v4 + 16))();
  uint64_t v8 = (ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9595E30);
  unint64_t v9 = sub_1A2BF0F1C();
  v7[0] = swift_allocObject();
  sub_1A2BF145C((uint64_t)v10, v7[0] + 16, &qword_1E9595E30);
  sub_1A2C0D7D0();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    unint64_t v5 = v0[5];
    uint64_t v8 = &type metadata for TagPredicate;
    unint64_t v9 = sub_1A2B5F204();
    v7[0] = v5;
    sub_1A2B5E424(v5);
    sub_1A2C0D7D0();
  }
  sub_1A2BF1404((uint64_t)v10, &qword_1E9595E30);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_1A2BF0E40()
{
  return sub_1A2C0D780();
}

uint64_t sub_1A2BF0EB0()
{
  return sub_1A2BF0E40();
}

unint64_t sub_1A2BF0ED0()
{
  unint64_t result = qword_1E9595F18;
  if (!qword_1E9595F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9595F18);
  }
  return result;
}

unint64_t sub_1A2BF0F1C()
{
  unint64_t result = qword_1E9595E28;
  if (!qword_1E9595E28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9595E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9595E28);
  }
  return result;
}

uint64_t sub_1A2BF0F70()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

unint64_t sub_1A2BF0FAC()
{
  unint64_t result = qword_1E9595F20;
  if (!qword_1E9595F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9595F20);
  }
  return result;
}

uint64_t sub_1A2BF0FF8(uint64_t a1)
{
  uint64_t result = sub_1A2BF049C((uint64_t)v7);
  if (!v1)
  {
    sub_1A2B4D72C(v7, (uint64_t)v6);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9596080);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9595F08);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
    }
    return sub_1A2BF14BC((uint64_t)v4, a1, &qword_1E9595F10);
  }
  return result;
}

uint64_t sub_1A2BF10A4()
{
  return DataClassificationTag.write(to:)();
}

uint64_t sub_1A2BF10BC@<X0>(uint64_t a1@<X8>)
{
  return static DataClassificationTag.read(from:)(a1);
}

uint64_t sub_1A2BF10D4()
{
  return sub_1A2C0D2D0();
}

uint64_t sub_1A2BF110C()
{
  return sub_1A2C0D2C0();
}

ValueMetadata *type metadata accessor for DataClassificationTagProtoUnionDomain()
{
  return &type metadata for DataClassificationTagProtoUnionDomain;
}

unsigned char *_s13SiriAnalytics37DataClassificationTagProtoUnionDomainOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2BF1250);
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

ValueMetadata *_s6FieldsOMa_5()
{
  return &_s6FieldsON_4;
}

unint64_t sub_1A2BF128C()
{
  unint64_t result = qword_1E9597330;
  if (!qword_1E9597330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597330);
  }
  return result;
}

unint64_t sub_1A2BF12D8(uint64_t a1)
{
  unint64_t result = sub_1A2BF1300();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A2BF1300()
{
  unint64_t result = qword_1E9596018;
  if (!qword_1E9596018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9596018);
  }
  return result;
}

unint64_t sub_1A2BF1350()
{
  unint64_t result = qword_1E9597338;
  if (!qword_1E9597338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9597338);
  }
  return result;
}

unint64_t sub_1A2BF139C()
{
  unint64_t result = qword_1E9597340[0];
  if (!qword_1E9597340[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9597340);
  }
  return result;
}

uint64_t sub_1A2BF13E8()
{
  return sub_1A2BF0FF8(*(void *)(v0 + 16));
}

uint64_t sub_1A2BF1404(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1A2BF145C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1A2BF14BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_1A2BF151C(char *a1, unsigned char *a2, ValueMetadata **a3, uint64_t *a4, void *a5)
{
  return sub_1A2BF0920(*a1, a2, a3, a4, a5);
}

uint64_t sub_1A2BF1538(char *a1)
{
  return sub_1A2BF151C(a1, *(unsigned char **)(v1 + 16), *(ValueMetadata ***)(v1 + 24), *(uint64_t **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_1A2BF1568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t type metadata accessor for CounterDigest()
{
  return swift_getGenericMetadata();
}

void sub_1A2BF7488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BF8360(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A2BF86B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A2BF8E08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A2BFA460(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A2BFAA2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1A2BFAF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BFB52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BFBB50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1A2BFC34C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1A2BFCAEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

unint64_t SiriAnalyticsMachAbsoluteTimeGetNanoseconds(unint64_t a1)
{
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_403);
  }
  return (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)a1);
}

void sub_1A2C03830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A2C03E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SiriAnalyticsLoggingInit()
{
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
}

uint64_t __SiriAnalyticsLoggingInit_block_invoke()
{
  os_log_t v0 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryXPC);
  uint64_t v1 = (void *)SiriAnalyticsLogContextXPC;
  SiriAnalyticsLogContextXPC = (uint64_t)v0;

  os_log_t v2 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryUtility);
  uint64_t v3 = (void *)SiriAnalyticsLogContextUtility;
  SiriAnalyticsLogContextUtility = (uint64_t)v2;

  os_log_t v4 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryAssistant);
  uint64_t v5 = (void *)SiriAnalyticsLogContextAssistant;
  SiriAnalyticsLogContextAssistant = (uint64_t)v4;

  os_log_t v6 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryStreaming);
  uint64_t v7 = (void *)SiriAnalyticsLogContextStreaming;
  SiriAnalyticsLogContextStreaming = (uint64_t)v6;

  os_log_t v8 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryStorage);
  unint64_t v9 = (void *)SiriAnalyticsLogContextStorage;
  SiriAnalyticsLogContextStorage = (uint64_t)v8;

  os_log_t v10 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryTime);
  unint64_t v11 = (void *)SiriAnalyticsLogContextTime;
  SiriAnalyticsLogContextTime = (uint64_t)v10;

  os_log_t v12 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryResolution);
  uint64_t v13 = (void *)SiriAnalyticsLogContextResolution;
  SiriAnalyticsLogContextResolution = (uint64_t)v12;

  os_log_t v14 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryPerformance);
  unint64_t v15 = (void *)SiriAnalyticsLogContextPerformance;
  SiriAnalyticsLogContextPerformance = (uint64_t)v14;

  os_log_t v16 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMessageTailing);
  uint64_t v17 = (void *)SiriAnalyticsLogContextMessageTailing;
  SiriAnalyticsLogContextMessageTailing = (uint64_t)v16;

  os_log_t v18 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategorySensitiveConditions);
  uint64_t v19 = (void *)SiriAnalyticsLogContextSensitiveConditions;
  SiriAnalyticsLogContextSensitiveConditions = (uint64_t)v18;

  os_log_t v20 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryDB);
  uint64_t v21 = (void *)SiriAnalyticsLogContextDB;
  SiriAnalyticsLogContextDB = (uint64_t)v20;

  os_log_t v22 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMetastore);
  uint64_t v23 = (void *)SiriAnalyticsLogContextMetastore;
  SiriAnalyticsLogContextMetastore = (uint64_t)v22;

  os_log_t v24 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMessageStaging);
  uint64_t v25 = (void *)SiriAnalyticsLogContextMessageStaging;
  SiriAnalyticsLogContextMessageStaging = (uint64_t)v24;

  os_log_t v26 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryPreprocessor);
  id v27 = (void *)SiriAnalyticsLogContextPreprocessor;
  SiriAnalyticsLogContextPreprocessor = (uint64_t)v26;

  os_log_t v28 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryUnifiedBiomeStream);
  char v29 = (void *)SiriAnalyticsLogContextUnifiedBiomeStream;
  SiriAnalyticsLogContextUnifiedBiomeStream = (uint64_t)v28;

  os_log_t v30 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryLargeUpload);
  objc_super v31 = (void *)SiriAnalyticsLogContextLargeUpload;
  SiriAnalyticsLogContextLargeUpload = (uint64_t)v30;

  SiriAnalyticsLogContextOrchestrator = (uint64_t)os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryOrchestrator);
  return MEMORY[0x1F41817F8]();
}

void sub_1A2C04F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2C055BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Block_object_dispose((const void *)(v21 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t SiriAnalyticsIsInternalInstall()
{
  if (SiriAnalyticsIsInternalInstall_onceToken != -1) {
    dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_932);
  }
  return SiriAnalyticsIsInternalInstall_isInternal;
}

uint64_t __SiriAnalyticsIsInternalInstall_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  SiriAnalyticsIsInternalInstall_isInternal = result;
  return result;
}

NSObject *SiriAnalyticsCreateFireOnceTimer(NSObject *a1, void *a2, double a3)
{
  id v5 = a2;
  os_log_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v5);

  return v6;
}

id SiriAnalyticsXPCServiceInterface()
{
  v41[4] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF5D4E60];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v41[2] = objc_opt_class();
  v41[3] = objc_opt_class();
  os_log_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_publishMessages_completion_ argumentIndex:0 ofReply:0];

  os_log_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  os_log_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_publishLargeMessage_completion_ argumentIndex:0 ofReply:0];

  dispatch_time_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  v39[2] = objc_opt_class();
  v39[3] = objc_opt_class();
  os_log_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  unint64_t v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_publishLargeMessage_completion_ argumentIndex:0 ofReply:1];

  os_log_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v38[3] = objc_opt_class();
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  os_log_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_resolveMessages_completion_ argumentIndex:0 ofReply:0];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  _OWORD v37[2] = objc_opt_class();
  os_log_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  unint64_t v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_publishUnorderedMessages_topic_completion_ argumentIndex:0 ofReply:0];

  os_log_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  os_log_t v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_fetchLogicalClocksWithCompletion_ argumentIndex:1 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  v35[4] = objc_opt_class();
  os_log_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  uint64_t v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_fetchTags_ argumentIndex:1 ofReply:1];

  os_log_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  os_log_t v24 = [v22 setWithArray:v23];
  [v0 setClasses:v24 forSelector:sel_fetchStateForPluginWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  os_log_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  id v27 = [v25 setWithArray:v26];
  [v0 setClasses:v27 forSelector:sel_saveState_forPluginWithCompletion_ argumentIndex:0 ofReply:0];

  os_log_t v28 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  char v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  os_log_t v30 = [v28 setWithArray:v29];
  [v0 setClasses:v30 forSelector:sel_createTag_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t SiriAnalyticsAbsoluteToContinuousTimestamp(uint64_t a1)
{
  uint64_t v2 = mach_continuous_time();
  return v2 + a1 - mach_absolute_time();
}

uint64_t sub_1A2C0CB60()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A2C0CB70()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A2C0CB80()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A2C0CB90()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A2C0CBA0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A2C0CBB0()
{
  return MEMORY[0x1F40E3F40]();
}

uint64_t sub_1A2C0CC00()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1A2C0CC30()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A2C0CC40()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A2C0CC50()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1A2C0CC60()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A2C0CC70()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1A2C0CC80()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A2C0CC90()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1A2C0CCA0()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1A2C0CCB0()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1A2C0CCC0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A2C0CCD0()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1A2C0CCE0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1A2C0CCF0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A2C0CD00()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A2C0CD10()
{
  return MEMORY[0x1F4151358]();
}

uint64_t sub_1A2C0CD20()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A2C0CD30()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A2C0CD40()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A2C0CD50()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A2C0CD60()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1A2C0CD70()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1A2C0CD80()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A2C0CD90()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A2C0CDA0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A2C0CDB0()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1A2C0CDC0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A2C0CDD0()
{
  return MEMORY[0x1F4151360]();
}

uint64_t sub_1A2C0CDE0()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1A2C0CDF0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1A2C0CE00()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1A2C0CE10()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A2C0CE20()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A2C0CE30()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1A2C0CE40()
{
  return MEMORY[0x1F40E08D0]();
}

uint64_t sub_1A2C0CE50()
{
  return MEMORY[0x1F40E08D8]();
}

uint64_t sub_1A2C0CE60()
{
  return MEMORY[0x1F40E08E8]();
}

uint64_t sub_1A2C0CE70()
{
  return MEMORY[0x1F40E08F0]();
}

uint64_t sub_1A2C0CE80()
{
  return MEMORY[0x1F40E08F8]();
}

uint64_t sub_1A2C0CE90()
{
  return MEMORY[0x1F40E0900]();
}

uint64_t sub_1A2C0CEA0()
{
  return MEMORY[0x1F40E0910]();
}

uint64_t sub_1A2C0CEB0()
{
  return MEMORY[0x1F40E0948]();
}

uint64_t sub_1A2C0CED0()
{
  return MEMORY[0x1F40E0960]();
}

uint64_t sub_1A2C0CEE0()
{
  return MEMORY[0x1F40E0970]();
}

uint64_t sub_1A2C0CEF0()
{
  return MEMORY[0x1F40E0988]();
}

uint64_t sub_1A2C0CF00()
{
  return MEMORY[0x1F40E09A0]();
}

uint64_t sub_1A2C0CF10()
{
  return MEMORY[0x1F4151368]();
}

uint64_t sub_1A2C0CF20()
{
  return MEMORY[0x1F4151370]();
}

uint64_t sub_1A2C0CF30()
{
  return MEMORY[0x1F4151378]();
}

uint64_t sub_1A2C0CF40()
{
  return MEMORY[0x1F4151380]();
}

uint64_t sub_1A2C0CF50()
{
  return MEMORY[0x1F4151388]();
}

uint64_t sub_1A2C0CF60()
{
  return MEMORY[0x1F4151390]();
}

uint64_t sub_1A2C0CF70()
{
  return MEMORY[0x1F4151398]();
}

uint64_t sub_1A2C0CF80()
{
  return MEMORY[0x1F41513A0]();
}

uint64_t sub_1A2C0CF90()
{
  return MEMORY[0x1F41513A8]();
}

uint64_t sub_1A2C0CFA0()
{
  return MEMORY[0x1F41513B0]();
}

uint64_t sub_1A2C0CFB0()
{
  return MEMORY[0x1F41513B8]();
}

uint64_t sub_1A2C0CFC0()
{
  return MEMORY[0x1F41513C0]();
}

uint64_t sub_1A2C0CFD0()
{
  return MEMORY[0x1F41513C8]();
}

uint64_t sub_1A2C0CFE0()
{
  return MEMORY[0x1F41513D0]();
}

uint64_t sub_1A2C0CFF0()
{
  return MEMORY[0x1F41513D8]();
}

uint64_t sub_1A2C0D000()
{
  return MEMORY[0x1F41513E0]();
}

uint64_t sub_1A2C0D010()
{
  return MEMORY[0x1F41513E8]();
}

uint64_t sub_1A2C0D020()
{
  return MEMORY[0x1F41513F0]();
}

uint64_t sub_1A2C0D030()
{
  return MEMORY[0x1F41513F8]();
}

uint64_t sub_1A2C0D040()
{
  return MEMORY[0x1F4151400]();
}

uint64_t sub_1A2C0D050()
{
  return MEMORY[0x1F4151408]();
}

uint64_t sub_1A2C0D060()
{
  return MEMORY[0x1F4151410]();
}

uint64_t sub_1A2C0D070()
{
  return MEMORY[0x1F4151418]();
}

uint64_t sub_1A2C0D080()
{
  return MEMORY[0x1F4151420]();
}

uint64_t sub_1A2C0D090()
{
  return MEMORY[0x1F4151428]();
}

uint64_t sub_1A2C0D0A0()
{
  return MEMORY[0x1F4151430]();
}

uint64_t sub_1A2C0D0B0()
{
  return MEMORY[0x1F4151438]();
}

uint64_t sub_1A2C0D0C0()
{
  return MEMORY[0x1F4151440]();
}

uint64_t sub_1A2C0D0D0()
{
  return MEMORY[0x1F4151448]();
}

uint64_t sub_1A2C0D0E0()
{
  return MEMORY[0x1F4151450]();
}

uint64_t sub_1A2C0D0F0()
{
  return MEMORY[0x1F4151458]();
}

uint64_t sub_1A2C0D100()
{
  return MEMORY[0x1F4151460]();
}

uint64_t sub_1A2C0D110()
{
  return MEMORY[0x1F4151468]();
}

uint64_t sub_1A2C0D120()
{
  return MEMORY[0x1F4151470]();
}

uint64_t sub_1A2C0D130()
{
  return MEMORY[0x1F4151478]();
}

uint64_t sub_1A2C0D140()
{
  return MEMORY[0x1F4151480]();
}

uint64_t sub_1A2C0D150()
{
  return MEMORY[0x1F4151488]();
}

uint64_t sub_1A2C0D160()
{
  return MEMORY[0x1F4151490]();
}

uint64_t sub_1A2C0D170()
{
  return MEMORY[0x1F4151498]();
}

uint64_t sub_1A2C0D180()
{
  return MEMORY[0x1F41514A0]();
}

uint64_t sub_1A2C0D190()
{
  return MEMORY[0x1F41514A8]();
}

uint64_t sub_1A2C0D1A0()
{
  return MEMORY[0x1F4126E20]();
}

uint64_t sub_1A2C0D1B0()
{
  return MEMORY[0x1F4126E28]();
}

uint64_t sub_1A2C0D1C0()
{
  return MEMORY[0x1F4126E30]();
}

uint64_t sub_1A2C0D1D0()
{
  return MEMORY[0x1F4126E38]();
}

uint64_t sub_1A2C0D1E0()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1A2C0D1F0()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1A2C0D200()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1A2C0D210()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A2C0D220()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A2C0D230()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1A2C0D240()
{
  return MEMORY[0x1F41884B0]();
}

uint64_t sub_1A2C0D250()
{
  return MEMORY[0x1F41884C8]();
}

uint64_t sub_1A2C0D260()
{
  return MEMORY[0x1F4117418]();
}

uint64_t sub_1A2C0D270()
{
  return MEMORY[0x1F4117420]();
}

uint64_t sub_1A2C0D280()
{
  return MEMORY[0x1F4117428]();
}

uint64_t sub_1A2C0D290()
{
  return MEMORY[0x1F4117430]();
}

uint64_t sub_1A2C0D2A0()
{
  return MEMORY[0x1F4117438]();
}

uint64_t sub_1A2C0D2B0()
{
  return MEMORY[0x1F4117440]();
}

uint64_t sub_1A2C0D2C0()
{
  return MEMORY[0x1F4117448]();
}

uint64_t sub_1A2C0D2D0()
{
  return MEMORY[0x1F4117460]();
}

uint64_t sub_1A2C0D2E0()
{
  return MEMORY[0x1F4117468]();
}

uint64_t sub_1A2C0D2F0()
{
  return MEMORY[0x1F4117478]();
}

uint64_t sub_1A2C0D300()
{
  return MEMORY[0x1F4117480]();
}

uint64_t sub_1A2C0D310()
{
  return MEMORY[0x1F4117488]();
}

uint64_t sub_1A2C0D320()
{
  return MEMORY[0x1F4117490]();
}

uint64_t sub_1A2C0D330()
{
  return MEMORY[0x1F4117498]();
}

uint64_t sub_1A2C0D340()
{
  return MEMORY[0x1F41174A0]();
}

uint64_t sub_1A2C0D350()
{
  return MEMORY[0x1F41174A8]();
}

uint64_t sub_1A2C0D360()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t sub_1A2C0D370()
{
  return MEMORY[0x1F4186C70]();
}

uint64_t sub_1A2C0D380()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1A2C0D390()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1A2C0D3A0()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1A2C0D3B0()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t sub_1A2C0D3C0()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t sub_1A2C0D3D0()
{
  return MEMORY[0x1F4186F00]();
}

uint64_t sub_1A2C0D3E0()
{
  return MEMORY[0x1F4186F10]();
}

uint64_t sub_1A2C0D3F0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A2C0D400()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A2C0D410()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A2C0D420()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A2C0D430()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A2C0D440()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A2C0D450()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A2C0D460()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_1A2C0D470()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A2C0D480()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A2C0D490()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A2C0D4A0()
{
  return MEMORY[0x1F40E6260]();
}

uint64_t sub_1A2C0D4B0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1A2C0D4C0()
{
  return MEMORY[0x1F40E6278]();
}

uint64_t sub_1A2C0D4D0()
{
  return MEMORY[0x1F40E6290]();
}

uint64_t sub_1A2C0D4E0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1A2C0D4F0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A2C0D500()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A2C0D510()
{
  return MEMORY[0x1F41838C8]();
}

uint64_t sub_1A2C0D520()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A2C0D530()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A2C0D540()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A2C0D550()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1A2C0D560()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A2C0D570()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A2C0D580()
{
  return MEMORY[0x1F40E6308]();
}

uint64_t sub_1A2C0D590()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1A2C0D5A0()
{
  return MEMORY[0x1F41514B0]();
}

uint64_t sub_1A2C0D5B0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A2C0D5C0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A2C0D5D0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A2C0D5E0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A2C0D5F0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A2C0D600()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A2C0D610()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A2C0D620()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A2C0D630()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A2C0D640()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A2C0D650()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A2C0D660()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A2C0D690()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1A2C0D6A0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A2C0D6B0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A2C0D6D0()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1A2C0D6F0()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1A2C0D700()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1A2C0D710()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1A2C0D720()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A2C0D730()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_1A2C0D740()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A2C0D750()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1A2C0D760()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1A2C0D770()
{
  return MEMORY[0x1F41174C0]();
}

uint64_t sub_1A2C0D780()
{
  return MEMORY[0x1F41174D8]();
}

uint64_t sub_1A2C0D790()
{
  return MEMORY[0x1F41174E0]();
}

uint64_t sub_1A2C0D7A0()
{
  return MEMORY[0x1F41174E8]();
}

uint64_t sub_1A2C0D7B0()
{
  return MEMORY[0x1F41174F0]();
}

uint64_t sub_1A2C0D7C0()
{
  return MEMORY[0x1F4117500]();
}

uint64_t sub_1A2C0D7D0()
{
  return MEMORY[0x1F4117510]();
}

uint64_t sub_1A2C0D7E0()
{
  return MEMORY[0x1F4117518]();
}

uint64_t sub_1A2C0D7F0()
{
  return MEMORY[0x1F4117520]();
}

uint64_t sub_1A2C0D800()
{
  return MEMORY[0x1F41514B8]();
}

uint64_t sub_1A2C0D810()
{
  return MEMORY[0x1F41514C0]();
}

uint64_t sub_1A2C0D820()
{
  return MEMORY[0x1F4186F88]();
}

uint64_t sub_1A2C0D830()
{
  return MEMORY[0x1F4186F98]();
}

uint64_t sub_1A2C0D840()
{
  return MEMORY[0x1F4186FF8]();
}

uint64_t sub_1A2C0D850()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1A2C0D860()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_1A2C0D870()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1A2C0D880()
{
  return MEMORY[0x1F4187138]();
}

uint64_t sub_1A2C0D890()
{
  return MEMORY[0x1F4187160]();
}

uint64_t sub_1A2C0D8A0()
{
  return MEMORY[0x1F4187180]();
}

uint64_t sub_1A2C0D8B0()
{
  return MEMORY[0x1F41871D8]();
}

uint64_t sub_1A2C0D8C0()
{
  return MEMORY[0x1F4187220]();
}

uint64_t sub_1A2C0D8D0()
{
  return MEMORY[0x1F4187228]();
}

uint64_t sub_1A2C0D8E0()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1A2C0D8F0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1A2C0D900()
{
  return MEMORY[0x1F41514D0]();
}

uint64_t sub_1A2C0D910()
{
  return MEMORY[0x1F41514E0]();
}

uint64_t sub_1A2C0D920()
{
  return MEMORY[0x1F4187298]();
}

uint64_t sub_1A2C0D930()
{
  return MEMORY[0x1F41872B0]();
}

uint64_t sub_1A2C0D940()
{
  return MEMORY[0x1F41872C8]();
}

uint64_t sub_1A2C0D950()
{
  return MEMORY[0x1F41514E8]();
}

uint64_t sub_1A2C0D960()
{
  return MEMORY[0x1F41514F0]();
}

uint64_t sub_1A2C0D970()
{
  return MEMORY[0x1F41514F8]();
}

uint64_t sub_1A2C0D980()
{
  return MEMORY[0x1F4151508]();
}

uint64_t sub_1A2C0D990()
{
  return MEMORY[0x1F41872E8]();
}

uint64_t sub_1A2C0D9A0()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1A2C0D9B0()
{
  return MEMORY[0x1F40E6880]();
}

uint64_t sub_1A2C0D9C0()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1A2C0D9D0()
{
  return MEMORY[0x1F41874B0]();
}

uint64_t sub_1A2C0D9E0()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1A2C0D9F0()
{
  return MEMORY[0x1F41874D8]();
}

uint64_t sub_1A2C0DA00()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A2C0DA10()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A2C0DA20()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A2C0DA30()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A2C0DA40()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A2C0DA50()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A2C0DA60()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1A2C0DA70()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A2C0DA80()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A2C0DA90()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1A2C0DAA0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1A2C0DAB0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1A2C0DAC0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1A2C0DAD0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1A2C0DAE0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1A2C0DAF0()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1A2C0DB00()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A2C0DB10()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A2C0DB20()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A2C0DB30()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1A2C0DB40()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A2C0DB50()
{
  return MEMORY[0x1F4184CC8]();
}

uint64_t sub_1A2C0DB60()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A2C0DB70()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A2C0DB80()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A2C0DB90()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A2C0DBA0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A2C0DBB0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A2C0DBC0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A2C0DBD0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A2C0DBE0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A2C0DBF0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A2C0DC00()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1A2C0DC10()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1A2C0DC20()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1A2C0DC30()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1A2C0DC40()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A2C0DC50()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A2C0DC60()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1A2C0DC70()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1A2C0DC80()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1A2C0DC90()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1A2C0DCA0()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1A2C0DCB0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A2C0DCC0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A2C0DCD0()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1A2C0DCE0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A2C0DCF0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A2C0DD00()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1A2C0DD10()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A2C0DD20()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A2C0DD30()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1A2C0DD40()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A2C0DD60()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A2C0DD80()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A2C0DD90()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A2C0DDA0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1A2C0DDC0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1A2C0DDD0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A2C0DDE0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A2C0DDF0()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1A2C0DE30()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A2C0DE40()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A2C0DE50()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A2C0DE60()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A2C0DE70()
{
  return MEMORY[0x1F40E6E50]();
}

uint64_t sub_1A2C0DE80()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1A2C0DE90()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A2C0DEA0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A2C0DEB0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A2C0DEC0()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1A2C0DED0()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1A2C0DEE0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A2C0DEF0()
{
  return MEMORY[0x1F40E6ED8]();
}

uint64_t sub_1A2C0DF00()
{
  return MEMORY[0x1F4186160]();
}

uint64_t sub_1A2C0DF10()
{
  return MEMORY[0x1F4186178]();
}

uint64_t sub_1A2C0DF20()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F950]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F988]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x1F417CE68]();
}

uint64_t MobileGestalt_copy_productType_obj()
{
  return MEMORY[0x1F417CE78]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_deviceSupportsGenerativeModelSystems()
{
  return MEMORY[0x1F417CEB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x1F41813D8]();
}

{
  return MEMORY[0x1F41813E8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE0](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE028](*(void *)&a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4181FC8](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE180](*(void *)&__errnum);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3C8](a1, a2, a3, a4, a5);
}