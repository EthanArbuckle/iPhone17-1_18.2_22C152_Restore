void sub_25DC0F6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(id *__return_ptr, uint64_t, void *);
  id v29;
  void *v30;
  uint64_t v31;
  id v32[8];

  swift_beginAccess();
  v7 = *(void **)(a2 + 16);
  if (v7 && (swift_beginAccess(), (*(unsigned char *)(a3 + 24) & 1) == 0))
  {
    v17 = *(void *)(a3 + 16);
    v18 = qword_26B378700;
    v19 = v7;
    if (v18 != -1) {
      swift_once();
    }
    v20 = sub_25DC161C0();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.extractionCategory);
    v21 = v19;
    v22 = sub_25DC161A0();
    v23 = sub_25DC166A0();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      v32[0] = v30;
      *(_DWORD *)v24 = 136315394;
      sub_25DB91534(0, &qword_26B378018);
      v25 = v21;
      v26 = sub_25DC162E0();
      sub_25DB90A20(v26, v27, (uint64_t *)v32);
      sub_25DC166F0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;
      v31 = v17;
      sub_25DC166F0();
      _os_log_impl(&dword_25DB89000, v22, v23, "BiomeLatestEventProcessor: Latest event: %s at: %f", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611C0CF0](v30, -1, -1);
      MEMORY[0x2611C0CF0](v24, -1, -1);
    }
    else
    {
    }
    v28 = *(void (**)(id *__return_ptr, uint64_t, void *))(a4 + 8);
    v29 = v21;
    v28(v32, v17, v7);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B377F90);
    sub_25DC16520();
  }
  else
  {
    if (qword_26B378700 != -1) {
      swift_once();
    }
    v8 = sub_25DC161C0();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.extractionCategory);
    sub_25DB93850(a4, (uint64_t)v32, &qword_26B376398);
    v9 = sub_25DC161A0();
    v10 = sub_25DC166A0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      *(_DWORD *)v11 = 136315138;
      v31 = v12;
      v13 = objc_msgSend(v32[0], sel_identifier);
      v14 = sub_25DC162C0();
      v16 = v15;

      sub_25DB90A20(v14, v16, &v31);
      sub_25DC166F0();
      swift_bridgeObjectRelease();
      sub_25DC13C20((uint64_t)v32, &qword_26B376398);
      _os_log_impl(&dword_25DB89000, v9, v10, "BiomeLatestEventProcessor: No value extracted from the Biome stream: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C0CF0](v12, -1, -1);
      MEMORY[0x2611C0CF0](v11, -1, -1);
    }
    else
    {
      sub_25DC13C20((uint64_t)v32, &qword_26B376398);
    }

    (*(void (**)(id *__return_ptr, void, void))(a4 + 8))(v32, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B377F90);
    sub_25DC16520();
  }
}

void sub_25DC0FB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v28)(id *__return_ptr, uint64_t, void *);
  id v29;
  void *v30;
  uint64_t v31;
  id v32[8];

  swift_beginAccess();
  v7 = *(void **)(a2 + 16);
  if (v7 && (swift_beginAccess(), (*(unsigned char *)(a3 + 24) & 1) == 0))
  {
    uint64_t v17 = *(void *)(a3 + 16);
    uint64_t v18 = qword_26B378700;
    id v19 = v7;
    if (v18 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25DC161C0();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.extractionCategory);
    id v21 = v19;
    v22 = sub_25DC161A0();
    os_log_type_t v23 = sub_25DC166A0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      v32[0] = v30;
      *(_DWORD *)uint64_t v24 = 136315394;
      sub_25DB91534(0, &qword_26B378050);
      id v25 = v21;
      uint64_t v26 = sub_25DC162E0();
      sub_25DB90A20(v26, v27, (uint64_t *)v32);
      sub_25DC166F0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;
      v31 = v17;
      sub_25DC166F0();
      _os_log_impl(&dword_25DB89000, v22, v23, "BiomeLatestEventProcessor: Latest event: %s at: %f", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611C0CF0](v30, -1, -1);
      MEMORY[0x2611C0CF0](v24, -1, -1);
    }
    else
    {
    }
    v28 = *(void (**)(id *__return_ptr, uint64_t, void *))(a4 + 8);
    v29 = v21;
    v28(v32, v17, v7);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B377FA8);
    sub_25DC16520();
  }
  else
  {
    if (qword_26B378700 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DC161C0();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.extractionCategory);
    sub_25DB93850(a4, (uint64_t)v32, &qword_26B3763C0);
    v9 = sub_25DC161A0();
    os_log_type_t v10 = sub_25DC166A0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)v11 = 136315138;
      v31 = v12;
      id v13 = objc_msgSend(v32[0], sel_identifier);
      uint64_t v14 = sub_25DC162C0();
      unint64_t v16 = v15;

      sub_25DB90A20(v14, v16, &v31);
      sub_25DC166F0();
      swift_bridgeObjectRelease();
      sub_25DC13C20((uint64_t)v32, &qword_26B3763C0);
      _os_log_impl(&dword_25DB89000, v9, v10, "BiomeLatestEventProcessor: No value extracted from the Biome stream: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C0CF0](v12, -1, -1);
      MEMORY[0x2611C0CF0](v11, -1, -1);
    }
    else
    {
      sub_25DC13C20((uint64_t)v32, &qword_26B3763C0);
    }

    (*(void (**)(id *__return_ptr, void, void))(a4 + 8))(v32, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B377FA8);
    sub_25DC16520();
  }
}

