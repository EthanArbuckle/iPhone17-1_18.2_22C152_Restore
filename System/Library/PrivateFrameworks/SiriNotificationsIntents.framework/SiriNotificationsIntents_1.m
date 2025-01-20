uint64_t sub_23C31B298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_date;
  sub_23C32CF40();
  OUTLINED_FUNCTION_4_13();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  OUTLINED_FUNCTION_4_27();
  swift_release();
  OUTLINED_FUNCTION_4_27();
  OUTLINED_FUNCTION_4_27();
  OUTLINED_FUNCTION_4_27();
  OUTLINED_FUNCTION_4_27();
  OUTLINED_FUNCTION_4_27();
  sub_23C305BA0(*(id *)(v0 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent), *(unsigned char *)(v0 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent + 8));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_27();
  return v0;
}

uint64_t sub_23C31B394()
{
  sub_23C31B298();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_23C31B3EC()
{
  return type metadata accessor for ReadNotification();
}

uint64_t type metadata accessor for ReadNotification()
{
  uint64_t result = qword_268B9C410;
  if (!qword_268B9C410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C31B43C()
{
  uint64_t result = sub_23C32CF40();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_23C31B524(void *a1)
{
  return sub_23C31B5F0(a1, (SEL *)&selRef_applicationId);
}

uint64_t sub_23C31B530(void *a1)
{
  return sub_23C31B5F0(a1, (SEL *)&selRef_threadIdentifier);
}

uint64_t sub_23C31B53C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_request);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_23C32CEA0();

  return v3;
}

uint64_t sub_23C31B5A0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_13();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_23C31B5F0(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_23C32E480();

  return v4;
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_27()
{
  return sub_23C32E570();
}

void OUTLINED_FUNCTION_6_29()
{
  sub_23C305BA0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_27@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return *(void *)(v0 - 136);
}

uint64_t OUTLINED_FUNCTION_10_20(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  return sub_23C32E570();
}

uint64_t OUTLINED_FUNCTION_12_17()
{
  return 8236;
}

uint64_t OUTLINED_FUNCTION_13_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_11(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_19_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_9@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  *uint64_t v4 = result;
  v4[1] = a2;
  return result;
}

void sub_23C31B794()
{
  OUTLINED_FUNCTION_7();
  int v1 = v0;
  uint64_t v3 = v2;
  int v42 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AF10);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_23_1();
  uint64_t v10 = v8 - v9;
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v36 - v12;
  uint64_t v14 = sub_23C32E350();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = v17 - v16;
  sub_23C31C01C();
  uint64_t v40 = v19;
  int v39 = v20;
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v14, (uint64_t)qword_268BA3998);
  OUTLINED_FUNCTION_2_27();
  v21(v18);
  sub_23C31C330(v6, (uint64_t)v13);
  v22 = sub_23C32E340();
  int v23 = sub_23C32E740();
  if (os_log_type_enabled(v22, (os_log_type_t)v23))
  {
    int v37 = v23;
    int v41 = v1;
    uint64_t v38 = v3;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v44 = v36;
    *(_DWORD *)uint64_t v24 = 136315650;
    sub_23C31C330((uint64_t)v13, v10);
    uint64_t v25 = sub_23C32CF40();
    if (__swift_getEnumTagSinglePayload(v10, 1, v25) == 1)
    {
      sub_23C305EEC(v10);
      unint64_t v26 = 0xE300000000000000;
      uint64_t v27 = 7104878;
    }
    else
    {
      uint64_t v27 = sub_23C32CEB0();
      unint64_t v26 = v30;
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v10, v25);
    }
    uint64_t v43 = sub_23C2A9890(v27, v26, &v44);
    sub_23C32E830();
    swift_bridgeObjectRelease();
    sub_23C305EEC((uint64_t)v13);
    *(_WORD *)(v24 + 12) = 1024;
    LODWORD(v43) = v42 & 1;
    sub_23C32E830();
    *(_WORD *)(v24 + 18) = 2080;
    if (v41)
    {
      unint64_t v33 = 0xE300000000000000;
      uint64_t v31 = 7104878;
    }
    else
    {
      uint64_t v31 = sub_23C32E6E0();
      unint64_t v33 = v32;
    }
    uint64_t v43 = sub_23C2A9890(v31, v33, &v44);
    sub_23C32E830();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C289000, v22, (os_log_type_t)v37, "#HintUtils %s %{BOOL}d %s", (uint8_t *)v24, 0x1Cu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();

    uint64_t v34 = OUTLINED_FUNCTION_4_29();
    v35(v34);
  }
  else
  {
    sub_23C305EEC((uint64_t)v13);

    uint64_t v28 = OUTLINED_FUNCTION_4_29();
    v29(v28);
  }
  OUTLINED_FUNCTION_8();
}

void sub_23C31BB6C()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = v0;
  char v3 = v2;
  char v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AF10);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_23C32CF40();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v15 - v14;
  if (v5 & 1) == 0 && (v3)
  {
    sub_23C31C330(v1, v9);
    if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
    {
      sub_23C32CF30();
      sub_23C305EEC(v9);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v16, v9, v10);
    }
    sub_23C2DBA1C();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
  }
  OUTLINED_FUNCTION_8();
}

void sub_23C31BCE8()
{
  OUTLINED_FUNCTION_7();
  v27[1] = v0;
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_23C32E350();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_23_1();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v27 - v15;
  sub_23C2DC5D8();
  if (v17)
  {
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_268BA3998);
    OUTLINED_FUNCTION_2_27();
    v18(v13);
    uint64_t v19 = sub_23C32E340();
    os_log_type_t v20 = sub_23C32E720();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_23C289000, v19, v20, "SpokenHintUtils getRepeatHint | repeat hint disabled", v21, 2u);
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  }
  else if (v2)
  {
    if (!v6)
    {
      if (qword_268B9AC70 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v7, (uint64_t)qword_268BA3998);
      OUTLINED_FUNCTION_2_27();
      v22(v16);
      int v23 = sub_23C32E340();
      os_log_type_t v24 = sub_23C32E720();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_23C289000, v23, v24, "SpokenHintUtils getRepeatHint | legacy hint read, mocking a usage of repeat hint", v25, 2u);
        OUTLINED_FUNCTION_2();
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v7);
      sub_23C2DBA1C();
    }
  }
  else
  {
    uint64_t v26 = sub_23C32CF40();
    __swift_getEnumTagSinglePayload(v4, 1, v26);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t sub_23C31BFBC(char a1)
{
  if (a1) {
    return 0x657369636E6F63;
  }
  else {
    return 0x65736F62726576;
  }
}

uint64_t sub_23C31BFEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23C31BFBC(*v1);
  *a1 = result;
  a1[1] = 0xE700000000000000;
  return result;
}

void sub_23C31C01C()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = v0;
  uint64_t v2 = sub_23C32D030();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_23C32CDE0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v39 = v13 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AF10);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_23C32CF40();
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_23_1();
  uint64_t v24 = v22 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v37 - v26;
  sub_23C31C330(v1, v17);
  if (__swift_getEnumTagSinglePayload(v17, 1, v18) == 1)
  {
    sub_23C305EEC(v17);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v27, v17, v18);
    sub_23C32D010();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B170);
    uint64_t v28 = sub_23C32D020();
    OUTLINED_FUNCTION_0_0();
    uint64_t v37 = v2;
    uint64_t v30 = v29;
    uint64_t v31 = *(unsigned __int8 *)(v29 + 80);
    uint64_t v38 = v9;
    uint64_t v32 = v4;
    uint64_t v33 = (v31 + 32) & ~v31;
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_23C32FD10;
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v34 + v33, *MEMORY[0x263F07870], v28);
    sub_23C2A5160();
    sub_23C32CF30();
    uint64_t v35 = v39;
    sub_23C32D000();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v36(v24, v18);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v8, v37);
    sub_23C32CDC0();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v35, v38);
    v36((uint64_t)v27, v18);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t sub_23C31C330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AF10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_29()
{
  return v0;
}

uint64_t sub_23C31C3C0()
{
  OUTLINED_FUNCTION_4();
  v0[11] = v1;
  uint64_t v2 = sub_23C32D310();
  v0[12] = v2;
  OUTLINED_FUNCTION_2_0(v2);
  v0[13] = v3;
  v0[14] = OUTLINED_FUNCTION_29_0();
  uint64_t v4 = sub_23C32D4C0();
  v0[15] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v0[16] = v5;
  v0[17] = OUTLINED_FUNCTION_29_0();
  sub_23C32D470();
  v0[18] = OUTLINED_FUNCTION_29_0();
  uint64_t v6 = sub_23C32D880();
  v0[19] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v0[20] = v7;
  v0[21] = OUTLINED_FUNCTION_29_0();
  uint64_t v8 = sub_23C32E350();
  v0[22] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v0[23] = v9;
  v0[24] = OUTLINED_FUNCTION_29_0();
  sub_23C32E250();
  v0[25] = OUTLINED_FUNCTION_29_0();
  return MEMORY[0x270FA2498](sub_23C31C528, 0, 0);
}

uint64_t sub_23C31C528()
{
  OUTLINED_FUNCTION_4();
  type metadata accessor for ReadNotificationsCATPatternsExecutor();
  sub_23C32E240();
  *(void *)(v0 + 208) = sub_23C32E070();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C31C5E0;
  return sub_23C2D5B74();
}

uint64_t sub_23C31C5E0()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  v2[7] = v1;
  v2[8] = v4;
  v2[9] = v0;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v6 = v5;
  v3[28] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_23C31CA70;
  }
  else
  {
    swift_release();
    uint64_t v7 = sub_23C31C6D4;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_23C31C6D4()
{
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[22];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268BA3998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_23C32E340();
  os_log_type_t v6 = sub_23C32E720();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23C289000, v5, v6, "RNReadNotificationsNotSupportedForDeviceFlow execute | pattern successfully executed", v7, 2u);
    MEMORY[0x23ECE22B0](v7, -1, -1);
  }
  uint64_t v16 = (void *)v0[8];
  uint64_t v8 = v0[24];
  uint64_t v10 = v0[22];
  uint64_t v9 = v0[23];
  uint64_t v11 = v0[21];
  uint64_t v21 = v0[20];
  uint64_t v22 = v0[19];
  uint64_t v12 = v0[16];
  uint64_t v17 = v0[17];
  uint64_t v13 = v0[13];
  uint64_t v18 = v0[15];
  uint64_t v19 = v0[14];
  uint64_t v20 = v0[12];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_23C32D440();
  sub_23C32D830();
  sub_23C32D810();
  sub_23C32D660();
  swift_allocObject();
  sub_23C32D650();
  sub_23C32D1A0();
  swift_allocObject();
  v0[10] = sub_23C32D190();
  sub_23C32D1F0();
  swift_release();
  sub_23C32D2F0();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_23C32D380();
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v17, *MEMORY[0x263F6F9E0], v18);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v19, *MEMORY[0x263F6F730], v20);
  sub_23C2AAB78(1, 9, v17, v19, 1, 0, 0, 0, 0, 2u);
  sub_23C32D300();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  sub_23C32D590();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v11, v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_23C31CA70()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_3();
  return v0();
}

uint64_t sub_23C31CB20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AD60);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23C32E6D0();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v3;
  v10[5] = a1;
  v10[6] = a2;
  LODWORD(a1) = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  swift_retain();
  swift_retain();
  if (a1 == 1)
  {
    sub_23C28FC50((uint64_t)v8);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    sub_23C32E6C0();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_23C32E690();
      uint64_t v12 = v13;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  if (v12 | v11)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v11;
    v15[3] = v12;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_23C31CD14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v7 = sub_23C32D5B0();
  v6[4] = v7;
  v6[5] = *(void *)(v7 - 8);
  v6[6] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v6[7] = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_23C31CE0C;
  return sub_23C31C3C0();
}

uint64_t sub_23C31CE0C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = v2;
  *(void *)(v4 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_23C299C44;
  }
  else {
    uint64_t v5 = sub_23C29D6C8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t type metadata accessor for RNReadNotificationsNotSupportedForDevicePatternFlow()
{
  return self;
}

uint64_t sub_23C31CF14(uint64_t a1, uint64_t a2)
{
  return sub_23C31CB20(a1, a2);
}

uint64_t sub_23C31CF38()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23C31CF80(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_23C299F8C;
  return sub_23C31CD14(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_23C31D048(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746163696C707061 && a2 == 0xED000064496E6F69;
  if (v2 || (sub_23C32EB60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
    if (v6 || (sub_23C32EB60() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
      if (v7 || (sub_23C32EB60() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656C746974627573 && a2 == 0xE800000000000000;
        if (v8 || (sub_23C32EB60() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 2036625250 && a2 == 0xE400000000000000;
          if (v9 || (sub_23C32EB60() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000;
            if (v10 || (sub_23C32EB60() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x6449646165726874 && a2 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v12 = sub_23C32EB60();
              swift_bridgeObjectRelease();
              if (v12) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23C31D330()
{
  return 7;
}

uint64_t sub_23C31D338(char a1)
{
  uint64_t result = 0x746163696C707061;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6D617473656D6974;
      break;
    case 2:
      uint64_t result = 0x656C746974;
      break;
    case 3:
      uint64_t result = 0x656C746974627573;
      break;
    case 4:
      uint64_t result = 2036625250;
      break;
    case 5:
      uint64_t result = 0x7972616D6D7573;
      break;
    case 6:
      uint64_t result = 0x6449646165726874;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C31D424(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C4C8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C31F51C();
  sub_23C32EC40();
  v25[2] = 0;
  sub_23C32EAF0();
  if (!v2)
  {
    char v12 = (int *)type metadata accessor for ReadingRecord();
    v25[1] = 1;
    sub_23C32CF40();
    sub_23C31F5B4(&qword_268B9C4D0, MEMORY[0x263F07490]);
    sub_23C32EB10();
    uint64_t v13 = OUTLINED_FUNCTION_12_18(v12[6]);
    v25[0] = 2;
    OUTLINED_FUNCTION_3_28(v13, v14, (uint64_t)v25);
    uint64_t v15 = OUTLINED_FUNCTION_12_18(v12[7]);
    char v24 = 3;
    OUTLINED_FUNCTION_3_28(v15, v16, (uint64_t)&v24);
    uint64_t v17 = OUTLINED_FUNCTION_12_18(v12[8]);
    char v23 = 4;
    OUTLINED_FUNCTION_3_28(v17, v18, (uint64_t)&v23);
    v22[2] = *(unsigned char *)(v3 + v12[9]);
    v22[1] = 5;
    sub_23C31F5FC();
    sub_23C32EAE0();
    uint64_t v19 = OUTLINED_FUNCTION_12_18(v12[10]);
    v22[0] = 6;
    OUTLINED_FUNCTION_3_28(v19, v20, (uint64_t)v22);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
}

uint64_t sub_23C31D674@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = sub_23C32CF40();
  OUTLINED_FUNCTION_0_0();
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C4A8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v32 = (int *)type metadata accessor for ReadingRecord();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_3();
  char v12 = (uint64_t *)(v11 - v10);
  uint64_t v33 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C31F51C();
  sub_23C32EC30();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v38[2] = 0;
  *char v12 = sub_23C32EAA0();
  v12[1] = v13;
  v38[1] = 1;
  sub_23C31F5B4(&qword_268B9C4B8, MEMORY[0x263F07490]);
  sub_23C32EAC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))((char *)v12 + v32[5], v8, v34);
  v38[0] = 2;
  uint64_t v14 = OUTLINED_FUNCTION_4_30((uint64_t)v38);
  uint64_t v15 = (uint64_t *)((char *)v12 + v32[6]);
  *uint64_t v15 = v14;
  v15[1] = v16;
  char v37 = 3;
  uint64_t v17 = OUTLINED_FUNCTION_4_30((uint64_t)&v37);
  uint64_t v18 = (uint64_t *)((char *)v12 + v32[7]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  char v36 = 4;
  uint64_t v20 = OUTLINED_FUNCTION_4_30((uint64_t)&v36);
  uint64_t v21 = (uint64_t *)((char *)v12 + v32[8]);
  uint64_t *v21 = v20;
  v21[1] = v22;
  v35[1] = 5;
  sub_23C31F568();
  sub_23C32EA90();
  *((unsigned char *)v12 + v32[9]) = v35[2];
  v35[0] = 6;
  uint64_t v23 = OUTLINED_FUNCTION_4_30((uint64_t)v35);
  uint64_t v25 = v24;
  uint64_t v26 = OUTLINED_FUNCTION_2_28();
  v27(v26);
  uint64_t v28 = (uint64_t *)((char *)v12 + v32[10]);
  *uint64_t v28 = v23;
  v28[1] = v25;
  sub_23C2A50A0((uint64_t)v12, a2);
  __swift_destroy_boxed_opaque_existential_1(v33);
  return sub_23C2A5104((uint64_t)v12);
}

uint64_t sub_23C31DB08()
{
  return sub_23C31D338(*v0);
}

uint64_t sub_23C31DB10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C31D048(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C31DB38()
{
  return sub_23C2914BC();
}

uint64_t sub_23C31DB58@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23C31D330();
  *a1 = result;
  return result;
}

uint64_t sub_23C31DB80(uint64_t a1)
{
  unint64_t v2 = sub_23C31F51C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C31DBBC(uint64_t a1)
{
  unint64_t v2 = sub_23C31F51C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23C31DBF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23C31D674(a1, a2);
}

uint64_t sub_23C31DC10(void *a1)
{
  return sub_23C31D424(a1);
}

unint64_t sub_23C31DC28()
{
  return 0xD000000000000012;
}

uint64_t sub_23C31DCBC(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_23C32E350();
  v2[5] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v2[6] = v4;
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  sub_23C32E4C0();
  v2[9] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[10] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23C31DDC8;
  return sub_23C31E33C(3600.0);
}

uint64_t sub_23C31DDC8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C31DEC8, 0, 0);
}

uint64_t sub_23C31DEC8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B088);
  uint64_t v3 = type metadata accessor for ReadingRecord();
  OUTLINED_FUNCTION_2_0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23C32FD10;
  sub_23C2A50A0(v2, v6 + v5);
  sub_23C310388();
  sub_23C32CD30();
  swift_allocObject();
  sub_23C32CD20();
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C458);
  sub_23C31EA9C(&qword_268B9C470, &qword_268B9C478);
  uint64_t v7 = sub_23C32CD10();
  unint64_t v9 = v8;
  swift_release();
  swift_bridgeObjectRelease();
  sub_23C32E4B0();
  sub_23C32E4A0();
  if (v10)
  {
    uint64_t v11 = *(void **)(v0[4] + 16);
    char v12 = (void *)sub_23C32E470();
    swift_bridgeObjectRelease();
    sub_23C31DC28();
    uint64_t v13 = (void *)sub_23C32E470();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setValue_forKey_, v12, v13);

    sub_23C2A02A4(v7, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v16 = v0[8];
    uint64_t v17 = v0[5];
    uint64_t v18 = v0[6];
    uint64_t v19 = __swift_project_value_buffer(v17, (uint64_t)qword_268BA3998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    uint64_t v20 = sub_23C32E340();
    os_log_type_t v21 = sub_23C32E740();
    if (os_log_type_enabled(v20, v21))
    {
      *(_WORD *)OUTLINED_FUNCTION_10_1() = 0;
      OUTLINED_FUNCTION_8_28(&dword_23C289000, v22, v23, "ReadingHistory writeRecords | unable to convert encoded data to string");
      OUTLINED_FUNCTION_2();
    }
    uint64_t v24 = v0[8];
    uint64_t v25 = v0[5];
    uint64_t v26 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    sub_23C31EB30();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    sub_23C2A02A4(v7, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
  }
  return v14();
}

uint64_t sub_23C31E33C(double a1)
{
  *(void *)(v2 + 112) = v1;
  *(double *)(v2 + 104) = a1;
  uint64_t v3 = sub_23C32E350();
  *(void *)(v2 + 120) = v3;
  OUTLINED_FUNCTION_2_0(v3);
  *(void *)(v2 + 128) = v4;
  *(void *)(v2 + 136) = swift_task_alloc();
  *(void *)(v2 + 144) = swift_task_alloc();
  uint64_t v5 = sub_23C32CF40();
  *(void *)(v2 + 152) = v5;
  OUTLINED_FUNCTION_2_0(v5);
  *(void *)(v2 + 160) = v6;
  *(void *)(v2 + 168) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ReadingRecord();
  *(void *)(v2 + 176) = v7;
  OUTLINED_FUNCTION_2_0(v7);
  *(void *)(v2 + 184) = v8;
  *(void *)(v2 + 192) = swift_task_alloc();
  *(void *)(v2 + 200) = swift_task_alloc();
  uint64_t v9 = sub_23C32E4C0();
  *(void *)(v2 + 208) = v9;
  OUTLINED_FUNCTION_2_0(v9);
  *(void *)(v2 + 216) = v10;
  *(void *)(v2 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C31E4A4, 0, 0);
}

uint64_t sub_23C31E4A4()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 112) + 16);
  sub_23C31DC28();
  uint64_t v2 = (void *)sub_23C32E470();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_23C32E8B0();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_23C2989B8(v0 + 48, v0 + 16);
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast())
    {
      uint64_t v5 = *(void *)(v0 + 216);
      uint64_t v4 = *(void *)(v0 + 224);
      uint64_t v6 = *(void *)(v0 + 208);
      sub_23C32E4B0();
      uint64_t v7 = sub_23C32E490();
      unint64_t v9 = v8;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
      if (v9 >> 60 != 15)
      {
        uint64_t v10 = (uint64_t *)(v0 + 96);
        sub_23C32CD00();
        swift_allocObject();
        sub_23C32CCF0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C458);
        sub_23C31EA9C(&qword_268B9C460, &qword_268B9C468);
        sub_23C32CCE0();
        uint64_t v37 = v7;
        unint64_t v38 = v9;
        swift_release();
        uint64_t v22 = *v10;
        uint64_t v19 = MEMORY[0x263F8EE78];
        uint64_t v40 = *(void *)(*v10 + 16);
        uint64_t v41 = MEMORY[0x263F8EE78];
        if (!v40)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          sub_23C31EA88(v37, v38);
          goto LABEL_13;
        }
        unint64_t v23 = 0;
        uint64_t v39 = *(void *)(v0 + 184);
        uint64_t v24 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 160) + 8);
        while (v23 < *(void *)(v22 + 16))
        {
          uint64_t v25 = *(void *)(v0 + 168);
          uint64_t v26 = *(void *)(v0 + 152);
          double v27 = *(double *)(v0 + 104);
          unint64_t v28 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
          uint64_t v29 = *(void *)(v39 + 72);
          uint64_t v30 = v22;
          sub_23C2A50A0(v22 + v28 + v29 * v23, *(void *)(v0 + 200));
          sub_23C32CF30();
          sub_23C32CEC0();
          double v32 = v31;
          (*v24)(v25, v26);
          uint64_t v33 = *(void *)(v0 + 200);
          if (v32 <= v27)
          {
            sub_23C2A5454(v33, *(void *)(v0 + 192));
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_23C29BE88(0, *(void *)(v19 + 16) + 1, 1);
              uint64_t v19 = v41;
            }
            unint64_t v35 = *(void *)(v19 + 16);
            unint64_t v34 = *(void *)(v19 + 24);
            if (v35 >= v34 >> 1)
            {
              sub_23C29BE88(v34 > 1, v35 + 1, 1);
              uint64_t v19 = v41;
            }
            uint64_t v36 = *(void *)(v0 + 192);
            *(void *)(v19 + 16) = v35 + 1;
            sub_23C2A5454(v36, v19 + v28 + v35 * v29);
          }
          else
          {
            sub_23C2A5104(v33);
          }
          ++v23;
          uint64_t v22 = v30;
          if (v40 == v23) {
            goto LABEL_27;
          }
        }
        __break(1u);
        goto LABEL_29;
      }
    }
  }
  else
  {
    sub_23C298958(v0 + 16);
  }
  if (qword_268B9AC70 != -1) {
LABEL_29:
  }
    swift_once();
  __swift_project_value_buffer(*(void *)(v0 + 120), (uint64_t)qword_268BA3998);
  uint64_t v11 = OUTLINED_FUNCTION_5_3();
  v12(v11);
  uint64_t v13 = sub_23C32E340();
  os_log_type_t v14 = sub_23C32E720();
  if (os_log_type_enabled(v13, v14))
  {
    *(_WORD *)OUTLINED_FUNCTION_10_1() = 0;
    OUTLINED_FUNCTION_27(&dword_23C289000, v15, v16, "ReadingHistory readRecords | unable to obtain data from dataStoreKey)");
    OUTLINED_FUNCTION_2();
  }

  uint64_t v17 = OUTLINED_FUNCTION_48_3();
  v18(v17);
  uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v20(v19);
}

uint64_t type metadata accessor for ReadingHistory()
{
  return self;
}

uint64_t type metadata accessor for ReadingRecord()
{
  uint64_t result = qword_268B9C490;
  if (!qword_268B9C490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C31EA88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23C2A02A4(a1, a2);
  }
  return a1;
}

uint64_t sub_23C31EA9C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268B9C458);
    sub_23C31F5B4(a2, (void (*)(uint64_t))type metadata accessor for ReadingRecord);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C31EB30()
{
  unint64_t result = qword_268B9C480;
  if (!qword_268B9C480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C480);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ReadingHistory.ReadingHistoryError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C31EC48);
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

ValueMetadata *type metadata accessor for ReadingHistory.ReadingHistoryError()
{
  return &type metadata for ReadingHistory.ReadingHistoryError;
}

void *sub_23C31EC80(void *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23C32CF40();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (void *)((char *)v4 + v14);
    uint64_t v19 = (void *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[8];
    uint64_t v22 = a3[9];
    unint64_t v23 = (void *)((char *)v4 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *unint64_t v23 = *v24;
    v23[1] = v25;
    *((unsigned char *)v4 + v22) = *((unsigned char *)a2 + v22);
    uint64_t v26 = a3[10];
    double v27 = (void *)((char *)v4 + v26);
    unint64_t v28 = (void *)((char *)a2 + v26);
    uint64_t v29 = v28[1];
    *double v27 = *v28;
    v27[1] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23C31EDE8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_23C32CF40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_23C31EEA8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23C32CF40();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)((char *)a1 + v20);
  unint64_t v23 = (void *)((char *)a2 + v20);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  double v27 = (void *)((char *)a2 + v25);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_23C31EFC0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23C32CF40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_23C31F120(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23C32CF40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  return a1;
}

void *sub_23C31F1E0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23C32CF40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)((char *)a1 + v21);
  unint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  void *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  double v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *double v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23C31F2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23C31F300);
}

uint64_t sub_23C31F300(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_23C32CF40();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_23C31F388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23C31F39C);
}

uint64_t sub_23C31F39C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_23C32CF40();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_23C31F41C()
{
  uint64_t result = sub_23C32CF40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23C31F4D0()
{
  unint64_t result = qword_268B9C4A0;
  if (!qword_268B9C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4A0);
  }
  return result;
}

unint64_t sub_23C31F51C()
{
  unint64_t result = qword_268B9C4B0;
  if (!qword_268B9C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4B0);
  }
  return result;
}

