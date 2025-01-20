uint64_t sub_25DD64154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_25DD6417C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_25DD641A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

BOOL sub_25DD641B8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25DD641C8()
{
  return sub_25DD89F88();
}

uint64_t sub_25DD641F0()
{
  return sub_25DD89F98();
}

BOOL sub_25DD64238(char *a1, char *a2)
{
  return sub_25DD641B8(*a1, *a2);
}

uint64_t sub_25DD64244()
{
  return sub_25DD641F0();
}

uint64_t sub_25DD6424C()
{
  return sub_25DD641C8();
}

uint64_t sub_25DD64254()
{
  return sub_25DD89F98();
}

uint64_t sub_25DD642A8(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25DD642C0(char a1)
{
  return a1 & 1;
}

BOOL sub_25DD642C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25DD697F8(*a1, *a2);
}

uint64_t sub_25DD642D4()
{
  return sub_25DD69918();
}

uint64_t sub_25DD642DC()
{
  return sub_25DD69808();
}

uint64_t sub_25DD642E4()
{
  return sub_25DD7A504();
}

uint64_t sub_25DD642EC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25DD642A8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25DD64318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25DD642C0(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25DD64344()
{
  uint64_t v0 = sub_25DD89988();
  __swift_allocate_value_buffer(v0, qword_26B37FAE0);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_26B37FAE0) = 500;
  unsigned int v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v1();
}

uint64_t sub_25DD643D4()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  *(unsigned char *)(v0 + 48) = 0;
  sub_25DD64400();
  return v0;
}

void sub_25DD64400()
{
  uint64_t v1 = sub_25DD899F8();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&aBlock[-1] - v8;
  id v10 = objc_msgSend(self, sel_sharedHandler);
  sub_25DD89D48();
  swift_unknownObjectRelease();
  sub_25DD68D8C(0, (unint64_t *)&qword_26B37F080);
  if (swift_dynamicCast())
  {
    v11 = (void *)aBlock[6];
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = (void *)swift_allocObject();
    v13[2] = v0;
    v13[3] = v11;
    v13[4] = v12;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DD68C84;
    *(void *)(v14 + 24) = v13;
    aBlock[4] = sub_25DD68CC0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD64F04;
    aBlock[3] = &block_descriptor_60;
    v15 = _Block_copy(aBlock);
    swift_retain();
    v16 = v11;
    v17 = v12;
    swift_release();
    [v16 getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:v15];
    _Block_release(v15);
    sub_25DD899E8();
    if (qword_26B37F8C0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25DD89988();
    uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_26B37FAE0);
    MEMORY[0x2611C4F10](v7, v19);
    v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v7, v1);
    sub_25DD89C78();
    v20(v9, v1);
    if (sub_25DD89998())
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_25DD89968();
      __swift_project_value_buffer(v21, (uint64_t)qword_26B37FB10);
      v22 = (void *)sub_25DD89958();
      os_log_type_t v23 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_21(v23))
      {
        v24 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_13(v24);
        OUTLINED_FUNCTION_29(&dword_25DD62000, v25, v26, "Timed out waiting to get asset path with getNeuralCombinerConfigFile api");
        OUTLINED_FUNCTION_0();
      }

      if (qword_26B37F058 != -1) {
        swift_once();
      }
      sub_25DD87094();
    }
  }
  else
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25DD89968();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B37FB10);
    v16 = sub_25DD89958();
    os_log_type_t v28 = sub_25DD89C68();
    if (os_log_type_enabled(v16, v28))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_27(&dword_25DD62000, v29, v30, "NCAssetPathGetter - Error trying to fetch config from CSAttSiriMitigationAssetProvider");
      OUTLINED_FUNCTION_0();
    }
  }
}

void sub_25DD64840(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, id a5, void *a6, void *a7, void *a8)
{
  if (a5)
  {
    id v16 = a5;
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25DD89968();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B37FB10);
    id v18 = a5;
    id v19 = a5;
    v20 = sub_25DD89958();
    os_log_type_t v21 = sub_25DD89C68();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v49 = a3;
      v22 = (uint8_t *)swift_slowAlloc();
      v46 = a8;
      uint64_t v23 = swift_slowAlloc();
      aBlock[0] = v23;
      *(_DWORD *)v22 = 136315138;
      id v24 = a5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F068);
      uint64_t v25 = sub_25DD89AC8();
      sub_25DD7D6C4(v25, v26, aBlock);
      sub_25DD89CF8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25DD62000, v20, v21, "fetching bnnsIr from MitigationAssetProvider with error: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v27 = v23;
      a8 = v46;
      MEMORY[0x2611C5A20](v27, -1, -1);
      os_log_type_t v28 = v22;
      a3 = v49;
      MEMORY[0x2611C5A20](v28, -1, -1);
    }
    else
    {
    }
  }
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_25DD89968();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B37FB10);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_25DD89958();
  os_log_type_t v31 = sub_25DD89C58();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    aBlock[0] = v45;
    *(_DWORD *)uint64_t v32 = 136315394;
    v47 = a8;
    v48 = a7;
    if (a2) {
      uint64_t v33 = a1;
    }
    else {
      uint64_t v33 = 0;
    }
    if (a2) {
      unint64_t v34 = a2;
    }
    else {
      unint64_t v34 = 0xE000000000000000;
    }
    uint64_t v50 = a3;
    swift_bridgeObjectRetain();
    sub_25DD7D6C4(v33, v34, aBlock);
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    if (a4) {
      uint64_t v35 = a3;
    }
    else {
      uint64_t v35 = 0;
    }
    if (a4) {
      unint64_t v36 = a4;
    }
    else {
      unint64_t v36 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v37 = v35;
    a8 = v47;
    sub_25DD7D6C4(v37, v36, aBlock);
    a7 = v48;
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    a3 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v30, v31, "Completion block of getNeuralCombinerConfigFile invoked and configPath, bnnsIrPath is cached - %s %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v45, -1, -1);
    MEMORY[0x2611C5A20](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  if (a2) {
    uint64_t v38 = a1;
  }
  else {
    uint64_t v38 = 0;
  }
  if (a2) {
    unint64_t v39 = a2;
  }
  else {
    unint64_t v39 = 0xE000000000000000;
  }
  a6[2] = v38;
  a6[3] = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a4) {
    uint64_t v40 = a3;
  }
  else {
    uint64_t v40 = 0;
  }
  if (a4) {
    unint64_t v41 = a4;
  }
  else {
    unint64_t v41 = 0xE000000000000000;
  }
  a6[4] = v40;
  a6[5] = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = a6;
  *(void *)(v42 + 24) = a8;
  aBlock[4] = (uint64_t)sub_25DD68D84;
  aBlock[5] = v42;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25DD64EB0;
  aBlock[3] = (uint64_t)&block_descriptor_66;
  v43 = _Block_copy(aBlock);
  swift_retain();
  id v44 = a8;
  swift_release();
  objc_msgSend(a7, sel_shouldRunCAROverrideWithCompletion_, v43);
  _Block_release(v43);
}

void sub_25DD64D78(char a1, uint64_t a2, NSObject *a3)
{
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25DD89968();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B37FB10);
  v7 = sub_25DD89958();
  os_log_type_t v8 = sub_25DD89C58();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    sub_25DD89CF8();
    _os_log_impl(&dword_25DD62000, v7, v8, "Completion block of shouldRunCAROverride invoked and config value is cached - %{BOOL}d", v9, 8u);
    MEMORY[0x2611C5A20](v9, -1, -1);
  }

  *(unsigned char *)(a2 + 48) = a1 & 1;
  dispatch_group_leave(a3);
}

uint64_t sub_25DD64EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_25DD64F04(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v6 = sub_25DD89A78();
  uint64_t v8 = v7;
  uint64_t v9 = sub_25DD89A78();
  uint64_t v11 = v10;
  swift_retain();
  id v12 = a4;
  v5(v6, v8, v9, v11, v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_25DD64FC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25DD64FF0()
{
  sub_25DD64FC8();

  return MEMORY[0x270FA0228](v0, 49, 7);
}

uint64_t type metadata accessor for NCAssetPathGetter()
{
  return self;
}

uint64_t sub_25DD65048()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0;
  type metadata accessor for NCAssetPathGetter();
  uint64_t v2 = swift_allocObject();
  sub_25DD643D4();
  *(void *)(v1 + 72) = v2;
  *(unsigned char *)(v1 + 80) = 0;
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25DD89968();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B37FB10);
  uint64_t v4 = sub_25DD89958();
  os_log_type_t v5 = sub_25DD89C58();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_25DD62000, v4, v5, "fetching NC config path from CSAttSiriMitigationAssetProvider", v6, 2u);
    OUTLINED_FUNCTION_0();
  }

  uint64_t v7 = type metadata accessor for SELFLogger();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = type metadata accessor for SelfEmitter();
  uint64_t v10 = swift_allocObject();
  v8[5] = v9;
  v8[6] = &off_270ABDF88;
  v8[2] = v10;
  *(void *)(v1 + 48) = v7;
  *(void *)(v1 + 56) = &off_270ABDF28;
  *(void *)(v1 + 24) = v8;
  id v11 = objc_msgSend(self, sel_sharedInstance);
  sub_25DD89D48();
  swift_unknownObjectRelease();
  sub_25DD68D8C(0, &qword_26B37F078);
  int v12 = swift_dynamicCast();
  uint64_t v13 = v26;
  if (!v12) {
    uint64_t v13 = 0;
  }
  *(void *)(v1 + 64) = v13;
  uint64_t v14 = *(void **)(v1 + 72);
  uint64_t v15 = v14[4];
  unint64_t v16 = v14[5];
  if ((v16 & 0x2000000000000000) != 0) {
    uint64_t v17 = HIBYTE(v16) & 0xF;
  }
  else {
    uint64_t v17 = v15 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v19 = v14[2];
  unint64_t v18 = v14[3];
  swift_bridgeObjectRetain();
  if (v17)
  {
    swift_bridgeObjectRetain();
    sub_25DD652EC(v19, v18, v15, v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25DD652EC(v19, v18, 0, 0xE000000000000000);
  }
  swift_bridgeObjectRelease();
  v20 = (void *)sub_25DD89958();
  os_log_type_t v21 = sub_25DD89C58();
  if (OUTLINED_FUNCTION_21(v21))
  {
    v22 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_13(v22);
    OUTLINED_FUNCTION_29(&dword_25DD62000, v23, v24, "loadModelFromTrial completed");
    OUTLINED_FUNCTION_0();
  }

  return v1;
}

uint64_t sub_25DD652E0()
{
  return *(unsigned __int8 *)(*(void *)(v0 + 72) + 48);
}

void sub_25DD652EC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25DD89968();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B37FB10);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_25DD89958();
  os_log_type_t v11 = sub_25DD89C58();
  int v12 = &loc_25DD8A000;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_25DD7D6C4(a1, a2, v27);
    OUTLINED_FUNCTION_28();
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25DD62000, v10, v11, "using config path - %s for loading NC", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    int v12 = (void *)&loc_25DD8A000;
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((a4 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(a4) & 0xF;
  }
  else {
    uint64_t v14 = a3 & 0xFFFFFFFFFFFFLL;
  }
  id v15 = objc_allocWithZone(MEMORY[0x263F70108]);
  swift_bridgeObjectRetain();
  if (v14)
  {
    swift_bridgeObjectRetain();
    id v16 = sub_25DD686D8(a1, a2, a3, a4);
  }
  else
  {
    id v16 = sub_25DD68600(a1, a2);
  }
  uint64_t v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  if (!*(void *)(v5 + 16))
  {
    swift_bridgeObjectRetain_n();
    unint64_t v18 = sub_25DD89958();
    os_log_type_t v21 = sub_25DD89C68();
    if (!os_log_type_enabled(v18, v21))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_19;
    }
    v22 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)v22 = v12[211];
    swift_bridgeObjectRetain();
    sub_25DD7D6C4(a1, a2, v27);
    OUTLINED_FUNCTION_28();
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25DD62000, v18, v21, "error initializing model (SLUresMitigator) using config path - %s", v22, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    goto LABEL_17;
  }
  unint64_t v18 = sub_25DD89958();
  os_log_type_t v19 = sub_25DD89C58();
  if (OUTLINED_FUNCTION_21(v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_25DD62000, v18, OS_LOG_TYPE_DEFAULT, "Loaded NC model succesfully", v20, 2u);
LABEL_17:
    OUTLINED_FUNCTION_0();
  }

LABEL_19:
  uint64_t v23 = (__CFString *)sub_25DD89A68();
  uint64_t v24 = (__CFString *)sub_25DD89A68();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v23, v24, 0);

  *(unsigned char *)(v5 + 80) = AppBooleanValue != 0;
}

uint64_t sub_25DD656F0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = v5;
  uint64_t v11 = type metadata accessor for TTCandidate(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_25();
  uint64_t v37 = v13;
  uint64_t v14 = (void *)(v4 + 24);
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 24), *(void *)(v4 + 48));
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  unint64_t v40 = a4;
  sub_25DD733F0();
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v36 = *(void *)(v12 + 72);
    swift_bridgeObjectRetain();
    uint64_t v17 = (void *)MEMORY[0x263F8EE80];
    unint64_t v18 = v37;
    while (1)
    {
      sub_25DD68868(v16, (uint64_t)v18);
      sub_25DD65CC4(v18, v38, v39, v40, v49);
      if (v6)
      {
        sub_25DD688CC((uint64_t)v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (uint64_t)v17;
      }
      uint64_t v41 = v15;
      int v19 = v49[0];
      char v20 = BYTE4(v49[0]);
      uint64_t v42 = v49[1];
      uint64_t v43 = v49[2];
      int v44 = v50;
      char v45 = v51;
      int v46 = v52;
      char v47 = v53;
      char v48 = v54;
      uint64_t isa = (uint64_t)v18->isa;
      uint64_t v21 = (uint64_t)v18[1].isa;
      swift_bridgeObjectRetain();
      swift_isUniquelyReferenced_nonNull_native();
      v49[0] = v17;
      unint64_t v23 = sub_25DD85748(isa, v21);
      if (__OFADD__(v17[2], (v24 & 1) == 0)) {
        break;
      }
      unint64_t v25 = v23;
      char v26 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F888);
      if (sub_25DD89DE8())
      {
        unint64_t v27 = sub_25DD85748(isa, v21);
        if ((v26 & 1) != (v28 & 1)) {
          goto LABEL_20;
        }
        unint64_t v25 = v27;
      }
      uint64_t v17 = (void *)v49[0];
      if (v26)
      {
        uint64_t v29 = *(void *)(v49[0] + 56) + 40 * v25;
        swift_bridgeObjectRelease();
        *(_DWORD *)uint64_t v29 = v19;
        *(unsigned char *)(v29 + 4) = v20;
        *(void *)(v29 + 8) = v42;
        *(void *)(v29 + 16) = v43;
        *(_DWORD *)(v29 + 24) = v44;
        *(unsigned char *)(v29 + 28) = v45;
        *(_DWORD *)(v29 + 32) = v46;
        *(unsigned char *)(v29 + 36) = v47;
        *(unsigned char *)(v29 + 37) = v48;
      }
      else
      {
        *(void *)(v49[0] + 8 * (v25 >> 6) + 64) |= 1 << v25;
        uint64_t v30 = (uint64_t *)(v17[6] + 16 * v25);
        *uint64_t v30 = isa;
        v30[1] = v21;
        uint64_t v31 = v17[7] + 40 * v25;
        *(_DWORD *)uint64_t v31 = v19;
        *(unsigned char *)(v31 + 4) = v20;
        *(void *)(v31 + 8) = v42;
        *(void *)(v31 + 16) = v43;
        *(_DWORD *)(v31 + 24) = v44;
        *(unsigned char *)(v31 + 28) = v45;
        *(_DWORD *)(v31 + 32) = v46;
        *(unsigned char *)(v31 + 36) = v47;
        *(unsigned char *)(v31 + 37) = v48;
        uint64_t v32 = v17[2];
        BOOL v33 = __OFADD__(v32, 1);
        uint64_t v34 = v32 + 1;
        if (v33) {
          goto LABEL_19;
        }
        v17[2] = v34;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v18 = v37;
      sub_25DD688CC(v37);
      v16 += v36;
      uint64_t v6 = 0;
      uint64_t v15 = v41 - 1;
      if (v41 == 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = (void *)(v4 + 24);
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    uint64_t result = sub_25DD89F28();
    __break(1u);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F8EE80];
LABEL_15:
    __swift_project_boxed_opaque_existential_1(v14, *(void *)(v4 + 48));
    swift_bridgeObjectRetain();
    sub_25DD74484(v38, v39, v40, (uint64_t)v17);
    swift_bridgeObjectRelease();
    return (uint64_t)v17;
  }
  return result;
}

uint64_t sub_25DD65AB0(uint64_t a1)
{
  char v1 = 1;
  switch(*(unsigned char *)(a1 + 16))
  {
    case 4:
      break;
    default:
      char v1 = sub_25DD89F08();
      break;
  }
  swift_bridgeObjectRelease();
  return v1 & 1;
}

id sub_25DD65BC8(uint64_t a1, void *a2)
{
  if ((sub_25DD65AB0(a1) & 1) == 0) {
    return objc_msgSend(a2, sel_invocationType);
  }
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25DD89968();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B37FB10);
  uint64_t v4 = sub_25DD89958();
  os_log_type_t v5 = sub_25DD89C58();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_27(&dword_25DD62000, v6, v7, "using invocation type as followup when invocationtype is announce as a workaround until model is ready to consume announce invocation type");
    OUTLINED_FUNCTION_0();
  }

  return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, 3);
}

void sub_25DD65CC4(NSObject *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  v267 = a5;
  uint64_t v269 = a3;
  uint64_t v251 = a2;
  v283[2] = *MEMORY[0x263EF8340];
  uint64_t v253 = *v5;
  uint64_t v8 = sub_25DD89968();
  OUTLINED_FUNCTION_2();
  uint64_t v260 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_24();
  v261 = v11;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v12);
  v250 = (char *)&v243 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_25();
  uint64_t v272 = v15;
  v270 = type metadata accessor for TTCandidate(0);
  MEMORY[0x270FA5388](v270);
  OUTLINED_FUNCTION_24();
  v258 = v16;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_10();
  v255 = v18;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_10();
  uint64_t v271 = v20;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_10();
  uint64_t v246 = v22;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_10();
  uint64_t v245 = v24;
  OUTLINED_FUNCTION_5();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  char v28 = (char *)&v243 - v27;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_10();
  uint64_t v244 = v29;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_10();
  uint64_t v256 = v31;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_10();
  v257 = v33;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_10();
  v266 = v35;
  OUTLINED_FUNCTION_5();
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  uint64_t v39 = (char *)&v243 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v243 - v40;
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v42 = __swift_project_value_buffer(v8, (uint64_t)qword_26B37FB10);
  sub_25DD68868((uint64_t)a1, (uint64_t)v41);
  v278 = a1;
  sub_25DD68868((uint64_t)a1, (uint64_t)v39);
  swift_bridgeObjectRetain_n();
  uint64_t v277 = v42;
  uint64_t v43 = sub_25DD89958();
  os_log_type_t v44 = sub_25DD89C58();
  LODWORD(v276) = v44;
  BOOL v45 = os_log_type_enabled(v43, v44);
  v268 = (uint64_t *)a4;
  uint64_t v263 = v8;
  v254 = v28;
  if (v45)
  {
    uint64_t v46 = OUTLINED_FUNCTION_15();
    uint64_t v275 = swift_slowAlloc();
    aBlock[0] = v275;
    *(_DWORD *)uint64_t v46 = 136315650;
    swift_bridgeObjectRetain();
    double v282 = COERCE_DOUBLE(OUTLINED_FUNCTION_14());
    OUTLINED_FUNCTION_9();
    swift_bridgeObjectRelease();
    sub_25DD688CC((uint64_t)v41);
    *(_WORD *)(v46 + 12) = 2080;
    swift_bridgeObjectRetain();
    double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v269, a4, aBlock));
    OUTLINED_FUNCTION_9();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v46 + 22) = 2080;
    uint64_t v47 = *((void *)v39 + 9);
    unint64_t v48 = *((void *)v39 + 10);
    swift_bridgeObjectRetain();
    double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v47, v48, aBlock));
    OUTLINED_FUNCTION_9();
    swift_bridgeObjectRelease();
    sub_25DD688CC((uint64_t)v39);
    _os_log_impl(&dword_25DD62000, v43, (os_log_type_t)v276, "invoking NC for  candidate with tcuId - %s, trpCandidateId %s and utterance - %s", (uint8_t *)v46, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    sub_25DD688CC((uint64_t)v41);
    swift_bridgeObjectRelease_n();
    sub_25DD688CC((uint64_t)v39);
  }

  uint64_t v49 = swift_allocObject();
  uint64_t v274 = v49;
  *(_DWORD *)(v49 + 16) = -1082130432;
  uint64_t v262 = v49 + 16;
  uint64_t v50 = swift_allocObject();
  *(unsigned char *)(v50 + 16) = 0;
  v259 = (unsigned char *)(v50 + 16);
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = 0;
  uint64_t v249 = v51 + 16;
  uint64_t v276 = v51;
  *(void *)(v51 + 24) = 0;
  uint64_t v52 = swift_allocObject();
  *(_DWORD *)(v52 + 16) = 0;
  uint64_t v248 = v52 + 16;
  uint64_t v273 = v52;
  *(unsigned char *)(v52 + 20) = 1;
  uint64_t v53 = swift_allocObject();
  *(_DWORD *)(v53 + 16) = 0;
  uint64_t v247 = v53 + 16;
  *(unsigned char *)(v53 + 20) = 1;
  uint64_t v54 = swift_allocObject();
  *(unsigned char *)(v54 + 16) = 0;
  uint64_t v252 = v54 + 16;
  v55 = v278;
  uint64_t v56 = v272;
  sub_25DD6897C((uint64_t)v278 + SLODWORD(v270[7].isa), v272);
  uint64_t v57 = sub_25DD89908();
  if (__swift_getEnumTagSinglePayload(v56, 1, v57) == 1)
  {
    sub_25DD68A0C(v56);
    uint64_t v272 = 0;
  }
  else
  {
    int v58 = sub_25DD898E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 8))(v56, v57);
    uint64_t v272 = v58 ^ 1u;
  }
  uint64_t v59 = v271;
  Class isa = v55[4].isa;
  uint64_t v275 = v50;
  if (!isa)
  {
    uint64_t v69 = v274;
    char v70 = (char)v55[11].isa;
    sub_25DD68868((uint64_t)v55, v271);
    if ((v70 & 1) == 0)
    {
      switch(*(unsigned char *)(v59 + 16))
      {
        case 1:
          swift_bridgeObjectRelease();
          sub_25DD688CC(v59);
          break;
        default:
          char v181 = sub_25DD89F08();
          swift_bridgeObjectRelease();
          sub_25DD688CC(v59);
          if ((v181 & 1) == 0) {
            goto LABEL_70;
          }
          break;
      }
      uint64_t v271 = v54;
      uint64_t v182 = (uint64_t)v55;
      v80 = v255;
      sub_25DD68868(v182, (uint64_t)v255);
      unint64_t v183 = (unint64_t)v268;
      swift_bridgeObjectRetain_n();
      uint64_t v184 = v69;
      swift_retain();
      v185 = sub_25DD89958();
      os_log_type_t v186 = sub_25DD89C58();
      int v187 = v186;
      if (os_log_type_enabled(v185, v186))
      {
        uint64_t v188 = OUTLINED_FUNCTION_15();
        LODWORD(v278) = v187;
        uint64_t v189 = v188;
        uint64_t v277 = swift_slowAlloc();
        aBlock[0] = v277;
        *(_DWORD *)uint64_t v189 = 136315650;
        uint64_t v190 = *v80;
        unint64_t v191 = v80[1];
        swift_bridgeObjectRetain();
        uint64_t v192 = sub_25DD7D6C4(v190, v191, aBlock);
        OUTLINED_FUNCTION_22(v192);
        sub_25DD89CF8();
        swift_bridgeObjectRelease();
        sub_25DD688CC((uint64_t)v80);
        *(_WORD *)(v189 + 12) = 2080;
        swift_bridgeObjectRetain();
        double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v269, v183, aBlock));
        LOBYTE(v80) = v271;
        sub_25DD89CF8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v189 + 22) = 2048;
        OUTLINED_FUNCTION_1();
        double v281 = *(float *)(v274 + 16);
        uint64_t v184 = v274;
        sub_25DD89CF8();
        swift_release();
        _os_log_impl(&dword_25DD62000, v185, (os_log_type_t)v278, "FlexibleFollowup: siri intended info is nil - Rejecting Candidate - %s, trpCandidateId %s. Score - %f, mitigationDecision:Rejected", (uint8_t *)v189, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {
        sub_25DD688CC((uint64_t)v80);

        swift_release();
        swift_bridgeObjectRelease_n();
        LOBYTE(v80) = v271;
      }
      OUTLINED_FUNCTION_1();
      int v210 = *(_DWORD *)(v184 + 16);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      LODWORD(v77) = 0;
      _DWORD *v267 = v210;
      OUTLINED_FUNCTION_26();
      goto LABEL_83;
    }
    sub_25DD688CC(v59);
LABEL_70:
    uint64_t v193 = v260;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v260 + 16))(v261, v277, v263);
    uint64_t v194 = v275;
    uint64_t v195 = (uint64_t)v258;
    sub_25DD68868((uint64_t)v55, (uint64_t)v258);
    unint64_t v196 = (unint64_t)v268;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain();
    v197 = sub_25DD89958();
    os_log_type_t v198 = sub_25DD89C58();
    LODWORD(v278) = v198;
    if (os_log_type_enabled(v197, v198))
    {
      uint64_t v199 = swift_slowAlloc();
      uint64_t v200 = swift_slowAlloc();
      uint64_t v264 = v53;
      uint64_t v277 = v200;
      aBlock[0] = v200;
      *(_DWORD *)uint64_t v199 = 136315906;
      v270 = v197;
      uint64_t v271 = v54;
      swift_bridgeObjectRetain();
      uint64_t v201 = OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_22(v201);
      uint64_t v202 = v69;
      sub_25DD89CF8();
      swift_bridgeObjectRelease();
      sub_25DD688CC(v195);
      *(_WORD *)(v199 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v269, v196, aBlock));
      sub_25DD89CF8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v199 + 22) = 2048;
      OUTLINED_FUNCTION_1();
      double v282 = *(float *)(v69 + 16);
      sub_25DD89CF8();
      swift_release();
      *(_WORD *)(v199 + 32) = 2080;
      OUTLINED_FUNCTION_1();
      if (*(unsigned char *)(v275 + 16)) {
        uint64_t v203 = 0x657461676974694DLL;
      }
      else {
        uint64_t v203 = 0x64657463656C6553;
      }
      if (*(unsigned char *)(v275 + 16)) {
        unint64_t v204 = 0xE900000000000064;
      }
      else {
        unint64_t v204 = 0xE800000000000000;
      }
      double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v203, v204, aBlock));
      uint64_t v205 = v202;
      uint64_t v206 = v275;
      sub_25DD89CF8();
      swift_release_n();
      swift_bridgeObjectRelease();
      v207 = v270;
      _os_log_impl(&dword_25DD62000, v270, (os_log_type_t)v278, "Non FlexibleFollowup: Siri intended info is nil - using default values i.e for candidate - %s, trpCandidateId %s. Score - %f, mitigationDecision - %s", (uint8_t *)v199, 0x2Au);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      (*(void (**)(NSObject *, uint64_t))(v260 + 8))(v261, v263);
    }
    else
    {
      sub_25DD688CC(v195);

      swift_release_n();
      swift_release();
      swift_bridgeObjectRelease_n();
      (*(void (**)(NSObject *, uint64_t))(v193 + 8))(v261, v263);
      uint64_t v206 = v194;
      uint64_t v205 = v69;
    }
    OUTLINED_FUNCTION_1();
    int v208 = *(_DWORD *)(v205 + 16);
    OUTLINED_FUNCTION_1();
    char v209 = *(unsigned char *)(v206 + 16);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    LODWORD(v77) = 0;
    v106 = v267;
    _DWORD *v267 = v208;
    *((unsigned char *)v106 + 4) = v209;
LABEL_80:
    *((void *)v106 + 1) = 0;
    *((void *)v106 + 2) = 0;
    v106[6] = 0;
    LOBYTE(v80) = 1;
LABEL_83:
    *((unsigned char *)v106 + 28) = (_BYTE)v80;
    goto LABEL_84;
  }
  uint64_t v271 = v54;
  v61 = isa;
  v62 = sub_25DD89958();
  os_log_type_t v63 = sub_25DD89C58();
  BOOL v64 = os_log_type_enabled(v62, v63);
  v270 = v61;
  uint64_t v264 = v53;
  if (v64)
  {
    uint64_t v65 = swift_slowAlloc();
    v66 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 138413570;
    id v67 = objc_msgSend(v61, (SEL)&selRef_setNldaScore_ + 3);
    id v68 = v67;
    if (v67) {
      aBlock[0] = (uint64_t)v67;
    }
    else {
      aBlock[0] = 0;
    }
    sub_25DD89CF8();
    void *v66 = v68;
    *(_WORD *)(v65 + 12) = 2048;
    v71 = v270;
    [v270 spkrIdScore];
    *(double *)aBlock = v72;
    sub_25DD89CF8();
    *(_WORD *)(v65 + 22) = 2048;
    [v71 aftmScore];
    OUTLINED_FUNCTION_7(v73);
    *(_WORD *)(v65 + 32) = 2048;
    [v71 odldScore];
    OUTLINED_FUNCTION_7(v74);
    *(_WORD *)(v65 + 42) = 2048;
    [v71 lrnnScore];
    OUTLINED_FUNCTION_7(v75);
    *(_WORD *)(v65 + 52) = 2048;
    v61 = v71;
    [v71 conversationalOdldScore];
    OUTLINED_FUNCTION_7(v76);

    _os_log_impl(&dword_25DD62000, v62, v63, "    siriIntendedInfo for NC has invocationSource - %@ , spkrIdScore - %f, aftmScore - %f,\n    odldScore - %f, lrnnScore - %f, conversationalScore - %f", (uint8_t *)v65, 0x3Eu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F880);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    v62 = v61;
  }

  v77 = [v61 invocationType];
  v78 = v278;
  v79 = (uint64_t *)sub_25DD65BC8((uint64_t)v278, v61);
  v80 = v266;
  if (!v79)
  {
    sub_25DD68868((uint64_t)v78, (uint64_t)v266);
    unint64_t v83 = (unint64_t)v268;
    OUTLINED_FUNCTION_30();
    swift_bridgeObjectRetain_n();
    v84 = sub_25DD89958();
    uint64_t v85 = (uint64_t)v80;
    LOBYTE(v80) = sub_25DD89C68();
    v278 = v84;
    if (os_log_type_enabled(v84, (os_log_type_t)v80))
    {
      uint64_t v86 = OUTLINED_FUNCTION_15();
      v261 = v77;
      uint64_t v87 = v86;
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v87 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v88 = OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_22(v88);
      OUTLINED_FUNCTION_9();
      swift_bridgeObjectRelease();
      sub_25DD688CC(v85);
      *(_WORD *)(v87 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v269, v83, aBlock));
      OUTLINED_FUNCTION_9();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 22) = 2048;
      double v282 = -1.0;
      char v89 = v272;
      sub_25DD89CF8();
      v90 = v278;
      _os_log_impl(&dword_25DD62000, v278, (os_log_type_t)v80, "nil intendedInfo invocationType for tcuId - %s, trpCandidateId %s using default Score - %f, mitigationDecision - Selected", (uint8_t *)v87, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {

      sub_25DD688CC(v85);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      OUTLINED_FUNCTION_30();
      swift_bridgeObjectRelease_n();
      char v89 = v272;
    }
    LODWORD(v77) = 0;
    OUTLINED_FUNCTION_18(-1082130432);
    goto LABEL_39;
  }
  v266 = v79;
  v81 = *(void **)(v265 + 64);
  if (v81) {
    unsigned __int8 v82 = objc_msgSend(v81, sel_getIsAssetMagusSupported);
  }
  else {
    unsigned __int8 v82 = 0;
  }
  int v91 = sub_25DD684BC(v77);
  if (((sub_25DD65AB0((uint64_t)v278) | v91) & 1) != 0 && (v82 & 1) == 0)
  {
    uint64_t v92 = (uint64_t)v257;
    sub_25DD68868((uint64_t)v278, (uint64_t)v257);
    v80 = v268;
    swift_bridgeObjectRetain_n();
    v93 = sub_25DD89958();
    os_log_type_t v94 = sub_25DD89C58();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = OUTLINED_FUNCTION_15();
      v278 = v93;
      uint64_t v96 = v95;
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v96 = 136315650;
      TTCandidate.description.getter();
      double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v97, v98, aBlock));
      v261 = v77;
      v77 = v283;
      os_log_type_t v99 = v94;
      char v89 = v272;
      sub_25DD89CF8();
      swift_bridgeObjectRelease();
      sub_25DD688CC(v92);
      *(_WORD *)(v96 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v282 = COERCE_DOUBLE(sub_25DD7D6C4(v269, (unint64_t)v80, aBlock));
      sub_25DD89CF8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v96 + 22) = 2048;
      double v282 = -1.0;
      sub_25DD89CF8();
      v100 = v278;
      _os_log_impl(&dword_25DD62000, v278, v99, "Setting NC result for candidate - %s, trpCandidateId: %s to mitigated because magus is not supported. Score - %f", (uint8_t *)v96, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {

      sub_25DD688CC(v92);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      swift_bridgeObjectRelease_n();
      char v89 = v272;
    }
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_26();
LABEL_39:
    *((unsigned char *)v106 + 28) = (_BYTE)v80;
LABEL_85:
    v106[8] = v77;
    *((unsigned char *)v106 + 36) = (_BYTE)v80;
    *((unsigned char *)v106 + 37) = v89 & 1;
    return;
  }
  [v61 lrnnScore];
  v261 = v77;
  if (v101 == -1.0)
  {
    v102 = sub_25DD89958();
    os_log_type_t v103 = sub_25DD89C58();
    if (os_log_type_enabled(v102, v103))
    {
      v104 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_13(v104);
      _os_log_impl(&dword_25DD62000, v102, v103, "Handling LRNN missing scores...", (uint8_t *)v77, 2u);
      v77 = v261;
      OUTLINED_FUNCTION_0();
    }

    uint64_t v105 = v256;
    sub_25DD68868((uint64_t)v278, v256);
    if (v91)
    {
      sub_25DD688CC(v105);
LABEL_41:
      v108 = (void *)sub_25DD89958();
      os_log_type_t v109 = sub_25DD89C58();
      BOOL v110 = OUTLINED_FUNCTION_3(v109);
      v61 = v270;
      if (v110)
      {
        v111 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_13(v111);
        OUTLINED_FUNCTION_6(&dword_25DD62000, v112, v113, "Request is FF or Announce. Continuing with NC...");
        v77 = v261;
        OUTLINED_FUNCTION_0();
      }

      v114 = (void *)sub_25DD89958();
      os_log_type_t v115 = sub_25DD89C58();
      if (OUTLINED_FUNCTION_3(v115))
      {
        v116 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_13(v116);
        OUTLINED_FUNCTION_6(&dword_25DD62000, v117, v118, "Handled LRNN missing scores.");
        v77 = v261;
        OUTLINED_FUNCTION_0();
      }

      goto LABEL_46;
    }
    char v107 = sub_25DD65AB0(v105);
    sub_25DD688CC(v105);
    if (v107) {
      goto LABEL_41;
    }
    v211 = sub_25DD89958();
    os_log_type_t v212 = sub_25DD89C58();
    BOOL v213 = OUTLINED_FUNCTION_3(v212);
    v214 = v270;
    if (v213)
    {
      v215 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_13(v215);
      OUTLINED_FUNCTION_6(&dword_25DD62000, v216, v217, "Skipping NC because of missing LRNN scores");
      OUTLINED_FUNCTION_0();
      v77 = v214;
      v214 = v261;
    }
    else
    {
      v77 = v211;
      v211 = v261;
    }
    swift_release();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_31();
    *((unsigned char *)v106 + 4) = 0;
    goto LABEL_80;
  }
LABEL_46:
  id v119 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F70110]), sel_initWithDefaults);
  if (!v119)
  {
    v143 = (void *)sub_25DD89958();
    os_log_type_t v144 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_3(v144))
    {
      v145 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_13(v145);
      OUTLINED_FUNCTION_6(&dword_25DD62000, v146, v147, "error when creating SLUresMitigatorIpFeats object");
      v77 = v261;
      OUTLINED_FUNCTION_0();
    }

    sub_25DD68A6C();
    swift_allocError();
    unsigned char *v148 = 3;
    swift_willThrow();
    swift_release();
    swift_release();

    id v149 = v266;
    goto LABEL_95;
  }
  v120 = v119;
  objc_msgSend(v119, sel_setInputOrigin_, v266);
  sub_25DD68D8C(0, &qword_26A6C6100);
  [v61 spkrIdScore];
  v121 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v121, sel_setSpeakerIDScore_);

  [v61 aftmScore];
  v122 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v122, sel_setAcousticFTMScores_);

  [v61 odldScore];
  v123 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v123, sel_setNldaScore_);

  [v61 lrnnScore];
  v124 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v124, sel_setLrnnScore_);

  [v61 lrnnThreshold];
  v125 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v125, sel_setLrnnThreshold_);

  [v61 lrnnScale];
  v126 = (void *)sub_25DD89CA8();
  OUTLINED_FUNCTION_12((uint64_t)v126, sel_setExternalLrnnScale_);

  [v61 lrnnOffset];
  uint64_t v127 = sub_25DD89CA8();
  OUTLINED_FUNCTION_12(v127, sel_setExternalLrnnOffset_);

  [v61 conversationalOdldScore];
  v128 = (void *)sub_25DD89CA8();
  objc_msgSend(v120, sel_setConversationalNldaScore_, v128);

  v129 = (void *)sub_25DD89C48();
  LOBYTE(v127) = sub_25DD89C18();

  objc_msgSend(v120, sel_setIsConversational_, v127 & 1);
  id v130 = v120;
  v131 = v266;
  v132 = v130;
  v133 = v131;
  v134 = sub_25DD89958();
  os_log_type_t v135 = sub_25DD89C58();
  v136 = (void *)v135;
  BOOL v137 = os_log_type_enabled(v134, v135);
  v257 = v133;
  v258 = v132;
  if (v137)
  {
    uint64_t v138 = swift_slowAlloc();
    v255 = (uint64_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v138 = 138412546;
    aBlock[0] = (uint64_t)v132;
    v139 = v132;
    LODWORD(v256) = v136;
    OUTLINED_FUNCTION_32();
    sub_25DD89CF8();
    v140 = v255;
    uint64_t *v255 = (uint64_t)v120;

    *(_WORD *)(v138 + 12) = 2112;
    LOBYTE(v120) = v138 + 22;
    aBlock[0] = (uint64_t)v133;
    v141 = v133;
    OUTLINED_FUNCTION_32();
    uint64_t v142 = v273;
    sub_25DD89CF8();
    v140[1] = (uint64_t)v266;

    _os_log_impl(&dword_25DD62000, v134, (os_log_type_t)v256, "inputFeats - %@ - derivedInvocationType - %@", (uint8_t *)v138, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F880);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    v134 = v132;
    uint64_t v142 = v273;
  }
  v150 = v278;

  v151 = *(void **)(v265 + 16);
  if (v151)
  {
    v152 = (uint64_t *)swift_allocObject();
    uint64_t v154 = v274;
    uint64_t v153 = v275;
    v152[2] = v271;
    v152[3] = v154;
    uint64_t v155 = v276;
    v152[4] = v153;
    v152[5] = v155;
    uint64_t v156 = v264;
    v152[6] = v142;
    v152[7] = v156;
    v152[8] = v253;
    aBlock[4] = (uint64_t)sub_25DD68B5C;
    v280 = v152;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25DD68450;
    aBlock[3] = (uint64_t)&block_descriptor;
    v157 = _Block_copy(aBlock);
    v266 = v280;
    v158 = v258;
    v159 = v151;
    uint64_t v160 = v271;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    v258 = v159;
    [v159 processInputFeats:v158 completion:v157];
    _Block_release(v157);
    v266 = (uint64_t *)v158;

    OUTLINED_FUNCTION_1();
    if (*(unsigned char *)(v160 + 16) == 1)
    {
      uint64_t v161 = v244;
      sub_25DD68868((uint64_t)v278, v244);
      v162 = sub_25DD89958();
      os_log_type_t v163 = sub_25DD89C68();
      if (os_log_type_enabled(v162, v163))
      {
        v164 = (uint8_t *)swift_slowAlloc();
        double v282 = COERCE_DOUBLE(OUTLINED_FUNCTION_15());
        *(_DWORD *)v164 = 136315138;
        uint64_t v277 = (uint64_t)(v164 + 4);
        swift_bridgeObjectRetain();
        double v281 = COERCE_DOUBLE(OUTLINED_FUNCTION_19());
        sub_25DD89CF8();
        swift_bridgeObjectRelease();
        sub_25DD688CC(v161);
        _os_log_impl(&dword_25DD62000, v162, v163, "error when nc is run - %s", v164, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {
        sub_25DD688CC(v161);
      }

      v165 = v261;
      __swift_project_boxed_opaque_existential_1((void *)(v265 + 24), *(void *)(v265 + 48));
      sub_25DD74C58();
      sub_25DD68A6C();
      swift_allocError();
      unsigned char *v227 = 1;
      swift_willThrow();
      swift_release();
      swift_release();

      id v149 = v258;
      goto LABEL_95;
    }
    uint64_t v170 = v260;
    v171 = v250;
    uint64_t v172 = v263;
    (*(void (**)(char *, uint64_t, uint64_t))(v260 + 16))(v250, v277, v263);
    sub_25DD68868((uint64_t)v278, (uint64_t)v254);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    OUTLINED_FUNCTION_30();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    v173 = sub_25DD89958();
    int v174 = sub_25DD89C58();
    v278 = v173;
    if (os_log_type_enabled(v173, (os_log_type_t)v174))
    {
      LODWORD(v256) = v174;
      uint64_t v172 = swift_slowAlloc();
      v255 = (uint64_t *)swift_slowAlloc();
      double v282 = *(double *)&v255;
      *(_DWORD *)uint64_t v172 = 136316674;
      uint64_t v175 = (uint64_t)v254;
      swift_bridgeObjectRetain();
      double v281 = COERCE_DOUBLE(OUTLINED_FUNCTION_19());
      uint64_t v176 = v275;
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease();
      sub_25DD688CC(v175);
      uint64_t v177 = v274;
      unint64_t v178 = (unint64_t)v268;
      *(_WORD *)(v172 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v281 = COERCE_DOUBLE(sub_25DD7D6C4(v269, v178, (uint64_t *)&v282));
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v172 + 22) = 2048;
      OUTLINED_FUNCTION_1();
      double v281 = *(float *)(v177 + 16);
      OUTLINED_FUNCTION_11();
      swift_release();
      *(_WORD *)(v172 + 32) = 2080;
      OUTLINED_FUNCTION_1();
      if (*(unsigned char *)(v176 + 16)) {
        uint64_t v179 = 0x657461676974694DLL;
      }
      else {
        uint64_t v179 = 0x64657463656C6553;
      }
      if (*(unsigned char *)(v176 + 16)) {
        unint64_t v180 = 0xE900000000000064;
      }
      else {
        unint64_t v180 = 0xE800000000000000;
      }
      double v281 = COERCE_DOUBLE(sub_25DD7D6C4(v179, v180, (uint64_t *)&v282));
      sub_25DD89CF8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v172 + 42) = 2080;
      OUTLINED_FUNCTION_1();
      v229 = v250;
      swift_bridgeObjectRetain();
      double v281 = COERCE_DOUBLE(OUTLINED_FUNCTION_19());
      OUTLINED_FUNCTION_11();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v172 + 52) = 2048;
      OUTLINED_FUNCTION_1();
      double v230 = *(float *)(v273 + 16);
      if (*(unsigned char *)(v273 + 20)) {
        double v230 = 0.0;
      }
      double v281 = v230;
      sub_25DD89CF8();
      swift_release_n();
      *(_WORD *)(v172 + 62) = 2048;
      OUTLINED_FUNCTION_1();
      double v231 = *(float *)(v264 + 16);
      if (*(unsigned char *)(v264 + 20)) {
        double v231 = 0.0;
      }
      double v281 = v231;
      sub_25DD89CF8();
      swift_release_n();
      v232 = v278;
      _os_log_impl(&dword_25DD62000, v278, (os_log_type_t)v256, "NC result for candidate - %s, trpCandidateId %s. Score - %f, mitigationDecision - %s,\nAsset version used - %s, neuralCombinerThreshold - %f, speakerIDThreshold - %f", (uint8_t *)v172, 0x48u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      (*(void (**)(char *, uint64_t))(v260 + 8))(v229, v263);
      uint64_t v228 = v275;
    }
    else
    {
      sub_25DD688CC((uint64_t)v254);

      swift_release_n();
      OUTLINED_FUNCTION_30();
      swift_release_n();
      swift_release_n();
      uint64_t v228 = v275;
      swift_release_n();
      swift_release();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v170 + 8))(v171, v172);
    }
    int v233 = AFIsInternalInstall();
    v77 = v261;
    v234 = v259;
    if (v233 && (sub_25DD684BC(v261) & 1) != 0 && *(unsigned char *)(v265 + 80) == 1)
    {
      swift_beginAccess();
      unsigned char *v234 = 0;
      v235 = sub_25DD89958();
      os_log_type_t v236 = sub_25DD89C58();
      if (OUTLINED_FUNCTION_3(v236))
      {
        v237 = (uint8_t *)OUTLINED_FUNCTION_16();
        *(_WORD *)v237 = 0;
        _os_log_impl(&dword_25DD62000, v235, (os_log_type_t)v172, "Bypass NC decision for FF", v237, 2u);
        OUTLINED_FUNCTION_0();
        v238 = v270;
        v239 = v258;
      }
      else
      {
        v238 = v235;
        v239 = v257;
        v235 = v77;
        v77 = v270;
        v257 = v266;
        v266 = (uint64_t *)v258;
      }
      v240 = v77;

      v270 = v235;
      v77 = v239;
      v258 = v240;
    }

    OUTLINED_FUNCTION_1();
    int v241 = *(_DWORD *)(v274 + 16);
    OUTLINED_FUNCTION_1();
    LODWORD(v278) = *(unsigned __int8 *)(v228 + 16);
    OUTLINED_FUNCTION_1();
    uint64_t v242 = *(void *)(v276 + 24);
    uint64_t v277 = *(void *)(v276 + 16);
    OUTLINED_FUNCTION_1();
    LODWORD(v270) = *(_DWORD *)(v273 + 16);
    LODWORD(v269) = *(unsigned __int8 *)(v273 + 20);
    OUTLINED_FUNCTION_1();
    LODWORD(v77) = *(_DWORD *)(v264 + 16);
    LOBYTE(v80) = *(unsigned char *)(v264 + 20);
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v106 = v267;
    _DWORD *v267 = v241;
    *((unsigned char *)v106 + 4) = (_BYTE)v278;
    *((void *)v106 + 1) = v277;
    *((void *)v106 + 2) = v242;
    v106[6] = v270;
    *((unsigned char *)v106 + 28) = v269;
LABEL_84:
    char v89 = v272;
    goto LABEL_85;
  }
  uint64_t v166 = v245;
  sub_25DD68868((uint64_t)v150, v245);
  v167 = sub_25DD89958();
  os_log_type_t v168 = sub_25DD89C68();
  if (OUTLINED_FUNCTION_3(v168))
  {
    v169 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = OUTLINED_FUNCTION_15();
    *(_DWORD *)v169 = 136315138;
    swift_bridgeObjectRetain();
    double v282 = COERCE_DOUBLE(OUTLINED_FUNCTION_14());
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    sub_25DD688CC(v166);
    _os_log_impl(&dword_25DD62000, v167, (os_log_type_t)v120, "error because ncModel is nil - %s", v169, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    sub_25DD688CC(v166);
  }

  char v218 = v272;
  v219 = v270;
  v220 = *(void **)(v265 + 72);
  sub_25DD64400();
  uint64_t v221 = v220[2];
  unint64_t v222 = v220[3];
  v80 = (uint64_t *)v220[4];
  unint64_t v223 = v220[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25DD652EC(v221, v222, (uint64_t)v80, v223);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v220) = sub_25DD684BC(v261);
  LOBYTE(v80) = (_BYTE)v278;
  uint64_t v224 = v246;
  sub_25DD68868((uint64_t)v278, v246);
  if (v220)
  {
    sub_25DD688CC(v224);
    id v149 = v258;
  }
  else
  {
    char v225 = sub_25DD65AB0(v224);
    sub_25DD688CC(v224);
    id v149 = v258;
    if ((v225 & 1) == 0)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      LODWORD(v77) = 0;
      OUTLINED_FUNCTION_18(1065353216);
      *((unsigned char *)v106 + 28) = (_BYTE)v80;
      char v89 = v218;
      goto LABEL_85;
    }
  }
  __swift_project_boxed_opaque_existential_1((void *)(v265 + 24), *(void *)(v265 + 48));
  sub_25DD74C58();
  sub_25DD68A6C();
  swift_allocError();
  unsigned char *v226 = 0;
  swift_willThrow();
  swift_release();
  swift_release();

LABEL_95:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_25DD68268(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = (_DWORD *)(a3 + 16);
  uint64_t v13 = (unsigned __int8 *)(a4 + 16);
  BOOL v14 = a1 == 0;
  swift_beginAccess();
  *(unsigned char *)(a2 + 16) = v14;
  if (a1)
  {
    objc_msgSend(a1, sel_score);
    int v16 = v15;
    swift_beginAccess();
    _DWORD *v12 = v16;
    unsigned __int8 v17 = objc_msgSend(a1, sel_didMitigate);
  }
  else
  {
    swift_beginAccess();
    unsigned __int8 v17 = 0;
    _DWORD *v12 = -1082130432;
  }
  swift_beginAccess();
  unsigned __int8 *v13 = v17;
  if (a1)
  {
    uint64_t v18 = sub_25DD68B88(a1);
    uint64_t v20 = v19;
    swift_beginAccess();
    *(void *)(a5 + 16) = v18;
    *(void *)(a5 + 24) = v20;
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_threshold);
    int v22 = v21;
  }
  else
  {
    swift_beginAccess();
    *(void *)(a5 + 16) = 0;
    *(void *)(a5 + 24) = 0;
    swift_bridgeObjectRelease();
    int v22 = 0;
  }
  swift_beginAccess();
  *(_DWORD *)(a6 + 16) = v22;
  *(unsigned char *)(a6 + 20) = a1 == 0;
  if (a1)
  {
    objc_msgSend(a1, sel_speakerIDThreshold);
    int v24 = v23;
  }
  else
  {
    int v24 = 0;
  }
  uint64_t result = swift_beginAccess();
  *(_DWORD *)(a7 + 16) = v24;
  *(unsigned char *)(a7 + 20) = a1 == 0;
  return result;
}

void sub_25DD68450(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_25DD684BC(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, 3);
  uint64_t v3 = v2;
  if (a1)
  {
    if (!v2)
    {
      char v5 = 0;
      return v5 & 1;
    }
    sub_25DD68D8C(0, &qword_26A6C6100);
    id v4 = a1;
    char v5 = sub_25DD89CB8();
  }
  else
  {
    if (!v2)
    {
      char v5 = 1;
      return v5 & 1;
    }
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t sub_25DD68570()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return v0;
}

uint64_t sub_25DD685A8()
{
  sub_25DD68570();

  return MEMORY[0x270FA0228](v0, 81, 7);
}

uint64_t type metadata accessor for NeuralCombiner()
{
  return self;
}

id sub_25DD68600(uint64_t a1, uint64_t a2)
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = (void *)sub_25DD89A68();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  v8[0] = 0;
  id v4 = objc_msgSend(v2, sel_initWithConfig_error_, v3, v8);

  if (v4)
  {
    id v5 = v8[0];
  }
  else
  {
    id v6 = v8[0];
    sub_25DD89478();

    swift_willThrow();
  }
  return v4;
}

id sub_25DD686D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  if (a2)
  {
    id v6 = (void *)sub_25DD89A68();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      uint64_t v7 = (void *)sub_25DD89A68();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  v12[0] = 0;
  id v8 = objc_msgSend(v4, sel_initWithConfig_bnnsIrPath_error_, v6, v7, v12);

  if (v8)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    sub_25DD89478();

    swift_willThrow();
  }
  return v8;
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

uint64_t sub_25DD68868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTCandidate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DD688CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTCandidate(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD68928()
{
  return OUTLINED_FUNCTION_4(v0, 20);
}

uint64_t sub_25DD68934()
{
  return OUTLINED_FUNCTION_4(v0, 17);
}

uint64_t sub_25DD68940()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_20();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_25DD68970()
{
  return OUTLINED_FUNCTION_4(v0, 24);
}

uint64_t sub_25DD6897C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25DD68A0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25DD68A6C()
{
  unint64_t result = qword_26A6C6108;
  if (!qword_26A6C6108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6108);
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

uint64_t sub_25DD68AFC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25DD68B5C(void *a1)
{
  return sub_25DD68268(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
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

uint64_t sub_25DD68B88(void *a1)
{
  id v1 = objc_msgSend(a1, sel_assetVersion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25DD89A78();

  return v3;
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

uint64_t sub_25DD68C3C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25DD68C84(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  sub_25DD64840(a1, a2, a3, a4, a5, *(void **)(v5 + 16), *(void **)(v5 + 24), *(void **)(v5 + 32));
}

uint64_t sub_25DD68C90()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_20();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_25DD68CC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_25DD68D4C()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_20();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_25DD68D84(char a1)
{
  sub_25DD64D78(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_25DD68D8C(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for NCTCUData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_25DD68DFC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD68E04(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(unsigned char *)(a1 + 37) = *(unsigned char *)(a2 + 37);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25DD68E6C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v4;
  int v5 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 37) = *(unsigned char *)(a2 + 37);
  return a1;
}

__n128 __swift_memcpy38_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 30) = *(void *)(a2 + 30);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_25DD68F08(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(unsigned char *)(a1 + 37) = *(unsigned char *)(a2 + 37);
  return a1;
}

uint64_t sub_25DD68F78(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 38))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25DD68FCC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 38) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 38) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void type metadata accessor for NeuralCombinerResult()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NCTCUData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_25DD690CC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD69198);
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

uint64_t sub_25DD691C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DD691CC(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void type metadata accessor for NCError()
{
}

unint64_t sub_25DD691E4()
{
  unint64_t result = qword_26A6C6110;
  if (!qword_26A6C6110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6110);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NCData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_25DD692B8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD69384);
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

unsigned char *sub_25DD693AC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for NCMode()
{
}

unint64_t sub_25DD693C8()
{
  unint64_t result = qword_26A6C6118;
  if (!qword_26A6C6118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6118);
  }
  return result;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x2611C5A20);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_3(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_7(double a1)
{
  *(double *)(v1 - 216) = a1;
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_25DD89CF8();
}

id OUTLINED_FUNCTION_12(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

_WORD *OUTLINED_FUNCTION_13(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_25DD7D6C4(v0, v1, (uint64_t *)(v2 - 216));
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_18(int a1@<W8>)
{
  uint64_t v2 = *(void *)(v1 + 200);
  *(_DWORD *)uint64_t v2 = a1;
  *(unsigned char *)(v2 + 4) = 0;
  *(void *)(v2 + 8) = 0;
  *(void *)(v2 + 16) = 0;
  *(_DWORD *)(v2 + 24) = 0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_25DD7D6C4(v0, v1, (uint64_t *)(v2 - 120));
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_21(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t result)
{
  *(void *)(v1 - 120) = result;
  return result;
}

void OUTLINED_FUNCTION_26()
{
  *(unsigned char *)(v0 + 4) = 1;
  *(void *)(v0 + 8) = 0;
  *(void *)(v0 + 16) = 0;
  *(_DWORD *)(v0 + 24) = 0;
}

void OUTLINED_FUNCTION_27(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_29(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

void OUTLINED_FUNCTION_31()
{
  **(_DWORD **)(v0 + 200) = -1082130432;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0 - 216;
}

uint64_t sub_25DD696D4()
{
  uint64_t v0 = sub_25DD89968();
  __swift_allocate_value_buffer(v0, qword_26B37FB10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B37FB10);
  sub_25DD69768();
  sub_25DD89CC8();
  return sub_25DD89978();
}

unint64_t sub_25DD69768()
{
  unint64_t result = qword_26B37F088;
  if (!qword_26B37F088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B37F088);
  }
  return result;
}

uint64_t sub_25DD697A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25DD697BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_25DD697D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

BOOL sub_25DD697F8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25DD69808()
{
  return sub_25DD89F88();
}

uint64_t sub_25DD69830(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449707274 && a2 == 0xE500000000000000;
  if (v3 || (sub_25DD89F08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746144756374 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25DD89F08();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25DD69910()
{
  return 2;
}

uint64_t sub_25DD69918()
{
  return sub_25DD89F98();
}

uint64_t sub_25DD69960()
{
  return 0;
}

uint64_t sub_25DD6996C(char a1)
{
  if (a1) {
    return 0x61746144756374;
  }
  else {
    return 0x6449707274;
  }
}

uint64_t sub_25DD699A0()
{
  return sub_25DD6996C(*v0);
}

uint64_t sub_25DD699A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DD69830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DD699D0()
{
  return sub_25DD69960();
}

uint64_t sub_25DD699F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DD69910();
  *a1 = result;
  return result;
}

uint64_t sub_25DD69A18(uint64_t a1)
{
  unint64_t v2 = sub_25DD6CE48();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DD69A54(uint64_t a1)
{
  unint64_t v2 = sub_25DD6CE48();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DD69A90(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6180);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DD6CE48();
  sub_25DD89FB8();
  sub_25DD89EB8();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6190);
    sub_25DD6CF2C(&qword_26A6C6198, (void (*)(void))sub_25DD6CE94);
    sub_25DD89EE8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_25DD69C20(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C61C0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DD6CE48();
  sub_25DD89FA8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v3 = sub_25DD89E68();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6190);
    sub_25DD6CF2C(&qword_26A6C61C8, (void (*)(void))sub_25DD6CF9C);
    swift_bridgeObjectRetain();
    sub_25DD89E98();
    uint64_t v5 = OUTLINED_FUNCTION_6_0();
    v6(v5);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_25DD69E1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449756374 && a2 == 0xE500000000000000;
  if (v3 || (sub_25DD89F08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6353746C75736572 && a2 == 0xEB0000000065726FLL;
    if (v6 || (sub_25DD89F08() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x676974694D646964 && a2 == 0xEB00000000657461;
      if (v7 || (sub_25DD89F08() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x636E617265747475 && a2 == 0xE900000000000065;
        if (v8 || (sub_25DD89F08() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_25DD89F08();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_25DD6A020()
{
  return 5;
}

uint64_t sub_25DD6A028(char a1)
{
  return *(void *)&aTcuid_1[8 * a1];
}

uint64_t sub_25DD6A048(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C61B8);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DD6CEE0();
  sub_25DD89FB8();
  sub_25DD89EB8();
  if (!v1)
  {
    sub_25DD89ED8();
    sub_25DD89EC8();
    sub_25DD89EA8();
    sub_25DD89EA8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_25DD6A1E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C61A8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DD6CEE0();
  sub_25DD89FA8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  OUTLINED_FUNCTION_15_0();
  uint64_t v5 = sub_25DD89E68();
  uint64_t v7 = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_15_0();
  sub_25DD89E88();
  int v9 = v8;
  OUTLINED_FUNCTION_15_0();
  char v20 = sub_25DD89E78();
  uint64_t v18 = sub_25DD89E58();
  uint64_t v19 = v10;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25DD89E58();
  uint64_t v13 = v12;
  uint64_t v17 = v11;
  uint64_t v14 = OUTLINED_FUNCTION_4_0();
  v15(v14);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(_DWORD *)(a2 + 16) = v9;
  *(unsigned char *)(a2 + 20) = v20 & 1;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v13;
  return result;
}

uint64_t sub_25DD6A478@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25DD69C20(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_25DD6A4A8(void *a1)
{
  return sub_25DD69A90(a1);
}

uint64_t sub_25DD6A4C8()
{
  return sub_25DD6A028(*v0);
}

uint64_t sub_25DD6A4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DD69E1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DD6A4F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DD6A020();
  *a1 = result;
  return result;
}

uint64_t sub_25DD6A520(uint64_t a1)
{
  unint64_t v2 = sub_25DD6CEE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DD6A55C(uint64_t a1)
{
  unint64_t v2 = sub_25DD6CEE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_25DD6A598@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25DD6A1E8(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_25DD6A5E8(void *a1)
{
  return sub_25DD6A048(a1);
}

BOOL sub_25DD6A600()
{
  OUTLINED_FUNCTION_17();
  uint64_t v0 = (__CFString *)sub_25DD89A68();
  OUTLINED_FUNCTION_17();
  uint64_t v1 = (__CFString *)sub_25DD89A68();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, 0);

  if (AppBooleanValue)
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25DD89968();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B37FB10);
    uint64_t v4 = sub_25DD89958();
    os_log_type_t v5 = sub_25DD89C58();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      long long v7 = "MHLogger - com.apple.voicetrigger 'AttentiveSiri AudioLogging Enabled' is enabled";
LABEL_10:
      _os_log_impl(&dword_25DD62000, v4, v5, v7, v6, 2u);
      MEMORY[0x2611C5A20](v6, -1, -1);
    }
  }
  else
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DD89968();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B37FB10);
    uint64_t v4 = sub_25DD89958();
    os_log_type_t v5 = sub_25DD89C58();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      long long v7 = "MHLogger - com.apple.voicetrigger 'AttentiveSiri AudioLogging Enabled' is not set/present";
      goto LABEL_10;
    }
  }

  return AppBooleanValue != 0;
}

uint64_t sub_25DD6A7C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_25DD894B8();
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6150);
  uint64_t v15 = OUTLINED_FUNCTION_19_0(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6158);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_25DD8A910;
  uint64_t v17 = MEMORY[0x263F8D310];
  *(void *)(v16 + 56) = MEMORY[0x263F8D310];
  unint64_t v18 = sub_25DD6C8CC();
  *(void *)(v16 + 64) = v18;
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  id v19 = objc_allocWithZone(MEMORY[0x263EFF910]);
  swift_bridgeObjectRetain();
  id v20 = objc_msgSend(v19, sel_init);
  objc_msgSend(v20, sel_timeIntervalSince1970);
  double v22 = v21;

  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v23 = sub_25DD89EF8();
  *(void *)(v16 + 96) = v17;
  *(void *)(v16 + 104) = v18;
  *(void *)(v16 + 72) = v23;
  *(void *)(v16 + 80) = v24;
  OUTLINED_FUNCTION_17();
  sub_25DD89A98();
  sub_25DD68D8C(0, &qword_26A6C6168);
  OUTLINED_FUNCTION_17();
  id v25 = sub_25DD6AAB0();
  uint64_t v26 = (void *)sub_25DD89A68();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v25, sel_URLByAppendingPathComponent_, v26);

  if (!v27)
  {
LABEL_10:
    uint64_t result = __swift_storeEnumTagSinglePayload(v3, 1, 1, v7);
    goto LABEL_11;
  }
  sub_25DD89498();

  char v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v28(v3, v13, v7);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v7);
  uint64_t result = __swift_getEnumTagSinglePayload(v3, 1, v7);
  if (result != 1) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v28)(a3, v3, v7);
  }
LABEL_11:
  __break(1u);
  return result;
}

id sub_25DD6AAB0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25DD89A68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initFileURLWithPath_, v1);

  return v2;
}

uint64_t sub_25DD6AB24(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = type metadata accessor for TTCandidate(0);
  OUTLINED_FUNCTION_2();
  uint64_t v45 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6170);
  uint64_t v8 = OUTLINED_FUNCTION_19_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v46 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v47 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v48 = OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates;
  uint64_t v50 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x263F8EE78];
  uint64_t v52 = v2;
  while (1)
  {
    uint64_t v56 = (uint64_t)v14;
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_20;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v17 >= v47) {
      goto LABEL_42;
    }
    unint64_t v18 = *(void *)(v46 + 8 * v17);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v47) {
        goto LABEL_42;
      }
      unint64_t v18 = *(void *)(v46 + 8 * v13);
      if (!v18)
      {
        int64_t v13 = v17 + 2;
        if (v17 + 2 >= v47) {
          goto LABEL_42;
        }
        unint64_t v18 = *(void *)(v46 + 8 * v13);
        if (!v18) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
LABEL_20:
    id v20 = (uint64_t *)(*(void *)(v50 + 48) + 16 * v16);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(v50 + 56) + 40 * v16;
    int v24 = *(_DWORD *)v23;
    int v25 = *(unsigned __int8 *)(v23 + 4);
    uint64_t v54 = *(void *)(v23 + 8);
    int64_t v55 = v13;
    uint64_t v26 = *(void *)(a2 + v48);
    uint64_t v27 = *(void *)(v26 + 16);
    uint64_t v53 = *(void *)(v23 + 16);
    if (v27)
    {
      uint64_t v28 = v26 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v29 = *(void *)(v45 + 72);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_25DD68868(v28, (uint64_t)v3);
        BOOL v30 = *v3 == v22 && v3[1] == v21;
        if (v30 || (sub_25DD89F08() & 1) != 0) {
          break;
        }
        sub_25DD688CC((uint64_t)v3);
        v28 += v29;
        if (!--v27)
        {
          uint64_t v31 = 1;
          uint64_t v2 = v52;
          goto LABEL_31;
        }
      }
      uint64_t v2 = v52;
      sub_25DD6C9A0((uint64_t)v3, v52);
      uint64_t v31 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v31 = 1;
    }
LABEL_31:
    __swift_storeEnumTagSinglePayload(v2, v31, 1, v49);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v2, 1, v49) == 1)
    {
      sub_25DD6C940(v2);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      if (!v25) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v32 = *(void *)(v2 + 72);
      uint64_t v33 = *(void *)(v2 + 80);
      swift_bridgeObjectRetain();
      sub_25DD688CC(v2);
      if (!v25) {
        goto LABEL_36;
      }
    }
    if (v25 == 1)
    {
      char v34 = 1;
      goto LABEL_37;
    }
LABEL_36:
    char v34 = sub_25DD89F08();
LABEL_37:
    swift_bridgeObjectRelease();
    uint64_t v35 = v56;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25DD6BEBC(0, *(void *)(v56 + 16) + 1, 1, v56);
      uint64_t v35 = result;
    }
    unint64_t v37 = *(void *)(v35 + 16);
    unint64_t v36 = *(void *)(v35 + 24);
    uint64_t v38 = v35;
    if (v37 >= v36 >> 1)
    {
      uint64_t result = (uint64_t)sub_25DD6BEBC((char *)(v36 > 1), v37 + 1, 1, v35);
      uint64_t v38 = result;
    }
    uint64_t v14 = (uint64_t (*)(uint64_t))v38;
    *(void *)(v38 + 16) = v37 + 1;
    unint64_t v39 = v38 + 56 * v37;
    *(void *)(v39 + 32) = v22;
    *(void *)(v39 + 40) = v21;
    *(_DWORD *)(v39 + 48) = v24;
    *(unsigned char *)(v39 + 52) = v34 & 1;
    *(void *)(v39 + 56) = v32;
    *(void *)(v39 + 64) = v33;
    int64_t v13 = v55;
    *(void *)(v39 + 72) = v54;
    uint64_t v2 = v52;
    *(void *)(v39 + 80) = v53;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v47)
  {
LABEL_42:
    uint64_t v40 = v14;
    swift_release();
    uint64_t v42 = *(void *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId);
    uint64_t v41 = *(void *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId + 8);
    uint64_t v43 = *(void *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId);
    uint64_t v44 = *(void *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId + 8);
    swift_bridgeObjectRetain();
    sub_25DD6B008(v42, v41, v40, v43, v44);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  unint64_t v18 = *(void *)(v46 + 8 * v19);
  if (v18)
  {
    int64_t v13 = v19;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v13 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v13 >= v47) {
      goto LABEL_42;
    }
    unint64_t v18 = *(void *)(v46 + 8 * v13);
    ++v19;
    if (v18) {
      goto LABEL_19;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_25DD6B008(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t a1), uint64_t a4, uint64_t a5)
{
  uint64_t v65 = a4;
  uint64_t v66 = a5;
  uint64_t v76 = a2;
  v77 = a3;
  uint64_t v75 = a1;
  uint64_t v7 = sub_25DD899A8();
  OUTLINED_FUNCTION_2();
  uint64_t v74 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_25();
  uint64_t v72 = v10;
  uint64_t v73 = sub_25DD899D8();
  OUTLINED_FUNCTION_2();
  uint64_t v71 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_25();
  uint64_t v70 = v13;
  uint64_t v14 = sub_25DD899B8();
  OUTLINED_FUNCTION_2();
  uint64_t v67 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_0();
  sub_25DD894B8();
  OUTLINED_FUNCTION_2();
  uint64_t v68 = v18;
  uint64_t v69 = v17;
  uint64_t v20 = *(void *)(v19 + 64);
  uint64_t v21 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  int v24 = (char *)&v59 - v23;
  uint64_t v25 = sub_25DD89AB8();
  uint64_t v26 = OUTLINED_FUNCTION_19_0(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_8();
  uint64_t v27 = sub_25DD89428();
  uint64_t v28 = OUTLINED_FUNCTION_19_0(v27);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_8();
  uint64_t result = sub_25DD6A600();
  if (result)
  {
    uint64_t v63 = v7;
    BOOL v64 = v24;
    sub_25DD89468();
    swift_allocObject();
    uint64_t v30 = sub_25DD89458();
    sub_25DD89418();
    sub_25DD89438();
    uint64_t aBlock = v75;
    uint64_t v79 = v76;
    v80 = v77;
    sub_25DD6BC10();
    uint64_t v31 = sub_25DD89448();
    if (!v5)
    {
      uint64_t v33 = v31;
      unint64_t v34 = v32;
      v77 = (uint64_t (*)(uint64_t))v30;
      sub_25DD89AA8();
      uint64_t v35 = sub_25DD89A88();
      if (v36)
      {
        uint64_t v37 = (uint64_t)v64;
        uint64_t v60 = v35;
        uint64_t v75 = v33;
        uint64_t v59 = v36;
        sub_25DD6A7C4(v65, v66, (uint64_t)v64);
        uint64_t v76 = 0;
        sub_25DD89488();
        sub_25DD894A8();
        swift_bridgeObjectRelease();
        uint64_t v38 = v68;
        uint64_t v39 = *(void *)(v68 + 8);
        uint64_t v65 = v68 + 8;
        uint64_t v66 = v39;
        unint64_t v62 = v34;
        uint64_t v40 = v69;
        OUTLINED_FUNCTION_18_0();
        v41();
        sub_25DD68D8C(0, &qword_26A6C6128);
        uint64_t v42 = v67;
        (*(void (**)(uint64_t, void, uint64_t))(v67 + 104))(v6, *MEMORY[0x263F8F080], v14);
        uint64_t v61 = sub_25DD89C98();
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v6, v14);
        (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v22, v37, v40);
        unint64_t v43 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
        uint64_t v44 = swift_allocObject();
        uint64_t v45 = v59;
        *(void *)(v44 + 16) = v60;
        *(void *)(v44 + 24) = v45;
        (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v44 + v43, v22, v40);
        unsigned __int8 v82 = sub_25DD6BD58;
        uint64_t v83 = v44;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v79 = 1107296256;
        v80 = sub_25DD6BB98;
        v81 = &block_descriptor_0;
        uint64_t v46 = _Block_copy(&aBlock);
        uint64_t v47 = v70;
        sub_25DD899C8();
        uint64_t v84 = MEMORY[0x263F8EE78];
        sub_25DD6C884(&qword_26A6C6130, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6138);
        sub_25DD6BDD4();
        uint64_t v48 = v72;
        sub_25DD89D58();
        uint64_t v49 = (void *)v61;
        MEMORY[0x2611C5190](0, v47, v48, v46);
        _Block_release(v46);

        sub_25DD6BC5C(v75, v62);
        swift_release();
        OUTLINED_FUNCTION_18_0();
        v50();
        OUTLINED_FUNCTION_18_0();
        v51();
        OUTLINED_FUNCTION_18_0();
        v52();
      }
      else
      {
        uint64_t v53 = v33;
        unint64_t v54 = v34;
        if (qword_26B37F070 != -1) {
          swift_once();
        }
        uint64_t v55 = sub_25DD89968();
        __swift_project_value_buffer(v55, (uint64_t)qword_26B37FB10);
        uint64_t v56 = sub_25DD89958();
        os_log_type_t v57 = sub_25DD89C68();
        if (os_log_type_enabled(v56, v57))
        {
          int v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int v58 = 0;
          _os_log_impl(&dword_25DD62000, v56, v57, "error serializing ncData to json string", v58, 2u);
          MEMORY[0x2611C5A20](v58, -1, -1);
        }
        sub_25DD6BC5C(v53, v54);
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_25DD6B660(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v32 = a1;
  uint64_t v33 = a3;
  uint64_t v4 = sub_25DD89AB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_25DD894B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25DD89968();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26B37FB10);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v11, v33, v8);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = v13;
  uint64_t v14 = sub_25DD89958();
  os_log_type_t v15 = sub_25DD89C58();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v4;
    uint64_t v18 = v17;
    uint64_t v27 = swift_slowAlloc();
    v35[0] = v27;
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    int v26 = v16;
    uint64_t v19 = v32;
    uint64_t v34 = sub_25DD7D6C4(v32, a2, v35);
    uint64_t v29 = v5;
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v28 = v7;
    sub_25DD6C884(&qword_26A6C6148, MEMORY[0x263F06EA8]);
    uint64_t v20 = sub_25DD89EF8();
    uint64_t v34 = sub_25DD7D6C4(v20, v21, v35);
    uint64_t v7 = v28;
    uint64_t v5 = v29;
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_25DD62000, v14, (os_log_type_t)v26, "writing to file with json %s at %s", (uint8_t *)v18, 0x16u);
    uint64_t v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v22, -1, -1);
    uint64_t v23 = v18;
    uint64_t v4 = v30;
    MEMORY[0x2611C5A20](v23, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);

    uint64_t v19 = v32;
  }
  v35[0] = v19;
  v35[1] = a2;
  sub_25DD89AA8();
  sub_25DD6BE70();
  sub_25DD89D28();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_25DD6BB98(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_25DD6BBDC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for MHLogger()
{
  return self;
}

unint64_t sub_25DD6BC10()
{
  unint64_t result = qword_26A6C6120;
  if (!qword_26A6C6120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6120);
  }
  return result;
}

uint64_t sub_25DD6BC5C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25DD6BCB4()
{
  uint64_t v1 = sub_25DD894B8();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25DD6BD58()
{
  uint64_t v1 = *(void *)(sub_25DD894B8() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_25DD6B660(v2, v3, v4);
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

unint64_t sub_25DD6BDD4()
{
  unint64_t result = qword_26A6C6140;
  if (!qword_26A6C6140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C6138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6140);
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

unint64_t sub_25DD6BE70()
{
  unint64_t result = qword_26B37F970;
  if (!qword_26B37F970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B37F970);
  }
  return result;
}

char *sub_25DD6BEBC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6178);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25DD6C658((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25DD6C1DC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_25DD6BFB4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_11_0();
    }
  }
  OUTLINED_FUNCTION_10_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8D8);
    size_t v11 = (void *)OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_3_0(v11);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25DD6C6F4((char *)(a4 + 32), v4, (char *)(v5 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_16_0();
    sub_25DD6C2E0(v12, v13, v14, v15);
  }
}

void sub_25DD6C06C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_11_0();
    }
  }
  OUTLINED_FUNCTION_10_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F898);
    size_t v11 = (void *)OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_3_0(v11);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25DD6C790((char *)(a4 + 32), v4, (char *)(v5 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_16_0();
    sub_25DD6C400(v12, v13, v14, v15);
  }
}

void sub_25DD6C124(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_11_0();
    }
  }
  OUTLINED_FUNCTION_10_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A0);
    size_t v11 = (void *)OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_3_0(v11);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25DD6C7EC((char *)(a4 + 32), v4, (char *)(v5 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_16_0();
    sub_25DD6C500(v12, v13, v14, v15);
  }
}

uint64_t sub_25DD6C1DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25DD89E38();
  __break(1u);
  return result;
}

uint64_t sub_25DD6C2E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8B8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25DD89E38();
  __break(1u);
  return result;
}

uint64_t sub_25DD6C400(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25DD89E38();
  __break(1u);
  return result;
}

uint64_t sub_25DD6C500(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25DD89E38();
  __break(1u);
  return result;
}

char *sub_25DD6C600(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_14_0();
    uint64_t result = (char *)OUTLINED_FUNCTION_13_0();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_5_0(a3, result);
  }
  return result;
}

char *sub_25DD6C658(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25DD89E38();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

char *sub_25DD6C6F4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25DD89E38();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_25DD6C790(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_14_0();
    uint64_t result = (char *)OUTLINED_FUNCTION_13_0();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_5_0(a3, result);
  }
  return result;
}

char *sub_25DD6C7EC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25DD89E38();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_25DD6C884(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25DD6C8CC()
{
  unint64_t result = qword_26A6C6160;
  if (!qword_26A6C6160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6160);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25DD6C940(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD6C9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTCandidate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for NCTCUData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NCTCUData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NCTCUData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for NCTCUData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NCTCUData(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for NCTCUData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NCTCUData()
{
  return &type metadata for NCTCUData;
}

uint64_t destroy for NCData()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s21SiriTurnTakingManager6NCDataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NCData(void *a1, void *a2)
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

uint64_t assignWithTake for NCData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NCData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NCData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NCData()
{
  return &type metadata for NCData;
}

unint64_t sub_25DD6CE48()
{
  unint64_t result = qword_26A6C6188;
  if (!qword_26A6C6188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6188);
  }
  return result;
}

unint64_t sub_25DD6CE94()
{
  unint64_t result = qword_26A6C61A0;
  if (!qword_26A6C61A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61A0);
  }
  return result;
}

unint64_t sub_25DD6CEE0()
{
  unint64_t result = qword_26A6C61B0;
  if (!qword_26A6C61B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61B0);
  }
  return result;
}

uint64_t sub_25DD6CF2C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C6190);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25DD6CF9C()
{
  unint64_t result = qword_26A6C61D0;
  if (!qword_26A6C61D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61D0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NCTCUData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25DD6D0B4);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NCTCUData.CodingKeys()
{
  return &type metadata for NCTCUData.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for NCData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD6D1B8);
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

ValueMetadata *type metadata accessor for NCData.CodingKeys()
{
  return &type metadata for NCData.CodingKeys;
}

unint64_t sub_25DD6D1F4()
{
  unint64_t result = qword_26A6C61D8;
  if (!qword_26A6C61D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61D8);
  }
  return result;
}

unint64_t sub_25DD6D244()
{
  unint64_t result = qword_26A6C61E0;
  if (!qword_26A6C61E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61E0);
  }
  return result;
}

unint64_t sub_25DD6D294()
{
  unint64_t result = qword_26A6C61E8;
  if (!qword_26A6C61E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61E8);
  }
  return result;
}

unint64_t sub_25DD6D2E4()
{
  unint64_t result = qword_26A6C61F0;
  if (!qword_26A6C61F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61F0);
  }
  return result;
}

unint64_t sub_25DD6D334()
{
  unint64_t result = qword_26A6C61F8;
  if (!qword_26A6C61F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C61F8);
  }
  return result;
}

unint64_t sub_25DD6D384()
{
  unint64_t result = qword_26A6C6200;
  if (!qword_26A6C6200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6200);
  }
  return result;
}

size_t OUTLINED_FUNCTION_3_0(void *a1)
{
  size_t result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / v2);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_5_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_25DD89E38();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1)
{
  return a1 - 8;
}

BOOL static TTClientError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TTClientError.hash(into:)()
{
  return sub_25DD89F88();
}

uint64_t TTClientError.hashValue.getter()
{
  return sub_25DD89F98();
}

unint64_t sub_25DD6D5FC()
{
  unint64_t result = qword_26A6C6208;
  if (!qword_26A6C6208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6208);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TTClientError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25DD6D714);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTClientError()
{
  return &type metadata for TTClientError;
}

uint64_t sub_25DD6D74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25DD6D774(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25DD6D788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_25DD6D79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_25DD6D7B0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25DD6D7C4(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD6D7FC(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25DD6D86C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *int v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *unint64_t result = *a2;
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
          *int v3 = *a2;
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

uint64_t sub_25DD6DAE8(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25DD6DB3C(uint64_t a1, int a2)
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

uint64_t sub_25DD6DB7C(uint64_t result, int a2, int a3)
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

void type metadata accessor for TTMOverridesExecutor()
{
}

unint64_t sub_25DD6DBD4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0x65636E756F6E6E61;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      unint64_t result = 0x74756374726F6873;
      break;
  }
  return result;
}

uint64_t sub_25DD6DCBC()
{
  unint64_t v0 = sub_25DD89E48();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25DD6DD08(char a1)
{
  uint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x74694D746F6E6F64;
      break;
    case 2:
      uint64_t result = 0x65764F746F6E6F64;
      break;
    case 3:
      return result;
    default:
      uint64_t result = OUTLINED_FUNCTION_16_1();
      break;
  }
  return result;
}

unint64_t sub_25DD6DDB4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25DD6DBD4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25DD6DDE0(unsigned __int8 *a1, char *a2)
{
  return sub_25DD875B0(*a1, *a2);
}

uint64_t sub_25DD6DDEC()
{
  return sub_25DD7A194(*v0);
}

uint64_t sub_25DD6DDF4(uint64_t a1)
{
  return sub_25DD7A36C(a1, *v1);
}

uint64_t sub_25DD6DDFC(uint64_t a1)
{
  return sub_25DD7A438(a1, *v1);
}

uint64_t sub_25DD6DE04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DD6DCBC();
  *a1 = result;
  return result;
}

uint64_t sub_25DD6DE34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25DD6DD08(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25DD6DE60()
{
  active = (objc_class *)type metadata accessor for ConcurrentActiveRequestMatcher();
  id v1 = objc_msgSend(objc_allocWithZone(active), sel_init);
  sub_25DD6BFB4(0, 1, 1, MEMORY[0x263F8EE78]);
  uint64_t v3 = v2;
  unint64_t v5 = *(void *)(v2 + 16);
  unint64_t v4 = *(void *)(v2 + 24);
  unint64_t v6 = v5 + 1;
  if (v5 >= v4 >> 1)
  {
    OUTLINED_FUNCTION_0_0(v4);
    uint64_t v3 = v19;
  }
  uint64_t v29 = active;
  uint64_t v30 = &off_270ABE1D0;
  *(void *)&long long v27 = v1;
  *(void *)(v3 + 16) = v6;
  sub_25DD6FFD4(&v27, v3 + 40 * v5 + 32);
  uint64_t v7 = (objc_class *)type metadata accessor for ShortcutMatcher();
  objc_msgSend(objc_allocWithZone(v7), sel_init);
  OUTLINED_FUNCTION_4_1();
  if (v9)
  {
    OUTLINED_FUNCTION_0_0(v8);
    uint64_t v3 = v20;
  }
  uint64_t v29 = v7;
  uint64_t v30 = &off_270ABDF10;
  *(void *)&long long v27 = v1;
  *(void *)(v3 + 16) = v6;
  sub_25DD6FFD4(&v27, v3 + 40 * v5 + 32);
  uint64_t v10 = (objc_class *)type metadata accessor for LASOverrideMatcher();
  objc_msgSend(objc_allocWithZone(v10), sel_init);
  OUTLINED_FUNCTION_4_1();
  if (v9)
  {
    OUTLINED_FUNCTION_0_0(v11);
    uint64_t v3 = v21;
  }
  uint64_t v29 = v10;
  uint64_t v30 = &off_270ABEBA8;
  *(void *)&long long v27 = v1;
  *(void *)(v3 + 16) = v6;
  sub_25DD6FFD4(&v27, v3 + 40 * v5 + 32);
  uint64_t v12 = (objc_class *)type metadata accessor for UniversalCommandMatcher();
  objc_msgSend(objc_allocWithZone(v12), sel_init);
  OUTLINED_FUNCTION_4_1();
  if (v9)
  {
    OUTLINED_FUNCTION_0_0(v13);
    uint64_t v3 = v22;
  }
  uint64_t v29 = v12;
  uint64_t v30 = &off_270ABEB90;
  *(void *)&long long v27 = v1;
  *(void *)(v3 + 16) = v6;
  sub_25DD6FFD4(&v27, v3 + 40 * v5 + 32);
  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AllowListMatcher()), sel_init);
  unint64_t v14 = *(void *)(v3 + 24);
  if (*(void *)(v3 + 16) >= v14 >> 1)
  {
    OUTLINED_FUNCTION_0_0(v14);
    uint64_t v3 = v23;
  }
  OUTLINED_FUNCTION_3_1((uint64_t)&off_270ABDF98, v25, v27, v28, (uint64_t)v29, (uint64_t)v30);
  type metadata accessor for AnnounceMatcher();
  uint64_t v15 = swift_allocObject() + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache;
  uint64_t v16 = sub_25DD89538();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  unint64_t v17 = *(void *)(v3 + 24);
  if (*(void *)(v3 + 16) >= v17 >> 1)
  {
    OUTLINED_FUNCTION_0_0(v17);
    uint64_t v3 = v24;
  }
  OUTLINED_FUNCTION_3_1((uint64_t)&off_270ABE1E8, v26, v27, v28, (uint64_t)v29, (uint64_t)v30);
  return v3;
}

unint64_t sub_25DD6E0C8(uint64_t a1, const char *a2, const char *a3, const char *a4)
{
  uint64_t v10 = type metadata accessor for TTCandidate(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (uint64_t *)((char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (void *)MEMORY[0x263F8EE80];
  unint64_t v91 = MEMORY[0x263F8EE80];
  uint64_t v15 = *((void *)v4 + 3);
  uint64_t v84 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v15);
  v81 = a2;
  unsigned __int8 v82 = a3;
  uint64_t v83 = a4;
  sub_25DD75238();
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v72 = v16;
  if (v16)
  {
    uint64_t v17 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v79 = *(void *)(v11 + 72);
    uint64_t v78 = a1;
    swift_bridgeObjectRetain();
    char v18 = 0;
    uint64_t v19 = (void *)MEMORY[0x263F8EE80];
    v80 = v13;
    do
    {
      sub_25DD68868(v17, (uint64_t)v13);
      LODWORD(v85) = sub_25DD6E88C((uint64_t)v13, (uint64_t)v81, (uint64_t)v82, (uint64_t)v83);
      uint64_t v21 = v20;
      if (v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = (void *)v91;
      }
      uint64_t v22 = *v13;
      uint64_t v23 = v13[1];
      uint64_t v5 = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v88 = v19;
      unint64_t v91 = 0x8000000000000000;
      unint64_t v24 = sub_25DD85748(v22, v23);
      if (__OFADD__(v19[2], (v25 & 1) == 0)) {
        goto LABEL_63;
      }
      unint64_t v26 = v24;
      char v27 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F890);
      if (sub_25DD89DE8())
      {
        unint64_t v28 = sub_25DD85748(v22, v23);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_67;
        }
        unint64_t v26 = v28;
      }
      uint64_t v30 = (void *)v88;
      if (v27)
      {
        uint64_t v31 = *(void *)(v88 + 56) + 16 * v26;
        swift_bridgeObjectRelease();
        *(unsigned char *)uint64_t v31 = v85;
        *(void *)(v31 + 8) = v5;
      }
      else
      {
        *(void *)(v88 + 8 * (v26 >> 6) + 64) |= 1 << v26;
        uint64_t v32 = (uint64_t *)(v30[6] + 16 * v26);
        *uint64_t v32 = v22;
        v32[1] = v23;
        uint64_t v33 = v30[7] + 16 * v26;
        *(unsigned char *)uint64_t v33 = v85;
        *(void *)(v33 + 8) = v5;
        uint64_t v34 = v30[2];
        BOOL v35 = __OFADD__(v34, 1);
        uint64_t v36 = v34 + 1;
        if (v35) {
          goto LABEL_64;
        }
        v30[2] = v36;
        swift_bridgeObjectRetain();
      }
      uint64_t v19 = v30;
      unint64_t v91 = (unint64_t)v30;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v13 = v80;
      sub_25DD688CC((uint64_t)v80);
      v17 += v79;
      char v18 = 1;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    uint64_t v16 = v72;
    unint64_t v14 = v30;
  }
  uint64_t v37 = v84;
  __swift_project_boxed_opaque_existential_1(v84, *((void *)v84 + 3));
  swift_bridgeObjectRetain();
  sub_25DD76164();
  swift_bridgeObjectRelease();
  if (v37[40]) {
    goto LABEL_59;
  }
  uint64_t v38 = v14[8];
  uint64_t v74 = v14 + 8;
  uint64_t v39 = 1 << *((unsigned char *)v14 + 32);
  uint64_t v40 = -1;
  if (v39 < 64) {
    uint64_t v40 = ~(-1 << v39);
  }
  unint64_t v41 = v40 & v38;
  int64_t v75 = (unint64_t)(v39 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v42 = 0;
  uint64_t v43 = MEMORY[0x263F8EE78];
  uint64_t v84 = "reservedForTests";
  unint64_t v85 = 0x800000025DD8BCF0;
  unsigned __int8 v82 = "concurrentActiveRequestMatcher";
  uint64_t v83 = "universalCommandMatcher";
  v81 = "com.apple.voicetrigger";
  uint64_t v76 = v5;
  uint64_t v73 = v14;
  if (!v41) {
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v79 = (v41 - 1) & v41;
  v80 = (uint64_t *)v42;
  for (unint64_t i = __clz(__rbit64(v41)) | (v42 << 6); ; unint64_t i = __clz(__rbit64(v46)) + (v47 << 6))
  {
    uint64_t v52 = v14[7];
    uint64_t v53 = (uint64_t *)(v14[6] + 16 * i);
    uint64_t v54 = v53[1];
    uint64_t v77 = *v53;
    uint64_t v55 = *(void *)(v52 + 16 * i + 8);
    uint64_t v90 = v43;
    uint64_t v56 = *(void *)(v55 + 16);
    uint64_t v78 = v54;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v56)
    {
      unint64_t v57 = 0;
      uint64_t v58 = v55 + 32;
      while (2)
      {
        if (v57 >= *(void *)(v55 + 16))
        {
          __break(1u);
LABEL_63:
          __break(1u);
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        ++v57;
        sub_25DD6FB28(v58, (uint64_t)&v88);
        __swift_project_boxed_opaque_existential_1(&v88, *(uint64_t *)&v89[8]);
        OUTLINED_FUNCTION_17_0();
        switch(v59())
        {
          case 1u:
          case 2u:
          case 3u:
          case 6u:
            goto LABEL_43;
          case 5u:
            swift_bridgeObjectRelease();
            goto LABEL_44;
          default:
            OUTLINED_FUNCTION_5_1();
LABEL_43:
            char v60 = sub_25DD89F08();
            swift_bridgeObjectRelease();
            if (v60)
            {
LABEL_44:
              sub_25DD6FF10((uint64_t)&v88);
            }
            else
            {
              long long v86 = v88;
              v87[0] = *(_OWORD *)v89;
              *(_OWORD *)((char *)v87 + 9) = *(_OWORD *)&v89[9];
              uint64_t v61 = v90;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_25DD7F594(0, *(void *)(v61 + 16) + 1, 1);
                uint64_t v61 = v90;
              }
              unint64_t v63 = *(void *)(v61 + 16);
              unint64_t v62 = *(void *)(v61 + 24);
              if (v63 >= v62 >> 1)
              {
                sub_25DD7F594((char *)(v62 > 1), v63 + 1, 1);
                uint64_t v61 = v90;
              }
              *(void *)(v61 + 16) = v63 + 1;
              BOOL v64 = (_OWORD *)(v61 + 48 * v63);
              long long v65 = v86;
              long long v66 = v87[0];
              *(_OWORD *)((char *)v64 + 57) = *(_OWORD *)((char *)v87 + 9);
              v64[2] = v65;
              v64[3] = v66;
            }
            v58 += 48;
            if (v56 != v57) {
              continue;
            }
            uint64_t v67 = v90;
            unint64_t v14 = v73;
            uint64_t v43 = MEMORY[0x263F8EE78];
            break;
        }
        break;
      }
    }
    else
    {
      uint64_t v67 = v43;
    }
    swift_bridgeObjectRelease();
    uint64_t v69 = sub_25DD6F9B0(&v88, v77, v78);
    unint64_t v41 = v79;
    if (*(void *)(v68 + 8))
    {
      *(void *)(v68 + 8) = v67;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
    }
    ((void (*)(long long *, void))v69)(&v88, 0);
    swift_bridgeObjectRelease();
    uint64_t v42 = (uint64_t)v80;
    if (v41) {
      goto LABEL_19;
    }
LABEL_20:
    int64_t v45 = v42 + 1;
    if (__OFADD__(v42, 1)) {
      goto LABEL_65;
    }
    if (v45 >= v75) {
      break;
    }
    unint64_t v46 = v74[v45];
    uint64_t v47 = v42 + 1;
    if (!v46)
    {
      OUTLINED_FUNCTION_15_1();
      if (v48 == v35) {
        break;
      }
      OUTLINED_FUNCTION_13_1();
      if (!v46)
      {
        OUTLINED_FUNCTION_15_1();
        if (v48 == v35) {
          break;
        }
        OUTLINED_FUNCTION_13_1();
        if (!v46)
        {
          int64_t v50 = v49 + 3;
          if (v50 >= v75) {
            break;
          }
          unint64_t v46 = v74[v50];
          if (v46)
          {
            uint64_t v47 = v50;
            goto LABEL_36;
          }
          while (!__OFADD__(v50, 1))
          {
            OUTLINED_FUNCTION_15_1();
            if (v48 == v35) {
              goto LABEL_58;
            }
            OUTLINED_FUNCTION_13_1();
            int64_t v50 = v51 + 1;
            if (v46) {
              goto LABEL_36;
            }
          }
LABEL_66:
          __break(1u);
LABEL_67:
          sub_25DD89F28();
          __break(1u);
          JUMPOUT(0x25DD6E870);
        }
      }
    }
LABEL_36:
    uint64_t v79 = (v46 - 1) & v46;
    v80 = (uint64_t *)v47;
  }
LABEL_58:
  swift_release();
  uint64_t v16 = v72;
LABEL_59:
  unint64_t v70 = v91;
  if (v16) {
    swift_bridgeObjectRelease();
  }
  return v70;
}

uint64_t sub_25DD6E88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v118 = a3;
  uint64_t v119 = a4;
  uint64_t v117 = a2;
  uint64_t v5 = sub_25DD89968();
  unint64_t v6 = *(char **)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v9 = (char *)v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  v124 = (char *)v110 - v11;
  MEMORY[0x270FA5388](v10);
  id v130 = (char *)v110 - v12;
  uint64_t v13 = type metadata accessor for TTCandidate(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)v110 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v18 = (void *)((char *)v110 - v17);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v5, (uint64_t)qword_26B37FB10);
  sub_25DD68868(a1, (uint64_t)v18);
  sub_25DD68868(a1, (uint64_t)v16);
  uint64_t v138 = v19;
  uint64_t v20 = sub_25DD89958();
  os_log_type_t v21 = sub_25DD89C58();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v128 = v5;
  uint64_t v129 = a1;
  v125 = v9;
  if (v22)
  {
    uint64_t v23 = sub_25DD7D424();
    v141 = v6;
    uint64_t v24 = v23;
    *(void *)&long long v142 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v26 = *v18;
    unint64_t v25 = v18[1];
    swift_bridgeObjectRetain();
    v149[0] = sub_25DD7D6C4(v26, v25, (uint64_t *)&v142);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    sub_25DD688CC((uint64_t)v18);
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v27 = *((void *)v16 + 9);
    unint64_t v28 = *((void *)v16 + 10);
    swift_bridgeObjectRetain();
    v149[0] = sub_25DD7D6C4(v27, v28, (uint64_t *)&v142);
    sub_25DD89CF8();
    a1 = v129;
    swift_bridgeObjectRelease();
    sub_25DD688CC((uint64_t)v16);
    _os_log_impl(&dword_25DD62000, v20, v21, "processing overrides on tcu candidate with id -%s and utterance - %s", (uint8_t *)v24, 0x16u);
    uint64_t v29 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    uint64_t v5 = v128;
    OUTLINED_FUNCTION_0();
    unint64_t v6 = v141;
    OUTLINED_FUNCTION_0();

    uint64_t v30 = v29;
  }
  else
  {
    sub_25DD688CC((uint64_t)v18);
    sub_25DD688CC((uint64_t)v16);

    uint64_t v30 = MEMORY[0x263F8EE58];
  }
  uint64_t v31 = v126[6];
  uint64_t v32 = v130;
  if (!*(void *)(v31 + 16))
  {
    uint64_t v133 = MEMORY[0x263F8EE78];
    goto LABEL_65;
  }
  uint64_t v140 = *(void *)(v31 + 16);
  uint64_t v33 = v30;
  uint64_t v34 = v31 + 32;
  v136 = (void (**)(char *, uint64_t))(v6 + 8);
  BOOL v137 = (void (**)(void))(v6 + 16);
  v110[0] = v31;
  v110[1] = &v145;
  v120 = &v146;
  swift_bridgeObjectRetain();
  uint64_t v132 = 0;
  int v131 = 0;
  v141 = 0;
  uint64_t v133 = MEMORY[0x263F8EE78];
  *(void *)&long long v35 = 136315138;
  long long v122 = v35;
  v134 = "allowListMatcher";
  uint64_t v121 = v33 + 8;
  uint64_t v113 = "concurrentActiveRequestMatcher";
  v114 = "universalCommandMatcher";
  uint64_t v127 = "reservedForTests";
  uint64_t v112 = "com.apple.voicetrigger";
  *(void *)&long long v35 = 136315394;
  long long v111 = v35;
  unint64_t v139 = (unint64_t)"tigate";
  long long v116 = xmmword_25DD8AD90;
  while (2)
  {
    sub_25DD6FF38(v34, (uint64_t)v149);
    unsigned __int8 v148 = 2;
    uint64_t v36 = *v137;
    OUTLINED_FUNCTION_12_1();
    v36();
    OUTLINED_FUNCTION_20_0();
    uint64_t v37 = v32;
    uint64_t v38 = sub_25DD89958();
    os_log_type_t v39 = sub_25DD89C58();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      v147[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = v122;
      unint64_t v41 = (unint64_t)__swift_project_boxed_opaque_existential_1(&v142, *((uint64_t *)&v143[0] + 1));
      OUTLINED_FUNCTION_17_0();
      v42();
      unint64_t v43 = OUTLINED_FUNCTION_6_1();
      a1 = v129;
      switch(v44)
      {
        case 1:
          break;
        case 2:
          unint64_t v43 = OUTLINED_FUNCTION_23_0();
          goto LABEL_16;
        case 3:
          unint64_t v43 = OUTLINED_FUNCTION_21_0();
          break;
        case 5:
          unint64_t v43 = 0xD00000000000001ELL;
          int64_t v45 = v127;
          goto LABEL_16;
        case 6:
          unint64_t v43 = OUTLINED_FUNCTION_22_0();
LABEL_16:
          unint64_t v41 = (unint64_t)v45 | 0x8000000000000000;
          break;
        default:
          OUTLINED_FUNCTION_5_1();
          break;
      }
      *(void *)(v40 + 4) = sub_25DD7D6C4(v43, v41, v147);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);
      _os_log_impl(&dword_25DD62000, v38, v39, "Running TTM Override %s ..", (uint8_t *)v40, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      uint64_t v32 = v130;
      uint64_t v5 = v128;
      os_log_type_t v135 = *v136;
      v135(v130, v128);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);

      os_log_type_t v135 = *v136;
      v135(v37, v5);
      uint64_t v32 = v37;
    }
    uint64_t v46 = v150;
    uint64_t v47 = v151;
    __swift_project_boxed_opaque_existential_1(v149, v150);
    char v48 = v141;
    unsigned __int8 v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 8))(a1, v46, v47);
    if (v48)
    {
      if (v132)
      {

        v141 = 0;
        uint64_t v132 = 1;
        goto LABEL_37;
      }
      v141 = v48;
      __swift_project_boxed_opaque_existential_1(v126, v126[3]);
      sub_25DD766E4();
      OUTLINED_FUNCTION_12_1();
      v36();
      OUTLINED_FUNCTION_20_0();
      sub_25DD6FF38((uint64_t)&v142, (uint64_t)v147);
      uint64_t v5 = swift_allocObject();
      sub_25DD6FFD4(&v142, v5 + 16);
      uint64_t v68 = sub_25DD89958();
      os_log_type_t v69 = sub_25DD89C58();
      uint64_t v70 = swift_allocObject();
      *(unsigned char *)(v70 + 16) = 32;
      uint64_t v71 = swift_allocObject();
      *(unsigned char *)(v71 + 16) = 8;
      uint64_t v72 = swift_allocObject();
      *(void *)(v72 + 16) = sub_25DD6FFEC;
      *(void *)(v72 + 24) = v5;
      uint64_t v73 = swift_allocObject();
      *(void *)(v73 + 16) = sub_25DD7003C;
      *(void *)(v73 + 24) = v72;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F060);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v116;
      *(void *)(inited + 32) = sub_25DD6FFF8;
      *(void *)(inited + 40) = v70;
      *(void *)(inited + 48) = sub_25DD70504;
      *(void *)(inited + 56) = v71;
      *(void *)(inited + 64) = sub_25DD70044;
      *(void *)(inited + 72) = v73;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      v123 = v68;
      if (!os_log_type_enabled(v68, v69))
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v147);

        uint64_t v83 = OUTLINED_FUNCTION_11_1();
        v84(v83);
        v141 = 0;
        uint64_t v132 = 1;
        a1 = v129;
        uint64_t v32 = v130;
        goto LABEL_37;
      }
      int64_t v75 = (uint8_t *)sub_25DD7D424();
      uint64_t v115 = swift_slowAlloc();
      uint64_t v145 = v115;
      *(_WORD *)int64_t v75 = 258;
      v75[2] = 32;
      swift_release();
      v75[3] = 8;
      swift_release();
      uint64_t v132 = (uint64_t)(v75 + 4);
      __swift_project_boxed_opaque_existential_1(v147, v147[3]);
      OUTLINED_FUNCTION_17_0();
      char v77 = v76();
      unint64_t v78 = sub_25DD6DBD4(v77);
      uint64_t v144 = sub_25DD7D6C4(v78, v79, &v145);
      sub_25DD89CF8();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v147);
      v80 = v123;
      _os_log_impl(&dword_25DD62000, v123, v69, "%s resulted in error", v75, 0xCu);
      uint64_t v132 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      a1 = v129;
      OUTLINED_FUNCTION_0();

      uint64_t v81 = OUTLINED_FUNCTION_11_1();
      v82(v81);
      v141 = 0;
    }
    else
    {
      v141 = 0;
      swift_beginAccess();
      unsigned __int8 v148 = v49;
      OUTLINED_FUNCTION_20_0();
      BYTE8(v143[1]) = v49;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25DD6C06C(0, *(void *)(v133 + 16) + 1, 1, v133);
        uint64_t v133 = v95;
      }
      unint64_t v51 = *(void *)(v133 + 16);
      unint64_t v50 = *(void *)(v133 + 24);
      if (v51 >= v50 >> 1)
      {
        sub_25DD6C06C(v50 > 1, v51 + 1, 1, v133);
        uint64_t v133 = v96;
      }
      uint64_t v52 = v133;
      *(void *)(v133 + 16) = v51 + 1;
      uint64_t v53 = (_OWORD *)(v52 + 48 * v51);
      long long v54 = v142;
      long long v55 = v143[0];
      *(_OWORD *)((char *)v53 + 57) = *(_OWORD *)((char *)v143 + 9);
      v53[2] = v54;
      v53[3] = v55;
      uint64_t v56 = v124;
      OUTLINED_FUNCTION_12_1();
      v36();
      OUTLINED_FUNCTION_20_0();
      unint64_t v57 = sub_25DD89958();
      uint64_t v58 = v5;
      os_log_type_t v59 = sub_25DD89C58();
      if (!os_log_type_enabled(v57, v59))
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);

        v135(v56, v58);
        uint64_t v5 = v58;
        goto LABEL_37;
      }
      uint64_t v60 = sub_25DD7D424();
      v147[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = v111;
      __swift_project_boxed_opaque_existential_1(&v142, *((uint64_t *)&v143[0] + 1));
      OUTLINED_FUNCTION_17_0();
      char v62 = v61();
      unint64_t v63 = sub_25DD6DBD4(v62);
      uint64_t v65 = sub_25DD7D6C4(v63, v64, v147);
      OUTLINED_FUNCTION_24_0(v65);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);
      *(_WORD *)(v60 + 12) = 2080;
      unint64_t v66 = v139 | 0x8000000000000000;
      unint64_t v67 = 0xD000000000000017;
      a1 = v129;
      switch(v148)
      {
        case 1u:
          unint64_t v67 = OUTLINED_FUNCTION_8_0();
          goto LABEL_34;
        case 2u:
          unint64_t v67 = OUTLINED_FUNCTION_10_1();
LABEL_34:
          unint64_t v66 = v66 | 0xED00006500000000;
          break;
        case 3u:
          break;
        default:
          unint64_t v66 = 0xE800000000000000;
          unint64_t v67 = OUTLINED_FUNCTION_16_1();
          break;
      }
      uint64_t v85 = sub_25DD7D6C4(v67, v66, v147);
      OUTLINED_FUNCTION_24_0(v85);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD62000, v57, v59, "%s returned %s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      uint64_t v5 = v128;
      v135(v124, v128);
    }
    uint64_t v32 = v130;
LABEL_37:
    __swift_project_boxed_opaque_existential_1(v149, v150);
    OUTLINED_FUNCTION_17_0();
    v86();
    OUTLINED_FUNCTION_6_1();
    switch(v87)
    {
      case 1:
        goto LABEL_43;
      case 2:
        OUTLINED_FUNCTION_23_0();
        goto LABEL_43;
      case 3:
        OUTLINED_FUNCTION_21_0();
        goto LABEL_43;
      case 5:
        swift_bridgeObjectRelease();
        goto LABEL_44;
      case 6:
        OUTLINED_FUNCTION_22_0();
        goto LABEL_43;
      default:
        OUTLINED_FUNCTION_5_1();
LABEL_43:
        char v88 = sub_25DD89F08();
        swift_bridgeObjectRelease();
        if (v88)
        {
LABEL_44:
          if (v126[5])
          {
            swift_beginAccess();
            switch(v148)
            {
              case 1u:
                OUTLINED_FUNCTION_8_0();
                goto LABEL_48;
              case 2u:
                OUTLINED_FUNCTION_10_1();
                goto LABEL_48;
              case 3u:
LABEL_48:
                char v89 = OUTLINED_FUNCTION_7_1();
                swift_bridgeObjectRelease();
                if ((v89 & 1) == 0) {
                  goto LABEL_49;
                }
                goto LABEL_75;
              default:
                swift_bridgeObjectRelease();
LABEL_75:
                swift_bridgeObjectRelease();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v149);
                break;
            }
            return 0;
          }
LABEL_58:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v149);
          v34 += 40;
          if (!--v140)
          {
            swift_bridgeObjectRelease();
            if (v131)
            {
              uint64_t v97 = sub_25DD89958();
              os_log_type_t v98 = sub_25DD89C58();
              if (os_log_type_enabled(v97, v98))
              {
                *(_WORD *)sub_25DD7D424() = 0;
                OUTLINED_FUNCTION_29(&dword_25DD62000, v99, v100, "OverridesContainer returned a result of mitigate");
                OUTLINED_FUNCTION_0();
              }

              return 0;
            }
LABEL_65:
            float v101 = sub_25DD89958();
            os_log_type_t v102 = sub_25DD89C58();
            if (os_log_type_enabled(v101, v102))
            {
              uint64_t v103 = 2;
              v104 = (uint8_t *)sub_25DD7D424();
              *(_WORD *)v104 = 0;
              _os_log_impl(&dword_25DD62000, v101, v102, "OverridesContainer returned a result of donot Override", v104, 2u);
              OUTLINED_FUNCTION_0();
            }
            else
            {

              return 2;
            }
            return v103;
          }
          continue;
        }
LABEL_49:
        swift_beginAccess();
        uint64_t v90 = v148;
        switch(v148)
        {
          case 0u:
            OUTLINED_FUNCTION_16_1();
            goto LABEL_52;
          case 1u:
            swift_bridgeObjectRelease();
            goto LABEL_71;
          case 2u:
            OUTLINED_FUNCTION_9_1();
            goto LABEL_52;
          case 3u:
LABEL_52:
            uint64_t v91 = v90;
            char v92 = sub_25DD89F08();
            swift_bridgeObjectRelease();
            if ((v92 & 1) == 0)
            {
              switch(v91)
              {
                case 0:
                  swift_bridgeObjectRelease();
                  int v93 = 1;
                  goto LABEL_57;
                case 1:
                case 3:
                  goto LABEL_56;
                case 2:
                  OUTLINED_FUNCTION_9_1();
LABEL_56:
                  int v94 = OUTLINED_FUNCTION_7_1();
                  swift_bridgeObjectRelease();
                  int v93 = v94 | v131;
LABEL_57:
                  int v131 = v93;
                  goto LABEL_58;
                default:
                  goto LABEL_78;
              }
            }
LABEL_71:
            swift_bridgeObjectRelease();
            uint64_t v105 = sub_25DD89958();
            os_log_type_t v106 = sub_25DD89C58();
            if (os_log_type_enabled(v105, v106))
            {
              *(_WORD *)sub_25DD7D424() = 0;
              OUTLINED_FUNCTION_29(&dword_25DD62000, v107, v108, "OverridesContainer returned a result of donot Mitigate");
              OUTLINED_FUNCTION_0();
            }

            __swift_destroy_boxed_opaque_existential_1((uint64_t)v149);
            uint64_t v103 = 1;
            break;
          default:
LABEL_78:
            JUMPOUT(0);
        }
        return v103;
    }
  }
}

void (*sub_25DD6F9B0(void *a1, uint64_t a2, uint64_t a3))(void **a1)
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_25DD6FB60(v6, a2, a3);
  return sub_25DD6FA30;
}

void sub_25DD6FA30(void **a1)
{
  id v1 = *a1;
  uint64_t v2 = OUTLINED_FUNCTION_18_1();
  v3(v2);
  swift_bridgeObjectRelease();

  free(v1);
}

unint64_t sub_25DD6FA78(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  char v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);

  return sub_25DD6DBD4(v3);
}

unint64_t sub_25DD6FAD8(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = a6[7] + 16 * result;
  *(unsigned char *)uint64_t v7 = a4;
  *(void *)(v7 + 8) = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_25DD6FB28(uint64_t a1, uint64_t a2)
{
  return a2;
}

void (*sub_25DD6FB60(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_25DD6FE04(v6);
  v6[10] = sub_25DD6FC74(v6 + 4, a2, a3);
  return sub_25DD6FC0C;
}

void sub_25DD6FC0C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_18_1();
  v2(v3);

  free(v1);
}

void (*sub_25DD6FC74(void *a1, uint64_t a2, uint64_t a3))(uint64_t *a1)
{
  unint64_t v4 = v3;
  uint64_t v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[3] = a3;
  v8[4] = v3;
  id v8[2] = a2;
  uint64_t v9 = *v3;
  unint64_t v10 = sub_25DD85748(a2, a3);
  *((unsigned char *)v8 + 48) = v11 & 1;
  if (__OFADD__(*(void *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F890);
  if (sub_25DD89DE8())
  {
    unint64_t v14 = sub_25DD85748(a2, a3);
    if ((v13 & 1) == (v15 & 1))
    {
      unint64_t v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = (void (*)(uint64_t *))sub_25DD89F28();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[5] = v12;
  if (v13)
  {
    uint64_t v16 = (unsigned __int8 *)(*(void *)(*v4 + 56) + 16 * v12);
    uint64_t v17 = *v16;
    uint64_t v18 = *((void *)v16 + 1);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  *uint64_t v8 = v17;
  v8[1] = v18;
  return sub_25DD6FDB4;
}

void sub_25DD6FDB4(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  sub_25DD6FE40(*a1, *(unsigned char *)(*a1 + 48), *(void ***)(*a1 + 32), *(void *)(*a1 + 40), *(void *)(*a1 + 16), *(void *)(*a1 + 24));
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_25DD6FE04(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25DD6FE34;
}

uint64_t sub_25DD6FE34(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_25DD6FE40(uint64_t a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    char v9 = *(unsigned char *)a1;
    unint64_t v10 = *a3;
    if (a2)
    {
      uint64_t v11 = v10[7] + 16 * a4;
      *(unsigned char *)uint64_t v11 = v9;
      *(void *)(v11 + 8) = v7;
    }
    else
    {
      sub_25DD6FAD8(a4, a5, a6, v9, v7, v10);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_25DD89DF8();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_25DD6FF10(uint64_t a1)
{
  return a1;
}

uint64_t sub_25DD6FF38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25DD6FF9C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25DD6FFD4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25DD6FFEC()
{
  return sub_25DD6FA78((void *)(v0 + 16));
}

unsigned char **sub_25DD6FFF8(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_25DD7DE14(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_25DD70004()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25DD7003C()
{
  return sub_25DD7D624(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_25DD70044(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_25DD7D64C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_25DD7004C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TTResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD7008C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
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

uint64_t sub_25DD700DC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25DD70118(uint64_t a1, int a2)
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

uint64_t sub_25DD70158(uint64_t result, int a2, int a3)
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

void type metadata accessor for OverridesAggregateExecutionResult()
{
}

uint64_t sub_25DD701A4(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sub_25DD70208(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_25DD70250(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sub_25DD70294(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
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

uint64_t sub_25DD702D4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for OverrideUnitExecutionResult()
{
}

uint64_t sub_25DD7032C(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_25DD703B4(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x25DD70480);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for OverrideDecision()
{
}

unint64_t sub_25DD704B8()
{
  unint64_t result = qword_26A6C6210;
  if (!qword_26A6C6210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6210);
  }
  return result;
}

void OUTLINED_FUNCTION_0_0(unint64_t a1@<X8>)
{
  sub_25DD6BFB4(a1 > 1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t OUTLINED_FUNCTION_3_1@<X0>(uint64_t a1@<X8>, uint64_t a2, long long a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  a5 = v7;
  a6 = a1;
  *(void *)&a3 = v8;
  *(void *)(v6 + 16) = v9;
  return sub_25DD6FFD4(&a3, v6 + 40 * v10 + 32);
}

unint64_t OUTLINED_FUNCTION_6_1()
{
  return 0xD000000000000012;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_25DD89F08();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return 0x74694D746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return *(void *)(v0 + 168);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return 0x657461676974696DLL;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_25DD6FF38(v1 - 128, v0 + 304);
}

unint64_t OUTLINED_FUNCTION_21_0()
{
  return 0xD000000000000017;
}

unint64_t OUTLINED_FUNCTION_22_0()
{
  return 0xD000000000000010;
}

unint64_t OUTLINED_FUNCTION_23_0()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1)
{
  *(void *)(v1 + 384) = a1;
  return sub_25DD89CF8();
}

uint64_t sub_25DD7072C()
{
  return 0;
}

uint64_t sub_25DD70734(uint64_t a1)
{
  sub_25DD89588();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  os_log_type_t v39 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v36 - v8;
  MEMORY[0x270FA5388](v7);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25DD89968();
  uint64_t v41 = __swift_project_value_buffer(v10, (uint64_t)qword_26B37FB10);
  uint64_t v11 = sub_25DD89958();
  os_log_type_t v12 = sub_25DD89C58();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v13 = 0;
    _os_log_impl(&dword_25DD62000, v11, v12, "Running shortcuts override", v13, 2u);
    MEMORY[0x2611C5A20](v13, -1, -1);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(v14 + 16);
  if (!v15) {
    return 2;
  }
  uint64_t v38 = v9;
  uint64_t v18 = *(void (**)(void))(v3 + 16);
  uint64_t v17 = v3 + 16;
  uint64_t v16 = v18;
  uint64_t v19 = v14 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
  uint64_t v20 = (void (**)(void))(v17 - 8);
  uint64_t v21 = *(void *)(v17 + 56);
  uint64_t v40 = v14;
  swift_bridgeObjectRetain();
  while (1)
  {
    OUTLINED_FUNCTION_3_2();
    v16();
    if (sub_25DD70AD8()) {
      break;
    }
    OUTLINED_FUNCTION_1_1();
    v22();
    v19 += v21;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_2();
  v16();
  unint64_t v25 = sub_25DD89958();
  os_log_type_t v26 = sub_25DD89C58();
  int v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v28 = swift_slowAlloc();
    LODWORD(v40) = v27;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v41 = swift_slowAlloc();
    uint64_t v43 = v41;
    uint64_t v37 = v29;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v36 = v29 + 4;
    OUTLINED_FUNCTION_3_2();
    v16();
    uint64_t v30 = sub_25DD89AC8();
    uint64_t v42 = sub_25DD7D6C4(v30, v31, &v43);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    uint64_t v32 = *v20;
    OUTLINED_FUNCTION_1_1();
    v32();
    uint64_t v33 = v37;
    _os_log_impl(&dword_25DD62000, v25, (os_log_type_t)v40, "Parse: %s is shortcut; recommending .donotMitigate",
      v37,
      0xCu);
    uint64_t v23 = 1;
    uint64_t v34 = v41;
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v34, -1, -1);
    MEMORY[0x2611C5A20](v33, -1, -1);

    OUTLINED_FUNCTION_1_1();
    v32();
  }
  else
  {

    long long v35 = *v20;
    OUTLINED_FUNCTION_1_1();
    v35();
    OUTLINED_FUNCTION_1_1();
    v35();
    return 1;
  }
  return v23;
}

uint64_t sub_25DD70AD8()
{
  uint64_t v0 = sub_25DD89968();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD7102C();
  sub_25DD896E8();
  swift_release();
  sub_25DD71A88((uint64_t)v37, (uint64_t)v35);
  if (v36)
  {
    sub_25DD89798();
    if (OUTLINED_FUNCTION_2_2()) {
      uint64_t v6 = v33[0];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    sub_25DD71AF0((uint64_t)v35, &qword_26B37F8B0);
    uint64_t v6 = 0;
  }
  sub_25DD71A88((uint64_t)v37, (uint64_t)v35);
  if (v36)
  {
    sub_25DD89858();
    if (OUTLINED_FUNCTION_2_2()) {
      uint64_t v7 = v33[0];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    sub_25DD71AF0((uint64_t)v35, &qword_26B37F8B0);
    uint64_t v7 = 0;
  }
  uint64_t v8 = (v6 | v7) != 0;
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v0, (uint64_t)qword_26B37FB10);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v9, v0);
  sub_25DD71A88((uint64_t)v37, (uint64_t)v35);
  swift_retain_n();
  swift_retain_n();
  uint64_t v10 = sub_25DD89958();
  os_log_type_t v11 = sub_25DD89C58();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v30 = v2;
    uint64_t v13 = v12;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v13 = 136315906;
    if (v6 | v7) {
      uint64_t v14 = 1702195828;
    }
    else {
      uint64_t v14 = 0x65736C6166;
    }
    BOOL v32 = (v6 | v7) != 0;
    if (v6 | v7) {
      unint64_t v15 = 0xE400000000000000;
    }
    else {
      unint64_t v15 = 0xE500000000000000;
    }
    uint64_t v16 = sub_25DD7D6C4(v14, v15, &v34);
    OUTLINED_FUNCTION_4_2(v16);
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_25DD71A88((uint64_t)v35, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8B0);
    uint64_t v17 = sub_25DD89AC8();
    uint64_t v19 = sub_25DD7D6C4(v17, v18, &v34);
    OUTLINED_FUNCTION_4_2(v19);
    swift_bridgeObjectRelease();
    sub_25DD71AF0((uint64_t)v35, &qword_26B37F8B0);
    *(_WORD *)(v13 + 22) = 2080;
    v33[0] = v6;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F830);
    uint64_t v29 = v0;
    uint64_t v20 = sub_25DD89AC8();
    uint64_t v22 = sub_25DD7D6C4(v20, v21, &v34);
    OUTLINED_FUNCTION_5_2(v22);
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 32) = 2080;
    v33[0] = v7;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F838);
    uint64_t v23 = sub_25DD89AC8();
    uint64_t v25 = sub_25DD7D6C4(v23, v24, &v34);
    OUTLINED_FUNCTION_5_2(v25);
    swift_release_n();
    uint64_t v8 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v10, v11, "isShortcutIntent: %s where task is %s; as runTask %s as execTask %s",
      (uint8_t *)v13,
      0x2Au);
    uint64_t v26 = v31;
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v26, -1, -1);
    MEMORY[0x2611C5A20](v13, -1, -1);
    swift_release();
    swift_release();

    (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v29);
  }
  else
  {
    swift_release_n();
    swift_release_n();

    sub_25DD71AF0((uint64_t)v35, &qword_26B37F8B0);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  }
  sub_25DD71AF0((uint64_t)v37, &qword_26B37F8B0);
  return v8;
}

id sub_25DD70F64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25DD70FBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShortcutMatcher()
{
  return self;
}

uint64_t sub_25DD71014(uint64_t a1)
{
  return sub_25DD70734(a1);
}

uint64_t sub_25DD7102C()
{
  uint64_t v78 = sub_25DD89588();
  uint64_t v86 = *(void *)(v78 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  objc_super v2 = (char *)&v74 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25DD89618();
  uint64_t v82 = *(void *)(v3 - 8);
  uint64_t v83 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  os_log_t v81 = (os_log_t)((char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_25DD895F8();
  uint64_t v6 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F818);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v85 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25DD89558();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v80 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v74 - v14;
  uint64_t v74 = v0;
  uint64_t v16 = sub_25DD89568();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v76 = v2;
    uint64_t v77 = v11;
    uint64_t v84 = v15;
    uint64_t v79 = v10;
    uint64_t v75 = v6;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v18 = v6 + 16;
    uint64_t v19 = v20;
    unint64_t v21 = v16 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
    uint64_t v22 = *(void *)(v18 + 56);
    while (1)
    {
      v19(v8, v21, v5);
      if (sub_25DD89598()) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v18 - 8))(v8, v5);
      v21 += v22;
      if (!--v17)
      {
        uint64_t v23 = 1;
        uint64_t v10 = v79;
        objc_super v2 = v76;
        uint64_t v24 = v77;
        unint64_t v15 = v84;
        uint64_t v25 = v86;
        uint64_t v26 = v75;
        goto LABEL_7;
      }
    }
    uint64_t v26 = v75;
    uint64_t v27 = (uint64_t)v85;
    (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v85, v8, v5);
    uint64_t v23 = 0;
    uint64_t v10 = v79;
    objc_super v2 = v76;
    uint64_t v24 = v77;
    unint64_t v15 = v84;
    uint64_t v25 = v86;
  }
  else
  {
    uint64_t v24 = v11;
    uint64_t v23 = 1;
    uint64_t v26 = v6;
    uint64_t v25 = v86;
LABEL_7:
    uint64_t v27 = (uint64_t)v85;
  }
  __swift_storeEnumTagSinglePayload(v27, v23, 1, v5);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v27, 1, v5) == 1)
  {
    sub_25DD71AF0(v27, &qword_26B37F818);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25DD89968();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B37FB10);
    uint64_t v34 = sub_25DD89958();
    os_log_type_t v35 = sub_25DD89C68();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_25DD62000, v34, v35, "Failed to parse userParse. Returning nil intent", v36, 2u);
      MEMORY[0x2611C5A20](v36, -1, -1);
    }

    return 0;
  }
  uint64_t v28 = v2;
  uint64_t v29 = v27;
  os_log_t v30 = v81;
  sub_25DD895D8();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v29, v5);
  uint64_t v31 = v80;
  sub_25DD89608();
  (*(void (**)(os_log_t, uint64_t))(v82 + 8))(v30, v83);
  uint64_t v32 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v15, v31, v10);
  uint64_t v39 = sub_25DD896A8();
  unint64_t v40 = MEMORY[0x2611C4BE0]();
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25DD89968();
  uint64_t v42 = __swift_project_value_buffer(v41, (uint64_t)qword_26B37FB10);
  uint64_t v43 = v28;
  uint64_t v44 = v28;
  uint64_t v45 = v78;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v44, v74, v78);
  swift_bridgeObjectRetain_n();
  uint64_t v86 = v42;
  uint64_t v46 = sub_25DD89958();
  os_log_type_t v47 = sub_25DD89C58();
  LODWORD(v83) = v47;
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v84 = v15;
  if (v48)
  {
    uint64_t v49 = swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    uint64_t v79 = v10;
    uint64_t v82 = v50;
    v88[0] = v50;
    *(_DWORD *)uint64_t v49 = 136315394;
    os_log_t v81 = v46;
    uint64_t v51 = sub_25DD898A8();
    uint64_t v85 = (char *)v39;
    uint64_t v52 = v51;
    uint64_t v53 = swift_bridgeObjectRetain();
    uint64_t v54 = MEMORY[0x2611C50E0](v53, v52);
    unint64_t v56 = v55;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_25DD7D6C4(v54, v56, v88);
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 12) = 2080;
    sub_25DD89568();
    uint64_t v57 = v32;
    uint64_t v58 = MEMORY[0x2611C50E0]();
    unint64_t v60 = v59;
    swift_bridgeObjectRelease();
    uint64_t v61 = v58;
    uint64_t v32 = v57;
    uint64_t v87 = sub_25DD7D6C4(v61, v60, v88);
    uint64_t v39 = (uint64_t)v85;
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v43, v78);
    uint64_t v46 = v81;
    _os_log_impl(&dword_25DD62000, v81, (os_log_type_t)v83, "tasks are %s where userDialogActs are %s", (uint8_t *)v49, 0x16u);
    uint64_t v62 = v82;
    swift_arrayDestroy();
    uint64_t v10 = v79;
    MEMORY[0x2611C5A20](v62, -1, -1);
    MEMORY[0x2611C5A20](v49, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v43, v45);
  }

  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_25DD89E18();
    swift_bridgeObjectRelease();
    if (v70) {
      goto LABEL_26;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    uint64_t v71 = sub_25DD89958();
    os_log_type_t v72 = sub_25DD89C68();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v73 = 0;
      _os_log_impl(&dword_25DD62000, v71, v72, "NL Parse has no tasks. Returning nil intent", v73, 2u);
      MEMORY[0x2611C5A20](v73, -1, -1);
    }

    swift_release();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v84, v10);
    return 0;
  }
  if (!*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_33;
  }
LABEL_26:
  sub_25DD8901C(0, (v40 & 0xC000000000000001) == 0, v40);
  if ((v40 & 0xC000000000000001) != 0)
  {
    uint64_t v37 = MEMORY[0x2611C52C0](0, v40);
  }
  else
  {
    uint64_t v37 = *(void *)(v40 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_retain_n();
  unint64_t v63 = sub_25DD89958();
  os_log_type_t v64 = sub_25DD89C58();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v85 = (char *)v39;
    uint64_t v67 = v66;
    uint64_t v87 = v37;
    v88[0] = v66;
    *(_DWORD *)uint64_t v65 = 136315138;
    sub_25DD898A8();
    swift_retain();
    uint64_t v68 = sub_25DD89AC8();
    uint64_t v87 = sub_25DD7D6C4(v68, v69, v88);
    sub_25DD89CF8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v63, v64, "firstTask is %s", v65, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v67, -1, -1);
    MEMORY[0x2611C5A20](v65, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v84, v10);
  return v37;
}

uint64_t sub_25DD71A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DD71AF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return sub_25DD89CF8();
}

uint64_t sub_25DD71BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_25DD71BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_25DD71BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_25DD71C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_25DD71C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t sub_25DD71C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 48))();
}

uint64_t sub_25DD71C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t sub_25DD71C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t sub_25DD71C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 72))();
}

uint64_t sub_25DD71C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t sub_25DD71C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t sub_25DD71CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25DD71CC4(uint64_t a1)
{
  objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, a1);

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for SelfEmitter()
{
  return self;
}

void sub_25DD71D50()
{
  OUTLINED_FUNCTION_10_2();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v8 = OUTLINED_FUNCTION_19_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_52();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v44 - v13;
  uint64_t v15 = sub_25DD89518();
  OUTLINED_FUNCTION_2();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_23_1();
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  MEMORY[0x270FA5388](v20);
  sub_25DD894C8();
  OUTLINED_FUNCTION_14_1((uint64_t)v14, 1, v15);
  if (v21)
  {
    sub_25DD773E4((uint64_t)v14);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25DD89968();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B37FB10);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_25DD89958();
    os_log_type_t v24 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_3(v24))
    {
      uint64_t v25 = (uint8_t *)OUTLINED_FUNCTION_5_3();
      uint64_t v46 = OUTLINED_FUNCTION_15();
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_25DD7D6C4(v4, v2, &v46);
      OUTLINED_FUNCTION_46(v26);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25DD62000, v23, (os_log_type_t)v0, "requestId is not a UUID, not expected - %s", v25, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v27 = 1;
  }
  else
  {
    v44[2] = v0;
    uint64_t v45 = v6;
    uint64_t v28 = *(void (**)(void))(v17 + 32);
    OUTLINED_FUNCTION_48();
    v28();
    uint64_t v29 = self;
    os_log_t v30 = (void *)sub_25DD894E8();
    id v31 = objc_msgSend(v29, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 37, v30);

    if (v31)
    {
      sub_25DD894F8();

      OUTLINED_FUNCTION_48();
      v28();
      __swift_storeEnumTagSinglePayload(v11, 0, 1, v15);
      OUTLINED_FUNCTION_14_1(v11, 1, v15);
      if (!v21)
      {
        OUTLINED_FUNCTION_25_0();
        v32();
        uint64_t v33 = v45;
        OUTLINED_FUNCTION_48();
        v28();
        uint64_t v6 = v33;
        uint64_t v27 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v11, 1, 1, v15);
    }
    sub_25DD773E4(v11);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25DD89968();
    OUTLINED_FUNCTION_47(v34, (uint64_t)qword_26B37FB10);
    OUTLINED_FUNCTION_63();
    v35();
    uint64_t v36 = sub_25DD89958();
    os_log_type_t v37 = sub_25DD89C68();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)OUTLINED_FUNCTION_5_3();
      uint64_t v46 = OUTLINED_FUNCTION_15();
      *(_DWORD *)uint64_t v38 = 136315138;
      v44[1] = v38 + 4;
      uint64_t v39 = sub_25DD894D8();
      uint64_t v41 = sub_25DD7D6C4(v39, v40, &v46);
      OUTLINED_FUNCTION_32_0(v41);
      sub_25DD89CF8();
      swift_bridgeObjectRelease();
      uint64_t v42 = *(void (**)(void))(v17 + 8);
      OUTLINED_FUNCTION_25_0();
      v42();
      _os_log_impl(&dword_25DD62000, v36, v37, "error generating derived indeitifier for TTM from request UUID - %s", v38, 0xCu);
      uint64_t v27 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      OUTLINED_FUNCTION_25_0();
      v42();
    }
    else
    {

      uint64_t v43 = *(void (**)(void))(v17 + 8);
      OUTLINED_FUNCTION_25_0();
      v43();
      OUTLINED_FUNCTION_25_0();
      v43();
      uint64_t v27 = 1;
    }
    uint64_t v6 = v45;
  }
LABEL_19:
  __swift_storeEnumTagSinglePayload(v6, v27, 1, v15);
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD7224C()
{
  OUTLINED_FUNCTION_10_2();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v6 = OUTLINED_FUNCTION_19_0(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_23_1();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v58 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v58 - v15;
  sub_25DD77F38(v4, v0);
  OUTLINED_FUNCTION_7_2(v0);
  if (!v17)
  {
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_18_2();
    v28();
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F030]), sel_init);
    if (v29)
    {
      os_log_t v30 = v29;
      id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F038]), sel_init);
      if (v31)
      {
        uint64_t v32 = v31;
        sub_25DD68D8C(0, &qword_26B37F858);
        unint64_t v59 = v2;
        uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
        v33(v14, v16, v7);
        id v34 = sub_25DD726E4((uint64_t)v14);
        objc_msgSend(v32, sel_setTtmId_, v34);

        v33(v14, v59, v7);
        id v35 = sub_25DD726E4((uint64_t)v14);
        objc_msgSend(v32, sel_setTrpId_, v35);

        objc_msgSend(v30, sel_setEventMetadata_, v32);
        uint64_t v36 = OUTLINED_FUNCTION_34();
        v37(v36);
        goto LABEL_23;
      }
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_25DD89968();
      uint64_t v49 = (void *)OUTLINED_FUNCTION_13_2(v48, (uint64_t)qword_26B37FB10);
      os_log_type_t v50 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_24_1(v50))
      {
        uint64_t v51 = (uint8_t *)OUTLINED_FUNCTION_16();
        *(_WORD *)uint64_t v51 = 0;
        OUTLINED_FUNCTION_70();
        _os_log_impl(v52, v53, v54, v55, v51, 2u);
        OUTLINED_FUNCTION_0();
      }
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v40 = sub_25DD89968();
      uint64_t v41 = (void *)OUTLINED_FUNCTION_13_2(v40, (uint64_t)qword_26B37FB10);
      os_log_type_t v42 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_24_1(v42))
      {
        uint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_16();
        *(_WORD *)uint64_t v43 = 0;
        OUTLINED_FUNCTION_70();
        _os_log_impl(v44, v45, v46, v47, v43, 2u);
        OUTLINED_FUNCTION_0();
      }
    }
    uint64_t v56 = OUTLINED_FUNCTION_34();
    v57(v56);
    goto LABEL_23;
  }
  sub_25DD773E4(v0);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25DD89968();
  OUTLINED_FUNCTION_47(v18, (uint64_t)qword_26B37FB10);
  OUTLINED_FUNCTION_63();
  v19();
  uint64_t v20 = sub_25DD89958();
  os_log_type_t v21 = sub_25DD89C68();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)OUTLINED_FUNCTION_5_3();
    uint64_t v60 = OUTLINED_FUNCTION_15();
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_25DD77FA0();
    uint64_t v23 = sub_25DD89EF8();
    uint64_t v25 = sub_25DD7D6C4(v23, v24, &v60);
    OUTLINED_FUNCTION_46(v25);
    swift_bridgeObjectRelease();
    uint64_t v26 = OUTLINED_FUNCTION_72();
    v27(v26);
    _os_log_impl(&dword_25DD62000, v20, v21, "cannot generate ttmClient event with nil ttmID and trpID - %s", v22, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    uint64_t v38 = OUTLINED_FUNCTION_72();
    v39(v38);
  }

LABEL_23:
  OUTLINED_FUNCTION_9_2();
}

id sub_25DD726E4(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_25DD894E8();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_25DD89518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_25DD72780()
{
}

void sub_25DD7279C()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v4 = OUTLINED_FUNCTION_19_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_2();
  uint64_t v5 = sub_25DD89518();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v39 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v36 - v9;
  uint64_t v42 = MEMORY[0x263F8EE78];
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    os_log_type_t v37 = (void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v38 = v8 + 32;
    v36[1] = v8 + 8;
    swift_bridgeObjectRetain();
    v36[0] = v11;
    uint64_t v13 = (char *)(v11 + 48);
    while (1)
    {
      uint64_t v15 = *((void *)v13 - 2);
      unint64_t v14 = *((void *)v13 - 1);
      uint64_t v16 = *v13;
      id v17 = objc_allocWithZone(MEMORY[0x263F6F0C0]);
      swift_bridgeObjectRetain();
      id v18 = objc_msgSend(v17, sel_init, v36[0]);
      if (!v18)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_26B37F070 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_25DD89968();
        uint64_t v19 = (void *)OUTLINED_FUNCTION_13_2(v28, (uint64_t)qword_26B37FB10);
        os_log_type_t v29 = sub_25DD89C68();
        if (OUTLINED_FUNCTION_49(v29))
        {
          *(_WORD *)OUTLINED_FUNCTION_16() = 0;
          OUTLINED_FUNCTION_27(&dword_25DD62000, v30, v31, "error constructing TTMSchemaTTMTCUResult");
          OUTLINED_FUNCTION_0();
        }
        goto LABEL_18;
      }
      uint64_t v19 = v18;
      swift_bridgeObjectRetain();
      sub_25DD894C8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_14_1(v0, 1, v5);
      if (v20) {
        break;
      }
      OUTLINED_FUNCTION_66();
      v21();
      sub_25DD68D8C(0, &qword_26B37F858);
      uint64_t v22 = (uint64_t)v39;
      (*v37)(v39, v10, v5);
      id v23 = sub_25DD726E4(v22);
      objc_msgSend(v19, sel_setTcuId_, v23);

      objc_msgSend(v19, sel_setDecision_, dword_25DD8B018[v16]);
      swift_bridgeObjectRelease();
      id v24 = v19;
      MEMORY[0x2611C50C0]();
      unint64_t v26 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v25 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v26 >= v25 >> 1) {
        OUTLINED_FUNCTION_28_0(v26 + 1, v25);
      }
      v13 += 24;
      sub_25DD89C08();
      sub_25DD89BE8();

      OUTLINED_FUNCTION_18_0();
      v27();
      if (!--v12)
      {
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25DD773E4(v0);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_25DD89968();
    __swift_project_value_buffer(v32, (uint64_t)qword_26B37FB10);
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25DD89958();
    os_log_type_t v34 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_3(v34))
    {
      id v35 = (_DWORD *)OUTLINED_FUNCTION_5_3();
      uint64_t v41 = OUTLINED_FUNCTION_15();
      *id v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_25DD7D6C4(v15, v14, &v41);
      sub_25DD89CF8();
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_61(&dword_25DD62000, v33, (os_log_type_t)v5, "error converting tcuID - %s to UUID");
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      goto LABEL_19;
    }

    OUTLINED_FUNCTION_15_2();
LABEL_18:
  }
LABEL_19:
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD72C3C()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_60();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v5 = OUTLINED_FUNCTION_19_0(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_7_2(v3);
  if (v7)
  {
    sub_25DD773E4(v3);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v8, (uint64_t)qword_26B37FB10);
    uint64_t v9 = (void *)sub_25DD89958();
    os_log_type_t v10 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v10))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v11 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_56(v11);
      OUTLINED_FUNCTION_19_1(4.8149e-34);
      uint64_t v12 = sub_25DD7D6C4(v2, v1, &v32);
      OUTLINED_FUNCTION_8_1(v12);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v13, v14, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    OUTLINED_FUNCTION_18_2();
    v15();
    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F0A8]), sel_init);
    id v17 = v16;
    if (v16)
    {
      id v18 = v16;
      sub_25DD7279C();
      if (v19)
      {
        sub_25DD68D8C(0, &qword_26B37F860);
        char v20 = (void *)sub_25DD89BC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v20 = 0;
      }
      objc_msgSend(v18, sel_setResults_, v20);
    }
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F0A0]), sel_init);
    objc_msgSend(v21, sel_setEnded_, v17);
    sub_25DD7224C();
    if (v22)
    {
      id v23 = v22;
      objc_msgSend(v22, sel_setTtmRequestContext_, v21);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      sub_25DD71CC4((uint64_t)v23);
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_25DD89968();
      unint64_t v25 = (void *)OUTLINED_FUNCTION_13_2(v24, (uint64_t)qword_26B37FB10);
      os_log_type_t v26 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_3(v26))
      {
        uint64_t v27 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_44(v27);
        OUTLINED_FUNCTION_30_0(&dword_25DD62000, v28, v29, "error generating the TTMClient Event");
        OUTLINED_FUNCTION_0();
      }
    }
    uint64_t v30 = OUTLINED_FUNCTION_31_0();
    v31(v30);
  }
  OUTLINED_FUNCTION_9_2();
}

uint64_t sub_25DD72F6C(char *a1)
{
  char v1 = *a1;
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DD89968();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_13_2(v2, (uint64_t)qword_26B37FB10);
  os_log_type_t v4 = sub_25DD89C68();
  if (OUTLINED_FUNCTION_6_2(v4))
  {
    uint64_t v5 = (_DWORD *)OUTLINED_FUNCTION_5_3();
    uint64_t v6 = (void *)swift_slowAlloc();
    *uint64_t v5 = 138412290;
    sub_25DD77EEC();
    swift_allocError();
    unsigned char *v7 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    sub_25DD89CF8();
    *uint64_t v6 = v11;
    OUTLINED_FUNCTION_3_3(&dword_25DD62000, v8, v9, "Neural Combiner failure reason %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F880);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }

  return 4 * ((v1 & 0xFE) == 2);
}

void sub_25DD730CC()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  os_log_type_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v10 = OUTLINED_FUNCTION_19_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v13 = (uint8_t *)(v12 - v11);
  sub_25DD89518();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_16_2();
  char v15 = *v2;
  sub_25DD894C8();
  OUTLINED_FUNCTION_7_2((uint64_t)v13);
  if (v16)
  {
    sub_25DD773E4((uint64_t)v13);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v17, (uint64_t)qword_26B37FB10);
    id v18 = (void *)sub_25DD89958();
    os_log_type_t v19 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v19))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v35 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_19_1(4.8149e-34);
      uint64_t v20 = sub_25DD7D6C4(v6, v4, &v35);
      OUTLINED_FUNCTION_8_1(v20);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v21, v22, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_18_2();
    v23();
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F0B0]), sel_init);
    unint64_t v25 = v24;
    if (v24)
    {
      LOBYTE(v35) = v15;
      objc_msgSend(v24, sel_setReason_, sub_25DD72F6C((char *)&v35));
    }
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F0A0]), sel_init);
    objc_msgSend(v26, sel_setFailed_, v25);
    sub_25DD7224C();
    if (v27)
    {
      uint64_t v28 = v27;
      objc_msgSend(v27, sel_setTtmRequestContext_, v26);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      sub_25DD71CC4((uint64_t)v28);
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_25DD89968();
      uint64_t v30 = OUTLINED_FUNCTION_13_2(v29, (uint64_t)qword_26B37FB10);
      os_log_type_t v31 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_35(v31))
      {
        uint64_t v32 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_44(v32);
        _os_log_impl(&dword_25DD62000, v30, v8, "error generating the TTMClient Event", v13, 2u);
        OUTLINED_FUNCTION_0();
      }
    }
    uint64_t v33 = OUTLINED_FUNCTION_31_0();
    v34(v33);
  }
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD733F0()
{
}

uint64_t sub_25DD7340C(char *a1)
{
  return dword_25DD8B018[*a1];
}

uint64_t sub_25DD73420(uint64_t a1)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v7 = OUTLINED_FUNCTION_19_0(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_64();
  uint64_t v53 = v10;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v11);
  uint64_t v56 = (char *)&v50 - v12;
  uint64_t v61 = MEMORY[0x263F8EE78];
  uint64_t v50 = a1 + 64;
  OUTLINED_FUNCTION_39();
  unint64_t v15 = v14 & v13;
  int64_t v51 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v52 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  os_log_type_t v54 = (void (**)(char *, uint64_t, uint64_t))(v17 + 32);
  uint64_t v55 = v17 + 8;
  uint64_t v57 = a1;
  swift_bridgeObjectRetain();
  int64_t v18 = 0;
  if (!v15) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v19 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (unint64_t i = v19 | (v18 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    id v24 = (uint64_t *)(*(void *)(v57 + 48) + 16 * i);
    uint64_t v4 = *v24;
    unint64_t v3 = v24[1];
    uint64_t v25 = *(void *)(v57 + 56) + 40 * i;
    int v26 = *(_DWORD *)v25;
    uint64_t v1 = *(char *)(v25 + 4);
    int v27 = *(unsigned __int8 *)(v25 + 37);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25DD894C8();
    OUTLINED_FUNCTION_14_1(v2, 1, v8);
    if (v28)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25DD773E4(v2);
      if (qword_26B37F070 != -1) {
        goto LABEL_40;
      }
      goto LABEL_27;
    }
    swift_bridgeObjectRelease();
    uint64_t v4 = (uint64_t)v56;
    (*v54)(v56, v2, v8);
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F060]), sel_init);
    if (!v29) {
      break;
    }
    uint64_t v30 = v29;
    int64_t v58 = v18;
    uint64_t v31 = v2;
    sub_25DD68D8C(0, &qword_26B37F858);
    uint64_t v32 = v53;
    (*v52)(v53, v4, v8);
    id v33 = sub_25DD726E4(v32);
    objc_msgSend(v30, sel_setTcuId_, v33);

    LODWORD(v34) = v26;
    objc_msgSend(v30, sel_setNeuralCombinerScore_, v34);
    objc_msgSend(v30, sel_setRecommendation_, dword_25DD8B018[v1]);
    swift_bridgeObjectRelease();
    if (v27) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = 1;
    }
    objc_msgSend(v30, sel_setMode_, v35);
    id v36 = v30;
    MEMORY[0x2611C50C0]();
    unint64_t v3 = *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v37 = *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v3 >= v37 >> 1) {
      OUTLINED_FUNCTION_28_0(v3 + 1, v37);
    }
    sub_25DD89C08();
    sub_25DD89BE8();

    OUTLINED_FUNCTION_18_0();
    v38();
    uint64_t v2 = v31;
    int64_t v18 = v58;
    if (v15) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v21 >= v51) {
      goto LABEL_34;
    }
    unint64_t v22 = *(void *)(v50 + 8 * v21);
    ++v18;
    if (!v22)
    {
      int64_t v18 = v21 + 1;
      if (v21 + 1 >= v51) {
        goto LABEL_34;
      }
      unint64_t v22 = *(void *)(v50 + 8 * v18);
      if (!v22)
      {
        int64_t v18 = v21 + 2;
        if (v21 + 2 >= v51) {
          goto LABEL_34;
        }
        unint64_t v22 = *(void *)(v50 + 8 * v18);
        if (!v22)
        {
          int64_t v23 = v21 + 3;
          if (v23 >= v51)
          {
LABEL_34:
            swift_release();
            return v61;
          }
          unint64_t v22 = *(void *)(v50 + 8 * v23);
          if (!v22)
          {
            while (1)
            {
              int64_t v18 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v18 >= v51) {
                goto LABEL_34;
              }
              unint64_t v22 = *(void *)(v50 + 8 * v18);
              ++v23;
              if (v22) {
                goto LABEL_16;
              }
            }
LABEL_39:
            __break(1u);
LABEL_40:
            swift_once();
LABEL_27:
            uint64_t v39 = sub_25DD89968();
            OUTLINED_FUNCTION_47(v39, (uint64_t)qword_26B37FB10);
            swift_bridgeObjectRetain();
            uint64_t v40 = sub_25DD89958();
            os_log_type_t v41 = sub_25DD89C68();
            if (OUTLINED_FUNCTION_24_1(v41))
            {
              uint64_t v42 = (_DWORD *)OUTLINED_FUNCTION_5_3();
              uint64_t v60 = OUTLINED_FUNCTION_15();
              *uint64_t v42 = 136315138;
              swift_bridgeObjectRetain();
              uint64_t v59 = sub_25DD7D6C4(v4, v3, &v60);
              sub_25DD89CF8();
              swift_bridgeObjectRelease_n();
              OUTLINED_FUNCTION_61(&dword_25DD62000, v40, (os_log_type_t)v1, "error converting tcuId - %s to UUID");
              OUTLINED_FUNCTION_12_2();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_0();
              swift_release();
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease_n();
            }

            return 0;
          }
          int64_t v18 = v23;
        }
      }
    }
LABEL_16:
    unint64_t v15 = (v22 - 1) & v22;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_25DD89968();
  uint64_t v44 = (void *)OUTLINED_FUNCTION_13_2(v43, (uint64_t)qword_26B37FB10);
  os_log_type_t v45 = sub_25DD89C68();
  if (OUTLINED_FUNCTION_3(v45))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_69(&dword_25DD62000, v46, v47, "error initializing TTMSchemaTTMNeuralCombinerTCUResult");
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_18_0();
  v48();
  swift_release();
  return 0;
}

void *sub_25DD73A14(uint64_t a1, uint64_t a2)
{
  LOBYTE(v3) = a2;
  uint64_t v77 = a1;
  uint64_t v78 = a2;
  sub_25DD6BE70();
  uint64_t v4 = (void *)sub_25DD89D18();
  unint64_t v5 = v4[2];
  if (v5 <= 1)
  {
    swift_bridgeObjectRelease();
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v6, (uint64_t)qword_26B37FB10);
    uint64_t v2 = (void *)sub_25DD89958();
    os_log_type_t v7 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v7))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v77 = OUTLINED_FUNCTION_15();
      uint64_t v8 = OUTLINED_FUNCTION_19_1(4.8149e-34);
      OUTLINED_FUNCTION_50(v8, v9, v10, v11);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v12, v13, "The assertVersion=%s doesn't follow semantic version scheme");
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_0();
LABEL_23:
      OUTLINED_FUNCTION_0();
LABEL_96:

      return 0;
    }

LABEL_18:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EEF0]), sel_init);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25DD89968();
    uint64_t v2 = (void *)OUTLINED_FUNCTION_13_2(v23, (uint64_t)qword_26B37FB10);
    os_log_type_t v24 = sub_25DD89C68();
    if (!OUTLINED_FUNCTION_49(v24)) {
      goto LABEL_96;
    }
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_27(&dword_25DD62000, v25, v26, "Failed to create SISchemaVersion");
    goto LABEL_23;
  }
  if (v4[2])
  {
    uint64_t v2 = v14;
    unint64_t v15 = v4[4];
    unint64_t v16 = v4[5];
    uint64_t v17 = HIBYTE(v16) & 0xF;
    uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
    if ((v16 & 0x2000000000000000) != 0) {
      uint64_t v19 = HIBYTE(v16) & 0xF;
    }
    else {
      uint64_t v19 = v15 & 0xFFFFFFFFFFFFLL;
    }
    if (!v19) {
      goto LABEL_90;
    }
    if ((v16 & 0x1000000000000000) == 0)
    {
      if ((v16 & 0x2000000000000000) == 0)
      {
        if ((v15 & 0x1000000000000000) != 0)
        {
          uint64_t v20 = (unsigned __int8 *)((v16 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else
        {
          OUTLINED_FUNCTION_67();
          uint64_t v20 = (unsigned __int8 *)sub_25DD89DC8();
        }
        int64_t v21 = sub_25DD77650(v20, v18, 10);
        LOBYTE(v17) = BYTE4(v21) & 1;
        uint64_t v22 = (uint64_t)v21;
LABEL_51:
        if ((v17 & 1) == 0) {
          goto LABEL_52;
        }
LABEL_90:
        swift_bridgeObjectRelease();
        if (qword_26B37F070 == -1) {
          goto LABEL_91;
        }
        goto LABEL_101;
      }
      uint64_t v77 = v4[4];
      uint64_t v78 = v16 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v27 = v15 >> 8;
      unint64_t v28 = v15 >> 16;
      if (v15 == 43)
      {
        if (v17)
        {
          if (v17 != 1)
          {
            uint64_t v22 = (BYTE1(v15) - 48);
            if (v22 <= 9)
            {
              if (v17 == 2) {
                goto LABEL_50;
              }
              if ((v28 - 48) <= 9u)
              {
                uint64_t v22 = 10 * v22 + (v28 - 48);
                uint64_t v32 = v17 - 3;
                if (v17 != 3)
                {
                  id v33 = (unsigned __int8 *)&v77 + 3;
                  while (1)
                  {
                    unsigned int v34 = *v33 - 48;
                    if (v34 > 9) {
                      goto LABEL_47;
                    }
                    uint64_t v35 = 10 * v22;
                    if ((v35 & 0xFFFFFFFF00000000) != 0) {
                      goto LABEL_47;
                    }
                    uint64_t v22 = v35 + v34;
                    if (__CFADD__(v35, v34)) {
                      goto LABEL_47;
                    }
                    LOBYTE(v17) = 0;
                    ++v33;
                    if (!--v32) {
                      goto LABEL_51;
                    }
                  }
                }
                goto LABEL_50;
              }
            }
            goto LABEL_47;
          }
          goto LABEL_102;
        }
      }
      else
      {
        if (v15 != 45)
        {
          if (v17)
          {
            uint64_t v22 = (v15 - 48);
            if (v22 <= 9)
            {
              if (v17 == 1) {
                goto LABEL_50;
              }
              unsigned __int8 v57 = v27 - 48;
              if (v57 <= 9u)
              {
                uint64_t v22 = 10 * v22 + v57;
                uint64_t v58 = v17 - 2;
                if (v17 != 2)
                {
                  uint64_t v59 = (unsigned __int8 *)&v77 + 2;
                  while (1)
                  {
                    unsigned int v60 = *v59 - 48;
                    if (v60 > 9) {
                      goto LABEL_47;
                    }
                    uint64_t v61 = 10 * v22;
                    if ((v61 & 0xFFFFFFFF00000000) != 0) {
                      goto LABEL_47;
                    }
                    uint64_t v22 = v61 + v60;
                    if (__CFADD__(v61, v60)) {
                      goto LABEL_47;
                    }
                    LOBYTE(v17) = 0;
                    ++v59;
                    if (!--v58) {
                      goto LABEL_51;
                    }
                  }
                }
                goto LABEL_50;
              }
            }
          }
LABEL_47:
          uint64_t v22 = 0;
LABEL_48:
          LOBYTE(v17) = 1;
          goto LABEL_51;
        }
        if (v17)
        {
          if (v17 != 1)
          {
            unsigned __int8 v29 = BYTE1(v15) - 48;
            if ((BYTE1(v15) - 48) <= 9u)
            {
              uint64_t v22 = 0;
              BOOL v30 = v29 == 0;
              uint64_t v31 = -v29;
              if (!v30) {
                goto LABEL_48;
              }
              if (v17 == 2)
              {
                LOBYTE(v17) = 0;
                uint64_t v22 = v31;
                goto LABEL_51;
              }
              unsigned __int8 v62 = v28 - 48;
              if (v62 <= 9u)
              {
                uint64_t v63 = 10 * v31;
                if ((v63 & 0xFFFFFFFF00000000) == 0)
                {
                  uint64_t v22 = v63 - v62;
                  if (v63 >= v62)
                  {
                    uint64_t v64 = v17 - 3;
                    if (v17 != 3)
                    {
                      uint64_t v65 = (unsigned __int8 *)&v77 + 3;
                      while (1)
                      {
                        unsigned int v66 = *v65 - 48;
                        if (v66 > 9) {
                          goto LABEL_47;
                        }
                        uint64_t v67 = 10 * v22;
                        if ((v67 & 0xFFFFFFFF00000000) != 0) {
                          goto LABEL_47;
                        }
                        uint64_t v22 = v67 - v66;
                        if (v67 < v66) {
                          goto LABEL_47;
                        }
                        LOBYTE(v17) = 0;
                        ++v65;
                        if (!--v64) {
                          goto LABEL_51;
                        }
                      }
                    }
LABEL_50:
                    LOBYTE(v17) = 0;
                    goto LABEL_51;
                  }
                }
              }
            }
            goto LABEL_47;
          }
LABEL_102:
          uint64_t v22 = 0;
          goto LABEL_51;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_105;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v68 = OUTLINED_FUNCTION_67();
  uint64_t v22 = sub_25DD77568(v68, v69, 10);
  swift_bridgeObjectRelease();
  if ((v22 & 0x100000000) != 0) {
    goto LABEL_90;
  }
LABEL_52:
  if (v4[2] < 2uLL)
  {
    __break(1u);
LABEL_101:
    swift_once();
LABEL_91:
    uint64_t v70 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v70, (uint64_t)qword_26B37FB10);
    os_log_type_t v45 = sub_25DD89958();
    os_log_type_t v71 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_35(v71))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v77 = OUTLINED_FUNCTION_15();
      uint64_t v72 = OUTLINED_FUNCTION_68(4.8149e-34);
      OUTLINED_FUNCTION_50(v72, v73, v74, v75);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_21_1();
      int64_t v51 = "Failed to convert major version to UInt for version=%s";
      goto LABEL_93;
    }
LABEL_95:

    OUTLINED_FUNCTION_15_2();
    goto LABEL_96;
  }
  uint64_t v36 = v4[6];
  unint64_t v37 = v4[7];
  swift_bridgeObjectRetain();
  unint64_t v38 = sub_25DD74224(v36, v37);
  if ((v38 & 0x100000000) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v44, (uint64_t)qword_26B37FB10);
    os_log_type_t v45 = sub_25DD89958();
    os_log_type_t v46 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_35(v46))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v77 = OUTLINED_FUNCTION_15();
      uint64_t v47 = OUTLINED_FUNCTION_68(4.8149e-34);
      OUTLINED_FUNCTION_50(v47, v48, v49, v50);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_21_1();
      int64_t v51 = "Failed to convert minor version to UInt for version=%s";
LABEL_93:
      OUTLINED_FUNCTION_61(&dword_25DD62000, v45, (os_log_type_t)v4, v51);
      swift_arrayDestroy();
      goto LABEL_94;
    }
    goto LABEL_95;
  }
  unint64_t v39 = v38;
  if (v5 < 3) {
    goto LABEL_58;
  }
  if (v4[2] < 3uLL)
  {
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  uint64_t v3 = v4[8];
  unint64_t v40 = v4[9];
  swift_bridgeObjectRetain();
  unint64_t v41 = sub_25DD74224(v3, v40);
  if ((v41 & 0x100000000) != 0)
  {
    if (qword_26B37F070 == -1)
    {
LABEL_67:
      uint64_t v52 = sub_25DD89968();
      __swift_project_value_buffer(v52, (uint64_t)qword_26B37FB10);
      swift_bridgeObjectRetain();
      os_log_type_t v45 = sub_25DD89958();
      os_log_type_t v53 = sub_25DD89C68();
      if (!OUTLINED_FUNCTION_24_1(v53))
      {

        goto LABEL_18;
      }
      os_log_type_t v54 = (_DWORD *)OUTLINED_FUNCTION_5_3();
      uint64_t v77 = OUTLINED_FUNCTION_15();
      *os_log_type_t v54 = 136315138;
      uint64_t v55 = v4[8];
      unint64_t v56 = v4[9];
      swift_bridgeObjectRetain();
      sub_25DD7D6C4(v55, v56, &v77);
      OUTLINED_FUNCTION_37();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_61(&dword_25DD62000, v45, (os_log_type_t)v3, "Malformed value for patch=%s");
      OUTLINED_FUNCTION_12_2();
LABEL_94:
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      goto LABEL_96;
    }
LABEL_107:
    swift_once();
    goto LABEL_67;
  }
  objc_msgSend(v2, sel_setPatch_, v41);
LABEL_58:
  objc_msgSend(v2, sel_setMajor_, v22);
  objc_msgSend(v2, sel_setMinor_, v39);
  if (v5 != 4)
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  if (v4[2] < 4uLL) {
    goto LABEL_106;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = OUTLINED_FUNCTION_67();
  sub_25DD77DCC(v42, v43, v2);
  return v2;
}

unint64_t sub_25DD74224(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_25DD89DC8();
      }
      os_log_type_t v7 = sub_25DD77650(v6, v4, 10);
      LODWORD(v8) = v7;
      char v27 = BYTE4(v7) & 1;
      char v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    int v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            uint64_t v15 = v3 - 2;
            if (v15)
            {
              unint64_t v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_35;
                }
                uint64_t v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v18 + v17;
                if (__CFADD__(v18, v17)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            uint64_t v19 = v3 - 1;
            if (v19)
            {
              uint64_t v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                unsigned int v24 = *v23 - 48;
                if (v24 > 9) {
                  goto LABEL_35;
                }
                uint64_t v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v25 + v24;
                if (__CFADD__(v25, v24)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v23;
                if (!--v19) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          int v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            uint64_t v11 = v3 - 2;
            if (v11)
            {
              uint64_t v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  goto LABEL_35;
                }
                uint64_t v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v14 - v13;
                if (v14 < v13) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v12;
                if (!--v11) {
                  goto LABEL_38;
                }
              }
            }
LABEL_37:
            char v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          char v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        char v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  unint64_t v8 = sub_25DD77568(a1, a2, 10);
  swift_bridgeObjectRelease();
  uint64_t v20 = HIDWORD(v8) & 1;
LABEL_39:
  uint64_t v21 = v8;
  if (v20) {
    uint64_t v21 = 0;
  }
  return v21 | ((unint64_t)v20 << 32);
}

void sub_25DD74484(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v11 = OUTLINED_FUNCTION_19_0(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  unsigned int v17 = (char *)v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD894C8();
  OUTLINED_FUNCTION_7_2(v5);
  if (v18)
  {
    sub_25DD773E4(v5);
    if (qword_26B37F070 != -1) {
      goto LABEL_97;
    }
    goto LABEL_4;
  }
  v81[1] = a1;
  uint64_t v82 = v4;
  v81[0] = v14;
  uint64_t v83 = v17;
  OUTLINED_FUNCTION_18_2();
  v24();
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F048]), sel_init);
  sub_25DD77EB4(a4, v84);
  a2 = v84[0];
  uint64_t v26 = v84[1];
  a3 = v84[3];
  uint64_t v27 = v84[4];
  int64_t v28 = (unint64_t)(v84[2] + 64) >> 6;
  swift_bridgeObjectRetain_n();
  if (!v27) {
    goto LABEL_8;
  }
LABEL_7:
  OUTLINED_FUNCTION_62();
  unint64_t v30 = v29 | (a3 << 6);
  while (1)
  {
    uint64_t v35 = *(void *)(a2 + 56) + 40 * v30;
    uint64_t v36 = *(void *)(v35 + 16);
    if (v36) {
      break;
    }
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v31 = a3 + 1;
    if (__OFADD__(a3, 1))
    {
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      swift_once();
LABEL_4:
      uint64_t v19 = sub_25DD89968();
      OUTLINED_FUNCTION_2_3(v19, (uint64_t)qword_26B37FB10);
      uint64_t v20 = (void *)sub_25DD89958();
      os_log_type_t v21 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_6_2(v21))
      {
        OUTLINED_FUNCTION_5_3();
        v86[0] = OUTLINED_FUNCTION_15();
        OUTLINED_FUNCTION_65(4.8149e-34);
        v85[0] = sub_25DD7D6C4(a2, a3, v86);
        sub_25DD89CF8();
        OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_3_3(&dword_25DD62000, v22, v23, "error converting trpID %s to UUID");
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {

        OUTLINED_FUNCTION_15_2();
      }
      return;
    }
    if (v31 >= v28) {
      goto LABEL_32;
    }
    unint64_t v32 = *(void *)(v26 + 8 * v31);
    unint64_t v33 = a3 + 1;
    if (!v32)
    {
      unint64_t v33 = a3 + 2;
      if ((uint64_t)(a3 + 2) >= v28) {
        goto LABEL_32;
      }
      unint64_t v32 = *(void *)(v26 + 8 * v33);
      if (!v32)
      {
        unint64_t v33 = a3 + 3;
        if ((uint64_t)(a3 + 3) >= v28) {
          goto LABEL_32;
        }
        unint64_t v32 = *(void *)(v26 + 8 * v33);
        if (!v32)
        {
          unint64_t v33 = a3 + 4;
          if ((uint64_t)(a3 + 4) >= v28) {
            goto LABEL_32;
          }
          unint64_t v32 = *(void *)(v26 + 8 * v33);
          if (!v32)
          {
            unint64_t v33 = a3 + 5;
            if ((uint64_t)(a3 + 5) >= v28) {
              goto LABEL_32;
            }
            unint64_t v32 = *(void *)(v26 + 8 * v33);
            if (!v32)
            {
              unint64_t v33 = a3 + 6;
              if ((uint64_t)(a3 + 6) >= v28)
              {
LABEL_32:
                swift_bridgeObjectRelease();
                swift_release();
                uint64_t v44 = v82;
                uint64_t v43 = v83;
                a3 = (unint64_t)v25;
                unint64_t v38 = 0x265517000;
                goto LABEL_35;
              }
              unint64_t v32 = *(void *)(v26 + 8 * v33);
              if (!v32)
              {
                int64_t v34 = a3 + 7;
                do
                {
                  if (v34 >= v28) {
                    goto LABEL_32;
                  }
                  unint64_t v32 = *(void *)(v26 + 8 * v34++);
                }
                while (!v32);
                unint64_t v33 = v34 - 1;
              }
            }
          }
        }
      }
    }
    uint64_t v27 = (v32 - 1) & v32;
    unint64_t v30 = __clz(__rbit64(v32)) + (v33 << 6);
    a3 = v33;
  }
  uint64_t v37 = *(void *)(v35 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v38 = 0x265517000uLL;
  id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ECF0]), sel_init);
  unint64_t v40 = v39;
  if (v39)
  {
    id v41 = v39;
    uint64_t v42 = sub_25DD73A14(v37, v36);
    swift_bridgeObjectRelease();
    objc_msgSend(v41, sel_setAssetVersion_, v42);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v44 = v82;
  uint64_t v43 = v83;
  a3 = (unint64_t)v25;
  id v45 = v25;
  objc_msgSend(v45, sel_setAsset_, v40);

LABEL_35:
  sub_25DD77EB4(a4, v85);
  a2 = v85[0];
  uint64_t v46 = v85[1];
  uint64_t v47 = v85[3];
  uint64_t v48 = v85[4];
  int64_t v49 = (unint64_t)(v85[2] + 64) >> 6;
  while (v48)
  {
    OUTLINED_FUNCTION_58();
LABEL_55:
    uint64_t v55 = *(void *)(a2 + 56) + v51 * v50;
    if ((*(unsigned char *)(v55 + 28) & 1) == 0)
    {
      int v56 = *(_DWORD *)(v55 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      LODWORD(v57) = v56;
      objc_msgSend((id)a3, sel_setNeuralCombinerThreshold_, v57);
      goto LABEL_58;
    }
  }
  int64_t v52 = v47 + 1;
  if (__OFADD__(v47, 1)) {
    goto LABEL_95;
  }
  if (v52 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * v52)) {
    goto LABEL_54;
  }
  if (v47 + 2 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * (v47 + 2))) {
    goto LABEL_54;
  }
  if (v47 + 3 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * (v47 + 3))) {
    goto LABEL_54;
  }
  if (v47 + 4 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * (v47 + 4))) {
    goto LABEL_54;
  }
  if (v47 + 5 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * (v47 + 5))) {
    goto LABEL_54;
  }
  if (v47 + 6 >= v49) {
    goto LABEL_57;
  }
  if (*(void *)(v46 + 8 * (v47 + 6)))
  {
LABEL_54:
    OUTLINED_FUNCTION_45();
    goto LABEL_55;
  }
  int64_t v53 = v47 + 7;
  while (v53 < v49)
  {
    if (*(void *)(v46 + 8 * v53++)) {
      goto LABEL_54;
    }
  }
LABEL_57:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_58:
  sub_25DD77EB4(a4, v86);
  a2 = v86[0];
  uint64_t v58 = v86[1];
  uint64_t v59 = v86[3];
  uint64_t v60 = v86[4];
  int64_t v61 = (unint64_t)(v86[2] + 64) >> 6;
  while (2)
  {
    if (v60)
    {
      OUTLINED_FUNCTION_58();
      goto LABEL_78;
    }
    int64_t v64 = v59 + 1;
    if (__OFADD__(v59, 1)) {
      goto LABEL_96;
    }
    if (v64 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * v64)) {
      goto LABEL_77;
    }
    if (v59 + 2 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * (v59 + 2))) {
      goto LABEL_77;
    }
    if (v59 + 3 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * (v59 + 3))) {
      goto LABEL_77;
    }
    if (v59 + 4 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * (v59 + 4))) {
      goto LABEL_77;
    }
    if (v59 + 5 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * (v59 + 5))) {
      goto LABEL_77;
    }
    if (v59 + 6 >= v61) {
      goto LABEL_81;
    }
    if (*(void *)(v58 + 8 * (v59 + 6)))
    {
LABEL_77:
      OUTLINED_FUNCTION_45();
LABEL_78:
      uint64_t v67 = *(void *)(a2 + 56) + v63 * v62;
      if ((*(unsigned char *)(v67 + 36) & 1) == 0)
      {
        int v68 = *(_DWORD *)(v67 + 32);
        swift_bridgeObjectRetain();
        swift_release();
        LODWORD(v69) = v68;
        objc_msgSend((id)a3, sel_setSpeakerIdThreshold_, v69);
        if (!a3) {
          goto LABEL_86;
        }
        goto LABEL_82;
      }
      continue;
    }
    break;
  }
  int64_t v65 = v59 + 7;
  while (v65 < v61)
  {
    if (*(void *)(v58 + 8 * v65++)) {
      goto LABEL_77;
    }
  }
LABEL_81:
  swift_bridgeObjectRetain();
  swift_release();
  if (!a3) {
    goto LABEL_86;
  }
LABEL_82:
  id v70 = (id)a3;
  if (sub_25DD73420(a4))
  {
    sub_25DD68D8C(0, &qword_26B37F878);
    os_log_type_t v71 = (void *)sub_25DD89BC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v71 = 0;
  }
  objc_msgSend(v70, sel_setResults_, v71);

LABEL_86:
  id v72 = [objc_allocWithZone(MEMORY[0x263F6F040]) *(SEL *)(v38 + 2552)];
  objc_msgSend(v72, sel_setEnded_, a3);
  sub_25DD7224C();
  if (v73)
  {
    uint64_t v74 = v73;
    objc_msgSend(v73, sel_setTtmNeuralCombinerRequestContext_, v72);
    __swift_project_boxed_opaque_existential_1((void *)(v44 + 16), *(void *)(v44 + 40));
    sub_25DD71CC4((uint64_t)v74);
  }
  else
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v75 = sub_25DD89968();
    uint64_t v76 = (void *)OUTLINED_FUNCTION_13_2(v75, (uint64_t)qword_26B37FB10);
    os_log_type_t v77 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_3(v77))
    {
      uint64_t v78 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_44(v78);
      OUTLINED_FUNCTION_30_0(&dword_25DD62000, v79, v80, "error generating the TTMClient Event");
      OUTLINED_FUNCTION_0();
    }
  }
  (*(void (**)(char *, uint64_t))(v81[0] + 8))(v43, v12);
}

void sub_25DD74C58()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v62 = v0;
  uint64_t v63 = v3;
  int v61 = v4;
  int64_t v64 = v5;
  uint64_t v7 = v6;
  unint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v13 = OUTLINED_FUNCTION_19_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_42();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v59 - v15;
  uint64_t v17 = sub_25DD89518();
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_23_1();
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v59 - v22;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v59 - v25;
  sub_25DD894C8();
  OUTLINED_FUNCTION_14_1((uint64_t)v16, 1, v17);
  if (v38)
  {
    sub_25DD773E4((uint64_t)v16);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25DD89968();
    OUTLINED_FUNCTION_47(v27, (uint64_t)qword_26B37FB10);
    swift_bridgeObjectRetain_n();
    int64_t v28 = (void *)sub_25DD89958();
    os_log_type_t v29 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v29))
    {
      unint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_5_3();
      uint64_t v65 = OUTLINED_FUNCTION_15();
      *unint64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25DD7D6C4(v11, v9, &v65);
      OUTLINED_FUNCTION_32_0(v31);
      sub_25DD89CF8();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v32, v33, "error converting trpID %s to UUID");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v34 = v19;
    uint64_t v35 = *(void (**)(uint64_t))(v19 + 32);
    uint64_t v60 = v26;
    uint64_t v36 = OUTLINED_FUNCTION_67();
    v35(v36);
    id v37 = v64;
    sub_25DD894C8();
    OUTLINED_FUNCTION_14_1(v2, 1, v17);
    if (v38)
    {
      uint64_t v39 = v7;
      sub_25DD773E4(v2);
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v40 = sub_25DD89968();
      OUTLINED_FUNCTION_47(v40, (uint64_t)qword_26B37FB10);
      swift_bridgeObjectRetain_n();
      id v41 = sub_25DD89958();
      os_log_type_t v42 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_21(v42))
      {
        uint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_5_3();
        uint64_t v44 = OUTLINED_FUNCTION_15();
        OUTLINED_FUNCTION_56(v44);
        *(_DWORD *)uint64_t v43 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_25DD7D6C4(v39, (unint64_t)v37, &v65);
        OUTLINED_FUNCTION_57(v45);
        sub_25DD89CF8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25DD62000, v41, (os_log_type_t)v37, "error converting tcuID %s to UUID", v43, 0xCu);
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v19 + 8))(v60, v17);
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t))v35)(v23, v2, v17);
      id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F050]), sel_init);
      uint64_t v47 = v46;
      if (v46)
      {
        objc_msgSend(v46, sel_setReason_, 2 * ((_BYTE)v61 == 0));
        sub_25DD68D8C(0, &qword_26B37F858);
        OUTLINED_FUNCTION_63();
        v48();
        id v37 = v47;
        id v49 = sub_25DD726E4(v1);
        objc_msgSend(v37, sel_setTcuId_, v49);
      }
      id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F040]), sel_init);
      objc_msgSend(v50, sel_setFailed_, v47);
      uint64_t v51 = v60;
      sub_25DD7224C();
      if (v52)
      {
        int64_t v53 = v52;
        objc_msgSend(v52, sel_setTtmNeuralCombinerRequestContext_, v50);
        __swift_project_boxed_opaque_existential_1((void *)(v62 + 16), *(void *)(v62 + 40));
        sub_25DD71CC4((uint64_t)v53);
      }
      else
      {
        if (qword_26B37F070 != -1) {
          swift_once();
        }
        uint64_t v54 = sub_25DD89968();
        uint64_t v55 = OUTLINED_FUNCTION_13_2(v54, (uint64_t)qword_26B37FB10);
        os_log_type_t v56 = sub_25DD89C68();
        if (OUTLINED_FUNCTION_21(v56))
        {
          double v57 = (_WORD *)OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_44(v57);
          _os_log_impl(&dword_25DD62000, v55, (os_log_type_t)v37, "error generating the TTMClient Event", (uint8_t *)0x265517000, 2u);
          OUTLINED_FUNCTION_0();
        }
      }
      uint64_t v58 = *(void (**)(char *, uint64_t))(v34 + 8);
      v58(v23, v17);
      v58(v51, v17);
    }
  }
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD75238()
{
}

void sub_25DD75254()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v39 = v2;
  int v4 = v3;
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v14 = OUTLINED_FUNCTION_19_0(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_8();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_25DD89518();
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_16_2();
  sub_25DD894C8();
  OUTLINED_FUNCTION_7_2(v17);
  if (v22)
  {
    sub_25DD773E4(v17);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v23, (uint64_t)qword_26B37FB10);
    uint64_t v24 = (void *)sub_25DD89958();
    os_log_type_t v25 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v25))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v40 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_19_1(4.8149e-34);
      uint64_t v26 = sub_25DD7D6C4(v10, v8, &v40);
      OUTLINED_FUNCTION_8_1(v26);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v27, v28, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_18_2();
    v29();
    id v30 = objc_msgSend(objc_allocWithZone(*v6), sel_init);
    uint64_t v31 = v30;
    if (v30) {
      objc_msgSend(v30, sel_setExists_, 1);
    }
    id v32 = objc_msgSend(objc_allocWithZone(*v4), sel_init);
    objc_msgSend(v32, sel_setStartedOrChanged_, v31);
    sub_25DD7224C();
    if (v33)
    {
      uint64_t v34 = v33;
      objc_msgSend(v33, *v39, v32);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      sub_25DD71CC4((uint64_t)v34);
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_25DD89968();
      uint64_t v36 = OUTLINED_FUNCTION_13_2(v35, (uint64_t)qword_26B37FB10);
      os_log_type_t v37 = sub_25DD89C68();
      if (os_log_type_enabled(v36, v37))
      {
        char v38 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_44(v38);
        _os_log_impl(&dword_25DD62000, v36, v37, "error generating the TTMClient Event", v12, 2u);
        OUTLINED_FUNCTION_0();
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v1, v18);
  }
  OUTLINED_FUNCTION_9_2();
}

uint64_t sub_25DD75580(char a1)
{
  return dword_25DD8AF80[a1];
}

void sub_25DD75594()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v6 = OUTLINED_FUNCTION_19_0(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v109 = OUTLINED_FUNCTION_40();
  MEMORY[0x270FA5388](v109 - 8);
  OUTLINED_FUNCTION_64();
  uint64_t v103 = v7;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v8);
  uint64_t v108 = (char *)&v100 - v9;
  uint64_t v123 = MEMORY[0x263F8EE78];
  uint64_t v100 = v4 + 64;
  OUTLINED_FUNCTION_39();
  uint64_t v12 = v11 & v10;
  int64_t v101 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v105 = v14 + 32;
  os_log_type_t v102 = (void (**)(uint64_t, unint64_t, uint64_t))(v14 + 16);
  uint64_t v106 = v14 + 8;
  swift_bridgeObjectRetain();
  uint64_t v15 = 0;
  *(void *)&long long v16 = 136315138;
  long long v114 = v16;
  uint64_t v113 = MEMORY[0x263F8EE58] + 8;
  uint64_t v107 = v4;
  uint64_t v104 = v0;
  if (!v12) {
    goto LABEL_3;
  }
LABEL_2:
  OUTLINED_FUNCTION_62();
  uint64_t v111 = v12;
  int64_t v112 = v17;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v28 = (uint64_t *)(*(void *)(v4 + 48) + 16 * i);
    uint64_t v2 = *v28;
    unint64_t v1 = v28[1];
    uint64_t v29 = *(void *)(v4 + 56) + 16 * i;
    char v30 = *(unsigned char *)v29;
    uint64_t v31 = *(void *)(v29 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25DD894C8();
    uint64_t v32 = v109;
    OUTLINED_FUNCTION_14_1(v0, 1, v109);
    if (v33)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25DD773E4(v0);
      if (qword_26B37F070 != -1) {
        goto LABEL_70;
      }
      goto LABEL_52;
    }
    swift_bridgeObjectRelease();
    unint64_t v1 = (unint64_t)v108;
    OUTLINED_FUNCTION_66();
    v34();
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F098]), sel_init);
    if (!v35) {
      break;
    }
    uint64_t v36 = v35;
    sub_25DD68D8C(0, &qword_26B37F858);
    uint64_t v37 = v103;
    (*v102)(v103, v1, v32);
    id v38 = sub_25DD726E4(v37);
    objc_msgSend(v36, sel_setTcuId_, v38);

    unint64_t v39 = 0x265517000uLL;
    objc_msgSend(v36, sel_setRecommendation_, sub_25DD75580(v30));
    id v40 = v36;
    MEMORY[0x2611C50C0]();
    unint64_t v42 = *(void *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v41 = *(void *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v42 >= v41 >> 1) {
      OUTLINED_FUNCTION_28_0(v42 + 1, v41);
    }
    BOOL v110 = v40;
    sub_25DD89C08();
    sub_25DD89BE8();
    uint64_t v43 = MEMORY[0x263F8EE78];
    uint64_t v122 = MEMORY[0x263F8EE78];
    uint64_t v2 = *(void *)(v31 + 16);
    if (v2)
    {
      uint64_t v44 = v31 + 32;
      do
      {
        sub_25DD6FB28(v44, (uint64_t)v118);
        id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F088]), sel_init);
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = v119;
          uint64_t v48 = v120;
          __swift_project_boxed_opaque_existential_1(v118, v119);
          char v49 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 16))(v47, v48);
          uint64_t v50 = 2;
          switch(v49)
          {
            case 1:
              uint64_t v50 = 7;
              break;
            case 2:
              uint64_t v50 = 6;
              break;
            case 3:
              uint64_t v50 = 8;
              break;
            case 4:
              uint64_t v50 = 5;
              break;
            case 5:
              uint64_t v50 = 9;
              break;
            case 6:
              if (qword_26B37F070 != -1) {
                swift_once();
              }
              uint64_t v60 = sub_25DD89968();
              int v61 = (void *)OUTLINED_FUNCTION_13_2(v60, (uint64_t)qword_26B37FB10);
              os_log_type_t v62 = sub_25DD89C68();
              if (OUTLINED_FUNCTION_24_1(v62))
              {
                uint64_t v63 = (uint8_t *)OUTLINED_FUNCTION_16();
                *(_WORD *)uint64_t v63 = 0;
                OUTLINED_FUNCTION_70();
                _os_log_impl(v64, v65, v66, "overrideType is unknown", v63, 2u);
                OUTLINED_FUNCTION_0();
              }

              uint64_t v50 = 0;
              break;
            default:
              break;
          }
          uint64_t v67 = dword_25DD8AF80[v121];
          objc_msgSend(v46, sel_setOverrideType_, v50);
          objc_msgSend(v46, *(SEL *)(v39 + 2648), v67);
          id v68 = v46;
          MEMORY[0x2611C50C0]();
          unint64_t v70 = *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10);
          unint64_t v69 = *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v70 >= v69 >> 1) {
            OUTLINED_FUNCTION_28_0(v70 + 1, v69);
          }
          sub_25DD89C08();
          sub_25DD89BE8();
        }
        else
        {
          if (qword_26B37F070 != -1) {
            swift_once();
          }
          uint64_t v51 = sub_25DD89968();
          OUTLINED_FUNCTION_47(v51, (uint64_t)qword_26B37FB10);
          sub_25DD6FB28((uint64_t)v118, (uint64_t)v117);
          int64_t v52 = (void *)sub_25DD89958();
          os_log_type_t v53 = sub_25DD89C68();
          if (OUTLINED_FUNCTION_24_1(v53))
          {
            uint64_t v54 = OUTLINED_FUNCTION_5_3();
            uint64_t v116 = OUTLINED_FUNCTION_15();
            *(_DWORD *)uint64_t v54 = v114;
            sub_25DD6FB28((uint64_t)v117, (uint64_t)&v115);
            uint64_t v55 = sub_25DD89AC8();
            *(void *)(v54 + 4) = sub_25DD7D6C4(v55, v56, &v116);
            unint64_t v39 = 0x265517000;
            swift_bridgeObjectRelease();
            sub_25DD6FF10((uint64_t)v117);
            OUTLINED_FUNCTION_70();
            _os_log_impl(v57, v58, v59, "error initializing TTMSchemaTTMOverrideResult for %s", (uint8_t *)v54, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_0();
          }
          else
          {

            sub_25DD6FF10((uint64_t)v117);
          }
        }
        sub_25DD6FF10((uint64_t)v118);
        v44 += 48;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
      uint64_t v71 = v122;
      unint64_t v1 = (unint64_t)v108;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v71 = v43;
    }
    id v72 = v110;
    sub_25DD77E30(v71, v110, &qword_26B37F868, 0x263F6F088, (SEL *)&selRef_setOverrideResults_);

    uint64_t v73 = OUTLINED_FUNCTION_27_0();
    v74(v73);
    uint64_t v4 = v107;
    uint64_t v0 = v104;
    uint64_t v15 = v112;
    uint64_t v12 = v111;
    if (v111) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v20 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_69;
    }
    if (v20 >= v101) {
      goto LABEL_59;
    }
    unint64_t v21 = *(void *)(v100 + 8 * v20);
    int64_t v22 = v15 + 1;
    if (!v21)
    {
      OUTLINED_FUNCTION_59();
      if (v23 == v24) {
        goto LABEL_59;
      }
      OUTLINED_FUNCTION_54();
      if (!v21)
      {
        OUTLINED_FUNCTION_59();
        if (v23 == v24) {
          goto LABEL_59;
        }
        OUTLINED_FUNCTION_54();
        if (!v21)
        {
          int64_t v26 = v25 + 3;
          if (v26 >= v101)
          {
LABEL_59:
            swift_release();
            if (qword_26B37F070 != -1) {
              swift_once();
            }
            uint64_t v88 = sub_25DD89968();
            OUTLINED_FUNCTION_47(v88, (uint64_t)qword_26B37FB10);
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain_n();
            char v89 = sub_25DD89958();
            os_log_type_t v90 = sub_25DD89C58();
            if (OUTLINED_FUNCTION_6_2(v90))
            {
              uint64_t v91 = swift_slowAlloc();
              v118[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v91 = 136315394;
              uint64_t v92 = sub_25DD68D8C(0, &qword_26B37F870);
              uint64_t v93 = swift_bridgeObjectRetain();
              uint64_t v94 = MEMORY[0x2611C50E0](v93, v92);
              unint64_t v96 = v95;
              swift_bridgeObjectRelease();
              v117[0] = sub_25DD7D6C4(v94, v96, v118);
              sub_25DD89CF8();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v91 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v97 = sub_25DD89A18();
              unint64_t v99 = v98;
              swift_bridgeObjectRelease();
              v117[0] = sub_25DD7D6C4(v97, v99, v118);
              sub_25DD89CF8();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_25DD62000, v89, (os_log_type_t)v12, "Constructed SELF logging object %s for overridesResult %s", (uint8_t *)v91, 0x16u);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_0();
            }
            else
            {

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
            }
            swift_beginAccess();
            goto LABEL_67;
          }
          unint64_t v21 = *(void *)(v100 + 8 * v26);
          if (!v21)
          {
            while (!__OFADD__(v26, 1))
            {
              OUTLINED_FUNCTION_59();
              if (v23 == v24) {
                goto LABEL_59;
              }
              OUTLINED_FUNCTION_54();
              int64_t v26 = v27 + 1;
              if (v21) {
                goto LABEL_19;
              }
            }
LABEL_69:
            __break(1u);
LABEL_70:
            swift_once();
LABEL_52:
            uint64_t v75 = sub_25DD89968();
            __swift_project_value_buffer(v75, (uint64_t)qword_26B37FB10);
            swift_bridgeObjectRetain();
            uint64_t v76 = (void *)sub_25DD89958();
            os_log_type_t v77 = sub_25DD89C68();
            if (OUTLINED_FUNCTION_6_2(v77))
            {
              uint64_t v78 = (_DWORD *)OUTLINED_FUNCTION_5_3();
              v118[0] = OUTLINED_FUNCTION_15();
              _DWORD *v78 = v114;
              swift_bridgeObjectRetain();
              v117[0] = sub_25DD7D6C4(v2, v1, v118);
              sub_25DD89CF8();
              swift_bridgeObjectRelease_n();
              OUTLINED_FUNCTION_3_3(&dword_25DD62000, v79, v80, "error converting tcuId - %s to UUID");
              swift_arrayDestroy();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_0();
              swift_release();
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease_n();
            }

            goto LABEL_67;
          }
          int64_t v22 = v26;
        }
      }
    }
LABEL_19:
    uint64_t v111 = (v21 - 1) & v21;
    int64_t v112 = v22;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v81 = sub_25DD89968();
  uint64_t v82 = (void *)OUTLINED_FUNCTION_13_2(v81, (uint64_t)qword_26B37FB10);
  os_log_type_t v83 = sub_25DD89C68();
  if (OUTLINED_FUNCTION_49(v83))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_27(&dword_25DD62000, v84, v85, "error initializing TTMSchemaTTMNeuralCombinerTCUResult");
    OUTLINED_FUNCTION_0();
  }

  uint64_t v86 = OUTLINED_FUNCTION_27_0();
  v87(v86);
  swift_release();
LABEL_67:
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD76164()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_60();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v5 = OUTLINED_FUNCTION_19_0(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_7_2(v3);
  if (v7)
  {
    sub_25DD773E4(v3);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v8, (uint64_t)qword_26B37FB10);
    uint64_t v9 = (void *)sub_25DD89958();
    os_log_type_t v10 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v10))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v11 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_56(v11);
      OUTLINED_FUNCTION_19_1(4.8149e-34);
      uint64_t v12 = sub_25DD7D6C4(v2, v1, &v32);
      OUTLINED_FUNCTION_8_1(v12);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v13, v14, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    OUTLINED_FUNCTION_18_2();
    v15();
    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F070]), sel_init);
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = v16;
      sub_25DD75594();
      if (v19)
      {
        sub_25DD68D8C(0, &qword_26B37F870);
        int64_t v20 = (void *)sub_25DD89BC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        int64_t v20 = 0;
      }
      objc_msgSend(v18, sel_setResults_, v20);
    }
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F068]), sel_init);
    objc_msgSend(v21, sel_setEnded_, v17);
    sub_25DD7224C();
    if (v22)
    {
      char v23 = v22;
      objc_msgSend(v22, sel_setTtmOverrideRequestContext_, v21);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      sub_25DD71CC4((uint64_t)v23);
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_25DD89968();
      uint64_t v25 = (void *)OUTLINED_FUNCTION_13_2(v24, (uint64_t)qword_26B37FB10);
      os_log_type_t v26 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_3(v26))
      {
        uint64_t v27 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_44(v27);
        OUTLINED_FUNCTION_30_0(&dword_25DD62000, v28, v29, "error generating the TTMClient Event");
        OUTLINED_FUNCTION_0();
      }
    }
    uint64_t v30 = OUTLINED_FUNCTION_31_0();
    v31(v30);
  }
  OUTLINED_FUNCTION_9_2();
}

id sub_25DD76494()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v2 = OUTLINED_FUNCTION_19_0(v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_52();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v22 - v11;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F090]), sel_init);
  sub_25DD894C8();
  OUTLINED_FUNCTION_14_1(v0, 1, v3);
  if (v14)
  {
    sub_25DD773E4(v0);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25DD89968();
    id v16 = OUTLINED_FUNCTION_13_2(v15, (uint64_t)qword_26B37FB10);
    os_log_type_t v17 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_21(v17))
    {
      id v18 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_25DD62000, v16, (os_log_type_t)v3, "Cannot convert tcuID to UUID for TTMClient Event", v18, 2u);
      OUTLINED_FUNCTION_0();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v12, v0, v3);
    if (v13)
    {
      sub_25DD68D8C(0, &qword_26B37F858);
      OUTLINED_FUNCTION_63();
      v19();
      id v20 = sub_25DD726E4(v9);
      objc_msgSend(v13, sel_setTcuId_, v20);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v3);
  }
  return v13;
}

void sub_25DD766E4()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  uint64_t v7 = OUTLINED_FUNCTION_19_0(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8();
  uint64_t v10 = v9 - v8;
  sub_25DD89518();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16_2();
  sub_25DD894C8();
  OUTLINED_FUNCTION_7_2(v10);
  if (v12)
  {
    sub_25DD773E4(v10);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v13, (uint64_t)qword_26B37FB10);
    char v14 = (void *)sub_25DD89958();
    os_log_type_t v15 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v15))
    {
      OUTLINED_FUNCTION_5_3();
      uint64_t v16 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_56(v16);
      OUTLINED_FUNCTION_65(4.8149e-34);
      sub_25DD7D6C4(v5, v3, &v34);
      sub_25DD89CF8();
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v17, v18, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_18_2();
    v19();
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F078]), sel_init);
    id v21 = sub_25DD76494();
    if (v21)
    {
      id v22 = v21;
      if (v20)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6218);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_25DD8AF70;
        *(void *)(v23 + 32) = v22;
        uint64_t v34 = v23;
        sub_25DD89BE8();
        sub_25DD77E30(v34, v20, &qword_26A6C6220, 0x263F6F090, (SEL *)&selRef_setTcuFailures_);
      }
      else
      {
      }
    }
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6F068]), sel_init);
    objc_msgSend(v24, sel_setFailed_, v20);
    sub_25DD7224C();
    if (v25)
    {
      os_log_type_t v26 = v25;
      objc_msgSend(v25, sel_setTtmOverrideRequestContext_, v24);
      __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
      sub_25DD71CC4((uint64_t)v26);
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_25DD89968();
      uint64_t v28 = (void *)OUTLINED_FUNCTION_13_2(v27, (uint64_t)qword_26B37FB10);
      os_log_type_t v29 = sub_25DD89C68();
      if (OUTLINED_FUNCTION_3(v29))
      {
        *(_WORD *)OUTLINED_FUNCTION_16() = 0;
        OUTLINED_FUNCTION_69(&dword_25DD62000, v30, v31, "error generating the TTMClient Event");
        OUTLINED_FUNCTION_0();
      }
    }
    uint64_t v32 = OUTLINED_FUNCTION_34();
    v33(v32);
  }
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD76A68()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v98 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  MEMORY[0x270FA5388](v94);
  OUTLINED_FUNCTION_52();
  uint64_t v97 = v8 - v9;
  OUTLINED_FUNCTION_5();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v87 - v12;
  MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)&v87 - v14;
  uint64_t v16 = sub_25DD89518();
  OUTLINED_FUNCTION_2();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_42();
  MEMORY[0x270FA5388](v20);
  id v22 = (char *)&v87 - v21;
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v87 - v24;
  sub_25DD77F38(v3, (uint64_t)v15);
  OUTLINED_FUNCTION_7_2((uint64_t)v15);
  if (v36)
  {
    sub_25DD773E4((uint64_t)v15);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v26, (uint64_t)qword_26B37FB10);
    uint64_t v27 = (void *)sub_25DD89958();
    os_log_type_t v28 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_6_2(v28))
    {
      os_log_type_t v29 = (_DWORD *)OUTLINED_FUNCTION_5_3();
      uint64_t v30 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_56(v30);
      *os_log_type_t v29 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25DD7D6C4(v7, v5, &v100);
      OUTLINED_FUNCTION_32_0(v31);
      sub_25DD89CF8();
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_3_3(&dword_25DD62000, v32, v33, "Error emitting request link because of nil ttmID and requestId - %s");
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_15_2();
    }
  }
  else
  {
    uint64_t v96 = v18;
    uint64_t v34 = v25;
    id v35 = *(void (**)(void))(v18 + 32);
    unint64_t v95 = v34;
    v35();
    sub_25DD894C8();
    OUTLINED_FUNCTION_7_2((uint64_t)v13);
    if (!v36)
    {
      uint64_t v93 = v7;
      unint64_t v42 = v22;
      ((void (*)(char *, char *, uint64_t))v35)(v22, v13, v16);
      id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
      if (v43)
      {
        uint64_t v44 = v43;
        id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
        if (v45)
        {
          id v46 = v45;
          id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
          if (v47)
          {
            uint64_t v48 = v42;
            char v49 = v47;
            sub_25DD68D8C(0, &qword_26B37F858);
            uint64_t v89 = (uint64_t)v44;
            uint64_t v50 = *(void (**)(uint64_t, char *, uint64_t))(v96 + 16);
            uint64_t v92 = v48;
            v50(v1, v48, v16);
            id v51 = sub_25DD726E4(v1);
            objc_msgSend(v49, sel_setUuid_, v51);

            objc_msgSend(v49, sel_setComponent_, 1);
            v50(v1, v95, v16);
            int64_t v52 = (void *)v89;
            id v53 = sub_25DD726E4(v1);
            objc_msgSend(v46, sel_setUuid_, v53);

            objc_msgSend(v46, sel_setComponent_, 37);
            id v91 = v46;
            objc_msgSend(v52, sel_setSource_, v46);
            id v90 = v49;
            objc_msgSend(v52, sel_setTarget_, v49);
            if (qword_26B37F070 != -1) {
              swift_once();
            }
            uint64_t v54 = sub_25DD89968();
            OUTLINED_FUNCTION_47(v54, (uint64_t)qword_26B37FB10);
            uint64_t v55 = v97;
            sub_25DD77F38(v3, v97);
            id v56 = v52;
            swift_bridgeObjectRetain_n();
            id v57 = v56;
            os_log_t v58 = sub_25DD89958();
            os_log_type_t v59 = sub_25DD89C58();
            if (OUTLINED_FUNCTION_21(v59))
            {
              uint64_t v60 = OUTLINED_FUNCTION_15();
              uint64_t v89 = swift_slowAlloc();
              uint64_t v100 = v89;
              *(_DWORD *)uint64_t v60 = 136315650;
              id v61 = v57;
              int v88 = (int)v56;
              id v62 = v61;
              id v63 = objc_msgSend(v61, sel_description);
              uint64_t v64 = sub_25DD89A78();
              os_log_t v87 = v58;
              uint64_t v65 = v64;
              unint64_t v67 = v66;

              uint64_t v99 = sub_25DD7D6C4(v65, v67, &v100);
              sub_25DD89CF8();

              swift_bridgeObjectRelease();
              *(_WORD *)(v60 + 12) = 2080;
              uint64_t v68 = sub_25DD89AF8();
              uint64_t v99 = sub_25DD7D6C4(v68, v69, &v100);
              sub_25DD89CF8();
              OUTLINED_FUNCTION_15_2();
              swift_bridgeObjectRelease();
              *(_WORD *)(v60 + 22) = 2080;
              uint64_t v70 = sub_25DD89CD8();
              uint64_t v99 = sub_25DD7D6C4(v70, v71, &v100);
              sub_25DD89CF8();
              swift_bridgeObjectRelease();
              sub_25DD773E4(v55);
              os_log_t v72 = v87;
              _os_log_impl(&dword_25DD62000, v87, (os_log_type_t)v88, "Emitting request link: %s with requestId: %s, ttmId: %s", (uint8_t *)v60, 0x20u);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_0();
            }
            else
            {
              OUTLINED_FUNCTION_15_2();

              sub_25DD773E4(v55);
            }
            uint64_t v85 = v95;
            uint64_t v84 = v96;
            uint64_t v86 = v92;
            __swift_project_boxed_opaque_existential_1((void *)(v98 + 16), *(void *)(v98 + 40));
            sub_25DD71CC4((uint64_t)v57);

            uint64_t v82 = *(void (**)(char *, uint64_t))(v84 + 8);
            v82(v86, v16);
            os_log_type_t v83 = v85;
LABEL_34:
            v82(v83, v16);
            goto LABEL_35;
          }
        }
        else
        {
          id v46 = v44;
        }
      }
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_25DD89968();
      OUTLINED_FUNCTION_2_3(v74, (uint64_t)qword_26B37FB10);
      uint64_t v75 = sub_25DD89958();
      os_log_type_t v76 = sub_25DD89C68();
      if (os_log_type_enabled(v75, v76))
      {
        os_log_type_t v77 = (uint8_t *)OUTLINED_FUNCTION_5_3();
        uint64_t v78 = OUTLINED_FUNCTION_15();
        uint64_t v92 = v42;
        uint64_t v100 = v78;
        *(_DWORD *)os_log_type_t v77 = 136315138;
        uint64_t v79 = sub_25DD89AF8();
        uint64_t v81 = sub_25DD7D6C4(v79, v80, &v100);
        OUTLINED_FUNCTION_57(v81);
        sub_25DD89CF8();
        OUTLINED_FUNCTION_15_2();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25DD62000, v75, v76, "Failed to initialize inRequest schema objects. requestId: %s", v77, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();

        uint64_t v82 = *(void (**)(char *, uint64_t))(v96 + 8);
        v82(v92, v16);
      }
      else
      {
        OUTLINED_FUNCTION_15_2();

        uint64_t v82 = *(void (**)(char *, uint64_t))(v96 + 8);
        v82(v42, v16);
      }
      os_log_type_t v83 = v95;
      goto LABEL_34;
    }
    sub_25DD773E4((uint64_t)v13);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25DD89968();
    OUTLINED_FUNCTION_2_3(v37, (uint64_t)qword_26B37FB10);
    id v38 = sub_25DD89958();
    os_log_type_t v39 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_35(v39))
    {
      id v40 = (uint8_t *)OUTLINED_FUNCTION_5_3();
      uint64_t v100 = OUTLINED_FUNCTION_15();
      *(_DWORD *)id v40 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25DD7D6C4(v7, v5, &v100);
      OUTLINED_FUNCTION_8_1(v41);
      OUTLINED_FUNCTION_21_1();
      _os_log_impl(&dword_25DD62000, v38, (os_log_type_t)v35, "error converting requestId %s to UUID", v40, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      OUTLINED_FUNCTION_15_2();
    }

    OUTLINED_FUNCTION_18_0();
    v73();
  }
LABEL_35:
  OUTLINED_FUNCTION_9_2();
}

uint64_t sub_25DD77388()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for SELFLogger()
{
  return self;
}

uint64_t sub_25DD773E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD77444(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25DD7747C(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_25DD774A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26B37F8E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25DD7750C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_25DD89B88();
    OUTLINED_FUNCTION_55(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x2611C5060](15, a1 >> 16);
    OUTLINED_FUNCTION_55(v3);
    return v4 | 8;
  }
}

uint64_t sub_25DD77568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25DD89B98();
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
  uint64_t v6 = sub_25DD778D0(v4, v5);
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
    uint64_t v8 = (unsigned __int8 *)sub_25DD89DC8();
  }
LABEL_7:
  uint64_t v12 = sub_25DD77650(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12 | ((((unint64_t)v12 >> 32) & 1) << 32);
}

unsigned __int8 *sub_25DD77650(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25DD778D0(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_25DD7793C((uint64_t)sub_25DD77938, 0, a1, a2);
  uint64_t v6 = sub_25DD77970(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_25DD7793C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x270F9D8F0](15, v5 | (v4 << 16));
}

uint64_t sub_25DD77970(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25DD77AC8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_25DD774A4(v9, 0);
      unint64_t v12 = sub_25DD77BC8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25DD89DC8();
LABEL_4:
        JUMPOUT(0x2611C5010);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611C5010](v11 + 4, v11[2]);
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
    return MEMORY[0x2611C5010]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25DD77AC8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25DD7750C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25DD7750C(v6, v5, v4);
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
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_25DD77BC8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void *v9 = a4;
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
      unint64_t result = sub_25DD7750C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_25DD89B78();
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
          unint64_t result = sub_25DD89DC8();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_25DD7750C(v12, a6, a7);
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
    unint64_t v12 = sub_25DD89B48();
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

void sub_25DD77DCC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25DD89A68();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setPrerelease_, v4);
}

void sub_25DD77E30(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_25DD68D8C(0, a3);
  id v7 = (id)sub_25DD89BC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a5, v7);
}

uint64_t sub_25DD77EB4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

unint64_t sub_25DD77EEC()
{
  unint64_t result = qword_26A6C6228;
  if (!qword_26A6C6228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6228);
  }
  return result;
}

uint64_t sub_25DD77F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25DD77FA0()
{
  unint64_t result = qword_26A6C6230;
  if (!qword_26A6C6230)
  {
    sub_25DD89518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6230);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_6_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_25DD89958();
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_19_1(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return sub_25DD89518();
}

BOOL OUTLINED_FUNCTION_24_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_25DD894C8();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_0@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return MEMORY[0x270F9DBF0](a2 > 1, a1, 1);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_30_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_35(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_25DD89518();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_25DD89518();
}

_WORD *OUTLINED_FUNCTION_44(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

BOOL OUTLINED_FUNCTION_49(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_25DD7D6C4(v5, v4, (uint64_t *)va);
}

unint64_t OUTLINED_FUNCTION_55(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_56(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_61(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_65(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_68(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_69(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

uint64_t sub_25DD78648()
{
  type metadata accessor for AllowListAssetPathGetter();
  swift_allocObject();
  uint64_t result = sub_25DD78714();
  qword_26B37FAB0 = result;
  return result;
}

uint64_t sub_25DD78684()
{
  uint64_t v0 = sub_25DD89988();
  __swift_allocate_value_buffer(v0, qword_26B37FAF8);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_26B37FAF8) = 500;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v1();
}

uint64_t sub_25DD78714()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25DD899F8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&aBlock[-1] - v7;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0xE000000000000000;
  id v9 = objc_msgSend(self, sel_sharedHandler);
  sub_25DD89D48();
  swift_unknownObjectRelease();
  sub_25DD7A0E0();
  if (swift_dynamicCast())
  {
    unint64_t v10 = aBlock[6];
    uint64_t v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    aBlock[4] = sub_25DD7A160;
    uint64_t aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD78D24;
    aBlock[3] = &block_descriptor_1;
    uint64_t v13 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v14 = v11;
    swift_release();
    [v10 getAllowPhrasesListOverrideFileWithCompletion:v13];
    _Block_release(v13);
    sub_25DD899E8();
    if (qword_26B37F8C8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25DD89988();
    uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26B37FAF8);
    MEMORY[0x2611C4F10](v6, v16);
    unsigned __int8 v17 = *(void (**)(char *, uint64_t))(v3 + 8);
    v17(v6, v2);
    sub_25DD89C78();
    v17(v8, v2);
    if (sub_25DD89998())
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_25DD89968();
      __swift_project_value_buffer(v18, (uint64_t)qword_26B37FB10);
      char v19 = sub_25DD89958();
      os_log_type_t v20 = sub_25DD89C68();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_25DD62000, v19, v20, "Timed out waiting to get asset path with getAllowPhrasesListOverrideFile api", v21, 2u);
        MEMORY[0x2611C5A20](v21, -1, -1);

        goto LABEL_15;
      }
    }
    unint64_t v10 = v14;
    goto LABEL_15;
  }
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_25DD89968();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B37FB10);
  unint64_t v10 = sub_25DD89958();
  os_log_type_t v23 = sub_25DD89C68();
  if (os_log_type_enabled(v10, v23))
  {
    unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned __int8 v24 = 0;
    _os_log_impl(&dword_25DD62000, v10, v23, "AllowListAssetPathGetter - Error trying to fetch config from CSAttSiriMitigationAssetProvider", v24, 2u);
    MEMORY[0x2611C5A20](v24, -1, -1);
  }
LABEL_15:

  return v1;
}

void sub_25DD78B4C(uint64_t a1, unint64_t a2, uint64_t a3, NSObject *a4)
{
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25DD89968();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B37FB10);
  swift_bridgeObjectRetain_n();
  id v9 = sub_25DD89958();
  os_log_type_t v10 = sub_25DD89C58();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_25DD7D6C4(a1, a2, &v13);
    sub_25DD89CF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25DD62000, v9, v10, "Completion block of getAllowPhrasesListOverrideFile invoked and configPath is cached - %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v12, -1, -1);
    MEMORY[0x2611C5A20](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dispatch_group_leave(a4);
}

uint64_t sub_25DD78D24(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_25DD89A78();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD78D90()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AllowListAssetPathGetter()
{
  return self;
}

uint64_t sub_25DD78DEC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances) = a1;
  return swift_bridgeObjectRelease();
}

id sub_25DD78E04()
{
  uint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances] = MEMORY[0x263F8EE88];
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DD89968();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B37FB10);
  uint64_t v3 = sub_25DD89958();
  os_log_type_t v4 = sub_25DD89C58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25DD62000, v3, v4, "fetching allow list path from CSAttSiriMitigationAssetProvider", v5, 2u);
    MEMORY[0x2611C5A20](v5, -1, -1);
  }

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AllowListMatcher();
  id v6 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t v7 = qword_26B37F8D0;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_25DD78FA0();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t sub_25DD78FA0()
{
  sub_25DD89A58();
  unint64_t v0 = sub_25DD6BE70();
  uint64_t v1 = MEMORY[0x2611C5240](10, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x263F8D310], v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25DD79264(v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_25DD79364(v2);
  return sub_25DD78DEC(v3);
}

uint64_t sub_25DD79264(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_25DD7DFC0(0, v1, 0);
    uint64_t v2 = v16;
    os_log_type_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 3);
      uint64_t v6 = *(v4 - 2);
      uint64_t v7 = *(v4 - 1);
      uint64_t v8 = *v4;
      swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x2611C4FF0](v5, v6, v7, v8);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_25DD7DFC0((char *)(v12 > 1), v13 + 1, 1);
      }
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25DD79364(uint64_t a1)
{
  uint64_t v2 = sub_25DD89C38();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    os_log_type_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25DD79658(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_25DD79418()
{
  uint64_t v1 = sub_25DD89AD8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances);
  swift_bridgeObjectRetain();
  sub_25DD7949C(v1, v3, v4);
  char v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6) {
    return 1;
  }
  else {
    return 2;
  }
}

void sub_25DD7949C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25DD89F78();
    sub_25DD89B18();
    uint64_t v6 = sub_25DD89F98();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_0_1();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_25DD89F08() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_0_1();
        if (v15)
        {
          do
          {
            uint64_t v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_25DD89F08()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_0_1();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

id sub_25DD795B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AllowListMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AllowListMatcher()
{
  return self;
}

uint64_t sub_25DD79618()
{
  return sub_25DD79418();
}

uint64_t sub_25DD7963C(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_25DD79658(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25DD89F78();
  swift_bridgeObjectRetain();
  sub_25DD89B18();
  uint64_t v8 = sub_25DD89F98();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25DD89F08() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25DD89F08() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25DD79AE4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25DD79808()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6240);
  uint64_t v3 = sub_25DD89D78();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25DD89F78();
      sub_25DD89B18();
      uint64_t result = sub_25DD89F98();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      unsigned int v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *unsigned int v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25DD7963C(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *char v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25DD79AE4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25DD79808();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25DD79C80();
      goto LABEL_22;
    }
    sub_25DD79E34();
  }
  uint64_t v11 = *v4;
  sub_25DD89F78();
  sub_25DD89B18();
  uint64_t result = sub_25DD89F98();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25DD89F08(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25DD89F18();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25DD89F08();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void *sub_25DD79C80()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6240);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25DD89D68();
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25DD79E34()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6240);
  uint64_t v3 = sub_25DD89D78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25DD89F78();
    swift_bridgeObjectRetain();
    sub_25DD89B18();
    uint64_t result = sub_25DD89F98();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unsigned int v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *unsigned int v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_25DD7A0E0()
{
  unint64_t result = qword_26B37F080;
  if (!qword_26B37F080)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B37F080);
  }
  return result;
}

uint64_t sub_25DD7A120()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25DD7A160(uint64_t a1, unint64_t a2)
{
  sub_25DD78B4C(a1, a2, *(void *)(v2 + 16), *(NSObject **)(v2 + 24));
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

uint64_t sub_25DD7A194(uint64_t a1)
{
  return sub_25DD7A1AC(a1, (void (*)(unsigned char *, uint64_t))sub_25DD7A36C);
}

uint64_t sub_25DD7A1AC(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_25DD89F78();
  a2(v5, a1);
  return sub_25DD89F98();
}

uint64_t sub_25DD7A1FC()
{
  return sub_25DD7A49C();
}

uint64_t sub_25DD7A208()
{
  sub_25DD89B18();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD7A25C()
{
  sub_25DD89B18();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD7A36C(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      OUTLINED_FUNCTION_25_1();
      break;
    default:
      break;
  }
  sub_25DD89B18();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD7A438(uint64_t a1, uint64_t a2)
{
  return sub_25DD7A450(a1, a2, (void (*)(unsigned char *, uint64_t))sub_25DD7A36C);
}

uint64_t sub_25DD7A450(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_25DD89F78();
  a3(v6, a2);
  return sub_25DD89F98();
}

uint64_t sub_25DD7A49C()
{
  return sub_25DD89F98();
}

uint64_t sub_25DD7A504()
{
  return sub_25DD89F98();
}

SiriTurnTakingManager::TTInvocationType_optional __swiftcall TTInvocationType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25DD89E48();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t TTInvocationType.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x6972546563696F76;
      break;
    case 4:
      unint64_t result = 0x65636E756F6E6E61;
      break;
    case 5:
      unint64_t result = 0x726568746FLL;
      break;
    default:
      unint64_t result = 0x72506E6F74747562;
      break;
  }
  return result;
}

uint64_t sub_25DD7A67C(unsigned __int8 *a1, char *a2)
{
  return sub_25DD873C8(*a1, *a2);
}

uint64_t sub_25DD7A688()
{
  return sub_25DD7A1AC(*v0, (void (*)(unsigned char *, uint64_t))sub_25DD7A25C);
}

uint64_t sub_25DD7A6B8()
{
  return sub_25DD7A25C();
}

uint64_t sub_25DD7A6C0(uint64_t a1)
{
  return sub_25DD7A450(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_25DD7A25C);
}

SiriTurnTakingManager::TTInvocationType_optional sub_25DD7A6F0(Swift::String *a1)
{
  return TTInvocationType.init(rawValue:)(*a1);
}

unint64_t sub_25DD7A6FC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = TTInvocationType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t TTActiveRequestState.executionSource.getter()
{
  sub_25DD89918();
  OUTLINED_FUNCTION_1_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();

  return v1(v0);
}

uint64_t TTActiveRequestState.isExecutionInProgress.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_isExecutionInProgress);
}

uint64_t TTActiveRequestState.__allocating_init(executionSource:isExecutionInProgress:)(uint64_t a1, char a2)
{
  uint64_t v3 = swift_allocObject();
  sub_25DD89918();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = OUTLINED_FUNCTION_28_1();
  v5(v4);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_isExecutionInProgress) = a2;
  return v3;
}

uint64_t TTActiveRequestState.init(executionSource:isExecutionInProgress:)(uint64_t a1, char a2)
{
  sub_25DD89918();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = OUTLINED_FUNCTION_28_1();
  v5(v4);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_isExecutionInProgress) = a2;
  return v2;
}

unint64_t sub_25DD7A890()
{
  uint64_t v1 = sub_25DD89918();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8();
  uint64_t v7 = v6 - v5;
  sub_25DD89D98();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v7, v0 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_executionSource, v1);
  sub_25DD89AC8();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  return 0xD000000000000010;
}

uint64_t TTActiveRequestState.deinit()
{
  sub_25DD89918();
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = OUTLINED_FUNCTION_14_2();
  v2(v1);
  return v0;
}

uint64_t TTActiveRequestState.__deallocating_deinit()
{
  sub_25DD89918();
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = OUTLINED_FUNCTION_14_2();
  v2(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

unint64_t sub_25DD7AADC()
{
  return sub_25DD7A890();
}

uint64_t TTCandidate.tcuId.getter()
{
  return OUTLINED_FUNCTION_10_3();
}

double TTCandidate.asrScore.getter()
{
  return *(double *)(v0 + 24);
}

void *TTCandidate.intendedInfo.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

uint64_t TTCandidate.userParses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.activeTasks.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.executedTasks.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.systemDialogActs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.tcuUtterance.getter()
{
  return OUTLINED_FUNCTION_10_3();
}

uint64_t TTCandidate.isResponseToSiriPrompt.getter()
{
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t TTCandidate.nlRoutingDecision.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TTCandidate(0) + 56);

  return sub_25DD6897C(v3, a1);
}

uint64_t type metadata accessor for TTCandidate(uint64_t a1)
{
  return sub_25DD7E430(a1, (uint64_t *)&unk_26B37F960);
}

uint64_t TTCandidate.activeRequestState.getter()
{
  type metadata accessor for TTCandidate(0);

  return swift_retain();
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char v10 = *a3;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = v10;
  *(void *)(a9 + 24) = 0;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 72) = a8;
  *(void *)(a9 + 80) = a10;
  *(unsigned char *)(a9 + 88) = 0;
  uint64_t v11 = OUTLINED_FUNCTION_3_4(a7, MEMORY[0x263F8EE78]);
  return OUTLINED_FUNCTION_5_4(v11);
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:isResponseToSiriPrompt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  char v11 = *a3;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = v11;
  *(void *)(a9 + 24) = 0;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 72) = a8;
  *(void *)(a9 + 80) = a10;
  *(unsigned char *)(a9 + 88) = a11;
  uint64_t v12 = OUTLINED_FUNCTION_3_4(a7, MEMORY[0x263F8EE78]);
  return OUTLINED_FUNCTION_5_4(v12);
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:isResponseToSiriPrompt:systemDialogActs:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v8 = sub_25DD89908();
  return OUTLINED_FUNCTION_5_4(v8);
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:isResponseToSiriPrompt:systemDialogActs:nlRoutingDecision:activeRequestState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = OUTLINED_FUNCTION_2_4(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v16 = a9 + *(int *)(v15 + 56);
  uint64_t v17 = sub_25DD89908();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v16, a13, v17);
  uint64_t result = __swift_storeEnumTagSinglePayload(v16, 0, 1, v17);
  *(void *)(a9 + *(int *)(v15 + 60)) = a14;
  return result;
}

void TTCandidate.description.getter()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v0;
  sub_25DD89588();
  OUTLINED_FUNCTION_2();
  uint64_t v38 = v3;
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_8();
  uint64_t v37 = v6 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_25DD89908();
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15_3();
  uint64_t v15 = *(void **)(v2 + 32);
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_msgSend(v16, sel_description);
    sub_25DD89A78();
  }
  uint64_t v18 = type metadata accessor for TTCandidate(0);
  sub_25DD6897C(v2 + *(int *)(v18 + 56), v10);
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    sub_25DD7E194(v10, &qword_26B37FA80);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v1, v10, v11);
    sub_25DD898F8();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  }
  if (*(void *)(v2 + *(int *)(v18 + 60)))
  {
    swift_retain();
    sub_25DD7A890();
    swift_release();
  }
  v41[0] = 0;
  v41[1] = 0xE000000000000000;
  sub_25DD89D98();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  OUTLINED_FUNCTION_7_3();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_2();
  LOBYTE(v41[0]) = *(unsigned char *)(v2 + 16);
  sub_25DD89DD8();
  sub_25DD89B28();
  sub_25DD89C28();
  OUTLINED_FUNCTION_8_2();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  uint64_t v19 = *(void *)(v2 + 40);
  int64_t v20 = *(void *)(v19 + 16);
  uint64_t v21 = MEMORY[0x263F8EE78];
  if (v20)
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25DD7DFC0(0, v20, 0);
    sub_25DD89688();
    unint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16);
    uint64_t v23 = v19 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
    uint64_t v36 = *(void *)(v39 + 72);
    uint64_t v40 = v39 + 16;
    do
    {
      v22(v37, v23, v38);
      v41[3] = v38;
      v41[4] = sub_25DD7DFE0();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
      v22((uint64_t)boxed_opaque_existential_1, v37, v38);
      uint64_t v25 = sub_25DD89678();
      uint64_t v27 = v26;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      (*(void (**)(uint64_t, uint64_t))(v40 - 8))(v37, v38);
      uint64_t v21 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25DD7DFC0(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v21 = v42;
      }
      unint64_t v29 = *(void *)(v21 + 16);
      unint64_t v28 = *(void *)(v21 + 24);
      if (v29 >= v28 >> 1)
      {
        BOOL v31 = OUTLINED_FUNCTION_20_1(v28);
        sub_25DD7DFC0((char *)v31, v29 + 1, 1);
        uint64_t v21 = v42;
      }
      *(void *)(v21 + 16) = v29 + 1;
      uint64_t v30 = v21 + 16 * v29;
      *(void *)(v30 + 32) = v25;
      *(void *)(v30 + 40) = v27;
      v23 += v36;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
  }
  v41[0] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD7E094();
  sub_25DD89A38();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  uint64_t v32 = sub_25DD89538();
  uint64_t v33 = swift_bridgeObjectRetain();
  MEMORY[0x2611C50E0](v33, v32);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_2();
  uint64_t v34 = swift_bridgeObjectRetain();
  MEMORY[0x2611C50E0](v34, v32);
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
  uint64_t v35 = swift_bridgeObjectRetain();
  MEMORY[0x2611C50E0](v35, v32);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  OUTLINED_FUNCTION_9_2();
}

uint64_t TTManagerRequest.ttCandidates.getter()
{
  return OUTLINED_FUNCTION_9_3();
}

uint64_t TTManagerRequest.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_10_3();
}

uint64_t TTManagerRequest.requestId.getter()
{
  return OUTLINED_FUNCTION_10_3();
}

id TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return TTManagerRequest.init(ttCandidates:trpCandidateId:)(a1, a2, a3);
}

id TTManagerRequest.init(ttCandidates:trpCandidateId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_25DD89518();
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v13 = v12 - v11;
  *(void *)&v3[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates] = a1;
  uint64_t v14 = &v3[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId];
  *(void *)uint64_t v14 = a2;
  *((void *)v14 + 1) = a3;
  uint64_t v15 = v3;
  sub_25DD89508();
  uint64_t v16 = sub_25DD894D8();
  uint64_t v18 = v17;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  uint64_t v19 = (uint64_t *)&v15[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId];
  *uint64_t v19 = v16;
  v19[1] = v18;

  v21.receiver = v15;
  v21.super_class = (Class)type metadata accessor for TTManagerRequest();
  return objc_msgSendSuper2(&v21, sel_init);
}

id TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return TTManagerRequest.init(ttCandidates:trpCandidateId:requestId:)(a1, a2, a3, a4, a5);
}

id TTManagerRequest.init(ttCandidates:trpCandidateId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates] = a1;
  uint64_t v6 = &v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId];
  *(void *)uint64_t v6 = a2;
  *((void *)v6 + 1) = a3;
  uint64_t v7 = &v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId];
  *(void *)uint64_t v7 = a4;
  *((void *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for TTManagerRequest();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_25DD7B734()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v1 = type metadata accessor for TTCandidate(0);
  uint64_t v2 = OUTLINED_FUNCTION_6_3(v1);
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates);
  int64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25DD7DFC0(0, v9, 0);
    uint64_t v11 = v8 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v12 = *(void *)(v4 + 72);
    do
    {
      sub_25DD68868(v11, v7);
      *(void *)&long long v17 = 123;
      *((void *)&v17 + 1) = 0xE100000000000000;
      TTCandidate.description.getter();
      sub_25DD89B28();
      swift_bridgeObjectRelease();
      sub_25DD89B28();
      sub_25DD688CC(v7);
      uint64_t v10 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25DD7DFC0(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v10 = v18;
      }
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        BOOL v16 = OUTLINED_FUNCTION_20_1(v13);
        sub_25DD7DFC0((char *)v16, v14 + 1, 1);
        uint64_t v10 = v18;
      }
      *(void *)(v10 + 16) = v14 + 1;
      uint64_t v15 = v10 + 16 * v14;
      *(void *)(v15 + 32) = 123;
      *(void *)(v15 + 40) = 0xE100000000000000;
      v11 += v12;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
  sub_25DD89D98();
  swift_bridgeObjectRelease();
  *(void *)&long long v17 = 0x6469646E61435454;
  *((void *)&v17 + 1) = 0xEF5B203A73657461;
  uint64_t v18 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD7E094();
  sub_25DD89A38();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  *(void *)&long long v17 = 0;
  *((void *)&v17 + 1) = 0xE000000000000000;
  sub_25DD89D98();
  swift_bridgeObjectRelease();
  strcpy((char *)&v17, "{requestId: ");
  BYTE13(v17) = 0;
  HIWORD(v17) = -5120;
  swift_bridgeObjectRetain();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  swift_bridgeObjectRetain();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  OUTLINED_FUNCTION_9_2();
}

id TTManagerRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TTManagerRequest.init()()
{
}

id TTManagerRequest.__deallocating_deinit()
{
  return sub_25DD7D39C(type metadata accessor for TTManagerRequest);
}

uint64_t TTResult.tcuId.getter()
{
  return OUTLINED_FUNCTION_10_3();
}

uint64_t TTResult.isDropped.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

SiriTurnTakingManager::TTResult __swiftcall TTResult.init(tcuId:ttMitigationDecision:isDropped:)(Swift::String tcuId, SiriTurnTakingManager::TTMitigationDecision ttMitigationDecision, Swift::Bool isDropped)
{
  char v4 = *(unsigned char *)ttMitigationDecision;
  *(Swift::String *)uint64_t v3 = tcuId;
  *(unsigned char *)(v3 + 16) = v4;
  *(unsigned char *)(v3 + 17) = isDropped;
  result.tcuId = tcuId;
  result.ttMitigationDecision = ttMitigationDecision;
  return result;
}

SiriTurnTakingManager::TTResult __swiftcall TTResult.init(tcuId:ttMitigationDecision:)(Swift::String tcuId, SiriTurnTakingManager::TTMitigationDecision ttMitigationDecision)
{
  unsigned __int8 v3 = *(unsigned char *)ttMitigationDecision;
  *(Swift::String *)uint64_t v2 = tcuId;
  *(_WORD *)(v2 + 16) = v3;
  result.tcuId = tcuId;
  result.ttMitigationDecision = ttMitigationDecision;
  return result;
}

uint64_t TTResult.description.getter()
{
  return 0;
}

uint64_t TTManagerResponse.ttResults.getter()
{
  return OUTLINED_FUNCTION_9_3();
}

id TTManagerResponse.__allocating_init(_:)(uint64_t a1)
{
  unsigned __int8 v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id TTManagerResponse.init(_:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for TTManagerResponse();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_25DD7BD2C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  objc_super v5 = (void *)sub_25DD89A68();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_25DD7BD9C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25DD7DFC0(0, v2, 0);
    uint64_t v3 = v11;
    uint64_t v4 = v1 + 48;
    do
    {
      v10[0] = 123;
      v10[1] = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_25DD89D98();
      OUTLINED_FUNCTION_7_3();
      swift_bridgeObjectRetain();
      sub_25DD89B28();
      swift_bridgeObjectRelease();
      sub_25DD89B28();
      sub_25DD89DD8();
      sub_25DD89B28();
      sub_25DD89B28();
      swift_bridgeObjectRelease();
      sub_25DD89B28();
      swift_bridgeObjectRelease();
      uint64_t v11 = v3;
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        BOOL v8 = OUTLINED_FUNCTION_20_1(v5);
        sub_25DD7DFC0((char *)v8, v6 + 1, 1);
        uint64_t v3 = v11;
      }
      v4 += 24;
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = 123;
      *(void *)(v7 + 40) = 0xE100000000000000;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  sub_25DD89D98();
  swift_bridgeObjectRelease();
  strcpy((char *)v10, "{TTResults: [");
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD7E094();
  sub_25DD89A38();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  swift_bridgeObjectRelease();
  sub_25DD89B28();
  return v10[0];
}

void TTManagerResponse.init()()
{
}

id TTManagerResponse.__deallocating_deinit()
{
  return sub_25DD7D39C(type metadata accessor for TTManagerResponse);
}

SiriTurnTakingManager::TTMitigationDecision_optional __swiftcall TTMitigationDecision.init(rawValue:)(Swift::String rawValue)
{
  int64_t v2 = v1;
  unint64_t v3 = sub_25DD89E48();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *int64_t v2 = v5;
  return result;
}

uint64_t TTMitigationDecision.rawValue.getter()
{
  return *(void *)&aSelectedmitiga[8 * *v0];
}

uint64_t sub_25DD7C104(char *a1, char *a2)
{
  return sub_25DD8734C(*a1, *a2);
}

uint64_t sub_25DD7C110()
{
  return sub_25DD7A1FC();
}

uint64_t sub_25DD7C118()
{
  return sub_25DD7A208();
}

uint64_t sub_25DD7C120()
{
  return sub_25DD7A49C();
}

SiriTurnTakingManager::TTMitigationDecision_optional sub_25DD7C128(Swift::String *a1)
{
  return TTMitigationDecision.init(rawValue:)(*a1);
}

uint64_t sub_25DD7C134@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TTMitigationDecision.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id TTClient.init()()
{
  uint64_t v1 = type metadata accessor for NeuralCombiner();
  swift_allocObject();
  int64_t v2 = v0;
  uint64_t v3 = sub_25DD65048();
  uint64_t v4 = (uint64_t *)&v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_nc];
  v4[3] = v1;
  v4[4] = (uint64_t)&off_270ABD558;
  *uint64_t v4 = v3;
  __swift_project_boxed_opaque_existential_1(v4, v1);
  char v5 = sub_25DD652E0();
  long long v17 = &unk_270ABDC78;
  uint64_t v18 = &off_270ABDC98;
  uint64_t v6 = swift_allocObject();
  *(void *)&long long v16 = v6;
  *(unsigned char *)(v6 + 56) = v5 & 1;
  *(void *)(v6 + 64) = sub_25DD6DE60();
  uint64_t v7 = type metadata accessor for SELFLogger();
  BOOL v8 = (void *)swift_allocObject();
  uint64_t v9 = type metadata accessor for SelfEmitter();
  uint64_t v10 = swift_allocObject();
  v8[5] = v9;
  v8[6] = &off_270ABDF88;
  id v8[2] = v10;
  *(void *)(v6 + 40) = v7;
  *(void *)(v6 + 48) = &off_270ABDF28;
  *(void *)(v6 + 16) = v8;
  sub_25DD6FFD4(&v16, (uint64_t)&v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_overrideSystem]);
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = swift_allocObject();
  v11[5] = v9;
  v11[6] = &off_270ABDF88;
  v11[2] = v12;
  unint64_t v13 = &v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger];
  *((void *)v13 + 3) = v7;
  *((void *)v13 + 4) = &off_270ABDF28;
  *(void *)unint64_t v13 = v11;

  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for TTClient();
  return objc_msgSendSuper2(&v15, sel_init);
}

void sub_25DD7C320()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F038);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_15_3();
  uint64_t v6 = (void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger), *(void *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger + 24));
  sub_25DD71D50();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_25DD72780();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_25DD76A68();
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25DD89968();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B37FB10);
  id v8 = v4;
  uint64_t v9 = sub_25DD89958();
  os_log_type_t v10 = sub_25DD89C58();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = v8;
    uint64_t v40 = v2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    id v13 = objc_msgSend(v8, sel_description);
    uint64_t v14 = sub_25DD89A78();
    uint64_t v41 = v1;
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    id v8 = v11;
    sub_25DD7D6C4(v17, v16, &v43);
    sub_25DD89CF8();

    uint64_t v1 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v9, v10, "received ttRequest - %s", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    uint64_t v2 = v40;
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_overrideSystem), *(void *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_overrideSystem + 24));
  uint64_t v18 = v8;
  uint64_t v19 = OUTLINED_FUNCTION_22_2();
  sub_25DD6E0C8(v19, v20, v21, v22);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_nc), *(void *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_nc + 24));
  uint64_t v23 = OUTLINED_FUNCTION_22_2();
  uint64_t v27 = sub_25DD656F0(v23, v24, v25, v26);
  type metadata accessor for MHLogger();
  swift_initStackObject();
  if (sub_25DD6A600()) {
    sub_25DD6AB24(v27, (uint64_t)v8);
  }
  sub_25DD7C87C();
  unint64_t v29 = v28;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_25DD72C3C();
  id v30 = v18;
  id v31 = v29;
  id v32 = v30;
  id v33 = v31;
  uint64_t v34 = sub_25DD89958();
  os_log_type_t v35 = sub_25DD89C58();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v42 = v1;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 138412546;
    uint64_t v43 = (uint64_t)v33;
    id v38 = v33;
    OUTLINED_FUNCTION_16_3();
    *uint64_t v37 = v33;

    *(_WORD *)(v36 + 12) = 2112;
    uint64_t v43 = (uint64_t)v32;
    id v39 = v32;
    OUTLINED_FUNCTION_16_3();
    v37[1] = v32;

    _os_log_impl(&dword_25DD62000, v34, v35, "TTManagerResponse - %@) for TTManagerRequest: %@)", (uint8_t *)v36, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F880);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    uint64_t v1 = v42;
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  swift_release();
  sub_25DD7E194(v1, &qword_26B37F038);
  OUTLINED_FUNCTION_9_2();
}

void sub_25DD7C87C()
{
  OUTLINED_FUNCTION_10_2();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for TTCandidate(0);
  uint64_t v5 = OUTLINED_FUNCTION_6_3(v4);
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8();
  os_log_type_t v10 = (uint64_t *)(v9 - v8);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_25DD7F784(v11);
  swift_bridgeObjectRelease();
  id v13 = sub_25DD7DEDC(v12);
  swift_release();
  uint64_t v14 = sub_25DD79364((uint64_t)v13);
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_25DD7F784(v15);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_25DD7DEDC(v16);
  swift_release();
  uint64_t v53 = sub_25DD79364((uint64_t)v17);
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_25DD7F784(v18);
  swift_bridgeObjectRelease();
  int64_t v20 = sub_25DD7DEDC(v19);
  swift_release();
  uint64_t v21 = sub_25DD79364((uint64_t)v20);
  swift_bridgeObjectRetain();
  uint64_t v50 = sub_25DD7D02C(v14, v1);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25DD7F8CC(v21, v1);
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_25DD7D02C(v24, v1);
    uint64_t v23 = v25;
    swift_release();
  }
  uint64_t v26 = *(void *)(v3 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates);
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v29 = MEMORY[0x263F8EE78];
    goto LABEL_33;
  }
  uint64_t v28 = v26 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v51 = *(void *)(v7 + 72);
  swift_bridgeObjectRetain();
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v52 = v23;
  do
  {
    sub_25DD68868(v28, (uint64_t)v10);
    uint64_t v30 = *v10;
    uint64_t v31 = v10[1];
    if (*(void *)(v1 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_25DD85748(v30, v31);
      if (v33) {
        int v34 = *(unsigned __int8 *)(*(void *)(v1 + 56) + 40 * v32 + 4);
      }
      else {
        int v34 = 3;
      }
      swift_bridgeObjectRelease();
      if (!v23) {
        goto LABEL_19;
      }
    }
    else
    {
      int v34 = 3;
      if (!v23) {
        goto LABEL_19;
      }
    }
    BOOL v35 = v50 == v30 && v23 == v31;
    if (v35 || (sub_25DD89F08() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      sub_25DD7949C(v30, v31, v53);
      char v37 = v36;
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0)
      {
        char v41 = 0;
        goto LABEL_26;
      }
    }
LABEL_19:
    swift_bridgeObjectRetain();
    sub_25DD7949C(v30, v31, v53);
    char v39 = v38;
    swift_bridgeObjectRelease();
    if (v39)
    {
LABEL_22:
      char v41 = 1;
    }
    else
    {
      switch(v34)
      {
        case 2:
          swift_bridgeObjectRelease();
          break;
        case 3:
          goto LABEL_22;
        default:
          char v40 = sub_25DD89F08();
          swift_bridgeObjectRelease();
          if ((v40 & 1) == 0) {
            goto LABEL_22;
          }
          break;
      }
      char v41 = 2;
    }
LABEL_26:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25DD6C124(0, *(void *)(v29 + 16) + 1, 1, v29);
      uint64_t v29 = v45;
    }
    unint64_t v43 = *(void *)(v29 + 16);
    unint64_t v42 = *(void *)(v29 + 24);
    if (v43 >= v42 >> 1)
    {
      char v46 = OUTLINED_FUNCTION_20_1(v42);
      sub_25DD6C124(v46, v43 + 1, 1, v29);
      uint64_t v29 = v47;
    }
    *(void *)(v29 + 16) = v43 + 1;
    uint64_t v44 = v29 + 24 * v43;
    *(void *)(v44 + 32) = v30;
    *(void *)(v44 + 40) = v31;
    *(unsigned char *)(v44 + 48) = v41;
    *(unsigned char *)(v44 + 49) = 0;
    sub_25DD688CC((uint64_t)v10);
    uint64_t v23 = v52;
    v28 += v51;
    --v27;
  }
  while (v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_33:
  uint64_t v48 = (objc_class *)type metadata accessor for TTManagerResponse();
  char v49 = (char *)objc_allocWithZone(v48);
  *(void *)&v49[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = v29;
  v54.receiver = v49;
  v54.super_class = v48;
  objc_msgSendSuper2(&v54, sel_init);
  OUTLINED_FUNCTION_9_2();
}

uint64_t sub_25DD7CD2C(uint64_t a1, unsigned char *a2)
{
  char v2 = 1;
  switch(*a2)
  {
    case 1:
      break;
    default:
      char v2 = sub_25DD89F08();
      break;
  }
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_25DD7CE30(uint64_t a1, unsigned char *a2)
{
  char v2 = 1;
  switch(*a2)
  {
    case 1:
    case 2:
    case 3:
      char v2 = sub_25DD89F08();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_25DD7CF28(uint64_t a1, unsigned char *a2)
{
  char v2 = 1;
  switch(*a2)
  {
    case 2:
      break;
    default:
      char v2 = sub_25DD89F08();
      break;
  }
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_25DD7D02C(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a1 + 56;
  char v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = 1 << v4;
  uint64_t v6 = -1;
  if (1 << v4 < 64) {
    uint64_t v6 = ~(-1 << (1 << v4));
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = __clz(__rbit64(v7));
    unint64_t v10 = (v7 - 1) & v7;
    int64_t v39 = (unint64_t)(v5 + 63) >> 6;
  }
  else
  {
    unsigned int v14 = v4 & 0x3F;
    if (v14 <= 6) {
      goto LABEL_57;
    }
    int64_t v39 = (unint64_t)(v5 + 63) >> 6;
    unint64_t v35 = *(void *)(a1 + 64);
    if (v35)
    {
      uint64_t v8 = 1;
    }
    else
    {
      if (v14 < 8) {
        goto LABEL_57;
      }
      unint64_t v35 = *(void *)(a1 + 72);
      if (v35)
      {
        uint64_t v8 = 2;
      }
      else
      {
LABEL_44:
        unint64_t v35 = *(void *)(a1 + 80);
        if (v35)
        {
          uint64_t v8 = 3;
        }
        else
        {
LABEL_47:
          if (v14 < 9) {
            goto LABEL_57;
          }
          unint64_t v35 = *(void *)(a1 + 88);
          if (v35)
          {
            uint64_t v8 = 4;
          }
          else
          {
            unint64_t v35 = *(void *)(a1 + 96);
            if (!v35) {
              goto LABEL_53;
            }
            uint64_t v8 = 5;
          }
        }
      }
    }
LABEL_38:
    unint64_t v10 = (v35 - 1) & v35;
    unint64_t v9 = __clz(__rbit64(v35)) + (v8 << 6);
  }
  uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v17 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v17 >= v39) {
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v38 + 8 * v17);
    ++v8;
    if (!v18)
    {
      uint64_t v8 = v17 + 1;
      OUTLINED_FUNCTION_24_2();
      if (v19 == v20) {
        goto LABEL_34;
      }
      OUTLINED_FUNCTION_23_2();
      if (!v18)
      {
        uint64_t v8 = v21 + 2;
        OUTLINED_FUNCTION_24_2();
        if (v19 == v20) {
          goto LABEL_34;
        }
        OUTLINED_FUNCTION_23_2();
        if (!v18)
        {
          uint64_t v8 = v22 + 3;
          OUTLINED_FUNCTION_24_2();
          if (v19 == v20) {
            goto LABEL_34;
          }
          OUTLINED_FUNCTION_23_2();
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_27:
    unsigned int v14 = v18 - 1;
    unint64_t v10 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
LABEL_28:
    if (!*(void *)(a2 + 16))
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v26 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v16);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v29 = sub_25DD85748(v13, v12);
    if ((v30 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_60:
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    float v31 = *(float *)(*(void *)(a2 + 56) + 40 * v29);
    swift_bridgeObjectRelease();
    if (!*(void *)(a2 + 16)) {
      goto LABEL_43;
    }
    swift_bridgeObjectRetain();
    unint64_t v32 = sub_25DD85748(v28, v27);
    if ((v33 & 1) == 0) {
      goto LABEL_60;
    }
    float v34 = *(float *)(*(void *)(a2 + 56) + 40 * v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31 < v34)
    {
      uint64_t v12 = v27;
      uint64_t v13 = v28;
    }
  }
  int64_t v24 = v23 + 4;
  if (v24 >= v39)
  {
LABEL_34:
    swift_bridgeObjectRelease();
    swift_release();
    return v13;
  }
  unint64_t v18 = *(void *)(v38 + 8 * v24);
  if (v18)
  {
    uint64_t v8 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v8 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    OUTLINED_FUNCTION_24_2();
    if (v19 == v20) {
      goto LABEL_34;
    }
    OUTLINED_FUNCTION_23_2();
    int64_t v24 = v25 + 1;
    if (v18) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_53:
  uint64_t v36 = 13;
  while (v36 - 7 < (unint64_t)v39)
  {
    unint64_t v35 = *(void *)(a1 + 8 * v36++);
    if (v35)
    {
      uint64_t v8 = v36 - 8;
      goto LABEL_38;
    }
  }
LABEL_57:
  swift_bridgeObjectRelease();
  return 0;
}

id TTClient.__deallocating_deinit()
{
  return sub_25DD7D39C(type metadata accessor for TTClient);
}

id sub_25DD7D39C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25DD7D424()
{
  return swift_slowAlloc();
}

uint64_t sub_25DD7D42C(uint64_t result, unsigned char **a2)
{
  char v2 = *a2;
  *char v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25DD7D43C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25DD7D478(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25DD89E38();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25DD7D558(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_27_1();
    uint64_t result = sub_25DD89E38();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25DD7D624(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DD7D64C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25DD7D6C4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25DD89CF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25DD7D6C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DD7D798(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DD7F538((uint64_t)v12, *a3);
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
      sub_25DD7F538((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25DD7D798(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25DD7D8F0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25DD89D08();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25DD7D9C8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25DD89DC8();
    if (!v8)
    {
      uint64_t result = sub_25DD89E08();
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

void *sub_25DD7D8F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DD89E38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25DD7D9C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DD7DA60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25DD7DBD4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25DD7DBD4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DD7DA60(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25DD89B38();
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
  unint64_t v3 = sub_25DD774A4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25DD89DA8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25DD89E38();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25DD89E08();
  __break(1u);
  return result;
}

char *sub_25DD7DBD4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26B37F8E0);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DD7DD84(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DD7DCAC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DD7DCAC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DD89E38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25DD7DD84(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25DD89E38();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25DD7DE14(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_25DD7DE24(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25DD89CF8();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void *sub_25DD7DEDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_25DD80408((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25DD80608();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

char *sub_25DD7DFC0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25DD7F5B4(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

unint64_t sub_25DD7DFE0()
{
  unint64_t result = qword_26B37F810;
  if (!qword_26B37F810)
  {
    sub_25DD89588();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B37F810);
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

unint64_t sub_25DD7E094()
{
  unint64_t result = qword_26B37F850;
  if (!qword_26B37F850)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B37F848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B37F850);
  }
  return result;
}

uint64_t type metadata accessor for TTManagerRequest()
{
  return self;
}

uint64_t type metadata accessor for TTManagerResponse()
{
  return self;
}

uint64_t sub_25DD7E130()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t type metadata accessor for TTClient()
{
  return self;
}

uint64_t sub_25DD7E194(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = OUTLINED_FUNCTION_14_2();
  v4(v3);
  return a1;
}

unint64_t sub_25DD7E1E4()
{
  unint64_t result = qword_26A6C6280;
  if (!qword_26A6C6280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6280);
  }
  return result;
}

unint64_t sub_25DD7E234()
{
  unint64_t result = qword_26A6C6288;
  if (!qword_26A6C6288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C6288);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TTInvocationType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TTInvocationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD7E3D4);
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

void type metadata accessor for TTInvocationType()
{
}

uint64_t sub_25DD7E408()
{
  return type metadata accessor for TTActiveRequestState(0);
}

uint64_t type metadata accessor for TTActiveRequestState(uint64_t a1)
{
  return sub_25DD7E430(a1, (uint64_t *)&unk_26B37FA98);
}

uint64_t sub_25DD7E430(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD7E464()
{
  uint64_t result = sub_25DD89918();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TTActiveRequestState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTActiveRequestState);
}

uint64_t dispatch thunk of TTActiveRequestState.__allocating_init(executionSource:isExecutionInProgress:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of TTActiveRequestState.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

void *initializeBufferWithCopyOfBuffer for TTCandidate(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    BOOL v7 = (void *)a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v9 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v9;
    uint64_t v10 = a2[9];
    uint64_t v11 = a2[10];
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v12 = *(int *)(a3 + 56);
    __dst = (void *)(a1 + v12);
    unint64_t v18 = (char *)a2 + v12;
    *(void *)(a1 + 72) = v10;
    *(void *)(a1 + 80) = v11;
    uint64_t v13 = sub_25DD89908();
    swift_bridgeObjectRetain();
    id v14 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
      memcpy(__dst, v18, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(__dst, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v13);
    }
    *(void *)((char *)v4 + *(int *)(a3 + 60)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 60));
  }
  swift_retain();
  return v4;
}

uint64_t destroy for TTCandidate(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_25DD89908();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return swift_release();
}

uint64_t initializeWithCopy for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v11 = *(int *)(a3 + 56);
  __dst = (void *)(a1 + v11);
  uint64_t v16 = (const void *)(a2 + v11);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v10;
  uint64_t v12 = sub_25DD89908();
  swift_bridgeObjectRetain();
  id v13 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    memcpy(__dst, v16, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16))(__dst, v16, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v12);
  }
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  id v8 = v7;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_25DD89908();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 72) = v7;
  uint64_t v11 = sub_25DD89908();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  return a1;
}

uint64_t assignWithTake for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v7 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_25DD89908();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DD7EF00);
}

uint64_t sub_25DD7EF00(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    uint64_t v9 = a1 + *(int *)(a3 + 56);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TTCandidate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DD7EFA0);
}

uint64_t sub_25DD7EFA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
    uint64_t v8 = v5 + *(int *)(a4 + 56);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25DD7F024()
{
  sub_25DD7F0FC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25DD7F0FC()
{
  if (!qword_26B37FA88)
  {
    sub_25DD89908();
    unint64_t v0 = sub_25DD89CE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B37FA88);
    }
  }
}

uint64_t method lookup function for TTManagerRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTManagerRequest);
}

uint64_t dispatch thunk of TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:requestId:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_25DD7F198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTResult(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 18))
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

uint64_t storeEnumTagSinglePayload for TTResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for TTResult()
{
}

uint64_t method lookup function for TTManagerResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTManagerResponse);
}

uint64_t dispatch thunk of TTManagerResponse.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t getEnumTagSinglePayload for TTMitigationDecision(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TTMitigationDecision(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD7F498);
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

void type metadata accessor for TTMitigationDecision()
{
}

uint64_t method lookup function for TTClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTClient);
}

uint64_t dispatch thunk of TTClient.processTTRequest(ttRequest:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_25DD7F538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_25DD7F594(char *a1, int64_t a2, char a3)
{
  __n128 result = sub_25DD7F698(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_25DD7F5B4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DD6C600(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DD7D478((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_25DD7F698(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F898);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DD6C790(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DD7D558((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_25DD7F784(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = v1;
  v8[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    sub_25DD7963C(0, v4, (void *)((char *)v8 - ((8 * v4 + 15) & 0x3FFFFFFFFFFFFFF0)));
    uint64_t v5 = OUTLINED_FUNCTION_13_3();
    if (v1) {
      swift_willThrow();
    }
    else {
      return v5;
    }
  }
  else
  {
    unint64_t v6 = (void *)swift_slowAlloc();
    sub_25DD7963C(0, v4, v6);
    uint64_t v2 = OUTLINED_FUNCTION_13_3();
    MEMORY[0x2611C5A20](v6, -1, -1);
  }
  return v2;
}

uint64_t sub_25DD7F8CC(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    uint64_t v9 = (void *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_25DD7963C(0, v7, v9);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25DD7FAA0((uint64_t)v9, v7, a1, a2);
    swift_release();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    size_t v11 = (void *)swift_slowAlloc();
    sub_25DD7963C(0, v7, v11);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25DD7FAA0((uint64_t)v11, v7, a1, a2);
    swift_release();
    MEMORY[0x2611C5A20](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25DD7FAA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = (unint64_t *)result;
  uint64_t v26 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_17:
    if (*(void *)(a4 + 16))
    {
      int64_t v17 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v13);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25DD85748(v18, v19);
      if (v21)
      {
        char v22 = sub_25DD8734C(*(unsigned char *)(*(void *)(a4 + 56) + 40 * v20 + 4), 0);
        __n128 result = swift_bridgeObjectRelease();
        if (v22)
        {
          *(unint64_t *)((char *)v25 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          BOOL v14 = __OFADD__(v26++, 1);
          if (v14) {
            goto LABEL_31;
          }
        }
      }
      else
      {
        __n128 result = swift_bridgeObjectRelease();
      }
    }
  }
  BOOL v14 = __OFADD__(v6++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v6 >= v11) {
    goto LABEL_28;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_16:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_17;
  }
  int64_t v16 = v6 + 1;
  if (v6 + 1 >= v11) {
    goto LABEL_28;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 2;
  if (v6 + 2 >= v11) {
    goto LABEL_28;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 3;
  if (v6 + 3 >= v11)
  {
LABEL_28:
    swift_retain();
    uint64_t v23 = sub_25DD7FCA8(v25, a2, v26, a3);
    swift_bridgeObjectRelease();
    return v23;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
LABEL_15:
    int64_t v6 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_28;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25DD7FCA8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6240);
  uint64_t result = sub_25DD89D88();
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
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
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
    int64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25DD89F78();
    swift_bridgeObjectRetain();
    sub_25DD89B18();
    uint64_t result = sub_25DD89F98();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
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
      goto LABEL_35;
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

uint64_t sub_25DD7FF38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, char *))
{
  uint64_t v20 = (unint64_t *)result;
  int64_t v7 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v11 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v12 = v11 | (v7 << 6);
LABEL_17:
    uint64_t v16 = *(void *)(a3 + 56) + 16 * v12;
    uint64_t v17 = *(void *)(v16 + 8);
    v23[0] = *(unsigned char *)v16;
    uint64_t v24 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v18 = a4(v25, v23);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      return result;
    }
    if (v18)
    {
      *(unint64_t *)((char *)v20 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = __OFADD__(v21++, 1);
      if (v13) {
        goto LABEL_30;
      }
    }
  }
  BOOL v13 = __OFADD__(v7++, 1);
  if (v13)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v26) {
    return sub_25DD80150(v20, a2, v21, a3);
  }
  unint64_t v14 = *(void *)(v22 + 8 * v7);
  if (v14)
  {
LABEL_16:
    unint64_t v10 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_17;
  }
  int64_t v15 = v7 + 1;
  if (v7 + 1 >= v26) {
    return sub_25DD80150(v20, a2, v21, a3);
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 2;
  if (v7 + 2 >= v26) {
    return sub_25DD80150(v20, a2, v21, a3);
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 3;
  if (v7 + 3 >= v26) {
    return sub_25DD80150(v20, a2, v21, a3);
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14)
  {
LABEL_15:
    int64_t v7 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v26) {
      return sub_25DD80150(v20, a2, v21, a3);
    }
    unint64_t v14 = *(void *)(v22 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25DD80150(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C6290);
  uint64_t result = sub_25DD89E28();
  uint64_t v9 = result;
  char v37 = a1;
  uint64_t v38 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v39 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v38) {
        return v9;
      }
      unint64_t v16 = v37[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v38) {
          return v9;
        }
        unint64_t v16 = v37[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v38) {
            return v9;
          }
          unint64_t v16 = v37[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v38) {
              return v9;
            }
            unint64_t v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v38) {
                  return v9;
                }
                unint64_t v16 = v37[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v39 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = v4;
    uint64_t v20 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(v4 + 56) + 16 * v14;
    char v24 = *(unsigned char *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    sub_25DD89F78();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25DD89B18();
    uint64_t result = sub_25DD89F98();
    uint64_t v26 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) == 0) {
      break;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    float v34 = (void *)(*(void *)(v9 + 48) + 16 * v29);
    *float v34 = v22;
    v34[1] = v21;
    uint64_t v35 = *(void *)(v9 + 56) + 16 * v29;
    *(unsigned char *)uint64_t v35 = v24;
    *(void *)(v35 + 8) = v25;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_39;
    }
    uint64_t v4 = v19;
    uint64_t v11 = v39;
    if (!v5) {
      return v9;
    }
  }
  char v30 = 0;
  unint64_t v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    BOOL v32 = v28 == v31;
    if (v28 == v31) {
      unint64_t v28 = 0;
    }
    v30 |= v32;
    uint64_t v33 = *(void *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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

uint64_t sub_25DD80408(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    return v10;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_25DD80608()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(v9 + 32);
  char v12 = *(unsigned char *)(v9 + 24);
  uint64_t v13 = *(void *)(v9 + 16);
  char v14 = *a3;
  *(void *)uint64_t v8 = a1;
  *(void *)(v8 + 8) = a2;
  *(unsigned char *)(v8 + 16) = v14;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = a4;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 72) = a8;
  *(void *)(v8 + 80) = v13;
  *(unsigned char *)(v8 + 88) = v12;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = v11;
  return type metadata accessor for TTCandidate(0);
}

uint64_t OUTLINED_FUNCTION_3_4@<X0>(uint64_t a1@<X6>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  type metadata accessor for TTCandidate(0);
  return sub_25DD89908();
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1)
{
  uint64_t result = __swift_storeEnumTagSinglePayload(v3, 1, 1, a1);
  *(void *)(v1 + *(int *)(v2 + 60)) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_25DD89B28();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_25DD89B28();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_25DD89B28();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_25DD7FF38(v3, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_25DD89B28();
}

void OUTLINED_FUNCTION_19_2(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

BOOL OUTLINED_FUNCTION_20_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return v0;
}

uint64_t sub_25DD80864(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA80);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v69 = (uint64_t)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v70 = (uint64_t)&v65 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v71 = (uint64_t)&v65 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FA90);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  char v14 = (char *)&v65 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v65 - v15;
  uint64_t v17 = type metadata accessor for TTCandidate(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_25DD89968();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B37FB10);
  uint64_t v23 = sub_25DD89958();
  os_log_type_t v24 = sub_25DD89C58();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_25DD62000, v23, v24, "Running ConcurrentActiveRequestMatcher override", v25, 2u);
    OUTLINED_FUNCTION_0();
  }

  uint64_t v72 = a1;
  sub_25DD68868(a1, (uint64_t)v20);
  uint64_t v68 = v22;
  uint64_t v26 = sub_25DD89958();
  os_log_type_t v27 = sub_25DD89C58();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v66 = v14;
    uint64_t v28 = swift_slowAlloc();
    unint64_t v67 = v11;
    unint64_t v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)unint64_t v29 = 136315138;
    uint64_t v74 = v30;
    uint64_t v73 = *(void *)&v20[*(int *)(v17 + 60)];
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37FAA8);
    uint64_t v31 = sub_25DD89AC8();
    uint64_t v73 = sub_25DD7D6C4(v31, v32, &v74);
    char v14 = v66;
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    sub_25DD688CC((uint64_t)v20);
    _os_log_impl(&dword_25DD62000, v26, v27, "Active Request State = %s", v29, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    uint64_t v11 = v67;
    OUTLINED_FUNCTION_0();
  }
  else
  {
    sub_25DD688CC((uint64_t)v20);
  }

  uint64_t v33 = v72;
  uint64_t v34 = *(void *)(v72 + *(int *)(v17 + 60));
  switch(*(unsigned char *)(v72 + 16))
  {
    case 1:
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_13;
      }
      return 2;
    default:
      char v35 = sub_25DD89F08();
      swift_bridgeObjectRelease();
      uint64_t v36 = 2;
      if ((v35 & 1) == 0 || !v34) {
        return v36;
      }
LABEL_13:
      if (*(unsigned char *)(v34 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_isExecutionInProgress) != 1) {
        return 2;
      }
      uint64_t v37 = v34 + OBJC_IVAR____TtC21SiriTurnTakingManager20TTActiveRequestState_executionSource;
      uint64_t v38 = sub_25DD89918();
      uint64_t v39 = *(void *)(v38 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v16, v37, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v38);
      uint64_t v40 = v71;
      sub_25DD8128C(v33 + *(int *)(v17 + 56), v71, &qword_26B37FA80);
      sub_25DD8128C((uint64_t)v16, (uint64_t)v14, &qword_26B37FA90);
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v38) == 1)
      {
        sub_25DD812E8(v40, &qword_26B37FA80);
        sub_25DD812E8((uint64_t)v16, &qword_26B37FA90);
LABEL_22:
        uint64_t v36 = 2;
        goto LABEL_23;
      }
      sub_25DD8128C((uint64_t)v14, (uint64_t)v11, &qword_26B37FA90);
      if ((*(unsigned int (**)(char *, uint64_t))(v39 + 88))(v11, v38) != *MEMORY[0x263F70C00])
      {
        sub_25DD812E8(v40, &qword_26B37FA80);
        sub_25DD812E8((uint64_t)v16, &qword_26B37FA90);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v38);
        goto LABEL_22;
      }
      uint64_t v41 = (uint64_t)v16;
      (*(void (**)(char *, uint64_t))(v39 + 96))(v11, v38);
      uint64_t v42 = v70;
      sub_25DD8128C(v40, v70, &qword_26B37FA80);
      uint64_t v43 = sub_25DD89908();
      if (__swift_getEnumTagSinglePayload(v42, 1, v43) == 1)
      {
        sub_25DD812E8(v40, &qword_26B37FA80);
        sub_25DD812E8(v41, &qword_26B37FA90);
LABEL_20:
        sub_25DD812E8(v70, &qword_26B37FA80);
        sub_25DD89928();
        OUTLINED_FUNCTION_1_2();
        uint64_t v44 = OUTLINED_FUNCTION_1_3();
        v45(v44);
        goto LABEL_22;
      }
      uint64_t v47 = v69;
      sub_25DD8128C(v70, v69, &qword_26B37FA80);
      int v48 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 88))(v47, v43);
      if (v48 == *MEMORY[0x263F70890])
      {
        char v49 = sub_25DD89958();
        os_log_type_t v50 = sub_25DD89C58();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)swift_slowAlloc() = 0;
          OUTLINED_FUNCTION_27(&dword_25DD62000, v51, v52, "Candidate request arrived while active request is processing; recommending .mitigate");
          OUTLINED_FUNCTION_0();
        }

        sub_25DD812E8(v71, &qword_26B37FA80);
        sub_25DD812E8(v41, &qword_26B37FA90);
        uint64_t v53 = OUTLINED_FUNCTION_3_5();
        v54(v53);
        sub_25DD812E8(v70, &qword_26B37FA80);
        sub_25DD89928();
        OUTLINED_FUNCTION_1_2();
        uint64_t v55 = OUTLINED_FUNCTION_1_3();
        v56(v55);
        uint64_t v36 = 0;
      }
      else
      {
        if (v48 != *MEMORY[0x263F70888])
        {
          sub_25DD812E8(v40, &qword_26B37FA80);
          sub_25DD812E8(v41, &qword_26B37FA90);
          uint64_t v63 = OUTLINED_FUNCTION_3_5();
          v64(v63);
          goto LABEL_20;
        }
        id v57 = sub_25DD89958();
        os_log_type_t v58 = sub_25DD89C58();
        if (os_log_type_enabled(v57, v58))
        {
          *(_WORD *)swift_slowAlloc() = 0;
          OUTLINED_FUNCTION_27(&dword_25DD62000, v59, v60, "Candidate request routed to siriX while active request is processing; Use model decision for mitigation");
          OUTLINED_FUNCTION_0();
        }

        sub_25DD812E8(v71, &qword_26B37FA80);
        sub_25DD812E8(v41, &qword_26B37FA90);
        sub_25DD812E8(v70, &qword_26B37FA80);
        sub_25DD89928();
        OUTLINED_FUNCTION_1_2();
        uint64_t v61 = OUTLINED_FUNCTION_1_3();
        v62(v61);
        uint64_t v36 = 3;
      }
LABEL_23:
      sub_25DD812E8((uint64_t)v14, &qword_26B37FA90);
      return v36;
  }
}

id sub_25DD811B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConcurrentActiveRequestMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25DD8120C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConcurrentActiveRequestMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConcurrentActiveRequestMatcher()
{
  return self;
}

uint64_t sub_25DD81264(uint64_t a1)
{
  return sub_25DD80864(a1);
}

uint64_t sub_25DD8128C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DD812E8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

uint64_t sub_25DD81364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25DD85748(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25DD813A8()
{
  return 4;
}

uint64_t sub_25DD813B0(char *a1)
{
  os_log_t v3 = v1;
  uint64_t v142 = sub_25DD89588();
  OUTLINED_FUNCTION_2();
  uint64_t v146 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_25();
  uint64_t v141 = v7;
  uint64_t v145 = sub_25DD89538();
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_29_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v12);
  BOOL v137 = &v128[-v13];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F040);
  uint64_t v15 = OUTLINED_FUNCTION_19_0(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_10();
  uint64_t v147 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v128[-v21];
  uint64_t v23 = sub_25DD89638();
  OUTLINED_FUNCTION_2();
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_37_0();
  uint64_t v151 = a1;
  int v27 = 1;
  switch(a1[16])
  {
    case 4:
      break;
    default:
      int v27 = sub_25DD89F08();
      break;
  }
  LODWORD(v148) = v27;
  uint64_t v135 = v2;
  uint64_t v140 = v9;
  swift_bridgeObjectRelease();
  uint64_t v28 = *((void *)v151 + 8);
  uint64_t v29 = *(void *)(v28 + 16);
  os_log_t v150 = v1;
  if (v29)
  {
    id v149 = v22;
    unint64_t v32 = *(void (**)(NSObject *, uint64_t, uint64_t))(v25 + 16);
    uint64_t v30 = v25 + 16;
    uint64_t v31 = v32;
    uint64_t v33 = v28 + ((*(unsigned __int8 *)(v30 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 64));
    uint64_t v34 = *(void *)(v30 + 56);
    uint64_t v143 = v28;
    swift_bridgeObjectRetain();
    uint64_t v35 = v29 - 1;
    do
    {
      uint64_t v36 = v35;
      v31(v1, v33, v23);
      char v37 = sub_25DD89628();
      (*(void (**)(NSObject *, uint64_t))(v30 - 8))(v1, v23);
      if (v37) {
        break;
      }
      uint64_t v35 = v36 - 1;
      v33 += v34;
    }
    while (v36);
    swift_bridgeObjectRelease();
    uint64_t v22 = v149;
    os_log_t v3 = v150;
  }
  else
  {
    char v37 = 0;
  }
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_25DD89968();
  uint64_t v39 = __swift_project_value_buffer(v38, (uint64_t)qword_26B37FB10);
  uint64_t v40 = sub_25DD89958();
  os_log_type_t v41 = sub_25DD89C58();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl(&dword_25DD62000, v40, v41, "Running Announce Override rule...", v42, 2u);
    OUTLINED_FUNCTION_0();
  }

  sub_25DD84058(*((void *)v151 + 6), *((void *)v151 + 7), (uint64_t)v22);
  if (sub_25DD84534((uint64_t)v22))
  {
    uint64_t v43 = (void *)sub_25DD89958();
    os_log_type_t v44 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_49(v44))
    {
      uint64_t v45 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_13(v45);
      OUTLINED_FUNCTION_20_2(&dword_25DD62000, v46, v47, "Announce task is intercom - overriding mitigator decision to donot mitigate");
      OUTLINED_FUNCTION_0();
    }

LABEL_17:
    sub_25DD858D4((uint64_t)v22, &qword_26B37F040);
    return 1;
  }
  if ((v148 & 1) == 0)
  {
    uint64_t v55 = (void *)sub_25DD89958();
    os_log_type_t v56 = sub_25DD89C58();
    if (!OUTLINED_FUNCTION_49(v56)) {
      goto LABEL_27;
    }
    id v57 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_13(v57);
    uint64_t v60 = "source is not announce followup returning noMatch";
    goto LABEL_26;
  }
  if (!*(void *)(*((void *)v151 + 5) + 16))
  {
    uint64_t v55 = (void *)sub_25DD89958();
    os_log_type_t v61 = sub_25DD89C68();
    if (!OUTLINED_FUNCTION_49(v61)) {
      goto LABEL_27;
    }
    id v62 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_13(v62);
    uint64_t v60 = "there are no nl parses, this is not expected";
LABEL_26:
    OUTLINED_FUNCTION_20_2(&dword_25DD62000, v58, v59, v60);
    OUTLINED_FUNCTION_0();
LABEL_27:

LABEL_28:
    sub_25DD858D4((uint64_t)v22, &qword_26B37F040);
    return 2;
  }
  uint64_t v49 = v139;
  sub_25DD8128C((uint64_t)v22, v139, &qword_26B37F040);
  uint64_t v50 = OUTLINED_FUNCTION_67_0();
  uint64_t v51 = v145;
  p_vtable = (void **)(&OBJC_METACLASS____TtC21SiriTurnTakingManager16TTManagerRequest + 24);
  if (__swift_getEnumTagSinglePayload(v50, v52, v145) == 1)
  {
    sub_25DD858D4(v49, &qword_26B37F040);
    uint64_t v54 = (uint64_t)v138;
  }
  else
  {
    uint64_t v63 = v140;
    uint64_t v64 = v49;
    uint64_t v65 = v137;
    uint64_t v148 = *(void *)(v140 + 32);
    ((void (*)(unsigned char *, uint64_t, uint64_t))v148)(v137, v64, v51);
    sub_25DD8241C();
    if (v153)
    {
      sub_25DD6FFD4(&v152, (uint64_t)v155);
      sub_25DD6FF38((uint64_t)v155, (uint64_t)&v152);
      unint64_t v66 = sub_25DD89958();
      os_log_type_t v67 = sub_25DD89C58();
      if (OUTLINED_FUNCTION_49(v67))
      {
        LODWORD(v143) = v39;
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        uint64_t v139 = swift_slowAlloc();
        uint64_t v156 = v139;
        v134 = v68;
        *(_DWORD *)uint64_t v68 = 136315138;
        uint64_t v133 = (void (**)(uint64_t, uint64_t))(v68 + 4);
        uint64_t v70 = v153;
        uint64_t v69 = v154;
        __swift_project_boxed_opaque_existential_1(&v152, v153);
        uint64_t v71 = *(uint64_t (**)(uint64_t, uint64_t))(v69 + 8);
        uint64_t v72 = v69;
        os_log_t v3 = v150;
        uint64_t v73 = v71(v70, v72);
        uint64_t v157 = sub_25DD7D6C4(v73, v74, &v156);
        uint64_t v51 = v145;
        sub_25DD89CF8();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
        _os_log_impl(&dword_25DD62000, v66, (os_log_type_t)v143, "identified announce type as %s - updating the cache so followup can also use this as announce task if needed", v134, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
      uint64_t v54 = (uint64_t)v138;
      uint64_t v75 = (uint64_t)v136;
      os_log_type_t v76 = v147;
      ((void (*)(uint8_t *, unsigned char *, uint64_t))v148)(v147, v137, v51);
      OUTLINED_FUNCTION_52_0();
      sub_25DD86820((uint64_t)v76, v75, &qword_26B37F040);
      p_vtable = &OBJC_METACLASS____TtC21SiriTurnTakingManager16TTManagerRequest.vtable;
      uint64_t v77 = (uint64_t)v3 + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache;
      swift_beginAccess();
      sub_25DD8687C(v75, v77);
      swift_endAccess();
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v63 + 8))(v65, v51);
      sub_25DD858D4((uint64_t)&v152, &qword_26A6C6298);
      uint64_t v54 = (uint64_t)v138;
      p_vtable = (void **)(&OBJC_METACLASS____TtC21SiriTurnTakingManager16TTManagerRequest + 24);
    }
  }
  uint64_t v78 = (uint64_t)p_vtable[343] + (void)v3;
  swift_beginAccess();
  sub_25DD8128C(v78, v54, &qword_26B37F040);
  uint64_t v79 = OUTLINED_FUNCTION_67_0();
  if (__swift_getEnumTagSinglePayload(v79, v80, v51) == 1)
  {
    sub_25DD858D4(v54, &qword_26B37F040);
    uint64_t v81 = (void *)sub_25DD89958();
    os_log_type_t v82 = sub_25DD89C68();
    if (OUTLINED_FUNCTION_49(v82))
    {
      os_log_type_t v83 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_13(v83);
      OUTLINED_FUNCTION_20_2(&dword_25DD62000, v84, v85, "Using Cache - There is no activeTasks or executedTasks in SessionState for triggerless followup. Rejecting.");
      OUTLINED_FUNCTION_0();
    }

    goto LABEL_40;
  }
  uint64_t v87 = v140;
  uint64_t v88 = v144;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v140 + 32))(v144, v54, v51);
  sub_25DD8241C();
  if (v153)
  {
    sub_25DD6FFD4(&v152, (uint64_t)v155);
    uint64_t v89 = (uint8_t *)*((void *)v151 + 5);
    uint64_t v143 = *((void *)v89 + 2);
    if (v143)
    {
      uint64_t v139 = v39;
      uint64_t v138 = &v89[(v146[80] + 32) & ~(unint64_t)v146[80]];
      BOOL v137 = v146 + 16;
      v136 = (void (**)(uint8_t *, uint64_t, uint64_t))(v140 + 16);
      uint64_t v132 = &v158;
      uint64_t v133 = (void (**)(uint64_t, uint64_t))(v146 + 8);
      swift_bridgeObjectRetain();
      int v90 = 0;
      unint64_t v91 = 0;
      LODWORD(v135) = v37 & 1;
      *(void *)&long long v92 = 136315138;
      long long v131 = v92;
      uint64_t v130 = MEMORY[0x263F8EE58] + 8;
      uint64_t v151 = "tigate";
      uint64_t v93 = v144;
      uint64_t v94 = v142;
      uint64_t v95 = v141;
      id v149 = v22;
      v134 = v89;
LABEL_46:
      int v129 = v90;
      unint64_t v96 = v91;
      while (2)
      {
        sub_25DD88FFC(v96, 1, (uint64_t)v89);
        if (__OFADD__(v96, 1))
        {
          __break(1u);
          JUMPOUT(0x25DD823E4);
        }
        uint64_t v148 = v96 + 1;
        (*((void (**)(uint64_t, uint8_t *, uint64_t))v146 + 2))(v95, &v138[*((void *)v146 + 9) * v96], v94);
        uint64_t v97 = v147;
        (*v136)(v147, v93, v51);
        uint64_t v98 = OUTLINED_FUNCTION_52_0();
        char v99 = sub_25DD82FC0(v98, v95, v155, v135);
        sub_25DD858D4((uint64_t)v97, &qword_26B37F040);
        uint64_t v100 = sub_25DD89958();
        os_log_type_t v101 = sub_25DD89C58();
        if (os_log_type_enabled(v100, v101))
        {
          os_log_type_t v102 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v152 = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v102 = v131;
          LOBYTE(v157) = v99;
          uint64_t v103 = sub_25DD89AC8();
          uint64_t v157 = sub_25DD7D6C4(v103, v104, (uint64_t *)&v152);
          uint64_t v22 = v149;
          sub_25DD89CF8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25DD62000, v100, v101, "With announce followup evaluation result from Announce rule is %s", v102, 0xCu);
          swift_arrayDestroy();
          uint64_t v95 = v141;
          uint64_t v94 = v142;
          uint64_t v93 = v144;
          OUTLINED_FUNCTION_0();
          uint64_t v51 = v145;
          OUTLINED_FUNCTION_0();
        }

        switch(v99)
        {
          case 1:
            OUTLINED_FUNCTION_43();
            swift_bridgeObjectRelease();
            goto LABEL_69;
          case 2:
            OUTLINED_FUNCTION_64_0();
            goto LABEL_53;
          case 3:
            goto LABEL_53;
          default:
            OUTLINED_FUNCTION_16_1();
LABEL_53:
            OUTLINED_FUNCTION_12_3();
            char v105 = sub_25DD89F08();
            swift_bridgeObjectRelease();
            if ((v105 & 1) == 0)
            {
              switch(v99)
              {
                case 0:
                  OUTLINED_FUNCTION_16_1();
                  goto LABEL_56;
                case 1:
                case 3:
LABEL_56:
                  char v106 = sub_25DD89F08();
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_18_0();
                  v107();
                  if (v106) {
                    goto LABEL_60;
                  }
                  ++v96;
                  uint64_t v89 = v134;
                  if (v148 != v143) {
                    continue;
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v123 = OUTLINED_FUNCTION_3_6();
                  v124(v123);
                  sub_25DD858D4((uint64_t)v22, &qword_26B37F040);
                  if ((v129 & 1) == 0) {
                    return 0;
                  }
                  return 2;
                case 2:
                  swift_bridgeObjectRelease();
                  (*v133)(v95, v94);
LABEL_60:
                  int v90 = 1;
                  unint64_t v91 = v148;
                  uint64_t v89 = v134;
                  if (v148 != v143) {
                    goto LABEL_46;
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v108 = OUTLINED_FUNCTION_3_6();
                  v109(v108);
                  goto LABEL_28;
                default:
                  JUMPOUT(0);
              }
            }
LABEL_69:
            OUTLINED_FUNCTION_18_0();
            v125();
            swift_bridgeObjectRelease();
            uint64_t v126 = OUTLINED_FUNCTION_3_6();
            v127(v126);
            break;
        }
        goto LABEL_17;
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
    OUTLINED_FUNCTION_18_0();
    v121();
    goto LABEL_40;
  }
  sub_25DD858D4((uint64_t)&v152, &qword_26A6C6298);
  BOOL v110 = *(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16);
  uint64_t v111 = v135;
  v110(v135, v88, v51);
  int64_t v112 = sub_25DD89958();
  os_log_type_t v113 = sub_25DD89C68();
  LODWORD(v151) = v113;
  if (!os_log_type_enabled(v112, v113))
  {

    uint64_t v122 = *(void (**)(void))(v87 + 8);
    OUTLINED_FUNCTION_45_0();
    v122();
    OUTLINED_FUNCTION_45_0();
    v122();
LABEL_40:
    uint64_t v86 = (uint64_t)v22;
    goto LABEL_41;
  }
  os_log_t v150 = v112;
  long long v114 = (uint8_t *)swift_slowAlloc();
  uint64_t v148 = swift_slowAlloc();
  *(void *)&long long v152 = v148;
  *(_DWORD *)long long v114 = 136315138;
  id v149 = v22;
  uint64_t v146 = v114 + 4;
  uint64_t v147 = v114;
  sub_25DD89688();
  v155[3] = v51;
  v155[4] = sub_25DD867D0();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v155);
  v110((uint64_t)boxed_opaque_existential_1, v111, v51);
  uint64_t v116 = sub_25DD89678();
  unint64_t v118 = v117;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
  v155[0] = sub_25DD7D6C4(v116, v118, (uint64_t *)&v152);
  sub_25DD89CF8();
  swift_bridgeObjectRelease();
  uint64_t v119 = *(void (**)(void))(v87 + 8);
  OUTLINED_FUNCTION_45_0();
  v119();
  os_log_t v120 = v150;
  _os_log_impl(&dword_25DD62000, v150, (os_log_type_t)v151, "Unable to identify announce type of task: %s.", v147, 0xCu);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0();

  OUTLINED_FUNCTION_45_0();
  v119();
  uint64_t v86 = (uint64_t)v149;
LABEL_41:
  sub_25DD858D4(v86, &qword_26B37F040);
  return 0;
}

void sub_25DD8241C()
{
  sub_25DD89538();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_52();
  MEMORY[0x270FA5388](v1);
  sub_25DD89558();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_8();
  sub_25DD89528();
  uint64_t v3 = sub_25DD896A8();
  uint64_t v4 = OUTLINED_FUNCTION_39_0();
  v5(v4);
  unint64_t v6 = MEMORY[0x2611C4BE0](v3);
  uint64_t v7 = v6;
  if (!(v6 >> 62))
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_25DD89968();
    __swift_project_value_buffer(v30, (uint64_t)qword_26B37FB10);
    swift_retain_n();
    uint64_t v31 = sub_25DD89958();
    os_log_type_t v32 = sub_25DD89C68();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_5_3();
      *(void *)&long long v39 = OUTLINED_FUNCTION_15();
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v34 = sub_25DD89878();
      uint64_t v36 = OUTLINED_FUNCTION_41_0(v34, v35);
      OUTLINED_FUNCTION_57_0(v36);
      sub_25DD89CF8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD62000, v31, v32, "Unable to convert UsoGraphSiriNL to UsoTask for graph %s.", v33, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      swift_release();

      goto LABEL_9;
    }

LABEL_44:
    swift_release_n();
    goto LABEL_9;
  }
  if (!sub_25DD89E18()) {
    goto LABEL_39;
  }
LABEL_3:
  sub_25DD8901C(0, (v7 & 0xC000000000000001) == 0, v7);
  if ((v7 & 0xC000000000000001) != 0) {
    MEMORY[0x2611C52C0](0, v7);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25DD89968();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B37FB10);
  swift_retain_n();
  uint64_t v9 = sub_25DD89958();
  os_log_type_t v10 = sub_25DD89C58();
  uint64_t v11 = &loc_25DD8A000;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = swift_slowAlloc();
    *(void *)&long long v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v13 = sub_25DD89898();
    OUTLINED_FUNCTION_41_0(v13, v14);
    sub_25DD89CF8();
    OUTLINED_FUNCTION_48_0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v15 = sub_25DD89888();
    *(void *)&v38[0] = OUTLINED_FUNCTION_41_0(v15, v16);
    uint64_t v11 = (void *)&loc_25DD8A000;
    sub_25DD89CF8();
    OUTLINED_FUNCTION_48_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v9, v10, "Found UsoTask %s::%s.", (uint8_t *)v12, 0x16u);
    uint64_t v17 = (uint64_t *)MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_release_n();
    uint64_t v17 = (uint64_t *)MEMORY[0x263F8EE58];
  }
  swift_retain();
  sub_25DD896E8();
  swift_release();
  if (!*((void *)&v40 + 1))
  {
    sub_25DD858D4((uint64_t)&v39, &qword_26B37F8B0);
    swift_retain_n();
    uint64_t v18 = sub_25DD89958();
    os_log_type_t v19 = sub_25DD89C68();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      *(void *)&long long v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = v11[212];
      uint64_t v21 = sub_25DD89898();
      OUTLINED_FUNCTION_41_0(v21, v22);
      sub_25DD89CF8();
      OUTLINED_FUNCTION_48_0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v23 = sub_25DD89888();
      *(void *)&v38[0] = OUTLINED_FUNCTION_41_0(v23, v24);
      sub_25DD89CF8();
      OUTLINED_FUNCTION_48_0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD62000, v18, v19, "Unable to run codegen converter on UsoTask %s::%s.", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      swift_release();
      swift_release();

LABEL_9:
      OUTLINED_FUNCTION_44_0();
      return;
    }

    swift_release();
    goto LABEL_44;
  }
  sub_25DD858A4(&v39, v38);
  sub_25DD7F538((uint64_t)v38, (uint64_t)v37);
  sub_25DD89708();
  if (OUTLINED_FUNCTION_1_4())
  {
    swift_release();
    sub_25DD847D4((uint64_t)&v39);
    OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE468);
LABEL_26:
    uint64_t v28 = swift_allocObject();
    uint64_t *v17 = v28;
    swift_release();
    swift_release();
    long long v29 = v40;
    *(_OWORD *)(v28 + 16) = v39;
    *(_OWORD *)(v28 + 32) = v29;
    *(void *)(v28 + 48) = v41;
    goto LABEL_27;
  }
  sub_25DD89838();
  if (OUTLINED_FUNCTION_1_4())
  {
    swift_release();
    sub_25DD84938((uint64_t)&v39);
    OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE500);
    goto LABEL_26;
  }
  sub_25DD897C8();
  if (OUTLINED_FUNCTION_70_0())
  {
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
    uint64_t v25 = MEMORY[0x263F8EE78];
    uint64_t v26 = sub_25DD89A28();
    OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE598);
    uint64_t v27 = swift_allocObject();
    uint64_t *v17 = v27;
    swift_release();
    swift_release();
    *(void *)(v27 + 16) = 0xD00000000000001BLL;
    *(void *)(v27 + 24) = 0x800000025DD8C4D0;
    *(_DWORD *)(v27 + 32) = 16843009;
    *(unsigned char *)(v27 + 36) = 1;
  }
  else
  {
    sub_25DD89868();
    if (OUTLINED_FUNCTION_1_4()
      || (sub_25DD89778(), OUTLINED_FUNCTION_1_4())
      || (sub_25DD89788(), OUTLINED_FUNCTION_1_4()))
    {
      swift_release();
      sub_25DD84AAC(&v39);
      OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE630);
      goto LABEL_26;
    }
    sub_25DD89848();
    if (OUTLINED_FUNCTION_1_4())
    {
      swift_release();
      sub_25DD84BF4((uint64_t *)&v39);
      OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE6C8);
      goto LABEL_26;
    }
    sub_25DD897A8();
    if (!OUTLINED_FUNCTION_70_0())
    {
      sub_25DD897D8();
      if (OUTLINED_FUNCTION_1_4()
        || (sub_25DD897F8(), OUTLINED_FUNCTION_1_4())
        || (sub_25DD897B8(), OUTLINED_FUNCTION_1_4())
        || (sub_25DD897E8(), OUTLINED_FUNCTION_1_4()))
      {
        swift_release();
        sub_25DD84D30(&v39);
        OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE890);
      }
      else
      {
        sub_25DD89758();
        if (!swift_dynamicCast())
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
          swift_release();
          swift_release();
          OUTLINED_FUNCTION_44_0();
          goto LABEL_28;
        }
        swift_release();
        sub_25DD84E4C((uint64_t)&v39);
        OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE7F8);
      }
      goto LABEL_26;
    }
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
    uint64_t v25 = MEMORY[0x263F8EE78];
    uint64_t v26 = sub_25DD89A28();
    OUTLINED_FUNCTION_15_4((uint64_t)&unk_270ABE760);
    uint64_t v27 = swift_allocObject();
    uint64_t *v17 = v27;
    swift_release();
    swift_release();
    *(void *)(v27 + 16) = 0xD000000000000010;
    *(void *)(v27 + 24) = 0x800000025DD8C4B0;
    *(_DWORD *)(v27 + 32) = 16842752;
    *(unsigned char *)(v27 + 36) = 0;
  }
  *(void *)(v27 + 40) = v25;
  *(void *)(v27 + 48) = v26;
LABEL_27:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
LABEL_28:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
}

uint64_t sub_25DD82FC0(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  LODWORD(v92) = a4;
  OUTLINED_FUNCTION_8_3();
  uint64_t v90 = v6;
  uint64_t v94 = sub_25DD89968();
  OUTLINED_FUNCTION_2();
  uint64_t v89 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_25();
  uint64_t v91 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F818);
  uint64_t v11 = OUTLINED_FUNCTION_19_0(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_25DD895F8();
  OUTLINED_FUNCTION_2();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_29_1();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v87 - v20;
  uint64_t v22 = a3[3];
  uint64_t v23 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v22);
  unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 48);
  uint64_t v25 = v23;
  uint64_t v26 = v15;
  int v27 = v24(v22, v25);
  if (v27) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = sub_25DD89568();
  sub_25DD877B8(v29, v14);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v14, 1, v26) != 1)
  {
    int v88 = v27;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v21, v14, v26);
    char v34 = sub_25DD895E8();
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 16))(v4, v21, v26);
    sub_25DD6FF38((uint64_t)a3, (uint64_t)v97);
    unint64_t v35 = v21;
    uint64_t v93 = v26;
    if (v34)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v97);
      uint64_t v36 = *(void (**)(void))(v17 + 8);
      OUTLINED_FUNCTION_40_0();
      v36();
      uint64_t v37 = v94;
LABEL_17:
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v46 = (void *)OUTLINED_FUNCTION_13_2(v37, (uint64_t)qword_26B37FB10);
      os_log_type_t v47 = sub_25DD89C58();
      if (OUTLINED_FUNCTION_24_1(v47))
      {
        int v48 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_63_0(v48);
        OUTLINED_FUNCTION_23_3(&dword_25DD62000, v49, v50, "Accepting WantedToRepeat / UserCancelled dialog act.");
        OUTLINED_FUNCTION_0();
      }

      ((void (*)(char *, uint64_t))v36)(v35, v93);
      return 1;
    }
    char v38 = sub_25DD895C8();
    sub_25DD6FF38((uint64_t)v97, (uint64_t)v98);
    if (v38)
    {
      uint64_t v17 = v100;
      OUTLINED_FUNCTION_68_0(v98);
      uint64_t v39 = OUTLINED_FUNCTION_61_0();
      unint64_t v35 = v21;
      char v41 = v40(v39);
    }
    else
    {
      char v41 = 0;
    }
    uint64_t v37 = v94;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v97);
    uint64_t v43 = *(void (**)(void))(v17 + 8);
    uint64_t v42 = v17 + 8;
    os_log_type_t v44 = v43;
    OUTLINED_FUNCTION_40_0();
    v45();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
    if (v41)
    {
      uint64_t v36 = v44;
      goto LABEL_17;
    }
    char v52 = sub_25DD895B8();
    sub_25DD6FF38((uint64_t)a3, (uint64_t)v96);
    if (v52)
    {
      char v53 = sub_25DD83964(v96);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v96);
      if (v53)
      {
        if (qword_26B37F070 != -1) {
          swift_once();
        }
        uint64_t v54 = (void *)OUTLINED_FUNCTION_13_2(v37, (uint64_t)qword_26B37FB10);
        os_log_type_t v55 = sub_25DD89C58();
        if (!OUTLINED_FUNCTION_24_1(v55)) {
          goto LABEL_38;
        }
        os_log_type_t v56 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_63_0(v56);
        uint64_t v59 = "Accepting User Rejected dialog act.";
LABEL_37:
        OUTLINED_FUNCTION_23_3(&dword_25DD62000, v57, v58, v59);
        OUTLINED_FUNCTION_0();
LABEL_38:

        OUTLINED_FUNCTION_34_0();
        OUTLINED_FUNCTION_40_0();
        v44();
        return 1;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v96);
    }
    char v60 = sub_25DD895A8();
    sub_25DD6FF38((uint64_t)a3, (uint64_t)v95);
    if (v60)
    {
      char v61 = sub_25DD83A90(v95);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
      if (v61)
      {
        if (qword_26B37F070 != -1) {
          swift_once();
        }
        uint64_t v54 = (void *)OUTLINED_FUNCTION_13_2(v37, (uint64_t)qword_26B37FB10);
        os_log_type_t v62 = sub_25DD89C58();
        if (!OUTLINED_FUNCTION_24_1(v62)) {
          goto LABEL_38;
        }
        uint64_t v63 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_63_0(v63);
        uint64_t v59 = "Accepting Accepted dialog act.";
        goto LABEL_37;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
    }
    uint64_t v64 = sub_25DD83BBC();
    if (v64)
    {
      uint64_t v65 = v64;
      OUTLINED_FUNCTION_68_0(a3);
      uint64_t v66 = OUTLINED_FUNCTION_61_0();
      if (v67(v66))
      {
        sub_25DD83E20(v98);
        char v68 = sub_25DD85924((uint64_t)v98);
        sub_25DD866F4((uint64_t)v98);
        switch(v68)
        {
          case 1:
            OUTLINED_FUNCTION_43();
            swift_bridgeObjectRelease();
            goto LABEL_58;
          case 2:
            OUTLINED_FUNCTION_64_0();
            break;
          case 3:
            break;
          default:
            OUTLINED_FUNCTION_16_1();
            break;
        }
        OUTLINED_FUNCTION_12_3();
        char v83 = sub_25DD89F08();
        swift_bridgeObjectRelease();
        if (v83)
        {
LABEL_58:
          OUTLINED_FUNCTION_40_0();
          v44();
          swift_release();
          return 1;
        }
      }
      uint64_t v84 = a3[3];
      uint64_t v85 = a3[4];
      uint64_t v86 = __swift_project_boxed_opaque_existential_1(a3, v84);
      uint64_t v28 = sub_25DD85FB8((uint64_t)v86, v65, v90, v84, v85);
      swift_release();
    }
    else
    {
      if (qword_26B37F070 != -1) {
        swift_once();
      }
      uint64_t v69 = __swift_project_value_buffer(v37, (uint64_t)qword_26B37FB10);
      uint64_t v70 = v89;
      uint64_t v71 = v91;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v91, v69, v37);
      sub_25DD6FF38((uint64_t)a3, (uint64_t)v98);
      uint64_t v72 = sub_25DD89958();
      os_log_type_t v73 = sub_25DD89C58();
      int v74 = v73;
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v75 = swift_slowAlloc();
        uint64_t v92 = swift_slowAlloc();
        v97[0] = v92;
        *(_DWORD *)uint64_t v75 = 136315394;
        v87[1] = v75 + 4;
        uint64_t v94 = v42;
        LODWORD(v90) = v74;
        uint64_t v77 = v99;
        uint64_t v76 = v100;
        __swift_project_boxed_opaque_existential_1(v98, v99);
        uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 8))(v77, v76);
        v96[0] = sub_25DD7D6C4(v78, v79, v97);
        sub_25DD89CF8();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
        *(_WORD *)(v75 + 12) = 2080;
        if (v88) {
          uint64_t v80 = 0x65764F746F6E6F64;
        }
        else {
          uint64_t v80 = 0x657461676974696DLL;
        }
        if (v88) {
          unint64_t v81 = 0xED00006564697272;
        }
        else {
          unint64_t v81 = 0xE800000000000000;
        }
        v96[0] = sub_25DD7D6C4(v80, v81, v97);
        sub_25DD89CF8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25DD62000, v72, (os_log_type_t)v90, "This might be a info domains request for which we donot support DONOT mitigate overrides - announceType - %s, returning %s", (uint8_t *)v75, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();

        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v91, v37);
        uint64_t v82 = OUTLINED_FUNCTION_34_0();
        ((void (*)(uint64_t))v44)(v82);
        return v28;
      }

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v37);
      OUTLINED_FUNCTION_34_0();
    }
    OUTLINED_FUNCTION_40_0();
    v44();
    return v28;
  }
  sub_25DD858D4(v14, &qword_26B37F818);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v30 = OUTLINED_FUNCTION_13_2(v94, (uint64_t)qword_26B37FB10);
  os_log_type_t v31 = sub_25DD89C68();
  if (os_log_type_enabled(v30, v31))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_27(&dword_25DD62000, v32, v33, "Unable to retrieve UserDialogAct from parse.");
    OUTLINED_FUNCTION_0();
  }

  return 0;
}

uint64_t sub_25DD83964(void *a1)
{
  if ((_UNKNOWN *)OUTLINED_FUNCTION_33(a1) == &unk_270ABE468)
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25DD89968();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_13_2(v6, (uint64_t)qword_26B37FB10);
    os_log_type_t v8 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_24_1(v8))
    {
      uint64_t v9 = (float *)swift_slowAlloc();
      OUTLINED_FUNCTION_16_4(v9, 1.5047e-36);
      OUTLINED_FUNCTION_58_0(&dword_25DD62000, v10, v11, "Got UserRejected for Announce Messages when expectingConfirmation: %{BOOL}d");
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_68_0(v2);
    uint64_t v12 = OUTLINED_FUNCTION_62_0();
    return v13(v12) & v1 & 1;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    uint64_t v3 = OUTLINED_FUNCTION_60_0();
    return v4(v3) & 1;
  }
}

uint64_t sub_25DD83A90(void *a1)
{
  if ((_UNKNOWN *)OUTLINED_FUNCTION_33(a1) == &unk_270ABE468)
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25DD89968();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_13_2(v6, (uint64_t)qword_26B37FB10);
    os_log_type_t v8 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_24_1(v8))
    {
      uint64_t v9 = (float *)swift_slowAlloc();
      OUTLINED_FUNCTION_16_4(v9, 1.5047e-36);
      OUTLINED_FUNCTION_58_0(&dword_25DD62000, v10, v11, "Got UserAccepted for Announce Messages when expectingConfirmation: %{BOOL}d");
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_68_0(v2);
    uint64_t v12 = OUTLINED_FUNCTION_62_0();
    return v13(v12) & v1 & 1;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    uint64_t v3 = OUTLINED_FUNCTION_60_0();
    return v4(v3) & 1;
  }
}

uint64_t sub_25DD83BBC()
{
  unint64_t v0 = sub_25DD89698();
  uint64_t v1 = v0;
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25DD89E18();
    swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v2) {
      goto LABEL_5;
    }
  }
  sub_25DD8901C(0, (v1 & 0xC000000000000001) == 0, v1);
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = MEMORY[0x2611C52C0](0, v1);
  }
  else
  {
    uint64_t v2 = *(void *)(v1 + 32);
    swift_retain();
  }
LABEL_5:
  swift_bridgeObjectRelease();
  return v2;
}

void sub_25DD83E20(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25DD8AD90;
  *(void *)(v2 + 32) = 0x746165706572;
  *(void *)(v2 + 40) = 0xE600000000000000;
  *(void *)(v2 + 48) = 1684104562;
  *(void *)(v2 + 56) = 0xE400000000000000;
  *(void *)(v2 + 64) = 1886352499;
  *(void *)(v2 + 72) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DD8B500;
  OUTLINED_FUNCTION_10_4();
  *(void *)(v5 + 32) = v4 & 0xFFFFFFFFFFFFLL | 0x415F000000000000;
  *(void *)(v5 + 40) = 0xEA00000000007070;
  uint64_t v6 = OUTLINED_FUNCTION_19_3();
  *(_OWORD *)(v6 + 16) = xmmword_25DD8B510;
  *(void *)(v6 + 32) = 1852141679;
  *(void *)(v6 + 40) = 0xE400000000000000;
  OUTLINED_FUNCTION_46_0();
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 64) = 0xEC00000079746974;
  uint64_t v9 = (__n128 *)OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_13_4(v9, v10, v11, v12, v13, v14, v15, v16, v17);
  *(void *)(v18 + 32) = 1852141679;
  *(void *)(v18 + 40) = 0xE400000000000000;
  OUTLINED_FUNCTION_49_0();
  *(void *)(inited + 72) = v19;
  *(void *)(inited + 80) = v20;
  *(void *)(inited + 88) = 0xEE00656761737365;
  uint64_t v21 = OUTLINED_FUNCTION_9_4();
  *(_OWORD *)(v21 + 16) = xmmword_25DD8A910;
  *(void *)(v21 + 32) = 1684956531;
  *(void *)(v21 + 40) = 0xE400000000000000;
  *(void *)(v21 + 48) = 0x796C706572;
  *(void *)(v21 + 56) = 0xE500000000000000;
  OUTLINED_FUNCTION_10_4();
  *(void *)(inited + 96) = v23;
  *(void *)(inited + 104) = v22 & 0xFFFFFFFFFFFFLL | 0x535F000000000000;
  *(void *)(inited + 112) = 0xEE00676E69747465;
  unint64_t v24 = (__n128 *)OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_13_4(v24, v25, v26, v27, v28, v29, v30, v31, v32);
  void v33[4] = 0x656C62616E65;
  v33[5] = 0xE600000000000000;
  v33[6] = 0x656C6261736964;
  v33[7] = 0xE700000000000000;
  *(void *)(inited + 120) = v33;
  *(void *)(inited + 128) = 0xD000000000000013;
  OUTLINED_FUNCTION_26_1();
  *(void *)(inited + 136) = v34;
  unint64_t v35 = (__n128 *)OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_13_4(v35, v36, v37, v38, v39, v40, v41, v42, v43);
  v44[4] = 0x796C706572;
  v44[5] = 0xE500000000000000;
  v44[6] = 1684956531;
  v44[7] = 0xE400000000000000;
  *(void *)(inited + 144) = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD89A28();
  *a1 = 0x6C61626F6C47;
  a1[1] = 0xE600000000000000;
  OUTLINED_FUNCTION_66_0(2.3694e-38);
  a1[3] = v2;
  a1[4] = v45;
}

uint64_t sub_25DD84058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v66 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F040);
  uint64_t v6 = OUTLINED_FUNCTION_19_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_52();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v62[-v11];
  uint64_t v13 = sub_25DD89538();
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_52();
  uint64_t v19 = (unsigned char *)(v17 - v18);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = &v62[-v22];
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_10();
  uint64_t v65 = v24;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = &v62[-v27];
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = &v62[-v29];
  sub_25DD877A0(a1, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) != 1)
  {
    unint64_t v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 32);
    v35(v30, v12, v13);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_25DD89968();
    __swift_project_value_buffer(v36, (uint64_t)qword_26B37FB10);
    uint64_t v37 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 16);
    v37(v28, v30, v13);
    sub_25DD89958();
    os_log_type_t v38 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_69_0(v38))
    {
      uint64_t v39 = (void *)OUTLINED_FUNCTION_5_3();
      uint64_t v63 = OUTLINED_FUNCTION_15();
      uint64_t v67 = v63;
      uint64_t v40 = OUTLINED_FUNCTION_14_3(4.8149e-34);
      v37((unsigned char *)v40, v28, v13);
      uint64_t v41 = sub_25DD89AC8();
      uint64_t v43 = sub_25DD7D6C4(v41, v42, &v67);
      OUTLINED_FUNCTION_21_2(v43);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_4();
      v44();
      OUTLINED_FUNCTION_27_2(&dword_25DD62000, v45, v46, "Found announceTask in SessionState's activeTasks: %s");
      OUTLINED_FUNCTION_65_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      OUTLINED_FUNCTION_18_4();
      v59();
    }
    uint64_t v34 = v66;
    v35((unsigned char *)v66, v30, v13);
    goto LABEL_16;
  }
  sub_25DD858D4((uint64_t)v12, &qword_26B37F040);
  sub_25DD877A0(a2, v9);
  uint64_t v31 = OUTLINED_FUNCTION_67_0();
  if (__swift_getEnumTagSinglePayload(v31, v32, v13) != 1)
  {
    os_log_type_t v47 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 32);
    v47(v23, v9, v13);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_25DD89968();
    __swift_project_value_buffer(v48, (uint64_t)qword_26B37FB10);
    uint64_t v49 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v15 + 16);
    v49((uint64_t)v19, v23, v13);
    sub_25DD89958();
    os_log_type_t v50 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_69_0(v50))
    {
      uint64_t v51 = (void *)OUTLINED_FUNCTION_5_3();
      uint64_t v63 = OUTLINED_FUNCTION_15();
      uint64_t v67 = v63;
      uint64_t v52 = OUTLINED_FUNCTION_14_3(4.8149e-34);
      v49(v52, v19, v13);
      uint64_t v53 = sub_25DD89AC8();
      uint64_t v55 = sub_25DD7D6C4(v53, v54, &v67);
      OUTLINED_FUNCTION_21_2(v55);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_4();
      v56();
      OUTLINED_FUNCTION_27_2(&dword_25DD62000, v57, v58, "Found announceTask in SessionState's executedTasks: %s");
      OUTLINED_FUNCTION_65_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      OUTLINED_FUNCTION_18_4();
      v60();
    }
    uint64_t v34 = v66;
    v47((unsigned char *)v66, (uint64_t)v23, v13);
LABEL_16:
    uint64_t v33 = 0;
    return __swift_storeEnumTagSinglePayload(v34, v33, 1, v13);
  }
  sub_25DD858D4(v9, &qword_26B37F040);
  uint64_t v33 = 1;
  uint64_t v34 = v66;
  return __swift_storeEnumTagSinglePayload(v34, v33, 1, v13);
}

BOOL sub_25DD84534(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F040);
  uint64_t v4 = OUTLINED_FUNCTION_19_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_37_0();
  uint64_t v5 = sub_25DD89538();
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8();
  uint64_t v11 = v10 - v9;
  sub_25DD8128C(a1, v1, &qword_26B37F040);
  uint64_t v12 = OUTLINED_FUNCTION_67_0();
  if (__swift_getEnumTagSinglePayload(v12, v13, v5) == 1)
  {
    sub_25DD858D4(v1, &qword_26B37F040);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25DD89968();
    uint64_t v15 = OUTLINED_FUNCTION_13_2(v14, (uint64_t)qword_26B37FB10);
    os_log_type_t v16 = sub_25DD89C58();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_27(&dword_25DD62000, v17, v18, "Parse does not contain an announce intercom task.");
      OUTLINED_FUNCTION_0();
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v11, v1, v5);
    sub_25DD8241C();
    if (v32)
    {
      uint64_t v19 = OUTLINED_FUNCTION_53();
      v20(v19);
      sub_25DD6FFD4(&v31, (uint64_t)v33);
      __swift_project_boxed_opaque_existential_1(v33, v33[3]);
      DynamicType = (void *)swift_getDynamicType();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      return DynamicType == &unk_270ABE890;
    }
    sub_25DD858D4((uint64_t)&v31, &qword_26A6C6298);
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25DD89968();
    uint64_t v24 = (void *)OUTLINED_FUNCTION_13_2(v23, (uint64_t)qword_26B37FB10);
    os_log_type_t v25 = sub_25DD89C58();
    if (OUTLINED_FUNCTION_24_1(v25))
    {
      uint64_t v26 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_63_0(v26);
      OUTLINED_FUNCTION_23_3(&dword_25DD62000, v27, v28, "Parse does not contain an announce intercom task.");
      OUTLINED_FUNCTION_0();
    }

    uint64_t v29 = OUTLINED_FUNCTION_53();
    v30(v29);
  }
  return 0;
}

uint64_t sub_25DD847D4@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DD8AD90;
  OUTLINED_FUNCTION_10_4();
  *(void *)(v4 + 32) = v3 & 0xFFFFFFFFFFFFLL | 0x455F000000000000;
  *(void *)(v4 + 40) = 0xEC0000006C69616DLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25DD8B510;
  *(void *)(v5 + 32) = 1684956531;
  *(void *)(v5 + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 0xD000000000000014;
  OUTLINED_FUNCTION_26_1();
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 72) = &unk_270ABD410;
  OUTLINED_FUNCTION_49_0();
  *(void *)(inited + 80) = v7;
  *(void *)(inited + 88) = 0xEE00656761737365;
  uint64_t v8 = (__n128 *)OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_13_4(v8, v9, v10, v11, v12, v13, v14, v15, v16);
  *(void *)(v17 + 32) = 0x736972616D6D7573;
  *(void *)(v17 + 40) = 0xE900000000000065;
  *(void *)(inited + 96) = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  uint64_t result = sub_25DD89A28();
  *(void *)a1 = 0xD000000000000010;
  *(void *)(a1 + 8) = 0x800000025DD8C510;
  *(unsigned char *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 17) = 16843009;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 32) = result;
  return result;
}

double sub_25DD84938@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DD8A910;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000025DD8C590;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25DD8AD90;
  *(void *)(v3 + 32) = 0x726577736E61;
  *(void *)(v3 + 40) = 0xE600000000000000;
  *(void *)(v3 + 48) = 0x7075676E6168;
  *(void *)(v3 + 56) = 0xE600000000000000;
  *(void *)(v3 + 64) = 0x74736575716572;
  *(void *)(v3 + 72) = 0xE700000000000000;
  OUTLINED_FUNCTION_46_0();
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = 0xEC00000079746974;
  *(_OWORD *)(OUTLINED_FUNCTION_19_3() + 16) = xmmword_25DD8B510;
  OUTLINED_FUNCTION_55_0();
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  *(void *)(inited + 72) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  uint64_t v9 = sub_25DD89A28();
  strcpy((char *)a1, "AnnounceCalls");
  *(_WORD *)(a1 + 14) = -4864;
  *(void *)&double result = 257;
  *(_DWORD *)(a1 + 16) = 257;
  *(unsigned char *)(a1 + 20) = 1;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 32) = v9;
  return result;
}

void sub_25DD84AAC(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v4 = OUTLINED_FUNCTION_47_0(inited, (__n128)xmmword_25DD8A910);
  v4[2].n128_u64[0] = v1 | 3;
  v4[2].n128_u64[1] = 0x800000025DD8C570;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v5 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_13_4(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v14[4] = 0x657A6F6F6E73;
  v14[5] = 0xE600000000000000;
  v14[6] = 0x657461647075;
  v14[7] = 0xE600000000000000;
  OUTLINED_FUNCTION_10_4();
  inited[3].n128_u64[0] = v16;
  inited[3].n128_u64[1] = v15 & 0xFFFFFFFFFFFFLL | 0x525F000000000000;
  inited[4].n128_u64[0] = 0xEF7265646E696D65;
  uint64_t v17 = (__n128 *)OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_13_4(v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v26[4] = 0x657A6F6F6E73;
  v26[5] = 0xE600000000000000;
  v26[6] = 0x657461647075;
  v26[7] = 0xE600000000000000;
  inited[4].n128_u64[1] = (unint64_t)v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD89A28();
  *a1 = v1;
  a1[1] = 0x800000025DD8C5B0;
  OUTLINED_FUNCTION_66_0(2.3694e-38);
  a1[3] = MEMORY[0x263F8EE78];
  a1[4] = v27;
}

void sub_25DD84BF4(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_47_0(inited, (__n128)xmmword_25DD8A910);
  OUTLINED_FUNCTION_26_1();
  *(void *)(v4 + 32) = v1;
  *(void *)(v4 + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v6 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_13_4(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  v15[4] = 2036427888;
  v15[5] = 0xE400000000000000;
  v15[6] = 1819042147;
  v15[7] = 0xE400000000000000;
  inited[3].n128_u64[0] = (unint64_t)v15;
  inited[3].n128_u64[1] = v1;
  OUTLINED_FUNCTION_26_1();
  inited[4].n128_u64[0] = v16;
  uint64_t v17 = (__n128 *)OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_13_4(v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v26[4] = 1819042147;
  v26[5] = 0xE400000000000000;
  v26[6] = 0x6B6361626C6C6163;
  v26[7] = 0xE800000000000000;
  inited[4].n128_u64[1] = (unint64_t)v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD89A28();
  *a1 = v1 | 1;
  a1[1] = 0x800000025DD8C5D0;
  OUTLINED_FUNCTION_66_0(2.3694e-38);
  a1[3] = MEMORY[0x263F8EE78];
  a1[4] = v27;
}

void sub_25DD84D30(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DD8B510;
  OUTLINED_FUNCTION_26_1();
  *(void *)(v3 + 32) = 0xD000000000000013;
  *(void *)(v3 + 40) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25DD8B520;
  *(void *)(v5 + 32) = 2036427888;
  *(void *)(v5 + 40) = 0xE400000000000000;
  *(void *)(v5 + 48) = 1684956531;
  *(void *)(v5 + 56) = 0xE400000000000000;
  *(void *)(v5 + 64) = 1886352499;
  *(void *)(v5 + 72) = 0xE400000000000000;
  OUTLINED_FUNCTION_55_0();
  *(void *)(v6 + 80) = v7;
  *(void *)(v6 + 88) = v8;
  *(void *)(inited + 48) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD89A28();
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x800000025DD8C5F0;
  OUTLINED_FUNCTION_66_0(2.3694e-38);
  a1[3] = MEMORY[0x263F8EE78];
  a1[4] = v9;
}

void sub_25DD84E4C(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DD8B510;
  OUTLINED_FUNCTION_10_4();
  *(void *)(v4 + 32) = v3 & 0xFFFFFFFFFFFFLL | 0x575F000000000000;
  *(void *)(v4 + 40) = 0xEE0074756F6B726FLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F8A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25DD8AD90;
  *(void *)(v5 + 32) = 0x657461657263;
  *(void *)(v5 + 40) = 0xE600000000000000;
  *(void *)(v5 + 48) = 1886352499;
  *(void *)(v5 + 56) = 0xE400000000000000;
  *(void *)(v5 + 64) = 0x6573756170;
  *(void *)(v5 + 72) = 0xE500000000000000;
  *(void *)(inited + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
  sub_25DD89A28();
  OUTLINED_FUNCTION_26_1();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 17) = 16843009;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 32) = v8;
}

uint64_t sub_25DD84F6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25DD89F08();
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
    if (v12 || (sub_25DD89F08() & 1) != 0) {
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

uint64_t sub_25DD85034()
{
  sub_25DD858D4(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache, &qword_26B37F040);
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_25DD85080()
{
  return type metadata accessor for AnnounceMatcher();
}

uint64_t type metadata accessor for AnnounceMatcher()
{
  uint64_t result = qword_26B37F048;
  if (!qword_26B37F048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25DD850D0()
{
  sub_25DD85160();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25DD85160()
{
  if (!qword_26B37F808)
  {
    sub_25DD89538();
    unint64_t v0 = sub_25DD89CE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B37F808);
    }
  }
}

uint64_t sub_25DD851B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25DD851CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25DD851E0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25DD851F4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25DD85208(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25DD8521C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_25DD85230(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_25DD85244(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_25DD85258(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_25DD8526C(char *a1)
{
  return sub_25DD813B0(a1);
}

unint64_t sub_25DD85290(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C6261736964;
      break;
    case 2:
      unint64_t result = 0x6B6361626C6C6163;
      break;
    case 3:
      unint64_t result = 1819042147;
      break;
    case 4:
      unint64_t result = 0x726577736E61;
      break;
    case 5:
      unint64_t result = 0x7075676E6168;
      break;
    case 6:
      unint64_t result = 1684956531;
      break;
    case 7:
      unint64_t result = 0x796C706572;
      break;
    case 8:
      unint64_t result = 2036427888;
      break;
    case 9:
      unint64_t result = 0x74736575716572;
      break;
    case 10:
      return result;
    case 11:
      unint64_t result = 0x657A6F6F6E73;
      break;
    case 12:
      unint64_t result = 0x736972616D6D7573;
      break;
    case 13:
      uint64_t v3 = 1633972341;
      goto LABEL_20;
    case 14:
      unint64_t result = 1886352499;
      break;
    case 15:
      unint64_t result = 1684104562;
      break;
    case 16:
      unint64_t result = 0x746165706572;
      break;
    case 17:
      unint64_t result = 1852141679;
      break;
    case 18:
      uint64_t v3 = 1634038371;
LABEL_20:
      unint64_t result = v3 & 0xFFFF0000FFFFFFFFLL | 0x657400000000;
      break;
    case 19:
      unint64_t result = 0x6573756170;
      break;
    default:
      unint64_t result = 0x656C62616E65;
      break;
  }
  return result;
}

unint64_t sub_25DD85494(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
    case 8:
      return result;
    case 2:
      unint64_t result = 0x455F6E6F6D6D6F63;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x415F6E6F6D6D6F63;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0x525F6E6F6D6D6F63;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x535F6E6F6D6D6F63;
      break;
    case 10:
      unint64_t result = 0x6E456F4E5F6F7375;
      break;
    case 11:
      unint64_t result = 0x575F6E6F6D6D6F63;
      break;
    default:
      unint64_t result = 0x4D5F6E6F6D6D6F63;
      break;
  }
  return result;
}

uint64_t sub_25DD85634()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25DD85664()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_25DD8566C()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_25DD85674()
{
  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t sub_25DD8567C()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t sub_25DD85684()
{
  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t sub_25DD8568C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25DD85694()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25DD8569C()
{
  return sub_25DD89CF8();
}

uint64_t sub_25DD856C4(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_25DD856F0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DD85718@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_25DD85748(uint64_t a1, uint64_t a2)
{
  sub_25DD89F78();
  sub_25DD89B18();
  uint64_t v4 = sub_25DD89F98();

  return sub_25DD857C0(a1, a2, v4);
}

unint64_t sub_25DD857C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25DD89F08() & 1) == 0)
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
      while (!v14 && (sub_25DD89F08() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_25DD858A4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25DD858D4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_18_0();
  v3();
  return a1;
}

uint64_t sub_25DD85924(uint64_t a1)
{
  v45[3] = &unk_270ABE3D0;
  v45[4] = &off_270ABE8C0;
  uint64_t v2 = swift_allocObject();
  v45[0] = v2;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = *(void *)(a1 + 32);
  sub_25DD86788(a1);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25DD89968();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B37FB10);
  sub_25DD6FF38((uint64_t)v45, (uint64_t)v44);
  sub_25DD6FF38((uint64_t)v45, (uint64_t)v42);
  sub_25DD6FF38((uint64_t)v45, (uint64_t)v40);
  swift_retain_n();
  uint64_t v5 = sub_25DD89958();
  os_log_type_t v6 = sub_25DD89C58();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v39 = v38;
    *(_DWORD *)uint64_t v7 = 136316162;
    os_log_type_t type = v6;
    uint64_t v8 = sub_25DD89898();
    sub_25DD7D6C4(v8, v9, &v39);
    sub_25DD89CF8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v10 = sub_25DD89888();
    sub_25DD7D6C4(v10, v11, &v39);
    sub_25DD89CF8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2080;
    uint64_t v12 = __swift_project_boxed_opaque_existential_1(v44, v44[3]);
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    swift_bridgeObjectRetain();
    sub_25DD7D6C4(v13, v14, &v39);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    *(_WORD *)(v7 + 32) = 2080;
    __swift_project_boxed_opaque_existential_1(v42, v43);
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x2611C50E0](v15, MEMORY[0x263F8D310]);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    sub_25DD7D6C4(v16, v18, &v39);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    *(_WORD *)(v7 + 42) = 2080;
    __swift_project_boxed_opaque_existential_1(v40, v41);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
    uint64_t v19 = sub_25DD89A18();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    sub_25DD7D6C4(v19, v21, &v39);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    _os_log_impl(&dword_25DD62000, v5, type, "Validating task: %s::%s\nwith AnnounceType: %s\nwith allowed verb set: %s\nand allowed entityToVerb map: %s", (uint8_t *)v7, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v38, -1, -1);
    MEMORY[0x2611C5A20](v7, -1, -1);
  }
  else
  {
    swift_release_n();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  }

  uint64_t v22 = *(void **)(v2 + 40);
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25DD89888();
  char v25 = sub_25DD84F6C(v23, v24, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    uint64_t v26 = 1;
    goto LABEL_34;
  }
  if (*(unsigned char *)(v2 + 35)) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = *(void *)(v2 + 48);
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_25DD89898();
  uint64_t v30 = (void *)sub_25DD81364(v28, v29, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30)
  {
    sub_25DD896E8();
    sub_25DD8128C((uint64_t)v44, (uint64_t)v42, &qword_26B37F8B0);
    if (v43)
    {
      sub_25DD89748();
      if (swift_dynamicCast())
      {
        uint64_t v31 = v40[0];
        goto LABEL_17;
      }
    }
    else
    {
      sub_25DD858D4((uint64_t)v42, &qword_26B37F8B0);
    }
    uint64_t v31 = 0;
LABEL_17:
    sub_25DD8128C((uint64_t)v44, (uint64_t)v42, &qword_26B37F8B0);
    if (v31)
    {
      swift_release();
      sub_25DD858D4((uint64_t)v42, &qword_26B37F8B0);
      goto LABEL_19;
    }
    sub_25DD86820((uint64_t)v42, (uint64_t)v40, &qword_26B37F8B0);
    if (v41)
    {
      sub_25DD89768();
      if (swift_dynamicCast())
      {
        swift_release();
LABEL_19:
        sub_25DD896E8();
        if (v41)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A8);
          if (swift_dynamicCast())
          {
            swift_retain();
            sub_25DD89818();
            swift_release();
            if (!v40[0])
            {
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_29;
            }
            uint64_t v32 = sub_25DD896C8();
            swift_release();
            swift_release();
            if (v32)
            {
              swift_bridgeObjectRelease();
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_25DD858D4((uint64_t)v40, &qword_26B37F8B0);
        }
        swift_bridgeObjectRelease();
LABEL_29:
        sub_25DD858D4((uint64_t)v44, &qword_26B37F8B0);
        uint64_t v26 = 2;
        goto LABEL_34;
      }
    }
    else
    {
      sub_25DD858D4((uint64_t)v40, &qword_26B37F8B0);
    }
LABEL_31:
    uint64_t v33 = sub_25DD89888();
    char v35 = sub_25DD84F6C(v33, v34, v30);
    swift_bridgeObjectRelease();
    sub_25DD858D4((uint64_t)v44, &qword_26B37F8B0);
    swift_bridgeObjectRelease();
    if (v35) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v26;
    }
  }
LABEL_34:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v26;
}

uint64_t sub_25DD85FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v49[3] = a4;
  v49[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25DD89968();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B37FB10);
  sub_25DD6FF38((uint64_t)v49, (uint64_t)v48);
  sub_25DD6FF38((uint64_t)v49, (uint64_t)v46);
  sub_25DD6FF38((uint64_t)v49, (uint64_t)v44);
  swift_retain_n();
  uint64_t v10 = sub_25DD89958();
  os_log_type_t v11 = sub_25DD89C58();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = v42;
    *(_DWORD *)uint64_t v12 = 136316162;
    uint64_t v13 = sub_25DD89898();
    sub_25DD7D6C4(v13, v14, &v43);
    sub_25DD89CF8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v15 = sub_25DD89888();
    sub_25DD7D6C4(v15, v16, &v43);
    sub_25DD89CF8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2080;
    __swift_project_boxed_opaque_existential_1(v48, v48[3]);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
    sub_25DD7D6C4(v17, v18, &v43);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    *(_WORD *)(v12 + 32) = 2080;
    __swift_project_boxed_opaque_existential_1(v46, v47);
    log = v10;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(a5 + 56);
    v19(a4, a5);
    uint64_t v20 = MEMORY[0x2611C50E0]();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    sub_25DD7D6C4(v20, v22, &v43);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    *(_WORD *)(v12 + 42) = 2080;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    (*(void (**)(uint64_t, uint64_t))(a5 + 64))(a4, a5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F848);
    uint64_t v23 = sub_25DD89A18();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    sub_25DD7D6C4(v23, v25, &v43);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    _os_log_impl(&dword_25DD62000, log, v11, "Validating task: %s::%s\nwith AnnounceType: %s\nwith allowed verb set: %s\nand allowed entityToVerb map: %s", (uint8_t *)v12, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v42, -1, -1);
    MEMORY[0x2611C5A20](v12, -1, -1);
  }
  else
  {
    swift_release_n();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(a5 + 56);
  }
  uint64_t v26 = (void *)((uint64_t (*)(uint64_t, uint64_t))v19)(a4, a5);
  uint64_t v27 = sub_25DD89888();
  char v29 = sub_25DD84F6C(v27, v28, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
    uint64_t v30 = 1;
    goto LABEL_34;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a5 + 48))(a4, a5)) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 64))(a4, a5);
  uint64_t v32 = sub_25DD89898();
  uint64_t v34 = (void *)sub_25DD81364(v32, v33, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v34)
  {
    sub_25DD896E8();
    sub_25DD8128C((uint64_t)v48, (uint64_t)v46, &qword_26B37F8B0);
    if (v47)
    {
      sub_25DD89748();
      if (swift_dynamicCast())
      {
        uint64_t v35 = v44[0];
        goto LABEL_17;
      }
    }
    else
    {
      sub_25DD858D4((uint64_t)v46, &qword_26B37F8B0);
    }
    uint64_t v35 = 0;
LABEL_17:
    sub_25DD8128C((uint64_t)v48, (uint64_t)v46, &qword_26B37F8B0);
    if (v35)
    {
      swift_release();
      sub_25DD858D4((uint64_t)v46, &qword_26B37F8B0);
      goto LABEL_19;
    }
    sub_25DD86820((uint64_t)v46, (uint64_t)v44, &qword_26B37F8B0);
    if (v45)
    {
      sub_25DD89768();
      if (swift_dynamicCast())
      {
        swift_release();
LABEL_19:
        sub_25DD896E8();
        if (v45)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C62A8);
          if (swift_dynamicCast())
          {
            swift_retain();
            sub_25DD89818();
            swift_release();
            if (!v44[0])
            {
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_29;
            }
            uint64_t v36 = sub_25DD896C8();
            swift_release();
            swift_release();
            if (v36)
            {
              swift_bridgeObjectRelease();
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_25DD858D4((uint64_t)v44, &qword_26B37F8B0);
        }
        swift_bridgeObjectRelease();
LABEL_29:
        sub_25DD858D4((uint64_t)v48, &qword_26B37F8B0);
        uint64_t v30 = 2;
        goto LABEL_34;
      }
    }
    else
    {
      sub_25DD858D4((uint64_t)v44, &qword_26B37F8B0);
    }
LABEL_31:
    uint64_t v37 = sub_25DD89888();
    char v39 = sub_25DD84F6C(v37, v38, v34);
    swift_bridgeObjectRelease();
    sub_25DD858D4((uint64_t)v48, &qword_26B37F8B0);
    swift_bridgeObjectRelease();
    if (v39) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = v30;
    }
  }
LABEL_34:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  return v30;
}

uint64_t sub_25DD866F4(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25DD86788(uint64_t a1)
{
  return a1;
}

unint64_t sub_25DD867D0()
{
  unint64_t result = qword_26A6C62B0;
  if (!qword_26A6C62B0)
  {
    sub_25DD89538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C62B0);
  }
  return result;
}

uint64_t sub_25DD86820(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25DD8687C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
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

void type metadata accessor for AnnounceTypeGlobalOverride()
{
}

void type metadata accessor for AnnounceTypeOverrideMessages()
{
}

void type metadata accessor for AnnounceTypeOverridePhoneCall()
{
}

void type metadata accessor for AnnounceTypeOverrideGenericNotification()
{
}

void type metadata accessor for AnnounceTypeOverrideReminder()
{
}

void type metadata accessor for AnnounceTypeOverrideVoicemail()
{
}

void type metadata accessor for AnnounceTypeOverrideIntercom()
{
}

void type metadata accessor for AnnounceTypeOverrideWorkoutReminder()
{
}

uint64_t sub_25DD86970()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DD869B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25DD86A14(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25DD86A98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25DD86AEC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t sub_25DD86B2C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AnnounceTypeOverrideMitigationForIntercomRequest()
{
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  __swift_destroy_boxed_opaque_existential_1(v1 - 152);
  return v0;
}

void OUTLINED_FUNCTION_5_5()
{
  v1[16] = v0[16];
  v1[17] = v0[17];
  v1[18] = v0[18];
  v1[19] = v0[19];
  v1[20] = v0[20];
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_allocObject();
}

__n128 OUTLINED_FUNCTION_13_4(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  __n128 result = a9;
  a1[1] = a9;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_3(float a1)
{
  *(void *)(v3 - 128) = v2;
  *uint64_t v1 = a1;
  *(void *)(v3 - 152) = v1 + 1;
  *(void *)(v3 - 144) = v1;
  return *(void *)(v3 - 112);
}

void OUTLINED_FUNCTION_15_4(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v2 - 216);
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v1;
}

uint64_t OUTLINED_FUNCTION_16_4(float *a1, float a2)
{
  *a1 = a2;
  return sub_25DD89CF8();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_20_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_21_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25DD89CF8();
}

void OUTLINED_FUNCTION_22_3()
{
  *(void *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_23_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_27_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v7 = *(NSObject **)(v5 - 120);
  uint64_t v8 = *(uint8_t **)(v5 - 144);
  _os_log_impl(a1, v7, v4, a4, v8, 0xCu);
}

uint64_t OUTLINED_FUNCTION_33(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_0(uint64_t a1, unint64_t a2)
{
  return sub_25DD7D6C4(a1, a2, (uint64_t *)(v2 - 128));
}

unint64_t OUTLINED_FUNCTION_43()
{
  return 0xED00006574616769;
}

double OUTLINED_FUNCTION_44_0()
{
  uint64_t v1 = *(void *)(v0 - 216);
  *(void *)(v1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

__n128 *OUTLINED_FUNCTION_47_0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57_0(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

void OUTLINED_FUNCTION_58_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 8u);
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return v0;
}

_WORD *OUTLINED_FUNCTION_63_0(_WORD *result)
{
  *double result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_66_0(float a1)
{
  *(float *)(v1 + 16) = a1;
  *(unsigned char *)(v1 + 20) = 0;
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_68_0(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

BOOL OUTLINED_FUNCTION_69_0(os_log_type_t a1)
{
  *(void *)(v2 - 120) = v1;
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return swift_dynamicCast();
}

uint64_t sub_25DD87094()
{
  uint64_t result = AFIsInternalInstall();
  if (result)
  {
    if (qword_26B37F840 != -1) {
      swift_once();
    }
    sub_25DD898D8();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_25DD898C8();
    sub_25DD898B8();
    return swift_release();
  }
  return result;
}

void sub_25DD871C4()
{
  *(_WORD *)&algn_26B37FAD8[6] = -4864;
}

void sub_25DD871F4()
{
  qword_26B37FAC0 = 1701736302;
  *(void *)algn_26B37FAC8 = 0xE400000000000000;
}

void sub_25DD87210()
{
  if (qword_26B37F070 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25DD89968();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B37FB10);
  oslog = sub_25DD89958();
  os_log_type_t v1 = sub_25DD89C58();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 67109120;
    sub_25DD89CF8();
    _os_log_impl(&dword_25DD62000, oslog, v1, "AutoBugCapture#generateSnapshot ABC result: %{BOOL}d", v2, 8u);
    MEMORY[0x2611C5A20](v2, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25DD8734C(char a1, char a2)
{
  if (*(void *)&aSelectedmitiga_0[8 * a1] == *(void *)&aSelectedmitiga_0[8 * a2]
    && *(void *)&aSelectedmitiga_0[8 * a1 + 24] == *(void *)&aSelectedmitiga_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = OUTLINED_FUNCTION_9_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25DD873C8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025DD8B8A0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0xD000000000000013;
      unint64_t v3 = 0x800000025DD8B8C0;
      break;
    case 3:
      unint64_t v3 = 0xEC00000072656767;
      unint64_t v5 = 0x6972546563696F76;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x65636E756F6E6E61;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x726568746FLL;
      break;
    default:
      unint64_t v3 = 0xEB00000000737365;
      unint64_t v5 = 0x72506E6F74747562;
      break;
  }
  unint64_t v6 = 0x800000025DD8B8A0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v2 = 0xD000000000000013;
      unint64_t v6 = 0x800000025DD8B8C0;
      break;
    case 3:
      unint64_t v6 = 0xEC00000072656767;
      unint64_t v2 = 0x6972546563696F76;
      break;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v2 = 0x65636E756F6E6E61;
      break;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v2 = 0x726568746FLL;
      break;
    default:
      unint64_t v6 = 0xEB00000000737365;
      unint64_t v2 = 0x72506E6F74747562;
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_9_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25DD875B0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000017;
  unint64_t v3 = 0x800000025DD8B860;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000017;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74694D746F6E6F64;
      unsigned int v6 = 1952540521;
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0x65764F746F6E6F64;
      unsigned int v6 = 1684632178;
LABEL_5:
      unint64_t v3 = v6 | 0xED00006500000000;
      break;
    case 3:
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x657461676974696DLL;
      break;
  }
  unint64_t v7 = 0x800000025DD8B860;
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_21_3();
      unsigned int v8 = 1952540521;
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0x65764F746F6E6F64;
      unsigned int v8 = 1684632178;
LABEL_10:
      unint64_t v7 = v8 | 0xED00006500000000;
      break;
    case 3:
      break;
    default:
      unint64_t v7 = 0xE800000000000000;
      OUTLINED_FUNCTION_22_4();
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = OUTLINED_FUNCTION_9_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_25DD87724(char a1, char a2)
{
  unint64_t v3 = sub_25DD6DBD4(a1);
  uint64_t v5 = v4;
  if (v3 == sub_25DD6DBD4(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_9_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25DD877A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25DD877D0(a1, MEMORY[0x263F71440], a2);
}

uint64_t sub_25DD877B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25DD877D0(a1, MEMORY[0x263F71570], a2);
}

uint64_t sub_25DD877D0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v7);
}

void sub_25DD8787C()
{
  qword_26A6C73C0 = 0x747465536C6F6F62;
  *(void *)algn_26A6C73C8 = 0xEF656D614E676E69;
}

void sub_25DD878AC()
{
  qword_26A6C73D0 = 0x69726953796568;
  *(void *)algn_26A6C73D8 = 0xE700000000000000;
}

uint64_t sub_25DD878D0()
{
  return 3;
}

uint64_t sub_25DD878D8()
{
  uint64_t v164 = sub_25DD89948();
  OUTLINED_FUNCTION_2();
  uint64_t v145 = v0;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_25();
  os_log_type_t v163 = v2;
  OUTLINED_FUNCTION_24_3();
  uint64_t v167 = sub_25DD89668();
  OUTLINED_FUNCTION_2();
  uint64_t v146 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v166 = (char *)&v143 - v6;
  OUTLINED_FUNCTION_24_3();
  uint64_t v152 = sub_25DD89558();
  OUTLINED_FUNCTION_2();
  uint64_t v151 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_25();
  uint64_t v150 = v9;
  OUTLINED_FUNCTION_24_3();
  uint64_t v149 = sub_25DD89618();
  OUTLINED_FUNCTION_2();
  uint64_t v148 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_25();
  uint64_t v147 = v12;
  OUTLINED_FUNCTION_24_3();
  v165 = (uint64_t *)sub_25DD89738();
  OUTLINED_FUNCTION_2();
  uint64_t v160 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_25();
  uint64_t v153 = v15;
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F828);
  MEMORY[0x270FA5388](v161);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v17);
  uint64_t v159 = (uint64_t)&v143 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F820);
  MEMORY[0x270FA5388](v19 - 8);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_10();
  uint64_t v168 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22_3();
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  char v29 = (char *)&v143 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v143 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v143 - v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F818);
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v37 = (char *)&v143 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_25DD895F8();
  OUTLINED_FUNCTION_2();
  uint64_t v40 = v39;
  uint64_t v42 = MEMORY[0x270FA5388](v41);
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)&v143 - v44;
  if ((sub_25DD89578() & 1) == 0)
  {
    if (qword_26B37F070 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_25DD89968();
    __swift_project_value_buffer(v49, (uint64_t)qword_26B37FB10);
    os_log_type_t v50 = sub_25DD89958();
    os_log_type_t v51 = sub_25DD89C58();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = 2;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_25DD62000, v50, v51, "this parse couldn't be interpreted as a universal command", v53, 2u);
      MEMORY[0x2611C5A20](v53, -1, -1);

      return v52;
    }

    return 2;
  }
  uint64_t v46 = sub_25DD89568();
  sub_25DD877D0(v46, MEMORY[0x263F71570], (uint64_t)v37);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38) == 1)
  {
    uint64_t v47 = &qword_26B37F818;
    uint64_t v48 = v37;
LABEL_4:
    sub_25DD71AF0((uint64_t)v48, v47);
    return 2;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v45, v37, v38);
  char v54 = sub_25DD895C8();
  uint64_t v55 = v38;
  uint64_t v56 = v40;
  uint64_t v57 = v45;
  uint64_t v58 = *(void (**)(void))(v40 + 16);
  uint64_t v144 = v57;
  uint64_t v143 = v55;
  OUTLINED_FUNCTION_25_2();
  v58();
  if (v54) {
    char v59 = 1;
  }
  else {
    char v59 = sub_25DD895E8();
  }
  uint64_t v60 = v40 + 8;
  char v61 = *(void (**)(void))(v56 + 8);
  uint64_t v62 = v143;
  OUTLINED_FUNCTION_4_3();
  v63();
  OUTLINED_FUNCTION_25_2();
  v58();
  if (v59)
  {
    OUTLINED_FUNCTION_4_3();
    v61();
LABEL_17:
    ((void (*)(char *, uint64_t))v61)(v144, v62);
    return 1;
  }
  char v64 = sub_25DD895B8();
  OUTLINED_FUNCTION_4_3();
  v61();
  if (v64) {
    goto LABEL_17;
  }
  uint64_t v66 = v144;
  unint64_t v67 = sub_25DD89698();
  unint64_t v68 = v67;
  if (v67 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_25DD89E18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v69 = *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v70 = v168;
  if (v69)
  {
    if ((v68 & 0xC000000000000001) != 0)
    {
      MEMORY[0x2611C52C0](0, v68);
    }
    else
    {
      if (!*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_114;
      }
      swift_retain();
    }
  }
  swift_bridgeObjectRelease();
  sub_25DD896E8();
  swift_release();
  if (!v172)
  {
    OUTLINED_FUNCTION_4_3();
    v61();
    uint64_t v47 = &qword_26B37F8B0;
    uint64_t v48 = (char *)&v171;
    goto LABEL_4;
  }
  sub_25DD858A4(&v171, &v173);
  sub_25DD7F538((uint64_t)&v173, (uint64_t)&v171);
  sub_25DD89808();
  if (OUTLINED_FUNCTION_15_5()) {
    goto LABEL_34;
  }
  sub_25DD89828();
  if (OUTLINED_FUNCTION_11_3())
  {
    swift_release();
    sub_25DD7F538((uint64_t)&v173, (uint64_t)v170);
    if (OUTLINED_FUNCTION_19_4())
    {
      uint64_t v71 = v169;
      swift_retain();
      sub_25DD896B8();
      uint64_t v167 = v71;
      swift_release();
      os_log_type_t v163 = v61;
      if (v170[0])
      {
        sub_25DD89728();
        swift_release();
        uint64_t v72 = v165;
      }
      else
      {
        uint64_t v72 = v165;
        __swift_storeEnumTagSinglePayload((uint64_t)v34, 1, 1, (uint64_t)v165);
      }
      uint64_t v94 = v158;
      uint64_t v95 = *MEMORY[0x263F72DA0];
      unint64_t v96 = *(void (**)(char *, uint64_t, uint64_t *))(v160 + 104);
      uint64_t v166 = (char *)(v160 + 104);
      uint64_t v164 = (uint64_t)v96;
      v96(v32, v95, v72);
      OUTLINED_FUNCTION_6_4((uint64_t)v32);
      uint64_t v97 = v159;
      uint64_t v99 = v159 + v98;
      sub_25DD89040((uint64_t)v34, v159);
      sub_25DD89040((uint64_t)v32, v99);
      OUTLINED_FUNCTION_1_5(v97);
      if (v84)
      {
        uint64_t v72 = &qword_26B37F820;
        sub_25DD71AF0((uint64_t)v32, &qword_26B37F820);
        OUTLINED_FUNCTION_20_3((uint64_t)v34);
        OUTLINED_FUNCTION_1_5(v99);
        if (v84)
        {
          uint64_t v100 = v159;
          os_log_type_t v101 = v163;
          goto LABEL_80;
        }
      }
      else
      {
        sub_25DD89040(v97, (uint64_t)v29);
        OUTLINED_FUNCTION_1_5(v99);
        if (!v102)
        {
          uint64_t v104 = v160;
          uint64_t v105 = OUTLINED_FUNCTION_2_5();
          v106(v105);
          sub_25DD890A8();
          LODWORD(v163) = sub_25DD89A48();
          uint64_t v107 = *(void (**)(uint64_t, uint64_t *))(v104 + 8);
          uint64_t v108 = v94;
          uint64_t v94 = v158;
          v107(v108, v72);
          uint64_t v72 = &qword_26B37F820;
          sub_25DD71AF0((uint64_t)v32, &qword_26B37F820);
          sub_25DD71AF0((uint64_t)v34, &qword_26B37F820);
          v107((uint64_t)v29, v165);
          uint64_t v70 = v168;
          os_log_type_t v101 = v61;
          OUTLINED_FUNCTION_20_3(v97);
          uint64_t v103 = v157;
          if (v163) {
            goto LABEL_81;
          }
          goto LABEL_72;
        }
        sub_25DD71AF0((uint64_t)v32, &qword_26B37F820);
        sub_25DD71AF0((uint64_t)v34, &qword_26B37F820);
        (*(void (**)(char *, uint64_t *))(v160 + 8))(v29, v72);
      }
      sub_25DD71AF0(v159, &qword_26B37F828);
      uint64_t v103 = v157;
      os_log_type_t v101 = v163;
LABEL_72:
      sub_25DD896B8();
      if (v170[0])
      {
        sub_25DD89728();
        swift_release();
      }
      else
      {
        __swift_storeEnumTagSinglePayload(v94, 1, 1, (uint64_t)v72);
      }
      uint64_t v109 = v156;
      uint64_t v110 = v155;
      OUTLINED_FUNCTION_14_4();
      v111();
      OUTLINED_FUNCTION_6_4(v70);
      uint64_t v113 = v109 + v112;
      sub_25DD89040(v94, v109);
      sub_25DD89040(v70, v113);
      OUTLINED_FUNCTION_1_5(v109);
      if (!v84)
      {
        sub_25DD89040(v109, v110);
        OUTLINED_FUNCTION_1_5(v113);
        if (!v114)
        {
          uint64_t v115 = v160;
          uint64_t v116 = OUTLINED_FUNCTION_2_5();
          v117(v116);
          sub_25DD890A8();
          char v118 = OUTLINED_FUNCTION_16_5();
          uint64_t v119 = v101;
          uint64_t v120 = v109;
          char v121 = *(void (**)(uint64_t, uint64_t *))(v115 + 8);
          v121(v94, v72);
          uint64_t v72 = &qword_26B37F820;
          sub_25DD71AF0(v70, &qword_26B37F820);
          sub_25DD71AF0(v158, &qword_26B37F820);
          v121(v110, v165);
          uint64_t v103 = v157;
          uint64_t v122 = v120;
          os_log_type_t v101 = v119;
          OUTLINED_FUNCTION_20_3(v122);
          OUTLINED_FUNCTION_23_4();
          if ((v118 & 1) == 0)
          {
LABEL_87:
            sub_25DD896B8();
            if (v170[0])
            {
              sub_25DD89728();
              swift_release();
            }
            else
            {
              __swift_storeEnumTagSinglePayload(v103, 1, 1, (uint64_t)v72);
            }
            uint64_t v123 = v154;
            OUTLINED_FUNCTION_14_4();
            v124();
            OUTLINED_FUNCTION_6_4(v123);
            uint64_t v126 = v70 + v125;
            sub_25DD89040(v103, v70);
            sub_25DD89040(v123, v126);
            OUTLINED_FUNCTION_1_5(v70);
            if (v84)
            {
              swift_release();
              sub_25DD71AF0(v123, &qword_26B37F820);
              sub_25DD71AF0(v103, &qword_26B37F820);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
              OUTLINED_FUNCTION_5_6();
              v101();
              OUTLINED_FUNCTION_1_5(v126);
              if (v84)
              {
                sub_25DD71AF0(v70, &qword_26B37F820);
                goto LABEL_36;
              }
            }
            else
            {
              sub_25DD89040(v70, v110);
              OUTLINED_FUNCTION_1_5(v126);
              if (!v127)
              {
                uint64_t v128 = v160;
                uint64_t v129 = OUTLINED_FUNCTION_2_5();
                v130(v129);
                sub_25DD890A8();
                LODWORD(v168) = OUTLINED_FUNCTION_16_5();
                swift_release();
                long long v131 = *(void (**)(uint64_t, uint64_t *))(v128 + 8);
                v131(v94, v72);
                sub_25DD71AF0(v154, &qword_26B37F820);
                sub_25DD71AF0(v103, &qword_26B37F820);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
                OUTLINED_FUNCTION_5_6();
                v101();
                v131(v110, v72);
                sub_25DD71AF0(v70, &qword_26B37F820);
                if (v168) {
                  goto LABEL_36;
                }
                goto LABEL_103;
              }
              swift_release();
              sub_25DD71AF0(v154, &qword_26B37F820);
              sub_25DD71AF0(v103, &qword_26B37F820);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
              OUTLINED_FUNCTION_5_6();
              v101();
              (*(void (**)(uint64_t, uint64_t *))(v160 + 8))(v110, v72);
            }
            sub_25DD71AF0(v70, &qword_26B37F828);
LABEL_103:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
            return 2;
          }
LABEL_81:
          swift_release();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
          OUTLINED_FUNCTION_5_6();
          v101();
          goto LABEL_36;
        }
        sub_25DD71AF0(v70, &qword_26B37F820);
        sub_25DD71AF0(v94, &qword_26B37F820);
        (*(void (**)(uint64_t, uint64_t *))(v160 + 8))(v110, v72);
LABEL_85:
        sub_25DD71AF0(v109, &qword_26B37F828);
        OUTLINED_FUNCTION_23_4();
        goto LABEL_87;
      }
      uint64_t v72 = &qword_26B37F820;
      sub_25DD71AF0(v70, &qword_26B37F820);
      OUTLINED_FUNCTION_20_3(v94);
      OUTLINED_FUNCTION_1_5(v113);
      if (!v84) {
        goto LABEL_85;
      }
      uint64_t v100 = v109;
LABEL_80:
      sub_25DD71AF0(v100, &qword_26B37F820);
      goto LABEL_81;
    }
LABEL_102:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
    ((void (*)(char *, uint64_t))v61)(v66, v62);
    goto LABEL_103;
  }
  sub_25DD896F8();
  if (OUTLINED_FUNCTION_15_5())
  {
LABEL_34:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
    ((void (*)(char *, uint64_t))v61)(v66, v62);
    goto LABEL_35;
  }
  sub_25DD89768();
  if (!OUTLINED_FUNCTION_11_3())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
    OUTLINED_FUNCTION_4_3();
    v61();
    sub_25DD89718();
    if (!swift_dynamicCast()) {
      goto LABEL_103;
    }
LABEL_35:
    swift_release();
    goto LABEL_36;
  }
  swift_release();
  sub_25DD7F538((uint64_t)&v173, (uint64_t)v170);
  if (!OUTLINED_FUNCTION_19_4()) {
    goto LABEL_102;
  }
  swift_release();
  uint64_t v73 = v147;
  sub_25DD895D8();
  uint64_t v74 = v150;
  sub_25DD89608();
  (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v73, v149);
  uint64_t v75 = sub_25DD89548();
  (*(void (**)(uint64_t, uint64_t))(v151 + 8))(v74, v152);
  uint64_t v76 = *(void *)(v75 + 16);
  if (!v76)
  {
    swift_bridgeObjectRelease();
    goto LABEL_102;
  }
  v165 = (uint64_t *)v60;
  uint64_t v77 = *(void (**)(void))(v146 + 16);
  unint64_t v78 = v75 + ((*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80));
  unint64_t v79 = (void (**)(void))(v146 + 8);
  uint64_t v168 = *(void *)(v146 + 72);
  uint64_t v161 = v75;
  swift_bridgeObjectRetain();
  while (1)
  {
    OUTLINED_FUNCTION_25_2();
    v77();
    sub_25DD89658();
    uint64_t v80 = sub_25DD89938();
    uint64_t v82 = v81;
    OUTLINED_FUNCTION_5_6();
    v83();
    if (qword_26A6C60F0 != -1) {
      swift_once();
    }
    BOOL v84 = v80 == qword_26A6C73C0 && v82 == *(void *)algn_26A6C73C8;
    uint64_t v85 = v162;
    if (v84)
    {
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, char *, uint64_t))v77)(v85, v166, v167);
    }
    else
    {
      char v86 = sub_25DD89F08();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_25_2();
      v77();
      if ((v86 & 1) == 0)
      {
        uint64_t v87 = *v79;
        OUTLINED_FUNCTION_18_5();
        v87();
        OUTLINED_FUNCTION_18_5();
        v87();
        goto LABEL_57;
      }
    }
    uint64_t v88 = sub_25DD89648();
    uint64_t v90 = v89;
    if (qword_26A6C60F8 != -1) {
      swift_once();
    }
    if (v88 == qword_26A6C73D0 && v90 == *(void *)algn_26A6C73D8) {
      break;
    }
    char v92 = sub_25DD89F08();
    swift_bridgeObjectRelease();
    uint64_t v93 = *v79;
    OUTLINED_FUNCTION_18_5();
    v93();
    OUTLINED_FUNCTION_18_5();
    v93();
    if (v92) {
      goto LABEL_105;
    }
LABEL_57:
    v78 += v168;
    if (!--v76)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v62 = v143;
      uint64_t v66 = v144;
      goto LABEL_102;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v132 = *v79;
  uint64_t v133 = v167;
  OUTLINED_FUNCTION_18_5();
  v132();
  ((void (*)(char *, uint64_t))v132)(v166, v133);
LABEL_105:
  swift_bridgeObjectRelease_n();
  if (qword_26B37F070 != -1) {
LABEL_114:
  }
    swift_once();
  uint64_t v134 = sub_25DD89968();
  __swift_project_value_buffer(v134, (uint64_t)qword_26B37FB10);
  uint64_t v135 = sub_25DD89958();
  os_log_type_t v136 = sub_25DD89C58();
  if (os_log_type_enabled(v135, v136))
  {
    uint64_t v137 = swift_slowAlloc();
    uint64_t v138 = swift_slowAlloc();
    v170[0] = v138;
    *(_DWORD *)uint64_t v137 = 136315394;
    uint64_t v139 = qword_26A6C73C0;
    unint64_t v140 = *(void *)algn_26A6C73C8;
    swift_bridgeObjectRetain();
    uint64_t v169 = sub_25DD7D6C4(v139, v140, v170);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v137 + 12) = 2080;
    if (qword_26A6C60F8 != -1) {
      swift_once();
    }
    uint64_t v141 = qword_26A6C73D0;
    unint64_t v142 = *(void *)algn_26A6C73D8;
    swift_bridgeObjectRetain();
    uint64_t v169 = sub_25DD7D6C4(v141, v142, v170);
    sub_25DD89CF8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD62000, v135, v136, "found identifier with namespace as %s with value %s overriding with donotMitigate", (uint8_t *)v137, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C5A20](v138, -1, -1);
    MEMORY[0x2611C5A20](v137, -1, -1);
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
  ((void (*)(char *, uint64_t))v61)(v144, v143);
LABEL_36:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
  return 1;
}

uint64_t sub_25DD88D2C(uint64_t a1)
{
  uint64_t v4 = sub_25DD89588();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v20 = v1;
    uint64_t v21 = v10 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t result = swift_bridgeObjectRetain();
    int v19 = 0;
    unint64_t v13 = 0;
    v18[1] = v11 - 1;
    do
    {
      if (v13 >= *(void *)(v10 + 16))
      {
        __break(1u);
        return result;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v21 + *(void *)(v6 + 72) * v13, v4);
      if (sub_25DD878D8() != 2)
      {
        swift_bridgeObjectRelease();
LABEL_9:
        uint64_t v16 = OUTLINED_FUNCTION_13_5();
        v17(v16);
        swift_bridgeObjectRelease();
        return 1;
      }
      OUTLINED_FUNCTION_8_4();
      OUTLINED_FUNCTION_21_3();
      sub_25DD89F08();
      OUTLINED_FUNCTION_17_1();
      if (v2) {
        goto LABEL_9;
      }
      OUTLINED_FUNCTION_8_4();
      OUTLINED_FUNCTION_22_4();
      sub_25DD89F08();
      OUTLINED_FUNCTION_17_1();
      uint64_t v14 = OUTLINED_FUNCTION_13_5();
      uint64_t result = v15(v14);
      ++v13;
    }
    while (v11 != v13);
    swift_bridgeObjectRelease();
    if (v19) {
      return 0;
    }
  }
  return 2;
}

id sub_25DD88F30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UniversalCommandMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25DD88F88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UniversalCommandMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UniversalCommandMatcher()
{
  return self;
}

uint64_t sub_25DD88FE4(uint64_t a1)
{
  return sub_25DD88D2C(a1);
}

unint64_t sub_25DD88FFC(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_25DD8901C(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_25DD89040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B37F820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25DD890A8()
{
  unint64_t result = qword_26A6C62B8;
  if (!qword_26A6C62B8)
  {
    sub_25DD89738();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C62B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return *(void *)(v0 - 336);
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_25DD89F08();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_5()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_25DD89A48();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_20_3(uint64_t a1)
{
  return sub_25DD71AF0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return 0;
}

uint64_t sub_25DD89324()
{
  return 1;
}

uint64_t sub_25DD8932C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88)) {
    return 1;
  }
  else {
    return 2;
  }
}

id sub_25DD89340()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LASOverrideMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25DD89398()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LASOverrideMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LASOverrideMatcher()
{
  return self;
}

uint64_t sub_25DD893F0(uint64_t a1)
{
  return sub_25DD8932C(a1);
}

uint64_t sub_25DD89418()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_25DD89428()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25DD89438()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25DD89448()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25DD89458()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25DD89468()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25DD89478()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25DD89488()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25DD89498()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25DD894A8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25DD894B8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25DD894C8()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25DD894D8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25DD894E8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25DD894F8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25DD89508()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25DD89518()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25DD89528()
{
  return MEMORY[0x270F6A278]();
}

uint64_t sub_25DD89538()
{
  return MEMORY[0x270F6A280]();
}

uint64_t sub_25DD89548()
{
  return MEMORY[0x270F6A350]();
}

uint64_t sub_25DD89558()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_25DD89568()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_25DD89578()
{
  return MEMORY[0x270F6A4C8]();
}

uint64_t sub_25DD89588()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_25DD89598()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_25DD895A8()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_25DD895B8()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_25DD895C8()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_25DD895D8()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_25DD895E8()
{
  return MEMORY[0x270F6A7F8]();
}

uint64_t sub_25DD895F8()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_25DD89608()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_25DD89618()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_25DD89628()
{
  return MEMORY[0x270F6AC68]();
}

uint64_t sub_25DD89638()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_25DD89648()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t sub_25DD89658()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t sub_25DD89668()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t sub_25DD89678()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_25DD89688()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_25DD89698()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_25DD896A8()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_25DD896B8()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_25DD896C8()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_25DD896D8()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_25DD896E8()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_25DD896F8()
{
  return MEMORY[0x270F6D370]();
}

uint64_t sub_25DD89708()
{
  return MEMORY[0x270F6D640]();
}

uint64_t sub_25DD89718()
{
  return MEMORY[0x270F6D648]();
}

uint64_t sub_25DD89728()
{
  return MEMORY[0x270F6D950]();
}

uint64_t sub_25DD89738()
{
  return MEMORY[0x270F6D958]();
}

uint64_t sub_25DD89748()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_25DD89758()
{
  return MEMORY[0x270F6DA70]();
}

uint64_t sub_25DD89768()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_25DD89778()
{
  return MEMORY[0x270F6DD20]();
}

uint64_t sub_25DD89788()
{
  return MEMORY[0x270F6DD40]();
}

uint64_t sub_25DD89798()
{
  return MEMORY[0x270F6DF60]();
}

uint64_t sub_25DD897A8()
{
  return MEMORY[0x270F6E168]();
}

uint64_t sub_25DD897B8()
{
  return MEMORY[0x270F6E170]();
}

uint64_t sub_25DD897C8()
{
  return MEMORY[0x270F6E178]();
}

uint64_t sub_25DD897D8()
{
  return MEMORY[0x270F6E198]();
}

uint64_t sub_25DD897E8()
{
  return MEMORY[0x270F6E1C0]();
}

uint64_t sub_25DD897F8()
{
  return MEMORY[0x270F6E3A0]();
}

uint64_t sub_25DD89808()
{
  return MEMORY[0x270F6E3C8]();
}

uint64_t sub_25DD89818()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_25DD89828()
{
  return MEMORY[0x270F6E570]();
}

uint64_t sub_25DD89838()
{
  return MEMORY[0x270F6E598]();
}

uint64_t sub_25DD89848()
{
  return MEMORY[0x270F6E5A0]();
}

uint64_t sub_25DD89858()
{
  return MEMORY[0x270F6E738]();
}

uint64_t sub_25DD89868()
{
  return MEMORY[0x270F6EBC0]();
}

uint64_t sub_25DD89878()
{
  return MEMORY[0x270F6F240]();
}

uint64_t sub_25DD89888()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_25DD89898()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_25DD898A8()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_25DD898B8()
{
  return MEMORY[0x270F72C28]();
}

uint64_t sub_25DD898C8()
{
  return MEMORY[0x270F72C30]();
}

uint64_t sub_25DD898D8()
{
  return MEMORY[0x270F72C38]();
}

uint64_t sub_25DD898E8()
{
  return MEMORY[0x270F68E00]();
}

uint64_t sub_25DD898F8()
{
  return MEMORY[0x270F12C38]();
}

uint64_t sub_25DD89908()
{
  return MEMORY[0x270F68E38]();
}

uint64_t sub_25DD89918()
{
  return MEMORY[0x270F69A30]();
}

uint64_t sub_25DD89928()
{
  return MEMORY[0x270F69A48]();
}

uint64_t sub_25DD89938()
{
  return MEMORY[0x270F446F8]();
}

uint64_t sub_25DD89948()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_25DD89958()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DD89968()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DD89978()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25DD89988()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25DD89998()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_25DD899A8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25DD899B8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25DD899C8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25DD899D8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25DD899E8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25DD899F8()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25DD89A08()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_25DD89A18()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25DD89A28()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25DD89A38()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25DD89A48()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25DD89A58()
{
  return MEMORY[0x270EF18B0]();
}

uint64_t sub_25DD89A68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DD89A78()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DD89A88()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25DD89A98()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25DD89AA8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25DD89AB8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25DD89AC8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DD89AD8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25DD89AE8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25DD89AF8()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_25DD89B08()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25DD89B18()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DD89B28()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25DD89B38()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DD89B48()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25DD89B58()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25DD89B78()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25DD89B88()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25DD89B98()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25DD89BB8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25DD89BC8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25DD89BD8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25DD89BE8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25DD89C08()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25DD89C18()
{
  return MEMORY[0x270EF1BC8]();
}

uint64_t sub_25DD89C28()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25DD89C38()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25DD89C48()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25DD89C58()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DD89C68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DD89C78()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_25DD89C88()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25DD89C98()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25DD89CA8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_25DD89CB8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25DD89CC8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25DD89CD8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_25DD89CE8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25DD89CF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DD89D08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DD89D18()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25DD89D28()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_25DD89D38()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_25DD89D48()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25DD89D58()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25DD89D68()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25DD89D78()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25DD89D88()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25DD89D98()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25DD89DA8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DD89DB8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25DD89DC8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DD89DD8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25DD89DE8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25DD89DF8()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25DD89E08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DD89E18()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25DD89E28()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25DD89E38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DD89E48()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25DD89E58()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25DD89E68()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25DD89E78()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25DD89E88()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25DD89E98()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25DD89EA8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25DD89EB8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25DD89EC8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25DD89ED8()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25DD89EE8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25DD89EF8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DD89F08()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DD89F18()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25DD89F28()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25DD89F38()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25DD89F48()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25DD89F58()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25DD89F68()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25DD89F78()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DD89F88()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DD89F98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25DD89FA8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25DD89FB8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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