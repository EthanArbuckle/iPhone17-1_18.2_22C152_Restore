unsigned char *sub_1A2C8E9CC(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Access()
{
  return &type metadata for Access;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

uint64_t sub_1A2C8E9F4()
{
  return swift_initClassMetadata2();
}

uint64_t AppGroup.cachesDirectoryURL.getter()
{
  uint64_t v0 = sub_1A2CA78F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  AppGroup.containerURL.getter((uint64_t)v3);
  sub_1A2CA78D8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1A2C8EB44()
{
  type metadata accessor for SettingReader();
  uint64_t v0 = swift_allocObject();
  type metadata accessor for SettingReader.Reader();
  uint64_t result = swift_allocObject();
  *(void *)(v0 + 16) = result;
  qword_1EB5A4D40 = v0;
  return result;
}

void *PresetManager.init()()
{
  sub_1A2C95140();
  v0[4] = sub_1A2CA7A28();
  type metadata accessor for Updater();
  v0[2] = swift_allocObject();
  v0[3] = &protocol witness table for Updater;
  return v0;
}

id AppGroup.init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  uint64_t v7 = sub_1A2CA78F8();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain);
  uint64_t *v8 = a1;
  v8[1] = a2;
  objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  swift_bridgeObjectRetain_n();
  id result = sub_1A2C93820(a1, a2);
  if (result)
  {
    *(void *)(v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup_userDefaults) = result;
    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for PresetStartupTask()
{
  return self;
}

uint64_t AppGroup.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingGroup.__allocating_init(key:defaultValue:access:domain:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v10 = *a4;
  uint64_t v5 = (*(uint64_t (**)(void))(v4 + 136))();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 16);
    uint64_t v8 = *(void *)(v6 + 24);
    sub_1A2C91834();
    swift_allocObject();
    *(void *)(v5 + 16) = sub_1A2C90F0C(v7, v8);
    swift_bridgeObjectRetain();
    swift_release();
    return v5;
  }
  else
  {
    swift_retain();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

unint64_t sub_1A2C8EDD8()
{
  unint64_t result = qword_1EB5A49D8;
  if (!qword_1EB5A49D8)
  {
    sub_1A2CA7938();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A49D8);
  }
  return result;
}

uint64_t sub_1A2C8EE28(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_bridgeObjectRelease();
}

uint64_t static SettingReader.shared.getter()
{
  if (qword_1EB5A4D48 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_1A2C8EF1C()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  type metadata accessor for SettingsStore();
  uint64_t v1 = swift_allocObject();
  uint64_t result = sub_1A2C8EFE4(v0);
  qword_1EB5A5340 = v1;
  return result;
}

#error "1A2C8EFBC: call analysis failed (funcsize=24)"

uint64_t sub_1A2C8EFE4(void *a1)
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = v3;
  uint64_t v4 = self;
  id v5 = a1;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  uint64_t v7 = *MEMORY[0x1E4F28AC8];
  swift_retain();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v1, sel_defaultsDidChange, v7, 0);

  swift_release();
  return v1;
}

uint64_t sub_1A2C8F0A4()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_processInfo);
  uint64_t v3 = sub_1A2CA7C68();

  uint64_t v4 = v1 + 2;
  uint64_t v6 = v1[5];
  uint64_t v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v4, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v5);
  swift_bridgeObjectRelease();
  sub_1A2C95254();
  swift_allocObject();
  return sub_1A2CA79B8();
}

void *sub_1A2C8F174(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48) + 7;
  v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t Setting.deinit()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1();
  v1();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + *(void *)(*(void *)v0 + 120));
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  type metadata accessor for Trait();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1();
  v2();
  return v0;
}

uint64_t sub_1A2C8F348@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A2CA78F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C8F7FC();
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_defaultManager);
  uint64_t v9 = (void *)sub_1A2CA7A58();
  id v10 = objc_msgSend(v8, sel_containerURLForSecurityApplicationGroupIdentifier_, v9);

  if (v10)
  {
    sub_1A2CA78E8();

    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v11(v7, v5, v2);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v2);
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v2) != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v11)(a1, v7, v2);
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v2);
  }
  v13 = NSTemporaryDirectory();
  uint64_t v14 = sub_1A2CA7A68();
  uint64_t v16 = v15;

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F29128]), sel_init);
  id v18 = objc_msgSend(v17, sel_UUIDString);

  sub_1A2CA7A68();
  v19[0] = v14;
  v19[1] = v16;
  swift_bridgeObjectRetain();
  sub_1A2CA7A98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A2CA78C8();
  swift_bridgeObjectRelease();
  return sub_1A2C95A18((uint64_t)v7);
}

uint64_t sub_1A2C8F5F0(uint64_t a1, uint64_t a2)
{
  sub_1A2C8F7FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AppGroup.containerURL.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A2C8F7FC();
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v11[-v6];
  uint64_t v8 = v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  swift_beginAccess();
  sub_1A2C8F5F0(v8, (uint64_t)v7);
  uint64_t v9 = sub_1A2CA78F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, v7, v9);
  }
  sub_1A2C95A18((uint64_t)v7);
  sub_1A2C8F348(a1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v5, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v9);
  swift_beginAccess();
  sub_1A2C95A74((uint64_t)v5, v8);
  return swift_endAccess();
}

void sub_1A2C8F7FC()
{
  if (!qword_1EB5A4C68)
  {
    sub_1A2CA78F8();
    unint64_t v0 = sub_1A2CA7C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C68);
    }
  }
}

uint64_t type metadata accessor for Settings()
{
  return self;
}

uint64_t sub_1A2C8F878()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Domain(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A2C8F94C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1A2C8F990()
{
  return sub_1A2C92A90(v0);
}

uint64_t sub_1A2C8F998()
{
  v2[4] = MEMORY[0x1E4FBAD80] + 64;
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t Option.init(label:value:description:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  *(void *)a7 = a1;
  *((void *)a7 + 1) = a2;
  uint64_t v12 = type metadata accessor for Option();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(&a7[*(int *)(v12 + 28)], a3, a6);
  uint64_t v14 = &a7[*(int *)(v12 + 32)];
  *(void *)uint64_t v14 = a4;
  *((void *)v14 + 1) = a5;
  return result;
}

uint64_t type metadata accessor for Option()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Updatable.save<A>(setting:value:)()
{
  void (*v7)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  void *WitnessTable;
  void v11[4];
  uint64_t v12;

  OUTLINED_FUNCTION_0_4();
  uint64_t v2 = v1;
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB5A5340;
  uint64_t v12 = v0;
  uint64_t v6 = v2 + 88;
  uint64_t v4 = *(void *)(v2 + 88);
  uint64_t v5 = *(void *)(v6 + 8);
  uint64_t v7 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 32);
  swift_retain();
  v7(v11, v4, v5);
  uint64_t v8 = type metadata accessor for Setting();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C8FBFC((uint64_t)&v12, v11, v3, v8, WitnessTable);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return swift_release();
}

uint64_t sub_1A2C8FBFC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v12);
  uint64_t v13 = OUTLINED_FUNCTION_6();
  uint64_t v15 = v14(v13);
  BOOL v16 = sub_1A2C94454(v15);
  swift_bridgeObjectRelease();
  if (v16)
  {
    uint64_t v17 = OUTLINED_FUNCTION_3_0();
    v18(v17);
    v24[0] = v24[2];
    v24[1] = v24[3];
    id v19 = sub_1A2C9474C(v24);
    swift_bridgeObjectRelease();
    if (v19)
    {
      __swift_project_boxed_opaque_existential_1(a2, a2[3]);
      uint64_t v20 = sub_1A2CA7DE8();
      uint64_t v21 = OUTLINED_FUNCTION_4_0();
      v22(v21);
      sub_1A2CA7A58();
      OUTLINED_FUNCTION_10();
      objc_msgSend(v19, sel_setObject_forKey_, v20, a5);

      swift_unknownObjectRelease();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a4);
}

uint64_t type metadata accessor for SettingReader()
{
  return self;
}

void SettingProperty.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_7();
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  uint64_t v25 = *v20;
  uint64_t v26 = *(void *)(*v20 + 80);
  OUTLINED_FUNCTION_0_1();
  uint64_t v28 = v27;
  MEMORY[0x1F4188790](v29);
  v31 = (char *)&a9 - v30;
  swift_getFunctionTypeMetadata1();
  uint64_t v32 = sub_1A2CA7BB8();
  v20[2] = v24;
  v20[3] = v32;
  uint64_t v33 = swift_allocObject();
  swift_weakInit();
  v34 = (void *)swift_allocObject();
  v34[2] = v26;
  v34[3] = *(void *)(v25 + 88);
  v34[4] = v33;
  swift_retain();
  swift_retain();
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v26);
  swift_release();
  OUTLINED_FUNCTION_5_2();
}

void Configurable.setting<A>(_:_:)()
{
  OUTLINED_FUNCTION_7();
  v17[0] = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  uint64_t v10 = *(void *)(*v7 + 88);
  uint64_t v11 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v14);
  BOOL v16 = (char *)v17 - v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v17 - v15, 1, 1, v10);
  (*(void (**)(uint64_t *, char *, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(v2 + 32))(v8, v16, v6, v4, v10, *(void *)(v9 + 96), v17[0], v2);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  OUTLINED_FUNCTION_5_2();
}

void Configurable.setting<A>(_:defaultValue:_:)()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v30 = v4;
  uint64_t v31 = v5;
  uint64_t v7 = v6;
  uint64_t v32 = v8;
  v29[0] = *v6;
  v29[1] = v9;
  uint64_t v10 = *(void *)(v29[0] + 88);
  uint64_t v11 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v14);
  BOOL v16 = (char *)v29 - v15;
  uint64_t v17 = swift_bridgeObjectRetain();
  BOOL v18 = sub_1A2C94454(v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t v19 = swift_allocBox();
    (*(void (**)(void *, uint64_t, void, uint64_t, uint64_t))(v1 + 8))(v7, v10, *(void *)(v29[0] + 96), v3, v1);
    if (qword_1EB5A4ED8 != -1) {
      swift_once();
    }
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v3;
    v21[3] = v1;
    v21[4] = v20;
    v21[5] = v7;
    uint64_t v22 = v30;
    v21[6] = v19;
    v21[7] = v22;
    v21[8] = v31;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A2C903D4((uint64_t)sub_1A2C92B98, (uint64_t)v21, v33);
    swift_release();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v33, v33[3]);
    sub_1A2CA7958();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    swift_beginAccess();
    OUTLINED_FUNCTION_6_0();
    uint64_t v23 = OUTLINED_FUNCTION_10_0();
    v24(v23);
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_9_0();
    v25();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v10) == 1)
    {
      OUTLINED_FUNCTION_6_0();
      (*(void (**)(uint64_t))(v26 + 16))(v32);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
    }
    else
    {
      OUTLINED_FUNCTION_6_0();
      uint64_t v27 = OUTLINED_FUNCTION_10_0();
      v28(v27);
    }
  }
  OUTLINED_FUNCTION_5_2();
}

void sub_1A2C903BC()
{
}

uint64_t sub_1A2C903D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1A2CA79D8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2CA79F8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v27 = v15;
  uint64_t v28 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SettingsStore.SettingObserver();
  swift_allocObject();
  swift_retain();
  uint64_t v19 = swift_retain();
  uint64_t v20 = sub_1A2C90800(v19, a1, a2);
  if (objc_msgSend(self, sel_isMainThread))
  {
    sub_1A2C90724(v4);
  }
  else
  {
    sub_1A2C929F8();
    uint64_t v26 = sub_1A2CA7C78();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v4;
    *(void *)(v21 + 24) = v20;
    aBlock[4] = sub_1A2C97D6C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A2C8F94C;
    aBlock[3] = &block_descriptor_12;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    sub_1A2CA79E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1A2C92968(&qword_1EB5A4DA0, MEMORY[0x1E4FBCB00]);
    sub_1A2C92A38();
    sub_1A2C92968(&qword_1EB5A4DB0, (void (*)(uint64_t))sub_1A2C92A38);
    sub_1A2CA7CB8();
    uint64_t v23 = (void *)v26;
    MEMORY[0x1A623E0A0](0, v17, v13, v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
  }
  a3[3] = v18;
  uint64_t result = sub_1A2C92968(&qword_1EB5A4BC0, (void (*)(uint64_t))type metadata accessor for SettingsStore.SettingObserver);
  a3[4] = result;
  *a3 = v20;
  return result;
}

uint64_t sub_1A2C90724(uint64_t a1)
{
  sub_1A2C92BAC();
  swift_beginAccess();
  uint64_t v2 = swift_retain();
  MEMORY[0x1A623DF70](v2);
  sub_1A2C907B0(*(void *)((*(void *)(a1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_1A2CA7BD8();
  sub_1A2CA7B88();
  return swift_endAccess();
}

uint64_t sub_1A2C907B0(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_1A2CA7BA8();
  }
  return result;
}

uint64_t type metadata accessor for SettingsStore.SettingObserver()
{
  return self;
}

uint64_t sub_1A2C90800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_1A2C90854()
{
  return sub_1A2C90878();
}

uint64_t sub_1A2C90878()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t Setting<>.init(_:defaultValue:min:max:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v29 = a2;
  uint64_t v10 = *(void *)(v6 + 88);
  uint64_t v11 = type metadata accessor for Trait();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v28 - v15;
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a6) = *a6;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, a3, v10);
  char v33 = (char)a6;
  v32[0] = 0;
  v32[1] = 0;
  uint64_t v22 = Setting.__allocating_init(_:defaultValue:domain:access:)(a1, v29, (uint64_t)v21, v32, &v33);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a3, v10);
  uint64_t v23 = &v16[*(int *)(swift_getTupleTypeMetadata2() + 48)];
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 32);
  v24(v16, v30, v10);
  v24(v23, v31, v10);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_2();
  uint64_t v26 = v22 + *(void *)(v25 + 152);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 40))(v26, v16, v11);
  swift_endAccess();
  return v22;
}

void *SettingGroup.init(key:defaultValue:access:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  int v19 = a3;
  uint64_t v17 = a2;
  uint64_t v16 = a1;
  v15[1] = *v3;
  uint64_t v21 = sub_1A2CA7E78();
  uint64_t v20 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[2] = 0;
  uint64_t v22 = type metadata accessor for SettingGroup();
  *((void *)&v33 + 1) = v22;
  unint64_t v31 = (unint64_t)v4;
  uint64_t v23 = v4;
  swift_retain();
  sub_1A2CA7E58();
  uint64_t v18 = v6;
  sub_1A2CA7E68();
  sub_1A2CA7D68();
  swift_release();
  swift_retain();
  sub_1A2CA7DB8();
  sub_1A2C90E50((uint64_t)v28, (uint64_t)&v31);
  while (v34)
  {
    swift_bridgeObjectRelease();
    sub_1A2C91E58(&v33, &v27);
    sub_1A2C92524(0, &qword_1EB5A4BC8);
    if (swift_dynamicCast())
    {
      sub_1A2C9250C(&v24, (uint64_t)v28);
      uint64_t v7 = v29;
      uint64_t v8 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      *((void *)&v25 + 1) = v22;
      uint64_t v26 = &off_1EF5DC500;
      *(void *)&long long v24 = v23;
      uint64_t v9 = *(void (**)(long long *, uint64_t, uint64_t))(v8 + 80);
      swift_retain();
      v9(&v24, v7, v8);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v24);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    }
    else
    {
      uint64_t v26 = 0;
      long long v24 = 0u;
      long long v25 = 0u;
      sub_1A2C9613C((uint64_t)&v24);
    }
    sub_1A2CA7DB8();
    sub_1A2C90E50((uint64_t)v28, (uint64_t)&v31);
  }
  swift_release_n();
  uint64_t v10 = v17;
  if (v17)
  {
    uint64_t v11 = v16;
  }
  else
  {
    unint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    sub_1A2CA7CD8();
    swift_bridgeObjectRelease();
    unint64_t v31 = 0xD000000000000011;
    unint64_t v32 = 0x80000001A2CA9570;
    sub_1A2CA7E88();
    sub_1A2CA7A98();
    swift_bridgeObjectRelease();
    uint64_t v11 = v31;
    uint64_t v10 = v32;
  }
  sub_1A2C91834();
  swift_allocObject();
  uint64_t v12 = sub_1A2C90F0C(v11, v10);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v21);
  uint64_t v13 = v23;
  v23[2] = v12;
  swift_release();
  return v13;
}

uint64_t type metadata accessor for SettingGroup()
{
  return self;
}

uint64_t sub_1A2C90E50(uint64_t a1, uint64_t a2)
{
  sub_1A2C90EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A2C90EB4()
{
  if (!qword_1EB5A4C08)
  {
    sub_1A2C951E4();
    unint64_t v0 = sub_1A2CA7C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C08);
    }
  }
}

uint64_t sub_1A2C90F0C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  uint64_t v3 = MEMORY[0x1E4FBB390];
  *(unsigned char *)(v2 + 32) = v4;
  *(unsigned char *)(v2 + 40) = v4;
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = v5;
  *(void *)(v2 + 80) = v6;
  *(unsigned char *)(v2 + 88) = v7;
  sub_1A2C91304(0, (unint64_t *)&qword_1EB5A4EC8, qword_1EB5A4DC0, (uint64_t)&protocol descriptor for ConditionType, MEMORY[0x1E4FBBE00]);
  uint64_t v8 = (__n128 *)swift_allocObject();
  return OUTLINED_FUNCTION_0(v8, (unint64_t)&type metadata for Access, (__n128)xmmword_1A2CA83D0);
}

uint64_t Setting<>.init(_:defaultValue:access:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, char *a4)
{
  char v4 = *a4;
  unsigned __int8 v8 = *a3;
  v7[0] = 0;
  v7[1] = 0;
  char v6 = v4;
  return Setting<>.init(_:defaultValue:domain:access:)(a1, a2, &v8, v7, &v6);
}

uint64_t Setting<>.init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, char *a5)
{
  uint64_t v7 = *a4;
  uint64_t v8 = a4[1];
  char v9 = *a5;
  uint64_t v10 = *a3;
  sub_1A2C910E0();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1A2CA8C30;
  *(unsigned char *)(v11 + 48) = 0;
  *(void *)(v11 + 32) = 0x746C7561666544;
  *(void *)(v11 + 40) = 0xE700000000000000;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(unsigned char *)(v11 + 88) = 1;
  *(void *)(v11 + 72) = 0x64656C62616E45;
  *(void *)(v11 + 80) = 0xE700000000000000;
  *(unsigned char *)(v11 + 128) = 2;
  *(void *)(v11 + 96) = 0;
  *(void *)(v11 + 104) = 0;
  *(void *)(v11 + 112) = 0x64656C6261736944;
  *(void *)(v11 + 120) = 0xE800000000000000;
  *(void *)(v11 + 136) = 0;
  *(void *)(v11 + 144) = 0;

  return sub_1A2C91138(a1, a2, v10, v7, v8, v9, v11);
}

void sub_1A2C910E0()
{
  if (!qword_1EB5A4C50)
  {
    sub_1A2C953E8();
    unint64_t v0 = sub_1A2CA7DD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C50);
    }
  }
}

uint64_t sub_1A2C91138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  swift_allocObject();
  uint64_t v14 = sub_1A2C911F0(a1, a2, a3, a4, a5, a6);
  swift_beginAccess();
  uint64_t v15 = *(void *)(v14 + 104);
  *(void *)(v14 + 104) = a7;
  char v16 = *(unsigned char *)(v14 + 112);
  *(unsigned char *)(v14 + 112) = 0;
  sub_1A2C913C4(v15, v16);
  return v14;
}

uint64_t sub_1A2C911F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  *(unsigned char *)(v6 + 32) = v10;
  if (v10)
  {
    if (v10 == 1)
    {
      unint64_t v11 = 0xE700000000000000;
      uint64_t v12 = 0x64656C62616E65;
    }
    else
    {
      unint64_t v11 = 0xE800000000000000;
      uint64_t v12 = 0x64656C6261736964;
    }
  }
  else
  {
    unint64_t v11 = 0xE700000000000000;
    uint64_t v12 = 0x746C7561666564;
  }
  uint64_t v16 = MEMORY[0x1E4FBB1A0];
  *(void *)&long long v15 = v12;
  *((void *)&v15 + 1) = v11;
  sub_1A2C91E58(&v15, (_OWORD *)(v6 + 40));
  *(void *)(v6 + 72) = a4;
  *(void *)(v6 + 80) = a5;
  *(unsigned char *)(v6 + 88) = a6;
  sub_1A2C91304(0, (unint64_t *)&qword_1EB5A4EC8, qword_1EB5A4DC0, (uint64_t)&protocol descriptor for ConditionType, MEMORY[0x1E4FBBE00]);
  uint64_t v13 = (__n128 *)swift_allocObject();
  return OUTLINED_FUNCTION_0(v13, (unint64_t)&type metadata for Access, (__n128)xmmword_1A2CA83D0);
}

void sub_1A2C91304(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1A2C92524(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1A2C9136C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1A2C92524(255, a3);
    unint64_t v4 = sub_1A2CA7DD8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A2C913C4(uint64_t a1, char a2)
{
  if (!a2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2C913D4()
{
  sub_1A2C91654();
  return v0 & 1;
}

BOOL SettingReader.isEnabled(_:with:)(uint64_t a1, char a2)
{
  return sub_1A2C91424(a1, a2);
}

BOOL sub_1A2C91424(uint64_t a1, char a2)
{
  sub_1A2C9150C(a1, 3, &v6);
  if (v6) {
    return v6 == 1;
  }
  if (a2 != 2) {
    return a2 & 1;
  }
  if (*(unsigned char *)(a1 + 32) && *(unsigned char *)(a1 + 32) == 1)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1A2CA7DF8();
    swift_bridgeObjectRelease();
    return v5 & 1;
  }
}

uint64_t sub_1A2C9150C@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  char v3 = a2;
  if (a2 == 3) {
    char v3 = *(unsigned char *)(a1 + 32);
  }
  uint64_t v6 = swift_bridgeObjectRetain();
  BOOL v7 = sub_1A2C94454(v6);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_8;
  }
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  sub_1A2C91888();
  v12[3] = v9;
  v12[4] = sub_1A2C917E0(qword_1EB5A4CB8, (void (*)(uint64_t))sub_1A2C91888);
  v12[0] = a1;
  unint64_t v11 = &type metadata for FeatureState;
  v10[0] = v3;
  swift_retain();
  sub_1A2C93C0C(v12, (uint64_t)v10, (uint64_t)v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  uint64_t result = swift_dynamicCast();
  if (result) {
    *a3 = v12[0];
  }
  else {
LABEL_8:
  }
    *a3 = v3;
  return result;
}

void sub_1A2C91654()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = swift_retain();
    sub_1A2C9169C(v1, 2);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A2C9169C(uint64_t a1, char a2)
{
  if (a2 == 2) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  }
  else {
    uint64_t v3 = a2 & 1;
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  BOOL v5 = sub_1A2C94454(v4);
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (qword_1EB5A4ED8 != -1) {
      swift_once();
    }
    sub_1A2C91834();
    v10[3] = v6;
    v10[4] = sub_1A2C917E0(&qword_1EB5A4C18, (void (*)(uint64_t))sub_1A2C91834);
    v10[0] = a1;
    uint64_t v9 = MEMORY[0x1E4FBB390];
    v8[0] = v3;
    swift_retain();
    sub_1A2C93C0C(v10, (uint64_t)v8, (uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
    if (swift_dynamicCast()) {
      return v10[0] & 1;
    }
  }
  return v3;
}

uint64_t sub_1A2C917E0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1A2C91834()
{
  if (!qword_1EB5A4BF8)
  {
    unint64_t v0 = type metadata accessor for Setting();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4BF8);
    }
  }
}

void sub_1A2C91888()
{
  if (!qword_1EB5A4C88)
  {
    sub_1A2C958D4();
    unint64_t v0 = type metadata accessor for Setting();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C88);
    }
  }
}

uint64_t Setting<>.init(_:defaultValue:domain:access:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned char *a5, uint64_t a6)
{
  uint64_t v31 = a6;
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v10 = *(void *)(v6 + 88);
  uint64_t v30 = type metadata accessor for Trait();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v13);
  long long v15 = (uint64_t *)((char *)&v28 - v14);
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a4;
  uint64_t v22 = a4[1];
  LOBYTE(a5) = *a5;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a3, v10);
  v32[0] = v21;
  v32[1] = v22;
  char v33 = (char)a5;
  uint64_t v23 = Setting.__allocating_init(_:defaultValue:domain:access:)(v28, v29, (uint64_t)v20, v32, &v33);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v10);
  uint64_t v24 = v30;
  *long long v15 = v31;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_2();
  uint64_t v26 = v23 + *(void *)(v25 + 152);
  swift_beginAccess();
  (*(void (**)(uint64_t, void *, uint64_t))(v12 + 40))(v26, v15, v24);
  swift_endAccess();
  return v23;
}

uint64_t Setting.__allocating_init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char *a5)
{
  uint64_t v10 = swift_allocObject();
  Setting.init(_:defaultValue:domain:access:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_1A2C91B10()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v0 = type metadata accessor for Trait();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return v0;
}

char *Setting.init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char *a5)
{
  void (*v17)(_OWORD *__return_ptr, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  _OWORD v21[2];

  uint64_t v6 = v5;
  uint64_t v10 = *(void *)v6;
  uint64_t v11 = *a4;
  uint64_t v12 = a4[1];
  char v13 = *a5;
  uint64_t v14 = *(void *)(*(void *)v6 + 88);
  type metadata accessor for Trait();
  swift_storeEnumTagMultiPayload();
  *((void *)v6 + 2) = a1;
  *((void *)v6 + 3) = a2;
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(&v6[*(void *)(*(void *)v6 + 112)], a3, v14);
  uint64_t v16 = *(void *)(v10 + 96);
  uint64_t v17 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v16 + 32);
  swift_retain();
  v17(v21, v14, v16);
  sub_1A2C91E58(v21, &v6[*(void *)(*(void *)v6 + 120)]);
  uint64_t v18 = &v6[*(void *)(*(void *)v6 + 128)];
  *(void *)uint64_t v18 = v11;
  *((void *)v18 + 1) = v12;
  v6[*(void *)(*(void *)v6 + 136)] = v13;
  sub_1A2C91E68();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1A2CA83D0;
  *(void *)(v19 + 56) = &type metadata for Access;
  *(void *)(v19 + 64) = &off_1EF5DCDA0;
  *(unsigned char *)(v19 + 32) = v13;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  *(void *)&v6[*(void *)(*(void *)v6 + 144)] = v19;
  swift_release();
  return v6;
}