unint64_t sub_23C31F568()
{
  unint64_t result = qword_268B9C4C0;
  if (!qword_268B9C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4C0);
  }
  return result;
}

uint64_t sub_23C31F5B4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23C31F5FC()
{
  unint64_t result = qword_268B9C4D8;
  if (!qword_268B9C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReadingRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ReadingRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C31F79CLL);
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

ValueMetadata *type metadata accessor for ReadingRecord.CodingKeys()
{
  return &type metadata for ReadingRecord.CodingKeys;
}

unint64_t sub_23C31F7D8()
{
  unint64_t result = qword_268B9C4E0;
  if (!qword_268B9C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4E0);
  }
  return result;
}

unint64_t sub_23C31F828()
{
  unint64_t result = qword_268B9C4E8;
  if (!qword_268B9C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4E8);
  }
  return result;
}

unint64_t sub_23C31F878()
{
  unint64_t result = qword_268B9C4F0;
  if (!qword_268B9C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9F3B0](a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_4_30(uint64_t a1)
{
  return MEMORY[0x270F9F270](a1, v1);
}

void OUTLINED_FUNCTION_8_28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_12_18@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

unsigned char *storeEnumTagSinglePayload for SummaryType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C31FA0CLL);
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

ValueMetadata *type metadata accessor for SummaryType()
{
  return &type metadata for SummaryType;
}

uint64_t sub_23C31FA44()
{
  return sub_23C31FBA0();
}

uint64_t sub_23C31FA5C()
{
  return sub_23C31FBA0();
}

uint64_t sub_23C31FA74()
{
  return sub_23C31FAD4();
}

uint64_t sub_23C31FA8C()
{
  return sub_23C31FAD4();
}

uint64_t sub_23C31FAA4()
{
  return sub_23C31FAD4();
}

uint64_t sub_23C31FABC()
{
  return sub_23C31FAD4();
}

uint64_t sub_23C31FAD4()
{
  OUTLINED_FUNCTION_4_31();
  v0(v3, v1);
  return sub_23C32EC20();
}

uint64_t sub_23C31FB14()
{
  return sub_23C31FB38();
}

uint64_t sub_23C31FB24()
{
  return sub_23C31FB38();
}

uint64_t sub_23C31FB38()
{
  return sub_23C32EC20();
}

uint64_t sub_23C31FB88()
{
  return sub_23C31FBA0();
}

uint64_t sub_23C31FBA0()
{
  OUTLINED_FUNCTION_4_31();
  v0(v1);
  OUTLINED_FUNCTION_3_29();
  swift_bridgeObjectRelease();
  return sub_23C32EC20();
}

uint64_t sub_23C31FBE8()
{
  return sub_23C320158();
}

uint64_t sub_23C31FBF4()
{
  OUTLINED_FUNCTION_2_29();
  switch(v0)
  {
    case 3:
      OUTLINED_FUNCTION_0_15();
      break;
    case 4:
      OUTLINED_FUNCTION_1_19();
      break;
    default:
      break;
  }
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C31FCAC()
{
  return sub_23C32E550();
}

uint64_t sub_23C31FCBC()
{
  return sub_23C32E550();
}

uint64_t sub_23C31FCD0(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 3:
      OUTLINED_FUNCTION_0_15();
      break;
    default:
      break;
  }
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C31FD74(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 2:
      goto LABEL_3;
    case 3:
      OUTLINED_FUNCTION_6_30();
LABEL_3:
      OUTLINED_FUNCTION_5_29();
      break;
    default:
      break;
  }
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C31FE20()
{
  OUTLINED_FUNCTION_2_29();
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C31FEB4(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 4:
      OUTLINED_FUNCTION_0_15();
      break;
    case 5:
      OUTLINED_FUNCTION_1_19();
      break;
    default:
      break;
  }
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C31FF80()
{
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C320018()
{
  OUTLINED_FUNCTION_6_30();
  OUTLINED_FUNCTION_5_29();
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C3200D4(uint64_t a1, char a2)
{
  sub_23C2914C8(a2);
  sub_23C32E550();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C320128(uint64_t a1, uint64_t a2)
{
  return sub_23C320338(a1, a2, (void (*)(uint64_t))sub_23C2914C8);
}

uint64_t sub_23C320140(uint64_t a1, uint64_t a2)
{
  return sub_23C320264(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C320018);
}

uint64_t sub_23C320158()
{
  return sub_23C32EC20();
}

uint64_t sub_23C320204(uint64_t a1, uint64_t a2)
{
  return sub_23C320338(a1, a2, (void (*)(uint64_t))RNPromptResponse.rawValue.getter);
}

uint64_t sub_23C32021C(uint64_t a1, uint64_t a2)
{
  return sub_23C320264(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C31FE20);
}

uint64_t sub_23C320234(uint64_t a1, uint64_t a2)
{
  return sub_23C320264(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C31FD74);
}

uint64_t sub_23C32024C(uint64_t a1, uint64_t a2)
{
  return sub_23C320264(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C31FCD0);
}

uint64_t sub_23C320264(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_23C32EC00();
  a3(v6, a2);
  return sub_23C32EC20();
}

uint64_t sub_23C3202B0()
{
  return sub_23C3202D4();
}

uint64_t sub_23C3202C4()
{
  return sub_23C3202D4();
}

uint64_t sub_23C3202D4()
{
  return sub_23C32EC20();
}

uint64_t sub_23C320320(uint64_t a1, uint64_t a2)
{
  return sub_23C320338(a1, a2, (void (*)(uint64_t))ANFollowupRequestedBehavior.rawValue.getter);
}

uint64_t sub_23C320338(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_23C32EC20();
}

uint64_t sub_23C32038C(char a1)
{
  uint64_t result = 0xD000000000000015;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000016;
    }
    else {
      return 0x7A6972616D6D7573;
    }
  }
  return result;
}

uint64_t sub_23C3203F0()
{
  unint64_t v0 = sub_23C32EA70();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_23C32043C(unsigned __int8 *a1, char *a2)
{
  return sub_23C2A6594(*a1, *a2);
}

uint64_t sub_23C320448()
{
  return sub_23C31FBE8();
}

uint64_t sub_23C320450()
{
  return sub_23C31FF80();
}

uint64_t sub_23C320458()
{
  return sub_23C320158();
}

uint64_t sub_23C320460@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23C3203F0();
  *a1 = result;
  return result;
}

uint64_t sub_23C320490@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23C32038C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C3204BC()
{
  return sub_23C32E600();
}

uint64_t sub_23C32051C()
{
  return sub_23C32E5F0();
}

unint64_t sub_23C320570()
{
  unint64_t result = qword_268B9C4F8;
  if (!qword_268B9C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C4F8);
  }
  return result;
}

unint64_t sub_23C3205BC()
{
  unint64_t result = qword_268B9C500;
  if (!qword_268B9C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C500);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_29()
{
  return sub_23C32E550();
}

uint64_t OUTLINED_FUNCTION_4_31()
{
  return sub_23C32EC00();
}

uint64_t sub_23C3206C0(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  uint64_t v24 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (2)
  {
    swift_beginAccess();
    uint64_t v20 = v3;
    if (v3)
    {
      unint64_t v19 = v2;
      unint64_t v4 = 0;
      uint64_t v21 = v2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v22 = v2 & 0xC000000000000001;
      v2 += 32;
      uint64_t v5 = v3;
      while (1)
      {
        if (v22)
        {
          uint64_t v6 = MEMORY[0x23ECE18A0](v4, v19);
        }
        else
        {
          if (v4 >= *(void *)(v21 + 16))
          {
            __break(1u);
LABEL_34:
            __break(1u);
            goto LABEL_35;
          }
          uint64_t v6 = *(void *)(v2 + 8 * v4);
          swift_retain();
        }
        if (__OFADD__(v4++, 1)) {
          goto LABEL_34;
        }
        uint64_t v8 = *(void **)a2;
        uint64_t v9 = *(void *)(*(void *)a2 + 16);
        if (!v9) {
          goto LABEL_26;
        }
        uint64_t v10 = *(void *)(v6 + 16);
        uint64_t v11 = *(void *)(v6 + 24);
        BOOL v12 = v8[4] == v10 && v8[5] == v11;
        if (!v12 && (sub_23C32EB60() & 1) == 0) {
          break;
        }
        swift_release();
LABEL_27:
        if (v4 == v5)
        {
          uint64_t v17 = v24;
          goto LABEL_32;
        }
      }
      if (v9 != 1)
      {
        uint64_t v13 = v8 + 7;
        uint64_t v14 = 1;
        while (1)
        {
          uint64_t v15 = v14 + 1;
          if (__OFADD__(v14, 1)) {
            break;
          }
          BOOL v16 = *(v13 - 1) == v10 && *v13 == v11;
          if (v16 || (sub_23C32EB60() & 1) != 0)
          {
            swift_release();
            uint64_t v5 = v20;
            goto LABEL_27;
          }
          v13 += 2;
          ++v14;
          BOOL v12 = v15 == v9;
          uint64_t v5 = v20;
          if (v12) {
            goto LABEL_26;
          }
        }
LABEL_35:
        __break(1u);
LABEL_36:
        uint64_t v3 = sub_23C32EA30();
        continue;
      }
LABEL_26:
      sub_23C32E9A0();
      sub_23C32E9D0();
      sub_23C32E9E0();
      sub_23C32E9B0();
      goto LABEL_27;
    }
    break;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_32:
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_23C3208C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_23C32EB60();
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
    if (v12 || (sub_23C32EB60() & 1) != 0) {
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

uint64_t sub_23C32098C(uint64_t a1)
{
  uint64_t v2 = sub_23C32E6F0();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23C3217C8(&v9, v5, v6);
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

uint64_t sub_23C320A40(unint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_10_21();
    uint64_t result = sub_23C32EA30();
    uint64_t v3 = result;
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (!v3)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_23C32098C(v5);
    sub_23C321584(v9);
    OUTLINED_FUNCTION_12_19();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AED8);
    uint64_t v10 = sub_23C32D160();
    OUTLINED_FUNCTION_2_0(v10);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23C332110;
    sub_23C32D150();
    v11[3] = type metadata accessor for DefaultGuardFlowProvider();
    v11[4] = sub_23C32226C();
    v11[0] = v1;
    swift_retain();
    sub_23C32D130();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    sub_23C32D040();
    OUTLINED_FUNCTION_12_19();
    return a1;
  }
  if (v3 >= 1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        MEMORY[0x23ECE18A0](0, a1);
        OUTLINED_FUNCTION_15_15();
        swift_unknownObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_13_13();
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_9_25();
        uint64_t v5 = v8;
      }
      if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1)
      {
        OUTLINED_FUNCTION_6_31();
        uint64_t v5 = v7;
      }
      OUTLINED_FUNCTION_11_25();
    }
    while (!v6);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C320C34(unint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_10_21();
    uint64_t result = sub_23C32EA30();
    uint64_t v3 = result;
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (!v3)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_23C32098C(v5);
    sub_23C321584(v9);
    OUTLINED_FUNCTION_12_19();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AED8);
    uint64_t v10 = sub_23C32D160();
    OUTLINED_FUNCTION_2_0(v10);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23C32FD10;
    v11[3] = type metadata accessor for DefaultGuardFlowProvider();
    v11[4] = sub_23C32226C();
    v11[0] = v1;
    swift_retain();
    sub_23C32D130();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    sub_23C32D040();
    OUTLINED_FUNCTION_12_19();
    return a1;
  }
  if (v3 >= 1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        MEMORY[0x23ECE18A0](0, a1);
        OUTLINED_FUNCTION_15_15();
        swift_unknownObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_13_13();
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_9_25();
        uint64_t v5 = v8;
      }
      if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1)
      {
        OUTLINED_FUNCTION_6_31();
        uint64_t v5 = v7;
      }
      OUTLINED_FUNCTION_11_25();
    }
    while (!v6);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C320E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = sub_23C32E350();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_23C32D750();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3();
  uint64_t v68 = v14 - v13;
  uint64_t v15 = sub_23C32D780();
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_3();
  uint64_t v21 = v20 - v19;
  uint64_t v70 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a2 + 16);
  uint64_t v60 = v8;
  if (v22)
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    uint64_t v23 = v17 + 16;
    uint64_t v25 = a2 + ((*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64));
    uint64_t v66 = *(void *)(v23 + 56);
    v67 = v24;
    uint64_t v26 = (uint64_t (**)(uint64_t, uint64_t))(v11 + 88);
    int v65 = *MEMORY[0x263F6FBC8];
    int v63 = *MEMORY[0x263F6FBD0];
    v61 = (void (**)(uint64_t, uint64_t))(v11 + 8);
    swift_bridgeObjectRetain();
    uint64_t v64 = v9;
    do
    {
      v67(v21, v25, v15);
      sub_23C32D770();
      int v27 = (*v26)(v68, v9);
      if (v27 == v65)
      {
        uint64_t v28 = sub_23C32D760();
        uint64_t v30 = v29;
        uint64_t v15 = v70;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_4_32();
          uint64_t v15 = v41;
        }
        unint64_t v31 = *(void *)(v15 + 16);
        if (v31 >= *(void *)(v15 + 24) >> 1)
        {
          OUTLINED_FUNCTION_5_30();
          uint64_t v15 = v42;
        }
        *(void *)(v15 + 16) = v31 + 1;
        uint64_t v32 = v15 + 16 * v31;
        *(void *)(v32 + 32) = v28;
        *(void *)(v32 + 40) = v30;
        uint64_t v33 = OUTLINED_FUNCTION_2_30();
        v34(v33);
        uint64_t v9 = v64;
      }
      else if (v27 == v63)
      {
        uint64_t v62 = sub_23C32D760();
        uint64_t v36 = v35;
        uint64_t v15 = v70;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_4_32();
          uint64_t v15 = v43;
        }
        unint64_t v37 = *(void *)(v15 + 16);
        if (v37 >= *(void *)(v15 + 24) >> 1)
        {
          OUTLINED_FUNCTION_5_30();
          uint64_t v15 = v44;
        }
        *(void *)(v15 + 16) = v37 + 1;
        uint64_t v38 = v15 + 16 * v37;
        *(void *)(v38 + 32) = v62;
        *(void *)(v38 + 40) = v36;
        uint64_t v39 = OUTLINED_FUNCTION_2_30();
        v40(v39);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v23 - 8))(v21, v15);
        (*v61)(v68, v9);
      }
      v25 += v66;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    uint64_t v8 = v60;
  }
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  uint64_t v45 = __swift_project_value_buffer(v58, (uint64_t)qword_268BA3998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v45, v58);
  v46 = sub_23C32E340();
  os_log_type_t v47 = sub_23C32E730();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v69 = v49;
    *(_DWORD *)v48 = 136315138;
    swift_beginAccess();
    uint64_t v50 = swift_bridgeObjectRetain();
    uint64_t v51 = v4;
    uint64_t v52 = MEMORY[0x23ECE1580](v50, MEMORY[0x263F8D310]);
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    sub_23C2A9890(v52, v54, &v69);
    sub_23C32E830();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C289000, v46, v47, "DefaultGuardFlowProvider#protectedAppCheck filtering out apps: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECE22B0](v49, -1, -1);
    MEMORY[0x23ECE22B0](v48, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v60, v58);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v58);
  }
  if (*(void *)(v59 + 16))
  {
    unint64_t v55 = swift_bridgeObjectRetain();
    uint64_t v56 = sub_23C3206C0(v55, (uint64_t)&v70);
  }
  else
  {
    uint64_t v56 = MEMORY[0x263F8EE78];
  }
  *(void *)(v59 + 24) = v56;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C321350()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23C321378()
{
  sub_23C321350();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DefaultGuardFlowProvider()
{
  return self;
}

uint64_t sub_23C3213DC(uint64_t a1, uint64_t a2)
{
  return sub_23C320E1C(a1, a2);
}

#error "23C321480: call analysis failed (funcsize=54)"

void sub_23C3214E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6 = a4 >> 1;
  uint64_t v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_3_30();
    if (!(v9 ^ v10 | v8))
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_268B9B1F8);
      uint64_t v11 = (void *)OUTLINED_FUNCTION_14_12();
      _swift_stdlib_malloc_size(v11);
      OUTLINED_FUNCTION_7_21();
      v11[2] = v7;
      v11[3] = v12;
    }
    if (v6 != v4)
    {
      sub_23C30FD3C(v5 + 8 * v4, v7);
      return;
    }
    goto LABEL_9;
  }
}

void *sub_23C321584(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B090);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_23C3222B8((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23C2C4F4C();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_23C321668(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6 = a4 >> 1;
  uint64_t v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_3_30();
    if (!(v9 ^ v10 | v8))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B078);
      uint64_t v11 = (void *)OUTLINED_FUNCTION_14_12();
      size_t v12 = _swift_stdlib_malloc_size(v11);
      v11[2] = v7;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 8);
    }
    if (v6 != v4)
    {
      sub_23C30FD54(v5 + 8 * v4, v7);
      return;
    }
    goto LABEL_9;
  }
}

void sub_23C321718(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6 = a4 >> 1;
  uint64_t v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_3_30();
    if (v9 ^ v10 | v8)
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B090);
      uint64_t v11 = (void *)OUTLINED_FUNCTION_14_12();
      size_t v12 = _swift_stdlib_malloc_size(v11);
      v11[2] = v7;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 16);
    }
    if (v6 != v4)
    {
      sub_23C30FC8C(v5 + 16 * v4, v7, (unint64_t)(v11 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_23C3217C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_23C32EC00();
  swift_bridgeObjectRetain();
  sub_23C32E550();
  uint64_t v8 = sub_23C32EC20();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    size_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23C32EB60() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23C32EB60() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23C321C54(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23C321978()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C510);
  uint64_t v3 = sub_23C32E8F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
      sub_23C32EC00();
      sub_23C32E550();
      uint64_t result = sub_23C32EC20();
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
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
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
                sub_23C321DF0(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
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

uint64_t sub_23C321C54(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23C321978();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_23C321E0C();
      goto LABEL_22;
    }
    sub_23C321FC0();
  }
  uint64_t v11 = *v4;
  sub_23C32EC00();
  sub_23C32E550();
  uint64_t result = sub_23C32EC20();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_23C32EB60(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_23C32EBA0();
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
          uint64_t result = sub_23C32EB60();
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
  uint64_t *v21 = v8;
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

uint64_t sub_23C321DF0(uint64_t result, uint64_t a2, void *a3)
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

void *sub_23C321E0C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C510);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23C32E8E0();
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

uint64_t sub_23C321FC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C510);
  uint64_t v3 = sub_23C32E8F0();
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
    sub_23C32EC00();
    swift_bridgeObjectRetain();
    sub_23C32E550();
    uint64_t result = sub_23C32EC20();
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
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
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

unint64_t sub_23C32226C()
{
  unint64_t result = qword_268B9C508;
  if (!qword_268B9C508)
  {
    type metadata accessor for DefaultGuardFlowProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B9C508);
  }
  return result;
}

uint64_t sub_23C3222B8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
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
  int64_t v11 = a2;
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
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
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

uint64_t OUTLINED_FUNCTION_2_30()
{
  *(void *)(v2 - 96) = v1;
  return v0;
}

void OUTLINED_FUNCTION_4_32()
{
  sub_23C30EB34();
}

void OUTLINED_FUNCTION_5_30()
{
  sub_23C30EB34();
}

void OUTLINED_FUNCTION_6_31()
{
  sub_23C30EB34();
}

void OUTLINED_FUNCTION_9_25()
{
  sub_23C30EB34();
}

uint64_t OUTLINED_FUNCTION_10_21()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_11_25()
{
  *(void *)(v0 + 16) = v2;
  uint64_t v5 = v0 + 16 * v3;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v1;
}

uint64_t OUTLINED_FUNCTION_12_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_15()
{
  return swift_bridgeObjectRetain();
}

unsigned char *sub_23C322634(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = (unsigned char *)v9;
  uint64_t v28 = a8;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  int v27 = a2 & 1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C620);
  MEMORY[0x270FA5388](v15);
  int64_t v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  *int64_t v17 = a1;
  sub_23C294010(a3 + 80, (uint64_t)v32);
  uint64_t v18 = sub_23C32D660();
  swift_allocObject();
  swift_retain();
  uint64_t v19 = sub_23C32D650();
  uint64_t v30 = v18;
  uint64_t v31 = MEMORY[0x263F6FB30];
  uint64_t v29 = v19;
  uint64_t v20 = sub_23C32D1A0();
  swift_allocObject();
  uint64_t v21 = sub_23C32D190();
  uint64_t v22 = MEMORY[0x263F6F600];
  v17[4] = v20;
  v17[5] = v22;
  v17[1] = v21;
  swift_storeEnumTagMultiPayload();
  sub_23C329508((uint64_t)v17, (uint64_t)&v10[*(void *)(*(void *)v10 + 136)]);
  *(void *)(v9 + 16) = v25;
  *(void *)(v9 + 24) = a5;
  *(void *)(v9 + 32) = v26;
  *(void *)(v9 + 40) = a7;
  *(void *)(v9 + 48) = v28;
  *(void *)(v9 + 56) = a9;
  sub_23C28BE4C(a3, v9 + 72);
  *(unsigned char *)(v9 + 64) = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  unsigned __int16 v23 = (unsigned __int16)sub_23C2E89A4();
  swift_release();
  swift_release();
  swift_release();
  swift_release_n();
  sub_23C28BEA8(a3);
  v10[65] = v23 & 1;
  v10[66] = HIBYTE(v23) & 1;
  return v10;
}