void sub_25DC0FFA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, uint64_t a7, uint64_t *a8, uint64_t *a9)
{
  void (*v37)(id *__return_ptr, uint64_t, void *);
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  id v42[8];

  swift_beginAccess();
  uint64_t v14 = *(void **)(a2 + 16);
  if (v14 && (swift_beginAccess(), (*(unsigned char *)(a3 + 24) & 1) == 0))
  {
    v40 = *(void *)(a3 + 16);
    uint64_t v26 = qword_26B378700;
    id v27 = v14;
    if (v26 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_25DC161C0();
    __swift_project_value_buffer(v28, (uint64_t)static Logger.extractionCategory);
    id v29 = v27;
    v30 = sub_25DC161A0();
    os_log_type_t v31 = sub_25DC166A0();
    if (os_log_type_enabled(v30, v31))
    {
      v39 = a8;
      uint64_t v32 = swift_slowAlloc();
      v42[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315394;
      sub_25DB91534(0, a6);
      id v33 = v29;
      uint64_t v34 = sub_25DC162E0();
      sub_25DB90A20(v34, v35, (uint64_t *)v42);
      sub_25DC166F0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2048;
      uint64_t v36 = v40;
      v41 = v40;
      sub_25DC166F0();
      _os_log_impl(&dword_25DB89000, v30, v31, "BiomeLatestEventProcessor: Latest event: %s at: %f", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      a8 = v39;
      OUTLINED_FUNCTION_17();
    }
    else
    {

      uint64_t v36 = v40;
    }
    v37 = *(void (**)(id *__return_ptr, uint64_t, void *))(a4 + 8);
    v38 = v29;
    v37(v42, v36, v14);

    __swift_instantiateConcreteTypeFromMangledName(a8);
    sub_25DC16520();
  }
  else
  {
    if (qword_26B378700 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25DC161C0();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.extractionCategory);
    sub_25DB93850(a4, (uint64_t)v42, a9);
    unint64_t v16 = sub_25DC161A0();
    os_log_type_t v17 = sub_25DC166A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      v41 = v19;
      id v20 = objc_msgSend(v42[0], sel_identifier);
      id v21 = a8;
      uint64_t v22 = sub_25DC162C0();
      unint64_t v24 = v23;

      uint64_t v25 = v22;
      a8 = v21;
      sub_25DB90A20(v25, v24, &v41);
      sub_25DC166F0();
      swift_bridgeObjectRelease();
      sub_25DC13C20((uint64_t)v42, a9);
      _os_log_impl(&dword_25DB89000, v16, v17, "BiomeLatestEventProcessor: No value extracted from the Biome stream: %s", v18, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_17();
    }
    else
    {
      sub_25DC13C20((uint64_t)v42, a9);
    }

    (*(void (**)(id *__return_ptr, void, void))(a4 + 8))(v42, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName(a8);
    sub_25DC16520();
  }
}

void sub_25DC10418(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = (void **)(a2 + 16);
  uint64_t v5 = a3 + 16;
  v6 = (void *)MEMORY[0x2611C0610]();
  sub_25DC10480(v4, a1, v5);
}

uint64_t sub_25DC10480(void **a1, id a2, uint64_t a3)
{
  id v6 = objc_msgSend(a2, sel_eventBody);
  swift_beginAccess();
  v7 = *a1;
  *a1 = v6;

  objc_msgSend(a2, sel_timestamp);
  uint64_t v9 = v8;
  uint64_t result = swift_beginAccess();
  *(void *)a3 = v9;
  *(unsigned char *)(a3 + 8) = 0;
  return result;
}

void sub_25DC1053C(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void *sub_25DC105A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a3;
  v4[4] = a4;
  sub_25DC139B0(a2, (uint64_t)(v4 + 5));
  return v4;
}

uint64_t sub_25DC105D8(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return OUTLINED_FUNCTION_7_1((uint64_t)sub_25DC105F0);
}

uint64_t sub_25DC105F0()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v1 = v0[16];
  uint64_t v2 = *(void **)(v1 + 16);
  sub_25DB93850(v1 + 40, (uint64_t)(v0 + 5), qword_26B378720);
  v0[2] = v2;
  v0[3] = sub_25DC13C18;
  v0[4] = v1;
  id v6 = (uint64_t (*)(uint64_t))((char *)&dword_26A6B3F98 + dword_26A6B3F98);
  id v3 = v2;
  swift_retain();
  id v4 = (void *)swift_task_alloc();
  v0[17] = v4;
  *id v4 = v0;
  v4[1] = sub_25DC106F0;
  return v6((uint64_t)(v0 + 10));
}

uint64_t sub_25DC106F0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  uint64_t v4 = v1 + 80;
  OUTLINED_FUNCTION_42_1();
  uint64_t v6 = *(void *)(v5 + 120);
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  sub_25DC13C20(v3, &qword_26B3763A0);
  sub_25DBB9254(v4, v6);
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_25DC107EC()
{
  *(void *)(v1 + 80) = v0;
  return OUTLINED_FUNCTION_7_1((uint64_t)sub_25DC10804);
}

uint64_t sub_25DC10804()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = OUTLINED_FUNCTION_21_7();
  sub_25DB93850(v2, v3, qword_26B378720);
  OUTLINED_FUNCTION_65_0();
  *(void *)(v1 + 24) = sub_25DC13A18;
  *(void *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_20_5();
  swift_retain();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_63_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DC108CC;
  uint64_t v14 = (uint64_t (*)(void))OUTLINED_FUNCTION_59_0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13, v16, v17);
  return v14();
}

uint64_t sub_25DC108CC()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  OUTLINED_FUNCTION_42_1();
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_25DC13C20(v3, &qword_26B376398);
  uint64_t v6 = OUTLINED_FUNCTION_61_1();
  return v7(v6);
}

uint64_t sub_25DC109A8()
{
  *(void *)(v1 + 80) = v0;
  return OUTLINED_FUNCTION_7_1((uint64_t)sub_25DC109C0);
}

uint64_t sub_25DC109C0()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = OUTLINED_FUNCTION_21_7();
  sub_25DB93850(v2, v3, qword_26B378720);
  OUTLINED_FUNCTION_65_0();
  *(void *)(v1 + 24) = sub_25DC13B7C;
  *(void *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_20_5();
  swift_retain();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_63_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DC10A88;
  uint64_t v14 = (uint64_t (*)(void))OUTLINED_FUNCTION_59_0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13, v16, v17);
  return v14();
}

uint64_t sub_25DC10A88()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v10 = v9;
  uint64_t v11 = v9 + 16;
  OUTLINED_FUNCTION_42_1();
  uint64_t v12 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v13 = v12;
  swift_task_dealloc();
  sub_25DC13C20(v11, &qword_26B3763C0);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8);
  return v14(v8, v6, v4, v2);
}

uint64_t sub_25DC10B88()
{
  *(void *)(v1 + 80) = v0;
  return OUTLINED_FUNCTION_7_1((uint64_t)sub_25DC10BA0);
}

uint64_t sub_25DC10BA0()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = OUTLINED_FUNCTION_21_7();
  sub_25DB93850(v2, v3, qword_26B378720);
  OUTLINED_FUNCTION_65_0();
  *(void *)(v1 + 24) = sub_25DC13AC0;
  *(void *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_20_5();
  swift_retain();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_63_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DC10C68;
  uint64_t v14 = (uint64_t (*)(void))OUTLINED_FUNCTION_59_0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13, v16, v17);
  return v14();
}

uint64_t sub_25DC10C68()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v4 = v3;
  uint64_t v5 = v3 + 16;
  OUTLINED_FUNCTION_42_1();
  uint64_t v6 = *v0;
  OUTLINED_FUNCTION_1_0();
  void *v7 = v6;
  uint64_t v9 = v8 & 1;
  swift_task_dealloc();
  sub_25DC13C20(v5, (uint64_t *)&unk_26B3763A8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v10(v2, v9);
}

uint64_t sub_25DC10D50()
{
  *(void *)(v1 + 80) = v0;
  return MEMORY[0x270FA2498](sub_25DC10D70, 0, 0);
}

uint64_t sub_25DC10D70()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = OUTLINED_FUNCTION_21_7();
  sub_25DB93850(v2, v3, qword_26B378720);
  OUTLINED_FUNCTION_65_0();
  *(void *)(v1 + 24) = sub_25DC13A18;
  *(void *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_20_5();
  swift_retain();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_63_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DC10E38;
  uint64_t v14 = (uint64_t (*)(void))OUTLINED_FUNCTION_59_0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13, v16, v17);
  return v14();
}

uint64_t sub_25DC10E38()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  OUTLINED_FUNCTION_42_1();
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_25DC13C20(v3, &qword_26B3763B8);
  uint64_t v6 = OUTLINED_FUNCTION_61_1();
  return v7(v6);
}

double sub_25DC10F14@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(a1 + 24))(v6);
  uint64_t v3 = v7;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 32) = v3;
  return result;
}

uint64_t sub_25DC10F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t *__return_ptr))(a3 + 24))(&v4);
  return v4;
}

uint64_t sub_25DC10F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t *__return_ptr))(a3 + 24))(&v4);
  return v4;
}

uint64_t sub_25DC10FD4()
{
  *(void *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_7_1((uint64_t)sub_25DC10FEC);
}

uint64_t sub_25DC10FEC()
{
  OUTLINED_FUNCTION_20();
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A6B3F38 + dword_26A6B3F38);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DC11090;
  return v3();
}

uint64_t sub_25DC11090()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_1();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 56) = v3;
  *(unsigned char *)(v1 + 25) = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25DC11164()
{
  uint64_t v14 = v0;
  if (qword_26B3762E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25DC161C0();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.intelligenceCategory);
  uint64_t v2 = sub_25DC161A0();
  os_log_type_t v3 = sub_25DC166A0();
  if (os_log_type_enabled(v2, v3))
  {
    char v4 = *(unsigned char *)(v0 + 25);
    uint64_t v5 = *(void *)(v0 + 56);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    *(void *)(v0 + 16) = v5;
    *(unsigned char *)(v0 + 24) = v4;
    uint64_t v7 = sub_25DC162E0();
    *(void *)(v0 + 32) = sub_25DB90A20(v7, v8, &v13);
    sub_25DC166F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DB89000, v2, v3, "LocationService:: Got Location as: %s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_17();
  }

  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v10 = *(void *)(v0 + 56);
  uint64_t v11 = *(unsigned __int8 *)(v0 + 25);
  return v9(v10, v11);
}

uint64_t sub_25DC11330()
{
  id v0 = objc_msgSend((id)BiomeLibrary(), sel_Location);
  swift_unknownObjectRelease();
  id v1 = objc_msgSend(v0, sel_Semantic);
  swift_unknownObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_40_1();
  sub_25DC113C0((uint64_t)v1);
  return v2;
}