uint64_t type metadata accessor for Trait()
{
  return __swift_instantiateGenericMetadata();
}

_OWORD *sub_1A2C91E58(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1A2C91E68()
{
  if (!qword_1EB5A4EC8)
  {
    sub_1A2C9587C();
    unint64_t v0 = sub_1A2CA7DD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4EC8);
    }
  }
}

uint64_t Bool.toData()@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 24) = MEMORY[0x1E4FBB390];
  *(unsigned char *)a2 = result;
  return result;
}

uint64_t sub_1A2C91ED4@<X0>(uint64_t a1@<X8>)
{
  return Bool.toData()(*v1, a1);
}

unsigned __int8 *sub_1A2C91EDC(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    unint64_t v10 = ((v7 + v8) & ~v8) + v7;
    if (v10 <= 8) {
      uint64_t v11 = 8;
    }
    else {
      uint64_t v11 = v10;
    }
    unsigned int v12 = __dst[v11];
    char v13 = 8 * v11;
    unsigned int v14 = v12 - 2;
    if (v12 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__dst;
          goto LABEL_14;
        case 2:
          int v16 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v16 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v16 = *(_DWORD *)__dst;
LABEL_14:
          int v17 = (v16 | (v14 << v13)) + 2;
          unsigned int v12 = v16 + 2;
          if (v11 < 4) {
            unsigned int v12 = v17;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v8;
    if (v12 == 1)
    {
      uint64_t v19 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v19(__dst, v5);
      v19((unsigned __int8 *)((unint64_t)&__dst[v9] & v18), v5);
    }
    else if (!v12)
    {
      swift_bridgeObjectRelease();
    }
    unsigned int v20 = __src[v11];
    unsigned int v21 = v20 - 2;
    if (v20 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v22 = v11;
      }
      else {
        uint64_t v22 = 4;
      }
      switch(v22)
      {
        case 1:
          int v23 = *__src;
          goto LABEL_29;
        case 2:
          int v23 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v23 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v23 = *(_DWORD *)__src;
LABEL_29:
          int v24 = (v23 | (v21 << v13)) + 2;
          unsigned int v20 = v23 + 2;
          if (v11 < 4) {
            unsigned int v20 = v24;
          }
          break;
        default:
          break;
      }
    }
    if (v20 == 1)
    {
      uint64_t v25 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
      v25(__dst, __src, v5);
      v25((unsigned __int8 *)((unint64_t)&__dst[v9] & v18), (unsigned __int8 *)((unint64_t)&__src[v9] & v18), v5);
      __dst[v11] = 1;
    }
    else if (v20)
    {
      memcpy(__dst, __src, v11 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v11] = 0;
    }
  }
  return __dst;
}

uint64_t RawRepresentable<>.toData()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v11 - v8;
  sub_1A2CA7B38();
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(AssociatedTypeWitness, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, AssociatedTypeWitness);
}

uint64_t String.toData()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  a3[3] = MEMORY[0x1E4FBB1A0];
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2C92250@<X0>(void *a1@<X8>)
{
  return String.toData()(*v1, v1[1], a1);
}

uint64_t Int.toData()@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  return OUTLINED_FUNCTION_5(result, a2);
}

uint64_t sub_1A2C92264@<X0>(void *a1@<X8>)
{
  return Int.toData()(*v1, a1);
}

uint64_t sub_1A2C9226C(uint64_t a1)
{
  return sub_1A2C92290(a1);
}

uint64_t sub_1A2C92290(uint64_t a1)
{
  OUTLINED_FUNCTION_2();
  uint64_t v4 = (uint64_t *)(v1 + *(void *)(v3 + 144));
  sub_1A2C924A8();
  uint64_t v5 = *(void **)(*v4 + 16);
  sub_1A2C9230C(v5);
  uint64_t v6 = *v4;
  *(void *)(*v4 + 16) = (char *)v5 + 1;

  return sub_1A2C945B0(a1, v6 + 40 * (void)v5 + 32);
}

void *sub_1A2C9230C(void *result)
{
  unint64_t v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_1A2C92364((void *)(v2 > 1), (int64_t)result + 1, 1, *v1, (unint64_t *)&qword_1EB5A4EC8, qword_1EB5A4DC0);
    *uint64_t v1 = result;
  }
  return result;
}

void *sub_1A2C92364(void *result, int64_t a2, char a3, void *a4, unint64_t *a5, unint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v12)
  {
    sub_1A2C9136C(0, a5, a6);
    char v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    char v13 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v8)
  {
    if (v13 != a4 || &a4[5 * v11 + 4] <= v13 + 4) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    sub_1A2C92524(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

void *sub_1A2C924A8()
{
  uint64_t v1 = *v0;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_1A2C92364(result, v1[2] + 1, 1, v1, (unint64_t *)&qword_1EB5A4EC8, qword_1EB5A4DC0);
    *unint64_t v0 = result;
  }
  return result;
}

uint64_t sub_1A2C9250C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1A2C92524(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1A2C925B0()
{
  uint64_t v1 = sub_1A2CA79D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A2CA79F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(self, sel_isMainThread))
  {
    sub_1A2C929F8();
    size_t v14 = (void *)sub_1A2CA7C78();
    aBlock[4] = sub_1A2C8F990;
    aBlock[5] = v0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A2C8F94C;
    aBlock[3] = &block_descriptor;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1A2CA79E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1A2C92968(&qword_1EB5A4DA0, MEMORY[0x1E4FBCB00]);
    sub_1A2C92A38();
    sub_1A2C92968(&qword_1EB5A4DB0, (void (*)(uint64_t))sub_1A2C92A38);
    sub_1A2CA7CB8();
    MEMORY[0x1A623E0A0](0, v8, v4, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1A2C92BAC();
  swift_beginAccess();
  unint64_t v9 = *(void *)(v0 + 24);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_1A2CA7DA8();
    uint64_t v10 = result;
    if (result) {
      goto LABEL_4;
    }
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v10) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_4:
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = MEMORY[0x1A623E110](i, v9);
      }
      else
      {
        uint64_t v13 = *(void *)(v9 + 8 * i + 32);
        swift_retain();
      }
      (*(void (**)(void))(v13 + 24))();
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2C92968(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A2C929B0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A2C929F8()
{
  unint64_t result = qword_1EB5A4DB8;
  if (!qword_1EB5A4DB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5A4DB8);
  }
  return result;
}

void sub_1A2C92A38()
{
  if (!qword_1EB5A4DA8)
  {
    sub_1A2CA79D8();
    unint64_t v0 = sub_1A2CA7C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4DA8);
    }
  }
}

uint64_t sub_1A2C92A90(uint64_t a1)
{
  sub_1A2C92BAC();
  swift_beginAccess();
  unint64_t v2 = *(void *)(a1 + 24);
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1A2CA7DA8();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x1A623E110](i, v2);
      }
      else
      {
        uint64_t v6 = *(void *)(v2 + 8 * i + 32);
        swift_retain();
      }
      (*(void (**)(void))(v6 + 24))();
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2C92B98()
{
  return sub_1A2C933C4(*(void *)(v0 + 32), *(uint64_t **)(v0 + 40), *(void *)(v0 + 48), *(void (**)(char *))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2C92BAC()
{
  uint64_t v1 = (void *)(v0 + 24);
  swift_beginAccess();
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v3) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x1E4FBC860];
LABEL_17:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1A2CA7DA8();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x1A623E110](i, v2);
      }
      else
      {
        uint64_t v6 = *(void *)(v2 + 8 * i + 32);
        swift_retain();
      }
      uint64_t v7 = MEMORY[0x1A623E700](v6 + 16);
      uint64_t v8 = swift_unknownObjectRelease();
      if (v7)
      {
        MEMORY[0x1A623DF70](v8);
        if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1A2CA7BA8();
        }
        sub_1A2CA7BD8();
        sub_1A2CA7B88();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v10;
    goto LABEL_17;
  }
  __break(1u);
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

uint64_t OUTLINED_FUNCTION_0@<X0>(__n128 *a1@<X0>, unint64_t a2@<X8>, __n128 a3@<Q0>)
{
  a1[1] = a3;
  a1[3].n128_u64[1] = a2;
  a1[4].n128_u64[0] = v3;
  a1[2].n128_u8[0] = v4;
  *(void *)(v5 + 96) = a1;
  return v5;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  uint64_t v1 = v0[3];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return 0x746C7561666564;
}

void *OUTLINED_FUNCTION_0_7@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_allocObject();
}

void *OUTLINED_FUNCTION_9()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 104) = 0;
  *(unsigned char *)(v2 + 112) = 2;
  *(void *)(v2 + 16) = result;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a1) {
    return 0;
  }
  return a10;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  a2[3] = v2;
  *a2 = result;
  return result;
}

char *OUTLINED_FUNCTION_5_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

double OUTLINED_FUNCTION_5_4()
{
  double result = 0.0;
  uint64_t v2 = *(void *)(v0 - 152);
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *(unsigned char *)(v2 + 80) = 12;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

BOOL OUTLINED_FUNCTION_7_1@<W0>(char a1@<W8>)
{
  return (a1 & 1) == 0;
}

void OUTLINED_FUNCTION_1_1(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v1 = v0[3];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return v1;
}

void OUTLINED_FUNCTION_1_3()
{
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_allocObject();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

void OUTLINED_FUNCTION_3_2()
{
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return type metadata accessor for Item();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0;
}

uint64_t *OUTLINED_FUNCTION_17(uint64_t a1)
{
  v1[3] = a1;
  return __swift_allocate_boxed_opaque_existential_0(v1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return *(void *)(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_getFunctionTypeMetadata1();
}

void OUTLINED_FUNCTION_6_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  Configurable.setting<A>(_:)(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_1A2C933C4(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(char *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v26 = a5;
  long long v27 = a4;
  uint64_t v10 = *a2;
  uint64_t v11 = *(void *)(*a2 + 88);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](a1);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v24 - v17;
  uint64_t v19 = v16 + 16;
  uint64_t v20 = swift_projectBox();
  swift_beginAccess();
  uint64_t result = MEMORY[0x1A623E700](v19);
  if (result)
  {
    (*(void (**)(uint64_t *, uint64_t, void, uint64_t, uint64_t))(a7 + 8))(a2, v11, *(void *)(v10 + 96), a6, a7);
    swift_beginAccess();
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v25(v15, v20, v11);
    char v22 = sub_1A2CA7A48();
    int v23 = *(void (**)(char *, uint64_t))(v12 + 8);
    v23(v15, v11);
    if (v22)
    {
      v23(v18, v11);
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 24))(v20, v18, v11);
      swift_beginAccess();
      v25(v15, v20, v11);
      v27(v15);
      swift_unknownObjectRelease();
      v23(v15, v11);
      return ((uint64_t (*)(char *, uint64_t))v23)(v18, v11);
    }
  }
  return result;
}

#error "1A2C936BC: call analysis failed (funcsize=19)"

void Configurable.setting<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_7();
  a19 = v20;
  a20 = v21;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  long long v27 = v26;
  uint64_t v28 = *v26;
  uint64_t v29 = *(void *)(*v26 + 88);
  uint64_t v30 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v32 = v31;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v33);
  v35 = (char *)&a9 - v34;
  __swift_storeEnumTagSinglePayload((uint64_t)&a9 - v34, 1, 1, v29);
  (*(void (**)(uint64_t *, char *, uint64_t, void, uint64_t, uint64_t))(v23 + 16))(v27, v35, v29, *(void *)(v28 + 96), v25, v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v30);
  OUTLINED_FUNCTION_5_2();
}

void sub_1A2C937E4()
{
}

uint64_t type metadata accessor for SettingReader.Reader()
{
  return self;
}

id sub_1A2C93820(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = (void *)sub_1A2CA7A58();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

void Configurable.setting<A>(_:defaultValue:)()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v27 = *v0;
  uint64_t v4 = *(void *)(v27 + 88);
  uint64_t v5 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v28[-1] - v12;
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v28[-1] - v17;
  OUTLINED_FUNCTION_9_0();
  v20(v19);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v4) == 1)
  {
    OUTLINED_FUNCTION_9_0();
    v22(v21);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v4);
  }
  uint64_t v23 = swift_bridgeObjectRetain();
  BOOL v24 = sub_1A2C94454(v23);
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_11;
  }
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  v29[3] = type metadata accessor for Setting();
  v29[4] = swift_getWitnessTable();
  void v28[3] = v4;
  v29[0] = v1;
  __swift_allocate_boxed_opaque_existential_0(v28);
  OUTLINED_FUNCTION_9_0();
  v26(v25);
  swift_retain();
  sub_1A2C93C0C(v29, (uint64_t)v28, (uint64_t)&v30);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v5);
LABEL_11:
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v3, v18, v4);
    goto LABEL_12;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v4);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v3, v11, v4);
LABEL_12:
  OUTLINED_FUNCTION_5_2();
}

void sub_1A2C93C0C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 56))(v6, v7);
  LOBYTE(v6) = sub_1A2C94454(v8);
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v10 + 40))(&v134, v9, v10);
  v137[0] = v134;
  v137[1] = v135;
  id v133 = sub_1A2C9474C(v137);
  swift_bridgeObjectRelease();
  if (v133)
  {
    uint64_t v11 = OUTLINED_FUNCTION_1_2();
    v12(v11);
    BOOL v13 = sub_1A2C947B4();
    swift_bridgeObjectRelease();
    if (v13)
    {
      uint64_t v14 = a1[3];
      uint64_t v15 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v14);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 64))(v137, v14, v15);
      switch(LOBYTE(v137[0]))
      {
        case 1:
          uint64_t v28 = OUTLINED_FUNCTION_1_2();
          v29(v28);
          uint64_t v30 = (void *)sub_1A2CA7A58();
          swift_bridgeObjectRelease();
          id v31 = objc_msgSend(v133, sel_stringArrayForKey_, v30);

          if (!v31) {
            goto LABEL_74;
          }
          uint64_t v32 = MEMORY[0x1E4FBB1A0];
          uint64_t v33 = sub_1A2CA7B68();

          OUTLINED_FUNCTION_9();
          sub_1A2C97DCC(0, (unint64_t *)&qword_1EB5A49B0, v32, MEMORY[0x1E4FBB320]);
          uint64_t v136 = v34;
          uint64_t v134 = v33;
          goto LABEL_15;
        case 2:
          uint64_t v39 = OUTLINED_FUNCTION_0_2();
          v40(v39);
          sub_1A2CA7A58();
          uint64_t v41 = OUTLINED_FUNCTION_10();
          v48 = (void *)OUTLINED_FUNCTION_15(v41, (uint64_t)sel_BOOLForKey_, v42, v43, v44, v45, v46, v47, v132, (uint64_t)v133);
          unsigned __int8 v50 = [v48 v49];

          uint64_t v136 = MEMORY[0x1E4FBB390];
          LOBYTE(v134) = v50;
          goto LABEL_31;
        case 3:
          uint64_t v51 = OUTLINED_FUNCTION_0_2();
          v52(v51);
          sub_1A2CA7A58();
          uint64_t v53 = OUTLINED_FUNCTION_10();
          v60 = (void *)OUTLINED_FUNCTION_15(v53, (uint64_t)sel_integerForKey_, v54, v55, v56, v57, v58, v59, v132, (uint64_t)v133);
          id v62 = [v60 v61];

          uint64_t v136 = MEMORY[0x1E4FBB550];
          uint64_t v134 = (uint64_t)v62;
          goto LABEL_31;
        case 4:
          uint64_t v63 = OUTLINED_FUNCTION_1_2();
          v64(v63);
          v65 = (void *)sub_1A2CA7A58();
          swift_bridgeObjectRelease();
          id v66 = objc_msgSend(v133, (SEL)0x1E5AC5398, v65);

          if (!v66) {
            goto LABEL_74;
          }
          uint64_t v67 = sub_1A2CA7A68();
          unint64_t v69 = v68;

          uint64_t v70 = HIBYTE(v69) & 0xF;
          uint64_t v71 = v67 & 0xFFFFFFFFFFFFLL;
          if ((v69 & 0x2000000000000000) != 0) {
            uint64_t v72 = HIBYTE(v69) & 0xF;
          }
          else {
            uint64_t v72 = v67 & 0xFFFFFFFFFFFFLL;
          }
          if (!v72)
          {

            swift_bridgeObjectRelease();
            goto LABEL_75;
          }
          if ((v69 & 0x1000000000000000) != 0)
          {
            uint64_t v74 = (uint64_t)sub_1A2C971C8(v67, v69, 10);
            LOBYTE(v67) = v131;
            goto LABEL_72;
          }
          if ((v69 & 0x2000000000000000) == 0)
          {
            if ((v67 & 0x1000000000000000) != 0) {
              v73 = (unsigned __int8 *)((v69 & 0xFFFFFFFFFFFFFFFLL) + 32);
            }
            else {
              v73 = (unsigned __int8 *)sub_1A2CA7D18();
            }
            uint64_t v74 = (uint64_t)sub_1A2C972B0(v73, v71, 10);
            LOBYTE(v67) = v75 & 1;
            goto LABEL_72;
          }
          uint64_t v134 = v67;
          uint64_t v135 = v69 & 0xFFFFFFFFFFFFFFLL;
          if (v67 == 43)
          {
            if (!v70)
            {
LABEL_88:
              __break(1u);
              return;
            }
            if (v70 == 1) {
              goto LABEL_58;
            }
            OUTLINED_FUNCTION_8();
            if (!v115 & v114) {
              goto LABEL_58;
            }
            uint64_t v74 = v117;
            if (v116 != 2)
            {
              OUTLINED_FUNCTION_8();
              if (!v115 & v114) {
                goto LABEL_58;
              }
              uint64_t v74 = 10 * v74 + v119;
              if (v118 != 3)
              {
                while (1)
                {
                  OUTLINED_FUNCTION_11();
                  if (!v115 & v114) {
                    goto LABEL_58;
                  }
                  OUTLINED_FUNCTION_7_0();
                  if (!v115) {
                    goto LABEL_58;
                  }
                  uint64_t v74 = v121 + v120;
                  if (__OFADD__(v121, v120)) {
                    goto LABEL_58;
                  }
                  OUTLINED_FUNCTION_13();
                  if (v115) {
                    goto LABEL_72;
                  }
                }
              }
            }
          }
          else
          {
            if (v67 == 45)
            {
              if (v70)
              {
                if (v70 != 1)
                {
                  OUTLINED_FUNCTION_8();
                  if (!(!v115 & v114))
                  {
                    if (v112 == 2)
                    {
                      LOBYTE(v67) = 0;
                      uint64_t v74 = -(uint64_t)v113;
LABEL_72:
                      swift_bridgeObjectRelease();
                      if ((v67 & 1) == 0)
                      {
                        uint64_t v126 = a1[3];
                        v127 = (uint64_t *)a1[4];
                        __swift_project_boxed_opaque_existential_1(a1, v126);
                        uint64_t v136 = MEMORY[0x1E4FBC1C8];
                        uint64_t v134 = v74;
                        uint64_t v35 = v127[9];
                        uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
                        OUTLINED_FUNCTION_17(AssociatedTypeWitness);
                        uint64_t v37 = v126;
                        v38 = v127;
LABEL_16:
                        ((void (*)(uint64_t *, uint64_t, uint64_t *))v35)(&v134, v37, v38);
LABEL_32:

LABEL_33:
                        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v134);
                        goto LABEL_76;
                      }
LABEL_74:

LABEL_75:
                      sub_1A2C948F0(a2, a3);
LABEL_76:
                      OUTLINED_FUNCTION_14();
                      return;
                    }
                    if ((BYTE2(v67) - 48) <= 9u)
                    {
                      uint64_t v74 = -10 * v113 - (BYTE2(v67) - 48);
                      if (v112 == 3) {
                        goto LABEL_71;
                      }
                      while (1)
                      {
                        OUTLINED_FUNCTION_11();
                        if (!v115 & v114) {
                          break;
                        }
                        OUTLINED_FUNCTION_7_0();
                        if (!v115) {
                          break;
                        }
                        uint64_t v74 = v130 - v129;
                        if (__OFSUB__(v130, v129)) {
                          break;
                        }
                        OUTLINED_FUNCTION_13();
                        if (v115) {
                          goto LABEL_72;
                        }
                      }
                    }
                  }
                }
LABEL_58:
                uint64_t v74 = 0;
                LOBYTE(v67) = 1;
                goto LABEL_72;
              }
              __break(1u);
              goto LABEL_88;
            }
            if (!v70 || (v67 - 48) > 9u) {
              goto LABEL_58;
            }
            uint64_t v74 = (v67 - 48);
            if (v70 != 1)
            {
              OUTLINED_FUNCTION_8();
              if (!v115 & v114) {
                goto LABEL_58;
              }
              uint64_t v74 = 10 * (v67 - 48) + v123;
              if (v122 != 2)
              {
                while (1)
                {
                  OUTLINED_FUNCTION_11();
                  if (!v115 & v114) {
                    goto LABEL_58;
                  }
                  OUTLINED_FUNCTION_7_0();
                  if (!v115) {
                    goto LABEL_58;
                  }
                  uint64_t v74 = v125 + v124;
                  if (__OFADD__(v125, v124)) {
                    goto LABEL_58;
                  }
                  OUTLINED_FUNCTION_13();
                  if (v115) {
                    goto LABEL_72;
                  }
                }
              }
            }
          }
LABEL_71:
          LOBYTE(v67) = 0;
          goto LABEL_72;
        case 5:
          uint64_t v76 = OUTLINED_FUNCTION_0_2();
          v77(v76);
          sub_1A2CA7A58();
          uint64_t v78 = OUTLINED_FUNCTION_10();
          v85 = (void *)OUTLINED_FUNCTION_15(v78, (uint64_t)sel_floatForKey_, v79, v80, v81, v82, v83, v84, v132, (uint64_t)v133);
          [v85 v86];
          int v88 = v87;

          uint64_t v136 = MEMORY[0x1E4FBB470];
          LODWORD(v134) = v88;
          goto LABEL_31;
        case 6:
          uint64_t v89 = OUTLINED_FUNCTION_0_2();
          v90(v89);
          sub_1A2CA7A58();
          uint64_t v91 = OUTLINED_FUNCTION_10();
          v98 = (void *)OUTLINED_FUNCTION_15(v91, (uint64_t)sel_doubleForKey_, v92, v93, v94, v95, v96, v97, v132, (uint64_t)v133);
          [v98 v99];
          uint64_t v101 = v100;

          uint64_t v136 = MEMORY[0x1E4FBB3D0];
          uint64_t v134 = v101;
LABEL_31:
          v102 = *(void (**)(uint64_t *, uint64_t, uint64_t))(a2 + 72);
          uint64_t v103 = swift_getAssociatedTypeWitness();
          OUTLINED_FUNCTION_17(v103);
          v102(&v134, v14, a2);
          goto LABEL_32;
        case 7:
          uint64_t v104 = OUTLINED_FUNCTION_1_2();
          v105(v104);
          v106 = (void *)sub_1A2CA7A58();
          swift_bridgeObjectRelease();
          id v107 = objc_msgSend(v133, sel_dataForKey_, v106);

          if (!v107) {
            goto LABEL_74;
          }
          uint64_t v108 = sub_1A2CA7908();
          unint64_t v110 = v109;

          OUTLINED_FUNCTION_9();
          uint64_t v136 = MEMORY[0x1E4F277C0];
          uint64_t v134 = v108;
          uint64_t v135 = v110;
          uint64_t v111 = swift_getAssociatedTypeWitness();
          OUTLINED_FUNCTION_17(v111);
          sub_1A2C969F4(v108, v110);
          MEMORY[0x17000009B182C0](&v134, v15, &unk_1E5AC5000);

          sub_1A2C97D74(v108, v110);
          goto LABEL_33;
        default:
          uint64_t v16 = OUTLINED_FUNCTION_1_2();
          v17(v16);
          uint64_t v18 = (void *)sub_1A2CA7A58();
          swift_bridgeObjectRelease();
          id v19 = objc_msgSend(v133, sel_stringForKey_, v18);

          if (!v19) {
            goto LABEL_74;
          }
          uint64_t v20 = sub_1A2CA7A68();
          uint64_t v22 = v21;

          OUTLINED_FUNCTION_9();
          uint64_t v136 = MEMORY[0x1E4FBB1A0];
          uint64_t v134 = v20;
          uint64_t v135 = v22;
LABEL_15:
          uint64_t v35 = 0x17000009B182C0;
          uint64_t v36 = swift_getAssociatedTypeWitness();
          OUTLINED_FUNCTION_17(v36);
          uint64_t v37 = v15;
          v38 = (uint64_t *)&unk_1E5AC5000;
          goto LABEL_16;
      }
    }
    sub_1A2C948F0(a2, a3);
    OUTLINED_FUNCTION_14();
  }
  else
  {
LABEL_7:
    OUTLINED_FUNCTION_14();
    sub_1A2C948F0(v23, v24);
  }
}

BOOL sub_1A2C94454(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v16 = MEMORY[0x1E4FBC860];
  uint64_t v3 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    uint64_t v5 = MEMORY[0x1E4FBC860];
    do
    {
      sub_1A2C945B0(v4, (uint64_t)&v13);
      uint64_t v6 = v14;
      uint64_t v7 = v15;
      __swift_project_boxed_opaque_existential_1(&v13, v14);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7))
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v13);
      }
      else
      {
        sub_1A2C9250C(&v13, (uint64_t)v12);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1A2C9987C(0, *(void *)(v5 + 16) + 1, 1);
        }
        uint64_t v5 = v16;
        unint64_t v9 = *(void *)(v16 + 16);
        unint64_t v8 = *(void *)(v16 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1A2C9987C((void *)(v8 > 1), v9 + 1, 1);
          uint64_t v5 = v16;
        }
        *(void *)(v5 + 16) = v9 + 1;
        sub_1A2C9250C(v12, v5 + 40 * v9 + 32);
      }
      v4 += 40;
      --v3;
    }
    while (v3);
    uint64_t v2 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v2 + 16);
  swift_release();
  return v10 == 0;
}