uint64_t sub_23C322838(unint64_t a1, unint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_23C32EA30())
  {
    uint64_t v6 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v7 = MEMORY[0x23ECE18A0](v6 - 4, a1);
      }
      else
      {
        uint64_t v7 = *(void *)(a1 + 8 * v6);
        swift_retain();
      }
      uint64_t v8 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      uint64_t v13 = v7;
      char v9 = sub_23C322E70(&v13, a2);
      if (v2)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return v11 & 1;
      }
      char v10 = v9;
      swift_release();
      if ((v10 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v11 = 0;
        return v11 & 1;
      }
      ++v6;
      if (v8 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v11 = 1;
  return v11 & 1;
}

id sub_23C322988()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_23C32E620();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

uint64_t sub_23C322A00@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  uint64_t v6 = OUTLINED_FUNCTION_31_0(v5);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v26 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v25 = (char *)&v24 - v9;
  unint64_t v10 = *a1;
  type metadata accessor for NotificationsApp.Builder(0);
  swift_allocObject();
  uint64_t v11 = sub_23C2D9E90();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_23C32EA30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v12)
  {
    uint64_t v27 = MEMORY[0x263F8EE78];
    int64_t v14 = &v27;
    sub_23C32E9C0();
    if (v12 < 0)
    {
      __break(1u);
      goto LABEL_27;
    }
    char v24 = a2;
    uint64_t v15 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        MEMORY[0x23ECE18A0](v15, v10);
      }
      else {
        OUTLINED_FUNCTION_56_2();
      }
      ++v15;
      sub_23C31AAB0();
      swift_release();
      sub_23C32E9A0();
      sub_23C32E9D0();
      sub_23C32E9E0();
      sub_23C32E9B0();
    }
    while (v12 != v15);
    uint64_t v13 = v27;
    a2 = v24;
  }
  int64_t v14 = (uint64_t *)sub_23C2D9F18(v13);
  swift_release();
  swift_bridgeObjectRelease();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_23C32EA30();
    if (v11)
    {
LABEL_13:
      unint64_t v2 = v10 & 0xC000000000000001;
      OUTLINED_FUNCTION_51_2();
      if ((v10 & 0xC000000000000001) == 0)
      {
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_release();
        goto LABEL_15;
      }
LABEL_27:
      MEMORY[0x23ECE18A0](0, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
LABEL_15:
      OUTLINED_FUNCTION_51_2();
      if (v2)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = MEMORY[0x23ECE18A0](0, v10);
        swift_bridgeObjectRelease();
        uint64_t v17 = *(void *)(v16 + 16);
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v17 = *(void *)(*(void *)(v10 + 32) + 16);
        swift_bridgeObjectRetain();
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = 0;
LABEL_20:
  uint64_t v18 = (uint64_t)v25;
  sub_23C32E150();
  sub_23C32E170();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_21_8();
  sub_23C2F51D8(v18, v17);
  swift_endAccess();
  sub_23C30080C(v18, &qword_268B9AE30);
  if (v11)
  {
    OUTLINED_FUNCTION_51_2();
    if ((v10 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = MEMORY[0x23ECE18A0](0, v10);
      swift_bridgeObjectRelease();
      uint64_t v19 = *(void *)(v23 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_type + 8);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v19 = *(void *)(*(void *)(v10 + 32) + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_type + 8);
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    uint64_t v19 = 0xE000000000000000;
  }
  uint64_t v20 = (uint64_t)v26;
  sub_23C32E500();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_21_8();
  sub_23C2F51D8(v20, v19);
  swift_endAccess();
  sub_23C30080C(v20, &qword_268B9AE30);
  unint64_t v21 = swift_bridgeObjectRetain();
  *((unsigned char *)v14 + OBJC_IVAR____TtCC24SiriNotificationsIntents16NotificationsApp7Builder_canUseSenderName) = sub_23C322838(v21, v10) & 1;
  type metadata accessor for NotificationsApp(0);
  swift_allocObject();
  uint64_t result = sub_23C2D9FD0((uint64_t)v14);
  *a2 = result;
  return result;
}

uint64_t sub_23C322E70(void *a1, unint64_t a2)
{
  uint64_t v2 = *a1 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent;
  int v3 = *(unsigned __int8 *)(v2 + 8);
  if (v3 == 255) {
    goto LABEL_56;
  }
  id v5 = *(id *)v2;
  id v6 = *(id *)v2;
  char v7 = (v3 & 1) != 0 ? sub_23C29F768() : sub_23C29F6D8();
  char v8 = v7;
  sub_23C305BA0(v5, v3);
  if ((v8 & 1) == 0) {
    goto LABEL_56;
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    if (!sub_23C32EA30()) {
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v9) {
      goto LABEL_55;
    }
  }
  unint64_t v10 = a2 & 0xC000000000000001;
  sub_23C29D9D0(0, (a2 & 0xC000000000000001) == 0, a2);
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = MEMORY[0x23ECE18A0](0, a2);
  }
  else
  {
    uint64_t v11 = *(void *)(a2 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_stackSummary);
  unint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_stackSummary + 8);
  swift_bridgeObjectRetain();
  swift_release();
  char v14 = sub_23C28C278(v12, v13);
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0) {
    goto LABEL_56;
  }
  int v15 = *(unsigned __int8 *)(v2 + 8);
  if (v15 != 255)
  {
    id v16 = *(id *)v2;
    id v17 = v16;
    if (v15)
    {
      char v19 = sub_23C29F580();
      sub_23C305BA0(v16, v15);
      if (v19)
      {
LABEL_16:
        id v20 = v17;
        uint64_t v21 = sub_23C29F834();
        uint64_t v23 = v22;
        sub_23C305BA0(v16, v15);
        goto LABEL_18;
      }
    }
    else
    {
      char v18 = sub_23C29F464();
      sub_23C305BA0(v16, v15);
      if (v18) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v21 = 0;
  uint64_t v23 = 0;
LABEL_18:
  uint64_t v52 = v21;
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = MEMORY[0x23ECE18A0](0, a2);
    swift_bridgeObjectRelease();
    id v25 = *(id *)(v24 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent);
    int v26 = *(unsigned __int8 *)(v24 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent + 8);
    sub_23C305B1C(v25, *(unsigned char *)(v24 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent + 8));
    swift_unknownObjectRelease();
    if (v26 != 255)
    {
      unint64_t v51 = a2 & 0xC000000000000001;
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    if (v23) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void *)(a2 + 32) + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent;
  int v26 = *(unsigned __int8 *)(v27 + 8);
  if (v26 == 255) {
    goto LABEL_26;
  }
  unint64_t v51 = a2 & 0xC000000000000001;
  id v25 = *(id *)v27;
  sub_23C305B1C(*(id *)v27, v26);
LABEL_23:
  id v28 = v25;
  if (v26)
  {
    char v32 = sub_23C29F580();

    if (v32)
    {
LABEL_30:
      id v33 = v28;
      uint64_t v30 = sub_23C29F834();
      uint64_t v31 = v34;

      goto LABEL_32;
    }
  }
  else
  {
    char v29 = sub_23C29F464();

    if (v29) {
      goto LABEL_30;
    }
  }
  uint64_t v30 = 0;
  uint64_t v31 = 0;
LABEL_32:
  sub_23C305BA0(v25, v26);
  unint64_t v10 = v51;
  if (!v23)
  {
LABEL_27:
    if (!v31) {
      goto LABEL_42;
    }
LABEL_55:
    swift_bridgeObjectRelease();
    goto LABEL_56;
  }
LABEL_33:
  if (!v31) {
    goto LABEL_55;
  }
  if (v52 == v30 && v23 == v31)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v36 = sub_23C32EB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v37 = 0;
    if ((v36 & 1) == 0) {
      return v37 & 1;
    }
  }
LABEL_42:
  if (!v10)
  {
    uint64_t v41 = *(void *)(a2 + 32) + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent;
    int v40 = *(unsigned __int8 *)(v41 + 8);
    if (v40 != 255)
    {
      id v39 = *(id *)v41;
      sub_23C305B1C(*(id *)v41, *(unsigned char *)(v41 + 8));
      goto LABEL_47;
    }
LABEL_56:
    char v37 = 0;
    return v37 & 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = MEMORY[0x23ECE18A0](0, a2);
  swift_bridgeObjectRelease();
  id v39 = *(id *)(v38 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent);
  int v40 = *(unsigned __int8 *)(v38 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent + 8);
  sub_23C305B1C(v39, *(unsigned char *)(v38 + OBJC_IVAR____TtC24SiriNotificationsIntents16ReadNotification_notificationContent + 8));
  swift_unknownObjectRelease();
  if (v40 == 255) {
    goto LABEL_56;
  }
LABEL_47:
  id v42 = v39;
  if ((v40 & 1) == 0)
  {
    char v43 = sub_23C29F464();

    if (v43) {
      goto LABEL_51;
    }
LABEL_52:
    uint64_t v46 = 0;
    unint64_t v48 = 0;
    goto LABEL_53;
  }
  char v44 = sub_23C29F580();

  if ((v44 & 1) == 0) {
    goto LABEL_52;
  }
LABEL_51:
  id v45 = v42;
  uint64_t v46 = sub_23C29F834();
  unint64_t v48 = v47;

LABEL_53:
  sub_23C305BA0(v39, v40);
  char v49 = sub_23C28C278(v46, v48);
  swift_bridgeObjectRelease();
  char v37 = v49 ^ 1;
  return v37 & 1;
}

uint64_t sub_23C3232EC()
{
  OUTLINED_FUNCTION_4();
  v1[7] = v0;
  uint64_t v2 = sub_23C32D470();
  OUTLINED_FUNCTION_31_0(v2);
  v1[8] = OUTLINED_FUNCTION_29_0();
  uint64_t v3 = sub_23C32D880();
  v1[9] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[10] = v4;
  v1[11] = OUTLINED_FUNCTION_29_0();
  uint64_t v5 = sub_23C32D310();
  v1[12] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[13] = v6;
  v1[14] = OUTLINED_FUNCTION_29_0();
  uint64_t v7 = sub_23C32D4C0();
  v1[15] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[16] = v8;
  v1[17] = OUTLINED_FUNCTION_29_0();
  uint64_t v9 = sub_23C32E350();
  v1[18] = v9;
  OUTLINED_FUNCTION_2_0(v9);
  v1[19] = v10;
  v1[20] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "23C323560: call analysis failed (funcsize=133)"

uint64_t sub_23C323654()
{
  OUTLINED_FUNCTION_4();
  v1[7] = v0;
  uint64_t v2 = sub_23C32D470();
  OUTLINED_FUNCTION_31_0(v2);
  v1[8] = OUTLINED_FUNCTION_29_0();
  uint64_t v3 = sub_23C32D880();
  v1[9] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[10] = v4;
  v1[11] = OUTLINED_FUNCTION_29_0();
  uint64_t v5 = sub_23C32D310();
  v1[12] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[13] = v6;
  v1[14] = OUTLINED_FUNCTION_29_0();
  uint64_t v7 = sub_23C32D4C0();
  v1[15] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[16] = v8;
  v1[17] = OUTLINED_FUNCTION_29_0();
  uint64_t v9 = sub_23C32E350();
  v1[18] = v9;
  OUTLINED_FUNCTION_2_0(v9);
  v1[19] = v10;
  v1[20] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "23C32386C: call analysis failed (funcsize=106)"

uint64_t sub_23C323950()
{
  OUTLINED_FUNCTION_4();
  v1[7] = v0;
  uint64_t v2 = sub_23C32D470();
  OUTLINED_FUNCTION_31_0(v2);
  v1[8] = OUTLINED_FUNCTION_29_0();
  uint64_t v3 = sub_23C32D880();
  v1[9] = v3;
  OUTLINED_FUNCTION_2_0(v3);
  v1[10] = v4;
  v1[11] = OUTLINED_FUNCTION_29_0();
  uint64_t v5 = sub_23C32D310();
  v1[12] = v5;
  OUTLINED_FUNCTION_2_0(v5);
  v1[13] = v6;
  v1[14] = OUTLINED_FUNCTION_29_0();
  uint64_t v7 = sub_23C32D4C0();
  v1[15] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[16] = v8;
  v1[17] = OUTLINED_FUNCTION_29_0();
  uint64_t v9 = sub_23C32E350();
  v1[18] = v9;
  OUTLINED_FUNCTION_2_0(v9);
  v1[19] = v10;
  v1[20] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "23C323B68: call analysis failed (funcsize=106)"

uint64_t sub_23C323C4C()
{
  OUTLINED_FUNCTION_4();
  v1[5] = v2;
  v1[6] = v0;
  v1[4] = v3;
  uint64_t v4 = sub_23C32E350();
  v1[7] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[8] = v5;
  v1[9] = OUTLINED_FUNCTION_29_0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF70);
  OUTLINED_FUNCTION_31_0(v6);
  v1[10] = OUTLINED_FUNCTION_29_0();
  uint64_t v7 = sub_23C32D3C0();
  v1[11] = v7;
  OUTLINED_FUNCTION_2_0(v7);
  v1[12] = v8;
  v1[13] = OUTLINED_FUNCTION_30_0();
  v1[14] = swift_task_alloc();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_23C323D3C()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0[12];
  sub_23C32D3B0();
  OUTLINED_FUNCTION_76_0();
  char v2 = sub_23C32D3A0();
  uint64_t v3 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_11_3();
  v3();
  if (v2)
  {
    v0[3] = v0[6];
    __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF88);
    type metadata accessor for RNReadNotificationsFlowProvider();
    sub_23C329570(&qword_268B9C628, v4, (void (*)(uint64_t))type metadata accessor for RNReadNotificationsFlowProvider);
    sub_23C32D180();
    sub_23C32D820();
    uint64_t v5 = 0;
  }
  else
  {
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[8];
    uint64_t v6 = v0[9];
    uint64_t v8 = v0[7];
    uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_268BA3998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    OUTLINED_FUNCTION_21_6();
    v10();
    uint64_t v11 = sub_23C32E340();
    os_log_type_t v12 = sub_23C32E740();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (_DWORD *)OUTLINED_FUNCTION_7_1();
      uint64_t v22 = OUTLINED_FUNCTION_30_1();
      _DWORD *v13 = 136315138;
      sub_23C329570(&qword_268B9BF80, 255, MEMORY[0x263F6F7C8]);
      uint64_t v14 = sub_23C32EB40();
      v0[2] = sub_23C2A9890(v14, v15, &v22);
      sub_23C32E830();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_3();
      v3();
      OUTLINED_FUNCTION_62_1(&dword_23C289000, v11, v12, "Unsupported promptType '%s'. Will not support windowing.");
      uint64_t v5 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_2();

      OUTLINED_FUNCTION_64_1();
      v16();
    }
    else
    {
      OUTLINED_FUNCTION_11_3();
      v3();

      OUTLINED_FUNCTION_64_1();
      v17();
      uint64_t v5 = 1;
    }
  }
  uint64_t v18 = v0[4];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF78);
  __swift_storeEnumTagSinglePayload(v18, v5, 1, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_3();
  return v20();
}

uint64_t sub_23C3240F8()
{
  OUTLINED_FUNCTION_4();
  v1[88] = v0;
  v1[87] = v2;
  v1[86] = v3;
  uint64_t v4 = sub_23C32D950();
  v1[89] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[90] = v5;
  v1[91] = *(void *)(v6 + 64);
  v1[92] = OUTLINED_FUNCTION_30_0();
  v1[93] = swift_task_alloc();
  v1[94] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  OUTLINED_FUNCTION_31_0(v7);
  v1[95] = OUTLINED_FUNCTION_29_0();
  uint64_t v8 = sub_23C32E350();
  v1[96] = v8;
  OUTLINED_FUNCTION_2_0(v8);
  v1[97] = v9;
  v1[98] = OUTLINED_FUNCTION_30_0();
  v1[99] = swift_task_alloc();
  v1[100] = swift_task_alloc();
  v1[101] = swift_task_alloc();
  v1[102] = swift_task_alloc();
  v1[103] = swift_task_alloc();
  v1[104] = swift_task_alloc();
  v1[105] = swift_task_alloc();
  v1[106] = swift_task_alloc();
  v1[107] = swift_task_alloc();
  v1[108] = swift_task_alloc();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_23C324278()
{
  uint64_t v166 = v0;
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint8_t *)(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 864);
  v156 = (void (**)(uint64_t))(*(void *)(v0 + 776) + 16);
  __swift_project_value_buffer(*(void *)(v0 + 768), (uint64_t)qword_268BA3998);
  (*v156)(v2);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_23C32E340();
  os_log_type_t v4 = sub_23C32E720();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 864);
  uint64_t v7 = *(void *)(v0 + 776);
  uint64_t v8 = *(void *)(v0 + 768);
  if (v5)
  {
    uint64_t v154 = *(void *)(v0 + 864);
    uint64_t v153 = *(void *)(v0 + 768);
    uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_7_1();
    v165 = (void (*)(void, void))OUTLINED_FUNCTION_30_1();
    *uint64_t v9 = 136315138;
    uint64_t v150 = (uint64_t)(v9 + 1);
    uint64_t v10 = type metadata accessor for NotificationsApp(0);
    uint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v12 = MEMORY[0x23ECE1580](v11, v10);
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = sub_23C2A9890(v12, v14, (uint64_t *)&v165);
    sub_23C32E830();
    OUTLINED_FUNCTION_28_6();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_77_0(&dword_23C289000, v15, v16, "RNReadNotificationsFlowProvider makeWindowFlow | windowContent: %s");
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();

    id v17 = *(void (**)(void))(v7 + 8);
    ((void (*)(uint64_t, uint64_t))v17)(v154, v153);
  }
  else
  {

    OUTLINED_FUNCTION_28_6();
    id v17 = *(void (**)(void))(v7 + 8);
    ((void (*)(uint64_t, uint64_t))v17)(v6, v8);
  }
  OUTLINED_FUNCTION_21_13();
  v18();
  OUTLINED_FUNCTION_75();
  uint64_t v19 = sub_23C32E340();
  os_log_type_t v20 = sub_23C32E720();
  v155 = v17;
  if (!os_log_type_enabled(v19, v20))
  {
    unint64_t v28 = *(void *)(v0 + 856);
    uint64_t v29 = *(void *)(v0 + 768);
    unint64_t v21 = *(void *)(v0 + 696);

    OUTLINED_FUNCTION_53_3();
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_12_7();
    v17();
    goto LABEL_19;
  }
  LOBYTE(v153) = v20;
  unint64_t v21 = *(void *)(v0 + 696);
  uint64_t v1 = (uint8_t *)OUTLINED_FUNCTION_7_1();
  id v17 = (void (*)(void))OUTLINED_FUNCTION_30_1();
  v165 = (void (*)(void, void))v17;
  *(_DWORD *)uint64_t v1 = 136315138;
  uint64_t v22 = *(void *)(v0 + 696);
  if (v21 >> 62) {
    goto LABEL_110;
  }
  OUTLINED_FUNCTION_55_2();
  swift_bridgeObjectRetain();
LABEL_9:
  if (v3)
  {
    sub_23C29D9D0(0, (v21 & 0xC000000000000001) == 0, v22);
    uint64_t v23 = *(void *)(v0 + 760);
    uint64_t v24 = *(void *)(v0 + 696);
    id v25 = &OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_appName;
    if ((v21 & 0xC000000000000001) == 0)
    {
      uint64_t v26 = *(void *)(v24 + 32);
      swift_retain();
      swift_bridgeObjectRelease();
      sub_23C2928D4(v26 + OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_appName, v23);
      swift_release();
      goto LABEL_12;
    }
    goto LABEL_118;
  }
  OUTLINED_FUNCTION_74_0();
  swift_bridgeObjectRelease();
LABEL_16:
  unint64_t v30 = 0xE700000000000000;
  while (1)
  {
    uint64_t v150 = *(void *)(v0 + 856);
    uint64_t v29 = *(void *)(v0 + 768);
    unint64_t v28 = *(void *)(v0 + 696);
    *(void *)(v0 + 640) = sub_23C2A9890((uint64_t)v17, v30, (uint64_t *)&v165);
    sub_23C32E830();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C289000, v19, (os_log_type_t)v153, "RNReadNotificationsFlowProvider makeWindowFlow | App is: %s", v1, 0xCu);
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();

    id v17 = v155;
    OUTLINED_FUNCTION_12_7();
    v155();
LABEL_19:
    uint64_t v34 = *(void *)(v0 + 696);
    id v25 = (uint64_t *)MEMORY[0x263F8EE78];
    v165 = (void (*)(void, void))MEMORY[0x263F8EE78];
    if ((unint64_t)v34 >> 62)
    {
      if (v34 < 0) {
        unint64_t v28 = v34;
      }
      else {
        unint64_t v28 = v21 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_23C32EA30();
      if (!v29)
      {
LABEL_32:
        swift_bridgeObjectRelease();
        unint64_t v21 = MEMORY[0x263F8EE78];
        goto LABEL_33;
      }
    }
    else
    {
      OUTLINED_FUNCTION_55_2();
      swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_32;
      }
    }
    if (v29 < 1)
    {
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_23C32EA30();
      uint64_t v22 = *(void *)(v0 + 696);
      goto LABEL_9;
    }
    uint64_t v19 = 0;
    uint64_t v1 = (uint8_t *)(*(void *)(v0 + 696) + 32);
    do
    {
      if ((v21 & 0xC000000000000001) != 0) {
        MEMORY[0x23ECE18A0](v19, *(void *)(v0 + 696));
      }
      else {
        swift_retain();
      }
      uint64_t v19 = ((char *)v19 + 1);
      OUTLINED_FUNCTION_36_9();
      swift_release();
      unint64_t v28 = (unint64_t)&v165;
      sub_23C31012C(v21);
    }
    while (v29 != v19);
    swift_bridgeObjectRelease();
    unint64_t v21 = (unint64_t)v165;
LABEL_33:
    if (v21 >> 62)
    {
      OUTLINED_FUNCTION_7_22();
      uint64_t v29 = sub_23C32EA30();
      swift_bridgeObjectRelease();
      if (!v29)
      {
LABEL_40:
        swift_bridgeObjectRelease();
        unint64_t v37 = MEMORY[0x263F8EE78];
        goto LABEL_41;
      }
    }
    else
    {
      OUTLINED_FUNCTION_55_2();
      if (!v29) {
        goto LABEL_40;
      }
    }
    v165 = (void (*)(void, void))v25;
    sub_23C32E9C0();
    if (v29 < 0) {
      goto LABEL_109;
    }
    sub_23C28F9FC(0, (unint64_t *)&qword_268B9AF38);
    uint64_t v35 = 0;
    do
    {
      uint64_t v1 = v35 + 1;
      uint64_t v36 = swift_retain();
      id v25 = (uint64_t *)sub_23C329F64(v36);
      unint64_t v28 = (unint64_t)&v165;
      sub_23C32E9A0();
      sub_23C32E9D0();
      sub_23C32E9E0();
      sub_23C32E9B0();
      uint64_t v35 = v1;
    }
    while ((uint8_t *)v29 != v1);
    unint64_t v37 = (unint64_t)v165;
    swift_bridgeObjectRelease();
LABEL_41:
    uint64_t v38 = *(void *)(v0 + 704);
    uint64_t v39 = *(void *)(v38 + 320);
    uint64_t v19 = (v39 + 1);
    if (__OFADD__(v39, 1))
    {
      __break(1u);
    }
    else
    {
      unint64_t v28 = *(void *)(v38 + 120);
      if (!(v28 >> 62))
      {
        uint64_t v40 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_44;
      }
    }
    OUTLINED_FUNCTION_23_2();
    uint64_t v40 = sub_23C32EA30();
    swift_bridgeObjectRelease();
LABEL_44:
    if (v19 == v40)
    {
      uint64_t v150 = 0;
      goto LABEL_56;
    }
    uint64_t v41 = *(void *)(v38 + 320);
    unint64_t v21 = v41 + 1;
    if (__OFADD__(v41, 1))
    {
      __break(1u);
LABEL_112:
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_23C32EA30();
      swift_bridgeObjectRelease();
LABEL_59:
      swift_bridgeObjectRelease();
      *id v25 = v46;
      sub_23C32E830();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_62_1(&dword_23C289000, v28, (os_log_type_t)v21, "RNReadNotificationsFlowProvider notification count: %ld");
      OUTLINED_FUNCTION_2();
      goto LABEL_61;
    }
    uint64_t v23 = *(void *)(v38 + 120);
    if (!((unint64_t)v23 >> 62)) {
      break;
    }
    if (v23 < 0) {
      uint64_t v24 = *(void *)(v38 + 120);
    }
    else {
      uint64_t v24 = v23 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v143 = sub_23C32EA30();
    if ((v143 & 0x8000000000000000) == 0)
    {
      unint64_t v42 = v143;
      goto LABEL_49;
    }
    __break(1u);
LABEL_118:
    uint64_t v144 = MEMORY[0x23ECE18A0](0, v24);
    swift_bridgeObjectRelease();
    sub_23C2928D4(v144 + *v25, v23);
    swift_unknownObjectRelease();
LABEL_12:
    uint64_t v27 = sub_23C32E170();
    if (__swift_getEnumTagSinglePayload(v23, 1, v27) == 1)
    {
      OUTLINED_FUNCTION_74_0();
      sub_23C30080C(*(void *)(v0 + 760), &qword_268B9AE30);
      goto LABEL_16;
    }
    id v17 = (void (*)(void))sub_23C32E160();
    unint64_t v30 = v31;
    sub_23C32E170();
    OUTLINED_FUNCTION_6_15();
    uint64_t v32 = OUTLINED_FUNCTION_76_0();
    v33(v32);
  }
  unint64_t v42 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_49:
  uint64_t v150 = 0;
  if ((v21 & 0x8000000000000000) == 0 && v21 < v42)
  {
    OUTLINED_FUNCTION_50_5();
    if ((v23 & 0xC000000000000001) != 0)
    {
      uint64_t v145 = MEMORY[0x23ECE18A0](v21, v23);
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void *)(v145 + 24);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      if (v44 < 0) {
        goto LABEL_120;
      }
LABEL_53:
      if ((v44 & 0x4000000000000000) != 0) {
        goto LABEL_120;
      }
      uint64_t v150 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    else
    {
      uint64_t v43 = *(void *)(v23 + 8 * v21 + 32);
      swift_retain();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void *)(v43 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      if ((v44 & 0x8000000000000000) == 0) {
        goto LABEL_53;
      }
LABEL_120:
      OUTLINED_FUNCTION_23_2();
      uint64_t v150 = sub_23C32EA30();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
LABEL_56:
  uint64_t v19 = (v0 + 632);
  LOBYTE(v153) = sub_23C327F00();
  OUTLINED_FUNCTION_21_13();
  v45();
  swift_bridgeObjectRetain_n();
  unint64_t v28 = sub_23C32E340();
  LOBYTE(v21) = sub_23C32E720();
  if (os_log_type_enabled((os_log_t)v28, (os_log_type_t)v21))
  {
    id v25 = (uint64_t *)(v0 + 624);
    *(_DWORD *)OUTLINED_FUNCTION_7_1() = 134217984;
    if (v37 >> 62) {
      goto LABEL_112;
    }
    uint64_t v46 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_59;
  }
  OUTLINED_FUNCTION_28_6();
LABEL_61:

  uint64_t v47 = *(void *)(v0 + 768);
  OUTLINED_FUNCTION_67();
  v17();
  OUTLINED_FUNCTION_21_13();
  v48();
  char v49 = sub_23C32E340();
  os_log_type_t v50 = sub_23C32E720();
  if (OUTLINED_FUNCTION_13_2(v50))
  {
    *(_DWORD *)OUTLINED_FUNCTION_7_1() = 134217984;
    v19->isa = (Class)v150;
    sub_23C32E830();
    OUTLINED_FUNCTION_62_1(&dword_23C289000, v49, (os_log_type_t)v47, "RNReadNotificationsFlowProvider next window notification count: %ld");
    OUTLINED_FUNCTION_2();
  }
  uint64_t v152 = v37;
  uint64_t v51 = *(void *)(v0 + 840);

  OUTLINED_FUNCTION_67();
  v17();
  OUTLINED_FUNCTION_21_13();
  v52();
  unint64_t v53 = sub_23C32E340();
  os_log_type_t v54 = sub_23C32E720();
  if (OUTLINED_FUNCTION_13_2(v54))
  {
    unint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v55 = 67109120;
    *(_DWORD *)(v0 + 872) = v153 & 1;
    sub_23C32E830();
    _os_log_impl(&dword_23C289000, v53, (os_log_type_t)v51, "RNReadNotificationsFlowProvider containsStackSummary: %{BOOL}d", v55, 8u);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_67();
  v17();
  OUTLINED_FUNCTION_21_13();
  v56();
  swift_retain_n();
  v57 = sub_23C32E340();
  os_log_type_t v58 = sub_23C32E720();
  BOOL v59 = os_log_type_enabled(v57, v58);
  uint64_t v60 = *(void *)(v0 + 704);
  if (v59)
  {
    uint64_t v61 = OUTLINED_FUNCTION_30_1();
    v165 = (void (*)(void, void))swift_slowAlloc();
    *(_DWORD *)uint64_t v61 = 136315650;
    uint64_t v62 = *(void *)(v60 + 112);
    *(void *)(v0 + 584) = *(void *)(v60 + 104);
    *(void *)(v0 + 592) = v62;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF40);
    uint64_t v63 = sub_23C32E4D0();
    *(void *)(v0 + 648) = sub_23C2A9890(v63, v64, (uint64_t *)&v165);
    sub_23C32E830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v61 + 12) = 2080;
    *(void *)(v0 + 568) = sub_23C328298();
    *(void *)(v0 + 576) = v65;
    uint64_t v66 = sub_23C32E4D0();
    *(void *)(v0 + 664) = sub_23C2A9890(v66, v67, (uint64_t *)&v165);
    id v17 = v155;
    sub_23C32E830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v61 + 22) = 2080;
    *(void *)(v0 + 552) = sub_23C32806C();
    *(void *)(v0 + 560) = v68;
    uint64_t v69 = sub_23C32E4D0();
    *(void *)(v0 + 680) = sub_23C2A9890(v69, v70, (uint64_t *)&v165);
    sub_23C32E830();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C289000, v57, v58, "RNReadNotificationsFlowProvider repeatThreadId: %s, previousThreadId: %s, currentThreadId: %s", (uint8_t *)v61, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();
  }
  else
  {

    swift_release_n();
  }
  OUTLINED_FUNCTION_64_1();
  v17();
  uint64_t v71 = *(void *)(v0 + 720);
  OUTLINED_FUNCTION_21_13();
  v72();
  v73 = *(void (**)(void))(v71 + 16);
  OUTLINED_FUNCTION_21_6();
  v73();
  v148 = v73;
  OUTLINED_FUNCTION_21_6();
  v73();
  v74 = sub_23C32E340();
  os_log_type_t v75 = sub_23C32E720();
  BOOL v76 = os_log_type_enabled(v74, v75);
  uint64_t v77 = *(void *)(v0 + 752);
  uint64_t v78 = *(void *)(v0 + 720);
  uint64_t v79 = *(void *)(v0 + 712);
  if (v76)
  {
    log = v74;
    uint64_t v80 = swift_slowAlloc();
    *(_DWORD *)uint64_t v80 = 67109376;
    int v81 = sub_23C32D910() & 1;
    os_log_type_t type = v75;
    uint64_t v82 = *(void *)(v78 + 8);
    OUTLINED_FUNCTION_45_4();
    ((void (*)(void))v82)();
    *(_DWORD *)(v0 + 880) = v81;
    sub_23C32E830();
    *(_WORD *)(v80 + 8) = 1024;
    int v83 = sub_23C32D900() & 1;
    OUTLINED_FUNCTION_45_4();
    ((void (*)(void))v82)();
    *(_DWORD *)(v0 + 876) = v83;
    id v17 = v155;
    sub_23C32E830();
    _os_log_impl(&dword_23C289000, log, type, "RNReadNotificationsFlowProvider: isLastWindow: %{BOOL}d isConclusion: %{BOOL}d", (uint8_t *)v80, 0xEu);
    v74 = log;
    OUTLINED_FUNCTION_2();
  }
  else
  {
    uint64_t v82 = *(void *)(v78 + 8);
    OUTLINED_FUNCTION_45_4();
    ((void (*)(void))v82)();
    ((void (*)(uint64_t, uint64_t))v82)(v77, v79);
  }
  v84 = (char *)(v0 + 885);

  OUTLINED_FUNCTION_76_0();
  OUTLINED_FUNCTION_12_7();
  v17();
  *(unsigned char *)(v0 + 885) = 2;
  if (v153)
  {
    char v85 = 0;
    goto LABEL_75;
  }
  if (v150 < 2)
  {
    char v85 = 2;
  }
  else
  {
    char v85 = 1;
LABEL_75:
    char *v84 = v85;
  }
  uint64_t v86 = sub_23C328298();
  if (!v87) {
    goto LABEL_88;
  }
  uint64_t v88 = v87;
  uint64_t v89 = *(void *)(v0 + 704);
  uint64_t v90 = *(void *)(v89 + 112);
  if (!v90)
  {
    swift_bridgeObjectRelease();
    goto LABEL_86;
  }
  if (*(void *)(v89 + 104) == v86 && v90 == v88)
  {
    swift_bridgeObjectRelease();
    goto LABEL_88;
  }
  uint64_t v82 = sub_23C32EB60();
  swift_bridgeObjectRelease();
  if ((v82 & 1) == 0) {
LABEL_86:
  }
    sub_23C3284B4(0);
LABEL_88:
  if (sub_23C32D900())
  {
    v157 = (const void *)(v0 + 16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_21_13();
    v92();
    v93 = sub_23C32E340();
    os_log_type_t v94 = sub_23C32E720();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)OUTLINED_FUNCTION_10_1();
      *(_WORD *)v95 = 0;
      _os_log_impl(&dword_23C289000, v93, v94, "RNReadNotificationsFlowProvider concluding RNReadNotificationsFlow", v95, 2u);
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_48_5();
    uint64_t v96 = *(void *)(v0 + 704);
    uint64_t v161 = *(void *)(v0 + 696);

    OUTLINED_FUNCTION_20_0();
    v97();
    uint64_t v98 = OUTLINED_FUNCTION_42_5();
    v99(v98);
    OUTLINED_FUNCTION_30_8();
    uint64_t v100 = swift_allocObject();
    *(void *)(v100 + 16) = v96;
    uint64_t v101 = OUTLINED_FUNCTION_41_6(v100);
    v102(v101);
    *(void *)(v100 + v82) = v161;
    sub_23C28BE4C(v96 + 160, (uint64_t)v157);
    type metadata accessor for RNConclusionFlow();
    v103 = (void *)swift_allocObject();
    v103[2] = &unk_268B9C618;
    v103[3] = v100;
    memcpy(v103 + 4, v157, 0x80uLL);
    *(void *)(v0 + 616) = v103;
    sub_23C329570(&qword_268B9C0A8, 255, (void (*)(uint64_t))type metadata accessor for RNConclusionFlow);
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    uint64_t v104 = v0 + 528;
    OUTLINED_FUNCTION_21_13();
    v105();
    v106 = sub_23C32E340();
    os_log_type_t v107 = sub_23C32E720();
    BOOL v108 = os_log_type_enabled(v106, v107);
    v109 = *(uint8_t **)(v0 + 808);
    uint64_t v110 = *(void *)(v0 + 768);
    if (v108)
    {
      v111 = (uint8_t *)OUTLINED_FUNCTION_7_1();
      v165 = (void (*)(void, void))OUTLINED_FUNCTION_30_1();
      *(_DWORD *)v111 = 136315138;
      v109 = (uint8_t *)(v0 + 885);
      *(unsigned char *)(v0 + 884) = v85;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C608);
      v84 = (char *)(v0 + 885);
      uint64_t v112 = sub_23C32E4D0();
      *(void *)(v0 + 600) = sub_23C2A9890(v112, v113, (uint64_t *)&v165);
      sub_23C32E830();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C289000, v106, v107, "RNReadNotificationsFlowProvider promptTypeNeeded: %s", v111, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
      uint64_t v104 = v0 + 528;
      OUTLINED_FUNCTION_2();

      OUTLINED_FUNCTION_20_0();
      v114();
    }
    else
    {

      ((void (*)(uint8_t *, uint64_t))v17)(v109, v110);
    }
    swift_beginAccess();
    int v115 = *v84;
    if (v115 == 2 || (*(unsigned char *)(*(void *)(v0 + 704) + 329) & 1) != 0)
    {
      v158 = (void *)(v0 + 272);
      OUTLINED_FUNCTION_21_13();
      v116();
      v117 = sub_23C32E340();
      os_log_type_t v118 = sub_23C32E720();
      if (os_log_type_enabled(v117, v118))
      {
        v119 = (uint8_t *)OUTLINED_FUNCTION_10_1();
        *(_WORD *)v119 = 0;
        _os_log_impl(&dword_23C289000, v117, v118, "RNReadNotificationsFlowProvider not triggering prompt", v119, 2u);
        OUTLINED_FUNCTION_2();
      }
      OUTLINED_FUNCTION_48_5();
      uint64_t v120 = *(void *)(v0 + 704);
      uint64_t v162 = *(void *)(v0 + 696);

      OUTLINED_FUNCTION_20_0();
      v121();
      uint64_t v122 = OUTLINED_FUNCTION_42_5();
      v123(v122);
      OUTLINED_FUNCTION_30_8();
      uint64_t v124 = swift_allocObject();
      *(void *)(v124 + 16) = v120;
      uint64_t v125 = OUTLINED_FUNCTION_41_6(v124);
      v126(v125);
      *(void *)(v124 + v104) = v162;
      sub_23C28BE4C(v120 + 160, (uint64_t)v158);
      type metadata accessor for RNNoPromptFlow();
      swift_allocObject();
      *(void *)(v0 + 672) = sub_23C2D33F4(v158, v152, (uint64_t)&unk_268B9C5E0, v124, (uint64_t)sub_23C3295B8, v120, (uint64_t)sub_23C3292A8, v120, v153 & 1);
      sub_23C329570(&qword_268B9BA00, 255, (void (*)(uint64_t))type metadata accessor for RNNoPromptFlow);
      swift_retain_n();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v159 = v0 + 144;
      uint64_t v149 = v0 + 400;
      char v151 = v115 & 1;
      OUTLINED_FUNCTION_21_13();
      v127();
      v128 = sub_23C32E340();
      os_log_type_t v129 = sub_23C32E720();
      if (os_log_type_enabled(v128, v129))
      {
        v130 = (_WORD *)OUTLINED_FUNCTION_10_1();
        OUTLINED_FUNCTION_54(v130);
        _os_log_impl(&dword_23C289000, v128, v129, "RNReadNotificationsFlowProvider triggering follow up", v109, 2u);
        OUTLINED_FUNCTION_2();
      }
      uint64_t v131 = *(void *)(v0 + 736);
      uint64_t v132 = *(void *)(v0 + 728);
      uint64_t v133 = *(void *)(v0 + 720);
      uint64_t v134 = *(void *)(v0 + 712);
      uint64_t v135 = *(void *)(v0 + 704);
      uint64_t v160 = *(void *)(v0 + 696);
      uint64_t v136 = *(void *)(v0 + 688);

      OUTLINED_FUNCTION_20_0();
      v137();
      sub_23C28BE4C(v135 + 160, v149);
      char v163 = *(unsigned char *)(v135 + 328);
      ((void (*)(uint64_t, uint64_t, uint64_t))v148)(v131, v136, v134);
      unint64_t v138 = (*(unsigned __int8 *)(v133 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
      uint64_t v139 = swift_allocObject();
      *(void *)(v139 + 16) = v135;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v133 + 32))(v139 + v138, v131, v134);
      *(void *)(v139 + ((v132 + v138 + 7) & 0xFFFFFFFFFFFFFFF8)) = v160;
      type metadata accessor for RNPromptForFollowupStrategy();
      swift_allocObject();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v140 = sub_23C2E6670(v149, v152, v163, v153 & 1, (uint64_t)&unk_268B9C5F0, v139);
      sub_23C28BE4C(v135 + 160, v159);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C5F8);
      swift_allocObject();
      swift_retain_n();
      *(void *)(v0 + 656) = sub_23C322634(v140, v151, v159, (uint64_t)sub_23C329374, v135, (uint64_t)sub_23C32937C, v135, (uint64_t)sub_23C3292A8, v135);
      sub_23C2F0FF8(&qword_268B9C600, &qword_268B9C5F8);
    }
  }
  uint64_t v164 = sub_23C32D250();
  swift_release();
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
  v141 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v141(v164);
}