uint64_t sub_25DC113C0(uint64_t a1)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B377B40);
  os_log_type_t v3 = (void *)swift_allocObject();
  v3[2] = a1;
  v3[3] = sub_25DC11444;
  v3[4] = 0;
  sub_25DC139B0((uint64_t)v5, (uint64_t)(v3 + 5));
  *(void *)(v1 + 16) = v3;
  return v1;
}

void sub_25DC11444(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2) {
    goto LABEL_6;
  }
  id v5 = a2;
  if (!objc_msgSend(v5, sel_starting))
  {

LABEL_6:
    a1 = 0;
    char v7 = 4;
    goto LABEL_7;
  }
  unsigned int v6 = objc_msgSend(v5, sel_userSpecificPlaceType);

  char v7 = 0;
  switch(v6)
  {
    case 1u:
      break;
    case 2u:
      char v7 = 1;
      break;
    case 3u:
      char v7 = 3;
      break;
    case 4u:
      char v7 = 2;
      break;
    default:
      goto LABEL_6;
  }
LABEL_7:
  *(void *)a3 = a1;
  *(unsigned char *)(a3 + 8) = v7;
}

uint64_t SiriSuggestionsIntelligence.LocationService.deinit()
{
  swift_release();
  return v0;
}

uint64_t SiriSuggestionsIntelligence.LocationService.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

BOOL static SiriSuggestionsIntelligence.SemanticLocation.__derived_enum_equals(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  switch(a2)
  {
    case 1:
      if (a4 != 1) {
        goto LABEL_15;
      }
      double v4 = *(double *)&a1;
      double v5 = *(double *)&a3;
      goto LABEL_10;
    case 2:
      if (a4 != 2) {
        goto LABEL_15;
      }
      goto LABEL_9;
    case 3:
      if (a4 == 3) {
        goto LABEL_9;
      }
      goto LABEL_15;
    case 4:
      if (a4 != 4 || a3 != 0) {
        goto LABEL_15;
      }
      BOOL result = 1;
      break;
    default:
      if (a4)
      {
LABEL_15:
        BOOL result = 0;
      }
      else
      {
LABEL_9:
        double v4 = *(double *)&a1;
        double v5 = *(double *)&a3;
LABEL_10:
        BOOL result = v4 == v5;
      }
      break;
  }
  return result;
}

BOOL static SiriSuggestionsIntelligence.SemanticLocationDetails.__derived_struct_equals(_:_:)(double a1, double a2)
{
  return a1 == a2;
}