uint64_t sub_1A2C945B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A2C94618()
{
  if (!*v0) {
    return 1;
  }
  if (*v0 != 1) {
    return 0;
  }
  sub_1A2CA7978();
  return sub_1A2CA7968() & 1;
}

uint64_t sub_1A2C94668()
{
  return sub_1A2C9468C();
}

uint64_t sub_1A2C9468C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2C946BC()
{
  return sub_1A2C946E0();
}

uint64_t sub_1A2C946E0()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = (void *)(v0 + *(void *)(v1 + 128));
  uint64_t v3 = v2[1];
  *uint64_t v4 = *v2;
  v4[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2C94708()
{
  return sub_1A2C9472C();
}

uint64_t sub_1A2C9472C()
{
  return swift_bridgeObjectRetain();
}

id sub_1A2C9474C(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  if (v2)
  {
    uint64_t v3 = *a1;
    objc_allocWithZone(MEMORY[0x1E4F1CB18]);
    swift_bridgeObjectRetain();
    return sub_1A2C93820(v3, v2);
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 16);
    id v6 = v5;
    return v5;
  }
}

BOOL sub_1A2C947B4()
{
  uint64_t v1 = (void *)sub_1A2CA7A58();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1A2CA7CA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1A2C94844((uint64_t)v4);
  return v2 != 0;
}

uint64_t sub_1A2C94844(uint64_t a1)
{
  sub_1A2C948A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A2C948A0()
{
  if (!qword_1EB5A4ED0)
  {
    unint64_t v0 = sub_1A2CA7C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4ED0);
    }
  }
}

uint64_t sub_1A2C948F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for Setting()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1A2C94968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_1_0();
  Configurable.setting<A>(_:)(v20, v27, v21, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_1A2C94980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A2C94A28(a1, a2);
}

uint64_t sub_1A2C949A4()
{
  return sub_1A2C949C8();
}

uint64_t sub_1A2C949C8()
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 96) + 16))();
}

uint64_t sub_1A2C94A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 88);
  uint64_t v7 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v16 - v11;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 + 96) + 24))(a1, v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) == 1)
  {
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t))(v13 + 16))(a2);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  }
  else
  {
    OUTLINED_FUNCTION_3_1();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a2, v12, v6);
  }
}

void static String.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1A2C94BBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static String.convert(from:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t static String.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v3);
  if (OUTLINED_FUNCTION_3()) {
    return v2;
  }
  else {
    return 0;
  }
}

id OUTLINED_FUNCTION_16()
{
  uint64_t v2 = *(void *)(v0 - 72);
  *(void *)(v0 - 96) = *(void *)(v0 - 80);
  *(void *)(v0 - 88) = v2;
  return sub_1A2C9474C((uint64_t *)(v0 - 96));
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

void static Bool.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2C94C78@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = static Bool.convert(from:)(a1);
  *a2 = result;
  return result;
}

uint64_t static Bool.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v3);
  if (OUTLINED_FUNCTION_3()) {
    return v2;
  }
  else {
    return 2;
  }
}

uint64_t static RawRepresentable<>.dataType.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t static RawRepresentable<>.convert(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v21 - v10;
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  id v19 = (char *)&v21 - v18;
  sub_1A2C948F0(a1, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v19, v11, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v19, AssociatedTypeWitness);
    sub_1A2CA7B48();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v19, AssociatedTypeWitness);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    return __swift_storeEnumTagSinglePayload(v22, 1, 1, a2);
  }
}

void *sub_1A2C94F78(void *result, int a2)
{
  if (a2 < 0)
  {
    *uint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t dispatch thunk of SettingGroup.isEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t sub_1A2C94FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1A2C94FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

ValueMetadata *type metadata accessor for FeatureState()
{
  return &type metadata for FeatureState;
}

uint64_t type metadata accessor for AppGroup()
{
  uint64_t result = qword_1EB5A4C58;
  if (!qword_1EB5A4C58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for SettingProperty()
{
  return __swift_instantiateGenericMetadata();
}

void static Int.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2C95090(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v12);
  int v1 = swift_dynamicCast();
  return OUTLINED_FUNCTION_4(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
}

uint64_t static Int.convert(from:)(uint64_t a1)
{
  return sub_1A2C95090(a1);
}

uint64_t sub_1A2C950F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Int.convert(from:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void Double.toData()(uint64_t a1@<X8>, double a2@<D0>)
{
  *(void *)(a1 + 24) = MEMORY[0x1E4FBB3D0];
  *(double *)a1 = a2;
}

void sub_1A2C95138(uint64_t a1@<X8>)
{
  Double.toData()(a1, *v1);
}

void sub_1A2C95140()
{
  if (!qword_1EB5A49D0)
  {
    type metadata accessor for Preset();
    unint64_t v0 = sub_1A2CA7C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A49D0);
    }
  }
}

void sub_1A2C95198()
{
  if (!qword_1EB5A4C10)
  {
    unint64_t v0 = sub_1A2CA7C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C10);
    }
  }
}

void sub_1A2C951E4()
{
  if (!qword_1EB5A4C00)
  {
    sub_1A2C95198();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A4C00);
    }
  }
}

void sub_1A2C95254()
{
  if (!qword_1EB5A49C0)
  {
    unint64_t v0 = sub_1A2CA79C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A49C0);
    }
  }
}

void sub_1A2C952A4()
{
  sub_1A2C8F7FC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

id AppGroup.userDefaults.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC11TeaSettings8AppGroup_userDefaults);
}

uint64_t type metadata accessor for Updater()
{
  return self;
}

uint64_t Setting.__deallocating_deinit()
{
  Setting.deinit();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t type metadata accessor for Preset()
{
  return self;
}

void sub_1A2C953E8()
{
  if (!qword_1EB5A4C48)
  {
    unint64_t v0 = type metadata accessor for Option();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4C48);
    }
  }
}

uint64_t sub_1A2C95434(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(result + 64);
  uint64_t v6 = *(unsigned __int8 *)(result + 80);
  uint64_t v7 = v5 + v6;
  unint64_t v8 = ((v5 + v6) & ~v6) + v5;
  if (v8 <= 8) {
    unint64_t v8 = 8;
  }
  unsigned int v9 = a1[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a1;
        goto LABEL_12;
      case 2:
        int v12 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v12 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v12 = *(_DWORD *)a1;
LABEL_12:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 == 1)
  {
    uint64_t v14 = ~v6;
    uint64_t v15 = *(void (**)(unsigned __int8 *, uint64_t))(result + 8);
    v15(a1, v3);
    return ((uint64_t (*)(unint64_t, uint64_t))v15)((unint64_t)&a1[v7] & v14, v3);
  }
  else if (!v9)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for Group()
{
  return &type metadata for Group;
}

uint64_t PresetStartupTask.init(presetManager:)(long long *a1)
{
  sub_1A2C9250C(a1, v1 + 16);
  return v1;
}

uint64_t sub_1A2C95604()
{
  return sub_1A2C8F0A4();
}

uint64_t type metadata accessor for PresetManager()
{
  return self;
}

void sub_1A2C9564C(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall PresetManager.apply(_:)(Swift::OpaquePointer a1)
{
  uint64_t v19 = *((void *)a1._rawValue + 2);
  if (v19)
  {
    uint64_t v20 = (char *)a1._rawValue + 32;
    uint64_t v21 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = (uint64_t *)&v20[16 * v2];
      uint64_t v4 = *v3;
      uint64_t v5 = v3[1];
      swift_beginAccess();
      uint64_t v6 = *v21;
      uint64_t v7 = *(void *)(*v21 + 16);
      swift_bridgeObjectRetain();
      if (!v7) {
        goto LABEL_18;
      }
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_1A2CA38A0(v4, v5);
      if ((v9 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        swift_endAccess();
        swift_bridgeObjectRelease();
LABEL_19:
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v22 = v2;
      unint64_t v10 = *(void *)(*(void *)(v6 + 56) + 8 * v8);
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_1A2CA7DA8();
        if (!v11) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v11) {
          goto LABEL_13;
        }
      }
      if (v11 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v12 = 0;
      unint64_t v13 = v10 & 0xC000000000000001;
      unint64_t v14 = v10;
      do
      {
        if (v13)
        {
          uint64_t v15 = MEMORY[0x1A623E110](v12, v10);
        }
        else
        {
          uint64_t v15 = *(void *)(v10 + 8 * v12 + 32);
          swift_retain();
        }
        ++v12;
        uint64_t v16 = *(void *)(v23 + 24);
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
        swift_unknownObjectRetain();
        v18(v15, ObjectType, v16);
        swift_release();
        swift_unknownObjectRelease();
        unint64_t v10 = v14;
      }
      while (v11 != v12);
LABEL_13:
      uint64_t v2 = v22 + 1;
      swift_bridgeObjectRelease_n();
      if (v22 + 1 == v19) {
        goto LABEL_19;
      }
    }
  }
}

unint64_t sub_1A2C9587C()
{
  unint64_t result = qword_1EB5A4DC0[0];
  if (!qword_1EB5A4DC0[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EB5A4DC0);
  }
  return result;
}

unint64_t sub_1A2C958D4()
{
  unint64_t result = qword_1EB5A4C80;
  if (!qword_1EB5A4C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A4C80);
  }
  return result;
}

unint64_t sub_1A2C95920()
{
  unint64_t result = qword_1EB5A4C78;
  if (!qword_1EB5A4C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A4C78);
  }
  return result;
}

unint64_t sub_1A2C9596C(uint64_t a1)
{
  unint64_t result = sub_1A2C95920();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for SettingsStore()
{
  return self;
}

uint64_t Date.toData()@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1A2CA7928();
  a1[3] = MEMORY[0x1E4FBB3D0];
  *a1 = v3;
  return result;
}

