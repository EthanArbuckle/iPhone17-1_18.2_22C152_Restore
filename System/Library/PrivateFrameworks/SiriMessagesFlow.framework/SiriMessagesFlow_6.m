uint64_t sub_25D4E9DB0()
{
  return sub_25D4E9DF8(MEMORY[0x263F72A90]);
}

uint64_t sub_25D4E9DC8()
{
  return sub_25D4E9DF8(MEMORY[0x263F729B8]);
}

uint64_t sub_25D4E9DE0()
{
  return sub_25D4E9DF8(MEMORY[0x263F729A0]);
}

uint64_t sub_25D4E9DF8(uint64_t (*a1)(void))
{
  uint64_t v2 = sub_25D53B350();
  swift_release();
  if (!v2)
  {
    uint64_t v3 = sub_25D53B330();
    swift_release();
    if (!v3)
    {
      uint64_t v4 = sub_25D53B360();
      uint64_t v5 = swift_release();
      if (!v4)
      {
        if (!((uint64_t (*)(uint64_t))a1)(v5) || (uint64_t v6 = sub_25D53B350(), swift_release(), !v6))
        {
          if (!a1() || (uint64_t v7 = sub_25D53B330(), swift_release(), !v7))
          {
            uint64_t result = a1();
            if (!result) {
              return result;
            }
            uint64_t v9 = sub_25D53B360();
            swift_release();
            if (!v9) {
              return 0;
            }
          }
        }
        swift_release();
      }
    }
  }
  return 1;
}

uint64_t sub_25D4E9EF4()
{
  sub_25D53B4C0();
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t result = sub_25D53B4B0();
    if (!result) {
      return result;
    }
    swift_release();
  }
  return 1;
}

uint64_t sub_25D4E9F34()
{
  sub_25D53B020();
  uint64_t v0 = sub_25D53BF90();
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_10_50();
  unint64_t v3 = sub_25D218B84(v1, v2, v0);
  swift_bridgeObjectRelease();
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (!(v3 >> 62))
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_4;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25D53EEB0();
  if (!v5) {
    goto LABEL_19;
  }
LABEL_4:
  uint64_t result = sub_25D53B4D0();
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](i, v3);
      }
      else {
        swift_retain();
      }
      if (sub_25D53BF60())
      {
        uint64_t v8 = sub_25D53B080();
        swift_release();
        if (v8)
        {
          sub_25D53BF50();
          swift_release();
        }
      }
      sub_25D53B730();
      swift_release();
      uint64_t v9 = swift_release();
      if (v10)
      {
        MEMORY[0x2611ABBF0](v9);
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25D53E500();
        }
        sub_25D53E540();
        sub_25D53E4E0();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v4 = v11;
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D4EA12C()
{
  sub_25D53BA80();
  OUTLINED_FUNCTION_0_36();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_37_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A673280);
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_25_12();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A673210);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_102_8();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_45_8();
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v25 - v12;
  uint64_t v14 = sub_25D53B350();
  if (v14)
  {
    uint64_t v1 = v14;
    sub_25D53BA60();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_16_43();
  }
  uint64_t v15 = OUTLINED_FUNCTION_9_51();
  v16(v15);
  OUTLINED_FUNCTION_19_50();
  sub_25D1B4A60((uint64_t)v13, v2, &qword_26A673210);
  sub_25D1B4A60(v4, v1, &qword_26A673210);
  OUTLINED_FUNCTION_22_5(v2);
  if (v20)
  {
    sub_25D1797C8(v4, &qword_26A673210);
    sub_25D1797C8((uint64_t)v13, &qword_26A673210);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v0);
    if (EnumTagSinglePayload == 1) {
      v18 = &qword_26A673210;
    }
    else {
      v18 = &qword_26A673280;
    }
    if (EnumTagSinglePayload == 1) {
      char v19 = -1;
    }
    else {
      char v19 = 0;
    }
  }
  else
  {
    sub_25D1B4A60(v2, v3, &qword_26A673210);
    OUTLINED_FUNCTION_22_5(v1);
    if (v20)
    {
      sub_25D1797C8(v4, &qword_26A673210);
      sub_25D1797C8((uint64_t)v13, &qword_26A673210);
      OUTLINED_FUNCTION_5_69();
      v21();
      char v19 = 0;
      v18 = &qword_26A673280;
    }
    else
    {
      OUTLINED_FUNCTION_2_66();
      v22();
      sub_25D4EA9DC(&qword_26A673288, MEMORY[0x263F730A8]);
      char v19 = OUTLINED_FUNCTION_12_59();
      v23 = *(void (**)(void))(v6 + 8);
      OUTLINED_FUNCTION_5_69();
      v23();
      v18 = &qword_26A673210;
      sub_25D1797C8(v4, &qword_26A673210);
      sub_25D1797C8((uint64_t)v13, &qword_26A673210);
      ((void (*)(uint64_t, uint64_t))v23)(v3, v0);
    }
  }
  sub_25D1797C8(v2, v18);
  return v19 & 1;
}

uint64_t sub_25D4EA3FC()
{
  sub_25D53B830();
  OUTLINED_FUNCTION_0_36();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_37_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A673258);
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_25_12();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A673260);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_102_8();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_45_8();
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v25 - v12;
  uint64_t v14 = sub_25D53B320();
  if (v14)
  {
    uint64_t v1 = v14;
    sub_25D53B820();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_16_43();
  }
  uint64_t v15 = OUTLINED_FUNCTION_9_51();
  v16(v15);
  OUTLINED_FUNCTION_19_50();
  sub_25D1B4A60((uint64_t)v13, v2, &qword_26A673260);
  sub_25D1B4A60(v4, v1, &qword_26A673260);
  OUTLINED_FUNCTION_22_5(v2);
  if (v20)
  {
    sub_25D1797C8(v4, &qword_26A673260);
    sub_25D1797C8((uint64_t)v13, &qword_26A673260);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v0);
    if (EnumTagSinglePayload == 1) {
      v18 = &qword_26A673260;
    }
    else {
      v18 = &qword_26A673258;
    }
    if (EnumTagSinglePayload == 1) {
      char v19 = -1;
    }
    else {
      char v19 = 0;
    }
  }
  else
  {
    sub_25D1B4A60(v2, v3, &qword_26A673260);
    OUTLINED_FUNCTION_22_5(v1);
    if (v20)
    {
      sub_25D1797C8(v4, &qword_26A673260);
      sub_25D1797C8((uint64_t)v13, &qword_26A673260);
      OUTLINED_FUNCTION_5_69();
      v21();
      char v19 = 0;
      v18 = &qword_26A673258;
    }
    else
    {
      OUTLINED_FUNCTION_2_66();
      v22();
      sub_25D4EA9DC(&qword_26A673268, MEMORY[0x263F72CB0]);
      char v19 = OUTLINED_FUNCTION_12_59();
      v23 = *(void (**)(void))(v6 + 8);
      OUTLINED_FUNCTION_5_69();
      v23();
      v18 = &qword_26A673260;
      sub_25D1797C8(v4, &qword_26A673260);
      sub_25D1797C8((uint64_t)v13, &qword_26A673260);
      ((void (*)(uint64_t, uint64_t))v23)(v3, v0);
    }
  }
  sub_25D1797C8(v2, v18);
  return v19 & 1;
}

uint64_t sub_25D4EA6CC(uint64_t a1, uint64_t a2)
{
  sub_25D53B020();
  uint64_t v4 = sub_25D53BF90();
  swift_release();
  uint64_t v5 = OUTLINED_FUNCTION_10_50();
  unint64_t v7 = sub_25D218B84(v5, v6, v4);
  swift_bridgeObjectRelease();
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!v7) {
    return v8;
  }
  unint64_t v21 = MEMORY[0x263F8EE78];
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25D53EEB0();
    uint64_t v9 = result;
    if (result) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    unint64_t v14 = MEMORY[0x263F8EE78];
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_16;
  }
LABEL_4:
  if (v9 < 1)
  {
    __break(1u);
    goto LABEL_37;
  }
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      MEMORY[0x2611AC4C0](i, v7);
    }
    else {
      swift_retain();
    }
    uint64_t v12 = sub_25D53BF60();
    uint64_t v13 = swift_release();
    if (v12)
    {
      MEMORY[0x2611ABBF0](v13);
      if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        OUTLINED_FUNCTION_1_24();
      }
      sub_25D53E540();
      sub_25D53E4E0();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v14 = v21;
LABEL_17:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_25D4E9434(v14, a1, a2);
  unint64_t v16 = v15;
  if (!(v15 >> 62))
  {
    uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_19;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_34:
    swift_bridgeObjectRelease();
    return v8;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_25D53EEB0();
  if (!v17) {
    goto LABEL_33;
  }
LABEL_19:
  uint64_t result = sub_25D53B560();
  if (v17 >= 1)
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      if ((v16 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](j, v16);
      }
      else {
        swift_retain();
      }
      if (sub_25D53B080())
      {
        sub_25D53BF50();
        swift_release();
      }
      sub_25D53B730();
      swift_release();
      uint64_t v19 = swift_release();
      if (v20)
      {
        MEMORY[0x2611ABBF0](v19);
        if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          OUTLINED_FUNCTION_1_24();
        }
        sub_25D53E540();
        sub_25D53E4E0();
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25D4EA9DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_6_76()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_51()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_50()
{
  return 0x6E65697069636572;
}

uint64_t OUTLINED_FUNCTION_12_59()
{
  return sub_25D53E1C0();
}

uint64_t OUTLINED_FUNCTION_16_43()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_18_44()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_50()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t sub_25D4EAB24(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25D53EDC0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25D174EE4(i, (uint64_t)v5);
    sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25D53EDA0();
    sub_25D53EDD0();
    sub_25D53EDE0();
    sub_25D53EDB0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_25D4EAC40(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25D53EEB0();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_25D1F6054();
  uint64_t v3 = v9;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25D53EEB0();
    swift_bridgeObjectRelease();
    if (!v5) {
      return v3;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v3;
  }
  if ((a1 & 0xC000000000000001) != 0) {
    id v6 = (id)MEMORY[0x2611AC4C0](0, a1);
  }
  else {
    id v6 = *(id *)(a1 + 32);
  }
  unint64_t v7 = v6;
  self;
  if (swift_dynamicCastObjCClass())
  {
    sub_25D17DBEC(0, &qword_26A6715B0);
    sub_25D53E4B0();

    swift_release();
  }
  else
  {
    swift_release();
  }
  return 0;
}

uint64_t sub_25D4EAE20(uint64_t a1, uint64_t a2)
{
  return sub_25D4EAE2C(a1, a2, &qword_26A674B98);
}

uint64_t sub_25D4EAE2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = a2;
  sub_25D2B6C08((uint64_t)&v4, *(void *)(*(void *)(a1 + 64) + 40), a3);
  return swift_continuation_resume();
}

id sub_25D4EAE80()
{
  return OUTLINED_FUNCTION_4_67(28, 0x800000025D55CAB0);
}

id sub_25D4EAE98()
{
  return OUTLINED_FUNCTION_4_67(19, 0x800000025D5502E0);
}

id sub_25D4EAEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D53E200();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone(MEMORY[0x263F02AD8]);
  return sub_25D4EC0B8(a1, a2, v4, v6);
}

uint64_t sub_25D4EAF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[25] = a4;
  v5[26] = v4;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  uint64_t v6 = sub_25D53CAF0();
  v5[27] = v6;
  OUTLINED_FUNCTION_11_0(v6);
  v5[28] = v7;
  v5[29] = swift_task_alloc();
  uint64_t v8 = sub_25D53CB10();
  v5[30] = v8;
  OUTLINED_FUNCTION_11_0(v8);
  v5[31] = v9;
  unsigned char v5[32] = swift_task_alloc();
  uint64_t v10 = sub_25D53CB40();
  v5[33] = v10;
  OUTLINED_FUNCTION_11_0(v10);
  v5[34] = v11;
  v5[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D4EB038, 0, 0);
}

uint64_t sub_25D4EB038()
{
  v37 = v0;
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v4 = v0[32];
  uint64_t v3 = v0[33];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[31];
  uint64_t v8 = v0[28];
  uint64_t v7 = v0[29];
  uint64_t v9 = v0[27];
  sub_25D53CB00();
  sub_25D53CB30();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_25D53CB20();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LODWORD(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9);
  LODWORD(v3) = *MEMORY[0x263F41150];
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  if (v1 == v3)
  {
    uint64_t v10 = 0xD000000000000013;
    if (v0[24] == 0xD000000000000013 && v0[25] == 0x800000025D5502E0 || (sub_25D53F090() & 1) != 0)
    {
      id v11 = sub_25D4EAE98();
      uint64_t v12 = "numberOfSendersMinusTwo";
    }
    else
    {
      id v11 = sub_25D4EAE80();
      uint64_t v10 = 0xD00000000000001CLL;
      uint64_t v12 = "esFlow22MessageSummaryProvider";
    }
    unint64_t v19 = (unint64_t)v12 | 0x8000000000000000;
    id v35 = v11;
    v0[36] = v11;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25D53DC10();
    v0[37] = __swift_project_value_buffer(v20, (uint64_t)qword_26A688F10);
    swift_bridgeObjectRetain_n();
    unint64_t v21 = sub_25D53DC00();
    os_log_type_t v22 = sub_25D53E7B0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = OUTLINED_FUNCTION_30();
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      v0[20] = sub_25D19E114(v10, v19, &v36);
      sub_25D53EA80();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25D16D000, v21, v22, "#MessageSummaryProvider Fetching summary from %s", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v24 = v0[22];
    uint64_t v25 = v0[23];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F600);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_25D541BE0;
    *(void *)(v26 + 32) = sub_25D53E200();
    *(void *)(v26 + 40) = v27;
    *(void *)(v26 + 48) = sub_25D53E200();
    *(void *)(v26 + 56) = v28;
    uint64_t v29 = sub_25D53E4A0();
    v0[38] = v29;
    swift_bridgeObjectRelease();
    sub_25D53E200();
    uint64_t v30 = sub_25D53E1D0();
    v0[39] = v30;
    swift_bridgeObjectRelease();
    uint64_t v31 = sub_25D53E1D0();
    v0[40] = v31;
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_25D541230;
    *(void *)(v32 + 32) = v24;
    *(void *)(v32 + 40) = v25;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25D53E4A0();
    v0[41] = v33;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_25D4EB5F8;
    uint64_t v34 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_25D4EC034;
    v0[13] = &block_descriptor_2;
    v0[14] = v34;
    objc_msgSend(v35, sel_slowFetchAttributes_protectionClass_bundleID_identifiers_options_completionHandler_, v29, v30, v31, v33, 32);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25D53DC10();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A688F10);
    unint64_t v14 = sub_25D53DC00();
    os_log_type_t v15 = sub_25D53E7B0();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_25D16D000, v14, v15, "#MessageSummaryProvider Summarization is not available for this device or locale", v16, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17(0);
  }
}

uint64_t sub_25D4EB5F8()
{
  return MEMORY[0x270FA2498](sub_25D4EB6D8, 0, 0);
}

uint64_t sub_25D4EB6D8()
{
  uint64_t v29 = v0;
  unint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void **)(v0 + 320);
  uint64_t v3 = *(void **)(v0 + 328);
  uint64_t v5 = *(void **)(v0 + 304);
  uint64_t v4 = *(void **)(v0 + 312);
  if (!v1)
  {

    goto LABEL_11;
  }
  uint64_t v6 = sub_25D4EAC40(v1);
  swift_bridgeObjectRelease();

  if (!v6)
  {
LABEL_11:
    OUTLINED_FUNCTION_2_67();
    id v11 = sub_25D53DC00();
    os_log_type_t v12 = sub_25D53E7B0();
    BOOL v13 = os_log_type_enabled(v11, v12);
    unint64_t v14 = *(void *)(v0 + 184);
    if (v13)
    {
      OUTLINED_FUNCTION_7_54();
      uint64_t v27 = v15;
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v28 = OUTLINED_FUNCTION_30();
      *(_DWORD *)unint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 128) = sub_25D19E114((uint64_t)v5, v14, (uint64_t *)&v28);
      sub_25D53EA80();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25D16D000, v11, v12, "#MessageSummaryProvider No summary results found for messageID: %s", v16, 0xCu);
      OUTLINED_FUNCTION_31_3();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      goto LABEL_22;
    }

    goto LABEL_21;
  }
  if (!*(void *)(v6 + 16))
  {
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  unint64_t v7 = *(void *)(v6 + 32);
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_6;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  if (!sub_25D53EEB0()) {
    goto LABEL_16;
  }
LABEL_6:
  sub_25D1F2400(0, (v7 & 0xC000000000000001) == 0, v7);
  if ((v7 & 0xC000000000000001) != 0) {
    id v9 = (id)MEMORY[0x2611AC4C0](0, v7);
  }
  else {
    id v9 = *(id *)(v7 + 32);
  }
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  self;
  if (swift_dynamicCastObjCClass())
  {
    LODWORD(v28) = 0;
    BYTE4(v28) = 1;
    sub_25D53F210();

    goto LABEL_17;
  }
  swift_bridgeObjectRelease();

LABEL_18:
  OUTLINED_FUNCTION_2_67();
  id v11 = sub_25D53DC00();
  os_log_type_t v17 = sub_25D53E7B0();
  BOOL v18 = OUTLINED_FUNCTION_61_1(v17);
  unint64_t v19 = *(void **)(v0 + 288);
  unint64_t v20 = *(void *)(v0 + 184);
  if (v18)
  {
    uint64_t v21 = *(void *)(v0 + 176);
    os_log_type_t v22 = (_DWORD *)swift_slowAlloc();
    *(void *)&long long v28 = OUTLINED_FUNCTION_30();
    *os_log_type_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 136) = sub_25D19E114(v21, v20, (uint64_t *)&v28);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_36_12(&dword_25D16D000, v23, v24, "#MessageSummaryProvider No summary status found for messageID: %s");
    OUTLINED_FUNCTION_31_3();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();

    goto LABEL_22;
  }

LABEL_21:
  swift_bridgeObjectRelease_n();
LABEL_22:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25(0);
}

uint64_t sub_25D4EC034(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_25D17DBEC(0, &qword_26A6715B0);
    a2 = sub_25D53E4C0();
  }
  return sub_25D4EAE2C(v2, a2, &qword_26A674B90);
}

uint64_t type metadata accessor for MessageSummaryProvider()
{
  return self;
}

id sub_25D4EC0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)sub_25D53E1D0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    unint64_t v7 = (void *)sub_25D53E1D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v7 = 0;
  }
  uint64_t v8 = (void *)sub_25D53E1D0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v4, sel_initWithName_protectionClass_bundleIdentifier_, v6, v7, v8);

  return v9;
}

uint64_t OUTLINED_FUNCTION_2_67()
{
  return swift_bridgeObjectRetain_n();
}

id OUTLINED_FUNCTION_4_67(uint64_t a1, uint64_t a2)
{
  return sub_25D4EAEB0(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2);
}

uint64_t OUTLINED_FUNCTION_7_54()
{
  return 12;
}

id sub_25D4EC1B4()
{
  sub_25D53E200();
  sub_25D203CC4();
  sub_25D203D10();
  char v0 = sub_25D53E180();
  swift_bridgeObjectRelease();
  if ((v0 & 1) == 0) {
    return (id)sub_25D53E200();
  }
  id result = (id)INPersonRelationshipValueAsString();
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_25D53E200();
    unint64_t v5 = v4;

    swift_bridgeObjectRetain();
    sub_25D219024(v3, v5);
    uint64_t v7 = v6;
    id result = (id)swift_bridgeObjectRelease();
    if (v7)
    {
      uint64_t v8 = sub_25D53E130();
      swift_bridgeObjectRelease();
      sub_25D21A91C(1uLL, v3, v5);
      sub_25D224660();
      swift_bridgeObjectRetain();
      sub_25D53E350();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (id)v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_25D4EC328(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v6 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v6;
    uint64_t v7 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v7;
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    id v9 = (void *)a2[10];
    *(void *)(a1 + 80) = v9;
    uint64_t v10 = *(int *)(a3 + 44);
    uint64_t v16 = a1 + v10;
    uint64_t v17 = (uint64_t)a2 + v10;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v11 = sub_25D538990();
    os_log_type_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = v9;
    v12(v16, v17, v11);
  }
  return v3;
}

uint64_t sub_25D4EC47C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_25D538990();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_25D4EC51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(int *)(a3 + 44);
  uint64_t v14 = a1 + v9;
  uint64_t v15 = a2 + v9;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = sub_25D538990();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v8;
  v11(v14, v15, v10);
  return a1;
}

uint64_t sub_25D4EC620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
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
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 80);
  uint64_t v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25D538990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_25D4EC758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v5 = *(int *)(a3 + 44);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v8 = sub_25D538990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_25D4EC804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  id v9 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25D538990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_25D4EC8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D4EC90C);
}

uint64_t sub_25D4EC90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25D538990();
    uint64_t v9 = a1 + *(int *)(a3 + 44);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25D4EC994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D4EC9A8);
}

uint64_t sub_25D4EC9A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25D538990();
    uint64_t v8 = v5 + *(int *)(a4 + 44);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ConversationSummaryComponent()
{
  uint64_t result = qword_26A674BA0;
  if (!qword_26A674BA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D4ECA70()
{
  uint64_t result = sub_25D538990();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25D4ECB34()
{
  OUTLINED_FUNCTION_14();
  v1[20] = v2;
  v1[21] = v0;
  v1[18] = v3;
  v1[19] = v4;
  v1[17] = v5;
  uint64_t v6 = sub_25D538990();
  v1[22] = v6;
  v1[23] = *(void *)(v6 - 8);
  v1[24] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D4ECF50: call analysis failed (funcsize=247)"

uint64_t sub_25D4ECFF4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v8 = v7;
  uint64_t v9 = *v3;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v10 = v9;
  v7[26] = v2;
  swift_task_dealloc();
  if (!v2)
  {
    v7[27] = a2;
    v7[28] = a1;
  }
  sub_25D196E70((uint64_t)(v7 + 7), &qword_26A671C80);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D4ED3D4: call analysis failed (funcsize=211)"

uint64_t sub_25D4ED478()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 272) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    *(void *)(v5 + 280) = v3;
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D4ED56C()
{
  OUTLINED_FUNCTION_35_1();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 280);
  return v1(v2);
}

uint64_t sub_25D4ED600()
{
  OUTLINED_FUNCTION_35_1();

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D4ED690()
{
  OUTLINED_FUNCTION_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4ED6EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  type metadata accessor for ConversationSummaryComponent();
  v8[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D4ED788, 0, 0);
}

uint64_t sub_25D4ED788()
{
  OUTLINED_FUNCTION_35_1();
  unint64_t v1 = (uint64_t *)v0[6];
  sub_25D4EE5CC(v0[3], v0[10]);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  v0[11] = v2;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25D4ED858;
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[2];
  return sub_25D4ED9F4(v10, v8, v9, v3, v2, v6, v7, v5);
}

uint64_t sub_25D4ED858()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v8 = v7;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  sub_25D4EE630(v6);
  swift_bridgeObjectRelease();
  if (v0)
  {
    OUTLINED_FUNCTION_21();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    return v12();
  }
}

uint64_t sub_25D4ED998()
{
  OUTLINED_FUNCTION_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4ED9F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[15] = a8;
  v9[16] = v8;
  v9[13] = a6;
  v9[14] = a7;
  v9[11] = a4;
  v9[12] = a5;
  v9[9] = a2;
  v9[10] = a3;
  v9[8] = a1;
  uint64_t v10 = sub_25D53D650();
  v9[17] = v10;
  v9[18] = *(void *)(v10 - 8);
  v9[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v9[20] = swift_task_alloc();
  v9[21] = swift_task_alloc();
  v9[22] = swift_task_alloc();
  v9[23] = swift_task_alloc();
  v9[24] = swift_task_alloc();
  v9[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D4EDB34, 0, 0);
}

uint64_t sub_25D4EDB34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_10_7();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  uint64_t v29 = v26[10];
  uint64_t v30 = v26[8];
  ConversationSummaryParameters = (int *)type metadata accessor for SearchForMessagesReadConversationSummaryParameters(0);
  v26[26] = ConversationSummaryParameters;
  uint64_t v32 = v30 + ConversationSummaryParameters[8];
  sub_25D196E70(v32, (uint64_t *)&unk_26A6719E0);
  ComponentPatternCommonParameters = (int *)type metadata accessor for ReadComponentPatternCommonParameters();
  uint64_t v34 = v29 + ComponentPatternCommonParameters[5];
  uint64_t v35 = sub_25D53D0A0();
  v26[27] = v35;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v32, v34, v35);
  OUTLINED_FUNCTION_30_36(v32);
  v26[2] = *(void *)(v29 + ComponentPatternCommonParameters[6]);
  sub_25D179AD8();
  sub_25D53D720();
  v75 = ConversationSummaryParameters;
  uint64_t v74 = v35;
  uint64_t v36 = v26[25];
  uint64_t v37 = v26[10];
  uint64_t v38 = v26[8];
  OUTLINED_FUNCTION_30_36(v36);
  sub_25D179B18(v36, v38 + ConversationSummaryParameters[14]);
  v26[5] = *(void *)(v37 + ComponentPatternCommonParameters[7]);
  sub_25D53D720();
  v39 = (void *)v26[24];
  uint64_t v40 = v26[10];
  uint64_t v41 = v26[8];
  OUTLINED_FUNCTION_30_36((uint64_t)v39);
  sub_25D179B18((uint64_t)v39, v41 + ConversationSummaryParameters[15]);
  v26[6] = *(void *)(v40 + ComponentPatternCommonParameters[8]);
  OUTLINED_FUNCTION_24_37();
  if (v39
    || (v39 = (void *)v26[23],
        uint64_t v42 = v26[10],
        uint64_t v43 = v26[8],
        OUTLINED_FUNCTION_30_36((uint64_t)v39),
        sub_25D179B18((uint64_t)v39, v43 + ConversationSummaryParameters[17]),
        v26[7] = *(void *)(v42 + ComponentPatternCommonParameters[9]),
        OUTLINED_FUNCTION_24_37(),
        v39))
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_25D53DC10();
    __swift_project_value_buffer(v44, (uint64_t)qword_26A688F10);
    id v45 = v39;
    id v46 = v39;
    v47 = sub_25D53DC00();
    os_log_type_t v48 = sub_25D53E7C0();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      a14 = v50;
      *(_DWORD *)v49 = 136315138;
      v26[3] = v39;
      id v51 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
      uint64_t v52 = sub_25D53E270();
      v26[4] = sub_25D19E114(v52, v53, &a14);
      sub_25D53EA80();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25D16D000, v47, v48, "#ConversationSummaryComponent Error building spoken invocation parameters: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611AD370](v50, -1, -1);
      OUTLINED_FUNCTION_0_8();
    }
    else
    {
    }
  }
  else
  {
    uint64_t v72 = v26[22];
    uint64_t v73 = v26[8];
    OUTLINED_FUNCTION_30_36(v72);
    sub_25D179B18(v72, v73 + ConversationSummaryParameters[18]);
  }
  v26[28] = 0;
  if (v26[12])
  {
    sub_25D53E2C0();
    uint64_t v54 = 0;
  }
  else
  {
    uint64_t v54 = 1;
  }
  uint64_t v55 = v26[21];
  uint64_t v56 = v26[15];
  uint64_t v58 = v26[13];
  uint64_t v57 = v26[14];
  uint64_t v59 = v26[8];
  __swift_storeEnumTagSinglePayload(v55, v54, 1, v74);
  sub_25D179B18(v55, v59 + v75[7]);
  uint64_t v60 = v75[16];
  swift_retain();
  swift_release();
  *(void *)(v59 + v60) = v58;
  uint64_t v61 = v75[6];
  swift_retain();
  swift_release();
  *(void *)(v59 + v61) = v57;
  uint64_t v62 = v75[9];
  swift_retain();
  swift_release();
  *(void *)(v59 + v62) = v56;
  sub_25D53D080();
  uint64_t v63 = swift_retain();
  sub_25D35E0D8(v63);
  v64 = (void *)swift_task_alloc();
  v26[29] = v64;
  void *v64 = v26;
  v64[1] = sub_25D4EE030;
  OUTLINED_FUNCTION_15();
  return sub_25D42DDC8(v65, v66, v67, v68, v69);
}

uint64_t sub_25D4EE030()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D4EE0F8()
{
  uint64_t v1 = v0[28];
  sub_25D53D720();
  if (v1)
  {
    uint64_t v2 = OUTLINED_FUNCTION_47();
    v3(v2);
  }
  else
  {
    uint64_t v6 = v0[26];
    uint64_t v5 = v0[27];
    uint64_t v7 = v0[20];
    uint64_t v8 = v0[8];
    uint64_t v9 = OUTLINED_FUNCTION_47();
    v10(v9);
    __swift_storeEnumTagSinglePayload(v7, 0, 1, v5);
    sub_25D179B18(v7, v8 + *(int *)(v6 + 20));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v4();
}

void *sub_25D4EE270()
{
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

uint64_t sub_25D4EE298()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25D4EE2D0(uint64_t result)
{
  *(unsigned char *)(v1 + 88) = result;
  return result;
}

uint64_t sub_25D4EE2D8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D20CE38;
  return sub_25D20A848();
}

uint64_t sub_25D4EE364()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D1788A8;
  return sub_25D4ECB34();
}

uint64_t sub_25D4EE428(uint64_t a1)
{
  uint64_t result = sub_25D4EE4B0(&qword_26A673C80);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25D4EE46C(uint64_t a1)
{
  uint64_t result = sub_25D4EE4B0(&qword_26A674BC0);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25D4EE4B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ConversationSummaryComponent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D4EE4F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_25D1799C8;
  return sub_25D4ED6EC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D4EE5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConversationSummaryComponent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D4EE630(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConversationSummaryComponent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id OUTLINED_FUNCTION_2_68()
{
  __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v0 + 136) + 16), *(void *)(*(void *)(v0 + 136) + 40));
  return v1;
}

uint64_t OUTLINED_FUNCTION_3_69()
{
  return sub_25D2BDC78(0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0);
}

void *OUTLINED_FUNCTION_4_68(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)(v18 + 256) = result;
  result[2] = v15;
  result[3] = v16;
  result[4] = v19;
  result[5] = a15;
  result[6] = v17;
  result[7] = a14;
  result[8] = v20;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_52()
{
  __swift_project_boxed_opaque_existential_0(v1, *(void *)(v0 + 40));
  return sub_25D539640();
}

uint64_t OUTLINED_FUNCTION_10_51()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_53()
{
  *(void *)(v1 + 232) = v0;
  return type metadata accessor for MessagesMessageComponentDialogContext();
}

id OUTLINED_FUNCTION_17_40()
{
  return sub_25D2F36E4(v1, 0, 0, v0, v2);
}

uint64_t OUTLINED_FUNCTION_19_51()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20_47()
{
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 264), *(void *)(v0 + 288));
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_21_44()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_22_41()
{
  return [v0 (SEL)(v1 + 602)];
}

id OUTLINED_FUNCTION_23_46()
{
  return [v0 (SEL)(v1 + 24)];
}

uint64_t OUTLINED_FUNCTION_24_37()
{
  return sub_25D53D720();
}

id OUTLINED_FUNCTION_25_35@<X0>(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 81) = 257;
  uint64_t v2 = *(void **)(*(void *)(a1 + 168) + 16);
  return v2;
}

void OUTLINED_FUNCTION_26_39()
{
  v1[31] = v0;
  uint64_t v2 = (void *)v1[21];
  uint64_t v3 = v2[1];
  v1[15] = *v2;
  v1[16] = v3;
}

uint64_t OUTLINED_FUNCTION_28_40()
{
  __swift_project_boxed_opaque_existential_0(*(void **)(v0 + 160), *(void *)(*(void *)(v0 + 160) + 24));
  return sub_25D458C68();
}

uint64_t OUTLINED_FUNCTION_30_39()
{
  return MEMORY[0x270F739A0](v0, v1, v2, v3);
}

uint64_t sub_25D4EE954(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!result || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_25D36CEE8(v3);
    uint64_t v3 = result;
    *uint64_t v1 = result;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    unint64_t v8 = v6 - 1 - a1;
    uint64_t v9 = v5 + 8 * a1;
    uint64_t v10 = *(void *)(v9 + 32);
    sub_25D1F47F8(v9 + 40, v8, v9 + 32);
    *(void *)(v5 + 16) = v7;
    sub_25D53E4E0();
    return v10;
  }
  return result;
}

uint64_t sub_25D4EE9E0()
{
  OUTLINED_FUNCTION_14();
  v1[26] = v2;
  v1[27] = v0;
  v1[25] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v4);
  v1[28] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D539C30();
  v1[29] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[30] = v6;
  v1[31] = OUTLINED_FUNCTION_92();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC48);
  OUTLINED_FUNCTION_17_0(v7);
  v1[32] = OUTLINED_FUNCTION_92();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v8);
  v1[33] = OUTLINED_FUNCTION_24_0();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  uint64_t v9 = sub_25D539D00();
  v1[36] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v1[37] = v10;
  v1[38] = OUTLINED_FUNCTION_24_0();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  uint64_t v11 = sub_25D539F20();
  v1[44] = v11;
  OUTLINED_FUNCTION_11_0(v11);
  v1[45] = v12;
  v1[46] = OUTLINED_FUNCTION_24_0();
  v1[47] = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  v1[48] = v13;
  OUTLINED_FUNCTION_11_0(v13);
  v1[49] = v14;
  v1[50] = OUTLINED_FUNCTION_24_0();
  v1[51] = swift_task_alloc();
  v1[52] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v15, v16, v17);
}

uint64_t sub_25D4EEBE8()
{
  void (*v65)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  os_log_type_t type;
  NSObject *log;
  uint64_t v87;
  unint64_t v88;
  void *v89;

  v89 = v0;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[49];
  uint64_t v2 = sub_25D53DC10();
  v0[53] = __swift_project_value_buffer(v2, (uint64_t)qword_26A688F10);
  uint64_t v3 = *(void (**)(void))(v1 + 16);
  v0[54] = v3;
  v0[55] = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  OUTLINED_FUNCTION_76_10();
  v3();
  OUTLINED_FUNCTION_76_10();
  v3();
  uint64_t v4 = sub_25D53DC00();
  os_log_type_t v5 = sub_25D53E7B0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[52];
  uint64_t v9 = v0[48];
  uint64_t v8 = v0[49];
  if (v6)
  {
    uint64_t v10 = v0[47];
    uint64_t v11 = v0[45];
    v84 = v0[44];
    uint64_t v12 = swift_slowAlloc();
    v87 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    log = v4;
    sub_25D53A380();
    uint64_t v13 = sub_25D539F10();
    type = v5;
    unint64_t v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v84);
    v0[23] = sub_25D19E114(v13, v15, &v87);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(void))(v8 + 8);
    OUTLINED_FUNCTION_38_9();
    v16();
    *(_WORD *)(v12 + 12) = 2048;
    uint64_t v17 = (void *)sub_25D53A370();
    id v18 = objc_msgSend(v17, sel_unsupportedReason);

    OUTLINED_FUNCTION_38_9();
    v16();
    v0[24] = v18;
    sub_25D53EA80();
    uint64_t v4 = log;
    _os_log_impl(&dword_25D16D000, log, type, "SendUnsupportedStrategy# Generating output for %s, unsupportedReason: %ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v16 = *(void (**)(void))(v8 + 8);
    OUTLINED_FUNCTION_38_9();
    v16();
    ((void (*)(uint64_t, uint64_t))v16)(v7, v9);
  }

  v0[56] = v16;
  uint64_t v19 = v0[45];
  uint64_t v20 = v0[27];
  type metadata accessor for MessagesApp(0);
  sub_25D53A350();
  v0[57] = sub_25D50A3A4();
  sub_25D53A380();
  sub_25D539F10();
  uint64_t v21 = *(void (**)(void))(v19 + 8);
  v0[58] = v21;
  v0[59] = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  OUTLINED_FUNCTION_29_5();
  v21();
  char v22 = sub_25D2063C0();
  uint64_t v23 = *(void *)(v20 + 56);
  v0[60] = v23;
  if (v22)
  {
    *(void *)(v23 + 120) = 0;
    *(unsigned char *)(v23 + 128) = 1;
    switch(v22)
    {
      case 1:
        OUTLINED_FUNCTION_77_10();
        uint64_t v24 = (void *)sub_25D53A360();
        id v25 = objc_msgSend(v24, sel_speakableGroupName);

        if (v25)
        {
          id v26 = objc_msgSend(v25, sel_spokenPhrase);

          sub_25D53E200();
          sub_25D53E2C0();
          swift_bridgeObjectRelease();
          uint64_t v27 = 0;
        }
        else
        {
          uint64_t v27 = 1;
        }
        uint64_t v70 = v0[34];
        v71 = sub_25D53D0A0();
        __swift_storeEnumTagSinglePayload(v70, v27, 1, v71);
        swift_task_alloc();
        OUTLINED_FUNCTION_38_0();
        v0[73] = v72;
        *uint64_t v72 = v73;
        v72[1] = sub_25D4F081C;
        OUTLINED_FUNCTION_78();
        uint64_t result = sub_25D481118();
        break;
      case 2:
        OUTLINED_FUNCTION_77_10();
        uint64_t v50 = (void *)sub_25D53A360();
        objc_msgSend(v50, sel_outgoingMessageType);

        v75 = v0[35];
        sub_25D53E2C0();
        swift_bridgeObjectRelease();
        v76 = sub_25D53D0A0();
        __swift_storeEnumTagSinglePayload(v75, 0, 1, v76);
        swift_task_alloc();
        OUTLINED_FUNCTION_38_0();
        v0[69] = v77;
        *v77 = v78;
        v77[1] = sub_25D4F00C4;
        OUTLINED_FUNCTION_78();
        uint64_t result = sub_25D480398();
        break;
      case 3:
        swift_retain();
        swift_task_alloc();
        OUTLINED_FUNCTION_38_0();
        v0[71] = v51;
        *id v51 = v52;
        v51[1] = sub_25D4F0490;
        OUTLINED_FUNCTION_78();
        uint64_t result = sub_25D47F8F0(v53, v54);
        break;
      case 4:
        uint64_t v56 = v0[32];
        uint64_t v57 = v0[33];
        uint64_t v58 = (void *)v0[27];
        uint64_t v59 = (void *)sub_25D53A360();
        id v60 = objc_msgSend(v59, sel_effect);

        INMessageEffectType.description.getter((uint64_t)v60);
        sub_25D53E2C0();
        swift_bridgeObjectRelease();
        uint64_t v61 = sub_25D53D0A0();
        __swift_storeEnumTagSinglePayload(v57, 0, 1, v61);
        sub_25D53D1D0();
        uint64_t v62 = v58 + 2;
        uint64_t v63 = v58[5];
        uint64_t v64 = v58[6];
        __swift_project_boxed_opaque_existential_0(v62, v63);
        uint64_t v65 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v64 + 8);
        swift_retain();
        v65(&v87, v63, v64);
        uint64_t v66 = sub_25D53C930();
        __swift_storeEnumTagSinglePayload(v56, 1, 1, v66);
        v0[75] = sub_25D3F7998(&v87, v56);
        swift_task_alloc();
        OUTLINED_FUNCTION_38_0();
        v0[76] = v67;
        *uint64_t v67 = v68;
        v67[1] = sub_25D4F0BE8;
        OUTLINED_FUNCTION_78();
        uint64_t result = sub_25D47F9EC();
        break;
      default:
        v87 = 0;
        v88 = 0xE000000000000000;
        sub_25D53ED20();
        swift_bridgeObjectRelease();
        v87 = 0xD000000000000012;
        v88 = 0x800000025D55CCA0;
        sub_25D53A380();
        sub_25D539F10();
        OUTLINED_FUNCTION_29_5();
        v21();
        sub_25D53E360();
        swift_bridgeObjectRelease();
        uint64_t v45 = v87;
        unint64_t v46 = v88;
        sub_25D194BF4();
        swift_allocError();
        uint64_t *v47 = v45;
        v47[1] = v46;
        swift_willThrow();
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
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_339();
        OUTLINED_FUNCTION_78();
        __asm { BRAA            X1, X16 }
        return result;
    }
    return result;
  }
  sub_25D53A380();
  uint64_t v28 = sub_25D539F00();
  char v30 = v29;
  OUTLINED_FUNCTION_29_5();
  v21();
  *(void *)(v23 + 120) = v28;
  *(unsigned char *)(v23 + 128) = v30 & 1;
  if ((*(unsigned char *)(v23 + 173) & 1) == 0) {
    goto LABEL_42;
  }
  uint64_t v31 = (void *)sub_25D53A360();
  uint64_t v32 = sub_25D4F49DC(v31);
  if (!v32) {
    goto LABEL_42;
  }
  uint64_t v33 = v32;
  OUTLINED_FUNCTION_84_4();
  if (v35)
  {
    if (sub_25D53EEB0()) {
      goto LABEL_14;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  if (!*(void *)(v34 + 16)) {
    goto LABEL_41;
  }
LABEL_14:
  sub_25D1F2400(0, (v33 & 0xC000000000000001) == 0, v33);
  if ((v33 & 0xC000000000000001) != 0) {
    id v36 = (id)MEMORY[0x2611AC4C0](0, v33);
  }
  else {
    id v36 = *(id *)(v33 + 32);
  }
  uint64_t v37 = v36;
  v0[61] = v36;
  swift_bridgeObjectRelease();
  uint64_t v38 = *(void *)(v23 + 264);
  v0[62] = v38;
  if (v38)
  {
    swift_bridgeObjectRetain();
    v39 = sub_25D53DC00();
    os_log_type_t v40 = sub_25D53E7B0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_25D16D000, v39, v40, "#SendMessageUnsupportedValueFlowStrategy request triggered by change via snippet, trying to show an error on snippet", v41, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v42 = (void *)swift_task_alloc();
    v0[63] = v42;
    *uint64_t v42 = v0;
    v42[1] = sub_25D4EF788;
    OUTLINED_FUNCTION_78();
    return sub_25D4F35B4();
  }

LABEL_42:
  v0[65] = OUTLINED_FUNCTION_60_18();
  v80 = sub_25D53A370();
  OUTLINED_FUNCTION_82_9(v80);
  sub_25D539F00();
  v81 = OUTLINED_FUNCTION_86_9();
  ((void (*)(uint64_t))v21)(v81);
  v82 = (void *)swift_task_alloc();
  v0[67] = v82;
  *v82 = v0;
  v82[1] = sub_25D4EFD08;
  OUTLINED_FUNCTION_52_24();
  OUTLINED_FUNCTION_78();
  return sub_25D4F1E48();
}

uint64_t sub_25D4EF788(char a1)
{
  uint64_t v4 = *v2;
  OUTLINED_FUNCTION_6_0();
  *os_log_type_t v5 = v4;
  *os_log_type_t v5 = *v2;
  *(void *)(v4 + 512) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1) {
    *(unsigned char *)(v4 + 624) = a1 & 1;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D4EF8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_75_1();
  OUTLINED_FUNCTION_183_1();
  if (*(unsigned char *)(v24 + 624) == 1)
  {
    uint64_t v26 = *(void *)(v24 + 424);
    *(unsigned char *)(*(void *)(v24 + 480) + 288) = 1;
    sub_25D17DBEC(0, &qword_26A674C38);
    id v27 = sub_25D2B73DC();
    objc_msgSend(v27, sel_setPreserveResultSpaceIfPossible_, 1);
    sub_25D1B48D0(0, 0xE000000000000000, v27, (SEL *)&selRef_setText_);
    sub_25D1B48D0(0, 0xE000000000000000, v27, (SEL *)&selRef_setSpeakableText_);
    sub_25D1B48D0(0xD000000000000025, 0x800000025D551630, v27, (SEL *)&selRef_setDialogIdentifier_);
    sub_25D17DBEC(0, &qword_26A674368);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_25D541A10;
    *(void *)(v28 + 32) = v27;
    uint64_t v67 = v28;
    sub_25D53E4E0();
    id v29 = v27;
    id v30 = sub_25D4BEB50(v67);
    uint64_t v31 = sub_25D53E200();
    sub_25D1B48D0(v31, v32, v30, (SEL *)&selRef_setDialogPhase_);
    uint64_t v33 = sub_25D53DC00();
    os_log_type_t v34 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_29(v34))
    {
      uint64_t v35 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_25D16D000, v33, (os_log_type_t)v26, "#SendMessageUnsupportedValueFlowStrategy returning output with empty text", v35, 2u);
      OUTLINED_FUNCTION_3_0();
    }
    id v36 = *(void **)(v24 + 488);
    uint64_t v37 = *(uint64_t **)(v24 + 200);

    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_25D541A10;
    *(void *)(v38 + 32) = v30;
    sub_25D53E4E0();
    uint64_t v39 = sub_25D53A710();
    uint64_t v40 = MEMORY[0x263F6FFF0];
    v37[3] = v39;
    v37[4] = v40;
    __swift_allocate_boxed_opaque_existential_0(v37);
    id v41 = v30;
    sub_25D53A6F0();

    swift_release();
    uint64_t v60 = *(void *)(v24 + 304);
    uint64_t v61 = *(void *)(v24 + 280);
    uint64_t v62 = *(void *)(v24 + 272);
    uint64_t v63 = *(void *)(v24 + 264);
    uint64_t v64 = *(void *)(v24 + 256);
    uint64_t v65 = *(void *)(v24 + 248);
    uint64_t v66 = *(void *)(v24 + 224);
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
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_25_10();
    return v43(v42, v43, v44, v45, v46, v47, v48, v49, v60, v61, v62, v63, v64, v65, v66, 3, 0, 0, 0,
             0,
             0,
             a22,
             a23,
             a24);
  }
  else
  {
    id v51 = sub_25D53DC00();
    os_log_type_t v52 = sub_25D53E7A0();
    BOOL v53 = os_log_type_enabled(v51, v52);
    uint64_t v54 = *(void **)(v24 + 488);
    if (v53)
    {
      uint64_t v55 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v55 = 0;
      _os_log_impl(&dword_25D16D000, v51, v52, "#SendMessageUnsupportedValueFlowStrategy view not available, falling back to dialog", v55, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    *(void *)(v24 + 520) = OUTLINED_FUNCTION_60_18();
    uint64_t v56 = sub_25D53A370();
    OUTLINED_FUNCTION_82_9(v56);
    sub_25D539F00();
    uint64_t v57 = OUTLINED_FUNCTION_86_9();
    v25(v57);
    uint64_t v58 = (void *)swift_task_alloc();
    *(void *)(v24 + 536) = v58;
    *uint64_t v58 = v24;
    v58[1] = sub_25D4EFD08;
    OUTLINED_FUNCTION_52_24();
    OUTLINED_FUNCTION_25_10();
    return sub_25D4F1E48();
  }
}

uint64_t sub_25D4EFD08()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 544) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  uint64_t v6 = *(void **)(v1 + 520);

  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D4EFF2C: call analysis failed (funcsize=161)"

uint64_t sub_25D4F00C4()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 560) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  sub_25D196E70(*(void *)(v1 + 280), (uint64_t *)&unk_26A6719E0);
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

#error "25D4F02F8: call analysis failed (funcsize=162)"

uint64_t sub_25D4F0490()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 576) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D4F0684: call analysis failed (funcsize=162)"

uint64_t sub_25D4F081C()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 592) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  sub_25D196E70(*(void *)(v1 + 272), (uint64_t *)&unk_26A6719E0);
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

#error "25D4F0A50: call analysis failed (funcsize=162)"

uint64_t sub_25D4F0BE8()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 616) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  sub_25D196E70(*(void *)(v1 + 264), (uint64_t *)&unk_26A6719E0);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

#error "25D4F0E40: call analysis failed (funcsize=162)"

uint64_t sub_25D4F0FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  uint64_t v21 = *(void **)(v20 + 488);
  swift_release();

  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v23(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F10C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  swift_release();
  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F11B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  swift_release();
  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F1298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  swift_release_n();
  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F1384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  swift_release();
  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F146C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_55_7();
  OUTLINED_FUNCTION_32_17();
  swift_release();
  OUTLINED_FUNCTION_3_70();
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
  OUTLINED_FUNCTION_339();
  OUTLINED_FUNCTION_22_3();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_25D4F1554()
{
  OUTLINED_FUNCTION_14();
  v0[27] = v1;
  uint64_t v2 = sub_25D539F20();
  v0[28] = v2;
  OUTLINED_FUNCTION_11_0(v2);
  v0[29] = v3;
  v0[30] = OUTLINED_FUNCTION_24_0();
  v0[31] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  v0[32] = v4;
  OUTLINED_FUNCTION_11_0(v4);
  v0[33] = v5;
  v0[34] = OUTLINED_FUNCTION_24_0();
  v0[35] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D4F162C()
{
  uint64_t v56 = v0;
  uint64_t v1 = (void *)sub_25D53A360();
  uint64_t v2 = (void *)sub_25D53E980();

  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v4 = sub_25D53DC10();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A688F10);
  uint64_t v5 = *(void (**)(void))(v3 + 16);
  OUTLINED_FUNCTION_79_10();
  v5();
  OUTLINED_FUNCTION_79_10();
  v5();
  uint64_t v6 = sub_25D53DC00();
  os_log_type_t v7 = sub_25D53E7B0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 264);
  if (v8)
  {
    log = v6;
    uint64_t v10 = *(void *)(v0 + 248);
    uint64_t v12 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 232);
    uint64_t v51 = v12;
    uint64_t v54 = v2;
    uint64_t v13 = swift_slowAlloc();
    v55[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    os_log_type_t type = v7;
    sub_25D53A380();
    uint64_t v14 = sub_25D539F10();
    unint64_t v16 = v15;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v10, v12);
    *(void *)(v0 + 192) = sub_25D19E114(v14, v16, v55);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    id v18 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_51_25();
    v18();
    *(_WORD *)(v13 + 12) = 2080;
    sub_25D53A380();
    uint64_t v19 = sub_25D539F00();
    LOBYTE(v12) = v20;
    v17(v10, v51);
    *(void *)(v0 + 176) = v19;
    *(unsigned char *)(v0 + 184) = v12 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F218);
    uint64_t v21 = sub_25D53EA50();
    *(void *)(v0 + 208) = sub_25D19E114(v21, v22, v55);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_51_25();
    v18();
    _os_log_impl(&dword_25D16D000, log, type, "#SendMessageUnsupportedValueFlowStrategy updating intent for slot '%s' with index '%s'", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    uint64_t v2 = v54;
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v23 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_51_25();
    v23();
    OUTLINED_FUNCTION_51_25();
    v23();
  }
  uint64_t v24 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v26 = *(void *)(v0 + 232);
  sub_25D53A380();
  sub_25D539F10();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v27(v24, v25);
  switch(sub_25D2063C0())
  {
    case 0u:
      uint64_t v28 = *(void *)(v0 + 240);
      uint64_t v29 = *(void *)(v0 + 224);
      sub_25D53A380();
      int64_t v30 = sub_25D539F00();
      char v32 = v31;
      v27(v28, v29);
      if (v32)
      {
        uint64_t v46 = 0xD000000000000060;
        uint64_t v47 = 0x800000025D55CBE0;
        goto LABEL_32;
      }
      uint64_t v33 = sub_25D2EBAAC(v2);
      if (!v33) {
        goto LABEL_29;
      }
      uint64_t v34 = v33;
      OUTLINED_FUNCTION_84_4();
      if (v36)
      {
        uint64_t v37 = sub_25D53EEB0();
        swift_bridgeObjectRelease();
        if (v37 < 0)
        {
          __break(1u);
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v37 = *(void *)(v35 + 16);
        swift_bridgeObjectRelease();
      }
      if (v30 < 0 || v30 >= v37)
      {
LABEL_29:
        OUTLINED_FUNCTION_66_13();
        sub_25D53ED20();
        sub_25D53E360();
        *(void *)(v0 + 200) = v30;
        sub_25D53F050();
        sub_25D53E360();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
      uint64_t v37 = v0 + 144;
      uint64_t v38 = sub_25D2EBAAC(v2);
      uint64_t v39 = MEMORY[0x263F8EE78];
      if (v38) {
        uint64_t v39 = v38;
      }
      v55[0] = v39;

      uint64_t v34 = v55[0];
      if ((unint64_t)v55[0] >> 62)
      {
LABEL_37:
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_25D53EEB0();
        swift_bridgeObjectRelease();
        if (v50) {
          goto LABEL_17;
        }
        goto LABEL_38;
      }
      if (*(void *)((v55[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_17:
        *(void *)(v0 + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FFD0);
        *(void *)(v0 + 144) = v34;
        goto LABEL_39;
      }
LABEL_38:
      swift_bridgeObjectRelease();
      *(_OWORD *)uint64_t v37 = 0u;
      *(_OWORD *)(v37 + 16) = 0u;
LABEL_39:
      sub_25D50F320();
      uint64_t v41 = v37;
LABEL_23:
      sub_25D196E70(v41, &qword_26A671A70);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v42 = *(uint64_t (**)(void *))(v0 + 8);
      return v42(v2);
    case 1u:
      uint64_t v40 = v0 + 48;
      *(_OWORD *)(v0 + 48) = 0u;
      *(_OWORD *)(v0 + 64) = 0u;
      goto LABEL_22;
    case 2u:
      uint64_t v40 = v0 + 112;
      *(void *)(v0 + 136) = MEMORY[0x263F8D6C8];
      *(void *)(v0 + 112) = 0;
      goto LABEL_22;
    case 3u:
      uint64_t v40 = v0 + 80;
      *(_OWORD *)(v0 + 80) = 0u;
      *(_OWORD *)(v0 + 96) = 0u;
      goto LABEL_22;
    case 4u:
      uint64_t v40 = v0 + 16;
      *(void *)(v0 + 40) = MEMORY[0x263F8D6C8];
      *(void *)(v0 + 16) = 0;
LABEL_22:
      sub_25D50F320();
      uint64_t v41 = v40;
      goto LABEL_23;
    case 9u:
      OUTLINED_FUNCTION_66_13();
      sub_25D53ED20();
      sub_25D53E360();
      sub_25D53A380();
      sub_25D539F10();
      uint64_t v45 = OUTLINED_FUNCTION_61_17();
      ((void (*)(uint64_t))v27)(v45);
      sub_25D53E360();
      swift_bridgeObjectRelease();
LABEL_30:
      sub_25D53E360();
      goto LABEL_31;
    default:
      OUTLINED_FUNCTION_66_13();
      sub_25D53ED20();
      sub_25D53E360();
      sub_25D53A380();
      sub_25D539F10();
      uint64_t v44 = OUTLINED_FUNCTION_61_17();
      ((void (*)(uint64_t))v27)(v44);
      sub_25D53E360();
      swift_bridgeObjectRelease();
LABEL_31:
      uint64_t v46 = v55[0];
      uint64_t v47 = v55[1];
LABEL_32:
      sub_25D194BF4();
      swift_allocError();
      *uint64_t v48 = v46;
      v48[1] = v47;
      swift_willThrow();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_48();
      return v49();
  }
}

uint64_t sub_25D4F1E48()
{
  OUTLINED_FUNCTION_14();
  v1[14] = v2;
  v1[15] = v0;
  v1[12] = v3;
  v1[13] = v4;
  v1[10] = v5;
  v1[11] = v6;
  uint64_t v7 = sub_25D538990();
  v1[16] = v7;
  OUTLINED_FUNCTION_11_0(v7);
  v1[17] = v8;
  v1[18] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D4F1EDC()
{
  uint64_t v99 = v0;
  uint64_t v2 = *(void **)(v0 + 88);
  id v3 = objc_msgSend(*(id *)(v0 + 96), sel_unsupportedReason);
  uint64_t v4 = sub_25D2EBAAC(v2);
  if (v4)
  {
    uint64_t v5 = v4;
    OUTLINED_FUNCTION_84_4();
    if (v7)
    {
      unint64_t v8 = sub_25D53EEB0();
      if ((v8 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_77;
      }
    }
    else
    {
      unint64_t v8 = *(void *)(v6 + 16);
    }
    unint64_t v9 = *(void *)(v0 + 104);
    if ((v9 & 0x8000000000000000) == 0 && v8 > v9)
    {
      uint64_t v1 = (void *)(v0 + 16);
      sub_25D1F2400(*(void *)(v0 + 104), (v5 & 0xC000000000000001) == 0, v5);
      unint64_t v8 = *(void *)(v0 + 104);
      if ((v5 & 0xC000000000000001) == 0)
      {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
LABEL_8:
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)(v0 + 144);
        uint64_t v13 = *(void *)(v0 + 120);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_0((void *)(v13 + 16), *(void *)(v13 + 40));
        uint64_t v14 = OUTLINED_FUNCTION_83_10();
        v15(v14);
        __swift_project_boxed_opaque_existential_0(v1, *(void *)(v0 + 40));
        OUTLINED_FUNCTION_83_10();
        sub_25D539640();
        id v16 = sub_25D2F36E4(v12, 0, 0, 0, v11);

        uint64_t v17 = OUTLINED_FUNCTION_11_13();
        v18(v17);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v1);
        goto LABEL_21;
      }
LABEL_77:
      id v10 = (id)MEMORY[0x2611AC4C0](v8, v5);
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v19 = *(void **)(v0 + 88);
  uint64_t v20 = sub_25D53DC10();
  __swift_project_value_buffer(v20, (uint64_t)qword_26A688F10);
  id v21 = v19;
  unint64_t v22 = sub_25D53DC00();
  os_log_type_t v23 = sub_25D53E7C0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = *(void *)(v0 + 104);
    uint64_t v25 = *(void **)(v0 + 88);
    uint64_t v26 = swift_slowAlloc();
    uint64_t v98 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134218242;
    *(void *)(v0 + 56) = v24;
    sub_25D53EA80();
    *(_WORD *)(v26 + 12) = 2080;
    if (sub_25D2EBAAC(v25))
    {
      OUTLINED_FUNCTION_84_4();
      if (v28) {
        uint64_t v29 = sub_25D53EEB0();
      }
      else {
        uint64_t v29 = *(void *)(v27 + 16);
      }
      swift_bridgeObjectRelease();
      *(void *)(v0 + 72) = v29;
      sub_25D36D20C();
      uint64_t v30 = sub_25D53EB70();
      unint64_t v32 = v31;
    }
    else
    {
      unint64_t v32 = 0xE300000000000000;
      uint64_t v30 = 7104878;
    }
    uint64_t v34 = *(void **)(v0 + 88);
    *(void *)(v0 + 64) = sub_25D19E114(v30, v32, &v98);
    sub_25D53EA80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25D16D000, v22, v23, "SendUnsupportedStrategy# recipient not available at index=%ld for %s recipient(s)", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v33 = *(void **)(v0 + 88);
  }
  id v16 = 0;
LABEL_21:
  *(void *)(v0 + 152) = v16;
  if (v3 == (id)3)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 192) = v41;
    *uint64_t v41 = v42;
    v41[1] = sub_25D4F2A50;
    OUTLINED_FUNCTION_56_25();
    OUTLINED_FUNCTION_43();
    return sub_25D480940(v43, v44, v45);
  }
  else if (v3 == (id)2)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 176) = v47;
    void *v47 = v48;
    v47[1] = sub_25D4F2970;
    OUTLINED_FUNCTION_70_12();
    OUTLINED_FUNCTION_43();
    return sub_25D480E3C(v49, v50);
  }
  else if (v3 == (id)1)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 160) = v35;
    *uint64_t v35 = v36;
    v35[1] = sub_25D4F2890;
    OUTLINED_FUNCTION_70_12();
    OUTLINED_FUNCTION_43();
    return sub_25D480A60(v37, v38);
  }
  else if ((id)*MEMORY[0x263F102D8] == v3)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 208) = v52;
    *os_log_type_t v52 = v53;
    v52[1] = sub_25D4F2B30;
    OUTLINED_FUNCTION_84_9();
    OUTLINED_FUNCTION_43();
    return sub_25D481070();
  }
  else if ((id)*MEMORY[0x263F102D0] == v3)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 224) = v55;
    *uint64_t v55 = v56;
    v55[1] = sub_25D4F2C10;
    OUTLINED_FUNCTION_84_9();
    OUTLINED_FUNCTION_43();
    return sub_25D480D94();
  }
  else if ((id)*MEMORY[0x263F102C8] == v3)
  {
    if (sub_25D2EBAAC(*(void **)(v0 + 88)))
    {
      OUTLINED_FUNCTION_84_4();
      if (v58) {
        sub_25D53EEB0();
      }
      swift_bridgeObjectRelease();
    }
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 240) = v60;
    *uint64_t v60 = v61;
    v60[1] = sub_25D4F2D50;
    OUTLINED_FUNCTION_84_9();
    OUTLINED_FUNCTION_43();
    return sub_25D4806BC(v62, v63, v64);
  }
  else if (v3 == (id)4)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_25D53DC10();
    __swift_project_value_buffer(v66, (uint64_t)qword_26A688F10);
    uint64_t v67 = (void *)sub_25D53DC00();
    os_log_type_t v68 = sub_25D53E7A0();
    if (OUTLINED_FUNCTION_29(v68))
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_126(&dword_25D16D000, v69, v70, "There is no valid way to contact this recipient. You don’t have a number or iMessage address for <recipient>");
      OUTLINED_FUNCTION_3_0();
    }

    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 280) = v71;
    void *v71 = v72;
    v71[1] = sub_25D4F2F2C;
    OUTLINED_FUNCTION_56_25();
    OUTLINED_FUNCTION_43();
    return sub_25D480C74(v73, v74, v75);
  }
  else if (v3 == (id)6)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v77 = sub_25D53DC10();
    __swift_project_value_buffer(v77, (uint64_t)qword_26A688F10);
    v78 = (void *)sub_25D53DC00();
    os_log_type_t v79 = sub_25D53E7A0();
    if (OUTLINED_FUNCTION_29(v79))
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_126(&dword_25D16D000, v80, v81, "The requested handle for this person isn't available. We need to have a recipient to dialog.");
      OUTLINED_FUNCTION_3_0();
    }

    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 296) = v82;
    void *v82 = v83;
    v82[1] = sub_25D4F300C;
    OUTLINED_FUNCTION_70_12();
    OUTLINED_FUNCTION_43();
    return sub_25D480B5C(v84, v85);
  }
  else if (v3 == (id)5)
  {
    if (v16)
    {
      swift_retain();
      uint64_t v59 = sub_25D53CD30();
      swift_release();
    }
    else
    {
      uint64_t v59 = 0;
    }
    *(void *)(v0 + 256) = v59;
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 264) = v93;
    void *v93 = v94;
    v93[1] = sub_25D4F2E30;
    OUTLINED_FUNCTION_84_9();
    OUTLINED_FUNCTION_43();
    return sub_25D480F54(v95, v96);
  }
  else
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v0 + 312) = v87;
    void *v87 = v88;
    v87[1] = sub_25D4F30EC;
    OUTLINED_FUNCTION_56_25();
    OUTLINED_FUNCTION_43();
    return sub_25D48059C(v89, v90, v91);
  }
}

uint64_t sub_25D4F2890()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 168) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2970()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2A50()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 200) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2B30()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 216) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2C10()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 232) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2CF0()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v0();
}

uint64_t sub_25D4F2D50()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 248) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2E30()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F2F2C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 288) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F300C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 304) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F30EC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *id v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 320) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F31CC()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F3230()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F3294()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F32F8()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F335C()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F33C0()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F3424()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F3488()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F34EC()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F3550()
{
  OUTLINED_FUNCTION_14();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D4F35B4()
{
  OUTLINED_FUNCTION_14();
  v1[28] = v2;
  v1[29] = v0;
  v1[26] = v3;
  v1[27] = v4;
  v1[25] = v5;
  uint64_t v6 = sub_25D53D800();
  v1[30] = v6;
  OUTLINED_FUNCTION_11_0(v6);
  v1[31] = v7;
  v1[32] = OUTLINED_FUNCTION_92();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A70);
  OUTLINED_FUNCTION_17_0(v8);
  v1[33] = OUTLINED_FUNCTION_92();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A78);
  OUTLINED_FUNCTION_17_0(v9);
  v1[34] = OUTLINED_FUNCTION_92();
  uint64_t v10 = sub_25D53D8A0();
  v1[35] = v10;
  OUTLINED_FUNCTION_11_0(v10);
  v1[36] = v11;
  v1[37] = OUTLINED_FUNCTION_92();
  uint64_t v12 = sub_25D539A00();
  v1[38] = v12;
  OUTLINED_FUNCTION_11_0(v12);
  v1[39] = v13;
  v1[40] = OUTLINED_FUNCTION_92();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6708F0);
  OUTLINED_FUNCTION_17_0(v14);
  v1[41] = OUTLINED_FUNCTION_92();
  uint64_t v15 = sub_25D539D00();
  v1[42] = v15;
  OUTLINED_FUNCTION_11_0(v15);
  v1[43] = v16;
  v1[44] = OUTLINED_FUNCTION_92();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v17);
  v1[45] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v18, v19, v20);
}

uint64_t sub_25D4F3768()
{
  uint64_t v1 = v0[45];
  uint64_t v2 = (void *)v0[26];
  sub_25D53D040();
  v0[46] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  sub_25D53A350();
  uint64_t v3 = sub_25D4C0694();
  v0[47] = v3;
  sub_25D53CE40();
  OUTLINED_FUNCTION_91();
  sub_25D53CE30();
  id v4 = objc_msgSend(v2, sel_displayName);
  sub_25D53E200();

  sub_25D53E2C0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25D53D0A0();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
  sub_25D53CD90();
  swift_release();
  sub_25D196E70(v1, (uint64_t *)&unk_26A6719E0);
  uint64_t v6 = sub_25D53CE20();
  v0[48] = v6;
  swift_release();
  swift_retain();
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  v0[49] = v7;
  *uint64_t v7 = v8;
  v7[1] = sub_25D4F3918;
  uint64_t v9 = v0[44];
  return sub_25D480818(v9, v3, v6);
}

uint64_t sub_25D4F3918()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 400) = v0;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D4F3A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_13_1();
  uint64_t v17 = v16[41];
  uint64_t v18 = sub_25D539CF0();
  sub_25D2190E4(v18, v17);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_25D539E30();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v17, 1, v19);
  uint64_t v21 = v16[41];
  if (EnumTagSinglePayload == 1)
  {
    sub_25D196E70(v16[41], &qword_26A6708F0);
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
  }
  else
  {
    uint64_t v25 = v16[39];
    uint64_t v24 = v16[40];
    uint64_t v26 = v16[38];
    sub_25D539E20();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v21, v19);
    uint64_t v22 = sub_25D5399F0();
    unint64_t v23 = v27;
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  }
  __swift_project_boxed_opaque_existential_0((void *)(v16[29] + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_featureFlags), *(void *)(v16[29] + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_featureFlags + 24));
  if ((sub_25D27E844() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v28 = (void *)v16[29];
  uint64_t v29 = v28[5];
  uint64_t v30 = v28[6];
  __swift_project_boxed_opaque_existential_0(v28 + 2, v29);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
  uint64_t v31 = v16[12];
  uint64_t v32 = v16[13];
  __swift_project_boxed_opaque_existential_0(v16 + 9, v31);
  LOBYTE(v31) = sub_25D3D38B8(v31, v32);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v16 + 9));
  if (v31)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v74 = v22;
    uint64_t v33 = sub_25D53DC10();
    __swift_project_value_buffer(v33, (uint64_t)qword_26A688F10);
    uint64_t v34 = sub_25D53DC00();
    os_log_type_t v35 = sub_25D53E7B0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_25D16D000, v34, v35, "#SendMessageUnsupportedValueFlowStrategy sending SMART update response command", v36, 2u);
      OUTLINED_FUNCTION_3_0();
    }
    uint64_t v37 = v16[36];
    uint64_t v38 = v16[37];
    uint64_t v40 = v16[34];
    uint64_t v39 = v16[35];
    uint64_t v41 = v16[33];

    sub_25D53A360();
    uint64_t v42 = sub_25D53D600();
    __swift_storeEnumTagSinglePayload(v40, 1, 1, v42);
    uint64_t v43 = sub_25D53D6B0();
    __swift_storeEnumTagSinglePayload(v41, 1, 1, v43);
    uint64_t v73 = v74;
    OUTLINED_FUNCTION_21();
    sub_25D53D890();
    v16[17] = v39;
    v16[18] = sub_25D4F4988(&qword_26A672A80, MEMORY[0x263F71320]);
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v16 + 14);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v37 + 16))(boxed_opaque_existential_0, v38, v39);
    uint64_t v75 = (char *)&dword_26A674FF8 + dword_26A674FF8;
    uint64_t v45 = (void *)swift_task_alloc();
    v16[51] = (uint64_t)v45;
    *uint64_t v45 = v16;
    v45[1] = sub_25D4F3FF8;
    OUTLINED_FUNCTION_43_0();
    return v49(v46, v47, v48, v49, v50, v51, v52, v53, v73, v23, a11, v16 + 14, v75, a14, a15, a16);
  }
  else
  {
LABEL_13:
    sub_25D53A350();
    uint64_t v55 = sub_25D53D300();
    uint64_t v57 = v56;
    swift_release();
    if (!v57)
    {
      uint64_t v55 = 0;
      uint64_t v57 = 0xE000000000000000;
    }
    uint64_t v58 = (void *)sub_25D53A360();
    id v59 = sub_25D3B2F30(v58, v55, v57);
    v16[53] = (uint64_t)v59;
    swift_bridgeObjectRelease();

    id v60 = v59;
    OUTLINED_FUNCTION_83_10();
    sub_25D53D7F0();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_25D53DC10();
    __swift_project_value_buffer(v61, (uint64_t)qword_26A688F10);
    uint64_t v62 = sub_25D53DC00();
    os_log_type_t v63 = sub_25D53E7B0();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_25D16D000, v62, v63, "#SendMessageUnsupportedValueFlowStrategy sending custom canvas action command", v64, 2u);
      OUTLINED_FUNCTION_3_0();
    }
    uint64_t v65 = v16[31];
    uint64_t v66 = v16[32];
    uint64_t v67 = v16[30];

    uint64_t v68 = MEMORY[0x263F71210];
    v16[5] = v67;
    v16[6] = v68;
    uint64_t v69 = (void (*)(uint64_t))MEMORY[0x263F71218];
    v16[7] = sub_25D4F4988(&qword_26A6708F8, MEMORY[0x263F71218]);
    v16[8] = sub_25D4F4988(&qword_26A670900, v69);
    uint64_t v70 = __swift_allocate_boxed_opaque_existential_0(v16 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v65 + 16))(v70, v66, v67);
    v71 = (void *)swift_task_alloc();
    v16[54] = (uint64_t)v71;
    void *v71 = v16;
    v71[1] = sub_25D4F41F0;
    OUTLINED_FUNCTION_43_0();
    return sub_25D237C74();
  }
}

uint64_t sub_25D4F3FF8()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *(void *)(v3 + 168) = v0;
  *(unsigned char *)(v3 + 160) = v5;
  *(void *)(v3 + 152) = v1;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v7 = v6;
  *(void *)(v3 + 416) = v0;
  swift_task_dealloc();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v3 + 112);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

#error "25D4F41C0: call analysis failed (funcsize=65)"

uint64_t sub_25D4F41F0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  *(void *)(v3 + 192) = v0;
  *(unsigned char *)(v3 + 184) = v5;
  *(void *)(v3 + 176) = v1;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v7 = v6;
  *(void *)(v3 + 440) = v0;
  swift_task_dealloc();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v3 + 16);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

#error "25D4F43B8: call analysis failed (funcsize=65)"

uint64_t sub_25D4F43E8()
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_49_22();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v0 = OUTLINED_FUNCTION_13_11();
  return v1(v0);
}

uint64_t sub_25D4F44A4()
{
  uint64_t v2 = v0[36];
  uint64_t v1 = v0[37];
  uint64_t v3 = v0[35];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_29_5();
  v4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 14));
  OUTLINED_FUNCTION_49_22();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = OUTLINED_FUNCTION_13_11();
  return v6(v5);
}

uint64_t sub_25D4F45A8()
{
  swift_release();
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_11_13();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_21_21();
  v4(v3);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  OUTLINED_FUNCTION_49_22();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = OUTLINED_FUNCTION_13_11();
  return v6(v5);
}

uint64_t sub_25D4F46A4()
{
  sub_25D235568();
  return swift_deallocClassInstance();
}

uint64_t sub_25D4F46F8()
{
  return type metadata accessor for SendMessageUnsupportedValueFlowStrategy();
}

uint64_t type metadata accessor for SendMessageUnsupportedValueFlowStrategy()
{
  uint64_t result = qword_26A674BF0;
  if (!qword_26A674BF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D4F4748()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_25D4F4780()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D194780;
  return sub_25D4EE9E0();
}

uint64_t sub_25D4F482C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D3EF004;
  return sub_25D4F1554();
}

uint64_t sub_25D4F48C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SendMessageUnsupportedValueFlowStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25D194FEC;
  return MEMORY[0x270F664F0](a1, a2, v9, a4);
}

uint64_t sub_25D4F4988(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_25D4F49D0(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_25D4F49DC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_recipients);

  if (!v2) {
    return 0;
  }
  sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
  uint64_t v3 = sub_25D53E4C0();

  return v3;
}

uint64_t OUTLINED_FUNCTION_1_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  uint64_t v20 = *(void *)(a20 + 40);
  __swift_project_boxed_opaque_existential_0(a19, v20);
  return v20;
}

uint64_t OUTLINED_FUNCTION_3_70()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_69()
{
  __swift_destroy_boxed_opaque_existential_0(v0);
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_70()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_77()
{
  uint64_t v1 = *(void *)(v0 + 40);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_7_55()
{
  uint64_t v2 = *(void *)(v0 + 40);
  __swift_project_boxed_opaque_existential_0(v1, v2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_9_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_48()
{
  return sub_25D539A20();
}

uint64_t OUTLINED_FUNCTION_16_44()
{
  __swift_project_boxed_opaque_existential_0(v0, *(void *)(v1 + 40));
  return sub_25D539670();
}

uint64_t OUTLINED_FUNCTION_17_41()
{
  __swift_project_boxed_opaque_existential_0(v1, *(void *)(v0 + 120));
  return sub_25D5396A0();
}

uint64_t OUTLINED_FUNCTION_19_52()
{
  __swift_destroy_boxed_opaque_existential_0(v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_48()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_25D53A710();
}

uint64_t OUTLINED_FUNCTION_21_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_36()
{
  return *(void *)(v0 + 400);
}

double OUTLINED_FUNCTION_26_40()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return a11;
}

uint64_t OUTLINED_FUNCTION_28_41(uint64_t a1)
{
  *(void *)(v1 + 176) = a1;
  return sub_25D53EA80();
}

uint64_t OUTLINED_FUNCTION_29_34(float a1)
{
  *uint64_t v1 = a1;
  return sub_25D53A380();
}

uint64_t OUTLINED_FUNCTION_30_40()
{
  return sub_25D53A160();
}

uint64_t OUTLINED_FUNCTION_31_33()
{
  return v0;
}

void OUTLINED_FUNCTION_38_30(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 0xCu);
}

BOOL OUTLINED_FUNCTION_43_27(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_32()
{
  return sub_25D539C10();
}

uint64_t OUTLINED_FUNCTION_46_21()
{
  return sub_25D19E114(v0, v1, (uint64_t *)(v2 - 80));
}

uint64_t OUTLINED_FUNCTION_47_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_48_23()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_49_22()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52_24()
{
  return *(void *)(v0 + 336);
}

uint64_t OUTLINED_FUNCTION_55_23()
{
  __swift_destroy_boxed_opaque_existential_0(v0);
  return sub_25D53A1A0();
}

uint64_t OUTLINED_FUNCTION_56_25()
{
  return *(void *)(v0 + 80);
}

uint64_t OUTLINED_FUNCTION_60_18()
{
  return sub_25D53A360();
}

uint64_t OUTLINED_FUNCTION_61_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_20()
{
  return sub_25D539C00();
}

uint64_t *OUTLINED_FUNCTION_65_18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_0(v2);
}

void OUTLINED_FUNCTION_66_13()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_70_12()
{
  return *(void *)(v0 + 80);
}

uint64_t OUTLINED_FUNCTION_73_11(uint64_t result)
{
  *(void *)(v1 - 80) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_75_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_77_10()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_82_9(uint64_t a1)
{
  *(void *)(v1 + 528) = a1;
  return sub_25D53A380();
}

uint64_t OUTLINED_FUNCTION_83_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_84_9()
{
  return *(void *)(v0 + 80);
}

uint64_t OUTLINED_FUNCTION_85_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  return a14;
}

uint64_t OUTLINED_FUNCTION_86_9()
{
  return v0;
}

void *sub_25D4F5164(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_conversation) = a1;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_shouldSummarize) = a3;
  type metadata accessor for NotificationAppendingAction();
  swift_allocObject();
  *(void *)(v3 + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_notificationAppendingAction) = sub_25D482FCC(a1, a2, a3);
  uint64_t v7 = sub_25D4BFD70(a2);
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  uint64_t v8 = sub_25D4BFDCC(a1, a3);
  if (*(void *)(v8 + 16))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(v8 + 40) + 8) + 8);
    uint64_t v10 = swift_unknownObjectRetain();
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  v7[3] = v10;
  v7[4] = v9;
  swift_unknownObjectRelease();
  uint64_t v11 = sub_25D3B586C(v8);
  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_getObjectType();
    sub_25D4F65A0(&qword_26A674188, (void (*)(uint64_t))type metadata accessor for NotificationAppendingAction);
    swift_retain();
    sub_25D539890();
    swift_unknownObjectRelease();
  }
  swift_release();
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_25D4F5314@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_conversation);
  uint64_t v4 = *(void *)(v3 + 168);
  swift_retain();
  sub_25D539310();
  __swift_project_boxed_opaque_existential_0(v32, v32[3]);
  sub_25D1AD458();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t result = sub_25D2D52D0(ObjCClassFromMetadata);
  if (v7)
  {
    sub_25D5395F0();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v1;
    *(void *)(v8 + 24) = v4;
    swift_retain();
    swift_retain();
    sub_25D5395E0();
    sub_25D539320();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
    uint64_t v9 = *(void *)(*(void *)(v1
                               + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_notificationAppendingAction)
                   + 56);
    if (v9)
    {
      uint64_t v10 = qword_26A66E778;
      swift_retain();
      if (v10 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_25D53DC10();
      __swift_project_value_buffer(v11, (uint64_t)qword_26A688F10);
      uint64_t v12 = sub_25D53DC00();
      os_log_type_t v13 = sub_25D53E7B0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_25D16D000, v12, v13, "#SpokenNotificationPostAppendingActionGroup continue reading next conversation", v14, 2u);
        MEMORY[0x2611AD370](v14, -1, -1);
      }

      uint64_t v15 = *(void *)(v2 + 16);
      char v16 = *(unsigned char *)(v2 + OBJC_IVAR____TtC16SiriMessagesFlow29SpokenConversationActionGroup_shouldSummarize);
      type metadata accessor for SpokenConversationActionGroup(0);
      swift_allocObject();
      swift_retain();
      uint64_t v17 = sub_25D4F5164(v9, v15, v16);
      swift_release();
      uint64_t v18 = &qword_26A66F070;
      uint64_t v19 = (void (*)(uint64_t))type metadata accessor for SpokenConversationActionGroup;
    }
    else
    {
      if (qword_26A66E778 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_25D53DC10();
      __swift_project_value_buffer(v20, (uint64_t)qword_26A688F10);
      uint64_t v21 = sub_25D53DC00();
      os_log_type_t v22 = sub_25D53E7B0();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v23 = 0;
        _os_log_impl(&dword_25D16D000, v21, v22, "#SpokenNotificationPostAppendingActionGroup no more conversations to read", v23, 2u);
        MEMORY[0x2611AD370](v23, -1, -1);
      }

      uint64_t v24 = *(void *)(v2 + 16);
      uint64_t v25 = *(void *)(v24 + 104);
      uint64_t v26 = qword_26A66E690;
      swift_retain();
      swift_retain();
      if (v26 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_26A688740;
      swift_retain();
      uint64_t v17 = sub_25D4F6478(v24, v3, v25, v27);
      swift_release();
      uint64_t v18 = (unint64_t *)&unk_26A674C90;
      uint64_t v19 = (void (*)(uint64_t))type metadata accessor for ReadSpokenHintActionGroup;
    }
    uint64_t v28 = sub_25D4F65A0(v18, v19);
    *a1 = v17;
    a1[1] = v28;
    uint64_t v29 = *MEMORY[0x263F6FD10];
    uint64_t v30 = sub_25D539FA0();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(a1, v29, v30);
    sub_25D539FA0();
    return __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v30);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25D4F5758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_25D5395B0();
  id v4 = *(id *)(a3 + 16);
  return sub_25D539590();
}

uint64_t sub_25D4F57A4()
{
  swift_release();
  return swift_release();
}

uint64_t sub_25D4F57E4()
{
  uint64_t v0 = sub_25D4C00F4();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25D4F582C()
{
  sub_25D4F57E4();
  OUTLINED_FUNCTION_1_52();
  return swift_deallocClassInstance();
}

uint64_t sub_25D4F5860()
{
  return type metadata accessor for SpokenConversationActionGroup(0);
}

uint64_t type metadata accessor for SpokenConversationActionGroup(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674C58);
}

uint64_t sub_25D4F5888()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_25D4F58DC()
{
  sub_25D4C00F4();
  OUTLINED_FUNCTION_1_52();
  return swift_deallocClassInstance();
}

uint64_t sub_25D4F5910()
{
  return type metadata accessor for PlayNotificationSoundActionGroup(0);
}

uint64_t type metadata accessor for PlayNotificationSoundActionGroup(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674C68);
}

uint64_t sub_25D4F5938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F568);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25D538810();
  uint64_t v11 = (int *)type metadata accessor for TimedSpokenContext(0);
  *(void *)&v10[v11[5]] = 0x404E000000000000;
  *(void *)&v10[v11[6]] = a3;
  uint64_t v12 = &v10[v11[7]];
  *(void *)uint64_t v12 = a4;
  *((void *)v12 + 1) = a5;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, (uint64_t)v11);
  return sub_25D1C6B08((uint64_t)v10);
}

uint64_t sub_25D4F5A24()
{
  return __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow25ReadSpokenHintActionGroup_featureFlags);
}

uint64_t sub_25D4F5A34()
{
  uint64_t v0 = sub_25D4C00F4();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow25ReadSpokenHintActionGroup_featureFlags);
  return swift_deallocClassInstance();
}

uint64_t sub_25D4F5AA8()
{
  return type metadata accessor for ReadSpokenHintActionGroup(0);
}

uint64_t type metadata accessor for ReadSpokenHintActionGroup(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674C80);
}

uint64_t sub_25D4F5AD0()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_25D4F5B14()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25D4F5B54(uint64_t a1)
{
  return sub_25D4F5758(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25D4F5B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_25D4F5B8C(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))sub_25D4F60B0);
}

uint64_t sub_25D4F5B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_25D4F5B8C(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))sub_25D4F5CB4);
}

uint64_t sub_25D4F5B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))
{
  uint64_t v21 = type metadata accessor for SiriKitFlowFactoryImpl();
  os_log_type_t v22 = &off_270A459E0;
  v20[0] = a5;
  type metadata accessor for FollowupOfferFlow(0);
  uint64_t v15 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_0_15();
  (*(void (**)(void *))(v17 + 16))(v7);
  uint64_t v18 = a7(a1, a2, a3, a4, *v7, a6, v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
  return v18;
}

uint64_t sub_25D4F5CB4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v33 = a4;
  uint64_t v34 = type metadata accessor for FollowupOfferFlow.State(0);
  MEMORY[0x270FA5388](v34);
  uint64_t v31 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDF0);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for SiriKitFlowFactoryImpl();
  uint64_t v41 = &off_270A459E0;
  *(void *)&long long v39 = a5;
  uint64_t v21 = (void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_onPromptForOfferPublished);
  *uint64_t v21 = 0;
  v21[1] = 0;
  os_log_type_t v22 = (uint64_t *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_strategy);
  v30[1] = a1;
  *os_log_type_t v22 = a1;
  v22[1] = (uint64_t)&off_270A4DA10;
  uint64_t v32 = a2;
  *(void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_conversation) = a2;
  *(void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_conversationManager) = a3;
  sub_25D4F6C78(a6, (uint64_t)v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    uint64_t v23 = type metadata accessor for EmptyReferenceResolver();
    uint64_t v24 = swift_allocObject();
    v30[0] = a6;
    uint64_t v25 = v24;
    uint64_t v37 = v23;
    uint64_t v38 = sub_25D4F65A0(&qword_26A66FDF8, (void (*)(uint64_t))type metadata accessor for EmptyReferenceResolver);
    *(void *)&long long v36 = v25;
    v35[3] = sub_25D53C0D0();
    v35[4] = (uint64_t)&off_270A4B2D0;
    __swift_allocate_boxed_opaque_existential_0(v35);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_25D53C0C0();
    sub_25D202EE8(a3 + 16, (uint64_t)v35, (uint64_t)&v36);
    swift_release();
    swift_release();
    sub_25D4F6CE0(v30[0]);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
    sub_25D4F6CE0((uint64_t)v16);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_transformer, v20, v17);
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_25D4F6CE0(a6);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v26(v20, v16, v17);
    v26((char *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_transformer), v20, v17);
  }
  sub_25D188958(&v39, a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_siriKitFlowFactory);
  uint64_t v27 = a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_state;
  swift_storeEnumTagMultiPayload();
  if (v33)
  {
    uint64_t v28 = (uint64_t)v31;
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    sub_25D1EB408(v28, v27);
    swift_endAccess();
  }
  swift_release();
  sub_25D17DB88(a3 + 16, (uint64_t)&v36);
  swift_release();
  sub_25D188958(&v36, a7 + 16);
  return a7;
}

uint64_t sub_25D4F60B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v34 = a4;
  uint64_t v35 = type metadata accessor for FollowupOfferFlow.State(0);
  MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDF0);
  OUTLINED_FUNCTION_0_3();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_0_15();
  uint64_t v41 = type metadata accessor for SiriKitFlowFactoryImpl();
  uint64_t v42 = &off_270A459E0;
  *(void *)&long long v40 = a5;
  os_log_type_t v22 = (void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_onPromptForOfferPublished);
  *os_log_type_t v22 = 0;
  v22[1] = 0;
  uint64_t v23 = (uint64_t *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_strategy);
  v31[1] = a1;
  uint64_t *v23 = a1;
  v23[1] = (uint64_t)&off_270A4F2B0;
  uint64_t v33 = a2;
  *(void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_conversation) = a2;
  *(void *)(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_conversationManager) = a3;
  sub_25D4F6C78(a6, (uint64_t)v17);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
  {
    uint64_t v24 = type metadata accessor for EmptyReferenceResolver();
    uint64_t v25 = swift_allocObject();
    v31[0] = a6;
    uint64_t v26 = v25;
    uint64_t v38 = v24;
    uint64_t v39 = sub_25D4F65A0(&qword_26A66FDF8, (void (*)(uint64_t))type metadata accessor for EmptyReferenceResolver);
    *(void *)&long long v37 = v26;
    v36[3] = sub_25D53C0D0();
    v36[4] = (uint64_t)&off_270A4B2D0;
    __swift_allocate_boxed_opaque_existential_0(v36);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_25D53C0C0();
    sub_25D202EE8(a3 + 16, (uint64_t)v36, (uint64_t)&v37);
    swift_release();
    swift_release();
    sub_25D4F6CE0(v31[0]);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v37);
    sub_25D4F6CE0((uint64_t)v17);
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_transformer, v7, v18);
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_25D4F6CE0(a6);
    uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
    v27((uint64_t)v7, v17, v18);
    v27(a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_transformer, v7, v18);
  }
  sub_25D188958(&v40, a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_siriKitFlowFactory);
  uint64_t v28 = a7 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_state;
  swift_storeEnumTagMultiPayload();
  if (v34)
  {
    uint64_t v29 = (uint64_t)v32;
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    sub_25D1EB408(v29, v28);
    swift_endAccess();
  }
  swift_release();
  sub_25D17DB88(a3 + 16, (uint64_t)&v37);
  swift_release();
  sub_25D188958(&v37, a7 + 16);
  return a7;
}

void *sub_25D4F6478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = &type metadata for MessagesFeatureFlagsImpl;
  uint64_t v15 = &off_270A46BB0;
  type metadata accessor for ReadSpokenHintActionGroup(0);
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, (uint64_t)&type metadata for MessagesFeatureFlagsImpl);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(void))(v10 + 16))();
  uint64_t v11 = sub_25D4F65E8(a1, a2, a3, a4, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

uint64_t sub_25D4F65A0(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_25D4F65E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F060);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = &type metadata for MessagesFeatureFlagsImpl;
  uint64_t v46 = &off_270A46BB0;
  sub_25D17DB88((uint64_t)v44, a5 + OBJC_IVAR____TtC16SiriMessagesFlow25ReadSpokenHintActionGroup_featureFlags);
  uint64_t v16 = sub_25D4BFD70(a1);
  uint64_t v43 = 0;
  memset(v42, 0, sizeof(v42));
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  sub_25D539310();
  type metadata accessor for ReadSpokenHintAction();
  swift_allocObject();
  uint64_t v17 = sub_25D2C7344(a1, a2, a3, v40, (uint64_t)v42);
  uint64_t v18 = sub_25D4F65A0(qword_26A671720, (void (*)(uint64_t))type metadata accessor for ReadSpokenHintAction);
  v16[3] = v17;
  v16[4] = v18;
  swift_release();
  swift_unknownObjectRelease();
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25D53DC10();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A688F10);
  uint64_t v20 = sub_25D53DC00();
  os_log_type_t v21 = sub_25D53E7B0();
  if (os_log_type_enabled(v20, v21))
  {
    os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v22 = 0;
    _os_log_impl(&dword_25D16D000, v20, v21, "#ReadSpokenHintActionGroup creating offer transition for native flow", v22, 2u);
    MEMORY[0x2611AD370](v22, -1, -1);
  }

  uint64_t v23 = v16[2];
  sub_25D17DB88(v23 + 16, (uint64_t)v42);
  uint64_t v41 = 0;
  memset(v40, 0, sizeof(v40));
  uint64_t v24 = qword_26A66E670;
  swift_retain_n();
  swift_retain();
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  __swift_project_boxed_opaque_existential_0(qword_26A688620, qword_26A688638);
  uint64_t v25 = sub_25D17AA6C();
  uint64_t v26 = sub_25D4BF954(a2, (uint64_t)v42, (uint64_t)v40, v25, v23);
  uint64_t v27 = v16[2];
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDF0);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v28);
  type metadata accessor for SiriKitFlowFactoryImpl();
  uint64_t v29 = swift_allocObject();
  swift_retain();
  swift_retain();
  uint64_t v30 = sub_25D4F5B8C(v26, a2, v27, 0, v29, (uint64_t)v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))sub_25D4F60B0);
  uint64_t v31 = (uint64_t (*)())swift_allocObject();
  *((void *)v31 + 2) = a4;
  *((void *)v31 + 3) = &off_270A45088;
  *((void *)v31 + 4) = a2;
  *((void *)v31 + 5) = a1;
  *((void *)v31 + 6) = a2;
  uint64_t v32 = (uint64_t (**)())(v30 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_onPromptForOfferPublished);
  uint64_t v33 = *(void *)(v30 + OBJC_IVAR____TtC16SiriMessagesFlow17FollowupOfferFlow_onPromptForOfferPublished);
  *uint64_t v32 = sub_25D4F6C1C;
  v32[1] = v31;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_25D1EB46C(v33);
  *(void *)&v40[0] = v30;
  *(void *)&v42[0] = a1;
  *((void *)&v42[0] + 1) = a2;
  sub_25D538EF0();
  swift_allocObject();
  type metadata accessor for FollowupOfferFlow(0);
  sub_25D4F65A0(&qword_26A66FE80, (void (*)(uint64_t))type metadata accessor for FollowupOfferFlow);
  sub_25D4F6C2C();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *uint64_t v12 = sub_25D538EE0();
  uint64_t v34 = *MEMORY[0x263F6F690];
  uint64_t v35 = sub_25D539230();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v12, v34, v35);
  uint64_t v36 = *MEMORY[0x263F6FD08];
  uint64_t v37 = sub_25D539FA0();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v12, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v37);
  uint64_t v38 = (uint64_t)v16 + OBJC_IVAR____TtC16SiriMessagesFlow25MessageReadingActionGroup_staticTransition;
  swift_beginAccess();
  sub_25D17DE90((uint64_t)v12, v38);
  swift_endAccess();
  swift_release();
  swift_release_n();
  swift_release_n();
  swift_release();
  swift_release_n();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  return v16;
}

uint64_t sub_25D4F6BCC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25D4F6C1C()
{
  return sub_25D4F5938(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

unint64_t sub_25D4F6C2C()
{
  unint64_t result = qword_26A674C98;
  if (!qword_26A674C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A674C98);
  }
  return result;
}

uint64_t sub_25D4F6C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D4F6CE0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D4F6D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void (*v8)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670F88);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A673968);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A30);
  sub_25D53C870();
  uint64_t v8 = (void (*)(uint64_t *__return_ptr, uint64_t *))sub_25D53C860();
  uint64_t v30 = (uint64_t)v2;
  v8(&v29, &v30);
  swift_release();
  if (v29)
  {
    swift_retain();
    uint64_t v28 = sub_25D53B020();
    swift_release();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25D53DC10();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A688F10);
    uint64_t v15 = v2;
    swift_retain_n();
    uint64_t v27 = v15;
    uint64_t v16 = sub_25D53DC00();
    uint64_t v17 = sub_25D53E7B0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412546;
      uint64_t v29 = (uint64_t)v27;
      uint64_t v30 = v24;
      uint64_t v25 = a2;
      uint64_t v19 = v27;
      sub_25D53EA80();
      *uint64_t v26 = v3;

      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v29 = v28;
      sub_25D53BFC0();
      sub_25D3FDB48();
      uint64_t v20 = sub_25D53F050();
      uint64_t v29 = sub_25D19E114(v20, v21, &v30);
      a2 = v25;
      sub_25D53EA80();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v16, v17, "#ReferenceResolution INSpeakableString-RRaaS: Transformed INSpeakableString %@ to USO entity common group %s", (uint8_t *)v18, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A672E50);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      swift_release_n();
      uint64_t v16 = v27;
    }
    sub_25D4F72D8(a1, a2);
    os_log_type_t v22 = OUTLINED_FUNCTION_0_52();
    v23(v22);
    swift_release();
    swift_release();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v9 = OUTLINED_FUNCTION_0_52();
    v10(v9);
    uint64_t v11 = 1;
  }
  uint64_t v12 = sub_25D53DCF0();
  return __swift_storeEnumTagSinglePayload(a2, v11, 1, v12);
}

BOOL sub_25D4F7248()
{
  sub_25D4F7494(v0);
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  if (v2) {
    return 0;
  }
  id v4 = objc_msgSend(v0, sel_spokenPhrase);
  uint64_t v5 = sub_25D53E200();
  unint64_t v7 = v6;

  swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  return v8 == 0;
}

uint64_t sub_25D4F72D8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  v15[1] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670610);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25D538880();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D4F7494(v3);
  if (!v12)
  {
    sub_25D538870();
    sub_25D538840();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_25D4F7530(a1, (uint64_t)v7);
  sub_25D4F7598();
  swift_retain();
  id v13 = v3;
  return sub_25D53DCC0();
}

uint64_t sub_25D4F7494(void *a1)
{
  id v1 = objc_msgSend(a1, sel_vocabularyIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25D53E200();

  return v3;
}

uint64_t sub_25D4F74F8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25D4F7530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D4F7598()
{
  unint64_t result = qword_26A670090;
  if (!qword_26A670090)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A670090);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_52()
{
  return v0;
}

uint64_t sub_25D4F75F0(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_25D53EDC0();
    uint64_t result = sub_25D53604C(v1);
    if (result < 0 || (unint64_t v5 = result, result >= 1 << *(unsigned char *)(v1 + 32)))
    {
LABEL_13:
      __break(1u);
      return v16;
    }
    else
    {
      int v6 = v4;
      uint64_t v7 = v1 + 64;
      uint64_t v14 = v1;
      while ((*(void *)(v7 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
      {
        if (v6 != *(_DWORD *)(v1 + 36)) {
          goto LABEL_17;
        }
        uint64_t v15 = v2;
        uint64_t v8 = *(void *)(v1 + 56);
        uint64_t v9 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v5);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        uint64_t v12 = *(void **)(v8 + 8 * v5);
        swift_bridgeObjectRetain();
        id v13 = v12;
        sub_25D1C5EE8(v10, v11);

        swift_bridgeObjectRelease();
        sub_25D53EDA0();
        sub_25D53EDD0();
        uint64_t v1 = v14;
        sub_25D53EDE0();
        uint64_t result = sub_25D53EDB0();
        if ((uint64_t)v5 >= -(-1 << *(unsigned char *)(v14 + 32))) {
          goto LABEL_18;
        }
        if ((*(void *)(v7 + 8 * (v5 >> 6)) & (1 << v5)) == 0) {
          goto LABEL_19;
        }
        if (v6 != *(_DWORD *)(v14 + 36)) {
          goto LABEL_20;
        }
        uint64_t result = sub_25D53EBC0();
        --v2;
        if (v15 == 1) {
          return v16;
        }
        unint64_t v5 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          int v6 = *(_DWORD *)(v14 + 36);
          if (result < 1 << *(unsigned char *)(v14 + 32)) {
            continue;
          }
        }
        goto LABEL_13;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
    }
  }
  return result;
}

void sub_25D4F77B8(uint64_t a1)
{
  uint64_t v28 = sub_25D53D0A0();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    v24[1] = v1;
    uint64_t v33 = MEMORY[0x263F8EE78];
    sub_25D1F5DC4();
    uint64_t v6 = v33;
    uint64_t v7 = sub_25D53604C(a1);
    if ((v7 & 0x8000000000000000) == 0)
    {
      unint64_t v9 = v7;
      if (v7 < 1 << *(unsigned char *)(a1 + 32))
      {
        uint64_t v10 = a1 + 64;
        uint64_t v25 = a1 + 64;
        uint64_t v26 = (void (**)(char *, uint64_t))(v3 + 8);
        while ((*(void *)(v10 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
        {
          if (v8 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_18;
          }
          uint64_t v29 = v5;
          uint64_t v30 = v8;
          uint64_t v11 = *(void *)(a1 + 56);
          uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
          uint64_t v13 = v12[1];
          uint64_t v32 = *v12;
          uint64_t v14 = v6;
          uint64_t v15 = *(void **)(v11 + 8 * v9);
          swift_bridgeObjectRetain_n();
          id v16 = v15;
          uint64_t v17 = v27;
          sub_25D53E7E0();
          uint64_t v6 = v14;
          uint64_t v18 = sub_25D53D080();
          uint64_t v31 = v19;
          (*v26)(v17, v28);

          swift_bridgeObjectRelease();
          uint64_t v33 = v6;
          unint64_t v20 = *(void *)(v6 + 16);
          if (v20 >= *(void *)(v6 + 24) >> 1)
          {
            sub_25D1F5DC4();
            uint64_t v6 = v33;
          }
          *(void *)(v6 + 16) = v20 + 1;
          os_log_type_t v21 = (void *)(v6 + 32 * v20);
          v21[4] = v32;
          v21[5] = v13;
          uint64_t v22 = v31;
          v21[6] = v18;
          v21[7] = v22;
          if ((uint64_t)v9 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_19;
          }
          uint64_t v10 = v25;
          if ((*(void *)(v25 + 8 * (v9 >> 6)) & (1 << v9)) == 0) {
            goto LABEL_20;
          }
          if (v30 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_21;
          }
          uint64_t v23 = sub_25D53EBC0();
          uint64_t v5 = v29 - 1;
          if (v29 == 1) {
            return;
          }
          unint64_t v9 = v23;
          if ((v23 & 0x8000000000000000) == 0)
          {
            uint64_t v8 = *(unsigned int *)(a1 + 36);
            if (v23 < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
    }
LABEL_22:
    __break(1u);
  }
}

uint64_t sub_25D4F7A68(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_25D4C88F0(v20, a1);
  uint64_t v3 = v20[0];
  uint64_t v21 = v20[1];
  int64_t v4 = v20[3];
  unint64_t v5 = v20[4];
  int64_t v6 = (unint64_t)(v20[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v9);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v15, v16, v18, v19);
    swift_bridgeObjectRelease();
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
      return swift_release();
    }
    unint64_t v11 = *(void *)(v21 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v21 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v21 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v21 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              return swift_release();
            }
            unint64_t v11 = *(void *)(v21 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v21 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
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

uint64_t sub_25D4F7C1C()
{
  return sub_25D4F7C28(&OBJC_IVAR____TtC16SiriMessagesFlow53SearchForMessagesGroupNeedsDisambiguationFlowStrategy_randomIdToGroupDict);
}

uint64_t sub_25D4F7C28(void *a1)
{
  if (*(void *)(v1 + *a1))
  {
    return swift_bridgeObjectRetain();
  }
  else
  {
    sub_25D4FAAAC(0xD00000000000005DLL, 0x800000025D55CE30);
    uint64_t result = sub_25D53EE80();
    __break(1u);
  }
  return result;
}

uint64_t sub_25D4F7CB8(uint64_t a1)
{
  return sub_25D4F7CC4(a1, &OBJC_IVAR____TtC16SiriMessagesFlow53SearchForMessagesGroupNeedsDisambiguationFlowStrategy_randomIdToGroupDict);
}

uint64_t sub_25D4F7CC4(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_25D4F7C28(a2);
  sub_25D4F77B8(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  sub_25D3BB70C(v5, v6, v7, v8, v9, v10, v11, v12, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_25D4FDD88(v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25D541230;
  if (qword_26A66E798 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A688F50;
  *(void *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  *(void *)(inited + 64) = sub_25D1EB5F4((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  *(void *)(inited + 32) = v17;
  uint64_t v18 = qword_26A66E790;
  swift_retain_n();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_26A688F48;
  swift_retain();
  uint64_t v20 = sub_25D4F986C(v15, v17, v19);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25D1AFB50(inited, v20, a1);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  return sub_25D5356D4();
}

uint64_t sub_25D4F7E88()
{
  OUTLINED_FUNCTION_14();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FCB0);
  v1[5] = v4;
  OUTLINED_FUNCTION_11_0(v4);
  v1[6] = v5;
  v1[7] = OUTLINED_FUNCTION_92();
  return MEMORY[0x270FA2498](sub_25D4F7F20, 0, 0);
}

uint64_t sub_25D4F7F20()
{
  uint64_t v1 = *(void **)(v0[4]
                + OBJC_IVAR____TtC16SiriMessagesFlow47SendMessageGroupNeedsDisambiguationFlowStrategy_selectedGroupName);
  if (v1)
  {
    uint64_t v3 = v0[6];
    uint64_t v2 = v0[7];
    uint64_t v4 = v0[5];
    sub_25D17DBEC(0, (unint64_t *)&qword_26A66F530);
    id v5 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
    uint64_t v6 = (void *)sub_25D53A360();
    id v7 = v5;
    id v8 = sub_25D2EB87C(v6, v1);
    sub_25D17DBEC(0, (unint64_t *)&qword_26A670090);
    id v9 = v7;
    id v10 = v8;
    sub_25D539E40();
    sub_25D539F60();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  }
  else
  {
    sub_25D194BF4();
    swift_allocError();
    *uint64_t v12 = 0xD000000000000016;
    v12[1] = 0x800000025D556A20;
    swift_willThrow();
  }
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_25D4F80EC()
{
  OUTLINED_FUNCTION_14();
  v1[36] = v2;
  v1[37] = v0;
  v1[34] = v3;
  v1[35] = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  v1[38] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D539D00();
  v1[39] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[40] = v6;
  v1[41] = OUTLINED_FUNCTION_92();
  uint64_t v7 = sub_25D53AD60();
  v1[42] = v7;
  OUTLINED_FUNCTION_11_0(v7);
  v1[43] = v8;
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  uint64_t v9 = sub_25D539C30();
  v1[47] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v1[48] = v10;
  v1[49] = OUTLINED_FUNCTION_92();
  return MEMORY[0x270FA2498](sub_25D4F822C, 0, 0);
}

uint64_t sub_25D4F822C()
{
  uint64_t v29 = v0;
  uint64_t v1 = v0[37];
  uint64_t v2 = sub_25D4F7C28(&OBJC_IVAR____TtC16SiriMessagesFlow47SendMessageGroupNeedsDisambiguationFlowStrategy_randomIdToGroupDict);
  sub_25D4F75F0(v2);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  sub_25D53A350();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A671560);
  uint64_t v3 = sub_25D53A0F0();
  sub_25D3BBB34(v3);
  swift_bridgeObjectRelease();
  sub_25D539470();
  OUTLINED_FUNCTION_91();
  sub_25D539450();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 16), *(void *)(v1 + 40));
  OUTLINED_FUNCTION_14_0();
  v4();
  sub_25D3B352C();
  v0[50] = v5;
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 16), *(void *)(v1 + 40));
  OUTLINED_FUNCTION_14_0();
  v6();
  sub_25D4F7CC4((uint64_t)(v0 + 12), &OBJC_IVAR____TtC16SiriMessagesFlow47SendMessageGroupNeedsDisambiguationFlowStrategy_randomIdToGroupDict);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 12));
  uint64_t v7 = sub_25D53A0F0();
  sub_25D4F8BD8(v7);
  swift_bridgeObjectRelease();
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v8 = v0[43];
  uint64_t v9 = sub_25D53DC10();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A688F10);
  uint64_t v10 = *(void (**)(void))(v8 + 16);
  OUTLINED_FUNCTION_32_15();
  v10();
  uint64_t v11 = sub_25D53DC00();
  os_log_type_t type = sub_25D53E7B0();
  if (os_log_type_enabled(v11, type))
  {
    uint64_t v12 = v10;
    uint64_t v13 = v0[43];
    uint64_t v14 = v0[44];
    uint64_t v15 = v0[42];
    log = v11;
    uint64_t v24 = v0[45];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    buf = v16;
    *(_DWORD *)uint64_t v16 = 136315138;
    OUTLINED_FUNCTION_32_15();
    v12();
    sub_25D53ADE0();
    v0[25] = v15;
    v0[26] = sub_25D4F9824((unint64_t *)&qword_26A66F308, MEMORY[0x263F71688]);
    __swift_allocate_boxed_opaque_existential_0(v0 + 22);
    OUTLINED_FUNCTION_32_15();
    v12();
    uint64_t v17 = sub_25D53ADD0();
    unint64_t v19 = v18;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 22));
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    uint64_t v21 = v14;
    uint64_t v10 = v12;
    v20(v21, v15);
    v0[33] = sub_25D19E114(v17, v19, &v28);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    v20(v24, v15);
    uint64_t v11 = log;
    _os_log_impl(&dword_25D16D000, log, type, "#SendMessageGroupNeedsDisambiguationFlowStrategy submitting NLv4 dialog act: %s", buf, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0[43] + 8);
    v20(v0[45], v0[42]);
  }

  v0[51] = (uint64_t)v20;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A20);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25D541230;
  OUTLINED_FUNCTION_32_15();
  v10();
  sub_25D539B60();
  uint64_t v22 = (void *)swift_task_alloc();
  v0[52] = (uint64_t)v22;
  *uint64_t v22 = v0;
  v22[1] = sub_25D4F8744;
  return sub_25D47F16C();
}

uint64_t sub_25D4F8744()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_25D4F8AEC;
  }
  else
  {
    uint64_t v6 = sub_25D4F8830;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25D4F8830()
{
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v11 = *(void *)(v0 + 376);
  uint64_t v17 = *(void *)(v0 + 368);
  unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  uint64_t v16 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v14 = *(void *)(v0 + 320);
  uint64_t v15 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(uint64_t **)(v0 + 272);
  __swift_project_boxed_opaque_existential_0((void *)(v3 + 16), *(void *)(v3 + 40));
  OUTLINED_FUNCTION_14_0();
  v5();
  __swift_project_boxed_opaque_existential_0((void *)(v3 + 16), *(void *)(v3 + 40));
  OUTLINED_FUNCTION_14_0();
  v6();
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_25D5396A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v12, v11);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v11);
  uint64_t v7 = sub_25D53A710();
  *(_OWORD *)(v0 + 232) = 0u;
  *(void *)(v0 + 248) = 0;
  *(_OWORD *)(v0 + 216) = 0u;
  uint64_t v8 = MEMORY[0x263F6FFF0];
  v4[3] = v7;
  v4[4] = v8;
  __swift_allocate_boxed_opaque_existential_0(v4);
  sub_25D539A40();
  swift_bridgeObjectRelease();
  sub_25D196E70(v0 + 216, &qword_26A674B60);
  sub_25D196E70(v2, (uint64_t *)&unk_26A6719F0);
  __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  v18(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_25D4F8AEC()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  (*(void (**)(void, void))(v0 + 408))(*(void *)(v0 + 368), *(void *)(v0 + 336));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25D4F8BD8(uint64_t a1)
{
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v3 = *(v2 - 1);
      unint64_t v4 = *v2;
      uint64_t v5 = qword_26A66E778;
      swift_bridgeObjectRetain();
      if (v5 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_25D53DC10();
      __swift_project_value_buffer(v6, (uint64_t)qword_26A688F10);
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_25D53DC00();
      os_log_type_t v8 = sub_25D53E7B0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v9 + 4) = sub_25D19E114(v3, v4, &v12);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25D16D000, v7, v8, "#SendMessageGroupNeedsDisambiguationFlowStrategy adding context for group %s", (uint8_t *)v9, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_25D53BB20();
      OUTLINED_FUNCTION_91();
      sub_25D53BB10();
      sub_25D53B950();
      OUTLINED_FUNCTION_91();
      sub_25D53B940();
      sub_25D53B930();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_25D53BAD0();
      swift_release();
      sub_25D53BCE0();
      OUTLINED_FUNCTION_91();
      sub_25D53BCD0();
      sub_25D53BAB0();
      uint64_t v10 = swift_retain();
      MEMORY[0x2611ABBF0](v10);
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25D53E500();
      }
      v2 += 2;
      sub_25D53E540();
      sub_25D53E4E0();
      swift_release();
      swift_release();
      swift_release();
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  sub_25D4133D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D4F8EE4()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC16SiriMessagesFlow47SendMessageGroupNeedsDisambiguationFlowStrategy_selectedGroupName));
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D4F8F24()
{
  uint64_t v0 = sub_25D235568();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC16SiriMessagesFlow47SendMessageGroupNeedsDisambiguationFlowStrategy_selectedGroupName));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25D4F8F6C()
{
  sub_25D4F8F24();
  return swift_deallocClassInstance();
}

uint64_t sub_25D4F8FC0()
{
  return type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
}

uint64_t type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy()
{
  uint64_t result = qword_26A674CA0;
  if (!qword_26A674CA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D4F9010()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_25D4F9054()
{
  return sub_25D4F9824(qword_26A674CC0, (void (*)(uint64_t))type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy);
}

uint64_t sub_25D4F909C()
{
  return sub_25D1EB5F4((unint64_t *)&qword_26A6714F8, qword_26A671500);
}

void sub_25D4F90D8()
{
  type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  JUMPOUT(0x2611A63C0);
}

uint64_t sub_25D4F9130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D2B7688(a1, a2);
}

uint64_t sub_25D4F9154(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_26A671558 + dword_26A671558);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_25D4F9208;
  return v6(a2);
}

uint64_t sub_25D4F9208(uint64_t a1)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v5 + 16) = a1;
  }
  os_log_type_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

uint64_t sub_25D4F92EC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D1AD840;
  return sub_25D4F7E88();
}

uint64_t sub_25D4F9398()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D1AB1B0;
  return sub_25D4F80EC();
}

uint64_t sub_25D4F944C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25D1AD840;
  return MEMORY[0x270F66628](a1, a2, a3, v11, a5);
}

uint64_t sub_25D4F951C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25D1AD840;
  return MEMORY[0x270F66638](a1, a2, a3, v11, a5);
}

uint64_t sub_25D4F95EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  *os_log_type_t v8 = v4;
  v8[1] = sub_25D1AD840;
  return MEMORY[0x270F66630](a1, a2, v9, a4);
}

uint64_t sub_25D4F96B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  *os_log_type_t v8 = v4;
  v8[1] = sub_25D1AD840;
  return MEMORY[0x270F66648](a1, a2, v9, a4);
}

uint64_t sub_25D4F977C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy();
  return MEMORY[0x270F66640](a1, v5, a3);
}

uint64_t sub_25D4F97CC(uint64_t a1)
{
  uint64_t result = sub_25D4F9824(&qword_26A673830, (void (*)(uint64_t))type metadata accessor for SendMessageGroupNeedsDisambiguationFlowStrategy);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25D4F9824(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D4F986C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D53A3B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  v19[3] = v10;
  uint64_t v20 = sub_25D1EB5F4((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  v18[4] = v20;
  v19[0] = a2;
  v18[3] = v10;
  v18[0] = a3;
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v14 = v19;
  uint64_t v15 = &v17;
  uint64_t v16 = v18;
  swift_retain();
  swift_retain();
  sub_25D4F7A68(a1, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D4F9A60);
  if (qword_26A66E848 != -1) {
    swift_once();
  }
  sub_25D53AFB0();
  sub_25D53A390();
  sub_25D53A3A0();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  sub_25D385EEC();
  uint64_t v11 = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return v11;
}

uint64_t sub_25D4F9A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25D1AF85C(a1, a2, a3, a4, v4[2], v4[3], v4[4]);
}

uint64_t type metadata accessor for UnsendMessagesCATs()
{
  uint64_t result = qword_26A674D00;
  if (!qword_26A674D00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D4F9AB4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25D4F9AF4()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v0 = OUTLINED_FUNCTION_32_4();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_14_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D194780;
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_22_16();
  return v3();
}

uint64_t sub_25D4F9B9C(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 56) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return OUTLINED_FUNCTION_49_3((uint64_t)sub_25D4F9BB8);
}

uint64_t sub_25D4F9BB8()
{
  OUTLINED_FUNCTION_35_1();
  char v1 = *(unsigned char *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F250);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0x6552656E4F736168;
  *(void *)(v2 + 40) = 0xEF746E6569706963;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D058];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(void))((char *)v3 + *v3);
  *(void *)(v0 + 32) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25D541230;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25D4F9CD0;
  OUTLINED_FUNCTION_7_56();
  return v6();
}

uint64_t sub_25D4F9CD0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25D4F9DD8, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_48();
    return v7();
  }
}

uint64_t sub_25D4F9DD8()
{
  OUTLINED_FUNCTION_14();
  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25D4F9E38(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_49_3((uint64_t)sub_25D4F9E54);
}

uint64_t sub_25D4F9E54()
{
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F250);
  uint64_t v2 = swift_allocObject();
  v0[5] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25D541230;
  *(void *)(v2 + 32) = 7368801;
  *(void *)(v2 + 40) = 0xE300000000000000;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for MessagesApp(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  uint64_t v6 = (uint64_t (*)(void))((int)*MEMORY[0x263F6D058] + MEMORY[0x263F6D058]);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25D2E5F38;
  OUTLINED_FUNCTION_7_56();
  return v6();
}

uint64_t sub_25D4F9F80()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v0 = OUTLINED_FUNCTION_32_4();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_14_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D194FEC;
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_22_16();
  return v3();
}

uint64_t sub_25D4FA028()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v0 = OUTLINED_FUNCTION_32_4();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_14_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D194FEC;
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_22_16();
  return v3();
}

uint64_t sub_25D4FA0D0()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v0 = OUTLINED_FUNCTION_32_4();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_14_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D194FEC;
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_22_16();
  return v3();
}

uint64_t sub_25D4FA178(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v4 + 57) = a3;
  *(unsigned char *)(v4 + 56) = a2;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v3;
  return OUTLINED_FUNCTION_49_3((uint64_t)sub_25D4FA198);
}

uint64_t sub_25D4FA198()
{
  OUTLINED_FUNCTION_35_1();
  char v1 = *(unsigned char *)(v0 + 57);
  char v2 = *(unsigned char *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F250);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_25D541BE0;
  *(void *)(v3 + 32) = 0x646E65736E557369;
  *(void *)(v3 + 40) = 0xE800000000000000;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v3 + 48) = v2;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0x6C65636E61437369;
  *(void *)(v3 + 88) = 0xE800000000000000;
  *(void *)(v3 + 120) = v4;
  *(unsigned char *)(v3 + 96) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D058]
                                                                                    + MEMORY[0x263F6D058]);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25D4F9CD0;
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, 0xD00000000000001DLL, 0x800000025D55CEC0, v3);
}

uint64_t sub_25D4FA2D8(uint64_t a1, uint64_t a2)
{
  return sub_25D4FA32C(a1, a2);
}

uint64_t sub_25D4FA32C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D53D270();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A50);
  MEMORY[0x270FA5388](v8 - 8);
  sub_25D1A5698(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_25D53CFA0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_25D1A5700(a1);
  return v10;
}

uint64_t sub_25D4FA494()
{
  return type metadata accessor for UnsendMessagesCATs();
}

double sub_25D4FA4B4@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v66 = a2;
  sub_25D53A6B0();
  OUTLINED_FUNCTION_9_0();
  uint64_t v64 = v4;
  uint64_t v65 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v63 - v8;
  uint64_t v10 = sub_25D53A650();
  OUTLINED_FUNCTION_9_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25D53BF40();
  OUTLINED_FUNCTION_9_0();
  uint64_t v18 = v17;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v63 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v10);
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v15, v10);
  if (v25 == *MEMORY[0x263F6FF50])
  {
    uint64_t v26 = OUTLINED_FUNCTION_1_53();
    v27(v26);
    goto LABEL_5;
  }
  if (v25 == *MEMORY[0x263F6FF78])
  {
    uint64_t v28 = OUTLINED_FUNCTION_1_53();
    v29(v28);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A670230);
    swift_release();
LABEL_5:
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v30(v24, v15, v16);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_25D53DC10();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A688F10);
    uint64_t v32 = sub_25D53DC00();
    os_log_type_t v33 = sub_25D53E7B0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (_WORD *)swift_slowAlloc();
      *uint64_t v34 = 0;
      OUTLINED_FUNCTION_12_3(&dword_25D16D000, v35, v36, "PhoneCallIntentHelper# building PhoneCallNLv3Intent");
      MEMORY[0x2611AD370](v34, -1, -1);
    }

    v30(v22, v24, v16);
    uint64_t v37 = type metadata accessor for PhoneCallNLv3Intent();
    swift_allocObject();
    uint64_t v38 = sub_25D3DD6FC((uint64_t)v22);
    if (v38)
    {
      long long v40 = v66;
      v66[3] = v37;
      v40[4] = (uint64_t)&off_270A4B6E0;
      *long long v40 = v38;
      return result;
    }
    return OUTLINED_FUNCTION_3_71();
  }
  if (v25 == *MEMORY[0x263F6FF80])
  {
    uint64_t v41 = OUTLINED_FUNCTION_1_53();
    v42(v41);
    uint64_t v44 = v64;
    uint64_t v43 = v65;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v9, v15, v65);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_25D53DC10();
    __swift_project_value_buffer(v45, (uint64_t)qword_26A688F10);
    uint64_t v46 = sub_25D53DC00();
    os_log_type_t v47 = sub_25D53E7B0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_25D16D000, v46, v47, "PhoneCallIntentHelper# building PhoneCallNLv4Intent from usoParse", v48, 2u);
      MEMORY[0x2611AD370](v48, -1, -1);
    }

    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v7, v9, v43);
    uint64_t v49 = type metadata accessor for PhoneCallNLv4Intent();
    swift_allocObject();
    uint64_t v50 = sub_25D449BE0((uint64_t)v7);
    if (v50)
    {
      uint64_t v51 = v66;
      v66[3] = v49;
      v51[4] = (uint64_t)&off_270A4D888;
      *uint64_t v51 = v50;
      uint64_t v52 = OUTLINED_FUNCTION_4_70();
      v53(v52);
      return result;
    }
    uint64_t v61 = OUTLINED_FUNCTION_4_70();
    v62(v61);
    return OUTLINED_FUNCTION_3_71();
  }
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_25D53DC10();
  __swift_project_value_buffer(v54, (uint64_t)qword_26A688F10);
  uint64_t v55 = sub_25D53DC00();
  os_log_type_t v56 = sub_25D53E7B0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (_WORD *)swift_slowAlloc();
    *uint64_t v57 = 0;
    OUTLINED_FUNCTION_12_3(&dword_25D16D000, v58, v59, "PhoneCallIntentHelper# unrecognized parse type, not building PhoneCallIntent");
    MEMORY[0x2611AD370](v57, -1, -1);
  }

  double v60 = OUTLINED_FUNCTION_3_71();
  (*(void (**)(char *, uint64_t, double))(v12 + 8))(v15, v10, v60);
  return result;
}

uint64_t OUTLINED_FUNCTION_1_53()
{
  return v0;
}

double OUTLINED_FUNCTION_3_71()
{
  uint64_t v1 = *(void *)(v0 - 88);
  *(void *)(v1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_70()
{
  return v0;
}

uint64_t sub_25D4FAA48()
{
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25D53DC10();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26A688F10);
}

uint64_t sub_25D4FAAAC(uint64_t a1, unint64_t a2)
{
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25D53DC10();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A688F10);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25D53DC00();
  os_log_type_t v6 = sub_25D53E7C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_25D19E114(a1, a2, &v10);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D16D000, v5, v6, "Fatal error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611AD370](v8, -1, -1);
    MEMORY[0x2611AD370](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25D4FAC64()
{
  uint64_t v0 = sub_25D53DC10();
  __swift_allocate_value_buffer(v0, qword_26A688F10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A688F10);
  if (qword_26A66E780 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A688F28;
  return sub_25D53DC20();
}

uint64_t sub_25D4FACF0()
{
  sub_25D4FAD58();
  uint64_t result = sub_25D53EA20();
  qword_26A688F28 = result;
  return result;
}

unint64_t sub_25D4FAD58()
{
  unint64_t result = qword_26A674D48;
  if (!qword_26A674D48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A674D48);
  }
  return result;
}

uint64_t sub_25D4FAD98(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, unint64_t, uint64_t))
{
  v190 = a3;
  v187 = (char *)a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F610);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_56_0();
  uint64_t v186 = v5;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v6);
  v179 = (char *)&v174 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670520);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v178 = (uint64_t)&v174 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_25D53DCF0();
  OUTLINED_FUNCTION_9_0();
  uint64_t v191 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_56_0();
  uint64_t v183 = v12;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_85_0();
  uint64_t v180 = v14;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_85_0();
  uint64_t v195 = v16;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_85_0();
  uint64_t v188 = v18;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_85_0();
  uint64_t v176 = v20;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v21);
  v177 = (char *)&v174 - v22;
  sub_25D53DC40();
  OUTLINED_FUNCTION_9_0();
  uint64_t v192 = v23;
  uint64_t v193 = v24;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_56_0();
  uint64_t v182 = v25;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_85_0();
  uint64_t v194 = v27;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_85_0();
  uint64_t v181 = v29;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v30);
  v184 = (char *)&v174 - v31;
  uint64_t v32 = sub_25D53DD00();
  OUTLINED_FUNCTION_9_0();
  uint64_t v185 = v33;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_56_0();
  v175 = v35;
  OUTLINED_FUNCTION_90();
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  uint64_t v39 = (uint64_t *)((char *)&v174 - v38);
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (void (*)(char *, uint64_t))((char *)&v174 - v40);
  uint64_t v42 = sub_25D53DC90();
  OUTLINED_FUNCTION_9_0();
  uint64_t v44 = v43;
  MEMORY[0x270FA5388](v45);
  os_log_type_t v47 = (void (**)(void))((char *)&v174 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A671A30);
  uint64_t v49 = MEMORY[0x270FA5388](v48);
  uint64_t v51 = (void **)((char *)&v174 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v49);
  uint64_t v53 = (char *)&v174 - v52;
  void *v47 = a1;
  (*(void (**)(void *, void, uint64_t))(v44 + 104))(v47, *MEMORY[0x263F74278], v42);
  swift_retain();
  sub_25D53DB60();
  OUTLINED_FUNCTION_12_33();
  v54();
  v187 = v53;
  sub_25D4FD528((uint64_t)v53, (uint64_t)v51);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v55 = *v51;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v56 = sub_25D53DC10();
    __swift_project_value_buffer(v56, (uint64_t)qword_26A688F10);
    id v57 = v55;
    id v58 = v55;
    uint64_t v59 = sub_25D53DC00();
    os_log_type_t v60 = sub_25D53E7C0();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (_DWORD *)swift_slowAlloc();
      uint64_t v62 = OUTLINED_FUNCTION_30();
      uint64_t v197 = (uint64_t)v55;
      v198[0] = v62;
      *uint64_t v61 = 136315138;
      id v63 = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
      uint64_t v64 = sub_25D53E270();
      uint64_t v197 = sub_25D19E114(v64, v65, v198);
      sub_25D53EA80();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_16_45(&dword_25D16D000, v59, v66, "ReferenceResolution# Received a failure: %s -> nil");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
    }
    goto LABEL_13;
  }
  uint64_t v67 = v185;
  (*(void (**)(void (*)(char *, uint64_t), void **, uint64_t))(v185 + 32))(v41, v51, v32);
  uint64_t v68 = *(void (**)(uint64_t *, void (*)(void), uint64_t))(v67 + 16);
  v68(v39, (void (*)(void))v41, v32);
  int v69 = (*(uint64_t (**)(uint64_t *, uint64_t))(v67 + 88))(v39, v32);
  uint64_t v70 = v32;
  v71 = v41;
  uint64_t v72 = v39;
  if (v69 == *MEMORY[0x263F742B8])
  {
    uint64_t v73 = OUTLINED_FUNCTION_2_69();
    v74(v73);
    uint64_t v75 = v193;
    uint64_t v76 = v184;
    uint64_t v77 = v192;
    (*(void (**)(char *, uint64_t *, uint64_t))(v193 + 32))(v184, v39, v192);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v178 = v32;
    uint64_t v78 = sub_25D53DC10();
    uint64_t v79 = __swift_project_value_buffer(v78, (uint64_t)qword_26A688F10);
    (*(void (**)(uint64_t, char *, uint64_t))(v75 + 16))(v181, v76, v77);
    uint64_t v80 = sub_25D53DC00();
    os_log_type_t v81 = sub_25D53E7B0();
    BOOL v82 = os_log_type_enabled(v80, v81);
    v174 = (void (*)(void))v41;
    if (v82)
    {
      uint64_t v83 = (_DWORD *)OUTLINED_FUNCTION_12_7();
      v198[0] = OUTLINED_FUNCTION_30();
      *uint64_t v83 = 136315138;
      v71 = (void (*)(char *, uint64_t))((char *)v83 + v79);
      sub_25D4FD5B0((unint64_t *)&qword_26A670530, MEMORY[0x263F74140]);
      uint64_t v84 = sub_25D53F050();
      uint64_t v86 = sub_25D19E114(v84, v85, v198);
      OUTLINED_FUNCTION_13_7(v86);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      uint64_t v87 = OUTLINED_FUNCTION_11_49();
      ((void (*)(uint64_t))((char *)v83 + v79))(v87);
      OUTLINED_FUNCTION_16_45(&dword_25D16D000, v80, v88, "ReferenceResolution# Found a candidate %s");
      swift_arrayDestroy();
      uint64_t v67 = v185;
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      uint64_t v115 = OUTLINED_FUNCTION_11_49();
      ((void (*)(uint64_t))v41)(v115);
    }

    uint64_t v116 = v77;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF48);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_25D541230;
    v117 = v184;
    sub_25D53DC30();
    v71(v117, v116);
    (*(void (**)(void (*)(void), uint64_t))(v67 + 8))(v174, v178);
    goto LABEL_33;
  }
  if (v69 == *MEMORY[0x263F742C8])
  {
    uint64_t v90 = OUTLINED_FUNCTION_2_69();
    v91(v90);
    uint64_t v186 = *v39;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_25D53DC10();
    v93 = (void *)OUTLINED_FUNCTION_84_0(v92, (uint64_t)qword_26A688F10);
    os_log_type_t v94 = sub_25D53E7B0();
    BOOL v95 = OUTLINED_FUNCTION_27_0(v94);
    uint64_t v96 = v192;
    uint64_t v97 = (uint64_t)v179;
    if (v95)
    {
      uint64_t v98 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v98);
      OUTLINED_FUNCTION_24_1(&dword_25D16D000, v99, v100, "ReferenceResolution# Found ambiguous entities");
      OUTLINED_FUNCTION_3_0();
    }
    v174 = (void (*)(void))v41;

    uint64_t v101 = *(void *)(v186 + 16);
    if (v101)
    {
      uint64_t v178 = v70;
      uint64_t v103 = v193 + 16;
      v102 = *(void (**)(uint64_t, unint64_t, uint64_t))(v193 + 16);
      unint64_t v104 = v186 + ((*(unsigned __int8 *)(v193 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v193 + 80));
      uint64_t v189 = *(void *)(v193 + 72);
      v190 = v102;
      v105 = (void (**)(uint64_t, uint64_t))(v193 + 8);
      v106 = (void (**)(uint64_t, uint64_t, uint64_t))(v191 + 32);
      swift_bridgeObjectRetain();
      uint64_t v89 = MEMORY[0x263F8EE78];
      uint64_t v193 = v103;
      uint64_t v107 = v196;
      do
      {
        uint64_t v108 = v194;
        v190(v194, v104, v96);
        sub_25D53DC30();
        __swift_storeEnumTagSinglePayload(v97, 0, 1, v107);
        (*v105)(v108, v96);
        if (__swift_getEnumTagSinglePayload(v97, 1, v107) == 1)
        {
          sub_25D196E70(v97, &qword_26A66F610);
        }
        else
        {
          v109 = *v106;
          uint64_t v110 = v188;
          (*v106)(v188, v97, v107);
          v109(v195, v110, v107);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v89 = OUTLINED_FUNCTION_15_54();
          }
          unint64_t v112 = *(void *)(v89 + 16);
          unint64_t v111 = *(void *)(v89 + 24);
          if (v112 >= v111 >> 1) {
            uint64_t v89 = OUTLINED_FUNCTION_21_46(v111);
          }
          OUTLINED_FUNCTION_8_62();
          v109(v113 + v114 * v112, v195, v196);
          uint64_t v96 = v192;
        }
        v104 += v189;
        --v101;
      }
      while (v101);
LABEL_30:
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
LABEL_57:
    uint64_t v89 = MEMORY[0x263F8EE78];
LABEL_69:
    OUTLINED_FUNCTION_12_33();
    v162();
    sub_25D196E70((uint64_t)v187, &qword_26A671A30);
    swift_bridgeObjectRelease();
    return v89;
  }
  if (v69 != *MEMORY[0x263F742C0])
  {
    if (v69 != *MEMORY[0x263F742D0])
    {
      if (v69 != *MEMORY[0x263F742D8])
      {
        if (qword_26A66E778 != -1) {
          swift_once();
        }
        uint64_t v164 = sub_25D53DC10();
        __swift_project_value_buffer(v164, (uint64_t)qword_26A688F10);
        v165 = (uint64_t)v175;
        v68(v175, (void (*)(void))v41, v32);
        v166 = sub_25D53DC00();
        os_log_type_t v167 = sub_25D53E7C0();
        if (os_log_type_enabled(v166, v167))
        {
          v168 = (_DWORD *)OUTLINED_FUNCTION_12_7();
          uint64_t v195 = OUTLINED_FUNCTION_30();
          uint64_t v196 = (uint64_t)v72;
          v198[0] = v195;
          _DWORD *v168 = 136315138;
          sub_25D4FD5B0(qword_26A674D50, MEMORY[0x263F742E0]);
          uint64_t v169 = sub_25D53F050();
          uint64_t v171 = sub_25D19E114(v169, v170, v198);
          OUTLINED_FUNCTION_13_7(v171);
          sub_25D53EA80();
          swift_bridgeObjectRelease();
          v172 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
          v172(v165, v70);
          OUTLINED_FUNCTION_16_45(&dword_25D16D000, v166, v173, "ReferenceResolution# Received unknown result type %s");
          swift_arrayDestroy();
          uint64_t v72 = (void *)v196;
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
        }
        else
        {

          v172 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
          v172(v165, v70);
        }
        v172((uint64_t)v41, v70);
        sub_25D196E70((uint64_t)v187, &qword_26A671A30);
        v172((uint64_t)v72, v70);
        return MEMORY[0x263F8EE78];
      }
      if (qword_26A66E778 != -1) {
        swift_once();
      }
      uint64_t v148 = sub_25D53DC10();
      v149 = (void *)OUTLINED_FUNCTION_84_0(v148, (uint64_t)qword_26A688F10);
      os_log_type_t v150 = sub_25D53E7B0();
      if (OUTLINED_FUNCTION_27_0(v150))
      {
        v151 = (_WORD *)OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_54_0(v151);
        OUTLINED_FUNCTION_24_1(&dword_25D16D000, v152, v153, "ReferenceResolution# No matches found");
        OUTLINED_FUNCTION_3_0();
      }

      goto LABEL_67;
    }
    uint64_t v125 = OUTLINED_FUNCTION_2_69();
    v126(v125);
    uint64_t v195 = *v39;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v127 = sub_25D53DC10();
    v128 = OUTLINED_FUNCTION_84_0(v127, (uint64_t)qword_26A688F10);
    os_log_type_t v129 = sub_25D53E7B0();
    BOOL v130 = os_log_type_enabled(v128, v129);
    uint64_t v131 = v186;
    if (v130)
    {
      v132 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)v132 = 0;
      _os_log_impl(&dword_25D16D000, v128, v129, "ReferenceResolution# Found plural ambiguous entities", v132, 2u);
      OUTLINED_FUNCTION_3_0();
    }
    v174 = (void (*)(void))v41;

    uint64_t v133 = v195;
    uint64_t v134 = *(void *)(v195 + 16);
    if (!v134) {
      goto LABEL_57;
    }
    uint64_t v178 = v32;
    uint64_t v194 = v193 + 16;
    v190 = (void (*)(uint64_t, unint64_t, uint64_t))(v193 + 8);
    v135 = (void (**)(void))(v191 + 32);
    swift_bridgeObjectRetain();
    uint64_t v136 = 0;
    uint64_t v89 = MEMORY[0x263F8EE78];
    uint64_t v137 = v196;
    while (1)
    {
      uint64_t v138 = *(void *)(v133 + 8 * v136 + 32);
      if (*(void *)(v138 + 16))
      {
        uint64_t v139 = v192;
        uint64_t v140 = v193;
        uint64_t v141 = v182;
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v193 + 16))(v182, v138 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80)), v192);
        swift_bridgeObjectRetain();
        sub_25D53DC30();
        v142 = *(void (**)(uint64_t, uint64_t))(v140 + 8);
        uint64_t v131 = v186;
        uint64_t v143 = v141;
        uint64_t v133 = v195;
        uint64_t v137 = v196;
        v142(v143, v139);
        __swift_storeEnumTagSinglePayload(v131, 0, 1, v137);
        swift_bridgeObjectRelease();
        if (__swift_getEnumTagSinglePayload(v131, 1, v137) != 1)
        {
          v144 = *v135;
          OUTLINED_FUNCTION_13_45();
          v144();
          OUTLINED_FUNCTION_13_45();
          v144();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v89 = OUTLINED_FUNCTION_15_54();
          }
          unint64_t v145 = *(void *)(v89 + 24);
          if (*(void *)(v89 + 16) >= v145 >> 1) {
            uint64_t v89 = OUTLINED_FUNCTION_21_46(v145);
          }
          OUTLINED_FUNCTION_8_62();
          uint64_t v137 = v196;
          OUTLINED_FUNCTION_13_45();
          v144();
          uint64_t v133 = v195;
          goto LABEL_55;
        }
      }
      else
      {
        __swift_storeEnumTagSinglePayload(v131, 1, 1, v137);
      }
      sub_25D196E70(v131, &qword_26A66F610);
LABEL_55:
      if (v134 == ++v136) {
        goto LABEL_30;
      }
    }
  }
  uint64_t v118 = OUTLINED_FUNCTION_2_69();
  v119(v118);
  uint64_t v120 = *v39;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v121 = sub_25D53DC10();
  __swift_project_value_buffer(v121, (uint64_t)qword_26A688F10);
  swift_bridgeObjectRetain();
  v122 = sub_25D53DC00();
  os_log_type_t v123 = sub_25D53E7B0();
  if (os_log_type_enabled(v122, v123))
  {
    v124 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v124 = 134217984;
    v198[0] = *(void *)(v120 + 16);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v122, v123, "ReferenceResolution# Found %ld candidates. Using the first one", v124, 0xCu);
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v146 = v192;
  uint64_t v147 = v178;
  sub_25D219114(v120, v178);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v147, 1, v146) != 1)
  {
    uint64_t v155 = v176;
    sub_25D53DC30();
    (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v147, v146);
    uint64_t v157 = v191 + 32;
    v156 = *(void (**)(char *, uint64_t, uint64_t))(v191 + 32);
    v158 = v177;
    uint64_t v159 = v155;
    uint64_t v160 = v196;
    v156(v177, v159, v196);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF48);
    unint64_t v161 = (*(unsigned __int8 *)(v157 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 48);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_25D541230;
    v156((char *)(v89 + v161), (uint64_t)v158, v160);
    (*(void (**)(void, uint64_t))(v67 + 8))(v71, v70);
LABEL_33:
    sub_25D196E70((uint64_t)v187, &qword_26A671A30);
    return v89;
  }
  sub_25D196E70(v147, &qword_26A670520);
LABEL_67:
  OUTLINED_FUNCTION_12_33();
  v154();
LABEL_13:
  sub_25D196E70((uint64_t)v187, &qword_26A671A30);
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25D4FBFDC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v40 = a2;
  if (!OUTLINED_FUNCTION_19_53(a1))
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25D53DC10();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_84_0(v16, (uint64_t)qword_26A688F10);
    os_log_type_t v18 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_27_0(v18))
    {
      uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v19);
      OUTLINED_FUNCTION_24_1(&dword_25D16D000, v20, v21, "#resolveSendRecipientFromRRaaS Intent is not an NLv4, no results");
      OUTLINED_FUNCTION_3_0();
    }

    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
  unint64_t v43 = MEMORY[0x263F8EE78];
  unint64_t v7 = sub_25D3E4E14();
  if (v7 >> 62) {
    uint64_t v8 = sub_25D53EEB0();
  }
  else {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v8)
  {
    uint64_t v23 = sub_25D3E2F40();
    if (v23)
    {
      uint64_t v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_25D541A10;
      *(void *)(v25 + 32) = v24;
      v42[0] = v25;
      sub_25D53E4E0();
      unint64_t v43 = v42[0];
    }
    goto LABEL_25;
  }
  unint64_t v9 = sub_25D3E4E14();
  unint64_t v10 = v9;
  if (!(v9 >> 62))
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_7;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
LABEL_24:
    unint64_t v43 = v15;
LABEL_25:
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25D53DC10();
    uint64_t v27 = OUTLINED_FUNCTION_84_0(v26, (uint64_t)qword_26A688F10);
    os_log_type_t v28 = sub_25D53E7B0();
    uint64_t v39 = a3;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v38 = v4;
      uint64_t v29 = swift_slowAlloc();
      v42[0] = OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_20_49(3.8521e-34);
      if (v43 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25D53EEB0();
        swift_bridgeObjectRelease();
      }
      OUTLINED_FUNCTION_26_41();
      sub_25D53EA80();
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v30 = sub_25D53BFC0();
      uint64_t v31 = swift_bridgeObjectRetain();
      uint64_t v32 = MEMORY[0x2611ABC30](v31, v30);
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_25D19E114(v32, v34, v42);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v27, v28, "#resolveSendRecipientFromRRaaS Found %ld entities to query RRaaS with: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      uint64_t v4 = v38;
    }
    else
    {
    }
    uint64_t v35 = OUTLINED_FUNCTION_27_37();
    unint64_t v36 = v43;
    MEMORY[0x270FA5388](v35);
    v37[2] = v40;
    v37[3] = v39;
    v37[4] = v4;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25D3B7288((void (*)(uint64_t *__return_ptr, uint64_t *))sub_25D4FD590, (uint64_t)v37, v36);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return v22;
  }
  uint64_t v11 = sub_25D53EEB0();
  if (!v11) {
    goto LABEL_23;
  }
LABEL_7:
  v42[0] = v6;
  uint64_t result = sub_25D53EDC0();
  if ((v11 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = v3;
    uint64_t v14 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](v14, v10);
      }
      else {
        swift_retain();
      }
      ++v14;
      sub_25D53B020();
      swift_release();
      sub_25D53EDA0();
      sub_25D53EDD0();
      sub_25D53EDE0();
      sub_25D53EDB0();
    }
    while (v11 != v14);
    uint64_t v15 = v42[0];
    swift_bridgeObjectRelease();
    uint64_t v4 = v13;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D4FC47C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v59 = a3;
  uint64_t v60 = a4;
  uint64_t v7 = OUTLINED_FUNCTION_19_53(a1);
  if (!v7)
  {
    OUTLINED_FUNCTION_58_2();
    if (!v15) {
      swift_once();
    }
    uint64_t v16 = sub_25D53DC10();
    uint64_t v17 = (void *)OUTLINED_FUNCTION_84_0(v16, (uint64_t)qword_26A688F10);
    os_log_type_t v18 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_27_0(v18))
    {
      uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v19);
      OUTLINED_FUNCTION_24_1(&dword_25D16D000, v20, v21, "#resolveReadPersonWithRRaaS Intent is not an NLv4, no results");
      OUTLINED_FUNCTION_3_0();
    }

    return MEMORY[0x263F8EE78];
  }
  uint64_t v8 = v7;
  uint64_t v9 = MEMORY[0x263F8EE78];
  unint64_t v64 = MEMORY[0x263F8EE78];
  if (a2)
  {
    unint64_t v10 = sub_25D3E4E14();
    unint64_t v11 = v10;
    if (v10 >> 62)
    {
      uint64_t v12 = sub_25D53EEB0();
      if (v12) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v12)
      {
LABEL_5:
        v63[0] = v9;
        sub_25D53EDC0();
        if ((v12 & 0x8000000000000000) == 0)
        {
          uint64_t v13 = 0;
          do
          {
            if ((v11 & 0xC000000000000001) != 0) {
              MEMORY[0x2611AC4C0](v13, v11);
            }
            else {
              swift_retain();
            }
            ++v13;
            sub_25D53B020();
            swift_release();
            sub_25D53EDA0();
            sub_25D53EDD0();
            sub_25D53EDE0();
            sub_25D53EDB0();
          }
          while (v12 != v13);
          unint64_t v14 = v63[0];
          swift_bridgeObjectRelease();
          uint64_t v5 = v4;
          goto LABEL_38;
        }
        __break(1u);
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v14 = MEMORY[0x263F8EE78];
LABEL_38:
    unint64_t v64 = v14;
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  if (sub_25D3E4E2C())
  {
    sub_25D53B020();
    swift_release();
    uint64_t v23 = swift_retain();
    MEMORY[0x2611ABBF0](v23);
    OUTLINED_FUNCTION_28_42();
    if (!v24)
    {
LABEL_19:
      sub_25D53E540();
      sub_25D53E4E0();
      swift_release();
      unint64_t v14 = v64;
      goto LABEL_21;
    }
LABEL_42:
    OUTLINED_FUNCTION_24_38();
    goto LABEL_19;
  }
  unint64_t v14 = v9;
LABEL_21:
  if (v14 >> 62)
  {
    OUTLINED_FUNCTION_25_37();
    uint64_t v36 = sub_25D53EEB0();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_46;
    }
  }
  else if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_46:
    if (v14 >> 62)
    {
      OUTLINED_FUNCTION_25_37();
      uint64_t v37 = sub_25D53EEB0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (!v37 && sub_25D3E2F40())
    {
      uint64_t v49 = swift_retain();
      MEMORY[0x2611ABBF0](v49);
      OUTLINED_FUNCTION_28_42();
      if (v24) {
        OUTLINED_FUNCTION_24_38();
      }
      sub_25D53E540();
      sub_25D53E4E0();
      OUTLINED_FUNCTION_58_2();
      if (!v15) {
        swift_once();
      }
      uint64_t v50 = sub_25D53DC10();
      __swift_project_value_buffer(v50, (uint64_t)qword_26A688F10);
      swift_retain_n();
      uint64_t v51 = sub_25D53DC00();
      os_log_type_t v52 = sub_25D53E7B0();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v58 = v5;
        uint64_t v53 = (uint8_t *)OUTLINED_FUNCTION_12_7();
        v63[0] = OUTLINED_FUNCTION_30();
        *(_DWORD *)uint64_t v53 = 136315138;
        id v57 = v53 + 4;
        sub_25D53BFC0();
        sub_25D4FD5B0((unint64_t *)&qword_26A6734A8, MEMORY[0x263F737A0]);
        uint64_t v54 = sub_25D53F050();
        uint64_t v62 = sub_25D19E114(v54, v55, v63);
        sub_25D53EA80();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25D16D000, v51, v52, "#resolveReadPersonWithRRaaS Agent entity not found, using intent entity: %s", v53, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        uint64_t v5 = v58;
        OUTLINED_FUNCTION_3_0();
        swift_release();
      }
      else
      {

        swift_release_n();
      }
    }
    OUTLINED_FUNCTION_58_2();
    if (!v15) {
      swift_once();
    }
    uint64_t v38 = sub_25D53DC10();
    uint64_t v39 = OUTLINED_FUNCTION_84_0(v38, (uint64_t)qword_26A688F10);
    os_log_type_t v40 = sub_25D53E7B0();
    if (os_log_type_enabled(v39, v40))
    {
      id v57 = (uint8_t *)v8;
      uint64_t v58 = v5;
      uint64_t v41 = swift_slowAlloc();
      v63[0] = OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_20_49(3.8521e-34);
      if (v64 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25D53EEB0();
        swift_bridgeObjectRelease();
      }
      OUTLINED_FUNCTION_26_41();
      sub_25D53EA80();
      *(_WORD *)(v41 + 12) = 2080;
      uint64_t v42 = sub_25D53BFC0();
      uint64_t v43 = swift_bridgeObjectRetain();
      uint64_t v44 = MEMORY[0x2611ABC30](v43, v42);
      unint64_t v46 = v45;
      swift_bridgeObjectRelease();
      uint64_t v61 = sub_25D19E114(v44, v46, v63);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v39, v40, "#resolveSendRecipientFromRRaaS Found %ld entities to query RRaaS with: %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      uint64_t v5 = v58;
    }
    else
    {
    }
    uint64_t v47 = OUTLINED_FUNCTION_27_37();
    unint64_t v48 = v64;
    MEMORY[0x270FA5388](v47);
    v56[2] = v59;
    v56[3] = v60;
    v56[4] = v5;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25D3B7288((void (*)(uint64_t *__return_ptr, uint64_t *))sub_25D4FD62C, (uint64_t)v56, v48);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return v22;
  }
  OUTLINED_FUNCTION_58_2();
  if (!v15) {
    swift_once();
  }
  uint64_t v25 = v5;
  uint64_t v26 = sub_25D53DC10();
  uint64_t v27 = OUTLINED_FUNCTION_84_0(v26, (uint64_t)qword_26A688F10);
  os_log_type_t v28 = sub_25D53E7B0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_25D16D000, v27, v28, "#resolveReadPersonWithRRaaS(rdar://75809822) Sender entity not found, trying send recipients", v29, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  unint64_t v30 = sub_25D3E4E14();
  unint64_t v31 = v30;
  if (!(v30 >> 62))
  {
    uint64_t v32 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v32) {
      goto LABEL_29;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    uint64_t v35 = MEMORY[0x263F8EE78];
LABEL_45:
    unint64_t v64 = v35;
    swift_bridgeObjectRelease();
    unint64_t v14 = v35;
    uint64_t v5 = v25;
    goto LABEL_46;
  }
  uint64_t v32 = sub_25D53EEB0();
  if (!v32) {
    goto LABEL_44;
  }
LABEL_29:
  v63[0] = v9;
  uint64_t result = sub_25D53EDC0();
  if ((v32 & 0x8000000000000000) == 0)
  {
    uint64_t v34 = 0;
    do
    {
      if ((v31 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](v34, v31);
      }
      else {
        swift_retain();
      }
      ++v34;
      sub_25D53B020();
      swift_release();
      sub_25D53EDA0();
      sub_25D53EDD0();
      sub_25D53EDE0();
      sub_25D53EDB0();
    }
    while (v32 != v34);
    uint64_t v35 = v63[0];
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D4FCCD8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, unint64_t, uint64_t))
{
  uint64_t v6 = sub_25D4FAD98(a1, a2, a3);
  uint64_t v7 = v6;
  if (*(void *)(v6 + 16))
  {
    MEMORY[0x270FA5388](v6);
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = v3;
    uint64_t v8 = sub_25D3B7488((void *(*)(uint64_t *__return_ptr, uint64_t))sub_25D4FD5F8, (uint64_t)v16, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25D53DC10();
    unint64_t v10 = (void *)OUTLINED_FUNCTION_84_0(v9, (uint64_t)qword_26A688F10);
    os_log_type_t v11 = sub_25D53E7A0();
    if (OUTLINED_FUNCTION_27_0(v11))
    {
      uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v12);
      OUTLINED_FUNCTION_24_1(&dword_25D16D000, v13, v14, "#resolveSendRecipientFromRRaaS Person entity not found");
      OUTLINED_FUNCTION_3_0();
    }

    return MEMORY[0x263F8EE78];
  }
  return v8;
}

void *sub_25D4FCE14()
{
  sub_25D2E8FF0();
  uint64_t v0 = (void *)sub_25D53DCA0();
  if (v0)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_25D53DC10();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A688F10);
    id v2 = v0;
    uint64_t v3 = sub_25D53DC00();
    os_log_type_t v4 = sub_25D53E7B0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 138412290;
      id v7 = v2;
      sub_25D53EA80();
      *uint64_t v6 = v0;

      _os_log_impl(&dword_25D16D000, v3, v4, "#convertEntityToPerson Using resolved person: %@", v5, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A672E50);
      swift_arrayDestroy();
      MEMORY[0x2611AD370](v6, -1, -1);
      MEMORY[0x2611AD370](v5, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25D53DC10();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A688F10);
    unint64_t v10 = sub_25D53DC00();
    os_log_type_t v11 = sub_25D53E7B0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25D16D000, v10, v11, "#convertEntityToPerson Conversion to INPerson returned nil", v12, 2u);
      MEMORY[0x2611AD370](v12, -1, -1);
    }

    return 0;
  }
  return v0;
}

void sub_25D4FD224(uint64_t *a1@<X0>, uint64_t a2@<X2>, void (*a3)(uint64_t, unint64_t, uint64_t)@<X3>, unint64_t *a4@<X8>)
{
  unint64_t v5 = sub_25D4FCCD8(*a1, a2, a3);
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25D53DC10();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A688F10);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  id v7 = sub_25D53DC00();
  os_log_type_t v8 = sub_25D53E7B0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_25D53BFC0();
    sub_25D4FD5B0((unint64_t *)&qword_26A6734A8, MEMORY[0x263F737A0]);
    uint64_t v11 = sub_25D53F050();
    sub_25D19E114(v11, v12, &v19);
    sub_25D53EA80();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    unint64_t v13 = sub_25D2E8FF0();
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = MEMORY[0x2611ABC30](v14, v13);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_25D19E114(v15, v17, &v19);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v7, v8, "#resolveSendRecipientFromRRaaS Entity %s is resolved to %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611AD370](v10, -1, -1);
    MEMORY[0x2611AD370](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25D53EEB0();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    unint64_t v5 = 0;
  }
LABEL_9:
  *a4 = v5;
}

uint64_t sub_25D4FD528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A671A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_25D4FD590(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  sub_25D4FD224(a1, *(void *)(v2 + 16), *(void (**)(uint64_t, unint64_t, uint64_t))(v2 + 24), a2);
}

uint64_t sub_25D4FD5B0(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_25D4FD5F8()
{
  OUTLINED_FUNCTION_22_43();
  uint64_t result = sub_25D4FCE14();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25D4FD62C()
{
  OUTLINED_FUNCTION_22_43();
  uint64_t result = sub_25D4FCCD8(*v1, v2, v3);
  *uint64_t v0 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_69()
{
  return v0;
}

void OUTLINED_FUNCTION_8_62()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_11_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_54()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25D1F3188(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_16_45(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_19_53(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_0(a1, v1);
  return sub_25D493264(v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_49(float a1)
{
  *uint64_t v1 = a1;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_21_46@<X0>(unint64_t a1@<X8>)
{
  return sub_25D1F3188(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_24_38()
{
  return sub_25D53E500();
}

uint64_t OUTLINED_FUNCTION_25_37()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_26_41()
{
  *(void *)(v1 - 152) = v0;
}

uint64_t OUTLINED_FUNCTION_27_37()
{
  return swift_beginAccess();
}

uint64_t sub_25D4FD82C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25D4FD838()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_25D4FD874(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25D4FD8AC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_25D4FD90C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for OrderedSet()
{
  return __swift_instantiateGenericMetadata();
}

void sub_25D4FD964(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return;
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_25D1F5AC8();
  uint64_t v3 = sub_25D53604C(a1);
  if (v3 < 0) {
    goto LABEL_32;
  }
  unint64_t v5 = v3;
  if (v3 >= 1 << *(unsigned char *)(a1 + 32)) {
    goto LABEL_32;
  }
  uint64_t v6 = a1 + 64;
  while ((*(void *)(v6 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
  {
    if (v4 != *(_DWORD *)(a1 + 36)) {
      goto LABEL_28;
    }
    uint64_t v34 = v4;
    id v7 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    sub_25D174EE4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v30);
    v29[0] = v9;
    v29[1] = v8;
    *(void *)&long long v27 = v9;
    *((void *)&v27 + 1) = v8;
    sub_25D174EE4((uint64_t)v30, (uint64_t)v28);
    long long v25 = v27;
    v26[0] = v28[0];
    v26[1] = v28[1];
    swift_bridgeObjectRetain_n();
    sub_25D1797C8((uint64_t)v29, &qword_26A674E30);
    long long v10 = v25;
    sub_25D174EE4((uint64_t)v26, (uint64_t)v24);
    if ((void)v10 == sub_25D53E200() && *((void *)&v10 + 1) == v11)
    {
      swift_bridgeObjectRelease();
LABEL_14:
      unint64_t v14 = sub_25D500058();
      uint64_t v15 = sub_25D53E9F0();
      unint64_t v23 = v14;
      *(void *)&long long v22 = v15;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
      sub_25D174ED4(&v22, v24);
      goto LABEL_15;
    }
    char v13 = sub_25D53F090();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_14;
    }
LABEL_15:
    sub_25D174ED4(v24, v32);
    long long v31 = v10;
    swift_bridgeObjectRetain();
    sub_25D1797C8((uint64_t)&v25, &qword_26A674E30);
    uint64_t v16 = v33;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25D1F5AC8();
      uint64_t v16 = v33;
    }
    unint64_t v17 = *(void *)(v16 + 16);
    if (v17 >= *(void *)(v16 + 24) >> 1)
    {
      sub_25D1F5AC8();
      uint64_t v16 = v33;
    }
    *(void *)(v16 + 16) = v17 + 1;
    uint64_t v18 = (_OWORD *)(v16 + 48 * v17);
    long long v19 = v31;
    long long v20 = v32[1];
    v18[3] = v32[0];
    v18[4] = v20;
    v18[2] = v19;
    if ((uint64_t)v5 >= -(-1 << *(unsigned char *)(a1 + 32))) {
      goto LABEL_29;
    }
    uint64_t v6 = a1 + 64;
    if ((*(void *)(a1 + 64 + 8 * (v5 >> 6)) & (1 << v5)) == 0) {
      goto LABEL_30;
    }
    if (v34 != *(_DWORD *)(a1 + 36)) {
      goto LABEL_31;
    }
    uint64_t v21 = sub_25D53EBC0();
    if (!--v1) {
      return;
    }
    unint64_t v5 = v21;
    if ((v21 & 0x8000000000000000) == 0)
    {
      uint64_t v4 = *(unsigned int *)(a1 + 36);
      if (v21 < 1 << *(unsigned char *)(a1 + 32)) {
        continue;
      }
    }
    goto LABEL_32;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
}

uint64_t sub_25D4FDC90(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25D53EEB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A674DD8);
    uint64_t v5 = sub_25D53EEE0();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE80];
  }
  uint64_t v8 = v5;
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  sub_25D4FF904(v6, a2, 1, &v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25D4FDD88(uint64_t a1)
{
  return sub_25D4FDDA8(a1, &qword_26A674DF0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_25D4FFD0C);
}

uint64_t sub_25D4FDDA8(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v4 = sub_25D53EEE0();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE80];
  }
  uint64_t v7 = v4;
  uint64_t v5 = swift_bridgeObjectRetain();
  a3(v5, 1, &v7);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_25D4FDE48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v51 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672C10);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_36();
  uint64_t v49 = v5 - v4;
  uint64_t v6 = sub_25D53D630();
  OUTLINED_FUNCTION_9_0();
  uint64_t v48 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v48 - v12;
  uint64_t v14 = sub_25D53A650();
  OUTLINED_FUNCTION_9_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_36();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_25D53A630();
  OUTLINED_FUNCTION_9_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_36();
  uint64_t v27 = v26 - v25;
  os_log_type_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  uint64_t v50 = v2;
  v28(v20, v2, v14);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v20, v14) != *MEMORY[0x263F6FF70])
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
    goto LABEL_5;
  }
  uint64_t v29 = v48;
  (*(void (**)(uint64_t, uint64_t))(v16 + 96))(v20, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v27, v20, v21);
  uint64_t v30 = v49;
  sub_25D4AF5E4(v27, v49);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v21);
  uint64_t v31 = type metadata accessor for DirectInvocationUseCases();
  if (__swift_getEnumTagSinglePayload(v30, 1, v31) == 1)
  {
    sub_25D1797C8(v30, (uint64_t *)&unk_26A672C10);
LABEL_5:
    uint64_t v32 = v51;
    sub_25D492A08();
    if (v53)
    {
      sub_25D188958(&v52, (uint64_t)v54);
      uint64_t v33 = v55;
      uint64_t v34 = v56;
      __swift_project_boxed_opaque_existential_0(v54, v55);
      (*(void (**)(uint64_t, uint64_t))(v34 + 280))(v33, v34);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v54);
    }
    sub_25D1797C8((uint64_t)&v52, &qword_26A672C20);
    uint64_t v36 = *MEMORY[0x263F6F758];
    sub_25D539340();
    OUTLINED_FUNCTION_37();
    uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t))(v37 + 104);
    uint64_t v39 = v32;
    goto LABEL_15;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_25D284AD4(v30);
    goto LABEL_5;
  }
  os_log_type_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 32);
  v40(v13, v30, v6);
  v40(v11, (uint64_t)v13, v6);
  int v41 = (*(uint64_t (**)(char *, uint64_t))(v29 + 88))(v11, v6);
  if (v41 == *MEMORY[0x263F70F90])
  {
    uint64_t v42 = (unsigned int *)MEMORY[0x263F6F770];
LABEL_14:
    uint64_t v36 = *v42;
    sub_25D539340();
    OUTLINED_FUNCTION_37();
    uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t))(v44 + 104);
    uint64_t v39 = v51;
LABEL_15:
    uint64_t v45 = v36;
    return v38(v39, v45);
  }
  int v43 = v41;
  if (v41 == *MEMORY[0x263F70F98])
  {
    uint64_t v42 = (unsigned int *)MEMORY[0x263F6F760];
    goto LABEL_14;
  }
  int v46 = *MEMORY[0x263F70F80];
  sub_25D539340();
  OUTLINED_FUNCTION_37();
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 104);
  uint64_t v39 = v51;
  if (v43 != v46)
  {
    v38(v51, *MEMORY[0x263F6F758]);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v11, v6);
  }
  uint64_t v45 = *MEMORY[0x263F6F768];
  return v38(v39, v45);
}

uint64_t Parse.DirectInvocation.description.getter()
{
  sub_25D53ED20();
  sub_25D53E360();
  sub_25D53A610();
  sub_25D53E360();
  swift_bridgeObjectRelease();
  sub_25D53E360();
  uint64_t v0 = sub_25D53A620();
  if (v0)
  {
    sub_25D4FD964(v0);
    uint64_t v2 = v1;
    swift_bridgeObjectRelease();
    sub_25D4FDDA8(v2, &qword_26A674E20, (void (*)(uint64_t, uint64_t, uint64_t *))sub_25D4FF618);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A673AD8);
  sub_25D53E270();
  sub_25D53E360();
  swift_bridgeObjectRelease();
  sub_25D53E360();
  return 0;
}

unint64_t sub_25D4FE434(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  sub_25D53F1A0();
  sub_25D53F1C0();
  if ((a2 & 1) == 0) {
    sub_25D53F1B0();
  }
  sub_25D53F1E0();
  unint64_t result = sub_25D53EBD0();
  *(void *)((char *)a4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
  uint64_t v9 = a4[6] + 16 * result;
  *(void *)uint64_t v9 = a1;
  *(unsigned char *)(v9 + 8) = a2 & 1;
  *(void *)(a4[7] + 8 * result) = a3;
  ++a4[2];
  return result;
}

void sub_25D4FE518(uint64_t a1, char a2)
{
  uint64_t v5 = v2;
  OUTLINED_FUNCTION_1_54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674E20);
  OUTLINED_FUNCTION_17_42();
  OUTLINED_FUNCTION_22_44();
  if (v7)
  {
    os_log_type_t v28 = v3 + 8;
    OUTLINED_FUNCTION_19_54();
    uint64_t v10 = v9 & v8;
    int64_t v27 = (unint64_t)(v11 + 63) >> 6;
    swift_retain();
    int64_t v12 = 0;
    if (!v10) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_12_60();
    while (1)
    {
      uint64_t v16 = (_OWORD *)(v3[7] + 32 * v13);
      if (a2)
      {
        sub_25D174ED4(v16, v29);
      }
      else
      {
        sub_25D174EE4((uint64_t)v16, (uint64_t)v29);
        swift_bridgeObjectRetain();
      }
      sub_25D53F1A0();
      sub_25D53E2F0();
      sub_25D53F1E0();
      OUTLINED_FUNCTION_2_70();
      if (v17)
      {
        OUTLINED_FUNCTION_45_16();
        while (1)
        {
          OUTLINED_FUNCTION_21_47();
          if (v17)
          {
            if (v19) {
              break;
            }
          }
          OUTLINED_FUNCTION_14_51();
          if (!v17)
          {
            OUTLINED_FUNCTION_43_18();
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_47_13();
LABEL_27:
      OUTLINED_FUNCTION_3_72(v18);
      sub_25D174ED4(v29, (_OWORD *)(v21 + 32 * v20));
      OUTLINED_FUNCTION_9_54();
      if (v10) {
        goto LABEL_3;
      }
LABEL_4:
      int64_t v14 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_36;
      }
      if (v14 >= v27) {
        goto LABEL_29;
      }
      ++v12;
      if (!v28[v14])
      {
        int64_t v12 = v14 + 1;
        if (v14 + 1 >= v27) {
          goto LABEL_29;
        }
        if (!v28[v12])
        {
          int64_t v15 = v14 + 2;
          if (v15 >= v27)
          {
LABEL_29:
            swift_release();
            uint64_t v5 = v2;
            if (a2)
            {
              OUTLINED_FUNCTION_7_57();
              if (v23 != v24)
              {
                *os_log_type_t v28 = -1 << v22;
              }
              else
              {
                uint64_t v25 = OUTLINED_FUNCTION_13_46();
                sub_25D3BF9D0(v25, v26, v28);
              }
              v3[2] = 0;
            }
            break;
          }
          if (!v28[v15])
          {
            while (1)
            {
              int64_t v12 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_37;
              }
              if (v12 >= v27) {
                goto LABEL_29;
              }
              ++v15;
              if (v28[v12]) {
                goto LABEL_15;
              }
            }
          }
          int64_t v12 = v15;
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_16_46();
    }
  }
  swift_release();
  *uint64_t v5 = v4;
}

uint64_t sub_25D4FE738(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674DD8);
  char v38 = a2;
  uint64_t v6 = sub_25D53EED0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    char v23 = *(void **)(*(void *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v24 = v23;
    }
    sub_25D53F1A0();
    sub_25D53E2F0();
    uint64_t result = sub_25D53F1E0();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) == 0)
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
        uint64_t v32 = *(void *)(v11 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t v33 = (void *)(*(void *)(v7 + 48) + 16 * v28);
    *uint64_t v33 = v22;
    v33[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v28) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v36)
    {
      swift_release();
      uint64_t v3 = v35;
      char v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v37 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v37 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v36)
  {
    unint64_t v18 = *(void *)(v37 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v36) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v37 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v35;
LABEL_34:
  if (v38)
  {
    uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
    if (v34 >= 64) {
      sub_25D3BF9D0(0, (unint64_t)(v34 + 63) >> 6, v17);
    }
    else {
      *char v17 = -1 << v34;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25D4FEA38(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674DF0);
  char v40 = a2;
  uint64_t v6 = sub_25D53EED0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
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
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    char v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25D53F1A0();
    sub_25D53E2F0();
    uint64_t result = sub_25D53F1E0();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
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
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v7 + 48) + 16 * v29);
    *uint64_t v34 = v22;
    v34[1] = v21;
    uint64_t v35 = (void *)(*(void *)(v7 + 56) + 16 * v29);
    *uint64_t v35 = v24;
    v35[1] = v25;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v38)
    {
      swift_release();
      uint64_t v3 = v37;
      char v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v39 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v38) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v39 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v38)
  {
    unint64_t v18 = *(void *)(v39 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v38) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v39 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v37;
LABEL_34:
  if (v40)
  {
    uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
    if (v36 >= 64) {
      sub_25D3BF9D0(0, (unint64_t)(v36 + 63) >> 6, v17);
    }
    else {
      *char v17 = -1 << v36;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_25D4FED48(uint64_t a1, uint64_t a2)
{
}

void sub_25D4FED54(uint64_t a1, uint64_t a2)
{
}

void sub_25D4FED60(uint64_t a1, char a2)
{
  uint64_t v5 = v2;
  OUTLINED_FUNCTION_1_54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674E08);
  OUTLINED_FUNCTION_17_42();
  OUTLINED_FUNCTION_22_44();
  if (v7)
  {
    int64_t v8 = 0;
    uint64_t v9 = *(void *)(v3 + 64);
    uint64_t v29 = v3 + 64;
    uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    uint64_t v12 = v11 & v9;
    int64_t v28 = (unint64_t)(v10 + 63) >> 6;
    if ((v11 & v9) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    OUTLINED_FUNCTION_12_60();
    while (1)
    {
      uint64_t v16 = *(void *)(*(void *)(v3 + 48) + 8 * v13);
      uint64_t v17 = *(void *)(*(void *)(v3 + 56) + 8 * v13);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25D53F1A0();
      sub_25D53F1B0();
      sub_25D53F1E0();
      OUTLINED_FUNCTION_2_70();
      if (v18)
      {
        OUTLINED_FUNCTION_45_16();
        while (1)
        {
          OUTLINED_FUNCTION_21_47();
          if (v18)
          {
            if (v20) {
              break;
            }
          }
          OUTLINED_FUNCTION_14_51();
          if (!v18)
          {
            OUTLINED_FUNCTION_43_18();
            goto LABEL_29;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_47_13();
LABEL_29:
      *(void *)(v4 + 64 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(void *)(*(void *)(v4 + 48) + 8 * v19) = v16;
      *(void *)(*(void *)(v4 + 56) + 8 * v19) = v17;
      OUTLINED_FUNCTION_9_54();
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v28) {
        goto LABEL_31;
      }
      ++v8;
      if (!*(void *)(v29 + 8 * v14))
      {
        int64_t v8 = v14 + 1;
        if (v14 + 1 >= v28) {
          goto LABEL_31;
        }
        if (!*(void *)(v29 + 8 * v8))
        {
          int64_t v15 = v14 + 2;
          if (v15 >= v28)
          {
LABEL_31:
            if ((a2 & 1) == 0)
            {
              swift_release();
              uint64_t v5 = v2;
              goto LABEL_38;
            }
            OUTLINED_FUNCTION_7_57();
            if (v23 != v24)
            {
              *uint64_t v21 = -1 << v22;
            }
            else
            {
              uint64_t v25 = OUTLINED_FUNCTION_13_46();
              sub_25D3BF9D0(v25, v26, v27);
            }
            uint64_t v5 = v2;
            *(void *)(v3 + 16) = 0;
            break;
          }
          if (!*(void *)(v29 + 8 * v15))
          {
            while (1)
            {
              int64_t v8 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_41;
              }
              if (v8 >= v28) {
                goto LABEL_31;
              }
              ++v15;
              if (*(void *)(v29 + 8 * v8)) {
                goto LABEL_18;
              }
            }
          }
          int64_t v8 = v15;
        }
      }
LABEL_18:
      OUTLINED_FUNCTION_16_46();
    }
  }
  swift_release();
LABEL_38:
  *uint64_t v5 = v4;
}

unint64_t sub_25D4FEF84(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_1_54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674E00);
  uint64_t v6 = (void *)sub_25D53EED0();
  if (*(void *)(v3 + 16))
  {
    uint64_t v26 = v4;
    uint64_t v7 = 1 << *(unsigned char *)(v3 + 32);
    int64_t v8 = (void *)(v3 + 64);
    uint64_t v9 = -1;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    unint64_t v10 = v9 & *(void *)(v3 + 64);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = *(void *)(v3 + 48) + 16 * i;
      uint64_t v20 = *(void *)v19;
      char v21 = *(unsigned char *)(v19 + 8);
      uint64_t v22 = *(void *)(*(void *)(v3 + 56) + 8 * i);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      unint64_t result = sub_25D4FE434(v20, v21, v22, v6);
      if (v10) {
        goto LABEL_5;
      }
LABEL_6:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v16 >= v11) {
        goto LABEL_22;
      }
      unint64_t v17 = v8[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v11) {
          goto LABEL_22;
        }
        unint64_t v17 = v8[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v11)
          {
LABEL_22:
            swift_release();
            uint64_t v4 = v26;
            if (a2)
            {
              uint64_t v23 = 1 << *(unsigned char *)(v3 + 32);
              if (v23 > 63)
              {
                uint64_t v24 = OUTLINED_FUNCTION_13_46();
                sub_25D3BF9D0(v24, v25, (void *)(v3 + 64));
              }
              else
              {
                *int64_t v8 = -1 << v23;
              }
              *(void *)(v3 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v8[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_29;
              }
              if (v13 >= v11) {
                goto LABEL_22;
              }
              unint64_t v17 = v8[v13];
              ++v18;
              if (v17) {
                goto LABEL_17;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_17:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  unint64_t result = swift_release();
  *uint64_t v4 = v6;
  return result;
}

void sub_25D4FF170(uint64_t a1, uint64_t a2)
{
}

void sub_25D4FF17C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_1_54();
  __swift_instantiateConcreteTypeFromMangledName(v6);
  OUTLINED_FUNCTION_11_50();
  OUTLINED_FUNCTION_22_44();
  if (!v7) {
    goto LABEL_40;
  }
  uint64_t v34 = v2;
  OUTLINED_FUNCTION_10_52();
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = a2 + 64;
  swift_retain();
  int64_t v13 = 0;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(v3[6] + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(v3[7] + 8 * i);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25D53F1A0();
    sub_25D53E2F0();
    unint64_t v24 = sub_25D53F1E0() & ~(-1 << *(unsigned char *)(a2 + 32));
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) == 0)
    {
      OUTLINED_FUNCTION_45_16();
      while (1)
      {
        OUTLINED_FUNCTION_21_47();
        if (v29)
        {
          if (v26) {
            break;
          }
        }
        if (v27 == v28) {
          uint64_t v27 = 0;
        }
        if (*(void *)(v12 + 8 * v27) != -1)
        {
          OUTLINED_FUNCTION_43_18();
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_47_13();
LABEL_31:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    char v30 = (void *)(*(void *)(a2 + 48) + 16 * v25);
    *char v30 = v22;
    v30[1] = v21;
    *(void *)(*(void *)(a2 + 56) + 8 * v25) = v23;
    OUTLINED_FUNCTION_9_54();
    if (v11) {
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
      uint64_t v4 = v34;
      unint64_t v17 = v36;
      goto LABEL_35;
    }
    unint64_t v17 = v36;
    unint64_t v18 = v36[v16];
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v18 = v36[v13];
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v11 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v35)
  {
    unint64_t v18 = v36[v19];
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
        unint64_t v18 = v36[v13];
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
  uint64_t v4 = v34;
LABEL_35:
  if (v37)
  {
    OUTLINED_FUNCTION_7_57();
    if (v32 != v33) {
      *unint64_t v17 = -1 << v31;
    }
    else {
      OUTLINED_FUNCTION_18_45(v31);
    }
    v3[2] = 0;
  }
LABEL_40:
  swift_release();
  *uint64_t v4 = a2;
}

void sub_25D4FF3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  OUTLINED_FUNCTION_1_54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674E28);
  OUTLINED_FUNCTION_11_50();
  OUTLINED_FUNCTION_22_44();
  if (!v6) {
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_10_52();
  OUTLINED_FUNCTION_19_54();
  unint64_t v9 = v8 & v7;
  uint64_t v27 = v2;
  int64_t v28 = (unint64_t)(v10 + 63) >> 6;
  swift_retain();
  int64_t v11 = 0;
  if (!v9) {
    goto LABEL_4;
  }
LABEL_3:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v11 << 6))
  {
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * i);
    if ((v30 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25D53F1A0();
    sub_25D53E2F0();
    sub_25D53F1E0();
    OUTLINED_FUNCTION_2_70();
    if (v19)
    {
      OUTLINED_FUNCTION_45_16();
      while (1)
      {
        OUTLINED_FUNCTION_21_47();
        if (v19)
        {
          if (v21) {
            break;
          }
        }
        OUTLINED_FUNCTION_14_51();
        if (!v19)
        {
          OUTLINED_FUNCTION_43_18();
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_47_13();
LABEL_26:
    OUTLINED_FUNCTION_3_72(v20);
    *(void *)(v23 + 8 * v22) = v18;
    OUTLINED_FUNCTION_9_54();
    if (v9) {
      goto LABEL_3;
    }
LABEL_4:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_37;
    }
    if (v14 >= v28)
    {
      swift_release();
      uint64_t v4 = v27;
      int64_t v15 = v29;
      goto LABEL_30;
    }
    int64_t v15 = v29;
    unint64_t v16 = v29[v14];
    ++v11;
    if (!v16)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v16 = v29[v11];
      if (!v16) {
        break;
      }
    }
LABEL_15:
    unint64_t v9 = (v16 - 1) & v16;
  }
  int64_t v17 = v14 + 2;
  if (v17 < v28)
  {
    unint64_t v16 = v29[v17];
    if (!v16)
    {
      while (1)
      {
        int64_t v11 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_38;
        }
        if (v11 >= v28) {
          goto LABEL_28;
        }
        unint64_t v16 = v29[v11];
        ++v17;
        if (v16) {
          goto LABEL_15;
        }
      }
    }
    int64_t v11 = v17;
    goto LABEL_15;
  }
LABEL_28:
  swift_release();
  uint64_t v4 = v27;
LABEL_30:
  if (v30)
  {
    OUTLINED_FUNCTION_7_57();
    if (v25 != v26) {
      *int64_t v15 = -1 << v24;
    }
    else {
      OUTLINED_FUNCTION_18_45(v24);
    }
    *(void *)(v3 + 16) = 0;
  }
LABEL_35:
  swift_release();
  *uint64_t v4 = a2;
}

void sub_25D4FF618(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_25D4FFFF0(v6, (uint64_t)&v28);
    uint64_t v7 = v28;
    uint64_t v8 = v29;
    uint64_t v26 = v28;
    uint64_t v27 = v29;
    sub_25D174ED4(&v30, v25);
    unint64_t v9 = (void *)*a3;
    unint64_t v11 = sub_25D222ED4();
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_25D53F110();
      __break(1u);
      goto LABEL_20;
    }
    char v15 = v10;
    if (v9[3] < v14) {
      break;
    }
    if (a2)
    {
      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6714A8);
      sub_25D53EE50();
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    char v19 = (void *)(v18[6] + 16 * v11);
    *char v19 = v7;
    v19[1] = v8;
    sub_25D174ED4(v25, (_OWORD *)(v18[7] + 32 * v11));
    uint64_t v20 = v18[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_18;
    }
    v18[2] = v22;
    v6 += 48;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_25D4FE518(v14, a2 & 1);
  unint64_t v16 = sub_25D222ED4();
  if ((v15 & 1) != (v17 & 1)) {
    goto LABEL_19;
  }
  unint64_t v11 = v16;
  if ((v15 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v23 = (void *)swift_allocError();
  swift_willThrow();
  id v31 = v23;
  id v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_25D53ED20();
  sub_25D53E360();
  sub_25D53EE30();
  sub_25D53E360();
  sub_25D53EE80();
  __break(1u);
}

void sub_25D4FF904(void *a1, unint64_t a2, char a3, void *a4)
{
  uint64_t v4 = (char *)a2;
  uint64_t v5 = a1;
  uint64_t v6 = (void *)a1[2];
  if (v6)
  {
    uint64_t v10 = a1[4];
    uint64_t v9 = a1[5];
    if (a2 >> 62) {
      goto LABEL_28;
    }
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    while (v11)
    {
      uint64_t v12 = v4;
      uint64_t v4 = 0;
      uint64_t v34 = v5;
      unint64_t v35 = (unint64_t)v12 & 0xC000000000000001;
      id v31 = v12;
      long long v30 = v12 + 32;
      uint64_t v13 = v11 - 1;
      uint64_t v14 = v5 + 7;
      uint64_t v32 = v13;
      char v33 = (char *)v6 - 1;
      while (1)
      {
        id v15 = v35 ? (id)MEMORY[0x2611AC4C0](v4, v31) : *(id *)&v30[8 * (void)v4];
        uint64_t v36 = v15;
        uint64_t v6 = (void *)*a4;
        unint64_t v17 = sub_25D222ED4();
        uint64_t v18 = v6[2];
        BOOL v19 = (v16 & 1) == 0;
        uint64_t v20 = v18 + v19;
        if (__OFADD__(v18, v19)) {
          break;
        }
        uint64_t v5 = v16;
        if (v6[3] >= v20)
        {
          if (a3)
          {
            if (v16) {
              goto LABEL_21;
            }
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A674DE0);
            uint64_t v6 = a4;
            sub_25D53EE50();
            if (v5)
            {
LABEL_21:
              uint64_t v28 = (void *)swift_allocError();
              swift_willThrow();
              id v29 = v28;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
              if ((swift_dynamicCast() & 1) == 0)
              {
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();

                return;
              }
              goto LABEL_32;
            }
          }
        }
        else
        {
          sub_25D4FE738(v20, a3 & 1);
          uint64_t v6 = (void *)*a4;
          unint64_t v21 = sub_25D222ED4();
          if ((v5 & 1) != (v22 & 1))
          {
            sub_25D53F110();
            __break(1u);
LABEL_32:
            sub_25D53ED20();
            sub_25D53E360();
            sub_25D53EE30();
            sub_25D53E360();
            sub_25D53EE80();
            __break(1u);
            return;
          }
          unint64_t v17 = v21;
          if (v5) {
            goto LABEL_21;
          }
        }
        uint64_t v23 = (void *)*a4;
        *(void *)(*a4 + 8 * (v17 >> 6) + 64) |= 1 << v17;
        id v24 = (void *)(v23[6] + 16 * v17);
        *id v24 = v10;
        v24[1] = v9;
        *(void *)(v23[7] + 8 * v17) = v36;
        uint64_t v25 = v23[2];
        BOOL v26 = __OFADD__(v25, 1);
        uint64_t v27 = v25 + 1;
        if (v26) {
          goto LABEL_26;
        }
        v23[2] = v27;
        if (v33 == v4) {
          goto LABEL_24;
        }
        uint64_t v6 = v34;
        if ((unint64_t)(v4 + 1) >= v34[2]) {
          goto LABEL_27;
        }
        if ((char *)v32 == v4)
        {
LABEL_24:
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          return;
        }
        uint64_t v10 = *(v14 - 1);
        uint64_t v9 = *v14;
        swift_bridgeObjectRetain();
        v14 += 2;
        ++v4;
        a3 = 1;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25D53EEB0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

void sub_25D4FFD0C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v5 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    uint64_t v7 = *(v5 - 3);
    uint64_t v6 = *(v5 - 2);
    uint64_t v9 = *(v5 - 1);
    uint64_t v8 = *v5;
    uint64_t v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_25D222ED4();
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_25D53F110();
      __break(1u);
      goto LABEL_20;
    }
    char v16 = v11;
    if (v10[3] < v15) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A674DF8);
      sub_25D53EE50();
      if (v16) {
        goto LABEL_14;
      }
    }
LABEL_10:
    BOOL v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v20 = (void *)(v19[6] + 16 * v12);
    *uint64_t v20 = v7;
    v20[1] = v6;
    unint64_t v21 = (void *)(v19[7] + 16 * v12);
    *unint64_t v21 = v9;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_18;
    }
    v5 += 4;
    v19[2] = v24;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_25D4FEA38(v15, a2 & 1);
  unint64_t v17 = sub_25D222ED4();
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v25 = (void *)swift_allocError();
  swift_willThrow();
  id v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_25D53ED20();
  sub_25D53E360();
  sub_25D53EE30();
  sub_25D53E360();
  sub_25D53EE80();
  __break(1u);
}

uint64_t sub_25D4FFFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6700D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D500058()
{
  unint64_t result = qword_26A674E38;
  if (!qword_26A674E38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A674E38);
  }
  return result;
}

void OUTLINED_FUNCTION_3_72(unint64_t a1@<X8>)
{
  *(void *)(v4 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  uint64_t v5 = (void *)(*(void *)(v1 + 48) + 16 * a1);
  *uint64_t v5 = v3;
  v5[1] = v2;
}

void OUTLINED_FUNCTION_9_54()
{
  ++*(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_11_50()
{
  return sub_25D53EED0();
}

uint64_t OUTLINED_FUNCTION_13_46()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17_42()
{
  return sub_25D53EED0();
}

uint64_t OUTLINED_FUNCTION_18_45@<X0>(uint64_t a1@<X8>)
{
  return sub_25D3BF9D0(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t OUTLINED_FUNCTION_20_50(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0588](v2, a2, 22, 1, 489);
}

uint64_t type metadata accessor for GatekeeperCATPatternsExecutor(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674E40);
}

uint64_t sub_25D500264()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25D5002A4(uint64_t (*a1)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v39 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  char v16 = (char *)&v39 - v15;
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v39 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F250);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_25D544650;
  uint64_t v20 = (uint64_t *)(v19 + 48);
  *(void *)(v19 + 32) = 0xD000000000000012;
  *(void *)(v19 + 40) = 0x800000025D55D130;
  sub_25D1A32D8(v1, (uint64_t)v18, (uint64_t *)&unk_26A6719E0);
  uint64_t v21 = sub_25D53D0A0();
  OUTLINED_FUNCTION_1_23((uint64_t)v18);
  if (v22)
  {
    sub_25D18BD64((uint64_t)v18, (uint64_t *)&unk_26A6719E0);
    *(_OWORD *)uint64_t v20 = 0u;
    *(_OWORD *)(v19 + 64) = 0u;
  }
  else
  {
    *(void *)(v19 + 72) = v21;
    __swift_allocate_boxed_opaque_existential_0(v20);
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_30_4();
    v23();
  }
  OUTLINED_FUNCTION_35_3();
  *(void *)(v19 + 80) = v24;
  *(void *)(v19 + 88) = v25;
  uint64_t v26 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v19 + 96) = 0;
  *(void *)(v19 + 120) = v26;
  *(void *)(v19 + 128) = 0xD000000000000018;
  *(void *)(v19 + 136) = 0x800000025D55D150;
  uint64_t v27 = (int *)a1(0);
  sub_25D1A32D8(v1 + v27[5], (uint64_t)v16, (uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_1_23((uint64_t)v16);
  if (v22)
  {
    sub_25D18BD64((uint64_t)v16, (uint64_t *)&unk_26A6719E0);
    *(_OWORD *)(v19 + 144) = 0u;
    *(_OWORD *)(v19 + 160) = 0u;
  }
  else
  {
    *(void *)(v19 + 168) = v21;
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v19 + 144));
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_30_4();
    v28();
  }
  OUTLINED_FUNCTION_35_3();
  *(void *)(v19 + 176) = v29;
  *(void *)(v19 + 184) = v30;
  sub_25D1A32D8(v1 + v27[6], (uint64_t)v13, (uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_1_23((uint64_t)v13);
  if (v22)
  {
    sub_25D18BD64((uint64_t)v13, (uint64_t *)&unk_26A6719E0);
    *(_OWORD *)(v19 + 192) = 0u;
    *(_OWORD *)(v19 + 208) = 0u;
  }
  else
  {
    *(void *)(v19 + 216) = v21;
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v19 + 192));
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_30_4();
    v31();
  }
  OUTLINED_FUNCTION_35_3();
  *(void *)(v19 + 224) = v32;
  *(void *)(v19 + 232) = v33;
  sub_25D1A32D8(v1 + v27[7], (uint64_t)v10, (uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_1_23((uint64_t)v10);
  if (v22)
  {
    sub_25D18BD64((uint64_t)v10, (uint64_t *)&unk_26A6719E0);
    *(_OWORD *)(v19 + 240) = 0u;
    *(_OWORD *)(v19 + 256) = 0u;
  }
  else
  {
    *(void *)(v19 + 264) = v21;
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v19 + 240));
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_30_4();
    v34();
  }
  OUTLINED_FUNCTION_35_3();
  *(void *)(v19 + 272) = v35;
  *(void *)(v19 + 280) = v36;
  sub_25D1A32D8(v1 + v27[8], (uint64_t)v7, (uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_1_23((uint64_t)v7);
  if (v22)
  {
    sub_25D18BD64((uint64_t)v7, (uint64_t *)&unk_26A6719E0);
    *(_OWORD *)(v19 + 288) = 0u;
    *(_OWORD *)(v19 + 304) = 0u;
  }
  else
  {
    *(void *)(v19 + 312) = v21;
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v19 + 288));
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_30_4();
    v37();
  }
  return v19;
}

uint64_t sub_25D5006E4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_38_31(v1, v2);
  uint64_t v4 = type metadata accessor for GatekeeperReadSendCallParameters(v3);
  *(void *)(v0 + 40) = v4;
  OUTLINED_FUNCTION_17_0(v4);
  *(void *)(v0 + 48) = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D500768()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = OUTLINED_FUNCTION_37_34();
  OUTLINED_FUNCTION_1_55(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25D50081C;
  uint64_t v3 = OUTLINED_FUNCTION_24_39();
  return v4(v3);
}

uint64_t sub_25D50081C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D5008FC()
{
  uint64_t v1 = sub_25D5002A4(type metadata accessor for GatekeeperReadSendCallParameters);
  *(void *)(v0 + 72) = v1;
  uint64_t v2 = (void *)OUTLINED_FUNCTION_32_4();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25D5009D4;
  return v4(0xD000000000000017, 0x800000025D55D200, v1);
}

uint64_t sub_25D5009D4()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 96) = v3;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D500AEC()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperReadSendCallParameters);
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_52_8();
  return v2(v1);
}

uint64_t sub_25D500B64()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperReadSendCallParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D500BE0()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperReadSendCallParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D500C5C()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_38_31(v1, v2);
  uint64_t v4 = type metadata accessor for GatekeeperSendCallParameters(v3);
  *(void *)(v0 + 40) = v4;
  OUTLINED_FUNCTION_17_0(v4);
  *(void *)(v0 + 48) = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D500CE0()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = OUTLINED_FUNCTION_37_34();
  OUTLINED_FUNCTION_1_55(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25D500D94;
  uint64_t v3 = OUTLINED_FUNCTION_24_39();
  return v4(v3);
}

uint64_t sub_25D500D94()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D500E74()
{
  *(void *)(v0 + 72) = sub_25D5002A4(type metadata accessor for GatekeeperSendCallParameters);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_32_4();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D500F34;
  unint64_t v2 = OUTLINED_FUNCTION_30_41();
  return v3(v2);
}

uint64_t sub_25D500F34()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 96) = v3;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D50104C()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendCallParameters);
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_52_8();
  return v2(v1);
}

uint64_t sub_25D5010C4()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendCallParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D501140()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendCallParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D5011BC()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_38_31(v1, v2);
  uint64_t Parameters = type metadata accessor for GatekeeperSendReadParameters(v3);
  *(void *)(v0 + 40) = Parameters;
  OUTLINED_FUNCTION_17_0(Parameters);
  *(void *)(v0 + 48) = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D501240()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = OUTLINED_FUNCTION_37_34();
  OUTLINED_FUNCTION_1_55(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25D5012F4;
  uint64_t v3 = OUTLINED_FUNCTION_24_39();
  return v4(v3);
}

uint64_t sub_25D5012F4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D5013D4()
{
  *(void *)(v0 + 72) = sub_25D5002A4(type metadata accessor for GatekeeperSendReadParameters);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_32_4();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D501494;
  unint64_t v2 = OUTLINED_FUNCTION_30_41();
  return v3(v2);
}

uint64_t sub_25D501494()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 96) = v3;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D5015AC()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendReadParameters);
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_52_8();
  return v2(v1);
}

uint64_t sub_25D501624()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendReadParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D5016A0()
{
  OUTLINED_FUNCTION_14();
  sub_25D501930(*(void *)(v0 + 48), (void (*)(void))type metadata accessor for GatekeeperSendReadParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v1();
}

uint64_t sub_25D50171C(uint64_t a1, uint64_t a2)
{
  return sub_25D501770(a1, a2);
}

uint64_t sub_25D501770(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D53D270();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A50);
  uint64_t v9 = OUTLINED_FUNCTION_17_0(v8);
  MEMORY[0x270FA5388](v9);
  sub_25D1A32D8(a1, (uint64_t)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_26A672A50);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_25D53CFA0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_25D18BD64(a1, (uint64_t *)&unk_26A672A50);
  return v11;
}

uint64_t sub_25D5018E8()
{
  return type metadata accessor for GatekeeperCATPatternsExecutor(0);
}

uint64_t type metadata accessor for GatekeeperSendReadParameters(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674E88);
}

uint64_t type metadata accessor for GatekeeperSendCallParameters(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674E78);
}

uint64_t sub_25D501930(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_5_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t type metadata accessor for GatekeeperReadSendCallParameters(uint64_t a1)
{
  return sub_25D17C294(a1, (uint64_t *)&unk_26A674E68);
}

uint64_t sub_25D5019C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t sub_25D5019DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t sub_25D5019F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_0);
}

uint64_t sub_25D501A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_0);
}

uint64_t *sub_25D501A28(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v6 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    sub_25D53D0A0();
    if (OUTLINED_FUNCTION_24_13((uint64_t)a2))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
      uint64_t v9 = OUTLINED_FUNCTION_17_0(v8);
      OUTLINED_FUNCTION_33_36(v9, v11, *(void *)(v10 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_18_12();
      v13();
      OUTLINED_FUNCTION_10_19((uint64_t)a1);
    }
    if (OUTLINED_FUNCTION_7_58(a3[5]))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
      uint64_t v15 = OUTLINED_FUNCTION_17_0(v14);
      OUTLINED_FUNCTION_27_14(v15, v17, *(void *)(v16 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v18 = OUTLINED_FUNCTION_9_18();
      v19(v18);
      OUTLINED_FUNCTION_10_19(v3);
    }
    if (OUTLINED_FUNCTION_7_58(a3[6]))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
      uint64_t v21 = OUTLINED_FUNCTION_17_0(v20);
      OUTLINED_FUNCTION_27_14(v21, v23, *(void *)(v22 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v24 = OUTLINED_FUNCTION_9_18();
      v25(v24);
      OUTLINED_FUNCTION_10_19(v3);
    }
    if (OUTLINED_FUNCTION_7_58(a3[7]))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
      uint64_t v27 = OUTLINED_FUNCTION_17_0(v26);
      OUTLINED_FUNCTION_27_14(v27, v29, *(void *)(v28 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v30 = OUTLINED_FUNCTION_9_18();
      v31(v30);
      OUTLINED_FUNCTION_10_19(v3);
    }
    uint64_t v32 = a3[8];
    uint64_t v33 = (uint64_t)a1 + v32;
    if (OUTLINED_FUNCTION_24_13((uint64_t)a2 + v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
      uint64_t v35 = OUTLINED_FUNCTION_17_0(v34);
      OUTLINED_FUNCTION_126_0(v35, v37, *(void *)(v36 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_18_12();
      v38();
      OUTLINED_FUNCTION_10_19(v33);
    }
  }
  return a1;
}

uint64_t sub_25D501C80(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25D53D0A0();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
  {
    OUTLINED_FUNCTION_5_3();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  if (!OUTLINED_FUNCTION_42_9(a2[5]))
  {
    OUTLINED_FUNCTION_5_3();
    uint64_t v6 = OUTLINED_FUNCTION_57_7();
    v7(v6);
  }
  if (!OUTLINED_FUNCTION_42_9(a2[6]))
  {
    OUTLINED_FUNCTION_5_3();
    uint64_t v8 = OUTLINED_FUNCTION_57_7();
    v9(v8);
  }
  if (!OUTLINED_FUNCTION_42_9(a2[7]))
  {
    OUTLINED_FUNCTION_5_3();
    uint64_t v10 = OUTLINED_FUNCTION_57_7();
    v11(v10);
  }
  uint64_t v12 = a1 + a2[8];
  uint64_t result = __swift_getEnumTagSinglePayload(v12, 1, v4);
  if (!result)
  {
    OUTLINED_FUNCTION_5_3();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v15(v12, v4);
  }
  return result;
}

uint64_t sub_25D501DEC()
{
  OUTLINED_FUNCTION_22_45();
  if (OUTLINED_FUNCTION_24_13(v1))
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v5 = OUTLINED_FUNCTION_17_0(v4);
    OUTLINED_FUNCTION_33_36(v5, v7, *(void *)(v6 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_18_12();
    v8();
    OUTLINED_FUNCTION_10_19(v0);
  }
  if (OUTLINED_FUNCTION_7_58(v2[5]))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
    OUTLINED_FUNCTION_27_14(v10, v12, *(void *)(v11 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v13 = OUTLINED_FUNCTION_9_18();
    v14(v13);
    OUTLINED_FUNCTION_10_19(v3);
  }
  if (OUTLINED_FUNCTION_7_58(v2[6]))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v16 = OUTLINED_FUNCTION_17_0(v15);
    OUTLINED_FUNCTION_27_14(v16, v18, *(void *)(v17 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v19 = OUTLINED_FUNCTION_9_18();
    v20(v19);
    OUTLINED_FUNCTION_10_19(v3);
  }
  if (OUTLINED_FUNCTION_7_58(v2[7]))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v22 = OUTLINED_FUNCTION_17_0(v21);
    OUTLINED_FUNCTION_27_14(v22, v24, *(void *)(v23 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v25 = OUTLINED_FUNCTION_9_18();
    v26(v25);
    OUTLINED_FUNCTION_10_19(v3);
  }
  uint64_t v27 = v2[8];
  uint64_t v28 = v0 + v27;
  if (OUTLINED_FUNCTION_24_13(v1 + v27))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v30 = OUTLINED_FUNCTION_17_0(v29);
    OUTLINED_FUNCTION_126_0(v30, v32, *(void *)(v31 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_18_12();
    v33();
    OUTLINED_FUNCTION_10_19(v28);
  }
  return v0;
}

uint64_t sub_25D501FE4()
{
  uint64_t v4 = OUTLINED_FUNCTION_22_45();
  uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1, v4);
  int v6 = OUTLINED_FUNCTION_24_13(v1);
  if (EnumTagSinglePayload)
  {
    if (!v6)
    {
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_18_12();
      v7();
      OUTLINED_FUNCTION_10_19(v0);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_0_53();
  if (v8)
  {
    OUTLINED_FUNCTION_23_47();
    v9();
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v11 = OUTLINED_FUNCTION_17_0(v10);
    OUTLINED_FUNCTION_33_36(v11, v13, *(void *)(v12 + 64));
    goto LABEL_7;
  }
  uint64_t v57 = OUTLINED_FUNCTION_39_39();
  v58(v57);
LABEL_7:
  int v14 = OUTLINED_FUNCTION_1_44(v2[5]);
  if (v3)
  {
    if (!v14)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v15 = OUTLINED_FUNCTION_9_18();
      v16(v15);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_0_53();
  if (v17)
  {
    uint64_t v18 = OUTLINED_FUNCTION_23_15();
    v19(v18);
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v21 = OUTLINED_FUNCTION_17_0(v20);
    OUTLINED_FUNCTION_27_14(v21, v23, *(void *)(v22 + 64));
    goto LABEL_13;
  }
  uint64_t v59 = OUTLINED_FUNCTION_32_11();
  v60(v59);
LABEL_13:
  int v24 = OUTLINED_FUNCTION_1_44(v2[6]);
  if (v3)
  {
    if (!v24)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v25 = OUTLINED_FUNCTION_9_18();
      v26(v25);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_0_53();
  if (v27)
  {
    uint64_t v28 = OUTLINED_FUNCTION_23_15();
    v29(v28);
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v31 = OUTLINED_FUNCTION_17_0(v30);
    OUTLINED_FUNCTION_27_14(v31, v33, *(void *)(v32 + 64));
    goto LABEL_19;
  }
  uint64_t v61 = OUTLINED_FUNCTION_32_11();
  v62(v61);
LABEL_19:
  int v34 = OUTLINED_FUNCTION_1_44(v2[7]);
  if (v3)
  {
    if (!v34)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v35 = OUTLINED_FUNCTION_9_18();
      v36(v35);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_0_53();
  if (v37)
  {
    uint64_t v38 = OUTLINED_FUNCTION_23_15();
    v39(v38);
LABEL_24:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v41 = OUTLINED_FUNCTION_17_0(v40);
    OUTLINED_FUNCTION_27_14(v41, v43, *(void *)(v42 + 64));
    goto LABEL_25;
  }
  uint64_t v63 = OUTLINED_FUNCTION_32_11();
  v64(v63);
LABEL_25:
  uint64_t v44 = v2[8];
  uint64_t v45 = v0 + v44;
  uint64_t v46 = v1 + v44;
  int v47 = __swift_getEnumTagSinglePayload(v0 + v44, 1, v4);
  int v48 = OUTLINED_FUNCTION_24_13(v46);
  if (!v47)
  {
    OUTLINED_FUNCTION_0_53();
    if (!v50)
    {
      uint64_t v65 = OUTLINED_FUNCTION_167();
      v66(v65);
      return v0;
    }
    OUTLINED_FUNCTION_23_47();
    v51();
    goto LABEL_30;
  }
  if (v48)
  {
LABEL_30:
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v53 = OUTLINED_FUNCTION_17_0(v52);
    OUTLINED_FUNCTION_126_0(v53, v55, *(void *)(v54 + 64));
    return v0;
  }
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_18_12();
  v49();
  OUTLINED_FUNCTION_10_19(v45);
  return v0;
}

uint64_t sub_25D5022F4()
{
  OUTLINED_FUNCTION_22_45();
  if (OUTLINED_FUNCTION_24_13(v1))
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v5 = OUTLINED_FUNCTION_17_0(v4);
    OUTLINED_FUNCTION_33_36(v5, v7, *(void *)(v6 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_13_47();
    v8();
    OUTLINED_FUNCTION_10_19(v0);
  }
  if (OUTLINED_FUNCTION_7_58(v2[5]))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
    OUTLINED_FUNCTION_27_14(v10, v12, *(void *)(v11 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v13 = OUTLINED_FUNCTION_16_13();
    v14(v13);
    OUTLINED_FUNCTION_10_19(v3);
  }
  if (OUTLINED_FUNCTION_7_58(v2[6]))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v16 = OUTLINED_FUNCTION_17_0(v15);
    OUTLINED_FUNCTION_27_14(v16, v18, *(void *)(v17 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v19 = OUTLINED_FUNCTION_16_13();
    v20(v19);
    OUTLINED_FUNCTION_10_19(v3);
  }
  if (OUTLINED_FUNCTION_7_58(v2[7]))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v22 = OUTLINED_FUNCTION_17_0(v21);
    OUTLINED_FUNCTION_27_14(v22, v24, *(void *)(v23 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    uint64_t v25 = OUTLINED_FUNCTION_16_13();
    v26(v25);
    OUTLINED_FUNCTION_10_19(v3);
  }
  uint64_t v27 = v2[8];
  uint64_t v28 = v0 + v27;
  if (OUTLINED_FUNCTION_24_13(v1 + v27))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v30 = OUTLINED_FUNCTION_17_0(v29);
    OUTLINED_FUNCTION_126_0(v30, v32, *(void *)(v31 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_13_47();
    v33();
    OUTLINED_FUNCTION_10_19(v28);
  }
  return v0;
}

uint64_t sub_25D5024EC()
{
  uint64_t v4 = OUTLINED_FUNCTION_22_45();
  uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1, v4);
  int v6 = OUTLINED_FUNCTION_24_13(v1);
  if (EnumTagSinglePayload)
  {
    if (!v6)
    {
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_13_47();
      v7();
      OUTLINED_FUNCTION_10_19(v0);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_0_53();
  if (v8)
  {
    OUTLINED_FUNCTION_23_47();
    v9();
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v11 = OUTLINED_FUNCTION_17_0(v10);
    OUTLINED_FUNCTION_33_36(v11, v13, *(void *)(v12 + 64));
    goto LABEL_7;
  }
  uint64_t v57 = OUTLINED_FUNCTION_39_39();
  v58(v57);
LABEL_7:
  int v14 = OUTLINED_FUNCTION_1_44(v2[5]);
  if (v3)
  {
    if (!v14)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v15 = OUTLINED_FUNCTION_16_13();
      v16(v15);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_0_53();
  if (v17)
  {
    uint64_t v18 = OUTLINED_FUNCTION_23_15();
    v19(v18);
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v21 = OUTLINED_FUNCTION_17_0(v20);
    OUTLINED_FUNCTION_27_14(v21, v23, *(void *)(v22 + 64));
    goto LABEL_13;
  }
  uint64_t v59 = OUTLINED_FUNCTION_31_9();
  v60(v59);
LABEL_13:
  int v24 = OUTLINED_FUNCTION_1_44(v2[6]);
  if (v3)
  {
    if (!v24)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v25 = OUTLINED_FUNCTION_16_13();
      v26(v25);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_0_53();
  if (v27)
  {
    uint64_t v28 = OUTLINED_FUNCTION_23_15();
    v29(v28);
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v31 = OUTLINED_FUNCTION_17_0(v30);
    OUTLINED_FUNCTION_27_14(v31, v33, *(void *)(v32 + 64));
    goto LABEL_19;
  }
  uint64_t v61 = OUTLINED_FUNCTION_31_9();
  v62(v61);
LABEL_19:
  int v34 = OUTLINED_FUNCTION_1_44(v2[7]);
  if (v3)
  {
    if (!v34)
    {
      OUTLINED_FUNCTION_9_9();
      uint64_t v35 = OUTLINED_FUNCTION_16_13();
      v36(v35);
      OUTLINED_FUNCTION_10_19(EnumTagSinglePayload);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_0_53();
  if (v37)
  {
    uint64_t v38 = OUTLINED_FUNCTION_23_15();
    v39(v38);
LABEL_24:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v41 = OUTLINED_FUNCTION_17_0(v40);
    OUTLINED_FUNCTION_27_14(v41, v43, *(void *)(v42 + 64));
    goto LABEL_25;
  }
  uint64_t v63 = OUTLINED_FUNCTION_31_9();
  v64(v63);
LABEL_25:
  uint64_t v44 = v2[8];
  uint64_t v45 = v0 + v44;
  uint64_t v46 = v1 + v44;
  int v47 = __swift_getEnumTagSinglePayload(v0 + v44, 1, v4);
  int v48 = OUTLINED_FUNCTION_24_13(v46);
  if (!v47)
  {
    OUTLINED_FUNCTION_0_53();
    if (!v50)
    {
      uint64_t v65 = OUTLINED_FUNCTION_167();
      v66(v65);
      return v0;
    }
    OUTLINED_FUNCTION_23_47();
    v51();
    goto LABEL_30;
  }
  if (v48)
  {
LABEL_30:
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
    uint64_t v53 = OUTLINED_FUNCTION_17_0(v52);
    OUTLINED_FUNCTION_126_0(v53, v55, *(void *)(v54 + 64));
    return v0;
  }
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_13_47();
  v49();
  OUTLINED_FUNCTION_10_19(v45);
  return v0;
}

uint64_t sub_25D5027FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D502810);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_25D502860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D502874);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_25D5028C8()
{
  sub_25D17C214();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t OUTLINED_FUNCTION_1_55(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  __swift_storeEnumTagSinglePayload(v1 + v2[5], 1, 1, a1);
  __swift_storeEnumTagSinglePayload(v1 + v2[6], 1, 1, a1);
  __swift_storeEnumTagSinglePayload(v1 + v2[7], 1, 1, a1);
  return __swift_storeEnumTagSinglePayload(v1 + v2[8], 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_7_58@<X0>(uint64_t a1@<X8>)
{
  return __swift_getEnumTagSinglePayload(v2 + a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_22_45()
{
  return sub_25D53D0A0();
}

uint64_t OUTLINED_FUNCTION_24_39()
{
  return *(void *)(v0 + 48);
}

unint64_t OUTLINED_FUNCTION_30_41()
{
  return 0xD000000000000013;
}

void *OUTLINED_FUNCTION_33_36(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_37_34()
{
  return sub_25D53D0A0();
}

uint64_t OUTLINED_FUNCTION_38_31(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_39_39()
{
  return v0;
}

unint64_t sub_25D502AF8()
{
  uint64_t v0 = sub_25D53AFC0();
  sub_25D219024(v0, v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_25D53E140();
    swift_bridgeObjectRelease();
  }
  sub_25D53E360();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_103_5();
  uint64_t v4 = sub_25D53AFC0();
  sub_25D21A91C(1uLL, v4, v5);
  sub_25D224660();
  swift_bridgeObjectRetain();
  sub_25D53E350();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD000000000000012;
}

uint64_t sub_25D502C28()
{
  uint64_t v0 = sub_25D53B470();
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = v0 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_25D17DB88(v2, (uint64_t)v5);
      char v3 = sub_25D509B14(v5);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
      if (v3) {
        break;
      }
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

void sub_25D502CEC()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_23_20();
  uint64_t v5 = sub_25D53B490();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_16_1();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_19_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D78);
  uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_38_32(v11, v36);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v13 = OUTLINED_FUNCTION_17_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_39_40();
  sub_25D53B3C0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_63_0();
  uint64_t v15 = sub_25D53B470();
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v17 = v15 + 32;
    swift_bridgeObjectRetain();
    uint64_t v37 = v0;
    while (1)
    {
      sub_25D17DB88(v17, (uint64_t)v40);
      sub_25D17DB88((uint64_t)v40, (uint64_t)v39);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D88);
      if (swift_dynamicCast()) {
        break;
      }
      OUTLINED_FUNCTION_42_32(v2, 1);
      sub_25D1A3284(v2, &qword_26A672D80);
      sub_25D17DB88((uint64_t)v40, (uint64_t)v39);
      if (swift_dynamicCast())
      {
        __swift_storeEnumTagSinglePayload(v0, 0, 1, v5);
        OUTLINED_FUNCTION_103_5();
        OUTLINED_FUNCTION_29_9();
        uint64_t v25 = v24();
        char v26 = sub_25D502CEC(v25);
        OUTLINED_FUNCTION_65();
        v27();
        goto LABEL_17;
      }
      __swift_storeEnumTagSinglePayload(v0, 1, 1, v5);
      sub_25D1A3284(v0, &qword_26A66FC90);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
LABEL_18:
      v17 += 40;
      if (!--v16)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
        goto LABEL_22;
      }
    }
    OUTLINED_FUNCTION_42_32(v2, 0);
    OUTLINED_FUNCTION_29_9();
    v18();
    sub_25D53B3B0();
    OUTLINED_FUNCTION_53_9();
    if (v19)
    {
      uint64_t v20 = sub_25D53B2A0();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_84_2();
      v21();
      uint64_t v22 = v1;
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v20 = sub_25D53B2A0();
      uint64_t v22 = v1;
      uint64_t v23 = 1;
    }
    __swift_storeEnumTagSinglePayload(v22, v23, 1, v20);
    swift_bridgeObjectRelease();
    sub_25D53B2A0();
    OUTLINED_FUNCTION_6_10(v1, 1, v20);
    if (v35)
    {
      OUTLINED_FUNCTION_65();
      v28();
      sub_25D1A3284(v1, &qword_26A672D70);
      uint64_t v29 = sub_25D53B250();
      OUTLINED_FUNCTION_55_3(v38, v30, v31, v29);
      uint64_t v0 = v37;
    }
    else
    {
      sub_25D53B260();
      OUTLINED_FUNCTION_65();
      v32();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_65();
      v33();
      uint64_t v34 = sub_25D53B250();
      char v26 = 1;
      OUTLINED_FUNCTION_6_10(v38, 1, v34);
      uint64_t v0 = v37;
      if (!v35) {
        goto LABEL_16;
      }
    }
    char v26 = 0;
LABEL_16:
    sub_25D1A3284(v38, &qword_26A672D78);
LABEL_17:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
    if (v26) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D5031A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25D541BE0;
  if (qword_26A66E790 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A688F48;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = sub_25D1D3468((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 64) = v3;
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = qword_26A66E798;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26A688F50;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  *(void *)(v0 + 72) = v5;
  sub_25D53AE50();
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_25D53AE30();
  qword_26A688F40 = result;
  return result;
}

uint64_t sub_25D5032F8(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_61(a1, (uint64_t *)&unk_26A674AF0, 0x70756F7247736D73, 1701667150, &qword_26A688F48);
}

uint64_t sub_25D503324(uint64_t a1)
{
  return OUTLINED_FUNCTION_21_48(a1, (uint64_t *)&unk_26A674AF0, 0x70756F7247736D73, 0x6449656D614ELL, &qword_26A688F50);
}

uint64_t sub_25D503354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_20_51(a1, &qword_26A6706F8, 0x65746144736D73, a4, &qword_26A688F58);
}

uint64_t sub_25D503378(uint64_t a1)
{
  return sub_25D503CAC(a1, (uint64_t *)&unk_26A674AF0, 0x617373654D736D73, 0xEA00000000006567, &qword_26A688F60);
}

uint64_t sub_25D5033A4()
{
  sub_25D53AF90();
  OUTLINED_FUNCTION_91();
  uint64_t result = sub_25D53AF80();
  qword_26A688F68 = result;
  return result;
}

uint64_t sub_25D5033F0(uint64_t a1)
{
  return OUTLINED_FUNCTION_21_48(a1, (uint64_t *)&unk_26A674AF0, 0x61746E6F43736D73, 0x656D614E7463, &qword_26A688F70);
}

uint64_t sub_25D503420(uint64_t a1)
{
  return OUTLINED_FUNCTION_21_48(a1, &qword_26A674EE0, 0x61746E6F43736D73, 0x656C6F527463, &qword_26A688F78);
}

uint64_t sub_25D503450(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_61(a1, (uint64_t *)&unk_26A674AF0, 0x61746E6F43736D73, 1682535523, &qword_26A688F80);
}

uint64_t sub_25D50347C(uint64_t a1)
{
  return sub_25D503CAC(a1, &qword_26A66FC38, 0xD000000000000013, 0x800000025D55D250, &qword_26A688F88);
}

uint64_t sub_25D5034A8(uint64_t a1)
{
  return OUTLINED_FUNCTION_43_28(a1, (uint64_t *)&unk_26A674AF0, 0x6D754E656E6F6870, 7497058, &qword_26A688F90);
}

uint64_t sub_25D5034D4(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_61(a1, (uint64_t *)&unk_26A674AF0, 0x6464416C69616D65, 1936942450, &qword_26A688F98);
}

uint64_t sub_25D503500(uint64_t a1)
{
  return OUTLINED_FUNCTION_43_28(a1, (uint64_t *)&unk_26A674AF0, 0x54746361746E6F63, 6647929, &qword_26A688FA0);
}

uint64_t sub_25D50352C(uint64_t a1)
{
  return sub_25D503CAC(a1, &qword_26A674EF0, 0x746E6F436E696F6ALL, 0xEB00000000746361, &qword_26A688FA8);
}

uint64_t sub_25D50355C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25D54E840;
  if (qword_26A66E7B0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A688F68;
  uint64_t v2 = sub_25D53AF90();
  uint64_t v3 = MEMORY[0x263F722A0];
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = v3;
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = qword_26A66E7B8;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26A688F70;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 96) = v6;
  uint64_t v7 = sub_25D1D3468((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 104) = v7;
  *(void *)(v0 + 72) = v5;
  uint64_t v8 = qword_26A66E7C0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_26A688F78;
  *(void *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674EE0);
  *(void *)(v0 + 144) = sub_25D1D3468(&qword_26A674EE8, &qword_26A674EE0);
  *(void *)(v0 + 112) = v9;
  uint64_t v10 = qword_26A66E7C8;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26A688F80;
  *(void *)(v0 + 176) = v6;
  *(void *)(v0 + 184) = v7;
  *(void *)(v0 + 152) = v11;
  uint64_t v12 = qword_26A66E7D0;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_26A688F88;
  *(void *)(v0 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC38);
  *(void *)(v0 + 224) = sub_25D1D3468(&qword_26A66FC40, &qword_26A66FC38);
  *(void *)(v0 + 192) = v13;
  uint64_t v14 = qword_26A66E7D8;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_26A688F90;
  *(void *)(v0 + 256) = v6;
  *(void *)(v0 + 264) = v7;
  *(void *)(v0 + 232) = v15;
  uint64_t v16 = qword_26A66E7E0;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A688F98;
  *(void *)(v0 + 296) = v6;
  *(void *)(v0 + 304) = v7;
  *(void *)(v0 + 272) = v17;
  uint64_t v18 = qword_26A66E7E8;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_26A688FA0;
  *(void *)(v0 + 336) = v6;
  *(void *)(v0 + 344) = v7;
  *(void *)(v0 + 312) = v19;
  uint64_t v20 = qword_26A66E7F0;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_26A688FA8;
  *(void *)(v0 + 376) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674EF0);
  *(void *)(v0 + 384) = sub_25D1D3468(&qword_26A674EF8, &qword_26A674EF0);
  *(void *)(v0 + 352) = v21;
  sub_25D53AE50();
  OUTLINED_FUNCTION_91();
  swift_retain();
  uint64_t result = sub_25D53AE30();
  qword_26A688FB0 = result;
  return result;
}

uint64_t sub_25D503910(uint64_t a1)
{
  return OUTLINED_FUNCTION_37_35(a1, &qword_26A6706E8, 0x6972747441736D73, 0x7365747562, &qword_26A688FB8);
}

uint64_t sub_25D503940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_20_51(a1, (uint64_t *)&unk_26A674AF0, 0x656D614E707061, a4, &qword_26A688FC0);
}

uint64_t sub_25D503964(uint64_t a1)
{
  return OUTLINED_FUNCTION_37_35(a1, (uint64_t *)&unk_26A674AF0, 0x746163696C707061, 0x64496E6F69, &qword_26A688FC8);
}

uint64_t sub_25D503994(uint64_t a1)
{
  return sub_25D503CAC(a1, &qword_26A674F00, 0x6972747441707061, 0xED00007365747562, &qword_26A688FD0);
}

uint64_t sub_25D5039C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25D541D20;
  if (qword_26A66E810 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A688FC8;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = sub_25D1D3468((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 64) = v3;
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = qword_26A66E808;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26A688FC0;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  *(void *)(v0 + 72) = v5;
  uint64_t v6 = qword_26A66E818;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26A688FD0;
  *(void *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F00);
  *(void *)(v0 + 144) = sub_25D1D3468(&qword_26A674F08, &qword_26A674F00);
  *(void *)(v0 + 112) = v7;
  sub_25D53AE50();
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_25D53AE30();
  qword_26A688FD8 = result;
  return result;
}

uint64_t sub_25D503B7C(uint64_t a1)
{
  return sub_25D503CAC(a1, (uint64_t *)&unk_26A674B10, 0x69666E6F43736D73, 0xEF6E6F6974616D72, &qword_26A688FE0);
}

uint64_t sub_25D503BB0(uint64_t a1)
{
  return sub_25D503CAC(a1, (uint64_t *)&unk_26A674AF0, 0x6449736D73, 0xE500000000000000, &qword_26A688FE8);
}

uint64_t sub_25D503BD4(uint64_t a1)
{
  return sub_25D503CAC(a1, (uint64_t *)&unk_26A674AF0, 0x4974616843736D73, 0xE900000000000064, &qword_26A688FF0);
}

uint64_t sub_25D503C00(uint64_t a1)
{
  return sub_25D503CAC(a1, &qword_26A674EC0, 0x6E756F4E736D73, 0xE700000000000000, &qword_26A688FF8);
}

uint64_t sub_25D503C28(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_61(a1, &qword_26A674B00, 0x7265666552736D73, 1701015141, &qword_26A689000);
}

uint64_t sub_25D503C54(uint64_t a1)
{
  return sub_25D503CAC(a1, &qword_26A674ED0, 0x6572616853736D73, 0xEF797469746E4564, &qword_26A689008);
}

uint64_t sub_25D503C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_20_51(a1, &qword_26A6706D8, 0x62726556736D73, a4, &qword_26A689010);
}

uint64_t sub_25D503CAC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_91();
  uint64_t result = sub_25D53AFA0();
  *a5 = result;
  return result;
}

uint64_t sub_25D503D04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25D547E10;
  if (qword_26A66E820 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A688FD8;
  uint64_t v2 = sub_25D53AE50();
  uint64_t v3 = MEMORY[0x263F722A0];
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = v3;
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = qword_26A66E800;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26A688FB8;
  *(void *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6706E8);
  *(void *)(v0 + 104) = sub_25D1D3468(&qword_26A6706F0, &qword_26A6706E8);
  *(void *)(v0 + 72) = v5;
  uint64_t v6 = qword_26A66E7F8;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26A688FB0;
  *(void *)(v0 + 136) = v2;
  *(void *)(v0 + 144) = v3;
  *(void *)(v0 + 112) = v7;
  uint64_t v8 = qword_26A66E788;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_26A688F40;
  *(void *)(v0 + 176) = v2;
  *(void *)(v0 + 184) = v3;
  *(void *)(v0 + 152) = v9;
  uint64_t v10 = qword_26A66E828;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26A688FE0;
  *(void *)(v0 + 216) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674B10);
  *(void *)(v0 + 224) = sub_25D1D3468(&qword_26A6706B0, (uint64_t *)&unk_26A674B10);
  *(void *)(v0 + 192) = v11;
  uint64_t v12 = qword_26A66E830;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_26A688FE8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 256) = v14;
  uint64_t v15 = sub_25D1D3468((unint64_t *)&qword_26A66FC30, (uint64_t *)&unk_26A674AF0);
  *(void *)(v0 + 264) = v15;
  *(void *)(v0 + 232) = v13;
  uint64_t v16 = qword_26A66E838;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A688FF0;
  *(void *)(v0 + 296) = v14;
  *(void *)(v0 + 304) = v15;
  *(void *)(v0 + 272) = v17;
  uint64_t v18 = qword_26A66E7A8;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_26A688F60;
  *(void *)(v0 + 336) = v14;
  *(void *)(v0 + 344) = v15;
  *(void *)(v0 + 312) = v19;
  uint64_t v20 = qword_26A66E840;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_26A688FF8;
  *(void *)(v0 + 376) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674EC0);
  *(void *)(v0 + 384) = sub_25D1D3468(&qword_26A674EC8, &qword_26A674EC0);
  *(void *)(v0 + 352) = v21;
  uint64_t v22 = qword_26A66E848;
  swift_retain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_26A689000;
  *(void *)(v0 + 416) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674B00);
  *(void *)(v0 + 424) = sub_25D1D3468(&qword_26A674B08, &qword_26A674B00);
  *(void *)(v0 + 392) = v23;
  uint64_t v24 = qword_26A66E858;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_26A689010;
  *(void *)(v0 + 456) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6706D8);
  *(void *)(v0 + 464) = sub_25D1D3468(&qword_26A6706E0, &qword_26A6706D8);
  *(void *)(v0 + 432) = v25;
  uint64_t v26 = qword_26A66E850;
  swift_retain();
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v27 = qword_26A689008;
  *(void *)(v0 + 496) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674ED0);
  *(void *)(v0 + 504) = sub_25D1D3468(&qword_26A674ED8, &qword_26A674ED0);
  *(void *)(v0 + 472) = v27;
  uint64_t v28 = qword_26A66E7A0;
  swift_retain();
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_26A688F58;
  *(void *)(v0 + 536) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6706F8);
  *(void *)(v0 + 544) = sub_25D1D3468(&qword_26A670700, &qword_26A6706F8);
  *(void *)(v0 + 512) = v29;
  sub_25D53AF00();
  OUTLINED_FUNCTION_91();
  swift_retain();
  uint64_t result = sub_25D53AEF0();
  qword_26A689018 = result;
  return result;
}

void sub_25D504260()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F30);
  uint64_t v1 = OUTLINED_FUNCTION_17_0(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_16_1();
  uint64_t v22 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F38);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_1();
  uint64_t v21 = v5;
  uint64_t v6 = sub_25D53BF40();
  __swift_allocate_value_buffer(v6, qword_26A689020);
  __swift_project_value_buffer(v6, (uint64_t)qword_26A689020);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F40);
  uint64_t v7 = (__n128 *)swift_allocObject();
  uint64_t v8 = (__n128 *)OUTLINED_FUNCTION_22_46(v7, (__n128)xmmword_25D541230);
  uint64_t v9 = (__n128 *)OUTLINED_FUNCTION_22_46(v8, (__n128)xmmword_25D541230);
  uint64_t v10 = (__n128 *)OUTLINED_FUNCTION_22_46(v9, (__n128)xmmword_25D541230);
  uint64_t v11 = OUTLINED_FUNCTION_22_46(v10, (__n128)xmmword_25D541230);
  *(_OWORD *)(v11 + 16) = xmmword_25D541230;
  if (qword_26A66E860 != -1) {
    swift_once();
  }
  uint64_t v23 = (uint64_t *)&v7[2];
  uint64_t v20 = v7;
  sub_25D53AE40();
  uint64_t v12 = sub_25D53B490();
  uint64_t v13 = MEMORY[0x263F72950];
  *(void *)(v11 + 56) = v12;
  *(void *)(v11 + 64) = v13;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v11 + 32));
  OUTLINED_FUNCTION_164_4();
  sub_25D53B480();
  v10[3].n128_u64[1] = v12;
  v10[4].n128_u64[0] = v13;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v10[2]);
  sub_25D53B480();
  v9[3].n128_u64[1] = v12;
  v9[4].n128_u64[0] = v13;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v9[2]);
  sub_25D53B480();
  v8[3].n128_u64[1] = v12;
  v8[4].n128_u64[0] = v13;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v8[2]);
  sub_25D53B480();
  v20[3].n128_u64[1] = v12;
  v20[4].n128_u64[0] = v13;
  __swift_allocate_boxed_opaque_existential_0(v23);
  sub_25D53B480();
  v24[3] = v12;
  v24[4] = v13;
  __swift_allocate_boxed_opaque_existential_0(v24);
  sub_25D53B480();
  uint64_t v14 = sub_25D53BED0();
  OUTLINED_FUNCTION_55_3(v21, v15, v16, v14);
  uint64_t v17 = sub_25D53B510();
  OUTLINED_FUNCTION_55_3(v22, v18, v19, v17);
  sub_25D53BF30();
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D5045B4()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (!v5)
  {
    uint64_t v3 = sub_25D37A8C0(v0);
    BOOL v5 = v3 == 1684104562 && v4 == 0xE400000000000000;
    if (v5) {
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_62_14();
  }
  char v1 = OUTLINED_FUNCTION_2_71();
  if (v5) {
    return 0;
  }
  uint64_t v6 = sub_25D37A8C0(v1);
  if (v6 != 1684957542 || v7 != 0xE400000000000000)
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
    return 0;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_25D504670()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 1684956531 && v3 == 0xE400000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D5046E0()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 2036427888 && v3 == 0xE400000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
    return 0;
  }
}

uint64_t sub_25D504750()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x6572616873 && v3 == 0xE500000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D53F090();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D5047D0()
{
  char v0 = sub_25D506724();
  if (v0 == 8) {
    return 0;
  }
  if (sub_25D37A40C(v0) == 1819042147 && v2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504848()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x79666972616C63 && v3 == 0xE700000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D53F090();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D5048D0()
{
  char v0 = OUTLINED_FUNCTION_64_16();
  if (v4) {
    return 0;
  }
  sub_25D379480(v0);
  BOOL v4 = v2 == 1954047342 && v3 == 0xE400000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
    return 0;
  }
}

BOOL sub_25D504940()
{
  char v0 = OUTLINED_FUNCTION_64_16();
  if (v4) {
    return 0;
  }
  char v1 = v0;
  char v2 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  BOOL v4 = sub_25D37A8C0(v2) == 1684104562 && v3 == 0xE400000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = OUTLINED_FUNCTION_67_13();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v6 = sub_25D2F2E04((uint64_t)&unk_270A3FDF8);
  char v7 = sub_25D52D114(v1, v6);
  swift_bridgeObjectRelease();
  return (v7 & 1) != 0;
}

uint64_t sub_25D5049F8()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x796C706572 && v3 == 0xE500000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    sub_25D53F090();
    OUTLINED_FUNCTION_118_0();
    return 0;
  }
}

uint64_t sub_25D504A78()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x796669646F6DLL && v3 == 0xE600000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_21();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504AF0()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x646E65707061 && v3 == 0xE600000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_21();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504B68()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 1886352499 && v3 == 0xE400000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_67_13();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504BD8()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x6574656C6564 && v3 == 0xE600000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_35_21();
    OUTLINED_FUNCTION_118_0();
    return 0;
  }
}

uint64_t sub_25D504C50()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x646E65736E75 && v3 == 0xE600000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_21();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504CC8()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v4) {
    return 0;
  }
  uint64_t v2 = sub_25D37A8C0(v0);
  BOOL v4 = v2 == 0x65726168736E75 && v3 == 0xE700000000000000;
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D53F090();
    OUTLINED_FUNCTION_118_0();
  }
  return 1;
}

uint64_t sub_25D504D50()
{
  uint64_t v1 = OUTLINED_FUNCTION_2_71();
  if (v2)
  {
    if (sub_25D505600())
    {
      char v3 = 1;
    }
    else
    {
      uint64_t v5 = sub_25D506870();
      sub_25D3FBD70(v5, v6);
      OUTLINED_FUNCTION_118_0();
      char v3 = v0 ^ 1;
    }
    return v3 & 1;
  }
  else
  {
    return sub_25D22B1F0(v1, (uint64_t)&unk_270A3FE20);
  }
}

uint64_t sub_25D504DC0()
{
  uint64_t v0 = OUTLINED_FUNCTION_2_71();
  if (v1) {
    return sub_25D505F4C() != 35;
  }
  char v3 = sub_25D22B1F0(v0, (uint64_t)&unk_270A3FEE8);
  if (v3) {
    return 1;
  }
  return sub_25D504E1C();
}

uint64_t sub_25D504E1C()
{
  char v0 = OUTLINED_FUNCTION_2_71();
  if (v2) {
    return 0;
  }
  BOOL v2 = sub_25D37A8C0(v0) == 0x6567616E616DLL && v1 == 0xE600000000000000;
  if (v2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_21();
    OUTLINED_FUNCTION_62_14();
  }
  char v3 = sub_25D50684C();
  if (v3 == 6) {
    goto LABEL_21;
  }
  sub_25D37A540(v3);
  if (v5 == 0x746361746E6F63 && v4 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_34();
    OUTLINED_FUNCTION_62_14();
  }
  char v7 = sub_25D505F4C();
  if (v7 == 35)
  {
LABEL_21:
    char v11 = sub_25D50684C();
    if (v11 != 6)
    {
      sub_25D37A540(v11);
      if (v14 != 0x6567617373656DLL || v13 != 0xE700000000000000)
      {
        sub_25D53F090();
        OUTLINED_FUNCTION_118_0();
        return 1;
      }
      goto LABEL_28;
    }
    return 0;
  }
  sub_25D379E24(v7);
  if (v9 == 0x746361746E6F63 && v8 == 0xE700000000000000)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return 1;
  }
  OUTLINED_FUNCTION_35_34();
  OUTLINED_FUNCTION_62_14();
  return 1;
}

uint64_t sub_25D504F84()
{
  return sub_25D504FCC(&qword_26A66E808);
}

uint64_t sub_25D504FA8()
{
  return sub_25D504FCC(&qword_26A66E840);
}

uint64_t sub_25D504FCC(void *a1)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v6 = OUTLINED_FUNCTION_17_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_37_0();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_25_12();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D68);
  uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_23_20();
  if (*a1 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B450();
  uint64_t v11 = sub_25D53B3C0();
  OUTLINED_FUNCTION_6_10(v3, 1, v11);
  if (v17)
  {
    uint64_t v12 = &qword_26A672D80;
    uint64_t v13 = v3;
LABEL_12:
    sub_25D1A3284(v13, v12);
    char v22 = 0;
    return v22 & 1;
  }
  uint64_t v14 = sub_25D53B3B0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_164_4();
  OUTLINED_FUNCTION_65();
  v15();
  sub_25D3B5870(v14, v2);
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_25D53B2A0();
  OUTLINED_FUNCTION_6_10(v2, 1, v16);
  if (v17)
  {
    uint64_t v12 = &qword_26A672D70;
    uint64_t v13 = v2;
    goto LABEL_12;
  }
  sub_25D53B240();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v18();
  uint64_t v19 = sub_25D53B230();
  OUTLINED_FUNCTION_6_10(v1, 1, v19);
  if (v20)
  {
    uint64_t v12 = &qword_26A672D68;
    uint64_t v13 = v1;
    goto LABEL_12;
  }
  char v22 = sub_25D53B220();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v23();
  return v22 & 1;
}

void sub_25D505274()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D68);
  uint64_t v6 = OUTLINED_FUNCTION_17_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_48_1();
  uint64_t v7 = sub_25D53B230();
  OUTLINED_FUNCTION_0_3();
  uint64_t v25 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_19_0();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v11 = OUTLINED_FUNCTION_17_0(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_57_3();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v13 = OUTLINED_FUNCTION_17_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_39_40();
  uint64_t v14 = sub_25D53B2A0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v26 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_9_6();
  if (qword_26A66E858 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B450();
  uint64_t v17 = sub_25D53B3C0();
  OUTLINED_FUNCTION_6_10(v4, 1, v17);
  if (v20)
  {
    sub_25D1A3284(v4, &qword_26A672D80);
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v14);
LABEL_8:
    sub_25D1A3284(v3, &qword_26A672D70);
    goto LABEL_13;
  }
  uint64_t v18 = sub_25D53B3B0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v19();
  sub_25D3B5870(v18, v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_10(v3, 1, v14);
  if (v20) {
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_34_1();
  v21();
  sub_25D53B240();
  OUTLINED_FUNCTION_6_10(v0, 1, v7);
  if (v22)
  {
    sub_25D1A3284(v0, &qword_26A672D68);
    uint64_t v23 = (void *)sub_25D53B1F0();
    sub_25D22B128(0x7372615074617453, 0xEE00627265567265, v23);
    OUTLINED_FUNCTION_118_0();
  }
  else
  {
    OUTLINED_FUNCTION_34_1();
    v24();
    sub_25D53B220();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v1, v7);
  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v14);
LABEL_13:
  OUTLINED_FUNCTION_36_0();
}

BOOL sub_25D505600()
{
  if (sub_25D5056B0() || sub_25D505668()) {
    return 1;
  }
  uint64_t v1 = sub_25D506804();
  if (v2) {
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v3;
  }
  return v5 != 0;
}

BOOL sub_25D505668()
{
  return sub_25D5056D4(&qword_26A66E788);
}

uint64_t sub_25D50568C()
{
  return sub_25D504FCC(&qword_26A66E790);
}

BOOL sub_25D5056B0()
{
  return sub_25D5056D4(&qword_26A66E7F8);
}

BOOL sub_25D5056D4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_23_20();
  if (*a1 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B440();
  uint64_t v5 = sub_25D53B490();
  OUTLINED_FUNCTION_6_10(v1, 1, v5);
  if (v6)
  {
    sub_25D1A3284(v1, &qword_26A66FC90);
    return 0;
  }
  else
  {
    uint64_t v7 = sub_25D53B470();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_65();
    v8();
    uint64_t v9 = *(void *)(v7 + 16);
    swift_bridgeObjectRelease();
    return v9 != 0;
  }
}

uint64_t sub_25D505844()
{
  return sub_25D504FCC(&qword_26A66E7A8);
}

uint64_t sub_25D505868@<X0>(uint64_t a1@<X8>)
{
  switch(sub_25D506724())
  {
    case 0u:
      unint64_t v2 = (unsigned int *)MEMORY[0x263F6F770];
      break;
    case 1u:
    case 5u:
      unint64_t v2 = (unsigned int *)MEMORY[0x263F6F760];
      break;
    case 2u:
      unint64_t v2 = (unsigned int *)MEMORY[0x263F6F768];
      break;
    default:
      unint64_t v2 = (unsigned int *)MEMORY[0x263F6F758];
      break;
  }
  uint64_t v3 = *v2;
  sub_25D539340();
  OUTLINED_FUNCTION_5_3();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);
  return v6(a1, v3, v4);
}

void sub_25D505948()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v3 = sub_25D53B160();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_25_12();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_19_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_37_0();
  if (qword_26A66E7D8 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B450();
  uint64_t v11 = sub_25D53B3C0();
  OUTLINED_FUNCTION_6_10(v2, 1, v11);
  if (v17)
  {
    uint64_t v12 = &qword_26A672D80;
    uint64_t v13 = v2;
LABEL_9:
    sub_25D1A3284(v13, v12);
    goto LABEL_10;
  }
  uint64_t v14 = sub_25D53B3B0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v15();
  sub_25D3B5870(v14, v1);
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_25D53B2A0();
  OUTLINED_FUNCTION_6_10(v1, 1, v16);
  if (v17)
  {
    uint64_t v12 = &qword_26A672D70;
    uint64_t v13 = v1;
    goto LABEL_9;
  }
  uint64_t v18 = sub_25D53B1F0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v19();
  uint64_t v20 = *(void *)(v18 + 16);
  if (v20)
  {
    unsigned int v31 = *MEMORY[0x263F72738];
    uint64_t v30 = *(void (**)(uint64_t, void, uint64_t))(v5 + 104);
    uint64_t v21 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    char v22 = (uint64_t *)(v18 + 40);
    while (1)
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v23 = *v22;
      v30(v0, v31, v3);
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_25D53B150();
      uint64_t v27 = v26;
      (*v21)(v0, v3);
      if (v24 == v25 && v23 == v27) {
        break;
      }
      char v29 = sub_25D53F090();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
        v22 += 2;
        if (--v20) {
          continue;
        }
      }
      goto LABEL_19;
    }
    swift_bridgeObjectRelease_n();
LABEL_19:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_10:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D505CB0()
{
  uint64_t v1 = sub_25D53A650();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_37_0();
  sub_25D53BF40();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_84_2();
  v5();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x263F6FF50], v1);
  return sub_25D53A5E0();
}

uint64_t sub_25D505D98()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_25_12();
  sub_25D53BF40();
  OUTLINED_FUNCTION_50_21();
  v5();
  if (qword_26A66E860 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B440();
  OUTLINED_FUNCTION_39_4();
  v6();
  uint64_t v7 = sub_25D53B490();
  OUTLINED_FUNCTION_6_10(v1, 1, v7);
  if (v8)
  {
    swift_release();
    uint64_t v2 = 0;
  }
  sub_25D1A3284(v1, &qword_26A66FC90);
  return v2;
}

uint64_t sub_25D505F4C()
{
  return sub_25D506748(&qword_26A66E800);
}

uint64_t sub_25D505F70()
{
  return sub_25D505FB8(&qword_26A66E808);
}

uint64_t sub_25D505F94()
{
  return sub_25D505FB8(&qword_26A66E810);
}

uint64_t sub_25D505FB8(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B460();
  return v2;
}

void sub_25D506064()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F10);
  uint64_t v7 = OUTLINED_FUNCTION_17_0(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_16_1();
  uint64_t v75 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F18);
  uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19_0();
  sub_25D53B1D0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v74 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_57_3();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D78);
  uint64_t v14 = OUTLINED_FUNCTION_17_0(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v18 = OUTLINED_FUNCTION_17_0(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_37_0();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v20 = OUTLINED_FUNCTION_17_0(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_48_1();
  uint64_t v21 = sub_25D53B2A0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_63_0();
  sub_25D505F94();
  if (v25) {
    goto LABEL_11;
  }
  uint64_t v70 = v3;
  v71 = v16;
  uint64_t v72 = v5;
  uint64_t v73 = v23;
  uint64_t v69 = v4;
  uint64_t v76 = v0;
  if (qword_26A66E808 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D53B450();
  uint64_t v26 = sub_25D53B3C0();
  OUTLINED_FUNCTION_6_10(v2, 1, v26);
  if (v29)
  {
    sub_25D1A3284(v2, &qword_26A672D80);
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v21);
LABEL_9:
    uint64_t v30 = &qword_26A672D70;
    uint64_t v31 = v1;
LABEL_10:
    sub_25D1A3284(v31, v30);
    goto LABEL_11;
  }
  uint64_t v27 = sub_25D53B3B0();
  sub_25D3B5870(v27, v1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v28();
  OUTLINED_FUNCTION_6_10(v1, 1, v21);
  if (v29) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_34_1();
  v32();
  uint64_t v33 = (uint64_t)v71;
  sub_25D53B260();
  uint64_t v34 = sub_25D53B250();
  OUTLINED_FUNCTION_6_10(v33, 1, v34);
  if (v35)
  {
    uint64_t v36 = OUTLINED_FUNCTION_17_43();
    v37(v36);
    uint64_t v30 = &qword_26A672D78;
    uint64_t v31 = v33;
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_0_3();
  uint64_t v39 = v38;
  OUTLINED_FUNCTION_57_25();
  if (v40() != *MEMORY[0x263F727F8])
  {
    uint64_t v46 = OUTLINED_FUNCTION_17_43();
    v47(v46);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v33, v34);
    goto LABEL_11;
  }
  (*(void (**)(uint64_t, uint64_t))(v39 + 96))(v33, v34);
  uint64_t v41 = v75;
  sub_25D53B290();
  uint64_t v42 = sub_25D53B280();
  OUTLINED_FUNCTION_6_10(v41, 1, v42);
  if (v29)
  {
    sub_25D1A3284(v41, &qword_26A674F10);
    uint64_t v43 = sub_25D53B1E0();
    uint64_t v48 = v70;
    OUTLINED_FUNCTION_55_3(v70, v44, v45, v43);
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v52 = OUTLINED_FUNCTION_17_43();
    v53(v52);
    uint64_t v30 = &qword_26A674F18;
    uint64_t v31 = v48;
    goto LABEL_10;
  }
  uint64_t v48 = v70;
  sub_25D53B270();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v49();
  uint64_t v50 = sub_25D53B1E0();
  OUTLINED_FUNCTION_6_10(v48, 1, v50);
  if (v51) {
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_0_3();
  uint64_t v55 = v54;
  OUTLINED_FUNCTION_57_25();
  if (v56() == *MEMORY[0x263F727A8])
  {
    (*(void (**)(uint64_t, uint64_t))(v55 + 96))(v48, v50);
    OUTLINED_FUNCTION_34_1();
    v57();
    uint64_t v58 = (void *)sub_25D53B1A0();
    char v59 = sub_25D22B128(0xD000000000000010, 0x800000025D55D3F0, v58);
    swift_bridgeObjectRelease();
    if (v59)
    {
      if (sub_25D53E400())
      {
        uint64_t v60 = sub_25D53E300();
        uint64_t v61 = sub_25D222C90(v60);
        MEMORY[0x2611ABA10](v61);
        swift_bridgeObjectRelease();
      }
      OUTLINED_FUNCTION_19_5();
      v62();
      uint64_t v63 = OUTLINED_FUNCTION_47_25();
      v64(v63);
    }
    else
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_5();
      v67();
      OUTLINED_FUNCTION_65();
      v68();
    }
  }
  else
  {
    uint64_t v65 = OUTLINED_FUNCTION_17_43();
    v66(v65);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v48, v50);
  }
LABEL_11:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D506724()
{
  return sub_25D506748(&qword_26A66E828);
}

uint64_t sub_25D506748(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  OUTLINED_FUNCTION_52_25();
  return v2;
}

uint64_t sub_25D5067E0()
{
  return sub_25D505FB8(&qword_26A66E838);
}

uint64_t sub_25D506804()
{
  return sub_25D505FB8(&qword_26A66E790);
}

uint64_t sub_25D506828()
{
  return sub_25D505FB8(&qword_26A66E798);
}

uint64_t sub_25D50684C()
{
  return sub_25D506748(&qword_26A66E840);
}

uint64_t sub_25D506870()
{
  return sub_25D505FB8(&qword_26A66E7A8);
}

uint64_t sub_25D506894()
{
  return sub_25D506748(&qword_26A66E848);
}

uint64_t sub_25D5068B8()
{
  return sub_25D506748(&qword_26A66E858);
}

void sub_25D5068DC()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v24 = v1;
  unint64_t v2 = type metadata accessor for SmsContactIntentNode();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_56_0();
  uint64_t v25 = v6;
  OUTLINED_FUNCTION_90();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t v27 = v0;
  if (qword_26A66E7F8 != -1) {
LABEL_31:
  }
    swift_once();
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  sub_25D50A0FC(&qword_26A672618, (void (*)(uint64_t))type metadata accessor for SmsContactIntentNode);
  uint64_t v13 = sub_25D53B430();
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(v13 + 16);
  if (v23)
  {
    v22[2] = v2;
    unint64_t v2 = 0;
    v22[1] = v24;
    do
    {
      if (v2 >= *(void *)(v13 + 16))
      {
        __break(1u);
        goto LABEL_31;
      }
      unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v15 = *(void *)(v4 + 72);
      sub_25D3B9CA0(v13 + v14 + v15 * v2, (uint64_t)v12);
      sub_25D3B9CA0((uint64_t)v12, (uint64_t)v10);
      if (qword_26A66E7C0 != -1) {
        swift_once();
      }
      sub_25D50A0FC(&qword_26A66FCA0, (void (*)(uint64_t))type metadata accessor for SmsContactIntentNode);
      sub_25D53B460();
      if (v26 == 7)
      {
        sub_25D3B9D04((uint64_t)v10);
      }
      else
      {
        unint64_t v16 = 0xE200000000000000;
        uint64_t v17 = 28532;
        switch(v26)
        {
          case 1:
            unint64_t v16 = 0xE400000000000000;
            uint64_t v17 = 1836020326;
            break;
          case 2:
            unint64_t v16 = 0xE700000000000000;
            uint64_t v17 = 0x6563616C706572;
            break;
          case 3:
            unint64_t v16 = 0xE600000000000000;
            uint64_t v17 = 0x65766F6D6572;
            break;
          case 4:
            unint64_t v16 = 0xE600000000000000;
            uint64_t v17 = 0x65726F6E6769;
            break;
          case 5:
            unint64_t v16 = 0xE300000000000000;
            uint64_t v17 = 7301239;
            break;
          case 6:
            unint64_t v16 = 0xE400000000000000;
            uint64_t v17 = 1953391987;
            break;
          default:
            break;
        }
        if (v17 == 28532 && v16 == 0xE200000000000000)
        {
          swift_bridgeObjectRelease_n();
          sub_25D3B9D04((uint64_t)v10);
LABEL_23:
          sub_25D3B9D60((uint64_t)v12, v25);
          uint64_t v20 = v27;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25D1F5D30();
            uint64_t v20 = v27;
          }
          unint64_t v21 = *(void *)(v20 + 16);
          if (v21 >= *(void *)(v20 + 24) >> 1)
          {
            sub_25D1F5D30();
            uint64_t v20 = v27;
          }
          *(void *)(v20 + 16) = v21 + 1;
          sub_25D3B9D60(v25, v20 + v14 + v21 * v15);
          goto LABEL_28;
        }
        char v19 = sub_25D53F090();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25D3B9D04((uint64_t)v10);
        if (v19) {
          goto LABEL_23;
        }
      }
      sub_25D3B9D04((uint64_t)v12);
LABEL_28:
      ++v2;
    }
    while (v23 != v2);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_0();
}

void sub_25D506DE8()
{
  OUTLINED_FUNCTION_45_0();
  v156[6] = sub_25D53B2F0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_19_27(v4);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D68);
  uint64_t v6 = OUTLINED_FUNCTION_17_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_19_27(v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v10 = OUTLINED_FUNCTION_17_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v156 - v13;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_24_2(v15);
  uint64_t v16 = sub_25D53B490();
  OUTLINED_FUNCTION_0_3();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_19_27(v22);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v24 = OUTLINED_FUNCTION_17_0(v23);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (void (*)(void))((char *)v156 - v27);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)v156 - v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D78);
  uint64_t v33 = OUTLINED_FUNCTION_17_0(v32);
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_19_27(v35);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v37 = OUTLINED_FUNCTION_17_0(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_56_0();
  uint64_t v187 = v38;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_24_2(v40);
  uint64_t v41 = sub_25D53B3C0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v43 = v42;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_85_0();
  uint64_t v190 = v46;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_24_2(v49);
  v156[7] = type metadata accessor for SmsContactIntentNode();
  OUTLINED_FUNCTION_0_3();
  uint64_t v51 = v50;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_19_27(v53);
  sub_25D5068DC();
  uint64_t v160 = *(void *)(v54 + 16);
  if (!v160)
  {
    swift_bridgeObjectRelease();
    goto LABEL_91;
  }
  uint64_t v159 = v54 + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
  uint64_t v178 = (uint64_t *)(v18 + 32);
  uint64_t v177 = v18 + 8;
  uint64_t v184 = v43 + 32;
  uint64_t v183 = v43 + 16;
  uint64_t v182 = (uint64_t *)(v43 + 8);
  v156[2] = v1 + 32;
  v156[1] = v1 + 8;
  uint64_t v158 = *(void *)(v51 + 72);
  v156[0] = v54;
  swift_bridgeObjectRetain();
  uint64_t v55 = 0;
  uint64_t v157 = MEMORY[0x263F8EE78];
  uint64_t v185 = v14;
  uint64_t v186 = v16;
  v172 = v28;
  os_log_type_t v167 = v31;
  uint64_t v56 = v187;
  do
  {
    uint64_t v162 = v55;
    uint64_t v57 = v165;
    sub_25D3B9CA0(v159 + v158 * v55, v165);
    uint64_t v58 = sub_25D53B470();
    uint64_t v175 = *(void *)(v58 + 16);
    if (!v175)
    {
      swift_bridgeObjectRelease();
LABEL_76:
      sub_25D3B9D04(v165);
      goto LABEL_77;
    }
    uint64_t v174 = v58 + 32;
    uint64_t v161 = v58;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_49_23();
    while (2)
    {
      uint64_t v181 = v59;
      sub_25D17DB88(v174 + 40 * v59, (uint64_t)v194);
      sub_25D17DB88((uint64_t)v194, (uint64_t)v192);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D88);
      uint64_t v60 = v173;
      if (swift_dynamicCast())
      {
        __swift_storeEnumTagSinglePayload(v60, 0, 1, v41);
        OUTLINED_FUNCTION_5_7();
        OUTLINED_FUNCTION_48_24();
        OUTLINED_FUNCTION_29_9();
        v61();
        sub_25D53B3B0();
        OUTLINED_FUNCTION_53_9();
        if (v62)
        {
          uint64_t v60 = v62 - 1;
          uint64_t v63 = sub_25D53B2A0();
          OUTLINED_FUNCTION_5_3();
          OUTLINED_FUNCTION_84_2();
          v64();
          uint64_t v65 = (uint64_t)v31;
          uint64_t v66 = 0;
        }
        else
        {
          uint64_t v63 = sub_25D53B2A0();
          uint64_t v65 = (uint64_t)v31;
          uint64_t v66 = 1;
        }
        __swift_storeEnumTagSinglePayload(v65, v66, 1, v63);
        swift_bridgeObjectRelease();
        sub_25D53B2A0();
        OUTLINED_FUNCTION_6_10((uint64_t)v31, 1, v63);
        if (v98)
        {
          sub_25D1A3284((uint64_t)v31, &qword_26A672D70);
          uint64_t v112 = sub_25D53B250();
          uint64_t v57 = v170;
          OUTLINED_FUNCTION_55_3(v170, v113, v114, v112);
        }
        else
        {
          OUTLINED_FUNCTION_63_21();
          sub_25D53B260();
          uint64_t v57 = v60;
          OUTLINED_FUNCTION_0_3();
          uint64_t v116 = v115;
          uint64_t v118 = *(void (**)(void))(v117 + 8);
          OUTLINED_FUNCTION_45_6();
          v118();
          uint64_t v119 = sub_25D53B250();
          OUTLINED_FUNCTION_6_10(v57, 1, v119);
          if (!v120)
          {
            sub_25D1A3284(v57, &qword_26A672D78);
            OUTLINED_FUNCTION_36_42();
            OUTLINED_FUNCTION_84_2();
            v123();
            sub_25D53B3B0();
            OUTLINED_FUNCTION_53_9();
            if (v124)
            {
              uint64_t v125 = v164;
              (*(void (**)(uint64_t, unint64_t, uint64_t))(v116 + 16))(v164, v57+ ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80))+ *(void *)(v116 + 72) * (v124 - 1), v63);
              uint64_t v126 = 0;
            }
            else
            {
              uint64_t v126 = 1;
              uint64_t v125 = v164;
            }
            __swift_storeEnumTagSinglePayload(v125, v126, 1, v63);
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_6_10(v125, 1, v63);
            unint64_t v14 = v185;
            if (v98)
            {
              uint64_t v57 = (uint64_t)v182;
              v128 = (void (*)(uint64_t))*v182;
              uint64_t v129 = OUTLINED_FUNCTION_23_48((uint64_t)&v193);
              v128(v129);
              uint64_t v130 = OUTLINED_FUNCTION_23_48((uint64_t)v195);
              v128(v130);
              sub_25D1A3284(v125, &qword_26A672D70);
              OUTLINED_FUNCTION_49_23();
            }
            else
            {
              uint64_t v28 = v163;
              sub_25D53B240();
              OUTLINED_FUNCTION_45_6();
              v118();
              uint64_t v131 = sub_25D53B230();
              OUTLINED_FUNCTION_6_10((uint64_t)v28, 1, v131);
              if (!v132)
              {
                uint64_t v67 = v163;
                char v127 = sub_25D53B220();
                uint64_t v57 = *v182;
                OUTLINED_FUNCTION_39_4();
                ((void (*)(void))v57)();
                OUTLINED_FUNCTION_39_4();
                ((void (*)(void))v57)();
                OUTLINED_FUNCTION_5_3();
                OUTLINED_FUNCTION_65();
                v137();
                OUTLINED_FUNCTION_51_26();
                uint64_t v31 = v167;
                uint64_t v56 = v187;
                goto LABEL_71;
              }
              uint64_t v57 = (uint64_t)v182;
              uint64_t v133 = (void (*)(uint64_t))*v182;
              uint64_t v134 = OUTLINED_FUNCTION_23_48((uint64_t)&v193);
              v133(v134);
              uint64_t v135 = OUTLINED_FUNCTION_23_48((uint64_t)v195);
              v133(v135);
              sub_25D1A3284((uint64_t)v163, &qword_26A672D68);
              OUTLINED_FUNCTION_49_23();
              OUTLINED_FUNCTION_51_26();
            }
            uint64_t v31 = v167;
            goto LABEL_55;
          }
        }
        sub_25D1A3284(v57, &qword_26A672D78);
        OUTLINED_FUNCTION_36_42();
        OUTLINED_FUNCTION_84_2();
        v121();
        v122 = (void (*)(void))*v182;
        OUTLINED_FUNCTION_45_6();
        v122();
        OUTLINED_FUNCTION_164_4();
        OUTLINED_FUNCTION_45_6();
        v122();
        unint64_t v14 = v185;
        OUTLINED_FUNCTION_49_23();
LABEL_55:
        uint64_t v56 = v187;
        goto LABEL_56;
      }
      __swift_storeEnumTagSinglePayload(v60, 1, 1, v41);
      sub_25D1A3284(v60, &qword_26A672D80);
      sub_25D17DB88((uint64_t)v194, (uint64_t)v192);
      if ((swift_dynamicCast() & 1) == 0)
      {
        OUTLINED_FUNCTION_13_3(v57, 1);
        sub_25D1A3284(v57, &qword_26A66FC90);
LABEL_56:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v194);
        goto LABEL_73;
      }
      OUTLINED_FUNCTION_13_3(v57, 0);
      uint64_t v67 = v171;
      uint64_t v176 = *v178;
      OUTLINED_FUNCTION_34_1();
      v68();
      uint64_t v57 = (uint64_t)v67;
      uint64_t v69 = sub_25D53B470();
      uint64_t v189 = *(void *)(v69 + 16);
      if (!v189)
      {
        swift_bridgeObjectRelease();
        char v127 = 0;
        goto LABEL_70;
      }
      uint64_t v188 = v69 + 32;
      uint64_t v168 = v69;
      swift_bridgeObjectRetain();
      uint64_t v70 = 0;
      while (1)
      {
        sub_25D17DB88(v188 + 40 * v70, (uint64_t)v192);
        sub_25D17DB88((uint64_t)v192, (uint64_t)v191);
        if (swift_dynamicCast())
        {
          uint64_t v71 = OUTLINED_FUNCTION_70_13();
          __swift_storeEnumTagSinglePayload(v71, v72, v73, v74);
          OUTLINED_FUNCTION_5_7();
          OUTLINED_FUNCTION_29_9();
          v75();
          sub_25D53B3B0();
          OUTLINED_FUNCTION_53_9();
          if (v76)
          {
            uint64_t v67 = (void (*)(void))(v76 - 1);
            uint64_t v77 = sub_25D53B2A0();
            OUTLINED_FUNCTION_5_3();
            OUTLINED_FUNCTION_84_2();
            v78();
            uint64_t v79 = (uint64_t)v28;
            uint64_t v80 = 0;
          }
          else
          {
            uint64_t v77 = sub_25D53B2A0();
            uint64_t v79 = (uint64_t)v28;
            uint64_t v80 = 1;
          }
          __swift_storeEnumTagSinglePayload(v79, v80, 1, v77);
          swift_bridgeObjectRelease();
          sub_25D53B2A0();
          OUTLINED_FUNCTION_6_10((uint64_t)v28, 1, v77);
          if (v98)
          {
            sub_25D1A3284((uint64_t)v28, &qword_26A672D70);
            uint64_t v89 = sub_25D53B250();
            uint64_t v92 = v179;
            OUTLINED_FUNCTION_55_3(v179, v90, v91, v89);
          }
          else
          {
            OUTLINED_FUNCTION_63_21();
            sub_25D53B260();
            uint64_t v92 = (uint64_t)v67;
            OUTLINED_FUNCTION_0_3();
            uint64_t v94 = v93;
            uint64_t v96 = *(void (**)(void))(v95 + 8);
            OUTLINED_FUNCTION_19_5();
            v96();
            uint64_t v97 = sub_25D53B250();
            OUTLINED_FUNCTION_6_10(v92, 1, v97);
            if (!v98)
            {
              sub_25D1A3284(v92, &qword_26A672D78);
              OUTLINED_FUNCTION_71_14();
              uint64_t v103 = *(void *)(v102 - 256);
              OUTLINED_FUNCTION_84_2();
              v104();
              sub_25D53B3B0();
              OUTLINED_FUNCTION_53_9();
              if (v105)
              {
                uint64_t v28 = v169;
                (*(void (**)(void (*)(void), unint64_t, uint64_t))(v94 + 16))(v169, v103+ ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))+ *(void *)(v94 + 72) * (v105 - 1), v77);
                uint64_t v67 = v28;
                OUTLINED_FUNCTION_51_26();
                uint64_t v106 = 0;
              }
              else
              {
                uint64_t v106 = 1;
                uint64_t v67 = v169;
              }
              __swift_storeEnumTagSinglePayload((uint64_t)v67, v106, 1, v77);
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_6_10((uint64_t)v67, 1, v77);
              if (!v98)
              {
                uint64_t v28 = v166;
                sub_25D53B240();
                OUTLINED_FUNCTION_19_5();
                v96();
                uint64_t v108 = sub_25D53B230();
                OUTLINED_FUNCTION_6_10((uint64_t)v28, 1, v108);
                if (!v109)
                {
                  uint64_t v57 = sub_25D53B220();
                  uint64_t v67 = (void (*)(void))*v182;
                  OUTLINED_FUNCTION_56_26();
                  OUTLINED_FUNCTION_19_5();
                  v67();
                  OUTLINED_FUNCTION_19_5();
                  v67();
                  OUTLINED_FUNCTION_5_3();
                  OUTLINED_FUNCTION_65();
                  v111();
                  unint64_t v14 = v185;
                  uint64_t v16 = v186;
                  uint64_t v56 = v187;
                  OUTLINED_FUNCTION_51_26();
                  goto LABEL_37;
                }
                uint64_t v67 = (void (*)(void))v182;
                uint64_t v57 = *v182;
                uint64_t v110 = OUTLINED_FUNCTION_56_26();
                ((void (*)(uint64_t))v57)(v110);
                ((void (*)(uint64_t, uint64_t))v57)(v190, v41);
                sub_25D1A3284((uint64_t)v28, &qword_26A672D68);
                unint64_t v14 = v185;
                uint64_t v16 = v186;
                OUTLINED_FUNCTION_51_26();
                goto LABEL_29;
              }
              uint64_t v57 = *v182;
              OUTLINED_FUNCTION_56_26();
              OUTLINED_FUNCTION_45_6();
              ((void (*)(void))v57)();
              OUTLINED_FUNCTION_45_6();
              ((void (*)(void))v57)();
              sub_25D1A3284((uint64_t)v67, &qword_26A672D70);
LABEL_28:
              unint64_t v14 = v185;
              uint64_t v16 = v186;
LABEL_29:
              uint64_t v56 = v187;
              goto LABEL_30;
            }
          }
          sub_25D1A3284(v92, &qword_26A672D78);
          OUTLINED_FUNCTION_71_14();
          uint64_t v67 = *(void (**)(void))(v99 - 256);
          uint64_t v100 = v190;
          OUTLINED_FUNCTION_84_2();
          v101();
          uint64_t v57 = *v182;
          OUTLINED_FUNCTION_164_4();
          OUTLINED_FUNCTION_19_5();
          ((void (*)(void))v57)();
          ((void (*)(uint64_t, uint64_t))v57)(v100, v41);
          goto LABEL_28;
        }
        uint64_t v81 = OUTLINED_FUNCTION_69_18();
        __swift_storeEnumTagSinglePayload(v81, v82, v83, v84);
        sub_25D1A3284(v56, &qword_26A672D80);
        sub_25D17DB88((uint64_t)v192, (uint64_t)v191);
        if (swift_dynamicCast()) {
          break;
        }
        OUTLINED_FUNCTION_13_3((uint64_t)v14, 1);
        sub_25D1A3284((uint64_t)v14, &qword_26A66FC90);
LABEL_30:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v192);
LABEL_38:
        if (++v70 == v189)
        {
          OUTLINED_FUNCTION_37_21();
          char v127 = 0;
          goto LABEL_69;
        }
      }
      OUTLINED_FUNCTION_13_3((uint64_t)v14, 0);
      OUTLINED_FUNCTION_34_1();
      v85();
      uint64_t v86 = sub_25D53B470();
      uint64_t v67 = *(void (**)(void))(v86 + 16);
      if (v67)
      {
        uint64_t v87 = v86 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_25D17DB88(v87, (uint64_t)v191);
          char v88 = sub_25D509B14((uint64_t)v191);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
          if (v88) {
            break;
          }
          v87 += 40;
          uint64_t v67 = (void (*)(void))((char *)v67 - 1);
          if (!v67)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v57 = 0;
            goto LABEL_35;
          }
        }
        swift_bridgeObjectRelease_n();
        uint64_t v57 = 1;
LABEL_35:
        uint64_t v16 = v186;
        uint64_t v56 = v187;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v57 = 0;
      }
      OUTLINED_FUNCTION_5_7();
      v107(v180, v16);
LABEL_37:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v192);
      if ((v57 & 1) == 0) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_37_21();
      char v127 = 1;
LABEL_69:
      uint64_t v31 = v167;
LABEL_70:
      OUTLINED_FUNCTION_5_7();
      v136(v171, v16);
LABEL_71:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v194);
      if ((v127 & 1) == 0)
      {
        OUTLINED_FUNCTION_49_23();
LABEL_73:
        uint64_t v59 = v181 + 1;
        if (v181 + 1 == v175)
        {
          OUTLINED_FUNCTION_37_21();
          goto LABEL_76;
        }
        continue;
      }
      break;
    }
    OUTLINED_FUNCTION_37_21();
    if (qword_26A66E7B0 != -1) {
      swift_once();
    }
    sub_25D50A0FC(&qword_26A66FCA0, (void (*)(uint64_t))type metadata accessor for SmsContactIntentNode);
    OUTLINED_FUNCTION_63_21();
    sub_25D53B440();
    OUTLINED_FUNCTION_6_10((uint64_t)v67, 1, v16);
    if (v98)
    {
      sub_25D1A3284((uint64_t)v67, &qword_26A66FC90);
      goto LABEL_76;
    }
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_48_24();
    OUTLINED_FUNCTION_29_9();
    v138();
    OUTLINED_FUNCTION_63_21();
    sub_25D53B2E0();
    OUTLINED_FUNCTION_65();
    v139();
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_48_24();
    OUTLINED_FUNCTION_29_9();
    v140();
    uint64_t v141 = sub_25D53B6C0();
    uint64_t v189 = v142;
    OUTLINED_FUNCTION_103_5();
    uint64_t v188 = sub_25D53B6F0();
    uint64_t v181 = v143;
    OUTLINED_FUNCTION_103_5();
    uint64_t v144 = sub_25D53B6D0();
    uint64_t v146 = v145;
    OUTLINED_FUNCTION_65();
    v147();
    sub_25D3B9D04(v165);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v149 = v157;
    }
    else
    {
      sub_25D1F36EC();
      uint64_t v149 = v154;
    }
    unint64_t v150 = *(void *)(v149 + 16);
    if (v150 >= *(void *)(v149 + 24) >> 1)
    {
      sub_25D1F36EC();
      uint64_t v149 = v155;
    }
    *(void *)(v149 + 16) = v150 + 1;
    uint64_t v157 = v149;
    v151 = (void *)(v149 + 48 * v150);
    uint64_t v152 = v189;
    v151[4] = v141;
    v151[5] = v152;
    uint64_t v56 = v187;
    uint64_t v153 = v181;
    v151[6] = v188;
    v151[7] = v153;
    v151[8] = v144;
    v151[9] = v146;
    unint64_t v14 = v185;
LABEL_77:
    uint64_t v55 = v162 + 1;
  }
  while (v162 + 1 != v160);
  OUTLINED_FUNCTION_37_21();
LABEL_91:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D5080E4()
{
  if (qword_26A66E7A0 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  return sub_25D53B460();
}

uint64_t sub_25D5081A8()
{
  int v0 = sub_25D50684C();
  uint64_t v1 = 1;
  if (v0 == 1) {
    uint64_t v1 = 2;
  }
  if (v0 == 6) {
    return 0;
  }
  else {
    return v1;
  }
}

id sub_25D5081D8()
{
  uint64_t v0 = sub_25D506804();
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = v0;
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10108]), sel_init);
    if (v4) {
      sub_25D43C3DC(v3, (uint64_t)v2, v4);
    }
    else {
      swift_bridgeObjectRelease();
    }
    id v2 = (id)INIntentSlotValueTransformFromDataString();
  }
  return v2;
}

uint64_t sub_25D508264()
{
  if (qword_26A66E850 != -1) {
    swift_once();
  }
  type metadata accessor for SmsNLv3Intent();
  sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
  OUTLINED_FUNCTION_52_25();
  uint64_t result = 0;
  if (v2 == 8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_25D541A10;
    *(void *)(v1 + 32) = objc_msgSend(self, sel_attachmentWithCurrentLocation);
    sub_25D53E4E0();
    return v1;
  }
  return result;
}

uint64_t sub_25D50837C()
{
  return sub_25D506748(&qword_26A66E850);
}

void sub_25D5083A0()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v3 = v2;
  uint64_t v91 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F10);
  uint64_t v6 = OUTLINED_FUNCTION_17_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_6();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A674F18);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_16_1();
  uint64_t v95 = v9;
  uint64_t v97 = sub_25D53B2A0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v94 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16_1();
  uint64_t v96 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v14 = OUTLINED_FUNCTION_17_0(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v18 = OUTLINED_FUNCTION_17_0(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_40_2();
  uint64_t v21 = v19 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v84 - v23;
  uint64_t v93 = sub_25D53B3C0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_40_2();
  uint64_t v30 = (uint8_t *)(v28 - v29);
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v84 - v32;
  uint64_t v89 = sub_25D53DBF0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v88 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_19_0();
  if (qword_26A66E780 != -1) {
    swift_once();
  }
  uint64_t v90 = v30;
  id v36 = (id)qword_26A688F28;
  sub_25D53DBD0();
  sub_25D53E870();
  uint64_t v87 = v0;
  sub_25D53DBC0();
  sub_25D509AAC(v3, (uint64_t)v16);
  uint64_t v37 = sub_25D53B490();
  OUTLINED_FUNCTION_6_10((uint64_t)v16, 1, v37);
  if (v49)
  {
    sub_25D1A3284((uint64_t)v16, &qword_26A66FC90);
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v102 = 0;
LABEL_46:
    sub_25D1A3284((uint64_t)&v100, &qword_26A674F20);
    OUTLINED_FUNCTION_42_32((uint64_t)v24, 1);
    goto LABEL_47;
  }
  uint64_t v38 = sub_25D53B470();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v39();
  uint64_t v40 = *(void *)(v38 + 16);
  uint64_t v41 = v93;
  uint64_t v92 = v33;
  if (!v40)
  {
LABEL_21:
    uint64_t v102 = 0;
    long long v100 = 0u;
    long long v101 = 0u;
    swift_bridgeObjectRelease();
    uint64_t v51 = v90;
    goto LABEL_24;
  }
  uint64_t v86 = v24;
  uint64_t v42 = v38 + 32;
  unint64_t v85 = (char *)v38;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_25D17DB88(v42, (uint64_t)v99);
    sub_25D17DB88((uint64_t)v99, (uint64_t)&v98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D88);
    if (swift_dynamicCast())
    {
      OUTLINED_FUNCTION_42_32(v21, 0);
      uint64_t v43 = sub_25D53B3A0();
      uint64_t v44 = v41;
      uint64_t v45 = v43;
      uint64_t v37 = v46;
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v21, v44);
    }
    else
    {
      OUTLINED_FUNCTION_42_32(v21, 1);
      sub_25D1A3284(v21, &qword_26A672D80);
      uint64_t v45 = 0;
      uint64_t v37 = 0;
    }
    if (qword_26A66E7A8 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_25D53AFB0();
    uint64_t v16 = v48;
    if (!v37)
    {
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    BOOL v49 = v45 == v47 && v37 == (void)v48;
    if (v49) {
      break;
    }
    char v50 = sub_25D53F090();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v50)
    {
      uint64_t v16 = v85;
      goto LABEL_23;
    }
LABEL_19:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
    v42 += 40;
    --v40;
    uint64_t v41 = v93;
    if (!v40)
    {
      uint64_t v37 = (uint64_t)v85;
      swift_bridgeObjectRelease();
      uint64_t v33 = v92;
      uint64_t v24 = v86;
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  swift_bridgeObjectRelease();
  sub_25D188958(v99, (uint64_t)&v100);
  swift_bridgeObjectRelease();
  uint64_t v33 = v92;
  uint64_t v41 = v93;
  uint64_t v51 = v90;
  uint64_t v24 = v86;
LABEL_24:
  if (!*((void *)&v101 + 1)) {
    goto LABEL_46;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D88);
  int v52 = swift_dynamicCast();
  OUTLINED_FUNCTION_42_32((uint64_t)v24, v52 ^ 1u);
  OUTLINED_FUNCTION_6_10((uint64_t)v24, 1, v41);
  if (v49)
  {
LABEL_47:
    sub_25D1A3284((uint64_t)v24, &qword_26A672D80);
    sub_25D4FAAAC(0xD00000000000008CLL, 0x800000025D55D2D0);
    OUTLINED_FUNCTION_65_19();
    uint64_t v80 = 425;
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_34_1();
  v53();
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_25D53DC10();
  __swift_project_value_buffer(v54, (uint64_t)qword_26A688F10);
  (*(void (**)(uint8_t *, char *, uint64_t))(v26 + 16))(v51, v33, v41);
  uint64_t v37 = sub_25D53DC00();
  os_log_type_t v55 = sub_25D53E7B0();
  if (os_log_type_enabled((os_log_t)v37, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    *(void *)&long long v100 = v57;
    *(_DWORD *)uint64_t v56 = 136315138;
    uint64_t v90 = v56 + 4;
    sub_25D50A0FC(&qword_26A674F28, MEMORY[0x263F728A8]);
    uint64_t v58 = sub_25D53F050();
    *(void *)&v99[0] = sub_25D19E114(v58, v59, (uint64_t *)&v100);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    uint64_t v86 = *(char **)(v26 + 8);
    ((void (*)(uint8_t *, uint64_t))v86)(v51, v93);
    _os_log_impl(&dword_25D16D000, (os_log_t)v37, v55, "#SmsNLv3Intent successfully extracted smsMessage node from NL intent: %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611AD370](v57, -1, -1);
    MEMORY[0x2611AD370](v56, -1, -1);
  }
  else
  {
    uint64_t v86 = *(char **)(v26 + 8);
    ((void (*)(uint8_t *, uint64_t))v86)(v51, v41);
  }

  uint64_t v90 = (uint8_t *)v26;
  uint64_t v16 = v33;
  uint64_t v60 = sub_25D53B3B0();
  uint64_t v61 = *(void *)(v60 + 16);
  if (v61)
  {
    uint64_t v62 = v94 + 16;
    uint64_t v63 = *(void (**)(char *, unint64_t, uint64_t))(v94 + 16);
    unint64_t v64 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
    unint64_t v85 = (char *)v60;
    unint64_t v65 = v60 + v64;
    LODWORD(v94) = *MEMORY[0x263F727A8];
    uint64_t v66 = *(void *)(v62 + 56);
    while (1)
    {
      uint64_t v16 = v96;
      v63(v96, v65, v97);
      sub_25D53B290();
      sub_25D53B280();
      uint64_t v67 = OUTLINED_FUNCTION_66_14();
      OUTLINED_FUNCTION_6_10(v67, v68, v69);
      if (v49) {
        break;
      }
      uint64_t v26 = v95;
      sub_25D53B270();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_65();
      v73();
      uint64_t v16 = (char *)sub_25D53B1E0();
      OUTLINED_FUNCTION_6_10(v26, 1, (uint64_t)v16);
      if (v74) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_0_3();
      uint64_t v37 = v76;
      OUTLINED_FUNCTION_57_25();
      if (v77() == v94) {
        goto LABEL_44;
      }
      OUTLINED_FUNCTION_19_5();
      v78();
      uint64_t v79 = *(void (**)(uint64_t, char *))(v37 + 8);
      v37 += 8;
      v79(v26, v16);
LABEL_41:
      v65 += v66;
      if (!--v61) {
        goto LABEL_42;
      }
    }
    sub_25D1A3284(v1, &qword_26A674F10);
    uint64_t v70 = sub_25D53B1E0();
    uint64_t v26 = v95;
    OUTLINED_FUNCTION_55_3(v95, v71, v72, v70);
LABEL_38:
    OUTLINED_FUNCTION_19_5();
    v75();
    sub_25D1A3284(v26, &qword_26A674F18);
    goto LABEL_41;
  }
LABEL_42:
  swift_bridgeObjectRelease();
  sub_25D4FAAAC(0xD000000000000089, 0x800000025D55D360);
  OUTLINED_FUNCTION_65_19();
  uint64_t v80 = 435;
LABEL_43:
  uint64_t v84 = v80;
  sub_25D53EE80();
  __break(1u);
LABEL_44:
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *))(v37 + 96))(v26, v16);
  sub_25D53B1D0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_29_9();
  v81();
  sub_25D53E860();
  sub_25D53DBC0();
  OUTLINED_FUNCTION_19_5();
  v82();
  ((void (*)(char *, uint64_t))v86)(v92, v93);
  OUTLINED_FUNCTION_65();
  v83();
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D508E90()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v2 = OUTLINED_FUNCTION_17_0(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_48_1();
  sub_25D53B1D0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19_0();
  sub_25D53BF10();
  sub_25D5083A0();
  sub_25D1A3284(v0, &qword_26A66FC90);
  uint64_t v4 = sub_25D53B1C0();
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }
  sub_25D53B1B0();
  OUTLINED_FUNCTION_45_6();
  v7();
  return v6;
}

uint64_t sub_25D508FA0()
{
  char v0 = sub_25D50837C();
  if (v0 != 17)
  {
    if (sub_25D37A6C8(v0) != 0x697461636F4C796DLL || v7 != 0xEA00000000006E6FLL)
    {
      sub_25D53F090();
      OUTLINED_FUNCTION_62_14();
      return 0;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((sub_25D504750() & 1) == 0)
  {
    if ((sub_25D504670() & 1) == 0) {
      return 0;
    }
    if (sub_25D50837C() == 17)
    {
      char v1 = OUTLINED_FUNCTION_64_16();
      if (!v5)
      {
        sub_25D379480(v1);
        if (v9 != 6647407 || v10 != 0xE300000000000000)
        {
          sub_25D53F090();
          OUTLINED_FUNCTION_62_14();
          return 1;
        }
LABEL_25:
        swift_bridgeObjectRelease();
        return 1;
      }
      char v2 = OUTLINED_FUNCTION_64_16();
      if (!v5)
      {
        sub_25D379480(v2);
        BOOL v5 = v4 == 1936287860 && v3 == 0xE400000000000000;
        if (!v5)
        {
          OUTLINED_FUNCTION_67_13();
          OUTLINED_FUNCTION_118_0();
          return 0;
        }
        goto LABEL_25;
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_25D509100()
{
  if (qword_26A66E860 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_25D50915C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SiriMessagesFlow13SmsNLv3Intent_nlIntent;
  sub_25D53BF40();
  OUTLINED_FUNCTION_5_3();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t sub_25D5091CC()
{
  sub_25D53BF40();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_65();
  v0();
  return swift_deallocClassInstance();
}

uint64_t sub_25D509264()
{
  return type metadata accessor for SmsNLv3Intent();
}

uint64_t type metadata accessor for SmsNLv3Intent()
{
  uint64_t result = qword_26A674EA0;
  if (!qword_26A674EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D5092B4()
{
  uint64_t result = sub_25D53BF40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25D509344@<X0>(uint64_t a1@<X8>)
{
  return sub_25D50915C(a1);
}

uint64_t sub_25D509368()
{
  return sub_25D509100();
}

uint64_t sub_25D509380()
{
  return sub_25D505CB0();
}

uint64_t sub_25D5093A4()
{
  return sub_25D5045B4() & 1;
}

uint64_t sub_25D5093CC()
{
  return sub_25D504670() & 1;
}

uint64_t sub_25D5093F4()
{
  return sub_25D504CC8() & 1;
}

uint64_t sub_25D50941C()
{
  return sub_25D504750() & 1;
}

uint64_t sub_25D509444()
{
  return sub_25D5048D0() & 1;
}

BOOL sub_25D50946C()
{
  return sub_25D504940();
}

uint64_t sub_25D509494()
{
  return sub_25D5049F8() & 1;
}

uint64_t sub_25D5094BC()
{
  return sub_25D504A78() & 1;
}

uint64_t sub_25D5094E4()
{
  return sub_25D504AF0() & 1;
}

uint64_t sub_25D50950C()
{
  return sub_25D504B68() & 1;
}

uint64_t sub_25D509534()
{
  return sub_25D504BD8() & 1;
}

uint64_t sub_25D50955C()
{
  return sub_25D5046E0() & 1;
}

uint64_t sub_25D509584()
{
  return sub_25D504C50() & 1;
}

uint64_t sub_25D5095AC()
{
  return sub_25D504D50() & 1;
}

uint64_t sub_25D5095D4()
{
  return sub_25D504DC0() & 1;
}

uint64_t sub_25D5095FC()
{
  return sub_25D504E1C() & 1;
}

uint64_t sub_25D509624()
{
  return sub_25D504F84() & 1;
}

uint64_t sub_25D50964C()
{
  return sub_25D504FA8() & 1;
}

uint64_t sub_25D509674()
{
  sub_25D505274();
  return v0 & 1;
}

BOOL sub_25D50969C()
{
  return sub_25D505600();
}

uint64_t sub_25D5096C4()
{
  return sub_25D505844() & 1;
}

uint64_t sub_25D5096EC@<X0>(uint64_t a1@<X8>)
{
  return sub_25D505868(a1);
}

uint64_t sub_25D509710()
{
  return sub_25D505F4C();
}

uint64_t sub_25D509734()
{
  return sub_25D505F70();
}

void sub_25D509758()
{
}

uint64_t sub_25D50977C()
{
  return sub_25D506724();
}

uint64_t sub_25D5097A0()
{
  return sub_25D50684C();
}

uint64_t sub_25D5097C4()
{
  return sub_25D506870();
}

uint64_t sub_25D5097E8()
{
  return sub_25D506894();
}

uint64_t sub_25D50980C()
{
  return sub_25D5068B8();
}

void sub_25D509830()
{
}

uint64_t sub_25D509854()
{
  return sub_25D5081A8();
}

uint64_t sub_25D509878()
{
  return sub_25D50837C();
}

uint64_t sub_25D50989C()
{
  return sub_25D508E90();
}

uint64_t sub_25D5098C0()
{
  return sub_25D508FA0() & 1;
}

uint64_t sub_25D5098E8()
{
  sub_25D505948();
  return v0 & 1;
}

uint64_t sub_25D509910(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F6CA70](a1, WitnessTable);
}

uint64_t sub_25D509974(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F6CA60](a1, WitnessTable);
}

uint64_t sub_25D5099C8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F6CA68](a1, WitnessTable);
}

uint64_t sub_25D509A1C()
{
  return sub_25D50A0FC(&qword_26A674EB0, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
}

uint64_t sub_25D509A64()
{
  return sub_25D50A0FC(&qword_26A674EB8, (void (*)(uint64_t))type metadata accessor for SmsNLv3Intent);
}

uint64_t sub_25D509AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D509B14(uint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D68);
  uint64_t v5 = OUTLINED_FUNCTION_17_0(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_38_32(v6, v70[0]);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D70);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_56_0();
  uint64_t v71 = v9;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_50_1();
  uint64_t v75 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D78);
  uint64_t v13 = OUTLINED_FUNCTION_17_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_16_1();
  uint64_t v74 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC90);
  uint64_t v16 = OUTLINED_FUNCTION_17_0(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_63_0();
  uint64_t v17 = sub_25D53B490();
  OUTLINED_FUNCTION_0_3();
  uint64_t v72 = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D80);
  uint64_t v23 = OUTLINED_FUNCTION_17_0(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_9_6();
  uint64_t v24 = sub_25D53B3C0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v73 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_40_2();
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)v70 - v28;
  sub_25D17DB88(a1, (uint64_t)v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D88);
  if (swift_dynamicCast())
  {
    uint64_t v30 = v74;
    uint64_t v31 = OUTLINED_FUNCTION_70_13();
    __swift_storeEnumTagSinglePayload(v31, v32, v33, v34);
    uint64_t v35 = v73;
    OUTLINED_FUNCTION_34_1();
    v36();
    uint64_t v37 = sub_25D53B3B0();
    uint64_t v38 = v75;
    sub_25D3B5870(v37, v75);
    swift_bridgeObjectRelease();
    sub_25D53B2A0();
    uint64_t v39 = OUTLINED_FUNCTION_66_14();
    uint64_t v42 = v29;
    uint64_t v43 = v35;
    if (__swift_getEnumTagSinglePayload(v39, v40, v41) == 1)
    {
      sub_25D1A3284(v38, &qword_26A672D70);
      uint64_t v44 = sub_25D53B250();
      uint64_t v45 = v30;
      __swift_storeEnumTagSinglePayload(v30, 1, 1, v44);
LABEL_7:
      sub_25D1A3284(v45, &qword_26A672D78);
      OUTLINED_FUNCTION_61_18();
      OUTLINED_FUNCTION_50_21();
      v56();
      uint64_t v57 = *(void (**)(void))(v43 + 8);
      OUTLINED_FUNCTION_39_4();
      v57();
      OUTLINED_FUNCTION_39_4();
      v57();
LABEL_10:
      char v52 = 0;
      return v52 & 1;
    }
    uint64_t v45 = v30;
    sub_25D53B260();
    OUTLINED_FUNCTION_5_3();
    uint64_t v54 = *(void (**)(void))(v53 + 8);
    OUTLINED_FUNCTION_45_6();
    v54();
    uint64_t v55 = sub_25D53B250();
    if (__swift_getEnumTagSinglePayload(v30, 1, v55) == 1) {
      goto LABEL_7;
    }
    uint64_t v75 = (uint64_t)v54;
    sub_25D1A3284(v30, &qword_26A672D78);
    OUTLINED_FUNCTION_61_18();
    uint64_t v74 = (uint64_t)v42;
    OUTLINED_FUNCTION_50_21();
    v60();
    uint64_t v61 = sub_25D53B3B0();
    uint64_t v2 = v71;
    sub_25D3B5870(v61, v71);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v2, 1, v37) == 1)
    {
      uint64_t v62 = *(void (**)(uint64_t))(v43 + 8);
      uint64_t v63 = OUTLINED_FUNCTION_164_4();
      v62(v63);
      ((void (*)(uint64_t, uint64_t))v62)(v74, v24);
      uint64_t v58 = &qword_26A672D70;
      goto LABEL_9;
    }
    uint64_t v64 = v70[1];
    sub_25D53B240();
    OUTLINED_FUNCTION_45_6();
    v65();
    uint64_t v66 = sub_25D53B230();
    if (__swift_getEnumTagSinglePayload(v64, 1, v66) == 1)
    {
      uint64_t v67 = *(void (**)(void))(v43 + 8);
      OUTLINED_FUNCTION_39_4();
      v67();
      OUTLINED_FUNCTION_39_4();
      v67();
      sub_25D1A3284(v64, &qword_26A672D68);
      char v52 = 0;
    }
    else
    {
      char v52 = sub_25D53B220();
      uint64_t v68 = *(void (**)(void))(v43 + 8);
      OUTLINED_FUNCTION_39_4();
      v68();
      OUTLINED_FUNCTION_39_4();
      v68();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_65();
      v69();
    }
  }
  else
  {
    uint64_t v46 = v72;
    uint64_t v47 = OUTLINED_FUNCTION_69_18();
    __swift_storeEnumTagSinglePayload(v47, v48, v49, v50);
    sub_25D1A3284(v1, &qword_26A672D80);
    sub_25D17DB88(a1, (uint64_t)v76);
    if ((swift_dynamicCast() & 1) == 0)
    {
      __swift_storeEnumTagSinglePayload(v2, 1, 1, v17);
      uint64_t v58 = &qword_26A66FC90;
LABEL_9:
      sub_25D1A3284(v2, v58);
      goto LABEL_10;
    }
    __swift_storeEnumTagSinglePayload(v2, 0, 1, v17);
    OUTLINED_FUNCTION_34_1();
    v51();
    char v52 = sub_25D502C28();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v21, v17);
  }
  return v52 & 1;
}

uint64_t sub_25D50A0FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_2_71()
{
  return sub_25D5068B8();
}

uint64_t OUTLINED_FUNCTION_12_61(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_25D503CAC(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000, a5);
}

uint64_t OUTLINED_FUNCTION_17_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_51(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_25D503CAC(a1, a2, a3, 0xE700000000000000, a5);
}

uint64_t OUTLINED_FUNCTION_21_48(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_25D503CAC(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000, a5);
}

uint64_t OUTLINED_FUNCTION_22_46(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_23_48@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_35_34()
{
  return sub_25D53F090();
}

uint64_t OUTLINED_FUNCTION_36_42()
{
  return *(void *)(v0 - 392);
}

uint64_t OUTLINED_FUNCTION_37_35(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_25D503CAC(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xED00000000000000, a5);
}

void OUTLINED_FUNCTION_38_32(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_39_40()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_42_32(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_43_28(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_25D503CAC(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000, a5);
}

uint64_t OUTLINED_FUNCTION_47_25()
{
  return *(void *)(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_48_24()
{
  return *(void *)(v0 - 256);
}

uint64_t OUTLINED_FUNCTION_52_25()
{
  return sub_25D53B460();
}

uint64_t OUTLINED_FUNCTION_56_26()
{
  return *(void *)(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_61_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_64_16()
{
  return sub_25D506894();
}

uint64_t OUTLINED_FUNCTION_66_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_70_13()
{
  return v0;
}

uint64_t sub_25D50A3A4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v6 = (char *)v20 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v20 - v7;
  uint64_t v9 = sub_25D53D0A0();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
  uint64_t v10 = sub_25D53D300();
  if (v11)
  {
    v20[2] = v10;
    void v20[3] = v11;
    v20[0] = 0x6C7070612E6D6F63;
    v20[1] = 0xE900000000000065;
    sub_25D203CC4();
    sub_25D203D10();
    char v12 = sub_25D53E180();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = 0;
  }
  uint64_t v13 = (void *)sub_25D539C90();
  if (v13)
  {
    uint64_t v14 = sub_25D50A5BC(v13);
    if (v15)
    {
      uint64_t v16 = HIBYTE(v15) & 0xF;
      if ((v15 & 0x2000000000000000) == 0) {
        uint64_t v16 = v14 & 0xFFFFFFFFFFFFLL;
      }
      if (v16)
      {
        sub_25D53E2C0();
        swift_bridgeObjectRelease();
        sub_25D17C9AC((uint64_t)v8);
        uint64_t v17 = 0;
      }
      else
      {
        sub_25D17C9AC((uint64_t)v8);
        swift_bridgeObjectRelease();
        uint64_t v17 = 1;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v6, v17, 1, v9);
      sub_25D17CA58((uint64_t)v6, (uint64_t)v8);
    }
  }
  sub_25D17CAC0((uint64_t)v8, (uint64_t)v3);
  uint64_t v18 = sub_25D4817A0((uint64_t)v3, v12 & 1);
  swift_release();
  sub_25D17C9AC((uint64_t)v8);
  return v18;
}

uint64_t sub_25D50A5BC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_displayAppName);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D53E200();

  return v3;
}

uint64_t sub_25D50A62C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_92_7(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v7);
  uint64_t v8 = OUTLINED_FUNCTION_92();
  uint64_t v9 = OUTLINED_FUNCTION_223_1(v8);
  v0[46] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[47] = v10;
  v0[48] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D50A9B0: call analysis failed (funcsize=262)"

uint64_t sub_25D50AB44()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    OUTLINED_FUNCTION_181_3();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D50AEA0: call analysis failed (funcsize=224)"

uint64_t sub_25D50B014()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50B114()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "25D50B29C: call analysis failed (funcsize=77)"

uint64_t sub_25D50B32C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50B42C()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_65_20();
  if (OUTLINED_FUNCTION_216_1())
  {
    uint64_t v0 = *(void *)(v1 + 320);
    sub_25D53A210();
  }
  else
  {
    OUTLINED_FUNCTION_370();
  }
  OUTLINED_FUNCTION_202_1();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0);
  OUTLINED_FUNCTION_15_55();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_2();
  return v7(v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_25D50B4D4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_92_7(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v7);
  uint64_t v8 = OUTLINED_FUNCTION_92();
  uint64_t v9 = OUTLINED_FUNCTION_223_1(v8);
  v0[46] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[47] = v10;
  v0[48] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D50B840: call analysis failed (funcsize=256)"

uint64_t sub_25D50B9D4()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    OUTLINED_FUNCTION_181_3();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D50BD30: call analysis failed (funcsize=224)"

uint64_t sub_25D50BEA4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "25D50C02C: call analysis failed (funcsize=77)"

uint64_t sub_25D50C0BC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50C1BC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_92_7(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v7);
  uint64_t v8 = OUTLINED_FUNCTION_92();
  uint64_t v9 = OUTLINED_FUNCTION_223_1(v8);
  v0[46] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[47] = v10;
  v0[48] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D50C534: call analysis failed (funcsize=259)"

uint64_t sub_25D50C6C8()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    OUTLINED_FUNCTION_181_3();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D50CA24: call analysis failed (funcsize=224)"

uint64_t sub_25D50CB98()
{
  OUTLINED_FUNCTION_67();
  uint64_t v1 = *(void **)(v0 + 424);
  *(void *)(v0 + 296) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
  if (swift_dynamicCast())
  {

    uint64_t v3 = sub_25D53DC00();
    os_log_type_t v4 = sub_25D53E7B0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_96_0(v5);
      OUTLINED_FUNCTION_148_2(&dword_25D16D000, v3, v6, "#MessagesFlowStrategy snippet update failed due to barge-in, generating empty output");
      OUTLINED_FUNCTION_3_0();
    }
    uint64_t v7 = *(uint64_t **)(v0 + 304);

    sub_25D53A250();
    uint64_t v8 = sub_25D53A710();
    uint64_t v9 = MEMORY[0x263F6FFF0];
    v7[3] = v8;
    v7[4] = v9;
    __swift_allocate_boxed_opaque_existential_0(v7);
    sub_25D53A6E0();
    __swift_destroy_boxed_opaque_existential_0(v0 + 216);
    OUTLINED_FUNCTION_169_3();
    v15(v10, v11, v12, v13, v14);

    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0(v0 + 216);

    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
  }
  return v16();
}

uint64_t sub_25D50CD68()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *id v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50CE68()
{
  OUTLINED_FUNCTION_14();

  uint64_t v1 = (long long *)OUTLINED_FUNCTION_48_5();
  sub_25D188958(v1, v2);
  sub_25D188958((long long *)(v0 + 16), *(void *)(v0 + 304));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v3();
}

uint64_t sub_25D50CEF0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "25D50D078: call analysis failed (funcsize=77)"

uint64_t sub_25D50D108()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50D208()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_65_20();
  if (OUTLINED_FUNCTION_216_1())
  {
    uint64_t v0 = *(void *)(v1 + 320);
    sub_25D53A210();
  }
  else
  {
    OUTLINED_FUNCTION_370();
  }
  OUTLINED_FUNCTION_202_1();
  *(void *)(v5 + 24) = v3;
  *(void *)(v5 + 32) = v4;
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0);
  OUTLINED_FUNCTION_15_55();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_2();
  return v7(v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_25D50D2B0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_92_7(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v7);
  uint64_t v8 = OUTLINED_FUNCTION_92();
  uint64_t v9 = OUTLINED_FUNCTION_223_1(v8);
  v0[46] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[47] = v10;
  v0[48] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D50D628: call analysis failed (funcsize=259)"

uint64_t sub_25D50D7BC()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    OUTLINED_FUNCTION_181_3();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D50DB18: call analysis failed (funcsize=224)"

uint64_t sub_25D50DC8C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "25D50DE14: call analysis failed (funcsize=77)"

uint64_t sub_25D50DEA4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50DFA4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_92_7(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v7);
  uint64_t v8 = OUTLINED_FUNCTION_92();
  uint64_t v9 = OUTLINED_FUNCTION_223_1(v8);
  v0[46] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[47] = v10;
  v0[48] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

#error "25D50E31C: call analysis failed (funcsize=259)"

uint64_t sub_25D50E4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[43] = a6;
  v7[44] = v6;
  v7[41] = a4;
  v7[42] = a5;
  v7[39] = a2;
  v7[40] = a3;
  v7[38] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  v7[45] = swift_task_alloc();
  uint64_t v8 = sub_25D539860();
  v7[46] = v8;
  v7[47] = *(void *)(v8 - 8);
  v7[48] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D50E5AC, 0, 0);
}

#error "25D50E870: call analysis failed (funcsize=256)"

uint64_t sub_25D50EA04()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    OUTLINED_FUNCTION_181_3();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "25D50ED60: call analysis failed (funcsize=224)"

uint64_t sub_25D50EED4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "25D50F05C: call analysis failed (funcsize=77)"

uint64_t sub_25D50F0EC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D50F1EC()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_65_20();
  if (OUTLINED_FUNCTION_216_1())
  {
    uint64_t v0 = *(void *)(v1 + 320);
    sub_25D53A210();
  }
  else
  {
    OUTLINED_FUNCTION_370();
  }
  OUTLINED_FUNCTION_202_1();
  *(void *)(v5 + 256) = v3;
  *(void *)(v5 + 264) = v4;
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0);
  OUTLINED_FUNCTION_15_55();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26_2();
  return v7(v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_25D50F294(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_25D51CB18(a1, (uint64_t)sub_25D43C960, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_25D50F320()
{
}

void sub_25D50F348(uint64_t a1)
{
  sub_25D194F04(a1, (uint64_t)v9, &qword_26A671A70);
  if (v10)
  {
    __swift_project_boxed_opaque_existential_0(v9, v10);
    OUTLINED_FUNCTION_0_3();
    MEMORY[0x270FA5388](v2);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_59_1();
    v3();
    uint64_t v4 = sub_25D53F070();
    OUTLINED_FUNCTION_19_5();
    v5();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v6 = (void *)sub_25D50F9BC();
  id v7 = objc_msgSend(v6, sel_facadePropertyName);

  if (v7)
  {
    sub_25D53E200();

    uint64_t v8 = (void *)sub_25D53E1D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setValue_forKey_, v4, v8);
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_25D50F4BC()
{
}

void sub_25D50F4E4()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_25D194F04(v9, (uint64_t)v17, &qword_26A671A70);
  if (v18)
  {
    __swift_project_boxed_opaque_existential_0(v17, v18);
    OUTLINED_FUNCTION_0_3();
    MEMORY[0x270FA5388](v10);
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_59_1();
    v11();
    OUTLINED_FUNCTION_75_8();
    uint64_t v12 = sub_25D53F070();
    OUTLINED_FUNCTION_75_8();
    OUTLINED_FUNCTION_36_1();
    v13();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = (void *)sub_25D50FBB8(v8, v6, v4, v2);
  id v15 = objc_msgSend(v14, sel_facadePropertyName);

  if (v15)
  {
    sub_25D53E200();

    OUTLINED_FUNCTION_72_0();
    uint64_t v16 = (void *)sub_25D53E1D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v0, sel_setValue_forKey_, v12, v16);
    swift_unknownObjectRelease();

    OUTLINED_FUNCTION_36_0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25D50F664(uint64_t a1)
{
  return sub_25D50F6DC(a1, (uint64_t (*)(void))sub_25D2063CC, (unint64_t *)&qword_26A66F530, 0x263F0FEA8, (void (*)(uint64_t))sub_25D2063D8);
}

uint64_t sub_25D50F6A0(uint64_t a1)
{
  return sub_25D50F6DC(a1, (uint64_t (*)(void))sub_25D206630, (unint64_t *)&qword_26A670F30, 0x263F0FE80, (void (*)(uint64_t))sub_25D20663C);
}

uint64_t sub_25D50F6DC(uint64_t a1, uint64_t (*a2)(void), unint64_t *a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v8 = a2();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *(unsigned __int8 *)(v8 + v10 + 32);
      sub_25D50F8D0(v11, a3, a4, a5, &v18);
      uint64_t v12 = (void *)sub_25D50FBB8(v11, a3, a4, a5);
      unsigned int v13 = objc_msgSend(v12, sel_isEnum);

      if (v13) {
        break;
      }
      if (v19) {
        goto LABEL_9;
      }
LABEL_11:
      ++v10;
      sub_25D1D362C((uint64_t)&v18, &qword_26A671A70);
      if (v9 == v10) {
        return swift_bridgeObjectRelease();
      }
    }
    sub_25D194F04((uint64_t)&v18, (uint64_t)v16, &qword_26A671A70);
    if (!v17)
    {
      sub_25D1D362C((uint64_t)v16, &qword_26A671A70);
      goto LABEL_11;
    }
    if ((swift_dynamicCast() & 1) == 0 || !v15) {
      goto LABEL_11;
    }
LABEL_9:
    sub_25D50F4E4();
    goto LABEL_11;
  }
  return swift_bridgeObjectRelease();
}

void sub_25D50F880(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_25D50F8A8(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_25D50F8D0(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v7 = (void *)sub_25D50FBB8(a1, a2, a3, a4);
  id v8 = objc_msgSend(v7, sel_facadePropertyName);

  if (v8)
  {
    sub_25D53E200();

    uint64_t v9 = (void *)sub_25D53E1D0();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v5, sel_valueForKey_, v9);

    if (v10)
    {
      sub_25D53EB80();
      swift_unknownObjectRelease();
    }
    else
    {
      *a5 = 0u;
      a5[1] = 0u;
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25D50F9BC()
{
  sub_25D17DBEC(0, &qword_26A671358);
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v1 = objc_msgSend(v0, sel__intentInstanceDescription);

  uint64_t v2 = (void *)sub_25D53E1D0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_slotByName_, v2);

  if (v3) {
    return (uint64_t)v3;
  }
  sub_25D53ED20();
  swift_bridgeObjectRelease();
  sub_25D53E360();
  swift_bridgeObjectRelease();
  sub_25D53E360();
  sub_25D53F270();
  sub_25D53E360();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25D53EE80();
  __break(1u);
  return result;
}

uint64_t sub_25D50FB90(uint64_t a1)
{
  return sub_25D50FBB8(a1, (unint64_t *)&qword_26A66F530, 0x263F0FEA8, (void (*)(uint64_t))sub_25D2063D8);
}

uint64_t sub_25D50FBB8(uint64_t a1, unint64_t *a2, uint64_t a3, void (*a4)(uint64_t))
{
  sub_25D17DBEC(0, a2);
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v7 = objc_msgSend(v6, sel__intentInstanceDescription);

  a4(a1);
  id v8 = (void *)sub_25D53E1D0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_slotByName_, v8);

  if (v9) {
    return (uint64_t)v9;
  }
  sub_25D53ED20();
  swift_bridgeObjectRelease();
  a4(a1);
  sub_25D53E360();
  swift_bridgeObjectRelease();
  sub_25D53E360();
  sub_25D53F270();
  sub_25D53E360();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25D53EE80();
  __break(1u);
  return result;
}

uint64_t sub_25D50FD4C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v24 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_25D3BFDB8((uint64_t)&v23, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v24;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25D50FED0(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v27 = MEMORY[0x263F8EE88];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25D53EEB0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v23 = MEMORY[0x263F8EE78];
LABEL_26:
    swift_bridgeObjectRelease();
    return v23;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_25;
  }
LABEL_3:
  if (v2 >= 1)
  {
    unint64_t v4 = v1 & 0xC000000000000001;
    uint64_t v5 = 0;
    unint64_t v25 = v1 + 32;
    sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
    unint64_t v24 = v1;
    while (1)
    {
      if (v4) {
        id v6 = (id)MEMORY[0x2611AC4C0](v5, v1);
      }
      else {
        id v6 = *(id *)(v25 + 8 * v5);
      }
      unint64_t v7 = v6;
      uint64_t v8 = v27;
      if ((v27 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        id v9 = v7;
        char v10 = sub_25D53EC70();
        swift_bridgeObjectRelease();

        if ((v10 & 1) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        if (!*(void *)(v27 + 16)) {
          goto LABEL_19;
        }
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_25D53E9C0();
        uint64_t v12 = -1 << *(unsigned char *)(v8 + 32);
        uint64_t v13 = v11 & ~v12;
        OUTLINED_FUNCTION_248_0();
        if ((v14 & 1) == 0) {
          goto LABEL_18;
        }
        id v15 = *(id *)(*(void *)(v8 + 48) + 8 * v13);
        char v16 = sub_25D53E9D0();

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = ~v12;
          while (1)
          {
            uint64_t v13 = (v13 + 1) & v17;
            OUTLINED_FUNCTION_248_0();
            if ((v18 & 1) == 0) {
              break;
            }
            id v19 = *(id *)(*(void *)(v8 + 48) + 8 * v13);
            char v20 = sub_25D53E9D0();

            if (v20) {
              goto LABEL_17;
            }
          }
LABEL_18:
          swift_bridgeObjectRelease();
          unint64_t v1 = v24;
LABEL_19:
          id v21 = v7;
          sub_25D3BF9EC(&v26, v21);

          id v22 = v21;
          MEMORY[0x2611ABBF0]();
          if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_25D53E500();
          }
          sub_25D53E540();
          sub_25D53E4E0();

          goto LABEL_22;
        }
LABEL_17:

        swift_bridgeObjectRelease();
        unint64_t v1 = v24;
      }
LABEL_22:
      if (++v5 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v23 = v28;
        goto LABEL_26;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25D510194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = sub_25D539E60();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D510258, 0, 0);
}

#error "25D510348: call analysis failed (funcsize=150)"

uint64_t sub_25D5104C0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D51059C()
{
  OUTLINED_FUNCTION_14();
  v1[17] = v2;
  v1[18] = v0;
  v1[15] = v3;
  v1[16] = v4;
  uint64_t v5 = sub_25D539E60();
  v1[19] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[20] = v6;
  v1[21] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D51062C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = sub_25D539E60();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D5106F0, 0, 0);
}

#error "25D5107E0: call analysis failed (funcsize=150)"

uint64_t sub_25D510958()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D510A34()
{
  OUTLINED_FUNCTION_14();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(1);
}

uint64_t sub_25D510AAC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, os_log_t log, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_10_7();
  a25 = v27;
  a26 = v28;
  OUTLINED_FUNCTION_35_2();
  a24 = v26;
  __swift_destroy_boxed_opaque_existential_0(v26 + 16);
  __swift_destroy_boxed_opaque_existential_0(v26 + 56);
  uint64_t v29 = *(void **)(v26 + 184);
  *(void *)(v26 + 96) = v29;
  id v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
  if (!swift_dynamicCast()) {
    goto LABEL_8;
  }
  uint64_t v31 = OUTLINED_FUNCTION_30_42();
  int v33 = v32(v31);
  uint64_t v35 = *(void *)(v26 + 160);
  uint64_t v34 = *(void ***)(v26 + 168);
  uint64_t v36 = *(void *)(v26 + 152);
  if (v33 != *MEMORY[0x263F6FC48])
  {
    (*(void (**)(void, void))(v35 + 8))(*(void *)(v26 + 168), *(void *)(v26 + 152));
LABEL_8:

    swift_task_dealloc();
    goto LABEL_11;
  }

  (*(void (**)(void **, uint64_t))(v35 + 96))(v34, v36);
  uint64_t v37 = *v34;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v38 = OUTLINED_FUNCTION_142_6();
  OUTLINED_FUNCTION_189_3(v38, (uint64_t)qword_26A688F10);
  OUTLINED_FUNCTION_86_10();
  id v39 = v37;
  uint64_t v40 = sub_25D53DC00();
  os_log_type_t v41 = sub_25D53E7B0();
  BOOL v42 = OUTLINED_FUNCTION_29(v41);
  unint64_t v43 = *(void *)(v26 + 128);
  if (v42)
  {
    a10 = v26 + 112;
    a11 = v26 + 104;
    a12 = *(void *)(v26 + 120);
    uint64_t v44 = swift_slowAlloc();
    log = v40;
    a9 = (void *)swift_slowAlloc();
    a14 = OUTLINED_FUNCTION_30();
    a15 = a14;
    *(_DWORD *)uint64_t v44 = 138412546;
    *(void *)(v26 + 104) = v39;
    id v45 = v39;
    sub_25D53EA80();
    *a9 = v39;

    *(_WORD *)(v44 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v26 + 112) = sub_25D19E114(a12, v43, &a15);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D16D000, v40, (os_log_type_t)v34, "#MessagesFlowStrategy received %@, snippet with viewId=%s is not available", (uint8_t *)v44, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A672E50);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  OUTLINED_FUNCTION_33_7();
LABEL_11:
  OUTLINED_FUNCTION_15();
  return v48(v46, v47, v48, v49, v50, v51, v52, v53, a9, a10, a11, a12, log, a14, a15, a16, a17, a18);
}

uint64_t sub_25D510DCC()
{
  if (*(unsigned __int8 *)(v0 + 16) - 2 > 2) {
    return 0;
  }
  if (*(unsigned char *)(v0 + 40)) {
    return 1;
  }
  if (sub_25D36E314()) {
    return 2;
  }
  return 3;
}

void sub_25D510E18()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v156 = v0;
  uint64_t v151 = v2;
  uint64_t v4 = v3;
  uint64_t v155 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FAC0);
  uint64_t v7 = OUTLINED_FUNCTION_17_0(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_40();
  uint64_t v8 = sub_25D539F20();
  OUTLINED_FUNCTION_0_3();
  uint64_t v150 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_16_1();
  uint64_t v149 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672C10);
  uint64_t v13 = OUTLINED_FUNCTION_17_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_24_2(v14);
  uint64_t v160 = sub_25D53A650();
  OUTLINED_FUNCTION_0_3();
  uint64_t v154 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_24_2((uint64_t)v144 - v20);
  uint64_t v146 = sub_25D53A630();
  OUTLINED_FUNCTION_0_3();
  uint64_t v148 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_24_2(v23);
  uint64_t v159 = sub_25D53C830();
  OUTLINED_FUNCTION_0_3();
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_8_21();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_24_2((uint64_t)v144 - v28);
  sub_25D53A5F0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_36();
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_25D53DC10();
  uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_26A688F10);
  uint64_t v161 = v4;
  OUTLINED_FUNCTION_59_1();
  v32();
  int v33 = sub_25D53DC00();
  os_log_type_t v34 = sub_25D53E7A0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v145 = v1;
  if (v35)
  {
    uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_26();
    uint64_t v37 = OUTLINED_FUNCTION_30();
    v144[1] = v8;
    v167[0] = v37;
    v144[2] = v31;
    *(_DWORD *)uint64_t v36 = 136315138;
    v144[0] = v36 + 4;
    sub_25D51E624((unint64_t *)&qword_26A671A90, MEMORY[0x263F6FF40]);
    uint64_t v38 = sub_25D53F050();
    v165[0] = sub_25D19E114(v38, v39, v167);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    uint64_t v40 = OUTLINED_FUNCTION_230_1();
    v41(v40);
    _os_log_impl(&dword_25D16D000, v33, v34, "#SendMessageNeedsValueFlowStrategy received input: %s", v36, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v42 = OUTLINED_FUNCTION_230_1();
    v43(v42);
  }

  __swift_project_boxed_opaque_existential_0((void *)(v156 + 16), *(void *)(v156 + 40));
  OUTLINED_FUNCTION_229_1();
  OUTLINED_FUNCTION_14_0();
  v44();
  __swift_project_boxed_opaque_existential_0(v167, v168);
  uint64_t v45 = v157;
  OUTLINED_FUNCTION_237_1();
  OUTLINED_FUNCTION_72_0();
  sub_25D539650();
  uint64_t v46 = v158;
  (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v158, *MEMORY[0x263F75680], v159);
  char v47 = sub_25D19879C(v45, v46);
  uint64_t v48 = *(void (**)(void))(v25 + 8);
  OUTLINED_FUNCTION_30_1();
  v48();
  OUTLINED_FUNCTION_30_1();
  v48();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v167);
  uint64_t v49 = v160;
  if (v47)
  {
    uint64_t v50 = (void *)sub_25D53DC00();
    os_log_type_t v51 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_27_0(v51))
    {
      uint64_t v52 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v52);
      OUTLINED_FUNCTION_24_1(&dword_25D16D000, v53, v54, "#SendMessageNeedsValueFlowStrategy tap-to-edit request, ignoring");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D539940();
    goto LABEL_89;
  }
  uint64_t v55 = v153;
  sub_25D53A5D0();
  uint64_t v56 = v154;
  uint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t))(v154 + 88);
  if (v57(v55, v49) != *MEMORY[0x263F6FF70])
  {
    OUTLINED_FUNCTION_8_5();
    v62();
LABEL_21:
    sub_25D53A5D0();
    sub_25D492A08();
    uint64_t v75 = *(void (**)(void))(v56 + 8);
    OUTLINED_FUNCTION_30_1();
    v75();
    if (v168)
    {
      sub_25D17DB88((uint64_t)v167, (uint64_t)v165);
      __swift_project_boxed_opaque_existential_0(v165, v166);
      uint64_t v76 = OUTLINED_FUNCTION_5_18();
      int v78 = v77(v76);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
      if (v78 == 2)
      {
        uint64_t v79 = (void *)sub_25D53DC00();
        os_log_type_t v80 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_27_0(v80))
        {
          uint64_t v81 = (_WORD *)OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_54_0(v81);
          OUTLINED_FUNCTION_24_1(&dword_25D16D000, v82, v83, "#SendMessageNeedsValueFlowStrategy prompt is cancelled");
          OUTLINED_FUNCTION_3_0();
        }

        sub_25D539920();
        goto LABEL_88;
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
    sub_25D53A380();
    sub_25D539F10();
    OUTLINED_FUNCTION_65();
    v84();
    OUTLINED_FUNCTION_48_5();
    char v85 = sub_25D2063C0();
    if (v85 != 9)
    {
      sub_25D2063D8(v85);
      if (v87 == 0x746E65746E6F63 && v86 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v89 = sub_25D53F090();
        swift_bridgeObjectRelease();
        if ((v89 & 1) == 0) {
          goto LABEL_45;
        }
      }
      uint64_t v90 = v144[4];
      sub_25D53A5D0();
      int v91 = v57(v90, v49);
      int v92 = *MEMORY[0x263F6FF80];
      OUTLINED_FUNCTION_30_1();
      v75();
      uint64_t v93 = v145;
      if (v91 == v92)
      {
        sub_25D194F04((uint64_t)v167, (uint64_t)&v163, &qword_26A672C20);
        if (v164)
        {
          sub_25D188958(&v163, (uint64_t)v165);
          __swift_project_boxed_opaque_existential_0(v165, v166);
          uint64_t v94 = OUTLINED_FUNCTION_5_18();
          v95(v94);
          uint64_t v97 = v96;
          swift_bridgeObjectRelease();
          sub_25D17DB88((uint64_t)v165, (uint64_t)&v163);
          if (v97)
          {
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v163);
            sub_25D17DB88((uint64_t)v165, (uint64_t)v162);
LABEL_68:
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
            goto LABEL_69;
          }
          __swift_project_boxed_opaque_existential_0(&v163, v164);
          uint64_t v120 = OUTLINED_FUNCTION_5_18();
          uint64_t v122 = *(void *)(v121(v120) + 16);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v163);
          sub_25D17DB88((uint64_t)v165, (uint64_t)v162);
          if (v122) {
            goto LABEL_68;
          }
          OUTLINED_FUNCTION_83_8(v162);
          uint64_t v129 = OUTLINED_FUNCTION_5_18();
          uint64_t v131 = v130(v129);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
          if (v131)
          {
LABEL_69:
            os_log_type_t v123 = (void *)sub_25D53DC00();
            os_log_type_t v124 = sub_25D53E7B0();
            if (OUTLINED_FUNCTION_27_0(v124))
            {
              uint64_t v125 = (_WORD *)OUTLINED_FUNCTION_20_0();
              OUTLINED_FUNCTION_54_0(v125);
              v128 = "#SendMessageNeedsValueFlowStrategy top parse is change app or add/remove recipient, ignoring to re-run RCH";
LABEL_84:
              OUTLINED_FUNCTION_24_1(&dword_25D16D000, v126, v127, v128);
              OUTLINED_FUNCTION_3_0();
            }
LABEL_85:

            sub_25D539940();
LABEL_87:
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
LABEL_88:
            sub_25D1D362C((uint64_t)v167, &qword_26A672C20);
            goto LABEL_89;
          }
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
        }
        else
        {
          sub_25D1D362C((uint64_t)&v163, &qword_26A672C20);
        }
      }
      sub_25D1C8438(v93);
      if (__swift_getEnumTagSinglePayload(v93, 1, v49) == 1)
      {
        sub_25D1D362C(v93, &qword_26A66FAC0);
      }
      else
      {
        (*(void (**)(void, uint64_t, uint64_t))(v154 + 32))(v144[3], v93, v49);
        long long v101 = (void *)sub_25D53DC00();
        os_log_type_t v102 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_27_0(v102))
        {
          uint64_t v103 = (_WORD *)OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_54_0(v103);
          OUTLINED_FUNCTION_24_1(&dword_25D16D000, v104, v105, "#SendMessageNeedsValueFlowStrategy isContentSlot, use ruleBasedParse for remaining checks");
          OUTLINED_FUNCTION_3_0();
        }

        sub_25D492A08();
        OUTLINED_FUNCTION_30_1();
        v75();
        sub_25D194EBC((uint64_t)v165, (uint64_t)v167, &qword_26A672C20);
      }
    }
LABEL_45:
    sub_25D194F04((uint64_t)v167, (uint64_t)&v163, &qword_26A672C20);
    if (!v164)
    {
      sub_25D1D362C((uint64_t)&v163, &qword_26A672C20);
      uint64_t v115 = (void *)sub_25D53DC00();
      os_log_type_t v116 = sub_25D53E7B0();
      if (OUTLINED_FUNCTION_27_0(v116))
      {
        uint64_t v117 = (_WORD *)OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_54_0(v117);
        OUTLINED_FUNCTION_24_1(&dword_25D16D000, v118, v119, "#SendMessageNeedsValueFlowStrategy unexpected input, ignoring");
        OUTLINED_FUNCTION_3_0();
      }

      sub_25D539940();
      goto LABEL_88;
    }
    sub_25D188958(&v163, (uint64_t)v165);
    sub_25D17DB88((uint64_t)v165, (uint64_t)&v163);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F570);
    OUTLINED_FUNCTION_64_1();
    type metadata accessor for SmsNLv4Intent();
    if (swift_dynamicCast())
    {
      unint64_t v106 = *(void *)(v162[0] + 88);
      if (v106 >> 62) {
        goto LABEL_74;
      }
      uint64_t v107 = *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v107)
      {
        while (1)
        {
          swift_bridgeObjectRetain();
          if ((v106 & 0xC000000000000001) != 0) {
            MEMORY[0x2611AC4C0](0, v106);
          }
          else {
            swift_retain();
          }
          char v108 = sub_25D4EA3FC();
          swift_release();
          if ((v108 & 1) == 0)
          {
LABEL_66:
            swift_bridgeObjectRelease_n();
            swift_release();
            goto LABEL_76;
          }
          if (v107 == 1) {
            break;
          }
          uint64_t v109 = 5;
          while (1)
          {
            if ((v106 & 0xC000000000000001) != 0) {
              MEMORY[0x2611AC4C0](v109 - 4, v106);
            }
            else {
              swift_retain();
            }
            uint64_t v110 = v109 - 3;
            if (__OFADD__(v109 - 4, 1)) {
              break;
            }
            char v111 = sub_25D4EA3FC();
            swift_release();
            if ((v111 & 1) == 0) {
              goto LABEL_66;
            }
            ++v109;
            if (v110 == v107) {
              goto LABEL_60;
            }
          }
          __break(1u);
LABEL_74:
          swift_bridgeObjectRetain_n();
          uint64_t v107 = sub_25D53EEB0();
          swift_bridgeObjectRelease();
          if (!v107) {
            goto LABEL_75;
          }
        }
LABEL_60:
        swift_bridgeObjectRelease_n();
        uint64_t v112 = sub_25D53DC00();
        os_log_type_t v113 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_29(v113))
        {
          uint64_t v114 = (uint8_t *)OUTLINED_FUNCTION_20_0();
          *(_WORD *)uint64_t v114 = 0;
          _os_log_impl(&dword_25D16D000, v112, (os_log_type_t)v106, "#SendMessageNeedsValueFlowStrategy recipient is nobody, cancelling", v114, 2u);
          OUTLINED_FUNCTION_3_0();
        }

        sub_25D539920();
        swift_release();
        goto LABEL_87;
      }
LABEL_75:
      swift_release();
      swift_bridgeObjectRelease();
    }
LABEL_76:
    OUTLINED_FUNCTION_83_8(v165);
    uint64_t v132 = OUTLINED_FUNCTION_5_18();
    char v134 = v133(v132);
    sub_25D17DB88((uint64_t)v165, (uint64_t)&v163);
    if (v134)
    {
      OUTLINED_FUNCTION_83_8(&v163);
      uint64_t v135 = OUTLINED_FUNCTION_5_18();
      char v137 = v136(v135);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v163);
      if ((v137 & 1) == 0)
      {
        os_log_type_t v123 = (void *)sub_25D53DC00();
        os_log_type_t v138 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_27_0(v138))
        {
          uint64_t v139 = (_WORD *)OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_54_0(v139);
          v128 = "#SendMessageNeedsValueFlowStrategy unrelated request, ignoring";
          goto LABEL_84;
        }
        goto LABEL_85;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v163);
    }
    OUTLINED_FUNCTION_83_8(v165);
    uint64_t v140 = OUTLINED_FUNCTION_5_18();
    if ((v141(v140) & 1) == 0)
    {
      sub_25D539930();
      goto LABEL_87;
    }
    os_log_type_t v123 = (void *)sub_25D53DC00();
    os_log_type_t v142 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_27_0(v142))
    {
      uint64_t v143 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v143);
      v128 = "#SendMessageNeedsValueFlowStrategy app name is specified, ignoring to treat as change request";
      goto LABEL_84;
    }
    goto LABEL_85;
  }
  uint64_t v159 = (uint64_t)v57;
  (*(void (**)(uint64_t, uint64_t))(v56 + 96))(v55, v49);
  uint64_t v58 = v152;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 32))(v152, v55, v146);
  uint64_t v59 = v147;
  sub_25D4AF5E4(v58, v147);
  uint64_t v60 = type metadata accessor for DirectInvocationUseCases();
  if (__swift_getEnumTagSinglePayload(v59, 1, v60) == 1)
  {
    OUTLINED_FUNCTION_37_1();
    v61();
    sub_25D1D362C(v59, (uint64_t *)&unk_26A672C10);
LABEL_20:
    uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))v159;
    goto LABEL_21;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    OUTLINED_FUNCTION_37_1();
    v74();
    sub_25D51E5D4();
    goto LABEL_20;
  }
  uint64_t v63 = sub_25D53D630();
  OUTLINED_FUNCTION_0_3();
  int v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 88))(v59, v63);
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))v159;
  if (v65 != *MEMORY[0x263F70F80])
  {
    uint64_t v98 = OUTLINED_FUNCTION_138_5();
    v99(v98);
    OUTLINED_FUNCTION_37_1();
    v100();
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_37_1();
  v66();
  uint64_t v67 = (void *)sub_25D53DC00();
  os_log_type_t v68 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_27_0(v68))
  {
    uint64_t v69 = (_WORD *)OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_54_0(v69);
    OUTLINED_FUNCTION_24_1(&dword_25D16D000, v70, v71, "#SendMessageNeedsValueFlowStrategy prompt is cancelled by button press");
    OUTLINED_FUNCTION_3_0();
  }

  sub_25D539920();
  uint64_t v72 = OUTLINED_FUNCTION_138_5();
  v73(v72);
LABEL_89:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D511DDC()
{
  OUTLINED_FUNCTION_14();
  v1[62] = v2;
  v1[63] = v0;
  v1[60] = v3;
  v1[61] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  v1[64] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[65] = v6;
  v1[66] = OUTLINED_FUNCTION_92();
  uint64_t v7 = sub_25D53C830();
  v1[67] = v7;
  OUTLINED_FUNCTION_11_0(v7);
  v1[68] = v8;
  v1[69] = OUTLINED_FUNCTION_92();
  uint64_t v9 = sub_25D538880();
  v1[70] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v1[71] = v10;
  v1[72] = OUTLINED_FUNCTION_92();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  OUTLINED_FUNCTION_17_0(v11);
  v1[73] = OUTLINED_FUNCTION_24_0();
  v1[74] = swift_task_alloc();
  v1[75] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672D00);
  OUTLINED_FUNCTION_17_0(v12);
  v1[76] = OUTLINED_FUNCTION_92();
  uint64_t v13 = sub_25D539F20();
  v1[77] = v13;
  OUTLINED_FUNCTION_11_0(v13);
  v1[78] = v14;
  v1[79] = OUTLINED_FUNCTION_92();
  uint64_t v15 = sub_25D53A650();
  v1[80] = v15;
  OUTLINED_FUNCTION_11_0(v15);
  v1[81] = v16;
  v1[82] = OUTLINED_FUNCTION_24_0();
  v1[83] = swift_task_alloc();
  v1[84] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v17, v18, v19);
}

uint64_t sub_25D511FA8()
{
  void (*v29)(long long *__return_ptr, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t *v34;
  void (*v35)(void);
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _WORD *v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  uint64_t (*v43)(void);
  id v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(void);
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  _WORD *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  uint8_t *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int EnumTagSinglePayload;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(uint64_t);
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(uint64_t);
  uint64_t v137;
  void (*v138)(void);
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  id v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t i;
  id v154;
  void *v155;
  NSObject *v156;
  os_log_type_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  id v161;
  void *v162;
  char v163;
  char v164;
  uint64_t v165;
  id v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t v186;
  void (*v187)(void);
  char v188;
  void (*v189)(void);
  void *v190;
  uint64_t v191;
  BOOL v192;
  long long v193;
  os_log_type_t v194;
  unint64_t logd;
  uint64_t log;
  uint64_t loga;
  os_log_t logb[2];
  NSObject *logc;
  uint64_t v200;
  id v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  long long v206;
  long long v207;
  uint64_t v208;
  uint64_t v209;

  v208 = v0;
  uint64_t v1 = *(void *)(v0 + 632);
  uint64_t v2 = *(void *)(v0 + 624);
  sub_25D53A5D0();
  sub_25D53A380();
  sub_25D539F10();
  uint64_t v3 = *(void (**)(void))(v2 + 8);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_36_1();
  v3();
  char v4 = sub_25D2063C0();
  *(unsigned char *)(v0 + 736) = v4;
  if (v4 == 9)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25D53DC10();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A688F10);
    uint64_t v6 = OUTLINED_FUNCTION_30_23();
    v7(v6);
    uint64_t v8 = sub_25D53DC00();
    os_log_type_t v9 = sub_25D53E7C0();
    if (os_log_type_enabled(v8, v9))
    {
      OUTLINED_FUNCTION_26();
      *(void *)&v206 = OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_246_0(4.8149e-34);
      sub_25D53A380();
      uint64_t v10 = sub_25D539F10();
      unint64_t v12 = v11;
      OUTLINED_FUNCTION_36_1();
      v13();
      *(void *)(v0 + 408) = sub_25D19E114(v10, v12, (uint64_t *)&v206);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_5();
      v14();
      OUTLINED_FUNCTION_61_11(&dword_25D16D000, v15, v16, "#SendMessageNeedsValueFlowStrategy unknown parameter: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 520) + 8))(*(void *)(v0 + 528), *(void *)(v0 + 512));
    }

    sub_25D53A380();
    uint64_t v30 = sub_25D539F10();
    uint64_t v32 = v31;
    OUTLINED_FUNCTION_71_12();
    OUTLINED_FUNCTION_36_1();
    v33();
    sub_25D1BFA18();
    OUTLINED_FUNCTION_58_1();
    *os_log_type_t v34 = v30;
    v34[1] = v32;
    swift_willThrow();
    OUTLINED_FUNCTION_169_3();
    v35();
LABEL_18:
    OUTLINED_FUNCTION_108_7();
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
    OUTLINED_FUNCTION_48();
    return v43();
  }
  char v17 = v4;
  if (v4 == 3)
  {
    uint64_t v1 = *(void *)(v0 + 664);
    uint64_t v18 = *(void *)(v0 + 648);
    sub_25D53A5D0();
    uint64_t v19 = OUTLINED_FUNCTION_85_2();
    int v21 = v20(v19);
    int v22 = *MEMORY[0x263F6FF80];
    uint64_t v23 = *(void (**)(void))(v18 + 8);
    OUTLINED_FUNCTION_169_3();
    v23();
    if (v21 == v22)
    {
      uint64_t v1 = *(void *)(v0 + 656);
      sub_25D51C324();
      OUTLINED_FUNCTION_169_3();
      v23();
      uint64_t v24 = OUTLINED_FUNCTION_14_8();
      v25(v24);
    }
  }
  sub_25D492A08();
  if (!*(void *)(v0 + 120))
  {
    sub_25D1D362C(v0 + 96, &qword_26A672C20);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_25D53DC10();
    uint64_t v37 = OUTLINED_FUNCTION_84_0(v36, (uint64_t)qword_26A688F10);
    uint64_t v38 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_55_1(v38))
    {
      unint64_t v39 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v39);
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v37, (os_log_type_t)v1, "#SendMessageNeedsValueFlowStrategy failed to make SmsIntent from input");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D194BF4();
    OUTLINED_FUNCTION_58_1();
    *uint64_t v40 = 0xD000000000000018;
    v40[1] = 0x800000025D559CE0;
    swift_willThrow();
    os_log_type_t v41 = OUTLINED_FUNCTION_85_2();
    v42(v41);
    goto LABEL_18;
  }
  uint64_t v26 = *(void *)(v0 + 672);
  uint64_t v27 = (long long *)OUTLINED_FUNCTION_71_12();
  sub_25D188958(v27, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDF0);
  uint64_t v29 = (void (*)(long long *__return_ptr, uint64_t))sub_25D53C890();
  v29(&v206, v26);
  v203 = v0 + 56;
  swift_release();
  uint64_t v45 = (id)v206;
  *(void *)(v0 + 680) = v206;
  if (v17 == 3) {
    *(unsigned char *)(*(void *)(*(void *)(v0 + 504) + 56) + 169) = 1;
  }
  uint64_t v46 = *(void *)(*(void *)(v0 + 504) + 56);
  v205 = v0;
  *(void *)(v0 + 688) = v46;
  char v47 = sub_25D36E314();
  v204 = v46;
  if (v17 == 3 && v47)
  {
    uint64_t v48 = *(void *)(v46 + 56);
    if (v48)
    {
      uint64_t v49 = *(void *)(v46 + 48);
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_25D51CD38(v45);
      if (v51)
      {
        uint64_t v52 = v51;
        v200 = v0 + 296;
        uint64_t v53 = *(void *)(v0 + 608);
        logd = v50;
        __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v0 + 504) + 16), *(void *)(*(void *)(v0 + 504) + 40));
        OUTLINED_FUNCTION_14_0();
        v54();
        uint64_t v55 = (void *)OUTLINED_FUNCTION_71_12();
        __swift_project_boxed_opaque_existential_0(v55, v56);
        sub_25D539640();
        uint64_t v57 = sub_25D538990();
        OUTLINED_FUNCTION_492(v53, v58, v59, v57);
        uint64_t v60 = sub_25D36B3D0(logd, v52, v53, v49, v48);
        log = v61;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25D1D362C(v53, (uint64_t *)&unk_26A672D00);
        __swift_destroy_boxed_opaque_existential_0(v0 + 256);
        if (qword_26A66E778 != -1) {
          swift_once();
        }
        uint64_t v62 = MEMORY[0x263F8D310];
        uint64_t v63 = sub_25D53DC10();
        uint64_t v64 = OUTLINED_FUNCTION_84_0(v63, (uint64_t)qword_26A688F10);
        int v65 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_55_1(v65))
        {
          uint64_t v66 = (_WORD *)OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_54_0(v66);
          OUTLINED_FUNCTION_20_4(&dword_25D16D000, v64, (os_log_type_t)v49, "#SendMessageNeedsValueFlowStrategy appending content");
          OUTLINED_FUNCTION_3_0();
        }

        *(void *)(v205 + 320) = v62;
        *(void *)(v205 + 296) = v60;
        *(void *)(v205 + 304) = log;
        sub_25D50F4E4();
        sub_25D1D362C(v200, &qword_26A671A70);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  uint64_t v67 = v205;
  os_log_type_t v68 = (void *)sub_25D53A360();
  uint64_t v69 = v68;
  *(void *)(v205 + 696) = v68;
  if (v17) {
    goto LABEL_85;
  }
  uint64_t v70 = sub_25D2EBAAC(v68);
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = sub_25D2EBAAC(v45);
    if (!v72)
    {
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v67 = v205;
      goto LABEL_74;
    }
    uint64_t v73 = v72;
    if (*(unsigned char *)(v204 + 128))
    {
      swift_bridgeObjectRelease();
      goto LABEL_38;
    }
    v201 = v45;
    uint64_t v74 = *(void *)(v204 + 120);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v75 = sub_25D53DC10();
    uint64_t v76 = OUTLINED_FUNCTION_84_0(v75, (uint64_t)qword_26A688F10);
    uint64_t v77 = sub_25D53E7B0();
    if (os_log_type_enabled((os_log_t)v76, v77))
    {
      int v78 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)int v78 = 0;
      _os_log_impl(&dword_25D16D000, (os_log_t)v76, v77, "#SendMessageNeedsValueFlowStrategy needsValue after unsupported, inserting recipient", v78, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    *(void *)(v204 + 120) = 0;
    *(unsigned char *)(v204 + 128) = 1;
    uint64_t v79 = (unint64_t)v71 >> 62;
    os_log_type_t v80 = (unint64_t)v74 >> 63;
    uint64_t v81 = v71 & 0xFFFFFFFFFFFFFF8;
    if ((unint64_t)v71 >> 62)
    {
      if (v71 < 0) {
        LOBYTE(v76) = v71;
      }
      else {
        LOBYTE(v76) = v71 & 0xF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_25D53EEB0();
      swift_bridgeObjectRelease();
      if ((v82 & 0x8000000000000000) == 0) {
        goto LABEL_158;
      }
      __break(1u);
    }
    else
    {
      uint64_t v82 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v83 = v74 < v82;
      if (v74 >= (unint64_t)v82)
      {
        uint64_t v88 = v74 >= 0;
        os_log_type_t v80 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_54;
      }
LABEL_45:
      uint64_t v84 = *(void *)(v81 + 16);
LABEL_46:
      uint64_t v192 = v83;
      if (v84 >= v74)
      {
        if ((v71 & 0xC000000000000001) != 0 && v74)
        {
          sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
          char v85 = 0;
          do
          {
            uint64_t v86 = v85 + 1;
            sub_25D53ED50();
            char v85 = v86;
          }
          while (v74 != v86);
        }
        if (v79)
        {
          OUTLINED_FUNCTION_199_0();
          uint64_t v87 = sub_25D53EEC0();
          loga = v89;
          uint64_t v76 = v90;
          os_log_type_t v80 = v91;
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v87 = v71 & 0xFFFFFFFFFFFFFF8;
          loga = (v71 & 0xFFFFFFFFFFFFFF8) + 32;
          os_log_type_t v80 = (2 * v74) | 1;
          swift_bridgeObjectRetain();
          uint64_t v76 = 0;
        }
        int v92 = (void *)sub_25D514030(v73);
        *(void *)&v206 = v87;
        *((void *)&v206 + 1) = loga;
        *(void *)&v207 = v76;
        *((void *)&v207 + 1) = v80;
        sub_25D51D7D8(v92, v93, v94, v95);
        if (v82 >= v74)
        {
          LOBYTE(v76) = v205;
          uint64_t v193 = v207;
          *(_OWORD *)logb = v206;
          if (v79)
          {
            OUTLINED_FUNCTION_199_0();
            uint64_t v96 = sub_25D53EEB0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v96 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (v96 >= v82)
          {
            if ((v71 & 0xC000000000000001) == 0 || v74 == v82)
            {
LABEL_70:
              if (v79)
              {
                OUTLINED_FUNCTION_199_0();
                sub_25D53EEC0();
                uint64_t v74 = v100;
                uint64_t v99 = v101;
                swift_bridgeObjectRelease_n();
              }
              else
              {
                uint64_t v99 = (2 * v82) | 1;
              }
              v206 = *(_OWORD *)logb;
              v207 = v193;
              os_log_type_t v102 = (void *)OUTLINED_FUNCTION_85_2();
              sub_25D51D7D8(v102, v103, v74, v99);
              sub_25D1F1018();
              uint64_t v105 = sub_25D50FED0(v104);
              swift_bridgeObjectRelease();
              *(void *)(v205 + 352) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FFD0);
              *(void *)(v205 + 328) = v105;
              uint64_t v45 = v201;
              sub_25D50F4E4();
              uint64_t v67 = v205;
              sub_25D1D362C(v205 + 328, &qword_26A671A70);
              goto LABEL_74;
            }
            if (v192)
            {
              sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
              uint64_t v97 = v74;
              do
              {
                uint64_t v98 = v97 + 1;
                sub_25D53ED50();
                uint64_t v97 = v98;
              }
              while (v82 != v98);
              goto LABEL_70;
            }
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
            while (1)
            {
              __break(1u);
LABEL_158:
              if (v74 < 0 || v74 >= v82)
              {
                uint64_t v88 = v80 ^ 1;
                swift_bridgeObjectRetain();
                os_log_type_t v80 = sub_25D53EEB0();
                swift_bridgeObjectRelease();
                uint64_t v83 = v74 < v82;
LABEL_54:
                if (v80 != v74)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRetain();
                  uint64_t v156 = sub_25D53DC00();
                  uint64_t v157 = sub_25D53E7C0();
                  if (OUTLINED_FUNCTION_55_1(v157))
                  {
                    uint64_t v67 = v205;
                    uint64_t v158 = swift_slowAlloc();
                    *(_DWORD *)uint64_t v158 = 134218240;
                    *(void *)(v205 + 456) = v74;
                    sub_25D53EA80();
                    *(_WORD *)(v158 + 12) = 2048;
                    swift_bridgeObjectRelease();
                    *(void *)(v205 + 464) = v80;
                    sub_25D53EA80();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_25D16D000, v156, (os_log_type_t)v76, "#SendMessageNeedsValueFlowStrategy unsupportedRecipientMulticardinalValueIndex %ld is out of range of previous recipients count: %ld", (uint8_t *)v158, 0x16u);
                    OUTLINED_FUNCTION_3_0();
                  }
                  else
                  {
                    swift_bridgeObjectRelease_n();

                    uint64_t v67 = v205;
                  }
                  uint64_t v45 = v201;
                  goto LABEL_74;
                }
                if (!v88) {
                  goto LABEL_156;
                }
                uint64_t v81 = v71 & 0xFFFFFFFFFFFFFF8;
                if (!v79) {
                  goto LABEL_45;
                }
              }
              else
              {
                uint64_t v83 = 1;
              }
              LODWORD(v80) = v83;
              swift_bridgeObjectRetain();
              uint64_t v76 = sub_25D53EEB0();
              swift_bridgeObjectRelease();
              if ((v76 & 0x8000000000000000) == 0)
              {
                swift_bridgeObjectRetain();
                uint64_t v84 = sub_25D53EEB0();
                swift_bridgeObjectRelease();
                uint64_t v83 = v80;
                goto LABEL_46;
              }
            }
          }
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }
LABEL_153:
        __break(1u);
        goto LABEL_154;
      }
    }
    __break(1u);
    goto LABEL_153;
  }
LABEL_74:
  if (qword_26A66E778 != -1) {
    goto LABEL_146;
  }
  while (1)
  {
    unint64_t v106 = sub_25D53DC10();
    __swift_project_value_buffer(v106, (uint64_t)qword_26A688F10);
    uint64_t v107 = v69;
    char v108 = v45;
    uint64_t v109 = v107;
    uint64_t v110 = v108;
    char v111 = sub_25D53DC00();
    uint64_t v112 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_167_1(v112))
    {
      v202 = v45;
      uint64_t v194 = v107;
      logc = v111;
      os_log_type_t v113 = *(void *)(v67 + 600);
      uint64_t v114 = *(void *)(v67 + 560);
      uint64_t v115 = swift_slowAlloc();
      *(void *)&v206 = swift_slowAlloc();
      *(_DWORD *)uint64_t v115 = 67109890;
      *(_DWORD *)(v67 + 728) = sub_25D2EAEA8() & 1;
      sub_25D53EA80();
      *(_WORD *)(v115 + 8) = 2080;
      sub_25D2EAF5C(v113);
      uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v113, 1, v114);
      uint64_t v117 = *(void *)(v67 + 600);
      if (EnumTagSinglePayload)
      {
        sub_25D1D362C(*(void *)(v67 + 600), &qword_26A66F528);
        uint64_t v118 = 0;
        uint64_t v119 = 0;
      }
      else
      {
        uint64_t v120 = OUTLINED_FUNCTION_118_6();
        v121(v120);
        sub_25D1D362C(v117, &qword_26A66F528);
        uint64_t v118 = sub_25D538840();
        uint64_t v119 = v122;
        os_log_type_t v123 = OUTLINED_FUNCTION_95_0();
        v124(v123);
      }
      uint64_t v125 = *(void *)(v205 + 592);
      uint64_t v126 = *(void *)(v205 + 560);
      *(void *)(v205 + 392) = v118;
      *(void *)(v205 + 400) = v119;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF20);
      uint64_t v127 = sub_25D53E270();
      *(void *)(v205 + 424) = sub_25D19E114(v127, v128, (uint64_t *)&v206);
      sub_25D53EA80();
      swift_bridgeObjectRelease();

      *(_WORD *)(v115 + 18) = 1024;
      uint64_t v129 = sub_25D2EAEA8();

      *(_DWORD *)(v205 + 732) = v129 & 1;
      sub_25D53EA80();

      *(_WORD *)(v115 + 24) = 2080;
      sub_25D2EAF5C(v125);
      uint64_t v130 = v125;
      uint64_t v67 = v205;
      uint64_t v131 = __swift_getEnumTagSinglePayload(v130, 1, v126);
      uint64_t v132 = *(void *)(v205 + 592);
      uint64_t v45 = v202;
      if (v131)
      {
        sub_25D1D362C(*(void *)(v205 + 592), &qword_26A66F528);
        uint64_t v133 = 0;
        char v134 = 0;
      }
      else
      {
        uint64_t v135 = OUTLINED_FUNCTION_118_6();
        v136(v135);
        sub_25D1D362C(v132, &qword_26A66F528);
        uint64_t v133 = sub_25D538840();
        char v134 = v137;
        OUTLINED_FUNCTION_95_0();
        uint64_t v45 = v202;
        OUTLINED_FUNCTION_30_1();
        v138();
      }
      *(void *)(v205 + 376) = v133;
      *(void *)(v205 + 384) = v134;
      uint64_t v139 = sub_25D53E270();
      *(void *)(v205 + 448) = sub_25D19E114(v139, v140, (uint64_t *)&v206);
      sub_25D53EA80();
      swift_bridgeObjectRelease();

      char v111 = logc;
      _os_log_impl(&dword_25D16D000, logc, v194, "#SendMessageNeedsValueFlowStrategy recipient, replacing old-crrIsForcePrompt:%{BOOL}d old-crrCommsAppSelectionJointId:%s with crrIsForcePrompt:%{BOOL}d crrCommsAppSelectionJointId:%s", (uint8_t *)v115, 0x22u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
    }
    uint64_t v141 = *(void *)(v67 + 584);
    sub_25D2EAF5C(v141);
    sub_25D2EB1A0(v141);
    sub_25D2EAEA8();
    sub_25D2EB148();
LABEL_85:
    sub_25D50F6DC((uint64_t)v45, (uint64_t (*)(void))sub_25D2063CC, (unint64_t *)&qword_26A66F530, 0x263F0FEA8, (void (*)(uint64_t))sub_25D2063D8);
    os_log_type_t v142 = objc_msgSend(v69, sel_speakableGroupName);

    if (v142)
    {
      uint64_t v143 = sub_25D2EAC1C();
      sub_25D2EB064(v143, v144);
    }
    uint64_t v45 = v45;
    uint64_t v145 = sub_25D203AAC();

    uint64_t v146 = *(void *)(v145 + 16);
    swift_bridgeObjectRelease();
    if (v146)
    {
      uint64_t v147 = (void *)sub_25D53A360();
      uint64_t v148 = v45;
      sub_25D203AAC();

      sub_25D203A20();
    }
    uint64_t v149 = sub_25D2EBAAC(v69);
    uint64_t v150 = MEMORY[0x263F8EE78];
    if (!v149) {
      break;
    }
    uint64_t v151 = v149;
    *(void *)&v206 = MEMORY[0x263F8EE78];
    if (v149 >> 62)
    {
      uint64_t v152 = sub_25D53EEB0();
      if (!v152)
      {
LABEL_107:
        swift_bridgeObjectRelease();
        uint64_t v150 = MEMORY[0x263F8EE78];
        break;
      }
    }
    else
    {
      uint64_t v152 = *(void *)((v149 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v152) {
        goto LABEL_107;
      }
    }
    if (v152 >= 1)
    {
      for (unint64_t i = 0; i != v152; ++i)
      {
        if ((v151 & 0xC000000000000001) != 0) {
          uint64_t v154 = (id)MEMORY[0x2611AC4C0](i, v151);
        }
        else {
          uint64_t v154 = *(id *)(v151 + 8 * i + 32);
        }
        uint64_t v155 = v154;
        if (sub_25D3FBD98())
        {
          sub_25D53EDA0();
          sub_25D53EDD0();
          sub_25D53EDE0();
          sub_25D53EDB0();
        }
        else
        {
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v150 = v206;
      break;
    }
    __break(1u);
LABEL_146:
    swift_once();
  }
  if (v150 >> 62) {
    goto LABEL_125;
  }
  uint64_t v159 = *(void *)((v150 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v159)
  {
    while (1)
    {
      if ((v150 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v161 = (id)MEMORY[0x2611AC4C0](0, v150);
      }
      else
      {
        uint64_t v160 = *(void **)(v150 + 32);
        swift_bridgeObjectRetain();
        uint64_t v161 = v160;
      }
      uint64_t v162 = v161;
      long long v163 = sub_25D3FBDF4();

      if (v163)
      {
        uint64_t v164 = 1;
        goto LABEL_123;
      }
      if (v159 == 1) {
        break;
      }
      uint64_t v165 = 5;
      while (1)
      {
        uint64_t v166 = (v150 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x2611AC4C0](v165 - 4, v150)
             : *(id *)(v150 + 8 * v165);
        os_log_type_t v167 = v166;
        uint64_t v168 = v165 - 3;
        if (__OFADD__(v165 - 4, 1)) {
          break;
        }
        uint64_t v164 = sub_25D3FBDF4();

        if ((v164 & 1) == 0)
        {
          ++v165;
          if (v168 != v159) {
            continue;
          }
        }
        goto LABEL_123;
      }
      __break(1u);
LABEL_125:
      swift_bridgeObjectRetain();
      uint64_t v159 = sub_25D53EEB0();
      swift_bridgeObjectRelease();
      if (!v159) {
        goto LABEL_126;
      }
    }
    uint64_t v164 = 0;
LABEL_123:
    swift_bridgeObjectRelease_n();
    uint64_t v169 = v204;
    *(unsigned char *)(v204 + 224) = v164 & 1;
  }
  else
  {
LABEL_126:
    swift_bridgeObjectRelease();
    uint64_t v169 = v204;
  }
  if (sub_25D2EBAAC(v69)
    && ((OUTLINED_FUNCTION_48_2(), v171) ? (v172 = sub_25D53EEB0()) : (v172 = *(void *)(v170 + 16)),
        swift_bridgeObjectRelease(),
        v172))
  {
    uint64_t v173 = sub_25D2EACDC();
    if (!v173)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6739B0);
      uint64_t v173 = sub_25D53E0F0();
    }
    uint64_t v174 = v173;
    uint64_t v175 = sub_25D2EACDC();
    if (!v175)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6739B0);
      uint64_t v175 = sub_25D53E0F0();
    }
    sub_25D50F294(v175, v174);
    if (!*(void *)(v169 + 88))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6739B0);
      sub_25D53E0F0();
      OUTLINED_FUNCTION_64_1();
    }
    swift_bridgeObjectRetain();
    uint64_t v176 = OUTLINED_FUNCTION_48_5();
    *(void *)(v169 + 88) = sub_25D50F294(v176, v177);
  }
  else
  {
    *(void *)(v169 + 88) = 0;
  }
  uint64_t v178 = (void *)(v67 + 216);
  uint64_t v179 = (void *)(v67 + 176);
  uint64_t v180 = v67 + 136;
  uint64_t v181 = *(void **)(v67 + 504);
  swift_bridgeObjectRelease();
  uint64_t v182 = (void *)sub_25D53A360();
  objc_msgSend(v182, sel__setLaunchId_, 0);

  uint64_t v183 = sub_25D53A360();
  *(void *)(v67 + 704) = v183;
  uint64_t v184 = (uint64_t *)v67;
  uint64_t v185 = v181[5];
  uint64_t v186 = v181[6];
  __swift_project_boxed_opaque_existential_0(v181 + 2, v185);
  (*(void (**)(uint64_t, uint64_t))(v186 + 24))(v185, v186);
  OUTLINED_FUNCTION_227_1(v181 + 2);
  OUTLINED_FUNCTION_14_0();
  v187();
  __swift_project_boxed_opaque_existential_0(v179, v184[25]);
  uint64_t v188 = sub_25D539700();
  OUTLINED_FUNCTION_227_1(v181 + 2);
  OUTLINED_FUNCTION_233_1();
  OUTLINED_FUNCTION_14_0();
  v189();
  __swift_project_boxed_opaque_existential_0(v178, v184[30]);
  sub_25D539650();
  uint64_t v190 = (void *)swift_task_alloc();
  v184[89] = (uint64_t)v190;
  *uint64_t v190 = v184;
  v190[1] = sub_25D513640;
  uint64_t v191 = v184[69];
  return sub_25D42A13C(v203, v183, v180, v188 & 1, v191);
}

uint64_t sub_25D513640()
{
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *char v4 = v3;
  uint64_t v5 = v3 + 136;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v7 = v6;
  *(void *)(v3 + 720) = v0;
  swift_task_dealloc();

  if (v0)
  {
    OUTLINED_FUNCTION_14_8();
    OUTLINED_FUNCTION_63_4();
    v8();
    __swift_destroy_boxed_opaque_existential_0(v5);
  }
  else
  {
    OUTLINED_FUNCTION_19_5();
    v9();
    __swift_destroy_boxed_opaque_existential_0(v5);
    __swift_destroy_boxed_opaque_existential_0(v3 + 216);
    __swift_destroy_boxed_opaque_existential_0(v3 + 176);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25D5137A4()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 688) + 136);
  unint64_t v2 = 0x26A66E000uLL;
  if (*(unsigned __int8 *)(v0 + 736) - 1 < 3)
  {
    *(_OWORD *)(v0 + 16) = 0u;
    uint64_t v3 = *(void **)(v0 + 696);
    uint64_t v4 = *(void *)(v0 + 504);
    *(_OWORD *)(v0 + 32) = 0u;
    *(void *)(v0 + 48) = 0;
    uint64_t v5 = v1;
    swift_retain();
    sub_25D1B23D0();
    sub_25D1D362C(v0 + 16, &qword_26A66F7C0);
    __swift_project_boxed_opaque_existential_0((void *)(v4 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_siriKitEventSender), *(void *)(v4 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_siriKitEventSender + 24));
    sub_25D5395F0();
    id v6 = objc_msgSend(v3, sel_typeName);
    sub_25D53E200();
    unint64_t v2 = v7;

    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v3;
    *(void *)(v8 + 24) = v5;
    id v9 = v3;
    swift_retain();
    OUTLINED_FUNCTION_235_1();
    OUTLINED_FUNCTION_194_2();
    sub_25D539320();
LABEL_5:
    swift_release();
    goto LABEL_11;
  }
  if (!*(unsigned char *)(v0 + 736))
  {
    uint64_t v10 = *(void **)(v0 + 696);
    uint64_t v11 = *(void *)(v0 + 504);
    uint64_t v12 = *(void *)(*(void *)(v0 + 688) + 136);
    swift_retain();
    sub_25D1B1624(v10, 1);
    __swift_project_boxed_opaque_existential_0((void *)(v11 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_siriKitEventSender), *(void *)(v11 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_siriKitEventSender + 24));
    sub_25D5395F0();
    id v13 = objc_msgSend(v10, sel_typeName);
    sub_25D53E200();
    unint64_t v2 = v14;

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v10;
    *(void *)(v15 + 24) = v12;
    id v16 = v10;
    swift_retain();
    OUTLINED_FUNCTION_235_1();
    OUTLINED_FUNCTION_194_2();
    sub_25D539320();
    goto LABEL_5;
  }
  uint64_t v17 = qword_26A66E778;
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25D53DC10();
  uint64_t v19 = OUTLINED_FUNCTION_84_0(v18, (uint64_t)qword_26A688F10);
  os_log_type_t v20 = sub_25D53E7C0();
  if (os_log_type_enabled(v19, v20))
  {
    OUTLINED_FUNCTION_26();
    *(void *)&v55[0] = OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_249_0(4.8149e-34);
    *(void *)(v0 + 440) = sub_25D19E114(v21, v22, (uint64_t *)v55);
    OUTLINED_FUNCTION_82_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_228_1(&dword_25D16D000, v19, v20, "#SendMessageNeedsValueFlowStrategy not logging needs value for slot %s");
    OUTLINED_FUNCTION_36_7();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

LABEL_11:
  if (*(void *)(v2 + 1912) != -1) {
    swift_once();
  }
  uint64_t v23 = *(void **)(v0 + 696);
  uint64_t v24 = sub_25D53DC10();
  __swift_project_value_buffer(v24, (uint64_t)qword_26A688F10);
  id v25 = v23;
  uint64_t v26 = sub_25D53DC00();
  os_log_type_t v27 = sub_25D53E7B0();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = *(void **)(v0 + 696);
  if (v28)
  {
    char v30 = *(unsigned char *)(v0 + 736);
    uint64_t v31 = swift_slowAlloc();
    uint64_t v54 = (void *)swift_slowAlloc();
    *(void *)&v55[0] = OUTLINED_FUNCTION_30();
    *(_DWORD *)uint64_t v31 = 136315394;
    sub_25D2063D8(v30);
    *(void *)(v0 + 432) = sub_25D19E114(v32, v33, (uint64_t *)v55);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2112;
    *(void *)(v0 + 472) = v29;
    id v34 = v29;
    sub_25D53EA80();
    *uint64_t v54 = v29;

    _os_log_impl(&dword_25D16D000, v26, v27, "#SendMessageNeedsValueFlowStrategy from slot:%s updated intent: %@", (uint8_t *)v31, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A672E50);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  id v35 = *(id *)(v0 + 696);
  uint64_t v36 = sub_25D53DC00();
  os_log_type_t v37 = sub_25D53E7B0();
  BOOL v38 = os_log_type_enabled(v36, v37);
  unint64_t v39 = *(void **)(v0 + 696);
  if (v38)
  {
    uint64_t v40 = (uint8_t *)OUTLINED_FUNCTION_26();
    *(void *)&v55[0] = OUTLINED_FUNCTION_30();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v0 + 360) = sub_25D203B8C();
    *(void *)(v0 + 368) = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF20);
    uint64_t v42 = sub_25D53E270();
    *(void *)(v0 + 416) = sub_25D19E114(v42, v43, (uint64_t *)v55);
    sub_25D53EA80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25D16D000, v36, v37, "#SendMessageNeedsValueFlowStrategy updated intent app bundle id: %s", v40, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  uint64_t v44 = *(void **)(v0 + 680);
  uint64_t v45 = *(void *)(v0 + 672);
  uint64_t v46 = *(void *)(v0 + 648);
  uint64_t v47 = *(void *)(v0 + 640);
  uint64_t v48 = *(void *)(v0 + 480);
  sub_25D50F8D0(*(unsigned __int8 *)(v0 + 736), (unint64_t *)&qword_26A66F530, 0x263F0FEA8, (void (*)(uint64_t))sub_25D2063D8, v55);
  sub_25D17DBEC(0, (unint64_t *)&qword_26A66F530);
  sub_25D539E40();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FCB0);
  OUTLINED_FUNCTION_492(v48, v50, v51, v49);
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
  OUTLINED_FUNCTION_2_2();
  return v52();
}

uint64_t sub_25D513F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v15 = *(void **)(v14 + 680);

  __swift_destroy_boxed_opaque_existential_0(v14 + 56);
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_29_5();
  v16();
  __swift_destroy_boxed_opaque_existential_0(v14 + 216);
  __swift_destroy_boxed_opaque_existential_0(v14 + 176);
  OUTLINED_FUNCTION_108_7();
  uint64_t v28 = v17;
  uint64_t v29 = v18;
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
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_43();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, v28, v29, a12, a13, a14);
}

uint64_t sub_25D514030(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0 && (a1 & 0x4000000000000000) == 0) {
    return a1 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t v1 = sub_25D1F7DDC(a1);
  swift_bridgeObjectRelease();
  return (uint64_t)v1;
}

uint64_t sub_25D51408C()
{
  OUTLINED_FUNCTION_14();
  v1[30] = v2;
  v1[31] = v0;
  v1[29] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v4);
  v1[32] = OUTLINED_FUNCTION_92();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC60);
  v1[33] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[34] = v6;
  v1[35] = OUTLINED_FUNCTION_24_0();
  v1[36] = swift_task_alloc();
  uint64_t v7 = sub_25D539D00();
  v1[37] = v7;
  OUTLINED_FUNCTION_11_0(v7);
  v1[38] = v8;
  v1[39] = OUTLINED_FUNCTION_92();
  uint64_t v9 = sub_25D539F20();
  v1[40] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v1[41] = v10;
  v1[42] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_25D5141B0()
{
  uint64_t v61 = v0;
  uint64_t v1 = *(void *)(v0 + 328);
  sub_25D53A380();
  sub_25D539F10();
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  *(void *)(v0 + 344) = v2;
  *(void *)(v0 + 352) = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  OUTLINED_FUNCTION_85_2();
  OUTLINED_FUNCTION_29_5();
  v2();
  char v3 = sub_25D2063C0();
  *(unsigned char *)(v0 + 456) = v3;
  if (v3 == 9)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void *)(v0 + 272);
    uint64_t v4 = *(void *)(v0 + 280);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v7 = *(void *)(v0 + 240);
    uint64_t v8 = sub_25D53DC10();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A688F10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    uint64_t v9 = sub_25D53DC00();
    os_log_type_t v10 = sub_25D53E7C0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_26();
      v60[0] = OUTLINED_FUNCTION_30();
      *(_DWORD *)uint64_t v11 = 136315138;
      sub_25D53A380();
      uint64_t v12 = sub_25D539F10();
      unint64_t v14 = v13;
      OUTLINED_FUNCTION_29_5();
      v2();
      *(void *)(v0 + 216) = sub_25D19E114(v12, v14, v60);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_65();
      v15();
      _os_log_impl(&dword_25D16D000, v9, v10, "#SendMessageNeedsValueFlowStrategy unknown parameter: %s", v11, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 272) + 8))(*(void *)(v0 + 280), *(void *)(v0 + 264));
    }

    sub_25D53A380();
    uint64_t v27 = sub_25D539F10();
    uint64_t v29 = v28;
    OUTLINED_FUNCTION_127();
    OUTLINED_FUNCTION_29_5();
    v2();
    sub_25D1BFA18();
    OUTLINED_FUNCTION_58_1();
    *char v30 = v27;
    v30[1] = v29;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    goto LABEL_14;
  }
  char v16 = v3;
  uint64_t v17 = *(void *)(*(void *)(v0 + 248) + 56);
  if (*(unsigned char *)(v17 + 288) == 1)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v18 = (unsigned char *)(v17 + 288);
    uint64_t v19 = sub_25D53DC10();
    os_log_type_t v20 = (void *)OUTLINED_FUNCTION_84_0(v19, (uint64_t)qword_26A688F10);
    os_log_type_t v21 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_61_1(v21))
    {
      uint64_t v22 = (_DWORD *)OUTLINED_FUNCTION_26();
      v60[0] = OUTLINED_FUNCTION_30();
      *uint64_t v22 = 136315138;
      sub_25D2063D8(v16);
      *(void *)(v0 + 224) = sub_25D19E114(v23, v24, v60);
      OUTLINED_FUNCTION_82_3();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36_12(&dword_25D16D000, v25, v26, "#SendMessageNeedsValueFlowStrategy request triggered by change via snippet, supressing prompt for %s");
      OUTLINED_FUNCTION_36_7();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }

    unsigned char *v18 = 0;
    sub_25D539810();
    sub_25D539800();
    OUTLINED_FUNCTION_153_4();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
LABEL_14:
    OUTLINED_FUNCTION_10_20();
    __asm { BRAA            X1, X16 }
  }
  unint64_t v33 = (void *)sub_25D53A360();
  *(void *)(v0 + 360) = sub_25D53E980();

  if (v16 == 3 && sub_25D36E314())
  {
    uint64_t v34 = *(void *)(v17 + 56);
    if (v34)
    {
      uint64_t v35 = *(void *)(v17 + 48);
      *(void *)(v0 + 200) = MEMORY[0x263F8D310];
      *(void *)(v0 + 176) = v35;
      *(void *)(v0 + 184) = v34;
      swift_bridgeObjectRetain();
      sub_25D50F4E4();
      sub_25D1D362C(v0 + 176, &qword_26A671A70);
    }
  }
  sub_25D2063D8(v16);
  if (v37 == 0x6E65697069636572 && v36 == 0xE900000000000074) {
    goto LABEL_34;
  }
  char v39 = OUTLINED_FUNCTION_3_22();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_35;
  }
  sub_25D2063D8(v16);
  if (v41 == 0x746E65746E6F63 && v40 == 0xE700000000000000)
  {
LABEL_34:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v43 = OUTLINED_FUNCTION_88_10();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      *(void *)(v0 + 424) = sub_25D53A350();
      *(void *)(v0 + 432) = sub_25D53A360();
      uint64_t v44 = (void *)swift_task_alloc();
      *(void *)(v0 + 440) = v44;
      *uint64_t v44 = v0;
      v44[1] = sub_25D514C08;
      OUTLINED_FUNCTION_10_20();
      return sub_25D51B014(v45, v46, v47, v48);
    }
  }
LABEL_35:
  __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v0 + 248) + 16), *(void *)(*(void *)(v0 + 248) + 40));
  OUTLINED_FUNCTION_231_1();
  OUTLINED_FUNCTION_14_0();
  v50();
  uint64_t v51 = *(void *)(v0 + 168);
  uint64_t v52 = OUTLINED_FUNCTION_1_5((void *)(v0 + 136));
  if (sub_25D3D38B8(v52, v51))
  {
    char v53 = sub_25D53E890();
    __swift_destroy_boxed_opaque_existential_0(v0 + 136);
    if (v53)
    {
      *(void *)(v0 + 368) = sub_25D53A350();
      swift_task_alloc();
      OUTLINED_FUNCTION_38_0();
      *(void *)(v0 + 376) = v54;
      *uint64_t v54 = v55;
      v54[1] = sub_25D514968;
      OUTLINED_FUNCTION_10_20();
      return sub_25D518B0C();
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  }
  *(void *)(v0 + 392) = sub_25D53A350();
  *(void *)(v0 + 400) = sub_25D53A370();
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  *(void *)(v0 + 408) = v57;
  *uint64_t v57 = v58;
  v57[1] = sub_25D514AEC;
  OUTLINED_FUNCTION_10_20();
  return sub_25D515234();
}

uint64_t sub_25D514968()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *char v3 = v2;
  *char v3 = *v1;
  *(void *)(v2 + 384) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25D514A68()
{
  OUTLINED_FUNCTION_35_1();

  OUTLINED_FUNCTION_153_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v1();
}

uint64_t sub_25D514AEC()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 416) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();

  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D514C08()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 448) = v0;
  swift_task_dealloc();
  if (!v0)
  {

    swift_release();
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D514CF4()
{
  uint64_t v28 = v0;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25D53DC10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A688F10);
  uint64_t v2 = OUTLINED_FUNCTION_30_23();
  v3(v2);
  uint64_t v4 = sub_25D53DC00();
  os_log_type_t v5 = sub_25D53E7B0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 336);
    uint64_t v24 = *(void *)(v0 + 320);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    OUTLINED_FUNCTION_26();
    uint64_t v27 = OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_246_0(4.8149e-34);
    sub_25D53A380();
    uint64_t v7 = sub_25D539F10();
    unint64_t v9 = v8;
    v25(v6, v24);
    *(void *)(v0 + 208) = sub_25D19E114(v7, v9, &v27);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_5();
    v10();
    OUTLINED_FUNCTION_61_11(&dword_25D16D000, v11, v12, "#SendMessageNeedsValueFlowStrategy prompting value for parameter %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 272) + 8))(*(void *)(v0 + 288), *(void *)(v0 + 264));
  }

  uint64_t v26 = *(void **)(v0 + 360);
  uint64_t v14 = *(void *)(v0 + 248);
  uint64_t v13 = *(void *)(v0 + 256);
  uint64_t v15 = *(uint64_t **)(v0 + 232);
  __swift_project_boxed_opaque_existential_0((void *)(v14 + 16), *(void *)(v14 + 40));
  OUTLINED_FUNCTION_237_1();
  OUTLINED_FUNCTION_14_0();
  v16();
  __swift_project_boxed_opaque_existential_0((void *)(v14 + 16), *(void *)(v14 + 40));
  OUTLINED_FUNCTION_14_0();
  v17();
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 56), *(void *)(v0 + 80));
  OUTLINED_FUNCTION_72_0();
  sub_25D5396A0();
  sub_25D51B694();
  uint64_t v18 = sub_25D53A710();
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  uint64_t v19 = MEMORY[0x263F6FFF0];
  v15[3] = v18;
  v15[4] = v19;
  __swift_allocate_boxed_opaque_existential_0(v15);
  sub_25D539A40();

  sub_25D1D362C(v0 + 96, &qword_26A674B60);
  sub_25D1D362C(v13, (uint64_t *)&unk_26A6719F0);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  OUTLINED_FUNCTION_65();
  v21(v20);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  OUTLINED_FUNCTION_153_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v22();
}

uint64_t sub_25D51508C()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();

  OUTLINED_FUNCTION_152_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25D515114()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();

  OUTLINED_FUNCTION_152_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25D51519C()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = *(void **)(v0 + 432);

  swift_release();
  OUTLINED_FUNCTION_152_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_25D515234()
{
  OUTLINED_FUNCTION_14();
  *(unsigned char *)(v1 + 416) = v2;
  *(void *)(v1 + 192) = v3;
  *(void *)(v1 + 200) = v0;
  *(void *)(v1 + 176) = v4;
  *(void *)(v1 + 184) = v5;
  uint64_t v6 = sub_25D53A2F0();
  *(void *)(v1 + 208) = v6;
  OUTLINED_FUNCTION_11_0(v6);
  *(void *)(v1 + 216) = v7;
  *(void *)(v1 + 224) = OUTLINED_FUNCTION_92();
  uint64_t v8 = type metadata accessor for SendMessageAskForPayloadParameters(0);
  *(void *)(v1 + 232) = v8;
  OUTLINED_FUNCTION_17_0(v8);
  *(void *)(v1 + 240) = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D5152EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_40();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_94();
  a20 = v23;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_25D53DC10();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_26A688F10);
  *(void *)(v23 + 248) = v27;
  uint64_t v28 = sub_25D53DC00();
  os_log_type_t v29 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_29(v29))
  {
    char v30 = *(unsigned char *)(v23 + 416);
    uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_26();
    a10 = OUTLINED_FUNCTION_30();
    *(_DWORD *)uint64_t v31 = 136315138;
    sub_25D2063D8(v30);
    *(void *)(v23 + 168) = sub_25D19E114(v32, v33, &a10);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v28, v22, "#SendMessageNeedsValueFlowStrategy executing pattern to ask for %s", v31, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

  int v34 = *(unsigned __int8 *)(v23 + 416);
  *(void *)(v23 + 152) = 0;
  if (v34 != 3)
  {
    if (!v34)
    {
      __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v23 + 200)+ OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns), *(void *)(*(void *)(v23 + 200)+ OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns+ 24));
      OUTLINED_FUNCTION_252_1();
      uint64_t v35 = (void *)swift_task_alloc();
      *(void *)(v23 + 256) = v35;
      *uint64_t v35 = v23;
      v35[1] = sub_25D515764;
      OUTLINED_FUNCTION_43();
      return v38(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14);
    }
    goto LABEL_18;
  }
  if (sub_25D53E890())
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v23 + 280) = v45;
    *uint64_t v45 = v46;
    v45[1] = sub_25D515B8C;
    OUTLINED_FUNCTION_43();
    return sub_25D51A37C();
  }
  else
  {
    if ((sub_25D53E8A0() & 1) == 0)
    {
LABEL_18:
      uint64_t v59 = sub_25D53DC00();
      os_log_type_t v60 = sub_25D53E7C0();
      if (OUTLINED_FUNCTION_55_1(v60))
      {
        char v61 = *(unsigned char *)(v23 + 416);
        uint64_t v62 = (uint8_t *)OUTLINED_FUNCTION_26();
        a10 = OUTLINED_FUNCTION_30();
        *(_DWORD *)uint64_t v62 = 136315138;
        sub_25D2063D8(v61);
        *(void *)(v23 + 136) = sub_25D19E114(v63, v64, &a10);
        OUTLINED_FUNCTION_95_0();
        sub_25D53EA80();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25D16D000, v59, (os_log_type_t)v27, "#SendMessageNeedsValueFlowStrategy parameter %s not supported by pattern", v62, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }

      sub_25D1BFA18();
      OUTLINED_FUNCTION_58_1();
      *int v65 = xmmword_25D541260;
      swift_willThrow();
      OUTLINED_FUNCTION_116_8();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_43();
      return v67(v66, v67, v68, v69, v70, v71, v72, v73, a9, a10, a11, a12, a13, a14);
    }
    char v48 = *(void **)(v23 + 192);
    __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v23 + 200)+ OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns), *(void *)(*(void *)(v23 + 200)+ OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns+ 24));
    OUTLINED_FUNCTION_252_1();
    swift_retain();
    id v49 = v48;
    uint64_t v50 = (void *)swift_task_alloc();
    *(void *)(v23 + 320) = v50;
    *uint64_t v50 = v23;
    v50[1] = sub_25D516200;
    OUTLINED_FUNCTION_43();
    return v55(v51, v52, v53, v54, v55, v56, v57, v58, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_25D515764()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 264) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 272) = v3;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D515854()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v2 = (void *)v0[34];
  v0[18] = v2;
  uint64_t v3 = (id *)(v0 + 18);
  id v4 = v2;
  uint64_t v5 = (void *)sub_25D53DC00();
  os_log_type_t v6 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_61_1(v6))
  {
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_154_4(4.8149e-34);
    id v1 = objc_msgSend(v4, sel_patternId);
    sub_25D53E200();

    uint64_t v9 = OUTLINED_FUNCTION_219_1(v7, v8);
    OUTLINED_FUNCTION_104_8(v9);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_36_12(&dword_25D16D000, v10, v11, "#SendMessageNeedsValueFlowStrategy pattern %s successfully executed");
    OUTLINED_FUNCTION_36_7();
    OUTLINED_FUNCTION_3_0();
    uint64_t v3 = (id *)(v0 + 18);
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  OUTLINED_FUNCTION_218_1();
  OUTLINED_FUNCTION_168_3();
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = (void *)v0[18];
  v0[44] = v13;
  uint64_t v14 = sub_25D51CE34(v13);
  OUTLINED_FUNCTION_248(v14, v15);
  if (!v12 & v16) {
    goto LABEL_14;
  }
  v0[10] = &type metadata for Features;
  unint64_t v17 = sub_25D17981C();
  char v18 = OUTLINED_FUNCTION_166_5(v17);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v3 - 11));
  if ((v18 & 1) != 0 && (uint64_t v19 = (void *)v0[19], (v0[45] = v19) != 0))
  {
    v19;
    uint64_t v20 = sub_25D53DC00();
    os_log_type_t v21 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_29(v21))
    {
      os_log_type_t v22 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_96_0(v22);
      OUTLINED_FUNCTION_148_2(&dword_25D16D000, v20, v23, "#SendMessageNeedsValueFlowStrategy request triggered by change via snippet, trying to update snippet");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v24 = (void *)swift_task_alloc();
    v0[46] = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_25D516628;
    OUTLINED_FUNCTION_135_3();
    OUTLINED_FUNCTION_43();
    return sub_25D238410();
  }
  else
  {
LABEL_14:
    if ((sub_25D53A2C0() & 1) == 0)
    {
      uint64_t v27 = sub_25D51CD98(v3);
      OUTLINED_FUNCTION_248(v27, v28);
      if (!v12 & v16) {
        uint64_t v29 = OUTLINED_FUNCTION_370();
      }
      else {
        uint64_t v29 = sub_25D53A210();
      }
      OUTLINED_FUNCTION_124_7(v29, v30);
    }
    OUTLINED_FUNCTION_123_7();
    OUTLINED_FUNCTION_91();
    uint64_t v31 = sub_25D539C60();
    OUTLINED_FUNCTION_34_36(v31);
    uint64_t v32 = OUTLINED_FUNCTION_80_9();
    ((void (*)(uint64_t))v1)(v32);
    OUTLINED_FUNCTION_74_15();
    uint64_t v33 = swift_task_alloc();
    int v34 = (void *)OUTLINED_FUNCTION_161_4(v33);
    *int v34 = v35;
    v34[1] = sub_25D5168C8;
    OUTLINED_FUNCTION_66_15();
    OUTLINED_FUNCTION_43();
    return sub_25D49DA78(v36, v37, v38, v39, v40);
  }
}

uint64_t sub_25D515B1C()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_116_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D515B8C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D515C54()
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v4 = v0[23];
  __swift_project_boxed_opaque_existential_0((void *)(v2 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns), *(void *)(v2 + OBJC_IVAR____TtC16SiriMessagesFlow27SendMessageBaseFlowStrategy_sendMessagePatterns + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[36] = v5;
  v5[2] = v1;
  v5[3] = v3;
  v5[4] = v2;
  v5[5] = v4;
  v5[6] = v0 + 19;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[37] = v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_25D515D5C;
  OUTLINED_FUNCTION_79();
  return sub_25D252BA0();
}

uint64_t sub_25D515D5C()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v1;
  *(void *)(v4 + 304) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v4 + 312) = v3;
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D515E8C()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v2 = *(void *)(v0 + 312);
  sub_25D51E5D4();
  *(void *)(v0 + 144) = v2;
  uint64_t v3 = (id *)(v0 + 144);
  id v4 = *(id *)(v0 + 312);
  uint64_t v5 = (void *)sub_25D53DC00();
  os_log_type_t v6 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_61_1(v6))
  {
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_154_4(4.8149e-34);
    id v1 = objc_msgSend(v4, sel_patternId);
    sub_25D53E200();

    uint64_t v9 = OUTLINED_FUNCTION_219_1(v7, v8);
    OUTLINED_FUNCTION_104_8(v9);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_36_12(&dword_25D16D000, v10, v11, "#SendMessageNeedsValueFlowStrategy pattern %s successfully executed");
    OUTLINED_FUNCTION_36_7();
    OUTLINED_FUNCTION_3_0();
    uint64_t v3 = (id *)(v0 + 144);
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  OUTLINED_FUNCTION_218_1();
  OUTLINED_FUNCTION_168_3();
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = *(void **)(v0 + 144);
  *(void *)(v0 + 352) = v13;
  uint64_t v14 = sub_25D51CE34(v13);
  OUTLINED_FUNCTION_248(v14, v15);
  if (!v12 & v16) {
    goto LABEL_14;
  }
  *(void *)(v0 + 80) = &type metadata for Features;
  unint64_t v17 = sub_25D17981C();
  char v18 = OUTLINED_FUNCTION_166_5(v17);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v3 - 11));
  if ((v18 & 1) != 0 && (uint64_t v19 = *(void **)(v0 + 152), (*(void *)(v0 + 360) = v19) != 0))
  {
    v19;
    uint64_t v20 = sub_25D53DC00();
    os_log_type_t v21 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_29(v21))
    {
      os_log_type_t v22 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_96_0(v22);
      OUTLINED_FUNCTION_148_2(&dword_25D16D000, v20, v23, "#SendMessageNeedsValueFlowStrategy request triggered by change via snippet, trying to update snippet");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 368) = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_25D516628;
    OUTLINED_FUNCTION_135_3();
    OUTLINED_FUNCTION_43();
    return sub_25D238410();
  }
  else
  {
LABEL_14:
    if ((sub_25D53A2C0() & 1) == 0)
    {
      uint64_t v27 = sub_25D51CD98(v3);
      OUTLINED_FUNCTION_248(v27, v28);
      if (!v12 & v16) {
        uint64_t v29 = OUTLINED_FUNCTION_370();
      }
      else {
        uint64_t v29 = sub_25D53A210();
      }
      OUTLINED_FUNCTION_124_7(v29, v30);
    }
    OUTLINED_FUNCTION_123_7();
    OUTLINED_FUNCTION_91();
    uint64_t v31 = sub_25D539C60();
    OUTLINED_FUNCTION_34_36(v31);
    uint64_t v32 = OUTLINED_FUNCTION_80_9();
    ((void (*)(uint64_t))v1)(v32);
    OUTLINED_FUNCTION_74_15();
    uint64_t v33 = swift_task_alloc();
    int v34 = (void *)OUTLINED_FUNCTION_161_4(v33);
    *int v34 = v35;
    v34[1] = sub_25D5168C8;
    OUTLINED_FUNCTION_66_15();
    OUTLINED_FUNCTION_43();
    return sub_25D49DA78(v36, v37, v38, v39, v40);
  }
}

uint64_t sub_25D516174()
{
  OUTLINED_FUNCTION_35_1();
  sub_25D51E5D4();
  OUTLINED_FUNCTION_116_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D516200()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *os_log_type_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 328) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 336) = v3;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D5162F0()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v2 = (void *)v0[42];
  v0[18] = v2;
  uint64_t v3 = (id *)(v0 + 18);
  id v4 = v2;
  uint64_t v5 = (void *)sub_25D53DC00();
  os_log_type_t v6 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_61_1(v6))
  {
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_154_4(4.8149e-34);
    id v1 = objc_msgSend(v4, sel_patternId);
    sub_25D53E200();

    uint64_t v9 = OUTLINED_FUNCTION_219_1(v7, v8);
    OUTLINED_FUNCTION_104_8(v9);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_36_12(&dword_25D16D000, v10, v11, "#SendMessageNeedsValueFlowStrategy pattern %s successfully executed");
    OUTLINED_FUNCTION_36_7();
    OUTLINED_FUNCTION_3_0();
    uint64_t v3 = (id *)(v0 + 18);
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  OUTLINED_FUNCTION_218_1();
  OUTLINED_FUNCTION_168_3();
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = (void *)v0[18];
  v0[44] = v13;
  uint64_t v14 = sub_25D51CE34(v13);
  OUTLINED_FUNCTION_248(v14, v15);
  if (!v12 & v16) {
    goto LABEL_14;
  }
  v0[10] = &type metadata for Features;
  unint64_t v17 = sub_25D17981C();
  char v18 = OUTLINED_FUNCTION_166_5(v17);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v3 - 11));
  if ((v18 & 1) != 0 && (uint64_t v19 = (void *)v0[19], (v0[45] = v19) != 0))
  {
    v19;
    uint64_t v20 = sub_25D53DC00();
    os_log_type_t v21 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_29(v21))
    {
      os_log_type_t v22 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_96_0(v22);
      OUTLINED_FUNCTION_148_2(&dword_25D16D000, v20, v23, "#SendMessageNeedsValueFlowStrategy request triggered by change via snippet, trying to update snippet");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v24 = (void *)swift_task_alloc();
    v0[46] = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_25D516628;
    OUTLINED_FUNCTION_135_3();
    OUTLINED_FUNCTION_43();
    return sub_25D238410();
  }
  else
  {
LABEL_14:
    if ((sub_25D53A2C0() & 1) == 0)
    {
      uint64_t v27 = sub_25D51CD98(v3);
      OUTLINED_FUNCTION_248(v27, v28);
      if (!v12 & v16) {
        uint64_t v29 = OUTLINED_FUNCTION_370();
      }
      else {
        uint64_t v29 = sub_25D53A210();
      }
      OUTLINED_FUNCTION_124_7(v29, v30);
    }
    OUTLINED_FUNCTION_123_7();
    OUTLINED_FUNCTION_91();
    uint64_t v31 = sub_25D539C60();
    OUTLINED_FUNCTION_34_36(v31);
    uint64_t v32 = OUTLINED_FUNCTION_80_9();
    ((void (*)(uint64_t))v1)(v32);
    OUTLINED_FUNCTION_74_15();
    uint64_t v33 = swift_task_alloc();
    int v34 = (void *)OUTLINED_FUNCTION_161_4(v33);
    *int v34 = v35;
    v34[1] = sub_25D5168C8;
    OUTLINED_FUNCTION_66_15();
    OUTLINED_FUNCTION_43();
    return sub_25D49DA78(v36, v37, v38, v39, v40);
  }
}

uint64_t sub_25D5165B8()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_116_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D516628()
{
  OUTLINED_FUNCTION_35_1();
  char v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_6_0();
  *os_log_type_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v8 = v7;
  *(void *)(v5 + 376) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(unsigned char *)(v5 + 417) = v3 & 1;
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25D51671C()
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  int v2 = *(unsigned __int8 *)(v0 + 417);
  char v3 = sub_25D53DC00();
  if (v2 == 1)
  {
    os_log_type_t v4 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_51_10(v4))
    {
      uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v5);
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v3, OS_LOG_TYPE_INFO, "#SendMessageNeedsValueFlowStrategy snippet updated, removing visual from pattern execution result");
      OUTLINED_FUNCTION_3_0();
    }
    os_log_type_t v6 = *(void **)(v0 + 352);

    objc_msgSend(v6, sel_setVisual_, 0);
    sub_25D53A2D0();
  }
  else
  {
    os_log_type_t v7 = sub_25D53E7A0();
    if (OUTLINED_FUNCTION_51_10(v7))
    {
      uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25D16D000, v3, (os_log_type_t)v2, "#SendMessageNeedsValueFlowStrategy view not available, falling back to dialog", v8, 2u);
      OUTLINED_FUNCTION_3_0();
    }
  }
  if ((sub_25D53A2C0() & 1) == 0)
  {
    uint64_t v9 = sub_25D51CD98((id *)(v0 + 144));
    OUTLINED_FUNCTION_248(v9, v10);
    if (!v12 & v11) {
      uint64_t v13 = OUTLINED_FUNCTION_370();
    }
    else {
      uint64_t v13 = sub_25D53A210();
    }
    OUTLINED_FUNCTION_124_7(v13, v14);
  }
  OUTLINED_FUNCTION_123_7();
  OUTLINED_FUNCTION_91();
  uint64_t v15 = sub_25D539C60();
  OUTLINED_FUNCTION_34_36(v15);
  uint64_t v16 = OUTLINED_FUNCTION_80_9();
  v1(v16);
  OUTLINED_FUNCTION_74_15();
  uint64_t v17 = swift_task_alloc();
  char v18 = (void *)OUTLINED_FUNCTION_161_4(v17);
  void *v18 = v19;
  v18[1] = sub_25D5168C8;
  OUTLINED_FUNCTION_66_15();
  OUTLINED_FUNCTION_79();
  return sub_25D49DA78(v20, v21, v22, v23, v24);
}

uint64_t sub_25D5168C8()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *os_log_type_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *os_log_type_t v6 = v5;
  *(void *)(v3 + 408) = v0;
  swift_task_dealloc();

  swift_release();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v3 + 16);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D5169D0()
{
  OUTLINED_FUNCTION_31_0();
  id v1 = sub_25D53DC00();
  os_log_type_t v2 = sub_25D53E7B0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25D16D000, v1, v2, "#SendMessageNeedsValueFlowStrategy returning output", v3, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_19_5();
  v4();
  uint64_t v5 = *(void *)(v0 + 176);

  sub_25D188958((long long *)(v0 + 96), v5);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v6();
}

uint64_t sub_25D516AE4()
{
  OUTLINED_FUNCTION_35_1();

  uint64_t v1 = OUTLINED_FUNCTION_23_12();
  v2(v1);

  OUTLINED_FUNCTION_116_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v3();
}

uint64_t sub_25D516B74()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_58_0();
  v1();

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  OUTLINED_FUNCTION_116_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v2();
}

uint64_t sub_25D516C08()
{
  OUTLINED_FUNCTION_14();
  v0[2] = v1;
  v0[3] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v3);
  v0[4] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25D516C88()
{
  OUTLINED_FUNCTION_35_1();
  sub_25D510DCC();
  OUTLINED_FUNCTION_127_6();
  uint64_t v1 = 1;
  switch(v2)
  {
    case 1:
      OUTLINED_FUNCTION_522();
      goto LABEL_4;
    case 2:
      OUTLINED_FUNCTION_159_5();
      goto LABEL_4;
    case 3:
      goto LABEL_5;
    default:
LABEL_4:
      sub_25D53E2C0();
      swift_bridgeObjectRelease();
      uint64_t v1 = 0;
LABEL_5:
      uint64_t v3 = *(void *)(v0 + 32);
      uint64_t v4 = *(void *)(v0 + 16);
      uint64_t v5 = sub_25D53D0A0();
      __swift_storeEnumTagSinglePayload(v3, v1, 1, v5);
      sub_25D194EBC(v3, v4, (uint64_t *)&unk_26A6719E0);
      swift_task_dealloc();
      OUTLINED_FUNCTION_2_2();
      return v6();
  }
}

uint64_t sub_25D516D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[42] = a5;
  v6[43] = a6;
  v6[40] = a3;
  v6[41] = a4;
  v6[38] = a1;
  v6[39] = a2;
  uint64_t v7 = sub_25D53D6E0();
  v6[44] = v7;
  v6[45] = *(void *)(v7 - 8);
  v6[46] = swift_task_alloc();
  uint64_t v8 = sub_25D53D920();
  v6[47] = v8;
  v6[48] = *(void *)(v8 - 8);
  v6[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A40);
  v6[50] = swift_task_alloc();
  uint64_t v9 = sub_25D53D840();
  v6[51] = v9;
  v6[52] = *(void *)(v9 - 8);
  v6[53] = swift_task_alloc();
  uint64_t v10 = sub_25D53D740();
  v6[54] = v10;
  v6[55] = *(void *)(v10 - 8);
  v6[56] = swift_task_alloc();
  uint64_t v11 = sub_25D53D650();
  v6[57] = v11;
  v6[58] = *(void *)(v11 - 8);
  v6[59] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v6[60] = swift_task_alloc();
  v6[61] = swift_task_alloc();
  v6[62] = swift_task_alloc();
  v6[63] = swift_task_alloc();
  v6[64] = swift_task_alloc();
  v6[65] = swift_task_alloc();
  v6[66] = swift_task_alloc();
  v6[67] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D517080, 0, 0);
}

void sub_25D517080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  uint64_t v19 = v18[67];
  uint64_t v20 = v18[41];
  unint64_t v106 = (void *)v18[40];
  uint64_t v107 = v18 + 7;
  uint64_t v21 = (void *)v18[38];
  uint64_t v22 = (void *)v18[39];
  uint64_t v23 = (int *)type metadata accessor for SendMessageAskForPayloadParameters(0);
  v18[68] = v23;
  uint64_t v24 = v23[9];
  uint64_t v25 = *(void *)((char *)v22 + v24);
  swift_retain();
  swift_release();
  *(void *)((char *)v21 + v24) = v25;
  uint64_t v26 = v23[14];
  uint64_t v27 = *(void *)((char *)v22 + v26);
  swift_retain();
  swift_release();
  *(void *)((char *)v21 + v26) = v27;
  sub_25D179B80((uint64_t)v22 + v23[20], (uint64_t)v21 + v23[20]);
  uint64_t v28 = *v22;
  swift_retain();
  swift_release();
  *uint64_t v21 = v28;
  uint64_t v29 = v23[10];
  uint64_t v30 = *(void *)((char *)v22 + v29);
  char v31 = *((unsigned char *)v22 + v29 + 8);
  uint64_t v32 = (char *)v21 + v29;
  *(void *)uint64_t v32 = v30;
  v32[8] = v31;
  __swift_project_boxed_opaque_existential_0((void *)(v20 + 16), *(void *)(v20 + 40));
  OUTLINED_FUNCTION_14_0();
  v33();
  v18[69] = sub_25D3B2DAC(v106, v18 + 2);
  v18[70] = v34;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v18 + 2));
  sub_25D53E2C0();
  uint64_t v35 = sub_25D53D0A0();
  v18[71] = v35;
  OUTLINED_FUNCTION_492(v19, v36, v37, v35);
  sub_25D194EBC(v19, (uint64_t)v21 + v23[8], (uint64_t *)&unk_26A6719E0);
  __swift_project_boxed_opaque_existential_0((void *)(v20 + 16), *(void *)(v20 + 40));
  OUTLINED_FUNCTION_14_0();
  v38();
  LOBYTE(v28) = __swift_project_boxed_opaque_existential_0(v18 + 7, v18[10]);
  sub_25D539720();
  OUTLINED_FUNCTION_151_2();
  uint64_t v39 = (void *)v18[40];
  if (v28)
  {
    unint64_t v40 = sub_25D2EBAAC(v39);
    uint64_t v41 = MEMORY[0x263F8EE78];
    if (!v40)
    {
LABEL_45:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_task_alloc();
      OUTLINED_FUNCTION_38_0();
      v18[72] = v98;
      *uint64_t v98 = v99;
      v98[1] = sub_25D5178B0;
      OUTLINED_FUNCTION_15();
      sub_25D42DDC8(v100, v101, v102, v103, v104);
      return;
    }
    unint64_t v42 = v40;
    if (v40 >> 62)
    {
      uint64_t v43 = sub_25D53EEB0();
      if (v43) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v43 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v43)
      {
LABEL_5:
        sub_25D1F5B18(0, v43 & ~(v43 >> 63), 0);
        if (v43 < 0)
        {
          __break(1u);
          return;
        }
        do
        {
          if ((v42 & 0xC000000000000001) != 0) {
            id v44 = (id)MEMORY[0x2611AC4C0](0, v42);
          }
          else {
            id v44 = *(id *)(v42 + 32);
          }
          uint64_t v45 = v44;
          sub_25D3FDA58(v44);

          unint64_t v47 = *(void *)(v41 + 16);
          unint64_t v46 = *(void *)(v41 + 24);
          if (v47 >= v46 >> 1) {
            sub_25D1F5B18(v46 > 1, v47 + 1, 1);
          }
          OUTLINED_FUNCTION_213_1();
        }
        while (!v48);
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  sub_25D51CD38(v39);
  if (v49)
  {
    sub_25D53E2C0();
    swift_bridgeObjectRelease();
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v50 = 1;
  }
  uint64_t v51 = v18[68];
  uint64_t v52 = v18[65];
  uint64_t v53 = v18[41];
  uint64_t v54 = v18[38];
  __swift_storeEnumTagSinglePayload(v52, v50, 1, v18[71]);
  sub_25D194EBC(v52, v54 + *(int *)(v51 + 44), (uint64_t *)&unk_26A6719E0);
  LOBYTE(v52) = __swift_project_boxed_opaque_existential_0((void *)(v53 + 16), *(void *)(v53 + 40));
  OUTLINED_FUNCTION_14_0();
  v55();
  OUTLINED_FUNCTION_53_12();
  OUTLINED_FUNCTION_151_2();
  if (v52) {
    goto LABEL_19;
  }
  unsigned __int8 v56 = __swift_project_boxed_opaque_existential_0((void *)(v18[41] + 16), *(void *)(v18[41] + 40));
  OUTLINED_FUNCTION_14_0();
  v57();
  OUTLINED_FUNCTION_52_19();
  OUTLINED_FUNCTION_151_2();
  if (v56) {
    goto LABEL_19;
  }
  uint64_t v58 = (void *)v18[40];
  sub_25D51CD38(v58);
  sub_25D51CD38(v58);
  os_log_type_t v60 = v59;
  if (v59) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_119_8();
  OUTLINED_FUNCTION_127_4();
  uint64_t v107 = v60;
  if (v60)
  {
LABEL_23:
    OUTLINED_FUNCTION_58_0();
    v61();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72_10();
    a9 = v63;
    a10 = v62;
    OUTLINED_FUNCTION_239_0();
    a11 = v65;
    unint64_t v106 = v64;
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
    OUTLINED_FUNCTION_48();
    goto LABEL_24;
  }
  uint64_t v74 = (void *)v18[68];
  uint64_t v75 = v18[64];
  uint64_t v76 = (void **)v18[43];
  uint64_t v77 = (void *)v18[40];
  OUTLINED_FUNCTION_58_0();
  v78();
  OUTLINED_FUNCTION_208_0();
  sub_25D194EBC(v75, v79, (uint64_t *)&unk_26A6719E0);
  uint64_t v80 = sub_25D53D300();
  if (v81) {
    uint64_t v82 = v80;
  }
  else {
    uint64_t v82 = 0;
  }
  if (v81) {
    uint64_t v83 = v81;
  }
  else {
    uint64_t v83 = (uint64_t)(v18 + 2);
  }
  id v84 = sub_25D3B2F30(v77, v82, v83);
  swift_bridgeObjectRelease();
  char v85 = *v76;
  *uint64_t v76 = v84;

  if (*v76)
  {
    v18[37] = *v76;
    sub_25D17DBEC(0, &qword_26A66F318);
    uint64_t v74 = 0;
    sub_25D53D720();
  }
  OUTLINED_FUNCTION_122_7();
  sub_25D194EBC((uint64_t)(v18 + 2), v86, (uint64_t *)&unk_26A6719E0);
  sub_25D3F23C8();
  uint64_t v87 = sub_25D53C900();
  OUTLINED_FUNCTION_102_9(v87);
  OUTLINED_FUNCTION_245_1();
  v18[73] = v74;
  if (v74)
  {
    uint64_t v107 = v74;
    goto LABEL_23;
  }
  uint64_t v88 = v18[62];
  uint64_t v89 = v18[41];
  OUTLINED_FUNCTION_58_0();
  v90();
  OUTLINED_FUNCTION_258_1();
  sub_25D194EBC(v88, v91, (uint64_t *)&unk_26A6719E0);
  __swift_project_boxed_opaque_existential_0((void *)(v89 + 16), *(void *)(v89 + 40));
  OUTLINED_FUNCTION_14_0();
  v92();
  if ((OUTLINED_FUNCTION_200_1() & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v18 + 27));
    goto LABEL_19;
  }
  v18[35] = &type metadata for Features;
  unint64_t v93 = sub_25D17981C();
  char v94 = OUTLINED_FUNCTION_235_0(v93);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v18 + 32));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v18 + 27));
  if ((v94 & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_73_12();
    OUTLINED_FUNCTION_240_1();
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
    OUTLINED_FUNCTION_2_2();
LABEL_24:
    OUTLINED_FUNCTION_15();
    v67(v66, v67, v68, v69, v70, v71, v72, v73, a9, a10, a11, v106, v107, a14, a15, a16, a17, a18);
    return;
  }
  uint64_t v95 = (void *)swift_task_alloc();
  v18[74] = v95;
  *uint64_t v95 = v18;
  v95[1] = sub_25D517EF0;
  OUTLINED_FUNCTION_15();
  sub_25D237470(v96);
}

uint64_t sub_25D5178B0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *char v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D517978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  sub_25D53D720();
  uint64_t v20 = *(void *)(v18 + 568);
  uint64_t v21 = *(void *)(v18 + 544);
  uint64_t v22 = *(void *)(v18 + 528);
  uint64_t v23 = *(void *)(v18 + 304);
  OUTLINED_FUNCTION_58_0();
  v24();
  uint64_t v25 = 1;
  __swift_storeEnumTagSinglePayload(v22, 0, 1, v20);
  sub_25D194EBC(v22, v23 + *(int *)(v21 + 28), (uint64_t *)&unk_26A6719E0);
  sub_25D51CD38(*(void **)(v18 + 320));
  if (v26)
  {
    sub_25D53E2C0();
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
  }
  uint64_t v27 = *(void *)(v18 + 544);
  uint64_t v28 = *(void *)(v18 + 520);
  uint64_t v29 = *(void *)(v18 + 328);
  uint64_t v30 = *(void *)(v18 + 304);
  __swift_storeEnumTagSinglePayload(v28, v25, 1, *(void *)(v18 + 568));
  sub_25D194EBC(v28, v30 + *(int *)(v27 + 44), (uint64_t *)&unk_26A6719E0);
  unsigned __int8 v31 = __swift_project_boxed_opaque_existential_0((void *)(v29 + 16), *(void *)(v29 + 40));
  OUTLINED_FUNCTION_14_0();
  v32();
  OUTLINED_FUNCTION_53_12();
  OUTLINED_FUNCTION_151_2();
  if (v31) {
    goto LABEL_7;
  }
  unsigned __int8 v33 = __swift_project_boxed_opaque_existential_0((void *)(*(void *)(v18 + 328) + 16), *(void *)(*(void *)(v18 + 328) + 40));
  OUTLINED_FUNCTION_14_0();
  v34();
  OUTLINED_FUNCTION_52_19();
  OUTLINED_FUNCTION_151_2();
  if (v33) {
    goto LABEL_7;
  }
  char v48 = *(void **)(v18 + 320);
  sub_25D51CD38(v48);
  sub_25D51CD38(v48);
  uint64_t v50 = v49;
  if (v49) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_119_8();
  OUTLINED_FUNCTION_127_4();
  uint64_t v75 = v50;
  if (v50)
  {
LABEL_2:
    OUTLINED_FUNCTION_58_0();
    v19();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72_10();
    OUTLINED_FUNCTION_240_1();
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
    OUTLINED_FUNCTION_48();
LABEL_8:
    OUTLINED_FUNCTION_15();
    return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, v75, a15, a16, a17, a18);
  }
  uint64_t v51 = *(void *)(v18 + 544);
  uint64_t v52 = *(void *)(v18 + 512);
  uint64_t v53 = *(void ***)(v18 + 344);
  uint64_t v54 = *(void **)(v18 + 320);
  OUTLINED_FUNCTION_58_0();
  v55();
  OUTLINED_FUNCTION_208_0();
  sub_25D194EBC(v52, v56, (uint64_t *)&unk_26A6719E0);
  uint64_t v57 = sub_25D53D300();
  if (v58) {
    uint64_t v59 = v57;
  }
  else {
    uint64_t v59 = 0;
  }
  if (v58) {
    uint64_t v60 = v58;
  }
  else {
    uint64_t v60 = v30;
  }
  id v61 = sub_25D3B2F30(v54, v59, v60);
  swift_bridgeObjectRelease();
  uint64_t v62 = *v53;
  *uint64_t v53 = v61;

  if (*v53)
  {
    *(void *)(v18 + 296) = *v53;
    sub_25D17DBEC(0, &qword_26A66F318);
    uint64_t v51 = 0;
    sub_25D53D720();
  }
  OUTLINED_FUNCTION_122_7();
  sub_25D194EBC(v30, v63, (uint64_t *)&unk_26A6719E0);
  sub_25D3F23C8();
  uint64_t v64 = sub_25D53C900();
  OUTLINED_FUNCTION_102_9(v64);
  OUTLINED_FUNCTION_245_1();
  *(void *)(v18 + 584) = v51;
  if (v51)
  {
    uint64_t v75 = v51;
    goto LABEL_2;
  }
  uint64_t v65 = *(void *)(v18 + 496);
  uint64_t v66 = *(void *)(v18 + 328);
  OUTLINED_FUNCTION_58_0();
  v67();
  OUTLINED_FUNCTION_258_1();
  sub_25D194EBC(v65, v68, (uint64_t *)&unk_26A6719E0);
  __swift_project_boxed_opaque_existential_0((void *)(v66 + 16), *(void *)(v66 + 40));
  OUTLINED_FUNCTION_14_0();
  v69();
  if ((OUTLINED_FUNCTION_200_1() & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_0(v18 + 216);
    goto LABEL_7;
  }
  *(void *)(v18 + 280) = &type metadata for Features;
  unint64_t v70 = sub_25D17981C();
  char v71 = OUTLINED_FUNCTION_235_0(v70);
  __swift_destroy_boxed_opaque_existential_0(v18 + 256);
  __swift_destroy_boxed_opaque_existential_0(v18 + 216);
  if ((v71 & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_73_12();
    a11 = v36;
    a12 = v35;
    OUTLINED_FUNCTION_239_0();
    a13 = v38;
    uint64_t v75 = v37;
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
    OUTLINED_FUNCTION_2_2();
    goto LABEL_8;
  }
  uint64_t v72 = (void *)swift_task_alloc();
  *(void *)(v18 + 592) = v72;
  *uint64_t v72 = v18;
  v72[1] = sub_25D517EF0;
  OUTLINED_FUNCTION_15();
  return sub_25D237470(v73);
}

uint64_t sub_25D517EF0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *char v2 = v1;
  *char v2 = *v0;
  *(void *)(v1 + 600) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25D517FC0()
{
  if (!*(void *)(v0[75] + 16)) {
    sub_25D53D300();
  }
  uint64_t v1 = v0[73];
  sub_25D53D910();
  sub_25D53D720();
  if (v1)
  {
    OUTLINED_FUNCTION_58_0();
    v2();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72_10();
    OUTLINED_FUNCTION_239_0();
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
    OUTLINED_FUNCTION_48();
  }
  else
  {
    uint64_t v3 = v0[71];
    uint64_t v4 = v0[68];
    uint64_t v5 = v0[61];
    uint64_t v6 = v0[41];
    uint64_t v21 = (id *)v0[43];
    uint64_t v7 = v0[38];
    OUTLINED_FUNCTION_58_0();
    v8();
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v3);
    sub_25D194EBC(v5, v7 + *(int *)(v4 + 20), (uint64_t *)&unk_26A6719E0);
    __swift_project_boxed_opaque_existential_0((void *)(v6 + 16), *(void *)(v6 + 40));
    OUTLINED_FUNCTION_14_0();
    v9();
    sub_25D3B4204();
    uint64_t v11 = v10;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 22));
    id v12 = *v21;
    sub_25D53D300();
    id v13 = v11;
    sub_25D53D6D0();
    sub_25D53D720();
    uint64_t v16 = v0[71];
    uint64_t v17 = v0[68];
    uint64_t v18 = v0[60];
    uint64_t v19 = v0[38];
    OUTLINED_FUNCTION_58_0();
    v20();

    __swift_storeEnumTagSinglePayload(v18, 0, 1, v16);
    sub_25D194EBC(v18, v19 + *(int *)(v17 + 60), (uint64_t *)&unk_26A6719E0);
    OUTLINED_FUNCTION_73_12();
    OUTLINED_FUNCTION_239_0();
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
    OUTLINED_FUNCTION_2_2();
  }
  return v14();
}

uint64_t sub_25D51836C()
{
  OUTLINED_FUNCTION_14();
  v0[24] = v1;
  v0[25] = v2;
  v0[22] = v3;
  v0[23] = v4;
  uint64_t v5 = sub_25D53D650();
  v0[26] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v0[27] = v6;
  v0[28] = OUTLINED_FUNCTION_92();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v7);
  v0[29] = OUTLINED_FUNCTION_92();
  uint64_t v8 = sub_25D538990();
  v0[30] = v8;
  OUTLINED_FUNCTION_11_0(v8);
  v0[31] = v9;
  v0[32] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25D518450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_40();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_94();
  a20 = v22;
  uint64_t v25 = *(void **)(v22 + 192);
  uint64_t v26 = *(uint64_t **)(v22 + 176);
  sub_25D53D040();
  swift_retain();
  uint64_t v27 = sub_25D4C0694();
  swift_release();
  *uint64_t v26 = v27;
  if (!sub_25D2EBAAC(v25)) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_48_2();
  uint64_t v30 = v29 ? sub_25D53EEB0() : *(void *)(v28 + 16);
  swift_bridgeObjectRelease();
  if (v30 != 1 || !sub_25D2EBAAC(*(void **)(v22 + 192))) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_48_2();
  if (v32)
  {
    if (sub_25D53EEB0()) {
      goto LABEL_8;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (!*(void *)(v31 + 16)) {
    goto LABEL_16;
  }
LABEL_8:
  unsigned __int8 v33 = (void *)(v22 + 96);
  uint64_t v34 = v22 + 136;
  sub_25D1F2400(0, (v27 & 0xC000000000000001) == 0, v27);
  if ((v27 & 0xC000000000000001) != 0) {
    goto LABEL_40;
  }
  for (id i = *(id *)(v27 + 32); ; id i = (id)MEMORY[0x2611AC4C0](0, v27))
  {
    a10 = i;
    uint64_t v36 = *(void *)(v22 + 200);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_227_1((void *)(v36 + 16));
    OUTLINED_FUNCTION_14_0();
    v37();
    __swift_project_boxed_opaque_existential_0(v33, *(void *)(v22 + 120));
    OUTLINED_FUNCTION_233_1();
    sub_25D539640();
    __swift_project_boxed_opaque_existential_0((void *)(v36 + 16), *(void *)(v36 + 40));
    OUTLINED_FUNCTION_237_1();
    OUTLINED_FUNCTION_14_0();
    v38();
    OUTLINED_FUNCTION_1_5((void *)v34);
    char v39 = sub_25D3FFF10();
    __swift_destroy_boxed_opaque_existential_0(v34);
    int v40 = (v39 & 1) != 0 ? 0 : *(unsigned __int8 *)(*(void *)(*(void *)(v22 + 200) + 56) + 224);
    uint64_t v41 = *(void *)(v22 + 176);
    id v42 = sub_25D2F36E4(*(void *)(v22 + 256), 0, v40, 0, a10);

    OUTLINED_FUNCTION_63_4();
    v43();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
    uint64_t v44 = *(int *)(type metadata accessor for SendMessageAskForAudioMessageParameters(0) + 28);
    swift_release();
    *(void *)(v41 + v44) = v42;
LABEL_17:
    uint64_t v45 = *(void **)(v22 + 192);
    uint64_t v46 = *(void *)(v22 + 200);
    uint64_t v47 = *(void *)(v22 + 176);
    type metadata accessor for MessagesGroup(0);
    uint64_t v48 = sub_25D2F311C(v45);
    uint64_t v49 = type metadata accessor for SendMessageAskForAudioMessageParameters(0);
    *(void *)(v22 + 264) = v49;
    uint64_t v50 = *(int *)(v49 + 24);
    swift_release();
    *(void *)(v47 + v50) = v48;
    __swift_project_boxed_opaque_existential_0((void *)(v46 + 16), *(void *)(v46 + 40));
    OUTLINED_FUNCTION_14_0();
    v51();
    uint64_t v52 = (void *)OUTLINED_FUNCTION_85_2();
    LOBYTE(v48) = __swift_project_boxed_opaque_existential_0(v52, v53);
    OUTLINED_FUNCTION_95_0();
    sub_25D539720();
    OUTLINED_FUNCTION_151_2();
    if ((v48 & 1) == 0) {
      break;
    }
    uint64_t v54 = *(void **)(v22 + 192);
    __swift_project_boxed_opaque_existential_0((void *)(v46 + 16), *(void *)(v46 + 40));
    OUTLINED_FUNCTION_231_1();
    OUTLINED_FUNCTION_14_0();
    v55();
    sub_25D3B2DAC(v54, (void *)(v22 + 56));
    unsigned __int8 v33 = v56;
    __swift_destroy_boxed_opaque_existential_0(v22 + 56);
    unint64_t v57 = sub_25D2EBAAC(v54);
    uint64_t v58 = MEMORY[0x263F8EE78];
    if (!v57) {
      goto LABEL_36;
    }
    unint64_t v59 = v57;
    if (v57 >> 62)
    {
      uint64_t v34 = sub_25D53EEB0();
      if (!v34) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v34 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v34) {
        goto LABEL_35;
      }
    }
    a9 = v33;
    a11 = v58;
    uint64_t v27 = (uint64_t)&a11;
    sub_25D1F5B18(0, v34 & ~(v34 >> 63), 0);
    if ((v34 & 0x8000000000000000) == 0)
    {
      uint64_t v60 = a11;
      do
      {
        if ((v59 & 0xC000000000000001) != 0) {
          id v61 = (id)MEMORY[0x2611AC4C0](0, v59);
        }
        else {
          id v61 = *(id *)(v59 + 32);
        }
        uint64_t v62 = v61;
        sub_25D3FDA58(v61);

        a11 = v60;
        unint64_t v64 = *(void *)(v60 + 16);
        unint64_t v63 = *(void *)(v60 + 24);
        if (v64 >= v63 >> 1)
        {
          sub_25D1F5B18(v63 > 1, v64 + 1, 1);
          uint64_t v60 = a11;
        }
        OUTLINED_FUNCTION_213_1();
      }
      while (!v65);
LABEL_35:
      swift_bridgeObjectRelease();
LABEL_36:
      swift_retain();
      swift_task_alloc();
      OUTLINED_FUNCTION_38_0();
      *(void *)(v22 + 272) = v75;
      void *v75 = v76;
      v75[1] = sub_25D518928;
      OUTLINED_FUNCTION_43();
      return sub_25D42DDC8(v77, v78, v79, v80, v81);
    }
    __break(1u);
LABEL_40:
    ;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_43();
  return v67(v66, v67, v68, v69, v70, v71, v72, v73, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25D518928()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D5189F0()
{
  OUTLINED_FUNCTION_31_0();
  sub_25D53D720();
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[22];
  OUTLINED_FUNCTION_8_5();
  v4();
  uint64_t v5 = sub_25D53D0A0();
  OUTLINED_FUNCTION_492(v1, v6, v7, v5);
  sub_25D194EBC(v1, v3 + *(int *)(v2 + 20), (uint64_t *)&unk_26A6719E0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v8();
}

uint64_t sub_25D518B0C()
{
  OUTLINED_FUNCTION_14();
  *(unsigned char *)(v1 + 458) = v2;
  *(void *)(v1 + 168) = v3;
  *(void *)(v1 + 176) = v0;
  *(void *)(v1 + 152) = v4;
  *(void *)(v1 + 160) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A78);
  OUTLINED_FUNCTION_17_0(v6);
  *(void *)(v1 + 184) = OUTLINED_FUNCTION_92();
  uint64_t v7 = sub_25D53D8A0();
  *(void *)(v1 + 192) = v7;
  OUTLINED_FUNCTION_11_0(v7);
  *(void *)(v1 + 200) = v8;
  *(void *)(v1 + 208) = OUTLINED_FUNCTION_92();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A70);
  OUTLINED_FUNCTION_11_0(v9);
  *(void *)(v1 + 216) = v10;
  *(void *)(v1 + 224) = *(void *)(v11 + 64);
  *(void *)(v1 + 232) = OUTLINED_FUNCTION_24_0();
  *(void *)(v1 + 240) = swift_task_alloc();
  uint64_t v12 = sub_25D53A2F0();
  *(void *)(v1 + 248) = v12;
  OUTLINED_FUNCTION_11_0(v12);
  *(void *)(v1 + 256) = v13;
  *(void *)(v1 + 264) = OUTLINED_FUNCTION_92();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v14);
  *(void *)(v1 + 272) = OUTLINED_FUNCTION_92();
  uint64_t v15 = sub_25D53D270();
  OUTLINED_FUNCTION_17_0(v15);
  *(void *)(v1 + 280) = OUTLINED_FUNCTION_92();
  uint64_t v16 = type metadata accessor for SendMessageAskForPayloadParameters(0);
  *(void *)(v1 + 288) = v16;
  OUTLINED_FUNCTION_17_0(v16);
  *(void *)(v1 + 296) = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v17, v18, v19);
}

uint64_t sub_25D518CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_116();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_55();
  a18 = v21;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25D53DC10();
  *(void *)(v21 + 304) = __swift_project_value_buffer(v24, (uint64_t)qword_26A688F10);
  uint64_t v25 = sub_25D53DC00();
  os_log_type_t v26 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_29(v26))
  {
    char v27 = *(unsigned char *)(v21 + 458);
    uint64_t v28 = (_DWORD *)OUTLINED_FUNCTION_26();
    a9 = OUTLINED_FUNCTION_30();
    *uint64_t v28 = 136315138;
    *(unsigned char *)(v21 + 457) = v27;
    uint64_t v29 = sub_25D53E270();
    *(void *)(v21 + 144) = sub_25D19E114(v29, v30, &a9);
    OUTLINED_FUNCTION_82_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_228_1(&dword_25D16D000, v25, v20, "#SendMessageNeedsValueFlowStrategy generating SMART output to prompt for %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  *(void *)(v21 + 312) = v31;
  *uint64_t v31 = v32;
  v31[1] = sub_25D518E54;
  OUTLINED_FUNCTION_79();
  return sub_25D51A37C();
}

uint64_t sub_25D518E54()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *char v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D518F1C()
{
  OUTLINED_FUNCTION_67();
  int v1 = *(unsigned __int8 *)(v0 + 458);
  if (*(unsigned char *)(v0 + 458))
  {
    if (v1 == 3)
    {
      uint64_t v3 = *(void *)(v0 + 288);
      char v2 = *(void **)(v0 + 296);
      type metadata accessor for SendMessageCATsSimple();
      sub_25D53D250();
      *(void *)(v0 + 320) = sub_25D53D0D0();
      *(void *)(v0 + 328) = *(void *)((char *)v2 + *(int *)(v3 + 36));
      *(void *)(v0 + 336) = *(void *)((char *)v2 + *(int *)(v3 + 56));
      *(void *)(v0 + 344) = *v2;
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v4;
      *uint64_t v4 = v0;
      v4[1] = sub_25D51931C;
      OUTLINED_FUNCTION_127();
      return sub_25D4DC404();
    }
    else
    {
      sub_25D53ED20();
      sub_25D53E360();
      *(unsigned char *)(v0 + 456) = v1;
      sub_25D53E270();
      sub_25D53E360();
      swift_bridgeObjectRelease();
      sub_25D194BF4();
      OUTLINED_FUNCTION_58_1();
      *uint64_t v8 = 0;
      v8[1] = 0xE000000000000000;
      swift_willThrow();
      sub_25D51E5D4();
      OUTLINED_FUNCTION_76_11();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_48();
      return v9();
    }
  }
  else
  {
    type metadata accessor for SendMessageCATsSimple();
    sub_25D53D250();
    *(void *)(v0 + 368) = sub_25D53D0D0();
    sub_25D510DCC();
    OUTLINED_FUNCTION_127_6();
    uint64_t v6 = 1;
    switch(v7)
    {
      case 1:
        OUTLINED_FUNCTION_522();
        goto LABEL_12;
      case 2:
        OUTLINED_FUNCTION_159_5();
        goto LABEL_12;
      case 3:
        goto LABEL_13;
      default:
LABEL_12:
        sub_25D53E2C0();
        swift_bridgeObjectRelease();
        uint64_t v6 = 0;
LABEL_13:
        uint64_t v10 = *(void *)(v0 + 272);
        uint64_t v11 = sub_25D53D0A0();
        __swift_storeEnumTagSinglePayload(v10, v6, 1, v11);
        uint64_t v12 = (void *)swift_task_alloc();
        *(void *)(v0 + 376) = v12;
        *uint64_t v12 = v0;
        v12[1] = sub_25D5195B8;
        uint64_t result = sub_25D4DCA28();
        break;
    }
  }
  return result;
}

uint64_t sub_25D51931C()
{
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  v2[12] = v1;
  v2[13] = v4;
  v2[14] = v0;
  OUTLINED_FUNCTION_52_1();
  *uint64_t v5 = *v1;
  *(void *)(v6 + 360) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D51947C()
{
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_50_0();
  uint64_t v1 = v0 + 16;
  uint64_t v3 = *(void **)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  *(void *)(v0 + 392) = *(void *)(v0 + 104);
  __swift_project_boxed_opaque_existential_0((void *)(v2 + 16), *(void *)(v2 + 40));
  OUTLINED_FUNCTION_14_0();
  v4();
  uint64_t v5 = OUTLINED_FUNCTION_254_1();
  OUTLINED_FUNCTION_253_1((uint64_t)v5, v6);
  sub_25D51CD38(v3);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    LOBYTE(v1) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_214_0();
    if (v10 == v1 && v9 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v1) = 1;
    }
    else
    {
      OUTLINED_FUNCTION_88_10();
      OUTLINED_FUNCTION_42_25();
    }
  }
  *(unsigned char *)(v0 + 459) = v1 & 1;
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_145_5(v12);
  void *v13 = v14;
  v13[1] = sub_25D51981C;
  OUTLINED_FUNCTION_41_4();
  return sub_25D2377CC(v15, v16);
}

uint64_t sub_25D5195B8()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  v3[15] = v2;
  v3[16] = v5;
  v3[17] = v0;
  OUTLINED_FUNCTION_52_1();
  *uint64_t v6 = *v2;
  *(void *)(v7 + 384) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52_1();
  sub_25D1D362C(*(void *)(v1 + 272), (uint64_t *)&unk_26A6719E0);
  swift_release();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25D5196E0()
{
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_50_0();
  uint64_t v1 = v0 + 16;
  uint64_t v3 = *(void **)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  *(void *)(v0 + 392) = *(void *)(v0 + 128);
  __swift_project_boxed_opaque_existential_0((void *)(v2 + 16), *(void *)(v2 + 40));
  OUTLINED_FUNCTION_14_0();
  v4();
  uint64_t v5 = OUTLINED_FUNCTION_254_1();
  OUTLINED_FUNCTION_253_1((uint64_t)v5, v6);
  sub_25D51CD38(v3);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    LOBYTE(v1) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_214_0();
    if (v10 == v1 && v9 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v1) = 1;
    }
    else
    {
      OUTLINED_FUNCTION_88_10();
      OUTLINED_FUNCTION_42_25();
    }
  }
  *(unsigned char *)(v0 + 459) = v1 & 1;
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_145_5(v12);
  void *v13 = v14;
  v13[1] = sub_25D51981C;
  OUTLINED_FUNCTION_41_4();
  return sub_25D2377CC(v15, v16);
}

uint64_t sub_25D51981C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D5198E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v15 = *(void *)(v14 + 408);
  uint64_t v16 = *(void *)(v14 + 184);
  uint64_t v17 = *(void **)(v14 + 168);
  char v18 = *(unsigned char *)(v14 + 458);
  uint64_t v19 = sub_25D53D600();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v19);
  uint64_t v20 = OUTLINED_FUNCTION_95_0();
  sub_25D194F04(v20, v21, v22);
  swift_bridgeObjectRetain();
  id v23 = v17;
  sub_25D53D890();
  if (sub_25D51A300(v18))
  {
    char v24 = *(unsigned char *)(v14 + 459);
    uint64_t v26 = *(void *)(v14 + 400);
    uint64_t v25 = *(void *)(v14 + 408);
    uint64_t v27 = *(void *)(v14 + 232);
    uint64_t v28 = *(void *)(v14 + 216);
    uint64_t v29 = *(void **)(v14 + 168);
    sub_25D194F04(*(void *)(v14 + 240), v27, &qword_26A672A70);
    unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    *(void *)(v31 + 24) = v26;
    *(void *)(v31 + 32) = v25;
    *(unsigned char *)(v31 + 40) = v24;
    sub_25D194E74(v27, v31 + v30, &qword_26A672A70);
    id v32 = v29;
    uint64_t v33 = &unk_26A674FC8;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = sub_25D53DC00();
    os_log_type_t v35 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_55_1(v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v36);
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v34, (os_log_type_t)v15, "#SendMessageNeedsValueFlowStrategy not generating snippet for SMART response");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v33 = 0;
    uint64_t v31 = 0;
  }
  *(void *)(v14 + 424) = v33;
  *(void *)(v14 + 432) = v31;
  uint64_t v37 = *(void **)(v14 + 392);
  uint64_t v38 = *(void *)(v14 + 200);
  uint64_t v39 = *(void *)(v14 + 208);
  uint64_t v40 = *(void *)(v14 + 192);
  *(void *)(v14 + 80) = v40;
  *(void *)(v14 + 88) = sub_25D51E624(&qword_26A672A80, MEMORY[0x263F71320]);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v14 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v38 + 16))(boxed_opaque_existential_0, v39, v40);
  uint64_t v53 = (char *)&dword_26A674FB8 + dword_26A674FB8;
  id v42 = v37;
  uint64_t v43 = (void *)swift_task_alloc();
  *(void *)(v14 + 440) = v43;
  *uint64_t v43 = v14;
  v43[1] = sub_25D519B8C;
  OUTLINED_FUNCTION_43();
  return v50(v44, v45, v46, v47, v48, v49, v50, v51, 0, 0, v53, a12, a13, a14);
}

uint64_t sub_25D519B8C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 448) = v0;
  swift_task_dealloc();

  if (!v0) {
    sub_25D1D362C(v3 + 56, qword_26A66F3A0);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D519C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  uint64_t v19 = sub_25D53DC00();
  os_log_type_t v20 = sub_25D53E7B0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_25D16D000, v19, v20, "#SendMessageNeedsValueFlowStrategy returning SMART output", v21, 2u);
    OUTLINED_FUNCTION_3_0();
  }
  uint64_t v22 = v18[53];
  id v23 = (void *)v18[49];
  uint64_t v38 = v18[35];
  uint64_t v39 = v18[34];
  uint64_t v36 = v18[31];
  uint64_t v37 = v18[33];
  uint64_t v35 = v18[30];
  uint64_t v40 = v18[29];
  uint64_t v41 = v18[23];

  sub_25D1EB46C(v22);
  OUTLINED_FUNCTION_63_4();
  v24();
  sub_25D1D362C(v35, &qword_26A672A70);
  OUTLINED_FUNCTION_29_5();
  v25();
  sub_25D51E5D4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_15();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, v35, v36, v37, v38, v39, v40, v41, a16, a17, a18);
}

uint64_t sub_25D519E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_50_0();
  sub_25D51E5D4();
  OUTLINED_FUNCTION_76_11();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_41_4();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25D519EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_50_0();
  sub_25D51E5D4();
  OUTLINED_FUNCTION_76_11();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_41_4();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25D519F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_94();
  uint64_t v15 = *(void *)(v14 + 424);
  uint64_t v28 = *(void *)(v14 + 296);
  uint64_t v16 = *(void *)(v14 + 240);

  sub_25D1EB46C(v15);
  OUTLINED_FUNCTION_63_4();
  v17();
  sub_25D1D362C(v16, &qword_26A672A70);
  OUTLINED_FUNCTION_37_1();
  v18();
  sub_25D51E5D4();
  sub_25D1D362C(v14 + 56, qword_26A66F3A0);
  OUTLINED_FUNCTION_76_11();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_43();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, v28, v14 + 56, a12, a13, a14);
}

uint64_t sub_25D51A0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a6;
  *(unsigned char *)(v6 + 72) = a5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A70);
  *(void *)(v6 + 56) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A78);
  *(void *)(v6 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D51A190, 0, 0);
}

uint64_t sub_25D51A190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  uint64_t v14 = v12[7];
  uint64_t v13 = v12[8];
  uint64_t v15 = v12[6];
  uint64_t v16 = (void *)v12[3];
  uint64_t v17 = (uint64_t *)v12[2];
  uint64_t v18 = sub_25D53D5B0();
  void v17[3] = v18;
  v17[4] = sub_25D51E624((unint64_t *)&qword_26A672A60, MEMORY[0x263F70EF8]);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v17);
  uint64_t v20 = sub_25D53D600();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v20);
  sub_25D194F04(v15, v14, &qword_26A672A70);
  v16;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_75_8();
  sub_25D53D880();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v18 - 8) + 104))(boxed_opaque_existential_0, *MEMORY[0x263F70ED0], v18);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_79();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_25D51A300(char a1)
{
  sub_25D2063D8(a1);
  if (v2 == 0x6E65697069636572 && v1 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else
  {
    char v4 = OUTLINED_FUNCTION_3_22();
    swift_bridgeObjectRelease();
    char v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_25D51A37C()
{
  OUTLINED_FUNCTION_14();
  v1[14] = v2;
  v1[15] = v0;
  v1[12] = v3;
  v1[13] = v4;
  uint64_t v5 = sub_25D53D0A0();
  v1[16] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[17] = v6;
  v1[18] = OUTLINED_FUNCTION_92();
  uint64_t v7 = sub_25D538990();
  v1[19] = v7;
  OUTLINED_FUNCTION_11_0(v7);
  v1[20] = v8;
  v1[21] = OUTLINED_FUNCTION_92();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v9);
  v1[22] = OUTLINED_FUNCTION_24_0();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  uint64_t v10 = sub_25D538820();
  v1[32] = v10;
  OUTLINED_FUNCTION_11_0(v10);
  v1[33] = v11;
  v1[34] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25D51A4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_40();
  a20 = v23;
  a21 = v24;
  OUTLINED_FUNCTION_94();
  a19 = v22;
  BOOL v25 = sub_25D237034();
  *(unsigned char *)(v22 + 296) = v25;
  if (v25) {
    sub_25D2373BC();
  }
  *(void *)(v22 + 280) = *(void *)(*(void *)(v22 + 120) + 56);
  switch(sub_25D510DCC())
  {
    case 1u:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 2u:
      OUTLINED_FUNCTION_159_5();
      goto LABEL_6;
    case 3u:
      goto LABEL_8;
    default:
LABEL_6:
      OUTLINED_FUNCTION_190_3();
      OUTLINED_FUNCTION_42_25();
      if (v21)
      {
LABEL_7:
        uint64_t v26 = *(void *)(v22 + 272);
        a9 = xmmword_25D542AB0;
        a10 = 4;
        sub_25D538810();
        sub_25D1DEFFC((uint64_t)&a9, v26);
        uint64_t v27 = OUTLINED_FUNCTION_127();
        v28(v27);
      }
LABEL_8:
      uint64_t v29 = *(void *)(v22 + 240);
      uint64_t v31 = *(void *)(v22 + 224);
      uint64_t v30 = *(void *)(v22 + 232);
      uint64_t v33 = *(void *)(v22 + 208);
      uint64_t v32 = *(void *)(v22 + 216);
      uint64_t v35 = *(void *)(v22 + 192);
      uint64_t v34 = *(void *)(v22 + 200);
      uint64_t v36 = *(void *)(v22 + 184);
      OUTLINED_FUNCTION_56_27(*(void *)(v22 + 248));
      OUTLINED_FUNCTION_56_27(v29);
      OUTLINED_FUNCTION_56_27(v30);
      OUTLINED_FUNCTION_56_27(v31);
      OUTLINED_FUNCTION_56_27(v32);
      OUTLINED_FUNCTION_56_27(v33);
      OUTLINED_FUNCTION_56_27(v34);
      OUTLINED_FUNCTION_56_27(v35);
      OUTLINED_FUNCTION_56_27(v36);
      uint64_t v37 = (void *)swift_task_alloc();
      *(void *)(v22 + 288) = v37;
      void *v37 = v22;
      v37[1] = sub_25D51A6D8;
      OUTLINED_FUNCTION_43();
      return sub_25D51B2A4();
  }
}

uint64_t sub_25D51A6D8()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 297) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25D51A7A8()
{
  uint64_t v86 = v0;
  char v69 = *(unsigned char *)(v0 + 297);
  char v66 = *(unsigned char *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v58 = *(void *)(v0 + 208);
  uint64_t v60 = *(void *)(v0 + 200);
  uint64_t v62 = *(void *)(v0 + 192);
  uint64_t v64 = *(void *)(v0 + 184);
  uint64_t v72 = *(void **)(v0 + 112);
  uint64_t v6 = *(void **)(v0 + 96);
  uint64_t v7 = (int *)type metadata accessor for SendMessageAskForPayloadParameters(0);
  uint64_t v75 = (uint64_t)v6 + v7[20];
  OUTLINED_FUNCTION_56_27(v75);
  *uint64_t v6 = 0;
  sub_25D194E74(v1, (uint64_t)v6 + v7[5], (uint64_t *)&unk_26A6719E0);
  sub_25D194E74(v2, (uint64_t)v6 + v7[6], (uint64_t *)&unk_26A6719E0);
  sub_25D194E74(v3, (uint64_t)v6 + v7[7], (uint64_t *)&unk_26A6719E0);
  sub_25D194E74(v4, (uint64_t)v6 + v7[8], (uint64_t *)&unk_26A6719E0);
  uint64_t v8 = v7[9];
  *(void *)((char *)v6 + v8) = 0;
  uint64_t v9 = (char *)v6 + v7[10];
  *(void *)uint64_t v9 = 0;
  uint64_t v77 = (uint64_t)v9;
  v9[8] = 1;
  sub_25D194E74(v5, (uint64_t)v6 + v7[11], (uint64_t *)&unk_26A6719E0);
  sub_25D194E74(v58, (uint64_t)v6 + v7[12], (uint64_t *)&unk_26A6719E0);
  sub_25D194E74(v60, (uint64_t)v6 + v7[13], (uint64_t *)&unk_26A6719E0);
  uint64_t v10 = v7[14];
  *(void *)((char *)v6 + v10) = 0;
  sub_25D194E74(v62, (uint64_t)v6 + v7[15], (uint64_t *)&unk_26A6719E0);
  uint64_t v11 = (uint64_t)v6 + v7[16];
  sub_25D194E74(v64, v11, (uint64_t *)&unk_26A6719E0);
  uint64_t v12 = (char *)v6 + v7[17];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  *((unsigned char *)v6 + v7[18]) = v66;
  *((unsigned char *)v6 + v7[19]) = v69;
  sub_25D1D362C(v11, (uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_56_27(v11);
  *(void *)uint64_t v12 = 0;
  v12[8] = 0;
  type metadata accessor for MessagesGroup(0);
  id v13 = v72;
  uint64_t v14 = sub_25D2F311C(v13);
  swift_release();
  *(void *)((char *)v6 + v8) = v14;
  if (!sub_25D2EBAAC(v13)) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_48_2();
  uint64_t v17 = v16 ? sub_25D53EEB0() : *(void *)(v15 + 16);
  swift_bridgeObjectRelease();
  if (v17 != 1 || !sub_25D2EBAAC(*(void **)(v0 + 112))) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_48_2();
  if (v19)
  {
    if (sub_25D53EEB0()) {
      goto LABEL_8;
    }
  }
  else if (*(void *)(v18 + 16))
  {
LABEL_8:
    uint64_t v70 = (void *)(v0 + 56);
    uint64_t v73 = (void *)(v0 + 16);
    sub_25D1F2400(0, (v14 & 0xC000000000000001) == 0, v14);
    if ((v14 & 0xC000000000000001) != 0) {
      id v20 = (id)MEMORY[0x2611AC4C0](0, v14);
    }
    else {
      id v20 = *(id *)(v14 + 32);
    }
    uint64_t v67 = v20;
    uint64_t v21 = *(void *)(v0 + 120);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_0((void *)(v21 + 16), *(void *)(v21 + 40));
    OUTLINED_FUNCTION_237_1();
    OUTLINED_FUNCTION_14_0();
    v22();
    __swift_project_boxed_opaque_existential_0(v73, *(void *)(v0 + 40));
    sub_25D539640();
    __swift_project_boxed_opaque_existential_0((void *)(v21 + 16), *(void *)(v21 + 40));
    OUTLINED_FUNCTION_14_0();
    v23();
    OUTLINED_FUNCTION_1_5(v70);
    char v24 = sub_25D3FFF10();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
    if (v24) {
      int v25 = 0;
    }
    else {
      int v25 = *(unsigned __int8 *)(*(void *)(v0 + 280) + 224);
    }
    id v26 = sub_25D2F36E4(*(void *)(v0 + 168), 0, v25, 0, v67);

    uint64_t v27 = OUTLINED_FUNCTION_23_12();
    v28(v27);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v73);
    swift_release();
    *(void *)((char *)v6 + v10) = v26;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  sub_25D510DCC();
  OUTLINED_FUNCTION_127_6();
  uint64_t v29 = 1;
  switch(v30)
  {
    case 1:
      OUTLINED_FUNCTION_522();
      goto LABEL_20;
    case 2:
      OUTLINED_FUNCTION_159_5();
      goto LABEL_20;
    case 3:
      goto LABEL_21;
    default:
LABEL_20:
      sub_25D53E2C0();
      swift_bridgeObjectRelease();
      uint64_t v29 = 0;
LABEL_21:
      uint64_t v31 = *(void *)(v0 + 176);
      uint64_t v32 = *(void *)(v0 + 128);
      __swift_storeEnumTagSinglePayload(v31, v29, 1, v32);
      sub_25D194EBC(v31, v75, (uint64_t *)&unk_26A6719E0);
      if (__swift_getEnumTagSinglePayload(v75, 1, v32)) {
        goto LABEL_35;
      }
      uint64_t v33 = *(void *)(v0 + 144);
      OUTLINED_FUNCTION_59_1();
      v34();
      uint64_t v35 = sub_25D53D080();
      uint64_t v37 = v36;
      OUTLINED_FUNCTION_85_2();
      OUTLINED_FUNCTION_19_5();
      v38();
      if (v35 == 0x796669646F6DLL && v37 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_190_3();
        OUTLINED_FUNCTION_42_25();
        if ((v33 & 1) == 0) {
          goto LABEL_35;
        }
      }
      if (!*(void *)(*(void *)(v0 + 280) + 56))
      {
        if (qword_26A66E778 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_25D53DC10();
        uint64_t v41 = OUTLINED_FUNCTION_84_0(v40, (uint64_t)qword_26A688F10);
        os_log_type_t v42 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_29(v42))
        {
          uint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_20_0();
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl(&dword_25D16D000, v41, (os_log_type_t)v35, "#SendMessageNeedsValueFlowStrategy previous content was nil, don't treat as modifying content", v43, 2u);
          OUTLINED_FUNCTION_3_0();
        }
        uint64_t v44 = *(void *)(v0 + 128);

        sub_25D1D362C(v75, (uint64_t *)&unk_26A6719E0);
        __swift_storeEnumTagSinglePayload(v75, 1, 1, v44);
      }
LABEL_35:
      uint64_t v59 = *(void *)(v0 + 216);
      uint64_t v61 = *(void *)(v0 + 208);
      uint64_t v63 = *(void *)(v0 + 200);
      uint64_t v65 = *(void *)(v0 + 192);
      uint64_t v68 = *(void *)(v0 + 184);
      uint64_t v71 = *(void *)(v0 + 176);
      uint64_t v74 = *(void *)(v0 + 168);
      uint64_t v76 = *(void *)(v0 + 144);
      uint64_t v45 = *(uint64_t **)(v0 + 96);
      sub_25D53D040();
      swift_retain();
      uint64_t v46 = sub_25D4C0694();
      swift_release();
      *uint64_t v45 = v46;
      LOBYTE(v80) = 4;
      sub_25D1E1208((uint64_t)&v79, v47, v48, v49, v50, v51, v52, v53, v57, v59, v61, v63, v65, v68, v71, v74, v76, v77, 2,
        0,
        v80,
        v81,
        v82,
        v83,
        v84,
        v85);
      *(double *)uint64_t v78 = (double)v54;
      *(unsigned char *)(v78 + 8) = 0;
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
      OUTLINED_FUNCTION_48();
      return v55();
  }
}

uint64_t sub_25D51AEB0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  uint64_t v2 = OUTLINED_FUNCTION_17_0(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_19_0();
  uint64_t v3 = sub_25D5397D0();
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_36();
  sub_25D539780();
  sub_25D53A1F0();
  sub_25D53A240();
  sub_25D53A2A0();
  sub_25D51B694();
  sub_25D53A260();
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_14_0();
  v5();
  OUTLINED_FUNCTION_1_5(v7);
  sub_25D17ACD0();
  sub_25D53A2E0();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

uint64_t sub_25D51B014(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 56) = a4;
  *(void *)(v5 + 24) = a1;
  *(void *)(v5 + 32) = v4;
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D51B03C()
{
  OUTLINED_FUNCTION_55();
  uint64_t v19 = v1;
  int v2 = *(unsigned __int8 *)(v1 + 56);
  if (v2 == 2)
  {
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v1 + 48) = v7;
    *uint64_t v7 = v8;
    v7[1] = sub_25D1CDAA0;
    OUTLINED_FUNCTION_18_13();
    return sub_25D47F5A4();
  }
  else
  {
    if (v2 != 1)
    {
      if (qword_26A66E778 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_25D53DC10();
      uint64_t v11 = OUTLINED_FUNCTION_84_0(v10, (uint64_t)qword_26A688F10);
      os_log_type_t v12 = sub_25D53E7C0();
      if (OUTLINED_FUNCTION_29(v12))
      {
        OUTLINED_FUNCTION_26();
        uint64_t v18 = OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_249_0(4.8149e-34);
        *(void *)(v1 + 16) = sub_25D19E114(v13, v14, &v18);
        OUTLINED_FUNCTION_82_3();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_228_1(&dword_25D16D000, v11, v0, "#SendMessageNeedsValueFlowStrategy unsupported parameter: %s");
        OUTLINED_FUNCTION_36_7();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }

      sub_25D284950();
      OUTLINED_FUNCTION_58_1();
      *uint64_t v15 = 2;
      swift_willThrow();
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_18_13();
      __asm { BRAA            X1, X16 }
    }
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v1 + 40) = v3;
    *uint64_t v3 = v4;
    v3[1] = sub_25D1CE6DC;
    OUTLINED_FUNCTION_18_13();
    return sub_25D47F64C();
  }
}

uint64_t sub_25D51B2A4()
{
  OUTLINED_FUNCTION_14();
  v1[8] = v0;
  uint64_t v2 = sub_25D538820();
  v1[9] = v2;
  OUTLINED_FUNCTION_11_0(v2);
  v1[10] = v3;
  v1[11] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25D51B4E0: call analysis failed (funcsize=200)"

void sub_25D51B694()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v3 = v2;
  uint64_t v94 = v4;
  *(void *)&long long v91 = sub_25D53AD60();
  OUTLINED_FUNCTION_0_3();
  uint64_t v95 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_27_27();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v80 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v88 = (char *)v80 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v80 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v80 - v16;
  uint64_t v18 = sub_25D539C30();
  OUTLINED_FUNCTION_0_3();
  uint64_t v93 = v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_229_1();
  OUTLINED_FUNCTION_14_0();
  v23();
  sub_25D539C20();
  __swift_project_boxed_opaque_existential_0(v97, v98);
  sub_25D539670();
  int v92 = v22;
  sub_25D539C00();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v97);
  LODWORD(v89) = v3;
  if (v3 < 2u)
  {
    uint64_t v90 = v18;
    sub_25D53BB20();
    OUTLINED_FUNCTION_91();
    sub_25D53BB10();
    OUTLINED_FUNCTION_64_1();
    sub_25D53B910();
    OUTLINED_FUNCTION_91();
    uint64_t v86 = sub_25D53B900();
    sub_25D53BAD0();
    sub_25D53BCE0();
    OUTLINED_FUNCTION_91();
    uint64_t v24 = sub_25D53BCD0();
    uint64_t v87 = v3;
    sub_25D53BAB0();
    uint64_t v85 = v24;
    sub_25D413824();
    int v25 = v10;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25D53DC10();
    __swift_project_value_buffer(v26, (uint64_t)qword_26A688F10);
    uint64_t v27 = *(void (**)(void))(v95 + 16);
    uint64_t v28 = v91;
    OUTLINED_FUNCTION_105_0();
    v27();
    uint64_t v29 = sub_25D53DC00();
    os_log_type_t v30 = sub_25D53E7B0();
    if (OUTLINED_FUNCTION_51_10(v30))
    {
      uint64_t v31 = OUTLINED_FUNCTION_26();
      LODWORD(v82) = v3;
      uint64_t v32 = (uint8_t *)v31;
      os_log_t v83 = (os_log_t)OUTLINED_FUNCTION_30();
      os_log_t v96 = v83;
      uint64_t v81 = v32;
      *(_DWORD *)uint64_t v32 = 136315138;
      v80[0] = v32 + 4;
      v80[1] = v1;
      OUTLINED_FUNCTION_105_0();
      v27();
      sub_25D53ADE0();
      uint64_t v98 = v28;
      uint64_t v99 = sub_25D51E624((unint64_t *)&qword_26A66F308, MEMORY[0x263F71688]);
      __swift_allocate_boxed_opaque_existential_0(v97);
      OUTLINED_FUNCTION_105_0();
      v27();
      uint64_t v33 = sub_25D53ADD0();
      unint64_t v35 = v34;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v97);
      uint64_t v84 = (uint64_t)v25;
      uint64_t v36 = *(void (**)(void))(v95 + 8);
      OUTLINED_FUNCTION_36_1();
      v36();
      uint64_t v37 = sub_25D19E114(v33, v35, (uint64_t *)&v96);
      OUTLINED_FUNCTION_74_6(v37);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36_1();
      v36();
      uint64_t v38 = v36;
      OUTLINED_FUNCTION_228_1(&dword_25D16D000, v29, (os_log_type_t)v82, "#makeNeedsValueContextFor submitting NLv4 dialog act: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      uint64_t v38 = *(void (**)(void))(v95 + 8);
      ((void (*)(uint64_t, uint64_t))v38)(v1, v28);
    }

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A20);
    OUTLINED_FUNCTION_226_0();
    uint64_t v59 = swift_allocObject();
    long long v91 = xmmword_25D541230;
    *(_OWORD *)(v59 + 16) = xmmword_25D541230;
    OUTLINED_FUNCTION_105_0();
    v27();
    uint64_t v60 = v92;
    sub_25D539B60();
    if (qword_26A66E860 != -1) {
      swift_once();
    }
    swift_retain();
    sub_25D2197E4();
    OUTLINED_FUNCTION_113_5();
    sub_25D539BB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F600);
    uint64_t v61 = OUTLINED_FUNCTION_43_15();
    *(void *)(v59 + 32) = OUTLINED_FUNCTION_251_0(v61);
    *(void *)(v59 + 40) = v62;
    sub_25D539B80();
    uint64_t v63 = OUTLINED_FUNCTION_43_15();
    *(void *)(v59 + 32) = OUTLINED_FUNCTION_251_0(v63);
    *(void *)(v59 + 40) = v64;
    sub_25D539BE0();
    sub_25D53A1A0();
    OUTLINED_FUNCTION_91();
    uint64_t v65 = sub_25D53A190();
    uint64_t v18 = v90;
    if (qword_26A66E7C0 != -1) {
      swift_once();
    }
    sub_25D53AFB0();
    uint64_t v67 = v66;
    sub_25D53A160();
    swift_release();
    swift_bridgeObjectRelease();
    sub_25D53A180();
    OUTLINED_FUNCTION_113_5();
    sub_25D539C10();
    if ((_BYTE)v89)
    {
      uint64_t v68 = OUTLINED_FUNCTION_43_15();
      *(_OWORD *)(v68 + 16) = v91;
      if (qword_26A66E790 != -1) {
        swift_once();
      }
      swift_retain();
      sub_25D219810();
      OUTLINED_FUNCTION_113_5();
      *(void *)(v68 + 32) = v65;
      *(void *)(v68 + 40) = v67;
    }
    else
    {
      uint64_t v71 = swift_allocObject();
      *(_OWORD *)(v71 + 16) = xmmword_25D541D20;
      if (qword_26A66E7F8 != -1) {
        swift_once();
      }
      swift_retain();
      sub_25D21996C();
      OUTLINED_FUNCTION_113_5();
      *(void *)(v71 + 32) = v65;
      *(void *)(v71 + 40) = v67;
      if (qword_26A66E7D0 != -1) {
        swift_once();
      }
      swift_retain();
      sub_25D219AA4();
      OUTLINED_FUNCTION_113_5();
      *(void *)(v71 + 48) = v65;
      *(void *)(v71 + 56) = v67;
      if (qword_26A66E7E8 != -1) {
        swift_once();
      }
      swift_retain();
      sub_25D219810();
      OUTLINED_FUNCTION_113_5();
      *(void *)(v71 + 64) = v65;
      *(void *)(v71 + 72) = v67;
    }
    sub_25D539BF0();
    swift_release();
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_8_5();
    v38();
LABEL_35:
    (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v94, v60, v18);
    uint64_t v70 = 0;
    goto LABEL_36;
  }
  if (v3 == 3)
  {
    uint64_t v90 = v18;
    sub_25D53BB20();
    OUTLINED_FUNCTION_91();
    uint64_t v39 = sub_25D53BB10();
    sub_25D53BAE0();
    sub_25D53BCE0();
    OUTLINED_FUNCTION_91();
    uint64_t v40 = sub_25D53BCD0();
    sub_25D53BAB0();
    uint64_t v41 = v17;
    sub_25D413824();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_25D53DC10();
    __swift_project_value_buffer(v42, (uint64_t)qword_26A688F10);
    uint64_t v43 = *(void (**)(void))(v95 + 16);
    uint64_t v44 = v91;
    OUTLINED_FUNCTION_105_0();
    v43();
    uint64_t v45 = sub_25D53DC00();
    os_log_type_t v46 = sub_25D53E7B0();
    int v47 = v46;
    if (os_log_type_enabled(v45, v46))
    {
      LODWORD(v85) = v47;
      uint64_t v48 = OUTLINED_FUNCTION_26();
      os_log_t v83 = v45;
      uint64_t v49 = (uint8_t *)v48;
      uint64_t v84 = OUTLINED_FUNCTION_30();
      os_log_t v96 = (os_log_t)v84;
      uint64_t v87 = v40;
      uint64_t v82 = v49;
      *(_DWORD *)uint64_t v49 = 136315138;
      uint64_t v81 = v49 + 4;
      uint64_t v50 = v88;
      OUTLINED_FUNCTION_105_0();
      v43();
      sub_25D53ADE0();
      uint64_t v98 = v44;
      uint64_t v99 = sub_25D51E624((unint64_t *)&qword_26A66F308, MEMORY[0x263F71688]);
      __swift_allocate_boxed_opaque_existential_0(v97);
      OUTLINED_FUNCTION_105_0();
      v43();
      uint64_t v51 = sub_25D53ADD0();
      unint64_t v53 = v52;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v97);
      *(void *)&long long v89 = v41;
      uint64_t v86 = v39;
      uint64_t v54 = *(void (**)(char *, uint64_t))(v95 + 8);
      uint64_t v55 = v50;
      uint64_t v56 = v43;
      v54(v55, v44);
      uint64_t v57 = sub_25D19E114(v51, v53, (uint64_t *)&v96);
      OUTLINED_FUNCTION_74_6(v57);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      uint64_t v88 = (char *)v54;
      v54(v15, v44);
      uint64_t v41 = (char *)v89;
      os_log_t v58 = v83;
      _os_log_impl(&dword_25D16D000, v83, (os_log_type_t)v85, "#makeNeedsValueContextFor submitting NLv4 dialog act: %s", v82, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      uint64_t v88 = *(char **)(v95 + 8);
      OUTLINED_FUNCTION_8_5();
      v72();

      uint64_t v56 = v43;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A20);
    OUTLINED_FUNCTION_226_0();
    uint64_t v73 = swift_allocObject();
    long long v89 = xmmword_25D541230;
    *(_OWORD *)(v73 + 16) = xmmword_25D541230;
    OUTLINED_FUNCTION_105_0();
    v56();
    uint64_t v60 = v92;
    sub_25D539B60();
    if (qword_26A66E860 != -1) {
      swift_once();
    }
    swift_retain();
    sub_25D2197E4();
    swift_release();
    sub_25D539BC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F600);
    uint64_t v74 = OUTLINED_FUNCTION_43_15();
    *(_OWORD *)(v74 + 16) = v89;
    *(void *)(v74 + 32) = sub_25D219AF4(2);
    *(void *)(v74 + 40) = v75;
    sub_25D539B90();
    uint64_t v76 = OUTLINED_FUNCTION_43_15();
    *(_OWORD *)(v76 + 16) = v89;
    uint64_t v18 = v90;
    if (qword_26A66E7A8 != -1) {
      swift_once();
    }
    swift_retain();
    uint64_t v77 = sub_25D219810();
    uint64_t v79 = v78;
    swift_release();
    *(void *)(v76 + 32) = v77;
    *(void *)(v76 + 40) = v79;
    sub_25D539BA0();
    swift_release();
    swift_release();
    ((void (*)(char *, uint64_t))v88)(v41, v44);
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_65();
  v69();
  uint64_t v70 = 1;
LABEL_36:
  __swift_storeEnumTagSinglePayload(v94, v70, 1, v18);
  OUTLINED_FUNCTION_36_0();
}

void sub_25D51C324()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v28 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FAC0);
  uint64_t v4 = OUTLINED_FUNCTION_17_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_39_40();
  uint64_t v5 = sub_25D53A650();
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_27_27();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - v10;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25D53DC10();
  os_log_type_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26A688F10);
  uint64_t v14 = sub_25D53DC00();
  os_log_type_t v15 = sub_25D53E7B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_25D16D000, v14, v15, "#SendMessageNeedsValueFlowStrategy we are prompting for content with corrections during payload support, checking for corrections parse", v16, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  sub_25D1C8438(v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v5) == 1)
  {
    sub_25D1D362C(v0, &qword_26A66FAC0);
    uint64_t v17 = sub_25D53DC00();
    os_log_type_t v18 = sub_25D53E7B0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_96_0(v19);
      OUTLINED_FUNCTION_83_1(&dword_25D16D000, v17, v18, "#SendMessageNeedsValueFlowStrategy input.ruleBasedParse is missing, must use input.parse");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D53A5D0();
    goto LABEL_20;
  }
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 32);
  v20(v11, v0, v5);
  sub_25D53A5D0();
  sub_25D492A08();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v21(v1, v5);
  if (!v29[3])
  {
    sub_25D1D362C((uint64_t)v29, &qword_26A672C20);
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F570);
  type metadata accessor for SmsNLv4Intent();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    v20(v28, (uint64_t)v11, v5);
    goto LABEL_20;
  }
  if ((sub_25D3DFBB0() & 1) == 0
    || (sub_25D3DFF98() & 1) == 0
    || (uint64_t v22 = sub_25D3E41BC(),
        HIDWORD(v27) = sub_25D3FBD70(v22, v23),
        swift_bridgeObjectRelease(),
        (v27 & 0x100000000) == 0))
  {
    swift_release();
    goto LABEL_19;
  }
  uint64_t v24 = sub_25D53DC00();
  os_log_type_t v25 = sub_25D53E7B0();
  if (OUTLINED_FUNCTION_61_1(v25))
  {
    uint64_t v26 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_25D16D000, v24, v13, "#SendMessageNeedsValueFlowStrategy top parse represents contact correction, use it", v26, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  sub_25D53A5D0();
  swift_release();
  v21((uint64_t)v11, v5);
LABEL_20:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D51C6B0()
{
  return type metadata accessor for SendMessageNeedsValueFlowStrategy();
}

uint64_t type metadata accessor for SendMessageNeedsValueFlowStrategy()
{
  uint64_t result = qword_26A674F48;
  if (!qword_26A674F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D51C700()
{
  return sub_25D51E624(qword_26A674F90, (void (*)(uint64_t))type metadata accessor for SendMessageNeedsValueFlowStrategy);
}

void sub_25D51C748()
{
}

uint64_t sub_25D51C76C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D179DEC;
  return sub_25D511DDC();
}

uint64_t sub_25D51C820()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25D1799C8;
  return sub_25D51408C();
}

uint64_t sub_25D51C8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SendMessageNeedsValueFlowStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25D179DEC;
  return MEMORY[0x270F66308](a1, a2, v9, a4);
}

uint64_t sub_25D51C994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SendMessageNeedsValueFlowStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25D179DEC;
  return MEMORY[0x270F66310](a1, a2, v9, a4);
}

uint64_t sub_25D51CA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_14_8();
}

uint64_t sub_25D51CA98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_25D51CAE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_14_8();
}

uint64_t sub_25D51CB18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_25D51D13C(a1, a2, a3, &v33);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25D51D368();
  if (v8)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    while (1)
    {
      os_log_type_t v13 = (void *)*a5;
      unint64_t v15 = sub_25D222ED4();
      uint64_t v16 = v13[2];
      BOOL v17 = (v14 & 1) == 0;
      uint64_t v18 = v16 + v17;
      if (__OFADD__(v16, v17)) {
        break;
      }
      char v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6711C8);
          sub_25D53EE50();
        }
      }
      else
      {
        sub_25D4FED54(v18, a4 & 1);
        unint64_t v20 = sub_25D222ED4();
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v15 = v20;
      }
      uint64_t v22 = (void *)*a5;
      if (v19)
      {
        uint64_t v23 = *(void *)(v22[7] + 8 * v15);
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_25D50FD4C(v12, v23);
        swift_bridgeObjectRelease();
        uint64_t v25 = v22[7];
        swift_bridgeObjectRelease();
        *(void *)(v25 + 8 * v15) = v24;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        uint64_t v26 = (uint64_t *)(v22[6] + 16 * v15);
        *uint64_t v26 = v10;
        v26[1] = v11;
        *(void *)(v22[7] + 8 * v15) = v12;
        uint64_t v27 = v22[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_16;
        }
        v22[2] = v29;
      }
      uint64_t v10 = sub_25D51D368();
      uint64_t v11 = v30;
      uint64_t v12 = v31;
      a4 = 1;
      if (!v30) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_25D53F110();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_25D1B4B1C();
    return swift_release();
  }
  return result;
}

uint64_t sub_25D51CD38(void *a1)
{
  id v1 = objc_msgSend(a1, sel_content);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_25D53E200();
  }
  return OUTLINED_FUNCTION_48_5();
}

uint64_t sub_25D51CD98(id *a1)
{
  id v1 = *a1;
  return sub_25D51CDC4(v1);
}

uint64_t sub_25D51CDC4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_visual);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D538740();

  return v3;
}

uint64_t sub_25D51CE34(void *a1)
{
  id v1 = objc_msgSend(a1, sel_visual);
  if (v1)
  {
    id v2 = v1;
    sub_25D538740();
  }
  return OUTLINED_FUNCTION_48_5();
}

uint64_t sub_25D51CE94()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A672A70);
  OUTLINED_FUNCTION_11_0(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 41) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);

  swift_bridgeObjectRelease();
  uint64_t v7 = sub_25D53D6B0();
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v7))
  {
    uint64_t v8 = OUTLINED_FUNCTION_127();
    v9(v8);
  }
  return MEMORY[0x270FA0238](v0, v4 + v6, v3 | 7);
}

uint64_t sub_25D51CF70()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A672A70) - 8);
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void *)(v0 + 32);
  char v8 = *(unsigned char *)(v0 + 40);
  uint64_t v9 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v11;
  v10[1] = sub_25D1799C8;
  return sub_25D51A0C0(v3, v5, v6, v7, v8, v9);
}

uint64_t sub_25D51D070()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_25D1799C8;
  return sub_25D516D90(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25D51D13C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_25D51D178@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_25D174EE4(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  char v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_25D194E74((uint64_t)&v23, (uint64_t)v22, &qword_26A675020);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_25D1D362C((uint64_t)v21, &qword_26A674E30);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_25D51D368()
{
  void (*v9)(uint64_t *__return_ptr, void *);
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void v21[3];

  if (v0[4])
  {
    OUTLINED_FUNCTION_201_1();
LABEL_3:
    int64_t v5 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v2);
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    uint64_t v8 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    v0[3] = v4;
    v0[4] = v3;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v21[0] = v6;
    v21[1] = v7;
    v21[2] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9(&v20, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v20;
  }
  if (!__OFADD__(v0[3], 1))
  {
    OUTLINED_FUNCTION_238_1();
    if (v14 == v15) {
      return OUTLINED_FUNCTION_260_1();
    }
    unint64_t v16 = v0[1];
    if (!*(void *)(v16 + 8 * v11))
    {
      if (v11 + 1 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 1))) {
        goto LABEL_8;
      }
      if (v11 + 2 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 2))) {
        goto LABEL_8;
      }
      if (v11 + 3 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 3))) {
        goto LABEL_8;
      }
      int64_t v17 = v11 + 4;
      if (v17 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (!*(void *)(v16 + 8 * v17))
      {
        int64_t v18 = v12 + 6;
        while (v18 < v13)
        {
          if (*(void *)(v16 + 8 * v18++)) {
            goto LABEL_8;
          }
        }
        return OUTLINED_FUNCTION_260_1();
      }
    }
LABEL_8:
    OUTLINED_FUNCTION_178_3();
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D51D4C4()
{
  void (*v9)(uint64_t *__return_ptr, void *);
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void v21[3];

  if (v0[4])
  {
    OUTLINED_FUNCTION_201_1();
LABEL_3:
    int64_t v5 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v2);
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    uint64_t v8 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    v0[3] = v4;
    v0[4] = v3;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v21[0] = v6;
    v21[1] = v7;
    v21[2] = v8;
    swift_bridgeObjectRetain();
    v9(&v20, v21);
    swift_bridgeObjectRelease();
    return v20;
  }
  if (!__OFADD__(v0[3], 1))
  {
    OUTLINED_FUNCTION_238_1();
    if (v14 == v15) {
      return OUTLINED_FUNCTION_260_1();
    }
    unint64_t v16 = v0[1];
    if (!*(void *)(v16 + 8 * v11))
    {
      if (v11 + 1 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 1))) {
        goto LABEL_8;
      }
      if (v11 + 2 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 2))) {
        goto LABEL_8;
      }
      if (v11 + 3 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (*(void *)(v16 + 8 * (v11 + 3))) {
        goto LABEL_8;
      }
      int64_t v17 = v11 + 4;
      if (v17 >= v13) {
        return OUTLINED_FUNCTION_260_1();
      }
      if (!*(void *)(v16 + 8 * v17))
      {
        int64_t v18 = v12 + 6;
        while (v18 < v13)
        {
          if (*(void *)(v16 + 8 * v18++)) {
            goto LABEL_8;
          }
        }
        return OUTLINED_FUNCTION_260_1();
      }
    }
LABEL_8:
    OUTLINED_FUNCTION_178_3();
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

size_t sub_25D51D610(size_t result)
{
  int64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)v1;
  int64_t v5 = v3 >> 1;
  if ((v3 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  *(void *)uint64_t v1 = v4;
  if ((result & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(v1 + 16);
  int64_t v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v8 = *(void *)(v1 + 8);
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 8 * v6 + 8 * v7 != v9 + 8 * v10 + 32)
  {
    uint64_t result = swift_release();
    goto LABEL_23;
  }
  unint64_t v17 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v18 = (v17 >> 1) - v10;
  BOOL v19 = __OFADD__(v7, v18);
  v7 += v18;
  if (!v19)
  {
LABEL_23:
    if (v7 >= v2) {
      goto LABEL_21;
    }
LABEL_8:
    uint64_t v11 = *(void *)(v1 + 16);
    int64_t v12 = v5 - v11;
    if (__OFSUB__(v5, v11))
    {
      __break(1u);
    }
    else
    {
      uint64_t v13 = *(void *)(v1 + 8);
      if (v12 <= v2) {
        int64_t v14 = v2;
      }
      else {
        int64_t v14 = v5 - v11;
      }
      if (v14)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
        uint64_t v4 = (void *)swift_allocObject();
        uint64_t result = _swift_stdlib_malloc_size(v4);
        v4[2] = v12;
        v4[3] = (2 * ((uint64_t)(result - 32) / 8)) | 1;
      }
      else
      {
        uint64_t v4 = (void *)MEMORY[0x263F8EE78];
      }
      if (v5 >= v11)
      {
        uint64_t result = sub_25D1F525C(v13 + 8 * v11, v5 - v11);
        if (!__OFSUB__(0, v11))
        {
          uint64_t v15 = v4[2];
          uint64_t v16 = v11 + v15;
          if (!__OFADD__(v11, v15))
          {
            if (v16 >= v11)
            {
              uint64_t result = swift_unknownObjectRelease();
              if ((v16 & 0x8000000000000000) == 0)
              {
                *(void *)(v1 + 8) = &v4[-v11 + 4];
                *(void *)(v1 + 16) = v11;
                *(void *)(v1 + 24) = (2 * v16) | 1;
LABEL_21:
                *(void *)uint64_t v1 = v4;
                return result;
              }
              goto LABEL_30;
            }
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    __break(1u);
    goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_25D51D7D8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = result;
  uint64_t result = (void *)sub_25D51DC54((a4 >> 1) - a3);
  uint64_t v11 = v4[2];
  unint64_t v10 = v4[3];
  uint64_t v12 = (v10 >> 1) - v11;
  if (__OFSUB__(v10 >> 1, v11))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v13 = v4[1] + 8 * v11 + 8 * v12;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    uint64_t v16 = v12;
    goto LABEL_10;
  }
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {
    swift_unknownObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(v14 + 16);
  if (v13 != v14 + 8 * v15 + 32)
  {
    uint64_t result = (void *)swift_release();
    goto LABEL_8;
  }
  unint64_t v17 = *(void *)(v14 + 24);
  uint64_t result = (void *)swift_release();
  uint64_t v18 = (v17 >> 1) - v15;
  BOOL v19 = __OFADD__(v12, v18);
  uint64_t v16 = v12 + v18;
  if (v19)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_10:
  uint64_t v20 = v16 - v12;
  if (__OFSUB__(v16, v12))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      uint64_t v6 = 0;
      unint64_t v5 = a3;
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  if (v20 < v6)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  sub_25D1F525C(a2 + 8 * a3, v6);
  if (v6 > 0)
  {
    uint64_t result = (void *)(v12 + v6);
    if (__OFADD__(v12, v6))
    {
LABEL_29:
      __break(1u);
      return result;
    }
    sub_25D51DD5C((uint64_t)result);
  }
LABEL_18:
  if (v6 == v20)
  {
    v22[0] = v9;
    v22[1] = a2;
    v22[2] = a3;
    _OWORD v22[3] = a4;
    v22[4] = v5;
    return sub_25D51DE14(v22);
  }
  else
  {
    return (void *)swift_unknownObjectRelease();
  }
}

uint64_t sub_25D51D990(uint64_t result, uint64_t a2)
{
  if (__OFSUB__(0, a2))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(result + 16);
  BOOL v3 = __OFADD__(a2, v2);
  uint64_t v4 = a2 + v2;
  if (v3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < a2)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0) {
LABEL_9:
  }
    __break(1u);
  return result;
}

uint64_t sub_25D51D9D8(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4[2];
  unint64_t v6 = (unint64_t)v4[3] >> 1;
  uint64_t v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)result;
  uint64_t v10 = *(void *)(*(void *)result + 16);
  BOOL v11 = __OFSUB__(v10, a2);
  uint64_t v12 = v10 - a2;
  if (v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v13 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v14 = v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v11 = __OFSUB__(v14, v13);
  uint64_t v15 = v14 - v13;
  if (v11)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v31 = v15;
  uint64_t v17 = v9 + 32;
  uint64_t v18 = v9 + 32 + 8 * a2;
  uint64_t v29 = v18 + 8 * a3;
  uint64_t result = sub_25D51E3A8(v7);
  uint64_t v30 = v9;
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v28 = v4[2];
    uint64_t v20 = v4[1] + 8 * v28;
    sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
    swift_arrayDestroy();
    sub_25D1F47F8(v20, a2, v17);
    swift_arrayDestroy();
    a4(v18, a3);
    sub_25D1F47F8(v20 + 8 * a2 + 8 * v31, v13, v29);
    swift_arrayDestroy();
    *(void *)(v19 + 16) = 0;
    uint64_t v21 = v28;
    swift_release();
LABEL_15:
    swift_retain();
    swift_unknownObjectRelease();
    uint64_t result = sub_25D51D990(v30, v21);
    *uint64_t v4 = result;
    v4[1] = v25;
    v4[2] = v26;
    v4[3] = v27;
    return result;
  }
  uint64_t v21 = v4[2];
  uint64_t v22 = v21 + a2;
  if (__OFADD__(v21, a2)) {
    goto LABEL_21;
  }
  if (v22 < v21)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (__OFSUB__(v22, v21))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
  swift_arrayInitWithCopy();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))a4)(v17 + 8 * a2, a3);
  int64_t v23 = v22 + v31;
  if (__OFADD__(v22, v31))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v24 = (unint64_t)v4[3] >> 1;
  if (v24 < v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFSUB__(v24, v23))
  {
    swift_arrayInitWithCopy();
    goto LABEL_15;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25D51DC54(uint64_t result)
{
  uint64_t v3 = v1[2];
  unint64_t v2 = v1[3];
  uint64_t v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = result;
  if ((v2 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v6 = v1[1];
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v7 + 16);
  if (v6 + 8 * v3 + 8 * v4 != v7 + 8 * v8 + 32)
  {
    swift_release();
LABEL_7:
    uint64_t v9 = v4;
    goto LABEL_9;
  }
  unint64_t v10 = *(void *)(v7 + 24);
  uint64_t result = swift_release();
  uint64_t v11 = (v10 >> 1) - v8;
  BOOL v12 = __OFADD__(v4, v11);
  uint64_t v9 = v4 + v11;
  if (v12)
  {
LABEL_20:
    __break(1u);
    return result;
  }
LABEL_9:
  uint64_t result = v4 + v5;
  if (__OFADD__(v4, v5))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v9 < result)
  {
    if (v9 + 0x4000000000000000 >= 0)
    {
      uint64_t v13 = 2 * v9;
      if (v13 > result) {
        uint64_t result = v13;
      }
      goto LABEL_14;
    }
    goto LABEL_19;
  }
LABEL_14:
  return sub_25D51D610(result);
}

uint64_t sub_25D51DD5C(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = v3 >> 1;
  BOOL v5 = __OFSUB__(v3 >> 1, v2);
  uint64_t v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7) {
    return result;
  }
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(result + 16);
  BOOL v5 = __OFADD__(v8, v7);
  uint64_t v9 = v8 + v7;
  if (v5) {
    goto LABEL_13;
  }
  *(void *)(result + 16) = v9;
  uint64_t result = swift_release();
  uint64_t v10 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 24) = v3 & 1 | (2 * v10);
  return result;
}

void *sub_25D51DE14(void *result)
{
  uint64_t v3 = v1[2];
  unint64_t v2 = v1[3];
  uint64_t v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3)) {
    goto LABEL_59;
  }
  unint64_t v6 = result[3];
  uint64_t v5 = result[4];
  uint64_t v31 = (uint64_t)result;
  if (v5 != v6 >> 1)
  {
    int64_t v7 = v6 >> 1;
    uint64_t v38 = result[2];
    if (v5 < v38 || v5 >= v7) {
      goto LABEL_60;
    }
    uint64_t v9 = v5 + 1;
    uint64_t v34 = result[1];
    uint64_t v10 = *(void **)(v34 + 8 * v5);
    uint64_t result = v10;
    uint64_t v32 = v1;
    uint64_t v33 = v7 - 1;
    uint64_t v35 = v7;
    while (!__OFADD__(v4, 1))
    {
      uint64_t v39 = sub_25D51E15C(v4, v4 + 1, *v1, v1[1], v3, v2);
      uint64_t v11 = (void (*)(uint64_t, uint64_t))sub_25D51E360();
      sub_25D51D9D8((uint64_t)&v39, v4, 0, v11);
      swift_release();
      uint64_t result = (void *)swift_release();
      uint64_t v3 = v1[2];
      unint64_t v2 = v1[3];
      unint64_t v12 = (v2 >> 1) - v3;
      if (__OFSUB__(v2 >> 1, v3)) {
        goto LABEL_53;
      }
      uint64_t v37 = v10;
      uint64_t v13 = v1[1];
      unint64_t v36 = v2 >> 1;
      if (v2)
      {
        sub_25D53F0C0();
        swift_unknownObjectRetain();
        uint64_t v14 = swift_dynamicCastClass();
        if (!v14)
        {
          swift_unknownObjectRelease();
          uint64_t v14 = MEMORY[0x263F8EE78];
        }
        uint64_t v15 = *(void *)(v14 + 16);
        if (v13 + 8 * v3 + 8 * v12 == v14 + 8 * v15 + 32)
        {
          unint64_t v17 = *(void *)(v14 + 24);
          uint64_t result = (void *)swift_release();
          uint64_t v18 = (v17 >> 1) - v15;
          uint64_t v16 = v12 + v18;
          if (__OFADD__(v12, v18)) {
            goto LABEL_58;
          }
        }
        else
        {
          uint64_t result = (void *)swift_release();
          uint64_t v16 = (v2 >> 1) - v3;
        }
      }
      else
      {
        uint64_t v16 = (v2 >> 1) - v3;
      }
      if (v4 >= v16)
      {
        uint64_t v10 = v37;
      }
      else
      {
        *(void *)(v13 + 8 * v3 + 8 * v4) = v37;
        if (v9 == v35)
        {
          uint64_t v10 = 0;
          ++v4;
          uint64_t v9 = v35;
        }
        else
        {
          if (v9 < v38 || v9 >= v35)
          {
LABEL_51:
            __break(1u);
            break;
          }
          uint64_t v20 = 0;
          uint64_t v21 = v13 + 8 * v4 + 8 * v3 + 8;
          uint64_t v22 = v34 + 8 * v9;
          while (1)
          {
            int64_t v23 = *(void **)(v22 + 8 * v20);
            if (v4 + v20 + 1 >= v16)
            {
              v9 += v20 + 1;
              uint64_t v10 = *(void **)(v22 + 8 * v20);
              goto LABEL_39;
            }
            *(void *)(v21 + 8 * v20) = v23;
            if (v33 - v9 == v20) {
              break;
            }
            uint64_t v24 = v9 + 1 + v20;
            uint64_t result = v23;
            ++v20;
            if (v24 < v38 || v24 >= v35) {
              goto LABEL_51;
            }
          }
          uint64_t v10 = 0;
          uint64_t v16 = v4 + v20 + 2;
          uint64_t v9 = v35;
LABEL_39:
          uint64_t result = v23;
          uint64_t v4 = v16;
          uint64_t v1 = v32;
        }
      }
      unint64_t v26 = v4 - v12;
      if (__OFSUB__(v4, v12)) {
        goto LABEL_54;
      }
      if (v26)
      {
        sub_25D53F0C0();
        swift_unknownObjectRetain();
        uint64_t result = (void *)swift_dynamicCastClass();
        if (!result)
        {
          swift_unknownObjectRelease();
          uint64_t result = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v27 = result[2];
        BOOL v28 = __OFADD__(v27, v26);
        uint64_t v29 = v27 + v26;
        if (v28) {
          goto LABEL_55;
        }
        result[2] = v29;
        uint64_t result = (void *)swift_release();
        unint64_t v30 = v36 + v26;
        if (__OFADD__(v36, v26)) {
          goto LABEL_56;
        }
        if ((v30 & 0x8000000000000000) != 0) {
          goto LABEL_57;
        }
        unint64_t v2 = v2 & 1 | (2 * v30);
        v1[3] = v2;
      }
      if (!v10) {
        goto LABEL_3;
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    return result;
  }
LABEL_3:
  return (void *)sub_25D51E37C(v31);
}

uint64_t sub_25D51E15C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v7 = a2;
  uint64_t v6 = result;
  if ((a6 & 1) == 0) {
    goto LABEL_32;
  }
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = a4 + 8 * a5 + 8 * v8;
  if (v13 == v11 + 8 * v12 + 32)
  {
    unint64_t v15 = *(void *)(v11 + 24);
    uint64_t result = swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = MEMORY[0x263F8EE78];
    }
    uint64_t v18 = *(void *)(v17 + 16);
    if (v13 == v17 + 8 * v18 + 32)
    {
      unint64_t v20 = *(void *)(v17 + 24);
      uint64_t result = swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  uint64_t v19 = *(void *)(v17 + 16);
  if (v13 == v17 + 8 * v19 + 32)
  {
    unint64_t v23 = *(void *)(v17 + 24);
    uint64_t result = swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = v25;
  }
  if (!v26) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
  uint64_t v27 = (void *)swift_allocObject();
  size_t v28 = _swift_stdlib_malloc_size(v27);
  v27[2] = v6;
  v27[3] = (2 * ((uint64_t)(v28 - 32) / 8)) | 1;
  return (uint64_t)v27;
}

uint64_t (*sub_25D51E360())(void)
{
  return nullsub_1;
}

uint64_t sub_25D51E37C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25D51E3A8(uint64_t a1)
{
  uint64_t isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  sub_25D53F0C0();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 8 * v6 + 8 * v7 != v9 + 8 * v10 + 32)
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1) {
      return 0;
    }
    sub_25D53F0C0();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x263F8EE78];
    }
    uint64_t v16 = (v8 + 8 * v6 - a1 - 32) / 8;
    uint64_t isUniquelyReferenced_nonNull = v7 + v16;
    if (!__OFADD__(v7, v16))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4) {
        return a1;
      }
LABEL_19:
      sub_25D51E514(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D51E514(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = v7 + 32 + 8 * result;
  sub_25D17DBEC(0, (unint64_t *)&qword_26A672EC0);
  uint64_t result = swift_arrayDestroy();
  BOOL v9 = __OFSUB__(a3, v4);
  uint64_t v10 = a3 - v4;
  if (v9)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(v7 + 16);
  if (__OFSUB__(v11, a2)) {
    goto LABEL_11;
  }
  uint64_t result = sub_25D1F47F8(v7 + 32 + 8 * a2, v11 - a2, v8 + 8 * a3);
  uint64_t v12 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v12, v10);
  uint64_t v13 = v12 + v10;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(v7 + 16) = v13;
LABEL_7:
  if (a3 > 0) {
LABEL_13:
  }
    __break(1u);
  return result;
}

uint64_t sub_25D51E5D4()
{
  uint64_t v1 = OUTLINED_FUNCTION_64_1();
  v2(v1);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_65();
  v3();
  return v0;
}

uint64_t sub_25D51E624(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_9_55()
{
  uint64_t v1 = *(void *)(v0 + 40);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_14_52()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_55()
{
  sub_25D188958(v0, *(void *)(v1 + 304));
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_23_49()
{
  return sub_25D53A6E0();
}

uint64_t OUTLINED_FUNCTION_24_40()
{
  return sub_25D53A250();
}

id OUTLINED_FUNCTION_25_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_42(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_25D53E4E0();
}

uint64_t OUTLINED_FUNCTION_27_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_43()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_29_35()
{
  return MEMORY[0x270F67878](v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_30_42()
{
  return *(void *)(v0 + 168);
}

id OUTLINED_FUNCTION_34_36(uint64_t a1)
{
  uint64_t v3 = (void *)v1[18];
  v1[48] = a1;
  v1[49] = v3;
  __swift_project_boxed_opaque_existential_0((void *)(v2 + 16), *(void *)(v2 + 40));
  return v3;
}

uint64_t OUTLINED_FUNCTION_36_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_36()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_38_33(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log, uint64_t a11, int a12, os_log_type_t type)
{
  _os_log_impl(a1, log, type, a4, v13, 0x16u);
}

uint64_t OUTLINED_FUNCTION_39_41(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_25D53EA80();
}

id OUTLINED_FUNCTION_40_36(float a1)
{
  *uint64_t v1 = a1;
  *uint64_t v2 = v3;
  return v3;
}

uint64_t OUTLINED_FUNCTION_42_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_29()
{
  return sub_25D539C70();
}

uint64_t OUTLINED_FUNCTION_44_30()
{
  return sub_25D53EA80();
}

uint64_t OUTLINED_FUNCTION_46_22(uint64_t result)
{
  *(void *)(v1 + 464) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_47_26(uint64_t result)
{
  *(void *)(v1 + 456) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_48_25()
{
  return sub_25D53A220();
}

uint64_t OUTLINED_FUNCTION_49_24()
{
  return v0;
}

void *OUTLINED_FUNCTION_53_22()
{
  return __swift_project_boxed_opaque_existential_0(v0, *(void *)(v1 + 80));
}

uint64_t OUTLINED_FUNCTION_56_27(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_57_26()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_58_20()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_59_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60_19()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_61_19()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_62_19()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_63_22()
{
  *(void *)(v1 + 96) = v0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_65_20()
{
  sub_25D188958((long long *)(v0 + 176), v0 + 16);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 16), *(void *)(v0 + 40));
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_66_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_67_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72_10()
{
  return *(void *)(v0 + 536);
}

uint64_t OUTLINED_FUNCTION_73_12()
{
  return *(void *)(v0 + 536);
}

uint64_t OUTLINED_FUNCTION_74_15()
{
  __swift_project_boxed_opaque_existential_0(v1, *(void *)(v0 + 40));
  return sub_25D539720();
}

uint64_t OUTLINED_FUNCTION_76_11()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_79_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_80_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_81_7(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_25D53E4E0();
}

uint64_t OUTLINED_FUNCTION_86_10()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_88_10()
{
  return sub_25D53F090();
}

uint64_t OUTLINED_FUNCTION_89_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  return sub_25D19E114(a3, v5, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_90_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_92_7(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[43] = a6;
  v7[44] = v6;
  v7[41] = a4;
  v7[42] = a5;
  v7[39] = a2;
  v7[40] = a3;
  v7[38] = result;
  return result;
}

uint64_t *OUTLINED_FUNCTION_94_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return __swift_allocate_boxed_opaque_existential_0(v2);
}

void OUTLINED_FUNCTION_95_9()
{
}

void OUTLINED_FUNCTION_96_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(v11 + 448) = a11;
}

uint64_t OUTLINED_FUNCTION_97_9()
{
  return sub_25D539C70();
}

void OUTLINED_FUNCTION_100_5()
{
}

uint64_t OUTLINED_FUNCTION_101_8(uint64_t result)
{
  *(void *)(v1 + 440) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_102_9(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v2, 1, 1, a1);
  v3.n128_u64[0] = 1.0;
  return MEMORY[0x270F69FB0](0, 0, 0, 0, 0, v1 & 1, v2, v3);
}

_WORD *OUTLINED_FUNCTION_103_7(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_104_8(uint64_t a1)
{
  *(void *)(v1 + 160) = a1;
  return sub_25D53EA80();
}

uint64_t OUTLINED_FUNCTION_106_7()
{
  return sub_25D188958((long long *)(v0 + 96), v0 + 56);
}

uint64_t OUTLINED_FUNCTION_107_5()
{
  return sub_25D53DC00();
}

uint64_t OUTLINED_FUNCTION_108_7()
{
  return *(void *)(v0 + 672);
}

BOOL OUTLINED_FUNCTION_110_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_112_7(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, v5, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_113_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_114_7(uint64_t result)
{
  *(void *)(v1 + 488) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_115_7()
{
  return sub_25D188958(v0, v1 + 216);
}

void OUTLINED_FUNCTION_116_8()
{
  uint64_t v2 = *(void **)(v0 + 152);
}

uint64_t OUTLINED_FUNCTION_118_6()
{
  return *(void *)(v0 + 576);
}

uint64_t OUTLINED_FUNCTION_119_8()
{
  return sub_25D53D730();
}

uint64_t OUTLINED_FUNCTION_122_7()
{
  return __swift_storeEnumTagSinglePayload(*(void *)(v1 + 504), v0, 1, *(void *)(v1 + 568));
}

uint64_t OUTLINED_FUNCTION_123_7()
{
  return sub_25D539C70();
}

uint64_t OUTLINED_FUNCTION_124_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 344);
  *(void *)(v4 + 256) = a1;
  *(void *)(v4 + 264) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_127_6()
{
  return 0x796C706572;
}

uint64_t OUTLINED_FUNCTION_131_4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 408) = __swift_project_value_buffer(a1, a2);
  return sub_25D53DC00();
}

uint64_t OUTLINED_FUNCTION_135_3()
{
  return *(void *)(v0 + 184);
}

uint64_t OUTLINED_FUNCTION_138_5()
{
  return *(void *)(v0 - 336);
}

uint64_t OUTLINED_FUNCTION_142_6()
{
  return sub_25D53DC10();
}

uint64_t OUTLINED_FUNCTION_144_4()
{
  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_145_5(uint64_t result)
{
  *(void *)(v1 + 416) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_152_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_153_4()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_154_4(float a1)
{
  *uint64_t v1 = a1;
}

void OUTLINED_FUNCTION_155_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  *a9 = v10;
}

uint64_t OUTLINED_FUNCTION_156_2()
{
  return sub_25D53DC00();
}

void OUTLINED_FUNCTION_157_5()
{
  uint64_t v2 = *(void **)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_158_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_159_5()
{
  return 0x646E65707061;
}

uint64_t OUTLINED_FUNCTION_161_4(uint64_t result)
{
  *(void *)(v1 + 400) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_165_5(uint64_t result)
{
  *(void *)(v1 + 176) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_166_5(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  *(unsigned char *)(v1 + 56) = 8;
  return sub_25D53AB40();
}

BOOL OUTLINED_FUNCTION_167_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_168_3()
{
  *(void *)(v1 + 344) = *(void *)(v0 + 56);
}

void OUTLINED_FUNCTION_171_3(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(a1 + v1);
  *(void *)(v2 + 392) = v3;
  *(void *)(v2 + 400) = *(void *)(v3 + 32);
}

void OUTLINED_FUNCTION_179_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v10 + 480) = a10;
}

void OUTLINED_FUNCTION_180_3()
{
}

void OUTLINED_FUNCTION_181_3()
{
  *(unsigned char *)(v1 + 496) = v0 & 1;
}

uint64_t OUTLINED_FUNCTION_184_3(uint64_t result)
{
  *(void *)(v1 + 472) = result;
  return result;
}

id OUTLINED_FUNCTION_189_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_190_3()
{
  return sub_25D53F090();
}

uint64_t OUTLINED_FUNCTION_191_3()
{
  return *(void *)(v0 + 328);
}

uint64_t OUTLINED_FUNCTION_194_2()
{
  return sub_25D5395E0();
}

uint64_t OUTLINED_FUNCTION_199_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_200_1()
{
  __swift_project_boxed_opaque_existential_0(v0, *(void *)(v1 + 240));
  return sub_25D5396F0();
}

uint64_t OUTLINED_FUNCTION_208_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

void OUTLINED_FUNCTION_213_1()
{
  *(void *)(v0 + 16) = v4;
  uint64_t v5 = v0 + 16 * v1;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
}

void OUTLINED_FUNCTION_214_0()
{
  char v2 = *(unsigned char *)(v0 + 458);
  sub_25D2063D8(v2);
}

id OUTLINED_FUNCTION_216_1()
{
  return sub_25D49DDB8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_218_1()
{
  return sub_25D51AEB0();
}

uint64_t OUTLINED_FUNCTION_219_1(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_25D19E114(v3, v2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_220_1()
{
  uint64_t v1 = *(void *)(v0[44] + 56);
  v0[49] = v1;
  v0[50] = *(void *)(v1 + 264);
}

uint64_t OUTLINED_FUNCTION_223_1(uint64_t a1)
{
  *(void *)(v1 + 360) = a1;
  return sub_25D539860();
}

void *OUTLINED_FUNCTION_227_1(void *a1)
{
  return __swift_project_boxed_opaque_existential_0(a1, v1);
}

void OUTLINED_FUNCTION_228_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_229_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_230_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_233_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_240_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_245_1()
{
  return sub_25D53D720();
}

void OUTLINED_FUNCTION_246_0(float a1)
{
  *uint64_t v1 = a1;
}

void OUTLINED_FUNCTION_249_0(float a1)
{
  *uint64_t v1 = a1;
  sub_25D2063D8(v2);
}

unint64_t OUTLINED_FUNCTION_251_0(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 - 192);
  return sub_25D219AF4(2);
}

uint64_t OUTLINED_FUNCTION_252_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_253_1(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 400) = a1;
  *(void *)(v3 + 408) = a2;
  __swift_destroy_boxed_opaque_existential_0(v2);
  return sub_25D51AEB0();
}

void *OUTLINED_FUNCTION_254_1()
{
  return sub_25D3B2DAC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_258_1()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_260_1()
{
  uint64_t result = 0;
  *(void *)(v1 + 24) = v0;
  *(void *)(v1 + 32) = 0;
  return result;
}

uint64_t sub_25D51F70C(char a1)
{
  uint64_t result = 28532;
  switch(a1)
  {
    case 1:
      uint64_t result = 1836020326;
      break;
    case 2:
      uint64_t result = 0x6563616C706572;
      break;
    case 3:
      uint64_t result = 0x65766F6D6572;
      break;
    case 4:
      uint64_t result = 0x65726F6E6769;
      break;
    case 5:
      uint64_t result = 7301239;
      break;
    case 6:
      uint64_t result = 1953391987;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25D51F7C8(char a1)
{
  uint64_t result = 0x6567617373656DLL;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 1768191329;
      goto LABEL_5;
    case 2:
      unint64_t v4 = 0x5F6567616D69;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 1701079414;
LABEL_5:
      unint64_t v4 = v3 & 0xFFFF0000FFFFFFFFLL | 0x5F6F00000000;
LABEL_6:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x656D000000000000;
      break;
    case 4:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 5:
      uint64_t result = 0x746361746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

void sub_25D51F888(void *a1, void (*a2)(uint64_t, void), uint64_t a3)
{
  uint64_t v5 = v4;
  uint64_t v160 = a2;
  uint64_t v161 = a3;
  uint64_t v7 = sub_25D53C830();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v159 - v12;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25D53DC10();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A688F10);
  BOOL v15 = sub_25D53DC00();
  os_log_type_t v16 = sub_25D53E7B0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (_WORD *)OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_12_11(v17);
    _os_log_impl(&dword_25D16D000, v15, v16, "SendMessageUnsupportedUseCaseCheckFlowStrategy# Checking support for request", v3, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  OUTLINED_FUNCTION_8_63();
  uint64_t v18 = OUTLINED_FUNCTION_26_43();
  char v20 = v19(v18);
  if (v20 != 25)
  {
    if (sub_25D37A8C0(v20) == 0x65726168736E75 && v21 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25D53F090();
      OUTLINED_FUNCTION_42_25();
    }
    uint64_t v166 = &type metadata for Features;
    unint64_t v167 = sub_25D17981C();
    LOBYTE(v165[0]) = 1;
    char v23 = sub_25D53AB40();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
    if ((v23 & 1) == 0)
    {
      unint64_t v52 = (void *)sub_25D53DC00();
      os_log_type_t v53 = sub_25D53E7B0();
      if (OUTLINED_FUNCTION_18_3(v53))
      {
        uint64_t v54 = (_WORD *)OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_12_11(v54);
        OUTLINED_FUNCTION_43_2(&dword_25D16D000, v55, v56, "SendSupportCheck# necessary feature flag to process verb=unshare requests not enabled, support for request is not implemented");
        OUTLINED_FUNCTION_3_0();
      }

      sub_25D4280D8();
      uint64_t v37 = OUTLINED_FUNCTION_58_1();
      uint64_t v39 = (void *)v37;
      long long v40 = xmmword_25D54BE30;
      goto LABEL_102;
    }
  }
  OUTLINED_FUNCTION_8_63();
  uint64_t v24 = OUTLINED_FUNCTION_26_43();
  char v26 = v25(v24);
  if (v26 != 6)
  {
    sub_25D37A540(v26);
    if (v28 == 0x656D5F6F69647561 && v27 == 0xED00006567617373)
    {
      OUTLINED_FUNCTION_9_56();
    }
    else
    {
      OUTLINED_FUNCTION_0_54();
      OUTLINED_FUNCTION_42_25();
    }
    __swift_project_boxed_opaque_existential_0(v5 + 2, v5[5]);
    sub_25D539650();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F75678], v7);
    char v30 = sub_25D19879C((uint64_t)v13, (uint64_t)v11);
    uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v11, v7);
    v31(v13, v7);
    if (v30)
    {
      uint64_t v32 = (void *)sub_25D53DC00();
      os_log_type_t v33 = sub_25D53E7B0();
      if (OUTLINED_FUNCTION_18_3(v33))
      {
        uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_12_11(v34);
        OUTLINED_FUNCTION_43_2(&dword_25D16D000, v35, v36, "SendSupportCheck# Unable to send audio messages with manual input");
        OUTLINED_FUNCTION_3_0();
      }

      sub_25D4280D8();
      uint64_t v37 = OUTLINED_FUNCTION_58_1();
      uint64_t v39 = (void *)v37;
      long long v40 = xmmword_25D54F0D0;
      goto LABEL_102;
    }
  }
  uint64_t v41 = v5[5];
  uint64_t v42 = v5[6];
  __swift_project_boxed_opaque_existential_0(v5 + 2, v41);
  if (sub_25D3D3AC0(v41, v42)) {
    goto LABEL_44;
  }
  OUTLINED_FUNCTION_8_63();
  uint64_t v43 = OUTLINED_FUNCTION_5_71();
  char v45 = v44(v43);
  if (v45 == 25) {
    goto LABEL_44;
  }
  char v46 = v45;
  if (sub_25D37A8C0(v45) == 1684956531 && v47 == 0xE400000000000000) {
    goto LABEL_39;
  }
  char v49 = sub_25D53F090();
  swift_bridgeObjectRelease();
  if ((v49 & 1) == 0)
  {
    if (sub_25D37A8C0(v46) != 0x6572616873 || v50 != 0xE500000000000000)
    {
      OUTLINED_FUNCTION_20_52();
      OUTLINED_FUNCTION_42_25();
      goto LABEL_40;
    }
LABEL_39:
    swift_bridgeObjectRelease();
  }
LABEL_40:
  if (OUTLINED_FUNCTION_2_72())
  {
    uint64_t v57 = a1[3];
    uint64_t v58 = a1[4];
    OUTLINED_FUNCTION_8_63();
    unint64_t v59 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 408))(v57, v58);
    char v60 = sub_25D3E74F0(v59);
    swift_release();
    swift_bridgeObjectRelease();
    if (v60)
    {
      uint64_t v61 = (void *)sub_25D53DC00();
      os_log_type_t v62 = sub_25D53E7B0();
      if (OUTLINED_FUNCTION_18_3(v62))
      {
        uint64_t v63 = (_WORD *)OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_12_11(v63);
        uint64_t v66 = "SendSupportCheck# Unable to send/share requests on mac with intent containing definite reference";
LABEL_100:
        OUTLINED_FUNCTION_43_2(&dword_25D16D000, v64, v65, v66);
        OUTLINED_FUNCTION_3_0();
        goto LABEL_101;
      }
      goto LABEL_101;
    }
  }
LABEL_44:
  OUTLINED_FUNCTION_8_63();
  uint64_t v67 = OUTLINED_FUNCTION_5_71();
  int v69 = v68(v67);
  OUTLINED_FUNCTION_8_63();
  uint64_t v70 = OUTLINED_FUNCTION_5_71();
  char v72 = v71(v70);
  if (v72 != 6)
  {
    unsigned __int8 v92 = v72;
    sub_25D37A540(v72);
    if (v94 == 0x656D5F6567616D69 && v93 == 0xED00006567617373)
    {
      OUTLINED_FUNCTION_9_56();
    }
    else
    {
      OUTLINED_FUNCTION_0_54();
      OUTLINED_FUNCTION_42_25();
    }
    if ((v69 & 1) == 0) {
      goto LABEL_74;
    }
    sub_25D37A540(v92);
    if (v97 == 0x656D5F6F69647561 && v96 == 0xED00006567617373)
    {
      OUTLINED_FUNCTION_9_56();
    }
    else
    {
      OUTLINED_FUNCTION_0_54();
      OUTLINED_FUNCTION_42_25();
    }
    __swift_project_boxed_opaque_existential_0(v5 + 2, v5[5]);
    if (sub_25D5396C0() & 1) != 0 || (OUTLINED_FUNCTION_4_71() & v69)
    {
LABEL_74:
      uint64_t v99 = sub_25D53DC00();
      os_log_type_t v100 = sub_25D53E7B0();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = (uint8_t *)OUTLINED_FUNCTION_19_55();
        v165[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v101 = 136315138;
        uint64_t v102 = sub_25D51F7C8(v92);
        v162[0] = sub_25D19E114(v102, v103, v165);
        sub_25D53EA80();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25D16D000, v99, v100, "SendSupportCheck# Unable to send %s", v101, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }

      uint64_t v104 = v160;
      sub_25D4280D8();
      uint64_t v105 = OUTLINED_FUNCTION_58_1();
      uint64_t v39 = (void *)v105;
      *unint64_t v106 = v92;
      v106[1] = 0;
LABEL_77:
      v104(v105, 0);
LABEL_121:

      return;
    }
  }
  OUTLINED_FUNCTION_8_63();
  uint64_t v73 = OUTLINED_FUNCTION_5_71();
  unsigned __int8 v75 = v74(v73);
  if (v75 != 17)
  {
    unsigned __int8 v76 = v75;
    char v77 = OUTLINED_FUNCTION_4_71();
    sub_25D17DB88((uint64_t)a1, (uint64_t)v165);
    if (v77)
    {
      __swift_project_boxed_opaque_existential_0(v165, (uint64_t)v166);
      uint64_t v78 = OUTLINED_FUNCTION_14_53();
      v79(v78);
      uint64_t v81 = v80;
      swift_bridgeObjectRelease();
      sub_25D17DB88((uint64_t)v165, (uint64_t)v162);
      if (!v81)
      {
LABEL_52:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
        goto LABEL_53;
      }
      char v82 = v163;
      __swift_project_boxed_opaque_existential_0(v162, v163);
      uint64_t v83 = OUTLINED_FUNCTION_14_53();
      uint64_t v85 = v84(v83);
      if (v86)
      {
        if (v85 == 0xD000000000000013 && v86 == 0x800000025D5502E0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_52;
        }
        sub_25D53F090();
        OUTLINED_FUNCTION_42_25();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
        if (v82) {
          goto LABEL_53;
        }
        goto LABEL_105;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
LABEL_105:
    BOOL v136 = sub_25D37A6C8(v76) == 0x6F746F6870 && v135 == 0xE500000000000000;
    if (v136
      || ((sub_25D53F090(), OUTLINED_FUNCTION_42_25(), sub_25D37A6C8(v76) == 0x6F65646976)
        ? (BOOL v138 = v137 == 0xE500000000000000)
        : (BOOL v138 = 0),
          v138))
    {
      swift_bridgeObjectRelease();
      sub_25D17DB88((uint64_t)a1, (uint64_t)v165);
      uint64_t v139 = sub_25D53DC00();
      os_log_type_t v140 = sub_25D53E7B0();
      if (os_log_type_enabled(v139, v140))
      {
        uint64_t v141 = swift_slowAlloc();
        v162[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v141 = 136315394;
        uint64_t v142 = sub_25D37A6C8(v76);
        uint64_t v164 = sub_25D19E114(v142, v143, v162);
        sub_25D53EA80();
        swift_bridgeObjectRelease();
        *(_WORD *)(v141 + 12) = 2080;
        __swift_project_boxed_opaque_existential_0(v165, (uint64_t)v166);
        uint64_t v144 = OUTLINED_FUNCTION_5_18();
        uint64_t v146 = v145(v144);
        if (v147)
        {
          unint64_t v148 = v147;
        }
        else
        {
          uint64_t v146 = 7104878;
          unint64_t v148 = 0xE300000000000000;
        }
        uint64_t v164 = sub_25D19E114(v146, v148, v162);
        sub_25D53EA80();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
        _os_log_impl(&dword_25D16D000, v139, v140, "SendSupportCheck# Unable to send %s with app= %s", (uint8_t *)v141, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
      }

      uint64_t v149 = (void (*)(void))v160;
      sub_25D53D320();
      uint64_t v150 = a1[3];
      uint64_t v151 = a1[4];
      __swift_project_boxed_opaque_existential_0(a1, v150);
      (*(void (**)(uint64_t, uint64_t))(v151 + 328))(v150, v151);
      uint64_t v152 = sub_25D53D2F0() | 0x4000000000000000;
      sub_25D4280D8();
      uint64_t v39 = (void *)OUTLINED_FUNCTION_58_1();
      *uint64_t v153 = v76;
      v153[1] = v152;
      OUTLINED_FUNCTION_21_49();
      v149();
      goto LABEL_121;
    }
    sub_25D53F090();
    OUTLINED_FUNCTION_42_25();
  }
LABEL_53:
  OUTLINED_FUNCTION_8_63();
  uint64_t v87 = OUTLINED_FUNCTION_5_18();
  char v89 = v88(v87);
  if (v89 != 25)
  {
    if (sub_25D37A8C0(v89) == 0x6572616873 && v90 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_20_52();
      OUTLINED_FUNCTION_42_25();
    }
    if ((OUTLINED_FUNCTION_4_71() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_0(v5 + 2, v5[5]);
      if ((sub_25D539720() & 1) == 0)
      {
        uint64_t v61 = (void *)sub_25D53DC00();
        os_log_type_t v133 = sub_25D53E7B0();
        if (OUTLINED_FUNCTION_18_3(v133))
        {
          char v134 = (_WORD *)OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_12_11(v134);
          uint64_t v66 = "SendSupportCheck# Unable to process .share utterances";
          goto LABEL_100;
        }
LABEL_101:

        sub_25D4280D8();
        uint64_t v37 = OUTLINED_FUNCTION_58_1();
        uint64_t v39 = (void *)v37;
        long long v40 = xmmword_25D54F0E0;
        goto LABEL_102;
      }
    }
  }
  OUTLINED_FUNCTION_8_63();
  uint64_t v107 = OUTLINED_FUNCTION_5_18();
  char v109 = v108(v107);
  if ((v109 - 14) > 0x14u)
  {
    if (OUTLINED_FUNCTION_2_72())
    {
      sub_25D3DE330();
      uint64_t v123 = v122;
      swift_release();
      if (v123)
      {
        swift_bridgeObjectRelease();
        sub_25D4280D8();
        uint64_t v37 = OUTLINED_FUNCTION_58_1();
        uint64_t v39 = (void *)v37;
        long long v40 = xmmword_25D54F0F0;
LABEL_102:
        *uint64_t v38 = v40;
        v160(v37, 0);
        goto LABEL_121;
      }
    }
    uint64_t v124 = OUTLINED_FUNCTION_2_72();
    uint64_t v125 = (void (*)(void))v160;
    if (v124)
    {
      if (sub_25D3E0274())
      {
        uint64_t v166 = &type metadata for Features;
        unint64_t v167 = sub_25D17981C();
        LOBYTE(v165[0]) = 21;
        uint64_t v126 = sub_25D53AB40();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v165);
        if ((v126 & 1) == 0)
        {
          uint64_t v154 = sub_25D53DC00();
          os_log_type_t v155 = sub_25D53E7B0();
          if (os_log_type_enabled(v154, v155))
          {
            uint64_t v156 = (_WORD *)OUTLINED_FUNCTION_20_0();
            OUTLINED_FUNCTION_12_11(v156);
            _os_log_impl(&dword_25D16D000, v154, v155, "SendSupportCheck# Unsupported scheduled send request", (uint8_t *)v126, 2u);
            OUTLINED_FUNCTION_3_0();
          }

          sub_25D4280D8();
          uint64_t v157 = (void *)OUTLINED_FUNCTION_58_1();
          _OWORD *v158 = xmmword_25D54F100;
          OUTLINED_FUNCTION_21_49();
          v125();

          swift_release();
          return;
        }
      }
      swift_release();
    }
    OUTLINED_FUNCTION_21_49();
    v125();
    return;
  }
  char v110 = v109;
  unint64_t v111 = sub_25D5208C4(v109);
  unint64_t v113 = v112;
  uint64_t v114 = sub_25D53DC00();
  os_log_type_t v115 = sub_25D53E7B0();
  BOOL v116 = os_log_type_enabled(v114, v115);
  if (v111 >> 5 == 0xFFFFFFFF && (v113 & 0xF000000000000007) == 0)
  {
    if (v116)
    {
      uint64_t v117 = (uint8_t *)OUTLINED_FUNCTION_19_55();
      v165[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v117 = 136315138;
      sub_25D379E24(v110);
      uint64_t v120 = sub_25D19E114(v118, v119, v165);
      OUTLINED_FUNCTION_18_46(v120);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v114, v115, "SendSupportCheck# Unsupported effect %s", v117, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v104 = v160;
    sub_25D4280D8();
    uint64_t v105 = OUTLINED_FUNCTION_58_1();
    uint64_t v39 = (void *)v105;
    *uint64_t v121 = xmmword_25D54F110;
    goto LABEL_77;
  }
  if (v116)
  {
    uint64_t v127 = (uint8_t *)OUTLINED_FUNCTION_19_55();
    v165[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v127 = 136315138;
    sub_25D379E24(v110);
    uint64_t v130 = sub_25D19E114(v128, v129, v165);
    OUTLINED_FUNCTION_18_46(v130);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v114, v115, "SendSupportCheck# Can't send %s", v127, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

  sub_25D4280D8();
  uint64_t v131 = (void *)OUTLINED_FUNCTION_58_1();
  unint64_t *v132 = v111;
  v132[1] = v113;
  sub_25D5212BC(v111, v113);
  v160((uint64_t)v131, 0);

  sub_25D5212EC(v111, v113);
}

uint64_t sub_25D5208C4(char a1)
{
  if (a1 == 14) {
    return 1;
  }
  uint64_t v1 = 4;
  uint64_t v2 = 3;
  uint64_t v3 = 0x1FFFFFFFE0;
  if (a1 == 15) {
    uint64_t v3 = 2;
  }
  if (a1 != 30) {
    uint64_t v2 = v3;
  }
  if (a1 != 20) {
    uint64_t v1 = v2;
  }
  if (a1 == 31) {
    return 5;
  }
  else {
    return v1;
  }
}

uint64_t sub_25D520934(void *a1, void (*a2)(uint64_t *), uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FC48);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = (uint64_t)a1;
  id v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F560);
  if (!swift_dynamicCast())
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0xE000000000000000;
    sub_25D53ED20();
    sub_25D53E360();
    uint64_t v43 = (uint64_t)a1;
    sub_25D53EE30();
    uint64_t v16 = v37;
    uint64_t v17 = v38;
    sub_25D194BF4();
    uint64_t v18 = OUTLINED_FUNCTION_58_1();
    *uint64_t v19 = v16;
    v19[1] = v17;
    uint64_t v37 = v18;
    LOBYTE(v42) = 1;
    a2(&v37);
    char v20 = (uint64_t *)&unk_26A6719D0;
    uint64_t v21 = &v37;
    return sub_25D196E70((uint64_t)v21, v20);
  }
  uint64_t v12 = v37;
  unint64_t v13 = v38;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = v3;
  if (!(v13 >> 62))
  {
    sub_25D51F7C8(v12);
    swift_retain();
    swift_retain();
    sub_25D53E2C0();
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_25D53D0A0();
    OUTLINED_FUNCTION_22_47(v22);
    sub_25D47FDFC();
LABEL_7:
    swift_release();
    goto LABEL_8;
  }
  if (v13 >> 62 == 1)
  {
    sub_25D37A6C8(v12);
    swift_retain();
    swift_retain();
    sub_25D5212BC(v12, v13);
    sub_25D53E2C0();
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_25D53D0A0();
    OUTLINED_FUNCTION_22_47(v15);
    type metadata accessor for MessagesApp(0);
    swift_retain();
    sub_25D50A3A4();
    sub_25D47FDFC();
    swift_release();
    swift_release();
    sub_25D5212D4(v12, v13);
    sub_25D5212D4(v12, v13);
LABEL_8:
    char v20 = (uint64_t *)&unk_26A6719E0;
    uint64_t v21 = v10;
    return sub_25D196E70((uint64_t)v21, v20);
  }
  switch(v12)
  {
    case 1:
      swift_retain();
      swift_retain();
      sub_25D47E6E4();
      return swift_release();
    case 2:
      OUTLINED_FUNCTION_24_41();
      OUTLINED_FUNCTION_10_53();
      uint64_t v24 = sub_25D53C930();
      OUTLINED_FUNCTION_1_56(v24);
      swift_retain();
      OUTLINED_FUNCTION_11_51();
      OUTLINED_FUNCTION_17_17();
      sub_25D47E70C(v25);
      goto LABEL_18;
    case 3:
      OUTLINED_FUNCTION_24_41();
      OUTLINED_FUNCTION_10_53();
      uint64_t v26 = sub_25D53C930();
      OUTLINED_FUNCTION_1_56(v26);
      swift_retain();
      OUTLINED_FUNCTION_11_51();
      OUTLINED_FUNCTION_17_17();
      sub_25D47F0AC(v27);
      goto LABEL_18;
    case 4:
      OUTLINED_FUNCTION_24_41();
      OUTLINED_FUNCTION_10_53();
      uint64_t v28 = sub_25D53C930();
      OUTLINED_FUNCTION_1_56(v28);
      swift_retain();
      OUTLINED_FUNCTION_11_51();
      OUTLINED_FUNCTION_17_17();
      sub_25D47F490(v29);
      goto LABEL_18;
    case 5:
      OUTLINED_FUNCTION_24_41();
      OUTLINED_FUNCTION_10_53();
      uint64_t v30 = sub_25D53C930();
      OUTLINED_FUNCTION_1_56(v30);
      swift_retain();
      OUTLINED_FUNCTION_11_51();
      OUTLINED_FUNCTION_17_17();
      sub_25D47F4A8(v31);
LABEL_18:
      swift_release();
      break;
    case 7:
      uint64_t v32 = sub_25D53D0A0();
      OUTLINED_FUNCTION_23_50(v32);
      swift_retain();
      sub_25D47F744();
      goto LABEL_7;
    case 9:
      uint64_t v33 = sub_25D53D0A0();
      OUTLINED_FUNCTION_23_50(v33);
      swift_retain();
      sub_25D47FF94(0, 0, 0, (uint64_t)v10, (uint64_t)sub_25D5212B0, (uint64_t)v14, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46,
        v47);
      goto LABEL_7;
    case 10:
      swift_retain();
      swift_retain();
      sub_25D47F6F4();
      break;
    default:
      swift_retain();
      swift_retain();
      sub_25D47F8C8();
      sub_25D5212D4(v12, v13);
      break;
  }
  return swift_release();
}

uint64_t sub_25D520F2C(uint64_t a1, void (*a2)(id *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25D539D00();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672AF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (id *)((char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25D1EE8F0(a1, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24[0] = *v16;
    id v17 = v24[0];
    char v25 = 1;
    id v18 = v24[0];
    a2(v24);
  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v11 + 32))(v13, v16, v10);
    __swift_project_boxed_opaque_existential_0((void *)(a4 + 16), *(void *)(a4 + 40));
    sub_25D5396A0();
    uint64_t v19 = sub_25D539C30();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v19);
    char v20 = (void *)sub_25D53A710();
    memset(v22, 0, sizeof(v22));
    uint64_t v23 = 0;
    v24[3] = v20;
    v24[4] = (id)MEMORY[0x263F6FFF0];
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)v24);
    sub_25D539A20();
    sub_25D196E70((uint64_t)v22, &qword_26A674B60);
    sub_25D196E70((uint64_t)v9, (uint64_t *)&unk_26A6719F0);
    char v25 = 0;
    a2(v24);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return sub_25D196E70((uint64_t)v24, (uint64_t *)&unk_26A6719D0);
}

uint64_t type metadata accessor for SendMessageUnsupportedUseCaseCheckFlowStrategy()
{
  return self;
}

void sub_25D521228(void *a1, void (*a2)(uint64_t, void), uint64_t a3)
{
}

uint64_t sub_25D52124C(void *a1, void (*a2)(uint64_t *), uint64_t a3)
{
  return sub_25D520934(a1, a2, a3);
}

uint64_t sub_25D521270()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25D5212B0(uint64_t a1)
{
  return sub_25D520F2C(a1, *(void (**)(id *))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25D5212BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 == 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25D5212D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 == 1) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25D5212EC(uint64_t a1, unint64_t a2)
{
  if ((unint64_t)a1 >> 5 != 0xFFFFFFFF || (a2 & 0xF000000000000007) != 0) {
    return sub_25D5212D4(a1, a2);
  }
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_25D5212BC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t a1)
{
  return sub_25D5212D4(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_25D5212BC(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_25D5212D4(v5, v6);
  return a1;
}

uint64_t *assignWithTake for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_25D5212D4(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)a1 >> 5;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = 32 * -a2;
      *(void *)(result + 8) = 0;
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unint64_t sub_25D521460(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if ((v1 >> 62) <= 1) {
    return v1 >> 62;
  }
  else {
    return ((4 * v1) & 0xFFFFFFE0 | *(_DWORD *)a1 & 0x1F) + 2;
  }
}

uint64_t sub_25D521484(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_25D521494(void *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
    *result &= 0x1FuLL;
    result[1] = v2;
  }
  else
  {
    *uint64_t result = ((_BYTE)a2 - 2) & 0x1F;
    result[1] = ((unint64_t)(a2 - 2) >> 2) & 0x3FFFFFF8 | 0x8000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason()
{
  return &type metadata for SendMessageUnsupportedUseCaseCheckFlowStrategy.UnsupportedReason;
}

uint64_t OUTLINED_FUNCTION_0_54()
{
  return sub_25D53F090();
}

uint64_t OUTLINED_FUNCTION_1_56(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_72()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_0(v0, v1);
  return sub_25D493264(v1, v2);
}

uint64_t OUTLINED_FUNCTION_4_71()
{
  __swift_project_boxed_opaque_existential_0(v1, *(void *)(v0 + 40));
  return sub_25D3D3910();
}

uint64_t OUTLINED_FUNCTION_5_71()
{
  return v0;
}

void *OUTLINED_FUNCTION_8_63()
{
  return __swift_project_boxed_opaque_existential_0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_56()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_53()
{
  return sub_25D17DB88(v0 + 16, v1 - 136);
}

uint64_t OUTLINED_FUNCTION_11_51()
{
  return sub_25D3F7998((void *)(v1 - 136), v0);
}

uint64_t OUTLINED_FUNCTION_14_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_46(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return sub_25D53EA80();
}

uint64_t OUTLINED_FUNCTION_19_55()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_20_52()
{
  return sub_25D53F090();
}

uint64_t OUTLINED_FUNCTION_22_47(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t OUTLINED_FUNCTION_23_50(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_24_41()
{
  return sub_25D53D1D0();
}

uint64_t OUTLINED_FUNCTION_26_43()
{
  return v0;
}

uint64_t sub_25D521760(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDE8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v4 + 80) = xmmword_25D5431D0;
  sub_25D17DB88((uint64_t)a1, (uint64_t)v20);
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  uint64_t v12 = qword_26A66E670;
  swift_retain();
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  __swift_project_boxed_opaque_existential_0(qword_26A688620, qword_26A688638);
  uint64_t v13 = sub_25D17AA6C();
  uint64_t v14 = sub_25D4BF954(a2, (uint64_t)v20, (uint64_t)v18, v13, 0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FDF0);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v15);
  type metadata accessor for SiriKitFlowFactoryImpl();
  uint64_t v16 = swift_allocObject();
  swift_retain();
  *(void *)(v4 + 56) = sub_25D4F5B5C(v14, a2, a3, 1, v16, (uint64_t)v11);
  *(void *)(v4 + 64) = a3;
  *(void *)(v4 + 72) = a4;
  swift_release();
  sub_25D188958(a1, v4 + 16);
  return v4;
}

uint64_t sub_25D521904()
{
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25D53DC10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A688F10);
  uint64_t v2 = sub_25D53DC00();
  os_log_type_t v3 = sub_25D53E7A0();
  if (OUTLINED_FUNCTION_18_3(v3))
  {
    uint64_t v4 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_25D16D000, v2, v0, "#DelayedSpokenFollowupFlow: received input, forwarding to followupOfferFlow", v4, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  sub_25D1E2D6C();
  return v5 & 1;
}

uint64_t sub_25D5219E0(void (*a1)(char *), uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25D539B00();
  uint64_t v8 = *(uint8_t **)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v2[10];
  if ((unint64_t)(v11 - 2) < 2)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25D53DC10();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A688F10);
    swift_retain_n();
    char v20 = sub_25D53DC00();
    os_log_type_t v21 = sub_25D53E7C0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v55 = a2;
      uint64_t v56 = v7;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v59 = v23;
      uint64_t v54 = v22 + 4;
      uint64_t v24 = v4[11];
      uint64_t v57 = v4[10];
      uint64_t v58 = v24;
      sub_25D522968(v57);
      uint64_t v25 = sub_25D53E270();
      uint64_t v27 = sub_25D19E114(v25, v26, &v59);
      OUTLINED_FUNCTION_13_7(v27);
      uint64_t v7 = v56;
      sub_25D53EA80();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v20, v21, "#DelayedSpokenFollowupFlow.action() is called when it is in unexpected state: %s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      swift_release_n();
    }
    sub_25D539AF0();
    goto LABEL_26;
  }
  uint64_t v12 = v2[11];
  if (v11)
  {
    if (v11 == 1)
    {
      if (qword_26A66E778 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_25D53DC10();
      __swift_project_value_buffer(v13, (uint64_t)qword_26A688F10);
      uint64_t v14 = sub_25D53DC00();
      os_log_type_t v15 = sub_25D53E7A0();
      if (OUTLINED_FUNCTION_18_3(v15))
      {
        uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_20_0();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_25D16D000, v14, v3, "#DelayedSpokenFollowupFlow: letting FollowupOfferFlow handle the request", v16, 2u);
        OUTLINED_FUNCTION_3_0();
      }

      uint64_t v17 = v4[10];
      *((_OWORD *)v4 + 5) = xmmword_25D542AB0;
      sub_25D522954(v17);
      uint64_t v57 = v4[7];
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = sub_25D52297C;
      *(void *)(v18 + 24) = v4;
      type metadata accessor for FollowupOfferFlow(0);
      sub_25D5229E4(&qword_26A66FE80, 255, (void (*)(uint64_t))type metadata accessor for FollowupOfferFlow);
      swift_retain();
      swift_retain();
      sub_25D539AA0();
      swift_release();
      swift_release();
LABEL_26:
      a1(v10);
      return (*((uint64_t (**)(char *, uint64_t))v8 + 1))(v10, v7);
    }
    uint64_t v54 = v8;
    uint64_t v55 = a2;
    uint64_t v32 = v7;
    os_log_type_t v53 = a1;
    sub_25D522968(v11);
    uint64_t v33 = qword_26A66E778;
    swift_unknownObjectRetain_n();
    if (v33 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25D53DC10();
    __swift_project_value_buffer(v34, (uint64_t)qword_26A688F10);
    uint64_t v35 = sub_25D53DC00();
    os_log_type_t v36 = sub_25D53E7A0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_25D16D000, v35, v36, "#DelayedSpokenFollowupFlow: Running action group", v37, 2u);
      OUTLINED_FUNCTION_3_0();
    }
    uint64_t v56 = v32;

    swift_unknownObjectRetain_n();
    uint64_t v38 = sub_25D53DC00();
    os_log_type_t v39 = sub_25D53E7B0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v58 = v12;
      uint64_t v59 = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      unint64_t v52 = v40 + 4;
      uint64_t v57 = v11;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A675078);
      uint64_t v42 = sub_25D53E270();
      uint64_t v44 = sub_25D19E114(v42, v43, &v59);
      OUTLINED_FUNCTION_13_7(v44);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_73();
      _os_log_impl(&dword_25D16D000, v38, v39, "#DelayedSpokenFollowupFlow: Running action group: %s)", v40, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
      OUTLINED_FUNCTION_2_73();
    }

    uint64_t v45 = v4[8];
    type metadata accessor for StaticReadingFlowSource();
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = v11;
    v46[3] = v12;
    v46[4] = v45;
    sub_25D5229E4(&qword_26A675068, v47, (void (*)(uint64_t))type metadata accessor for StaticReadingFlowSource);
    sub_25D5229E4(&qword_26A675070, v48, (void (*)(uint64_t))type metadata accessor for StaticReadingFlowSource);
    sub_25D538FB0();
    swift_allocObject();
    swift_retain();
    sub_25D522968(v11);
    swift_retain();
    swift_retain();
    uint64_t v49 = sub_25D538FA0();
    uint64_t v50 = v4[10];
    *((_OWORD *)v4 + 5) = xmmword_25D542AC0;
    sub_25D522954(v50);
    uint64_t v57 = v49;
    sub_25D539AD0();
    v53(v10);
    swift_release();
    sub_25D522954(v11);
    swift_release();
    OUTLINED_FUNCTION_2_73();
    uint64_t v7 = v56;
    uint64_t v8 = v54;
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_25D53DC10();
    __swift_project_value_buffer(v28, (uint64_t)qword_26A688F10);
    uint64_t v29 = sub_25D53DC00();
    os_log_type_t v30 = sub_25D53E7A0();
    if (OUTLINED_FUNCTION_18_3(v30))
    {
      uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_25D16D000, v29, v3, "#DelayedSpokenFollowupFlow: No action group to run, completing", v31, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D539AF0();
    a1(v10);
    sub_25D522954(0);
    sub_25D522954(0);
  }
  return (*((uint64_t (**)(char *, uint64_t))v8 + 1))(v10, v7);
}

uint64_t sub_25D522204()
{
  uint64_t v1 = v0;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25D53DC10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A688F10);
  swift_retain_n();
  os_log_type_t v3 = sub_25D53DC00();
  os_log_type_t v4 = sub_25D53E7B0();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v19 = swift_slowAlloc();
    *(_DWORD *)char v5 = 136315138;
    type metadata accessor for DelayedSpokenFollowupFlow();
    sub_25D5229E4(&qword_26A66F5A8, v6, (void (*)(uint64_t))type metadata accessor for DelayedSpokenFollowupFlow);
    sub_25D539220();
    uint64_t v7 = sub_25D53E270();
    sub_25D19E114(v7, v8, (uint64_t *)&v19);
    sub_25D53EA80();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v3, v4, "#DelayedSpokenFollowupFlow Received exitValue from FollowupOfferFlow: %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_release_n();
  }
  long long v19 = *(_OWORD *)(v0 + 64);
  sub_25D4F6C2C();
  uint64_t v9 = sub_25D539F30();
  uint64_t v11 = v10;
  uint64_t v12 = sub_25D53DC00();
  os_log_type_t v13 = sub_25D53E7A0();
  BOOL v14 = os_log_type_enabled(v12, v13);
  if (!v9)
  {
    if (!v14)
    {
      uint64_t v11 = 0;
      goto LABEL_13;
    }
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_25D16D000, v12, v13, "#DelayedSpokenFollowupFlow No action group after returning from FollowupOfferFlow", v16, 2u);
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  if (v14)
  {
    os_log_type_t v15 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)os_log_type_t v15 = 0;
    _os_log_impl(&dword_25D16D000, v12, v13, "#DelayedSpokenFollowupFlow Received action group after returning from FollowupOfferFlow", v15, 2u);
LABEL_11:
    OUTLINED_FUNCTION_3_0();
  }
LABEL_13:

  uint64_t v17 = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = v9;
  *(void *)(v1 + 88) = v11;
  return sub_25D522954(v17);
}

uint64_t sub_25D5224E8()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 80);
  return sub_25D522954(v1);
}

uint64_t sub_25D522530()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  sub_25D522954(*(void *)(v0 + 80));
  return v0;
}

uint64_t sub_25D522578()
{
  sub_25D522530();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DelayedSpokenFollowupFlow()
{
  return self;
}

uint64_t sub_25D5225D0()
{
  return sub_25D521904() & 1;
}

uint64_t sub_25D5225F8(void (*a1)(char *), uint64_t a2)
{
  return sub_25D5219E0(a1, a2);
}

uint64_t sub_25D52261C()
{
  type metadata accessor for DelayedSpokenFollowupFlow();
  return sub_25D539220();
}

uint64_t type metadata accessor for StaticReadingFlowSource()
{
  return self;
}

unint64_t destroy for DelayedSpokenFollowupFlow.State(unint64_t *a1)
{
  unint64_t result = *a1;
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if ((v2 + 1) <= 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t _s16SiriMessagesFlow25DelayedSpokenFollowupFlowC5StateOwCP_0(uint64_t a1, uint64_t *a2)
{
  LODWORD(v3) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    uint64_t v3 = *a2;
  }
  if ((v3 + 1) > 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v4 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v4;
    swift_unknownObjectRetain();
  }
  return a1;
}

uint64_t *assignWithCopy for DelayedSpokenFollowupFlow.State(uint64_t *a1, uint64_t *a2)
{
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = *a1;
  }
  unsigned int v6 = v5 + 1;
  uint64_t v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    uint64_t v4 = *a2;
  }
  unsigned int v8 = v4 + 1;
  if (v6 > 1)
  {
    if (v8 <= 1)
    {
      uint64_t v10 = a2[1];
      *a1 = v7;
      a1[1] = v10;
      swift_unknownObjectRetain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v8 > 1)
  {
    swift_unknownObjectRelease();
    goto LABEL_12;
  }
  uint64_t v9 = a2[1];
  *a1 = v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v9;
  return a1;
}

unint64_t *assignWithTake for DelayedSpokenFollowupFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a1;
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF) {
    int v6 = -1;
  }
  else {
    int v6 = v4;
  }
  unsigned int v7 = v6 + 1;
  unint64_t v8 = *a2;
  if (*a2 < 0xFFFFFFFF) {
    unint64_t v5 = *a2;
  }
  unsigned int v9 = v5 + 1;
  if (v7 > 1)
  {
    if (v9 <= 1)
    {
      unint64_t v11 = a2[1];
      *a1 = v8;
      a1[1] = v11;
      return a1;
    }
LABEL_12:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v9 > 1)
  {
    swift_unknownObjectRelease();
    goto LABEL_12;
  }
  unint64_t v10 = a2[1];
  *a1 = v8;
  swift_unknownObjectRelease();
  a1[1] = v10;
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedSpokenFollowupFlow.State(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 4) {
    return (v3 - 3);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DelayedSpokenFollowupFlow.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_25D5228E8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

void *sub_25D522908(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = 0;
    result[1] = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *unint64_t result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedSpokenFollowupFlow.State()
{
  return &type metadata for DelayedSpokenFollowupFlow.State;
}

uint64_t sub_25D522948@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25D4BEEB8(a1, (uint64_t)&off_270A4F1E0, a2);
}

uint64_t sub_25D522954(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_25D522968(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_25D522980()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25D5229B8(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25D5229E4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_2_73()
{
  sub_25D522954(v0);
  return sub_25D522954(v0);
}

uint64_t sub_25D522A60(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25D53EEB0();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](v4, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v6 = sub_25D53D300();
      uint64_t v8 = v7;
      swift_release();
      if (v8)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D1F2A04();
          uint64_t v5 = v11;
        }
        unint64_t v9 = *(void *)(v5 + 16);
        if (v9 >= *(void *)(v5 + 24) >> 1)
        {
          sub_25D1F2A04();
          uint64_t v5 = v12;
        }
        *(void *)(v5 + 16) = v9 + 1;
        uint64_t v10 = v5 + 16 * v9;
        *(void *)(v10 + 32) = v6;
        *(void *)(v10 + 40) = v8;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D522BCC@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_25D53AA00();
  OUTLINED_FUNCTION_9_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FFC8);
  uint64_t v12 = sub_25D53A780();
  OUTLINED_FUNCTION_9_0();
  uint64_t v14 = v13;
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_25D541230;
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v16 + v15, *MEMORY[0x263F74538], v12);
  OUTLINED_FUNCTION_21();
  sub_25D53A9F0();
  uint64_t v17 = sub_25D53A9D0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  *a3 = v17;
  sub_25D188958(a2, (uint64_t)(a3 + 1));
  return sub_25D188958(a1, (uint64_t)(a3 + 6));
}

uint64_t sub_25D522D50()
{
  OUTLINED_FUNCTION_14();
  v1[14] = v0;
  uint64_t v2 = sub_25D53A990();
  v1[15] = v2;
  OUTLINED_FUNCTION_11_0(v2);
  v1[16] = v3;
  v1[17] = swift_task_alloc();
  v1[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670690);
  v1[19] = swift_task_alloc();
  uint64_t v4 = sub_25D53A7B0();
  v1[20] = v4;
  OUTLINED_FUNCTION_11_0(v4);
  v1[21] = v5;
  v1[22] = swift_task_alloc();
  uint64_t v6 = sub_25D53A8D0();
  v1[23] = v6;
  OUTLINED_FUNCTION_11_0(v6);
  v1[24] = v7;
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25D522EBC()
{
  sub_25D219144(**(void **)(v0 + 112), v0 + 56);
  if (!*(void *)(v0 + 80))
  {
    sub_25D523B44(v0 + 56);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25D53DC10();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A688F10);
    uint64_t v8 = sub_25D53DC00();
    os_log_type_t v9 = sub_25D53E7C0();
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_3_2(&dword_25D16D000, v10, v11, "#UserPersonaSignalCollector signal is not available");
      OUTLINED_FUNCTION_3_0();
    }

    OUTLINED_FUNCTION_4_72();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_68_4();
    OUTLINED_FUNCTION_39_5();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v1 = *(void *)(v0 + 112);
  sub_25D188958((long long *)(v0 + 56), v0 + 16);
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 48), *(void *)(v1 + 72));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25D5230B8;
  OUTLINED_FUNCTION_39_5();
  return sub_25D246A84(v3, v4);
}

uint64_t sub_25D5230B8()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  *(void *)(v1 + 248) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_25D52318C()
{
  uint64_t v1 = (void *)sub_25D522A60(v0[31]);
  v0[32] = v1;
  swift_bridgeObjectRelease();
  if (v1[2] == 1 && (v1[4] == 0xD000000000000013 && v1[5] == 0x800000025D5502E0 || (sub_25D53F090() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25D53DC10();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A688F10);
    uint64_t v3 = sub_25D53DC00();
    os_log_type_t v4 = sub_25D53E7B0();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_3_2(&dword_25D16D000, v5, v6, "#UserPersonaSignalCollector only Messages app in candidate apps, returning 1p exclusive");
      OUTLINED_FUNCTION_3_0();
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    OUTLINED_FUNCTION_4_72();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_68_4();
    OUTLINED_FUNCTION_39_5();
    __asm { BRAA            X2, X16 }
  }
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25D53DC10();
  v0[33] = __swift_project_value_buffer(v9, (uint64_t)qword_26A688F10);
  uint64_t v10 = sub_25D53DC00();
  os_log_type_t v11 = sub_25D53E7B0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25D16D000, v10, v11, "#UserPersonaSignalCollector calling signal gatherer", v12, 2u);
    OUTLINED_FUNCTION_3_0();
  }
  uint64_t v13 = v0[14];

  uint64_t v14 = swift_task_alloc();
  v0[34] = v14;
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v1;
  uint64_t v15 = swift_task_alloc();
  v0[35] = v15;
  *(void *)(v15 + 16) = sub_25D523BA4;
  *(void *)(v15 + 24) = v14;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[36] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_25D5234DC;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_39_5();
  return MEMORY[0x270FA2318](v17, v18, v19, v20, v21, v22, v23, v24);
}

uint64_t sub_25D5234DC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_25D5235E4()
{
  uint64_t v42 = v0;
  uint64_t v1 = (uint64_t)(v0 + 2);
  uint64_t v2 = v0[19];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = v0[27];
    uint64_t v39 = v0[26];
    uint64_t v4 = v0[23];
    uint64_t v5 = v0[24];
    uint64_t v6 = *(void (**)(void))(v5 + 32);
    OUTLINED_FUNCTION_6_78();
    v6();
    sub_25D523BB4();
    swift_willThrowTypedImpl();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_78();
    v6();
    OUTLINED_FUNCTION_6_78();
    v6();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v7(v39, v3, v4);
    uint64_t v8 = sub_25D53DC00();
    os_log_type_t v9 = sub_25D53E7C0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[26];
    uint64_t v11 = v0[27];
    if (v10)
    {
      uint64_t v13 = v0[25];
      uint64_t v38 = v0[24];
      uint64_t v14 = v0[23];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      v7(v13, v12, v14);
      uint64_t v16 = sub_25D53E270();
      v0[12] = sub_25D19E114(v16, v17, &v41);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
      v18(v12, v14);
      _os_log_impl(&dword_25D16D000, v8, v9, "#UserPersonaSignalCollector failed to gather signal: %s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      v18(v11, v14);
    }
    else
    {
      uint64_t v33 = v0[23];
      uint64_t v34 = v0[24];

      uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v35(v12, v33);
      v35(v11, v33);
    }
    uint64_t v1 = (uint64_t)(v0 + 2);
  }
  else
  {
    uint64_t v19 = v0[21];
    uint64_t v20 = v0[22];
    uint64_t v21 = v0[20];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v20, v2, v21);
    sub_25D53A7A0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    sub_25D53A970();
    uint64_t v22 = v0[5];
    uint64_t v23 = v0[6];
    __swift_project_boxed_opaque_existential_0(v0 + 2, v22);
    MEMORY[0x2611A7F60](v22, v23);
    sub_25D53A980();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_25D53DC00();
    os_log_type_t v25 = sub_25D53E7B0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v28 = v0[16];
    uint64_t v27 = v0[17];
    uint64_t v29 = v0[15];
    if (v26)
    {
      uint64_t v40 = v0[17];
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v30 = 136315138;
      uint64_t v31 = sub_25D53E970();
      v0[13] = sub_25D19E114(v31, v32, &v41);
      sub_25D53EA80();
      uint64_t v1 = (uint64_t)(v0 + 2);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v24, v25, "#UserPersonaSignalCollector user persona value: %s", v30, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v40, v29);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    }
  }
  __swift_destroy_boxed_opaque_existential_0(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_68_4();
  return v36(0);
}

uint64_t sub_25D523AC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_project_boxed_opaque_existential_0(a3 + 1, a3[4]);
  sub_25D3BBC44(*a3);
  sub_25D535158();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D523B44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A675088);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D523BA4(uint64_t a1, uint64_t a2)
{
  return sub_25D523AC4(a1, a2, *(uint64_t **)(v2 + 16));
}

void sub_25D523BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_25D222860(a1, *(void *)(v20 + 16), *(void *)(v20 + 24), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

unint64_t sub_25D523BB4()
{
  unint64_t result = qword_26A675090;
  if (!qword_26A675090)
  {
    sub_25D53A8D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675090);
  }
  return result;
}

uint64_t destroy for UserPersonaSignalCollector(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  return __swift_destroy_boxed_opaque_existential_0(v2);
}

uint64_t initializeWithCopy for UserPersonaSignalCollector(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a2 + 8;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 8, v4, v6);
  long long v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
  return a1;
}

void *assignWithCopy for UserPersonaSignalCollector(void *a1, void *a2)
{
  uint64_t v4 = a2 + 6;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, v4);
  return a1;
}

uint64_t assignWithTake for UserPersonaSignalCollector(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_0(a1 + 48);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserPersonaSignalCollector(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 88))
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

uint64_t storeEnumTagSinglePayload for UserPersonaSignalCollector(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserPersonaSignalCollector()
{
  return &type metadata for UserPersonaSignalCollector;
}

uint64_t OUTLINED_FUNCTION_4_72()
{
  return swift_task_dealloc();
}

void sub_25D523EF0(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for MessagesFeatureFlagsImpl;
  *(void *)(a1 + 32) = &off_270A46BB0;
}

uint64_t sub_25D523F08()
{
  OUTLINED_FUNCTION_14();
  v1[25] = v2;
  v1[26] = v0;
  OUTLINED_FUNCTION_4_11();
  v1[27] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v4);
  v1[28] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D5397D0();
  OUTLINED_FUNCTION_17_0(v5);
  v1[29] = OUTLINED_FUNCTION_92();
  uint64_t v6 = sub_25D53A2F0();
  v1[30] = v6;
  OUTLINED_FUNCTION_11_0(v6);
  v1[31] = v7;
  v1[32] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25D523FE0()
{
  OUTLINED_FUNCTION_55();
  uint64_t v1 = *(void *)(v0[26] + 64);
  OUTLINED_FUNCTION_35_4();
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain_n();
    do
    {
      sub_25D17DB88(v5, (uint64_t)(v0 + 2));
      __swift_project_boxed_opaque_existential_0(v0 + 2, v0[5]);
      uint64_t v6 = OUTLINED_FUNCTION_1_38();
      v7(v6);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
      sub_25D385CAC();
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease_n();
    uint64_t v3 = v10;
  }
  v0[33] = v3;
  v0[34] = *(void *)(v1 + 128);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[35] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25D524140;
  return sub_25D5248D0();
}

uint64_t sub_25D524140()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 288) = v4;
  *(void *)(v2 + 296) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D524224()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  uint64_t v1 = v0[26];
  sub_25D539770();
  sub_25D53A1F0();
  sub_25D53A240();
  sub_25D53A2A0();
  sub_25D53D300();
  v0[38] = v2;
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 16), *(void *)(v1 + 40));
  OUTLINED_FUNCTION_14_0();
  v3();
  OUTLINED_FUNCTION_101_9();
  v0[15] = &type metadata for MessagesFeatureFlagsImpl;
  v0[16] = &off_270A46BB0;
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  v0[39] = v4;
  *uint64_t v4 = v5;
  v4[1] = sub_25D52439C;
  OUTLINED_FUNCTION_59_0();
  return sub_25D37F40C();
}

uint64_t sub_25D52439C()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 56;
  uint64_t v4 = v1 + 96;
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v4);
  __swift_destroy_boxed_opaque_existential_0(v3);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D5244B8()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = v0[26];
  uint64_t v2 = sub_25D539C30();
  OUTLINED_FUNCTION_96_12(v2);
  sub_25D539C70();
  swift_allocObject();
  v0[40] = sub_25D539C60();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 16), *(void *)(v1 + 40));
  OUTLINED_FUNCTION_14_0();
  v3();
  char v4 = OUTLINED_FUNCTION_97_10();
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  v0[41] = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_25D5245E8;
  uint64_t v7 = v0[36];
  uint64_t v8 = v0[34];
  uint64_t v9 = v0[32];
  uint64_t v10 = v0[25];
  return sub_25D49DA78(v10, v7, v9, v8, v4 & 1);
}

uint64_t sub_25D5245E8()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *char v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  swift_release();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v3 + 136);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D5246F0()
{
  OUTLINED_FUNCTION_31_0();

  swift_release();
  OUTLINED_FUNCTION_19_5();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v2();
}

uint64_t sub_25D52479C()
{
  OUTLINED_FUNCTION_35_1();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D524824()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();

  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_62_20();
  v2(v1);
  __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D5248D0()
{
  OUTLINED_FUNCTION_14();
  v1[74] = v0;
  uint64_t v2 = sub_25D53D630();
  v1[75] = v2;
  OUTLINED_FUNCTION_11_0(v2);
  v1[76] = v3;
  v1[77] = OUTLINED_FUNCTION_92();
  uint64_t v4 = sub_25D53D0A0();
  v1[78] = v4;
  OUTLINED_FUNCTION_11_0(v4);
  v1[79] = v5;
  v1[80] = OUTLINED_FUNCTION_24_0();
  v1[81] = swift_task_alloc();
  v1[82] = swift_task_alloc();
  v1[83] = swift_task_alloc();
  v1[84] = swift_task_alloc();
  v1[85] = swift_task_alloc();
  v1[86] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D5249D4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 592) + 64);
  OUTLINED_FUNCTION_35_4();
  sub_25D3B5938(*(void *)(v1 + 24), v0 + 112);
  if (*(void *)(v0 + 136))
  {
    sub_25D188958((long long *)(v0 + 112), v0 + 192);
    uint64_t v97 = v0 + 192;
    sub_25D17DB88(v0 + 192, v0 + 152);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F200);
    HIDWORD(v82) = swift_dynamicCast();
    if (HIDWORD(v82))
    {
      uint64_t v2 = *(void **)(v0 + 16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v3 = *(void *)(v0 + 616);
    uint64_t v4 = *(void *)(v0 + 608);
    uint64_t v5 = *(void *)(v0 + 600);
    uint64_t v6 = *(void *)(v0 + 592);
    sub_25D17DB88(v97, v0 + 232);
    uint64_t v7 = swift_retain();
    LODWORD(v82) = sub_25D4BEC50(v7, v0 + 232);
    swift_release();
    sub_25D196E70(v0 + 232, &qword_26A66FE28);
    uint64_t v88 = *(void *)(v4 + 104);
    uint64_t v91 = v4 + 104;
    OUTLINED_FUNCTION_100_3();
    v8();
    uint64_t v94 = v6;
    uint64_t v85 = (void *)(v6 + 16);
    __swift_project_boxed_opaque_existential_0((void *)(v6 + 16), *(void *)(v6 + 40));
    OUTLINED_FUNCTION_14_0();
    v9();
    id v10 = sub_25D3B3080(v3, (void *)(v0 + 272));
    __swift_destroy_boxed_opaque_existential_0(v0 + 272);
    uint64_t v11 = *(void (**)(void))(v4 + 8);
    ((void (*)(uint64_t, uint64_t))v11)(v3, v5);
    *(void *)(v0 + 576) = v10;
    unint64_t v12 = sub_25D179AD8();
    sub_25D53D720();
    uint64_t v20 = *(void *)(v0 + 680);
    uint64_t v21 = *(void *)(v0 + 616);

    OUTLINED_FUNCTION_28_44();
    v22();
    __swift_project_boxed_opaque_existential_0(v85, *(void *)(v94 + 40));
    OUTLINED_FUNCTION_14_0();
    v23();
    id v24 = sub_25D3B3080(v21, (void *)(v0 + 352));
    __swift_destroy_boxed_opaque_existential_0(v0 + 352);
    OUTLINED_FUNCTION_8_5();
    v11();
    *(void *)(v0 + 560) = v24;
    OUTLINED_FUNCTION_83_11();
    if (v20)
    {
      uint64_t v25 = *(void *)(v0 + 688);
      uint64_t v26 = *(void *)(v0 + 632);
      uint64_t v27 = *(void *)(v0 + 624);

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    }
    else
    {
      uint64_t v28 = *(void *)(v0 + 672);
      OUTLINED_FUNCTION_80_10();
      OUTLINED_FUNCTION_28_44();
      uint64_t v30 = v29();
      uint64_t v38 = OUTLINED_FUNCTION_2_74(v30, v31, v32, v33, v34, v35, v36, v37, v75, (uint64_t)v11, v12, v82, v85, v88, v91, v94);
      v39(v38);
      id v40 = OUTLINED_FUNCTION_467();
      __swift_destroy_boxed_opaque_existential_0(v0 + 72);
      OUTLINED_FUNCTION_8_5();
      v41();
      *(void *)(v0 + 544) = v40;
      OUTLINED_FUNCTION_83_11();
      if (v28)
      {
        uint64_t v42 = *(void *)(v0 + 632);

        uint64_t v43 = *(void (**)(void))(v42 + 8);
        OUTLINED_FUNCTION_19_5();
        v43();
        OUTLINED_FUNCTION_19_5();
        v43();
      }
      else
      {
        OUTLINED_FUNCTION_80_10();
        OUTLINED_FUNCTION_28_44();
        uint64_t v45 = v44();
        uint64_t v53 = OUTLINED_FUNCTION_2_74(v45, v46, v47, v48, v49, v50, v51, v52, v76, v78, v80, v83, v86, v89, v92, v95);
        v54(v53);
        id v55 = OUTLINED_FUNCTION_467();
        __swift_destroy_boxed_opaque_existential_0(v0 + 432);
        OUTLINED_FUNCTION_8_5();
        v56();
        *(void *)(v0 + 536) = v55;
        OUTLINED_FUNCTION_60_20();
        if (v0 == -536)
        {
          OUTLINED_FUNCTION_80_10();
          OUTLINED_FUNCTION_28_44();
          uint64_t v60 = v59();
          uint64_t v68 = OUTLINED_FUNCTION_2_74(v60, v61, v62, v63, v64, v65, v66, v67, v77, v79, v81, v84, v87, v90, v93, v96);
          v69(v68);
          id v70 = OUTLINED_FUNCTION_467();
          __swift_destroy_boxed_opaque_existential_0(-64);
          OUTLINED_FUNCTION_8_5();
          v71();
          MEMORY[0x10] = v70;
          OUTLINED_FUNCTION_60_20();
          uint64_t v72 = MEMORY[0x60];

          uint64_t v58 = *(void (**)(void))(v72 + 8);
          OUTLINED_FUNCTION_8_64();
          v58();
          OUTLINED_FUNCTION_8_64();
          v58();
          OUTLINED_FUNCTION_8_64();
          v58();
          OUTLINED_FUNCTION_8_64();
        }
        else
        {
          uint64_t v57 = *(void *)(v0 + 632);

          uint64_t v58 = *(void (**)(void))(v57 + 8);
          OUTLINED_FUNCTION_2_30();
          v58();
          OUTLINED_FUNCTION_2_30();
          v58();
          OUTLINED_FUNCTION_2_30();
        }
        v58();
      }
    }
    __swift_destroy_boxed_opaque_existential_0(v97);
  }
  else
  {
    sub_25D196E70(v0 + 112, &qword_26A66FE28);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25D53DC10();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_84_0(v13, (uint64_t)qword_26A688F10);
    os_log_type_t v15 = sub_25D53E7C0();
    if (OUTLINED_FUNCTION_55_1(v15))
    {
      uint64_t v16 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v16);
      OUTLINED_FUNCTION_3_2(&dword_25D16D000, v17, v18, "#ReplyOfferFlowStrategy no component to reply to");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D194BF4();
    swift_allocError();
    OUTLINED_FUNCTION_24_6(v19, 0xD000000000000030);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v73();
}

uint64_t sub_25D525304()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_102_5();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 712) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_486();
  if (!v0) {
    *(void *)(v4 + 720) = v1;
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D525408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_67();
  uint64_t v27 = v16[84];
  uint64_t v28 = v16[80];
  uint64_t v29 = v16[77];
  uint64_t v17 = *(void (**)(void))(v16[79] + 8);
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  OUTLINED_FUNCTION_19_5();
  v17();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v16 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_43_0();
  return v20(v18, v19, v20, v21, v22, v23, v24, v25, a9, v27, v16 + 24, v28, v29, a14, a15, a16);
}

uint64_t sub_25D525564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_81_8();
  uint64_t v13 = *(void (**)(void))(*(void *)(v12 + 632) + 8);
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  OUTLINED_FUNCTION_18_1();
  v13();
  __swift_destroy_boxed_opaque_existential_0(v12 + 192);
  OUTLINED_FUNCTION_81_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_79();
  return v15(v14, v15, v16, v17, v18, v19, v20, v21, v12 + 192, a10, a11, a12);
}

uint64_t sub_25D525684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a8;
  v8[10] = v11;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v8[11] = swift_task_alloc();
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D525770, 0, 0);
}

uint64_t sub_25D525770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_12_62();
  OUTLINED_FUNCTION_36_44();
  uint64_t v21 = *(void (**)(void))(v20 + 16);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v16, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(a13, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  OUTLINED_FUNCTION_15_1(a14);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v15 + 136) = v22;
  *uint64_t v22 = v15;
  v22[1] = sub_25D5258EC;
  OUTLINED_FUNCTION_44_31();
  OUTLINED_FUNCTION_15();
  return sub_25D529584();
}

uint64_t sub_25D5258EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v16 = v15;
  uint64_t v18 = v17[16];
  uint64_t v19 = v17[15];
  uint64_t v20 = v17[14];
  uint64_t v21 = v17[13];
  uint64_t v22 = v17[12];
  uint64_t v23 = v17[11];
  uint64_t v24 = *v13;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v25 = v24;
  *(void *)(v15 + 144) = v12;
  swift_task_dealloc();
  sub_25D196E70(v23, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v22, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v21, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v20, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v19, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v18, (uint64_t *)&unk_26A6719E0);
  if (v12)
  {
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_79();
    return MEMORY[0x270FA2498](v26, v27, v28);
  }
  else
  {
    OUTLINED_FUNCTION_71_15();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_79();
    return v31(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12);
  }
}

uint64_t sub_25D525AE4()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v1(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_25D525B78()
{
  OUTLINED_FUNCTION_14();
  v1[30] = v2;
  v1[31] = v0;
  OUTLINED_FUNCTION_4_11();
  v1[32] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v4);
  v1[33] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D5397D0();
  OUTLINED_FUNCTION_17_0(v5);
  v1[34] = OUTLINED_FUNCTION_92();
  uint64_t v6 = sub_25D53A2F0();
  v1[35] = v6;
  OUTLINED_FUNCTION_11_0(v6);
  v1[36] = v7;
  v1[37] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25D525C50()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v1 = *(void *)(v0[31] + 64);
  v0[38] = v1;
  OUTLINED_FUNCTION_35_4();
  sub_25D3B5938(*(void *)(v1 + 24), (uint64_t)(v0 + 2));
  uint64_t v2 = v0[5];
  sub_25D196E70((uint64_t)(v0 + 2), &qword_26A66FE28);
  if (v2)
  {
    v0[39] = *(void *)(v1 + 128);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[40] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25D525E30;
    return sub_25D526634();
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25D53DC10();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_84_0(v5, (uint64_t)qword_26A688F10);
    os_log_type_t v7 = sub_25D53E7C0();
    if (OUTLINED_FUNCTION_55_1(v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v8);
      OUTLINED_FUNCTION_3_2(&dword_25D16D000, v9, v10, "#ReplyOfferFlowStrategy no component to reply to");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D194BF4();
    swift_allocError();
    OUTLINED_FUNCTION_24_6(v11, 0xD000000000000030);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    return v12();
  }
}

uint64_t sub_25D525E30()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 328) = v4;
  *(void *)(v2 + 336) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25D525F14()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  uint64_t v1 = v0[38];
  sub_25D539780();
  sub_25D53A1F0();
  sub_25D53A240();
  sub_25D53A2A0();
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain_n();
    do
    {
      sub_25D17DB88(v5, (uint64_t)(v0 + 7));
      __swift_project_boxed_opaque_existential_0(v0 + 7, v0[10]);
      uint64_t v6 = OUTLINED_FUNCTION_1_38();
      v7(v6);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
      sub_25D385CAC();
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease_n();
    uint64_t v3 = v15;
  }
  v0[43] = v3;
  uint64_t v8 = v0[31];
  sub_25D53D300();
  v0[44] = v9;
  __swift_project_boxed_opaque_existential_0((void *)(v8 + 16), *(void *)(v8 + 40));
  OUTLINED_FUNCTION_14_0();
  v10();
  OUTLINED_FUNCTION_101_9();
  v0[20] = &type metadata for MessagesFeatureFlagsImpl;
  v0[21] = &off_270A46BB0;
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  v0[45] = v11;
  *uint64_t v11 = v12;
  v11[1] = sub_25D526118;
  OUTLINED_FUNCTION_59_0();
  return sub_25D37F40C();
}

uint64_t sub_25D526118()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 96;
  uint64_t v4 = v1 + 136;
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v4);
  __swift_destroy_boxed_opaque_existential_0(v3);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D526234()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = v0[31];
  uint64_t v2 = sub_25D539C30();
  OUTLINED_FUNCTION_96_12(v2);
  sub_25D539C70();
  swift_allocObject();
  v0[46] = sub_25D539C60();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 16), *(void *)(v1 + 40));
  OUTLINED_FUNCTION_14_0();
  v3();
  char v4 = OUTLINED_FUNCTION_97_10();
  swift_task_alloc();
  OUTLINED_FUNCTION_38_0();
  v0[47] = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_25D526364;
  uint64_t v7 = v0[41];
  uint64_t v8 = v0[39];
  uint64_t v9 = v0[37];
  uint64_t v10 = v0[30];
  return sub_25D49DA78(v10, v7, v9, v8, v4 & 1);
}

uint64_t sub_25D526364()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  *char v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v6 = v5;
  *(void *)(v3 + 384) = v0;
  swift_task_dealloc();
  swift_release();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v3 + 176);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D52645C()
{
  OUTLINED_FUNCTION_31_0();

  swift_release();
  OUTLINED_FUNCTION_19_5();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v2();
}

uint64_t sub_25D526508()
{
  OUTLINED_FUNCTION_35_1();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D526588()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();

  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_62_20();
  v2(v1);
  __swift_destroy_boxed_opaque_existential_0(v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_26_2();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D526634()
{
  OUTLINED_FUNCTION_14();
  v1[128] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v2);
  v1[129] = OUTLINED_FUNCTION_92();
  uint64_t v3 = sub_25D53D630();
  v1[130] = v3;
  OUTLINED_FUNCTION_11_0(v3);
  v1[131] = v4;
  v1[132] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D53D0A0();
  v1[133] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v1[134] = v6;
  v1[135] = OUTLINED_FUNCTION_24_0();
  v1[136] = swift_task_alloc();
  v1[137] = swift_task_alloc();
  v1[138] = swift_task_alloc();
  v1[139] = swift_task_alloc();
  v1[140] = swift_task_alloc();
  v1[141] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_25D52675C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 1024) + 64);
  OUTLINED_FUNCTION_35_4();
  sub_25D3B5938(*(void *)(v1 + 24), v0 + 432);
  if (*(void *)(v0 + 456))
  {
    sub_25D188958((long long *)(v0 + 432), v0 + 792);
    sub_25D52A14C();
    sub_25D17DB88(v0 + 792, v0 + 392);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F200);
    if (swift_dynamicCast())
    {
      uint64_t v2 = *(void **)(v0 + 336);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v3 = *(void *)(v0 + 1056);
    uint64_t v4 = *(void *)(v0 + 1048);
    uint64_t v5 = *(void *)(v0 + 1040);
    uint64_t v6 = *(void *)(v0 + 1024);
    sub_25D17DB88(v0 + 792, v0 + 472);
    uint64_t v7 = swift_retain();
    sub_25D4BEC50(v7, v0 + 472);
    swift_release();
    sub_25D196E70(v0 + 472, &qword_26A66FE28);
    OUTLINED_FUNCTION_100_3();
    v8();
    uint64_t v43 = (void *)(v6 + 16);
    uint64_t v44 = v6;
    __swift_project_boxed_opaque_existential_0((void *)(v6 + 16), *(void *)(v6 + 40));
    OUTLINED_FUNCTION_14_0();
    v9();
    id v10 = sub_25D3B3080(v3, (void *)(v0 + 512));
    __swift_destroy_boxed_opaque_existential_0(v0 + 512);
    uint64_t v11 = *(void (**)(void))(v4 + 8);
    ((void (*)(uint64_t, uint64_t))v11)(v3, v5);
    *(void *)(v0 + 1008) = v10;
    sub_25D179AD8();
    sub_25D53D720();
    uint64_t v19 = *(void *)(v0 + 1120);
    uint64_t v20 = *(void *)(v0 + 1056);

    OUTLINED_FUNCTION_100_3();
    v21();
    __swift_project_boxed_opaque_existential_0(v43, *(void *)(v44 + 40));
    OUTLINED_FUNCTION_14_0();
    v22();
    id v23 = sub_25D3B3080(v20, (void *)(v0 + 592));
    __swift_destroy_boxed_opaque_existential_0(v0 + 592);
    OUTLINED_FUNCTION_86_11();
    OUTLINED_FUNCTION_8_5();
    v11();
    *(void *)(v0 + 1000) = v23;
    OUTLINED_FUNCTION_84_10();
    if (v19)
    {

      uint64_t v24 = OUTLINED_FUNCTION_82_10();
      v25(v24);
    }
    else
    {
      uint64_t v26 = *(void *)(v0 + 1056);

      OUTLINED_FUNCTION_100_3();
      v27();
      __swift_project_boxed_opaque_existential_0(v43, *(void *)(v44 + 40));
      OUTLINED_FUNCTION_14_0();
      v28();
      id v29 = sub_25D3B3080(v26, (void *)(v0 + 672));
      __swift_destroy_boxed_opaque_existential_0(v0 + 672);
      OUTLINED_FUNCTION_86_11();
      OUTLINED_FUNCTION_8_5();
      v11();
      *(void *)(v0 + 992) = v29;
      OUTLINED_FUNCTION_84_10();
      if (v0 == -672)
      {
        uint64_t v35 = MEMORY[0x180];

        OUTLINED_FUNCTION_100_3();
        v36();
        __swift_project_boxed_opaque_existential_0(v43, *(void *)(v44 + 40));
        OUTLINED_FUNCTION_14_0();
        v37();
        id v38 = sub_25D3B3080(v35, (void *)0x50);
        __swift_destroy_boxed_opaque_existential_0(80);
        OUTLINED_FUNCTION_86_11();
        OUTLINED_FUNCTION_8_5();
        v11();
        MEMORY[0x158] = v38;
        OUTLINED_FUNCTION_84_10();
        uint64_t v39 = MEMORY[0x190];

        id v40 = *(void (**)(void))(v39 + 8);
        OUTLINED_FUNCTION_19_5();
        v40();
        OUTLINED_FUNCTION_19_5();
        v40();
        OUTLINED_FUNCTION_19_5();
        v40();
      }
      else
      {
        uint64_t v30 = *(void *)(v0 + 1128);
        uint64_t v31 = *(void *)(v0 + 1072);
        uint64_t v32 = *(void *)(v0 + 1064);

        uint64_t v33 = *(void (**)(uint64_t))(v31 + 8);
        uint64_t v34 = OUTLINED_FUNCTION_62_20();
        v33(v34);
        ((void (*)(uint64_t, uint64_t))v33)(v30, v32);
      }
    }
    __swift_destroy_boxed_opaque_existential_0(v0 + 792);
  }
  else
  {
    sub_25D196E70(v0 + 432, &qword_26A66FE28);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25D53DC10();
    uint64_t v13 = (void *)OUTLINED_FUNCTION_84_0(v12, (uint64_t)qword_26A688F10);
    os_log_type_t v14 = sub_25D53E7C0();
    if (OUTLINED_FUNCTION_55_1(v14))
    {
      uint64_t v15 = (_WORD *)OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_54_0(v15);
      OUTLINED_FUNCTION_3_2(&dword_25D16D000, v16, v17, "#ReplyOfferFlowStrategy no component to reply to");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D194BF4();
    swift_allocError();
    OUTLINED_FUNCTION_24_6(v18, 0xD000000000000030);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_269_0();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_25D527420()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_102_5();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 1152) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_486();
  if (!v0) {
    *(void *)(v4 + 1160) = v1;
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

#error "25D52768C: call analysis failed (funcsize=125)"

uint64_t sub_25D52772C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  uint64_t v13 = *(void (**)(void))(*(void *)(v12 + 1072) + 8);
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  __swift_destroy_boxed_opaque_existential_0(v12 + 792);
  OUTLINED_FUNCTION_21_50();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_79();
  return v15(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
}

uint64_t sub_25D527840()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_102_5();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 1184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_486();
  if (!v0) {
    *(void *)(v4 + 1192) = v1;
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

#error "25D527AC8: call analysis failed (funcsize=132)"

uint64_t sub_25D527B68()
{
  uint64_t v1 = *(void *)(v0 + 1072);
  sub_25D1796C8(v0 + 176);
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  OUTLINED_FUNCTION_25_5();
  v2();
  __swift_destroy_boxed_opaque_existential_0(v0 + 792);
  OUTLINED_FUNCTION_21_50();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v3();
}

uint64_t sub_25D527CD4()
{
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_102_5();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 1216) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_486();
  if (!v0) {
    *(void *)(v4 + 1224) = v1;
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_26_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

#error "25D527F40: call analysis failed (funcsize=125)"

uint64_t sub_25D527FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  uint64_t v13 = *(void (**)(void))(*(void *)(v12 + 1072) + 8);
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  OUTLINED_FUNCTION_8_64();
  v13();
  __swift_destroy_boxed_opaque_existential_0(v12 + 792);
  OUTLINED_FUNCTION_21_50();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_79();
  return v15(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
}

uint64_t sub_25D5280F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a8;
  v8[10] = v11;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v8[11] = swift_task_alloc();
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D5281E0, 0, 0);
}

uint64_t sub_25D5281E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_12_62();
  OUTLINED_FUNCTION_36_44();
  uint64_t v21 = *(void (**)(void))(v20 + 16);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v16, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(a13, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  OUTLINED_FUNCTION_15_1(a14);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v15 + 136) = v22;
  *uint64_t v22 = v15;
  v22[1] = sub_25D52835C;
  OUTLINED_FUNCTION_44_31();
  OUTLINED_FUNCTION_15();
  return sub_25D529A24();
}

uint64_t sub_25D52835C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v16 = v15;
  uint64_t v18 = v17[16];
  uint64_t v19 = v17[15];
  uint64_t v20 = v17[14];
  uint64_t v21 = v17[13];
  uint64_t v22 = v17[12];
  uint64_t v23 = v17[11];
  uint64_t v24 = *v13;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v25 = v24;
  *(void *)(v15 + 144) = v12;
  swift_task_dealloc();
  sub_25D196E70(v23, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v22, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v21, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v20, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v19, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v18, (uint64_t *)&unk_26A6719E0);
  if (v12)
  {
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_79();
    return MEMORY[0x270FA2498](v26, v27, v28);
  }
  else
  {
    OUTLINED_FUNCTION_71_15();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_79();
    return v31(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12);
  }
}

uint64_t sub_25D528554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = v11;
  v8[11] = v12;
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D52864C, 0, 0);
}

uint64_t sub_25D52864C()
{
  OUTLINED_FUNCTION_35_2();
  uint64_t v2 = v1[17];
  uint64_t v3 = v1[18];
  uint64_t v5 = v1[15];
  uint64_t v4 = v1[16];
  uint64_t v11 = v1[14];
  uint64_t v12 = v1[13];
  uint64_t v13 = v1[12];
  sub_25D53D0A0();
  OUTLINED_FUNCTION_36_44();
  uint64_t v7 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v3);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v2);
  OUTLINED_FUNCTION_35_35();
  v7();
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v0);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v5);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v11);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v12);
  OUTLINED_FUNCTION_35_35();
  v7();
  OUTLINED_FUNCTION_15_1(v13);
  uint64_t v8 = (void *)swift_task_alloc();
  v1[19] = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_25D528820;
  OUTLINED_FUNCTION_15();
  return sub_25D5290AC();
}

uint64_t sub_25D528820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_6_0();
  *uint64_t v16 = v15;
  uint64_t v39 = v17[18];
  uint64_t v18 = v17[17];
  uint64_t v19 = v17[16];
  uint64_t v20 = v17[15];
  uint64_t v21 = v17[14];
  uint64_t v22 = v17[13];
  uint64_t v23 = v17[12];
  uint64_t v24 = *v13;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v25 = v24;
  *(void *)(v15 + 160) = v12;
  swift_task_dealloc();
  sub_25D196E70(v23, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v22, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v21, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v20, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v19, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v18, (uint64_t *)&unk_26A6719E0);
  sub_25D196E70(v39, (uint64_t *)&unk_26A6719E0);
  if (v12)
  {
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_79();
    return MEMORY[0x270FA2498](v26, v27, v28);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_79();
    return v31(v30, v31, v32, v33, v34, v35, v36, v37, v39, a10, a11, a12);
  }
}

uint64_t sub_25D528A54()
{
  OUTLINED_FUNCTION_31_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v0();
}

uint64_t sub_25D528AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a8;
  v8[10] = v11;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  v8[11] = swift_task_alloc();
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25D528BE8, 0, 0);
}

uint64_t sub_25D528BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_12_62();
  OUTLINED_FUNCTION_36_44();
  uint64_t v21 = *(void (**)(void))(v20 + 16);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(v16, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  __swift_storeEnumTagSinglePayload(a13, 0, 1, v14);
  OUTLINED_FUNCTION_4_73();
  v21();
  OUTLINED_FUNCTION_15_1(a14);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v15 + 136) = v22;
  *uint64_t v22 = v15;
  v22[1] = sub_25D52835C;
  OUTLINED_FUNCTION_44_31();
  OUTLINED_FUNCTION_15();
  return sub_25D528D64();
}

uint64_t sub_25D528D64()
{
  OUTLINED_FUNCTION_14();
  uint64_t v9 = OUTLINED_FUNCTION_66_16(v1, v2, v3, v4, v5, v6, v7, v8);
  v0[16] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[17] = v10;
  v0[18] = OUTLINED_FUNCTION_92();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v11);
  v0[19] = OUTLINED_FUNCTION_24_0();
  v0[20] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25D528E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_67();
  uint64_t v47 = OUTLINED_FUNCTION_43_30();
  uint64_t v48 = v25;
  sub_25D53E2C0();
  uint64_t v26 = sub_25D53D0A0();
  uint64_t v27 = OUTLINED_FUNCTION_95_10(v26);
  uint64_t v28 = type metadata accessor for SearchForMessagesOfferReplyParameters(v27);
  OUTLINED_FUNCTION_87_11(v28);
  sub_25D179B80(v21, v23);
  sub_25D179B80(v20, v23 + v22[16]);
  sub_25D179B80(v17, v23 + v22[15]);
  sub_25D179B80(v24, v23 + v22[7]);
  sub_25D179B80(a11, v23 + v22[13]);
  sub_25D179B80(a12, v23 + v22[14]);
  __swift_project_boxed_opaque_existential_0((void *)(v16 + 16), *(void *)(v16 + 40));
  OUTLINED_FUNCTION_14_0();
  v29();
  char v30 = OUTLINED_FUNCTION_41_29(v19);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  if (v30)
  {
    OUTLINED_FUNCTION_33_37(*(void **)(v18 + 112));
    OUTLINED_FUNCTION_57_27();
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v18 + 184) = v31;
    *uint64_t v31 = v18;
    v31[1] = sub_25D528FE4;
    OUTLINED_FUNCTION_69_19();
    OUTLINED_FUNCTION_43_0();
    return sub_25D42DDC8(v32, v33, v34, v35, v36);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_43_0();
    return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, v47, a11, a12, v48, a14, a15, a16);
  }
}

uint64_t sub_25D528FE4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D5290AC()
{
  OUTLINED_FUNCTION_14();
  v1[15] = v18;
  v1[16] = v0;
  v1[13] = v2;
  v1[14] = v3;
  v1[11] = v4;
  v1[12] = v5;
  v1[9] = v6;
  v1[10] = v7;
  v1[7] = v8;
  v1[8] = v9;
  uint64_t v10 = sub_25D53D650();
  v1[17] = v10;
  OUTLINED_FUNCTION_11_0(v10);
  v1[18] = v11;
  v1[19] = OUTLINED_FUNCTION_92();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v12);
  v1[20] = OUTLINED_FUNCTION_24_0();
  v1[21] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_25D529180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_35_2();
  uint64_t v19 = *(void *)(v18 + 168);
  uint64_t v20 = *(void **)(v18 + 128);
  uint64_t v50 = *(void *)(v18 + 104);
  uint64_t v51 = *(void *)(v18 + 112);
  uint64_t v21 = *(void *)(v18 + 88);
  uint64_t v49 = *(void *)(v18 + 96);
  uint64_t v23 = *(void *)(v18 + 72);
  uint64_t v22 = *(void *)(v18 + 80);
  uint64_t v25 = *(void *)(v18 + 56);
  uint64_t v24 = *(void *)(v18 + 64);
  uint64_t v47 = v20[8];
  uint64_t v48 = sub_25D529E60(v47);
  uint64_t v52 = v26;
  sub_25D53E2C0();
  uint64_t v27 = sub_25D53D0A0();
  *(void *)(v18 + 176) = v27;
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v27);
  uint64_t v28 = (int *)type metadata accessor for SearchForMessagesOfferReplyParameters(0);
  *(void *)(v18 + 184) = v28;
  sub_25D179B18(v19, v25 + v28[6]);
  sub_25D179B80(v24, v25);
  sub_25D179B80(v23, v25 + v28[16]);
  sub_25D179B80(v22, v25 + v28[15]);
  sub_25D179B80(v21, v25 + v28[7]);
  sub_25D179B80(v49, v25 + v28[13]);
  sub_25D179B80(v50, v25 + v28[14]);
  sub_25D179B80(v51, v25 + v28[12]);
  __swift_project_boxed_opaque_existential_0(v20 + 2, v20[5]);
  OUTLINED_FUNCTION_14_0();
  v29();
  LOBYTE(v20) = OUTLINED_FUNCTION_41_29((void *)(v18 + 16));
  __swift_destroy_boxed_opaque_existential_0(v18 + 16);
  if (v20)
  {
    OUTLINED_FUNCTION_33_37(*(void **)(v18 + 120));
    OUTLINED_FUNCTION_57_27();
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v18 + 192) = v30;
    *char v30 = v31;
    v30[1] = sub_25D5293C8;
    OUTLINED_FUNCTION_15();
    return sub_25D42DDC8(v32, v33, v34, v35, v36);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_15();
    return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, v47, v48, v49, v50, v51, v52, a16, a17, a18);
  }
}

uint64_t sub_25D5293C8()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D529490()
{
  OUTLINED_FUNCTION_31_0();
  sub_25D53D720();
  OUTLINED_FUNCTION_8_5();
  v0();
  OUTLINED_FUNCTION_38_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v1();
}

uint64_t sub_25D529584()
{
  OUTLINED_FUNCTION_14();
  v1[13] = v2;
  v1[14] = v0;
  v1[11] = v3;
  v1[12] = v4;
  v1[9] = v5;
  v1[10] = v6;
  v1[7] = v7;
  v1[8] = v8;
  uint64_t v9 = sub_25D53D650();
  v1[15] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v1[16] = v10;
  v1[17] = OUTLINED_FUNCTION_92();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v11);
  v1[18] = OUTLINED_FUNCTION_24_0();
  v1[19] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25D52964C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_67();
  uint64_t v17 = *(void *)(v16 + 152);
  uint64_t v18 = *(void **)(v16 + 112);
  uint64_t v19 = *(void *)(v16 + 88);
  uint64_t v47 = *(void *)(v16 + 96);
  uint64_t v20 = *(void *)(v16 + 72);
  uint64_t v21 = *(void *)(v16 + 80);
  uint64_t v23 = *(void *)(v16 + 56);
  uint64_t v22 = *(void *)(v16 + 64);
  uint64_t v45 = v18[8];
  uint64_t v46 = sub_25D529E60(v45);
  uint64_t v48 = v24;
  sub_25D53E2C0();
  uint64_t v25 = sub_25D53D0A0();
  *(void *)(v16 + 160) = v25;
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v25);
  uint64_t Parameters = (int *)type metadata accessor for SearchForMessagesOfferFullMessageReadParameters(0);
  *(void *)(v16 + 168) = Parameters;
  sub_25D179B18(v17, v23 + Parameters[6]);
  sub_25D179B80(v22, v23);
  sub_25D179B80(v20, v23 + Parameters[13]);
  sub_25D179B80(v21, v23 + Parameters[11]);
  sub_25D179B80(v19, v23 + Parameters[9]);
  sub_25D179B80(v47, v23 + Parameters[10]);
  __swift_project_boxed_opaque_existential_0(v18 + 2, v18[5]);
  OUTLINED_FUNCTION_14_0();
  v27();
  LOBYTE(v18) = OUTLINED_FUNCTION_41_29((void *)(v16 + 16));
  __swift_destroy_boxed_opaque_existential_0(v16 + 16);
  if (v18)
  {
    OUTLINED_FUNCTION_33_37(*(void **)(v16 + 104));
    OUTLINED_FUNCTION_57_27();
    swift_task_alloc();
    OUTLINED_FUNCTION_38_0();
    *(void *)(v16 + 176) = v28;
    *uint64_t v28 = v29;
    v28[1] = sub_25D529868;
    OUTLINED_FUNCTION_43_0();
    return sub_25D42DDC8(v30, v31, v32, v33, v34);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_43_0();
    return v38(v37, v38, v39, v40, v41, v42, v43, v44, a9, v45, v46, v47, v48, a14, a15, a16);
  }
}

uint64_t sub_25D529868()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D529930()
{
  OUTLINED_FUNCTION_31_0();
  sub_25D53D720();
  OUTLINED_FUNCTION_8_5();
  v0();
  OUTLINED_FUNCTION_38_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v1();
}

uint64_t sub_25D529A24()
{
  OUTLINED_FUNCTION_14();
  uint64_t v9 = OUTLINED_FUNCTION_66_16(v1, v2, v3, v4, v5, v6, v7, v8);
  v0[16] = v9;
  OUTLINED_FUNCTION_11_0(v9);
  v0[17] = v10;
  v0[18] = OUTLINED_FUNCTION_92();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719E0);
  OUTLINED_FUNCTION_17_0(v11);
  v0[19] = OUTLINED_FUNCTION_24_0();
  v0[20] = swift_task_alloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25D529AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_67();
  uint64_t v47 = OUTLINED_FUNCTION_43_30();
  uint64_t v48 = v25;
  sub_25D53E2C0();
  uint64_t v26 = sub_25D53D0A0();
  uint64_t v27 = OUTLINED_FUNCTION_95_10(v26);
  uint64_t v28 = type metadata accessor for SearchForMessagesOfferMultilingualReplyParameters(v27);
  OUTLINED_FUNCTION_87_11(v28);
  sub_25D179B80(v21, v23);
  sub_25D179B80(v20, v23 + v22[15]);
  sub_25D179B80(v17, v23 + v22[14]);
  sub_25D179B80(v24, v23 + v22[7]);
  sub_25D179B80(a11, v23 + v22[12]);
  sub_25D179B80(a12, v23 + v22[13]);
  __swift_project_boxed_opaque_existential_0((void *)(v16 + 16), *(void *)(v16 + 40));
  OUTLINED_FUNCTION_14_0();
  v29();
  char v30 = OUTLINED_FUNCTION_41_29(v19);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  if (v30)
  {
    OUTLINED_FUNCTION_33_37(*(void **)(v18 + 112));
    OUTLINED_FUNCTION_57_27();
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v18 + 184) = v31;
    *uint64_t v31 = v18;
    v31[1] = sub_25D529CA4;
    OUTLINED_FUNCTION_69_19();
    OUTLINED_FUNCTION_43_0();
    return sub_25D42DDC8(v32, v33, v34, v35, v36);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_43_0();
    return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, v47, a11, a12, v48, a14, a15, a16);
  }
}

uint64_t sub_25D529CA4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25D529D6C()
{
  OUTLINED_FUNCTION_31_0();
  sub_25D53D720();
  OUTLINED_FUNCTION_8_5();
  v0();
  OUTLINED_FUNCTION_38_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v1();
}

uint64_t sub_25D529E60(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672AF0);
  OUTLINED_FUNCTION_36_44();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_37_0();
  uint64_t v5 = *(void **)(a1 + 120);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v6, sel_spokenPhrase);
    uint64_t v8 = sub_25D53E200();

    return v8;
  }
  unint64_t v10 = *(void *)(a1 + 16);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25D53EEB0();
    swift_bridgeObjectRelease();
    if (v22 >= 2) {
      goto LABEL_6;
    }
    swift_bridgeObjectRetain();
    if (sub_25D53EEB0()) {
      goto LABEL_12;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25D53DC10();
    uint64_t v15 = OUTLINED_FUNCTION_84_0(v23, (uint64_t)qword_26A688F10);
    os_log_type_t v16 = sub_25D53E7C0();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_22;
    }
    uint64_t v24 = (_WORD *)OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_54_0(v24);
    uint64_t v18 = "#ReplyOfferFlowStrategy Unable to get personal conversation label";
    goto LABEL_21;
  }
  unint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v11 > 1)
  {
LABEL_6:
    sub_25D206C6C();
    uint64_t v8 = sub_25D53F1F0();
    uint64_t v13 = v12;
    sub_25D196E70(v2, (uint64_t *)&unk_26A672AF0);
    if (v13) {
      return v8;
    }
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25D53DC10();
    uint64_t v15 = OUTLINED_FUNCTION_84_0(v14, (uint64_t)qword_26A688F10);
    os_log_type_t v16 = sub_25D53E7C0();
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_22:

      return 0;
    }
    uint64_t v17 = (_WORD *)OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_54_0(v17);
    uint64_t v18 = "#ReplyOfferFlowStrategy Unable to get group conversation label";
LABEL_21:
    _os_log_impl(&dword_25D16D000, v15, v16, v18, v1, 2u);
    OUTLINED_FUNCTION_3_0();
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_17;
  }
LABEL_12:
  sub_25D1F2400(0, (v10 & 0xC000000000000001) == 0, v10);
  if ((v10 & 0xC000000000000001) != 0) {
    id v19 = (id)MEMORY[0x2611AC4C0](0, v10);
  }
  else {
    id v19 = *(id *)(v10 + 32);
  }
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v20, sel_displayName);

  uint64_t v8 = sub_25D53E200();
  return v8;
}

uint64_t sub_25D52A14C()
{
  uint64_t v2 = sub_25D538820();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_37_0();
  uint64_t v27 = &type metadata for Features;
  unint64_t v28 = sub_25D17981C();
  LOBYTE(v26) = 15;
  char v4 = sub_25D53AB40();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v26);
  if ((v4 & 1) == 0)
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25D53DC10();
    uint64_t v12 = (void *)OUTLINED_FUNCTION_84_0(v11, (uint64_t)qword_26A688F10);
    os_log_type_t v13 = sub_25D53E7C0();
    if (!OUTLINED_FUNCTION_29(v13)) {
      goto LABEL_16;
    }
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    os_log_type_t v16 = "#ReplyOfferFlowStrategy not specifying language as mulitlingual feature flag is off";
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)(v0 + 64);
  OUTLINED_FUNCTION_35_4();
  sub_25D3B5938(*(void *)(v5 + 24), (uint64_t)&v26);
  if (!v27)
  {
    sub_25D196E70((uint64_t)&v26, &qword_26A66FE28);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25D53DC10();
    uint64_t v12 = (void *)OUTLINED_FUNCTION_84_0(v17, (uint64_t)qword_26A688F10);
    os_log_type_t v18 = sub_25D53E7C0();
    if (!OUTLINED_FUNCTION_29(v18)) {
      goto LABEL_16;
    }
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    os_log_type_t v16 = "#ReplyOfferFlowStrategy no component to reply to";
LABEL_15:
    OUTLINED_FUNCTION_12_3(&dword_25D16D000, v14, v15, v16);
    OUTLINED_FUNCTION_3_0();
LABEL_16:

    return 0;
  }
  sub_25D188958(&v26, (uint64_t)v29);
  uint64_t v6 = *(void *)(v0 + 160);
  if (v6)
  {
    uint64_t v7 = v30;
    uint64_t v8 = v31;
    __swift_project_boxed_opaque_existential_0(v29, v30);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 32);
    swift_retain();
    v9(v7, v8);
    OUTLINED_FUNCTION_35_4();
    swift_bridgeObjectRetain();
    sub_25D218C24();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25D1EB6A4((uint64_t)v32, (uint64_t)v33);
    if (v33[32] != 255)
    {
      sub_25D1EB70C((uint64_t)v33, (uint64_t)v34);
      sub_25D1EB70C((uint64_t)v34, (uint64_t)v35);
      if (v35[32] == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25D1C1BBC(v6 + 152, (uint64_t)&v26);
        long long v24 = xmmword_25D544C30;
        char v25 = 4;
        sub_25D538810();
        sub_25D1DEFFC((uint64_t)&v24, v1);
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
        sub_25D17DEF8((uint64_t)&v26);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
        return 1;
      }
      sub_25D1EB768((uint64_t)v32);
    }
    swift_release();
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25D53DC10();
    uint64_t v20 = (void *)OUTLINED_FUNCTION_84_0(v19, (uint64_t)qword_26A688F10);
    os_log_type_t v21 = sub_25D53E7C0();
    if (OUTLINED_FUNCTION_29(v21))
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_12_3(&dword_25D16D000, v22, v23, "#ReplyOfferFlowStrategy conversationManager is nil, cannot specify message language");
      OUTLINED_FUNCTION_3_0();
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  return 0;
}

uint64_t sub_25D52A54C()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 80);
  __swift_destroy_boxed_opaque_existential_0(v0 + 120);
  return swift_release();
}

uint64_t sub_25D52A594()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 80);
  __swift_destroy_boxed_opaque_existential_0(v0 + 120);
  swift_release();
  return v0;
}

uint64_t sub_25D52A5DC()
{
  sub_25D52A594();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ReplyOfferFlowStrategy()
{
  return self;
}

uint64_t sub_25D52A634()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_25D52A658(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 240) + **(int **)(*(void *)v1 + 240));
  char v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *char v4 = v2;
  v4[1] = sub_25D1799C8;
  return v6(a1);
}

uint64_t sub_25D52A760(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 224) + **(int **)(*(void *)v1 + 224));
  char v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *char v4 = v2;
  v4[1] = sub_25D179DEC;
  return v6(a1);
}

uint64_t sub_25D52A868()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_121();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_80(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D179DEC;
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_59_0();
  return sub_25D528AFC(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D52A904()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_80(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D179DEC;
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_59_0();
  return sub_25D528554(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D52A9B4()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_121();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_80(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D179DEC;
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_59_0();
  return sub_25D5280F4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D52AA50()
{
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_121();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_80(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25D1799C8;
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_59_0();
  return sub_25D525684(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t OUTLINED_FUNCTION_2_74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16 = *(void *)(a16 + 40);
  __swift_project_boxed_opaque_existential_0(a13, v16);
  return v16;
}

uint64_t OUTLINED_FUNCTION_3_73()
{
  return *(void *)(v0 + 1088);
}

uint64_t OUTLINED_FUNCTION_12_62()
{
  return sub_25D53D0A0();
}

uint64_t OUTLINED_FUNCTION_21_50()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33_37(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_38_34()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  uint64_t v4 = v3 + *(int *)(v2 + 20);
  return sub_25D179B18(v0, v4);
}

uint64_t OUTLINED_FUNCTION_41_29(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, v1);
  return sub_25D539720();
}

uint64_t OUTLINED_FUNCTION_43_30()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 120) + 64);
  return sub_25D529E60(v2);
}

uint64_t OUTLINED_FUNCTION_44_31()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_45_33()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_46_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __swift_destroy_boxed_opaque_existential_0(a9);
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_55_24(uint64_t a1)
{
  *(void *)(v1 + 984) = a1;
  return sub_25D53EA80();
}

void OUTLINED_FUNCTION_56_28(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_57_27()
{
  return sub_25D4701EC(v0);
}

uint64_t OUTLINED_FUNCTION_60_20()
{
  return sub_25D53D720();
}

uint64_t OUTLINED_FUNCTION_62_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_66_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[14] = a8;
  v9[15] = v8;
  v9[12] = a6;
  v9[13] = a7;
  v9[10] = a4;
  v9[11] = a5;
  v9[8] = a2;
  v9[9] = a3;
  v9[7] = a1;
  return sub_25D53D650();
}

uint64_t OUTLINED_FUNCTION_69_19()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_71_15()
{
  return swift_task_dealloc();
}

__n128 OUTLINED_FUNCTION_73_13()
{
  return v0[68];
}

uint64_t OUTLINED_FUNCTION_74_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return sub_25D19E114(v6, v7, (uint64_t *)va);
}

void OUTLINED_FUNCTION_80_10()
{
}

uint64_t OUTLINED_FUNCTION_82_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_83_11()
{
  return sub_25D53D720();
}

uint64_t OUTLINED_FUNCTION_84_10()
{
  return sub_25D53D720();
}

uint64_t OUTLINED_FUNCTION_86_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_87_11(uint64_t a1)
{
  *(void *)(v2 + 176) = a1;
  uint64_t v5 = v3 + *(int *)(a1 + 24);
  return sub_25D179B18(v1, v5);
}

uint64_t OUTLINED_FUNCTION_95_10(uint64_t a1)
{
  *(void *)(v2 + 168) = a1;
  __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
  return 0;
}

uint64_t OUTLINED_FUNCTION_96_12(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
  return sub_25D53A260();
}

uint64_t OUTLINED_FUNCTION_97_10()
{
  __swift_project_boxed_opaque_existential_0(v0, v1);
  return sub_25D539720();
}

uint64_t OUTLINED_FUNCTION_101_9()
{
  __swift_project_boxed_opaque_existential_0(v0, v1);
  return sub_25D539670();
}

uint64_t sub_25D52B094(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A10);
  OUTLINED_FUNCTION_17_0(v3);
  v2[9] = OUTLINED_FUNCTION_92();
  uint64_t v4 = sub_25D539D70();
  v2[10] = v4;
  OUTLINED_FUNCTION_11_0(v4);
  v2[11] = v5;
  v2[12] = OUTLINED_FUNCTION_92();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v6);
  v2[13] = OUTLINED_FUNCTION_92();
  uint64_t v7 = sub_25D5397D0();
  OUTLINED_FUNCTION_17_0(v7);
  v2[14] = OUTLINED_FUNCTION_92();
  uint64_t v8 = sub_25D53A2F0();
  v2[15] = v8;
  OUTLINED_FUNCTION_11_0(v8);
  v2[16] = v9;
  v2[17] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25D52B1BC()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v1 = *(void *)(v0[8] + 160);
  if (v1 && (uint64_t v2 = *(void *)(v1 + 112), v0[18] = v2, (unint64_t)(v2 - 1) <= 1))
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[19] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25D52B378;
    return sub_25D5248D0();
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25D53DC10();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A688F10);
    uint64_t v6 = sub_25D53DC00();
    os_log_type_t v7 = sub_25D53E7B0();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v6, v7, "#SpokenReplyOfferFlowStrategy Not offering full read prompt for CarPlay announce. Returning empty output");
      OUTLINED_FUNCTION_3_0();
    }

    sub_25D539810();
    sub_25D539800();
    OUTLINED_FUNCTION_15_56();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    return v8();
  }
}

uint64_t sub_25D52B378()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 160) = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    return v6();
  }
  else
  {
    OUTLINED_FUNCTION_21();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
}

uint64_t sub_25D52B4C4()
{
  if (v0[18] == 2)
  {
    uint64_t v1 = (void *)v0[20];
    sub_25D52CFD0();
    uint64_t v2 = (void *)sub_25D53E4A0();
    objc_msgSend(v1, sel_setDialog_, v2);
  }
  uint64_t v3 = v0[13];
  sub_25D539770();
  sub_25D53A1F0();
  sub_25D53A240();
  sub_25D52BABC(v3);
  uint64_t v4 = sub_25D539C30();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v4);
  sub_25D53A260();
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25D53DC10();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A688F10);
  uint64_t v6 = sub_25D53DC00();
  os_log_type_t v7 = sub_25D53E7B0();
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    OUTLINED_FUNCTION_20_4(&dword_25D16D000, v6, v7, "#SpokenReplyOfferFlowStrategy update dimissal settings");
    OUTLINED_FUNCTION_3_0();
  }
  uint64_t v9 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v11 = v0[9];
  uint64_t v10 = v0[10];
  uint64_t v12 = (void *)v0[8];

  sub_25D539D80();
  sub_25D539D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v11, v8, v10);
  __swift_storeEnumTagSinglePayload(v11, 0, 1, v10);
  sub_25D53A270();
  sub_25D539C70();
  swift_allocObject();
  v0[21] = sub_25D539C60();
  uint64_t v13 = *(void *)(v12[8] + 128);
  v0[22] = v13;
  uint64_t v14 = v12[6];
  __swift_project_boxed_opaque_existential_0(v12 + 2, v12[5]);
  uint64_t v15 = *(void (**)(uint64_t))(v14 + 8);
  swift_retain();
  uint64_t v16 = OUTLINED_FUNCTION_37_3();
  v15(v16);
  __swift_project_boxed_opaque_existential_0(v0 + 2, v0[5]);
  OUTLINED_FUNCTION_37_3();
  char v17 = sub_25D539720();
  os_log_type_t v18 = (void *)swift_task_alloc();
  v0[23] = v18;
  void *v18 = v0;
  v18[1] = sub_25D52B7D4;
  uint64_t v19 = v0[20];
  uint64_t v20 = v0[17];
  uint64_t v21 = v0[7];
  return sub_25D49DA78(v21, v19, v20, v13, v17 & 1);
}

uint64_t sub_25D52B7D4()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v3 = v2;
  *(void *)(v2 + 192) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v2 + 16);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25D52B8FC()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120);

  OUTLINED_FUNCTION_40_5();
  v4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_15_56();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v5();
}

uint64_t sub_25D52B9C4()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v7();
}

uint64_t sub_25D52BABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25D53AD60();
  OUTLINED_FUNCTION_9_0();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v53 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v48 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v48 - v11;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25D53DC10();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A688F10);
  uint64_t v14 = sub_25D53DC00();
  os_log_type_t v15 = sub_25D53E7B0();
  if (os_log_type_enabled(v14, v15))
  {
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    OUTLINED_FUNCTION_19_2(&dword_25D16D000, v16, v17, "#SpokenOfferFullReadingStrategy submitting context update for spoken follow-up");
    OUTLINED_FUNCTION_3_0();
  }
  uint64_t v56 = v4;

  if (qword_26A66E860 != -1) {
    swift_once();
  }
  swift_retain();
  sub_25D2197E4();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F600);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_25D544650;
  *(void *)(v18 + 32) = sub_25D219AF4(0);
  *(void *)(v18 + 40) = v19;
  *(void *)(v18 + 48) = sub_25D219AF4(1);
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = sub_25D219AF4(2);
  *(void *)(v18 + 72) = v21;
  *(void *)(v18 + 80) = sub_25D219AF4(5);
  *(void *)(v18 + 88) = v22;
  *(void *)(v18 + 96) = sub_25D219AF4(6);
  *(void *)(v18 + 104) = v23;
  *(void *)(v18 + 112) = sub_25D219B1C(4);
  *(void *)(v18 + 120) = v24;
  sub_25D539C20();
  sub_25D539BB0();
  sub_25D539BE0();
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64748]), sel_init);
  uint64_t v26 = sub_25D53E200();
  sub_25D223F1C(v26, v27, v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A672D10);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_25D541A10;
  *(void *)(v28 + 32) = v25;
  v57[0] = v28;
  sub_25D53E4E0();
  sub_25D539BD0();
  uint64_t v55 = a1;
  sub_25D539B70();
  sub_25D53BD00();
  swift_allocObject();
  sub_25D53BCF0();
  sub_25D4130C8();
  swift_release();
  uint64_t v29 = v56;
  uint64_t v30 = *(void (**)(void))(v56 + 16);
  uint64_t v54 = v12;
  OUTLINED_FUNCTION_11_52();
  v30();
  uint64_t v31 = sub_25D53DC00();
  os_log_type_t v32 = sub_25D53E7B0();
  int v33 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    os_log_t v52 = v31;
    uint64_t v34 = swift_slowAlloc();
    int v50 = v33;
    uint64_t v35 = (uint8_t *)v34;
    uint64_t v51 = swift_slowAlloc();
    uint64_t v58 = v51;
    *(_DWORD *)uint64_t v35 = 136315138;
    v48[1] = v35 + 4;
    uint64_t v49 = v35;
    OUTLINED_FUNCTION_11_52();
    v30();
    sub_25D53ADE0();
    v57[3] = v2;
    v57[4] = sub_25D380A1C();
    __swift_allocate_boxed_opaque_existential_0(v57);
    OUTLINED_FUNCTION_11_52();
    v30();
    uint64_t v36 = sub_25D53ADD0();
    v48[0] = v10;
    uint64_t v37 = v2;
    unint64_t v39 = v38;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v57);
    uint64_t v40 = *(void (**)(void))(v56 + 8);
    OUTLINED_FUNCTION_40_5();
    v40();
    v57[0] = sub_25D19E114(v36, v39, &v58);
    uint64_t v41 = v30;
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_40_5();
    v40();
    uint64_t v29 = v56;
    os_log_t v42 = v52;
    _os_log_impl(&dword_25D16D000, v52, (os_log_type_t)v50, "#makeContextForConfirmIntent submitting NLv4 dialog act: %s", v49, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    uint64_t v40 = *(void (**)(void))(v29 + 8);
    uint64_t v41 = v30;
    ((void (*)(char *, uint64_t))v40)(v10, v2);

    uint64_t v37 = v2;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A672A20);
  unint64_t v43 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_25D541230;
  unint64_t v45 = v44 + v43;
  uint64_t v46 = v54;
  ((void (*)(unint64_t, char *, uint64_t))v41)(v45, v54, v37);
  sub_25D539B60();
  return ((uint64_t (*)(char *, uint64_t))v40)(v46, v37);
}

uint64_t sub_25D52C020(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6719F0);
  OUTLINED_FUNCTION_17_0(v3);
  v2[14] = OUTLINED_FUNCTION_92();
  uint64_t v4 = sub_25D5397D0();
  OUTLINED_FUNCTION_17_0(v4);
  v2[15] = OUTLINED_FUNCTION_92();
  uint64_t v5 = sub_25D53A2F0();
  v2[16] = v5;
  OUTLINED_FUNCTION_11_0(v5);
  v2[17] = v6;
  v2[18] = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25D52C0F4()
{
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25D53DC10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A688F10);
  uint64_t v2 = sub_25D53DC00();
  os_log_type_t v3 = sub_25D53E7B0();
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    OUTLINED_FUNCTION_19_2(&dword_25D16D000, v4, v5, "#SpokenReplyOfferFlowStrategy submitting context update for spoken follow-up");
    OUTLINED_FUNCTION_3_0();
  }
  uint64_t v6 = (void *)v0[13];

  uint64_t v7 = v6 + 2;
  uint64_t v8 = v6[5];
  uint64_t v9 = v6[6];
  __swift_project_boxed_opaque_existential_0(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
  __swift_project_boxed_opaque_existential_0(v0 + 2, v0[5]);
  LOBYTE(v8) = sub_25D539720();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  uint64_t v10 = sub_25D53DC00();
  os_log_type_t v11 = sub_25D53E7B0();
  BOOL v12 = os_log_type_enabled(v10, v11);
  if (v8)
  {
    if (v12)
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v10, v11, "#SpokenReplyOfferFlowStrategy CarPlay, executing pattern without dialog");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    void *v13 = v0;
    v13[1] = sub_25D52C3E8;
    return sub_25D526634();
  }
  else
  {
    if (v12)
    {
      *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
      OUTLINED_FUNCTION_20_4(&dword_25D16D000, v10, v11, "#SpokenReplyOfferFlowStrategy not CarPlay, returning NLContextUpdate only output");
      OUTLINED_FUNCTION_3_0();
    }
    uint64_t v15 = v0[14];
    uint64_t v16 = (uint64_t *)v0[12];

    sub_25D52C9B4(v15);
    uint64_t v17 = sub_25D539C30();
    __swift_storeEnumTagSinglePayload(v15, 0, 1, v17);
    uint64_t v18 = sub_25D53A710();
    uint64_t v19 = MEMORY[0x263F6FFF0];
    v16[3] = v18;
    v16[4] = v19;
    __swift_allocate_boxed_opaque_existential_0(v16);
    sub_25D53A6E0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_2();
    return v20();
  }
}

uint64_t sub_25D52C3E8()
{
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 160) = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    return v6();
  }
  else
  {
    OUTLINED_FUNCTION_21();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
}

uint64_t sub_25D52C50C()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = v0[14];
  uint64_t v3 = (void *)v0[13];
  uint64_t v4 = v3 + 2;
  sub_25D52CFD0();
  id v5 = v1;
  uint64_t v6 = (void *)sub_25D53E4A0();
  objc_msgSend(v5, sel_setDialog_, v6);

  sub_25D539780();
  sub_25D53A1F0();
  sub_25D53A2A0();
  sub_25D52C9B4(v2);
  uint64_t v7 = sub_25D539C30();
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v7);
  sub_25D53A260();
  sub_25D539C70();
  swift_allocObject();
  v0[21] = sub_25D539C60();
  uint64_t v8 = *(void *)(v3[8] + 128);
  v0[22] = v8;
  uint64_t v10 = v3[5];
  uint64_t v9 = v3[6];
  __swift_project_boxed_opaque_existential_0(v4, v10);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  swift_retain();
  v11(v10, v9);
  __swift_project_boxed_opaque_existential_0(v0 + 7, v0[10]);
  char v12 = sub_25D539720();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[23] = v13;
  void *v13 = v0;
  v13[1] = sub_25D52C720;
  uint64_t v14 = v0[20];
  uint64_t v15 = v0[18];
  uint64_t v16 = v0[12];
  return sub_25D49DA78(v16, v14, v15, v8, v12 & 1);
}

uint64_t sub_25D52C720()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_13_20();
  *uint64_t v3 = v2;
  id v5 = *(void **)(v4 + 160);
  *(void *)(v2 + 192) = v0;
  swift_task_dealloc();

  swift_release();
  swift_release();
  if (!v0) {
    __swift_destroy_boxed_opaque_existential_0(v2 + 56);
  }
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25D52C86C()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_2();
  return v4();
}

uint64_t sub_25D52C908()
{
  OUTLINED_FUNCTION_35_1();
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return v4();
}

uint64_t sub_25D52C9B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = sub_25D539C30();
  OUTLINED_FUNCTION_9_0();
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_36();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F610);
  uint64_t v8 = OUTLINED_FUNCTION_17_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_36();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_25D53DCF0();
  OUTLINED_FUNCTION_9_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_36();
  uint64_t v18 = v17 - v16;
  uint64_t v49 = MEMORY[0x263F8EE78];
  uint64_t v19 = *(void *)(v1 + 64);
  swift_beginAccess();
  sub_25D3B5938(*(void *)(v19 + 24), (uint64_t)v46);
  uint64_t v20 = v47;
  if (!v47)
  {
    sub_25D196E70((uint64_t)v46, &qword_26A66FE28);
LABEL_11:
    __swift_storeEnumTagSinglePayload(v11, 1, 1, v12);
    goto LABEL_12;
  }
  uint64_t v21 = v6;
  uint64_t v22 = v48;
  __swift_project_boxed_opaque_existential_0(v46, v47);
  (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v20, v22);
  uint64_t v23 = (void *)sub_25D21A7AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
    uint64_t v6 = v21;
    goto LABEL_11;
  }
  sub_25D49D000(v11);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
  uint64_t v6 = v21;
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) != 1)
  {
    uint64_t v24 = OUTLINED_FUNCTION_37_3();
    v25(v24);
    uint64_t v26 = v49;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v26 = sub_25D1F3188(0, *(void *)(v26 + 16) + 1, 1, v26);
    }
    unint64_t v28 = *(void *)(v26 + 16);
    unint64_t v27 = *(void *)(v26 + 24);
    if (v28 >= v27 >> 1) {
      uint64_t v26 = sub_25D1F3188(v27 > 1, v28 + 1, 1, v26);
    }
    *(void *)(v26 + 16) = v28 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16))(v26+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v28, v18, v12);
    uint64_t v49 = v26;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
    goto LABEL_17;
  }
LABEL_12:
  sub_25D196E70(v11, &qword_26A66F610);
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_25D53DC10();
  __swift_project_value_buffer(v29, (uint64_t)qword_26A688F10);
  uint64_t v30 = sub_25D53DC00();
  os_log_type_t v31 = sub_25D53E7B0();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)os_log_type_t v32 = 0;
    _os_log_impl(&dword_25D16D000, v30, v31, "#SpokenReplyOfferFlowStrategy No RR entity to donate", v32, 2u);
    OUTLINED_FUNCTION_3_0();
  }

LABEL_17:
  sub_25D539C20();
  if (qword_26A66E860 != -1) {
    swift_once();
  }
  swift_retain();
  sub_25D2197E4();
  swift_release();
  OUTLINED_FUNCTION_37_3();
  sub_25D539BB0();
  sub_25D539B60();
  if (*(void *)(v49 + 16))
  {
    swift_bridgeObjectRetain();
    sub_25D539B30();
  }
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_25D53DC10();
  __swift_project_value_buffer(v33, (uint64_t)qword_26A688F10);
  uint64_t v34 = sub_25D53DC00();
  os_log_type_t v35 = sub_25D53E7B0();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 134218242;
    swift_beginAccess();
    sub_25D53EA80();
    *(_WORD *)(v36 + 12) = 2080;
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x2611ABC30](v37, v12);
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    sub_25D19E114(v38, v40, &v45);
    sub_25D53EA80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v34, v35, "#SpokenReplyOfferFlowStrategy submitting %ld entities: %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(a1, v6, v42);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D52CF7C()
{
  sub_25D52A594();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SpokenReplyOfferFlowStrategy()
{
  return self;
}

unint64_t sub_25D52CFD0()
{
  unint64_t result = qword_26A66F8D0;
  if (!qword_26A66F8D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A66F8D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_15_56()
{
  return swift_task_dealloc();
}

uint64_t sub_25D52D040(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (sub_25D53EC90(),
        OUTLINED_FUNCTION_68_16(),
        unint64_t v6 = v5 & ~v4,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v4;
    do
    {
      sub_25D224A74(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v10);
      char v8 = MEMORY[0x2611AC400](v10, a1);
      sub_25D224AD0((uint64_t)v10);
      if (v8) {
        break;
      }
      unint64_t v6 = (v6 + 1) & v7;
    }
    while (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_25D52D114(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_25D53F1A0();
    sub_25D379480(a1);
    OUTLINED_FUNCTION_45_34();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25D53F1E0();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v6 = v4 & ~v5;
    OUTLINED_FUNCTION_30_43();
    if (v7)
    {
      sub_25D379480(*(unsigned char *)(*(void *)(a2 + 48) + v6));
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      sub_25D379480(a1);
      if (v9 == v13 && v11 == v12)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v15 = sub_25D53F090();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15)
      {
LABEL_18:
        char v26 = 1;
        return v26 & 1;
      }
      uint64_t v16 = ~v5;
      uint64_t v17 = (v6 + 1) & v16;
      OUTLINED_FUNCTION_30_43();
      if (v18)
      {
        while (1)
        {
          sub_25D379480(*(unsigned char *)(*(void *)(a2 + 48) + v17));
          uint64_t v20 = v19;
          uint64_t v22 = v21;
          sub_25D379480(a1);
          if (v20 == v24 && v22 == v23) {
            break;
          }
          char v26 = sub_25D53F090();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0)
          {
            uint64_t v17 = (v17 + 1) & v16;
            OUTLINED_FUNCTION_30_43();
            if (v27) {
              continue;
            }
          }
          return v26 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  char v26 = 0;
  return v26 & 1;
}

void sub_25D52D2A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25D53F1A0();
    sub_25D53E2F0();
    uint64_t v6 = sub_25D53F1E0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_41_19();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_25D53F090() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_41_19();
        if (v15)
        {
          do
          {
            uint64_t v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_25D53F090()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_41_19();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

void sub_25D52D3B4(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    int v3 = a1;
    sub_25D53F1A0();
    sub_25D53F1B0();
    sub_25D53F1E0();
    OUTLINED_FUNCTION_55_25();
    if ((v5 & 1) != 0 && *(unsigned __int8 *)(*(void *)(a2 + 48) + v4) != v3)
    {
      OUTLINED_FUNCTION_6_80();
      if (v8)
      {
        do
        {
          if (*(unsigned __int8 *)(v6 + v7) == v3) {
            break;
          }
          OUTLINED_FUNCTION_6_80();
        }
        while ((v9 & 1) != 0);
      }
    }
  }
}

void sub_25D52D470(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_25D53F190();
    OUTLINED_FUNCTION_55_25();
    if ((v5 & 1) != 0 && *(void *)(*(void *)(a2 + 48) + 8 * v4) != a1)
    {
      OUTLINED_FUNCTION_6_80();
      if (v8)
      {
        do
        {
          if (*(void *)(v6 + 8 * v7) == a1) {
            break;
          }
          OUTLINED_FUNCTION_6_80();
        }
        while ((v9 & 1) != 0);
      }
    }
  }
}

uint64_t sub_25D52D508(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (sub_25D53F1A0(),
        sub_25D37A6C8(a1),
        OUTLINED_FUNCTION_45_34(),
        swift_bridgeObjectRelease(),
        sub_25D53F1E0(),
        OUTLINED_FUNCTION_68_16(),
        unint64_t v6 = v5 & ~v4,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v4;
    uint64_t v8 = a1;
    while (1)
    {
      unint64_t v9 = 0xE500000000000000;
      uint64_t v10 = 0x6D75626C61;
      switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
      {
        case 1:
          unint64_t v9 = 0xE300000000000000;
          uint64_t v10 = 7368801;
          break;
        case 2:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v11 = 0x6C6369747261;
          goto LABEL_22;
        case 3:
          unint64_t v9 = 0xE600000000000000;
          uint64_t v10 = 0x747369747261;
          break;
        case 4:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1802465122;
          break;
        case 5:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v11 = 0x646F73697065;
          goto LABEL_22;
        case 6:
          uint64_t v10 = 0x6569766F6DLL;
          break;
        case 7:
          unint64_t v9 = 0xE800000000000000;
          uint64_t v10 = 0x6E6F697461636F6CLL;
          break;
        case 8:
          uint64_t v10 = 0x697461636F4C796DLL;
          unint64_t v9 = 0xEA00000000006E6FLL;
          break;
        case 9:
          uint64_t v12 = 1953458288;
          goto LABEL_20;
        case 0xA:
          unint64_t v9 = 0xE800000000000000;
          uint64_t v10 = 0x7473696C79616C70;
          break;
        case 0xB:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x74736163646F70;
          break;
        case 0xC:
          unint64_t v9 = 0xEA0000000000746FLL;
          uint64_t v10 = 0x68736E6565726373;
          break;
        case 0xD:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 2003789939;
          break;
        case 0xE:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1735290739;
          break;
        case 0xF:
          uint64_t v12 = 1701079414;
LABEL_20:
          uint64_t v10 = v12 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000;
          break;
        case 0x10:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v11 = 0x676170626577;
LABEL_22:
          uint64_t v10 = v11 & 0xFFFFFFFFFFFFLL | 0x65000000000000;
          break;
        default:
          break;
      }
      unint64_t v13 = 0xE500000000000000;
      uint64_t v14 = 0x6D75626C61;
      switch(v8)
      {
        case 1:
          unint64_t v13 = 0xE300000000000000;
          uint64_t v14 = 7368801;
          break;
        case 2:
          unint64_t v13 = 0xE700000000000000;
          uint64_t v15 = 0x6C6369747261;
          goto LABEL_41;
        case 3:
          unint64_t v13 = 0xE600000000000000;
          uint64_t v14 = 0x747369747261;
          break;
        case 4:
          unint64_t v13 = 0xE400000000000000;
          uint64_t v14 = 1802465122;
          break;
        case 5:
          unint64_t v13 = 0xE700000000000000;
          uint64_t v15 = 0x646F73697065;
          goto LABEL_41;
        case 6:
          uint64_t v14 = 0x6569766F6DLL;
          break;
        case 7:
          unint64_t v13 = 0xE800000000000000;
          uint64_t v14 = 0x6E6F697461636F6CLL;
          break;
        case 8:
          uint64_t v14 = 0x697461636F4C796DLL;
          unint64_t v13 = 0xEA00000000006E6FLL;
          break;
        case 9:
          uint64_t v16 = 1953458288;
          goto LABEL_39;
        case 10:
          unint64_t v13 = 0xE800000000000000;
          uint64_t v14 = 0x7473696C79616C70;
          break;
        case 11:
          unint64_t v13 = 0xE700000000000000;
          uint64_t v14 = 0x74736163646F70;
          break;
        case 12:
          unint64_t v13 = 0xEA0000000000746FLL;
          uint64_t v14 = 0x68736E6565726373;
          break;
        case 13:
          unint64_t v13 = 0xE400000000000000;
          uint64_t v14 = 2003789939;
          break;
        case 14:
          unint64_t v13 = 0xE400000000000000;
          uint64_t v14 = 1735290739;
          break;
        case 15:
          uint64_t v16 = 1701079414;
LABEL_39:
          uint64_t v14 = v16 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000;
          break;
        case 16:
          unint64_t v13 = 0xE700000000000000;
          uint64_t v15 = 0x676170626577;
LABEL_41:
          uint64_t v14 = v15 & 0xFFFFFFFFFFFFLL | 0x65000000000000;
          break;
        default:
          break;
      }
      if (v10 == v14 && v9 == v13) {
        break;
      }
      char v18 = sub_25D53F090();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
      {
        unint64_t v6 = (v6 + 1) & v7;
        if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6)) {
          continue;
        }
      }
      return v18 & 1;
    }
    swift_bridgeObjectRelease_n();
    char v18 = 1;
  }
  else
  {
    char v18 = 0;
  }
  return v18 & 1;
}

void sub_25D52D98C()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v2 = v1;
  uint64_t v3 = sub_25D53BB40();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19_0();
  if (*(void *)(v2 + 16))
  {
    sub_25D536DE8(&qword_26A6744D0, MEMORY[0x263F731F8]);
    sub_25D53E110();
    OUTLINED_FUNCTION_68_16();
    unint64_t v9 = v8 & ~v7;
    uint64_t v10 = v2 + 56;
    if ((*(void *)(v2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
    {
      uint64_t v17 = ~v7;
      uint64_t v18 = v2;
      uint64_t v11 = v5 + 16;
      uint64_t v12 = *(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = *(void *)(v11 + 56);
      do
      {
        v12(v0, *(void *)(v18 + 48) + v13 * v9, v3);
        sub_25D536DE8(&qword_26A673228, MEMORY[0x263F731F8]);
        char v14 = sub_25D53E1C0();
        uint64_t v15 = OUTLINED_FUNCTION_43_31();
        v16(v15);
        if (v14) {
          break;
        }
        unint64_t v9 = (v9 + 1) & v17;
      }
      while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
  }
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D52DB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v19 = v3;
    uint64_t v7 = a1 + 32;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x263F8EE78];
    do
    {
      sub_25D17DB88(v7, (uint64_t)v18);
      uint64_t v9 = type metadata accessor for AppIndependentSignalInstrumentation();
      uint64_t v10 = swift_allocObject();
      sub_25D188958(v18, v10 + 16);
      *(void *)(v10 + 56) = a2;
      *(void *)(v10 + 64) = a3;
      uint64_t v16 = v9;
      uint64_t v17 = sub_25D536DE8(&qword_26A6746E0, (void (*)(uint64_t))type metadata accessor for AppIndependentSignalInstrumentation);
      *(void *)&long long v15 = v10;
      sub_25D188958(&v15, (uint64_t)v18);
      sub_25D188958(v18, (uint64_t)&v15);
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D1F38EC();
        uint64_t v8 = v12;
      }
      unint64_t v11 = *(void *)(v8 + 16);
      if (v11 >= *(void *)(v8 + 24) >> 1)
      {
        sub_25D1F38EC();
        uint64_t v8 = v13;
      }
      *(void *)(v8 + 16) = v11 + 1;
      sub_25D188958(&v15, v8 + 40 * v11 + 32);
      v7 += 40;
      --v5;
    }
    while (v5);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  swift_release();
  return v8;
}

uint64_t sub_25D52DD24(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  sub_25D4C88F0(v18, a1);
  uint64_t v3 = v18[0];
  uint64_t v19 = v18[1];
  int64_t v4 = v18[3];
  unint64_t v5 = v18[4];
  int64_t v6 = (unint64_t)(v18[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    char v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v17 = *(void *)(*(void *)(v3 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (a2(v16, v15, v17))
    {
      swift_release();
      return v16;
    }
    swift_bridgeObjectRelease();
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
    unint64_t v11 = *(void *)(v19 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v19 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v19 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v19 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              goto LABEL_23;
            }
            unint64_t v11 = *(void *)(v19 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v19 + 8 * v13++);
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

uint64_t sub_25D52DEF8()
{
  uint64_t v0 = sub_25D53E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25D53E800();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_25D53E070();
  MEMORY[0x270FA5388](v5 - 8);
  sub_25D17DBEC(0, (unint64_t *)&qword_26A66EF78);
  sub_25D53E030();
  v7[1] = MEMORY[0x263F8EE78];
  sub_25D536DE8((unint64_t *)&qword_26A66EF80, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66EF88);
  sub_25D18262C((unint64_t *)&qword_26A66EF90, &qword_26A66EF88);
  sub_25D53EBA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_25D53E830();
  qword_26A675140 = result;
  return result;
}

uint64_t sub_25D52E148(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_25D52E178(uint64_t a1, uint64_t a2)
{
  if (qword_26A66E6B8 != -1) {
    swift_once();
  }
  uint64_t v4 = OUTLINED_FUNCTION_49_2();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_25D24774C(0xD000000000000013, 0x800000025D54F7D0, (uint64_t)sub_25D536648, v4);
  return swift_release();
}

uint64_t sub_25D52E240(unint64_t a1, void (*a2)(uint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25D53EEB0();
    uint64_t v4 = result;
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v15 = a2;
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x2611AC4C0](v6, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v8 = sub_25D53D300();
      uint64_t v10 = v9;
      swift_release();
      if (v10)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D1F2A04();
          uint64_t v7 = v13;
        }
        unint64_t v11 = *(void *)(v7 + 16);
        if (v11 >= *(void *)(v7 + 24) >> 1)
        {
          sub_25D1F2A04();
          uint64_t v7 = v14;
        }
        *(void *)(v7 + 16) = v11 + 1;
        uint64_t v12 = v7 + 16 * v11;
        *(void *)(v12 + 32) = v8;
        *(void *)(v12 + 40) = v10;
      }
      ++v6;
    }
    while (v4 != v6);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  v15(v7);
  return swift_bridgeObjectRelease();
}

void sub_25D52E3E4()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_25D53E020();
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_36();
  uint64_t v15 = v14 - v13;
  sub_25D53E070();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_19_0();
  if (qword_26A66E870 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v2;
  void v17[3] = v8;
  v17[4] = v6;
  v17[5] = v4;
  v21[4] = sub_25D536454;
  v21[5] = v17;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_25D18257C;
  _OWORD v21[3] = &block_descriptor_18;
  uint64_t v18 = _Block_copy(v21);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D53E040();
  sub_25D536DE8(&qword_26A66F0E0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F0E8);
  sub_25D18262C((unint64_t *)&qword_26A66F0F0, &qword_26A66F0E8);
  sub_25D53EBA0();
  MEMORY[0x2611ABF80](0, v1, v15, v18);
  _Block_release(v18);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  uint64_t v19 = OUTLINED_FUNCTION_43_31();
  v20(v19);
  swift_release();
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D52E670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void (**)(void (*)(uint64_t), void *))(a1 + 16);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  void v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(sub_25D5364C4, v9);
  return swift_release();
}

void sub_25D52E724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v56 = a5;
  uint64_t v55 = sub_25D53DBF0();
  uint64_t v54 = *(void *)(v55 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v55);
  uint64_t v53 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v51 - v11;
  if (*(_DWORD *)(a2 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_appResolutionType) == 3) {
    sub_25D52F4B0(a3, a4, a1);
  }
  sub_25D17DB88(a2 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalFactory, (uint64_t)v66);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v66, v67);
  uint64_t v57 = a2;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t *)((char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = *v15;
  uint64_t v18 = type metadata accessor for ExperimentSignalFactory();
  uint64_t v64 = v18;
  uint64_t v65 = &off_270A4F2F8;
  *(void *)&long long v63 = v17;
  type metadata accessor for SignalInstrumentation();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v63, v18);
  MEMORY[0x270FA5388](v20);
  uint64_t v58 = a1;
  uint64_t v22 = (uint64_t *)((char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  v19[5] = v18;
  v19[6] = &off_270A4F2F8;
  v19[2] = v24;
  uint64_t v25 = MEMORY[0x263F8EE78];
  v19[7] = MEMORY[0x263F8EE78];
  char v26 = v19 + 7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v63);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
  uint64_t v27 = v57;
  sub_25D52FDAC();
  if (v28)
  {
    uint64_t v56 = v28;
    if (qword_26A66E780 != -1) {
      swift_once();
    }
    id v29 = (id)qword_26A688F28;
    sub_25D53DBD0();
    sub_25D53E870();
    sub_25D53DBB0();
    sub_25D17DB88(v27 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalGatherer, (uint64_t)v66);
    __swift_project_boxed_opaque_existential_0(v66, v67);
    swift_beginAccess();
    uint64_t v30 = *v26;
    int64_t v31 = *(void *)(*v26 + 16);
    uint64_t v51 = v19;
    if (v31)
    {
      uint64_t v62 = v25;
      swift_bridgeObjectRetain();
      sub_25D1F61B0(0, v31, 0);
      uint64_t v32 = v30 + 32;
      uint64_t v33 = v62;
      do
      {
        sub_25D17DB88(v32, (uint64_t)v59);
        uint64_t v34 = v60;
        uint64_t v35 = v61;
        __swift_project_boxed_opaque_existential_0(v59, v60);
        (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v35 + 16))(&v63, v34, v35);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v59);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D1F61B0(0, *(void *)(v33 + 16) + 1, 1);
          uint64_t v33 = v62;
        }
        unint64_t v37 = *(void *)(v33 + 16);
        unint64_t v36 = *(void *)(v33 + 24);
        if (v37 >= v36 >> 1)
        {
          sub_25D1F61B0(v36 > 1, v37 + 1, 1);
          uint64_t v33 = v62;
        }
        *(void *)(v33 + 16) = v37 + 1;
        sub_25D188958(&v63, v33 + 40 * v37 + 32);
        v32 += 40;
        --v31;
      }
      while (v31);
      swift_bridgeObjectRelease();
    }
    uint64_t v38 = v54;
    unint64_t v39 = v53;
    uint64_t v40 = v55;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v12, v55);
    unint64_t v41 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    unint64_t v42 = (v52 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v44 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v44 + v41, v39, v40);
    *(void *)(v44 + v42) = v57;
    *(void *)(v44 + v43) = v51;
    uint64_t v45 = v56;
    *(void *)(v44 + ((v43 + 15) & 0xFFFFFFFFFFFFFFF8)) = v56;
    swift_retain();
    swift_retain();
    id v46 = v45;
    sub_25D535158();
    swift_release();

    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v40);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_25D53DC10();
    __swift_project_value_buffer(v47, (uint64_t)qword_26A688F10);
    uint64_t v48 = sub_25D53DC00();
    os_log_type_t v49 = sub_25D53E7C0();
    if (os_log_type_enabled(v48, v49))
    {
      int v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v50 = 0;
      _os_log_impl(&dword_25D16D000, v48, v49, "#AppSelectionSignalCollection: failed to create SELF message", v50, 2u);
      MEMORY[0x2611AD370](v50, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_25D52EE18(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4, char *a5)
{
  uint64_t v55 = a5;
  uint64_t v56 = a2;
  uint64_t v52 = a4;
  uint64_t v53 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v54 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25D53A7B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25D53A8D0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int v50 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v51 = (char *)&v49 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v49 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A670690);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D1B4A60(a1, (uint64_t)v22, &qword_26A670690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v19, v22, v12);
    uint64_t v23 = v13;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25D53DC10();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A688F10);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    char v26 = v51;
    v25(v51, v19, v12);
    uint64_t v27 = sub_25D53DC00();
    os_log_type_t v28 = sub_25D53E7C0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v55 = v19;
      uint64_t v30 = (uint8_t *)v29;
      uint64_t v54 = (char *)swift_slowAlloc();
      uint64_t v58 = v54;
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v53 = v30 + 4;
      v25(v50, v26, v12);
      uint64_t v31 = sub_25D53E270();
      uint64_t v57 = sub_25D19E114(v31, v32, (uint64_t *)&v58);
      sub_25D53EA80();
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v23 + 8);
      v33(v26, v12);
      _os_log_impl(&dword_25D16D000, v27, v28, "#AppSelectionSignalCollection: SignalGatherer#gatherValuesAndTimings error: %s", v30, 0xCu);
      uint64_t v34 = v54;
      swift_arrayDestroy();
      MEMORY[0x2611AD370](v34, -1, -1);
      MEMORY[0x2611AD370](v30, -1, -1);

      v33(v55, v12);
    }
    else
    {

      uint64_t v47 = *(void (**)(char *, uint64_t))(v23 + 8);
      v47(v26, v12);
      v47(v19, v12);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v22, v8);
    uint64_t v35 = v8;
    unint64_t v36 = v11;
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25D53DC10();
    __swift_project_value_buffer(v37, (uint64_t)qword_26A688F10);
    uint64_t v38 = sub_25D53DC00();
    os_log_type_t v39 = sub_25D53E7B0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_25D16D000, v38, v39, "#AppSelectionSignalCollection: SignalGatherer#gatherValuesAndTimings complete gatherAndSave success", v40, 2u);
      MEMORY[0x2611AD370](v40, -1, -1);
    }

    sub_25D53A7A0();
    sub_25D5344A4();
    swift_bridgeObjectRelease();
    unint64_t v41 = v53;
    uint64_t v42 = *(void *)&v53[OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream + 24];
    uint64_t v43 = *(void *)&v53[OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream + 32];
    __swift_project_boxed_opaque_existential_0(&v53[OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream], v42);
    uint64_t v44 = &v41[OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_isolatedID];
    uint64_t v45 = sub_25D538880();
    uint64_t v46 = (uint64_t)v54;
    (*(void (**)(char *, uint8_t *, uint64_t))(*(void *)(v45 - 8) + 16))(v54, v44, v45);
    __swift_storeEnumTagSinglePayload(v46, 0, 1, v45);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 8))(v55, v46, v42, v43);
    sub_25D1797C8(v46, &qword_26A66F528);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v36, v35);
  }
  sub_25D53E860();
  if (qword_26A66E780 != -1) {
    swift_once();
  }
  return sub_25D53DBC0();
}

void sub_25D52F4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F540);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_37_0();
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_shadowAppResolution);
  if (v9)
  {
    swift_retain();
    sub_25D53E5B0();
    uint64_t v10 = sub_25D53E5D0();
    __swift_storeEnumTagSinglePayload(v4, 0, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    v11[5] = v3;
    v11[6] = a1;
    v11[7] = a2;
    v11[8] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D4D0EEC();
    swift_release();
  }
  else
  {
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25D53DC10();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A688F10);
    uint64_t v15 = sub_25D53DC00();
    os_log_type_t v13 = sub_25D53E7C0();
    if (os_log_type_enabled(v15, v13))
    {
      uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25D16D000, v15, v13, "No shadow app resolution task running", v14, 2u);
      OUTLINED_FUNCTION_3_0();
    }
  }
}

uint64_t sub_25D52F6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  v8[6] = swift_task_alloc();
  v8[7] = swift_task_alloc();
  v8[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A675230);
  uint64_t v10 = swift_task_alloc();
  v8[9] = v10;
  uint64_t v11 = sub_25D53D3E0();
  v8[10] = v11;
  v8[11] = *(void *)(v11 - 8);
  v8[12] = swift_task_alloc();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[13] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_25D52F840;
  uint64_t v13 = MEMORY[0x263F8E628];
  uint64_t v14 = MEMORY[0x263F8E658];
  return MEMORY[0x270FA1FB8](v10, a4, v11, v13, v14);
}

uint64_t sub_25D52F840()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25D52F910, 0, 0);
}

uint64_t sub_25D52F910()
{
  uint64_t v1 = v0[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25D1797C8(v1, &qword_26A675230);
    if (qword_26A66E778 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25D53DC10();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A688F10);
    uint64_t v3 = sub_25D53DC00();
    os_log_type_t v4 = sub_25D53E7C0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_20_0();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_25D16D000, v3, v4, "Shadow app resolution task failed", v5, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v8 = v0[6];
    uint64_t v9 = v0[7];
    uint64_t v10 = v0[2];
    (*(void (**)(void, uint64_t, void))(v0[11] + 32))(v0[12], v1, v0[10]);
    __swift_project_boxed_opaque_existential_0((void *)(v10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream), *(void *)(v10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream + 24));
    uint64_t v11 = v10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_requestID;
    uint64_t v12 = sub_25D538880();
    OUTLINED_FUNCTION_37();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    v14(v9, v11, v12);
    __swift_storeEnumTagSinglePayload(v9, 0, 1, v12);
    v14(v8, v10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_inferenceID, v12);
    __swift_storeEnumTagSinglePayload(v8, 0, 1, v12);
    uint64_t v15 = (void *)swift_task_alloc();
    v0[14] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_25D52FBEC;
    return sub_25D1A6B1C();
  }
}

uint64_t sub_25D52FBEC()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_25D1797C8(v3, &qword_26A66F528);
  sub_25D1797C8(v2, &qword_26A66F528);
  return MEMORY[0x270FA2498](sub_25D52FD0C, 0, 0);
}

uint64_t sub_25D52FD0C()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

void sub_25D52FDAC()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v2 = v0;
  uint64_t v148 = v3;
  uint64_t v149 = v4;
  uint64_t v143 = v5;
  uint64_t v144 = v6;
  uint64_t v142 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_40_2();
  id v11 = (id)(v9 - v10);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_56_29();
  sub_25D53A9B0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v146 = v14;
  uint64_t v147 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_16_1();
  uint64_t v145 = v15;
  uint64_t v16 = sub_25D538880();
  OUTLINED_FUNCTION_0_3();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_40_2();
  uint64_t v22 = v20 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v125 - v24;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E258]), sel_init);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v140 = v1;
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E260]), sel_init);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v141 = v25;
      uint64_t v136 = v22;
      id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E268]), sel_init);
      if (v30)
      {
        id v31 = v30;
        uint64_t v139 = v16;
        if (qword_26A66E778 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_25D53DC10();
        uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)qword_26A688F10);
        swift_retain_n();
        uint64_t v138 = v33;
        uint64_t v34 = sub_25D53DC00();
        os_log_type_t v35 = sub_25D53E7B0();
        if (os_log_type_enabled(v34, v35))
        {
          id v132 = v11;
          unint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_26();
          uint64_t v37 = OUTLINED_FUNCTION_30();
          uint64_t v137 = (uint64_t)v29;
          *(_DWORD *)unint64_t v36 = 136315138;
          v150[0] = v37;
          char v134 = v27;
          uint64_t v38 = sub_25D53E960();
          uint64_t v40 = sub_25D19E114(v38, v39, v150);
          OUTLINED_FUNCTION_90_0(v40);
          uint64_t v27 = v134;
          sub_25D53EA80();
          OUTLINED_FUNCTION_50_22();
          id v11 = v132;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25D16D000, v34, v35, "#AppSelectionSignalCollection: generating top-level SELF message for type %s", v36, 0xCu);
          swift_arrayDestroy();
          uint64_t v29 = (void *)v137;
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
        }
        else
        {

          OUTLINED_FUNCTION_50_22();
        }
        uint64_t v45 = sub_25D17DBEC(0, &qword_26A66F690);
        uint64_t v46 = *(void *)(v18 + 16);
        uint64_t v47 = (uint64_t)v141;
        uint64_t v130 = v18 + 16;
        uint64_t v129 = v46;
        OUTLINED_FUNCTION_59_1();
        v48();
        uint64_t v131 = v45;
        id v49 = sub_25D203FF4(v47);
        objc_msgSend(v29, sel_setInferenceId_, v49);

        objc_msgSend(v27, sel_setEventMetadata_, v29);
        uint64_t v137 = (uint64_t)sub_25D2EB2CC();
        uint64_t v53 = v50;
        uint64_t v54 = v51;
        if (v52)
        {
          if (v52 == 1)
          {
            uint64_t v133 = v51;
            char v134 = (void *)v50;
            uint64_t v148 = v18;
            id v135 = v31;
            uint64_t v55 = v145;
            uint64_t v56 = v146;
            uint64_t v57 = v147;
            OUTLINED_FUNCTION_100_3();
            v58();
            sub_25D530AB8();
            uint64_t v60 = v59;
            (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
            if (v60)
            {
              sub_25D531140();
              id v31 = v135;
              if (!v61)
              {

                OUTLINED_FUNCTION_65_21();
                goto LABEL_16;
              }
              uint64_t v62 = v61;
              objc_msgSend(v135, sel_setInferenceCommsAppSelectionTrainingAppIndependentSignals_, v60);
              sub_25D535FC8(v62, v31);

              OUTLINED_FUNCTION_65_21();
              uint64_t v18 = v148;
              goto LABEL_28;
            }

            uint64_t v105 = (void *)v137;
            uint64_t v107 = v133;
            uint64_t v106 = (uint64_t)v134;
            char v108 = 1;
LABEL_61:
            sub_25D40B4D4(v105, v106, v107, v108);
            goto LABEL_16;
          }
          uint64_t v73 = (void *)sub_25D53DC00();
          os_log_type_t v74 = sub_25D53E7C0();
          if (OUTLINED_FUNCTION_29(v74))
          {
            *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
            OUTLINED_FUNCTION_12_3(&dword_25D16D000, v75, v76, "#AppSelectionSignalCollection: recipientType is empty");
            OUTLINED_FUNCTION_3_0();
          }

LABEL_28:
          uint64_t v77 = v139;
          swift_retain_n();
          uint64_t v78 = sub_25D53DC00();
          uint64_t v79 = v2;
          os_log_type_t v80 = sub_25D53E7B0();
          if (os_log_type_enabled(v78, v80))
          {
            uint64_t v148 = v18;
            id v135 = v31;
            uint64_t v137 = (uint64_t)v29;
            uint64_t v81 = (uint8_t *)OUTLINED_FUNCTION_26();
            uint64_t v149 = OUTLINED_FUNCTION_30();
            uint64_t v151 = v149;
            *(_DWORD *)uint64_t v81 = 136315138;
            uint64_t v82 = v79;
            uint64_t v83 = v140;
            sub_25D1B4A60(v79 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_crrCommsAppSelectionJointId, v140, &qword_26A66F528);
            OUTLINED_FUNCTION_0_10(v83);
            if (v84)
            {
              sub_25D1797C8(v83, &qword_26A66F528);
              uint64_t v95 = 0;
              uint64_t v98 = 0;
            }
            else
            {
              uint64_t v95 = sub_25D538840();
              uint64_t v96 = v83;
              uint64_t v98 = v97;
              (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v96, v77);
            }
            v150[0] = v95;
            v150[1] = v98;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF20);
            uint64_t v99 = sub_25D53E270();
            v150[0] = sub_25D19E114(v99, v100, &v151);
            sub_25D53EA80();
            swift_release_n();
            swift_bridgeObjectRelease();
            uint64_t v79 = v82;
            _os_log_impl(&dword_25D16D000, v78, v80, "#AppSelectionSignalCollection: crrCommsAppSelectionJointId:%s", v81, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_3_0();
            OUTLINED_FUNCTION_3_0();

            uint64_t v29 = (void *)v137;
            id v31 = v135;
            uint64_t v77 = v139;
            uint64_t v18 = v148;
          }
          else
          {

            swift_release_n();
          }
          sub_25D1B4A60(v79 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_crrCommsAppSelectionJointId, (uint64_t)v11, &qword_26A66F528);
          OUTLINED_FUNCTION_0_10((uint64_t)v11);
          if (v84)
          {
            sub_25D1797C8((uint64_t)v11, &qword_26A66F528);
          }
          else
          {
            uint64_t v101 = v136;
            (*(void (**)(uint64_t, id, uint64_t))(v18 + 32))(v136, v11, v77);
            uint64_t v102 = (uint64_t)v141;
            OUTLINED_FUNCTION_59_1();
            v103();
            id v104 = sub_25D203FF4(v102);
            objc_msgSend(v31, sel_setCrrCommsAppSelectionJointId_, v104);

            (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v101, v77);
          }
          objc_msgSend(v27, sel_setCommsAppSelectionGroundTruthGenerated_, v31);

          goto LABEL_16;
        }
        swift_bridgeObjectRetain_n();
        char v134 = (void *)v53;
        OUTLINED_FUNCTION_64_17();
        sub_25D5361A8(v63, v64, v65, 0);
        uint64_t v66 = sub_25D53DC00();
        os_log_type_t v67 = sub_25D53E7B0();
        int v128 = v67;
        BOOL v68 = os_log_type_enabled(v66, v67);
        uint64_t v133 = v54;
        if (v68)
        {
          int v69 = (uint8_t *)OUTLINED_FUNCTION_26();
          v150[0] = OUTLINED_FUNCTION_30();
          uint64_t v127 = v2;
          id v132 = v11;
          uint64_t v126 = v69;
          *(_DWORD *)int v69 = 136315138;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6739B0);
          uint64_t v70 = sub_25D53E0E0();
          uint64_t v72 = sub_25D19E114(v70, v71, v150);
          OUTLINED_FUNCTION_90_0(v72);
          id v11 = v132;
          uint64_t v2 = v127;
          sub_25D53EA80();
          uint64_t v54 = v133;
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25D16D000, v66, (os_log_type_t)v128, "#AppSelectionSignalCollection: span matched recipients in apps %s", v126, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v85 = v137;
        if ((unint64_t)v137 >> 62)
        {
          if (v137 >= 0) {
            uint64_t v119 = v137 & 0xFFFFFFFFFFFFFF8;
          }
          else {
            uint64_t v119 = v137;
          }
          swift_bridgeObjectRetain();
          sub_25D53EEB0();
          OUTLINED_FUNCTION_48_26();
          if (v119) {
            goto LABEL_36;
          }
        }
        else if (*(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_36:
          sub_25D1F2400(0, (v85 & 0xC000000000000001) == 0, v85);
          uint64_t v86 = v29;
          if ((v85 & 0xC000000000000001) != 0) {
            MEMORY[0x2611AC4C0](0, v85);
          }
          else {
            id v87 = *(id *)(v85 + 32);
          }
          uint64_t v88 = OUTLINED_FUNCTION_48_26();
          MEMORY[0x270FA5388](v88);
          id v132 = (id)(v85 & 0xC000000000000001);
          *(&v125 - 2) = v85 & 0xC000000000000001;
          uint64_t v89 = sub_25D52DD24(v148, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25D536208);
          id v135 = v31;
          if (v90)
          {
            uint64_t v92 = v89;
            uint64_t v93 = v90;
            uint64_t v94 = v91;
            swift_bridgeObjectRetain();
            uint64_t v148 = v94;
            sub_25D536210(v92, v93);
          }
          else
          {
            uint64_t v148 = 0;
          }
          uint64_t v29 = v86;
          uint64_t v110 = v145;
          uint64_t v109 = v146;
          uint64_t v111 = v147;
          OUTLINED_FUNCTION_100_3();
          v112();
          sub_25D530AB8();
          uint64_t v114 = v113;
          uint64_t v115 = v110;
          BOOL v116 = v114;
          (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v115, v111);
          if (v116)
          {
            sub_25D531140();
            uint64_t v118 = v117;
            swift_bridgeObjectRelease();
            id v31 = v135;
            if (!v118)
            {

              OUTLINED_FUNCTION_66_17();
              goto LABEL_16;
            }
            objc_msgSend(v135, sel_setInferenceCommsAppSelectionTrainingAppIndependentSignals_, v116);
            sub_25D535FC8(v118, v31);

            OUTLINED_FUNCTION_66_17();
            goto LABEL_28;
          }

          swift_bridgeObjectRelease();
          uint64_t v105 = (void *)v137;
          uint64_t v107 = v133;
          uint64_t v106 = (uint64_t)v134;
LABEL_60:
          char v108 = 0;
          goto LABEL_61;
        }
        uint64_t v120 = (uint64_t)v134;
        sub_25D40B4D4((void *)v85, (uint64_t)v134, v54, 0);
        uint64_t v121 = (void *)sub_25D53DC00();
        os_log_type_t v122 = sub_25D53E7C0();
        if (OUTLINED_FUNCTION_29(v122))
        {
          *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
          OUTLINED_FUNCTION_12_3(&dword_25D16D000, v123, v124, "#AppSelectionSignalCollection: recipient typo is person, but failed to get any recipient from intent");
          OUTLINED_FUNCTION_3_0();

          sub_25D40B4D4((void *)v85, v120, v54, 0);
          goto LABEL_16;
        }

        uint64_t v105 = (void *)v85;
        uint64_t v106 = v120;
        uint64_t v107 = v54;
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v29 = v27;
    }
  }
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25D53DC10();
  __swift_project_value_buffer(v41, (uint64_t)qword_26A688F10);
  uint64_t v42 = sub_25D53DC00();
  os_log_type_t v43 = sub_25D53E7C0();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)OUTLINED_FUNCTION_20_0();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_25D16D000, v42, v43, "#AppSelectionSignalCollection: failed to generate top-level SELF message", v44, 2u);
    OUTLINED_FUNCTION_3_0();
  }

LABEL_16:
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D530A80()
{
  sub_25D3FCA94();
  return v0 & 1;
}

void sub_25D530AB8()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751C0);
  OUTLINED_FUNCTION_0_3();
  uint64_t v47 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_16_1();
  uint64_t v50 = v4;
  uint64_t v5 = sub_25D53A780();
  OUTLINED_FUNCTION_0_3();
  uint64_t v49 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_23_51(v8, v43);
  uint64_t v9 = sub_25D53A9B0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_40_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_56_29();
  uint64_t v14 = sub_25D53A9C0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_36();
  uint64_t v20 = v19 - v18;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E288]), sel_init);
  if (v21)
  {
    char v52 = v21;
    objc_msgSend(v21, sel_setAppResolutionType_, *(unsigned int *)(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_appResolutionType));
    uint64_t v45 = v14;
    uint64_t v22 = sub_25D53A860();
    uint64_t v23 = OUTLINED_FUNCTION_1_57();
    *(void *)(v23 + 16) = v52;
    uint64_t v46 = v5;
    id v24 = v52;
    sub_25D4CBFC0(v22, MEMORY[0x263F745F8], (uint64_t)sub_25D536108, v23);
    swift_release();
    uint64_t v25 = sub_25D53A920();
    uint64_t v26 = OUTLINED_FUNCTION_1_57();
    *(void *)(v26 + 16) = v24;
    id v27 = v24;
    sub_25D4CBFC0(v25, MEMORY[0x263F74640], (uint64_t)sub_25D53612C, v26);
    swift_release();
    OUTLINED_FUNCTION_100_3();
    v28();
    OUTLINED_FUNCTION_59_1();
    v29();
    sub_25D53A9A0();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
    uint64_t v30 = OUTLINED_FUNCTION_1_57();
    *(void *)(v30 + 16) = v27;
    v53[3] = v45;
    v53[4] = MEMORY[0x263F74690];
    __swift_allocate_boxed_opaque_existential_0(v53);
    OUTLINED_FUNCTION_59_1();
    v31();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF38);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25D541230;
    sub_25D17DB88((uint64_t)v53, inited + 32);
    swift_retain_n();
    id v44 = v27;
    sub_25D52DB54(inited, (uint64_t)sub_25D536150, v30);
    swift_beginAccess();
    sub_25D386904();
    swift_endAccess();
    swift_release();
    swift_setDeallocating();
    sub_25D535734(&qword_26A66FF40);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v53);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v45);
    sub_25D53A9E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A675210);
    unint64_t v33 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_25D541230;
    unint64_t v34 = v48 + v33;
    OUTLINED_FUNCTION_100_3();
    v35();
    uint64_t v36 = OUTLINED_FUNCTION_1_57();
    *(void *)(v36 + 16) = v44;
    uint64_t v37 = (id (**)(void *))(v50 + *(int *)(v51 + 48));
    uint64_t v38 = *(void (**)(uint64_t))(v49 + 32);
    uint64_t v39 = OUTLINED_FUNCTION_44_32();
    v38(v39);
    uint8_t *v37 = sub_25D536174;
    v37[1] = (id (*)(void *))v36;
    ((void (*)(unint64_t, uint64_t, uint64_t))v38)(v34, v50, v46);
    uint64_t v40 = (void *)(v34 + *(int *)(v51 + 48));
    uint64_t v41 = OUTLINED_FUNCTION_49_2();
    *(void *)(v41 + 16) = sub_25D536174;
    *(void *)(v41 + 24) = v36;
    *uint64_t v40 = sub_25D53617C;
    v40[1] = v41;
    id v42 = v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A675218);
    sub_25D536DE8(&qword_26A6706B8, MEMORY[0x263F74590]);
    sub_25D53E0F0();
    sub_25D4CC06C();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_36_0();
}

id sub_25D5310A8(void *a1, void *a2, const char **a3)
{
  id v5 = objc_msgSend(a1, sel_longLongValue);
  uint64_t v6 = *a3;
  return objc_msgSend(a2, v6, v5);
}

id sub_25D5310F4(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_intValue);
  return objc_msgSend(a2, sel_setUserPersona_, v3);
}

void sub_25D531140()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v422 = v0;
  uint64_t v439 = v1;
  uint64_t isUniquelyReferenced_nonNull_native = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  v442 = v8;
  uint64_t v441 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751C0);
  OUTLINED_FUNCTION_0_3();
  uint64_t v420 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_56_0();
  uint64_t v426 = v11;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_85_0();
  uint64_t v425 = v13;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_85_0();
  uint64_t v431 = v15;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_85_0();
  uint64_t v430 = v17;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_85_0();
  uint64_t v436 = v19;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v20);
  v438 = (char *)&v407 - v21;
  uint64_t v421 = sub_25D53A780();
  OUTLINED_FUNCTION_0_3();
  v450 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_56_0();
  uint64_t v424 = v24;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_85_0();
  v423 = v26;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_85_0();
  v429 = v28;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_85_0();
  v428 = v30;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_85_0();
  uint64_t v435 = v32;
  OUTLINED_FUNCTION_90();
  MEMORY[0x270FA5388](v33);
  v437 = (char *)&v407 - v34;
  if (qword_26A66E778 != -1) {
    goto LABEL_71;
  }
  while (1)
  {
    uint64_t v35 = sub_25D53DC10();
    uint64_t v36 = __swift_project_value_buffer(v35, (uint64_t)qword_26A688F10);
    swift_bridgeObjectRetain_n();
    uint64_t v444 = v36;
    uint64_t v37 = sub_25D53DC00();
    os_log_type_t v38 = sub_25D53E7B0();
    BOOL v39 = os_log_type_enabled(v37, v38);
    uint64_t v40 = MEMORY[0x263F8EE58];
    uint64_t v445 = (uint64_t)v7;
    uint64_t v443 = isUniquelyReferenced_nonNull_native;
    if (v39)
    {
      uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_26();
      v452[0] = OUTLINED_FUNCTION_30();
      *(_DWORD *)uint64_t v41 = 136315138;
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v42 = sub_25D53E6C0();
        unint64_t v44 = v43;
      }
      else
      {
        unint64_t v44 = 0xE300000000000000;
        uint64_t v42 = 7104878;
      }
      uint64_t v453 = sub_25D19E114(v42, v44, v452);
      sub_25D53EA80();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D16D000, v37, v38, "#AppSelectionSignalCollection: matchedAppBundleIds=%s", v41, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      uint64_t v45 = v445;
    }
    else
    {
      uint64_t v45 = (uint64_t)v7;

      swift_bridgeObjectRelease_n();
    }
    sub_25D17DBEC(0, &qword_26A6751C8);
    uint64_t v46 = sub_25D53E0F0();
    v455 = (void *)v46;
    uint64_t v47 = *(void *)(v5 + 16);
    uint64_t v440 = v5;
    if (v47) {
      break;
    }
LABEL_41:
    *(void *)&long long v432 = sub_25D53AB20();
    v442 = *(void (**)(void))(v422 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_intent);
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751D8);
    uint64_t v447 = *(void *)(v420 + 72);
    uint64_t v94 = *(unsigned __int8 *)(v420 + 80);
    uint64_t v420 = ((v94 + 32) & ~v94) + 6 * v447;
    uint64_t v95 = (v94 + 32) & ~v94;
    v434 = (unint64_t *)v95;
    uint64_t v443 = v94 | 7;
    uint64_t v444 = v93;
    uint64_t v96 = swift_allocObject();
    long long v419 = xmmword_25D544650;
    v433 = (char *)v96;
    *(_OWORD *)(v96 + 16) = xmmword_25D544650;
    v446 = (char *)(v96 + v95);
    LODWORD(v427) = *MEMORY[0x263F74560];
    uint64_t v97 = v450;
    uint64_t v98 = (void (*)(void))v450[13];
    uint64_t v449 = (uint64_t)(v450 + 13);
    v451 = v98;
    uint64_t v99 = v421;
    ((void (*)(char *))v98)(v437);
    unint64_t v100 = v455;
    uint64_t v445 = (uint64_t)v455;
    uint64_t v101 = OUTLINED_FUNCTION_1_57();
    *(void *)(v101 + 16) = v100;
    uint64_t v102 = v441;
    unint64_t v103 = (void (**)(uint64_t, uint64_t, uint64_t))&v438[*(int *)(v441 + 48)];
    id v104 = (void (*)(void))v97[4];
    OUTLINED_FUNCTION_70_14();
    v104();
    v450 = v97 + 4;
    *unint64_t v103 = sub_25D535798;
    v103[1] = (void (*)(uint64_t, uint64_t, uint64_t))v101;
    uint64_t v105 = v446;
    uint64_t v106 = v99;
    OUTLINED_FUNCTION_70_14();
    v104();
    uint64_t v107 = &v105[*(int *)(v102 + 48)];
    uint64_t v108 = OUTLINED_FUNCTION_49_2();
    *(void *)(v108 + 16) = sub_25D535798;
    *(void *)(v108 + 24) = v101;
    *(void *)uint64_t v107 = sub_25D5357C4;
    *((void *)v107 + 1) = v108;
    uint64_t v109 = v447;
    uint64_t v422 = (uint64_t)&v105[v447];
    LODWORD(v415) = *MEMORY[0x263F74520];
    uint64_t v110 = v106;
    OUTLINED_FUNCTION_8_65();
    v111();
    unint64_t v112 = v455;
    *(void *)&long long v416 = v455;
    uint64_t v113 = OUTLINED_FUNCTION_1_57();
    *(void *)(v113 + 16) = v112;
    uint64_t v114 = (void (**)(uint64_t, uint64_t, uint64_t))(v436 + *(int *)(v102 + 48));
    OUTLINED_FUNCTION_70_14();
    v104();
    *uint64_t v114 = sub_25D5357C8;
    v114[1] = (void (*)(uint64_t, uint64_t, uint64_t))v113;
    uint64_t v115 = v422;
    OUTLINED_FUNCTION_70_14();
    v104();
    BOOL v116 = v104;
    uint64_t v117 = (void *)(v115 + *(int *)(v102 + 48));
    uint64_t v118 = OUTLINED_FUNCTION_49_2();
    *(void *)(v118 + 16) = sub_25D5357C8;
    *(void *)(v118 + 24) = v113;
    void *v117 = sub_25D5357C4;
    v117[1] = v118;
    uint64_t v422 = (uint64_t)&v446[2 * v109];
    uint64_t v119 = v110;
    uint64_t v120 = v451;
    OUTLINED_FUNCTION_13_48();
    v120();
    uint64_t v121 = v455;
    uint64_t v413 = (uint64_t)v455;
    uint64_t v122 = OUTLINED_FUNCTION_1_57();
    *(void *)(v122 + 16) = v121;
    uint64_t v123 = (void (**)(uint64_t, uint64_t, uint64_t))(v430 + *(int *)(v102 + 48));
    uint64_t v124 = v119;
    OUTLINED_FUNCTION_49_25();
    v116();
    *uint64_t v123 = sub_25D5357F4;
    v123[1] = (void (*)(uint64_t, uint64_t, uint64_t))v122;
    uint64_t v125 = v422;
    OUTLINED_FUNCTION_49_25();
    v116();
    uint64_t v126 = v441;
    uint64_t v127 = (void *)(v125 + *(int *)(v441 + 48));
    uint64_t v128 = OUTLINED_FUNCTION_49_2();
    *(void *)(v128 + 16) = sub_25D5357F4;
    *(void *)(v128 + 24) = v122;
    *uint64_t v127 = sub_25D5357C4;
    v127[1] = v128;
    uint64_t v422 = 3 * v447;
    uint64_t v418 = (uint64_t)&v446[3 * v447];
    LODWORD(v417) = *MEMORY[0x263F74558];
    OUTLINED_FUNCTION_67_17();
    v120();
    uint64_t v129 = v455;
    uint64_t v412 = (uint64_t)v455;
    uint64_t v130 = OUTLINED_FUNCTION_1_57();
    *(void *)(v130 + 16) = v129;
    uint64_t v131 = v126;
    uint64_t v132 = *(int *)(v126 + 48);
    uint64_t v133 = v431;
    char v134 = (void (**)(uint64_t, uint64_t, uint64_t))(v431 + v132);
    OUTLINED_FUNCTION_64_17();
    v448 = v116;
    v116();
    *char v134 = sub_25D535820;
    v134[1] = (void (*)(uint64_t, uint64_t, uint64_t))v130;
    uint64_t v135 = v418;
    ((void (*)(uint64_t, uint64_t, uint64_t))v116)(v418, v133, v124);
    uint64_t v136 = v131;
    uint64_t v137 = (void *)(v135 + *(int *)(v131 + 48));
    uint64_t v138 = OUTLINED_FUNCTION_49_2();
    *(void *)(v138 + 16) = sub_25D535820;
    *(void *)(v138 + 24) = v130;
    *uint64_t v137 = sub_25D5357C4;
    v137[1] = v138;
    uint64_t v418 = (uint64_t)&v446[4 * v447];
    LODWORD(v414) = *MEMORY[0x263F74518];
    uint64_t v139 = v124;
    uint64_t v140 = v451;
    OUTLINED_FUNCTION_67_17();
    v140();
    uint64_t v141 = v455;
    uint64_t v411 = (uint64_t)v455;
    uint64_t v142 = OUTLINED_FUNCTION_1_57();
    *(void *)(v142 + 16) = v141;
    uint64_t v143 = (void (**)(uint64_t, uint64_t, uint64_t))(v425 + *(int *)(v136 + 48));
    OUTLINED_FUNCTION_43_31();
    uint64_t v144 = v448;
    OUTLINED_FUNCTION_21_51();
    v144();
    *uint64_t v143 = sub_25D53584C;
    v143[1] = (void (*)(uint64_t, uint64_t, uint64_t))v142;
    uint64_t v145 = v418;
    OUTLINED_FUNCTION_21_51();
    v144();
    uint64_t v146 = (void *)(v145 + *(int *)(v136 + 48));
    uint64_t v147 = OUTLINED_FUNCTION_49_2();
    *(void *)(v147 + 16) = sub_25D53584C;
    *(void *)(v147 + 24) = v142;
    *uint64_t v146 = sub_25D5357C4;
    v146[1] = v147;
    uint64_t v418 = 5 * v447;
    uint64_t v148 = &v446[5 * v447];
    OUTLINED_FUNCTION_13_48();
    v140();
    uint64_t v149 = v455;
    v446 = (char *)v455;
    uint64_t v150 = OUTLINED_FUNCTION_1_57();
    *(void *)(v150 + 16) = v149;
    uint64_t v151 = v136;
    uint64_t v152 = *(int *)(v136 + 48);
    uint64_t v153 = v426;
    uint64_t v154 = (void (**)(uint64_t, uint64_t, uint64_t))(v426 + v152);
    uint64_t v155 = OUTLINED_FUNCTION_52_26();
    uint64_t v156 = v448;
    ((void (*)(uint64_t))v448)(v155);
    *uint64_t v154 = sub_25D535878;
    v154[1] = (void (*)(uint64_t, uint64_t, uint64_t))v150;
    ((void (*)(char *, uint64_t, uint64_t))v156)(v148, v153, v139);
    uint64_t v157 = &v148[*(int *)(v151 + 48)];
    uint64_t v158 = OUTLINED_FUNCTION_49_2();
    *(void *)(v158 + 16) = sub_25D535878;
    *(void *)(v158 + 24) = v150;
    *(void *)uint64_t v157 = sub_25D5357C4;
    *((void *)v157 + 1) = v158;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v445 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751E0);
    v446 = (char *)sub_25D536DE8(&qword_26A6706B8, MEMORY[0x263F74590]);
    sub_25D53E0F0();
    v433 = (char *)sub_25D17DBEC(0, (unint64_t *)&qword_26A66F7F0);
    uint64_t v159 = (void *)sub_25D53E9B0();
    OUTLINED_FUNCTION_62_21();
    swift_bridgeObjectRelease();

    *(void *)&long long v432 = sub_25D53AAF0();
    uint64_t v413 = sub_25D53E9B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751E8);
    uint64_t v160 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6751F0) - 8);
    uint64_t v161 = *(void *)(*(void *)v160 + 72);
    unint64_t v162 = (*(unsigned __int8 *)(*(void *)v160 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v160 + 80);
    uint64_t v163 = swift_allocObject();
    long long v416 = xmmword_25D541BE0;
    *(_OWORD *)(v163 + 16) = xmmword_25D541BE0;
    unint64_t v164 = v163 + v162;
    uint64_t v411 = v160[14];
    uint64_t v412 = v163;
    uint64_t v165 = v451;
    ((void (*)(unint64_t, void, uint64_t))v451)(v163 + v162, v427, v139);
    uint64_t v410 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751F8);
    uint64_t inited = swift_initStackObject();
    long long v409 = xmmword_25D546010;
    *(_OWORD *)(inited + 16) = xmmword_25D546010;
    uint64_t v167 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v167);
    uint64_t v168 = OUTLINED_FUNCTION_49_2();
    *(void *)(v168 + 16) = sub_25D5358A4;
    *(void *)(v168 + 24) = v151;
    *(unsigned char *)(inited + 32) = 0;
    *(void *)(inited + 40) = sub_25D5357C4;
    *(void *)(inited + 48) = v168;
    uint64_t v169 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v169);
    uint64_t v170 = OUTLINED_FUNCTION_49_2();
    *(void *)(v170 + 16) = sub_25D5358D0;
    *(void *)(v170 + 24) = v151;
    *(unsigned char *)(inited + 56) = 1;
    *(void *)(inited + 64) = sub_25D5357C4;
    *(void *)(inited + 72) = v170;
    uint64_t v171 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v171);
    uint64_t v172 = OUTLINED_FUNCTION_49_2();
    *(void *)(v172 + 16) = sub_25D5358FC;
    *(void *)(v172 + 24) = v151;
    *(unsigned char *)(inited + 80) = 2;
    *(void *)(inited + 88) = sub_25D5357C4;
    *(void *)(inited + 96) = v172;
    uint64_t v173 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v173);
    uint64_t v174 = OUTLINED_FUNCTION_49_2();
    *(void *)(v174 + 16) = sub_25D535928;
    *(void *)(v174 + 24) = v151;
    *(unsigned char *)(inited + 104) = 3;
    *(void *)(inited + 112) = sub_25D5357C4;
    *(void *)(inited + 120) = v174;
    uint64_t v175 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v175);
    uint64_t v176 = OUTLINED_FUNCTION_49_2();
    *(void *)(v176 + 16) = sub_25D535954;
    *(void *)(v176 + 24) = v151;
    *(unsigned char *)(inited + 128) = 4;
    *(void *)(inited + 136) = sub_25D5357C4;
    *(void *)(inited + 144) = v176;
    uint64_t v177 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v177);
    uint64_t v178 = OUTLINED_FUNCTION_49_2();
    *(void *)(v178 + 16) = sub_25D5359B8;
    *(void *)(v178 + 24) = v151;
    *(unsigned char *)(inited + 152) = 5;
    *(void *)(inited + 160) = sub_25D5357C4;
    *(void *)(inited + 168) = v178;
    uint64_t v179 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v179);
    uint64_t v180 = OUTLINED_FUNCTION_49_2();
    *(void *)(v180 + 16) = sub_25D535A14;
    *(void *)(v180 + 24) = v151;
    *(unsigned char *)(inited + 176) = 6;
    *(void *)(inited + 184) = sub_25D5357C4;
    *(void *)(inited + 192) = v180;
    uint64_t v181 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_20_53(v181);
    uint64_t v182 = OUTLINED_FUNCTION_49_2();
    *(void *)(v182 + 16) = sub_25D535A40;
    *(void *)(v182 + 24) = v151;
    *(unsigned char *)(inited + 200) = 7;
    *(void *)(inited + 208) = sub_25D5357C4;
    *(void *)(inited + 216) = v182;
    sub_25D535A6C();
    swift_bridgeObjectRetain_n();
    *(void *)(v164 + v411) = sub_25D53E0F0();
    uint64_t v183 = v164 + v161;
    uint64_t v411 = v160[14];
    uint64_t v184 = v421;
    ((void (*)(uint64_t, void, uint64_t))v165)(v183, v417, v421);
    uint64_t v185 = swift_initStackObject();
    *(_OWORD *)(v185 + 16) = v409;
    uint64_t v186 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v186);
    uint64_t v187 = OUTLINED_FUNCTION_49_2();
    *(void *)(v187 + 16) = sub_25D535AB8;
    *(void *)(v187 + 24) = v151;
    *(unsigned char *)(v185 + 32) = 0;
    *(void *)(v185 + 40) = sub_25D5357C4;
    *(void *)(v185 + 48) = v187;
    uint64_t v188 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v188);
    uint64_t v189 = OUTLINED_FUNCTION_49_2();
    *(void *)(v189 + 16) = sub_25D535AE4;
    *(void *)(v189 + 24) = v151;
    *(unsigned char *)(v185 + 56) = 1;
    *(void *)(v185 + 64) = sub_25D5357C4;
    *(void *)(v185 + 72) = v189;
    uint64_t v190 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v190);
    uint64_t v191 = OUTLINED_FUNCTION_49_2();
    *(void *)(v191 + 16) = sub_25D535B10;
    *(void *)(v191 + 24) = v151;
    *(unsigned char *)(v185 + 80) = 2;
    *(void *)(v185 + 88) = sub_25D5357C4;
    *(void *)(v185 + 96) = v191;
    uint64_t v192 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v192);
    uint64_t v193 = OUTLINED_FUNCTION_49_2();
    *(void *)(v193 + 16) = sub_25D535B3C;
    *(void *)(v193 + 24) = v151;
    *(unsigned char *)(v185 + 104) = 3;
    *(void *)(v185 + 112) = sub_25D5357C4;
    *(void *)(v185 + 120) = v193;
    uint64_t v194 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v194);
    uint64_t v195 = OUTLINED_FUNCTION_49_2();
    *(void *)(v195 + 16) = sub_25D535B68;
    *(void *)(v195 + 24) = v151;
    *(unsigned char *)(v185 + 128) = 4;
    *(void *)(v185 + 136) = sub_25D5357C4;
    *(void *)(v185 + 144) = v195;
    uint64_t v196 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v196);
    uint64_t v197 = OUTLINED_FUNCTION_49_2();
    *(void *)(v197 + 16) = sub_25D535B94;
    *(void *)(v197 + 24) = v151;
    *(unsigned char *)(v185 + 152) = 5;
    *(void *)(v185 + 160) = sub_25D5357C4;
    *(void *)(v185 + 168) = v197;
    uint64_t v198 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v198);
    uint64_t v199 = OUTLINED_FUNCTION_49_2();
    *(void *)(v199 + 16) = sub_25D535BC0;
    *(void *)(v199 + 24) = v151;
    *(unsigned char *)(v185 + 176) = 6;
    *(void *)(v185 + 184) = sub_25D5357C4;
    *(void *)(v185 + 192) = v199;
    uint64_t v200 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v200);
    uint64_t v201 = OUTLINED_FUNCTION_49_2();
    *(void *)(v201 + 16) = sub_25D535BEC;
    *(void *)(v201 + 24) = v151;
    *(unsigned char *)(v185 + 200) = 7;
    *(void *)(v185 + 208) = sub_25D5357C4;
    *(void *)(v185 + 216) = v201;
    swift_bridgeObjectRetain_n();
    *(void *)(v183 + v411) = sub_25D53E0F0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A675208);
    sub_25D53E0F0();
    v202 = (void *)v413;
    sub_25D4CD81C();

    swift_bridgeObjectRelease();
    uint64_t v413 = sub_25D53AB30();
    uint64_t v412 = sub_25D53E9B0();
    uint64_t v203 = swift_allocObject();
    uint64_t v411 = v203;
    *(_OWORD *)(v203 + 16) = v419;
    *(void *)&long long v432 = (char *)v434 + v203;
    ((void (*)(char *, void, uint64_t))v451)(v437, v427, v184);
    v204 = v455;
    uint64_t v410 = (uint64_t)v455;
    uint64_t v205 = OUTLINED_FUNCTION_1_57();
    *(void *)(v205 + 16) = v204;
    uint64_t v206 = v441;
    v207 = (void (**)(uint64_t, uint64_t, uint64_t))&v438[*(int *)(v441 + 48)];
    OUTLINED_FUNCTION_52_26();
    uint64_t v208 = v184;
    v209 = v448;
    OUTLINED_FUNCTION_26_44();
    v209();
    *v207 = sub_25D535C18;
    v207[1] = (void (*)(uint64_t, uint64_t, uint64_t))v205;
    uint64_t v210 = v432;
    OUTLINED_FUNCTION_26_44();
    v209();
    uint64_t v211 = v210;
    v212 = (void *)(v210 + *(int *)(v206 + 48));
    uint64_t v213 = OUTLINED_FUNCTION_49_2();
    *(void *)(v213 + 16) = sub_25D535C18;
    *(void *)(v213 + 24) = v205;
    void *v212 = sub_25D5357C4;
    v212[1] = v213;
    uint64_t v214 = v447;
    *(void *)&long long v409 = v211 + v447;
    OUTLINED_FUNCTION_13_48();
    v215();
    v216 = v455;
    uint64_t v415 = (uint64_t)v455;
    uint64_t v217 = OUTLINED_FUNCTION_1_57();
    *(void *)(v217 + 16) = v216;
    v218 = (void (**)(uint64_t, uint64_t, uint64_t))(v436 + *(int *)(v206 + 48));
    v219 = v448;
    OUTLINED_FUNCTION_21_51();
    v219();
    *v218 = sub_25D535C44;
    v218[1] = (void (*)(uint64_t, uint64_t, uint64_t))v217;
    uint64_t v220 = v409;
    OUTLINED_FUNCTION_21_51();
    v219();
    v221 = (void *)(v220 + *(int *)(v206 + 48));
    uint64_t v222 = OUTLINED_FUNCTION_49_2();
    *(void *)(v222 + 16) = sub_25D535C44;
    *(void *)(v222 + 24) = v217;
    void *v221 = sub_25D5357C4;
    v221[1] = v222;
    uint64_t v223 = v432 + 2 * v214;
    ((void (*)(void *, void, uint64_t))v451)(v428, *MEMORY[0x263F74578], v208);
    v224 = v455;
    *(void *)&long long v409 = v455;
    uint64_t v225 = OUTLINED_FUNCTION_1_57();
    *(void *)(v225 + 16) = v224;
    v226 = (void (**)(uint64_t, uint64_t, uint64_t))(v430 + *(int *)(v206 + 48));
    OUTLINED_FUNCTION_34_28();
    OUTLINED_FUNCTION_49_25();
    v219();
    *v226 = sub_25D535C70;
    v226[1] = (void (*)(uint64_t, uint64_t, uint64_t))v225;
    OUTLINED_FUNCTION_49_25();
    v219();
    v227 = v219;
    uint64_t v228 = v441;
    v229 = (void *)(v223 + *(int *)(v441 + 48));
    uint64_t v230 = OUTLINED_FUNCTION_49_2();
    *(void *)(v230 + 16) = sub_25D535C70;
    *(void *)(v230 + 24) = v225;
    void *v229 = sub_25D5357C4;
    v229[1] = v230;
    v408 = (void *)(v432 + v422);
    v231 = v429;
    v232 = v451;
    ((void (*)(void *, void, uint64_t))v451)(v429, v417, v208);
    v417 = v455;
    uint64_t v233 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_16_48(v233);
    uint64_t v234 = v228;
    uint64_t v235 = *(int *)(v228 + 48);
    uint64_t v236 = v431;
    v237 = (void (**)(uint64_t, uint64_t, uint64_t))(v431 + v235);
    ((void (*)(uint64_t, void *, uint64_t))v227)(v431, v231, v208);
    *v237 = sub_25D535C9C;
    v237[1] = (void (*)(uint64_t, uint64_t, uint64_t))v225;
    v238 = v408;
    ((void (*)(void *, uint64_t, uint64_t))v227)(v408, v236, v208);
    v239 = (void *)((char *)v238 + *(int *)(v234 + 48));
    uint64_t v240 = OUTLINED_FUNCTION_49_2();
    *(void *)(v240 + 16) = sub_25D535C9C;
    *(void *)(v240 + 24) = v225;
    void *v239 = sub_25D5357C4;
    v239[1] = v240;
    v408 = (void *)(v432 + 4 * v447);
    OUTLINED_FUNCTION_59_23();
    v232();
    v241 = (void (**)(uint64_t, uint64_t, uint64_t))v455;
    v414 = v455;
    uint64_t v242 = OUTLINED_FUNCTION_1_57();
    *(void *)(v242 + 16) = v241;
    OUTLINED_FUNCTION_53_23();
    OUTLINED_FUNCTION_7_59();
    v227();
    *v241 = sub_25D535CC8;
    v241[1] = (void (*)(uint64_t, uint64_t, uint64_t))v242;
    v243 = v408;
    OUTLINED_FUNCTION_7_59();
    v227();
    uint64_t v244 = v441;
    v245 = (void *)((char *)v243 + *(int *)(v441 + 48));
    uint64_t v246 = OUTLINED_FUNCTION_49_2();
    *(void *)(v246 + 16) = sub_25D535CC8;
    *(void *)(v246 + 24) = v242;
    void *v245 = sub_25D5357C4;
    v245[1] = v246;
    uint64_t v247 = v432 + v418;
    OUTLINED_FUNCTION_59_23();
    v248();
    v249 = v455;
    *(void *)&long long v432 = v455;
    uint64_t v250 = OUTLINED_FUNCTION_1_57();
    *(void *)(v250 + 16) = v249;
    OUTLINED_FUNCTION_53_23();
    v251 = v448;
    OUTLINED_FUNCTION_33_38();
    v251();
    *(void *)uint64_t v244 = sub_25D535CF4;
    *(void *)(v244 + 8) = v250;
    OUTLINED_FUNCTION_33_38();
    v251();
    v252 = (void *)(v247 + *(int *)(v244 + 48));
    uint64_t v253 = OUTLINED_FUNCTION_49_2();
    *(void *)(v253 + 16) = sub_25D535CF4;
    *(void *)(v253 + 24) = v250;
    void *v252 = sub_25D5357C4;
    v252[1] = v253;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D53E0F0();
    v254 = (void *)v412;
    OUTLINED_FUNCTION_62_21();

    swift_bridgeObjectRelease();
    uint64_t v415 = sub_25D53AA10();
    uint64_t v255 = swift_allocObject();
    v414 = (void *)v255;
    *(_OWORD *)(v255 + 16) = v419;
    v256 = (char *)v434 + v255;
    LODWORD(v420) = *MEMORY[0x263F74538];
    OUTLINED_FUNCTION_8_65();
    v257();
    v258 = v455;
    uint64_t v412 = (uint64_t)v455;
    uint64_t v259 = OUTLINED_FUNCTION_1_57();
    *(void *)(v259 + 16) = v258;
    uint64_t v260 = v244;
    v261 = (void (**)(uint64_t, uint64_t, uint64_t))&v438[*(int *)(v244 + 48)];
    v262 = v448;
    OUTLINED_FUNCTION_33_38();
    v262();
    *v261 = sub_25D535D20;
    v261[1] = (void (*)(uint64_t, uint64_t, uint64_t))v259;
    OUTLINED_FUNCTION_34_28();
    OUTLINED_FUNCTION_33_38();
    v262();
    uint64_t v263 = *(int *)(v260 + 48);
    *(void *)&long long v432 = v256;
    v264 = &v256[v263];
    uint64_t v265 = OUTLINED_FUNCTION_49_2();
    *(void *)(v265 + 16) = sub_25D535D20;
    *(void *)(v265 + 24) = v259;
    *(void *)v264 = sub_25D5357C4;
    *((void *)v264 + 1) = v265;
    uint64_t v266 = v447;
    *(void *)&long long v419 = &v256[v447];
    LODWORD(v417) = *MEMORY[0x263F74510];
    ((void (*)(uint64_t))v451)(v435);
    v267 = v455;
    uint64_t v411 = (uint64_t)v455;
    uint64_t v268 = OUTLINED_FUNCTION_1_57();
    *(void *)(v268 + 16) = v267;
    v269 = (void (**)(uint64_t, uint64_t, uint64_t))(v436 + *(int *)(v260 + 48));
    v270 = v448;
    OUTLINED_FUNCTION_7_59();
    v270();
    *v269 = sub_25D535D4C;
    v269[1] = (void (*)(uint64_t, uint64_t, uint64_t))v268;
    uint64_t v271 = v419;
    OUTLINED_FUNCTION_34_28();
    OUTLINED_FUNCTION_7_59();
    v270();
    uint64_t v272 = v441;
    v273 = (void *)(v271 + *(int *)(v441 + 48));
    uint64_t v274 = OUTLINED_FUNCTION_49_2();
    *(void *)(v274 + 16) = sub_25D535D4C;
    *(void *)(v274 + 24) = v268;
    void *v273 = sub_25D5357C4;
    v273[1] = v274;
    uint64_t v275 = v432 + 2 * v266;
    v276 = v451;
    ((void (*)(void *, void, uint64_t))v451)(v428, *MEMORY[0x263F74548], v208);
    v277 = v455;
    uint64_t v410 = (uint64_t)v455;
    uint64_t v278 = OUTLINED_FUNCTION_1_57();
    *(void *)(v278 + 16) = v277;
    v279 = (void (**)(uint64_t, uint64_t, uint64_t))(v430 + *(int *)(v272 + 48));
    v280 = v448;
    OUTLINED_FUNCTION_21_51();
    v280();
    *v279 = sub_25D535D78;
    v279[1] = (void (*)(uint64_t, uint64_t, uint64_t))v278;
    OUTLINED_FUNCTION_34_28();
    OUTLINED_FUNCTION_21_51();
    v280();
    uint64_t v281 = v441;
    v282 = (void *)(v275 + *(int *)(v441 + 48));
    uint64_t v283 = OUTLINED_FUNCTION_49_2();
    *(void *)(v283 + 16) = sub_25D535D78;
    *(void *)(v283 + 24) = v278;
    void *v282 = sub_25D5357C4;
    v282[1] = v283;
    uint64_t v284 = v432 + v422;
    LODWORD(v419) = *MEMORY[0x263F74588];
    OUTLINED_FUNCTION_13_48();
    v276();
    v285 = v455;
    *(void *)&long long v409 = v455;
    uint64_t v286 = OUTLINED_FUNCTION_1_57();
    *(void *)(v286 + 16) = v285;
    uint64_t v287 = v281;
    v288 = (void (**)(uint64_t, uint64_t, uint64_t))(v431 + *(int *)(v281 + 48));
    OUTLINED_FUNCTION_44_32();
    OUTLINED_FUNCTION_7_59();
    v280();
    *v288 = sub_25D535DA4;
    v288[1] = (void (*)(uint64_t, uint64_t, uint64_t))v286;
    OUTLINED_FUNCTION_7_59();
    v280();
    v289 = v280;
    v290 = (void *)(v284 + *(int *)(v287 + 48));
    uint64_t v291 = OUTLINED_FUNCTION_49_2();
    *(void *)(v291 + 16) = sub_25D535DA4;
    *(void *)(v291 + 24) = v286;
    void *v290 = sub_25D5357C4;
    v290[1] = v291;
    uint64_t v407 = v432 + 4 * v447;
    LODWORD(v413) = *MEMORY[0x263F74528];
    v292 = v451;
    OUTLINED_FUNCTION_59_23();
    v292();
    v293 = v455;
    v408 = v455;
    uint64_t v294 = OUTLINED_FUNCTION_1_57();
    *(void *)(v294 + 16) = v293;
    v295 = (void (**)(uint64_t, uint64_t, uint64_t))(v425 + *(int *)(v287 + 48));
    OUTLINED_FUNCTION_64_17();
    OUTLINED_FUNCTION_7_59();
    v289();
    *v295 = sub_25D535DD0;
    v295[1] = (void (*)(uint64_t, uint64_t, uint64_t))v294;
    uint64_t v296 = v407;
    OUTLINED_FUNCTION_52_26();
    OUTLINED_FUNCTION_7_59();
    v289();
    uint64_t v297 = v441;
    v298 = (void *)(v296 + *(int *)(v441 + 48));
    uint64_t v299 = OUTLINED_FUNCTION_49_2();
    *(void *)(v299 + 16) = sub_25D535DD0;
    *(void *)(v299 + 24) = v294;
    void *v298 = sub_25D5357C4;
    v298[1] = v299;
    uint64_t v300 = v432 + v418;
    OUTLINED_FUNCTION_59_23();
    v292();
    v301 = v455;
    *(void *)&long long v432 = v455;
    uint64_t v302 = OUTLINED_FUNCTION_1_57();
    *(void *)(v302 + 16) = v301;
    v303 = (void (**)(uint64_t, uint64_t, uint64_t))(v426 + *(int *)(v297 + 48));
    v304 = v448;
    OUTLINED_FUNCTION_26_44();
    v304();
    *v303 = sub_25D535DFC;
    v303[1] = (void (*)(uint64_t, uint64_t, uint64_t))v302;
    OUTLINED_FUNCTION_26_44();
    v304();
    uint64_t v305 = v297;
    v306 = (void *)(v300 + *(int *)(v297 + 48));
    uint64_t v307 = OUTLINED_FUNCTION_49_2();
    *(void *)(v307 + 16) = sub_25D535DFC;
    *(void *)(v307 + 24) = v302;
    void *v306 = sub_25D5357C4;
    v306[1] = v307;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D53E0F0();
    v308 = (void *)sub_25D53E9B0();
    OUTLINED_FUNCTION_61_20();
    swift_bridgeObjectRelease();

    uint64_t v426 = sub_25D53AA20();
    uint64_t v425 = sub_25D53E9B0();
    v309 = v434;
    uint64_t v310 = swift_allocObject();
    uint64_t v424 = v310;
    *(_OWORD *)(v310 + 16) = xmmword_25D545240;
    *(void *)&long long v432 = (char *)v309 + v310;
    v311 = v451;
    OUTLINED_FUNCTION_13_48();
    v311();
    v312 = v455;
    v423 = v455;
    uint64_t v313 = OUTLINED_FUNCTION_1_57();
    *(void *)(v313 + 16) = v312;
    uint64_t v314 = v305;
    v315 = (void (**)(uint64_t, uint64_t, uint64_t))&v438[*(int *)(v305 + 48)];
    v316 = v448;
    OUTLINED_FUNCTION_26_44();
    v316();
    *v315 = sub_25D535E28;
    v315[1] = (void (*)(uint64_t, uint64_t, uint64_t))v313;
    uint64_t v317 = v432;
    OUTLINED_FUNCTION_49_25();
    v316();
    uint64_t v318 = v317;
    v319 = (void *)(v317 + *(int *)(v314 + 48));
    uint64_t v320 = OUTLINED_FUNCTION_49_2();
    *(void *)(v320 + 16) = sub_25D535E28;
    *(void *)(v320 + 24) = v313;
    void *v319 = sub_25D5357C4;
    v319[1] = v320;
    uint64_t v415 = v318 + v447;
    OUTLINED_FUNCTION_67_17();
    v311();
    v321 = v455;
    uint64_t v418 = (uint64_t)v455;
    uint64_t v322 = OUTLINED_FUNCTION_1_57();
    *(void *)(v322 + 16) = v321;
    v323 = (void (**)(uint64_t, uint64_t, uint64_t))(v436 + *(int *)(v314 + 48));
    v324 = v448;
    OUTLINED_FUNCTION_26_44();
    v324();
    *v323 = sub_25D535E54;
    v323[1] = (void (*)(uint64_t, uint64_t, uint64_t))v322;
    uint64_t v325 = v415;
    OUTLINED_FUNCTION_26_44();
    v324();
    v326 = (void *)(v325 + *(int *)(v314 + 48));
    uint64_t v327 = OUTLINED_FUNCTION_49_2();
    *(void *)(v327 + 16) = sub_25D535E54;
    *(void *)(v327 + 24) = v322;
    void *v326 = sub_25D5357C4;
    v326[1] = v327;
    uint64_t v328 = v432 + 2 * v447;
    v329 = v451;
    OUTLINED_FUNCTION_67_17();
    v329();
    v330 = v455;
    v417 = v455;
    uint64_t v331 = OUTLINED_FUNCTION_1_57();
    *(void *)(v331 + 16) = v330;
    v332 = (void (**)(uint64_t, uint64_t, uint64_t))(v430 + *(int *)(v314 + 48));
    OUTLINED_FUNCTION_44_32();
    v333 = v448;
    OUTLINED_FUNCTION_33_38();
    v333();
    *v332 = sub_25D535E80;
    v332[1] = (void (*)(uint64_t, uint64_t, uint64_t))v331;
    OUTLINED_FUNCTION_33_38();
    v333();
    v334 = v333;
    uint64_t v335 = v441;
    v336 = (void *)(v328 + *(int *)(v441 + 48));
    uint64_t v337 = OUTLINED_FUNCTION_49_2();
    *(void *)(v337 + 16) = sub_25D535E80;
    *(void *)(v337 + 24) = v331;
    void *v336 = sub_25D5357C4;
    v336[1] = v337;
    uint64_t v338 = v432 + v422;
    OUTLINED_FUNCTION_13_48();
    v329();
    v339 = v455;
    *(void *)&long long v432 = v455;
    uint64_t v340 = OUTLINED_FUNCTION_1_57();
    *(void *)(v340 + 16) = v339;
    v341 = (void (**)(uint64_t, uint64_t, uint64_t))(v431 + *(int *)(v335 + 48));
    OUTLINED_FUNCTION_7_59();
    v334();
    *v341 = sub_25D535EAC;
    v341[1] = (void (*)(uint64_t, uint64_t, uint64_t))v340;
    OUTLINED_FUNCTION_7_59();
    v334();
    v342 = (void *)(v338 + *(int *)(v335 + 48));
    uint64_t v343 = OUTLINED_FUNCTION_49_2();
    *(void *)(v343 + 16) = sub_25D535EAC;
    *(void *)(v343 + 24) = v340;
    void *v342 = sub_25D5357C4;
    v342[1] = v343;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D53E0F0();
    v344 = (void *)v425;
    OUTLINED_FUNCTION_61_20();

    swift_bridgeObjectRelease();
    *(void *)&long long v432 = sub_25D53AB10();
    uint64_t v431 = sub_25D53E9B0();
    v345 = v434;
    uint64_t v346 = swift_allocObject();
    uint64_t v430 = v346;
    *(_OWORD *)(v346 + 16) = v416;
    v347 = (char *)v345 + v346;
    OUTLINED_FUNCTION_8_65();
    v348();
    v349 = v455;
    v429 = v455;
    uint64_t v350 = OUTLINED_FUNCTION_1_57();
    *(void *)(v350 + 16) = v349;
    uint64_t v351 = v335;
    v352 = (void (**)(uint64_t, uint64_t, uint64_t))&v438[*(int *)(v335 + 48)];
    v353 = v448;
    OUTLINED_FUNCTION_21_51();
    v353();
    *v352 = sub_25D535ED8;
    v352[1] = (void (*)(uint64_t, uint64_t, uint64_t))v350;
    OUTLINED_FUNCTION_21_51();
    v353();
    v354 = &v347[*(int *)(v351 + 48)];
    uint64_t v355 = OUTLINED_FUNCTION_49_2();
    *(void *)(v355 + 16) = sub_25D535ED8;
    *(void *)(v355 + 24) = v350;
    *(void *)v354 = sub_25D5357C4;
    *((void *)v354 + 1) = v355;
    v356 = &v347[v447];
    OUTLINED_FUNCTION_8_65();
    v357();
    v358 = v455;
    v428 = v455;
    uint64_t v359 = OUTLINED_FUNCTION_1_57();
    *(void *)(v359 + 16) = v358;
    v360 = (void (**)(uint64_t, uint64_t, uint64_t))(v436 + *(int *)(v351 + 48));
    v361 = v448;
    OUTLINED_FUNCTION_7_59();
    v361();
    *v360 = sub_25D535F04;
    v360[1] = (void (*)(uint64_t, uint64_t, uint64_t))v359;
    OUTLINED_FUNCTION_7_59();
    v361();
    uint64_t v362 = v351;
    v363 = &v356[*(int *)(v351 + 48)];
    uint64_t v364 = OUTLINED_FUNCTION_49_2();
    *(void *)(v364 + 16) = sub_25D535F04;
    *(void *)(v364 + 24) = v359;
    *(void *)v363 = sub_25D5357C4;
    *((void *)v363 + 1) = v364;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D53E0F0();
    v365 = (void *)v431;
    uint64_t v366 = v440;
    sub_25D4CCF1C();

    swift_bridgeObjectRelease();
    sub_25D53A8C0();
    uint64_t v367 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_42_34(v367);
    v368 = (void *)sub_25D53E9B0();
    OUTLINED_FUNCTION_18_47((uint64_t)v368, MEMORY[0x263F74618], v369, v370, (uint64_t)sub_25D535F30);
    swift_release();

    sub_25D53AA60();
    uint64_t v371 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_42_34(v371);
    v372 = (void *)sub_25D53E9B0();
    OUTLINED_FUNCTION_18_47((uint64_t)v372, MEMORY[0x263F74718], v373, v374, (uint64_t)sub_25D535F38);
    swift_release();

    sub_25D53AA50();
    uint64_t v375 = OUTLINED_FUNCTION_1_57();
    OUTLINED_FUNCTION_42_34(v375);
    v376 = (void *)sub_25D53E9B0();
    OUTLINED_FUNCTION_18_47((uint64_t)v376, MEMORY[0x263F74710], v377, v378, (uint64_t)sub_25D535F5C);
    swift_release();

    uint64_t v379 = sub_25D53A8E0();
    v380 = (void *)sub_25D53E9B0();
    v381 = v455;
    uint64_t v382 = OUTLINED_FUNCTION_1_57();
    *(void *)(v382 + 16) = v381;
    swift_bridgeObjectRetain();
    sub_25D4CCC6C(v379, MEMORY[0x263F74628], v366, v380, (uint64_t)sub_25D535F64, v382);

    swift_release();
    uint64_t v436 = sub_25D53AB00();
    v383 = v434;
    uint64_t v384 = swift_allocObject();
    uint64_t v447 = v384;
    *(_OWORD *)(v384 + 16) = xmmword_25D541230;
    v385 = (char *)v383 + v384;
    OUTLINED_FUNCTION_8_65();
    v386();
    v387 = v455;
    v451 = (void (*)(void))v455;
    uint64_t v388 = OUTLINED_FUNCTION_1_57();
    *(void *)(v388 + 16) = v387;
    v389 = (void (**)(uint64_t, uint64_t, void *))&v438[*(int *)(v362 + 48)];
    uint64_t v7 = (void (*)(void))v450;
    uint64_t v5 = (uint64_t)v448;
    OUTLINED_FUNCTION_7_59();
    ((void (*)(void))v5)();
    *v389 = sub_25D535F6C;
    v389[1] = (void (*)(uint64_t, uint64_t, void *))v388;
    OUTLINED_FUNCTION_7_59();
    ((void (*)(void))v5)();
    v390 = &v385[*(int *)(v362 + 48)];
    uint64_t v391 = OUTLINED_FUNCTION_49_2();
    *(void *)(v391 + 16) = sub_25D535F6C;
    *(void *)(v391 + 24) = v388;
    *(void *)v390 = sub_25D5357C4;
    *((void *)v390 + 1) = v391;
    swift_bridgeObjectRetain();
    sub_25D53E0F0();
    v392 = (void *)sub_25D53E9B0();
    sub_25D4CCF1C();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    v393 = (void (*)(void))v455;
    uint64_t v394 = v455[2];
    if (!v394) {
      goto LABEL_55;
    }
    uint64_t v453 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25D53EDC0();
    uint64_t v395 = sub_25D536050((uint64_t)v393);
    if (v395 < 0 || (unint64_t v397 = v395, v395 >= 1 << *((unsigned char *)v393 + 32)))
    {
LABEL_53:
      __break(1u);
LABEL_54:
      swift_bridgeObjectRelease();
LABEL_55:
      swift_bridgeObjectRelease();
      goto LABEL_63;
    }
    int v398 = v396;
    v399 = (void (*)(void))((char *)v393 + 64);
    v451 = v393;
    while (1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = v397 >> 6;
      if ((*((void *)v399 + (v397 >> 6)) & (1 << v397)) == 0) {
        break;
      }
      if (v398 != *((_DWORD *)v393 + 9)) {
        goto LABEL_65;
      }
      uint64_t v7 = v399;
      id v400 = *(id *)(*((void *)v393 + 7) + 8 * v397);
      sub_25D53EDA0();
      uint64_t v5 = *(void *)(v453 + 16);
      sub_25D53EDD0();
      v393 = v451;
      sub_25D53EDE0();
      sub_25D53EDB0();
      OUTLINED_FUNCTION_68_16();
      if ((uint64_t)v397 >= -v401) {
        goto LABEL_66;
      }
      if ((*((void *)v399 + isUniquelyReferenced_nonNull_native) & (1 << v397)) == 0) {
        goto LABEL_67;
      }
      if (v398 != *((_DWORD *)v393 + 9)) {
        goto LABEL_68;
      }
      uint64_t v402 = sub_25D53EBC0();
      if (!--v394) {
        goto LABEL_54;
      }
      unint64_t v397 = v402;
      if ((v402 & 0x8000000000000000) == 0)
      {
        int v398 = *((_DWORD *)v393 + 9);
        if (v402 < 1 << *((unsigned char *)v393 + 32)) {
          continue;
        }
      }
      goto LABEL_53;
    }
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    swift_once();
  }
  uint64_t v449 = v46;
  v433 = (char *)&v453 + 4;
  v434 = &v454;
  swift_bridgeObjectRetain();
  uint64_t v48 = (uint64_t *)(v5 + 40);
  *(void *)&long long v49 = 136315650;
  long long v432 = v49;
  uint64_t v427 = v40 + 8;
  uint64_t v50 = 0x1F6E6D000;
  while (1)
  {
    uint64_t v5 = *v48;
    v451 = (void (*)(void))*(v48 - 1);
    id v51 = objc_allocWithZone(MEMORY[0x263F6E280]);
    swift_bridgeObjectRetain();
    id v52 = [v51 *(SEL *)(v50 + 3688)];
    if (!v52)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_60;
    }
    uint64_t v53 = v52;
    uint64_t v54 = (char *)[objc_allocWithZone(MEMORY[0x263F6E270]) *(SEL *)(v50 + 3688)];
    if (!v54)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    uint64_t v55 = v54;
    uint64_t v56 = (void (*)(void))[objc_allocWithZone(MEMORY[0x263F6E278]) *(SEL *)(v50 + 3688)];
    if (!v56) {
      break;
    }
    uint64_t v57 = v56;
    v446 = v55;
    uint64_t v447 = v47;
    objc_msgSend(v53, sel_setMessageSignals_, v55);
    v448 = v57;
    objc_msgSend(v53, sel_setPhoneCallSignals_, v57);
    uint64_t v58 = v451;
    v452[0] = (uint64_t)v451;
    v452[1] = v5;
    uint64_t v453 = 0x6C7070612E6D6F63;
    unint64_t v454 = 0xE900000000000065;
    sub_25D203CC4();
    sub_25D203D10();
    uint64_t v59 = (uint64_t)v58;
    objc_msgSend(v53, sel_setIsFirstPartyApp_, sub_25D53E180() & 1);
    if (v58 == v442 && v5 == v45) {
      char v61 = 1;
    }
    else {
      char v61 = sub_25D53F090();
    }
    uint64_t v62 = v443;
    objc_msgSend(v53, sel_setIsResolvedApp_, v61 & 1);
    if (v62) {
      sub_25D52D2A0(v59, v5, v62);
    }
    else {
      char v63 = 0;
    }
    objc_msgSend(v53, sel_setIsResolvedContactInApp_, v63 & 1);
    id v64 = v53;
    swift_bridgeObjectRetain_n();
    id v65 = v64;
    uint64_t v66 = sub_25D53DC00();
    os_log_type_t v67 = sub_25D53E7B0();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      v452[0] = OUTLINED_FUNCTION_30();
      *(_DWORD *)uint64_t v68 = v432;
      swift_bridgeObjectRetain();
      uint64_t v453 = sub_25D19E114((uint64_t)v451, v5, v452);
      sub_25D53EA80();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v68 + 12) = 1024;
      unsigned int v69 = objc_msgSend(v65, sel_isResolvedApp);

      LODWORD(v453) = v69;
      sub_25D53EA80();

      *(_WORD *)(v68 + 18) = 1024;
      unsigned int v70 = objc_msgSend(v65, sel_isResolvedContactInApp);

      LODWORD(v453) = v70;
      sub_25D53EA80();

      _os_log_impl(&dword_25D16D000, v66, v67, "#AppSelectionSignalCollection: app %s: isResolvedApp=%{BOOL}d, isResolvedContactInApp=%{BOOL}d", (uint8_t *)v68, 0x18u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      uint64_t v50 = 0x265507000;
      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v7 = v448;
    id v71 = [objc_allocWithZone(MEMORY[0x263F6E2A0]) *(SEL *)(v50 + 3688)];
    if (v71)
    {
      uint64_t v72 = v71;
      id v73 = [objc_allocWithZone(MEMORY[0x263F6E290]) *(SEL *)(v50 + 3688)];
      if (v73)
      {
        id v74 = v73;
        id v75 = [objc_allocWithZone(MEMORY[0x263F6E298]) *(SEL *)(v50 + 3688)];
        if (v75)
        {
          id v76 = v75;
          objc_msgSend(v72, sel_setContactDependentMessageSignals_, v74);
          objc_msgSend(v72, sel_setContactDependentPhoneCallSignals_, v76);
          objc_msgSend(v65, sel_setContactDependentSignals_, v72);

          uint64_t v72 = v74;
          id v74 = v76;
        }

        uint64_t v72 = v74;
      }
    }
    id v77 = v65;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v78 = v455;
    v452[0] = (uint64_t)v455;
    unint64_t v79 = sub_25D222ED4();
    if (__OFADD__(v78[2], (v80 & 1) == 0)) {
      goto LABEL_69;
    }
    unint64_t v81 = v79;
    char v82 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751D0);
    char v83 = sub_25D53EE40();
    uint64_t v45 = v445;
    if (v83)
    {
      unint64_t v84 = sub_25D222ED4();
      if ((v82 & 1) != (v85 & 1))
      {
        sub_25D53F110();
        __break(1u);
        return;
      }
      unint64_t v81 = v84;
    }
    uint64_t v86 = (void *)v452[0];
    if (v82)
    {
      uint64_t v87 = *(void *)(v452[0] + 56);
      uint64_t v88 = v452[0];

      *(void *)(v87 + 8 * v81) = v77;
    }
    else
    {
      *(void *)(v452[0] + 8 * (v81 >> 6) + 64) |= 1 << v81;
      uint64_t v89 = (void (**)(void))(v86[6] + 16 * v81);
      *uint64_t v89 = v451;
      v89[1] = (void (*)(void))v5;
      *(void *)(v86[7] + 8 * v81) = v77;
      uint64_t v90 = v86[2];
      BOOL v91 = __OFADD__(v90, 1);
      uint64_t v92 = v90 + 1;
      if (v91) {
        goto LABEL_70;
      }
      v86[2] = v92;
      uint64_t v88 = (uint64_t)v86;
      swift_bridgeObjectRetain();
    }
    v48 += 2;
    uint64_t v449 = v88;
    v455 = (void *)v88;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v47 = v447 - 1;
    uint64_t v50 = (uint64_t)&off_265507000;
    if (v447 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_59:
  swift_bridgeObjectRelease();

LABEL_60:
  v403 = (void *)sub_25D53DC00();
  os_log_type_t v404 = sub_25D53E7C0();
  if (OUTLINED_FUNCTION_29(v404))
  {
    *(_WORD *)OUTLINED_FUNCTION_20_0() = 0;
    OUTLINED_FUNCTION_12_3(&dword_25D16D000, v405, v406, "#AppSelectionSignalCollection: failed to construct instrumented signals)");
    OUTLINED_FUNCTION_3_0();
  }

LABEL_63:
  OUTLINED_FUNCTION_36_0();
}

void sub_25D533D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4_74();
  unint64_t v8 = OUTLINED_FUNCTION_51_27();
  if (v9)
  {
    OUTLINED_FUNCTION_36_45(v8);
    OUTLINED_FUNCTION_109_3();
    id v10 = objc_msgSend(v5, sel_contactDependentSignals);
    id v14 = [v10 *v7];

    if (v14)
    {
      objc_msgSend(v6, sel_floatValue);
      [v14 *v4];
      OUTLINED_FUNCTION_8_58();

      return;
    }
LABEL_7:
    OUTLINED_FUNCTION_8_58();
    return;
  }
  OUTLINED_FUNCTION_8_58();
  swift_bridgeObjectRelease();
}

void sub_25D533E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4_74();
  unint64_t v7 = OUTLINED_FUNCTION_51_27();
  if (v8)
  {
    OUTLINED_FUNCTION_36_45(v7);
    OUTLINED_FUNCTION_109_3();
    id v9 = objc_msgSend(v4, sel_contactDependentSignals);
    id v22 = [v9 *v6];

    if (v22)
    {
      id v10 = objc_msgSend(v5, sel_intValue);
      OUTLINED_FUNCTION_35_36((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, v21, v22);
      OUTLINED_FUNCTION_8_58();

      return;
    }
LABEL_7:
    OUTLINED_FUNCTION_8_58();
    return;
  }
  OUTLINED_FUNCTION_8_58();
  swift_bridgeObjectRelease();
}

void sub_25D533F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4_74();
  unint64_t v8 = OUTLINED_FUNCTION_51_27();
  if (v9)
  {
    OUTLINED_FUNCTION_36_45(v8);
    OUTLINED_FUNCTION_109_3();
    id v13 = [v5 *v7];

    if (v13)
    {
      objc_msgSend(v6, sel_floatValue);
      [v13 *v4];
      OUTLINED_FUNCTION_8_58();

      return;
    }
LABEL_7:
    OUTLINED_FUNCTION_8_58();
    return;
  }
  OUTLINED_FUNCTION_8_58();
  swift_bridgeObjectRelease();
}

void sub_25D534044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4_74();
  unint64_t v7 = OUTLINED_FUNCTION_51_27();
  if (v8)
  {
    OUTLINED_FUNCTION_36_45(v7);
    OUTLINED_FUNCTION_109_3();
    id v21 = [v4 *v6];

    if (v21)
    {
      id v9 = objc_msgSend(v5, sel_intValue);
      OUTLINED_FUNCTION_35_36((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16, v20, v21);
      OUTLINED_FUNCTION_8_58();

      return;
    }
LABEL_7:
    OUTLINED_FUNCTION_8_58();
    return;
  }
  OUTLINED_FUNCTION_8_58();
  swift_bridgeObjectRelease();
}

void sub_25D534118(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_25D222ED4();
    if (v7)
    {
      id v8 = *(id *)(*(void *)(a4 + 56) + 8 * v6);
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setIsForegroundApp_, objc_msgSend(a3, sel_integerValue) == (id)1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void sub_25D534204(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_25D222ED4();
    if (v7)
    {
      id v8 = *(id *)(*(void *)(a4 + 56) + 8 * v6);
      swift_bridgeObjectRelease();
      objc_msgSend(a3, sel_floatValue);
      objc_msgSend(v8, sel_setAppTimeSpentAffinityScore_);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void sub_25D5342E8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_25D222ED4();
    if (v7)
    {
      id v8 = *(id *)(*(void *)(a4 + 56) + 8 * v6);
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setAppTimeSpentInSec_, objc_msgSend(a3, sel_longLongValue));
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void sub_25D5343D0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_43_31();
    unint64_t v5 = sub_25D222ED4();
    if (v6)
    {
      id v19 = OUTLINED_FUNCTION_36_45(v5);
      swift_bridgeObjectRelease();
      id v7 = objc_msgSend(a3, sel_intValue);
      OUTLINED_FUNCTION_35_36((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, v18, v19);
      OUTLINED_FUNCTION_8_58();
    }
    else
    {
      OUTLINED_FUNCTION_8_58();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_8_58();
  }
}

void sub_25D5344A4()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6751B8);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_23_51(v5, v65[0]);
  uint64_t v6 = sub_25D53A760();
  OUTLINED_FUNCTION_0_3();
  uint64_t v69 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_40_2();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  id v77 = (char *)v65 - v13;
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25D53DC10();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26A688F10);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v76 = v15;
  uint64_t v16 = sub_25D53DC00();
  os_log_type_t v17 = sub_25D53E7B0();
  uint64_t v18 = v16;
  BOOL v19 = os_log_type_enabled(v16, v17);
  uint64_t v78 = v6;
  uint64_t v74 = v11;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    v83[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315394;
    swift_beginAccess();
    uint64_t v21 = *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66FF28);
    MEMORY[0x2611ABC30](v21, v22);
    swift_bridgeObjectRelease();
    uint64_t v23 = OUTLINED_FUNCTION_52_26();
    v80[0] = sub_25D19E114(v23, v24, v25);
    sub_25D53EA80();
    OUTLINED_FUNCTION_50_22();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_25D53E0D0();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    v80[0] = sub_25D19E114(v26, v28, v83);
    uint64_t v6 = v78;
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D16D000, v18, v17, "#AppSelectionSignalCollection: instrumenting instrumentations=%s, signalValues=%s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_50_22();
  }
  swift_beginAccess();
  uint64_t v29 = *(void *)(v1 + 56);
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v31 = v73;
  if (v30)
  {
    uint64_t v32 = v29 + 32;
    uint64_t v75 = v69 + 16;
    id v71 = (void (**)(char *, uint64_t, uint64_t))(v69 + 32);
    unsigned int v70 = (void (**)(uint64_t, uint64_t))(v69 + 8);
    v65[1] = v29;
    swift_bridgeObjectRetain();
    *(void *)&long long v33 = 136315138;
    long long v68 = v33;
    uint64_t v67 = MEMORY[0x263F8EE58] + 8;
    *(void *)&long long v33 = 136315394;
    long long v66 = v33;
    uint64_t v72 = v3;
    do
    {
      sub_25D17DB88(v32, (uint64_t)v83);
      uint64_t v34 = v84;
      uint64_t v35 = v85;
      __swift_project_boxed_opaque_existential_0(v83, v84);
      sub_25D4CA134(v34, v35);
      if (*(void *)(v3 + 16) && (unint64_t v36 = sub_25D222ED4(), (v37 & 1) != 0))
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v69 + 16))(v31, *(void *)(v3 + 56) + *(void *)(v69 + 72) * v36, v6);
        uint64_t v38 = 0;
      }
      else
      {
        uint64_t v38 = 1;
      }
      __swift_storeEnumTagSinglePayload(v31, v38, 1, v6);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_10(v31);
      if (v39)
      {
        sub_25D1797C8(v31, &qword_26A6751B8);
        sub_25D17DB88((uint64_t)v83, (uint64_t)v80);
        uint64_t v40 = sub_25D53DC00();
        os_log_type_t v41 = sub_25D53E7B0();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = OUTLINED_FUNCTION_26();
          uint64_t v79 = OUTLINED_FUNCTION_30();
          *(_DWORD *)uint64_t v42 = v68;
          __swift_project_boxed_opaque_existential_0(v80, v81);
          uint64_t v43 = OUTLINED_FUNCTION_44_32();
          uint64_t v45 = sub_25D4CA134(v43, v44);
          *(void *)(v42 + 4) = sub_25D19E114(v45, v46, &v79);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v80);
          _os_log_impl(&dword_25D16D000, v40, v41, "#AppSelectionSignalCollection signal=[%s]: cannot find collected value", (uint8_t *)v42, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v80);
        }

        uint64_t v6 = v78;
      }
      else
      {
        (*v71)(v77, v31, v6);
        sub_25D17DB88((uint64_t)v83, (uint64_t)v80);
        uint64_t v47 = v74;
        OUTLINED_FUNCTION_64_17();
        v48();
        long long v49 = sub_25D53DC00();
        os_log_type_t v50 = sub_25D53E7B0();
        BOOL v51 = os_log_type_enabled(v49, v50);
        id v52 = v70;
        if (v51)
        {
          uint64_t v53 = swift_slowAlloc();
          uint64_t v79 = swift_slowAlloc();
          *(_DWORD *)uint64_t v53 = v66;
          uint64_t v55 = v81;
          uint64_t v54 = v82;
          __swift_project_boxed_opaque_existential_0(v80, v81);
          uint64_t v56 = sub_25D4CA134(v55, v54);
          *(void *)(v53 + 4) = sub_25D19E114(v56, v57, &v79);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v80);
          *(_WORD *)(v53 + 12) = 2080;
          uint64_t v58 = v74;
          uint64_t v59 = sub_25D53A750();
          *(void *)(v53 + 14) = sub_25D19E114(v59, v60, &v79);
          swift_bridgeObjectRelease();
          char v61 = *v52;
          v61(v58, v78);
          _os_log_impl(&dword_25D16D000, v49, v50, "#AppSelectionSignalCollection signal=[%s]: instrumenting value=%s", (uint8_t *)v53, 0x16u);
          swift_arrayDestroy();
          uint64_t v6 = v78;
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v80);
          char v61 = *v52;
          v61(v47, v6);
        }

        uint64_t v62 = v84;
        uint64_t v63 = v85;
        __swift_project_boxed_opaque_existential_0(v83, v84);
        id v64 = v77;
        (*(void (**)(char *, uint64_t, uint64_t))(v63 + 24))(v77, v62, v63);
        v61((uint64_t)v64, v6);
        uint64_t v3 = v72;
        uint64_t v31 = v73;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
      v32 += 40;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D534C3C()
{
  swift_release();
  sub_25D538880();
  OUTLINED_FUNCTION_37();
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_28_45();
  v2();
  OUTLINED_FUNCTION_28_45();
  v2();
  OUTLINED_FUNCTION_28_45();
  v2();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalGatherer);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalFactory);
  sub_25D1797C8(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_userDefaults, &qword_26A66FD40);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_userPresonaSignalCollector);

  sub_25D1797C8(v0 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_crrCommsAppSelectionJointId, &qword_26A66F528);
  return v0;
}

uint64_t sub_25D534D64()
{
  sub_25D534C3C();
  return swift_deallocClassInstance();
}

uint64_t sub_25D534DBC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25D53AAE0();
  uint64_t v3 = sub_25D53A8C0();
  swift_allocObject();
  uint64_t result = sub_25D53A8B0();
  uint64_t v5 = MEMORY[0x263F74618];
  a2[3] = v3;
  a2[4] = v5;
  *a2 = result;
  return result;
}

void sub_25D534E3C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25D534E60()
{
  return type metadata accessor for AppSelectionSignalCollector();
}

uint64_t type metadata accessor for AppSelectionSignalCollector()
{
  uint64_t result = qword_26A6751A0;
  if (!qword_26A6751A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25D534EB0()
{
  sub_25D538880();
  if (v0 <= 0x3F)
  {
    sub_25D534FC8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_25D534FC8()
{
  if (!qword_26A6751B0)
  {
    sub_25D538880();
    unint64_t v0 = sub_25D53EA60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6751B0);
    }
  }
}

uint64_t type metadata accessor for ExperimentSignalFactory()
{
  return self;
}

void sub_25D535044(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D1B4A60(a2, (uint64_t)v8, &qword_26A66F528);
  uint64_t v9 = sub_25D538880();
  uint64_t v10 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
  {
    uint64_t v10 = (void *)sub_25D538850();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  objc_msgSend(v3, sel_emitMessage_isolatedStreamUUID_, a1, v10);
}

void sub_25D535158()
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v1 = v0;
  uint64_t v15 = v2;
  sub_25D538880();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_78_1();
  sub_25D538870();
  uint64_t v4 = sub_25D538840();
  unint64_t v6 = v5;
  uint64_t v7 = OUTLINED_FUNCTION_44_32();
  v8(v7);
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25D53DC10();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A688F10);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_25D53DC00();
  os_log_type_t v11 = sub_25D53E7B0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_26();
    uint64_t v16 = OUTLINED_FUNCTION_30();
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25D19E114(v4, v6, &v16);
    OUTLINED_FUNCTION_90_0(v13);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D16D000, v10, v11, "#AppSelectionSignalCollection: starting SignalGatherer#gatherValuesAndTimings (%s)...", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_25D53A7F0();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_43_31();
  sub_25D53A7E0();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v4;
  v14[3] = v6;
  v14[4] = v15;
  v14[5] = v1;
  swift_retain();
  sub_25D53A7D0();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D5353E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (qword_26A66E778 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25D53DC10();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A688F10);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_25D53DC00();
  os_log_type_t v10 = sub_25D53E7B0();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v14 = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_25D19E114(a2, a3, &v14);
    sub_25D53EA80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D16D000, v9, v10, "#AppSelectionSignalCollection: starting SignalGatherer#gatherValuesAndTimings (%s) complete", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611AD370](v12, -1, -1);
    MEMORY[0x2611AD370](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return a4(a1);
}

uint64_t sub_25D5355CC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExperimentSignalGatherer()
{
  return self;
}

uint64_t sub_25D535600()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25D535640(uint64_t a1)
{
  return sub_25D5353E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
}

uint64_t sub_25D53564C()
{
  return sub_25D535734(&qword_26A675240);
}

uint64_t sub_25D535658()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A673260);
  OUTLINED_FUNCTION_12_63();
  OUTLINED_FUNCTION_54_25();
  OUTLINED_FUNCTION_23_36();
  return swift_deallocClassInstance();
}

uint64_t sub_25D535698()
{
  swift_arrayDestroy();
  OUTLINED_FUNCTION_23_36();
  return swift_deallocClassInstance();
}

uint64_t sub_25D5356D4()
{
  return sub_25D535734(&qword_26A675238);
}

uint64_t sub_25D5356E0()
{
  sub_25D53C830();
  OUTLINED_FUNCTION_12_63();
  OUTLINED_FUNCTION_54_25();
  OUTLINED_FUNCTION_23_36();
  return swift_deallocClassInstance();
}

uint64_t sub_25D53571C()
{
  return sub_25D535734(&qword_26A66FF20);
}

uint64_t sub_25D535728()
{
  return sub_25D535734(&qword_26A66FF40);
}

uint64_t sub_25D535734(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_23_36();
  return swift_deallocClassInstance();
}

uint64_t sub_25D535788(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

void sub_25D535798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D5357C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D5357F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D53584C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533D80(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D5358A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D5358D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D5358FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25D535980()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25D5359B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25D5359E4()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_23_36();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25D535A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

unint64_t sub_25D535A6C()
{
  unint64_t result = qword_26A675200;
  if (!qword_26A675200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675200);
  }
  return result;
}

void sub_25D535AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533E78(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D533F68(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D534044(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F30(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25D534118(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F38(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25D5343D0(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F5C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25D534204(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F64(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25D5342E8(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25D535F6C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25D5343D0(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25D535F90(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(v2 + 16))(*a1, a1[1], *a2);
}

void sub_25D535FC8(uint64_t a1, void *a2)
{
  sub_25D17DBEC(0, &qword_26A6751C8);
  id v3 = (id)sub_25D53E4A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setInferenceCommsAppSelectionTrainingAppDependentSignals_, v3);
}

uint64_t sub_25D536050(uint64_t a1)
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

uint64_t sub_25D5360D0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25D536108(void *a1)
{
  return sub_25D5310A8(a1, *(void **)(v1 + 16), (const char **)&selRef_setRequestOriginLocale_);
}

id sub_25D53612C(void *a1)
{
  return sub_25D5310A8(a1, *(void **)(v1 + 16), (const char **)&selRef_setRequestOriginLanguage_);
}

id sub_25D536150(void *a1)
{
  return sub_25D5310A8(a1, *(void **)(v1 + 16), (const char **)&selRef_setCommunicationType_);
}

id sub_25D536174(void *a1)
{
  return sub_25D5310F4(a1, *(void **)(v1 + 16));
}

uint64_t sub_25D53617C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

id sub_25D5361A8(id result, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 1)
  {
    id v5 = result;
    swift_bridgeObjectRetain();
    return v5;
  }
  else if (!a4)
  {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25D536208()
{
  return sub_25D530A80();
}

uint64_t sub_25D536210(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25D536254()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25D5362AC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  os_log_type_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *os_log_type_t v11 = v2;
  v11[1] = sub_25D536388;
  return sub_25D52F6A0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25D536388()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25D536454()
{
  return sub_25D52E670(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t objectdestroy_345Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25D5364C4(uint64_t a1)
{
  sub_25D52E724(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_25D5364D0()
{
  sub_25D53DBF0();
  OUTLINED_FUNCTION_37();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_25D536594(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_25D53DBF0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(uint8_t **)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v6);
  uint64_t v9 = *(char **)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_25D52EE18(a1, v1 + v4, v7, v8, v9);
}

uint64_t sub_25D536648(unint64_t a1)
{
  return sub_25D52E240(a1, *(void (**)(uint64_t))(v1 + 16));
}

void sub_25D536650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_45_0();
  uint64_t v49 = v24;
  uint64_t v50 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v47 = v30;
  uint64_t v48 = v31;
  int v46 = v32;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_36();
  uint64_t v36 = v35 - v34;
  uint64_t v55 = type metadata accessor for ExperimentSignalGatherer();
  uint64_t v56 = &off_270A4F2E8;
  v54[0] = v29;
  uint64_t v52 = type metadata accessor for ExperimentSignalFactory();
  uint64_t v53 = &off_270A4F2F8;
  v51[0] = v27;
  type metadata accessor for AppSelectionSignalCollector();
  uint64_t v37 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, v55);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_78_1();
  (*(void (**)(uint64_t *))(v39 + 16))(v29);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_37_0();
  (*(void (**)(void **))(v41 + 16))(v23);
  uint64_t v42 = *v29;
  uint64_t v43 = *v23;
  OUTLINED_FUNCTION_59_1();
  v44();
  sub_25D536868(v46, v47, v48, v49, v36, v42, v43, v50, a21, v37, a22, a23);
  OUTLINED_FUNCTION_28_45();
  v45();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v54);
  OUTLINED_FUNCTION_36_0();
}

uint64_t sub_25D536868(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v53 = a7;
  uint64_t v55 = a3;
  LODWORD(v54) = a1;
  v47[0] = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v51 = (uint64_t)v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v49 = (uint64_t)v47 - v20;
  uint64_t v50 = sub_25D538880();
  uint64_t v21 = *(void *)(v50 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v50);
  uint64_t v52 = (uint64_t)v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v48 = (char *)v47 - v24;
  v71[3] = a11;
  v71[4] = a12;
  uint64_t v57 = a12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v71);
  uint64_t v26 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32);
  uint64_t v56 = boxed_opaque_existential_0;
  v26(boxed_opaque_existential_0, a5, a11);
  uint64_t v27 = type metadata accessor for ExperimentSignalGatherer();
  v70[3] = v27;
  v70[4] = &off_270A4F2E8;
  v70[0] = a6;
  v69[3] = type metadata accessor for ExperimentSignalFactory();
  v69[4] = &off_270A4F2F8;
  v69[0] = v53;
  uint64_t v53 = a2;
  *(void *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_intent) = sub_25D53E980();
  *(_DWORD *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_appResolutionType) = v54;
  *(void *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_shadowAppResolution) = a4;
  sub_25D17DB88((uint64_t)v70, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalGatherer);
  sub_25D17DB88((uint64_t)v71, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_messageStream);
  sub_25D17DB88((uint64_t)v69, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_signalFactory);
  uint64_t v54 = a8;
  uint64_t v28 = a8;
  uint64_t v29 = v47[0];
  sub_25D1B4A60(v28, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_userDefaults, &qword_26A66FD40);
  sub_25D1B4A60(v29, (uint64_t)&v64, &qword_26A6735B0);
  v47[1] = a4;
  if (v65)
  {
    sub_25D188958(&v64, (uint64_t)&v66);
    swift_retain();
  }
  else
  {
    uint64_t v30 = qword_26A66E6B8;
    swift_retain();
    if (v30 != -1) {
      swift_once();
    }
    uint64_t v31 = qword_26A688B10;
    uint64_t v62 = type metadata accessor for EligibleAppFinder();
    uint64_t v63 = sub_25D536DE8(&qword_26A670BD0, (void (*)(uint64_t))type metadata accessor for EligibleAppFinder);
    *(void *)&long long v61 = v31;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = 0x4024000000000000;
    uint64_t v59 = v27;
    unint64_t v60 = &off_270A4F2E8;
    *(void *)&long long v58 = v32;
    uint64_t v67 = &type metadata for UserPersonaSignalCollector;
    long long v68 = &off_270A4F2A0;
    uint64_t v33 = swift_allocObject();
    uint64_t v34 = (uint64_t *)(v33 + 16);
    *(void *)&long long v66 = v33;
    swift_retain();
    sub_25D522BCC(&v61, &v58, v34);
    sub_25D1797C8((uint64_t)&v64, &qword_26A6735B0);
  }
  uint64_t v35 = v50;
  sub_25D188958(&v66, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_userPresonaSignalCollector);
  uint64_t v36 = v49;
  sub_25D1A5C44(v49);
  if (__swift_getEnumTagSinglePayload(v36, 1, v35) == 1)
  {
    uint64_t v37 = v48;
    sub_25D538870();
    sub_25D1797C8(v36, &qword_26A66F528);
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
  }
  else
  {
    uint64_t v39 = v36;
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
    uint64_t v37 = v48;
    v38(v48, v39, v35);
  }
  v38((char *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_requestID), (uint64_t)v37, v35);
  uint64_t v40 = v52;
  sub_25D1A62F8(v52);
  v38((char *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_inferenceID), v40, v35);
  uint64_t v41 = v51;
  uint64_t v42 = v53;
  sub_25D2EAF5C(v51);
  sub_25D536E78(v41, a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_crrCommsAppSelectionJointId);
  sub_25D538870();

  swift_release();
  sub_25D1797C8(v29, &qword_26A6735B0);
  sub_25D1797C8(v54, &qword_26A66FD40);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
  v38((char *)(a10 + OBJC_IVAR____TtC16SiriMessagesFlow27AppSelectionSignalCollector_isolatedID), v40, v35);
  uint64_t v43 = sub_25D52E178;
  uint64_t v44 = v55;
  if (v55)
  {
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = v44;
    uint64_t v43 = sub_25D536EE0;
  }
  else
  {
    uint64_t v45 = 0;
  }
  *(void *)(a10 + 16) = v43;
  *(void *)(a10 + 24) = v45;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v71);
  return a10;
}

uint64_t sub_25D536DE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D536E30()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_25D536E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A66F528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D536EE0(uint64_t (*a1)(void))
{
  return a1(*(void *)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_1_57()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_74()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_48(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_47(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25D4CCC6C(v5, a2, v8, v7, a5, v6);
}

uint64_t OUTLINED_FUNCTION_20_53(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_23_51@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

id OUTLINED_FUNCTION_35_36(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = *v10;
  return objc_msgSend(a10, v12, a1);
}

id OUTLINED_FUNCTION_36_45(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)(v1 + 56) + 8 * a1);
  return v3;
}

uint64_t OUTLINED_FUNCTION_42_34(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_43_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_34()
{
  return sub_25D53E2F0();
}

void *OUTLINED_FUNCTION_48_26()
{
  uint64_t v4 = *(void *)(v2 - 248);
  return sub_25D40B4D4(v0, v4, v1, 0);
}

uint64_t OUTLINED_FUNCTION_50_22()
{
  return swift_release_n();
}

unint64_t OUTLINED_FUNCTION_51_27()
{
  return sub_25D222ED4();
}

uint64_t OUTLINED_FUNCTION_52_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54_25()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_56_29()
{
  return 0;
}

void OUTLINED_FUNCTION_61_20()
{
  sub_25D4CCF1C();
}

void OUTLINED_FUNCTION_62_21()
{
  sub_25D4CCF1C();
}

void *OUTLINED_FUNCTION_65_21()
{
  uint64_t v3 = *(void **)(v1 - 224);
  uint64_t v4 = *(void *)(v1 - 248);
  return sub_25D40B4D4(v3, v4, v0, 1);
}

void *OUTLINED_FUNCTION_66_17()
{
  uint64_t v3 = *(void **)(v1 - 224);
  uint64_t v4 = *(void *)(v1 - 248);
  return sub_25D40B4D4(v3, v4, v0, 0);
}

uint64_t sub_25D5373E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  type metadata accessor for MessagesDialogContext.Builder();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  sub_25D17B590(a1);
  swift_release();
  sub_25D49BB7C(a2);
  swift_release();
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v3 + 144))(inited);
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_25D537480()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  return result;
}

void *sub_25D53748C(uint64_t a1)
{
  v1[2] = 0;
  v1[3] = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  swift_retain();
  swift_retain();
  swift_release();
  v1[4] = v2;
  return v1;
}

double sub_25D5374E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v5 = a1 == 0x61737265766E6F63 && a2 == 0xEC0000006E6F6974;
  if (!v5 && (sub_25D53F090() & 1) == 0)
  {
    BOOL v10 = a1 == 0x52676E6964616572 && a2 == 0xEE00747365757165;
    if (v10 || (sub_25D53F090() & 1) != 0)
    {
      uint64_t v8 = *(void *)(v3 + 32);
      if (v8)
      {
        uint64_t v9 = type metadata accessor for MessagesReadingRequestDialogContext();
        goto LABEL_15;
      }
    }
LABEL_18:
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 24);
  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v9 = type metadata accessor for MessagesConversationDialogContext();
LABEL_15:
  *(void *)(a3 + 24) = v9;
  *(void *)a3 = v8;
  swift_retain();
  return result;
}

uint64_t sub_25D537624(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A675258);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v4);
  *(void *)(v1 + 16) = 0;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25D537E6C();
  sub_25D53F230();
  if (v2)
  {

    type metadata accessor for MessagesDialogContext();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for MessagesConversationDialogContext();
    sub_25D537EB8(&qword_26A674320, 255, (void (*)(uint64_t))type metadata accessor for MessagesConversationDialogContext);
    OUTLINED_FUNCTION_1_58();
    *(void *)(v1 + 24) = v8;
    type metadata accessor for MessagesReadingRequestDialogContext();
    sub_25D537EB8(&qword_26A673670, 255, (void (*)(uint64_t))type metadata accessor for MessagesReadingRequestDialogContext);
    OUTLINED_FUNCTION_1_58();
    uint64_t v6 = OUTLINED_FUNCTION_4_56();
    v7(v6);
    *(void *)(v1 + 32) = v8;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v1;
}

uint64_t sub_25D53783C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A675268);
  OUTLINED_FUNCTION_9_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  BOOL v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25D537E6C();
  sub_25D53F240();
  uint64_t v13 = *(void *)(v3 + 24);
  HIBYTE(v12) = 0;
  type metadata accessor for MessagesConversationDialogContext();
  sub_25D537EB8(&qword_26A674328, 255, (void (*)(uint64_t))type metadata accessor for MessagesConversationDialogContext);
  OUTLINED_FUNCTION_2_75();
  if (!v2)
  {
    uint64_t v13 = *(void *)(v3 + 32);
    HIBYTE(v12) = 1;
    type metadata accessor for MessagesReadingRequestDialogContext();
    sub_25D537EB8(&qword_26A673678, 255, (void (*)(uint64_t))type metadata accessor for MessagesReadingRequestDialogContext);
    OUTLINED_FUNCTION_2_75();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t sub_25D5379E4()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25D537A14(uint64_t a1)
{
  OUTLINED_FUNCTION_3_74();
  uint64_t v2 = swift_allocObject();
  sub_25D53748C(a1);
  return v2;
}

unint64_t sub_25D537A4C()
{
  return 0xD000000000000016;
}

uint64_t sub_25D537A68()
{
  uint64_t v0 = sub_25D53EF30();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25D537AC0(char a1)
{
  if (a1) {
    return 0x52676E6964616572;
  }
  else {
    return 0x61737265766E6F63;
  }
}

uint64_t sub_25D537B0C(char *a1, char *a2)
{
  return sub_25D1982F0(*a1, *a2);
}

uint64_t sub_25D537B18()
{
  return sub_25D1719C8();
}

uint64_t sub_25D537B20()
{
  return sub_25D172748();
}

uint64_t sub_25D537B28()
{
  return sub_25D1729EC();
}

uint64_t sub_25D537B30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D537A68();
  *a1 = result;
  return result;
}

uint64_t sub_25D537B60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25D537AC0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25D537B8C()
{
  return sub_25D537AC0(*v0);
}

uint64_t sub_25D537B94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D537ABC();
  *a1 = result;
  return result;
}

uint64_t sub_25D537BBC(uint64_t a1)
{
  unint64_t v2 = sub_25D537E6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D537BF8(uint64_t a1)
{
  unint64_t v2 = sub_25D537E6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D537C34()
{
  sub_25D5379E4();
  OUTLINED_FUNCTION_3_74();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessagesDialogContext()
{
  return self;
}

uint64_t sub_25D537C84(void *a1)
{
  OUTLINED_FUNCTION_3_74();
  uint64_t v2 = swift_allocObject();
  sub_25D537624(a1);
  return v2;
}

uint64_t type metadata accessor for MessagesDialogContext.Builder()
{
  return self;
}

uint64_t sub_25D537CF0()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_25D537D04()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_25D537D18()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160))();
}

uint64_t sub_25D537D5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 176))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25D537D98()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 168))();
}

uint64_t sub_25D537DDC(uint64_t a1, uint64_t a2)
{
  return sub_25D537EB8(&qword_26A675248, a2, (void (*)(uint64_t))type metadata accessor for MessagesDialogContext);
}

uint64_t sub_25D537E24(uint64_t a1, uint64_t a2)
{
  return sub_25D537EB8(&qword_26A675250, a2, (void (*)(uint64_t))type metadata accessor for MessagesDialogContext);
}

unint64_t sub_25D537E6C()
{
  unint64_t result = qword_26A675260;
  if (!qword_26A675260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675260);
  }
  return result;
}

uint64_t sub_25D537EB8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for MessagesDialogContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D537FCCLL);
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

ValueMetadata *type metadata accessor for MessagesDialogContext.CodingKeys()
{
  return &type metadata for MessagesDialogContext.CodingKeys;
}

unint64_t sub_25D538008()
{
  unint64_t result = qword_26A675270;
  if (!qword_26A675270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675270);
  }
  return result;
}

unint64_t sub_25D538058()
{
  unint64_t result = qword_26A675278;
  if (!qword_26A675278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675278);
  }
  return result;
}

unint64_t sub_25D5380A8()
{
  unint64_t result = qword_26A675280;
  if (!qword_26A675280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A675280);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_58()
{
  return sub_25D53EF80();
}

uint64_t OUTLINED_FUNCTION_2_75()
{
  return sub_25D53EFF0();
}

uint64_t OUTLINED_FUNCTION_3_74()
{
  return v0;
}

uint64_t sub_25D538160()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_25D538170()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25D538180()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25D538190()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25D5381A0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25D5381B0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25D5381C0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25D5381D0()
{
  return MEMORY[0x270EEE090]();
}

uint64_t sub_25D5381E0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_25D5381F0()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_25D538200()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_25D538210()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_25D538220()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25D538230()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_25D538240()
{
  return MEMORY[0x270EEE1E8]();
}

uint64_t sub_25D538250()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_25D538260()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_25D538270()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25D538280()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25D538290()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25D5382A0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_25D5382B0()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_25D5382C0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25D5382D0()
{
  return MEMORY[0x270EEEA28]();
}

uint64_t sub_25D5382E0()
{
  return MEMORY[0x270EEEA30]();
}

uint64_t sub_25D5382F0()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_25D538300()
{
  return MEMORY[0x270EEEAA8]();
}

uint64_t sub_25D538310()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_25D538320()
{
  return MEMORY[0x270EEEB00]();
}

uint64_t sub_25D538330()
{
  return MEMORY[0x270EEEC10]();
}

uint64_t sub_25D538340()
{
  return MEMORY[0x270EEEC18]();
}

uint64_t sub_25D538350()
{
  return MEMORY[0x270EEEC20]();
}

uint64_t sub_25D538360()
{
  return MEMORY[0x270EEEC28]();
}

uint64_t sub_25D538370()
{
  return MEMORY[0x270EEEC80]();
}

uint64_t sub_25D538380()
{
  return MEMORY[0x270EEEC90]();
}

uint64_t sub_25D538390()
{
  return MEMORY[0x270EEECA8]();
}

uint64_t sub_25D5383A0()
{
  return MEMORY[0x270EEECC0]();
}

uint64_t sub_25D5383B0()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_25D5383C0()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_25D5383D0()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_25D5383E0()
{
  return MEMORY[0x270EEED40]();
}

uint64_t sub_25D5383F0()
{
  return MEMORY[0x270EEED68]();
}

uint64_t sub_25D538400()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_25D538410()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25D538420()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_25D538430()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_25D538440()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_25D538450()
{
  return MEMORY[0x270EEF088]();
}

uint64_t sub_25D538460()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_25D538470()
{
  return MEMORY[0x270EEF0A8]();
}

uint64_t sub_25D538480()
{
  return MEMORY[0x270EEF0D8]();
}

uint64_t sub_25D538490()
{
  return MEMORY[0x270EEF0E0]();
}

uint64_t sub_25D5384A0()
{
  return MEMORY[0x270EEF0E8]();
}

uint64_t sub_25D5384B0()
{
  return MEMORY[0x270EEF0F0]();
}

uint64_t sub_25D5384C0()
{
  return MEMORY[0x270EEF0F8]();
}

uint64_t sub_25D5384D0()
{
  return MEMORY[0x270EEF108]();
}

uint64_t sub_25D5384E0()
{
  return MEMORY[0x270EEF110]();
}

uint64_t sub_25D5384F0()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_25D538500()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_25D538510()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_25D538520()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_25D538530()
{
  return MEMORY[0x270EEF360]();
}

uint64_t sub_25D538540()
{
  return MEMORY[0x270EEF378]();
}

uint64_t sub_25D538550()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_25D538560()
{
  return MEMORY[0x270EEF3F8]();
}

uint64_t sub_25D538570()
{
  return MEMORY[0x270EEF400]();
}

uint64_t sub_25D538580()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_25D538590()
{
  return MEMORY[0x270EEF420]();
}

uint64_t sub_25D5385A0()
{
  return MEMORY[0x270EEF428]();
}

uint64_t sub_25D5385B0()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_25D5385C0()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_25D5385D0()
{
  return MEMORY[0x270EEF810]();
}

uint64_t sub_25D5385E0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25D5385F0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25D538600()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_25D538610()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25D538620()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_25D538630()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25D538640()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25D538650()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25D538660()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25D538670()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25D538680()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25D538690()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_25D5386A0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25D5386B0()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_25D5386C0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25D5386D0()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_25D5386E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25D5386F0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25D538700()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25D538710()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25D538720()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_25D538730()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_25D538740()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25D538750()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_25D538760()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_25D538770()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25D538780()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_25D538790()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25D5387A0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25D5387B0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25D5387C0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25D5387D0()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_25D5387E0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25D5387F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25D538800()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25D538810()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25D538820()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25D538830()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25D538840()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25D538850()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25D538860()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25D538870()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25D538880()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25D538890()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25D5388A0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25D5388B0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_25D5388C0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_25D5388D0()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_25D5388E0()
{
  return MEMORY[0x270EF0E40]();
}

uint64_t sub_25D5388F0()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_25D538900()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_25D538910()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_25D538920()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_25D538930()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_25D538940()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25D538950()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_25D538960()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25D538970()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25D538980()
{
  return MEMORY[0x270EF1090]();
}

uint64_t sub_25D538990()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25D5389A0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_25D5389B0()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_25D5389C0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25D5389D0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25D5389E0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25D5389F0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25D538A00()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_25D538A10()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_25D538A20()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25D538A30()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_25D538A40()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25D538A50()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25D538A80()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_25D538AA0()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_25D538AF0()
{
  return MEMORY[0x270F66388]();
}

uint64_t sub_25D538B10()
{
  return MEMORY[0x270F663F8]();
}

uint64_t sub_25D538BB0()
{
  return MEMORY[0x270F664E0]();
}

uint64_t sub_25D538C60()
{
  return MEMORY[0x270F66618]();
}

uint64_t sub_25D538CC0()
{
  return MEMORY[0x270F66688]();
}

uint64_t sub_25D538D90()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_25D538DF0()
{
  return MEMORY[0x270F667E0]();
}

uint64_t sub_25D538E60()
{
  return MEMORY[0x270F66820]();
}

uint64_t sub_25D538E80()
{
  return MEMORY[0x270F66850]();
}

uint64_t sub_25D538E90()
{
  return MEMORY[0x270F66858]();
}

uint64_t sub_25D538EA0()
{
  return MEMORY[0x270F66860]();
}

uint64_t sub_25D538EC0()
{
  return MEMORY[0x270F66880]();
}

uint64_t sub_25D538ED0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_25D538EE0()
{
  return MEMORY[0x270F66890]();
}

uint64_t sub_25D538EF0()
{
  return MEMORY[0x270F66898]();
}

uint64_t sub_25D538F00()
{
  return MEMORY[0x270F668A0]();
}

uint64_t sub_25D538F10()
{
  return MEMORY[0x270F668B0]();
}

uint64_t sub_25D538F20()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_25D538F30()
{
  return MEMORY[0x270F668C0]();
}

uint64_t sub_25D538F40()
{
  return MEMORY[0x270F66950]();
}

uint64_t sub_25D538F50()
{
  return MEMORY[0x270F66968]();
}

uint64_t sub_25D538F60()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_25D538F70()
{
  return MEMORY[0x270F66988]();
}

uint64_t sub_25D538F80()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_25D538F90()
{
  return MEMORY[0x270F669B8]();
}

uint64_t sub_25D538FA0()
{
  return MEMORY[0x270F66A10]();
}

uint64_t sub_25D538FB0()
{
  return MEMORY[0x270F66A20]();
}

uint64_t sub_25D538FC0()
{
  return MEMORY[0x270F66A28]();
}

uint64_t sub_25D538FD0()
{
  return MEMORY[0x270F66A30]();
}

uint64_t sub_25D538FE0()
{
  return MEMORY[0x270F66A38]();
}

uint64_t sub_25D538FF0()
{
  return MEMORY[0x270F66A40]();
}

uint64_t sub_25D539000()
{
  return MEMORY[0x270F66A48]();
}

uint64_t sub_25D539010()
{
  return MEMORY[0x270F66A50]();
}

uint64_t sub_25D539020()
{
  return MEMORY[0x270F66A58]();
}

uint64_t sub_25D539030()
{
  return MEMORY[0x270F66A68]();
}

uint64_t sub_25D539040()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_25D539050()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_25D539060()
{
  return MEMORY[0x270F66AA8]();
}

uint64_t sub_25D539070()
{
  return MEMORY[0x270F66AB0]();
}

uint64_t sub_25D539080()
{
  return MEMORY[0x270F66AB8]();
}

uint64_t sub_25D539090()
{
  return MEMORY[0x270F66AD0]();
}

uint64_t sub_25D5390A0()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t sub_25D5390B0()
{
  return MEMORY[0x270F66AF0]();
}

uint64_t sub_25D5390C0()
{
  return MEMORY[0x270F66B10]();
}

uint64_t sub_25D5390D0()
{
  return MEMORY[0x270F66B20]();
}

uint64_t sub_25D5390E0()
{
  return MEMORY[0x270F66B28]();
}

uint64_t sub_25D5390F0()
{
  return MEMORY[0x270F66B30]();
}

uint64_t sub_25D539100()
{
  return MEMORY[0x270F66B38]();
}

uint64_t sub_25D539110()
{
  return MEMORY[0x270F66B40]();
}

uint64_t sub_25D539120()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_25D539130()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_25D539140()
{
  return MEMORY[0x270F66B58]();
}

uint64_t sub_25D539150()
{
  return MEMORY[0x270F66B60]();
}

uint64_t sub_25D539160()
{
  return MEMORY[0x270F66B68]();
}

uint64_t sub_25D539170()
{
  return MEMORY[0x270F66B70]();
}

uint64_t sub_25D539180()
{
  return MEMORY[0x270F66B78]();
}

uint64_t sub_25D539190()
{
  return MEMORY[0x270F66B80]();
}

uint64_t sub_25D5391A0()
{
  return MEMORY[0x270F66B88]();
}

uint64_t sub_25D5391B0()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_25D5391C0()
{
  return MEMORY[0x270F66BA0]();
}

uint64_t sub_25D5391D0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_25D5391E0()
{
  return MEMORY[0x270F66CB0]();
}

uint64_t sub_25D5391F0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_25D539220()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_25D539230()
{
  return MEMORY[0x270F66CF0]();
}

uint64_t sub_25D539240()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_25D539250()
{
  return MEMORY[0x270F66D08]();
}

uint64_t sub_25D539260()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_25D539270()
{
  return MEMORY[0x270F66D20]();
}

uint64_t sub_25D539280()
{
  return MEMORY[0x270F66D28]();
}

uint64_t sub_25D539290()
{
  return MEMORY[0x270F66D30]();
}

uint64_t sub_25D5392A0()
{
  return MEMORY[0x270F66D68]();
}

uint64_t sub_25D5392B0()
{
  return MEMORY[0x270F66D70]();
}

uint64_t sub_25D5392C0()
{
  return MEMORY[0x270F66D78]();
}

uint64_t sub_25D5392D0()
{
  return MEMORY[0x270F66D80]();
}

uint64_t sub_25D5392E0()
{
  return MEMORY[0x270F66D88]();
}

uint64_t sub_25D5392F0()
{
  return MEMORY[0x270F66D90]();
}

uint64_t sub_25D539300()
{
  return MEMORY[0x270F66D98]();
}

uint64_t sub_25D539310()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_25D539320()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_25D539330()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_25D539340()
{
  return MEMORY[0x270F66E38]();
}

uint64_t sub_25D539350()
{
  return MEMORY[0x270F66E40]();
}

uint64_t sub_25D539360()
{
  return MEMORY[0x270F66E58]();
}

uint64_t sub_25D539370()
{
  return MEMORY[0x270F66E60]();
}

uint64_t sub_25D539380()
{
  return MEMORY[0x270F66E70]();
}

uint64_t sub_25D539390()
{
  return MEMORY[0x270F66E78]();
}

uint64_t sub_25D5393A0()
{
  return MEMORY[0x270F66E80]();
}

uint64_t sub_25D5393B0()
{
  return MEMORY[0x270F66E88]();
}

uint64_t sub_25D5393C0()
{
  return MEMORY[0x270F66E90]();
}

uint64_t sub_25D5393D0()
{
  return MEMORY[0x270F66E98]();
}

uint64_t sub_25D5393E0()
{
  return MEMORY[0x270F66EA0]();
}

uint64_t sub_25D5393F0()
{
  return MEMORY[0x270F66EA8]();
}

uint64_t sub_25D539400()
{
  return MEMORY[0x270F66EB0]();
}

uint64_t sub_25D539410()
{
  return MEMORY[0x270F66EB8]();
}

uint64_t sub_25D539420()
{
  return MEMORY[0x270F66EC0]();
}

uint64_t sub_25D539430()
{
  return MEMORY[0x270F66EC8]();
}

uint64_t sub_25D539440()
{
  return MEMORY[0x270F66ED0]();
}

uint64_t sub_25D539450()
{
  return MEMORY[0x270F66EE0]();
}

uint64_t sub_25D539460()
{
  return MEMORY[0x270F66EE8]();
}

uint64_t sub_25D539470()
{
  return MEMORY[0x270F66EF0]();
}

uint64_t sub_25D539480()
{
  return MEMORY[0x270F66EF8]();
}

uint64_t sub_25D539490()
{
  return MEMORY[0x270F66F00]();
}

uint64_t sub_25D5394A0()
{
  return MEMORY[0x270F66F08]();
}

uint64_t sub_25D5394B0()
{
  return MEMORY[0x270F66F68]();
}

uint64_t sub_25D5394C0()
{
  return MEMORY[0x270F66F70]();
}

uint64_t sub_25D5394D0()
{
  return MEMORY[0x270F66F78]();
}

uint64_t sub_25D5394E0()
{
  return MEMORY[0x270F66F88]();
}

uint64_t sub_25D5394F0()
{
  return MEMORY[0x270F66F90]();
}

uint64_t sub_25D539500()
{
  return MEMORY[0x270F66F98]();
}

uint64_t sub_25D539510()
{
  return MEMORY[0x270F66FA0]();
}

uint64_t sub_25D539520()
{
  return MEMORY[0x270F66FB0]();
}

uint64_t sub_25D539530()
{
  return MEMORY[0x270F66FB8]();
}

uint64_t sub_25D539540()
{
  return MEMORY[0x270F66FC0]();
}

uint64_t sub_25D539550()
{
  return MEMORY[0x270F66FC8]();
}

uint64_t sub_25D539560()
{
  return MEMORY[0x270F66FD8]();
}

uint64_t sub_25D539570()
{
  return MEMORY[0x270F66FE0]();
}

uint64_t sub_25D539580()
{
  return MEMORY[0x270F66FE8]();
}

uint64_t sub_25D539590()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_25D5395A0()
{
  return MEMORY[0x270F67008]();
}

uint64_t sub_25D5395B0()
{
  return MEMORY[0x270F67018]();
}

uint64_t sub_25D5395C0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_25D5395D0()
{
  return MEMORY[0x270F67050]();
}

uint64_t sub_25D5395E0()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_25D5395F0()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_25D539600()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_25D539610()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_25D539620()
{
  return MEMORY[0x270F67190]();
}

uint64_t sub_25D539630()
{
  return MEMORY[0x270F671A0]();
}

uint64_t sub_25D539640()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_25D539650()
{
  return MEMORY[0x270F671B0]();
}

uint64_t sub_25D539660()
{
  return MEMORY[0x270F671B8]();
}

uint64_t sub_25D539670()
{
  return MEMORY[0x270F671C8]();
}

uint64_t sub_25D539680()
{
  return MEMORY[0x270F671D0]();
}

uint64_t sub_25D539690()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_25D5396A0()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_25D5396B0()
{
  return MEMORY[0x270F671F8]();
}

uint64_t sub_25D5396C0()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_25D5396D0()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_25D5396E0()
{
  return MEMORY[0x270F67218]();
}

uint64_t sub_25D5396F0()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_25D539700()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_25D539710()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_25D539720()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_25D539730()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_25D539740()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_25D539750()
{
  return MEMORY[0x270F672D8]();
}

uint64_t sub_25D539760()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_25D539770()
{
  return MEMORY[0x270F672F8]();
}

uint64_t sub_25D539780()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_25D539790()
{
  return MEMORY[0x270F67320]();
}

uint64_t sub_25D5397A0()
{
  return MEMORY[0x270F67328]();
}

uint64_t sub_25D5397B0()
{
  return MEMORY[0x270F67330]();
}

uint64_t sub_25D5397C0()
{
  return MEMORY[0x270F67338]();
}

uint64_t sub_25D5397D0()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_25D5397E0()
{
  return MEMORY[0x270F67350]();
}

uint64_t sub_25D5397F0()
{
  return MEMORY[0x270F67360]();
}

uint64_t sub_25D539800()
{
  return MEMORY[0x270F67368]();
}

uint64_t sub_25D539810()
{
  return MEMORY[0x270F67370]();
}

uint64_t sub_25D539820()
{
  return MEMORY[0x270F67380]();
}

uint64_t sub_25D539830()
{
  return MEMORY[0x270F67388]();
}

uint64_t sub_25D539840()
{
  return MEMORY[0x270F67398]();
}

uint64_t sub_25D539850()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_25D539860()
{
  return MEMORY[0x270F673B0]();
}

uint64_t sub_25D539870()
{
  return MEMORY[0x270F67428]();
}

uint64_t sub_25D539880()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_25D539890()
{
  return MEMORY[0x270F67438]();
}

uint64_t sub_25D5398B0()
{
  return MEMORY[0x270F67458]();
}

uint64_t sub_25D5398C0()
{
  return MEMORY[0x270F67460]();
}

uint64_t sub_25D5398E0()
{
  return MEMORY[0x270F674A8]();
}

uint64_t sub_25D5398F0()
{
  return MEMORY[0x270F674C0]();
}

uint64_t sub_25D539900()
{
  return MEMORY[0x270F674C8]();
}

uint64_t sub_25D539910()
{
  return MEMORY[0x270F674F8]();
}

uint64_t sub_25D539920()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_25D539930()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_25D539940()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_25D539950()
{
  return MEMORY[0x270F67518]();
}

uint64_t sub_25D539960()
{
  return MEMORY[0x270F67520]();
}

uint64_t sub_25D539970()
{
  return MEMORY[0x270F67530]();
}

uint64_t sub_25D5399A0()
{
  return MEMORY[0x270F675F8]();
}

uint64_t sub_25D5399B0()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_25D5399C0()
{
  return MEMORY[0x270F67608]();
}

uint64_t sub_25D5399D0()
{
  return MEMORY[0x270F67640]();
}

uint64_t sub_25D5399E0()
{
  return MEMORY[0x270F67648]();
}

uint64_t sub_25D5399F0()
{
  return MEMORY[0x270F67650]();
}

uint64_t sub_25D539A00()
{
  return MEMORY[0x270F67658]();
}

uint64_t sub_25D539A10()
{
  return MEMORY[0x270F67668]();
}

uint64_t sub_25D539A20()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_25D539A30()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_25D539A40()
{
  return MEMORY[0x270F67690]();
}

uint64_t sub_25D539A50()
{
  return MEMORY[0x270F676B0]();
}

uint64_t sub_25D539A60()
{
  return MEMORY[0x270F676B8]();
}

uint64_t sub_25D539A70()
{
  return MEMORY[0x270F676C0]();
}

uint64_t sub_25D539A80()
{
  return MEMORY[0x270F676D0]();
}

uint64_t sub_25D539A90()
{
  return MEMORY[0x270F676D8]();
}

uint64_t sub_25D539AA0()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_25D539AB0()
{
  return MEMORY[0x270F676E8]();
}

uint64_t sub_25D539AC0()
{
  return MEMORY[0x270F676F0]();
}

uint64_t sub_25D539AD0()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_25D539AE0()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_25D539AF0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_25D539B00()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_25D539B10()
{
  return MEMORY[0x270F67760]();
}

uint64_t sub_25D539B20()
{
  return MEMORY[0x270F67768]();
}

uint64_t sub_25D539B30()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_25D539B40()
{
  return MEMORY[0x270F67778]();
}

uint64_t sub_25D539B50()
{
  return MEMORY[0x270F67790]();
}

uint64_t sub_25D539B60()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_25D539B70()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_25D539B80()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_25D539B90()
{
  return MEMORY[0x270F677C8]();
}

uint64_t sub_25D539BA0()
{
  return MEMORY[0x270F677D0]();
}

uint64_t sub_25D539BB0()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_25D539BC0()
{
  return MEMORY[0x270F677E0]();
}

uint64_t sub_25D539BD0()
{
  return MEMORY[0x270F677E8]();
}

uint64_t sub_25D539BE0()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_25D539BF0()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_25D539C00()
{
  return MEMORY[0x270F67808]();
}

uint64_t sub_25D539C10()
{
  return MEMORY[0x270F67818]();
}

uint64_t sub_25D539C20()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_25D539C30()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_25D539C40()
{
  return MEMORY[0x270F67830]();
}

uint64_t sub_25D539C60()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_25D539C70()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_25D539C80()
{
  return MEMORY[0x270F678C8]();
}

uint64_t sub_25D539C90()
{
  return MEMORY[0x270F678D0]();
}

uint64_t sub_25D539CA0()
{
  return MEMORY[0x270F647F0]();
}

uint64_t sub_25D539CB0()
{
  return MEMORY[0x270F678F0]();
}

uint64_t sub_25D539CC0()
{
  return MEMORY[0x270F678F8]();
}

uint64_t sub_25D539CD0()
{
  return MEMORY[0x270F67918]();
}

uint64_t sub_25D539CE0()
{
  return MEMORY[0x270F67920]();
}

uint64_t sub_25D539CF0()
{
  return MEMORY[0x270F67928]();
}

uint64_t sub_25D539D00()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_25D539D10()
{
  return MEMORY[0x270F67948]();
}

uint64_t sub_25D539D20()
{
  return MEMORY[0x270F67958]();
}

uint64_t sub_25D539D30()
{
  return MEMORY[0x270F67960]();
}

uint64_t sub_25D539D40()
{
  return MEMORY[0x270F67970]();
}

uint64_t sub_25D539D50()
{
  return MEMORY[0x270F67978]();
}

uint64_t sub_25D539D60()
{
  return MEMORY[0x270F67980]();
}

uint64_t sub_25D539D70()
{
  return MEMORY[0x270F67990]();
}

uint64_t sub_25D539D80()
{
  return MEMORY[0x270F67998]();
}

uint64_t sub_25D539D90()
{
  return MEMORY[0x270F679D0]();
}

uint64_t sub_25D539DA0()
{
  return MEMORY[0x270F679F8]();
}

uint64_t sub_25D539DB0()
{
  return MEMORY[0x270F67A00]();
}

uint64_t sub_25D539DD0()
{
  return MEMORY[0x270F67A28]();
}

uint64_t sub_25D539DE0()
{
  return MEMORY[0x270F67A30]();
}

uint64_t sub_25D539DF0()
{
  return MEMORY[0x270F67A38]();
}

uint64_t sub_25D539E00()
{
  return MEMORY[0x270F67A48]();
}

uint64_t sub_25D539E10()
{
  return MEMORY[0x270F67A50]();
}

uint64_t sub_25D539E20()
{
  return MEMORY[0x270F67A58]();
}

uint64_t sub_25D539E30()
{
  return MEMORY[0x270F67A60]();
}

uint64_t sub_25D539E40()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_25D539E50()
{
  return MEMORY[0x270F67A80]();
}

uint64_t sub_25D539E60()
{
  return MEMORY[0x270F67AF8]();
}

uint64_t sub_25D539E70()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_25D539E80()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_25D539E90()
{
  return MEMORY[0x270F67B20]();
}

uint64_t sub_25D539EA0()
{
  return MEMORY[0x270F67B28]();
}

uint64_t sub_25D539EB0()
{
  return MEMORY[0x270F67B40]();
}

uint64_t sub_25D539EC0()
{
  return MEMORY[0x270F67B48]();
}

uint64_t sub_25D539ED0()
{
  return MEMORY[0x270F67B50]();
}

uint64_t sub_25D539EE0()
{
  return MEMORY[0x270F67B58]();
}

uint64_t sub_25D539EF0()
{
  return MEMORY[0x270F67B68]();
}

uint64_t sub_25D539F00()
{
  return MEMORY[0x270F67B90]();
}

uint64_t sub_25D539F10()
{
  return MEMORY[0x270F67B98]();
}

uint64_t sub_25D539F20()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t sub_25D539F30()
{
  return MEMORY[0x270F67BB0]();
}

uint64_t sub_25D539F40()
{
  return MEMORY[0x270F67BB8]();
}

uint64_t sub_25D539F50()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_25D539F60()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_25D539FA0()
{
  return MEMORY[0x270F67C40]();
}

uint64_t sub_25D539FB0()
{
  return MEMORY[0x270F67C50]();
}

uint64_t sub_25D539FC0()
{
  return MEMORY[0x270F67C58]();
}

uint64_t sub_25D539FD0()
{
  return MEMORY[0x270F67C60]();
}

uint64_t sub_25D539FE0()
{
  return MEMORY[0x270F67C78]();
}

uint64_t sub_25D539FF0()
{
  return MEMORY[0x270F67C80]();
}

uint64_t sub_25D53A000()
{
  return MEMORY[0x270F67CA8]();
}

uint64_t sub_25D53A010()
{
  return MEMORY[0x270F67CB8]();
}

uint64_t sub_25D53A030()
{
  return MEMORY[0x270F67CD0]();
}

uint64_t sub_25D53A040()
{
  return MEMORY[0x270F67CD8]();
}

uint64_t sub_25D53A060()
{
  return MEMORY[0x270F67CF8]();
}

uint64_t sub_25D53A070()
{
  return MEMORY[0x270F67D08]();
}

uint64_t sub_25D53A080()
{
  return MEMORY[0x270F67D10]();
}

uint64_t sub_25D53A090()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_25D53A0A0()
{
  return MEMORY[0x270F67D30]();
}

uint64_t sub_25D53A0B0()
{
  return MEMORY[0x270F67D38]();
}

uint64_t sub_25D53A0C0()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_25D53A0D0()
{
  return MEMORY[0x270F67D50]();
}

uint64_t sub_25D53A0E0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_25D53A0F0()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_25D53A100()
{
  return MEMORY[0x270F67D88]();
}

uint64_t sub_25D53A110()
{
  return MEMORY[0x270F67D90]();
}

uint64_t sub_25D53A120()
{
  return MEMORY[0x270F67D98]();
}

uint64_t sub_25D53A130()
{
  return MEMORY[0x270F67DA0]();
}

uint64_t sub_25D53A140()
{
  return MEMORY[0x270F67DA8]();
}

uint64_t sub_25D53A150()
{
  return MEMORY[0x270F67DB0]();
}

uint64_t sub_25D53A160()
{
  return MEMORY[0x270F67DB8]();
}

uint64_t sub_25D53A180()
{
  return MEMORY[0x270F67DC8]();
}

uint64_t sub_25D53A190()
{
  return MEMORY[0x270F67DD8]();
}

uint64_t sub_25D53A1A0()
{
  return MEMORY[0x270F67DE0]();
}

uint64_t sub_25D53A1B0()
{
  return MEMORY[0x270F67DE8]();
}

uint64_t sub_25D53A1C0()
{
  return MEMORY[0x270F67E10]();
}

uint64_t sub_25D53A1D0()
{
  return MEMORY[0x270F67E18]();
}

uint64_t sub_25D53A1E0()
{
  return MEMORY[0x270F67E38]();
}

uint64_t sub_25D53A1F0()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_25D53A200()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_25D53A210()
{
  return MEMORY[0x270F67E70]();
}

uint64_t sub_25D53A220()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_25D53A230()
{
  return MEMORY[0x270F67E88]();
}

uint64_t sub_25D53A240()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_25D53A250()
{
  return MEMORY[0x270F67E98]();
}

uint64_t sub_25D53A260()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_25D53A270()
{
  return MEMORY[0x270F67EA8]();
}

uint64_t sub_25D53A280()
{
  return MEMORY[0x270F67EC0]();
}

uint64_t sub_25D53A290()
{
  return MEMORY[0x270F67EC8]();
}

uint64_t sub_25D53A2A0()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_25D53A2B0()
{
  return MEMORY[0x270F67EE8]();
}

uint64_t sub_25D53A2C0()
{
  return MEMORY[0x270F67EF0]();
}

uint64_t sub_25D53A2D0()
{
  return MEMORY[0x270F67EF8]();
}

uint64_t sub_25D53A2E0()
{
  return MEMORY[0x270F67F08]();
}

uint64_t sub_25D53A2F0()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_25D53A300()
{
  return MEMORY[0x270F67F28]();
}

uint64_t sub_25D53A310()
{
  return MEMORY[0x270F67F38]();
}

uint64_t sub_25D53A320()
{
  return MEMORY[0x270F67F40]();
}

uint64_t sub_25D53A330()
{
  return MEMORY[0x270F67F48]();
}

uint64_t sub_25D53A340()
{
  return MEMORY[0x270F67F50]();
}

uint64_t sub_25D53A350()
{
  return MEMORY[0x270F67F60]();
}

uint64_t sub_25D53A360()
{
  return MEMORY[0x270F67F68]();
}

uint64_t sub_25D53A370()
{
  return MEMORY[0x270F67F70]();
}

uint64_t sub_25D53A380()
{
  return MEMORY[0x270F67F78]();
}

uint64_t sub_25D53A390()
{
  return MEMORY[0x270F67FB8]();
}

uint64_t sub_25D53A3A0()
{
  return MEMORY[0x270F67FC0]();
}

uint64_t sub_25D53A3B0()
{
  return MEMORY[0x270F67FC8]();
}

uint64_t sub_25D53A3E0()
{
  return MEMORY[0x270F67FE0]();
}

uint64_t sub_25D53A3F0()
{
  return MEMORY[0x270F67FE8]();
}

uint64_t sub_25D53A4A0()
{
  return MEMORY[0x270F68060]();
}

uint64_t sub_25D53A4B0()
{
  return MEMORY[0x270F680D0]();
}

uint64_t sub_25D53A510()
{
  return MEMORY[0x270F68138]();
}

uint64_t sub_25D53A520()
{
  return MEMORY[0x270F68140]();
}

uint64_t sub_25D53A530()
{
  return MEMORY[0x270F68148]();
}

uint64_t sub_25D53A540()
{
  return MEMORY[0x270F68160]();
}

uint64_t sub_25D53A580()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_25D53A590()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_25D53A5A0()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_25D53A5B0()
{
  return MEMORY[0x270F68208]();
}

uint64_t sub_25D53A5C0()
{
  return MEMORY[0x270F68218]();
}

uint64_t sub_25D53A5D0()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_25D53A5E0()
{
  return MEMORY[0x270F68228]();
}

uint64_t sub_25D53A5F0()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_25D53A600()
{
  return MEMORY[0x270F68250]();
}

uint64_t sub_25D53A610()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_25D53A620()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_25D53A630()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_25D53A640()
{
  return MEMORY[0x270F68278]();
}

uint64_t sub_25D53A650()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_25D53A670()
{
  return MEMORY[0x270F682B0]();
}

uint64_t sub_25D53A680()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_25D53A690()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_25D53A6A0()
{
  return MEMORY[0x270F68380]();
}

uint64_t sub_25D53A6B0()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_25D53A6C0()
{
  return MEMORY[0x270F68390]();
}

uint64_t sub_25D53A6D0()
{
  return MEMORY[0x270F68398]();
}

uint64_t sub_25D53A6E0()
{
  return MEMORY[0x270F683A0]();
}

uint64_t sub_25D53A6F0()
{
  return MEMORY[0x270F683A8]();
}

uint64_t sub_25D53A700()
{
  return MEMORY[0x270F683B0]();
}

uint64_t sub_25D53A710()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_25D53A720()
{
  return MEMORY[0x270F683C0]();
}

uint64_t sub_25D53A730()
{
  return MEMORY[0x270F71090]();
}

uint64_t sub_25D53A740()
{
  return MEMORY[0x270F71098]();
}

uint64_t sub_25D53A750()
{
  return MEMORY[0x270F710A0]();
}

uint64_t sub_25D53A760()
{
  return MEMORY[0x270F710B0]();
}

uint64_t sub_25D53A770()
{
  return MEMORY[0x270F710B8]();
}

uint64_t sub_25D53A780()
{
  return MEMORY[0x270F710C0]();
}

uint64_t sub_25D53A790()
{
  return MEMORY[0x270F710E0]();
}

uint64_t sub_25D53A7A0()
{
  return MEMORY[0x270F710F0]();
}

uint64_t sub_25D53A7B0()
{
  return MEMORY[0x270F71100]();
}

uint64_t sub_25D53A7C0()
{
  return MEMORY[0x270F71108]();
}

uint64_t sub_25D53A7D0()
{
  return MEMORY[0x270F71120]();
}

uint64_t sub_25D53A7E0()
{
  return MEMORY[0x270F71128]();
}

uint64_t sub_25D53A7F0()
{
  return MEMORY[0x270F71130]();
}

uint64_t sub_25D53A800()
{
  return MEMORY[0x270F71138]();
}

uint64_t sub_25D53A810()
{
  return MEMORY[0x270F71148]();
}

uint64_t sub_25D53A820()
{
  return MEMORY[0x270F71150]();
}

uint64_t sub_25D53A830()
{
  return MEMORY[0x270F711F0]();
}

uint64_t sub_25D53A840()
{
  return MEMORY[0x270F711F8]();
}

uint64_t sub_25D53A850()
{
  return MEMORY[0x270F71230]();
}

uint64_t sub_25D53A860()
{
  return MEMORY[0x270F71238]();
}

uint64_t sub_25D53A870()
{
  return MEMORY[0x270F71240]();
}

uint64_t sub_25D53A880()
{
  return MEMORY[0x270F71248]();
}

uint64_t sub_25D53A890()
{
  return MEMORY[0x270F71280]();
}

uint64_t sub_25D53A8A0()
{
  return MEMORY[0x270F71288]();
}

uint64_t sub_25D53A8B0()
{
  return MEMORY[0x270F71290]();
}

uint64_t sub_25D53A8C0()
{
  return MEMORY[0x270F71298]();
}

uint64_t sub_25D53A8D0()
{
  return MEMORY[0x270F712B0]();
}

uint64_t sub_25D53A8E0()
{
  return MEMORY[0x270F712B8]();
}

uint64_t sub_25D53A8F0()
{
  return MEMORY[0x270F712C0]();
}

uint64_t sub_25D53A900()
{
  return MEMORY[0x270F712C8]();
}

uint64_t sub_25D53A910()
{
  return MEMORY[0x270F712D0]();
}

uint64_t sub_25D53A920()
{
  return MEMORY[0x270F712D8]();
}

uint64_t sub_25D53A930()
{
  return MEMORY[0x270F71300]();
}

uint64_t sub_25D53A940()
{
  return MEMORY[0x270F71308]();
}

uint64_t sub_25D53A950()
{
  return MEMORY[0x270F71310]();
}

uint64_t sub_25D53A960()
{
  return MEMORY[0x270F71318]();
}

uint64_t sub_25D53A970()
{
  return MEMORY[0x270F71348]();
}

uint64_t sub_25D53A980()
{
  return MEMORY[0x270F71358]();
}

uint64_t sub_25D53A990()
{
  return MEMORY[0x270F71360]();
}

uint64_t sub_25D53A9A0()
{
  return MEMORY[0x270F71388]();
}

uint64_t sub_25D53A9B0()
{
  return MEMORY[0x270F71390]();
}

uint64_t sub_25D53A9C0()
{
  return MEMORY[0x270F71398]();
}

uint64_t sub_25D53A9D0()
{
  return MEMORY[0x270F713B0]();
}

uint64_t sub_25D53A9E0()
{
  return MEMORY[0x270F713B8]();
}

uint64_t sub_25D53A9F0()
{
  return MEMORY[0x270F713E0]();
}

uint64_t sub_25D53AA00()
{
  return MEMORY[0x270F713F0]();
}

uint64_t sub_25D53AA10()
{
  return MEMORY[0x270F71400]();
}

uint64_t sub_25D53AA20()
{
  return MEMORY[0x270F71428]();
}

uint64_t sub_25D53AA30()
{
  return MEMORY[0x270F71458]();
}

uint64_t sub_25D53AA40()
{
  return MEMORY[0x270F71460]();
}

uint64_t sub_25D53AA50()
{
  return MEMORY[0x270F71498]();
}

uint64_t sub_25D53AA60()
{
  return MEMORY[0x270F714A0]();
}

uint64_t sub_25D53AA70()
{
  return MEMORY[0x270F714A8]();
}

uint64_t sub_25D53AA80()
{
  return MEMORY[0x270F714B0]();
}

uint64_t sub_25D53AA90()
{
  return MEMORY[0x270F714B8]();
}

uint64_t sub_25D53AAA0()
{
  return MEMORY[0x270F714C0]();
}

uint64_t sub_25D53AAB0()
{
  return MEMORY[0x270F714C8]();
}

uint64_t sub_25D53AAC0()
{
  return MEMORY[0x270F714D0]();
}

uint64_t sub_25D53AAD0()
{
  return MEMORY[0x270F714D8]();
}

uint64_t sub_25D53AAE0()
{
  return MEMORY[0x270F714E0]();
}

uint64_t sub_25D53AAF0()
{
  return MEMORY[0x270F714E8]();
}

uint64_t sub_25D53AB00()
{
  return MEMORY[0x270F714F0]();
}

uint64_t sub_25D53AB10()
{
  return MEMORY[0x270F714F8]();
}

uint64_t sub_25D53AB20()
{
  return MEMORY[0x270F71500]();
}

uint64_t sub_25D53AB30()
{
  return MEMORY[0x270F71508]();
}

uint64_t sub_25D53AB40()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25D53AB50()
{
  return MEMORY[0x270F6A288]();
}

uint64_t sub_25D53AB60()
{
  return MEMORY[0x270F6A290]();
}

uint64_t sub_25D53AB70()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_25D53AB80()
{
  return MEMORY[0x270F6A2D8]();
}

uint64_t sub_25D53AB90()
{
  return MEMORY[0x270F6A2F0]();
}

uint64_t sub_25D53ABA0()
{
  return MEMORY[0x270F6A308]();
}

uint64_t sub_25D53ABB0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_25D53ABC0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_25D53ABD0()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_25D53ABE0()
{
  return MEMORY[0x270F6A4D8]();
}

uint64_t sub_25D53ABF0()
{
  return MEMORY[0x270F6A4F0]();
}

uint64_t sub_25D53AC00()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_25D53AC10()
{
  return MEMORY[0x270F6A5D8]();
}

uint64_t sub_25D53AC20()
{
  return MEMORY[0x270F6A5E0]();
}

uint64_t sub_25D53AC30()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_25D53AC40()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_25D53AC50()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_25D53AC60()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_25D53AC70()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_25D53AC80()
{
  return MEMORY[0x270F6A818]();
}

uint64_t sub_25D53AC90()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_25D53ACA0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_25D53ACB0()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_25D53ACC0()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_25D53ACD0()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_25D53ACE0()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_25D53ACF0()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_25D53AD00()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_25D53AD10()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_25D53AD20()
{
  return MEMORY[0x270F6AC70]();
}

uint64_t sub_25D53AD30()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_25D53AD40()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_25D53AD50()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_25D53AD60()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_25D53AD70()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_25D53AD80()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_25D53AD90()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_25D53ADA0()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_25D53ADB0()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_25D53ADC0()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_25D53ADD0()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_25D53ADE0()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_25D53ADF0()
{
  return MEMORY[0x270F6BB10]();
}

uint64_t sub_25D53AE00()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_25D53AE10()
{
  return MEMORY[0x270F6BB20]();
}

uint64_t sub_25D53AE20()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_25D53AE30()
{
  return MEMORY[0x270F6BF88]();
}

uint64_t sub_25D53AE40()
{
  return MEMORY[0x270F6BF90]();
}

uint64_t sub_25D53AE50()
{
  return MEMORY[0x270F6BF98]();
}

uint64_t sub_25D53AE60()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_25D53AE70()
{
  return MEMORY[0x270F6BFC8]();
}

uint64_t sub_25D53AE80()
{
  return MEMORY[0x270F6C008]();
}

uint64_t sub_25D53AE90()
{
  return MEMORY[0x270F6C010]();
}

uint64_t sub_25D53AEA0()
{
  return MEMORY[0x270F6C018]();
}

uint64_t sub_25D53AEB0()
{
  return MEMORY[0x270F6C060]();
}

uint64_t sub_25D53AEC0()
{
  return MEMORY[0x270F6C068]();
}

uint64_t sub_25D53AED0()
{
  return MEMORY[0x270F6C0C0]();
}

uint64_t sub_25D53AEE0()
{
  return MEMORY[0x270F6C0C8]();
}

uint64_t sub_25D53AEF0()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_25D53AF00()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_25D53AF10()
{
  return MEMORY[0x270F6C118]();
}

uint64_t sub_25D53AF20()
{
  return MEMORY[0x270F6C120]();
}

uint64_t sub_25D53AF30()
{
  return MEMORY[0x270F6C128]();
}

uint64_t sub_25D53AF40()
{
  return MEMORY[0x270F6C138]();
}

uint64_t sub_25D53AF50()
{
  return MEMORY[0x270F6C140]();
}

uint64_t sub_25D53AF60()
{
  return MEMORY[0x270F6C150]();
}

uint64_t sub_25D53AF70()
{
  return MEMORY[0x270F6C158]();
}

uint64_t sub_25D53AF80()
{
  return MEMORY[0x270F6C160]();
}

uint64_t sub_25D53AF90()
{
  return MEMORY[0x270F6C168]();
}

uint64_t sub_25D53AFA0()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_25D53AFB0()
{
  return MEMORY[0x270F6C198]();
}

uint64_t sub_25D53AFC0()
{
  return MEMORY[0x270F6C7E8]();
}

uint64_t sub_25D53AFD0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_25D53AFE0()
{
  return MEMORY[0x270F6C820]();
}

uint64_t sub_25D53AFF0()
{
  return MEMORY[0x270F6C830]();
}

uint64_t sub_25D53B000()
{
  return MEMORY[0x270F6C838]();
}

uint64_t sub_25D53B010()
{
  return MEMORY[0x270F6C840]();
}

uint64_t sub_25D53B020()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_25D53B030()
{
  return MEMORY[0x270F6C8B8]();
}

uint64_t sub_25D53B040()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_25D53B050()
{
  return MEMORY[0x270F6C8F0]();
}

uint64_t sub_25D53B060()
{
  return MEMORY[0x270F6C908]();
}

uint64_t sub_25D53B070()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_25D53B080()
{
  return MEMORY[0x270F6C948]();
}

uint64_t sub_25D53B090()
{
  return MEMORY[0x270F6C950]();
}

uint64_t sub_25D53B0A0()
{
  return MEMORY[0x270F6C960]();
}

uint64_t sub_25D53B0B0()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_25D53B0C0()
{
  return MEMORY[0x270F6C980]();
}

uint64_t sub_25D53B0D0()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_25D53B0E0()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_25D53B0F0()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_25D53B100()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_25D53B110()
{
  return MEMORY[0x270F6C9E0]();
}

uint64_t sub_25D53B120()
{
  return MEMORY[0x270F6C9F8]();
}

uint64_t sub_25D53B130()
{
  return MEMORY[0x270F6CA00]();
}

uint64_t sub_25D53B140()
{
  return MEMORY[0x270F6CA10]();
}

uint64_t sub_25D53B150()
{
  return MEMORY[0x270F6CA48]();
}

uint64_t sub_25D53B160()
{
  return MEMORY[0x270F6CA58]();
}

uint64_t sub_25D53B1A0()
{
  return MEMORY[0x270F6CAA0]();
}

uint64_t sub_25D53B1B0()
{
  return MEMORY[0x270F6CAA8]();
}

uint64_t sub_25D53B1C0()
{
  return MEMORY[0x270F6CAB0]();
}

uint64_t sub_25D53B1D0()
{
  return MEMORY[0x270F6CAB8]();
}

uint64_t sub_25D53B1E0()
{
  return MEMORY[0x270F6CAC0]();
}

uint64_t sub_25D53B1F0()
{
  return MEMORY[0x270F6CAC8]();
}

uint64_t sub_25D53B200()
{
  return MEMORY[0x270F65408]();
}

uint64_t sub_25D53B210()
{
  return MEMORY[0x270F6CB28]();
}

uint64_t sub_25D53B220()
{
  return MEMORY[0x270F6CB48]();
}

uint64_t sub_25D53B230()
{
  return MEMORY[0x270F6CB50]();
}

uint64_t sub_25D53B240()
{
  return MEMORY[0x270F6CB70]();
}

uint64_t sub_25D53B250()
{
  return MEMORY[0x270F6CBF8]();
}

uint64_t sub_25D53B260()
{
  return MEMORY[0x270F6CC08]();
}

uint64_t sub_25D53B270()
{
  return MEMORY[0x270F6CC18]();
}

uint64_t sub_25D53B280()
{
  return MEMORY[0x270F6CC20]();
}

uint64_t sub_25D53B290()
{
  return MEMORY[0x270F6CC30]();
}

uint64_t sub_25D53B2A0()
{
  return MEMORY[0x270F6CC90]();
}

uint64_t sub_25D53B2B0()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_25D53B2C0()
{
  return MEMORY[0x270F6CCA8]();
}

uint64_t sub_25D53B2D0()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_25D53B2E0()
{
  return MEMORY[0x270F6CCC0]();
}

uint64_t sub_25D53B2F0()
{
  return MEMORY[0x270F6CCC8]();
}

uint64_t sub_25D53B300()
{
  return MEMORY[0x270F6CD18]();
}

uint64_t sub_25D53B310()
{
  return MEMORY[0x270F6CD20]();
}

uint64_t sub_25D53B320()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_25D53B330()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_25D53B340()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_25D53B350()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_25D53B360()
{
  return MEMORY[0x270F6CD58]();
}

uint64_t sub_25D53B370()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_25D53B380()
{
  return MEMORY[0x270F6CD68]();
}

uint64_t sub_25D53B390()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_25D53B3A0()
{
  return MEMORY[0x270F6CD88]();
}

uint64_t sub_25D53B3B0()
{
  return MEMORY[0x270F6CD98]();
}

uint64_t sub_25D53B3C0()
{
  return MEMORY[0x270F6CDA0]();
}

uint64_t sub_25D53B3D0()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_25D53B3E0()
{
  return MEMORY[0x270F6CDB0]();
}

uint64_t sub_25D53B3F0()
{
  return MEMORY[0x270F6CDF8]();
}

uint64_t sub_25D53B400()
{
  return MEMORY[0x270F6CE00]();
}

uint64_t sub_25D53B410()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_25D53B420()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_25D53B430()
{
  return MEMORY[0x270F6CE88]();
}

uint64_t sub_25D53B440()
{
  return MEMORY[0x270F6CE98]();
}

uint64_t sub_25D53B450()
{
  return MEMORY[0x270F6CEA0]();
}

uint64_t sub_25D53B460()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_25D53B470()
{
  return MEMORY[0x270F6CED8]();
}

uint64_t sub_25D53B480()
{
  return MEMORY[0x270F6CEE0]();
}

uint64_t sub_25D53B490()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_25D53B4A0()
{
  return MEMORY[0x270F65430]();
}

uint64_t sub_25D53B4B0()
{
  return MEMORY[0x270F6CFB8]();
}

uint64_t sub_25D53B4C0()
{
  return MEMORY[0x270F6CFC0]();
}

uint64_t sub_25D53B4D0()
{
  return MEMORY[0x270F6CFC8]();
}

uint64_t sub_25D53B4E0()
{
  return MEMORY[0x270F6CFF0]();
}

uint64_t sub_25D53B4F0()
{
  return MEMORY[0x270F6CFF8]();
}

uint64_t sub_25D53B500()
{
  return MEMORY[0x270F6D000]();
}

uint64_t sub_25D53B510()
{
  return MEMORY[0x270F6D010]();
}

uint64_t sub_25D53B520()
{
  return MEMORY[0x270F65438]();
}

uint64_t sub_25D53B530()
{
  return MEMORY[0x270F6D070]();
}

uint64_t sub_25D53B540()
{
  return MEMORY[0x270F6D090]();
}

uint64_t sub_25D53B550()
{
  return MEMORY[0x270F6D0A8]();
}

uint64_t sub_25D53B560()
{
  return MEMORY[0x270F6D0B8]();
}

uint64_t sub_25D53B570()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_25D53B580()
{
  return MEMORY[0x270F6D130]();
}

uint64_t sub_25D53B590()
{
  return MEMORY[0x270F6D138]();
}

uint64_t sub_25D53B5A0()
{
  return MEMORY[0x270F6D140]();
}

uint64_t sub_25D53B5B0()
{
  return MEMORY[0x270F6D160]();
}

uint64_t sub_25D53B5C0()
{
  return MEMORY[0x270F6D168]();
}

uint64_t sub_25D53B5D0()
{
  return MEMORY[0x270F6D170]();
}

uint64_t sub_25D53B5E0()
{
  return MEMORY[0x270F6D178]();
}

uint64_t sub_25D53B5F0()
{
  return MEMORY[0x270F6D180]();
}

uint64_t sub_25D53B600()
{
  return MEMORY[0x270F6D188]();
}

uint64_t sub_25D53B610()
{
  return MEMORY[0x270F6D190]();
}

uint64_t sub_25D53B620()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_25D53B630()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_25D53B640()
{
  return MEMORY[0x270F6D230]();
}

uint64_t sub_25D53B650()
{
  return MEMORY[0x270F65440]();
}

uint64_t sub_25D53B660()
{
  return MEMORY[0x270F6D378]();
}

uint64_t sub_25D53B670()
{
  return MEMORY[0x270F6D380]();
}

uint64_t sub_25D53B680()
{
  return MEMORY[0x270F6D388]();
}

uint64_t sub_25D53B690()
{
  return MEMORY[0x270F6D390]();
}

uint64_t sub_25D53B6A0()
{
  return MEMORY[0x270F6D398]();
}

uint64_t sub_25D53B6B0()
{
  return MEMORY[0x270F6D3A0]();
}

uint64_t sub_25D53B6C0()
{
  return MEMORY[0x270F6D3A8]();
}

uint64_t sub_25D53B6D0()
{
  return MEMORY[0x270F6D3B0]();
}

uint64_t sub_25D53B6E0()
{
  return MEMORY[0x270F6D3B8]();
}

uint64_t sub_25D53B6F0()
{
  return MEMORY[0x270F6D3C0]();
}

uint64_t sub_25D53B700()
{
  return MEMORY[0x270F6D3D8]();
}

uint64_t sub_25D53B710()
{
  return MEMORY[0x270F6D3E0]();
}

uint64_t sub_25D53B720()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_25D53B730()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_25D53B740()
{
  return MEMORY[0x270F6D470]();
}

uint64_t sub_25D53B750()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_25D53B760()
{
  return MEMORY[0x270F6D518]();
}

uint64_t sub_25D53B770()
{
  return MEMORY[0x270F6D520]();
}

uint64_t sub_25D53B780()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_25D53B790()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_25D53B7A0()
{
  return MEMORY[0x270F6D558]();
}

uint64_t sub_25D53B7B0()
{
  return MEMORY[0x270F6D560]();
}

uint64_t sub_25D53B7C0()
{
  return MEMORY[0x270F6D568]();
}

uint64_t sub_25D53B7D0()
{
  return MEMORY[0x270F6D570]();
}

uint64_t sub_25D53B7E0()
{
  return MEMORY[0x270F6D580]();
}

uint64_t sub_25D53B7F0()
{
  return MEMORY[0x270F6D590]();
}

uint64_t sub_25D53B800()
{
  return MEMORY[0x270F6D598]();
}

uint64_t sub_25D53B810()
{
  return MEMORY[0x270F6D5A0]();
}

uint64_t sub_25D53B820()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_25D53B830()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_25D53B840()
{
  return MEMORY[0x270F6D630]();
}

uint64_t sub_25D53B850()
{
  return MEMORY[0x270F6D640]();
}

uint64_t sub_25D53B860()
{
  return MEMORY[0x270F6D648]();
}

uint64_t sub_25D53B870()
{
  return MEMORY[0x270F6D670]();
}

uint64_t sub_25D53B8A0()
{
  return MEMORY[0x270F6D758]();
}

uint64_t sub_25D53B8B0()
{
  return MEMORY[0x270F6D760]();
}

uint64_t sub_25D53B8C0()
{
  return MEMORY[0x270F6D780]();
}

uint64_t sub_25D53B8D0()
{
  return MEMORY[0x270F6D788]();
}

uint64_t sub_25D53B8E0()
{
  return MEMORY[0x270F6D818]();
}

uint64_t sub_25D53B8F0()
{
  return MEMORY[0x270F6D830]();
}

uint64_t sub_25D53B900()
{
  return MEMORY[0x270F6D858]();
}

uint64_t sub_25D53B910()
{
  return MEMORY[0x270F6D860]();
}

uint64_t sub_25D53B920()
{
  return MEMORY[0x270F6D8C0]();
}

uint64_t sub_25D53B930()
{
  return MEMORY[0x270F6D8C8]();
}

uint64_t sub_25D53B940()
{
  return MEMORY[0x270F6D8D0]();
}

uint64_t sub_25D53B950()
{
  return MEMORY[0x270F6D8D8]();
}

uint64_t sub_25D53B960()
{
  return MEMORY[0x270F6D8F8]();
}

uint64_t sub_25D53B970()
{
  return MEMORY[0x270F6D900]();
}

uint64_t sub_25D53B980()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_25D53B990()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_25D53B9A0()
{
  return MEMORY[0x270F6DA28]();
}

uint64_t sub_25D53B9B0()
{
  return MEMORY[0x270F6DA40]();
}

uint64_t sub_25D53B9C0()
{
  return MEMORY[0x270F6DA58]();
}

uint64_t sub_25D53B9D0()
{
  return MEMORY[0x270F6DAC0]();
}

uint64_t sub_25D53B9E0()
{
  return MEMORY[0x270F6DAC8]();
}

uint64_t sub_25D53B9F0()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t sub_25D53BA00()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t sub_25D53BA10()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_25D53BA20()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_25D53BA30()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_25D53BA40()
{
  return MEMORY[0x270F6DC90]();
}

uint64_t sub_25D53BA50()
{
  return MEMORY[0x270F6DCA0]();
}

uint64_t sub_25D53BA60()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_25D53BA70()
{
  return MEMORY[0x270F6DCB0]();
}

uint64_t sub_25D53BA80()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_25D53BA90()
{
  return MEMORY[0x270F6DD10]();
}

uint64_t sub_25D53BAA0()
{
  return MEMORY[0x270F6DD38]();
}

uint64_t sub_25D53BAB0()
{
  return MEMORY[0x270F6DD48]();
}

uint64_t sub_25D53BAC0()
{
  return MEMORY[0x270F6DD98]();
}

uint64_t sub_25D53BAD0()
{
  return MEMORY[0x270F6DDA0]();
}

uint64_t sub_25D53BAE0()
{
  return MEMORY[0x270F6DDB0]();
}

uint64_t sub_25D53BAF0()
{
  return MEMORY[0x270F6DDB8]();
}

uint64_t sub_25D53BB00()
{
  return MEMORY[0x270F6DDC0]();
}

uint64_t sub_25D53BB10()
{
  return MEMORY[0x270F6DDC8]();
}

uint64_t sub_25D53BB20()
{
  return MEMORY[0x270F6DDD0]();
}

uint64_t sub_25D53BB30()
{
  return MEMORY[0x270F6DE68]();
}

uint64_t sub_25D53BB40()
{
  return MEMORY[0x270F6DE78]();
}

uint64_t sub_25D53BB50()
{
  return MEMORY[0x270F6DE88]();
}

uint64_t sub_25D53BB60()
{
  return MEMORY[0x270F6DF38]();
}

uint64_t sub_25D53BB70()
{
  return MEMORY[0x270F6DF40]();
}

uint64_t sub_25D53BB90()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_25D53BBA0()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_25D53BBB0()
{
  return MEMORY[0x270F6E090]();
}

uint64_t sub_25D53BBC0()
{
  return MEMORY[0x270F6E098]();
}

uint64_t sub_25D53BBD0()
{
  return MEMORY[0x270F6E1C8]();
}

uint64_t sub_25D53BBE0()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t sub_25D53BBF0()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_25D53BC00()
{
  return MEMORY[0x270F6E200]();
}

uint64_t sub_25D53BC10()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_25D53BC20()
{
  return MEMORY[0x270F6E268]();
}

uint64_t sub_25D53BC30()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_25D53BC40()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_25D53BC50()
{
  return MEMORY[0x270F6E298]();
}

uint64_t sub_25D53BC60()
{
  return MEMORY[0x270F6E2A0]();
}

uint64_t sub_25D53BC70()
{
  return MEMORY[0x270F6E358]();
}

uint64_t sub_25D53BC80()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_25D53BC90()
{
  return MEMORY[0x270F6E4C8]();
}

uint64_t sub_25D53BCA0()
{
  return MEMORY[0x270F6E4D0]();
}

uint64_t sub_25D53BCB0()
{
  return MEMORY[0x270F6E508]();
}

uint64_t sub_25D53BCC0()
{
  return MEMORY[0x270F6E510]();
}

uint64_t sub_25D53BCD0()
{
  return MEMORY[0x270F6E528]();
}

uint64_t sub_25D53BCE0()
{
  return MEMORY[0x270F6E530]();
}

uint64_t sub_25D53BCF0()
{
  return MEMORY[0x270F6E6D0]();
}

uint64_t sub_25D53BD00()
{
  return MEMORY[0x270F6E6D8]();
}

uint64_t sub_25D53BD10()
{
  return MEMORY[0x270F6E780]();
}

uint64_t sub_25D53BD20()
{
  return MEMORY[0x270F6E788]();
}

uint64_t sub_25D53BD30()
{
  return MEMORY[0x270F6E790]();
}

uint64_t sub_25D53BD40()
{
  return MEMORY[0x270F6E798]();
}

uint64_t sub_25D53BD50()
{
  return MEMORY[0x270F6E8F0]();
}

uint64_t sub_25D53BD60()
{
  return MEMORY[0x270F6E8F8]();
}

uint64_t sub_25D53BD70()
{
  return MEMORY[0x270F6E970]();
}

uint64_t sub_25D53BD80()
{
  return MEMORY[0x270F6E978]();
}

uint64_t sub_25D53BD90()
{
  return MEMORY[0x270F6EA58]();
}

uint64_t sub_25D53BDA0()
{
  return MEMORY[0x270F6EA60]();
}

uint64_t sub_25D53BDB0()
{
  return MEMORY[0x270F6EA68]();
}

uint64_t sub_25D53BDC0()
{
  return MEMORY[0x270F6EAB0]();
}

uint64_t sub_25D53BDD0()
{
  return MEMORY[0x270F6EAC0]();
}

uint64_t sub_25D53BDE0()
{
  return MEMORY[0x270F6EAC8]();
}

uint64_t sub_25D53BDF0()
{
  return MEMORY[0x270F6EAD0]();
}

uint64_t sub_25D53BE00()
{
  return MEMORY[0x270F6EAE0]();
}

uint64_t sub_25D53BE10()
{
  return MEMORY[0x270F6EAE8]();
}

uint64_t sub_25D53BE20()
{
  return MEMORY[0x270F6EB80]();
}

uint64_t sub_25D53BE30()
{
  return MEMORY[0x270F6EC08]();
}

uint64_t sub_25D53BE40()
{
  return MEMORY[0x270F6EC10]();
}

uint64_t sub_25D53BE50()
{
  return MEMORY[0x270F6ECE8]();
}

uint64_t sub_25D53BE60()
{
  return MEMORY[0x270F6ECF0]();
}

uint64_t sub_25D53BE70()
{
  return MEMORY[0x270F6EE30]();
}

uint64_t sub_25D53BE80()
{
  return MEMORY[0x270F6EEB0]();
}

uint64_t sub_25D53BE90()
{
  return MEMORY[0x270F6EEB8]();
}

uint64_t sub_25D53BEA0()
{
  return MEMORY[0x270F6F1A8]();
}

uint64_t sub_25D53BEB0()
{
  return MEMORY[0x270F6F1C8]();
}

uint64_t sub_25D53BEC0()
{
  return MEMORY[0x270F6F270]();
}

uint64_t sub_25D53BED0()
{
  return MEMORY[0x270F6F338]();
}

uint64_t sub_25D53BEE0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_25D53BEF0()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_25D53BF00()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_25D53BF10()
{
  return MEMORY[0x270F6F368]();
}

uint64_t sub_25D53BF20()
{
  return MEMORY[0x270F6F380]();
}

uint64_t sub_25D53BF30()
{
  return MEMORY[0x270F6F3F0]();
}

uint64_t sub_25D53BF40()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_25D53BF50()
{
  return MEMORY[0x270F6F428]();
}

uint64_t sub_25D53BF60()
{
  return MEMORY[0x270F6F438]();
}

uint64_t sub_25D53BF70()
{
  return MEMORY[0x270F6F4A8]();
}

uint64_t sub_25D53BF80()
{
  return MEMORY[0x270F70740]();
}

uint64_t sub_25D53BF90()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_25D53BFA0()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_25D53BFB0()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_25D53BFC0()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_25D53BFD0()
{
  return MEMORY[0x270F73998]();
}

uint64_t sub_25D53BFF0()
{
  return MEMORY[0x270F739A8]();
}

uint64_t sub_25D53C000()
{
  return MEMORY[0x270F739B0]();
}

uint64_t sub_25D53C010()
{
  return MEMORY[0x270F739B8]();
}

uint64_t sub_25D53C020()
{
  return MEMORY[0x270F739C0]();
}

uint64_t sub_25D53C030()
{
  return MEMORY[0x270F1A768]();
}

uint64_t sub_25D53C040()
{
  return MEMORY[0x270F1A788]();
}

uint64_t sub_25D53C050()
{
  return MEMORY[0x270F65480]();
}

uint64_t sub_25D53C060()
{
  return MEMORY[0x270F65488]();
}

uint64_t sub_25D53C070()
{
  return MEMORY[0x270F65490]();
}

uint64_t sub_25D53C080()
{
  return MEMORY[0x270F65498]();
}

uint64_t sub_25D53C090()
{
  return MEMORY[0x270F654A0]();
}

uint64_t sub_25D53C0A0()
{
  return MEMORY[0x270F654B0]();
}

uint64_t sub_25D53C0B0()
{
  return MEMORY[0x270F654B8]();
}

uint64_t sub_25D53C0C0()
{
  return MEMORY[0x270F654C8]();
}

uint64_t sub_25D53C0D0()
{
  return MEMORY[0x270F654D0]();
}

uint64_t sub_25D53C0F0()
{
  return MEMORY[0x270F655A8]();
}

uint64_t sub_25D53C100()
{
  return MEMORY[0x270F655B0]();
}

uint64_t sub_25D53C110()
{
  return MEMORY[0x270F655E0]();
}

uint64_t sub_25D53C120()
{
  return MEMORY[0x270F655E8]();
}

uint64_t sub_25D53C130()
{
  return MEMORY[0x270F655F0]();
}

uint64_t sub_25D53C140()
{
  return MEMORY[0x270F655F8]();
}

uint64_t sub_25D53C150()
{
  return MEMORY[0x270F65608]();
}

uint64_t sub_25D53C160()
{
  return MEMORY[0x270F65618]();
}

uint64_t sub_25D53C170()
{
  return MEMORY[0x270F65628]();
}

uint64_t sub_25D53C180()
{
  return MEMORY[0x270F65638]();
}

uint64_t sub_25D53C190()
{
  return MEMORY[0x270F65648]();
}

uint64_t sub_25D53C1A0()
{
  return MEMORY[0x270F65650]();
}

uint64_t sub_25D53C1B0()
{
  return MEMORY[0x270F65658]();
}

uint64_t sub_25D53C1C0()
{
  return MEMORY[0x270F65660]();
}

uint64_t sub_25D53C1D0()
{
  return MEMORY[0x270F65668]();
}

uint64_t sub_25D53C1E0()
{
  return MEMORY[0x270F65678]();
}

uint64_t sub_25D53C1F0()
{
  return MEMORY[0x270F65688]();
}

uint64_t sub_25D53C200()
{
  return MEMORY[0x270F65690]();
}

uint64_t sub_25D53C210()
{
  return MEMORY[0x270F65698]();
}

uint64_t sub_25D53C220()
{
  return MEMORY[0x270F656A0]();
}

uint64_t sub_25D53C230()
{
  return MEMORY[0x270F656A8]();
}

uint64_t sub_25D53C240()
{
  return MEMORY[0x270F65718]();
}

uint64_t sub_25D53C250()
{
  return MEMORY[0x270F65788]();
}

uint64_t sub_25D53C260()
{
  return MEMORY[0x270F65790]();
}

uint64_t sub_25D53C270()
{
  return MEMORY[0x270F657B0]();
}

uint64_t sub_25D53C280()
{
  return MEMORY[0x270F657C8]();
}

uint64_t sub_25D53C290()
{
  return MEMORY[0x270F657D0]();
}

uint64_t sub_25D53C2A0()
{
  return MEMORY[0x270F657F0]();
}

uint64_t sub_25D53C2B0()
{
  return MEMORY[0x270F65830]();
}

uint64_t sub_25D53C2C0()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_25D53C2D0()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_25D53C2E0()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_25D53C2F0()
{
  return MEMORY[0x270F65890]();
}

uint64_t sub_25D53C300()
{
  return MEMORY[0x270F658A0]();
}

uint64_t sub_25D53C310()
{
  return MEMORY[0x270F658A8]();
}

uint64_t sub_25D53C320()
{
  return MEMORY[0x270F658E0]();
}

uint64_t sub_25D53C330()
{
  return MEMORY[0x270F658F8]();
}

uint64_t sub_25D53C340()
{
  return MEMORY[0x270F65900]();
}

uint64_t sub_25D53C350()
{
  return MEMORY[0x270F65908]();
}

uint64_t sub_25D53C360()
{
  return MEMORY[0x270F65910]();
}

uint64_t sub_25D53C370()
{
  return MEMORY[0x270F65950]();
}

uint64_t sub_25D53C380()
{
  return MEMORY[0x270F65958]();
}

uint64_t sub_25D53C390()
{
  return MEMORY[0x270F65968]();
}

uint64_t sub_25D53C3A0()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_25D53C3B0()
{
  return MEMORY[0x270F65990]();
}

uint64_t sub_25D53C3C0()
{
  return MEMORY[0x270F65998]();
}

uint64_t sub_25D53C3D0()
{
  return MEMORY[0x270F659A0]();
}

uint64_t sub_25D53C3E0()
{
  return MEMORY[0x270F659A8]();
}

uint64_t sub_25D53C3F0()
{
  return MEMORY[0x270F659B0]();
}

uint64_t sub_25D53C400()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_25D53C410()
{
  return MEMORY[0x270F659C8]();
}

uint64_t sub_25D53C420()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_25D53C430()
{
  return MEMORY[0x270F65A08]();
}

uint64_t sub_25D53C440()
{
  return MEMORY[0x270F65A10]();
}

uint64_t sub_25D53C450()
{
  return MEMORY[0x270F65A20]();
}

uint64_t sub_25D53C470()
{
  return MEMORY[0x270F65A30]();
}

uint64_t sub_25D53C480()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_25D53C490()
{
  return MEMORY[0x270F65DF8]();
}

uint64_t sub_25D53C4A0()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_25D53C4B0()
{
  return MEMORY[0x270F70B28]();
}

uint64_t sub_25D53C4C0()
{
  return MEMORY[0x270F70B30]();
}

uint64_t sub_25D53C4D0()
{
  return MEMORY[0x270F70B38]();
}

uint64_t sub_25D53C4E0()
{
  return MEMORY[0x270F70B48]();
}

uint64_t sub_25D53C4F0()
{
  return MEMORY[0x270F70B50]();
}

uint64_t sub_25D53C500()
{
  return MEMORY[0x270F70B58]();
}

uint64_t sub_25D53C510()
{
  return MEMORY[0x270F70B60]();
}

uint64_t sub_25D53C520()
{
  return MEMORY[0x270F70B70]();
}

uint64_t sub_25D53C530()
{
  return MEMORY[0x270F70B78]();
}

uint64_t sub_25D53C540()
{
  return MEMORY[0x270F70B80]();
}

uint64_t sub_25D53C550()
{
  return MEMORY[0x270F70B98]();
}

uint64_t sub_25D53C560()
{
  return MEMORY[0x270F70BA0]();
}

uint64_t sub_25D53C570()
{
  return MEMORY[0x270F70BB0]();
}

uint64_t sub_25D53C580()
{
  return MEMORY[0x270F70BB8]();
}

uint64_t sub_25D53C590()
{
  return MEMORY[0x270F70BC8]();
}

uint64_t sub_25D53C5A0()
{
  return MEMORY[0x270F70BD0]();
}

uint64_t sub_25D53C5B0()
{
  return MEMORY[0x270F70BD8]();
}

uint64_t sub_25D53C5C0()
{
  return MEMORY[0x270F70BF0]();
}

uint64_t sub_25D53C5D0()
{
  return MEMORY[0x270F70C00]();
}

uint64_t sub_25D53C5E0()
{
  return MEMORY[0x270F70C08]();
}

uint64_t sub_25D53C5F0()
{
  return MEMORY[0x270F70C18]();
}

uint64_t sub_25D53C600()
{
  return MEMORY[0x270F70C40]();
}

uint64_t sub_25D53C610()
{
  return MEMORY[0x270F70C58]();
}

uint64_t sub_25D53C620()
{
  return MEMORY[0x270F70C80]();
}

uint64_t sub_25D53C630()
{
  return MEMORY[0x270F70C88]();
}

uint64_t sub_25D53C640()
{
  return MEMORY[0x270F70CA0]();
}

uint64_t sub_25D53C650()
{
  return MEMORY[0x270F70CA8]();
}

uint64_t sub_25D53C660()
{
  return MEMORY[0x270F70CC8]();
}

uint64_t sub_25D53C670()
{
  return MEMORY[0x270F70CD0]();
}

uint64_t sub_25D53C680()
{
  return MEMORY[0x270F70CD8]();
}

uint64_t sub_25D53C690()
{
  return MEMORY[0x270F70CE0]();
}

uint64_t sub_25D53C6A0()
{
  return MEMORY[0x270F70CE8]();
}

uint64_t sub_25D53C6B0()
{
  return MEMORY[0x270F70CF0]();
}

uint64_t sub_25D53C6C0()
{
  return MEMORY[0x270F70D08]();
}

uint64_t sub_25D53C6D0()
{
  return MEMORY[0x270F70D10]();
}

uint64_t sub_25D53C6E0()
{
  return MEMORY[0x270F70D18]();
}

uint64_t sub_25D53C6F0()
{
  return MEMORY[0x270F70D40]();
}

uint64_t sub_25D53C700()
{
  return MEMORY[0x270F70D48]();
}

uint64_t sub_25D53C710()
{
  return MEMORY[0x270F70D50]();
}

uint64_t sub_25D53C720()
{
  return MEMORY[0x270F70D78]();
}

uint64_t sub_25D53C730()
{
  return MEMORY[0x270F70D80]();
}

uint64_t sub_25D53C740()
{
  return MEMORY[0x270F70D90]();
}

uint64_t sub_25D53C750()
{
  return MEMORY[0x270F70DA0]();
}

uint64_t sub_25D53C760()
{
  return MEMORY[0x270F70DB0]();
}

uint64_t sub_25D53C770()
{
  return MEMORY[0x270F70DB8]();
}

uint64_t sub_25D53C780()
{
  return MEMORY[0x270F70DC8]();
}

uint64_t sub_25D53C790()
{
  return MEMORY[0x270F70DD8]();
}

uint64_t sub_25D53C7A0()
{
  return MEMORY[0x270F70DE0]();
}

uint64_t sub_25D53C7B0()
{
  return MEMORY[0x270F70DF0]();
}

uint64_t sub_25D53C7C0()
{
  return MEMORY[0x270F683F8]();
}

uint64_t sub_25D53C7D0()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_25D53C7E0()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_25D53C7F0()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_25D53C800()
{
  return MEMORY[0x270F72900]();
}

uint64_t sub_25D53C810()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_25D53C820()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25D53C830()
{
  return MEMORY[0x270F72A08]();
}

uint64_t sub_25D53C840()
{
  return MEMORY[0x270F68400]();
}

uint64_t sub_25D53C850()
{
  return MEMORY[0x270F68410]();
}

uint64_t sub_25D53C860()
{
  return MEMORY[0x270F72A10]();
}

uint64_t sub_25D53C870()
{
  return MEMORY[0x270F72A18]();
}

uint64_t sub_25D53C880()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_25D53C890()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_25D53C8A0()
{
  return MEMORY[0x270F72A30]();
}

uint64_t sub_25D53C8B0()
{
  return MEMORY[0x270F72A40]();
}

uint64_t sub_25D53C8C0()
{
  return MEMORY[0x270F72A48]();
}

uint64_t sub_25D53C8D0()
{
  return MEMORY[0x270F72A50]();
}

uint64_t sub_25D53C8E0()
{
  return MEMORY[0x270F72A58]();
}

uint64_t sub_25D53C8F0()
{
  return MEMORY[0x270F72A68]();
}

uint64_t sub_25D53C900()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_25D53C910()
{
  return MEMORY[0x270F72AB8]();
}

uint64_t sub_25D53C920()
{
  return MEMORY[0x270F72B20]();
}

uint64_t sub_25D53C930()
{
  return MEMORY[0x270F72B28]();
}

uint64_t sub_25D53C940()
{
  return MEMORY[0x270F72B60]();
}

uint64_t sub_25D53C950()
{
  return MEMORY[0x270F72B68]();
}

uint64_t sub_25D53C960()
{
  return MEMORY[0x270F72B70]();
}

uint64_t sub_25D53C970()
{
  return MEMORY[0x270F72B78]();
}

uint64_t sub_25D53C980()
{
  return MEMORY[0x270F72B88]();
}

uint64_t sub_25D53C990()
{
  return MEMORY[0x270F72C00]();
}

uint64_t sub_25D53C9A0()
{
  return MEMORY[0x270F72C08]();
}

uint64_t sub_25D53C9B0()
{
  return MEMORY[0x270F72C10]();
}

uint64_t sub_25D53C9C0()
{
  return MEMORY[0x270F72C18]();
}

uint64_t sub_25D53C9D0()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_25D53C9E0()
{
  return MEMORY[0x270F71F68]();
}

uint64_t sub_25D53C9F0()
{
  return MEMORY[0x270F71F70]();
}

uint64_t sub_25D53CA00()
{
  return MEMORY[0x270F71F78]();
}

uint64_t sub_25D53CA10()
{
  return MEMORY[0x270F71F80]();
}

uint64_t sub_25D53CA20()
{
  return MEMORY[0x270F71F88]();
}

uint64_t sub_25D53CA30()
{
  return MEMORY[0x270F71F90]();
}

uint64_t sub_25D53CA40()
{
  return MEMORY[0x270F71F98]();
}

uint64_t sub_25D53CA50()
{
  return MEMORY[0x270F71FA0]();
}

uint64_t sub_25D53CA60()
{
  return MEMORY[0x270F71FA8]();
}

uint64_t sub_25D53CA70()
{
  return MEMORY[0x270F71FB0]();
}

uint64_t sub_25D53CA80()
{
  return MEMORY[0x270F71FB8]();
}

uint64_t sub_25D53CA90()
{
  return MEMORY[0x270F71FC0]();
}

uint64_t sub_25D53CAA0()
{
  return MEMORY[0x270F71FC8]();
}

uint64_t sub_25D53CAB0()
{
  return MEMORY[0x270F71FD0]();
}

uint64_t sub_25D53CAC0()
{
  return MEMORY[0x270F71FD8]();
}

uint64_t sub_25D53CAD0()
{
  return MEMORY[0x270F71FE0]();
}

uint64_t sub_25D53CAE0()
{
  return MEMORY[0x270F71FE8]();
}

uint64_t sub_25D53CAF0()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_25D53CB00()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_25D53CB10()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_25D53CB20()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_25D53CB30()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_25D53CB40()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_25D53CB50()
{
  return MEMORY[0x270F64828]();
}

uint64_t sub_25D53CB60()
{
  return MEMORY[0x270F64830]();
}

uint64_t sub_25D53CB70()
{
  return MEMORY[0x270F64838]();
}

uint64_t sub_25D53CB80()
{
  return MEMORY[0x270F64848]();
}

uint64_t sub_25D53CB90()
{
  return MEMORY[0x270F64850]();
}

uint64_t sub_25D53CBA0()
{
  return MEMORY[0x270F64858]();
}

uint64_t sub_25D53CBB0()
{
  return MEMORY[0x270F64860]();
}

uint64_t sub_25D53CBC0()
{
  return MEMORY[0x270F64868]();
}

uint64_t sub_25D53CBD0()
{
  return MEMORY[0x270F64870]();
}

uint64_t sub_25D53CBE0()
{
  return MEMORY[0x270F64878]();
}

uint64_t sub_25D53CBF0()
{
  return MEMORY[0x270F64890]();
}

uint64_t sub_25D53CC00()
{
  return MEMORY[0x270F648A8]();
}

uint64_t sub_25D53CC10()
{
  return MEMORY[0x270F648B0]();
}

uint64_t sub_25D53CC20()
{
  return MEMORY[0x270F648B8]();
}

uint64_t sub_25D53CC30()
{
  return MEMORY[0x270F648C8]();
}

uint64_t sub_25D53CC40()
{
  return MEMORY[0x270F648D0]();
}

uint64_t sub_25D53CC50()
{
  return MEMORY[0x270F648D8]();
}

uint64_t sub_25D53CC60()
{
  return MEMORY[0x270F648E0]();
}

uint64_t sub_25D53CC70()
{
  return MEMORY[0x270F64998]();
}

uint64_t sub_25D53CC80()
{
  return MEMORY[0x270F64A08]();
}

uint64_t sub_25D53CC90()
{
  return MEMORY[0x270F64A10]();
}

uint64_t sub_25D53CCA0()
{
  return MEMORY[0x270F64A20]();
}

uint64_t sub_25D53CCB0()
{
  return MEMORY[0x270F64A28]();
}

uint64_t sub_25D53CCC0()
{
  return MEMORY[0x270F64A30]();
}

uint64_t sub_25D53CCD0()
{
  return MEMORY[0x270F64A40]();
}

uint64_t sub_25D53CCE0()
{
  return MEMORY[0x270F64A90]();
}

uint64_t sub_25D53CCF0()
{
  return MEMORY[0x270F64AA0]();
}

uint64_t sub_25D53CD00()
{
  return MEMORY[0x270F64B10]();
}

uint64_t sub_25D53CD10()
{
  return MEMORY[0x270F64B18]();
}

uint64_t sub_25D53CD20()
{
  return MEMORY[0x270F64B20]();
}

uint64_t sub_25D53CD30()
{
  return MEMORY[0x270F64B28]();
}

uint64_t sub_25D53CD40()
{
  return MEMORY[0x270F64B58]();
}

uint64_t sub_25D53CD50()
{
  return MEMORY[0x270F64B68]();
}

uint64_t sub_25D53CD60()
{
  return MEMORY[0x270F64B78]();
}

uint64_t sub_25D53CD70()
{
  return MEMORY[0x270F64B80]();
}

uint64_t sub_25D53CD80()
{
  return MEMORY[0x270F64B88]();
}

uint64_t sub_25D53CD90()
{
  return MEMORY[0x270F64B98]();
}

uint64_t sub_25D53CDA0()
{
  return MEMORY[0x270F64BA0]();
}

uint64_t sub_25D53CDB0()
{
  return MEMORY[0x270F64BA8]();
}

uint64_t sub_25D53CDC0()
{
  return MEMORY[0x270F64BB0]();
}

uint64_t sub_25D53CDD0()
{
  return MEMORY[0x270F64BB8]();
}

uint64_t sub_25D53CDE0()
{
  return MEMORY[0x270F64BC0]();
}

uint64_t sub_25D53CDF0()
{
  return MEMORY[0x270F64BC8]();
}

uint64_t sub_25D53CE00()
{
  return MEMORY[0x270F64BD0]();
}

uint64_t sub_25D53CE10()
{
  return MEMORY[0x270F64BD8]();
}

uint64_t sub_25D53CE20()
{
  return MEMORY[0x270F64BE0]();
}

uint64_t sub_25D53CE30()
{
  return MEMORY[0x270F64BE8]();
}

uint64_t sub_25D53CE40()
{
  return MEMORY[0x270F64BF0]();
}

uint64_t sub_25D53CE50()
{
  return MEMORY[0x270F64C10]();
}

uint64_t sub_25D53CE60()
{
  return MEMORY[0x270F64C18]();
}

uint64_t sub_25D53CE70()
{
  return MEMORY[0x270F64C28]();
}

uint64_t sub_25D53CE80()
{
  return MEMORY[0x270F64C30]();
}

uint64_t sub_25D53CE90()
{
  return MEMORY[0x270F64C38]();
}

uint64_t sub_25D53CEA0()
{
  return MEMORY[0x270F64C40]();
}

uint64_t sub_25D53CEB0()
{
  return MEMORY[0x270F64C48]();
}

uint64_t sub_25D53CEC0()
{
  return MEMORY[0x270F64C88]();
}

uint64_t sub_25D53CED0()
{
  return MEMORY[0x270F64C90]();
}

uint64_t sub_25D53CEE0()
{
  return MEMORY[0x270F64C98]();
}

uint64_t sub_25D53CEF0()
{
  return MEMORY[0x270F64CA0]();
}

uint64_t sub_25D53CF00()
{
  return MEMORY[0x270F64CA8]();
}

uint64_t sub_25D53CF10()
{
  return MEMORY[0x270F64D38]();
}

uint64_t sub_25D53CF20()
{
  return MEMORY[0x270F64D50]();
}

uint64_t sub_25D53CF30()
{
  return MEMORY[0x270F64D60]();
}

uint64_t sub_25D53CF40()
{
  return MEMORY[0x270F64E28]();
}

uint64_t sub_25D53CF50()
{
  return MEMORY[0x270F64E38]();
}

uint64_t sub_25D53CF60()
{
  return MEMORY[0x270F64E48]();
}

uint64_t sub_25D53CF70()
{
  return MEMORY[0x270F64E60]();
}

uint64_t sub_25D53CF80()
{
  return MEMORY[0x270F64E80]();
}

uint64_t sub_25D53CF90()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_25D53CFA0()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_25D53CFB0()
{
  return MEMORY[0x270F64EB0]();
}

uint64_t sub_25D53CFC0()
{
  return MEMORY[0x270F64EB8]();
}

uint64_t sub_25D53CFD0()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t sub_25D53CFE0()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_25D53CFF0()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t sub_25D53D000()
{
  return MEMORY[0x270F64EF0]();
}

uint64_t sub_25D53D010()
{
  return MEMORY[0x270F64F08]();
}

uint64_t sub_25D53D020()
{
  return MEMORY[0x270F64F10]();
}

uint64_t sub_25D53D030()
{
  return MEMORY[0x270F64F18]();
}

uint64_t sub_25D53D040()
{
  return MEMORY[0x270F64F20]();
}

uint64_t sub_25D53D050()
{
  return MEMORY[0x270F64F28]();
}

uint64_t sub_25D53D060()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_25D53D070()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_25D53D080()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_25D53D090()
{
  return MEMORY[0x270F64FB0]();
}

uint64_t sub_25D53D0A0()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_25D53D0B0()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t sub_25D53D0C0()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t sub_25D53D0D0()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t sub_25D53D0E0()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t sub_25D53D0F0()
{
  return MEMORY[0x270F65020]();
}

uint64_t sub_25D53D100()
{
  return MEMORY[0x270F65028]();
}

uint64_t sub_25D53D110()
{
  return MEMORY[0x270F65030]();
}

uint64_t sub_25D53D120()
{
  return MEMORY[0x270F65038]();
}

uint64_t sub_25D53D130()
{
  return MEMORY[0x270F65040]();
}

uint64_t sub_25D53D140()
{
  return MEMORY[0x270F65048]();
}

uint64_t sub_25D53D150()
{
  return MEMORY[0x270F65050]();
}

uint64_t sub_25D53D160()
{
  return MEMORY[0x270F65068]();
}

uint64_t sub_25D53D170()
{
  return MEMORY[0x270F65078]();
}

uint64_t sub_25D53D180()
{
  return MEMORY[0x270F65090]();
}

uint64_t sub_25D53D190()
{
  return MEMORY[0x270F65098]();
}

uint64_t sub_25D53D1A0()
{
  return MEMORY[0x270F650A0]();
}

uint64_t sub_25D53D1B0()
{
  return MEMORY[0x270F650A8]();
}

uint64_t sub_25D53D1C0()
{
  return MEMORY[0x270F650B0]();
}

uint64_t sub_25D53D1D0()
{
  return MEMORY[0x270F650C8]();
}

uint64_t sub_25D53D1E0()
{
  return MEMORY[0x270F650D0]();
}

uint64_t sub_25D53D1F0()
{
  return MEMORY[0x270F650F0]();
}

uint64_t sub_25D53D200()
{
  return MEMORY[0x270F650F8]();
}

uint64_t sub_25D53D210()
{
  return MEMORY[0x270F65100]();
}

uint64_t sub_25D53D220()
{
  return MEMORY[0x270F65110]();
}

uint64_t sub_25D53D230()
{
  return MEMORY[0x270F65118]();
}

uint64_t sub_25D53D240()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_25D53D250()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_25D53D260()
{
  return MEMORY[0x270F65178]();
}

uint64_t sub_25D53D270()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_25D53D280()
{
  return MEMORY[0x270F68458]();
}

uint64_t sub_25D53D290()
{
  return MEMORY[0x270F68460]();
}

uint64_t sub_25D53D2A0()
{
  return MEMORY[0x270F63AA0]();
}

uint64_t sub_25D53D2B0()
{
  return MEMORY[0x270F63AA8]();
}

uint64_t sub_25D53D2C0()
{
  return MEMORY[0x270F63AB0]();
}

uint64_t sub_25D53D2D0()
{
  return MEMORY[0x270F63AB8]();
}

uint64_t sub_25D53D2E0()
{
  return MEMORY[0x270F63AC0]();
}

uint64_t sub_25D53D2F0()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_25D53D300()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_25D53D310()
{
  return MEMORY[0x270F63AF0]();
}

uint64_t sub_25D53D320()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_25D53D330()
{
  return MEMORY[0x270F63B18]();
}

uint64_t sub_25D53D340()
{
  return MEMORY[0x270F63B28]();
}

uint64_t sub_25D53D350()
{
  return MEMORY[0x270F63B60]();
}

uint64_t sub_25D53D360()
{
  return MEMORY[0x270F63B68]();
}

uint64_t sub_25D53D370()
{
  return MEMORY[0x270F63B70]();
}

uint64_t sub_25D53D390()
{
  return MEMORY[0x270F63B88]();
}

uint64_t sub_25D53D3A0()
{
  return MEMORY[0x270F63B90]();
}

uint64_t sub_25D53D3C0()
{
  return MEMORY[0x270F63BA8]();
}

uint64_t sub_25D53D3D0()
{
  return MEMORY[0x270F63BD8]();
}

uint64_t sub_25D53D3E0()
{
  return MEMORY[0x270F63BE0]();
}

uint64_t sub_25D53D3F0()
{
  return MEMORY[0x270F63BE8]();
}

uint64_t sub_25D53D400()
{
  return MEMORY[0x270F63BF8]();
}

uint64_t sub_25D53D410()
{
  return MEMORY[0x270F65EE0]();
}

uint64_t sub_25D53D420()
{
  return MEMORY[0x270F65EE8]();
}

uint64_t sub_25D53D430()
{
  return MEMORY[0x270F65F00]();
}

uint64_t sub_25D53D440()
{
  return MEMORY[0x270F65F08]();
}

uint64_t sub_25D53D450()
{
  return MEMORY[0x270F65F28]();
}

uint64_t sub_25D53D460()
{
  return MEMORY[0x270F65F30]();
}

uint64_t sub_25D53D470()
{
  return MEMORY[0x270F65F38]();
}

uint64_t sub_25D53D480()
{
  return MEMORY[0x270F65F40]();
}

uint64_t sub_25D53D4B0()
{
  return MEMORY[0x270F65F60]();
}

uint64_t sub_25D53D500()
{
  return MEMORY[0x270F65F88]();
}

uint64_t sub_25D53D520()
{
  return MEMORY[0x270F65FA8]();
}

uint64_t sub_25D53D530()
{
  return MEMORY[0x270F65FC0]();
}

uint64_t sub_25D53D590()
{
  return MEMORY[0x270F69C10]();
}

uint64_t sub_25D53D5A0()
{
  return MEMORY[0x270F69C20]();
}

uint64_t sub_25D53D5B0()
{
  return MEMORY[0x270F69C28]();
}

uint64_t sub_25D53D5C0()
{
  return MEMORY[0x270F69C38]();
}

uint64_t sub_25D53D5D0()
{
  return MEMORY[0x270F69C48]();
}

uint64_t sub_25D53D5E0()
{
  return MEMORY[0x270F69C58]();
}

uint64_t sub_25D53D600()
{
  return MEMORY[0x270F69C80]();
}

uint64_t sub_25D53D610()
{
  return MEMORY[0x270F69C88]();
}

uint64_t sub_25D53D620()
{
  return MEMORY[0x270F69C90]();
}

uint64_t sub_25D53D630()
{
  return MEMORY[0x270F69C98]();
}

uint64_t sub_25D53D640()
{
  return MEMORY[0x270F69CA0]();
}

uint64_t sub_25D53D650()
{
  return MEMORY[0x270F69CD0]();
}

uint64_t sub_25D53D660()
{
  return MEMORY[0x270F69D08]();
}

uint64_t sub_25D53D670()
{
  return MEMORY[0x270F69D28]();
}

uint64_t sub_25D53D680()
{
  return MEMORY[0x270F69D30]();
}

uint64_t sub_25D53D690()
{
  return MEMORY[0x270F69D38]();
}

uint64_t sub_25D53D6A0()
{
  return MEMORY[0x270F69D48]();
}

uint64_t sub_25D53D6B0()
{
  return MEMORY[0x270F69D58]();
}

uint64_t sub_25D53D6C0()
{
  return MEMORY[0x270F69D60]();
}

uint64_t sub_25D53D6D0()
{
  return MEMORY[0x270F69D90]();
}

uint64_t sub_25D53D6E0()
{
  return MEMORY[0x270F69DD0]();
}

uint64_t sub_25D53D6F0()
{
  return MEMORY[0x270F69DD8]();
}

uint64_t sub_25D53D700()
{
  return MEMORY[0x270F69DE0]();
}

uint64_t sub_25D53D710()
{
  return MEMORY[0x270F69DE8]();
}

uint64_t sub_25D53D720()
{
  return MEMORY[0x270F69DF0]();
}

uint64_t sub_25D53D730()
{
  return MEMORY[0x270F69E30]();
}

uint64_t sub_25D53D740()
{
  return MEMORY[0x270F69E40]();
}

uint64_t sub_25D53D750()
{
  return MEMORY[0x270F69E50]();
}

uint64_t sub_25D53D760()
{
  return MEMORY[0x270F69E58]();
}

uint64_t sub_25D53D770()
{
  return MEMORY[0x270F69E60]();
}

uint64_t sub_25D53D780()
{
  return MEMORY[0x270F69E88]();
}

uint64_t sub_25D53D790()
{
  return MEMORY[0x270F69E98]();
}

uint64_t sub_25D53D7A0()
{
  return MEMORY[0x270F69EE0]();
}

uint64_t sub_25D53D7B0()
{
  return MEMORY[0x270F69EE8]();
}

uint64_t sub_25D53D7C0()
{
  return MEMORY[0x270F69F08]();
}

uint64_t sub_25D53D7D0()
{
  return MEMORY[0x270F69F18]();
}

uint64_t sub_25D53D7E0()
{
  return MEMORY[0x270F69F20]();
}

uint64_t sub_25D53D7F0()
{
  return MEMORY[0x270F69F38]();
}

uint64_t sub_25D53D800()
{
  return MEMORY[0x270F69F48]();
}

uint64_t sub_25D53D810()
{
  return MEMORY[0x270F69F68]();
}

uint64_t sub_25D53D820()
{
  return MEMORY[0x270F69F90]();
}

uint64_t sub_25D53D840()
{
  return MEMORY[0x270F69FD0]();
}

uint64_t sub_25D53D850()
{
  return MEMORY[0x270F69FD8]();
}

uint64_t sub_25D53D860()
{
  return MEMORY[0x270F69FE0]();
}

uint64_t sub_25D53D870()
{
  return MEMORY[0x270F69FF8]();
}

uint64_t sub_25D53D880()
{
  return MEMORY[0x270F6A038]();
}

uint64_t sub_25D53D890()
{
  return MEMORY[0x270F6A0A0]();
}

uint64_t sub_25D53D8A0()
{
  return MEMORY[0x270F6A0B8]();
}

uint64_t sub_25D53D8B0()
{
  return MEMORY[0x270F6A0D8]();
}

uint64_t sub_25D53D8C0()
{
  return MEMORY[0x270F6A0E8]();
}

uint64_t sub_25D53D8D0()
{
  return MEMORY[0x270F6A0F8]();
}

uint64_t sub_25D53D8E0()
{
  return MEMORY[0x270F6A100]();
}

uint64_t sub_25D53D900()
{
  return MEMORY[0x270F6A130]();
}

uint64_t sub_25D53D910()
{
  return MEMORY[0x270F6A140]();
}

uint64_t sub_25D53D920()
{
  return MEMORY[0x270F6A150]();
}

uint64_t sub_25D53D930()
{
  return MEMORY[0x270F71678]();
}

uint64_t sub_25D53D940()
{
  return MEMORY[0x270F71680]();
}

uint64_t sub_25D53D960()
{
  return MEMORY[0x270F71CC8]();
}

uint64_t sub_25D53D970()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_25D53D980()
{
  return MEMORY[0x270F651B0]();
}

uint64_t sub_25D53D990()
{
  return MEMORY[0x270F651B8]();
}

uint64_t sub_25D53D9A0()
{
  return MEMORY[0x270F651C0]();
}

uint64_t sub_25D53D9B0()
{
  return MEMORY[0x270F651C8]();
}

uint64_t sub_25D53D9C0()
{
  return MEMORY[0x270F651D0]();
}

uint64_t sub_25D53D9D0()
{
  return MEMORY[0x270F651D8]();
}

uint64_t sub_25D53D9E0()
{
  return MEMORY[0x270F651E0]();
}

uint64_t sub_25D53D9F0()
{
  return MEMORY[0x270F652C8]();
}

uint64_t sub_25D53DA00()
{
  return MEMORY[0x270F652D8]();
}

uint64_t sub_25D53DA10()
{
  return MEMORY[0x270F652E0]();
}

uint64_t sub_25D53DA20()
{
  return MEMORY[0x270F65300]();
}

uint64_t sub_25D53DA30()
{
  return MEMORY[0x270F65310]();
}

uint64_t sub_25D53DA40()
{
  return MEMORY[0x270F65320]();
}

uint64_t sub_25D53DA50()
{
  return MEMORY[0x270F65330]();
}

uint64_t sub_25D53DA60()
{
  return MEMORY[0x270F65340]();
}

uint64_t sub_25D53DA70()
{
  return MEMORY[0x270F653C8]();
}

uint64_t sub_25D53DA80()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_25D53DA90()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_25D53DAA0()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_25D53DAB0()
{
  return MEMORY[0x270FA1820]();
}

uint64_t sub_25D53DAC0()
{
  return MEMORY[0x270FA1858]();
}

uint64_t sub_25D53DAD0()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_25D53DAE0()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_25D53DAF0()
{
  return MEMORY[0x270FA1880]();
}

uint64_t sub_25D53DB00()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_25D53DB10()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25D53DB20()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_25D53DB30()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_25D53DB40()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_25D53DB50()
{
  return MEMORY[0x270F70708]();
}

uint64_t sub_25D53DB60()
{
  return MEMORY[0x270F70718]();
}

uint64_t sub_25D53DB70()
{
  return MEMORY[0x270F70720]();
}

uint64_t sub_25D53DB80()
{
  return MEMORY[0x270F70728]();
}

uint64_t sub_25D53DB90()
{
  return MEMORY[0x270F08550]();
}

uint64_t sub_25D53DBA0()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25D53DBB0()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25D53DBC0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25D53DBD0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25D53DBE0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25D53DBF0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25D53DC00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25D53DC10()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25D53DC20()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25D53DC30()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_25D53DC40()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_25D53DC50()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_25D53DC60()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_25D53DC70()
{
  return MEMORY[0x270F70808]();
}

uint64_t sub_25D53DC80()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_25D53DC90()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_25D53DCA0()
{
  return MEMORY[0x270F70A20]();
}

uint64_t sub_25D53DCB0()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_25D53DCC0()
{
  return MEMORY[0x270F70A58]();
}

uint64_t sub_25D53DCD0()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_25D53DCE0()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_25D53DCF0()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_25D53DD00()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_25D53DD10()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_25D53DD20()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25D53DD30()
{
  return MEMORY[0x270F64490]();
}

uint64_t sub_25D53DD40()
{
  return MEMORY[0x270F64498]();
}

uint64_t sub_25D53DD50()
{
  return MEMORY[0x270F644A0]();
}

uint64_t sub_25D53DD60()
{
  return MEMORY[0x270F644A8]();
}

uint64_t sub_25D53DD70()
{
  return MEMORY[0x270F644B0]();
}

uint64_t sub_25D53DD80()
{
  return MEMORY[0x270F644B8]();
}

uint64_t sub_25D53DD90()
{
  return MEMORY[0x270F7F970]();
}

uint64_t sub_25D53DDA0()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_25D53DDB0()
{
  return MEMORY[0x270F7FA10]();
}

uint64_t sub_25D53DDC0()
{
  return MEMORY[0x270F7FA30]();
}

uint64_t sub_25D53DE10()
{
  return MEMORY[0x270F7FD28]();
}

uint64_t sub_25D53DE20()
{
  return MEMORY[0x270F7FD30]();
}

uint64_t sub_25D53DE30()
{
  return MEMORY[0x270F7FD38]();
}

uint64_t sub_25D53DE50()
{
  return MEMORY[0x270F7FE38]();
}

uint64_t sub_25D53DE60()
{
  return MEMORY[0x270F7FE50]();
}

uint64_t sub_25D53DE70()
{
  return MEMORY[0x270F7FE60]();
}

uint64_t sub_25D53DE80()
{
  return MEMORY[0x270F7FE70]();
}

uint64_t sub_25D53DE90()
{
  return MEMORY[0x270F7FEE0]();
}

uint64_t sub_25D53DEA0()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_25D53DEB0()
{
  return MEMORY[0x270F7FF60]();
}

uint64_t sub_25D53DEC0()
{
  return MEMORY[0x270F7FF70]();
}

uint64_t sub_25D53DED0()
{
  return MEMORY[0x270F7FF78]();
}

uint64_t sub_25D53DEE0()
{
  return MEMORY[0x270F7FF88]();
}

uint64_t sub_25D53DEF0()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_25D53DF00()
{
  return MEMORY[0x270F7FFE0]();
}

uint64_t sub_25D53DF10()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_25D53DF20()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_25D53DF30()
{
  return MEMORY[0x270F800C8]();
}

uint64_t sub_25D53DF40()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_25D53DF50()
{
  return MEMORY[0x270F80120]();
}

uint64_t sub_25D53DF60()
{
  return MEMORY[0x270F80148]();
}

uint64_t sub_25D53DF70()
{
  return MEMORY[0x270F80230]();
}

uint64_t sub_25D53DF80()
{
  return MEMORY[0x270F802A0]();
}

uint64_t sub_25D53DF90()
{
  return MEMORY[0x270F80398]();
}

uint64_t sub_25D53DFA0()
{
  return MEMORY[0x270F803B0]();
}

uint64_t sub_25D53DFB0()
{
  return MEMORY[0x270F803B8]();
}

uint64_t sub_25D53DFC0()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_25D53DFD0()
{
  return MEMORY[0x270F80498]();
}

uint64_t sub_25D53DFE0()
{
  return MEMORY[0x270F804A0]();
}

uint64_t sub_25D53DFF0()
{
  return MEMORY[0x270F806E8]();
}

uint64_t sub_25D53E000()
{
  return MEMORY[0x270F806F0]();
}

uint64_t sub_25D53E010()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_25D53E020()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25D53E030()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_25D53E040()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25D53E050()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_25D53E060()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_25D53E070()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25D53E080()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25D53E090()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25D53E0A0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25D53E0B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25D53E0C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25D53E0D0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25D53E0E0()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_25D53E0F0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25D53E100()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_25D53E110()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25D53E120()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_25D53E130()
{
  return MEMORY[0x270F9D360]();
}

uint64_t sub_25D53E140()
{
  return MEMORY[0x270F9D368]();
}

uint64_t sub_25D53E150()
{
  return MEMORY[0x270F9D370]();
}

uint64_t sub_25D53E160()
{
  return MEMORY[0x270F9D378]();
}

uint64_t sub_25D53E170()
{
  return MEMORY[0x270F9D3A0]();
}

uint64_t sub_25D53E180()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25D53E190()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_25D53E1A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25D53E1B0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25D53E1C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25D53E1D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25D53E1E0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25D53E1F0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25D53E200()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25D53E210()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25D53E220()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25D53E230()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25D53E240()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25D53E250()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25D53E260()
{
  return MEMORY[0x270EF1B30]();
}

uint64_t sub_25D53E270()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25D53E280()
{
  return MEMORY[0x270F9D5E8]();
}

uint64_t sub_25D53E290()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_25D53E2A0()
{
  return MEMORY[0x270F70E00]();
}

uint64_t sub_25D53E2B0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25D53E2C0()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_25D53E2D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25D53E2E0()
{
  return MEMORY[0x270F7DF20]();
}

uint64_t sub_25D53E2F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25D53E300()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25D53E310()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25D53E320()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_25D53E330()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25D53E340()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25D53E350()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25D53E360()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25D53E370()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25D53E380()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25D53E390()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25D53E3A0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25D53E3C0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25D53E3D0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_25D53E3E0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25D53E3F0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25D53E400()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25D53E410()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_25D53E420()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25D53E430()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25D53E440()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25D53E450()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25D53E460()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25D53E470()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25D53E480()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25D53E490()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25D53E4A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25D53E4B0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25D53E4C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25D53E4D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25D53E4E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25D53E4F0()
{
  return MEMORY[0x270F70E08]();
}

uint64_t sub_25D53E500()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25D53E510()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_25D53E520()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25D53E530()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25D53E540()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25D53E550()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25D53E560()
{
  return MEMORY[0x270F70E10]();
}

uint64_t sub_25D53E570()
{
  return MEMORY[0x270F9DD58]();
}

uint64_t sub_25D53E580()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25D53E590()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25D53E5A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25D53E5B0()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_25D53E5C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25D53E5D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25D53E5F0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25D53E620()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25D53E640()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_25D53E650()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_25D53E660()
{
  return MEMORY[0x270EF1C38]();
}

uint64_t sub_25D53E670()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25D53E680()
{
  return MEMORY[0x270F70E18]();
}

uint64_t sub_25D53E690()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25D53E6A0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25D53E6B0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25D53E6C0()
{
  return MEMORY[0x270F9DF00]();
}

uint64_t sub_25D53E6D0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25D53E6E0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25D53E6F0()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_25D53E700()
{
  return MEMORY[0x270F70E20]();
}

uint64_t sub_25D53E710()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25D53E720()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25D53E730()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25D53E740()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25D53E750()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_25D53E760()
{
  return MEMORY[0x270FA10E0]();
}

uint64_t sub_25D53E770()
{
  return MEMORY[0x270EF1DD0]();
}

uint64_t sub_25D53E780()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_25D53E790()
{
  return MEMORY[0x270F71FF0]();
}

uint64_t sub_25D53E7A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25D53E7B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25D53E7C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25D53E7D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25D53E7E0()
{
  return MEMORY[0x270F65198]();
}

uint64_t sub_25D53E7F0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25D53E800()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25D53E810()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25D53E820()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25D53E830()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25D53E840()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_25D53E850()
{
  return MEMORY[0x270F6F4D8]();
}

uint64_t sub_25D53E860()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25D53E870()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25D53E880()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_25D53E890()
{
  return MEMORY[0x270F6A158]();
}

uint64_t sub_25D53E8A0()
{
  return MEMORY[0x270F6A160]();
}

uint64_t sub_25D53E8B0()
{
  return MEMORY[0x270F6A168]();
}

uint64_t sub_25D53E8C0()
{
  return MEMORY[0x270F6A170]();
}

uint64_t sub_25D53E8D0()
{
  return MEMORY[0x270F6A178]();
}

uint64_t sub_25D53E8E0()
{
  return MEMORY[0x270F6A180]();
}

uint64_t sub_25D53E8F0()
{
  return MEMORY[0x270FA10E8]();
}

uint64_t sub_25D53E900()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_25D53E910()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_25D53E920()
{
  return MEMORY[0x270F6A188]();
}

uint64_t sub_25D53E930()
{
  return MEMORY[0x270F6A190]();
}

uint64_t sub_25D53E940()
{
  return MEMORY[0x270F6A198]();
}

uint64_t sub_25D53E950()
{
  return MEMORY[0x270F66290]();
}

uint64_t sub_25D53E960()
{
  return MEMORY[0x270F662B8]();
}

uint64_t sub_25D53E970()
{
  return MEMORY[0x270F662C8]();
}

uint64_t sub_25D53E980()
{
  return MEMORY[0x270F6A1B0]();
}

uint64_t sub_25D53E990()
{
  return MEMORY[0x270F65EB0]();
}

uint64_t sub_25D53E9A0()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_25D53E9B0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25D53E9C0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25D53E9D0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25D53E9E0()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25D53E9F0()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_25D53EA00()
{
  return MEMORY[0x270F71FF8]();
}

uint64_t sub_25D53EA10()
{
  return MEMORY[0x270F72000]();
}

uint64_t sub_25D53EA20()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25D53EA30()
{
  return MEMORY[0x270F6A1B8]();
}

uint64_t sub_25D53EA40()
{
  return MEMORY[0x270F6A1C0]();
}

uint64_t sub_25D53EA50()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_25D53EA60()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25D53EA70()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_25D53EA80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25D53EA90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25D53EAA0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25D53EAB0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25D53EAC0()
{
  return MEMORY[0x270EF23F0]();
}

uint64_t sub_25D53EAD0()
{
  return MEMORY[0x270EF23F8]();
}

uint64_t sub_25D53EAE0()
{
  return MEMORY[0x270EF2400]();
}

uint64_t sub_25D53EAF0()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_25D53EB00()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25D53EB10()
{
  return MEMORY[0x270EF2490]();
}

uint64_t sub_25D53EB20()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25D53EB30()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_25D53EB40()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_25D53EB50()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25D53EB60()
{
  return MEMORY[0x270EF25D0]();
}

uint64_t sub_25D53EB70()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_25D53EB80()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25D53EBA0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25D53EBB0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25D53EBC0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25D53EBD0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25D53EBE0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_25D53EBF0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25D53EC00()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_25D53EC10()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_25D53EC20()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_25D53EC30()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25D53EC40()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25D53EC50()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_25D53EC60()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25D53EC70()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_25D53EC80()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_25D53EC90()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25D53ECA0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25D53ECB0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25D53ECC0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25D53ECD0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25D53ECE0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25D53ECF0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25D53ED10()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_25D53ED20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25D53ED30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25D53ED40()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25D53ED50()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25D53ED60()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25D53ED70()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25D53ED80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25D53ED90()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_25D53EDA0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25D53EDB0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25D53EDC0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25D53EDD0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25D53EDE0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25D53EDF0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25D53EE00()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25D53EE10()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25D53EE20()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25D53EE30()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25D53EE40()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25D53EE50()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25D53EE60()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25D53EE70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25D53EE80()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25D53EE90()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_25D53EEA0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25D53EEB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25D53EEC0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25D53EED0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25D53EEE0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25D53EEF0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25D53EF00()
{
  return MEMORY[0x270F9F0F8]();
}

uint64_t sub_25D53EF10()
{
  return MEMORY[0x270F9F110]();
}

uint64_t sub_25D53EF30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25D53EF50()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25D53EF60()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25D53EF70()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25D53EF80()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25D53EFA0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25D53EFB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25D53EFC0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25D53EFD0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25D53EFE0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_25D53EFF0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25D53F010()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25D53F020()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25D53F030()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25D53F040()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25D53F050()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25D53F070()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25D53F080()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25D53F090()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25D53F0A0()
{
  return MEMORY[0x270F9F7D8]();
}

uint64_t sub_25D53F0B0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25D53F0C0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25D53F0D0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25D53F0F0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25D53F100()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25D53F110()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25D53F120()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25D53F140()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25D53F150()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25D53F160()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25D53F170()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25D53F180()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25D53F190()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25D53F1A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25D53F1B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25D53F1C0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25D53F1D0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25D53F1E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25D53F1F0()
{
  return MEMORY[0x270F651A0]();
}

uint64_t sub_25D53F200()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_25D53F210()
{
  return MEMORY[0x270EF2778]();
}

uint64_t sub_25D53F220()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_25D53F230()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25D53F240()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25D53F270()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFGryphonAssetsExistForLanguage()
{
  return MEMORY[0x270F0ED58]();
}

uint64_t AFIsCustomerInstall()
{
  return MEMORY[0x270F0EDA8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x270F18C50]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x270F18C68]();
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

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t INIntentCreate()
{
  return MEMORY[0x270EF51E0]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x270EF51F8]();
}

uint64_t INIntentSlotValueTransformFromDataString()
{
  return MEMORY[0x270EF5220]();
}

uint64_t INIntentSlotValueTransformToContactValue()
{
  return MEMORY[0x270EF5230]();
}

uint64_t INPersonRelationshipValueAsString()
{
  return MEMORY[0x270EF5280]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MRMediaRemoteGetNowPlayingInfo()
{
  return MEMORY[0x270F49FB0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x270F1B730]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
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

void bzero(void *a1, size_t a2)
{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}