uint64_t sub_25DC11624(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701670760 && a2 == 0xE400000000000000;
  if (v2 || (sub_25DC16B30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1802661751 && a2 == 0xE400000000000000;
    if (v6 || (sub_25DC16B30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 7174503 && a2 == 0xE300000000000000;
      if (v7 || (sub_25DC16B30() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6C6F6F686373 && a2 == 0xE600000000000000;
        if (v8 || (sub_25DC16B30() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_25DC16B30();
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

uint64_t sub_25DC11804(char a1)
{
  uint64_t result = 1701670760;
  switch(a1)
  {
    case 1:
      uint64_t result = 1802661751;
      break;
    case 2:
      uint64_t result = 7174503;
      break;
    case 3:
      uint64_t result = 0x6C6F6F686373;
      break;
    case 4:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25DC11894()
{
  return sub_25DC11804(*v0);
}

uint64_t sub_25DC1189C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DC11624(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DC118C4(uint64_t a1)
{
  unint64_t v2 = sub_25DC12010();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC11900(uint64_t a1)
{
  unint64_t v2 = sub_25DC12010();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DC1193C(uint64_t a1)
{
  unint64_t v2 = sub_25DC12140();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC11978(uint64_t a1)
{
  unint64_t v2 = sub_25DC12140();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DC119B4(uint64_t a1)
{
  unint64_t v2 = sub_25DC121D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC119F0(uint64_t a1)
{
  unint64_t v2 = sub_25DC121D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DC11A2C(uint64_t a1)
{
  unint64_t v2 = sub_25DC120A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC11A68(uint64_t a1)
{
  unint64_t v2 = sub_25DC120A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DC11AA4(uint64_t a1)
{
  unint64_t v2 = sub_25DC1205C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC11AE0(uint64_t a1)
{
  unint64_t v2 = sub_25DC1205C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DC11B1C(uint64_t a1)
{
  unint64_t v2 = sub_25DC1218C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC11B58(uint64_t a1)
{
  unint64_t v2 = sub_25DC1218C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSuggestionsIntelligence.SemanticLocation.encode(to:)(void *a1, uint64_t a2, char a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B378170);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B378168);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_2();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B378140);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_5();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B378158);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B378150);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B378138);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_23_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DC12010();
  sub_25DC16C40();
  switch(a3)
  {
    case 1:
      sub_25DC1218C();
      OUTLINED_FUNCTION_19_6();
      OUTLINED_FUNCTION_60_0();
      sub_25DC16AC0();
      goto LABEL_6;
    case 2:
      sub_25DC12140();
      OUTLINED_FUNCTION_19_6();
      OUTLINED_FUNCTION_60_0();
      sub_25DC16AC0();
      goto LABEL_6;
    case 3:
      sub_25DC120A8();
      OUTLINED_FUNCTION_19_6();
      OUTLINED_FUNCTION_60_0();
      sub_25DC16AC0();
LABEL_6:
      OUTLINED_FUNCTION_62();
      v11();
      OUTLINED_FUNCTION_58_1();
      goto LABEL_7;
    case 4:
      sub_25DC1205C();
      OUTLINED_FUNCTION_19_6();
      OUTLINED_FUNCTION_62();
      v14();
      OUTLINED_FUNCTION_58_1();
      OUTLINED_FUNCTION_62();
      return v15();
    default:
      sub_25DC121D8();
      sub_25DC16A60();
      OUTLINED_FUNCTION_60_0();
      sub_25DC16AC0();
      OUTLINED_FUNCTION_62();
      v10();
LABEL_7:
      OUTLINED_FUNCTION_62();
      return v12();
  }
}

unint64_t sub_25DC12010()
{
  unint64_t result = qword_26B377D00;
  if (!qword_26B377D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D00);
  }
  return result;
}

unint64_t sub_25DC1205C()
{
  unint64_t result = qword_26B3766B8;
  if (!qword_26B3766B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3766B8);
  }
  return result;
}

unint64_t sub_25DC120A8()
{
  unint64_t result = qword_26A6B3E90;
  if (!qword_26A6B3E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3E90);
  }
  return result;
}

unint64_t sub_25DC120F4()
{
  unint64_t result = qword_26B377E68;
  if (!qword_26B377E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377E68);
  }
  return result;
}

unint64_t sub_25DC12140()
{
  unint64_t result = qword_26A6B3EA0;
  if (!qword_26A6B3EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3EA0);
  }
  return result;
}

unint64_t sub_25DC1218C()
{
  unint64_t result = qword_26A6B3EA8;
  if (!qword_26A6B3EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3EA8);
  }
  return result;
}

unint64_t sub_25DC121D8()
{
  unint64_t result = qword_26B377D30;
  if (!qword_26B377D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D30);
  }
  return result;
}

uint64_t SiriSuggestionsIntelligence.SemanticLocation.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3EB8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3EC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3EC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3ED0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3ED8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_5();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6B3EE0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_23_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DC12010();
  sub_25DC16C30();
  if (v36) {
    goto LABEL_9;
  }
  uint64_t v37 = v10;
  uint64_t v12 = sub_25DC16A50();
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v14 = v8;
  if (!v13)
  {
LABEL_8:
    uint64_t v10 = sub_25DC16860();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3140);
    void *v22 = &type metadata for SiriSuggestionsIntelligence.SemanticLocation;
    sub_25DC169E0();
    sub_25DC16850();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v10);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v1, v14);
LABEL_9:
    uint64_t v23 = (uint64_t)a1;
    goto LABEL_10;
  }
  uint64_t v15 = v8;
  uint64_t v16 = *(unsigned __int8 *)(v12 + 32);
  sub_25DBAF3C4(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  uint64_t v18 = v17;
  unint64_t v20 = v19;
  swift_bridgeObjectRelease();
  if (v18 != v20 >> 1)
  {
    uint64_t v14 = v15;
    goto LABEL_8;
  }
  switch(v16)
  {
    case 1:
      LOBYTE(v38) = 1;
      sub_25DC1218C();
      sub_25DC169D0();
      sub_25DC12FB4();
      OUTLINED_FUNCTION_35_1();
      OUTLINED_FUNCTION_62();
      v33();
      swift_unknownObjectRelease();
      uint64_t v34 = OUTLINED_FUNCTION_41_1();
      v35(v34);
      goto LABEL_16;
    case 2:
      LOBYTE(v38) = 2;
      sub_25DC12140();
      OUTLINED_FUNCTION_23_6();
      sub_25DC12FB4();
      OUTLINED_FUNCTION_35_1();
      goto LABEL_15;
    case 3:
      LOBYTE(v38) = 3;
      sub_25DC120A8();
      OUTLINED_FUNCTION_23_6();
      sub_25DC12FB4();
      sub_25DC16A40();
      OUTLINED_FUNCTION_62();
      v30();
      swift_unknownObjectRelease();
      uint64_t v31 = OUTLINED_FUNCTION_12_10();
      v32(v31);
      uint64_t v10 = v38;
      uint64_t v23 = (uint64_t)a1;
      break;
    case 4:
      sub_25DC1205C();
      OUTLINED_FUNCTION_23_6();
      OUTLINED_FUNCTION_62();
      v25();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_62();
      v26();
      uint64_t v10 = 0;
      goto LABEL_17;
    default:
      LOBYTE(v38) = 0;
      sub_25DC121D8();
      OUTLINED_FUNCTION_23_6();
      sub_25DC12FB4();
      OUTLINED_FUNCTION_35_1();
LABEL_15:
      OUTLINED_FUNCTION_62();
      v27();
      swift_unknownObjectRelease();
      uint64_t v28 = OUTLINED_FUNCTION_12_10();
      v29(v28);
LABEL_16:
      uint64_t v10 = v38;
LABEL_17:
      uint64_t v23 = (uint64_t)a1;
      break;
  }
LABEL_10:
  __swift_destroy_boxed_opaque_existential_0(v23);
  return v10;
}

uint64_t sub_25DC12984(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D69547472617473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25DC16B30();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25DC12A18()
{
  return 0x6D69547472617473;
}

uint64_t sub_25DC12A34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SiriSuggestionsIntelligence.SemanticLocation.init(from:)(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_25DC12A64(void *a1)
{
  return SiriSuggestionsIntelligence.SemanticLocation.encode(to:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

BOOL sub_25DC12A84(uint64_t a1, uint64_t a2)
{
  return static SiriSuggestionsIntelligence.SemanticLocation.__derived_enum_equals(_:_:)(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_25DC12AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DC12984(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25DC12ACC(uint64_t a1)
{
  unint64_t v2 = sub_25DC13000();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DC12B08(uint64_t a1)
{
  unint64_t v2 = sub_25DC13000();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSuggestionsIntelligence.SemanticLocationDetails.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3781A8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DC13000();
  sub_25DC16C40();
  sub_25DC16AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

double SiriSuggestionsIntelligence.SemanticLocationDetails.init(from:)(void *a1)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B3EF8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DC13000();
  sub_25DC16C30();
  if (!v1)
  {
    sub_25DC16A20();
    double v3 = v9;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

void sub_25DC12D60(void *a1@<X0>, double *a2@<X8>)
{
  double v4 = SiriSuggestionsIntelligence.SemanticLocationDetails.init(from:)(a1);
  if (!v2) {
    *a2 = v4;
  }
}

uint64_t sub_25DC12D8C(void *a1)
{
  return SiriSuggestionsIntelligence.SemanticLocationDetails.encode(to:)(a1);
}

BOOL sub_25DC12DA8(double *a1, double *a2)
{
  return static SiriSuggestionsIntelligence.SemanticLocationDetails.__derived_struct_equals(_:_:)(*a1, *a2);
}

id sub_25DC12DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_25DC157F0();
  uint64_t v13 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) != 1)
  {
    uint64_t v13 = (void *)sub_25DC157A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (__swift_getEnumTagSinglePayload(a2, 1, v12) == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (void *)sub_25DC157A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_25DC12EF0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_25DC10F14(a1, (uint64_t)v4);
  return sub_25DBB9254((uint64_t)v4, a2);
}

uint64_t sub_25DC12F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_25DC10F5C(a1, a2, a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6;
  return result;
}

uint64_t sub_25DC12F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = sub_25DC10F98(a1, a2, a3);
  *a4 = result;
  a4[1] = v6;
  a4[2] = v7;
  a4[3] = v8;
  return result;
}

uint64_t sub_25DC12F84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_25DC10F5C(a1, a2, a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

unint64_t sub_25DC12FB4()
{
  unint64_t result = qword_26A6B3EF0;
  if (!qword_26A6B3EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3EF0);
  }
  return result;
}

unint64_t sub_25DC13000()
{
  unint64_t result = qword_26B377E50;
  if (!qword_26B377E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377E50);
  }
  return result;
}

uint64_t type metadata accessor for SiriSuggestionsIntelligence.LocationService()
{
  return self;
}

uint64_t _s16SemanticLocationOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 4) {
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

uint64_t _s16SemanticLocationOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25DC130F4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_25DC1310C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)unint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriSuggestionsIntelligence.SemanticLocation()
{
  return &type metadata for SiriSuggestionsIntelligence.SemanticLocation;
}

ValueMetadata *type metadata accessor for SiriSuggestionsIntelligence.SemanticLocationDetails()
{
  return &type metadata for SiriSuggestionsIntelligence.SemanticLocationDetails;
}

ValueMetadata *_s23SemanticLocationDetailsV10CodingKeysOMa()
{
  return &_s23SemanticLocationDetailsV10CodingKeysON;
}

unsigned char *_s16SemanticLocationO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DC13224);
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

ValueMetadata *_s16SemanticLocationO10CodingKeysOMa()
{
  return &_s16SemanticLocationO10CodingKeysON;
}

ValueMetadata *_s16SemanticLocationO14HomeCodingKeysOMa()
{
  return &_s16SemanticLocationO14HomeCodingKeysON;
}

ValueMetadata *_s16SemanticLocationO14WorkCodingKeysOMa()
{
  return &_s16SemanticLocationO14WorkCodingKeysON;
}

ValueMetadata *_s16SemanticLocationO13GymCodingKeysOMa()
{
  return &_s16SemanticLocationO13GymCodingKeysON;
}

unsigned char *_s23SemanticLocationDetailsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25DC13328);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s16SemanticLocationO16SchoolCodingKeysOMa()
{
  return &_s16SemanticLocationO16SchoolCodingKeysON;
}

ValueMetadata *_s16SemanticLocationO17UnknownCodingKeysOMa()
{
  return &_s16SemanticLocationO17UnknownCodingKeysON;
}

unint64_t sub_25DC13374()
{
  unint64_t result = qword_26A6B3F00;
  if (!qword_26A6B3F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3F00);
  }
  return result;
}

unint64_t sub_25DC133C4()
{
  unint64_t result = qword_26A6B3F08;
  if (!qword_26A6B3F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3F08);
  }
  return result;
}

unint64_t sub_25DC13414()
{
  unint64_t result = qword_26A6B3F10;
  if (!qword_26A6B3F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3F10);
  }
  return result;
}

unint64_t sub_25DC13464()
{
  unint64_t result = qword_26A6B3F18;
  if (!qword_26A6B3F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3F18);
  }
  return result;
}

unint64_t sub_25DC134B4()
{
  unint64_t result = qword_26A6B3F20;
  if (!qword_26A6B3F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B3F20);
  }
  return result;
}

unint64_t sub_25DC13504()
{
  unint64_t result = qword_26A6B3F28;
  if (!qword_26A6B3F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A6B3F28);
  }
  return result;
}

unint64_t sub_25DC13554()
{
  unint64_t result = qword_26B377E60;
  if (!qword_26B377E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377E60);
  }
  return result;
}

unint64_t sub_25DC135A4()
{
  unint64_t result = qword_26B377E58;
  if (!qword_26B377E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377E58);
  }
  return result;
}

unint64_t sub_25DC135F4()
{
  unint64_t result = qword_26B377D40;
  if (!qword_26B377D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D40);
  }
  return result;
}

unint64_t sub_25DC13644()
{
  unint64_t result = qword_26B377D38;
  if (!qword_26B377D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D38);
  }
  return result;
}

unint64_t sub_25DC13694()
{
  unint64_t result = qword_26B377D50;
  if (!qword_26B377D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D50);
  }
  return result;
}

unint64_t sub_25DC136E4()
{
  unint64_t result = qword_26B377D48;
  if (!qword_26B377D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D48);
  }
  return result;
}