unint64_t sub_1A2C959EC(uint64_t a1)
{
  unint64_t result = sub_1A2C8EDD8();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1A2C95A18(uint64_t a1)
{
  sub_1A2C8F7FC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2C95A74(uint64_t a1, uint64_t a2)
{
  sub_1A2C8F7FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of Resettable.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t Preset.extends.getter()
{
  return swift_bridgeObjectRetain();
}

void *Preset.__allocating_init(extends:apply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

void *Preset.init(extends:apply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t sub_1A2C95B4C()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t Preset.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t Preset.__deallocating_deinit()
{
  Preset.deinit();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t method lookup function for Preset(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Preset);
}

uint64_t dispatch thunk of Preset.__allocating_init(extends:apply:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A2C95C04(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v5 = result;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = a2;
    swift_retain();
    swift_retain();
    char v7 = sub_1A2C95F54(v3, 2, (uint64_t)sub_1A2C95F28, v6);
    swift_release();
    swift_release();
    return v7 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2C95CAC(uint64_t result)
{
  if (*(void *)(v1 + 16))
  {
    char v2 = result;
    uint64_t v3 = swift_retain();
    sub_1A2C95D04(v3, v2 & 1);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A2C95D04(uint64_t a1, char a2)
{
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  swift_retain_n();
  uint64_t v4 = swift_bridgeObjectRetain();
  BOOL v5 = sub_1A2C94454(v4);
  swift_bridgeObjectRelease();
  if (v5
    && (uint64_t v6 = *(void *)(a1 + 80),
        v10[0] = *(void *)(a1 + 72),
        v10[1] = v6,
        swift_bridgeObjectRetain(),
        id v7 = sub_1A2C9474C(v10),
        swift_bridgeObjectRelease(),
        v7))
  {
    LOBYTE(v10[0]) = a2 & 1;
    uint64_t v8 = sub_1A2CA7E08();
    swift_bridgeObjectRetain();
    char v9 = (void *)sub_1A2CA7A58();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setObject_forKey_, v8, v9);
    swift_release_n();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t SettingGroup.__allocating_init(key:defaultValue:access:)(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_1();
  uint64_t v6 = swift_allocObject();
  SettingGroup.init(key:defaultValue:access:)(a1, a2, a3);
  return v6;
}

uint64_t SettingGroup.deinit()
{
  swift_release();
  return v0;
}

uint64_t SettingGroup.__deallocating_deinit()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_1();

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A2C95EF0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2C95F28(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1A2C95F54(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_bridgeObjectRetain();
  BOOL v9 = sub_1A2C94454(v8);
  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(unsigned char *)(v10 + 16) = sub_1A2C9169C(a1, 2) & 1;
    if (qword_1EB5A4ED8 != -1) {
      swift_once();
    }
    uint64_t v11 = swift_allocObject();
    swift_weakInit();
    uint64_t v12 = (void *)swift_allocObject();
    long long v12[2] = v11;
    v12[3] = a1;
    v12[4] = v10;
    void v12[5] = a3;
    v12[6] = a4;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A2C903D4((uint64_t)sub_1A2C963A0, (uint64_t)v12, v15);
    swift_release();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    sub_1A2CA7958();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    swift_beginAccess();
    uint64_t v13 = *(unsigned __int8 *)(v10 + 16);
    swift_release();
  }
  else if (a2 == 2)
  {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else
  {
    return a2 & 1;
  }
  return v13;
}

uint64_t sub_1A2C9613C(uint64_t a1)
{
  sub_1A2C91304(0, &qword_1EB5A49C8, &qword_1EB5A4BC8, (uint64_t)&protocol descriptor for SettingType, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for SettingGroup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SettingGroup);
}

uint64_t dispatch thunk of SettingGroup.isEnabled(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SettingGroup.setEnabled(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SettingGroup.__allocating_init(key:defaultValue:access:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1A2C96238(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = (unsigned char *)(a3 + 16);
    int v9 = sub_1A2C9169C(a2, 2) & 1;
    swift_beginAccess();
    if (v9 != *v8)
    {
      swift_beginAccess();
      unsigned char *v8 = v9;
      char v10 = v9;
      a4(&v10);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2C96310()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A2C96320()
{
  swift_weakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_1();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1A2C96350()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A2C963A0()
{
  return sub_1A2C96238(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(char *))(v0 + 40));
}

BOOL static Access.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Access.hash(into:)()
{
  return sub_1A2CA7E38();
}

uint64_t Access.hashValue.getter()
{
  return sub_1A2CA7E48();
}

uint64_t sub_1A2C96444()
{
  return sub_1A2CA7E48();
}

unint64_t sub_1A2C9648C()
{
  unint64_t result = qword_1E959DE88;
  if (!qword_1E959DE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DE88);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Access(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Access(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2C9662CLL);
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

uint64_t sub_1A2C96654(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of Groupable.label.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Groupable.cellStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Groupable.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Groupable.isVisible.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A2C966B4()
{
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1A2C966C4()
{
  return OUTLINED_FUNCTION_0_0() & 1;
}

void static Int64.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t static Int64.convert(from:)(uint64_t a1)
{
  return sub_1A2C95090(a1);
}

uint64_t Int64.toData()@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  return OUTLINED_FUNCTION_5(result, a2);
}

uint64_t sub_1A2C96710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Int64.convert(from:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1A2C96740@<X0>(void *a1@<X8>)
{
  return Int64.toData()(*v1, a1);
}

uint64_t static Double.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v12);
  int v1 = OUTLINED_FUNCTION_2_1();
  return OUTLINED_FUNCTION_4(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11);
}

uint64_t sub_1A2C96788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Double.convert(from:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void static Float.dataType.getter(unsigned char *a1@<X8>)
{
}

unint64_t static Float.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v5);
  int v1 = OUTLINED_FUNCTION_3();
  uint64_t v2 = v4;
  v5[0] = v1 ^ 1;
  if (!v1) {
    uint64_t v2 = 0;
  }
  return v2 | ((unint64_t)(v1 ^ 1u) << 32);
}

void Float.toData()(uint64_t a1@<X8>, float a2@<S0>)
{
  *(void *)(a1 + 24) = MEMORY[0x1E4FBB470];
  *(float *)a1 = a2;
}

unint64_t sub_1A2C96834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = static Float.convert(from:)(a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_1A2C96864(uint64_t a1@<X8>)
{
  Float.toData()(a1, *v1);
}

void static Array<A>.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t static Array<A>.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v3);
  sub_1A2C968BC();
  if (OUTLINED_FUNCTION_2_1()) {
    return v2;
  }
  else {
    return 0;
  }
}

void sub_1A2C968BC()
{
  if (!qword_1EB5A49B0)
  {
    unint64_t v0 = sub_1A2CA7C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A49B0);
    }
  }
}

uint64_t Array<A>.toData()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_1A2C968BC();
  a2[3] = v4;
  *a2 = a1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2C96954@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Array<A>.convert(from:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1A2C9697C@<X0>(void *a1@<X8>)
{
  return Array<A>.toData()(*v1, a1);
}

void static Data.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t static Data.convert(from:)(uint64_t a1)
{
  sub_1A2C948F0(a1, (uint64_t)v3);
  if (OUTLINED_FUNCTION_3()) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t Data.toData()@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  a3[3] = MEMORY[0x1E4F277C0];
  *a3 = a1;
  a3[1] = a2;
  return sub_1A2C969F4(a1, a2);
}

uint64_t sub_1A2C969F4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1A2C96A50@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Data.convert(from:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1A2C96A78@<X0>(uint64_t *a1@<X8>)
{
  return Data.toData()(*(void *)v1, *(void *)(v1 + 8), a1);
}

void sub_1A2C96A80(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

char sub_1A2C96A88@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  sub_1A2C948F0(a1, (uint64_t)v6);
  int v3 = swift_dynamicCast();
  if (v3) {
    LOBYTE(v3) = FeatureState.init(rawValue:)(v5);
  }
  else {
    *a2 = 3;
  }
  return v3;
}

uint64_t sub_1A2C96AF8@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if ((_BYTE)result)
  {
    unint64_t v2 = 0xE700000000000000;
    uint64_t v3 = 0x64656C62616E65;
    if (result != 1)
    {
      uint64_t v3 = 0x64656C6261736964;
      unint64_t v2 = 0xE800000000000000;
    }
  }
  else
  {
    unint64_t v2 = 0xE700000000000000;
    uint64_t v3 = 0x746C7561666564;
  }
  a2[3] = MEMORY[0x1E4FBB1A0];
  *a2 = v3;
  a2[1] = v2;
  return result;
}

void static Date.dataType.getter(unsigned char *a1@<X8>)
{
}

uint64_t static Date.convert(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A2C948F0(a1, (uint64_t)v6);
  if (OUTLINED_FUNCTION_2_1())
  {
    sub_1A2CA7918();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = sub_1A2CA7938();
  return __swift_storeEnumTagSinglePayload(a2, v3, 1, v4);
}

unint64_t sub_1A2C96BE4(uint64_t a1)
{
  unint64_t result = sub_1A2C96C0C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A2C96C0C()
{
  unint64_t result = qword_1EB5A49B8;
  if (!qword_1EB5A49B8)
  {
    sub_1A2C968BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A49B8);
  }
  return result;
}

unint64_t sub_1A2C96C74(uint64_t a1)
{
  unint64_t result = sub_1A2C96C9C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A2C96C9C()
{
  unint64_t result = qword_1E959DE90;
  if (!qword_1E959DE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DE90);
  }
  return result;
}

uint64_t dispatch thunk of static Settable.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Settable.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of Settable.toData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A2C96D30@<X0>(uint64_t *a1@<X8>)
{
  return sub_1A2C96AF8(*v1, a1);
}

uint64_t sub_1A2C96D3C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1A2C96D48()
{
  sub_1A2C97C28(v0 + 16);
  swift_release();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1A2C96D88()
{
  return sub_1A2C96D3C();
}

uint64_t sub_1A2C96DCC(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = *v1;
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 >> 62) {
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  swift_retain();
  for (; v5; uint64_t v5 = sub_1A2CA7DA8())
  {
    uint64_t v11 = v2;
    uint64_t v6 = 4;
    while (1)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        uint64_t v2 = MEMORY[0x1A623E110](v6 - 4, v4);
      }
      else
      {
        uint64_t v2 = *(void *)(v4 + 8 * v6);
        swift_retain();
      }
      uint64_t v7 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void (**)(void *))(v2 + 24);
      uint64_t v13 = v3;
      unint64_t v14 = &off_1EF5DC150;
      v12[0] = v1;
      swift_retain();
      swift_retain();
      v8(v12);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
      swift_release();
      ++v6;
      if (v7 == v5)
      {
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain_n();
    swift_retain();
  }
  swift_release();
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  int v9 = *(void (**)(void *))(v2 + 24);
  uint64_t v13 = v3;
  unint64_t v14 = &off_1EF5DC150;
  v12[0] = v1;
  swift_retain();
  swift_retain();
  v9(v12);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_1A2C96FA0()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2C96FC8()
{
  sub_1A2C96FA0();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1A2C96FFC(uint64_t a1)
{
  void (*v5)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *WitnessTable;
  void v11[4];
  uint64_t v12;

  uint64_t v2 = v1;
  uint64_t v12 = a1;
  OUTLINED_FUNCTION_18();
  uint64_t v4 = *(void *)(v3 + 96);
  uint64_t v5 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 32);
  OUTLINED_FUNCTION_18();
  uint64_t v7 = *(void *)(v6 + 88);
  swift_retain();
  v5(v11, v7, v4);
  uint64_t v8 = type metadata accessor for Setting();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C8FBFC((uint64_t)&v12, v11, v2, v8, WitnessTable);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return swift_release();
}

uint64_t sub_1A2C970DC(uint64_t a1)
{
  uint64_t v5 = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_18();
  uint64_t v2 = type metadata accessor for Setting();
  swift_retain();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C97B2C((uint64_t)&v5, v1, v2, WitnessTable);
  return swift_release();
}

uint64_t sub_1A2C97180(uint64_t a1)
{
  return sub_1A2C96FFC(a1);
}

uint64_t sub_1A2C971A4(uint64_t a1)
{
  return sub_1A2C970DC(a1);
}

unsigned __int8 *sub_1A2C971C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1A2CA7AF8();
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
    uint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  uint64_t v6 = sub_1A2C9752C(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = (unsigned __int8 *)sub_1A2CA7D18();
  }
LABEL_7:
  uint64_t v12 = sub_1A2C972B0(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12;
}

unsigned __int8 *sub_1A2C972B0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
          uint64_t v19 = result + 1;
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

uint64_t sub_1A2C9752C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_1A2C97598((uint64_t)sub_1A2C97594, 0, a1, a2);
  uint64_t v6 = sub_1A2C975CC(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1A2C97598(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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

uint64_t sub_1A2C975CC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1A2C97724(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1A2C97824(v9, 0);
      unint64_t v12 = sub_1A2C978AC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1A2CA7D18();
LABEL_4:
        JUMPOUT(0x1A623DE90);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1A623DE90](v11 + 4, v11[2]);
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
    return MEMORY[0x1A623DE90]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1A2C97724(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1A2C97AB0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1A2C97AB0(v6, v5, v4);
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

void *sub_1A2C97824(uint64_t a1, uint64_t a2)
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
  sub_1A2C97DCC(0, &qword_1E959DE98, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBBE00]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_1A2C978AC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_1A2C97AB0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_1A2CA7AD8();
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
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_1A2CA7D18();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_1A2C97AB0(v12, a6, a7);
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
    unint64_t v12 = sub_1A2CA7AA8();
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

uint64_t sub_1A2C97AB0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1A2CA7AE8();
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
    uint64_t v5 = MEMORY[0x1A623DED0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1A2C97B2C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  unint64_t v7 = OUTLINED_FUNCTION_5_0(v6, v21);
  v8(v7);
  uint64_t v9 = OUTLINED_FUNCTION_6();
  uint64_t v11 = v10(v9);
  BOOL v12 = sub_1A2C94454(v11);
  swift_bridgeObjectRelease();
  if (v12)
  {
    uint64_t v13 = OUTLINED_FUNCTION_3_0();
    v14(v13);
    id v15 = OUTLINED_FUNCTION_16();
    swift_bridgeObjectRelease();
    if (v15)
    {
      uint64_t v16 = OUTLINED_FUNCTION_4_0();
      v17(v16);
      sub_1A2CA7A58();
      OUTLINED_FUNCTION_10();
      objc_msgSend(v15, sel_removeObjectForKey_, a4);
    }
  }
  uint64_t v18 = OUTLINED_FUNCTION_12();
  return v19(v18);
}

uint64_t sub_1A2C97C28(uint64_t a1)
{
  return a1;
}

BOOL sub_1A2C97C50()
{
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = OUTLINED_FUNCTION_5_0(v1, v13);
  v3(v2);
  uint64_t v4 = OUTLINED_FUNCTION_3_0();
  v5(v4);
  id v6 = OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v7 = OUTLINED_FUNCTION_4_0();
    v8(v7);
    BOOL v9 = sub_1A2C947B4();

    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = OUTLINED_FUNCTION_12();
  v11(v10);
  return v9;
}

uint64_t sub_1A2C97D2C()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2C97D6C()
{
  return sub_1A2C90724(*(void *)(v0 + 16));
}

uint64_t sub_1A2C97D74(uint64_t a1, unint64_t a2)
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

void sub_1A2C97DCC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

BOOL static ChangeBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChangeBehavior.hash(into:)()
{
  return sub_1A2CA7E38();
}

uint64_t _s11TeaSettings14ChangeBehaviorO9hashValueSivg_0()
{
  return sub_1A2CA7E48();
}

unint64_t sub_1A2C97EFC()
{
  unint64_t result = qword_1E959DEA0;
  if (!qword_1E959DEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DEA0);
  }
  return result;
}

unint64_t sub_1A2C97F4C()
{
  unint64_t result = qword_1E959DEA8;
  if (!qword_1E959DEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DEA8);
  }
  return result;
}

unsigned char *sub_1A2C97FA0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for ChangeBehavior()
{
}

uint64_t initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SettingCellStyle(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 80);
  if (v1 >= 0xC) {
    unsigned int v1 = *(_DWORD *)result + 12;
  }
  switch(v1)
  {
    case 0u:
    case 4u:
    case 5u:
    case 7u:
    case 8u:
      goto LABEL_11;
    case 1u:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_12;
    case 2u:
    case 3u:
    case 0xAu:
      swift_bridgeObjectRelease();
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    case 6u:
      return swift_bridgeObjectRelease();
    case 9u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_12:
      unint64_t result = swift_release();
      break;
    case 0xBu:
      unint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(result);
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for SettingCellStyle(char *__dst, unsigned __int8 *a2)
{
  unsigned int v3 = a2[80];
  if (v3 >= 0xC) {
    unsigned int v3 = *(_DWORD *)a2 + 12;
  }
  switch(v3)
  {
    case 0u:
      *__dst = *a2;
      uint64_t v4 = *((void *)a2 + 3);
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *((void *)__dst + 3) = v4;
      __dst[80] = 0;
      goto LABEL_17;
    case 1u:
      uint64_t v5 = *((void *)a2 + 4);
      long long v6 = *((_OWORD *)a2 + 1);
      *(_OWORD *)__dst = *(_OWORD *)a2;
      *((_OWORD *)__dst + 1) = v6;
      *((void *)__dst + 4) = v5;
      __dst[80] = 1;
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_18;
    case 2u:
      uint64_t v7 = *((void *)a2 + 1);
      *(void *)__dst = *(void *)a2;
      *((void *)__dst + 1) = v7;
      uint64_t v8 = *((void *)a2 + 4);
      *((_OWORD *)__dst + 1) = *((_OWORD *)a2 + 1);
      *((void *)__dst + 4) = v8;
      char v9 = 2;
      goto LABEL_16;
    case 3u:
      uint64_t v10 = *((void *)a2 + 1);
      *(void *)__dst = *(void *)a2;
      *((void *)__dst + 1) = v10;
      uint64_t v11 = *((void *)a2 + 4);
      *((_OWORD *)__dst + 1) = *((_OWORD *)a2 + 1);
      *((void *)__dst + 4) = v11;
      char v9 = 3;
      goto LABEL_16;
    case 4u:
      uint64_t v12 = *((void *)a2 + 4);
      long long v13 = *((_OWORD *)a2 + 1);
      *(_OWORD *)__dst = *(_OWORD *)a2;
      *((_OWORD *)__dst + 1) = v13;
      *((void *)__dst + 4) = v12;
      __dst[80] = 4;
      goto LABEL_17;
    case 5u:
      *(_DWORD *)__dst = *(_DWORD *)a2;
      *((void *)__dst + 1) = *((void *)a2 + 1);
      __dst[16] = a2[16];
      *(void *)(__dst + 20) = *(void *)(a2 + 20);
      uint64_t v14 = *((void *)a2 + 6);
      *((_OWORD *)__dst + 2) = *((_OWORD *)a2 + 2);
      __dst[80] = 5;
      *((void *)__dst + 6) = v14;
      goto LABEL_17;
    case 6u:
      *(void *)__dst = *(void *)a2;
      __dst[80] = 6;
      swift_bridgeObjectRetain();
      return __dst;
    case 7u:
      uint64_t v15 = *((void *)a2 + 2);
      *(_OWORD *)__dst = *(_OWORD *)a2;
      *((void *)__dst + 2) = v15;
      char v16 = 7;
      goto LABEL_13;
    case 8u:
      *__dst = *a2;
      uint64_t v17 = *((void *)a2 + 3);
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *((void *)__dst + 3) = v17;
      char v16 = 8;
LABEL_13:
      __dst[80] = v16;
      goto LABEL_17;
    case 9u:
      *__dst = *a2;
      uint64_t v18 = *((void *)a2 + 2);
      *((void *)__dst + 1) = *((void *)a2 + 1);
      *((void *)__dst + 2) = v18;
      uint64_t v19 = *((void *)a2 + 4);
      *((void *)__dst + 3) = *((void *)a2 + 3);
      *((void *)__dst + 4) = v19;
      uint64_t v20 = *((void *)a2 + 6);
      *((void *)__dst + 5) = *((void *)a2 + 5);
      *((void *)__dst + 6) = v20;
      uint64_t v21 = *((void *)a2 + 9);
      *(_OWORD *)(__dst + 56) = *(_OWORD *)(a2 + 56);
      *((void *)__dst + 9) = v21;
      __dst[80] = 9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 0xAu:
      *(void *)__dst = *(void *)a2;
      uint64_t v22 = *((void *)a2 + 3);
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *((void *)__dst + 3) = v22;
      char v9 = 10;
LABEL_16:
      __dst[80] = v9;
      swift_bridgeObjectRetain();
LABEL_17:
      swift_bridgeObjectRetain();
LABEL_18:
      swift_retain();
      break;
    case 0xBu:
      long long v24 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(__dst + 24) = v24;
      (**(void (***)(char *))(v24 - 8))(__dst);
      __dst[80] = 11;
      break;
    default:
      memcpy(__dst, a2, 0x51uLL);
      break;
  }
  return __dst;
}

void *assignWithCopy for SettingCellStyle(void *__dst, void *__src)
{
  if (__dst != __src)
  {
    unsigned int v4 = *((unsigned __int8 *)__dst + 80);
    if (v4 >= 0xC) {
      unsigned int v4 = *(_DWORD *)__dst + 12;
    }
    switch(v4)
    {
      case 0u:
      case 4u:
      case 5u:
      case 7u:
      case 8u:
        goto LABEL_10;
      case 1u:
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_11;
      case 2u:
      case 3u:
      case 0xAu:
        swift_bridgeObjectRelease();
LABEL_10:
        swift_bridgeObjectRelease();
        goto LABEL_11;
      case 6u:
        swift_bridgeObjectRelease();
        break;
      case 9u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_11:
        swift_release();
        break;
      case 0xBu:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)__dst);
        break;
      default:
        break;
    }
    unsigned int v5 = *((unsigned __int8 *)__src + 80);
    if (v5 >= 0xC) {
      unsigned int v5 = *(_DWORD *)__src + 12;
    }
    switch(v5)
    {
      case 0u:
        *(unsigned char *)__dst = *(unsigned char *)__src;
        __dst[1] = __src[1];
        uint64_t v6 = __src[2];
        uint64_t v7 = __src[3];
        __dst[2] = v6;
        __dst[3] = v7;
        *((unsigned char *)__dst + 80) = 0;
        goto LABEL_30;
      case 1u:
        *__dst = *__src;
        uint64_t v8 = __src[2];
        __dst[1] = __src[1];
        __dst[2] = v8;
        uint64_t v9 = __src[3];
        uint64_t v10 = __src[4];
        __dst[3] = v9;
        __dst[4] = v10;
        *((unsigned char *)__dst + 80) = 1;
        swift_bridgeObjectRetain();
        swift_retain();
        goto LABEL_31;
      case 2u:
        *__dst = *__src;
        __dst[1] = __src[1];
        __dst[2] = __src[2];
        uint64_t v11 = __src[3];
        uint64_t v12 = __src[4];
        __dst[3] = v11;
        __dst[4] = v12;
        char v13 = 2;
        goto LABEL_29;
      case 3u:
        *__dst = *__src;
        __dst[1] = __src[1];
        __dst[2] = __src[2];
        uint64_t v14 = __src[3];
        uint64_t v15 = __src[4];
        __dst[3] = v14;
        __dst[4] = v15;
        char v13 = 3;
        goto LABEL_29;
      case 4u:
        *(_DWORD *)__dst = *(_DWORD *)__src;
        *((_DWORD *)__dst + 1) = *((_DWORD *)__src + 1);
        *((_DWORD *)__dst + 2) = *((_DWORD *)__src + 2);
        *((_DWORD *)__dst + 3) = *((_DWORD *)__src + 3);
        __dst[2] = __src[2];
        uint64_t v16 = __src[3];
        uint64_t v17 = __src[4];
        __dst[3] = v16;
        __dst[4] = v17;
        char v18 = 4;
        goto LABEL_26;
      case 5u:
        *(_DWORD *)__dst = *(_DWORD *)__src;
        uint64_t v19 = __src[1];
        *((unsigned char *)__dst + 16) = *((unsigned char *)__src + 16);
        __dst[1] = v19;
        *((_DWORD *)__dst + 5) = *((_DWORD *)__src + 5);
        *((_DWORD *)__dst + 6) = *((_DWORD *)__src + 6);
        __dst[4] = __src[4];
        uint64_t v20 = __src[5];
        uint64_t v21 = __src[6];
        __dst[5] = v20;
        __dst[6] = v21;
        char v18 = 5;
        goto LABEL_26;
      case 6u:
        *__dst = *__src;
        *((unsigned char *)__dst + 80) = 6;
        swift_bridgeObjectRetain();
        return __dst;
      case 7u:
        *__dst = *__src;
        uint64_t v22 = __src[1];
        uint64_t v23 = __src[2];
        __dst[1] = v22;
        __dst[2] = v23;
        char v18 = 7;
        goto LABEL_26;
      case 8u:
        *(unsigned char *)__dst = *(unsigned char *)__src;
        __dst[1] = __src[1];
        uint64_t v24 = __src[2];
        uint64_t v25 = __src[3];
        __dst[2] = v24;
        __dst[3] = v25;
        char v18 = 8;
LABEL_26:
        *((unsigned char *)__dst + 80) = v18;
        goto LABEL_30;
      case 9u:
        *(unsigned char *)__dst = *(unsigned char *)__src;
        __dst[1] = __src[1];
        __dst[2] = __src[2];
        __dst[3] = __src[3];
        __dst[4] = __src[4];
        __dst[5] = __src[5];
        __dst[6] = __src[6];
        __dst[7] = __src[7];
        uint64_t v26 = __src[8];
        uint64_t v27 = __src[9];
        __dst[8] = v26;
        __dst[9] = v27;
        *((unsigned char *)__dst + 80) = 9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_30;
      case 0xAu:
        *__dst = *__src;
        __dst[1] = __src[1];
        uint64_t v28 = __src[2];
        uint64_t v29 = __src[3];
        __dst[2] = v28;
        __dst[3] = v29;
        char v13 = 10;
LABEL_29:
        *((unsigned char *)__dst + 80) = v13;
        swift_bridgeObjectRetain();
LABEL_30:
        swift_bridgeObjectRetain();
LABEL_31:
        swift_retain();
        break;
      case 0xBu:
        uint64_t v31 = __src[3];
        __dst[3] = v31;
        __dst[4] = __src[4];
        (**(void (***)(void *, void *))(v31 - 8))(__dst, __src);
        *((unsigned char *)__dst + 80) = 11;
        break;
      default:
        memcpy(__dst, __src, 0x51uLL);
        break;
    }
  }
  return __dst;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

_OWORD *assignWithTake for SettingCellStyle(_OWORD *__dst, _OWORD *__src)
{
  if (__dst != __src)
  {
    unsigned int v4 = *((unsigned __int8 *)__dst + 80);
    if (v4 >= 0xC) {
      unsigned int v4 = *(_DWORD *)__dst + 12;
    }
    switch(v4)
    {
      case 0u:
      case 4u:
      case 5u:
      case 7u:
      case 8u:
        goto LABEL_10;
      case 1u:
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_11;
      case 2u:
      case 3u:
      case 0xAu:
        swift_bridgeObjectRelease();
LABEL_10:
        swift_bridgeObjectRelease();
        goto LABEL_11;
      case 6u:
        swift_bridgeObjectRelease();
        break;
      case 9u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_11:
        swift_release();
        break;
      case 0xBu:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)__dst);
        break;
      default:
        break;
    }
    unsigned int v5 = *((unsigned __int8 *)__src + 80);
    if (v5 >= 0xC) {
      unsigned int v5 = *(_DWORD *)__src + 12;
    }
    switch(v5)
    {
      case 0u:
        long long v6 = __src[1];
        *__dst = *__src;
        __dst[1] = v6;
        *((unsigned char *)__dst + 80) = 0;
        return __dst;
      case 1u:
        long long v7 = __src[1];
        *__dst = *__src;
        __dst[1] = v7;
        *((void *)__dst + 4) = *((void *)__src + 4);
        char v8 = 1;
        goto LABEL_29;
      case 2u:
        long long v9 = __src[1];
        *__dst = *__src;
        __dst[1] = v9;
        *((void *)__dst + 4) = *((void *)__src + 4);
        char v8 = 2;
        goto LABEL_29;
      case 3u:
        long long v10 = __src[1];
        *__dst = *__src;
        __dst[1] = v10;
        *((void *)__dst + 4) = *((void *)__src + 4);
        char v8 = 3;
        goto LABEL_29;
      case 4u:
        long long v11 = __src[1];
        *__dst = *__src;
        __dst[1] = v11;
        *((void *)__dst + 4) = *((void *)__src + 4);
        char v8 = 4;
        goto LABEL_29;
      case 5u:
        long long v12 = __src[1];
        *__dst = *__src;
        __dst[1] = v12;
        __dst[2] = __src[2];
        *((void *)__dst + 6) = *((void *)__src + 6);
        char v8 = 5;
        goto LABEL_29;
      case 6u:
        *(void *)__dst = *(void *)__src;
        char v8 = 6;
        goto LABEL_29;
      case 7u:
        *__dst = *__src;
        *((void *)__dst + 2) = *((void *)__src + 2);
        char v8 = 7;
        goto LABEL_29;
      case 8u:
        long long v13 = __src[1];
        *__dst = *__src;
        __dst[1] = v13;
        char v8 = 8;
        goto LABEL_29;
      case 9u:
        memcpy(__dst, __src, 0x50uLL);
        char v8 = 9;
        goto LABEL_29;
      case 0xAu:
        long long v14 = __src[1];
        *__dst = *__src;
        __dst[1] = v14;
        char v8 = 10;
        goto LABEL_29;
      case 0xBu:
        long long v15 = __src[1];
        *__dst = *__src;
        __dst[1] = v15;
        *((void *)__dst + 4) = *((void *)__src + 4);
        char v8 = 11;
LABEL_29:
        *((unsigned char *)__dst + 80) = v8;
        break;
      default:
        memcpy(__dst, __src, 0x51uLL);
        break;
    }
  }
  return __dst;
}

uint64_t getEnumTagSinglePayload for SettingCellStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF4 && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 244);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 0xD) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SettingCellStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF3)
  {
    *(unsigned char *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)unint64_t result = 0u;
    *(_DWORD *)unint64_t result = a2 - 244;
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A2C98BE0(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 0xC) {
    return (*(_DWORD *)a1 + 12);
  }
  return result;
}

uint64_t sub_1A2C98BFC(uint64_t result, unsigned int a2)
{
  if (a2 > 0xB)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 12;
    LOBYTE(a2) = 12;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

void type metadata accessor for SettingCellStyle()
{
}

uint64_t _s11TeaSettings14ChangeBehaviorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s11TeaSettings14ChangeBehaviorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2C98D88);
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

void type metadata accessor for SettingCellStyle.ButtonStyle()
{
}

uint64_t Group.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.footer.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Group.visibleItems.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v25 = MEMORY[0x1E4FBC860];
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  if (v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = v1 + 32;
    while (v5 < *(void *)(v1 + 16))
    {
      sub_1A2C945B0(v6, (uint64_t)&v22);
      uint64_t v7 = v23;
      uint64_t v8 = v24;
      __swift_project_boxed_opaque_existential_1(&v22, v23);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8))
      {
        sub_1A2C9250C(&v22, (uint64_t)v19);
        uint64_t v9 = v25;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A2C998C8(0, *(void *)(v9 + 16) + 1, 1);
          uint64_t v9 = v25;
        }
        unint64_t v11 = *(void *)(v9 + 16);
        unint64_t v10 = *(void *)(v9 + 24);
        if (v11 >= v10 >> 1) {
          sub_1A2C998C8((void *)(v10 > 1), v11 + 1, 1);
        }
        uint64_t v12 = v20;
        uint64_t v13 = v21;
        uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
        MEMORY[0x1F4188790](v14);
        uint64_t v16 = &v19[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
        (*(void (**)(unsigned char *))(v17 + 16))(v16);
        sub_1A2C99D08(v11, (uint64_t)v16, &v25, v12, v13);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v22);
      }
      ++v5;
      v6 += 40;
      if (v3 == v5)
      {
        uint64_t v2 = v25;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v2;
  }
  return result;
}

uint64_t Group.init(title:footer:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t Group.init(title:footer:group:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  sub_1A2C9136C(0, &qword_1E959DEB0, (unint64_t *)&qword_1E959DEB8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1A2CA83D0;
  uint64_t v13 = *(void *)(a5 + 16);
  if (v13)
  {
    uint64_t v14 = (void *)result;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1A2CA7A98();
    swift_bridgeObjectRelease();
    sub_1A2C99DF0();
    uint64_t v16 = v15;
    uint64_t v17 = swift_allocObject();
    *(unsigned char *)(v17 + 48) = 1;
    *(void *)(v17 + 56) = 1065353216;
    *(_WORD *)(v17 + 64) = 128;
    *(void *)(v17 + 16) = v13;
    *(void *)(v17 + 24) = 0x20656C62616E45;
    *(unsigned char *)(v17 + 66) = 0;
    *(_WORD *)(v17 + 49) = 256;
    uint64_t v18 = MEMORY[0x1E4FBC860];
    *(void *)(v17 + 32) = 0xE700000000000000;
    *(void *)(v17 + 40) = v18;
    v14[7] = v16;
    v14[8] = &protocol witness table for Item<A>;
    v14[4] = v17;
    uint64_t v23 = v14;
    swift_retain();
    uint64_t v19 = sub_1A2C99200(a6, a5);
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_1A2C9935C(v19);
    swift_bridgeObjectRelease();
    sub_1A2C99484(v20);
    uint64_t result = swift_release();
    *a7 = a1;
    a7[1] = a2;
    a7[2] = a3;
    a7[3] = a4;
    a7[4] = v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2C99200(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v18 = MEMORY[0x1E4FBC860];
    sub_1A2C99914(0, v3, 0);
    uint64_t v5 = a1 + 32;
    do
    {
      sub_1A2C945B0(v5, (uint64_t)v14);
      sub_1A2C9250C(v14, (uint64_t)v15);
      *((void *)&v16 + 1) = sub_1A2C9A1F4;
      uint64_t v17 = a2;
      uint64_t v6 = v18;
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2C99914(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v18;
      }
      unint64_t v8 = *(void *)(v6 + 16);
      unint64_t v7 = *(void *)(v6 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1A2C99914(v7 > 1, v8 + 1, 1);
        uint64_t v6 = v18;
      }
      *(void *)(v6 + 16) = v8 + 1;
      uint64_t v9 = v6 + 56 * v8;
      long long v10 = v15[0];
      long long v11 = v15[1];
      long long v12 = v16;
      *(void *)(v9 + 80) = v17;
      *(_OWORD *)(v9 + 48) = v11;
      *(_OWORD *)(v9 + 64) = v12;
      *(_OWORD *)(v9 + 32) = v10;
      v5 += 40;
      --v3;
    }
    while (v3);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  return v6;
}

uint64_t sub_1A2C9935C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    sub_1A2C998C8(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = a1 + 32;
    do
    {
      sub_1A2C9A104(v4, (uint64_t)v11);
      uint64_t v12 = v2;
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1A2C998C8((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v12;
      }
      uint64_t v9 = &type metadata for ConditionalItem;
      long long v10 = &protocol witness table for ConditionalItem;
      *(void *)&long long v8 = swift_allocObject();
      sub_1A2C9A104((uint64_t)v11, v8 + 16);
      *(void *)(v2 + 16) = v6 + 1;
      sub_1A2C9250C(&v8, v2 + 40 * v6 + 32);
      sub_1A2C9A1A0((uint64_t)v11);
      v4 += 56;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_1A2C99484(void *result)
{
  uint64_t v2 = result[2];
  int64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > v3[3] >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_1A2CA34C0(result, v7, 1, v3);
    int64_t v3 = result;
  }
  if (!v6[2])
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_1A2C92524(0, (unint64_t *)&qword_1E959DEB8);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1A2C99588(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1A2CA7DA8();
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
    uint64_t v5 = sub_1A2CA7DA8();
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
  *uint64_t v1 = v4;
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
    unint64_t v4 = MEMORY[0x1A623E120](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_1A2C99B6C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1A2CA7DA8();
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

  return sub_1A2CA7B88();
}

uint64_t sub_1A2C99750(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)sub_1A2CA35D4((char *)result, v7, 1, (char *)v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1A2C9983C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 48) = 1;
  *(void *)(v7 + 56) = 1065353216;
  *(_WORD *)(v7 + 64) = 128;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(unsigned char *)(v7 + 66) = a4 & 1;
  *(unsigned char *)(v7 + 50) = a5 & 1;
  *(unsigned char *)(v7 + 49) = a6 & 1;
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a7;
  return v7;
}

void *sub_1A2C9987C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2C99934(a1, a2, a3, *v3, (unint64_t *)&qword_1EB5A4EC8, qword_1EB5A4DC0, (uint64_t)&protocol descriptor for ConditionType, (void (*)(uint64_t, uint64_t, void *))sub_1A2CA30E4);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

void *sub_1A2C998C8(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2C99934(a1, a2, a3, *v3, &qword_1E959DEB0, (unint64_t *)&qword_1E959DEB8, (uint64_t)&protocol descriptor for Groupable, (void (*)(uint64_t, uint64_t, void *))sub_1A2CA3738);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

uint64_t sub_1A2C99914(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2C99A70(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

void *sub_1A2C99934(void *result, int64_t a2, char a3, uint64_t a4, unint64_t *a5, unint64_t *a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, void *))
{
  char v11 = (char)result;
  if (a3)
  {
    unint64_t v12 = *(void *)(a4 + 24);
    int64_t v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v13 = a2;
      }
    }
  }
  else
  {
    int64_t v13 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v13 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v13;
  }
  if (v15)
  {
    sub_1A2C9136C(0, a5, a6);
    long long v16 = (void *)swift_allocObject();
    size_t v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 40);
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v11)
  {
    a8(a4 + 32, v14, v16 + 4);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2C92524(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v16;
}

uint64_t sub_1A2C99A70(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2C9A1F8();
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    sub_1A2CA310C((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1A2C99B6C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1A2CA7DA8();
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
      uint64_t v8 = sub_1A2CA7DA8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1A2C9A05C();
          sub_1A2C9A0B4();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            uint64_t v10 = sub_1A2CA708C(v13, i, a3);
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
        type metadata accessor for SettingAction();
        swift_arrayInitWithCopy();
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

uint64_t sub_1A2C99D08(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_1A2C9250C(&v12, v10 + 40 * a1 + 32);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void sub_1A2C99DF0()
{
  if (!qword_1E959DEC0)
  {
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959DEC0);
    }
  }
}

uint64_t destroy for Group()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Group(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Group(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for Group(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void sub_1A2C9A05C()
{
  if (!qword_1E959DEC8)
  {
    type metadata accessor for SettingAction();
    unint64_t v0 = sub_1A2CA7C18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959DEC8);
    }
  }
}

unint64_t sub_1A2C9A0B4()
{
  unint64_t result = qword_1E959DED0;
  if (!qword_1E959DED0)
  {
    sub_1A2C9A05C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DED0);
  }
  return result;
}

uint64_t sub_1A2C9A104(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A2C9A160()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2C9A1A0(uint64_t a1)
{
  return a1;
}

void sub_1A2C9A1F8()
{
  if (!qword_1E959DED8)
  {
    unint64_t v0 = sub_1A2CA7DD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959DED8);
    }
  }
}

uint64_t sub_1A2C9A244(uint64_t a1)
{
  uint64_t v2 = sub_1A2CA78F8();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return AppGroup.containerURL.setter((uint64_t)v4);
}

uint64_t AppGroup.containerURL.setter(uint64_t a1)
{
  sub_1A2C8F7FC();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A2CA78F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  swift_beginAccess();
  sub_1A2C95A74((uint64_t)v5, v7);
  return swift_endAccess();
}

void (*AppGroup.containerURL.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = sub_1A2CA78F8();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[4] = v7;
  AppGroup.containerURL.getter((uint64_t)v7);
  return sub_1A2C9A4D4;
}

void sub_1A2C9A4D4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    AppGroup.containerURL.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    AppGroup.containerURL.setter(*(void *)(*(void *)a1 + 32));
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t AppGroup.settingsDomain.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AppGroup.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  AppGroup.init(identifier:)(a1, a2);
  return v4;
}

uint64_t AppGroup.deinit()
{
  swift_bridgeObjectRelease();
  sub_1A2C95A18(v0 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AppGroup.__deallocating_deinit()
{
  AppGroup.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A2C9A69C@<X0>(uint64_t a1@<X8>)
{
  return AppGroup.containerURL.getter(a1);
}

uint64_t sub_1A2C9A6C4()
{
  return type metadata accessor for AppGroup();
}

uint64_t method lookup function for AppGroup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppGroup);
}

uint64_t dispatch thunk of AppGroup.__allocating_init(identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1A2C9A6F8()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

BOOL SettingReader.isDisabled(_:with:)(uint64_t a1, char a2)
{
  return !sub_1A2C91424(a1, a2);
}

uint64_t SettingReader.deinit()
{
  swift_release();
  return v0;
}

uint64_t SettingReader.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t method lookup function for SettingReader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SettingReader);
}

uint64_t Option.description.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t *sub_1A2C9A7DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    uint64_t v15 = (void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    long long v16 = (void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v15 = *v16;
    v15[1] = v16[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *sub_1A2C9A91C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A2C9A9F4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A2C9AA94(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 24) + 7;
  uint64_t v13 = (void *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A2C9AB54(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v10 = a2 - v8;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *(unsigned __int8 *)(a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)(a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A2C9AC9CLL);
      case 4:
        int v15 = *(_DWORD *)(a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *(_DWORD *)a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v6 & 0x80000000) != 0) {
    return __swift_getEnumTagSinglePayload((a1 + v7 + 16) & ~v7, v6, v4);
  }
  unint64_t v18 = *(void *)(a1 + 8);
  if (v18 >= 0xFFFFFFFF) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

void sub_1A2C9ACB0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = a3 - v9;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v16 = a2 - v9;
    }
    else {
      int v16 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~v10) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1A2C9AE90);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v10 + 16] & ~v10;
          __swift_storeEnumTagSinglePayload(v18, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

TeaSettings::Page __swiftcall Page.init(title:_:)(Swift::String title, Swift::OpaquePointer _)
{
  *(Swift::String *)uint64_t v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = _;
  result.title = title;
  result.layout = _;
  return result;
}

uint64_t Page.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Page.cellStyle.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = *(void *)(v1 + 16);
  *(unsigned char *)(a1 + 80) = 6;
  return swift_bridgeObjectRetain();
}

uint64_t Page.isEnabled.getter()
{
  return 1;
}

uint64_t Page.reset()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v18 = MEMORY[0x1E4FBC860];
  uint64_t v11 = *(void *)(v1 + 16);
  if (v11)
  {
    uint64_t v10 = v1 + 32;
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v4 = *(void *)(v10 + 40 * i + 32);
      uint64_t v5 = *(void *)(v4 + 16);
      if (v5)
      {
        uint64_t v6 = v4 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_1A2C945B0(v6, (uint64_t)v14);
          sub_1A2C92524(0, (unint64_t *)&qword_1E959DEB8);
          sub_1A2C92524(0, &qword_1E959DEE0);
          if (swift_dynamicCast())
          {
            sub_1A2C9250C(v12, (uint64_t)v15);
            uint64_t v7 = v16;
            uint64_t v8 = v17;
            __swift_project_boxed_opaque_existential_1(v15, v16);
            unint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
            sub_1A2C99588(v9);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
          }
          else
          {
            uint64_t v13 = 0;
            memset(v12, 0, sizeof(v12));
            sub_1A2C9B0B0((uint64_t)v12);
          }
          v6 += 40;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    return v18;
  }
  return result;
}

uint64_t sub_1A2C9B0B0(uint64_t a1)
{
  sub_1A2C9B10C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A2C9B10C()
{
  if (!qword_1E959DEE8[0])
  {
    sub_1A2C92524(255, &qword_1E959DEE0);
    unint64_t v0 = sub_1A2CA7C98();
    if (!v1) {
      atomic_store(v0, qword_1E959DEE8);
    }
  }
}

uint64_t destroy for Page()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s11TeaSettings4PageVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Page(void *a1, void *a2)
{
  *a1 = *a2;
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

uint64_t assignWithTake for Page(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Page(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Page(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Page()
{
  return &type metadata for Page;
}

uint64_t sub_1A2C9B34C()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t sub_1A2C9B364()
{
  return Updatable.reset<A>(setting:)();
}

uint64_t Updatable.reset<A>(setting:)()
{
  OUTLINED_FUNCTION_0_4();
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1EB5A5340;
  uint64_t v5 = v0;
  uint64_t v2 = type metadata accessor for Setting();
  swift_retain();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C97B2C((uint64_t)&v5, v1, v2, WitnessTable);
  return swift_release();
}

uint64_t sub_1A2C9B43C(uint64_t a1)
{
  return Updatable.apply(preset:)(a1);
}

uint64_t sub_1A2C9B454(uint64_t a1)
{
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  return sub_1A2C96DCC(a1);
}

uint64_t Updatable.apply(preset:)(uint64_t a1)
{
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  return sub_1A2C96DCC(a1);
}

uint64_t sub_1A2C9B514(uint64_t a1)
{
  return sub_1A2C9B454(a1);
}

uint64_t Updatable.toggle(setting:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = MEMORY[0x1E4FBB390];
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void, _UNKNOWN **, uint64_t))(*(void *)(a3 + 8) + 8))(&v9, a1, MEMORY[0x1E4FBB390], &protocol witness table for Bool, a2);
  BOOL v8 = (v9 & 1) == 0;
  return (*(uint64_t (**)(uint64_t, BOOL *, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a3 + 16))(a1, &v8, v6, &protocol witness table for Bool, a2, a3);
}

uint64_t dispatch thunk of Updatable.save<A>(setting:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of Updatable.reset<A>(setting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of Updatable.apply(preset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1A2C9B61C()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1();
  v1();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + *(void *)(*(void *)v0 + 120));
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v0 + *(void *)(v2 + 152);
  type metadata accessor for Trait();
  OUTLINED_FUNCTION_3_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);

  return v6(v3, v4);
}

uint64_t Setting.migrate(_:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5;
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v7 = MEMORY[0x1F4188790](qword_1EB5A5340);
  v9[1] = *(_OWORD *)(v6 + 88);
  uint64_t v10 = a1;
  uint64_t v11 = a2;
  sub_1A2C9B820(v7, (void (*)(uint64_t))sub_1A2C9B7F0, (uint64_t)v9);
  return v2;
}

uint64_t sub_1A2C9B7F0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **))(v1 + 32))(a1, &off_1EF5DC128);
}

uint64_t sub_1A2C9B820(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  v23[1] = a3;
  uint64_t v24 = a2;
  uint64_t v6 = *(void *)(*(void *)v3 + 88);
  sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  v23[0] = v7;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v23 - v9;
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1F4188790](v13);
  int v15 = (char *)v23 - v14;
  uint64_t v16 = swift_bridgeObjectRetain();
  BOOL v17 = sub_1A2C94454(v16);
  swift_bridgeObjectRelease();
  if (v17)
  {
    uint64_t v25 = v4;
    swift_retain();
    swift_getWitnessTable();
    BOOL v18 = sub_1A2C97C50();
    swift_release();
    if (!v18)
    {
      v24(a1);
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6) == 1)
      {
        OUTLINED_FUNCTION_5_1();
        v21(v19, v20);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v6);
        sub_1A2C96FFC(v4);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v6);
      }
    }
  }
  return swift_retain();
}

uint64_t Setting.migrate(from:)(uint64_t a1)
{
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1EB5A5340;

  return sub_1A2C9BAC4(a1, v2);
}

uint64_t sub_1A2C9BAC4(uint64_t a1, uint64_t a2)
{
  return sub_1A2C9B820(a2, (void (*)(uint64_t))sub_1A2C9C9A8, a1);
}

uint64_t method lookup function for Setting(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Setting);
}

uint64_t dispatch thunk of Setting.__allocating_init(_:defaultValue:domain:access:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

void *sub_1A2C9BB10(void *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v4 = __dst;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  int v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = (v10 & ~(unint64_t)v8) + v7;
  if (v11 <= 8) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = v11;
  }
  size_t v13 = v12 + 1;
  if (v8 > 7u || (v8 & 0x100000) != 0 || v13 > 0x18)
  {
    uint64_t v16 = *(void *)__src;
    *uint64_t v4 = *(void *)__src;
    uint64_t v4 = (void *)(v16 + ((v8 & 0xF8 ^ 0x1F8u) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    unsigned int v17 = __src[v12];
    unsigned int v18 = v17 - 2;
    if (v17 >= 2)
    {
      if (v12 <= 3) {
        uint64_t v19 = v12;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *__src;
          goto LABEL_22;
        case 2:
          int v20 = *(unsigned __int16 *)__src;
          goto LABEL_22;
        case 3:
          int v20 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_22;
        case 4:
          int v20 = *(_DWORD *)__src;
LABEL_22:
          int v21 = (v20 | (v18 << (8 * v12))) + 2;
          unsigned int v17 = v20 + 2;
          if (v12 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    if (v17 == 1)
    {
      uint64_t v22 = ~v9;
      uint64_t v23 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
      v23(__dst, __src, v5);
      v23((void *)(((unint64_t)v4 + v10) & v22), (unsigned __int8 *)((unint64_t)&__src[v10] & v22), v5);
      *((unsigned char *)v4 + v12) = 1;
    }
    else if (v17)
    {
      memcpy(__dst, __src, v13);
    }
    else
    {
      *__dst = *(void *)__src;
      *((unsigned char *)__dst + v12) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return v4;
}

unsigned char *sub_1A2C9BD0C(unsigned char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  unint64_t v10 = ((v7 + v8) & ~v8) + v7;
  if (v10 <= 8) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = v10;
  }
  unsigned int v12 = __src[v11];
  unsigned int v13 = v12 - 2;
  if (v12 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 4;
    }
    switch(v14)
    {
      case 1:
        int v15 = *__src;
        goto LABEL_13;
      case 2:
        int v15 = *(unsigned __int16 *)__src;
        goto LABEL_13;
      case 3:
        int v15 = *(unsigned __int16 *)__src | (__src[2] << 16);
        goto LABEL_13;
      case 4:
        int v15 = *(_DWORD *)__src;
LABEL_13:
        int v16 = (v15 | (v13 << (8 * v11))) + 2;
        unsigned int v12 = v15 + 2;
        if (v11 < 4) {
          unsigned int v12 = v16;
        }
        break;
      default:
        break;
    }
  }
  if (v12 == 1)
  {
    uint64_t v17 = ~v8;
    unsigned int v18 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16);
    v18(__dst, __src, v5);
    v18((unsigned char *)((unint64_t)&__dst[v9] & v17), (unsigned __int8 *)((unint64_t)&__src[v9] & v17), v5);
    __dst[v11] = 1;
  }
  else if (v12)
  {
    memcpy(__dst, __src, v11 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)__src;
    __dst[v11] = 0;
    swift_bridgeObjectRetain();
  }
  return __dst;
}

unsigned __int8 *sub_1A2C9BEB8(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    unint64_t v10 = ((v7 + v8) & ~v8) + v7;
    if (v10 <= 8) {
      uint64_t v11 = 8;
    }
    else {
      uint64_t v11 = v10;
    }
    unsigned int v12 = __dst[v11];
    char v13 = 8 * v11;
    unsigned int v14 = v12 - 2;
    if (v12 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__dst;
          goto LABEL_14;
        case 2:
          int v16 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v16 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v16 = *(_DWORD *)__dst;
LABEL_14:
          int v17 = (v16 | (v14 << v13)) + 2;
          unsigned int v12 = v16 + 2;
          if (v11 < 4) {
            unsigned int v12 = v17;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v8;
    if (v12 == 1)
    {
      uint64_t v19 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v19(__dst, v5);
      v19((unsigned __int8 *)((unint64_t)&__dst[v9] & v18), v5);
    }
    else if (!v12)
    {
      swift_bridgeObjectRelease();
    }
    unsigned int v20 = __src[v11];
    unsigned int v21 = v20 - 2;
    if (v20 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v22 = v11;
      }
      else {
        uint64_t v22 = 4;
      }
      switch(v22)
      {
        case 1:
          int v23 = *__src;
          goto LABEL_29;
        case 2:
          int v23 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v23 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v23 = *(_DWORD *)__src;
LABEL_29:
          int v24 = (v23 | (v21 << v13)) + 2;
          unsigned int v20 = v23 + 2;
          if (v11 < 4) {
            unsigned int v20 = v24;
          }
          break;
        default:
          break;
      }
    }
    if (v20 == 1)
    {
      uint64_t v25 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
      v25(__dst, __src, v5);
      v25((unsigned __int8 *)((unint64_t)&__dst[v9] & v18), (unsigned __int8 *)((unint64_t)&__src[v9] & v18), v5);
      __dst[v11] = 1;
    }
    else if (v20)
    {
      memcpy(__dst, __src, v11 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v11] = 0;
      swift_bridgeObjectRetain();
    }
  }
  return __dst;
}

unsigned char *sub_1A2C9C148(unsigned char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  unint64_t v10 = ((v7 + v8) & ~v8) + v7;
  if (v10 <= 8) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = v10;
  }
  unsigned int v12 = __src[v11];
  unsigned int v13 = v12 - 2;
  if (v12 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 4;
    }
    switch(v14)
    {
      case 1:
        int v15 = *__src;
        goto LABEL_13;
      case 2:
        int v15 = *(unsigned __int16 *)__src;
        goto LABEL_13;
      case 3:
        int v15 = *(unsigned __int16 *)__src | (__src[2] << 16);
        goto LABEL_13;
      case 4:
        int v15 = *(_DWORD *)__src;
LABEL_13:
        int v16 = (v15 | (v13 << (8 * v11))) + 2;
        unsigned int v12 = v15 + 2;
        if (v11 < 4) {
          unsigned int v12 = v16;
        }
        break;
      default:
        break;
    }
  }
  if (v12 == 1)
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32);
    v18(__dst, __src, v5);
    v18((unsigned char *)((unint64_t)&__dst[v9] & v17), (unsigned __int8 *)((unint64_t)&__src[v9] & v17), v5);
    __dst[v11] = 1;
  }
  else if (v12)
  {
    memcpy(__dst, __src, v11 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)__src;
    __dst[v11] = 0;
  }
  return __dst;
}

uint64_t sub_1A2C9C318(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = 8;
  if (((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 8)
    unint64_t v3 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
         + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  unint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_22:
      unsigned int v10 = *((unsigned __int8 *)a1 + v3);
      if (v10 >= 3) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_22;
  }
LABEL_14:
  int v9 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v9 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v4 | v9) + 254;
}

void sub_1A2C9C488(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    int v8 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v9 = a2 - 254;
    if (v6 < 4)
    {
      int v10 = (v9 >> v7) + 1;
      if (v5 != -1)
      {
        int v12 = v9 & ~(-1 << v7);
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v6] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1A2C9C688);
      case 4:
        *(_DWORD *)&a1[v6] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1A2C9C6B0(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = 8;
  if (((*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64) > 8)
    unint64_t v2 = ((*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64)
         + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v3 = a1[v2];
  int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v7 = (v6 | (v4 << (8 * v2))) + 2;
        LODWORD(v3) = v6 + 2;
        if (v2 >= 4) {
          uint64_t v3 = v3;
        }
        else {
          uint64_t v3 = v7;
        }
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_1A2C9C7A4(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8)
    size_t v4 = 8;
  else {
    size_t v4 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
  }
         + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

#error "1A2C9C970: call analysis failed (funcsize=58)"

uint64_t sub_1A2C9C9A8(uint64_t a1)
{
  return sub_1A2C9C8B8(a1, v1);
}

uint64_t Settings.deinit()
{
  return v0;
}

uint64_t sub_1A2C9C9B8()
{
  sub_1A2C91834();
  swift_allocObject();
  uint64_t result = sub_1A2C90F0C(0xD00000000000002BLL, 0x80000001A2CA97F0);
  qword_1EB5A49A8 = result;
  return result;
}

uint64_t static Settings.CompositionalList.useDiffableDataSource.getter()
{
  if (qword_1EB5A49A0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t Settings.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t method lookup function for Settings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Settings);
}

ValueMetadata *type metadata accessor for Settings.CompositionalList()
{
  return &type metadata for Settings.CompositionalList;
}

uint64_t sub_1A2C9CAC0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1A2C9CAF8()
{
}

uint64_t sub_1A2C9CB10()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t dispatch thunk of Configurable.setting<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:defaultValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:defaultValue:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 32))();
}

#error "1A2C9CBE0: call analysis failed (funcsize=16)"

uint64_t sub_1A2C9CBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a4;
  uint64_t v7 = sub_1A2CA79D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  int v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A2CA79F8();
  uint64_t v27 = *(void *)(v11 - 8);
  uint64_t v28 = v11;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a3 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v12);
  if (objc_msgSend(self, sel_isMainThread))
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      sub_1A2C9CFF8(a1);
      return swift_release();
    }
  }
  else
  {
    sub_1A2C929F8();
    uint64_t v25 = v8;
    uint64_t v24 = sub_1A2CA7C78();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
    unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v19 = (char *)swift_allocObject();
    uint64_t v20 = v26;
    *((void *)v19 + 2) = a3;
    *((void *)v19 + 3) = v20;
    *((void *)v19 + 4) = a2;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v19[v18], (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
    aBlock[4] = sub_1A2C9DE5C;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A2C8F94C;
    aBlock[3] = &block_descriptor_0;
    unsigned int v21 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1A2CA79E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1A2C929B0(&qword_1EB5A4DA0, MEMORY[0x1E4FBCB00]);
    sub_1A2C92A38();
    sub_1A2C929B0(&qword_1EB5A4DB0, (void (*)(uint64_t))sub_1A2C92A38);
    sub_1A2CA7CB8();
    uint64_t v22 = (void *)v24;
    MEMORY[0x1A623E0A0](0, v14, v10, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, v28);
  }
  return result;
}

uint64_t sub_1A2C9CFF8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 24);
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A2CA7B78();
  uint64_t v9 = v5;
  if (v5 == MEMORY[0x1A623E010](v3, FunctionTypeMetadata1)) {
    return swift_bridgeObjectRelease();
  }
  while (1)
  {
    char v6 = sub_1A2CA7BC8();
    sub_1A2CA7B98();
    if ((v6 & 1) == 0) {
      break;
    }
    uint64_t v7 = *(void (**)(uint64_t))(v3 + 32 + 16 * v5);
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x1A623E020](&v9, v3, FunctionTypeMetadata1);
    swift_bridgeObjectRelease();
    v7(a1);
    swift_release();
    uint64_t v5 = v9;
    if (v5 == MEMORY[0x1A623E010](v3, FunctionTypeMetadata1)) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_1A2CA7CE8();
  __break(1u);
  return result;
}

uint64_t sub_1A2C9D14C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2C9CFF8(a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2C9D1AC(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  unint64_t v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return SettingProperty.wrappedValue.setter((uint64_t)v2);
}

uint64_t SettingProperty.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_retain();
  Updatable.save<A>(setting:value:)();
  swift_release();
  size_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v4(a1);
}

void (*SettingProperty.wrappedValue.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  v3[1] = *(void *)(*(void *)v1 + 80);
  OUTLINED_FUNCTION_0_1();
  *(void *)(v4 + 16) = v5;
  size_t v7 = *(void *)(v6 + 64);
  v3[3] = malloc(v7);
  v3[4] = malloc(v7);
  SettingProperty.wrappedValue.getter();
  return sub_1A2C9D3EC;
}

void sub_1A2C9D3EC(uint64_t a1, char a2)
{
  unint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    SettingProperty.wrappedValue.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    SettingProperty.wrappedValue.setter(*(void *)(*(void *)a1 + 32));
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t SettingProperty.projectedValue.getter()
{
  return swift_retain();
}

uint64_t SettingProperty.observe(block:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  uint64_t v6 = sub_1A2CA7A08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_3();
  uint64_t v12 = (uint64_t *)(v11 - v10);
  sub_1A2C929F8();
  uint64_t *v12 = sub_1A2CA7C78();
  OUTLINED_FUNCTION_5_3();
  v13();
  char v14 = sub_1A2CA7A18();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v8 + 8))(v12, v6);
  if (v14)
  {
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = *(void *)(v5 + 80);
    v16[3] = *(void *)(v5 + 88);
    v16[4] = a1;
    v16[5] = a2;
    swift_beginAccess();
    OUTLINED_FUNCTION_6_1();
    sub_1A2CA7C18();
    swift_retain();
    sub_1A2CA7BE8();
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void SettingProperty.observe<A>(disposeOn:block:)()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1A2CA7A08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_2_3();
  char v14 = (uint64_t *)(v13 - v12);
  sub_1A2C929F8();
  *char v14 = sub_1A2CA7C78();
  OUTLINED_FUNCTION_5_3();
  v15();
  char v16 = sub_1A2CA7A18();
  (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v14, v8);
  if (v16)
  {
    uint64_t v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v18 = (void *)swift_allocObject();
    v18[2] = *(void *)(v7 + 80);
    v18[3] = v1;
    v18[4] = *(void *)(v7 + 88);
    v18[5] = v17;
    v18[6] = v5;
    v18[7] = v3;
    swift_beginAccess();
    OUTLINED_FUNCTION_6_1();
    sub_1A2CA7C18();
    swift_retain();
    swift_retain();
    sub_1A2CA7BE8();
    swift_endAccess();
    swift_release();
    OUTLINED_FUNCTION_5_2();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A2C9D7FC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1A623E700](v4);
  if (result)
  {
    a3();
    return swift_unknownObjectRelease();
  }
  return result;
}

void SettingProperty.eagerObserve(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_7();
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)(*(void *)v20 + 80);
  OUTLINED_FUNCTION_0_1();
  uint64_t v29 = v28;
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&a9 - v31;
  uint64_t v33 = sub_1A2CA7A08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v35 = v34;
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_2_3();
  uint64_t v39 = (uint64_t *)(v38 - v37);
  sub_1A2C929F8();
  *uint64_t v39 = sub_1A2CA7C78();
  OUTLINED_FUNCTION_5_3();
  v40();
  char v41 = sub_1A2CA7A18();
  (*(void (**)(uint64_t *, uint64_t))(v35 + 8))(v39, v33);
  if (v41)
  {
    uint64_t v42 = SettingProperty.observe(block:)((uint64_t)v26, v24);
    SettingProperty.wrappedValue.getter(v42);
    v26(v32);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v27);
    OUTLINED_FUNCTION_5_2();
  }
  else
  {
    __break(1u);
  }
}

void SettingProperty.eagerObserve<A>(disposeOn:block:)()
{
  OUTLINED_FUNCTION_7();
  uint64_t v22 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v23 = *(void *)(*(void *)v0 + 80);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_1A2CA7A08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_2_3();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  sub_1A2C929F8();
  *uint64_t v17 = sub_1A2CA7C78();
  OUTLINED_FUNCTION_5_3();
  v19(v18);
  char v20 = sub_1A2CA7A18();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v17, v11);
  if (v20)
  {
    SettingProperty.observe<A>(disposeOn:block:)();
    SettingProperty.wrappedValue.getter(v21);
    v3(v5, v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v23);
    OUTLINED_FUNCTION_5_2();
  }
  else
  {
    __break(1u);
  }
}

uint64_t SettingProperty.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SettingProperty.__deallocating_deinit()
{
  SettingProperty.deinit();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1A2C9DBEC()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2C9DC24()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2C9DC5C(uint64_t a1)
{
  return sub_1A2C9CBF4(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_1A2C9DC68()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1A2C9DCA0()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1A2C9DCC8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2C9DD00()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1A2C9DD40(uint64_t a1)
{
  return sub_1A2C9D7FC(a1, *(void *)(v1 + 40), *(void (**)(void))(v1 + 48));
}

uint64_t sub_1A2C9DD50(uint64_t a1)
{
  return SettingProperty.wrappedValue.getter(a1);
}

uint64_t sub_1A2C9DD78()
{
  return 16;
}

__n128 sub_1A2C9DD84(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t method lookup function for SettingProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SettingProperty);
}

uint64_t dispatch thunk of SettingProperty.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1A2C9DDBC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 40) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x1F4186498](v0, v8, v9);
}

uint64_t sub_1A2C9DE5C()
{
  return sub_1A2C9D14C(*(void *)(v0 + 32), v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)));
}

uint64_t sub_1A2C9DEA0()
{
  return PresetApplicatorType.set<A>(_:to:)();
}

uint64_t PresetApplicatorType.set<A>(_:to:)()
{
  void (*v7)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  void *WitnessTable;
  void v11[4];
  uint64_t v12;

  OUTLINED_FUNCTION_0_4();
  uint64_t v2 = v1;
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB5A5340;
  uint64_t v12 = v0;
  uint64_t v6 = v2 + 88;
  uint64_t v4 = *(void *)(v2 + 88);
  uint64_t v5 = *(void *)(v6 + 8);
  uint64_t v7 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 32);
  swift_retain();
  v7(v11, v4, v5);
  uint64_t v8 = type metadata accessor for Setting();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C8FBFC((uint64_t)&v12, v11, v3, v8, WitnessTable);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return swift_release();
}

uint64_t sub_1A2C9DFC0()
{
  return PresetApplicatorType.reset<A>(_:)();
}

uint64_t PresetApplicatorType.reset<A>(_:)()
{
  OUTLINED_FUNCTION_0_4();
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1EB5A5340;
  uint64_t v5 = v0;
  uint64_t v2 = type metadata accessor for Setting();
  swift_retain();
  WitnessTable = (void *)swift_getWitnessTable();
  sub_1A2C97B2C((uint64_t)&v5, v1, v2, WitnessTable);
  return swift_release();
}

uint64_t dispatch thunk of PresetApplicatorType.set<A>(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of PresetApplicatorType.reset<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t If.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t)@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  uint64_t v5 = swift_retain();
  a3(v5);

  return swift_release();
}

uint64_t If.label.getter()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  uint64_t v1 = OUTLINED_FUNCTION_0_5();
  return v2(v1);
}