uint64_t sub_23C325A04()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F2F14;
  return sub_23C326604();
}

uint64_t sub_23C325AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_23C325AD8, 0, 0);
}

uint64_t sub_23C325AD8()
{
  OUTLINED_FUNCTION_4();
  if (*(unsigned char *)(v0[2] + 328))
  {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v1 = v0[4];
    swift_bridgeObjectRetain();
  }
  v0[5] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23C325B98;
  return sub_23C326604();
}

uint64_t sub_23C325B98()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v7 = v6;
  *(void *)(v5 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_6();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = *(uint64_t (**)(uint64_t))(v6 + 8);
    return v11(v3);
  }
}

uint64_t sub_23C325CBC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C326604();
}

uint64_t sub_23C325D6C()
{
  OUTLINED_FUNCTION_4();
  v1[4] = v2;
  v1[5] = v0;
  v1[3] = v3;
  uint64_t v4 = sub_23C32E350();
  v1[6] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_23C325DFC()
{
  uint64_t v24 = v0;
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268BA3998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_23C32E340();
  os_log_type_t v6 = sub_23C32E720();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v22 = v0[8];
    uint64_t v11 = (_DWORD *)OUTLINED_FUNCTION_7_1();
    uint64_t v23 = OUTLINED_FUNCTION_30_1();
    *uint64_t v11 = 136315138;
    uint64_t v12 = type metadata accessor for NotificationsApp(0);
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x23ECE1580](v13, v12);
    uint64_t v21 = v10;
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    v0[2] = sub_23C2A9890(v14, v16, &v23);
    sub_23C32E830();
    OUTLINED_FUNCTION_28_6();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_77_0(&dword_23C289000, v17, v18, "RNReadNotificationsFlowProvider makeFinalWindowFlow | windowContent: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v22, v21);
  }
  else
  {

    OUTLINED_FUNCTION_28_6();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v19 = (void *)swift_task_alloc();
  v0[9] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_23C32605C;
  return sub_23C3240F8();
}

uint64_t sub_23C32605C()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  uint64_t v6 = swift_task_dealloc();
  BOOL v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_23C32617C()
{
  OUTLINED_FUNCTION_4();
  v1[3] = v0;
  uint64_t v2 = sub_23C32D950();
  v1[4] = v2;
  OUTLINED_FUNCTION_2_0(v2);
  v1[5] = v3;
  v1[6] = OUTLINED_FUNCTION_29_0();
  uint64_t v4 = sub_23C32E350();
  v1[7] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[8] = v5;
  v1[9] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_23C326238(uint64_t a1)
{
  if (qword_268B9AC70 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = OUTLINED_FUNCTION_3_12(a1, (uint64_t)qword_268BA3998);
  v3(v2);
  uint64_t v4 = (void *)sub_23C32E340();
  os_log_type_t v5 = sub_23C32E720();
  if (OUTLINED_FUNCTION_13_2(v5))
  {
    uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_54(v6);
    OUTLINED_FUNCTION_27(&dword_23C289000, v7, v8, "RNReadNotificationsFlowProvider makeConclusionFlow");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_64_1();
  v9();
  sub_23C32D930();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 80) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_23C326398;
  return sub_23C3240F8();
}

uint64_t sub_23C326398()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v7 = v6;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 96) = v3;
  }
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_23C32648C()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C5C8);
  sub_23C2F0FF8(&qword_268B9C5D0, &qword_268B9C5C8);
  sub_23C32D240();
  swift_release();
  OUTLINED_FUNCTION_11_3();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = OUTLINED_FUNCTION_4_22();
  return v3(v2);
}

uint64_t sub_23C326584()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12_7();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_3();
  return v1();
}