unint64_t sub_25DC13734()
{
  unint64_t result = qword_26B377D20;
  if (!qword_26B377D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D20);
  }
  return result;
}

unint64_t sub_25DC13784()
{
  unint64_t result = qword_26B377D18;
  if (!qword_26B377D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D18);
  }
  return result;
}

unint64_t sub_25DC137D4()
{
  unint64_t result = qword_26B377D60;
  if (!qword_26B377D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D60);
  }
  return result;
}

unint64_t sub_25DC13824()
{
  unint64_t result = qword_26B377D58;
  if (!qword_26B377D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D58);
  }
  return result;
}

unint64_t sub_25DC13874()
{
  unint64_t result = qword_26B377D70;
  if (!qword_26B377D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D70);
  }
  return result;
}

unint64_t sub_25DC138C4()
{
  unint64_t result = qword_26B377D68;
  if (!qword_26B377D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D68);
  }
  return result;
}

unint64_t sub_25DC13914()
{
  unint64_t result = qword_26B377D10;
  if (!qword_26B377D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D10);
  }
  return result;
}

unint64_t sub_25DC13964()
{
  unint64_t result = qword_26B377D08;
  if (!qword_26B377D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B377D08);
  }
  return result;
}

uint64_t sub_25DC139B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B378720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DC13A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25DC12F2C(a1, a2, v3, a3);
}