uint64_t If.cellStyle.getter()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t If.isEnabled.getter()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  uint64_t v1 = OUTLINED_FUNCTION_0_5();
  return v2(v1) & 1;
}

uint64_t If.isVisible.getter()
{
  return (*v0)() & 1;
}

uint64_t destroy for If(uint64_t a1)
{
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
}

uint64_t initializeWithCopy for If(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for If(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *__n128 result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for If(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for If(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
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

uint64_t storeEnumTagSinglePayload for If(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for If()
{
  return &type metadata for If;
}

uint64_t PresetItem.preset.getter()
{
  return swift_retain();
}

uint64_t PresetItem.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PresetItem.actions.getter()
{
  return swift_bridgeObjectRetain();
}

void *PresetItem.__allocating_init(_:label:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void *PresetItem.init(_:label:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t sub_1A2C9E740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = sub_1A2C9E7F4;
  *(void *)(a1 + 24) = v1;
  *(unsigned char *)(a1 + 80) = 8;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_1A2C9E794(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (qword_1EB5A4ED8 != -1) {
    swift_once();
  }
  return sub_1A2C96DCC(v1);
}

uint64_t sub_1A2C9E7F4()
{
  return sub_1A2C9E794(v0);
}

uint64_t PresetItem.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PresetItem.__deallocating_deinit()
{
  PresetItem.deinit();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1A2C9E860()
{
  return PresetItem.label.getter();
}

uint64_t sub_1A2C9E884@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2C9E740(a1);
}

uint64_t type metadata accessor for PresetItem()
{
  return self;
}

uint64_t method lookup function for PresetItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PresetItem);
}

uint64_t dispatch thunk of PresetItem.__allocating_init(_:label:actions:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PresetItem.cellStyle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of PresetItem.isEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t Configurable.isEnabled(_:with:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void (*v8)(uint64_t *__return_ptr, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  char v10;
  uint64_t v12;

  uint64_t v8 = *(void (**)(uint64_t *__return_ptr, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 8);
  int v9 = sub_1A2C958D4();
  v8(&v12, a1, &type metadata for FeatureState, v9, a3, a4);
  if (!(_BYTE)v12)
  {
    if (a2 != 2)
    {
      uint64_t v10 = a2 & 1;
      return v10 & 1;
    }
    if (*(unsigned char *)(a1 + 32))
    {
      if (*(unsigned char *)(a1 + 32) == 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = 1;
        return v10 & 1;
      }
    }
    else
    {
      OUTLINED_FUNCTION_0_6();
    }
    uint64_t v10 = sub_1A2CA7DF8();
    swift_bridgeObjectRelease();
    return v10 & 1;
  }
  uint64_t v10 = v12 == 1;
  return v10 & 1;
}

TeaSettings::FeatureState_optional __swiftcall FeatureState.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1A2CA7DC8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t FeatureState.rawValue.getter()
{
  uint64_t v1 = 0x64656C62616E65;
  if (*v0 != 1) {
    uint64_t v1 = 0x64656C6261736964;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746C7561666564;
  }
}

uint64_t sub_1A2C9EB14(unsigned __int8 *a1, char *a2)
{
  return sub_1A2C9EB20(*a1, *a2);
}

uint64_t sub_1A2C9EB20(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x746C7561666564;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x64656C62616E65;
    }
    else {
      uint64_t v4 = 0x64656C6261736964;
    }
    if (v3 == 1) {
      unint64_t v5 = 0xE700000000000000;
    }
    else {
      unint64_t v5 = 0xE800000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0xE700000000000000;
    uint64_t v4 = OUTLINED_FUNCTION_0_6();
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v2 = 0x64656C62616E65;
    }
    else {
      uint64_t v2 = 0x64656C6261736964;
    }
    if (a2 == 1) {
      unint64_t v6 = 0xE700000000000000;
    }
    else {
      unint64_t v6 = 0xE800000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v4 == v2 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1A2CA7DF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1A2C9EC20()
{
  return sub_1A2C9EC28();
}

uint64_t sub_1A2C9EC28()
{
  return sub_1A2C9ECD0();
}

uint64_t sub_1A2C9EC34()
{
  return sub_1A2C9EC3C();
}

uint64_t sub_1A2C9EC3C()
{
  sub_1A2CA7A88();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2C9ECC8()
{
  return sub_1A2C9ECD0();
}

uint64_t sub_1A2C9ECD0()
{
  return sub_1A2CA7E48();
}

TeaSettings::FeatureState_optional sub_1A2C9ED70(Swift::String *a1)
{
  return FeatureState.init(rawValue:)(*a1);
}

uint64_t sub_1A2C9ED7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FeatureState.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *storeEnumTagSinglePayload for FeatureState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2C9EE74);
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

uint64_t sub_1A2C9EE9C()
{
  uint64_t result = type metadata accessor for Option();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1A2C9EF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_1A2C9EFA4(a1, a2, a3);
  return v6;
}

void *sub_1A2C9EFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  v3[2] = a1;
  uint64_t v7 = (char *)v3 + *(void *)(v6 + 104);
  uint64_t v8 = type metadata accessor for Option();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  *(void *)((char *)v3 + *(void *)(*v3 + 112)) = a3;
  return v3;
}

#error "1A2C9F12C: call analysis failed (funcsize=86)"

uint64_t sub_1A2C9F1B8()
{
  swift_release();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v0 + *(void *)(v1 + 104);
  uint64_t v3 = type metadata accessor for Option();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2C9F260()
{
  sub_1A2C9F1B8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for OptionItem()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2C9F2D0()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *(void *)(v0 + *(void *)(v1 + 104));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1A2C9F314()
{
  OUTLINED_FUNCTION_2();
  *(void *)uint64_t v2 = *(void *)(v0 + *(void *)(v1 + 112));
  *(void *)(v2 + 8) = sub_1A2C9F4E4;
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = sub_1A2C9F4E8;
  *(void *)(v2 + 32) = v0;
  *(unsigned char *)(v2 + 80) = 1;
  swift_retain_n();

  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2C9F398(uint64_t result)
{
  if (result)
  {
    type metadata accessor for Option();
    return Updatable.save<A>(setting:value:)();
  }
  return result;
}

BOOL sub_1A2C9F420()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  BOOL v1 = sub_1A2C94454(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A2C9F474()
{
  return sub_1A2C9F2D0();
}

uint64_t sub_1A2C9F498()
{
  return sub_1A2C9F314();
}

BOOL sub_1A2C9F4BC()
{
  return sub_1A2C9F420();
}

uint64_t sub_1A2C9F4E8(uint64_t result)
{
  return sub_1A2C9F398(result);
}

uint64_t Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char *a5, uint64_t a6)
{
  char v6 = *a5;
  char v9 = *a4;
  char v8 = v6;
  return sub_1A2C9FBE0(a1, a2, a3, 0, &v9, &v8, a6);
}

uint64_t sub_1A2C9F530(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
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
  uint64_t v20 = sub_1A2CA7C38();
  if (!v20) {
    return sub_1A2CA7BB8();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_1A2CA7D48();
  uint64_t v38 = sub_1A2CA7D58();
  sub_1A2CA7D28();
  uint64_t v42 = a6;
  uint64_t result = sub_1A2CA7C28();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    v40 = (void (**)(char *))(v39 + 2);
    char v41 = v14;
    ++v39;
    while (1)
    {
      uint64_t v23 = (void (*)(char *, void))sub_1A2CA7C58();
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
      sub_1A2CA7D38();
      sub_1A2CA7C48();
      --v21;
      uint64_t v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        uint64_t v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_1A2CA7CC8();
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

void static Item.RangeControlType.slider.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

BOOL static Item.ResetBehavior.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  return OUTLINED_FUNCTION_7_1(*a1 ^ *a2);
}

uint64_t Item.ResetBehavior.hash(into:)()
{
  return sub_1A2CA7E38();
}

uint64_t Item.ResetBehavior.hashValue.getter()
{
  return sub_1A2CA7E48();
}

uint64_t sub_1A2C9FA44()
{
  return sub_1A2CA7E48();
}

uint64_t Item.setting.getter()
{
  return swift_retain();
}

uint64_t Item.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Item.actions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Item.isVisible.getter()
{
  return 1;
}

void sub_1A2C9FAC8(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 64);
  *(void *)a1 = *(void *)(v1 + 56);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t sub_1A2C9FADC()
{
  return *(unsigned __int8 *)(v0 + 65);
}

BOOL sub_1A2C9FAE4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A2C9FAF4()
{
  return sub_1A2CA7E38();
}

uint64_t sub_1A2C9FB1C()
{
  return sub_1A2CA7E48();
}

BOOL sub_1A2C9FB64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A2C9FAE4(*a1, *a2);
}

uint64_t sub_1A2C9FB78()
{
  return sub_1A2C9FB1C();
}

uint64_t sub_1A2C9FB88()
{
  return sub_1A2C9FAF4();
}

uint64_t sub_1A2C9FB98()
{
  return sub_1A2CA7E48();
}

uint64_t sub_1A2C9FBE0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char *a5, char *a6, uint64_t a7)
{
  char v13 = a4 & 1;
  uint64_t result = swift_allocObject();
  char v15 = *a5;
  char v16 = *a6;
  *(unsigned char *)(result + 48) = 1;
  *(void *)(result + 56) = 1065353216;
  *(_WORD *)(result + 64) = 128;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(unsigned char *)(result + 66) = v13;
  *(unsigned char *)(result + 50) = v15;
  *(unsigned char *)(result + 49) = v16;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = a7;
  return result;
}

void sub_1A2C9FC74(uint64_t *a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v79 = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = type metadata accessor for Trait();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (uint64_t *)((char *)&v78 - v9);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = v1[2];
  sub_1A2C949C8();
  switch(HIBYTE(v87))
  {
    case 1:
      uint64_t v28 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_6_2(v28, v29, (uint64_t)&protocol witness table for Item<A>, v30, v31, v32, v33, v34, v78, (uint64_t)v79, v80, v81, v82, v83, v84, v85, v86, v87, v88,
        v89);
      uint64_t v35 = OUTLINED_FUNCTION_1_4();
      v36(v35);
      uint64_t v37 = OUTLINED_FUNCTION_2_4();
      v38(v37);
      sub_1A2C97DCC(0, (unint64_t *)&qword_1EB5A49B0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
      if (!OUTLINED_FUNCTION_4_2()) {
        goto LABEL_10;
      }
      uint64_t v39 = v1[5];
      v40 = v79;
      *uint64_t v79 = v81;
      v40[1] = v39;
      v40[2] = (uint64_t)sub_1A2CA1EBC;
      v40[3] = v2;
      *((unsigned char *)v40 + 80) = 10;
      swift_retain();
      swift_bridgeObjectRetain();
      return;
    case 2:
      uint64_t v41 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_6_2(v41, v42, (uint64_t)&protocol witness table for Item<A>, v43, v44, v45, v46, v47, v78, (uint64_t)v79, v80, v81, v82, v83, v84, v85, v86, v87, v88,
        v89);
      uint64_t v48 = OUTLINED_FUNCTION_1_4();
      v49(v48);
      uint64_t v50 = OUTLINED_FUNCTION_2_4();
      v51(v50);
      if (!OUTLINED_FUNCTION_4_2()) {
        goto LABEL_10;
      }
      uint64_t v52 = v1[5];
      uint64_t v53 = v79;
      *(unsigned char *)uint64_t v79 = v81;
      v53[1] = v52;
      v53[2] = (uint64_t)sub_1A2CA2020;
      v53[3] = (uint64_t)v1;
      *((unsigned char *)v53 + 80) = 0;
      swift_bridgeObjectRetain();
      swift_retain();
      return;
    case 3:
      uint64_t v54 = MEMORY[0x1E4FBB550];
      uint64_t v55 = (float (*)(char *))sub_1A2CA0FE8;
      uint64_t v56 = sub_1A2CA0FF4;
      goto LABEL_16;
    case 4:
      uint64_t v54 = MEMORY[0x1E4FBC1C8];
      uint64_t v55 = (float (*)(char *))sub_1A2CA2B78;
      uint64_t v56 = sub_1A2CA0FF4;
      goto LABEL_16;
    case 5:
      uint64_t v54 = MEMORY[0x1E4FBB470];
      uint64_t v55 = (float (*)(char *))sub_1A2CA1E94;
      uint64_t v56 = sub_1A2CA1E9C;
      goto LABEL_16;
    case 6:
      uint64_t v54 = MEMORY[0x1E4FBB3D0];
      uint64_t v55 = (float (*)(char *))sub_1A2CA1E7C;
      uint64_t v56 = sub_1A2CA1E88;
LABEL_16:
      uint64_t v57 = v79;
      sub_1A2CA0FF8(v55, 0, (uint64_t)v56, 0, v54, v57);
      return;
    case 7:
      goto LABEL_10;
    default:
      uint64_t v13 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_6_2(v13, v14, (uint64_t)&protocol witness table for Item<A>, v15, v16, v17, v18, v19, v78, (uint64_t)v79, v80, v81, v82, v83, v84, v85, v86, v87, v88,
        v89);
      uint64_t v20 = OUTLINED_FUNCTION_1_4();
      v21(v20);
      uint64_t v22 = OUTLINED_FUNCTION_2_4();
      v23(v22);
      if (OUTLINED_FUNCTION_4_2())
      {
        uint64_t v25 = v81;
        uint64_t v24 = v82;
        uint64_t v26 = v12 + *(void *)(*(void *)v12 + 152);
        swift_beginAccess();
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(v10, v26, v5);
        if (swift_getEnumCaseMultiPayload())
        {
          if (*(unsigned char *)(v2 + 66))
          {
            swift_bridgeObjectRelease();
            double v27 = OUTLINED_FUNCTION_5_4();
            (*(void (**)(uint64_t *, uint64_t, double))(v7 + 8))(v10, v5, v27);
          }
          else
          {
            int v73 = *(unsigned __int8 *)(v2 + 65);
            uint64_t v74 = *(void *)(v2 + 40);
            char v75 = v79;
            *uint64_t v79 = v25;
            v75[1] = v24;
            v75[2] = v74;
            if (v73 == 1)
            {
              v75[3] = (uint64_t)sub_1A2CA1ECC;
              v75[4] = v2;
              char v76 = 3;
            }
            else
            {
              v75[3] = (uint64_t)sub_1A2CA1EC4;
              v75[4] = v2;
              char v76 = 2;
            }
            *((unsigned char *)v75 + 80) = v76;
            v77 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
            swift_retain();
            swift_bridgeObjectRetain();
            v77(v10, v5);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v81 = *v10;
          uint64_t v58 = v81;
          type metadata accessor for Option();
          uint64_t v59 = sub_1A2CA7C18();
          uint64_t v60 = type metadata accessor for OptionItem();
          uint64_t WitnessTable = swift_getWitnessTable();
          uint64_t v78 = sub_1A2C9F530((void (*)(char *, char *))sub_1A2CA1ED4, v2, v59, v60, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v62);
          uint64_t v81 = v58;
          MEMORY[0x1F4188790](v78);
          *(&v78 - 2) = v4;
          *(&v78 - 1) = v3;
          swift_getWitnessTable();
          uint64_t v63 = MEMORY[0x1E4FBB1A0];
          uint64_t v64 = sub_1A2CA7B18();
          swift_bridgeObjectRelease();
          uint64_t v81 = v64;
          sub_1A2C97DCC(0, (unint64_t *)&qword_1EB5A49B0, v63, MEMORY[0x1E4FBB320]);
          sub_1A2CA1F10();
          uint64_t v65 = sub_1A2CA7A38();
          uint64_t v67 = v66;
          swift_bridgeObjectRelease();
          sub_1A2C97DCC(0, &qword_1E959DF78, (uint64_t)&type metadata for Group, MEMORY[0x1E4FBBE00]);
          uint64_t v68 = swift_allocObject();
          *(_OWORD *)(v68 + 16) = xmmword_1A2CA83D0;
          sub_1A2CA1F84();
          uint64_t v69 = v78;
          uint64_t v70 = sub_1A2CA7D78();
          *(void *)(v68 + 32) = 0;
          *(void *)(v68 + 40) = 0;
          *(void *)(v68 + 48) = v65;
          *(void *)(v68 + 56) = v67;
          *(void *)(v68 + 64) = v70;
          uint64_t v71 = (void *)swift_allocObject();
          v71[2] = v4;
          v71[3] = v3;
          v71[4] = v69;
          uint64_t v72 = v79;
          *uint64_t v79 = v68;
          v72[1] = (uint64_t)sub_1A2CA2014;
          v72[2] = (uint64_t)v71;
          *((unsigned char *)v72 + 80) = 7;
        }
      }
      else
      {
LABEL_10:
        OUTLINED_FUNCTION_5_4();
      }
      return;
  }
}

uint64_t sub_1A2CA0384@<X0>(char a1@<W0>, unsigned char *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(*(void *)a2 + 80);
  uint64_t v7 = sub_1A2CA7C98();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v17 - v14;
  uint64_t v20 = MEMORY[0x1E4FBB390];
  v19[0] = a1;
  (*(void (**)(unsigned char *, uint64_t, void))(*(void *)(v5 + 88) + 24))(v19, v6, *(void *)(v5 + 88));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v6);
    type metadata accessor for Item();
    Updatable.save<A>(setting:value:)();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v6);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  *uint64_t v18 = a2[50];
  return result;
}

uint64_t sub_1A2CA0618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Option();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - v8;
  type metadata accessor for OptionItem();
  uint64_t v10 = *(void *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  *a3 = sub_1A2C9EF4C(v10, (uint64_t)v9, *(void *)(a2 + 40));
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2CA076C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Option() + 32));
  uint64_t result = *v3;
  if (v3[1])
  {
    sub_1A2CA7A98();
    uint64_t result = 547520738;
    unint64_t v5 = 0xA400000000000000;
  }
  else
  {
    unint64_t v5 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  return result;
}

double sub_1A2CA07E8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for OptionItem();
  sub_1A2CA7C18();
  swift_getWitnessTable();
  sub_1A2CA7B28();
  if (v4)
  {
    *(void *)(a1 + 24) = v2;
    *(void *)(a1 + 32) = &off_1EF5DC270;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1A2CA08B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *(void *)(*a3 + 80);
  uint64_t v7 = sub_1A2CA7C98();
  uint64_t v18 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v19 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v18 - v12;
  v20[3] = MEMORY[0x1E4FBB1A0];
  v20[0] = a1;
  v20[1] = a2;
  uint64_t v14 = *(void *)(v5 + 88);
  uint64_t v15 = *(void (**)(void *, uint64_t, uint64_t))(v14 + 24);
  swift_bridgeObjectRetain();
  v15(v20, v6, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
    uint64_t v16 = v19;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v13, v10, v6);
    type metadata accessor for Item();
    Updatable.save<A>(setting:value:)();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v13, v6);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v10, v7);
  }
}

uint64_t sub_1A2CA0B48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *(void *)(*a3 + 80);
  uint64_t v18 = sub_1A2CA7C98();
  uint64_t v7 = *(void *)(v18 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v18);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)&v17 - v12;
  v19[3] = MEMORY[0x1E4FBB1A0];
  v19[0] = a1;
  v19[1] = a2;
  uint64_t v14 = *(void *)(v5 + 88);
  uint64_t v15 = *(void (**)(void *, uint64_t, uint64_t))(v14 + 24);
  swift_bridgeObjectRetain();
  v15(v19, v6, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v18);
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, v6);
  type metadata accessor for Item();
  Updatable.save<A>(setting:value:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v6);
}

uint64_t sub_1A2CA0D88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(*a2 + 80);
  uint64_t v17 = sub_1A2CA7C98();
  uint64_t v5 = *(void *)(v17 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v17);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v16 - v10;
  sub_1A2C97DCC(0, (unint64_t *)&qword_1EB5A49B0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
  v18[3] = v12;
  v18[0] = a1;
  uint64_t v13 = *(void *)(v3 + 88);
  uint64_t v14 = *(void (**)(void *, uint64_t, uint64_t))(v13 + 24);
  swift_bridgeObjectRetain();
  v14(v18, v4, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v4) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, v4);
  type metadata accessor for Item();
  Updatable.save<A>(setting:value:)();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v4);
}

float sub_1A2CA0FE8(uint64_t *a1)
{
  return (float)*a1;
}

void *sub_1A2CA0FF8@<X0>(float (*a1)(char *)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  void (*v41)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (**v49)(char *, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t EnumCaseMultiPayload;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  char *v58;
  void (*v59)(char *, uint64_t);
  void *result;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t WitnessTable;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  long long v71;
  uint64_t *v72;
  uint64_t v73;
  char *v74;
  void (*v75)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (**v79)(char *, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t *v86;
  char *v87;
  char v88;
  float (*v89)(uint64_t);
  float v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  float v95;
  void (*v96)(uint64_t, uint64_t);
  void (*v97)(char *, uint64_t);
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  char v106;
  char *v107;
  uint64_t v108;
  float v109;
  char v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  char v114;
  void (*v115)(char *, uint64_t);
  float v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void (*v120)(uint64_t, uint64_t);
  char *v121;
  void (*v122)(char *, uint64_t);
  float (*v123)(uint64_t);
  float v124;
  uint64_t v125;
  float v126;
  float v127;
  void (*v128)(uint64_t, uint64_t);
  void (*v129)(char *, uint64_t);
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void (*v133)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  void (*v136)(char *, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  float (*v143)(char *);
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  char *v150;
  void (**v151)(char *, uint64_t, uint64_t);
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t *v156;
  char *v157;
  void v158[3];

  uint64_t v7 = (uint64_t)v6;
  v145 = a4;
  v144 = a3;
  v142 = a2;
  v143 = a1;
  v156 = a6;
  uint64_t v9 = *v6;
  uint64_t v10 = *(void *)(v9 + 80);
  uint64_t v11 = type metadata accessor for Trait();
  v151 = *(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
  v152 = v11;
  MEMORY[0x1F4188790](v11);
  v150 = (char *)&v133 - v12;
  uint64_t v13 = sub_1A2CA7C98();
  v153 = *(void *)(v13 - 8);
  v154 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  v139 = (uint64_t)&v133 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v141 = (uint64_t)&v133 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v157 = (char *)&v133 - v19;
  uint64_t v20 = *(void *)(v10 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  v147 = (char *)&v133 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v148 = (char *)&v133 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  double v27 = (char *)&v133 - v26;
  v149 = *(void *)(a5 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](v25);
  v138 = (uint64_t)&v133 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  v140 = (uint64_t)&v133 - v31;
  MEMORY[0x1F4188790](v30);
  v155 = (char *)&v133 - v32;
  uint64_t v33 = *(void *)(v7 + 16);
  uint64_t v34 = *(void *)(v9 + 88);
  uint64_t v35 = type metadata accessor for Item();
  Configurable.setting<A>(_:)(v33, v35, (uint64_t)&protocol witness table for Item<A>, v36, v37, v38, v39, v40, (uint64_t)v133, v134, v135, (uint64_t)v136, v137, v138, v139, v140, v141, v142, (uint64_t)v143,
    v144);
  uint64_t v41 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v34 + 32);
  v41(v158, v10, v34);
  uint64_t v42 = a5;
  v146 = v20;
  uint64_t v43 = v20 + 8;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v45 = v27;
  uint64_t v46 = (uint64_t)v157;
  v44(v45, v10);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload(v46, 1, 1, v42);
    double result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v153 + 8))(v46, v154);
    goto LABEL_10;
  }
  id v133 = v41;
  uint64_t v134 = v34 + 32;
  v137 = v34;
  uint64_t v136 = v44;
  uint64_t v135 = v43;
  __swift_storeEnumTagSinglePayload(v46, 0, 1, v42);
  uint64_t v47 = v149;
  uint64_t v48 = v149 + 32;
  uint64_t v49 = *(void (***)(char *, uint64_t, uint64_t))(v149 + 32);
  uint64_t v50 = v155;
  ((void (*)(char *, uint64_t, uint64_t))v49)(v155, v46, v42);
  uint64_t v51 = v33 + *(void *)(*(void *)v33 + 152);
  swift_beginAccess();
  uint64_t v52 = v150;
  v151[2](v150, v51, v152);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v158[0] = *v52;
    MEMORY[0x1F4188790](EnumCaseMultiPayload);
    *(&v133 - 2) = (void (*)(void *__return_ptr, uint64_t, uint64_t))v42;
    *(&v133 - 1) = (void (*)(void *__return_ptr, uint64_t, uint64_t))v7;
    type metadata accessor for Option();
    SEL v61 = sub_1A2CA7C18();
    uint64_t v62 = v137;
    uint64_t v63 = type metadata accessor for OptionItem();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v65 = v42;
    uint64_t v67 = sub_1A2C9F530((void (*)(char *, char *))sub_1A2CA2B10, (uint64_t)(&v133 - 4), v61, v63, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v66);
    swift_bridgeObjectRelease();
    sub_1A2C97DCC(0, &qword_1E959DF78, (uint64_t)&type metadata for Group, MEMORY[0x1E4FBBE00]);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_1A2CA83D0;
    sub_1A2CA1F84();
    uint64_t v69 = sub_1A2CA7D78();
    *(_OWORD *)(v68 + 32) = 0u;
    *(_OWORD *)(v68 + 48) = 0u;
    *(void *)(v68 + 64) = v69;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v155, v65);
    double result = (void *)swift_allocObject();
    result[2] = v10;
    result[3] = v65;
    result[4] = v62;
    result[5] = v67;
    uint64_t v70 = v156;
    *v156 = v68;
    v70[1] = (uint64_t)sub_1A2CA2B68;
    v70[2] = (uint64_t)result;
    *((unsigned char *)v70 + 80) = 7;
    return result;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (*(unsigned char *)(v7 + 66))
    {
      double result = (void *)(*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v50, v42);
      goto LABEL_10;
    }
    uint64_t v101 = v7;
    v102 = v50;
    uint64_t v103 = v47;
    uint64_t v104 = *(void *)(v101 + 56);
    v105 = v156;
    if (*(char *)(v101 + 64) < 0)
    {
      uint64_t v116 = v143(v50);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v50, v42);
      unsigned __int8 v117 = *(void *)(v101 + 40);
      uint64_t v118 = (void *)swift_allocObject();
      unsigned __int8 v119 = v144;
      v118[2] = v42;
      v118[3] = v119;
      v118[4] = v145;
      v118[5] = v101;
      *(float *)v105 = v116;
      *((_DWORD *)v105 + 1) = v104;
      v105[1] = 0x7F7FFFFF00000000;
      v105[2] = v117;
      v105[3] = (uint64_t)sub_1A2CA2B74;
      v105[4] = (uint64_t)v118;
      char v114 = 4;
    }
    else
    {
      v106 = *(unsigned char *)(v101 + 64);
      id v107 = v50;
      uint64_t v108 = v42;
      unint64_t v109 = v143(v107);
      unint64_t v110 = v106 & 1;
      if (v106) {
        uint64_t v104 = 0;
      }
      (*(void (**)(char *, uint64_t))(v103 + 8))(v102, v108);
      uint64_t v111 = *(void *)(v101 + 40);
      uint64_t v112 = (void *)swift_allocObject();
      unsigned __int8 v113 = v144;
      v112[2] = v108;
      v112[3] = v113;
      v112[4] = v145;
      v112[5] = v101;
      *(float *)v105 = v109;
      v105[1] = v104;
      *((unsigned char *)v105 + 16) = v110;
      *(uint64_t *)((char *)v105 + 20) = 0x7F7FFFFF00000000;
      v105[4] = v111;
      v105[5] = (uint64_t)sub_1A2CA2B74;
      v105[6] = (uint64_t)v112;
      char v114 = 5;
    }
    *((unsigned char *)v105 + 80) = v114;
    swift_retain();
    goto LABEL_26;
  }
  v157 = (char *)v42;
  uint64_t v54 = v10;
  uint64_t v55 = (char *)v52 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v146 + 32);
  uint64_t v57 = v148;
  v56(v148, (char *)v52, v10);
  uint64_t v58 = v147;
  v56(v147, v55, v10);
  if (*(unsigned char *)(v7 + 66))
  {
    uint64_t v59 = v136;
    v136(v58, v10);
    v59(v57, v10);
    double result = (void *)(*(uint64_t (**)(char *, char *))(v47 + 8))(v155, v157);
LABEL_10:
    uint64_t v71 = 0uLL;
    uint64_t v72 = v156;
LABEL_11:
    *((_OWORD *)v72 + 3) = v71;
    *((_OWORD *)v72 + 4) = v71;
    *((_OWORD *)v72 + 1) = v71;
    *((_OWORD *)v72 + 2) = v71;
    *(_OWORD *)uint64_t v72 = v71;
    *((unsigned char *)v72 + 80) = 12;
    return result;
  }
  v151 = v49;
  v152 = v48;
  v150 = (char *)v7;
  int v73 = v137;
  uint64_t v74 = v57;
  char v75 = v133;
  v133(v158, v54, v137);
  char v76 = v141;
  v77 = (uint64_t)v157;
  if ((swift_dynamicCast() & 1) == 0)
  {
    char v115 = v136;
    __swift_storeEnumTagSinglePayload(v76, 1, 1, v77);
    v115(v58, v54);
    v115(v74, v54);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v155, v77);
    double result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v153 + 8))(v76, v154);