uint64_t sub_23C326604()
{
  OUTLINED_FUNCTION_4();
  *(void *)(v1 + 200) = v2;
  *(void *)(v1 + 208) = v0;
  *(unsigned char *)(v1 + 344) = v3;
  *(void *)(v1 + 192) = v4;
  uint64_t v5 = sub_23C32E250();
  *(void *)(v1 + 216) = v5;
  OUTLINED_FUNCTION_2_0(v5);
  *(void *)(v1 + 224) = v6;
  *(void *)(v1 + 232) = OUTLINED_FUNCTION_29_0();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  OUTLINED_FUNCTION_31_0(v7);
  *(void *)(v1 + 240) = OUTLINED_FUNCTION_30_0();
  *(void *)(v1 + 248) = swift_task_alloc();
  *(void *)(v1 + 256) = swift_task_alloc();
  uint64_t v8 = sub_23C32E350();
  *(void *)(v1 + 264) = v8;
  OUTLINED_FUNCTION_2_0(v8);
  *(void *)(v1 + 272) = v9;
  *(void *)(v1 + 280) = OUTLINED_FUNCTION_30_0();
  *(void *)(v1 + 288) = swift_task_alloc();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_23C326710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_20_7();
  a31 = v35;
  a32 = v36;
  OUTLINED_FUNCTION_54_1();
  a30 = v32;
  uint64_t v37 = v32;
  if (qword_268B9AC70 != -1) {
LABEL_66:
  }
    swift_once();
  uint64_t v38 = *(void *)(v37 + 272);
  uint64_t v39 = __swift_project_value_buffer(*(void *)(v37 + 264), (uint64_t)qword_268BA3998);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
  unint64_t v40 = v38 + 16;
  uint64_t v161 = v41;
  uint64_t v162 = v39;
  OUTLINED_FUNCTION_21_6();
  v42();
  unint64_t v43 = sub_23C32E340();
  os_log_type_t v44 = sub_23C32E720();
  if (os_log_type_enabled((os_log_t)v43, v44))
  {
    id v45 = (uint8_t *)OUTLINED_FUNCTION_10_1();
    *(_WORD *)id v45 = 0;
    _os_log_impl(&dword_23C289000, (os_log_t)v43, v44, "RNReadNotificationsFlowProvider in executePatternForWindow", v45, 2u);
    OUTLINED_FUNCTION_2();
  }
  uint64_t v46 = *(void *)(v37 + 288);
  uint64_t v47 = *(void *)(v37 + 264);
  uint64_t v48 = *(void *)(v37 + 272);
  unint64_t v49 = *(void *)(v37 + 208);

  uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
  unint64_t v50 = v48 + 8;
  v51(v46, v47);
  uint64_t v52 = *(void *)(v49 + 120);
  unint64_t v164 = v52;
  if ((unint64_t)v52 >> 62)
  {
    if (v52 < 0) {
      unint64_t v43 = *(void *)(v49 + 120);
    }
    else {
      unint64_t v43 = v52 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v53 = sub_23C32EA30();
  }
  else
  {
    uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
  }
  unint64_t v163 = v49;
  uint64_t v166 = (void *)v37;
  if (v53)
  {
    if (v53 < 1) {
      goto LABEL_109;
    }
    uint64_t v54 = 0;
    a18 = v37 + 56;
    uint64_t v33 = v37 + 120;
    uint64_t v34 = v37 + 88;
    uint64_t v55 = MEMORY[0x263F8EE78];
    unint64_t v56 = v164;
    do
    {
      uint64_t v57 = v53;
      if ((v164 & 0xC000000000000001) != 0)
      {
        uint64_t v58 = MEMORY[0x23ECE18A0](v54, v56);
      }
      else
      {
        uint64_t v58 = *(void *)(v56 + 8 * v54 + 32);
        swift_retain();
      }
      if (*(unsigned char *)(v58 + OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_canUseSenderName) != 1)
      {
        uint64_t v63 = *(void *)(v37 + 248);
        sub_23C2928D4(v58 + OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_appName, v63);
        uint64_t v46 = v37;
        uint64_t v64 = sub_23C32E170();
        int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v63, 1, v64);
        uint64_t v66 = *(void *)(v46 + 248);
        if (EnumTagSinglePayload == 1)
        {
          sub_23C30080C(*(void *)(v46 + 248), &qword_268B9AE30);
          *(_OWORD *)uint64_t v34 = 0u;
          *(_OWORD *)(v34 + 16) = 0u;
        }
        else
        {
          uint64_t v67 = sub_23C32E160();
          *(void *)(v46 + 112) = MEMORY[0x263F8D310];
          *(void *)(v46 + 88) = v67;
          *(void *)(v46 + 96) = v68;
          OUTLINED_FUNCTION_6_15();
          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v66, v64);
        }
        uint64_t v37 = v46;
        goto LABEL_28;
      }
      unint64_t v59 = *(void *)(v58 + 24);
      if (v59 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_23C32EA30();
        if (!v37)
        {
LABEL_26:
          swift_bridgeObjectRelease();
          uint64_t v37 = (uint64_t)v166;
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v37 = *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v37) {
          goto LABEL_26;
        }
      }
      if ((v59 & 0xC000000000000001) != 0)
      {
        uint64_t v60 = v166;
        uint64_t v46 = v166[32];
        OUTLINED_FUNCTION_34_3();
        uint64_t v76 = v75;
        swift_bridgeObjectRelease();
        sub_23C2928D4(v76 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_senderDisplayName, v46);
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v60 = v166;
        if (!*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_66;
        }
        uint64_t v46 = v166[32];
        uint64_t v61 = *(void *)(v59 + 32);
        swift_retain();
        swift_bridgeObjectRelease();
        sub_23C2928D4(v61 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_senderDisplayName, v46);
        swift_release();
      }
      uint64_t v62 = sub_23C32E170();
      if (__swift_getEnumTagSinglePayload(v46, 1, v62) == 1)
      {
        sub_23C30080C(v60[32], &qword_268B9AE30);
        uint64_t v37 = (uint64_t)v60;
        unint64_t v56 = v164;
LABEL_27:
        *(_OWORD *)uint64_t v34 = 0u;
        *(_OWORD *)(v34 + 16) = 0u;
        goto LABEL_28;
      }
      uint64_t v70 = sub_23C32E160();
      v60[14] = MEMORY[0x263F8D310];
      v60[11] = v70;
      v60[12] = v71;
      sub_23C32E170();
      OUTLINED_FUNCTION_6_15();
      OUTLINED_FUNCTION_20_0();
      v72();
      uint64_t v37 = (uint64_t)v60;
      unint64_t v56 = v164;
LABEL_28:
      swift_release();
      if (*(void *)(v37 + 112))
      {
        sub_23C2C4F3C((_OWORD *)v34, (_OWORD *)a18);
        sub_23C2C4F3C((_OWORD *)a18, (_OWORD *)v33);
        uint64_t v53 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23C30F0EC();
          uint64_t v55 = v73;
        }
        uint64_t v46 = *(void *)(v55 + 16);
        if ((unint64_t)v46 >= *(void *)(v55 + 24) >> 1)
        {
          sub_23C30F0EC();
          uint64_t v55 = v74;
        }
        *(void *)(v55 + 16) = v46 + 1;
        sub_23C2C4F3C((_OWORD *)v33, (_OWORD *)(v55 + 32 * v46 + 32));
      }
      else
      {
        sub_23C30080C(v34, qword_268B9AF50);
        uint64_t v53 = v57;
      }
      ++v54;
    }
    while (v53 != v54);
  }
  swift_bridgeObjectRelease_n();
  sub_23C28F9FC(0, &qword_268B9C5A8);
  id v77 = sub_23C322988();
  *(void *)(v37 + 296) = v77;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF20);
  uint64_t v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_23C3350C0;
  *(void *)(v78 + 32) = 0x73656D614E707061;
  *(void *)(v78 + 40) = 0xE800000000000000;
  a18 = v78;
  uint64_t v34 = v163;
  OUTLINED_FUNCTION_33_8();
  if (v79)
  {
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
  }
  else
  {
    OUTLINED_FUNCTION_16_14();
  }
  unint64_t v49 = *(void *)(v37 + 200);
  if (v46 > 4) {
    uint64_t v80 = 3;
  }
  else {
    uint64_t v80 = 4;
  }
  id v81 = v77;
  uint64_t v46 = sub_23C328F60(v81, v80);

  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C5B0);
  *(void *)(a18 + 48) = v46;
  *(void *)(a18 + 72) = v82;
  strcpy((char *)(a18 + 80), "isConclusion");
  *(unsigned char *)(a18 + 93) = 0;
  *(_WORD *)(a18 + 94) = -5120;
  char v83 = sub_23C32D900();
  unint64_t v40 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(a18 + 96) = v83 & 1;
  *(void *)(a18 + 120) = v40;
  strcpy((char *)(a18 + 128), "isFirstWindow");
  *(_WORD *)(a18 + 142) = -4864;
  *(unsigned char *)(a18 + 144) = sub_23C32D920() & 1;
  *(void *)(a18 + 168) = v40;
  strcpy((char *)(a18 + 176), "isLastWindow");
  *(unsigned char *)(a18 + 189) = 0;
  *(_WORD *)(a18 + 190) = -5120;
  *(unsigned char *)(a18 + 192) = sub_23C32D910() & 1;
  *(void *)(a18 + 216) = v40;
  *(void *)(a18 + 224) = 0xD000000000000016;
  OUTLINED_FUNCTION_7_14();
  *(void *)(a18 + 232) = v84;
  *(unsigned char *)(a18 + 240) = sub_23C32D8D0() & 1;
  *(void *)(a18 + 264) = v40;
  *(void *)(a18 + 272) = 0x736D657469;
  *(void *)(a18 + 280) = 0xE500000000000000;
  unint64_t v50 = v49 >> 62;
  if (v49 >> 62)
  {
    if ((v49 & 0x8000000000000000) != 0) {
      uint64_t v46 = *(void *)(v37 + 200);
    }
    else {
      uint64_t v46 = v49 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_23C32EA30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v53 = *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
  unint64_t v164 = v49;
  a10 = v49 >> 62;
  if (v53)
  {
    a21 = MEMORY[0x263F8EE78];
    unint64_t v43 = (unint64_t)&a21;
    sub_23C29BF50(0, v53 & ~(v53 >> 63), 0);
    if (v53 < 0) {
      goto LABEL_110;
    }
    uint64_t v85 = 0;
    uint64_t v86 = (uint64_t *)(v37 + 176);
    uint64_t v87 = a21;
    unint64_t v88 = v49 & 0xC000000000000001;
    uint64_t v165 = *(void *)(v37 + 200) + 32;
    unint64_t v49 = (unint64_t)&qword_268B9BF28;
    do
    {
      if (v88)
      {
        uint64_t v89 = MEMORY[0x23ECE18A0](v85, *(void *)(v37 + 200));
      }
      else
      {
        uint64_t v89 = *(void *)(v165 + 8 * v85);
        swift_retain();
      }
      *uint64_t v86 = v89;
      type metadata accessor for NotificationsApp(0);
      sub_23C329570(&qword_268B9BF28, 255, (void (*)(uint64_t))type metadata accessor for NotificationsApp);
      uint64_t v90 = sub_23C32E210();
      swift_release();
      a21 = v87;
      unint64_t v92 = *(void *)(v87 + 16);
      unint64_t v91 = *(void *)(v87 + 24);
      if (v92 >= v91 >> 1)
      {
        sub_23C29BF50(v91 > 1, v92 + 1, 1);
        uint64_t v87 = a21;
      }
      ++v85;
      *(void *)(v87 + 16) = v92 + 1;
      *(void *)(v87 + 8 * v92 + 32) = v90;
      uint64_t v37 = (uint64_t)v166;
    }
    while (v53 != v85);
    uint64_t v34 = v163;
    unint64_t v40 = MEMORY[0x263F8D4F8];
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v87 = MEMORY[0x263F8EE78];
  }
  uint64_t v46 = 0xEA0000000000657ALL;
  unint64_t v43 = *(void *)(v37 + 208);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF30);
  *(void *)(a18 + 288) = v87;
  unint64_t v50 = 0xD000000000000010;
  *(void *)(a18 + 312) = v93;
  *(void *)(a18 + 320) = 0xD000000000000010;
  OUTLINED_FUNCTION_7_14();
  *(void *)(v95 + 328) = v94;
  *(unsigned char *)(v95 + 336) = (*(unsigned char *)(v43 + 328) & 1) == 0;
  *(void *)(v95 + 360) = v40;
  *(void *)(v95 + 368) = 0x6574496C61746F74;
  *(void *)(v95 + 376) = 0xEA0000000000736DLL;
  uint64_t v53 = *(void *)(v34 + 120);
  a21 = v33;
  if ((unint64_t)v53 >> 62)
  {
    if (v53 < 0) {
      unint64_t v43 = v53;
    }
    else {
      unint64_t v43 = v53 & 0xFFFFFFFFFFFFFF8;
    }
    OUTLINED_FUNCTION_75();
    int64_t v96 = sub_23C32EA30();
    if (v96) {
      goto LABEL_58;
    }
LABEL_80:
    OUTLINED_FUNCTION_53_3();
    unint64_t v43 = MEMORY[0x263F8EE78];
    goto LABEL_81;
  }
  int64_t v96 = *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_75();
  if (!v96) {
    goto LABEL_80;
  }
LABEL_58:
  if (v96 < 1) {
    goto LABEL_111;
  }
  uint64_t v97 = 0;
  do
  {
    if ((v53 & 0xC000000000000001) != 0) {
      unint64_t v43 = MEMORY[0x23ECE18A0](v97, v53);
    }
    else {
      OUTLINED_FUNCTION_56_2();
    }
    ++v97;
    uint64_t v46 = *(void *)(v43 + 24);
    swift_bridgeObjectRetain();
    swift_release();
    unint64_t v43 = (unint64_t)&a21;
    sub_23C31012C(v46);
  }
  while (v96 != v97);
  OUTLINED_FUNCTION_53_3();
  unint64_t v43 = a21;
  unint64_t v50 = 0xD000000000000010;
LABEL_81:
  unint64_t v40 = 0xEA0000000000657ALL;
  if (v43 >> 62)
  {
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
  }
  else
  {
    OUTLINED_FUNCTION_16_14();
  }
  uint64_t v33 = *(void *)(v37 + 208);
  swift_bridgeObjectRelease();
  unint64_t v49 = MEMORY[0x263F8D6C8];
  *(void *)(a18 + 384) = v46;
  *(void *)(a18 + 408) = v49;
  *(void *)(a18 + 416) = 0xD000000000000013;
  OUTLINED_FUNCTION_68();
  *(void *)(a18 + 424) = v98;
  uint64_t v99 = *(void *)(v33 + 320);
  uint64_t v53 = v99 + 1;
  if (__OFADD__(v99, 1))
  {
    __break(1u);
    goto LABEL_104;
  }
  OUTLINED_FUNCTION_33_8();
  if (v100)
  {
LABEL_104:
    OUTLINED_FUNCTION_5_26();
    uint64_t v109 = sub_23C32EA30();
    if (v109 < 0)
    {
      __break(1u);
      goto LABEL_106;
    }
    unint64_t v101 = v109;
    goto LABEL_86;
  }
  unint64_t v101 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_86:
  uint64_t v46 = 0;
  if ((v53 & 0x8000000000000000) == 0 && v53 < v101)
  {
    uint64_t v46 = v43 & 0xC000000000000001;
    OUTLINED_FUNCTION_50_5();
    if ((v43 & 0xC000000000000001) != 0) {
      goto LABEL_112;
    }
    uint64_t v46 = *(void *)(v43 + 8 * v53 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_10();
    swift_release();
    if ((v43 & 0x8000000000000000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_90;
  }
  uint64_t v53 = a18;
  while (1)
  {
    swift_bridgeObjectRelease();
    *(void *)(v53 + 432) = v46;
    *(void *)(v53 + 456) = v49;
    *(void *)(v53 + 464) = 0x4E7070417478656ELL;
    *(void *)(v53 + 472) = 0xEB00000000656D61;
    *(void *)(v53 + 504) = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9BF40);
    uint64_t v102 = *(void *)(v33 + 320);
    int64_t v96 = v102 + 1;
    if (__OFADD__(v102, 1))
    {
LABEL_106:
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_33_8();
      if (!v103)
      {
        OUTLINED_FUNCTION_35_9();
        if ((v96 & 0x8000000000000000) == 0) {
          goto LABEL_96;
        }
        goto LABEL_118;
      }
    }
    OUTLINED_FUNCTION_5_26();
    uint64_t v110 = sub_23C32EA30();
    if ((v110 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    MEMORY[0x23ECE18A0](v53, v43);
    OUTLINED_FUNCTION_8_29();
    OUTLINED_FUNCTION_29_10();
    swift_unknownObjectRelease();
    if ((v43 & 0x8000000000000000) != 0)
    {
LABEL_113:
      uint64_t v53 = a18;
LABEL_114:
      OUTLINED_FUNCTION_5_26();
      sub_23C32EA30();
      OUTLINED_FUNCTION_8_29();
    }
    else
    {
LABEL_90:
      uint64_t v53 = a18;
      if ((v43 & 0x4000000000000000) != 0) {
        goto LABEL_114;
      }
      OUTLINED_FUNCTION_16_14();
    }
  }
  uint64_t v46 = v110;
  if (v96 < 0) {
    goto LABEL_118;
  }
LABEL_96:
  if (v96 >= (unint64_t)v46)
  {
LABEL_118:
    swift_bridgeObjectRelease();
    goto LABEL_119;
  }
  sub_23C29D9D0(v96, (v43 & 0xC000000000000001) == 0, v43);
  uint64_t v104 = *(void *)(v37 + 240);
  if ((v43 & 0xC000000000000001) != 0)
  {
    MEMORY[0x23ECE18A0](v96, v43);
    OUTLINED_FUNCTION_8_29();
    sub_23C2928D4((v43 & 0xC000000000000001) + OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_appName, v104);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v105 = *(void *)(v43 + 8 * v96 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    sub_23C2928D4(v105 + OBJC_IVAR____TtC24SiriNotificationsIntents16NotificationsApp_appName, v104);
    swift_release();
  }
  uint64_t v46 = sub_23C32E170();
  if (__swift_getEnumTagSinglePayload(v104, 1, v46) != 1)
  {
    uint64_t v106 = sub_23C32E160();
    int64_t v96 = v107;
    sub_23C32E170();
    OUTLINED_FUNCTION_6_15();
    OUTLINED_FUNCTION_20_0();
    v108();
    *(void *)(a18 + 480) = v106;
    *(void *)(a18 + 488) = v96;
    uint64_t v53 = a18;
    goto LABEL_120;
  }
  sub_23C30080C(*(void *)(v37 + 240), &qword_268B9AE30);
  uint64_t v53 = a18;
LABEL_119:
  *(void *)(v53 + 480) = 0;
  *(void *)(v53 + 488) = 0;
LABEL_120:
  *(void *)(v53 + 512) = 0x6953776F646E6977;
  *(void *)(v53 + 520) = v40;
  if (a10)
  {
    uint64_t v46 = *(void *)(v37 + 200);
    swift_bridgeObjectRetain();
    unint64_t v111 = sub_23C32EA30();
    swift_bridgeObjectRelease();
    if (!v111) {
      goto LABEL_127;
    }
LABEL_122:
    sub_23C29D9D0(0, (v164 & 0xC000000000000001) == 0, *(void *)(v37 + 200));
    uint64_t v112 = *(void *)(v37 + 200);
    if ((v164 & 0xC000000000000001) != 0)
    {
      unint64_t v111 = *(void *)(MEMORY[0x23ECE18A0](0, v112) + 24);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      if ((v111 & 0x8000000000000000) == 0 && (v111 & 0x4000000000000000) == 0)
      {
        uint64_t v46 = *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();
        goto LABEL_128;
      }
    }
    else
    {
      unint64_t v111 = *(void *)(*(void *)(v112 + 32) + 24);
      if ((v111 & 0x8000000000000000) == 0 && (v111 & 0x4000000000000000) == 0)
      {
        OUTLINED_FUNCTION_16_14();
        goto LABEL_128;
      }
      swift_bridgeObjectRetain();
    }
    OUTLINED_FUNCTION_5_26();
    uint64_t v46 = sub_23C32EA30();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v111 = *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v111) {
      goto LABEL_122;
    }
LABEL_127:
    uint64_t v46 = 0;
  }
LABEL_128:
  *(void *)(v53 + 552) = v49;
  *(void *)(v53 + 528) = v46;
  *(void *)(v53 + 560) = v50 + 5;
  OUTLINED_FUNCTION_68();
  *(void *)(v53 + 568) = v113;
  OUTLINED_FUNCTION_33_8();
  if (v114)
  {
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
    unint64_t v111 = *(void *)(v34 + 120);
  }
  else
  {
    OUTLINED_FUNCTION_16_14();
  }
  if (v46 < 5)
  {
    uint64_t v115 = 0;
LABEL_136:
    uint64_t v116 = *(void *)(v37 + 208);
    *(void *)(v53 + 600) = v49;
    *(void *)(v53 + 576) = v115;
    *(void *)(v53 + 608) = v50 + 5;
    *(void *)(v53 + 616) = 0x800000023C337BA0;
    uint64_t v117 = *(void *)(v116 + 336);
    *(void *)(v53 + 648) = v49;
    *(void *)(v53 + 624) = v117 % 3;
    *(void *)(v53 + 656) = v50;
    OUTLINED_FUNCTION_7_14();
    *(void *)(v53 + 664) = v118;
    LOBYTE(v118) = *(unsigned char *)(v119 + 312);
    int64_t v96 = MEMORY[0x263F8D4F8];
    *(void *)(v53 + 696) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v53 + 672) = v118;
    *(void *)(v53 + 704) = 0x7461657065527369;
    *(void *)(v53 + 712) = 0xE800000000000000;
    LOBYTE(v118) = *(unsigned char *)(v120 + 17);
    *(void *)(v53 + 744) = v96;
    *(unsigned char *)(v53 + 720) = v118;
    strcpy((char *)(v53 + 752), "isReadLatest");
    *(unsigned char *)(v53 + 765) = 0;
    *(_WORD *)(v53 + 766) = -5120;
    LOBYTE(v118) = *(unsigned char *)(v119 + 152);
    *(void *)(v53 + 792) = v96;
    *(unsigned char *)(v53 + 768) = v118;
    *(void *)(v53 + 800) = v50 + 4;
    OUTLINED_FUNCTION_7_14();
    *(void *)(v53 + 808) = v121;
    if (v111 >> 62)
    {
      OUTLINED_FUNCTION_5_26();
      sub_23C32EA30();
      OUTLINED_FUNCTION_8_29();
    }
    else
    {
      OUTLINED_FUNCTION_16_14();
    }
    if (v46 == 1)
    {
      OUTLINED_FUNCTION_33_8();
      if (v122) {
        goto LABEL_155;
      }
      OUTLINED_FUNCTION_35_9();
      goto LABEL_141;
    }
LABEL_157:
    BOOL v123 = 0;
  }
  else
  {
    if (v111 >> 62)
    {
      OUTLINED_FUNCTION_5_26();
      sub_23C32EA30();
      OUTLINED_FUNCTION_8_29();
    }
    else
    {
      OUTLINED_FUNCTION_16_14();
    }
    if (!__OFSUB__(v46, 4))
    {
      uint64_t v115 = v46 - 3;
      unint64_t v111 = *(void *)(v34 + 120);
      goto LABEL_136;
    }
    __break(1u);
LABEL_155:
    OUTLINED_FUNCTION_5_26();
    uint64_t v46 = sub_23C32EA30();
    if (!v46)
    {
      swift_bridgeObjectRelease();
      goto LABEL_157;
    }
LABEL_141:
    uint64_t v46 = v111 & 0xC000000000000001;
    sub_23C29D9D0(0, (v111 & 0xC000000000000001) == 0, v111);
    if ((v111 & 0xC000000000000001) != 0)
    {
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_8_29();
      OUTLINED_FUNCTION_29_10();
      swift_unknownObjectRelease();
      if ((v111 & 0x8000000000000000) != 0) {
        goto LABEL_187;
      }
LABEL_143:
      if ((v111 & 0x4000000000000000) != 0) {
        goto LABEL_187;
      }
      OUTLINED_FUNCTION_16_14();
    }
    else
    {
      uint64_t v46 = *(void *)(v111 + 32);
      swift_retain();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_29_10();
      swift_release();
      if ((v111 & 0x8000000000000000) == 0) {
        goto LABEL_143;
      }
LABEL_187:
      OUTLINED_FUNCTION_5_26();
      sub_23C32EA30();
      OUTLINED_FUNCTION_8_29();
    }
    swift_bridgeObjectRelease();
    BOOL v123 = v46 == 1;
  }
  *(void *)(v53 + 840) = v96;
  *(unsigned char *)(v53 + 816) = v123;
  *(void *)(v53 + 848) = v50 + 12;
  OUTLINED_FUNCTION_68();
  *(void *)(v53 + 856) = v124;
  OUTLINED_FUNCTION_33_8();
  if (v125)
  {
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
  }
  else
  {
    OUTLINED_FUNCTION_16_14();
  }
  if (v46 != 1)
  {
    BOOL v127 = 0;
    goto LABEL_169;
  }
  OUTLINED_FUNCTION_33_8();
  if (v126) {
    goto LABEL_184;
  }
  OUTLINED_FUNCTION_35_9();
LABEL_163:
  uint64_t v46 = v111 & 0xC000000000000001;
  sub_23C29D9D0(0, (v111 & 0xC000000000000001) == 0, v111);
  if ((v111 & 0xC000000000000001) == 0)
  {
    uint64_t v46 = *(void *)(v111 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_10();
    swift_release();
    if ((v111 & 0x8000000000000000) == 0) {
      goto LABEL_165;
    }
    goto LABEL_189;
  }
  OUTLINED_FUNCTION_34_3();
  OUTLINED_FUNCTION_8_29();
  OUTLINED_FUNCTION_29_10();
  swift_unknownObjectRelease();
  if ((v111 & 0x8000000000000000) != 0) {
    goto LABEL_189;
  }
LABEL_165:
  if ((v111 & 0x4000000000000000) != 0)
  {
LABEL_189:
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
    goto LABEL_167;
  }
  OUTLINED_FUNCTION_16_14();
  while (1)
  {
LABEL_167:
    swift_bridgeObjectRelease();
    BOOL v127 = v46 > 1;
LABEL_169:
    unint64_t v111 = *(void *)(v37 + 208);
    *(void *)(v53 + 888) = v96;
    *(unsigned char *)(v53 + 864) = v127;
    *(void *)(v53 + 896) = v50 + 10;
    OUTLINED_FUNCTION_7_14();
    *(void *)(v53 + 904) = v128;
    char v129 = sub_23C327F00();
    *(void *)(v53 + 936) = v96;
    *(unsigned char *)(v53 + 912) = v129 & 1;
    *(void *)(v53 + 944) = v50 + 14;
    OUTLINED_FUNCTION_68();
    *(void *)(v53 + 952) = v130;
    uint64_t v131 = *(void *)(v33 + 320);
    uint64_t v53 = v131 + 1;
    if (__OFADD__(v131, 1))
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_33_8();
      if (!v132)
      {
        OUTLINED_FUNCTION_35_9();
        goto LABEL_172;
      }
    }
    OUTLINED_FUNCTION_5_26();
    uint64_t v136 = sub_23C32EA30();
    if ((v136 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_184:
    OUTLINED_FUNCTION_5_26();
    uint64_t v46 = sub_23C32EA30();
    if (v46) {
      goto LABEL_163;
    }
  }
  uint64_t v46 = v136;
LABEL_172:
  if (v53 < 0 || v53 >= (unint64_t)v46) {
    goto LABEL_192;
  }
  unint64_t v133 = v111 & 0xC000000000000001;
  OUTLINED_FUNCTION_50_5();
  if ((v111 & 0xC000000000000001) != 0)
  {
    MEMORY[0x23ECE18A0](v53, v111);
    OUTLINED_FUNCTION_8_29();
    OUTLINED_FUNCTION_29_10();
    swift_unknownObjectRelease();
    if ((v111 & 0x8000000000000000) != 0) {
      goto LABEL_191;
    }
LABEL_176:
    if ((v111 & 0x4000000000000000) != 0) {
      goto LABEL_191;
    }
    OUTLINED_FUNCTION_16_14();
    if (v133) {
      goto LABEL_178;
    }
LABEL_192:
    swift_bridgeObjectRelease();
    char v135 = 0;
  }
  else
  {
    unint64_t v133 = *(void *)(v111 + 8 * v53 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_10();
    swift_release();
    if ((v111 & 0x8000000000000000) == 0) {
      goto LABEL_176;
    }
LABEL_191:
    OUTLINED_FUNCTION_5_26();
    sub_23C32EA30();
    OUTLINED_FUNCTION_8_29();
    if (!v133) {
      goto LABEL_192;
    }
LABEL_178:
    sub_23C29D9D0(0, (v111 & 0xC000000000000001) == 0, v111);
    if ((v111 & 0xC000000000000001) != 0)
    {
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_8_29();
      char v135 = *(unsigned char *)((v111 & 0xC000000000000001)
                      + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_containsStackSummary);
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v134 = *(void *)(v111 + 32);
      swift_retain();
      swift_bridgeObjectRelease();
      char v135 = *(unsigned char *)(v134 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_containsStackSummary);
      swift_release();
    }
  }
  uint64_t v137 = *(void *)(v37 + 280);
  uint64_t v138 = *(void *)(v37 + 264);
  char v139 = *(unsigned char *)(v37 + 344);
  *(void *)(a18 + 984) = v96;
  *(unsigned char *)(a18 + 960) = v135;
  strcpy((char *)(a18 + 992), "promptNeeded");
  *(unsigned char *)(a18 + 1005) = 0;
  *(_WORD *)(a18 + 1006) = -5120;
  *(void *)(a18 + 1032) = v96;
  *(unsigned char *)(a18 + 1008) = v139;
  *(void *)(v37 + 304) = sub_23C32E430();
  v161(v137, v162, v138);
  OUTLINED_FUNCTION_75();
  uint64_t v140 = sub_23C32E340();
  os_log_type_t v141 = sub_23C32E730();
  if (os_log_type_enabled(v140, v141))
  {
    v142 = (uint64_t *)(v37 + 184);
    uint64_t v143 = (_DWORD *)OUTLINED_FUNCTION_7_1();
    a21 = OUTLINED_FUNCTION_30_1();
    *uint64_t v143 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v144 = sub_23C32E420();
    unint64_t v146 = v145;
    swift_bridgeObjectRelease();
    uint64_t *v142 = sub_23C2A9890(v144, v146, &a21);
    sub_23C32E830();
    uint64_t v37 = (uint64_t)v166;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_53_3();
    OUTLINED_FUNCTION_62_1(&dword_23C289000, v140, v141, "RNReadNotificationsFlowProvider#executePatternForWindow executing pattern with parameters=%s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();
  }
  else
  {
    OUTLINED_FUNCTION_53_3();
  }

  OUTLINED_FUNCTION_12_7();
  v147();
  uint64_t v148 = *(void *)(v37 + 208);
  sub_23C32E140();
  uint64_t v149 = *(void **)(v148 + 16);
  *(void *)(v37 + 312) = v149;
  sub_23C32E050();
  sub_23C32DF50();
  v149;
  uint64_t v150 = sub_23C32DF30();
  *(void *)(v37 + 320) = sub_23C2D81B0(v148 + 200, v150);
  swift_release();
  *(void *)(v37 + 48) = 0;
  *(_OWORD *)(v37 + 32) = 0u;
  *(_OWORD *)(v37 + 16) = 0u;
  sub_23C32E240();
  char v151 = (void *)swift_task_alloc();
  *(void *)(v37 + 328) = v151;
  *char v151 = v37;
  v151[1] = sub_23C327BDC;
  OUTLINED_FUNCTION_22_9();
  return MEMORY[0x270F64F58](v152, v153, v154, v155, v156, v157, v158);
}

uint64_t sub_23C327BDC()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = (uint64_t)(v2 + 2);
  v2[19] = v1;
  v2[20] = v4;
  v2[21] = v0;
  uint64_t v6 = *(void **)(v5 + 320);
  uint64_t v7 = *(void **)(v5 + 312);
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v9 = v8;
  *(void *)(v10 + 336) = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  v11();
  sub_23C30080C(v3, &qword_268B9B1F0);
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

void sub_23C327D90()
{
  uint64_t v1 = *(void *)(v0 + 208);

  uint64_t v2 = *(void *)(v1 + 320);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(*(void *)(v0 + 208) + 320) = v4;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = OUTLINED_FUNCTION_4_22();
    v6(v5);
  }
}

uint64_t sub_23C327E54()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_3();
  return v1();
}

uint64_t sub_23C327F00()
{
  unint64_t v2 = *(void *)(v0 + 120);
  unint64_t v3 = *(void *)(v0 + 320);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_23C32EA30();
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_11;
    }
    unint64_t v1 = v4;
    if ((v3 & 0x8000000000000000) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    OUTLINED_FUNCTION_55_2();
    swift_bridgeObjectRetain();
    if ((v3 & 0x8000000000000000) != 0) {
      goto LABEL_13;
    }
  }
  if (v3 >= v1) {
    goto LABEL_13;
  }
  sub_23C29D9D0(v3, (v2 & 0xC000000000000001) == 0, v2);
  if ((v2 & 0xC000000000000001) == 0)
  {
    OUTLINED_FUNCTION_56_2();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36_9();
    swift_release();
    if ((v2 & 0x8000000000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
LABEL_11:
  MEMORY[0x23ECE18A0](v3, v2);
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_36_9();
  swift_unknownObjectRelease();
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_12:
    OUTLINED_FUNCTION_7_22();
    sub_23C32EA30();
    OUTLINED_FUNCTION_28_3();
    if (v3) {
      goto LABEL_8;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_6:
  if ((v2 & 0x4000000000000000) != 0) {
    goto LABEL_12;
  }
  unint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_13;
  }
LABEL_8:
  OUTLINED_FUNCTION_70_0();
  MEMORY[0x23ECE18A0](0, v2);
  OUTLINED_FUNCTION_28_3();
  uint64_t v6 = *(unsigned __int8 *)(v3
                          + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_containsStackSummary);
  swift_unknownObjectRelease();
  return v6;
}

unint64_t sub_23C32806C()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  uint64_t v3 = OUTLINED_FUNCTION_31_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_18_1();
  unint64_t v4 = *(void *)(v0 + 120);
  unint64_t v5 = *(void *)(v0 + 320);
  if (!(v4 >> 62))
  {
    unint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if ((v5 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  OUTLINED_FUNCTION_7_22();
  uint64_t v9 = sub_23C32EA30();
  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v6 = v9;
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_20;
  }
LABEL_3:
  if (v5 >= v6) {
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_71_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_56_2();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36_9();
    swift_release();
    if ((v4 & 0x8000000000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_6;
  }
LABEL_15:
  MEMORY[0x23ECE18A0](v5, v4);
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_36_9();
  swift_unknownObjectRelease();
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_16:
    OUTLINED_FUNCTION_7_22();
    unint64_t v5 = sub_23C32EA30();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_8;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return v5;
  }
LABEL_6:
  if ((v4 & 0x4000000000000000) != 0) {
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_55_2();
  if (!v5) {
    goto LABEL_17;
  }
LABEL_8:
  sub_23C29D9D0(0, (v4 & 0xC000000000000001) == 0, v4);
  if ((v4 & 0xC000000000000001) != 0)
  {
    MEMORY[0x23ECE18A0](0, v4);
    OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_threadId);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_threadId);
    swift_release();
  }
  uint64_t v7 = sub_23C32E170();
  if (__swift_getEnumTagSinglePayload(v1, 1, v7) == 1)
  {
    sub_23C30080C(v1, &qword_268B9AE30);
    return 0;
  }
  unint64_t v5 = sub_23C32E160();
  sub_23C32E170();
  OUTLINED_FUNCTION_6_15();
  OUTLINED_FUNCTION_20_0();
  v8();
  return v5;
}

uint64_t sub_23C328298()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  uint64_t v4 = OUTLINED_FUNCTION_31_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_18_1();
  uint64_t v5 = *(void *)(v1 + 320);
  unint64_t v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v0 = *(void *)(v1 + 120);
    if (!(v0 >> 62))
    {
      unint64_t v1 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if ((v6 & 0x8000000000000000) != 0) {
        goto LABEL_17;
      }
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_7_22();
  uint64_t v10 = sub_23C32EA30();
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v1 = v10;
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if (v6 >= v1) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_71_0();
  if (v1)
  {
LABEL_15:
    MEMORY[0x23ECE18A0](v6, v0);
    OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_36_9();
    swift_unknownObjectRelease();
    if ((v0 & 0x8000000000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_56_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_9();
  swift_release();
  if ((v0 & 0x8000000000000000) != 0) {
    goto LABEL_16;
  }
LABEL_7:
  if ((v0 & 0x4000000000000000) == 0)
  {
    if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_16:
  OUTLINED_FUNCTION_7_22();
  sub_23C32EA30();
  OUTLINED_FUNCTION_28_3();
  if (!v1) {
    goto LABEL_17;
  }
LABEL_9:
  OUTLINED_FUNCTION_70_0();
  MEMORY[0x23ECE18A0](0, v0);
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_threadId);
  swift_unknownObjectRelease();
  uint64_t v7 = sub_23C32E170();
  if (__swift_getEnumTagSinglePayload(v2, 1, v7) == 1)
  {
    sub_23C30080C(v2, &qword_268B9AE30);
    return 0;
  }
  uint64_t v8 = sub_23C32E160();
  sub_23C32E170();
  OUTLINED_FUNCTION_6_15();
  OUTLINED_FUNCTION_20_0();
  v9();
  return v8;
}

uint64_t sub_23C3284B4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23C32E350();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268B9AC70 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_268BA3998);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v10, v4);
  uint64_t v11 = sub_23C32E340();
  os_log_type_t v12 = sub_23C32E730();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 67109120;
    v18[3] = a1 & 1;
    sub_23C32E830();
    _os_log_impl(&dword_23C289000, v11, v12, "#RNReadNotificationsFlowProvider#setIsRepeat %{BOOL}d", v13, 8u);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_67();
  v14();
  *(unsigned char *)(v2 + 329) = a1 & 1;
  if ((a1 & 1) != 0 && (uint64_t v15 = sub_23C328298(), v16))
  {
    *(void *)(v2 + 104) = v15;
    *(void *)(v2 + 112) = v16;
  }
  else
  {
    *(void *)(v2 + 104) = 0;
    *(void *)(v2 + 112) = 0;
  }
  return swift_bridgeObjectRelease();
}

void sub_23C328688()
{
  uint64_t v1 = *(void *)(v0 + 336);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(v0 + 336) = v3;
  }
}

uint64_t sub_23C3286A0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23C28BEA8(v0 + 160);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23C328708()
{
  sub_23C3286A0();
  return MEMORY[0x270FA0228](v0, 344, 7);
}

uint64_t type metadata accessor for RNReadNotificationsFlowProvider()
{
  return self;
}

uint64_t sub_23C328760()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C32876C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 288);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23C3287A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C3232EC();
}

uint64_t sub_23C328830()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C323654();
}

uint64_t sub_23C3288C0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C323950();
}

uint64_t sub_23C328950()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C299F8C;
  return sub_23C323C4C();
}

uint64_t sub_23C3289FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C325D6C();
}

uint64_t sub_23C328AA4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C32617C();
}