uint64_t sub_25DC13A20()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DC13A58()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25DC13A68(uint64_t a1)
{
  sub_25DC0EF7C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25DC13A74()
{
  return objectdestroy_48Tm(&qword_26B377F98);
}

void sub_25DC13A80(uint64_t a1)
{
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

uint64_t sub_25DC13AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25DC12F84(a1, a2, v3, a3);
}

void sub_25DC13AC8(uint64_t a1)
{
  sub_25DC0ECD0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25DC13AD4()
{
  return objectdestroy_48Tm(&qword_26B377FA0);
}

void sub_25DC13AE0(uint64_t a1)
{
}

void sub_25DC13B04(uint64_t a1, uint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_27_4(v10);
  OUTLINED_FUNCTION_44_1();
  sub_25DC0FFA8(a1, v11, v12, v13, v14, a3, a4, a2, a5);
}

uint64_t sub_25DC13B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25DC12F58(a1, a2, v3, a3);
}

void sub_25DC13B84(uint64_t a1)
{
  sub_25DC0EA24(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25DC13B90()
{
  return objectdestroy_48Tm(&qword_26B377FA8);
}

uint64_t sub_25DC13B9C(uint64_t a1)
{
  return sub_25DC13D78(a1, &qword_26B377FA8, (uint64_t (*)(uint64_t))sub_25DC0FB28);
}

void sub_25DC13BC0(uint64_t a1)
{
  sub_25DC0E778(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25DC13BCC()
{
  return objectdestroy_48Tm(&qword_26B377F90);
}

uint64_t sub_25DC13BD8(uint64_t a1)
{
  return sub_25DC13D78(a1, &qword_26B377F90, (uint64_t (*)(uint64_t))sub_25DC0F6A8);
}

void sub_25DC13BFC(void *a1)
{
  sub_25DC10418(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25DC13C18@<X0>(uint64_t a1@<X8>)
{
  return sub_25DC12EF0(v1, a1);
}

uint64_t sub_25DC13C20(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_62();
  v3();
  return a1;
}

void sub_25DC13C78(uint64_t a1)
{
  sub_25DC0E4CC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25DC13C84()
{
  return objectdestroy_48Tm(&qword_26B377F88);
}

uint64_t objectdestroy_48Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  swift_release();
  swift_release();

  swift_release();
  if (*(void *)(v1 + 80)) {
    __swift_destroy_boxed_opaque_existential_0(v1 + 56);
  }
  uint64_t v8 = v5 | 7;
  uint64_t v9 = (v5 + 96) & ~v5;
  uint64_t v10 = v9 + v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v9, v2);

  return MEMORY[0x270FA0238](v1, v10, v8);
}

uint64_t sub_25DC13D58(uint64_t a1)
{
  return sub_25DC13D78(a1, &qword_26B377F88, (uint64_t (*)(uint64_t))sub_25DC0F228);
}

uint64_t sub_25DC13D78(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_27_4(v4);
  OUTLINED_FUNCTION_44_1();

  return a3(a1);
}

uint64_t objectdestroy_51Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_27()
{
  sub_25DB92BB4(v1, (uint64_t)v0);
  __swift_project_boxed_opaque_existential_1(v0, *(void *)(v2 + 144));
  return sub_25DC16050();
}

id OUTLINED_FUNCTION_5_18()
{
  return sub_25DC12DB4(v0, v1, 1, 1, 0);
}

uint64_t OUTLINED_FUNCTION_9_11(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  return v1 + 24;
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_13(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_16_11()
{
  return sub_25DC157F0();
}

uint64_t OUTLINED_FUNCTION_18_10()
{
  *(_WORD *)(v1 + 12) = 2080;
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_19_6()
{
  return sub_25DC16A60();
}

id OUTLINED_FUNCTION_20_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  return *(void *)(v0 + 80) + 40;
}

void OUTLINED_FUNCTION_22_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t OUTLINED_FUNCTION_23_6()
{
  return sub_25DC169D0();
}

uint64_t OUTLINED_FUNCTION_24_7()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_4(uint64_t a1)
{
  return a1 - 8;
}

void *OUTLINED_FUNCTION_28_3(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v15 + 264) = result;
  result[2] = v14;
  result[3] = v17;
  result[4] = a14;
  result[5] = v16;
  return result;
}

uint64_t OUTLINED_FUNCTION_29_4(uint64_t a1)
{
  *(void *)(v1 + 184) = a1;
  return sub_25DC166F0();
}

uint64_t OUTLINED_FUNCTION_30_4(uint64_t a1)
{
  *(void *)(v1 + 176) = a1;
  return sub_25DC166F0();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_34_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return sub_25DB90A20(v6, v7, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return sub_25DC16A40();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_38_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25DB93850(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_49_1(uint64_t result)
{
  *(void *)(v1 + 272) = result;
  return result;
}

id OUTLINED_FUNCTION_50_1(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_51_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25DB93850(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  __swift_destroy_boxed_opaque_existential_0(v0);
  return sub_25DC157F0();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_25DC161C0();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return sub_25DC162E0();
}

uint64_t OUTLINED_FUNCTION_57_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

unint64_t OUTLINED_FUNCTION_60_0()
{
  *(void *)(v0 - 72) = *(void *)(v0 - 120);
  return sub_25DC120F4();
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_0(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

void OUTLINED_FUNCTION_64_0()
{
  uint64_t v2 = *(void **)(v0 + 256);
}

void OUTLINED_FUNCTION_65_0()
{
  *(void *)(v0 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25DB93850(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_68_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25DB93850(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  return sub_25DB90A20(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_70_0(float a1)
{
  *uint64_t v1 = a1;
}

void OUTLINED_FUNCTION_72_0()
{
}

uint64_t sub_25DC144B4()
{
  return sub_25DC15310((uint64_t)&unk_270AA68E0);
}

id sub_25DC144C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_2_20() & 1) != 0)
  {
    uint64_t v5 = v2 + 2;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v7 = a1 == 0x646F4D7375636F66 && a2 == 0xE900000000000065;
  if (v7 || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 3;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_2_20() & 1) != 0)
  {
    uint64_t v5 = v2 + 4;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v8 = a1 == 0x6144664F656D6974 && a2 == 0xE900000000000079;
  if (v8 || (OUTLINED_FUNCTION_5_19(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 5;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v9 = a1 == 0x69726550656D6974 && a2 == 0xEA0000000000646FLL;
  if (v9 || (OUTLINED_FUNCTION_5_19(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 6;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v10 = a1 == 0x616C707269417369 && a2 == 0xEE0065646F4D656ELL;
  if (v10 || (OUTLINED_FUNCTION_4_18(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 7;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000014 && (OUTLINED_FUNCTION_1_24(), v7)
    || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 8;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v11 = a1 == 0x507261436E497369 && a2 == 0xEB0000000079616CLL;
  if (v11 || (OUTLINED_FUNCTION_4_18(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 9;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v12 = a1 == 0x7373615041736168 && a2 == 0xEC00000065646F63;
  if (v12 || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 10;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000013 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 11;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v13 = a1 == 0x774F746567726174 && a2 == 0xEB0000000072656ELL;
  if (v13 || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 12;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD00000000000001ALL && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 13;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000010 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 14;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v14 = a1 == 0x656557664F796164 && a2 == 0xE90000000000006BLL;
  if (v14 || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 15;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000016 && (OUTLINED_FUNCTION_1_24(), v7)
    || (OUTLINED_FUNCTION_178(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 16;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000015 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 17;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_2_20() & 1) != 0)
  {
    uint64_t v5 = v2 + 18;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000016 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 19;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000012 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 20;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000014 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 21;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD00000000000001BLL && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 22;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  if (a1 == 0xD000000000000017 && (OUTLINED_FUNCTION_1_24(), v7) || (OUTLINED_FUNCTION_0_12() & 1) != 0)
  {
    uint64_t v5 = v2 + 23;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  BOOL v15 = a1 == 0x3378327369 && a2 == 0xE500000000000000;
  if (v15 || (OUTLINED_FUNCTION_4_18(), (sub_25DC16B30() & 1) != 0))
  {
    uint64_t v5 = v2 + 24;
    return objc_msgSend(self, sel_featureValueWithDouble_, *v5);
  }
  return 0;
}

uint64_t sub_25DC14AAC(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, long long a19, long long a20,long long a21,long long a22,long long a23,uint64_t a24)
{
  uint64_t result = v24;
  *(double *)(v24 + 16) = a1;
  *(double *)(v24 + 24) = a2;
  *(double *)(v24 + 32) = a3;
  *(double *)(v24 + 40) = a4;
  *(double *)(v24 + 48) = a5;
  *(double *)(v24 + 56) = a6;
  *(double *)(v24 + 64) = a7;
  *(double *)(v24 + 72) = a8;
  *(_OWORD *)(v24 + 80) = a17;
  *(_OWORD *)(v24 + 96) = a18;
  *(_OWORD *)(v24 + 112) = a19;
  *(_OWORD *)(v24 + 128) = a20;
  *(_OWORD *)(v24 + 144) = a21;
  *(_OWORD *)(v24 + 160) = a22;
  *(_OWORD *)(v24 + 176) = a23;
  *(void *)(v24 + 192) = a24;
  return result;
}

uint64_t sub_25DC14AEC()
{
  return MEMORY[0x270FA0228](v0, 200, 7);
}

uint64_t type metadata accessor for RandomForestInput()
{
  return self;
}

void sub_25DC14B20()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_25DC16290();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (v3)
  {
    objc_msgSend(v3, sel_int64Value);
  }
  else
  {
    __break(1u);
  }
}

void sub_25DC14BA0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_25DC16290();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_dictionaryValue);

    sub_25DBE6C30();
    uint64_t v5 = sub_25DC161F0();

    sub_25DC14C70(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25DC14C70(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6B3FA0);
    uint64_t v2 = sub_25DC16990();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  sub_25DC154E4(a1, v17);
  uint64_t v3 = v17[0];
  uint64_t v4 = v17[1];
  uint64_t v5 = v17[3];
  unint64_t v6 = v17[4];
  int64_t v7 = (unint64_t)(v17[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  if (!v6)
  {
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 < v7)
    {
      unint64_t v11 = *(void *)(v4 + 8 * v10);
      int64_t v12 = v5 + 1;
      if (v11) {
        goto LABEL_21;
      }
      int64_t v12 = v5 + 2;
      if (v5 + 2 < v7)
      {
        unint64_t v11 = *(void *)(v4 + 8 * v12);
        if (v11) {
          goto LABEL_21;
        }
        int64_t v12 = v5 + 3;
        if (v5 + 3 < v7)
        {
          unint64_t v11 = *(void *)(v4 + 8 * v12);
          if (v11) {
            goto LABEL_21;
          }
          int64_t v12 = v5 + 4;
          if (v5 + 4 < v7)
          {
            unint64_t v11 = *(void *)(v4 + 8 * v12);
            if (v11) {
              goto LABEL_21;
            }
            int64_t v12 = v5 + 5;
            if (v5 + 5 < v7)
            {
              unint64_t v11 = *(void *)(v4 + 8 * v12);
              if (!v11)
              {
                int64_t v13 = v5 + 6;
                while (v13 < v7)
                {
                  unint64_t v11 = *(void *)(v4 + 8 * v13++);
                  if (v11)
                  {
                    int64_t v12 = v13 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_23;
              }
LABEL_21:
              unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
              goto LABEL_22;
            }
          }
        }
      }
    }
LABEL_23:
    swift_release();
    sub_25DBABF4C();
    return v2;
  }
  unint64_t v9 = __clz(__rbit64(v6)) | (v5 << 6);
LABEL_22:
  sub_25DBF5AB4(*(void *)(v3 + 48) + 40 * v9, (uint64_t)&v15);
  id v16 = *(id *)(*(void *)(v3 + 56) + 8 * v9);
  id v14 = v16;
  swift_dynamicCast();
  v14;
  uint64_t result = MEMORY[0x2611BFE70]();
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25DC14FD8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_featureNames);
  uint64_t v2 = sub_25DC165F0();

  return v2;
}

id sub_25DC15030()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_25DC16290();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  return v3;
}

id sub_25DC15098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_25DC162C0();
  uint64_t v7 = v6;
  swift_retain();
  BOOL v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t sub_25DC15114()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for RandomForestOutput()
{
  return self;
}

uint64_t sub_25DC15170(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00DC8]), sel_init);
  uint64_t v3 = sub_25DC151DC(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_25DC151DC(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for RandomForestOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_25DC156D0();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_25DC152B4()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for RandomForest()
{
  return self;
}

uint64_t sub_25DC15310(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B30F8);
  uint64_t result = sub_25DC167D0();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    id v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_25DC16BE0();
    swift_bridgeObjectRetain();
    sub_25DC16310();
    uint64_t result = sub_25DC16C20();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      long long v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_25DC16B30(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_25DC16B30();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    unint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *unint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25DC154E4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t OUTLINED_FUNCTION_0_12()
{
  return sub_25DC16B30();
}

uint64_t OUTLINED_FUNCTION_2_20()
{
  return sub_25DC16B30();
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return v0;
}

uint64_t sub_25DC155A0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25DC155B0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25DC155C0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25DC155D0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25DC155E0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25DC155F0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25DC15600()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_25DC15610()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_25DC15620()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_25DC15630()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_25DC15640()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25DC15650()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25DC15660()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25DC15670()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25DC15680()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_25DC15690()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25DC156A0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25DC156B0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25DC156C0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25DC156D0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25DC156E0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25DC156F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25DC15700()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25DC15710()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25DC15720()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25DC15730()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25DC15740()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_25DC15750()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25DC15760()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25DC15770()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25DC15780()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_25DC15790()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25DC157A0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25DC157B0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25DC157C0()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_25DC157D0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25DC157E0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25DC157F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25DC15800()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25DC15810()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25DC15820()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25DC15830()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25DC15840()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_25DC15850()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25DC15860()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25DC15870()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_25DC15880()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25DC15890()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25DC158A0()
{
  return MEMORY[0x270F70B38]();
}

uint64_t sub_25DC158B0()
{
  return MEMORY[0x270F70B50]();
}

uint64_t sub_25DC158C0()
{
  return MEMORY[0x270F70B58]();
}

uint64_t sub_25DC158D0()
{
  return MEMORY[0x270F70B68]();
}

uint64_t sub_25DC158E0()
{
  return MEMORY[0x270F70B78]();
}

uint64_t sub_25DC158F0()
{
  return MEMORY[0x270F70B90]();
}

uint64_t sub_25DC15900()
{
  return MEMORY[0x270F70B98]();
}

uint64_t sub_25DC15910()
{
  return MEMORY[0x270F70BA8]();
}

uint64_t sub_25DC15920()
{
  return MEMORY[0x270F70BC0]();
}

uint64_t sub_25DC15930()
{
  return MEMORY[0x270F70BD8]();
}

uint64_t sub_25DC15940()
{
  return MEMORY[0x270F70C38]();
}

uint64_t sub_25DC15950()
{
  return MEMORY[0x270F70C68]();
}

uint64_t sub_25DC15960()
{
  return MEMORY[0x270F70C70]();
}

uint64_t sub_25DC15970()
{
  return MEMORY[0x270F70C88]();
}

uint64_t sub_25DC15980()
{
  return MEMORY[0x270F70C98]();
}

uint64_t sub_25DC15990()
{
  return MEMORY[0x270F70CA0]();
}

uint64_t sub_25DC159A0()
{
  return MEMORY[0x270F70CB8]();
}

uint64_t sub_25DC159B0()
{
  return MEMORY[0x270F70CD0]();
}

uint64_t sub_25DC159C0()
{
  return MEMORY[0x270F70CE8]();
}

uint64_t sub_25DC159D0()
{
  return MEMORY[0x270F70CF0]();
}

uint64_t sub_25DC159E0()
{
  return MEMORY[0x270F70D10]();
}

uint64_t sub_25DC159F0()
{
  return MEMORY[0x270F70D20]();
}

uint64_t sub_25DC15A00()
{
  return MEMORY[0x270F70D28]();
}

uint64_t sub_25DC15A10()
{
  return MEMORY[0x270F70D30]();
}

uint64_t sub_25DC15A20()
{
  return MEMORY[0x270F70D38]();
}

uint64_t sub_25DC15A30()
{
  return MEMORY[0x270F70D40]();
}

uint64_t sub_25DC15A40()
{
  return MEMORY[0x270F70D60]();
}

uint64_t sub_25DC15A50()
{
  return MEMORY[0x270F70D80]();
}

uint64_t sub_25DC15A60()
{
  return MEMORY[0x270F70D90]();
}

uint64_t sub_25DC15A70()
{
  return MEMORY[0x270F70D98]();
}

uint64_t sub_25DC15A80()
{
  return MEMORY[0x270F70DA0]();
}

uint64_t sub_25DC15A90()
{
  return MEMORY[0x270F70DA8]();
}

uint64_t sub_25DC15AA0()
{
  return MEMORY[0x270F70DB0]();
}

uint64_t sub_25DC15AB0()
{
  return MEMORY[0x270F70DC8]();
}

uint64_t sub_25DC15AC0()
{
  return MEMORY[0x270F70DD8]();
}

uint64_t sub_25DC15AD0()
{
  return MEMORY[0x270F70DE0]();
}

uint64_t sub_25DC15AE0()
{
  return MEMORY[0x270F70DE8]();
}

uint64_t sub_25DC15AF0()
{
  return MEMORY[0x270F70DF0]();
}

uint64_t sub_25DC15B00()
{
  return MEMORY[0x270F72900]();
}

uint64_t sub_25DC15B10()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_25DC15B20()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25DC15B40()
{
  return MEMORY[0x270F72B08]();
}

uint64_t sub_25DC15B50()
{
  return MEMORY[0x270F72B10]();
}

uint64_t sub_25DC15B60()
{
  return MEMORY[0x270F72B18]();
}

uint64_t sub_25DC15B70()
{
  return MEMORY[0x270F72BF0]();
}

uint64_t sub_25DC15B80()
{
  return MEMORY[0x270F72BF8]();
}

uint64_t sub_25DC15B90()
{
  return MEMORY[0x270F72C08]();
}

uint64_t sub_25DC15BA0()
{
  return MEMORY[0x270F72C10]();
}

uint64_t sub_25DC15BB0()
{
  return MEMORY[0x270F72C18]();
}

uint64_t sub_25DC15BC0()
{
  return MEMORY[0x270F728A0]();
}

uint64_t sub_25DC15BD0()
{
  return MEMORY[0x270F728A8]();
}

uint64_t sub_25DC15BE0()
{
  return MEMORY[0x270F728B0]();
}

uint64_t sub_25DC15BF0()
{
  return MEMORY[0x270F728B8]();
}

uint64_t sub_25DC15C00()
{
  return MEMORY[0x270F728C0]();
}

uint64_t sub_25DC15C10()
{
  return MEMORY[0x270F728C8]();
}

uint64_t sub_25DC15C20()
{
  return MEMORY[0x270F728D0]();
}

uint64_t sub_25DC15C30()
{
  return MEMORY[0x270F728D8]();
}

uint64_t sub_25DC15C40()
{
  return MEMORY[0x270F728E0]();
}

uint64_t sub_25DC15C50()
{
  return MEMORY[0x270F715D0]();
}

uint64_t sub_25DC15C70()
{
  return MEMORY[0x270F715E0]();
}

uint64_t sub_25DC15C80()
{
  return MEMORY[0x270F715E8]();
}

uint64_t sub_25DC15C90()
{
  return MEMORY[0x270F715F0]();
}

uint64_t sub_25DC15CA0()
{
  return MEMORY[0x270F715F8]();
}

uint64_t sub_25DC15CB0()
{
  return MEMORY[0x270F71600]();
}

uint64_t sub_25DC15CC0()
{
  return MEMORY[0x270F71608]();
}

uint64_t sub_25DC15CD0()
{
  return MEMORY[0x270F71610]();
}

uint64_t sub_25DC15CE0()
{
  return MEMORY[0x270F71618]();
}

uint64_t sub_25DC15CF0()
{
  return MEMORY[0x270F71620]();
}

uint64_t sub_25DC15D20()
{
  return MEMORY[0x270F71638]();
}

uint64_t sub_25DC15D30()
{
  return MEMORY[0x270F717F8]();
}

uint64_t sub_25DC15D40()
{
  return MEMORY[0x270F71800]();
}

uint64_t sub_25DC15D50()
{
  return MEMORY[0x270F71808]();
}

uint64_t sub_25DC15D60()
{
  return MEMORY[0x270F71810]();
}

uint64_t sub_25DC15D70()
{
  return MEMORY[0x270F71818]();
}

uint64_t sub_25DC15D80()
{
  return MEMORY[0x270F71820]();
}

uint64_t sub_25DC15D90()
{
  return MEMORY[0x270F71720]();
}

uint64_t sub_25DC15DA0()
{
  return MEMORY[0x270F71730]();
}

uint64_t sub_25DC15DB0()
{
  return MEMORY[0x270F71738]();
}

uint64_t sub_25DC15DC0()
{
  return MEMORY[0x270F71740]();
}

uint64_t sub_25DC15DD0()
{
  return MEMORY[0x270F71748]();
}

uint64_t sub_25DC15DE0()
{
  return MEMORY[0x270F71750]();
}

uint64_t sub_25DC15DF0()
{
  return MEMORY[0x270F71758]();
}

uint64_t sub_25DC15E00()
{
  return MEMORY[0x270F71788]();
}

uint64_t sub_25DC15E10()
{
  return MEMORY[0x270F71790]();
}

uint64_t sub_25DC15E20()
{
  return MEMORY[0x270F71798]();
}

uint64_t sub_25DC15E30()
{
  return MEMORY[0x270F717A0]();
}

uint64_t sub_25DC15E40()
{
  return MEMORY[0x270F71890]();
}

uint64_t sub_25DC15E50()
{
  return MEMORY[0x270F718C0]();
}

uint64_t sub_25DC15E70()
{
  return MEMORY[0x270F71918]();
}

uint64_t sub_25DC15E80()
{
  return MEMORY[0x270F71920]();
}

uint64_t sub_25DC15E90()
{
  return MEMORY[0x270F71990]();
}

uint64_t sub_25DC15EA0()
{
  return MEMORY[0x270F719E8]();
}

uint64_t sub_25DC15EB0()
{
  return MEMORY[0x270F71A10]();
}

uint64_t sub_25DC15EC0()
{
  return MEMORY[0x270F71A18]();
}

uint64_t sub_25DC15ED0()
{
  return MEMORY[0x270F71A30]();
}

uint64_t sub_25DC15EE0()
{
  return MEMORY[0x270F71A38]();
}

uint64_t sub_25DC15EF0()
{
  return MEMORY[0x270F71A40]();
}

uint64_t sub_25DC15F10()
{
  return MEMORY[0x270F71A60]();
}

uint64_t sub_25DC15F20()
{
  return MEMORY[0x270F71A68]();
}

uint64_t sub_25DC15F30()
{
  return MEMORY[0x270F71A70]();
}

uint64_t sub_25DC15F40()
{
  return MEMORY[0x270F71B08]();
}

uint64_t sub_25DC15F50()
{
  return MEMORY[0x270F71B10]();
}

uint64_t sub_25DC15F60()
{
  return MEMORY[0x270F71B30]();
}

uint64_t sub_25DC15F70()
{
  return MEMORY[0x270F71B48]();
}

uint64_t sub_25DC15F80()
{
  return MEMORY[0x270F71B50]();
}

uint64_t sub_25DC15FA0()
{
  return MEMORY[0x270F71B60]();
}

uint64_t sub_25DC15FB0()
{
  return MEMORY[0x270F71B68]();
}

uint64_t sub_25DC15FC0()
{
  return MEMORY[0x270F71B70]();
}

uint64_t sub_25DC15FD0()
{
  return MEMORY[0x270F71B78]();
}

uint64_t sub_25DC15FE0()
{
  return MEMORY[0x270F71B80]();
}

uint64_t sub_25DC15FF0()
{
  return MEMORY[0x270F71BD8]();
}

uint64_t sub_25DC16000()
{
  return MEMORY[0x270F71BF8]();
}

uint64_t sub_25DC16010()
{
  return MEMORY[0x270F71C00]();
}

uint64_t sub_25DC16020()
{
  return MEMORY[0x270F71C48]();
}

uint64_t sub_25DC16030()
{
  return MEMORY[0x270F71C68]();
}

uint64_t sub_25DC16040()
{
  return MEMORY[0x270F71C70]();
}

uint64_t sub_25DC16050()
{
  return MEMORY[0x270F71C90]();
}

uint64_t sub_25DC16060()
{
  return MEMORY[0x270F71CA8]();
}

uint64_t sub_25DC16070()
{
  return MEMORY[0x270F71CB8]();
}

uint64_t sub_25DC16080()
{
  return MEMORY[0x270F71CD8]();
}

uint64_t sub_25DC16090()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_25DC160A0()
{
  return MEMORY[0x270F71D08]();
}

uint64_t sub_25DC160B0()
{
  return MEMORY[0x270F71D10]();
}

uint64_t sub_25DC160C0()
{
  return MEMORY[0x270F717A8]();
}

uint64_t sub_25DC160D0()
{
  return MEMORY[0x270F71D20]();
}

uint64_t sub_25DC160E0()
{
  return MEMORY[0x270F71D28]();
}

uint64_t sub_25DC160F0()
{
  return MEMORY[0x270F71D30]();
}

uint64_t sub_25DC16100()
{
  return MEMORY[0x270F71D38]();
}

uint64_t sub_25DC16110()
{
  return MEMORY[0x270F71D40]();
}

uint64_t sub_25DC16120()
{
  return MEMORY[0x270F71D48]();
}

uint64_t sub_25DC16130()
{
  return MEMORY[0x270F71D50]();
}

uint64_t sub_25DC16150()
{
  return MEMORY[0x270F71DB8]();
}

uint64_t sub_25DC16160()
{
  return MEMORY[0x270F71DE0]();
}

uint64_t sub_25DC16170()
{
  return MEMORY[0x270F71DE8]();
}

uint64_t sub_25DC16180()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25DC16190()
{
  return MEMORY[0x270F71DF8]();
}

uint64_t sub_25DC161A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DC161B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25DC161C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DC161D0()
{
  return MEMORY[0x270F9D018]();
}

uint64_t sub_25DC161E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25DC161F0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25DC16200()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25DC16210()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25DC16220()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_25DC16230()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25DC16240()
{
  return MEMORY[0x270F41EB8]();
}

uint64_t sub_25DC16250()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25DC16260()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25DC16270()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25DC16280()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25DC16290()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DC162A0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25DC162B0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25DC162C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DC162D0()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_25DC162E0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DC162F0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25DC16300()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25DC16310()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DC16320()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25DC16330()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DC16340()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25DC16350()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25DC16370()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25DC16380()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25DC16390()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25DC163A0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25DC163B0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25DC163D0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25DC163E0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_25DC163F0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25DC16400()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25DC16410()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25DC16420()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25DC16430()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25DC16440()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25DC16450()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25DC16460()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25DC16470()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25DC16480()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25DC16490()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25DC164A0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25DC164B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25DC164C0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_25DC164D0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25DC164E0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_25DC164F0()
{
  return MEMORY[0x270EF1BC8]();
}

uint64_t sub_25DC16500()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25DC16510()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25DC16520()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25DC16530()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_25DC16540()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25DC16550()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25DC16560()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25DC16570()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_25DC16580()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25DC165A0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_25DC165B0()
{
  return MEMORY[0x270EF1C20]();
}

uint64_t sub_25DC165C0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25DC165D0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25DC165E0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25DC165F0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25DC16600()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25DC16610()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25DC16620()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25DC16630()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25DC16640()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25DC16650()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25DC16660()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_25DC16670()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25DC16680()
{
  return MEMORY[0x270F10C08]();
}

uint64_t sub_25DC16690()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25DC166A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DC166B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DC166C0()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_25DC166D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25DC166E0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25DC166F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DC16700()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DC16710()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25DC16730()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_25DC16740()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25DC16750()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25DC16760()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25DC16770()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_25DC16780()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25DC16790()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25DC167A0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25DC167B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25DC167C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25DC167D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25DC167E0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25DC167F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25DC16800()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DC16810()
{
  return MEMORY[0x270F9E9B8]();
}

uint64_t sub_25DC16820()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_25DC16830()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25DC16840()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25DC16850()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25DC16860()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25DC16870()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DC16880()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25DC16890()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25DC168A0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25DC168B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25DC168C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25DC168D0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25DC168E0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25DC168F0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25DC16900()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25DC16910()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25DC16920()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25DC16930()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25DC16940()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DC16950()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25DC16960()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25DC16970()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25DC16990()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25DC169A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DC169C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25DC169D0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25DC169E0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25DC169F0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25DC16A00()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25DC16A10()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25DC16A20()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25DC16A30()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25DC16A40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25DC16A50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25DC16A60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25DC16A70()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25DC16A80()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25DC16A90()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25DC16AA0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25DC16AB0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25DC16AC0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25DC16AD0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25DC16AE0()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_25DC16AF0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DC16B10()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25DC16B20()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25DC16B30()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DC16B40()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25DC16B50()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25DC16B70()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25DC16B80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25DC16B90()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25DC16BA0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25DC16BB0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25DC16BC0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25DC16BD0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25DC16BE0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DC16BF0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DC16C00()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25DC16C10()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25DC16C20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25DC16C30()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25DC16C40()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

uint64_t MobileGestalt_get_airplaneMode()
{
  return MEMORY[0x270F960C8]();
}

uint64_t MobileGestalt_get_batteryIsCharging()
{
  return MEMORY[0x270F960D0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_externalPowerSourceConnected()
{
  return MEMORY[0x270F96130]();
}

uint64_t MobileGestalt_get_isLargeFormatPhone()
{
  return MEMORY[0x270F96150]();
}

uint64_t MobileGestalt_get_passwordConfigured()
{
  return MEMORY[0x270F96180]();
}

uint64_t MobileGestalt_get_smsCapability()
{
  return MEMORY[0x270F96190]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

long double erf(long double __x)
{
  MEMORY[0x270ED9780](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}