LABEL_28:
    uint64_t v72 = v156;
    uint64_t v71 = 0uLL;
    goto LABEL_11;
  }
  __swift_storeEnumTagSinglePayload(v76, 0, 1, v77);
  uint64_t v78 = v76;
  uint64_t v79 = v151;
  ((void (*)(uint64_t, uint64_t, uint64_t))v151)(v140, v78, v77);
  v75(v158, v54, v73);
  uint64_t v80 = (uint64_t)v157;
  uint64_t v81 = v139;
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload(v81, 1, 1, v80);
    unsigned __int8 v120 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v120(v140, v80);
    uint64_t v121 = v58;
    uint64_t v122 = v136;
    v136(v121, v54);
    v122(v148, v54);
    v120((uint64_t)v155, v80);
    double result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v153 + 8))(v81, v154);
    goto LABEL_28;
  }
  uint64_t v82 = v47;
  __swift_storeEnumTagSinglePayload(v81, 0, 1, v80);
  uint64_t v83 = v138;
  ((void (*)(uint64_t, uint64_t, uint64_t))v79)(v138, v81, v80);
  uint64_t v84 = v150;
  uint64_t v85 = *((void *)v150 + 7);
  uint64_t v86 = v156;
  uint64_t v87 = v148;
  if ((v150[64] & 0x80000000) == 0)
  {
    uint64_t v88 = v150[64];
    uint64_t v89 = (float (*)(uint64_t))v143;
    v90 = v143(v155);
    LODWORD(v154) = v88 & 1;
    if (v88) {
      uint64_t v91 = 0;
    }
    else {
      uint64_t v91 = v85;
    }
    v153 = v91;
    uint64_t v92 = v83;
    uint64_t v93 = v140;
    uint64_t v94 = v89(v140);
    uint64_t v95 = v89(v92);
    uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
    v96(v92, v80);
    v96(v93, v80);
    uint64_t v97 = v136;
    v136(v147, v54);
    v97(v148, v54);
    v96((uint64_t)v155, v80);
    v98 = *((void *)v84 + 5);
    SEL v99 = (void *)swift_allocObject();
    uint64_t v100 = v144;
    v99[2] = v80;
    v99[3] = v100;
    v99[4] = v145;
    v99[5] = v84;
    *(float *)uint64_t v86 = v90;
    v86[1] = v153;
    *((unsigned char *)v86 + 16) = v154;
    *((float *)v86 + 5) = v94;
    *((float *)v86 + 6) = v95;
    v86[4] = v98;
    v86[5] = (uint64_t)sub_1A2CA2B74;
    v86[6] = (uint64_t)v99;
    *((unsigned char *)v86 + 80) = 5;
    swift_retain();
LABEL_26:
    swift_retain();
    return (void *)swift_bridgeObjectRetain();
  }
  unsigned __int8 v123 = (float (*)(uint64_t))v143;
  unsigned __int8 v124 = v143(v155);
  v154 = v85;
  uint64_t v125 = v140;
  uint64_t v126 = v123(v140);
  v127 = v123(v83);
  v128 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
  v128(v83, v80);
  v128(v125, v80);
  unsigned __int8 v129 = v136;
  v136(v147, v54);
  v129(v87, v54);
  v128((uint64_t)v155, v80);
  uint64_t v130 = *((void *)v84 + 5);
  char v131 = (void *)swift_allocObject();
  uint64_t v132 = v144;
  v131[2] = v80;
  v131[3] = v132;
  v131[4] = v145;
  v131[5] = v84;
  *(float *)uint64_t v86 = v124;
  *((_DWORD *)v86 + 1) = v154;
  *((float *)v86 + 2) = v126;
  *((float *)v86 + 3) = v127;
  v86[2] = v130;
  v86[3] = (uint64_t)sub_1A2CA2AF0;
  v86[4] = (uint64_t)v131;
  *((unsigned char *)v86 + 80) = 4;
  swift_bridgeObjectRetain();
  swift_retain();
  return (void *)swift_retain();
}