uint64_t sub_23C328B34()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C2F55EC;
  return sub_23C3240F8();
}

uint64_t sub_23C328BDC(uint64_t a1, uint64_t a2)
{
  return sub_23C329570(qword_268B9C560, a2, (void (*)(uint64_t))type metadata accessor for RNReadNotificationsFlowProvider);
}

uint64_t sub_23C328C24(uint64_t a1, uint64_t a2)
{
  return sub_23C329570(qword_268B9C578, a2, (void (*)(uint64_t))type metadata accessor for RNReadNotificationsFlowProvider);
}

uint64_t sub_23C328C6C(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_23C32EA00();
    __break(1u);
  }
  else if (a1)
  {
    sub_23C28F9FC(0, (unint64_t *)&qword_268B9AF38);
    uint64_t result = sub_23C32E670();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_23C328D24(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  uint64_t v8 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
  while (1)
  {
    while (v4)
    {
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_23C32EA30();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v3 == v9) {
        break;
      }
      if ((v4 & 0xC000000000000001) != 0)
      {
        uint64_t result = MEMORY[0x23ECE18A0](v3, v4);
        uint64_t v12 = result;
      }
      else
      {
        if ((v3 & 0x8000000000000000) != 0) {
          goto LABEL_37;
        }
        if (v3 >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_38;
        }
        uint64_t v12 = *(void *)(v4 + 8 * v3 + 32);
        uint64_t result = swift_retain();
      }
      BOOL v13 = __OFADD__(v3++, 1);
      if (v13) {
        goto LABEL_39;
      }
      if (!v5)
      {
        unint64_t v14 = v7[3];
        if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_42;
        }
        int64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
        if (v15 <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v15;
        }
        __swift_instantiateConcreteTypeFromMangledName(qword_268B9B1F8);
        uint64_t v17 = (void *)swift_allocObject();
        uint64_t v18 = (uint64_t)(_swift_stdlib_malloc_size(v17) - 32) / 8;
        v17[2] = v16;
        v17[3] = (2 * v18) | 1;
        unint64_t v19 = (unint64_t)(v17 + 4);
        unint64_t v20 = v7[3];
        unint64_t v21 = v20 >> 1;
        if (v7[2])
        {
          if (v17 != v7 || v19 >= (unint64_t)&v7[v21 + 4])
          {
            uint64_t v26 = v18;
            memmove(v17 + 4, v7 + 4, 8 * v21);
            uint64_t v18 = v26;
          }
          v7[2] = 0;
        }
        uint64_t v8 = (uint64_t *)(v19 + 8 * v21);
        uint64_t v5 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - (v20 >> 1);
        uint64_t result = swift_release();
        uint64_t v7 = v17;
      }
      BOOL v13 = __OFSUB__(v5--, 1);
      if (v13) {
        goto LABEL_40;
      }
      *v8++ = v12;
    }
    unint64_t v10 = *(void *)(a1 + 16);
    if (v6 == v10)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v23 = v7[3];
      if (v23 >= 2)
      {
        unint64_t v24 = v23 >> 1;
        BOOL v13 = __OFSUB__(v24, v5);
        unint64_t v25 = v24 - v5;
        if (v13) {
          goto LABEL_41;
        }
        v7[2] = v25;
      }
      return (uint64_t)v7;
    }
    if (v6 >= v10) {
      break;
    }
    unint64_t v11 = *(void *)(a1 + 8 * v6 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v3 = 0;
    unint64_t v4 = v11;
    ++v6;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23C328F60(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C5B8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a1;
  sub_23C32E710();

  uint64_t v28 = *(int *)(v5 + 44);
  *(void *)&v7[v28] = a2;
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  if (a2)
  {
    sub_23C32CE40();
    sub_23C329570(&qword_268B9C5C0, 255, MEMORY[0x263F06DC0]);
    uint64_t v10 = 0;
    uint64_t v11 = 1 - a2;
    uint64_t v12 = v9 + 4;
    while (1)
    {
      sub_23C32E820();
      if (!*((void *)&v30 + 1))
      {
        *(void *)&v7[v28] = -v11;
        goto LABEL_24;
      }
      uint64_t result = (uint64_t)sub_23C2C4F3C(&v29, v31);
      if (!v10)
      {
        unint64_t v14 = v9[3];
        if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_29;
        }
        int64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
        if (v15 <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v15;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C318);
        uint64_t v17 = (void *)swift_allocObject();
        uint64_t v18 = (uint64_t)(_swift_stdlib_malloc_size(v17) - 32) / 32;
        v17[2] = v16;
        v17[3] = 2 * v18;
        unint64_t v19 = (unint64_t)(v17 + 4);
        unint64_t v20 = v9[3];
        unint64_t v21 = v20 >> 1;
        if (v9[2])
        {
          if (v17 != v9 || v19 >= (unint64_t)&v9[4 * v21 + 4]) {
            memmove(v17 + 4, v9 + 4, 32 * v21);
          }
          v9[2] = 0;
        }
        uint64_t v12 = (_OWORD *)(v19 + 32 * v21);
        uint64_t v10 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - (v20 >> 1);
        uint64_t result = swift_release();
        uint64_t v9 = v17;
      }
      BOOL v23 = __OFSUB__(v10--, 1);
      if (v23) {
        break;
      }
      sub_23C2C4F3C(v31, v12);
      v12 += 2;
      if (++v11 == 1) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v10 = 0;
LABEL_22:
  *(void *)&v7[v28] = 0;
  long long v29 = 0u;
  long long v30 = 0u;
LABEL_24:
  sub_23C30080C((uint64_t)v7, &qword_268B9C5B8);
  uint64_t result = sub_23C30080C((uint64_t)&v29, qword_268B9AF50);
  unint64_t v24 = v9[3];
  if (v24 < 2) {
    return (uint64_t)v9;
  }
  unint64_t v25 = v24 >> 1;
  BOOL v23 = __OFSUB__(v25, v10);
  unint64_t v26 = v25 - v10;
  if (!v23)
  {
    v9[2] = v26;
    return (uint64_t)v9;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23C3291E4()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v1 = sub_23C32D950();
  OUTLINED_FUNCTION_2_0(v1);
  OUTLINED_FUNCTION_18_17();
  BOOL v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *BOOL v2 = v0;
  v2[1] = sub_23C3295BC;
  uint64_t v3 = OUTLINED_FUNCTION_22_10();
  return sub_23C325AB4(v3, v4, v5);
}

uint64_t sub_23C3292B0()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v1 = sub_23C32D950();
  OUTLINED_FUNCTION_2_0(v1);
  OUTLINED_FUNCTION_18_17();
  BOOL v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *BOOL v2 = v0;
  v2[1] = sub_23C2F5414;
  OUTLINED_FUNCTION_22_10();
  return sub_23C325A04();
}

uint64_t sub_23C329374(uint64_t result)
{
  *(unsigned char *)(v1 + 328) = result;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_23C32D950();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = ((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v9, v8);
}

uint64_t sub_23C329444()
{
  OUTLINED_FUNCTION_14_3();
  uint64_t v1 = sub_23C32D950();
  OUTLINED_FUNCTION_2_0(v1);
  OUTLINED_FUNCTION_18_17();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23C3295BC;
  OUTLINED_FUNCTION_22_10();
  return sub_23C325CBC();
}

uint64_t sub_23C329508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C329570(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void OUTLINED_FUNCTION_6_32()
{
  *(void *)(v2 - 80) = *(void *)(v1 + 72);
}

uint64_t OUTLINED_FUNCTION_7_22()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_29()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_20()
{
  return 3;
}

uint64_t OUTLINED_FUNCTION_19_17()
{
  return v0;
}

void *OUTLINED_FUNCTION_22_12()
{
  __swift_destroy_boxed_opaque_existential_1(v1);
  return __swift_project_boxed_opaque_existential_1((void *)(v0 + 64), *(void *)(v0 + 88));
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_35_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return sub_23C32D830();
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_23C32D1B0();
}

uint64_t OUTLINED_FUNCTION_41_6(uint64_t a1)
{
  return a1 + v1;
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_50_5()
{
  if (v0) {
    char v4 = 1;
  }
  else {
    char v4 = 0;
  }
  return sub_23C29D9D0(v1, v4, v2);
}

unint64_t OUTLINED_FUNCTION_51_2()
{
  if (v0) {
    char v3 = 1;
  }
  else {
    char v3 = 0;
  }
  return sub_23C29D9D0(0, v3, v1);
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  return sub_23C32D460();
}

uint64_t OUTLINED_FUNCTION_60_1(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int16 a10)
{
  return sub_23C2AAB78(a1, a2, a3, a4, a5, 0, 0, 0, a9, a10);
}

void OUTLINED_FUNCTION_62_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_65_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_69_0@<X0>(uint64_t a1@<X8>)
{
  return sub_23C2928D4(v1 + a1, v2);
}

unint64_t OUTLINED_FUNCTION_70_0()
{
  return sub_23C29D9D0(0, (v0 & 0xC000000000000001) == 0, v0);
}

unint64_t OUTLINED_FUNCTION_71_0()
{
  return sub_23C29D9D0(v1, (v0 & 0xC000000000000001) == 0, v0);
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 40));
  return sub_23C32D380();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return v0;
}

void OUTLINED_FUNCTION_77_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_23C32D300();
}

id sub_23C329A58(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_23C32E470();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setNotificationId_, v3);

  id v4 = v2;
  swift_bridgeObjectRetain();
  os_log_type_t v5 = (void *)sub_23C32E470();
  uint64_t v6 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_22(v6, sel_setApplicationId_);

  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = v4;
  if (v7)
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = (void *)sub_23C32E470();
    id v8 = (id)swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  OUTLINED_FUNCTION_10_22((uint64_t)v8, sel_setThreadIdentifier_);

  id v10 = v4;
  uint64_t v11 = (void *)sub_23C32CED0();
  OUTLINED_FUNCTION_0_16((uint64_t)v11, sel_setDate_);

  OUTLINED_FUNCTION_3_31();
  if (v7)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v12 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    uint64_t v11 = 0;
  }
  OUTLINED_FUNCTION_0_16(v12, sel_setTitle_);

  OUTLINED_FUNCTION_3_31();
  if (v7)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v13 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    uint64_t v11 = 0;
  }
  OUTLINED_FUNCTION_0_16(v13, sel_setSubtitle_);

  OUTLINED_FUNCTION_3_31();
  if (v7)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v14 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    uint64_t v11 = 0;
  }
  OUTLINED_FUNCTION_0_16(v14, sel_setBody_);

  sub_23C28F9FC(0, (unint64_t *)&qword_268B9AF18);
  int64_t v15 = (void *)sub_23C32E7C0();
  OUTLINED_FUNCTION_0_16((uint64_t)v15, sel_setPreviewRestricted_);

  swift_release();
  return v10;
}