void sub_1A2CA1E38(void *a1@<X8>, float a2@<S0>)
{
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a2 < 9.2234e18)
  {
    *a1 = (uint64_t)a2;
    return;
  }
LABEL_7:
  __break(1u);
}

float sub_1A2CA1E7C(uint64_t a1)
{
  return *(double *)a1;
}

double sub_1A2CA1E88@<D0>(double *a1@<X8>, float a2@<S0>)
{
  double result = a2;
  *a1 = result;
  return result;
}

float sub_1A2CA1E94(uint64_t a1)
{
  return *(float *)a1;
}

void sub_1A2CA1E9C(float *a1@<X8>, float a2@<S0>)
{
  *a1 = a2;
}

uint64_t type metadata accessor for Item()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CA1EBC(uint64_t a1)
{
  return sub_1A2CA0D88(a1, v1);
}

uint64_t sub_1A2CA1EC4(uint64_t a1, uint64_t a2)
{
  return sub_1A2CA0B48(a1, a2, v2);
}

uint64_t sub_1A2CA1ECC(uint64_t a1, uint64_t a2)
{
  return sub_1A2CA08B0(a1, a2, v2);
}

uint64_t sub_1A2CA1ED4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CA0618(a1, v2, a2);
}

uint64_t sub_1A2CA1EF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CA076C(a1, a2);
}

unint64_t sub_1A2CA1F10()
{
  unint64_t result = qword_1E959DF70;
  if (!qword_1E959DF70)
  {
    sub_1A2C97DCC(255, (unint64_t *)&qword_1EB5A49B0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959DF70);
  }
  return result;
}

unint64_t sub_1A2CA1F84()
{
  unint64_t result = qword_1E959DEB8;
  if (!qword_1E959DEB8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E959DEB8);
  }
  return result;
}

uint64_t sub_1A2CA1FDC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

double sub_1A2CA2014@<D0>(uint64_t a1@<X8>)
{
  return sub_1A2CA07E8(a1);
}

uint64_t sub_1A2CA2020@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  return sub_1A2CA0384(a1, v2, a2);
}

uint64_t Item.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Item.__deallocating_deinit()
{
  Item.deinit();

  return MEMORY[0x1F4186488](v0, 67, 7);
}

uint64_t sub_1A2CA208C()
{
  return Item.label.getter();
}

void sub_1A2CA20B0(uint64_t *a1@<X8>)
{
}

uint64_t Item.reset()()
{
  if (*(unsigned char *)(v0 + 49)) {
    return MEMORY[0x1E4FBC860];
  }
  type metadata accessor for Item();
  Updatable.reset<A>(setting:)();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Item.ResetBehavior()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CA216C()
{
  return Item.reset()();
}

uint64_t Item<>.init(_:label:resetBehavior:type:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t *a5)
{
  uint64_t v5 = *a5;
  char v6 = *((unsigned char *)a5 + 8);
  char v9 = *a4;
  char v8 = 0;
  uint64_t result = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(a1, a2, a3, &v8, &v9, MEMORY[0x1E4FBC860]);
  *(void *)(result + 56) = v5;
  *(unsigned char *)(result + 64) = v6;
  return result;
}

uint64_t Item<>.init(_:label:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5)
{
  __int16 v6 = *a4;
  return sub_1A2C9FBE0(a1, a2, a3, 1, (char *)&v6 + 1, (char *)&v6, a5);
}

{
  uint64_t v9;

  char v9 = *a4;
  sub_1A2CA22A4();
  swift_allocObject();
  return sub_1A2C99838(a1, a2, a3, 0, 0, v9, a5);
}

void sub_1A2CA22A4()
{
  if (!qword_1E959DF80[0])
  {
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, qword_1E959DF80);
    }
  }
}

uint64_t Item<>.init(_:label:secure:changeBehavior:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7)
{
  uint64_t v12 = *a6;
  sub_1A2CA22A4();
  swift_allocObject();
  uint64_t result = sub_1A2C99838(a1, a2, a3, 0, 0, v12, a7);
  *(unsigned char *)(result + 65) = a4;
  return result;
}

uint64_t sub_1A2CA237C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CA2398()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Item(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Item);
}

uint64_t dispatch thunk of Item.isEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Item.cellStyle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_1A2CA2488(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7F && *(unsigned char *)(a1 + 9))
    {
      unsigned int v2 = *(_DWORD *)a1 + 126;
    }
    else
    {
      unsigned int v2 = (*(unsigned char *)(a1 + 8) & 0x7E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x7F;
      if (v2 >= 0x7E) {
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

uint64_t sub_1A2CA24D0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(unsigned char *)(result + 8) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_1A2CA2524(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_1A2CA2530(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_1A2CA2540(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 1 | (a2 << 7);
  return result;
}

uint64_t type metadata accessor for Item.RangeControlType()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CA256C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2CA258C(uint64_t result, int a2, int a3)
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

uint64_t sub_1A2CA25BC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2CA25D8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

uint64_t type metadata accessor for Item.RangeControlType.Precision()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_1A2CA2614(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A2CA26E0);
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

uint64_t type metadata accessor for Item.Context()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CA2720()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CA273C()
{
  return sub_1A2C9F05C() & 1;
}

double sub_1A2CA276C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for OptionItem();
  sub_1A2CA7C18();
  swift_getWitnessTable();
  sub_1A2CA7B28();
  if (v4)
  {
    *(void *)(a1 + 24) = v2;
    *(void *)(a1 + 32) = &off_1EF5DC270;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1A2CA283C(void (*a1)(float), float a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v8 = *a4;
  uint64_t v9 = *(void *)(*a4 + 80);
  uint64_t v10 = sub_1A2CA7C98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v22 = v11;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v22 - v18;
  v24[3] = a5;
  __swift_allocate_boxed_opaque_existential_0(v24);
  a1(a2);
  (*(void (**)(uint64_t *, uint64_t, void))(*(void *)(v8 + 88) + 24))(v24, v9, *(void *)(v8 + 88));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v9);
    uint64_t v20 = v23;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v19, v15, v9);
    type metadata accessor for Item();
    Updatable.save<A>(setting:value:)();
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v19, v9);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v10);
  }
}

uint64_t objectdestroy_24Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1A2CA2AF0(float a1)
{
  return sub_1A2CA283C(*(void (**)(float))(v1 + 24), a1, *(void *)(v1 + 32), *(uint64_t **)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t sub_1A2CA2B10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CA0618(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_1A2CA2B30()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

double sub_1A2CA2B68@<D0>(uint64_t a1@<X8>)
{
  return sub_1A2CA276C(a1);
}

uint64_t sub_1A2CA2B7C()
{
  type metadata accessor for SettingAction();
  uint64_t v0 = (void *)swift_allocObject();
  uint64_t v1 = MEMORY[0x1E4FBC860];
  v0[2] = 0x7070615F6C6C696BLL;
  v0[3] = 0xE800000000000000;
  v0[5] = 0;
  v0[6] = 0;
  v0[4] = v1;
  sub_1A2CA2F60();
  uint64_t result = swift_release();
  qword_1E959E208 = (uint64_t)v0;
  return result;
}

void *SettingAction.__allocating_init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x1E4FBC860];
  result[2] = a1;
  result[3] = a2;
  result[4] = v9;
  result[5] = a3;
  result[6] = a4;
  return result;
}

uint64_t static SettingActions.restart.getter()
{
  if (qword_1E959DE80 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t SettingActions.deinit()
{
  return v0;
}

uint64_t SettingActions.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t static SettingAction.PostInstruction.== infix(_:_:)()
{
  return 1;
}

uint64_t SettingAction.PostInstruction.hash(into:)()
{
  return sub_1A2CA7E38();
}

uint64_t SettingAction.PostInstruction.hashValue.getter()
{
  return sub_1A2CA7E48();
}

uint64_t sub_1A2CA2D30()
{
  return SettingAction.PostInstruction.hashValue.getter();
}

uint64_t sub_1A2CA2D48()
{
  return SettingAction.PostInstruction.hash(into:)();
}

uint64_t sub_1A2CA2D60()
{
  return sub_1A2CA7E48();
}

uint64_t SettingAction.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2CA2DD0()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_1A2CA2E34(v0);
}

uint64_t sub_1A2CA2DFC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2CA2E34(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A2CA2E7C())()
{
  return j__swift_endAccess;
}

void *SettingAction.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = MEMORY[0x1E4FBC860];
  _OWORD v4[2] = a1;
  v4[3] = a2;
  v4[4] = v5;
  v4[5] = a3;
  v4[6] = a4;
  return v4;
}

uint64_t sub_1A2CA2EF0()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, _UNKNOWN **))(v0 + 40);
  if (v1)
  {
    if (qword_1EB5A4ED8 != -1) {
      swift_once();
    }
    return v1(qword_1EB5A5340, &off_1EF5DC168);
  }
  return result;
}

uint64_t sub_1A2CA2F60()
{
  swift_beginAccess();
  sub_1A2CA3134();
  uint64_t v1 = *(char **)(*(void *)(v0 + 32) + 16);
  sub_1A2CA3180(v1);
  *(void *)(*(void *)(v0 + 32) + 16) = v1 + 1;
  return swift_retain();
}

uint64_t sub_1A2CA2FD0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 40);

  return sub_1A2CA31C0(v1);
}

uint64_t SettingAction.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A2CA31C0(*(void *)(v0 + 40));
  return v0;
}

uint64_t SettingAction.__deallocating_deinit()
{
  SettingAction.deinit();

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1A2CA306C()
{
  return SettingAction.identifier.getter();
}

uint64_t static SettingAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
    return 1;
  }
  else {
    return sub_1A2CA7DF8();
  }
}

uint64_t sub_1A2CA30C0(uint64_t *a1, uint64_t *a2)
{
  return static SettingAction.== infix(_:_:)(*a1, *a2) & 1;
}

char *sub_1A2CA30E4(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[40 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_7(a3, result);
  }
  return result;
}

char *sub_1A2CA310C(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[56 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_7(a3, result);
  }
  return result;
}

char *sub_1A2CA3134()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_1A2CA34DC(result, *((void *)v1 + 2) + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

char *sub_1A2CA3180(char *result)
{
  unint64_t v2 = *((void *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_1A2CA34DC((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_1A2CA31C0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_1A2CA31D4()
{
  unint64_t result = qword_1E959E210;
  if (!qword_1E959E210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959E210);
  }
  return result;
}

uint64_t sub_1A2CA3220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A2CA2DFC();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for SettingActions()
{
  return self;
}

uint64_t method lookup function for SettingActions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SettingActions);
}

uint64_t type metadata accessor for SettingAction()
{
  return self;
}

uint64_t method lookup function for SettingAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SettingAction);
}

uint64_t dispatch thunk of SettingAction.postInstructions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SettingAction.postInstructions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SettingAction.postInstructions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SettingAction.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SettingAction.perform()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SettingAction.then(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t getEnumTagSinglePayload for SettingAction.PostInstruction(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingAction.PostInstruction(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A2CA3480);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CA34A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for SettingAction.PostInstruction()
{
  return &type metadata for SettingAction.PostInstruction;
}

void *sub_1A2CA34C0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1A2C92364(a1, a2, a3, a4, &qword_1E959DEB0, (unint64_t *)&qword_1E959DEB8);
}

char *sub_1A2CA34DC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1A2CA36F0(0, &qword_1E959E218);
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
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A2CA35D4(char *result, int64_t a2, char a3, char *a4)
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
    sub_1A2CA36F0(0, &qword_1E959DF78);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1A2CA36F0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1A2CA7DD8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t Updater.deinit()
{
  return v0;
}

uint64_t Updater.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t method lookup function for Updater(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Updater);
}

uint64_t PresetManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  PresetManager.init()();
  return v0;
}

Swift::Void __swiftcall PresetManager.register(_:presets:)(Swift::String _, Swift::OpaquePointer presets)
{
  object = _._object;
  uint64_t countAndFlagsBits = _._countAndFlagsBits;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_1A2CA39FC(v4, countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
  swift_bridgeObjectRelease();
}

uint64_t PresetManager.deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PresetManager.__deallocating_deinit()
{
  PresetManager.deinit();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

void sub_1A2CA387C(uint64_t a1, uint64_t a2, Swift::OpaquePointer a3)
{
}

unint64_t sub_1A2CA38A0(uint64_t a1, uint64_t a2)
{
  sub_1A2CA7E28();
  sub_1A2CA7A88();
  uint64_t v4 = sub_1A2CA7E48();

  return sub_1A2CA3918(a1, a2, v4);
}

unint64_t sub_1A2CA3918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A2CA7DF8() & 1) == 0)
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
      while (!v14 && (sub_1A2CA7DF8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A2CA39FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1A2CA3AE0(a1, a2, a3);
  uint64_t *v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of PresetManagerType.register(_:presets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PresetManagerType.apply(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for PresetManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PresetManager);
}

uint64_t dispatch thunk of PresetManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1A2CA3AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1A2CA38A0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_1A2CA3C04();
  if ((sub_1A2CA7D88() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1A2CA38A0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_1A2CA7E18();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1A2CA3C6C(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1A2CA3C04()
{
  if (!qword_1E959E220)
  {
    sub_1A2C95140();
    unint64_t v0 = sub_1A2CA7D98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959E220);
    }
  }
}

unint64_t sub_1A2CA3C6C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

uint64_t SettingsBundle.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingsBundle.cellStyle.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CA3CF0(v1 + 16, a1);
}

uint64_t sub_1A2CA3CF0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t SettingsBundle.isEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 97);
}

uint64_t SettingsBundle.isVisible.getter()
{
  return *(unsigned __int8 *)(v0 + 98);
}

uint64_t SettingsBundle.init(title:layout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(unsigned char *)(a4 + 98) = 1;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  *(void *)(a4 + 24) = sub_1A2CA3D94;
  *(void *)(a4 + 32) = 0;
  *(_WORD *)(a4 + 96) = 263;
  *(void *)(a4 + 104) = a3;
  return swift_bridgeObjectRetain();
}

double sub_1A2CA3D94@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t SettingsBundle.callAsFunction(title:additionalGroups:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v10 = *(void *)(v4 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A2C99750(a3);
  *(unsigned char *)(a4 + 98) = 1;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = v10;
  *(void *)(a4 + 24) = sub_1A2CA3D94;
  *(void *)(a4 + 32) = 0;
  *(_WORD *)(a4 + 96) = 263;
  *(void *)(a4 + 104) = v10;

  return swift_bridgeObjectRetain();
}

uint64_t destroy for SettingsBundle(uint64_t a1)
{
  swift_bridgeObjectRelease();
  switch(*(unsigned char *)(a1 + 96))
  {
    case 0:
    case 4:
    case 5:
    case 7:
    case 8:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 2:
    case 3:
    case 0xA:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 6:
      swift_bridgeObjectRelease();
      break;
    case 9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_8:
      swift_release();
      break;
    case 0xB:
      __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
      break;
    default:
      break;
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SettingsBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (void *)(a2 + 16);
  int v6 = *(unsigned __int8 *)(a2 + 96);
  swift_bridgeObjectRetain();
  switch(v6)
  {
    case 0:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v7 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v7;
      *(unsigned char *)(a1 + 96) = 0;
      goto LABEL_15;
    case 1:
      uint64_t v8 = *(void *)(a2 + 48);
      long long v9 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(a1 + 32) = v9;
      *(void *)(a1 + 48) = v8;
      *(unsigned char *)(a1 + 96) = 1;
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_16;
    case 2:
      uint64_t v10 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v10;
      uint64_t v11 = *(void *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v11;
      char v12 = 2;
      goto LABEL_14;
    case 3:
      uint64_t v13 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v13;
      uint64_t v14 = *(void *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v14;
      char v12 = 3;
      goto LABEL_14;
    case 4:
      uint64_t v15 = *(void *)(a2 + 48);
      long long v16 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(a1 + 32) = v16;
      *(void *)(a1 + 48) = v15;
      *(unsigned char *)(a1 + 96) = 4;
      goto LABEL_15;
    case 5:
      *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 36) = *(void *)(a2 + 36);
      uint64_t v17 = *(void *)(a2 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(unsigned char *)(a1 + 96) = 5;
      *(void *)(a1 + 64) = v17;
      goto LABEL_15;
    case 6:
      *(void *)(a1 + 16) = *v5;
      *(unsigned char *)(a1 + 96) = 6;
      swift_bridgeObjectRetain();
      break;
    case 7:
      uint64_t v18 = *(void *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(void *)(a1 + 32) = v18;
      char v19 = 7;
      goto LABEL_11;
    case 8:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v20 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v20;
      char v19 = 8;
LABEL_11:
      *(unsigned char *)(a1 + 96) = v19;
      goto LABEL_15;
    case 9:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v21 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v21;
      uint64_t v22 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v22;
      uint64_t v23 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v23;
      uint64_t v24 = *(void *)(a2 + 88);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)(a1 + 88) = v24;
      *(unsigned char *)(a1 + 96) = 9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_16;
    case 10:
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v25 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v25;
      char v12 = 10;
LABEL_14:
      *(unsigned char *)(a1 + 96) = v12;
      swift_bridgeObjectRetain();
LABEL_15:
      swift_bridgeObjectRetain();
LABEL_16:
      swift_retain();
      break;
    case 11:
      long long v27 = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 40) = v27;
      (**(void (***)(uint64_t, void *))(v27 - 8))(a1 + 16, v5);
      *(unsigned char *)(a1 + 96) = 11;
      break;
    default:
      memcpy((void *)(a1 + 16), v5, 0x51uLL);
      break;
  }
  *(_WORD *)(a1 + 97) = *(_WORD *)(a2 + 97);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SettingsBundle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_1A2CA4628(a1 + 16);
    switch(*(unsigned char *)(a2 + 96))
    {
      case 0:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v4 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v4;
        *(unsigned char *)(a1 + 96) = 0;
        goto LABEL_14;
      case 1:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v5 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = v5;
        uint64_t v6 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v6;
        *(unsigned char *)(a1 + 96) = 1;
        swift_bridgeObjectRetain();
        swift_retain();
        goto LABEL_18;
      case 2:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v7 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v7;
        char v8 = 2;
        goto LABEL_17;
      case 3:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v9 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v9;
        char v8 = 3;
        goto LABEL_17;
      case 4:
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v10 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v10;
        char v11 = 4;
        goto LABEL_13;
      case 5:
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        uint64_t v12 = *(void *)(a2 + 24);
        *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
        *(void *)(a1 + 24) = v12;
        *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
        *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        uint64_t v13 = *(void *)(a2 + 64);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = v13;
        char v11 = 5;
        goto LABEL_13;
      case 6:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 96) = 6;
        swift_bridgeObjectRetain();
        break;
      case 7:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v14 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = v14;
        char v11 = 7;
        goto LABEL_13;
      case 8:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v15 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v15;
        char v11 = 8;
LABEL_13:
        *(unsigned char *)(a1 + 96) = v11;
LABEL_14:
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 9:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        uint64_t v16 = *(void *)(a2 + 88);
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = v16;
        *(unsigned char *)(a1 + 96) = 9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 0xA:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v17 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v17;
        char v8 = 10;
LABEL_17:
        *(unsigned char *)(a1 + 96) = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_18:
        swift_retain();
        break;
      case 0xB:
        uint64_t v19 = *(void *)(a2 + 40);
        *(void *)(a1 + 40) = v19;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 16, a2 + 16);
        *(unsigned char *)(a1 + 96) = 11;
        break;
      default:
        memcpy((void *)(a1 + 16), (const void *)(a2 + 16), 0x51uLL);
        break;
    }
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A2CA4628(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for SettingsBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_1A2CA4628(a1 + 16);
    memcpy((void *)(a1 + 16), (const void *)(a2 + 16), 0x51uLL);
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsBundle(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsBundle(uint64_t result, int a2, int a3)
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
    *(void *)double result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SettingsBundle()
{
  return &type metadata for SettingsBundle;
}

uint64_t PresetStartupTask.__allocating_init(presetManager:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1A2C9250C(a1, v2 + 16);
  return v2;
}

uint64_t PresetStartupTask.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t PresetStartupTask.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t method lookup function for PresetStartupTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PresetStartupTask);
}

uint64_t dispatch thunk of PresetStartupTask.__allocating_init(presetManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PresetStartupTask.run(launchOptions:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

void *FeatureFlags.items.getter()
{
  unint64_t v1 = *(void *)(v0 + 16);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (void *)MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1A2CA7DA8();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v18 = MEMORY[0x1E4FBC860];
  double result = sub_1A2C998C8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v18;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x1A623E110](v4, v1);
        sub_1A2C945B0(v6 + 16, (uint64_t)v15);
        swift_unknownObjectRelease();
      }
      else
      {
        sub_1A2C945B0(*(void *)(v1 + 8 * v4 + 32) + 16, (uint64_t)v15);
      }
      uint64_t v18 = v5;
      unint64_t v8 = *(void *)(v5 + 16);
      unint64_t v7 = *(void *)(v5 + 24);
      if (v8 >= v7 >> 1) {
        sub_1A2C998C8((void *)(v7 > 1), v8 + 1, 1);
      }
      ++v4;
      uint64_t v9 = v16;
      uint64_t v10 = v17;
      uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
      MEMORY[0x1F4188790](v11);
      uint64_t v13 = &v15[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(unsigned char *))(v14 + 16))(v13);
      sub_1A2C99D08(v8, (uint64_t)v13, &v18, v9, v10);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
      uint64_t v5 = v18;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return (void *)v5;
  }
  __break(1u);
  return result;
}

uint64_t FeatureFlags.__allocating_init(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t FeatureFlags.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t FeatureFlags.enableAllItem(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = type metadata accessor for FeatureFlags.EnableAllItem();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1A2CA4F9C(a1, a2, v7);
  a3[3] = v8;
  a3[4] = (uint64_t)&off_1EF5DC360;
  *a3 = result;
  return result;
}

uint64_t FeatureFlags.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeatureFlags.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_1();

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A2CA4BD8@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  unint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_1A2CA4D0C(v3, v1);
  swift_bridgeObjectRelease();
  sub_1A2CA5CF8();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A2CA92E0;
  if (qword_1E959DE80 != -1) {
    swift_once();
  }
  *(void *)(v5 + 32) = qword_1E959E208;
  sub_1A2CA7B88();
  uint64_t v6 = v5;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  *(unsigned char *)a1 = v4 & 1;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = sub_1A2CA6A04;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 80) = 0;

  return swift_retain();
}