id sub_23C329CB4()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_23C32E470();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setNotificationId_, v1);

  id v2 = v0;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_23C32E470();
  uint64_t v4 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_22(v4, sel_setApplicationId_);

  OUTLINED_FUNCTION_3_31();
  id v5 = v2;
  if (v0)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_23C32E470();
    id v5 = (id)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  OUTLINED_FUNCTION_10_22((uint64_t)v5, sel_setThreadIdentifier_);

  id v7 = v2;
  id v8 = (void *)sub_23C32CED0();
  OUTLINED_FUNCTION_0_16((uint64_t)v8, sel_setDate_);

  OUTLINED_FUNCTION_3_31();
  if (v0)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v9 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    id v8 = 0;
  }
  OUTLINED_FUNCTION_0_16(v9, sel_setTitle_);

  OUTLINED_FUNCTION_3_31();
  if (v0)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v10 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    id v8 = 0;
  }
  OUTLINED_FUNCTION_0_16(v10, sel_setSubtitle_);

  OUTLINED_FUNCTION_3_31();
  if (v0)
  {
    OUTLINED_FUNCTION_6_33();
    OUTLINED_FUNCTION_7_23();
    uint64_t v11 = OUTLINED_FUNCTION_5_31();
  }
  else
  {
    id v8 = 0;
  }
  OUTLINED_FUNCTION_0_16(v11, sel_setBody_);

  swift_release();
  return v7;
}

uint64_t sub_23C329ED0()
{
  uint64_t result = sub_23C2A01EC(v0, (SEL *)&selRef_applicationId);
  if (v2)
  {
    sub_23C28F9B0();
    char v3 = sub_23C32E8A0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23C329F64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AE30);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  id v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  id v8 = (char *)&v41 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v41 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v41 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v41 - v15;
  id v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_23C32AB6C(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_notificationId, (uint64_t)v16, &qword_268B9AE30);
  uint64_t v18 = sub_23C32E170();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v18);
  id v20 = v17;
  if (EnumTagSinglePayload == 1)
  {
    uint64_t v21 = sub_23C2C248C((uint64_t)v16, &qword_268B9AE30);
    uint64_t v22 = 0;
  }
  else
  {
    sub_23C32E160();
    OUTLINED_FUNCTION_2_31();
    OUTLINED_FUNCTION_1_20();
    v23();
    uint64_t v22 = (void *)sub_23C32E470();
    uint64_t v21 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9_26(v21, sel_setNotificationId_);

  sub_23C32AB6C(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_appId, (uint64_t)v14, &qword_268B9AE30);
  int v24 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18);
  id v25 = v20;
  if (v24 == 1)
  {
    uint64_t v26 = sub_23C2C248C((uint64_t)v14, &qword_268B9AE30);
    uint64_t v27 = 0;
  }
  else
  {
    sub_23C32E160();
    OUTLINED_FUNCTION_2_31();
    OUTLINED_FUNCTION_1_20();
    v28();
    uint64_t v27 = (void *)sub_23C32E470();
    uint64_t v26 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9_26(v26, sel_setApplicationId_);

  sub_23C32AB6C(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_title, (uint64_t)v11, &qword_268B9AE30);
  OUTLINED_FUNCTION_2_12((uint64_t)v11);
  if (v29)
  {
    uint64_t v32 = sub_23C2C248C((uint64_t)v11, &qword_268B9AE30);
    unint64_t v31 = 0;
  }
  else
  {
    sub_23C32E160();
    OUTLINED_FUNCTION_2_31();
    OUTLINED_FUNCTION_1_20();
    v30();
    unint64_t v31 = (void *)sub_23C32E470();
    uint64_t v32 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9_26(v32, sel_setTitle_);

  uint64_t v33 = a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_subtitle;
  sub_23C32AB6C(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_subtitle, (uint64_t)v8, &qword_268B9AE30);
  OUTLINED_FUNCTION_2_12((uint64_t)v8);
  if (v29)
  {
    uint64_t v36 = sub_23C2C248C((uint64_t)v8, &qword_268B9AE30);
    uint64_t v35 = 0;
  }
  else
  {
    sub_23C32E160();
    OUTLINED_FUNCTION_2_31();
    OUTLINED_FUNCTION_1_20();
    v34();
    uint64_t v35 = (void *)sub_23C32E470();
    uint64_t v36 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9_26(v36, sel_setSubtitle_);

  sub_23C32AB6C(v33, (uint64_t)v5, &qword_268B9AE30);
  OUTLINED_FUNCTION_2_12((uint64_t)v5);
  if (v29)
  {
    uint64_t v39 = sub_23C2C248C((uint64_t)v5, &qword_268B9AE30);
    uint64_t v38 = 0;
  }
  else
  {
    sub_23C32E160();
    OUTLINED_FUNCTION_2_31();
    OUTLINED_FUNCTION_1_20();
    v37();
    uint64_t v38 = (void *)sub_23C32E470();
    uint64_t v39 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9_26(v39, sel_setBody_);

  swift_release();
  return v25;
}

id sub_23C32A3E8(void *a1)
{
  id v1 = a1;
  SANotificationOnDeviceObject.description.getter();

  uint64_t v2 = (void *)sub_23C32E470();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t SANotificationOnDeviceObject.description.getter()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9AF10);
  OUTLINED_FUNCTION_9_6();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[0] = 0;
  v24[1] = 0xE000000000000000;
  sub_23C32E930();
  sub_23C32E570();
  uint64_t v5 = sub_23C2A01EC(v0, (SEL *)&selRef_notificationId);
  OUTLINED_FUNCTION_4_33(v5, v6);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  uint64_t v7 = sub_23C2A01EC(v0, (SEL *)&selRef_applicationId);
  OUTLINED_FUNCTION_4_33(v7, v8);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  uint64_t v9 = sub_23C2A01EC(v0, (SEL *)&selRef_threadIdentifier);
  OUTLINED_FUNCTION_4_33(v9, v10);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  id v11 = objc_msgSend(v0, sel_date);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_23C32CF20();

    uint64_t v13 = sub_23C32CF40();
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = sub_23C32CF40();
    uint64_t v14 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v4, v14, 1, v13);
  sub_23C32E9F0();
  sub_23C2C248C((uint64_t)v4, &qword_268B9AF10);
  sub_23C32E570();
  uint64_t v15 = sub_23C2A01EC(v1, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_4_33(v15, v16);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  uint64_t v17 = sub_23C2A01EC(v1, (SEL *)&selRef_subtitle);
  OUTLINED_FUNCTION_4_33(v17, v18);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  uint64_t v19 = sub_23C2A01EC(v1, (SEL *)&selRef_body);
  OUTLINED_FUNCTION_4_33(v19, v20);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  sub_23C32E570();
  uint64_t v21 = sub_23C2A01EC(v1, (SEL *)&selRef_source);
  OUTLINED_FUNCTION_4_33(v21, v22);
  sub_23C32E570();
  swift_bridgeObjectRelease();
  return v24[0];
}

uint64_t SANotificationOnDeviceObject.isEqual(_:)(uint64_t a1)
{
  uint64_t v3 = sub_23C32E350();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C32AB6C(a1, (uint64_t)v22, qword_268B9AF50);
  if (!v23)
  {
    sub_23C2C248C((uint64_t)v22, qword_268B9AF50);
    goto LABEL_11;
  }
  sub_23C28F9FC(0, (unint64_t *)&qword_268B9AF38);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v3, (uint64_t)qword_268BA3998);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v16, v3);
    uint64_t v17 = sub_23C32E340();
    os_log_type_t v18 = sub_23C32E720();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_23C289000, v17, v18, "SANotificationOnDeviceObject isEqual | unable to convert object to SANotificationOnDeviceObject", v19, 2u);
      MEMORY[0x23ECE22B0](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_16;
  }
  id v7 = v21[1];
  uint64_t v8 = sub_23C32AAB4(v7);
  uint64_t v10 = v9;
  uint64_t v11 = sub_23C2A01EC(v1, (SEL *)&selRef_notificationId);
  uint64_t v13 = v12;
  if (!v10)
  {

    if (!v13)
    {
      char v15 = 1;
      return v15 & 1;
    }
    goto LABEL_21;
  }
  if (!v12)
  {

LABEL_21:
    swift_bridgeObjectRelease();
LABEL_16:
    char v15 = 0;
    return v15 & 1;
  }
  if (v8 == v11 && v10 == v12) {
    char v15 = 1;
  }
  else {
    char v15 = sub_23C32EB60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15 & 1;
}

uint64_t sub_23C32AA34(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_23C32E8B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = SANotificationOnDeviceObject.isEqual(_:)((uint64_t)v8);

  sub_23C2C248C((uint64_t)v8, qword_268B9AF50);
  return v6 & 1;
}

uint64_t sub_23C32AAB4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_notificationId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_23C32E480();

  return v3;
}

uint64_t sub_23C32AB24(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_title);
}

uint64_t sub_23C32AB30(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_subtitle);
}

uint64_t sub_23C32AB3C(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_body);
}

uint64_t sub_23C32AB48(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_notificationId);
}

uint64_t sub_23C32AB54(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_applicationId);
}

uint64_t sub_23C32AB60(void *a1)
{
  return sub_23C2A01EC(a1, (SEL *)&selRef_source);
}

uint64_t sub_23C32AB6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9_6();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