uint64_t sub_1A2CA4D0C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1A2CA7DA8())
  {
    uint64_t v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x1A623E110](v5 - 4, a1);
      }
      else
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5);
        swift_retain();
      }
      uint64_t v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      char v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **))(v6 + 56))(a2, &off_1EF5DC338);
      swift_release();
      if (v8)
      {
        ++v5;
        if (v7 != v4) {
          continue;
        }
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  char v8 = 1;
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1A2CA4E28@<X0>(char a1@<W0>, char *a2@<X8>)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result)
  {
    char v11 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = result;
  uint64_t v12 = a2;
  unint64_t v6 = *(void *)(result + 16);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v7) {
      goto LABEL_4;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    uint64_t result = swift_release();
    char v11 = 1;
    a2 = v12;
LABEL_12:
    *a2 = v11;
    return result;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1A2CA7DA8();
  uint64_t v7 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_4:
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = MEMORY[0x1A623E110](v8, v6);
      }
      else
      {
        uint64_t v9 = *(void *)(v6 + 8 * v8 + 32);
        swift_retain();
      }
      ++v8;
      uint64_t v10 = *(void (**)(void, uint64_t, _UNKNOWN **))(v9 + 72);
      swift_retain();
      v10(a1 & 1, v5, &off_1EF5DC388);
      swift_release();
      swift_release();
    }
    while (v7 != v8);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2CA4F9C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 16) = a3;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1A2CA7DA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(unsigned char *)(v3 + 40) = v4 != 0;
  return v3;
}

uint64_t sub_1A2CA5018()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2CA5040()
{
  uint64_t v0 = sub_1A2CA5018();

  return MEMORY[0x1F4186488](v0, 41, 7);
}

uint64_t sub_1A2CA5070()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2CA50A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CA4BD8(a1);
}

uint64_t sub_1A2CA50C8()
{
  return *(unsigned __int8 *)(*(void *)v0 + 40);
}

uint64_t FeatureFlag.item.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2C945B0(v1 + 16, a1);
}

uint64_t FeatureFlag.__allocating_init(_:label:invertValue:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = OUTLINED_FUNCTION_0_8();
  FeatureFlag.init(_:label:invertValue:)(a1, a2, a3, a4);
  return v8;
}

void *FeatureFlag.init(_:label:invertValue:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  sub_1A2CA5CF8();
  uint64_t v8 = OUTLINED_FUNCTION_1_5();
  *(_OWORD *)(v8 + 16) = xmmword_1A2CA92E0;
  uint64_t v9 = qword_1E959DE80;
  swift_retain();
  if (v9 != -1) {
    swift_once();
  }
  *(void *)(v8 + 32) = qword_1E959E208;
  sub_1A2CA7B88();
  sub_1A2C99DF0();
  uint64_t v11 = v10;
  swift_allocObject();
  OUTLINED_FUNCTION_4_3();
  uint64_t v19 = sub_1A2C99838(v12, v13, v14, v15, v16, v17, v18);
  v5[5] = v11;
  v5[6] = &protocol witness table for Item<A>;
  v5[2] = v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(unsigned char *)(v20 + 24) = a4 & 1;
  v5[7] = sub_1A2CA5D80;
  v5[8] = v20;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(unsigned char *)(v21 + 24) = a4 & 1;
  v5[9] = sub_1A2CA5D8C;
  v5[10] = v21;
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t sub_1A2CA52CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void, _UNKNOWN **, uint64_t, uint64_t))(a2 + 8))(&v9, a3, MEMORY[0x1E4FBB390], &protocol witness table for Bool, ObjectType, a2);
  return (v9 ^ a4) & 1;
}

uint64_t sub_1A2CA5350(char a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v7 = a1 ^ a5;
  uint64_t ObjectType = swift_getObjectType();
  char v10 = v7;
  return (*(uint64_t (**)(uint64_t, char *, void, _UNKNOWN **, uint64_t, uint64_t))(a3 + 16))(a4, &v10, MEMORY[0x1E4FBB390], &protocol witness table for Bool, ObjectType, a3);
}

uint64_t FeatureFlag.__allocating_init(_:label:)()
{
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = OUTLINED_FUNCTION_3_4();
  FeatureFlag.init(_:label:)(v1);
  return v0;
}

{
  uint64_t v0;
  long long *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = (long long *)OUTLINED_FUNCTION_3_4();
  FeatureFlag.init(_:label:)(v1, v2, v3);
  return v0;
}

void *FeatureFlag.init(_:label:)(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1A2CA5CF8();
  uint64_t v4 = OUTLINED_FUNCTION_1_5();
  *(_OWORD *)(v4 + 16) = xmmword_1A2CA92E0;
  uint64_t v5 = qword_1E959DE80;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  *(void *)(v4 + 32) = qword_1E959E208;
  sub_1A2CA7B88();
  sub_1A2CA5D98();
  uint64_t v7 = v6;
  swift_allocObject();
  OUTLINED_FUNCTION_4_3();
  uint64_t v15 = sub_1A2C99838(v8, v9, v10, v11, v12, v13, v14);
  v2[5] = v7;
  void v2[6] = &protocol witness table for Item<A>;
  v2[2] = v15;
  v2[7] = sub_1A2CA5DF4;
  v2[8] = a1;
  v2[9] = sub_1A2CA5DFC;
  v2[10] = a1;
  swift_retain();
  swift_retain();
  return v2;
}

uint64_t sub_1A2CA5548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return Configurable.isEnabled(_:with:)(a3, 2, ObjectType, a2) & 1;
}

uint64_t sub_1A2CA5598(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    char v6 = 1;
  }
  else {
    char v6 = 2;
  }
  uint64_t ObjectType = swift_getObjectType();
  char v11 = v6;
  uint64_t v8 = *(uint64_t (**)(uint64_t, char *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a3 + 16);
  unint64_t v9 = sub_1A2C958D4();
  return v8(a4, &v11, &type metadata for FeatureState, v9, ObjectType, a3);
}

uint64_t FeatureFlag.__allocating_init<A>(_:label:isEnabled:setEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = OUTLINED_FUNCTION_0_8();
  FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

void *FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v13 = type metadata accessor for Item();
  sub_1A2CA5CF8();
  uint64_t v14 = OUTLINED_FUNCTION_1_5();
  *(_OWORD *)(v14 + 16) = xmmword_1A2CA92E0;
  uint64_t v15 = qword_1E959DE80;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  *(void *)(v14 + 32) = qword_1E959E208;
  uint64_t v26 = v14;
  sub_1A2CA7B88();
  sub_1A2C96A80(&v25);
  char v24 = v25;
  char v23 = 0;
  uint64_t v16 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(a1, a2, a3, &v24, &v23, v14);
  v8[5] = v13;
  v8[6] = &protocol witness table for Item<A>;
  v8[2] = v16;
  uint64_t v17 = (void *)OUTLINED_FUNCTION_1_5();
  void v17[2] = a4;
  v17[3] = a5;
  v17[4] = a1;
  v8[7] = sub_1A2CA5E44;
  v8[8] = v17;
  uint64_t v18 = (void *)OUTLINED_FUNCTION_1_5();
  v18[2] = a1;
  v18[3] = a6;
  void v18[4] = a7;
  v8[9] = sub_1A2CA5E90;
  v8[10] = v18;
  swift_retain();
  swift_retain();
  return v8;
}

uint64_t sub_1A2CA5870(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *), uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a5;
  uint64_t v8 = *a5;
  uint64_t v9 = *(void *)(*a5 + 88);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *, uint64_t, void, uint64_t, uint64_t))(a2 + 8))(v5, v9, *(void *)(v8 + 96), ObjectType, a2);
  LOBYTE(v5) = a3(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v5 & 1;
}

uint64_t sub_1A2CA59B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v16 = a5;
  uint64_t v8 = *a4;
  uint64_t v9 = *(void *)(*a4 + 88);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t ObjectType = swift_getObjectType();
  v16(a1);
  (*(void (**)(uint64_t *, char *, uint64_t, void, uint64_t, uint64_t))(a3 + 16))(a4, v12, v9, *(void *)(v8 + 96), ObjectType, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void *FeatureFlag.init(_:label:)(long long *a1, uint64_t a2, uint64_t a3)
{
  v3[5] = &type metadata for FeatureFlag.FeatureFlagItem;
  v3[6] = &off_1EF5DD988;
  uint64_t v7 = swift_allocObject();
  v3[2] = v7;
  sub_1A2C945B0((uint64_t)a1, v7 + 32);
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  *(_WORD *)(v7 + 112) = 267;
  sub_1A2C9250C(a1, (uint64_t)v10);
  uint64_t v8 = swift_allocObject();
  sub_1A2C9250C(v10, v8 + 16);
  v3[7] = sub_1A2CA600C;
  v3[8] = v8;
  v3[9] = nullsub_1;
  v3[10] = 0;
  return v3;
}

uint64_t sub_1A2CA5C2C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2CA5C5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CA3CF0(v1 + 16, a1);
}

uint64_t sub_1A2CA5C68()
{
  return *(unsigned __int8 *)(v0 + 97);
}

uint64_t FeatureFlag.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t FeatureFlag.__deallocating_deinit()
{
  FeatureFlag.deinit();

  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t type metadata accessor for FeatureFlags.EnableAllItem()
{
  return self;
}

void sub_1A2CA5CF8()
{
  if (!qword_1EB5A4BB8)
  {
    unint64_t v0 = sub_1A2CA7DD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A4BB8);
    }
  }
}

uint64_t sub_1A2CA5D48()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 25, 7);
}

uint64_t sub_1A2CA5D80(uint64_t a1, uint64_t a2)
{
  return sub_1A2CA52CC(a1, a2, *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24));
}

uint64_t sub_1A2CA5D8C(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CA5350(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24));
}

void sub_1A2CA5D98()
{
  if (!qword_1E959E228)
  {
    sub_1A2C958D4();
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959E228);
    }
  }
}

uint64_t sub_1A2CA5DF4(uint64_t a1, uint64_t a2)
{
  return sub_1A2CA5548(a1, a2, v2);
}

uint64_t sub_1A2CA5DFC(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CA5598(a1, a2, a3, v3);
}

uint64_t sub_1A2CA5E04()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2CA5E44(uint64_t a1, uint64_t a2)
{
  return sub_1A2CA5870(a1, a2, *(uint64_t (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(uint64_t **)(v2 + 32));
}

uint64_t sub_1A2CA5E50()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2CA5E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CA59B4(a1, a2, a3, *(uint64_t **)(v3 + 16), *(void (**)(uint64_t))(v3 + 24));
}

uint64_t sub_1A2CA5E9C()
{
  swift_bridgeObjectRelease();
  switch(*(unsigned char *)(v0 + 112))
  {
    case 0:
    case 4:
    case 5:
    case 7:
    case 8:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 2:
    case 3:
    case 0xA:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 6:
      swift_bridgeObjectRelease();
      break;
    case 9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_8:
      swift_release();
      break;
    case 0xB:
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
      break;
    default:
      break;
  }

  return MEMORY[0x1F4186498](v0, 114, 7);
}

uint64_t sub_1A2CA5FD4()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A2CA600C()
{
  return MEMORY[0x1F4119150](v0 + 16);
}

uint64_t type metadata accessor for FeatureFlags()
{
  return self;
}

uint64_t method lookup function for FeatureFlags(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FeatureFlags);
}

uint64_t dispatch thunk of FeatureFlags.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for FeatureFlag()
{
  return self;
}

uint64_t method lookup function for FeatureFlag(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FeatureFlag);
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init(_:label:invertValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init(_:label:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init<A>(_:label:isEnabled:setEnabled:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t destroy for FeatureFlag.FeatureFlagItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = a1 + 16;
  switch(*(unsigned char *)(a1 + 96))
  {
    case 0:
    case 4:
    case 5:
    case 7:
    case 8:
      goto LABEL_9;
    case 1:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_10;
    case 2:
    case 3:
    case 0xA:
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 6:
      return swift_bridgeObjectRelease();
    case 9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t result = swift_release();
      break;
    case 0xB:
      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(result);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for FeatureFlag.FeatureFlagItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (void *)(a2 + 16);
  int v6 = *(unsigned __int8 *)(a2 + 96);
  swift_bridgeObjectRetain();
  switch(v6)
  {
    case 0:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v7 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v7;
      *(unsigned char *)(a1 + 96) = 0;
      goto LABEL_15;
    case 1:
      uint64_t v8 = *(void *)(a2 + 48);
      long long v9 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(a1 + 32) = v9;
      *(void *)(a1 + 48) = v8;
      *(unsigned char *)(a1 + 96) = 1;
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_16;
    case 2:
      uint64_t v10 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v10;
      uint64_t v11 = *(void *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v11;
      char v12 = 2;
      goto LABEL_14;
    case 3:
      uint64_t v13 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v13;
      uint64_t v14 = *(void *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v14;
      char v12 = 3;
      goto LABEL_14;
    case 4:
      uint64_t v15 = *(void *)(a2 + 48);
      long long v16 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(a1 + 32) = v16;
      *(void *)(a1 + 48) = v15;
      *(unsigned char *)(a1 + 96) = 4;
      goto LABEL_15;
    case 5:
      *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 36) = *(void *)(a2 + 36);
      uint64_t v17 = *(void *)(a2 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(unsigned char *)(a1 + 96) = 5;
      *(void *)(a1 + 64) = v17;
      goto LABEL_15;
    case 6:
      *(void *)(a1 + 16) = *v5;
      *(unsigned char *)(a1 + 96) = 6;
      swift_bridgeObjectRetain();
      break;
    case 7:
      uint64_t v18 = *(void *)(a2 + 32);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
      *(void *)(a1 + 32) = v18;
      char v19 = 7;
      goto LABEL_11;
    case 8:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v20 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v20;
      char v19 = 8;
LABEL_11:
      *(unsigned char *)(a1 + 96) = v19;
      goto LABEL_15;
    case 9:
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v21 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v21;
      uint64_t v22 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v22;
      uint64_t v23 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v23;
      uint64_t v24 = *(void *)(a2 + 88);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)(a1 + 88) = v24;
      *(unsigned char *)(a1 + 96) = 9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_16;
    case 10:
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v25 = *(void *)(a2 + 40);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(void *)(a1 + 40) = v25;
      char v12 = 10;
LABEL_14:
      *(unsigned char *)(a1 + 96) = v12;
      swift_bridgeObjectRetain();
LABEL_15:
      swift_bridgeObjectRetain();
LABEL_16:
      swift_retain();
      break;
    case 11:
      long long v27 = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 40) = v27;
      (**(void (***)(uint64_t, void *))(v27 - 8))(a1 + 16, v5);
      *(unsigned char *)(a1 + 96) = 11;
      break;
    default:
      memcpy((void *)(a1 + 16), v5, 0x51uLL);
      break;
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  return a1;
}

uint64_t assignWithCopy for FeatureFlag.FeatureFlagItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_1A2CA4628(a1 + 16);
    switch(*(unsigned char *)(a2 + 96))
    {
      case 0:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v4 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v4;
        *(unsigned char *)(a1 + 96) = 0;
        goto LABEL_14;
      case 1:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v5 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = v5;
        uint64_t v6 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v6;
        *(unsigned char *)(a1 + 96) = 1;
        swift_bridgeObjectRetain();
        swift_retain();
        goto LABEL_18;
      case 2:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v7 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v7;
        char v8 = 2;
        goto LABEL_17;
      case 3:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v9 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v9;
        char v8 = 3;
        goto LABEL_17;
      case 4:
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        uint64_t v10 = *(void *)(a2 + 48);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = v10;
        char v11 = 4;
        goto LABEL_13;
      case 5:
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        uint64_t v12 = *(void *)(a2 + 24);
        *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
        *(void *)(a1 + 24) = v12;
        *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
        *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        uint64_t v13 = *(void *)(a2 + 64);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = v13;
        char v11 = 5;
        goto LABEL_13;
      case 6:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 96) = 6;
        swift_bridgeObjectRetain();
        break;
      case 7:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v14 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = v14;
        char v11 = 7;
        goto LABEL_13;
      case 8:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v15 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v15;
        char v11 = 8;
LABEL_13:
        *(unsigned char *)(a1 + 96) = v11;
LABEL_14:
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 9:
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        uint64_t v16 = *(void *)(a2 + 88);
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = v16;
        *(unsigned char *)(a1 + 96) = 9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 0xA:
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v17 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v17;
        char v8 = 10;
LABEL_17:
        *(unsigned char *)(a1 + 96) = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_18:
        swift_retain();
        break;
      case 0xB:
        uint64_t v19 = *(void *)(a2 + 40);
        *(void *)(a1 + 40) = v19;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 16, a2 + 16);
        *(unsigned char *)(a1 + 96) = 11;
        break;
      default:
        memcpy((void *)(a1 + 16), (const void *)(a2 + 16), 0x51uLL);
        break;
    }
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  return a1;
}

void *__swift_memcpy98_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x62uLL);
}

uint64_t assignWithTake for FeatureFlag.FeatureFlagItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_1A2CA4628(a1 + 16);
    memcpy((void *)(a1 + 16), (const void *)(a2 + 16), 0x51uLL);
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureFlag.FeatureFlagItem(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 98))
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

uint64_t storeEnumTagSinglePayload for FeatureFlag.FeatureFlagItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 96) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 98) = 1;
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
    *(unsigned char *)(result + 98) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag.FeatureFlagItem()
{
  return &type metadata for FeatureFlag.FeatureFlagItem;
}

uint64_t sub_1A2CA69D4()
{
  swift_weakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_1();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1A2CA6A04@<X0>(char a1@<W0>, char *a2@<X8>)
{
  return sub_1A2CA4E28(a1, a2);
}

uint64_t ResetItem.isEnabled.getter()
{
  return 1;
}

uint64_t ResetItem.isVisible.getter()
{
  return 1;
}

uint64_t ResetItem.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResetItem.cellStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  type metadata accessor for SettingAction();
  swift_allocObject();
  SettingAction.init(_:_:)(0xD000000000000015, 0x80000001A2CA9AA0, (uint64_t)sub_1A2CA6D04, v2);
  uint64_t v3 = sub_1A2CA2F60();
  swift_release();
  sub_1A2CA5CF8();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A2CA92E0;
  *(void *)(v4 + 32) = v3;
  uint64_t v6 = v4;
  uint64_t result = sub_1A2CA7B88();
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0x7465736552;
  *(void *)(a1 + 16) = 0xE500000000000000;
  *(void *)(a1 + 24) = 0xD000000000000012;
  *(void *)(a1 + 32) = 0x80000001A2CA9AC0;
  *(void *)(a1 + 40) = 0xD00000000000002FLL;
  *(void *)(a1 + 48) = 0x80000001A2CA9AE0;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = nullsub_1;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 9;
  return result;
}

uint64_t sub_1A2CA6BA4()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2CA6BDC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = swift_bridgeObjectRetain();
    unint64_t v2 = sub_1A2CA6D0C(v1);
    swift_bridgeObjectRelease();
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1A2CA7DA8();
      uint64_t v3 = result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return result;
        }
        for (uint64_t i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            MEMORY[0x1A623E110](i, v2);
          }
          else {
            swift_retain();
          }
          sub_1A2CA2EF0();
          swift_release();
        }
      }
    }
    swift_release();
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_1A2CA6D04()
{
  return sub_1A2CA6BDC();
}

uint64_t sub_1A2CA6D0C(uint64_t a1)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v11 = v3;
    do
    {
      uint64_t v5 = *(void *)(v3 + 40 * v4 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      if (v6)
      {
        uint64_t v7 = v5 + 32;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        do
        {
          sub_1A2C945B0(v7, (uint64_t)v15);
          sub_1A2C92524(0, (unint64_t *)&qword_1E959DEB8);
          sub_1A2C92524(0, &qword_1E959DEE0);
          if (swift_dynamicCast())
          {
            sub_1A2C9250C(v13, (uint64_t)v16);
            uint64_t v8 = v17;
            uint64_t v9 = v18;
            __swift_project_boxed_opaque_existential_1(v16, v17);
            unint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
            sub_1A2C99588(v10);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
          }
          else
          {
            uint64_t v14 = 0;
            memset(v13, 0, sizeof(v13));
            sub_1A2C9B0B0((uint64_t)v13);
          }
          v7 += 40;
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v3 = v11;
      }
      ++v4;
    }
    while (v4 != v12);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

uint64_t ResetItem.__allocating_init(layout:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 257;
  *(void *)(result + 24) = 0xD000000000000012;
  *(void *)(result + 32) = 0x80000001A2CA9AC0;
  *(void *)(result + 40) = a1;
  return result;
}

uint64_t ResetItem.init(layout:)(uint64_t a1)
{
  *(_WORD *)(v1 + 16) = 257;
  *(void *)(v1 + 24) = 0xD000000000000012;
  *(void *)(v1 + 32) = 0x80000001A2CA9AC0;
  *(void *)(v1 + 40) = a1;
  return v1;
}

uint64_t ResetItem.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResetItem.__deallocating_deinit()
{
  ResetItem.deinit();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1A2CA6FD0()
{
  return ResetItem.label.getter();
}

uint64_t sub_1A2CA6FF4@<X0>(uint64_t a1@<X8>)
{
  return ResetItem.cellStyle.getter(a1);
}

uint64_t type metadata accessor for ResetItem()
{
  return self;
}

uint64_t method lookup function for ResetItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ResetItem);
}

uint64_t dispatch thunk of ResetItem.__allocating_init(layout:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

unint64_t sub_1A2CA7068(unint64_t result, char a2, uint64_t a3)
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

void (*sub_1A2CA708C(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_1A2CA713C(v6, a2, a3);
  return sub_1A2CA70F4;
}

void sub_1A2CA70F4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_1A2CA713C(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1A2CA7068(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x1A623E110](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return sub_1A2CA71BC;
}

uint64_t sub_1A2CA71BC()
{
  return swift_release();
}

uint64_t Presets.deinit()
{
  return v0;
}

uint64_t Presets.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for Presets()
{
  return self;
}

uint64_t method lookup function for Presets(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Presets);
}

BOOL static DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataType.hash(into:)()
{
  return sub_1A2CA7E38();
}

uint64_t DataType.hashValue.getter()
{
  return sub_1A2CA7E48();
}

unint64_t sub_1A2CA72B0()
{
  unint64_t result = qword_1E959E230;
  if (!qword_1E959E230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959E230);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DataType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1A2CA7450);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataType()
{
  return &type metadata for DataType;
}

uint64_t ConditionalItem.label.getter()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  uint64_t v1 = OUTLINED_FUNCTION_0_5();
  return v2(v1);
}

uint64_t ConditionalItem.cellStyle.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t ConditionalItem.isEnabled.getter()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  uint64_t v1 = OUTLINED_FUNCTION_0_5();
  return v2(v1) & 1;
}

uint64_t ConditionalItem.isVisible.getter()
{
  return (*(uint64_t (**)(void))(v0 + 40))() & 1;
}

uint64_t destroy for ConditionalItem(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);

  return swift_release();
}

uint64_t initializeWithCopy for ConditionalItem(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for ConditionalItem(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ConditionalItem(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConditionalItem(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for ConditionalItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConditionalItem()
{
  return &type metadata for ConditionalItem;
}

uint64_t destroy for Domain()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Domain(void *a1, void *a2)
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

void *assignWithTake for Domain(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Domain(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Domain(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1A2CA78B0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_1A2CA78C8()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1A2CA78D8()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1A2CA78E8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A2CA78F8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A2CA7908()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A2CA7918()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A2CA7928()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1A2CA7938()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A2CA7958()
{
  return MEMORY[0x1F415DA08]();
}

uint64_t sub_1A2CA7968()
{
  return MEMORY[0x1F415DCA0]();
}

uint64_t sub_1A2CA7978()
{
  return MEMORY[0x1F415DCB8]();
}

uint64_t sub_1A2CA7988()
{
  return MEMORY[0x1F415E0F0]();
}

uint64_t sub_1A2CA7998()
{
  return MEMORY[0x1F415E100]();
}

uint64_t sub_1A2CA79A8()
{
  return MEMORY[0x1F415E108]();
}

uint64_t sub_1A2CA79B8()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1A2CA79C8()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1A2CA79D8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A2CA79E8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A2CA79F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A2CA7A08()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1A2CA7A18()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1A2CA7A28()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A2CA7A38()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A2CA7A48()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A2CA7A58()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A2CA7A68()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A2CA7A78()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A2CA7A88()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A2CA7A98()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A2CA7AA8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1A2CA7AB8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A2CA7AD8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1A2CA7AE8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A2CA7AF8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A2CA7B18()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1A2CA7B28()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1A2CA7B38()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A2CA7B48()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1A2CA7B58()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A2CA7B68()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A2CA7B78()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1A2CA7B88()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A2CA7B98()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A2CA7BA8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A2CA7BB8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A2CA7BC8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A2CA7BD8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A2CA7BE8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A2CA7BF8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A2CA7C08()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1A2CA7C18()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A2CA7C28()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A2CA7C38()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A2CA7C48()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A2CA7C58()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A2CA7C68()
{
  return MEMORY[0x1F415F140]();
}

uint64_t sub_1A2CA7C78()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1A2CA7C88()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A2CA7C98()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A2CA7CA8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A2CA7CB8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A2CA7CC8()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1A2CA7CD8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A2CA7CE8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A2CA7CF8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A2CA7D08()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A2CA7D18()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A2CA7D28()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A2CA7D38()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A2CA7D48()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A2CA7D58()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A2CA7D68()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1A2CA7D78()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1A2CA7D88()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A2CA7D98()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1A2CA7DA8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A2CA7DB8()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1A2CA7DC8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A2CA7DD8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1A2CA7DE8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A2CA7DF8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A2CA7E08()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1A2CA7E18()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A2CA7E28()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A2CA7E38()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A2CA7E48()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A2CA7E58()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A2CA7E68()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1A2CA7E78()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A2CA7E88()
{
  return MEMORY[0x1F4186318]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
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

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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