id OUTLINED_FUNCTION_0_16(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_4_33(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_33()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_23()
{
  return sub_23C32E470();
}

id OUTLINED_FUNCTION_9_26(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_10_22(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t type metadata accessor for FollowupNotificationsCATs()
{
  uint64_t result = qword_268B9C630;
  if (!qword_268B9C630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C32ACD8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23C32AD18(uint64_t a1, uint64_t a2)
{
  return sub_23C32AD6C(a1, a2);
}

uint64_t sub_23C32AD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23C32E250();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B340);
  MEMORY[0x270FA5388](v8 - 8);
  sub_23C2B38F0(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_23C32E060();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_23C2B3958(a1);
  return v10;
}

uint64_t sub_23C32AED4()
{
  return type metadata accessor for FollowupNotificationsCATs();
}

uint64_t sub_23C32AEDC()
{
  return sub_23C32AF0C(MEMORY[0x263F71538]);
}

uint64_t sub_23C32AEF4()
{
  return sub_23C32AF0C(MEMORY[0x263F71548]);
}

uint64_t sub_23C32AF0C(uint64_t (*a1)(void))
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9B360);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v4 - v3;
  sub_23C32DEB0();
  sub_23C2CEB2C(v5);
  uint64_t v6 = sub_23C32DAF0();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_23C2A5500(v5, &qword_268B9B360);
    char v7 = 0;
  }
  else
  {
    char v7 = a1();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  return v7 & 1;
}

uint64_t sub_23C32B014()
{
  return sub_23C32AF0C(MEMORY[0x263F71540]);
}

uint64_t sub_23C32B02C()
{
  uint64_t v1 = type metadata accessor for NotificationNLv4Intent();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v3 - v2;
  sub_23C32DD10();
  if (!v8)
  {
    sub_23C2A5500((uint64_t)v7, qword_268B9AF50);
LABEL_5:
    sub_23C32B1A0(v0, v4);
    sub_23C32DD10();
    if (v8)
    {
      sub_23C32DE10();
      if (OUTLINED_FUNCTION_6_34())
      {
        swift_release();
        goto LABEL_8;
      }
    }
    else
    {
      sub_23C2A5500((uint64_t)v7, qword_268B9AF50);
    }
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  sub_23C32DE00();
  if (!OUTLINED_FUNCTION_6_34()) {
    goto LABEL_5;
  }
  swift_release();
  sub_23C32B1A0(v0, v4);
LABEL_8:
  uint64_t v5 = 1;
LABEL_11:
  sub_23C32B204(v4);
  return v5;
}

uint64_t type metadata accessor for NotificationNLv4Intent()
{
  uint64_t result = qword_268B9C650;
  if (!qword_268B9C650) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C32B1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationNLv4Intent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C32B204(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NotificationNLv4Intent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C32B260()
{
  type metadata accessor for NotificationNLv4Intent();
  sub_23C32DD10();
  if (v4)
  {
    sub_23C32DDF0();
    if (OUTLINED_FUNCTION_0_17())
    {
      OUTLINED_FUNCTION_8_30();
      sub_23C32DD50();
      swift_release();
      if (v3[0])
      {
        swift_retain();
        sub_23C32DCB0();
        OUTLINED_FUNCTION_7_24();
        if (v0) {
          goto LABEL_26;
        }
        swift_release();
      }
      swift_release();
    }
  }
  else
  {
    sub_23C2A5500((uint64_t)v3, qword_268B9AF50);
  }
  sub_23C32DD10();
  if (v4)
  {
    sub_23C32DD30();
    if (OUTLINED_FUNCTION_0_17())
    {
      OUTLINED_FUNCTION_8_30();
      sub_23C32DD50();
      swift_release();
      if (v3[0])
      {
        swift_retain();
        sub_23C32DCB0();
        OUTLINED_FUNCTION_7_24();
        if (v0) {
          goto LABEL_26;
        }
        swift_release();
      }
      swift_release();
    }
  }
  else
  {
    sub_23C2A5500((uint64_t)v3, qword_268B9AF50);
  }
  sub_23C32DD10();
  if (!v4)
  {
    sub_23C2A5500((uint64_t)v3, qword_268B9AF50);
    goto LABEL_22;
  }
  sub_23C32DE70();
  if ((OUTLINED_FUNCTION_0_17() & 1) == 0) {
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_8_30();
  sub_23C32DD50();
  swift_release();
  if (!v3[0])
  {
LABEL_21:
    swift_release();
LABEL_22:
    sub_23C32DD10();
    if (v4)
    {
      sub_23C32DE40();
      if (OUTLINED_FUNCTION_0_17())
      {
        OUTLINED_FUNCTION_8_30();
        sub_23C32DBC0();
        swift_release();
        if (v3[0])
        {
          swift_retain();
          sub_23C32DCB0();
          OUTLINED_FUNCTION_7_24();
          if (v0) {
            goto LABEL_26;
          }
          swift_release();
        }
        swift_release();
      }
    }
    else
    {
      sub_23C2A5500((uint64_t)v3, qword_268B9AF50);
    }
    return 0;
  }
  swift_retain();
  sub_23C32DCB0();
  OUTLINED_FUNCTION_7_24();
  if (!v0)
  {
    swift_release();
    goto LABEL_21;
  }
LABEL_26:
  uint64_t v1 = sub_23C32BC8C();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23C32B514()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C640);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = sub_23C32DDC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v28 - v11;
  type metadata accessor for NotificationNLv4Intent();
  sub_23C32DD10();
  sub_23C32C358((uint64_t)v32, (uint64_t)v30);
  if (v31)
  {
    sub_23C32DE70();
    if (swift_dynamicCast())
    {
      uint64_t v13 = v28[0];
      goto LABEL_6;
    }
  }
  else
  {
    sub_23C2A5500((uint64_t)v30, qword_268B9AF50);
  }
  uint64_t v13 = 0;
LABEL_6:
  sub_23C32C358((uint64_t)v32, (uint64_t)v30);
  if (v13)
  {
    swift_release();
    sub_23C2A5500((uint64_t)v30, qword_268B9AF50);
  }
  else
  {
    sub_23C2989B8((uint64_t)v30, (uint64_t)v28);
    if (!v29) {
      goto LABEL_17;
    }
    sub_23C32DDF0();
    if ((OUTLINED_FUNCTION_3_32() & 1) == 0) {
      goto LABEL_22;
    }
    swift_release();
  }
  sub_23C32C358((uint64_t)v32, (uint64_t)v28);
  if (!v29)
  {
LABEL_17:
    char v15 = qword_268B9AF50;
    uint64_t v16 = v28;
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268B9C648);
  if ((OUTLINED_FUNCTION_3_32() & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v27 = v6;
  sub_23C32DD50();
  if (!v28[0]) {
    goto LABEL_21;
  }
  swift_retain();
  uint64_t v14 = sub_23C32DCA0();
  swift_release();
  if (!v14)
  {
    swift_release();
LABEL_21:
    swift_release();
    goto LABEL_22;
  }
  sub_23C32DDB0();
  swift_release();
  swift_release();
  swift_release();
  if (__swift_getEnumTagSinglePayload(v3, 1, v4) == 1)
  {
    char v15 = &qword_268B9C640;
    uint64_t v16 = (void *)v3;
LABEL_18:
    sub_23C2A5500((uint64_t)v16, v15);
    goto LABEL_22;
  }
  uint64_t v21 = v27;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 32);
  v22(v12, v3, v4);
  v22(v10, (uint64_t)v12, v4);
  if ((*(unsigned int (**)(char *, uint64_t))(v21 + 88))(v10, v4) == *MEMORY[0x263F72E40])
  {
    sub_23C2A5500((uint64_t)v32, qword_268B9AF50);
    uint64_t v23 = OUTLINED_FUNCTION_5_32();
    v24(v23);
    return 1;
  }
  uint64_t v25 = OUTLINED_FUNCTION_5_32();
  v26(v25);
LABEL_22:
  sub_23C32DD10();
  if (!v29)
  {
    sub_23C2A5500((uint64_t)v28, qword_268B9AF50);
    goto LABEL_31;
  }
  sub_23C32DDF0();
  if ((OUTLINED_FUNCTION_3_32() & 1) == 0)
  {
LABEL_31:
    sub_23C2A5500((uint64_t)v32, qword_268B9AF50);
    return 0;
  }
  swift_retain();
  sub_23C32DD50();
  swift_release();
  if (!v28[0])
  {
    swift_release();
    goto LABEL_31;
  }
  unint64_t v17 = sub_23C32DDD0();
  if (!v17)
  {
    sub_23C2A5500((uint64_t)v32, qword_268B9AF50);
    swift_release();
    swift_release();
    return 0;
  }
  if (v17 >> 62) {
    uint64_t v18 = sub_23C32EA30();
  }
  else {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  BOOL v19 = v18 != 0;
  sub_23C2A5500((uint64_t)v32, qword_268B9AF50);
  return v19;
}

uint64_t sub_23C32B950()
{
  uint64_t v0 = sub_23C32E350();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v20 - v7;
  type metadata accessor for NotificationNLv4Intent();
  sub_23C32DD10();
  if (!v20[3])
  {
    sub_23C2A5500((uint64_t)v20, qword_268B9AF50);
    goto LABEL_6;
  }
  sub_23C32DD30();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v0, (uint64_t)qword_268BA3998);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v10, v0);
    uint64_t v11 = sub_23C32E340();
    os_log_type_t v12 = sub_23C32E720();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_23C289000, v11, v12, "NotificationNLv4Intent getEntity | unable covert task to UsoTask_read_uso_NoEntity", v13, 2u);
      MEMORY[0x23ECE22B0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
    return 0;
  }
  swift_retain();
  sub_23C32DD50();
  swift_release();
  if (!v20[0])
  {
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v0, (uint64_t)qword_268BA3998);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v15, v0);
    uint64_t v16 = sub_23C32E340();
    os_log_type_t v17 = sub_23C32E720();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_23C289000, v16, v17, "NotificationNLv4Intent getEntity | unable to obtain reference", v18, 2u);
      MEMORY[0x23ECE22B0](v18, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v0);
    return 0;
  }
  swift_retain();
  uint64_t v9 = sub_23C32DC10();
  swift_release();
  swift_release_n();
  return v9;
}

uint64_t sub_23C32BC8C()
{
  uint64_t v58 = sub_23C32DCF0();
  uint64_t v0 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (char *)v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_23C32E350();
  uint64_t v2 = *(void *)(v64 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v64);
  uint64_t v5 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v68 = (char *)v51 - v6;
  uint64_t v7 = sub_23C32DC50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v53 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v59 = (char *)v51 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v51 - v13;
  uint64_t v15 = sub_23C32DCC0();
  if (!v15)
  {
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v44 = v64;
    uint64_t v45 = __swift_project_value_buffer(v64, (uint64_t)qword_268BA3998);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v45, v44);
    uint64_t v46 = sub_23C32E340();
    os_log_type_t v47 = sub_23C32E720();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_23C289000, v46, v47, "NotificationNLv4Intent getTargetAppId | unable to get uso identifiers", v48, 2u);
      MEMORY[0x23ECE22B0](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v64);
    return 0;
  }
  uint64_t v17 = *(void *)(v15 + 16);
  if (!v17)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v18 = *(void (**)(void))(v8 + 16);
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v51[0] = v15;
  unint64_t v20 = v15 + v19;
  uint64_t v67 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v62 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  unsigned int v56 = *MEMORY[0x263F72928];
  uint64_t v54 = (void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v55 = (void (**)(char *, void, uint64_t))(v0 + 104);
  uint64_t v60 = *(void *)(v8 + 72);
  *(void *)&long long v16 = 136315138;
  long long v52 = v16;
  v51[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v21 = v64;
  uint64_t v22 = v59;
  uint64_t v61 = v18;
  while (1)
  {
    unint64_t v65 = v20;
    uint64_t v66 = v17;
    v18(v14);
    if (qword_268B9AC70 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v21, (uint64_t)qword_268BA3998);
    (*v63)(v68, v23, v21);
    ((void (*)(char *, char *, uint64_t))v18)(v22, v14, v7);
    int v24 = sub_23C32E340();
    os_log_type_t v25 = sub_23C32E720();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v69 = v27;
      *(_DWORD *)uint64_t v26 = v52;
      ((void (*)(char *, char *, uint64_t))v18)(v53, v22, v7);
      uint64_t v28 = sub_23C32E4D0();
      *(void *)(v26 + 4) = sub_23C2A9890(v28, v29, &v69);
      swift_bridgeObjectRelease();
      long long v30 = *v67;
      (*v67)(v22, v7);
      _os_log_impl(&dword_23C289000, v24, v25, "NotificationNLv4Intent identifier | %s", (uint8_t *)v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v27;
      uint64_t v21 = v64;
      MEMORY[0x23ECE22B0](v31, -1, -1);
      MEMORY[0x23ECE22B0](v26, -1, -1);
    }
    else
    {
      long long v30 = *v67;
      (*v67)(v22, v7);
    }

    (*v62)(v68, v21);
    uint64_t v32 = sub_23C32DC40();
    if (!v33) {
      goto LABEL_15;
    }
    uint64_t v34 = v32;
    uint64_t v35 = v33;
    uint64_t v36 = v30;
    uint64_t v38 = v57;
    uint64_t v37 = v58;
    (*v55)(v57, v56, v58);
    uint64_t v39 = sub_23C32DCE0();
    uint64_t v41 = v40;
    (*v54)(v38, v37);
    if (v34 == v39 && v35 == v41) {
      break;
    }
    char v43 = sub_23C32EB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v64;
    long long v30 = v36;
    uint64_t v22 = v59;
    if (v43) {
      goto LABEL_25;
    }
LABEL_15:
    v30(v14, v7);
    uint64_t v18 = v61;
    unint64_t v20 = v65 + v60;
    uint64_t v17 = v66 - 1;
    if (v66 == 1) {
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v30 = v36;
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_23C32DC30();
  v30(v14, v7);
  return v49;
}

uint64_t sub_23C32C358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268B9AF50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_23C32C3C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_23C32DA10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_23C32C48C(uint64_t a1)
{
  uint64_t v2 = sub_23C32DA10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_23C32C500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23C32DA10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_23C32C580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23C32DA10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23C32C60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23C32DA10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23C32C688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23C32DA10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_23C32C70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23C32C720);
}

uint64_t sub_23C32C720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23C32DA10();
  OUTLINED_FUNCTION_2_32();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_23C32C7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23C32C7CC);
}

void sub_23C32C7CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_23C32DA10();
  OUTLINED_FUNCTION_2_32();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

uint64_t sub_23C32C854()
{
  uint64_t result = sub_23C32DA10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_32()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_34()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8_30()
{
  return swift_retain();
}

unint64_t sub_23C32C9B4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x6867694864616552;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000018;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 10:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_23C32CAE8(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 7:
      unint64_t result = 0x746E694879616C50;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_23C32CBD8(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 7:
      unint64_t result = 0x20636972656E6547;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C32CCD0()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_23C32CCE0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23C32CCF0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23C32CD00()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23C32CD10()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_23C32CD20()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_23C32CD30()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_23C32CD40()
{
  return MEMORY[0x270EEE0C8]();
}

uint64_t sub_23C32CD50()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_23C32CD60()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_23C32CD70()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_23C32CD80()
{
  return MEMORY[0x270EEE1F0]();
}

uint64_t sub_23C32CD90()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_23C32CDA0()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_23C32CDB0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23C32CDC0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_23C32CDD0()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_23C32CDE0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_23C32CDF0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_23C32CE00()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_23C32CE10()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_23C32CE20()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_23C32CE30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23C32CE40()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_23C32CE50()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23C32CE60()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_23C32CE70()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23C32CE80()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23C32CE90()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_23C32CEA0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23C32CEB0()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_23C32CEC0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_23C32CED0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_23C32CEE0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_23C32CEF0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_23C32CF00()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_23C32CF10()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_23C32CF20()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23C32CF30()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23C32CF40()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23C32CF50()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_23C32CF60()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23C32CF70()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23C32CF80()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_23C32CF90()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_23C32CFA0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_23C32CFB0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_23C32CFC0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_23C32CFD0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_23C32CFE0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_23C32CFF0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23C32D000()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_23C32D010()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_23C32D020()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_23C32D030()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23C32D040()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_23C32D080()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_23C32D090()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_23C32D0C0()
{
  return MEMORY[0x270F66478]();
}

uint64_t sub_23C32D0F0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_23C32D100()
{
  return MEMORY[0x270F66890]();
}

uint64_t sub_23C32D110()
{
  return MEMORY[0x270F66898]();
}

uint64_t sub_23C32D120()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_23C32D130()
{
  return MEMORY[0x270F66970]();
}

uint64_t sub_23C32D140()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_23C32D150()
{
  return MEMORY[0x270F66998]();
}

uint64_t sub_23C32D160()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_23C32D170()
{
  return MEMORY[0x270F669C0]();
}

uint64_t sub_23C32D180()
{
  return MEMORY[0x270F669C8]();
}

uint64_t sub_23C32D190()
{
  return MEMORY[0x270F669D0]();
}

uint64_t sub_23C32D1A0()
{
  return MEMORY[0x270F669D8]();
}

uint64_t sub_23C32D1B0()
{
  return MEMORY[0x270F669E0]();
}

uint64_t sub_23C32D1C0()
{
  return MEMORY[0x270F669E8]();
}

uint64_t sub_23C32D1D0()
{
  return MEMORY[0x270F669F0]();
}

uint64_t sub_23C32D1E0()
{
  return MEMORY[0x270F669F8]();
}

uint64_t sub_23C32D1F0()
{
  return MEMORY[0x270F66A00]();
}

uint64_t sub_23C32D210()
{
  return MEMORY[0x270F66A18]();
}

uint64_t sub_23C32D220()
{
  return MEMORY[0x270F66A20]();
}

uint64_t sub_23C32D230()
{
  return MEMORY[0x270F66C50]();
}

uint64_t sub_23C32D240()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_23C32D250()
{
  return MEMORY[0x270F66CB0]();
}

uint64_t sub_23C32D260()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_23C32D270()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_23C32D290()
{
  return MEMORY[0x270F66CD8]();
}

uint64_t sub_23C32D2B0()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_23C32D2C0()
{
  return MEMORY[0x270F66CF0]();
}

uint64_t sub_23C32D2D0()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_23C32D2E0()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_23C32D2F0()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_23C32D300()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_23C32D310()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_23C32D320()
{
  return MEMORY[0x270F66FF8]();
}

uint64_t sub_23C32D330()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_23C32D340()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_23C32D350()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_23C32D360()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_23C32D370()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_23C32D380()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_23C32D390()
{
  return MEMORY[0x270F670D8]();
}

uint64_t sub_23C32D3A0()
{
  return MEMORY[0x270F670E0]();
}

uint64_t sub_23C32D3B0()
{
  return MEMORY[0x270F670E8]();
}

uint64_t sub_23C32D3C0()
{
  return MEMORY[0x270F670F0]();
}

uint64_t sub_23C32D3D0()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_23C32D3E0()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_23C32D3F0()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_23C32D400()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_23C32D410()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_23C32D420()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_23C32D430()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_23C32D440()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_23C32D450()
{
  return MEMORY[0x270F672F8]();
}

uint64_t sub_23C32D460()
{
  return MEMORY[0x270F67310]();
}

uint64_t sub_23C32D470()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_23C32D480()
{
  return MEMORY[0x270F67388]();
}

uint64_t sub_23C32D490()
{
  return MEMORY[0x270F67390]();
}

uint64_t sub_23C32D4A0()
{
  return MEMORY[0x270F67398]();
}

uint64_t sub_23C32D4B0()
{
  return MEMORY[0x270F673A0]();
}

uint64_t sub_23C32D4C0()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_23C32D4D0()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_23C32D4E0()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_23C32D4F0()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_23C32D500()
{
  return MEMORY[0x270F67650]();
}

uint64_t sub_23C32D510()
{
  return MEMORY[0x270F67658]();
}

uint64_t sub_23C32D520()
{
  return MEMORY[0x270F67680]();
}

uint64_t sub_23C32D530()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_23C32D540()
{
  return MEMORY[0x270F676B8]();
}

uint64_t sub_23C32D560()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_23C32D570()
{
  return MEMORY[0x270F676E8]();
}

uint64_t sub_23C32D580()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_23C32D590()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_23C32D5A0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_23C32D5B0()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_23C32D5C0()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_23C32D5D0()
{
  return MEMORY[0x270F67788]();
}

uint64_t sub_23C32D5E0()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_23C32D5F0()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_23C32D600()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_23C32D610()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_23C32D620()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_23C32D630()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_23C32D640()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_23C32D650()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_23C32D660()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_23C32D670()
{
  return MEMORY[0x270F67898]();
}

uint64_t sub_23C32D680()
{
  return MEMORY[0x270F678A0]();
}

uint64_t sub_23C32D690()
{
  return MEMORY[0x270F678A8]();
}

uint64_t sub_23C32D6A0()
{
  return MEMORY[0x270F678B0]();
}

uint64_t sub_23C32D6B0()
{
  return MEMORY[0x270F678B8]();
}

uint64_t sub_23C32D6C0()
{
  return MEMORY[0x270F678C0]();
}

uint64_t sub_23C32D6D0()
{
  return MEMORY[0x270F678D0]();
}

uint64_t sub_23C32D6E0()
{
  return MEMORY[0x270F67928]();
}

uint64_t sub_23C32D6F0()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_23C32D700()
{
  return MEMORY[0x270F67980]();
}

uint64_t sub_23C32D710()
{
  return MEMORY[0x270F67990]();
}

uint64_t sub_23C32D720()
{
  return MEMORY[0x270F67998]();
}

uint64_t sub_23C32D730()
{
  return MEMORY[0x270F67A58]();
}

uint64_t sub_23C32D740()
{
  return MEMORY[0x270F67A60]();
}

uint64_t sub_23C32D750()
{
  return MEMORY[0x270F67A90]();
}

uint64_t sub_23C32D760()
{
  return MEMORY[0x270F67A98]();
}

uint64_t sub_23C32D770()
{
  return MEMORY[0x270F67AA0]();
}

uint64_t sub_23C32D780()
{
  return MEMORY[0x270F67AA8]();
}

uint64_t sub_23C32D790()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_23C32D7A0()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_23C32D7C0()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_23C32D7E0()
{
  return MEMORY[0x270F67C40]();
}

uint64_t sub_23C32D7F0()
{
  return MEMORY[0x270F67CD8]();
}

uint64_t sub_23C32D810()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_23C32D820()
{
  return MEMORY[0x270F67D80]();
}

uint64_t sub_23C32D830()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_23C32D840()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_23C32D850()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_23C32D860()
{
  return MEMORY[0x270F67EA8]();
}

uint64_t sub_23C32D870()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_23C32D880()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_23C32D890()
{
  return MEMORY[0x270F67F88]();
}

uint64_t sub_23C32D8A0()
{
  return MEMORY[0x270F67F90]();
}

uint64_t sub_23C32D8B0()
{
  return MEMORY[0x270F67F98]();
}

uint64_t sub_23C32D8C0()
{
  return MEMORY[0x270F67FA0]();
}

uint64_t sub_23C32D8D0()
{
  return MEMORY[0x270F68080]();
}

uint64_t sub_23C32D8E0()
{
  return MEMORY[0x270F68088]();
}

uint64_t sub_23C32D8F0()
{
  return MEMORY[0x270F68090]();
}

uint64_t sub_23C32D900()
{
  return MEMORY[0x270F68098]();
}

uint64_t sub_23C32D910()
{
  return MEMORY[0x270F680A0]();
}

uint64_t sub_23C32D920()
{
  return MEMORY[0x270F680A8]();
}

uint64_t sub_23C32D930()
{
  return MEMORY[0x270F680B0]();
}

uint64_t sub_23C32D940()
{
  return MEMORY[0x270F680C8]();
}

uint64_t sub_23C32D950()
{
  return MEMORY[0x270F680D0]();
}

uint64_t sub_23C32D960()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_23C32D970()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_23C32D980()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_23C32D990()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_23C32D9A0()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_23C32D9B0()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_23C32D9C0()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_23C32D9D0()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_23C32D9E0()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_23C32D9F0()
{
  return MEMORY[0x270F682B0]();
}

uint64_t sub_23C32DA00()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_23C32DA10()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_23C32DA20()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_23C32DA30()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_23C32DA40()
{
  return MEMORY[0x270F6A288]();
}

uint64_t sub_23C32DA50()
{
  return MEMORY[0x270F6A290]();
}

uint64_t sub_23C32DA60()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_23C32DA70()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_23C32DA80()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_23C32DA90()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_23C32DAA0()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_23C32DAB0()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_23C32DAC0()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_23C32DAD0()
{
  return MEMORY[0x270F6A7F8]();
}

uint64_t sub_23C32DAE0()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_23C32DAF0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_23C32DB00()
{
  return MEMORY[0x270F6AC70]();
}

uint64_t sub_23C32DB10()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_23C32DB20()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_23C32DB30()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_23C32DB40()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_23C32DB50()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_23C32DB60()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_23C32DB70()
{
  return MEMORY[0x270F6BB10]();
}

uint64_t sub_23C32DB80()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_23C32DB90()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_23C32DBA0()
{
  return MEMORY[0x270F6BF88]();
}

uint64_t sub_23C32DBB0()
{
  return MEMORY[0x270F6BF98]();
}

uint64_t sub_23C32DBC0()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_23C32DBD0()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_23C32DBE0()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_23C32DBF0()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_23C32DC00()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_23C32DC10()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_23C32DC20()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_23C32DC30()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_23C32DC40()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_23C32DC50()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_23C32DC70()
{
  return MEMORY[0x270F6CA68]();
}

uint64_t sub_23C32DC90()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_23C32DCA0()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_23C32DCB0()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_23C32DCC0()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_23C32DCD0()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_23C32DCE0()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_23C32DCF0()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_23C32DD00()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_23C32DD10()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_23C32DD20()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_23C32DD30()
{
  return MEMORY[0x270F6D360]();
}

uint64_t sub_23C32DD40()
{
  return MEMORY[0x270F6D3D8]();
}

uint64_t sub_23C32DD50()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_23C32DD60()
{
  return MEMORY[0x270F6D520]();
}

uint64_t sub_23C32DD70()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_23C32DD80()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_23C32DD90()
{
  return MEMORY[0x270F6D660]();
}

uint64_t sub_23C32DDA0()
{
  return MEMORY[0x270F6D818]();
}

uint64_t sub_23C32DDB0()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_23C32DDC0()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_23C32DDD0()
{
  return MEMORY[0x270F6D998]();
}

uint64_t sub_23C32DDF0()
{
  return MEMORY[0x270F6E178]();
}

uint64_t sub_23C32DE00()
{
  return MEMORY[0x270F6E1B0]();
}

uint64_t sub_23C32DE10()
{
  return MEMORY[0x270F6E1B8]();
}

uint64_t sub_23C32DE20()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_23C32DE30()
{
  return MEMORY[0x270F6E558]();
}

uint64_t sub_23C32DE40()
{
  return MEMORY[0x270F6E578]();
}

uint64_t sub_23C32DE50()
{
  return MEMORY[0x270F6E828]();
}

uint64_t sub_23C32DE60()
{
  return MEMORY[0x270F6E830]();
}

uint64_t sub_23C32DE70()
{
  return MEMORY[0x270F6EBC8]();
}

uint64_t sub_23C32DE80()
{
  return MEMORY[0x270F6EDC0]();
}

uint64_t sub_23C32DE90()
{
  return MEMORY[0x270F6EDC8]();
}

uint64_t sub_23C32DEA0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_23C32DEB0()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_23C32DEC0()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_23C32DED0()
{
  return MEMORY[0x270F0CC38]();
}

uint64_t sub_23C32DEE0()
{
  return MEMORY[0x270F0CC40]();
}

uint64_t sub_23C32DEF0()
{
  return MEMORY[0x270F1A770]();
}

uint64_t sub_23C32DF00()
{
  return MEMORY[0x270F1A788]();
}

uint64_t sub_23C32DF10()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_23C32DF20()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_23C32DF30()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_23C32DF40()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_23C32DF50()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_23C32DF60()
{
  return MEMORY[0x270F72A48]();
}

uint64_t sub_23C32DF70()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_23C32DF80()
{
  return MEMORY[0x270F72AB8]();
}

uint64_t sub_23C32DFA0()
{
  return MEMORY[0x270F71F60]();
}

uint64_t sub_23C32DFB0()
{
  return MEMORY[0x270F71F80]();
}

uint64_t sub_23C32DFC0()
{
  return MEMORY[0x270F71F90]();
}

uint64_t sub_23C32DFD0()
{
  return MEMORY[0x270F71FA8]();
}

uint64_t sub_23C32DFE0()
{
  return MEMORY[0x270F71FB0]();
}

uint64_t sub_23C32DFF0()
{
  return MEMORY[0x270F71FB8]();
}

uint64_t sub_23C32E000()
{
  return MEMORY[0x270F64E38]();
}

uint64_t sub_23C32E010()
{
  return MEMORY[0x270F64E48]();
}

uint64_t sub_23C32E020()
{
  return MEMORY[0x270F64E50]();
}

uint64_t sub_23C32E030()
{
  return MEMORY[0x270F64E60]();
}

uint64_t sub_23C32E040()
{
  return MEMORY[0x270F64E80]();
}

uint64_t sub_23C32E050()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_23C32E060()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_23C32E070()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t sub_23C32E080()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_23C32E090()
{
  return MEMORY[0x270F64ED0]();
}

uint64_t sub_23C32E0A0()
{
  return MEMORY[0x270F64ED8]();
}

uint64_t sub_23C32E0B0()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t sub_23C32E0C0()
{
  return MEMORY[0x270F64EF0]();
}

uint64_t sub_23C32E0D0()
{
  return MEMORY[0x270F64F08]();
}

uint64_t sub_23C32E0E0()
{
  return MEMORY[0x270F64F10]();
}

uint64_t sub_23C32E0F0()
{
  return MEMORY[0x270F64F18]();
}

uint64_t sub_23C32E100()
{
  return MEMORY[0x270F64F20]();
}

uint64_t sub_23C32E120()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_23C32E140()
{
  return MEMORY[0x270F64F60]();
}

uint64_t sub_23C32E150()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_23C32E160()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_23C32E170()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_23C32E180()
{
  return MEMORY[0x270F650D8]();
}

uint64_t sub_23C32E190()
{
  return MEMORY[0x270F650E0]();
}

uint64_t sub_23C32E1A0()
{
  return MEMORY[0x270F650E8]();
}

uint64_t sub_23C32E1B0()
{
  return MEMORY[0x270F650F0]();
}

uint64_t sub_23C32E1C0()
{
  return MEMORY[0x270F650F8]();
}

uint64_t sub_23C32E1D0()
{
  return MEMORY[0x270F65100]();
}

uint64_t sub_23C32E1E0()
{
  return MEMORY[0x270F65110]();
}

uint64_t sub_23C32E1F0()
{
  return MEMORY[0x270F65118]();
}

uint64_t sub_23C32E200()
{
  return MEMORY[0x270F65120]();
}

uint64_t sub_23C32E210()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_23C32E230()
{
  return MEMORY[0x270F65150]();
}

uint64_t sub_23C32E240()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_23C32E250()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_23C32E260()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_23C32E270()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_23C32E280()
{
  return MEMORY[0x270F652D8]();
}

uint64_t sub_23C32E290()
{
  return MEMORY[0x270F65300]();
}

uint64_t sub_23C32E2A0()
{
  return MEMORY[0x270F65350]();
}

uint64_t sub_23C32E2B0()
{
  return MEMORY[0x270F65370]();
}

uint64_t sub_23C32E2C0()
{
  return MEMORY[0x270F706A8]();
}

uint64_t sub_23C32E2D0()
{
  return MEMORY[0x270F706D8]();
}

uint64_t sub_23C32E2E0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_23C32E2F0()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_23C32E300()
{
  return MEMORY[0x270F08550]();
}

uint64_t sub_23C32E310()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_23C32E320()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_23C32E330()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_23C32E340()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23C32E350()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23C32E360()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_23C32E370()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_23C32E380()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_23C32E390()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_23C32E3A0()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_23C32E3B0()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_23C32E3C0()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_23C32E3D0()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_23C32E3E0()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_23C32E3F0()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_23C32E400()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23C32E410()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23C32E420()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_23C32E430()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_23C32E440()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23C32E450()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23C32E460()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23C32E470()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23C32E480()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23C32E490()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_23C32E4A0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_23C32E4B0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23C32E4C0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23C32E4D0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23C32E4E0()
{
  return MEMORY[0x270F9D5E8]();
}

uint64_t sub_23C32E4F0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_23C32E500()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_23C32E510()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_23C32E520()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_23C32E530()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_23C32E540()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_23C32E550()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23C32E560()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23C32E570()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23C32E580()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_23C32E590()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23C32E5A0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23C32E5B0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_23C32E5C0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23C32E5D0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_23C32E5E0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_23C32E5F0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_23C32E600()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_23C32E610()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23C32E620()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23C32E630()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23C32E640()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23C32E650()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23C32E660()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23C32E670()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23C32E680()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23C32E690()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23C32E6A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23C32E6B0()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_23C32E6C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23C32E6D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23C32E6E0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_23C32E6F0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23C32E700()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_23C32E710()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_23C32E720()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23C32E730()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23C32E740()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23C32E750()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23C32E760()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_23C32E770()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_23C32E780()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_23C32E790()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_23C32E7A0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_23C32E7B0()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_23C32E7C0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23C32E7D0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23C32E7E0()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t sub_23C32E7F0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23C32E800()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_23C32E810()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23C32E820()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_23C32E830()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23C32E840()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23C32E850()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_23C32E860()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_23C32E870()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_23C32E880()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_23C32E890()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23C32E8A0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_23C32E8B0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23C32E8C0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_23C32E8D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_23C32E8E0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23C32E8F0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23C32E900()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23C32E920()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_23C32E930()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23C32E940()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23C32E950()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_23C32E960()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23C32E970()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23C32E980()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23C32E990()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_23C32E9A0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23C32E9B0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23C32E9C0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23C32E9D0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23C32E9E0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23C32E9F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23C32EA00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23C32EA10()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23C32EA20()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_23C32EA30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23C32EA40()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_23C32EA50()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23C32EA60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23C32EA70()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23C32EA90()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23C32EAA0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23C32EAB0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_23C32EAC0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23C32EAE0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_23C32EAF0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23C32EB00()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_23C32EB10()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23C32EB20()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_23C32EB30()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23C32EB40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23C32EB60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23C32EB70()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_23C32EB80()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_23C32EB90()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_23C32EBA0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23C32EBB0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23C32EBC0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23C32EBD0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23C32EBE0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23C32EBF0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23C32EC00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23C32EC10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23C32EC20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23C32EC30()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23C32EC40()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_23C32EC50()
{
  return MEMORY[0x270F9FE98]();
}

uint64_t sub_23C32EC60()
{
  return MEMORY[0x270F9FF20]();
}

uint64_t sub_23C32EC70()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_23C32EC80()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t AFSiriAnnouncementPlatformGetName()
{
  return MEMORY[0x270F0EF50]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x270F18BE0]();
}

uint64_t CEMEmojiTokenCopyNameWithCount()
{
  return MEMORY[0x270F18C28]();
}

uint64_t CEMEmojiTokenCreateWithString()
{
  return MEMORY[0x270F18C30]();
}

uint64_t CEMEmojiTokensAreEquivalent()
{
  return MEMORY[0x270F18C40]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x270F18C50]();
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}