uint64_t sub_25A9CC274()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v19;

  OUTLINED_FUNCTION_53();
  v1 = *(void **)(v0 + 176);
  (*(void (**)(void, void, void))(v0 + 136))(*(void *)(v0 + 104), *(void *)(v0 + 128), *(void *)(v0 + 88));
  v2 = v1;
  v3 = v1;
  v4 = sub_25A9DC828();
  v5 = sub_25A9DD3F8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 176);
    v7 = (uint8_t *)OUTLINED_FUNCTION_18_0();
    v8 = (void *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v10;
    sub_25A9DD508();
    *v8 = v10;

    _os_log_impl(&dword_25A8BB000, v4, v5, "Could not look up user notifications: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46BE20);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    v11 = *(void **)(v0 + 176);
  }
  v12 = *(void **)(v0 + 176);
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  v14 = *(void *)(v0 + 104);
  v15 = *(void *)(v0 + 88);

  v13(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_119_1();
  v17 = MEMORY[0x263F8EE78];
  return v16(v17);
}

uint64_t sub_25A9CC460(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_15((uint64_t)sub_25A9CC478);
}

uint64_t sub_25A9CC478()
{
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D970);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = xmmword_25A9E91B0;
  *(void *)(v1 + 32) = sub_25A9DCF68();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = sub_25A9DCF68();
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 64) = sub_25A9DCF68();
  *(void *)(v1 + 72) = v4;
  *(void *)(v1 + 80) = sub_25A9DCF68();
  *(void *)(v1 + 88) = v5;
  *(void *)(v1 + 96) = sub_25A9DCF68();
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 112) = sub_25A9DCF68();
  *(void *)(v1 + 120) = v7;
  *(void *)(v1 + 128) = sub_25A9DCF68();
  *(void *)(v1 + 136) = v8;
  *(void *)(v1 + 144) = sub_25A9DCF68();
  *(void *)(v1 + 152) = v9;
  *(void *)(v1 + 160) = sub_25A9DCF68();
  *(void *)(v1 + 168) = v10;
  *(void *)(v1 + 176) = sub_25A9DCF68();
  *(void *)(v1 + 184) = v11;
  *(void *)(v1 + 192) = sub_25A9DCF68();
  *(void *)(v1 + 200) = v12;
  *(void *)(v1 + 208) = sub_25A9DCF68();
  *(void *)(v1 + 216) = v13;
  *(void *)(v1 + 224) = sub_25A9DCF68();
  *(void *)(v1 + 232) = v14;
  *(void *)(v1 + 240) = sub_25A9DCF68();
  *(void *)(v1 + 248) = v15;
  *(void *)(v1 + 256) = sub_25A9DCF68();
  *(void *)(v1 + 264) = v16;
  *(void *)(v1 + 272) = sub_25A9DCF68();
  *(void *)(v1 + 280) = v17;
  *(void *)(v1 + 288) = sub_25A9DCF68();
  *(void *)(v1 + 296) = v18;
  *(void *)(v1 + 304) = sub_25A9DCF68();
  *(void *)(v1 + 312) = v19;
  *(void *)(v1 + 320) = sub_25A9DCF68();
  *(void *)(v1 + 328) = v20;
  *(void *)(v1 + 336) = sub_25A9DCF68();
  *(void *)(v1 + 344) = v21;
  *(void *)(v1 + 352) = sub_25A9DCF68();
  *(void *)(v1 + 360) = v22;
  *(void *)(v1 + 368) = sub_25A9DCF68();
  *(void *)(v1 + 376) = v23;
  *(void *)(v1 + 384) = sub_25A9DCF68();
  *(void *)(v1 + 392) = v24;
  *(void *)(v1 + 400) = sub_25A9DCF68();
  *(void *)(v1 + 408) = v25;
  *(void *)(v1 + 416) = sub_25A9DCF68();
  *(void *)(v1 + 424) = v26;
  *(void *)(v1 + 432) = sub_25A9DCF68();
  *(void *)(v1 + 440) = v27;
  *(void *)(v1 + 448) = sub_25A9DCF68();
  *(void *)(v1 + 456) = v28;
  *(void *)(v1 + 464) = sub_25A9DCF68();
  *(void *)(v1 + 472) = v29;
  v30 = sub_25A8C3E4C();
  OUTLINED_FUNCTION_89_7((uint64_t)v30);
  v31 = sub_25A8C3EEC();
  v32 = (void *)*v31;
  *(void *)(v0 + 48) = *v31;
  v32;
  uint64_t v33 = swift_task_alloc();
  v34 = (void *)OUTLINED_FUNCTION_35_13(v33);
  void *v34 = v35;
  v34[1] = sub_25A9CC788;
  OUTLINED_FUNCTION_17_18();
  OUTLINED_FUNCTION_54();
  return sub_25A9C89EC();
}

uint64_t sub_25A9CC788()
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_6();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    uint64_t v10 = *(void **)(v3 + 48);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v11 = OUTLINED_FUNCTION_27_11();
    return v12(v11);
  }
}

void sub_25A9CC8A8()
{
  OUTLINED_FUNCTION_47_2();
  uint64_t v41 = v2;
  v43 = v3;
  sub_25A9DB738();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7_7();
  uint64_t v5 = sub_25A9DC848();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_54_2();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_73_5();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D8A8);
  uint64_t v14 = OUTLINED_FUNCTION_31(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_58_5();
  uint64_t v15 = sub_25A9DC5A8();
  OUTLINED_FUNCTION_1();
  uint64_t v42 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_54_2();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_131_2();
  uint64_t v44 = v19;
  sub_25A90B240(v43, 1, v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v15) == 1)
  {
    sub_25A92B6B4(v0, &qword_26B32D8A8);
    sub_25A9994C0();
    OUTLINED_FUNCTION_1_6();
    v20();
    uint64_t v21 = sub_25A9DC828();
    os_log_type_t v22 = sub_25A9DD3F8();
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_4_10(&dword_25A8BB000, v23, v24, "Entity cannot be created during notification lookup");
      OUTLINED_FUNCTION_7();
    }

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
    uint64_t v25 = 1;
    uint64_t v26 = v41;
  }
  else
  {
    uint64_t v27 = *(void (**)(uint64_t))(v42 + 32);
    uint64_t v28 = OUTLINED_FUNCTION_153();
    v27(v28);
    sub_25A9DC508();
    sub_25A9D524C();
    char v29 = sub_25A9DCF08();
    OUTLINED_FUNCTION_18();
    v30();
    if (v29)
    {
      sub_25A9994C0();
      OUTLINED_FUNCTION_1_6();
      v31();
      OUTLINED_FUNCTION_1_6();
      v32();
      uint64_t v33 = sub_25A9DC828();
      os_log_type_t v34 = sub_25A9DD3F8();
      uint64_t v26 = v41;
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)OUTLINED_FUNCTION_18_0();
        uint64_t v45 = OUTLINED_FUNCTION_6_1();
        *(_DWORD *)uint64_t v35 = 136315138;
        uint64_t v36 = sub_25A9DC598();
        sub_25A8C10D0(v36, v37, &v45);
        sub_25A9DD508();
        swift_bridgeObjectRelease();
        v38 = *(void (**)(void))(v42 + 8);
        OUTLINED_FUNCTION_51_8();
        v38();
        _os_log_impl(&dword_25A8BB000, v33, v34, "Date is too old during notification lookup for: %s", v35, 0xCu);
        uint64_t v25 = 1;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        OUTLINED_FUNCTION_18();
        v39();
        OUTLINED_FUNCTION_51_8();
        v38();
      }
      else
      {

        v40 = *(void (**)(void))(v42 + 8);
        OUTLINED_FUNCTION_22_10();
        v40();
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
        OUTLINED_FUNCTION_22_10();
        v40();
        uint64_t v25 = 1;
      }
    }
    else
    {
      uint64_t v26 = v41;
      ((void (*)(uint64_t, uint64_t, uint64_t))v27)(v41, v44, v15);
      uint64_t v25 = 0;
    }
  }
  __swift_storeEnumTagSinglePayload(v26, v25, 1, v15);
  OUTLINED_FUNCTION_46_2();
}

uint64_t sub_25A9CCD50(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_15((uint64_t)sub_25A9CCD68);
}

uint64_t sub_25A9CCD68()
{
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D970);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = xmmword_25A9E91C0;
  *(void *)(v1 + 32) = sub_25A9DCF68();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = sub_25A9DCF68();
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 64) = sub_25A9DCF68();
  *(void *)(v1 + 72) = v4;
  *(void *)(v1 + 80) = sub_25A9DCF68();
  *(void *)(v1 + 88) = v5;
  *(void *)(v1 + 96) = sub_25A9DCF68();
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 112) = sub_25A9DCF68();
  *(void *)(v1 + 120) = v7;
  *(void *)(v1 + 128) = sub_25A9DCF68();
  *(void *)(v1 + 136) = v8;
  *(void *)(v1 + 144) = sub_25A9DCF68();
  *(void *)(v1 + 152) = v9;
  *(void *)(v1 + 160) = sub_25A9DCF68();
  *(void *)(v1 + 168) = v10;
  *(void *)(v1 + 176) = sub_25A9DCF68();
  *(void *)(v1 + 184) = v11;
  *(void *)(v1 + 192) = sub_25A9DCF68();
  *(void *)(v1 + 200) = v12;
  *(void *)(v1 + 208) = sub_25A9DCF68();
  *(void *)(v1 + 216) = v13;
  *(void *)(v1 + 224) = sub_25A9DCF68();
  *(void *)(v1 + 232) = v14;
  *(void *)(v1 + 240) = sub_25A9DCF68();
  *(void *)(v1 + 248) = v15;
  *(void *)(v1 + 256) = sub_25A9DCF68();
  *(void *)(v1 + 264) = v16;
  *(void *)(v1 + 272) = sub_25A9DCF68();
  *(void *)(v1 + 280) = v17;
  *(void *)(v1 + 288) = sub_25A9DCF68();
  *(void *)(v1 + 296) = v18;
  *(void *)(v1 + 304) = sub_25A9DCF68();
  *(void *)(v1 + 312) = v19;
  *(void *)(v1 + 320) = sub_25A9DCF68();
  *(void *)(v1 + 328) = v20;
  *(void *)(v1 + 336) = sub_25A9DCF68();
  *(void *)(v1 + 344) = v21;
  *(void *)(v1 + 352) = sub_25A9DCF68();
  *(void *)(v1 + 360) = v22;
  *(void *)(v1 + 368) = sub_25A9DCF68();
  *(void *)(v1 + 376) = v23;
  *(void *)(v1 + 384) = sub_25A9DCF68();
  *(void *)(v1 + 392) = v24;
  *(void *)(v1 + 400) = sub_25A9DCF68();
  *(void *)(v1 + 408) = v25;
  *(void *)(v1 + 416) = sub_25A9DCF68();
  *(void *)(v1 + 424) = v26;
  *(void *)(v1 + 432) = sub_25A9DCF68();
  *(void *)(v1 + 440) = v27;
  *(void *)(v1 + 448) = sub_25A9DCF68();
  *(void *)(v1 + 456) = v28;
  *(void *)(v1 + 464) = sub_25A9DCF68();
  *(void *)(v1 + 472) = v29;
  *(void *)(v1 + 480) = sub_25A9DCF68();
  *(void *)(v1 + 488) = v30;
  *(void *)(v1 + 496) = sub_25A9DCF68();
  *(void *)(v1 + 504) = v31;
  *(void *)(v1 + 512) = sub_25A9DCF68();
  *(void *)(v1 + 520) = v32;
  *(void *)(v1 + 528) = sub_25A9DCF68();
  *(void *)(v1 + 536) = v33;
  *(void *)(v1 + 544) = sub_25A9DCF68();
  *(void *)(v1 + 552) = v34;
  *(void *)(v1 + 560) = sub_25A9DCF68();
  *(void *)(v1 + 568) = v35;
  *(void *)(v1 + 576) = sub_25A9DCF68();
  *(void *)(v1 + 584) = v36;
  *(void *)(v1 + 592) = sub_25A9DCF68();
  *(void *)(v1 + 600) = v37;
  *(void *)(v1 + 608) = sub_25A9DCF68();
  *(void *)(v1 + 616) = v38;
  *(void *)(v1 + 624) = sub_25A9DCF68();
  *(void *)(v1 + 632) = v39;
  *(void *)(v1 + 640) = 0xD00000000000001ELL;
  *(void *)(v1 + 648) = 0x800000025A9FF240;
  v40 = sub_25A8C3FC4();
  OUTLINED_FUNCTION_89_7((uint64_t)v40);
  uint64_t v41 = sub_25A8C3E88();
  uint64_t v42 = (void *)*v41;
  *(void *)(v0 + 48) = *v41;
  v42;
  uint64_t v43 = swift_task_alloc();
  uint64_t v44 = (void *)OUTLINED_FUNCTION_35_13(v43);
  *uint64_t v44 = v45;
  v44[1] = sub_25A9CD180;
  OUTLINED_FUNCTION_17_18();
  OUTLINED_FUNCTION_54();
  return sub_25A9C89EC();
}

uint64_t sub_25A9CD180()
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_6();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    uint64_t v10 = *(void **)(v3 + 48);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v11 = OUTLINED_FUNCTION_27_11();
    return v12(v11);
  }
}

uint64_t sub_25A9CD2A0()
{
  OUTLINED_FUNCTION_3();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8();
  return v1();
}

uint64_t sub_25A9CD310(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_15((uint64_t)sub_25A9CD328);
}

uint64_t sub_25A9CD328()
{
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D970);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = xmmword_25A9E91C0;
  *(void *)(v1 + 32) = sub_25A9DCF68();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = sub_25A9DCF68();
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 64) = sub_25A9DCF68();
  *(void *)(v1 + 72) = v4;
  *(void *)(v1 + 80) = sub_25A9DCF68();
  *(void *)(v1 + 88) = v5;
  *(void *)(v1 + 96) = sub_25A9DCF68();
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 112) = sub_25A9DCF68();
  *(void *)(v1 + 120) = v7;
  *(void *)(v1 + 128) = sub_25A9DCF68();
  *(void *)(v1 + 136) = v8;
  *(void *)(v1 + 144) = sub_25A9DCF68();
  *(void *)(v1 + 152) = v9;
  *(void *)(v1 + 160) = sub_25A9DCF68();
  *(void *)(v1 + 168) = v10;
  *(void *)(v1 + 176) = sub_25A9DCF68();
  *(void *)(v1 + 184) = v11;
  *(void *)(v1 + 192) = sub_25A9DCF68();
  *(void *)(v1 + 200) = v12;
  *(void *)(v1 + 208) = sub_25A9DCF68();
  *(void *)(v1 + 216) = v13;
  *(void *)(v1 + 224) = sub_25A9DCF68();
  *(void *)(v1 + 232) = v14;
  *(void *)(v1 + 240) = sub_25A9DCF68();
  *(void *)(v1 + 248) = v15;
  *(void *)(v1 + 256) = sub_25A9DCF68();
  *(void *)(v1 + 264) = v16;
  *(void *)(v1 + 272) = sub_25A9DCF68();
  *(void *)(v1 + 280) = v17;
  *(void *)(v1 + 288) = sub_25A9DCF68();
  *(void *)(v1 + 296) = v18;
  *(void *)(v1 + 304) = sub_25A9DCF68();
  *(void *)(v1 + 312) = v19;
  *(void *)(v1 + 320) = sub_25A9DCF68();
  *(void *)(v1 + 328) = v20;
  *(void *)(v1 + 336) = sub_25A9DCF68();
  *(void *)(v1 + 344) = v21;
  *(void *)(v1 + 352) = sub_25A9DCF68();
  *(void *)(v1 + 360) = v22;
  *(void *)(v1 + 368) = sub_25A9DCF68();
  *(void *)(v1 + 376) = v23;
  *(void *)(v1 + 384) = sub_25A9DCF68();
  *(void *)(v1 + 392) = v24;
  *(void *)(v1 + 400) = sub_25A9DCF68();
  *(void *)(v1 + 408) = v25;
  *(void *)(v1 + 416) = sub_25A9DCF68();
  *(void *)(v1 + 424) = v26;
  *(void *)(v1 + 432) = sub_25A9DCF68();
  *(void *)(v1 + 440) = v27;
  *(void *)(v1 + 448) = sub_25A9DCF68();
  *(void *)(v1 + 456) = v28;
  *(void *)(v1 + 464) = sub_25A9DCF68();
  *(void *)(v1 + 472) = v29;
  *(void *)(v1 + 480) = sub_25A9DCF68();
  *(void *)(v1 + 488) = v30;
  *(void *)(v1 + 496) = sub_25A9DCF68();
  *(void *)(v1 + 504) = v31;
  *(void *)(v1 + 512) = sub_25A9DCF68();
  *(void *)(v1 + 520) = v32;
  *(void *)(v1 + 528) = sub_25A9DCF68();
  *(void *)(v1 + 536) = v33;
  *(void *)(v1 + 544) = sub_25A9DCF68();
  *(void *)(v1 + 552) = v34;
  *(void *)(v1 + 560) = 0xD000000000000028;
  OUTLINED_FUNCTION_49_3();
  *(void *)(v1 + 568) = v35;
  *(void *)(v1 + 576) = v36 + 10;
  OUTLINED_FUNCTION_49_3();
  *(void *)(v1 + 584) = v37;
  OUTLINED_FUNCTION_49_3();
  *(void *)(v1 + 600) = v38;
  *(void *)(v1 + 608) = v39 | 5;
  *(void *)(v1 + 592) = v39;
  OUTLINED_FUNCTION_49_3();
  *(void *)(v1 + 616) = v40;
  *(void *)(v1 + 624) = v41 + 6;
  OUTLINED_FUNCTION_49_3();
  *(void *)(v1 + 632) = v42;
  *(void *)(v1 + 640) = v43 | 1;
  *(void *)(v1 + 648) = 0x800000025A9FAA80;
  uint64_t v44 = sub_25A8C40F0();
  OUTLINED_FUNCTION_89_7((uint64_t)v44);
  uint64_t v45 = sub_25A8C3F50();
  uint64_t v46 = (void *)*v45;
  *(void *)(v0 + 48) = *v45;
  v46;
  uint64_t v47 = swift_task_alloc();
  v48 = (void *)OUTLINED_FUNCTION_35_13(v47);
  void *v48 = v49;
  v48[1] = sub_25A9CC788;
  OUTLINED_FUNCTION_17_18();
  OUTLINED_FUNCTION_54();
  return sub_25A9C89EC();
}

uint64_t sub_25A9CD744(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25A9DD7C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_25A9D0458(0, v3 & ~(v3 >> 63), 0);
  uint64_t v4 = v10;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25A9DD7C8();
    swift_bridgeObjectRelease();
    if (!v6) {
      return v4;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0) {
    id v7 = (id)MEMORY[0x26114AA30](0, a1);
  }
  else {
    id v7 = *(id *)(a1 + 32);
  }
  uint64_t v8 = v7;
  self;
  if (swift_dynamicCastObjCClass())
  {
    sub_25A9DD168();

    swift_release();
  }
  else
  {
    swift_release();
  }
  return 0;
}

uint64_t sub_25A9CD910(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D0C8);
    uint64_t v2 = sub_25A9DD7E8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
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
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25A8C1D28(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25A8DA2D8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_25A8DA2D8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_25A8DA2D8(v36, v37);
    sub_25A8DA2D8(v37, &v33);
    uint64_t result = sub_25A9DD5F8();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v2 + 48) + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_25A8DA2D8(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v21));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_25A9B5C74();
    return v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_25A9CDCD4()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v1;
  *(void *)(v0 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A9CDD68;
  return sub_25A9CD310(v2);
}

uint64_t sub_25A9CDD68()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *int64_t v8 = v7;
  *(void *)(v5 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 40) = v3;
    OUTLINED_FUNCTION_6();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

#error "25A9CDF00: call analysis failed (funcsize=43)"

uint64_t sub_25A9CDF30()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v1;
  *(void *)(v0 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A9CDFC4;
  return sub_25A9CCD50(v2);
}

uint64_t sub_25A9CDFC4()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *int64_t v8 = v7;
  *(void *)(v5 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 40) = v3;
    OUTLINED_FUNCTION_6();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

#error "25A9CE15C: call analysis failed (funcsize=43)"

void sub_25A9CE18C()
{
  OUTLINED_FUNCTION_47_2();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v171 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46C590);
  uint64_t v7 = OUTLINED_FUNCTION_31(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  uint64_t v155 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46B008);
  uint64_t v10 = OUTLINED_FUNCTION_31(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_1();
  uint64_t v166 = v11;
  uint64_t v159 = sub_25A9DBFC8();
  OUTLINED_FUNCTION_1();
  uint64_t v156 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_121();
  uint64_t v153 = v14;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_131_2();
  uint64_t v154 = v16;
  uint64_t v170 = sub_25A9DB738();
  OUTLINED_FUNCTION_1();
  uint64_t v162 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1_1();
  uint64_t v161 = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B32D860);
  uint64_t v21 = OUTLINED_FUNCTION_31(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_121();
  uint64_t v152 = v22;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_70();
  uint64_t v151 = v24;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_70();
  uint64_t v169 = v26;
  OUTLINED_FUNCTION_66();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  long long v30 = (char *)v144 - v29;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_131_2();
  uint64_t v167 = v31;
  uint64_t v32 = sub_25A9DC848();
  OUTLINED_FUNCTION_1();
  uint64_t v34 = v33;
  MEMORY[0x270FA5388](v35);
  v164 = (char *)v144 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_70();
  unint64_t v149 = v38;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_70();
  uint64_t v150 = v40;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_73_5();
  id v42 = objc_msgSend(*v4, sel_attributeSet);
  sub_25A9C1A28(0, v2);
  uint64_t v44 = v43;
  sub_25A9C1A28(1, v2);
  uint64_t v46 = v45;
  sub_25A9C1A28(2, v2);
  uint64_t v48 = v47;
  sub_25A9C1A28(3, v2);
  uint64_t v50 = v49;
  uint64_t v51 = sub_25A8C3980(v42, (SEL *)&selRef_uniqueIdentifier);
  uint64_t v168 = v52;
  if (!v52)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A9994C0();
    OUTLINED_FUNCTION_1_6();
    v64();
    v65 = sub_25A9DC828();
    os_log_type_t v66 = sub_25A9DD3F8();
    if (os_log_type_enabled(v65, v66))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_4_10(&dword_25A8BB000, v67, v68, "Missing unique identifier");
      OUTLINED_FUNCTION_7();
    }

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v0, v32);
    goto LABEL_25;
  }
  uint64_t v165 = v44;
  uint64_t v160 = v50;
  uint64_t v157 = v48;
  uint64_t v158 = v46;
  uint64_t v148 = v51;
  id v163 = v42;
  id v53 = objc_msgSend(v42, sel_mailDateReceived);
  if (v53)
  {
    v54 = v53;
    uint64_t v55 = v161;
    sub_25A9DB708();

    v56 = *(void (**)(char *, uint64_t, uint64_t))(v162 + 32);
    uint64_t v57 = v55;
    uint64_t v58 = v170;
    v56(v30, v57, v170);
    OUTLINED_FUNCTION_98_5((uint64_t)v30, 0);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v58);
    uint64_t v60 = v169;
    if (EnumTagSinglePayload != 1)
    {
      uint64_t v61 = v167;
      v56((char *)v167, (uint64_t)v30, v58);
      OUTLINED_FUNCTION_98_5(v61, 0);
      id v62 = v163;
      OUTLINED_FUNCTION_129_3();
      uint64_t v63 = v166;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v58 = v170;
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 1, 1, v170);
    uint64_t v60 = v169;
  }
  id v62 = v163;
  id v69 = objc_msgSend(v163, sel_contentCreationDate);
  if (v69)
  {
    v70 = v69;
    sub_25A9DB708();

    uint64_t v71 = 0;
  }
  else
  {
    uint64_t v71 = 1;
  }
  uint64_t v61 = v167;
  OUTLINED_FUNCTION_98_5(v60, v71);
  sub_25A9D58CC(v60, v61, (uint64_t *)&unk_26B32D860);
  sub_25A92B6B4((uint64_t)v30, (uint64_t *)&unk_26B32D860);
  OUTLINED_FUNCTION_129_3();
  uint64_t v63 = v166;
LABEL_13:
  if (__swift_getEnumTagSinglePayload(v61, 1, v58) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A92B6B4(v61, (uint64_t *)&unk_26B32D860);
    sub_25A9994C0();
    OUTLINED_FUNCTION_42_3();
    v72 = v164;
    OUTLINED_FUNCTION_1_6();
    v73();
    swift_bridgeObjectRetain();
    v74 = (void *)sub_25A9DC828();
    os_log_type_t v75 = sub_25A9DD3F8();
    if (OUTLINED_FUNCTION_12_5(v75))
    {
      OUTLINED_FUNCTION_18_0();
      v173[0] = OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_36_4(4.8149e-34);
      uint64_t v76 = OUTLINED_FUNCTION_55_7();
      OUTLINED_FUNCTION_24_12(v76);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_7_10(&dword_25A8BB000, v77, v78, "Missing date; id: %s");
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

LABEL_23:
      OUTLINED_FUNCTION_14_5();
      v96();
      goto LABEL_26;
    }

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, char *))(v60 + 8))(v72, v30);
LABEL_25:
    uint64_t v32 = 1;
    goto LABEL_26;
  }
  sub_25A92B6B4(v61, (uint64_t *)&unk_26B32D860);
  uint64_t v79 = sub_25A8C3980(v62, (SEL *)&selRef_accountIdentifier);
  if (!v80)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A9994C0();
    OUTLINED_FUNCTION_42_3();
    unint64_t v83 = v150;
    OUTLINED_FUNCTION_1_6();
    v91();
    swift_bridgeObjectRetain();
    v85 = (void *)sub_25A9DC828();
    os_log_type_t v92 = sub_25A9DD3F8();
    if (OUTLINED_FUNCTION_12_5(v92))
    {
      OUTLINED_FUNCTION_18_0();
      v173[0] = OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_36_4(4.8149e-34);
      uint64_t v93 = OUTLINED_FUNCTION_55_7();
      OUTLINED_FUNCTION_24_12(v93);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_7_10(&dword_25A8BB000, v94, v95, "Missing account identifier; id: %s");
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      goto LABEL_23;
    }
    goto LABEL_24;
  }
  uint64_t v81 = v79;
  uint64_t v82 = v80;
  sub_25A9C6870(v165, MEMORY[0x263F61BA8], v63);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v63, 1, v159) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A92B6B4(v63, &qword_26A46B008);
    sub_25A9994C0();
    OUTLINED_FUNCTION_42_3();
    unint64_t v83 = v149;
    OUTLINED_FUNCTION_1_6();
    v84();
    swift_bridgeObjectRetain();
    v85 = (void *)sub_25A9DC828();
    os_log_type_t v86 = sub_25A9DD3F8();
    if (OUTLINED_FUNCTION_12_5(v86))
    {
      OUTLINED_FUNCTION_18_0();
      v173[0] = OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_36_4(4.8149e-34);
      uint64_t v87 = OUTLINED_FUNCTION_55_7();
      OUTLINED_FUNCTION_24_12(v87);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_7_10(&dword_25A8BB000, v88, v89, "Missing sender; id: %s");
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_14_5();
      v90();
LABEL_26:
      uint64_t v97 = v171;
      goto LABEL_27;
    }
LABEL_24:

    swift_bridgeObjectRelease_n();
    (*(void (**)(unint64_t, char *))(v60 + 8))(v83, v30);
    goto LABEL_25;
  }
  uint64_t v170 = v82;
  OUTLINED_FUNCTION_55();
  v99();
  uint64_t v162 = sub_25A91B100();
  uint64_t v100 = sub_25A8C3980(v62, (SEL *)&selRef_domainIdentifier);
  uint64_t v166 = v101;
  uint64_t v167 = v100;
  uint64_t v102 = sub_25A8C3980(v62, (SEL *)&selRef_bundleID);
  v164 = v103;
  uint64_t v165 = v102;
  uint64_t v161 = sub_25A8DA568(v62, (SEL *)&selRef_accountHandles);
  OUTLINED_FUNCTION_1_6();
  v104();
  uint64_t v105 = sub_25A8C3980(v62, (SEL *)&selRef_subject);
  if (v106) {
    uint64_t v107 = v105;
  }
  else {
    uint64_t v107 = 0;
  }
  uint64_t v150 = v107;
  unint64_t v108 = 0xE000000000000000;
  if (v106) {
    unint64_t v108 = v106;
  }
  unint64_t v149 = v108;
  uint64_t v147 = sub_25A8C3980(v62, (SEL *)&selRef_contentSnippet);
  uint64_t v146 = v109;
  id v110 = objc_msgSend(v62, sel_isPartiallyDownloaded);
  if (v110)
  {
    v111 = v110;
    unsigned int v112 = objc_msgSend(v110, sel_BOOLValue);

    int v113 = v112 ^ 1;
  }
  else
  {
    int v113 = 1;
  }
  int v145 = v113;
  uint64_t v114 = v152;
  uint64_t v115 = v151;
  uint64_t v116 = sub_25A8DA568(v62, (SEL *)&selRef_mailboxIdentifiers);
  uint64_t v117 = MEMORY[0x263F8EE78];
  if (v116) {
    uint64_t v117 = v116;
  }
  v144[2] = v117;
  v144[1] = sub_25A8C3980(v62, (SEL *)&selRef_mailConversationID);
  v144[0] = v118;
  id v119 = objc_msgSend(v62, sel_contentCreationDate);
  if (v119)
  {
    v120 = v119;
    sub_25A9DB708();

    uint64_t v121 = 0;
  }
  else
  {
    uint64_t v121 = 1;
  }
  uint64_t v122 = 1;
  OUTLINED_FUNCTION_98_5(v115, v121);
  id v123 = objc_msgSend(v62, sel_mailDateReceived);
  if (v123)
  {
    v124 = v123;
    sub_25A9DB708();

    uint64_t v122 = 0;
  }
  uint64_t v169 = v81;
  OUTLINED_FUNCTION_98_5(v114, v122);
  objc_msgSend(v62, sel_mailCategories);
  uint64_t v125 = v155;
  sub_25A9DBCB8();
  uint64_t v126 = sub_25A9DBCC8();
  __swift_storeEnumTagSinglePayload(v125, 0, 1, v126);
  id v127 = objc_msgSend(v62, sel_isNew);
  if (v127)
  {
    v128 = v127;
    objc_msgSend(v127, sel_BOOLValue);
  }
  id v129 = objc_msgSend(v62, sel_isTwoFactorCode);
  if (v129)
  {
    v130 = v129;
    objc_msgSend(v129, sel_BOOLValue);
  }
  id v131 = objc_msgSend(v62, sel_isFromMe);
  if (v131)
  {
    v132 = v131;
    objc_msgSend(v131, sel_BOOLValue);
  }
  id v133 = objc_msgSend(v62, sel_isLikelyJunk);
  objc_msgSend(v133, sel_BOOLValue);

  id v134 = objc_msgSend(v62, sel_mailRead);
  if (v134)
  {
    v135 = v134;
    objc_msgSend(v134, sel_BOOLValue);
  }
  id v136 = objc_msgSend(v62, sel_mailVIP);
  if (v136)
  {
    v137 = v136;
    objc_msgSend(v136, sel_BOOLValue);
  }
  id v138 = objc_msgSend(v62, sel_mailFlagged);
  if (v138)
  {
    v139 = v138;
    objc_msgSend(v138, sel_BOOLValue);
  }
  v140 = (void *)sub_25A9DCF48();
  id v141 = objc_msgSend(v163, sel_attributeForKey_, v140);

  if (v141)
  {
    sub_25A9DD588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v172, 0, 32);
  }
  sub_25A9D58CC((uint64_t)v172, (uint64_t)v173, qword_26B32D998);
  id v142 = v163;
  if (v173[3]) {
    swift_dynamicCast();
  }
  else {
    sub_25A92B6B4((uint64_t)v173, qword_26B32D998);
  }
  uint64_t v97 = v171;
  sub_25A9DBEF8();

  OUTLINED_FUNCTION_18();
  v143();
  uint64_t v32 = 0;
LABEL_27:
  uint64_t v98 = sub_25A9DBF28();
  __swift_storeEnumTagSinglePayload(v97, v32, 1, v98);
  OUTLINED_FUNCTION_46_2();
}

uint64_t sub_25A9CF0FC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);

  return v0;
}

uint64_t sub_25A9CF138()
{
  sub_25A9CF0FC();
  uint64_t v0 = OUTLINED_FUNCTION_344();
  return MEMORY[0x270FA0228](v0, v1, v2);
}

id sub_25A9CF164(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_25A9DCF48();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithQueryString_queryContext_, v5, a3);

  return v6;
}

id sub_25A9CF1C8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)sub_25A9DCEA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = objc_msgSend(v1, sel_initWithAttributes_, v2);

  return v3;
}

uint64_t sub_25A9CF248(uint64_t a1, void (*a2)(void))
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_74();
    uint64_t result = sub_25A9DD7A8();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      a2(0);
      uint64_t v4 = sub_25A9DD1C8();
      *(void *)(v4 + 16) = a1;
    }
    else
    {
      uint64_t v4 = MEMORY[0x263F8EE78];
    }
    ((uint64_t (*)(void))a2)(0);
    return v4;
  }
  return result;
}

char *sub_25A9CF330(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D380);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25A9CF86C((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A9CF618(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_25A9CF420(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), void (*a8)(void))
{
  if (a3)
  {
    unint64_t v14 = *(void *)(a4 + 24);
    uint64_t v15 = v14 >> 1;
    if ((uint64_t)(v14 >> 1) < a2)
    {
      if (v15 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v14 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v15 = a2;
      }
    }
  }
  else
  {
    uint64_t v15 = a2;
  }
  uint64_t v16 = *(void *)(a4 + 16);
  if (v15 <= v16) {
    uint64_t v17 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v17 = v15;
  }
  if (!v17)
  {
    uint64_t v21 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v18 = a6(0);
  OUTLINED_FUNCTION_2(v18);
  uint64_t v20 = *(void *)(v19 + 72);
  uint64_t v21 = (void *)OUTLINED_FUNCTION_62_8();
  size_t v22 = _swift_stdlib_malloc_size(v21);
  if (!v20 || (v22 - v8 == 0x8000000000000000 ? (BOOL v23 = v20 == -1) : (BOOL v23 = 0), v23))
  {
LABEL_24:
    OUTLINED_FUNCTION_74();
    uint64_t result = sub_25A9DD7A8();
    __break(1u);
    return result;
  }
  v21[2] = v16;
  v21[3] = 2 * ((uint64_t)(v22 - v8) / v20);
LABEL_19:
  uint64_t v24 = *(void *)(a6(0) - 8);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v26 = (unint64_t)v21 + v25;
  if (a1)
  {
    sub_25A9CF8EC(a4 + v25, v16, v26, a8);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A9CF730(0, v16, v26, a4, a7);
  }
  return (uint64_t)v21;
}

uint64_t sub_25A9CF618(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D8B8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25A9DD7F8();
  __break(1u);
  return result;
}

uint64_t sub_25A9CF730(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    OUTLINED_FUNCTION_74();
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a5(0) - 8);
  uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = v10 + v11 * a1;
  unint64_t v13 = a3 + v11 * v5;
  if (v12 >= v13 || v12 + v11 * v5 <= a3)
  {
    swift_arrayInitWithCopy();
    swift_bridgeObjectRelease();
    return v13;
  }
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_24_11();
LABEL_11:
  uint64_t result = OUTLINED_FUNCTION_39_11();
  __break(1u);
  return result;
}

char *sub_25A9CF86C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_74();
    __src = (char *)OUTLINED_FUNCTION_39_11();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_25A9CF8EC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_39_11();
    __break(1u);
  }
  else if (a3 < a1 || (a4(0), OUTLINED_FUNCTION_4(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_1_2();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_1_2();
    swift_arrayInitWithTakeBackToFront();
  }
}

uint64_t sub_25A9CF9F4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25A9DD7F8();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D378);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25A9CFAF4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    unint64_t v6 = (void *)((char *)v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_25A8EF3D4(0, v5, v6);
    uint64_t v7 = sub_25A9CFC88((uint64_t)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    sub_25A8EF3D4(0, v5, v8);
    uint64_t v7 = sub_25A9CFC88((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x26114B890](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_25A9CFC88(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) >= *(void *)(a3 + 16))
  {
    int64_t v34 = 0;
    uint64_t v60 = a3 + 56;
    uint64_t v61 = 0;
    uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v37 = v36 & *(void *)(a3 + 56);
    int64_t v63 = (unint64_t)(v35 + 63) >> 6;
    uint64_t v38 = a4 + 56;
    while (1)
    {
      while (1)
      {
        if (v37)
        {
          unint64_t v39 = __clz(__rbit64(v37));
          v37 &= v37 - 1;
          unint64_t v40 = v39 | (v34 << 6);
        }
        else
        {
          int64_t v41 = v34 + 1;
          if (__OFADD__(v34, 1))
          {
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v41 >= v63) {
            goto LABEL_79;
          }
          unint64_t v42 = *(void *)(v60 + 8 * v41);
          ++v34;
          if (!v42)
          {
            int64_t v34 = v41 + 1;
            if (v41 + 1 >= v63) {
              goto LABEL_79;
            }
            unint64_t v42 = *(void *)(v60 + 8 * v34);
            if (!v42)
            {
              int64_t v34 = v41 + 2;
              if (v41 + 2 >= v63) {
                goto LABEL_79;
              }
              unint64_t v42 = *(void *)(v60 + 8 * v34);
              if (!v42)
              {
                int64_t v43 = v41 + 3;
                if (v43 >= v63) {
                  goto LABEL_79;
                }
                unint64_t v42 = *(void *)(v60 + 8 * v43);
                if (!v42)
                {
                  while (1)
                  {
                    int64_t v34 = v43 + 1;
                    if (__OFADD__(v43, 1)) {
                      goto LABEL_85;
                    }
                    if (v34 >= v63) {
                      break;
                    }
                    unint64_t v42 = *(void *)(v60 + 8 * v34);
                    ++v43;
                    if (v42) {
                      goto LABEL_61;
                    }
                  }
LABEL_79:
                  swift_retain();
                  return sub_25A9D01C8(v57, a2, v61, v5);
                }
                int64_t v34 = v43;
              }
            }
          }
LABEL_61:
          unint64_t v37 = (v42 - 1) & v42;
          unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
        }
        uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
        uint64_t v46 = *v44;
        uint64_t v45 = v44[1];
        sub_25A9DDAE8();
        swift_bridgeObjectRetain();
        sub_25A9DD028();
        uint64_t v47 = sub_25A9DDB08();
        uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
        unint64_t v49 = v47 & ~v48;
        if ((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49)) {
          break;
        }
LABEL_78:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v50 = *(void *)(a4 + 48);
      uint64_t v51 = (void *)(v50 + 16 * v49);
      BOOL v52 = *v51 == v46 && v51[1] == v45;
      if (!v52 && (sub_25A9DD9E8() & 1) == 0)
      {
        uint64_t v53 = ~v48;
        do
        {
          unint64_t v49 = (v49 + 1) & v53;
          if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
            goto LABEL_78;
          }
          v54 = (void *)(v50 + 16 * v49);
          BOOL v55 = *v54 == v46 && v54[1] == v45;
        }
        while (!v55 && (sub_25A9DD9E8() & 1) == 0);
      }
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_83;
      }
    }
  }
  int64_t v6 = 0;
  uint64_t v58 = a4 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  int64_t v59 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v61 = 0;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      int64_t v62 = v6;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v13 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    if (v13 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v13);
    int64_t v15 = v6 + 1;
    if (!v14)
    {
      int64_t v15 = v6 + 2;
      if (v6 + 2 >= v59) {
        goto LABEL_79;
      }
      unint64_t v14 = *(void *)(v58 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v6 + 3;
        if (v6 + 3 >= v59) {
          goto LABEL_79;
        }
        unint64_t v14 = *(void *)(v58 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v9 = (v14 - 1) & v14;
    int64_t v62 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_25A9DDAE8();
    swift_bridgeObjectRetain();
    sub_25A9DD028();
    uint64_t v20 = sub_25A9DDB08();
    uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    uint64_t v24 = 1 << v22;
    if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) == 0) {
      goto LABEL_36;
    }
    uint64_t v25 = *(void *)(a3 + 48);
    unint64_t v26 = (void *)(v25 + 16 * v22);
    BOOL v27 = *v26 == v19 && v26[1] == v18;
    if (v27 || (sub_25A9DD9E8() & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v28 = ~v21;
      for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
      {
        unint64_t v30 = i & v28;
        if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
          break;
        }
        uint64_t v31 = (void *)(v25 + 16 * v30);
        BOOL v32 = *v31 == v19 && v31[1] == v18;
        if (v32 || (sub_25A9DD9E8() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v23 = v30 >> 6;
          uint64_t v24 = 1 << v30;
          goto LABEL_38;
        }
      }
LABEL_36:
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v6 = v62;
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  uint64_t v16 = v6 + 4;
  if (v6 + 4 >= v59) {
    goto LABEL_79;
  }
  unint64_t v14 = *(void *)(v58 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v6 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_25A9D01C8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46BCF0);
  uint64_t result = sub_25A9DD648();
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
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25A9DDAE8();
    swift_bridgeObjectRetain();
    sub_25A9DD028();
    uint64_t result = sub_25A9DDB08();
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

char *sub_25A9D0458(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A9D0478(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_25A9D0478(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D370);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25A9CF86C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25A9CF9F4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_25A9D055C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v137 = type metadata accessor for SpotlightReader.MessageWithDate();
  uint64_t v131 = *(void *)(v137 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v137);
  uint64_t v128 = (uint64_t)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v138 = (uint64_t)&v121 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v134 = (uint64_t)&v121 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (uint64_t)&v121 - v10;
  uint64_t v11 = a1[1];
  uint64_t v12 = sub_25A9DD998();
  if (v12 >= v11)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11) {
        sub_25A9D2A54(0, v11, 1, a1);
      }
      return;
    }
    goto LABEL_143;
  }
  uint64_t v13 = v12;
  id v136 = a1;
  uint64_t v124 = sub_25A9CF248(v11 / 2, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
  uint64_t v125 = v11;
  unint64_t v130 = v14;
  if (v11 <= 0)
  {
LABEL_105:
    uint64_t v16 = (char *)MEMORY[0x263F8EE78];
    unint64_t v64 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
    if (v64 < 2)
    {
      uint64_t v113 = v125;
LABEL_119:
      swift_bridgeObjectRelease();
      if (v113 >= -1) {
        goto LABEL_120;
      }
      goto LABEL_147;
    }
    uint64_t v114 = *v136;
    uint64_t v113 = v125;
    while (1)
    {
      unint64_t v115 = v64 - 2;
      if (v64 < 2) {
        break;
      }
      if (!v114) {
        goto LABEL_151;
      }
      uint64_t v116 = v16;
      uint64_t v117 = *(void *)&v16[16 * v115 + 32];
      uint64_t v118 = *(void *)&v16[16 * v64 + 24];
      sub_25A9D33F4(v114 + *(void *)(v131 + 72) * v117, v114 + *(void *)(v131 + 72) * *(void *)&v16[16 * v64 + 16], v114 + *(void *)(v131 + 72) * v118, v130);
      if (v2) {
        goto LABEL_103;
      }
      if (v118 < v117) {
        goto LABEL_138;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v116 = sub_25A9BFDF4((uint64_t)v16);
      }
      if (v115 >= *((void *)v116 + 2)) {
        goto LABEL_139;
      }
      id v119 = &v116[16 * v115 + 32];
      *(void *)id v119 = v117;
      *((void *)v119 + 1) = v118;
      unint64_t v120 = *((void *)v116 + 2);
      if (v64 > v120) {
        goto LABEL_140;
      }
      memmove(&v116[16 * v64 + 16], &v116[16 * v64 + 32], 16 * (v120 - v64));
      *((void *)v116 + 2) = v120 - 1;
      unint64_t v64 = v120 - 1;
      uint64_t v16 = v116;
      if (v120 <= 2) {
        goto LABEL_119;
      }
    }
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
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
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
    return;
  }
  uint64_t v123 = v13;
  uint64_t v15 = 0;
  uint64_t v16 = (char *)MEMORY[0x263F8EE78];
  uint64_t v17 = v11;
  while (1)
  {
    uint64_t v18 = v15;
    uint64_t v19 = v15 + 1;
    if (v15 + 1 >= v17)
    {
      uint64_t v25 = v15 + 1;
    }
    else
    {
      uint64_t v20 = *v136;
      uint64_t v21 = *(void *)(v131 + 72);
      uint64_t v22 = v133;
      sub_25A9D5360(*v136 + v21 * v19, v133);
      uint64_t v23 = v134;
      sub_25A9D5360(v20 + v21 * v18, v134);
      LODWORD(v132) = sub_25A9DB6C8();
      sub_25A9D4764(v23);
      sub_25A9D4764(v22);
      uint64_t v24 = v20;
      uint64_t v25 = v18 + 2;
      uint64_t v127 = v24;
      uint64_t v139 = v21;
      if (v18 + 2 >= v17)
      {
        uint64_t v34 = v21;
      }
      else
      {
        uint64_t v129 = v18;
        uint64_t v126 = v16;
        uint64_t v26 = v21 * v19;
        uint64_t v27 = v24;
        uint64_t v28 = v21 * v25;
        while (1)
        {
          uint64_t v29 = v17;
          uint64_t v30 = v25;
          uint64_t v31 = v133;
          sub_25A9D5360(v27 + v28, v133);
          uint64_t v32 = v134;
          sub_25A9D5360(v27 + v26, v134);
          int v33 = sub_25A9DB6C8();
          sub_25A9D4764(v32);
          sub_25A9D4764(v31);
          if ((v132 ^ v33)) {
            break;
          }
          uint64_t v25 = v30 + 1;
          uint64_t v34 = v139;
          v27 += v139;
          uint64_t v17 = v29;
          if (v25 >= v29)
          {
            uint64_t v25 = v29;
            uint64_t v16 = v126;
            uint64_t v18 = v129;
            goto LABEL_13;
          }
        }
        uint64_t v16 = v126;
        uint64_t v25 = v30;
        uint64_t v18 = v129;
        uint64_t v17 = v29;
        uint64_t v34 = v139;
      }
LABEL_13:
      if (v132)
      {
        if (v25 < v18) {
          goto LABEL_144;
        }
        if (v18 < v25)
        {
          uint64_t v132 = v17;
          uint64_t v126 = v16;
          uint64_t v35 = 0;
          uint64_t v36 = v18;
          uint64_t v37 = v34 * (v25 - 1);
          uint64_t v38 = v25;
          uint64_t v39 = v25 * v34;
          uint64_t v40 = v36;
          uint64_t v129 = v36;
          uint64_t v41 = v36 * v34;
          unint64_t v42 = v136;
          uint64_t v135 = v38;
          do
          {
            if (v40 != v38 + v35 - 1)
            {
              uint64_t v43 = v2;
              uint64_t v44 = v127;
              if (!v127) {
                goto LABEL_150;
              }
              unint64_t v45 = v127 + v41;
              uint64_t v46 = v127 + v37;
              sub_25A9D4710(v127 + v41, v128, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
              if (v41 < v37 || v45 >= v44 + v39)
              {
                swift_arrayInitWithTakeFrontToBack();
                uint64_t v2 = v43;
              }
              else
              {
                uint64_t v2 = v43;
                if (v41 != v37) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              sub_25A9D4710(v128, v46, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
              unint64_t v42 = v136;
              uint64_t v34 = v139;
            }
            ++v40;
            --v35;
            uint64_t v38 = v135;
            v37 -= v34;
            v39 -= v34;
            v41 += v34;
          }
          while (v40 < v135 + v35);
          uint64_t v16 = v126;
          uint64_t v25 = v135;
          uint64_t v18 = v129;
          uint64_t v17 = v132;
          goto LABEL_31;
        }
      }
    }
    unint64_t v42 = v136;
LABEL_31:
    if (v25 < v17)
    {
      if (__OFSUB__(v25, v18)) {
        goto LABEL_142;
      }
      if (v25 - v18 < v123)
      {
        if (__OFADD__(v18, v123)) {
          goto LABEL_145;
        }
        if (v18 + v123 >= v17) {
          uint64_t v48 = v17;
        }
        else {
          uint64_t v48 = v18 + v123;
        }
        if (v48 < v18) {
          goto LABEL_146;
        }
        if (v25 != v48)
        {
          uint64_t v129 = v18;
          uint64_t v126 = v16;
          uint64_t v127 = v48;
          uint64_t v122 = v2;
          uint64_t v49 = *(void *)(v131 + 72);
          uint64_t v139 = v49 * (v25 - 1);
          uint64_t v132 = v49;
          uint64_t v50 = v25 * v49;
          do
          {
            uint64_t v51 = 0;
            uint64_t v52 = v129;
            uint64_t v135 = v25;
            while (1)
            {
              uint64_t v53 = *v42;
              uint64_t v54 = v50;
              uint64_t v55 = v50 + v51 + *v42;
              uint64_t v56 = v133;
              uint64_t v57 = v42;
              sub_25A9D5360(v55, v133);
              uint64_t v58 = v134;
              sub_25A9D5360(v139 + v51 + v53, v134);
              LOBYTE(v53) = sub_25A9DB6C8();
              sub_25A9D4764(v58);
              sub_25A9D4764(v56);
              if ((v53 & 1) == 0) {
                break;
              }
              uint64_t v59 = *v57;
              if (!*v57) {
                goto LABEL_148;
              }
              uint64_t v50 = v54;
              uint64_t v60 = v59 + v139 + v51;
              sub_25A9D4710(v59 + v54 + v51, v138, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
              uint64_t v61 = v135;
              swift_arrayInitWithTakeFrontToBack();
              sub_25A9D4710(v138, v60, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
              v51 -= v132;
              ++v52;
              unint64_t v42 = v136;
              if (v61 == v52) {
                goto LABEL_47;
              }
            }
            uint64_t v61 = v135;
            uint64_t v50 = v54;
            unint64_t v42 = v57;
LABEL_47:
            uint64_t v25 = v61 + 1;
            v139 += v132;
            v50 += v132;
          }
          while (v25 != v127);
          uint64_t v25 = v127;
          uint64_t v2 = v122;
          uint64_t v16 = v126;
          uint64_t v18 = v129;
        }
      }
    }
    if (v25 < v18) {
      goto LABEL_141;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v16 = sub_25A9BFCFC(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v63 = *((void *)v16 + 2);
    unint64_t v62 = *((void *)v16 + 3);
    unint64_t v64 = v63 + 1;
    if (v63 >= v62 >> 1) {
      uint64_t v16 = sub_25A9BFCFC((char *)(v62 > 1), v63 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v64;
    v65 = v16 + 32;
    os_log_type_t v66 = &v16[16 * v63 + 32];
    *(void *)os_log_type_t v66 = v18;
    *((void *)v66 + 1) = v25;
    uint64_t v135 = v25;
    if (v63) {
      break;
    }
    unint64_t v64 = 1;
LABEL_97:
    uint64_t v17 = v136[1];
    uint64_t v15 = v135;
    if (v135 >= v17) {
      goto LABEL_106;
    }
  }
  while (1)
  {
    unint64_t v67 = v64 - 1;
    if (v64 >= 4)
    {
      v72 = &v65[16 * v64];
      uint64_t v73 = *((void *)v72 - 8);
      uint64_t v74 = *((void *)v72 - 7);
      BOOL v78 = __OFSUB__(v74, v73);
      uint64_t v75 = v74 - v73;
      if (v78) {
        goto LABEL_126;
      }
      uint64_t v77 = *((void *)v72 - 6);
      uint64_t v76 = *((void *)v72 - 5);
      BOOL v78 = __OFSUB__(v76, v77);
      uint64_t v70 = v76 - v77;
      char v71 = v78;
      if (v78) {
        goto LABEL_127;
      }
      unint64_t v79 = v64 - 2;
      uint64_t v80 = &v65[16 * v64 - 32];
      uint64_t v82 = *(void *)v80;
      uint64_t v81 = *((void *)v80 + 1);
      BOOL v78 = __OFSUB__(v81, v82);
      uint64_t v83 = v81 - v82;
      if (v78) {
        goto LABEL_128;
      }
      BOOL v78 = __OFADD__(v70, v83);
      uint64_t v84 = v70 + v83;
      if (v78) {
        goto LABEL_130;
      }
      if (v84 >= v75)
      {
        uint64_t v102 = &v65[16 * v67];
        uint64_t v104 = *(void *)v102;
        uint64_t v103 = *((void *)v102 + 1);
        BOOL v78 = __OFSUB__(v103, v104);
        uint64_t v105 = v103 - v104;
        if (v78) {
          goto LABEL_136;
        }
        BOOL v95 = v70 < v105;
        goto LABEL_86;
      }
    }
    else
    {
      if (v64 != 3)
      {
        uint64_t v96 = *((void *)v16 + 4);
        uint64_t v97 = *((void *)v16 + 5);
        BOOL v78 = __OFSUB__(v97, v96);
        uint64_t v89 = v97 - v96;
        char v90 = v78;
        goto LABEL_80;
      }
      uint64_t v69 = *((void *)v16 + 4);
      uint64_t v68 = *((void *)v16 + 5);
      BOOL v78 = __OFSUB__(v68, v69);
      uint64_t v70 = v68 - v69;
      char v71 = v78;
    }
    if (v71) {
      goto LABEL_129;
    }
    unint64_t v79 = v64 - 2;
    v85 = &v65[16 * v64 - 32];
    uint64_t v87 = *(void *)v85;
    uint64_t v86 = *((void *)v85 + 1);
    BOOL v88 = __OFSUB__(v86, v87);
    uint64_t v89 = v86 - v87;
    char v90 = v88;
    if (v88) {
      goto LABEL_131;
    }
    v91 = &v65[16 * v67];
    uint64_t v93 = *(void *)v91;
    uint64_t v92 = *((void *)v91 + 1);
    BOOL v78 = __OFSUB__(v92, v93);
    uint64_t v94 = v92 - v93;
    if (v78) {
      goto LABEL_133;
    }
    if (__OFADD__(v89, v94)) {
      goto LABEL_135;
    }
    if (v89 + v94 >= v70)
    {
      BOOL v95 = v70 < v94;
LABEL_86:
      if (v95) {
        unint64_t v67 = v79;
      }
      goto LABEL_88;
    }
LABEL_80:
    if (v90) {
      goto LABEL_132;
    }
    uint64_t v98 = &v65[16 * v67];
    uint64_t v100 = *(void *)v98;
    uint64_t v99 = *((void *)v98 + 1);
    BOOL v78 = __OFSUB__(v99, v100);
    uint64_t v101 = v99 - v100;
    if (v78) {
      goto LABEL_134;
    }
    if (v101 < v89) {
      goto LABEL_97;
    }
LABEL_88:
    unint64_t v106 = v67 - 1;
    if (v67 - 1 >= v64)
    {
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
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
      goto LABEL_137;
    }
    if (!*v136) {
      goto LABEL_149;
    }
    uint64_t v107 = v16;
    unint64_t v108 = &v65[16 * v106];
    uint64_t v109 = *(void *)v108;
    id v110 = &v65[16 * v67];
    uint64_t v111 = *((void *)v110 + 1);
    sub_25A9D33F4(*v136 + *(void *)(v131 + 72) * *(void *)v108, *v136 + *(void *)(v131 + 72) * *(void *)v110, *v136 + *(void *)(v131 + 72) * v111, v130);
    if (v2) {
      break;
    }
    if (v111 < v109) {
      goto LABEL_123;
    }
    if (v67 > *((void *)v107 + 2)) {
      goto LABEL_124;
    }
    *(void *)unint64_t v108 = v109;
    *(void *)&v65[16 * v106 + 8] = v111;
    unint64_t v112 = *((void *)v107 + 2);
    if (v67 >= v112) {
      goto LABEL_125;
    }
    uint64_t v16 = v107;
    unint64_t v64 = v112 - 1;
    memmove(&v65[16 * v67], v110 + 16, 16 * (v112 - 1 - v67));
    *((void *)v107 + 2) = v112 - 1;
    if (v112 <= 2) {
      goto LABEL_97;
    }
  }
  uint64_t v113 = v125;
LABEL_103:
  swift_bridgeObjectRelease();
  if (v113 < -1)
  {
    __break(1u);
    goto LABEL_105;
  }
LABEL_120:
  *(void *)(v124 + 16) = 0;
  swift_bridgeObjectRelease();
}

void sub_25A9D0F1C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B32D860);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v186 = (char *)&v164 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v197 = (char *)&v164 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v164 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v182 = (char *)&v164 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v164 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v171 = (char *)&v164 - v17;
  uint64_t v192 = sub_25A9DC6C8();
  uint64_t v184 = *(void *)(v192 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v192);
  v178 = (char *)&v164 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v193 = (char *)&v164 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v168 = (char *)&v164 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v196 = (char *)&v164 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v164 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  v181 = (char *)&v164 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v169 = (char *)&v164 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v170 = (char *)&v164 - v33;
  v199 = a1;
  uint64_t v34 = a1[1];
  uint64_t v35 = sub_25A9DD998();
  if (v35 < v34)
  {
    uint64_t v166 = v35;
    uint64_t v167 = v16;
    uint64_t v164 = sub_25A9CF248(v34 / 2, MEMORY[0x263F61D80]);
    unint64_t v37 = v36;
    uint64_t v165 = v34;
    if (v34 <= 0)
    {
      uint64_t v39 = (char *)MEMORY[0x263F8EE78];
      unint64_t v105 = *(void *)(MEMORY[0x263F8EE78] + 16);
      goto LABEL_107;
    }
    uint64_t v38 = 0;
    v189 = (void (**)(char *, uint64_t))(v184 + 8);
    uint64_t v190 = v184 + 16;
    v195 = (void (**)(char *, char *, uint64_t))(v184 + 32);
    uint64_t v39 = (char *)MEMORY[0x263F8EE78];
    uint64_t v40 = v34;
    v175 = v11;
    unint64_t v180 = v36;
    v183 = v28;
    while (1)
    {
      uint64_t v41 = (uint64_t)v38;
      uint64_t v42 = (uint64_t)(v38 + 1);
      v177 = v39;
      if ((uint64_t)(v38 + 1) < v40)
      {
        uint64_t v194 = v40;
        uint64_t v43 = *v199;
        uint64_t v44 = *(void *)(v184 + 72);
        uint64_t v174 = (uint64_t)(v38 + 1);
        unint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, unint64_t))(v184 + 16);
        uint64_t v46 = v192;
        v45(v170, v43 + v44 * v42, v192, v37);
        uint64_t v172 = v43;
        uint64_t v198 = v44;
        uint64_t v47 = v43 + v44 * v41;
        uint64_t v48 = v169;
        v188 = (char *)v45;
        ((void (*)(char *, uint64_t, uint64_t))v45)(v169, v47, v46);
        uint64_t v49 = (uint64_t)v171;
        sub_25A9DC658();
        uint64_t v50 = sub_25A9DB738();
        if (__swift_getEnumTagSinglePayload(v49, 1, v50) == 1) {
          goto LABEL_158;
        }
        uint64_t v179 = v41;
        uint64_t v51 = (uint64_t)v167;
        sub_25A9DC658();
        if (__swift_getEnumTagSinglePayload(v51, 1, v50) == 1) {
          goto LABEL_159;
        }
        uint64_t v52 = v48;
        uint64_t v53 = v171;
        LODWORD(v191) = sub_25A9DB6C8();
        uint64_t v54 = *(void *)(v50 - 8);
        uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        uint64_t v56 = (void (*)(void, void, void))(v54 + 8);
        v55(v51, v50);
        v187 = (char *)v55;
        v185 = v56;
        v55((uint64_t)v53, v50);
        uint64_t v57 = *v189;
        uint64_t v58 = v192;
        (*v189)(v52, v192);
        v176 = v57;
        v57(v170, v58);
        uint64_t v42 = v179 + 2;
        uint64_t v40 = v194;
        if (v179 + 2 >= v194) {
          goto LABEL_15;
        }
        v174 *= v198;
        uint64_t v59 = v172;
        uint64_t v173 = v198 * v42;
        while (1)
        {
          uint64_t v60 = v42;
          uint64_t v61 = v192;
          unint64_t v62 = (void (*)(char *, uint64_t, uint64_t))v188;
          ((void (*)(char *, uint64_t, uint64_t))v188)(v181, v59 + v173, v192);
          v62(v28, v59 + v174, v61);
          uint64_t v63 = (uint64_t)v182;
          sub_25A9DC658();
          if (__swift_getEnumTagSinglePayload(v63, 1, v50) == 1) {
            goto LABEL_154;
          }
          unint64_t v64 = v2;
          uint64_t v65 = (uint64_t)v175;
          sub_25A9DC658();
          if (__swift_getEnumTagSinglePayload(v65, 1, v50) == 1) {
            goto LABEL_155;
          }
          os_log_type_t v66 = v182;
          int v67 = sub_25A9DB6C8();
          uint64_t v68 = v65;
          uint64_t v69 = (void (*)(char *, uint64_t))v187;
          ((void (*)(uint64_t, uint64_t))v187)(v68, v50);
          v69(v66, v50);
          uint64_t v70 = v192;
          char v71 = v176;
          v176(v28, v192);
          v71(v181, v70);
          if ((v191 ^ v67)) {
            break;
          }
          uint64_t v42 = v60 + 1;
          v59 += v198;
          uint64_t v40 = v194;
          uint64_t v2 = v64;
          if (v60 + 1 >= v194)
          {
            uint64_t v42 = v194;
            goto LABEL_15;
          }
        }
        uint64_t v2 = v64;
        uint64_t v42 = v60;
        uint64_t v40 = v194;
LABEL_15:
        uint64_t v41 = v179;
        if (v191)
        {
          if (v42 < v179) {
            goto LABEL_146;
          }
          if (v179 < v42)
          {
            uint64_t v72 = 0;
            uint64_t v73 = v198 * (v42 - 1);
            uint64_t v74 = v42 * v198;
            uint64_t v75 = v179 * v198;
            do
            {
              if (v41 != v42 + v72 - 1)
              {
                v176 = v2;
                uint64_t v76 = v172;
                if (!v172) {
                  goto LABEL_156;
                }
                unint64_t v77 = v172 + v75;
                v188 = (char *)(v172 + v73);
                uint64_t v78 = v192;
                v191 = (void (*)(char *, uint64_t, uint64_t))*v195;
                v191(v178, v172 + v75, v192);
                if (v75 < v73 || v77 >= v76 + v74)
                {
                  uint64_t v80 = v188;
                  swift_arrayInitWithTakeFrontToBack();
                }
                else
                {
                  uint64_t v80 = v188;
                  if (v75 != v73) {
                    swift_arrayInitWithTakeBackToFront();
                  }
                }
                v191(v80, (uint64_t)v178, v78);
                uint64_t v2 = v176;
                uint64_t v28 = v183;
              }
              ++v41;
              --v72;
              v73 -= v198;
              v74 -= v198;
              v75 += v198;
            }
            while (v41 < v42 + v72);
            uint64_t v41 = v179;
            uint64_t v40 = v194;
          }
        }
      }
      if (v42 >= v40) {
        goto LABEL_52;
      }
      if (__OFSUB__(v42, v41)) {
        goto LABEL_144;
      }
      if (v42 - v41 >= v166) {
        goto LABEL_52;
      }
      if (__OFADD__(v41, v166)) {
        goto LABEL_147;
      }
      if (v41 + v166 >= v40) {
        uint64_t v81 = v40;
      }
      else {
        uint64_t v81 = v41 + v166;
      }
      if (v81 < v41) {
        goto LABEL_148;
      }
      if (v42 == v81) {
        goto LABEL_52;
      }
      uint64_t v179 = v41;
      v176 = v2;
      uint64_t v82 = *(char **)(v184 + 72);
      v185 = *(void (**)(void, void, void))(v184 + 16);
      uint64_t v198 = (void)v82 * (v42 - 1);
      v187 = v82;
      uint64_t v83 = v42 * (void)v82;
      uint64_t v84 = v192;
      v85 = v168;
      uint64_t v174 = v81;
      do
      {
        uint64_t v86 = 0;
        uint64_t v87 = (void (*)(char *, uint64_t, uint64_t))v179;
        v191 = (void (*)(char *, uint64_t, uint64_t))v42;
        v188 = (char *)v83;
        while (1)
        {
          uint64_t v88 = *v199;
          uint64_t v194 = v83 + v86;
          uint64_t v89 = (void (*)(char *, uint64_t, uint64_t))v185;
          v185(v196, v83 + v86 + v88, v84);
          v89(v85, v198 + v86 + v88, v84);
          uint64_t v90 = (uint64_t)v197;
          sub_25A9DC658();
          uint64_t v91 = sub_25A9DB738();
          if (__swift_getEnumTagSinglePayload(v90, 1, v91) == 1) {
            goto LABEL_150;
          }
          uint64_t v92 = (uint64_t)v186;
          sub_25A9DC658();
          if (__swift_getEnumTagSinglePayload(v92, 1, v91) == 1)
          {
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
            return;
          }
          uint64_t v93 = v197;
          char v94 = sub_25A9DB6C8();
          uint64_t v95 = v92;
          uint64_t v96 = *(void (**)(uint64_t, uint64_t))(*(void *)(v91 - 8) + 8);
          v96(v95, v91);
          v96((uint64_t)v93, v91);
          uint64_t v97 = *v189;
          uint64_t v84 = v192;
          (*v189)(v85, v192);
          v97(v196, v84);
          if ((v94 & 1) == 0) {
            break;
          }
          uint64_t v98 = *v199;
          uint64_t v83 = (uint64_t)v188;
          if (!*v199) {
            goto LABEL_152;
          }
          uint64_t v99 = (char *)(v98 + v198 + v86);
          uint64_t v100 = *v195;
          (*v195)(v193, &v188[v98 + v86], v84);
          swift_arrayInitWithTakeFrontToBack();
          v100(v99, v193, v84);
          v86 -= (uint64_t)v187;
          uint64_t v87 = (void (*)(char *, uint64_t, uint64_t))((char *)v87 + 1);
          uint64_t v101 = (void (*)(void, void, void))v191;
          if (v191 == v87) {
            goto LABEL_50;
          }
        }
        uint64_t v101 = (void (*)(void, void, void))v191;
        uint64_t v83 = (uint64_t)v188;
LABEL_50:
        uint64_t v42 = (uint64_t)v101 + 1;
        v198 += (uint64_t)v187;
        v83 += (uint64_t)v187;
      }
      while (v42 != v174);
      uint64_t v42 = v174;
      uint64_t v2 = v176;
      uint64_t v28 = v183;
      uint64_t v41 = v179;
LABEL_52:
      if (v42 < v41) {
        break;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v191 = (void (*)(char *, uint64_t, uint64_t))v42;
      if (isUniquelyReferenced_nonNull_native) {
        uint64_t v39 = v177;
      }
      else {
        uint64_t v39 = sub_25A9BFCFC(0, *((void *)v177 + 2) + 1, 1, v177);
      }
      unint64_t v104 = *((void *)v39 + 2);
      unint64_t v103 = *((void *)v39 + 3);
      unint64_t v105 = v104 + 1;
      unint64_t v37 = v180;
      if (v104 >= v103 >> 1)
      {
        uint64_t v155 = sub_25A9BFCFC((char *)(v103 > 1), v104 + 1, 1, v39);
        unint64_t v37 = v180;
        uint64_t v39 = v155;
      }
      *((void *)v39 + 2) = v105;
      unint64_t v106 = v39 + 32;
      uint64_t v107 = &v39[16 * v104 + 32];
      unint64_t v108 = (void (*)(void, void, void))v191;
      *(void *)uint64_t v107 = v41;
      *((void *)v107 + 1) = v108;
      if (v104)
      {
        while (1)
        {
          unint64_t v109 = v105 - 1;
          if (v105 >= 4)
          {
            uint64_t v114 = &v106[16 * v105];
            uint64_t v115 = *((void *)v114 - 8);
            uint64_t v116 = *((void *)v114 - 7);
            BOOL v120 = __OFSUB__(v116, v115);
            uint64_t v117 = v116 - v115;
            if (v120) {
              goto LABEL_128;
            }
            uint64_t v119 = *((void *)v114 - 6);
            uint64_t v118 = *((void *)v114 - 5);
            BOOL v120 = __OFSUB__(v118, v119);
            uint64_t v112 = v118 - v119;
            char v113 = v120;
            if (v120) {
              goto LABEL_129;
            }
            unint64_t v121 = v105 - 2;
            uint64_t v122 = &v106[16 * v105 - 32];
            uint64_t v124 = *(void *)v122;
            uint64_t v123 = *((void *)v122 + 1);
            BOOL v120 = __OFSUB__(v123, v124);
            uint64_t v125 = v123 - v124;
            if (v120) {
              goto LABEL_130;
            }
            BOOL v120 = __OFADD__(v112, v125);
            uint64_t v126 = v112 + v125;
            if (v120) {
              goto LABEL_132;
            }
            if (v126 >= v117)
            {
              v144 = &v106[16 * v109];
              uint64_t v146 = *(void *)v144;
              uint64_t v145 = *((void *)v144 + 1);
              BOOL v120 = __OFSUB__(v145, v146);
              uint64_t v147 = v145 - v146;
              if (v120) {
                goto LABEL_138;
              }
              BOOL v137 = v112 < v147;
              goto LABEL_89;
            }
          }
          else
          {
            if (v105 != 3)
            {
              uint64_t v138 = *((void *)v39 + 4);
              uint64_t v139 = *((void *)v39 + 5);
              BOOL v120 = __OFSUB__(v139, v138);
              uint64_t v131 = v139 - v138;
              char v132 = v120;
              goto LABEL_83;
            }
            uint64_t v111 = *((void *)v39 + 4);
            uint64_t v110 = *((void *)v39 + 5);
            BOOL v120 = __OFSUB__(v110, v111);
            uint64_t v112 = v110 - v111;
            char v113 = v120;
          }
          if (v113) {
            goto LABEL_131;
          }
          unint64_t v121 = v105 - 2;
          uint64_t v127 = &v106[16 * v105 - 32];
          uint64_t v129 = *(void *)v127;
          uint64_t v128 = *((void *)v127 + 1);
          BOOL v130 = __OFSUB__(v128, v129);
          uint64_t v131 = v128 - v129;
          char v132 = v130;
          if (v130) {
            goto LABEL_133;
          }
          uint64_t v133 = &v106[16 * v109];
          uint64_t v135 = *(void *)v133;
          uint64_t v134 = *((void *)v133 + 1);
          BOOL v120 = __OFSUB__(v134, v135);
          uint64_t v136 = v134 - v135;
          if (v120) {
            goto LABEL_135;
          }
          if (__OFADD__(v131, v136)) {
            goto LABEL_137;
          }
          if (v131 + v136 >= v112)
          {
            BOOL v137 = v112 < v136;
LABEL_89:
            if (v137) {
              unint64_t v109 = v121;
            }
            goto LABEL_91;
          }
LABEL_83:
          if (v132) {
            goto LABEL_134;
          }
          v140 = &v106[16 * v109];
          uint64_t v142 = *(void *)v140;
          uint64_t v141 = *((void *)v140 + 1);
          BOOL v120 = __OFSUB__(v141, v142);
          uint64_t v143 = v141 - v142;
          if (v120) {
            goto LABEL_136;
          }
          if (v143 < v131) {
            goto LABEL_100;
          }
LABEL_91:
          unint64_t v148 = v109 - 1;
          if (v109 - 1 >= v105)
          {
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
            goto LABEL_139;
          }
          if (!*v199) {
            goto LABEL_153;
          }
          unint64_t v149 = v39;
          uint64_t v150 = &v106[16 * v148];
          uint64_t v151 = *(void *)v150;
          uint64_t v152 = &v106[16 * v109];
          uint64_t v153 = *((void *)v152 + 1);
          sub_25A9D37E8(*v199 + *(void *)(v184 + 72) * *(void *)v150, *v199 + *(void *)(v184 + 72) * *(void *)v152, (char *)(*v199 + *(void *)(v184 + 72) * v153), v37);
          if (v2)
          {
LABEL_119:
            swift_bridgeObjectRelease();
            if (v165 >= -1) {
              goto LABEL_122;
            }
            __break(1u);
LABEL_121:
            swift_bridgeObjectRelease();
            if (v165 >= -1)
            {
LABEL_122:
              *(void *)(v164 + 16) = 0;
              swift_bridgeObjectRelease();
              return;
            }
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
            goto LABEL_151;
          }
          if (v153 < v151) {
            goto LABEL_125;
          }
          if (v109 > *((void *)v149 + 2)) {
            goto LABEL_126;
          }
          *(void *)uint64_t v150 = v151;
          *(void *)&v106[16 * v148 + 8] = v153;
          unint64_t v154 = *((void *)v149 + 2);
          if (v109 >= v154) {
            goto LABEL_127;
          }
          unint64_t v105 = v154 - 1;
          memmove(&v106[16 * v109], v152 + 16, 16 * (v154 - 1 - v109));
          uint64_t v39 = v149;
          *((void *)v149 + 2) = v154 - 1;
          uint64_t v28 = v183;
          unint64_t v37 = v180;
          if (v154 <= 2) {
            goto LABEL_100;
          }
        }
      }
      unint64_t v105 = 1;
LABEL_100:
      uint64_t v40 = v199[1];
      uint64_t v38 = (char *)v191;
      if ((uint64_t)v191 >= v40)
      {
LABEL_107:
        if (v105 < 2) {
          goto LABEL_121;
        }
        uint64_t v156 = *v199;
        while (1)
        {
          unint64_t v157 = v105 - 2;
          if (v105 < 2) {
            break;
          }
          if (!v156) {
            goto LABEL_157;
          }
          uint64_t v158 = v39;
          uint64_t v159 = *(void *)&v39[16 * v157 + 32];
          uint64_t v160 = *(void *)&v39[16 * v105 + 24];
          unint64_t v161 = v37;
          sub_25A9D37E8(v156 + *(void *)(v184 + 72) * v159, v156 + *(void *)(v184 + 72) * *(void *)&v39[16 * v105 + 16], (char *)(v156 + *(void *)(v184 + 72) * v160), v37);
          if (v2) {
            goto LABEL_119;
          }
          if (v160 < v159) {
            goto LABEL_140;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v158 = sub_25A9BFDF4((uint64_t)v158);
          }
          if (v157 >= *((void *)v158 + 2)) {
            goto LABEL_141;
          }
          uint64_t v162 = &v158[16 * v157 + 32];
          *(void *)uint64_t v162 = v159;
          *((void *)v162 + 1) = v160;
          unint64_t v163 = *((void *)v158 + 2);
          if (v105 > v163) {
            goto LABEL_142;
          }
          memmove(&v158[16 * v105 + 16], &v158[16 * v105 + 32], 16 * (v163 - v105));
          uint64_t v39 = v158;
          *((void *)v158 + 2) = v163 - 1;
          unint64_t v105 = v163 - 1;
          unint64_t v37 = v161;
          if (v163 <= 2) {
            goto LABEL_121;
          }
        }
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
        break;
      }
    }
    __break(1u);
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
    goto LABEL_149;
  }
  if (v34 < 0) {
    goto LABEL_145;
  }
  if (v34) {
    sub_25A9D2CC4(0, v34, 1, v199);
  }
}

void sub_25A9D1E04(unint64_t a1, uint64_t (*a2)(uint64_t), void (*a3)(void), void (*a4)(uint64_t), uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t (*a8)(uint64_t), uint64_t a9)
{
  uint64_t v167 = a7;
  uint64_t v166 = a5;
  uint64_t v179 = a4;
  uint64_t v14 = v9;
  uint64_t v178 = sub_25A9DB738();
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  v177 = (char *)&v155 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_66();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v29 = OUTLINED_FUNCTION_61_8(v21, v22, v23, v24, v25, v26, v27, v28, v155);
  uint64_t v181 = a2(v29);
  OUTLINED_FUNCTION_1();
  uint64_t v168 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_121();
  uint64_t v162 = v32;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_70();
  uint64_t v183 = v34;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v35);
  v175 = (char *)&v155 - v36;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_131_2();
  unint64_t v180 = v38;
  uint64_t v39 = *(void *)(a1 + 8);
  uint64_t v40 = sub_25A9DD998();
  if (v40 >= v39)
  {
    if ((v39 & 0x8000000000000000) == 0)
    {
      if (v39) {
        sub_25A9D30B8(0, v39, 1, (uint64_t (**)(void))a1, a8, a9);
      }
      return;
    }
    goto LABEL_141;
  }
  uint64_t v41 = v40;
  uint64_t v155 = sub_25A9CF248(v39 / 2, a3);
  uint64_t v164 = v44;
  uint64_t v165 = a6;
  if (v39 <= 0)
  {
LABEL_105:
    uint64_t v46 = (char *)MEMORY[0x263F8EE78];
    unint64_t v98 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
    if (v98 < 2)
    {
LABEL_117:
      swift_bridgeObjectRelease();
      if (v39 >= -1) {
        goto LABEL_118;
      }
      goto LABEL_145;
    }
    unint64_t v149 = *(uint64_t (**)(void))a1;
    while (1)
    {
      a1 = v98 - 2;
      if (v98 < 2) {
        break;
      }
      if (!v149) {
        goto LABEL_149;
      }
      uint64_t v150 = v46;
      uint64_t v151 = *(void *)&v46[16 * a1 + 32];
      uint64_t v152 = *(void *)&v46[16 * v98 + 24];
      OUTLINED_FUNCTION_46_13((unint64_t)v149 + v168[9] * v151, (unint64_t)v149 + v168[9] * *(void *)&v46[16 * v98 + 16], (char *)v149 + v168[9] * v152, (uint64_t)v46, v42, v43, v167);
      if (v9) {
        goto LABEL_103;
      }
      if (v152 < v151) {
        goto LABEL_136;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v150 = sub_25A9BFDF4((uint64_t)v150);
      }
      if (a1 >= *((void *)v150 + 2)) {
        goto LABEL_137;
      }
      uint64_t v153 = &v150[16 * a1 + 32];
      *(void *)uint64_t v153 = v151;
      *((void *)v153 + 1) = v152;
      unint64_t v154 = *((void *)v150 + 2);
      if (v98 > v154) {
        goto LABEL_138;
      }
      memmove(&v150[16 * v98 + 16], &v150[16 * v98 + 32], 16 * (v154 - v98));
      uint64_t v46 = v150;
      *((void *)v150 + 2) = v154 - 1;
      unint64_t v98 = v154 - 1;
      if (v154 <= 2) {
        goto LABEL_117;
      }
    }
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
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
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
LABEL_149:
    __break(1u);
    return;
  }
  uint64_t v158 = v41;
  unint64_t v45 = 0;
  uint64_t v173 = (void (**)(void))(v17 + 8);
  uint64_t v174 = (uint64_t (*)(void))(v168 + 2);
  uint64_t v172 = (void (**)(void))(v168 + 1);
  v186 = (void (**)(void))(v168 + 4);
  uint64_t v46 = (char *)MEMORY[0x263F8EE78];
  uint64_t v47 = v39;
  uint64_t v157 = v39;
  v188 = (void *)a1;
  while (1)
  {
    uint64_t v48 = (void (*)(void))v45;
    uint64_t v49 = (char *)v45 + 1;
    unint64_t v161 = v46;
    unint64_t v163 = (void (*)(void))v45;
    if ((uint64_t)v45 + 1 >= v47)
    {
      uint64_t v63 = (uint64_t)v45 + 1;
      uint64_t v71 = v158;
    }
    else
    {
      uint64_t v156 = v14;
      uint64_t v159 = *(uint64_t (**)(void))a1;
      uint64_t v50 = v159;
      uint64_t v51 = v168[9];
      uint64_t v187 = v51;
      uint64_t v52 = (void (*)(uint64_t, char *, uint64_t))v168[2];
      uint64_t v14 = v181;
      v52((uint64_t)v180, (char *)v159 + v51 * (void)v49, v181);
      v182 = (void (*)(char *, char *, uint64_t))v52;
      uint64_t v53 = ((uint64_t (*)(char *, char *, uint64_t))v52)(v175, (char *)v50 + v51 * (void)v45, v14);
      uint64_t v54 = v176;
      uint64_t v185 = v47;
      uint64_t v55 = v179;
      uint64_t v56 = ((uint64_t (*)(uint64_t))v179)(v53);
      uint64_t v57 = v177;
      v55(v56);
      uint64_t v47 = v185;
      LODWORD(v184) = sub_25A9DB6D8();
      uint64_t v58 = *v173;
      uint64_t v59 = v178;
      ((void (*)(char *, uint64_t))*v173)(v57, v178);
      uint64_t v60 = v54;
      uint64_t v61 = v159;
      uint64_t v48 = v163;
      uint64_t v171 = v58;
      ((void (*)(uint64_t, uint64_t))v58)(v60, v59);
      unint64_t v62 = (void (*)(void))v168[1];
      OUTLINED_FUNCTION_22_10();
      v62();
      uint64_t v170 = v62;
      OUTLINED_FUNCTION_22_10();
      v62();
      uint64_t v63 = (uint64_t)v48 + 2;
      if ((uint64_t)v48 + 2 >= v47)
      {
        OUTLINED_FUNCTION_111_5();
      }
      else
      {
        uint64_t v169 = (void (*)(void))(v187 * (void)v49);
        uint64_t v160 = v187 * v63;
        uint64_t v64 = v181;
        while (1)
        {
          uint64_t v65 = v63;
          os_log_type_t v66 = v174;
          int v67 = v182;
          v182(v180, (char *)v61 + v160, v64);
          uint64_t v14 = (uint64_t)v175;
          v67(v175, (char *)v169 + (void)v61, v64);
          OUTLINED_FUNCTION_84_7();
          uint64_t v68 = v66();
          ((void (*)(uint64_t))v66)(v68);
          LODWORD(v66) = sub_25A9DB6D8();
          uint64_t v69 = v171;
          OUTLINED_FUNCTION_14_5();
          v69();
          uint64_t v64 = v181;
          OUTLINED_FUNCTION_14_5();
          v69();
          uint64_t v70 = v170;
          OUTLINED_FUNCTION_22_10();
          v70();
          OUTLINED_FUNCTION_22_10();
          v70();
          if ((v184 ^ v66)) {
            break;
          }
          uint64_t v63 = v65 + 1;
          uint64_t v61 = (uint64_t (*)(void))((char *)v61 + v187);
          uint64_t v47 = v185;
          if (v63 >= v185)
          {
            uint64_t v63 = v185;
            OUTLINED_FUNCTION_111_5();
            uint64_t v48 = v163;
            goto LABEL_13;
          }
        }
        OUTLINED_FUNCTION_111_5();
        uint64_t v63 = v65;
        uint64_t v48 = v163;
        uint64_t v47 = v185;
      }
LABEL_13:
      a1 = (unint64_t)v188;
      uint64_t v71 = v158;
      if (v184)
      {
        if (v63 < (uint64_t)v48) {
          goto LABEL_142;
        }
        if ((uint64_t)v48 < v63)
        {
          uint64_t v72 = 0;
          uint64_t v73 = v187;
          uint64_t v74 = v187 * (v63 - 1);
          uint64_t v75 = v63 * v187;
          uint64_t v76 = v48;
          uint64_t v77 = (void)v48 * v187;
          v182 = (void (*)(char *, char *, uint64_t))v63;
          do
          {
            if (v76 != (void (*)(void))(v63 + v72 - 1))
            {
              uint64_t v78 = v159;
              if (!v159) {
                goto LABEL_148;
              }
              unint64_t v79 = (char *)v159 + v77;
              uint64_t v171 = (void (*)(void))((char *)v159 + v74);
              uint64_t v184 = *v186;
              OUTLINED_FUNCTION_55();
              v80();
              if (v77 < v74 || v79 >= (char *)v78 + v75)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v77 != v74)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              OUTLINED_FUNCTION_55();
              v82();
              uint64_t v63 = (uint64_t)v182;
              uint64_t v73 = v187;
            }
            uint64_t v76 = (void (*)(void))((char *)v76 + 1);
            --v72;
            v74 -= v73;
            v75 -= v73;
            v77 += v73;
          }
          while ((uint64_t)v76 < v63 + v72);
          a1 = (unint64_t)v188;
          uint64_t v71 = v158;
          uint64_t v48 = v163;
          uint64_t v47 = v185;
        }
      }
    }
    if (v63 < v47)
    {
      if (__OFSUB__(v63, v48)) {
        goto LABEL_140;
      }
      if (v63 - (uint64_t)v48 < v71)
      {
        if (__OFADD__(v48, v71)) {
          goto LABEL_143;
        }
        if ((uint64_t)v48 + v71 >= v47) {
          uint64_t v83 = v47;
        }
        else {
          uint64_t v83 = (uint64_t)v48 + v71;
        }
        if (v83 < (uint64_t)v48) {
          goto LABEL_144;
        }
        if (v63 != v83)
        {
          uint64_t v156 = v14;
          uint64_t v84 = (void (*)(void))v168[9];
          uint64_t v169 = (void (*)(void))v168[2];
          uint64_t v170 = v84;
          uint64_t v14 = (void)v84 * (v63 - 1);
          uint64_t v187 = v63 * (void)v84;
          uint64_t v160 = v83;
          do
          {
            uint64_t v85 = 0;
            v182 = (void (*)(char *, char *, uint64_t))v63;
            uint64_t v171 = (void (*)(void))v14;
            while (1)
            {
              uint64_t v184 = v48;
              uint64_t v86 = v169;
              OUTLINED_FUNCTION_15_17();
              v86();
              OUTLINED_FUNCTION_15_17();
              uint64_t v87 = ((uint64_t (*)(void))v86)();
              uint64_t v88 = v179;
              uint64_t v89 = ((uint64_t (*)(uint64_t))v179)(v87);
              v88(v89);
              OUTLINED_FUNCTION_74_2();
              LODWORD(v185) = sub_25A9DB6D8();
              uint64_t v90 = *v173;
              OUTLINED_FUNCTION_17();
              v90();
              OUTLINED_FUNCTION_17();
              v90();
              uint64_t v91 = *v172;
              OUTLINED_FUNCTION_17();
              v91();
              OUTLINED_FUNCTION_17();
              v91();
              if ((v185 & 1) == 0) {
                break;
              }
              if (!*v188) {
                goto LABEL_146;
              }
              uint64_t v92 = v171;
              uint64_t v93 = *v186;
              OUTLINED_FUNCTION_55();
              v93();
              swift_arrayInitWithTakeFrontToBack();
              OUTLINED_FUNCTION_55();
              v93();
              v85 -= (uint64_t)v170;
              uint64_t v48 = (void (*)(void))((char *)v184 + 1);
              char v94 = v182;
              a1 = (unint64_t)v188;
              if ((char *)v182 == (char *)((char *)v184 + 1)) {
                goto LABEL_46;
              }
            }
            char v94 = v182;
            a1 = (unint64_t)v188;
            uint64_t v92 = v171;
LABEL_46:
            uint64_t v63 = (uint64_t)v94 + 1;
            uint64_t v14 = (uint64_t)v170 + (void)v92;
            v187 += (uint64_t)v170;
            uint64_t v48 = v163;
          }
          while (v63 != v160);
          uint64_t v63 = v160;
          OUTLINED_FUNCTION_111_5();
        }
      }
    }
    if (v63 < (uint64_t)v48) {
      goto LABEL_139;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v182 = (void (*)(char *, char *, uint64_t))v63;
    if (isUniquelyReferenced_nonNull_native) {
      uint64_t v46 = v161;
    }
    else {
      uint64_t v46 = sub_25A9BFCFC(0, *((void *)v161 + 2) + 1, 1, v161);
    }
    unint64_t v97 = *((void *)v46 + 2);
    unint64_t v96 = *((void *)v46 + 3);
    unint64_t v98 = v97 + 1;
    if (v97 >= v96 >> 1) {
      uint64_t v46 = sub_25A9BFCFC((char *)(v96 > 1), v97 + 1, 1, v46);
    }
    *((void *)v46 + 2) = v98;
    uint64_t v99 = v46 + 32;
    uint64_t v100 = &v46[16 * v97 + 32];
    uint64_t v101 = v182;
    *(void *)uint64_t v100 = v48;
    *((void *)v100 + 1) = v101;
    if (v97) {
      break;
    }
    unint64_t v98 = 1;
LABEL_96:
    uint64_t v47 = *(void *)(a1 + 8);
    unint64_t v45 = v182;
    uint64_t v39 = v157;
    if ((uint64_t)v182 >= v47) {
      goto LABEL_106;
    }
  }
  while (1)
  {
    unint64_t v102 = v98 - 1;
    if (v98 >= 4)
    {
      uint64_t v107 = &v99[16 * v98];
      uint64_t v108 = *((void *)v107 - 8);
      uint64_t v109 = *((void *)v107 - 7);
      BOOL v113 = __OFSUB__(v109, v108);
      uint64_t v110 = v109 - v108;
      if (v113) {
        goto LABEL_124;
      }
      uint64_t v112 = *((void *)v107 - 6);
      uint64_t v111 = *((void *)v107 - 5);
      BOOL v113 = __OFSUB__(v111, v112);
      uint64_t v105 = v111 - v112;
      char v106 = v113;
      if (v113) {
        goto LABEL_125;
      }
      unint64_t v114 = v98 - 2;
      uint64_t v115 = &v99[16 * v98 - 32];
      uint64_t v117 = *(void *)v115;
      uint64_t v116 = *((void *)v115 + 1);
      BOOL v113 = __OFSUB__(v116, v117);
      uint64_t v118 = v116 - v117;
      if (v113) {
        goto LABEL_126;
      }
      BOOL v113 = __OFADD__(v105, v118);
      uint64_t v119 = v105 + v118;
      if (v113) {
        goto LABEL_128;
      }
      if (v119 >= v110)
      {
        BOOL v137 = &v99[16 * v102];
        uint64_t v139 = *(void *)v137;
        uint64_t v138 = *((void *)v137 + 1);
        BOOL v113 = __OFSUB__(v138, v139);
        uint64_t v140 = v138 - v139;
        if (v113) {
          goto LABEL_134;
        }
        BOOL v130 = v105 < v140;
        goto LABEL_85;
      }
    }
    else
    {
      if (v98 != 3)
      {
        uint64_t v131 = *((void *)v46 + 4);
        uint64_t v132 = *((void *)v46 + 5);
        BOOL v113 = __OFSUB__(v132, v131);
        uint64_t v124 = v132 - v131;
        char v125 = v113;
        goto LABEL_79;
      }
      uint64_t v104 = *((void *)v46 + 4);
      uint64_t v103 = *((void *)v46 + 5);
      BOOL v113 = __OFSUB__(v103, v104);
      uint64_t v105 = v103 - v104;
      char v106 = v113;
    }
    if (v106) {
      goto LABEL_127;
    }
    unint64_t v114 = v98 - 2;
    BOOL v120 = &v99[16 * v98 - 32];
    uint64_t v122 = *(void *)v120;
    uint64_t v121 = *((void *)v120 + 1);
    BOOL v123 = __OFSUB__(v121, v122);
    uint64_t v124 = v121 - v122;
    char v125 = v123;
    if (v123) {
      goto LABEL_129;
    }
    uint64_t v126 = &v99[16 * v102];
    uint64_t v128 = *(void *)v126;
    uint64_t v127 = *((void *)v126 + 1);
    BOOL v113 = __OFSUB__(v127, v128);
    uint64_t v129 = v127 - v128;
    if (v113) {
      goto LABEL_131;
    }
    if (__OFADD__(v124, v129)) {
      goto LABEL_133;
    }
    if (v124 + v129 >= v105)
    {
      BOOL v130 = v105 < v129;
LABEL_85:
      if (v130) {
        unint64_t v102 = v114;
      }
      goto LABEL_87;
    }
LABEL_79:
    if (v125) {
      goto LABEL_130;
    }
    uint64_t v133 = &v99[16 * v102];
    uint64_t v135 = *(void *)v133;
    uint64_t v134 = *((void *)v133 + 1);
    BOOL v113 = __OFSUB__(v134, v135);
    uint64_t v136 = v134 - v135;
    if (v113) {
      goto LABEL_132;
    }
    if (v136 < v124) {
      goto LABEL_96;
    }
LABEL_87:
    unint64_t v141 = v102 - 1;
    if (v102 - 1 >= v98)
    {
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
LABEL_134:
      __break(1u);
      goto LABEL_135;
    }
    uint64_t v142 = *(uint64_t (**)(void))a1;
    if (!*(void *)a1) {
      goto LABEL_147;
    }
    uint64_t v143 = v46;
    v144 = (unint64_t *)&v99[16 * v141];
    a1 = *v144;
    uint64_t v145 = v99;
    uint64_t v146 = &v99[16 * v102];
    int64_t v147 = *((void *)v146 + 1);
    OUTLINED_FUNCTION_46_13((unint64_t)v142 + v168[9] * *v144, (unint64_t)v142 + v168[9] * *(void *)v146, (char *)v142 + v168[9] * v147, (uint64_t)v46, v42, v43, v167);
    uint64_t v14 = v9;
    if (v9) {
      break;
    }
    if (v147 < (uint64_t)a1) {
      goto LABEL_121;
    }
    if (v102 > *((void *)v143 + 2)) {
      goto LABEL_122;
    }
    unint64_t *v144 = a1;
    *(void *)&v145[16 * v141 + 8] = v147;
    unint64_t v148 = *((void *)v143 + 2);
    if (v102 >= v148) {
      goto LABEL_123;
    }
    unint64_t v98 = v148 - 1;
    memmove(v146, v146 + 16, 16 * (v148 - 1 - v102));
    uint64_t v99 = v145;
    uint64_t v46 = v143;
    *((void *)v143 + 2) = v148 - 1;
    a1 = (unint64_t)v188;
    if (v148 <= 2) {
      goto LABEL_96;
    }
  }
  uint64_t v39 = v157;
LABEL_103:
  swift_bridgeObjectRelease();
  if (v39 < -1)
  {
    __break(1u);
    goto LABEL_105;
  }
LABEL_118:
  *(void *)(v155 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_25A9D2A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v27 = type metadata accessor for SpotlightReader.MessageWithDate();
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v26 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v26 - 1);
    uint64_t v25 = v16;
    uint64_t v29 = v16 * v26;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v24;
      do
      {
        uint64_t v19 = *a4;
        sub_25A9D5360(v29 + v17 + *a4, (uint64_t)v15);
        sub_25A9D5360(v30 + v17 + v19, (uint64_t)v11);
        LOBYTE(v19) = sub_25A9DB6C8();
        sub_25A9D4764((uint64_t)v11);
        uint64_t result = sub_25A9D4764((uint64_t)v15);
        if ((v19 & 1) == 0) {
          break;
        }
        uint64_t v20 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        uint64_t v21 = v20 + v30 + v17;
        sub_25A9D4710(v20 + v29 + v17, v28, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_25A9D4710(v28, v21, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
        v17 -= v25;
        ++v18;
      }
      while (v26 != v18);
      v30 += v25;
      v29 += v25;
      if (++v26 != v23) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_25A9D2CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v51 = a4;
  uint64_t v40 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B32D860);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (char *)&v38 - v10;
  uint64_t v11 = sub_25A9DC6C8();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v48 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v38 - v15;
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v53 = (char *)&v38 - v19;
  uint64_t v46 = a3;
  uint64_t v39 = a2;
  if (a3 != a2)
  {
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v20 = v18 + 16;
    uint64_t v22 = *(void *)(v20 + 56);
    uint64_t v41 = (uint64_t (**)(char *, uint64_t))(v20 - 8);
    uint64_t v42 = v21;
    uint64_t v43 = v20;
    uint64_t v44 = v22;
    uint64_t v47 = (void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    uint64_t v55 = v22 * (v46 - 1);
    uint64_t v23 = v22 * v46;
    while (2)
    {
      uint64_t v24 = 0;
      uint64_t v25 = v40;
      uint64_t v45 = v23;
      do
      {
        uint64_t v26 = *v51;
        uint64_t v50 = v23 + v24;
        uint64_t v27 = v42;
        v42(v53, v23 + v24 + v26, v11);
        uint64_t v49 = v55 + v24;
        v27(v16, v55 + v24 + v26, v11);
        uint64_t v28 = (uint64_t)v54;
        sub_25A9DC658();
        uint64_t v29 = sub_25A9DB738();
        uint64_t result = __swift_getEnumTagSinglePayload(v28, 1, v29);
        if (result == 1)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          return result;
        }
        sub_25A9DC658();
        uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v29);
        if (result == 1) {
          goto LABEL_12;
        }
        uint64_t v30 = v11;
        uint64_t v31 = v54;
        int v52 = sub_25A9DB6C8();
        uint64_t v32 = *(void (**)(char *, uint64_t))(*(void *)(v29 - 8) + 8);
        v32(v9, v29);
        uint64_t v33 = v31;
        uint64_t v11 = v30;
        v32(v33, v29);
        uint64_t v34 = *v41;
        (*v41)(v16, v30);
        uint64_t result = v34(v53, v30);
        uint64_t v23 = v45;
        if ((v52 & 1) == 0) {
          break;
        }
        uint64_t v35 = *v51;
        if (!*v51) {
          goto LABEL_13;
        }
        uint64_t v36 = v35 + v55 + v24;
        uint64_t v37 = *v47;
        (*v47)(v48, v35 + v45 + v24, v11);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v37)(v36, v48, v11);
        v24 -= v44;
        ++v25;
      }
      while (v46 != v25);
      v55 += v44;
      v23 += v44;
      if (++v46 != v39) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_25A9D30B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(void), uint64_t (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v57 = a6;
  uint64_t v47 = a1;
  uint64_t v56 = sub_25A9DB738();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v55 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_66();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v23 = OUTLINED_FUNCTION_61_8(v15, v16, v17, v18, v19, v20, v21, v22, v45[0]);
  uint64_t v24 = a5(v23);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_121();
  uint64_t v63 = v26;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v27);
  uint64_t v54 = (char *)v45 - v28;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_131_2();
  uint64_t v53 = v31;
  uint64_t v61 = a3;
  uint64_t v46 = a2;
  if (a3 != a2)
  {
    uint64_t v33 = *(void (**)(void))(v30 + 16);
    uint64_t v32 = v30 + 16;
    uint64_t v34 = *(void *)(v32 + 56);
    uint64_t v49 = (void (**)(void))(v11 + 8);
    uint64_t v50 = v33;
    uint64_t v48 = (void (**)(void))(v32 - 8);
    uint64_t v51 = v32;
    uint64_t v52 = v24;
    unint64_t v62 = (void (**)(void))(v32 + 16);
    uint64_t v35 = v34 * (v61 - 1);
    uint64_t v58 = v34;
    uint64_t v36 = v34 * v61;
    while (2)
    {
      uint64_t v37 = 0;
      uint64_t v65 = v47;
      uint64_t v59 = v36;
      uint64_t v60 = v35;
      do
      {
        uint64_t v38 = *a4;
        uint64_t v64 = v36 + v37;
        uint64_t v39 = v50;
        OUTLINED_FUNCTION_15_17();
        v39();
        OUTLINED_FUNCTION_15_17();
        v39();
        OUTLINED_FUNCTION_84_7();
        uint64_t v40 = v38();
        ((void (*)(uint64_t))v38)(v40);
        int v66 = sub_25A9DB6D8();
        uint64_t v41 = *v49;
        OUTLINED_FUNCTION_17();
        v41();
        OUTLINED_FUNCTION_17();
        v41();
        uint64_t v42 = *v48;
        uint64_t v43 = v60;
        OUTLINED_FUNCTION_17();
        v42();
        uint64_t v36 = v59;
        OUTLINED_FUNCTION_17();
        v42();
        if ((v66 & 1) == 0) {
          break;
        }
        if (!*a4)
        {
          __break(1u);
          return;
        }
        uint64_t v44 = *v62;
        OUTLINED_FUNCTION_55();
        v44();
        swift_arrayInitWithTakeFrontToBack();
        OUTLINED_FUNCTION_55();
        v44();
        v37 -= v58;
        ++v65;
      }
      while (v61 != v65);
      uint64_t v35 = v43 + v58;
      v36 += v58;
      if (++v61 != v46) {
        continue;
      }
      break;
    }
  }
}

void sub_25A9D33F4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v51 = type metadata accessor for SpotlightReader.MessageWithDate();
  uint64_t v8 = MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v49 = (uint64_t)&v44 - v10;
  uint64_t v12 = *(void *)(v11 + 72);
  if (!v12)
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  int64_t v13 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v12 == -1) {
    goto LABEL_75;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v12 == -1) {
    goto LABEL_76;
  }
  uint64_t v17 = v13 / v12;
  uint64_t v18 = v15 / v12;
  if (v13 / v12 >= v15 / v12)
  {
    sub_25A9CF8EC(a2, v15 / v12, a4, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
    uint64_t v28 = v18 * v12;
    unint64_t v19 = a4 + v18 * v12;
    if (v28 < 1 || a1 >= a2) {
      goto LABEL_69;
    }
    unint64_t v47 = a4;
    uint64_t v48 = -v12;
    uint64_t v45 = v12;
    unint64_t v46 = a1;
    while (1)
    {
      unint64_t v30 = a3;
      uint64_t v31 = v48;
      uint64_t v32 = v49;
      a3 += v48;
      unint64_t v33 = v19 + v48;
      sub_25A9D5360(v19 + v48, v49);
      unint64_t v34 = a2 + v31;
      uint64_t v35 = a2 + v31;
      uint64_t v36 = v50;
      sub_25A9D5360(v35, v50);
      char v37 = sub_25A9DB6C8();
      sub_25A9D4764(v36);
      sub_25A9D4764(v32);
      if (v37)
      {
        if (v30 >= a2 && a3 < a2)
        {
          unint64_t v40 = v46;
          a4 = v47;
          if (v30 != a2) {
            swift_arrayInitWithTakeBackToFront();
          }
          a2 = v34;
          uint64_t v12 = v45;
          goto LABEL_65;
        }
        swift_arrayInitWithTakeFrontToBack();
        a2 = v34;
      }
      else
      {
        if (v30 >= v19 && a3 < v19)
        {
          a4 = v47;
          if (v30 != v19) {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v19 = v33;
          goto LABEL_64;
        }
        swift_arrayInitWithTakeFrontToBack();
        unint64_t v19 = v33;
      }
      a4 = v47;
LABEL_64:
      uint64_t v12 = v45;
      unint64_t v40 = v46;
LABEL_65:
      if (v19 <= a4 || a2 <= v40) {
        goto LABEL_69;
      }
    }
  }
  sub_25A9CF8EC(a1, v13 / v12, a4, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
  unint64_t v19 = a4 + v17 * v12;
  if (v17 * v12 >= 1 && a2 < a3)
  {
    do
    {
      uint64_t v21 = v49;
      sub_25A9D5360(a2, v49);
      uint64_t v22 = v50;
      sub_25A9D5360(a4, v50);
      char v23 = sub_25A9DB6C8();
      sub_25A9D4764(v22);
      sub_25A9D4764(v21);
      if (v23)
      {
        unint64_t v24 = a2 + v12;
        if (a1 < a2 || a1 >= v24)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      else
      {
        if (a1 < a4 || a1 >= a4 + v12)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a4)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        unint64_t v24 = a2;
        a4 += v12;
      }
      a1 += v12;
      BOOL v27 = a4 >= v19 || v24 >= a3;
      a2 = v24;
    }
    while (!v27);
  }
  a2 = a1;
LABEL_69:
  int64_t v42 = v19 - a4;
  if (v12 != -1 || v42 != 0x8000000000000000)
  {
    sub_25A9CF8EC(a4, v42 / v12, a2, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
    return;
  }
LABEL_77:
  __break(1u);
}

void sub_25A9D37E8(unint64_t a1, unint64_t a2, char *a3, unint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B32D860);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  char v94 = (char *)&v80 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v89 = (uint64_t)&v80 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v93 = (uint64_t)&v80 - v16;
  uint64_t v96 = sub_25A9DC6C8();
  uint64_t v17 = *(void *)(v96 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v96);
  uint64_t v84 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v92 = (char *)&v80 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v87 = (char *)&v80 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v91 = (char *)&v80 - v24;
  uint64_t v26 = *(void *)(v25 + 72);
  if (!v26)
  {
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  int64_t v27 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v26 == -1) {
    goto LABEL_79;
  }
  uint64_t v29 = &a3[-a2];
  if (&a3[-a2] == (char *)0x8000000000000000 && v26 == -1) {
    goto LABEL_80;
  }
  uint64_t v31 = v27 / v26;
  uint64_t v32 = (uint64_t)v29 / v26;
  uint64_t v85 = v26;
  if (v27 / v26 >= (uint64_t)v29 / v26)
  {
    sub_25A9CF8EC(a2, (uint64_t)v29 / v26, a4, MEMORY[0x263F61D80]);
    unint64_t v34 = a4 + v32 * v26;
    if (v32 * v26 < 1 || a1 >= a2) {
      goto LABEL_48;
    }
    uint64_t v93 = -v26;
    char v37 = *(void (**)(char *))(v17 + 16);
    uint64_t v82 = v11;
    uint64_t v83 = v37;
    uint64_t v90 = v17 + 16;
    uint64_t v81 = (void (**)(char *, uint64_t))(v17 + 8);
    unint64_t v95 = a1;
    while (1)
    {
      uint64_t v38 = (uint64_t)v11;
      uint64_t v88 = (char *)v34;
      uint64_t v89 = (uint64_t)a3;
      uint64_t v39 = v93;
      uint64_t v87 = (char *)(v34 + v93);
      unint64_t v40 = v83;
      v83(v92);
      uint64_t v91 = (char *)a2;
      uint64_t v41 = v84;
      unint64_t v86 = a2 + v39;
      v40(v84);
      uint64_t v42 = (uint64_t)v94;
      sub_25A9DC658();
      uint64_t v43 = sub_25A9DB738();
      if (__swift_getEnumTagSinglePayload(v42, 1, v43) == 1) {
        goto LABEL_82;
      }
      unint64_t v44 = a4;
      uint64_t v45 = v38;
      sub_25A9DC658();
      if (__swift_getEnumTagSinglePayload(v38, 1, v43) == 1) {
        goto LABEL_83;
      }
      unint64_t v46 = v94;
      unint64_t v47 = (char *)v89;
      uint64_t v48 = (char *)(v89 + v93);
      char v49 = sub_25A9DB6C8();
      uint64_t v50 = *(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8);
      v50(v45, v43);
      v50((uint64_t)v46, v43);
      uint64_t v51 = *v81;
      uint64_t v52 = v96;
      (*v81)(v41, v96);
      v51(v92, v52);
      if (v49)
      {
        BOOL v53 = v47 < v91 || v48 >= v91;
        a4 = v44;
        a3 = v48;
        if (!v53)
        {
          unint64_t v54 = v95;
          uint64_t v11 = v82;
          a2 = v86;
          if (v47 != v91) {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v34 = (unint64_t)v88;
          goto LABEL_43;
        }
        a2 = v86;
        swift_arrayInitWithTakeFrontToBack();
        unint64_t v54 = v95;
        unint64_t v34 = (unint64_t)v88;
      }
      else
      {
        BOOL v55 = v47 < v88 || v48 >= v88;
        a4 = v44;
        a2 = (unint64_t)v91;
        a3 = v48;
        if (!v55)
        {
          unint64_t v54 = v95;
          uint64_t v11 = v82;
          unint64_t v34 = (unint64_t)v87;
          if (v47 != v88) {
            swift_arrayInitWithTakeBackToFront();
          }
          goto LABEL_43;
        }
        unint64_t v34 = (unint64_t)v87;
        swift_arrayInitWithTakeFrontToBack();
        unint64_t v54 = v95;
      }
      uint64_t v11 = v82;
LABEL_43:
      if (v34 <= a4 || a2 <= v54) {
        goto LABEL_47;
      }
    }
  }
  sub_25A9CF8EC(a1, v27 / v26, a4, MEMORY[0x263F61D80]);
  uint64_t v33 = v31 * v26;
  unint64_t v34 = a4 + v31 * v26;
  if (v33 >= 1 && a2 < (unint64_t)a3)
  {
    uint64_t v92 = a3;
    char v94 = *(char **)(v17 + 16);
    uint64_t v90 = v17 + 16;
    uint64_t v88 = (char *)(v17 + 8);
    uint64_t v59 = v87;
    do
    {
      unint64_t v95 = a1;
      uint64_t v60 = v96;
      uint64_t v61 = (void (*)(char *, unint64_t, uint64_t))v94;
      ((void (*)(char *, unint64_t, uint64_t))v94)(v91, a2, v96);
      v61(v59, a4, v60);
      uint64_t v62 = v93;
      sub_25A9DC658();
      uint64_t v63 = sub_25A9DB738();
      if (__swift_getEnumTagSinglePayload(v62, 1, v63) == 1) {
        goto LABEL_84;
      }
      unint64_t v64 = a4;
      unint64_t v65 = a2;
      uint64_t v66 = v89;
      sub_25A9DC658();
      if (__swift_getEnumTagSinglePayload(v66, 1, v63) == 1) {
        goto LABEL_85;
      }
      uint64_t v67 = v93;
      char v68 = sub_25A9DB6C8();
      uint64_t v69 = *(void (**)(uint64_t, uint64_t))(*(void *)(v63 - 8) + 8);
      v69(v66, v63);
      v69(v67, v63);
      uint64_t v70 = *(void (**)(char *, uint64_t))v88;
      uint64_t v71 = v96;
      (*(void (**)(char *, uint64_t))v88)(v59, v96);
      v70(v91, v71);
      if (v68)
      {
        unint64_t v72 = v65;
        uint64_t v73 = v85;
        a2 = v65 + v85;
        unint64_t v74 = v95;
        BOOL v75 = v95 < v72 || v95 >= a2;
        a4 = v64;
        if (v75)
        {
          swift_arrayInitWithTakeFrontToBack();
          unint64_t v76 = v74;
        }
        else
        {
          unint64_t v76 = v95;
          if (v95 != v72) {
            goto LABEL_69;
          }
        }
      }
      else
      {
        uint64_t v73 = v85;
        unint64_t v77 = v64;
        a4 = v64 + v85;
        unint64_t v76 = v95;
        BOOL v78 = v95 < v77 || v95 >= a4;
        a2 = v65;
        if (!v78)
        {
          if (v95 == v77) {
            goto LABEL_70;
          }
LABEL_69:
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_70;
        }
        swift_arrayInitWithTakeFrontToBack();
      }
LABEL_70:
      a1 = v76 + v73;
    }
    while (a4 < v34 && a2 < (unint64_t)v92);
  }
  a2 = a1;
LABEL_47:
  uint64_t v26 = v85;
LABEL_48:
  int64_t v57 = v34 - a4;
  if (v26 != -1 || v57 != 0x8000000000000000)
  {
    sub_25A9CF8EC(a4, v57 / v26, a2, MEMORY[0x263F61D80]);
    return;
  }
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
}

void sub_25A9D3F6C(unint64_t a1, unint64_t a2, char *a3, unint64_t a4, uint64_t (*a5)(void), void (*a6)(void), void (*a7)(uint64_t))
{
  uint64_t v88 = a7;
  unint64_t v72 = a6;
  uint64_t v91 = a3;
  uint64_t v87 = sub_25A9DB738();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_121();
  uint64_t v86 = v14;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_131_2();
  unint64_t v85 = v16;
  uint64_t v92 = a5(0);
  uint64_t v17 = *(void *)(v92 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v92);
  uint64_t v84 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v83 = (char *)&v71 - v20;
  uint64_t v22 = *(void *)(v21 + 72);
  if (!v22)
  {
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  int64_t v23 = a2 - a1;
  BOOL v24 = a2 - a1 == 0x8000000000000000 && v22 == -1;
  if (v24) {
    goto LABEL_79;
  }
  uint64_t v25 = &v91[-a2];
  if (&v91[-a2] == (char *)0x8000000000000000 && v22 == -1) {
    goto LABEL_80;
  }
  uint64_t v27 = v23 / v22;
  uint64_t v28 = (uint64_t)v25 / v22;
  uint64_t v82 = v22;
  if (v23 / v22 >= (uint64_t)v25 / v22)
  {
    sub_25A9CF8EC(a2, (uint64_t)v25 / v22, a4, v72);
    unint64_t v29 = a4 + v28 * v22;
    BOOL v32 = v28 * v22 < 1 || a1 >= a2;
    uint64_t v31 = v22;
    if (v32)
    {
      unint64_t v51 = a2;
    }
    else
    {
      unint64_t v77 = (void (**)(void))-v22;
      char v49 = *(void (**)(void))(v17 + 16);
      BOOL v75 = (void (**)(void))(v12 + 8);
      unint64_t v76 = v49;
      uint64_t v81 = v17 + 16;
      unint64_t v73 = a4;
      unint64_t v74 = (void (**)(char *, uint64_t))(v17 + 8);
      uint64_t v50 = v91;
      unint64_t v51 = a2;
      unint64_t v90 = a1;
      BOOL v53 = v83;
      uint64_t v52 = v84;
      do
      {
        unint64_t v89 = v29;
        BOOL v55 = v76;
        unint64_t v54 = v77;
        uint64_t v91 = (char *)v77 + (void)v50;
        unint64_t v79 = (void (*)(void))((char *)v77 + v29);
        unint64_t v80 = (unint64_t)v50;
        uint64_t v56 = v92;
        OUTLINED_FUNCTION_15_17();
        v55();
        BOOL v78 = (void (**)(void))((char *)v54 + v51);
        OUTLINED_FUNCTION_15_17();
        uint64_t v57 = ((uint64_t (*)(void))v55)();
        unint64_t v58 = v51;
        unint64_t v51 = v85;
        uint64_t v59 = v88;
        uint64_t v60 = ((uint64_t (*)(uint64_t))v88)(v57);
        v59(v60);
        char v61 = sub_25A9DB6D8();
        uint64_t v62 = *v75;
        OUTLINED_FUNCTION_51_8();
        v62();
        OUTLINED_FUNCTION_51_8();
        v62();
        uint64_t v63 = *v74;
        (*v74)(v52, v56);
        v63(v53, v56);
        if (v61)
        {
          unint64_t v64 = v89;
          uint64_t v50 = v91;
          if (v80 < v58 || (unint64_t)v91 >= v58)
          {
            OUTLINED_FUNCTION_37_8();
            swift_arrayInitWithTakeFrontToBack();
            a4 = v73;
            unint64_t v66 = v90;
            uint64_t v31 = v82;
          }
          else
          {
            BOOL v24 = v80 == v58;
            a4 = v73;
            uint64_t v31 = v82;
            if (v24)
            {
              unint64_t v51 = (unint64_t)v78;
            }
            else
            {
              OUTLINED_FUNCTION_37_8();
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v66 = v90;
          }
          unint64_t v29 = v64;
        }
        else
        {
          uint64_t v50 = v91;
          BOOL v67 = v80 < v89 || (unint64_t)v91 >= v89;
          unint64_t v51 = v58;
          if (v67)
          {
            OUTLINED_FUNCTION_38_10();
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v29 = v56;
            a4 = v73;
          }
          else
          {
            a4 = v73;
            if (v80 == v89)
            {
              unint64_t v29 = (unint64_t)v79;
            }
            else
            {
              OUTLINED_FUNCTION_38_10();
              swift_arrayInitWithTakeBackToFront();
              unint64_t v29 = v56;
            }
          }
          unint64_t v66 = v90;
          uint64_t v31 = v82;
        }
      }
      while (v29 > a4 && v51 > v66);
    }
  }
  else
  {
    sub_25A9CF8EC(a1, v23 / v22, a4, v72);
    unint64_t v29 = a4 + v27 * v22;
    if (v27 * v22 < 1 || a2 >= (unint64_t)v91)
    {
      uint64_t v31 = v22;
    }
    else
    {
      uint64_t v33 = *(void (**)(void))(v17 + 16);
      BOOL v78 = (void (**)(void))(v12 + 8);
      unint64_t v79 = v33;
      uint64_t v81 = v17 + 16;
      unint64_t v77 = (void (**)(void))(v17 + 8);
      unint64_t v34 = a2;
      unint64_t v89 = a4 + v27 * v22;
      do
      {
        unint64_t v80 = v34;
        unint64_t v90 = a1;
        unint64_t v35 = a4;
        uint64_t v36 = v79;
        OUTLINED_FUNCTION_15_17();
        v36();
        OUTLINED_FUNCTION_15_17();
        uint64_t v37 = ((uint64_t (*)(void))v36)();
        uint64_t v38 = v88;
        uint64_t v39 = ((uint64_t (*)(uint64_t))v88)(v37);
        v38(v39);
        char v40 = sub_25A9DB6D8();
        uint64_t v41 = *v78;
        OUTLINED_FUNCTION_17();
        v41();
        OUTLINED_FUNCTION_17();
        v41();
        uint64_t v42 = *v77;
        OUTLINED_FUNCTION_74_2();
        OUTLINED_FUNCTION_17();
        v42();
        OUTLINED_FUNCTION_17();
        v42();
        if (v40)
        {
          uint64_t v31 = v82;
          unint64_t v43 = v80 + v82;
          unint64_t v44 = v90;
          if (v90 < v80 || v90 >= v43)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v90 != v80)
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v46 = v80;
          uint64_t v31 = v82;
          a4 += v82;
          unint64_t v44 = v90;
          if (v90 < v35 || v90 >= a4)
          {
            OUTLINED_FUNCTION_56_6();
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v90 != v35)
          {
            OUTLINED_FUNCTION_56_6();
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v43 = v46;
        }
        unint64_t v29 = v89;
        a1 = v44 + v31;
        BOOL v48 = a4 >= v89 || v43 >= (unint64_t)v91;
        unint64_t v34 = v43;
      }
      while (!v48);
    }
    unint64_t v51 = a1;
  }
  int64_t v69 = v29 - a4;
  if (v31 != -1 || v69 != 0x8000000000000000)
  {
    sub_25A9CF8EC(a4, v69 / v31, v51, v72);
    return;
  }
LABEL_81:
  __break(1u);
}

void sub_25A9D454C(uint64_t a1, void *a2)
{
  id v3 = (id)sub_25A9DD158();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setBundleIDs_, v3);
}

void sub_25A9D45B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25A9DCF48();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setReason_, v4);
}

uint64_t sub_25A9D461C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25A9D4654()
{
}

unint64_t sub_25A9D4660()
{
  unint64_t result = qword_26A46D2E8;
  if (!qword_26A46D2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46D2E8);
  }
  return result;
}

void sub_25A9D46AC()
{
}

uint64_t type metadata accessor for SpotlightReader.MessageWithDate()
{
  uint64_t result = qword_26A4810C0;
  if (!qword_26A4810C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25A9D4700()
{
}

uint64_t sub_25A9D4710(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_229_1();
  v5(v4);
  return a2;
}

uint64_t sub_25A9D4764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpotlightReader.MessageWithDate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25A9D47C0()
{
}

void sub_25A9D47CC()
{
}

void sub_25A9D47F8(uint64_t a1@<X8>)
{
  sub_25A9036AC(*(void **)(v1 + 16), 1, a1);
}

void sub_25A9D4830()
{
}

unint64_t sub_25A9D4860()
{
  unint64_t result = qword_26A46D340;
  if (!qword_26A46D340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46D340);
  }
  return result;
}

unint64_t sub_25A9D48B0()
{
  unint64_t result = qword_26A46D348;
  if (!qword_26A46D348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46D348);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SpotlightPrivateKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25A9D4998);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpotlightPrivateKeys()
{
  return &type metadata for SpotlightPrivateKeys;
}

unsigned char *storeEnumTagSinglePayload for SpotlightReaderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A9D4A9CLL);
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

ValueMetadata *type metadata accessor for SpotlightReaderError()
{
  return &type metadata for SpotlightReaderError;
}

uint64_t type metadata accessor for SpotlightReader()
{
  return self;
}

void sub_25A9D4AF8()
{
  OUTLINED_FUNCTION_47_2();
  uint64_t v1 = v0;
  int v3 = v2;
  OUTLINED_FUNCTION_0_10();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    *int v3 = *v1;
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1[1];
    *int v3 = *v1;
    v3[1] = v7;
    sub_25A9DB738();
    OUTLINED_FUNCTION_4();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    swift_bridgeObjectRetain();
    uint64_t v10 = OUTLINED_FUNCTION_85_3();
    v9(v10);
    *((unsigned char *)v3 + *(int *)(v6 + 24)) = *((unsigned char *)v1 + *(int *)(v6 + 24));
  }
  OUTLINED_FUNCTION_46_2();
}

uint64_t sub_25A9D4BB4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_25A9DB738();
  OUTLINED_FUNCTION_4();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

void sub_25A9D4C24()
{
  OUTLINED_FUNCTION_47_2();
  OUTLINED_FUNCTION_54_8();
  uint64_t v1 = v0[1];
  *uint64_t v2 = *v0;
  v2[1] = v1;
  sub_25A9DB738();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v5 = OUTLINED_FUNCTION_85_3();
  v4(v5);
  OUTLINED_FUNCTION_30_11();
  OUTLINED_FUNCTION_46_2();
}

uint64_t sub_25A9D4C9C()
{
  OUTLINED_FUNCTION_54_8();
  *uint64_t v2 = *v1;
  *(void *)(v0 + 8) = v1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_127_3();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_78_6();
  v4(v3);
  return OUTLINED_FUNCTION_30_11();
}

uint64_t sub_25A9D4D18()
{
  OUTLINED_FUNCTION_54_8();
  *uint64_t v1 = *v0;
  sub_25A9DB738();
  OUTLINED_FUNCTION_4();
  uint64_t v2 = OUTLINED_FUNCTION_78_6();
  v3(v2);
  return OUTLINED_FUNCTION_30_11();
}

uint64_t sub_25A9D4D8C()
{
  OUTLINED_FUNCTION_54_8();
  uint64_t v2 = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = v2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_127_3();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_78_6();
  v4(v3);
  return OUTLINED_FUNCTION_30_11();
}

uint64_t sub_25A9D4DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A9D4E0C);
}

uint64_t sub_25A9D4E0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25A9DB738();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25A9D4E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A9D4EA8);
}

uint64_t sub_25A9D4EA8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A9DB738();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25A9D4F28()
{
  uint64_t result = sub_25A9DB738();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A9D4FC8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_providerDataTypeIdentifiers);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25A9DD178();

  return v3;
}

uint64_t sub_25A9D502C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_containerIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25A9DCF68();

  return v3;
}

uint64_t sub_25A9D509C(uint64_t a1)
{
  return sub_25A9CF420(0, *(void *)(a1 + 16), 0, a1, &qword_26A46D360, (uint64_t (*)(void))type metadata accessor for SpotlightReader.MessageWithDate, (uint64_t (*)(void))type metadata accessor for SpotlightReader.MessageWithDate, (void (*)(void))type metadata accessor for SpotlightReader.MessageWithDate);
}

uint64_t sub_25A9D5108(uint64_t a1)
{
  return sub_25A9CF420(0, *(void *)(a1 + 16), 0, a1, &qword_26A46D358, MEMORY[0x263F61D80], MEMORY[0x263F61D80], MEMORY[0x263F61D80]);
}

uint64_t sub_25A9D5174(uint64_t a1)
{
  return sub_25A9CF420(0, *(void *)(a1 + 16), 0, a1, &qword_26A46C6F0, MEMORY[0x263F61C10], MEMORY[0x263F61C10], MEMORY[0x263F61C10]);
}

uint64_t sub_25A9D51E0(uint64_t a1)
{
  return sub_25A9CF420(0, *(void *)(a1 + 16), 0, a1, &qword_26A46B4B8, MEMORY[0x263F61B30], MEMORY[0x263F61B30], MEMORY[0x263F61B30]);
}

unint64_t sub_25A9D524C()
{
  unint64_t result = qword_26A46D350;
  if (!qword_26A46D350)
  {
    sub_25A9DB738();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46D350);
  }
  return result;
}

uint64_t sub_25A9D529C()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_344();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25A9D52D4()
{
  uint64_t v0 = (void *)MEMORY[0x26114B040]();
  sub_25A9CB4E0();
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

uint64_t sub_25A9D5360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpotlightReader.MessageWithDate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A9D53C4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25A9D5404()
{
  uint64_t v0 = (void *)MEMORY[0x26114B040]();
  OUTLINED_FUNCTION_83_0();
  sub_25A9C9FA8();
}

void sub_25A9D5460(unint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x26114B040]();
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25A9DD7C8();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v1 + 16);
    uint64_t v22 = v3;
    unint64_t v23 = a1 & 0xC000000000000001;
    unint64_t v7 = a1;
    uint64_t v8 = v4;
    do
    {
      if (v23) {
        id v9 = (id)MEMORY[0x26114AA30](v5, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v10 = v9;
      id v11 = objc_msgSend(v9, sel_uniqueIdentifier);
      uint64_t v12 = sub_25A9DCF68();
      uint64_t v14 = v13;

      OUTLINED_FUNCTION_67_5();
      uint64_t v15 = *v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v6 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v20 = OUTLINED_FUNCTION_79_5();
        OUTLINED_FUNCTION_102_5((uint64_t)v20);
      }
      unint64_t v18 = *(void *)(v15 + 16);
      unint64_t v17 = *(void *)(v15 + 24);
      if (v18 >= v17 >> 1)
      {
        uint64_t v21 = OUTLINED_FUNCTION_91_5(v17);
        OUTLINED_FUNCTION_102_5((uint64_t)v21);
      }
      ++v5;
      *(void *)(v15 + 16) = v18 + 1;
      uint64_t v19 = v15 + 16 * v18;
      *(void *)(v19 + 32) = v12;
      *(void *)(v19 + 40) = v14;
      swift_endAccess();

      a1 = v7;
    }
    while (v8 != v5);
    swift_bridgeObjectRelease();
    uint64_t v3 = v22;
    goto LABEL_16;
  }
  __break(1u);
}

void sub_25A9D5600(unint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x26114B040]();
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25A9DD7C8();
  if (!v4) {
    goto LABEL_17;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v1 + 16);
    uint64_t v22 = v3;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x26114AA30](v5, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_attributeSet);
      unsigned int v10 = objc_msgSend(v9, sel_summarizationStatus);

      if (v10)
      {
        id v11 = objc_msgSend(v8, sel_uniqueIdentifier);
        uint64_t v12 = sub_25A9DCF68();
        uint64_t v14 = v13;

        OUTLINED_FUNCTION_67_5();
        uint64_t v15 = *v6;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v6 = v15;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v20 = OUTLINED_FUNCTION_79_5();
          OUTLINED_FUNCTION_102_5((uint64_t)v20);
        }
        unint64_t v18 = *(void *)(v15 + 16);
        unint64_t v17 = *(void *)(v15 + 24);
        if (v18 >= v17 >> 1)
        {
          uint64_t v21 = OUTLINED_FUNCTION_91_5(v17);
          OUTLINED_FUNCTION_102_5((uint64_t)v21);
        }
        *(void *)(v15 + 16) = v18 + 1;
        uint64_t v19 = v15 + 16 * v18;
        *(void *)(v19 + 32) = v12;
        *(void *)(v19 + 40) = v14;
        swift_endAccess();
      }
      ++v5;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
    uint64_t v3 = v22;
    goto LABEL_18;
  }
  __break(1u);
}

uint64_t objectdestroy_55Tm()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46BBB0);
  OUTLINED_FUNCTION_4();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_18();
  v5();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25A9D584C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46BBB0);
  OUTLINED_FUNCTION_0_10();
  if (!a1) {
    return sub_25A9DD258();
  }
  id v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46BBB0);
  return sub_25A9DD248();
}

uint64_t sub_25A9D58CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_229_1();
  v5(v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_17_18()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_24_12(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_25A9DD508();
}

uint64_t OUTLINED_FUNCTION_26_8()
{
  return sub_25A9DD068();
}

uint64_t OUTLINED_FUNCTION_27_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_11()
{
  *(unsigned char *)(v2 + *(int *)(v0 + 24)) = *(unsigned char *)(v1 + *(int *)(v0 + 24));
  return v2;
}

id OUTLINED_FUNCTION_32_9(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  return objc_msgSend(a13, a2, v14, v15, v16, v13);
}

uint64_t OUTLINED_FUNCTION_33_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(_OWORD *)(a1 + 16) = a9;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_35_13(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

void OUTLINED_FUNCTION_39_12()
{
  *(void *)(v0 - 144) = 0;
  *(void *)(v0 - 136) = 0xE000000000000000;
}

void OUTLINED_FUNCTION_46_13(unint64_t a1, unint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  unint64_t v9 = *(void *)(v7 - 280);
  uint64_t v10 = *(uint64_t (**)(void))(v7 - 264);
  uint64_t v11 = *(void (**)(void))(v7 - 272);
  sub_25A9D3F6C(a1, a2, a3, v9, v10, v11, a7);
}

uint64_t OUTLINED_FUNCTION_49_9()
{
  return sub_25A9DD068();
}

uint64_t OUTLINED_FUNCTION_50_7()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_52_5(uint64_t a1)
{
  return a1 + v1;
}

uint64_t OUTLINED_FUNCTION_53_5(uint64_t a1)
{
  return a1 + v1;
}

uint64_t OUTLINED_FUNCTION_55_7()
{
  uint64_t v3 = *(void *)(v1 - 368);
  return sub_25A8C10D0(v3, v0, (uint64_t *)(v1 - 120));
}

uint64_t OUTLINED_FUNCTION_61_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 184) = (char *)&a9 - v9;
  return 0;
}

uint64_t OUTLINED_FUNCTION_62_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_67_6(uint64_t result)
{
  *(void *)(v1 + 48) = *(void *)(result + 8);
  return result;
}

id OUTLINED_FUNCTION_68_7(void **a1)
{
  uint64_t v3 = *a1;
  *(void *)(v1 + 40) = *a1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_69_5()
{
  return swift_continuation_init();
}

void OUTLINED_FUNCTION_75_5(double a1)
{
  *(double *)(v1 + 88) = a1;
}

void OUTLINED_FUNCTION_76_8(uint64_t a1@<X8>)
{
  *(void *)(v1 + 56) = a1;
}

uint64_t OUTLINED_FUNCTION_78_6()
{
  return v0;
}

char *OUTLINED_FUNCTION_79_5()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25A8D9348(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_80_4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  sub_25A9D454C(v2, v3);
}

uint64_t OUTLINED_FUNCTION_83_5()
{
  return sub_25A9DD9E8();
}

uint64_t OUTLINED_FUNCTION_85_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_89_7(uint64_t a1)
{
  *(void *)(v1 + 40) = *(void *)(a1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_90_6(uint64_t a1, unsigned char *a2)
{
  *a2 = 0;
  return swift_willThrow();
}

char *OUTLINED_FUNCTION_91_5@<X0>(unint64_t a1@<X8>)
{
  return sub_25A8D9348((char *)(a1 > 1), v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_98_5(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_101_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_102_5(uint64_t result)
{
  *int64_t v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_105_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return a9;
}

uint64_t OUTLINED_FUNCTION_107_5()
{
  return swift_bridgeObjectRelease();
}

__n128 *OUTLINED_FUNCTION_109_6(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

void *OUTLINED_FUNCTION_110_5(void *result)
{
  *(void *)(v3 + 72) = result;
  result[2] = v5;
  result[3] = v4;
  result[4] = v2;
  result[5] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_113_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[23] = a5;
  v6[24] = a6;
  v6[21] = a3;
  v6[22] = a4;
  v6[19] = a1;
  v6[20] = a2;
  return sub_25A9DC848();
}

uint64_t OUTLINED_FUNCTION_117_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_118_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_119_6()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_124_4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_125_4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_126_4()
{
  return sub_25A9CF164(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_127_3()
{
  return sub_25A9DB738();
}

void OUTLINED_FUNCTION_130_5(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  sub_25A9D45B8(v4, a2, v2);
}

uint64_t sub_25A9D5F78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46B008);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25A9DC848();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a1, sel_personHandle);
  uint64_t v30 = a2;
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_msgSend(v11, sel_type);
    if (v13)
    {
      if (v13 == (id)2 || v13 == (id)1)
      {
        sub_25A9DCF68();
      }
      else
      {
        uint64_t v14 = sub_25A9994C0();
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
        uint64_t v15 = v12;
        uint64_t v16 = sub_25A9DC828();
        os_log_type_t v17 = sub_25A9DD408();
        int v29 = v17;
        if (os_log_type_enabled(v16, v17))
        {
          unint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v18 = 134217984;
          v27[1] = v18 + 4;
          uint64_t v28 = v18;
          id v31 = [v15 type];
          sub_25A9DD508();

          uint64_t v19 = v28;
          _os_log_impl(&dword_25A8BB000, v16, (os_log_type_t)v29, "Unhandled person handle type: %ld", v28, 0xCu);
          MEMORY[0x26114B890](v19, -1, -1);
        }
        else
        {

          uint64_t v16 = v15;
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
    id v20 = objc_msgSend(v12, sel_value);
    if (v20)
    {
      uint64_t v21 = v20;
      sub_25A9DCF68();
    }
  }
  id v22 = objc_msgSend(a1, sel_displayName);
  sub_25A9DCF68();

  sub_25A9D6358(a1);
  objc_msgSend(a1, sel_isMe);
  sub_25A9DBF98();

  uint64_t v23 = sub_25A9DBFC8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v23))
  {
    sub_25A8C3DD4((uint64_t)v6);
    uint64_t v24 = 1;
    uint64_t v25 = v30;
  }
  else
  {
    uint64_t v25 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v30, v6, v23);
    uint64_t v24 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v25, v24, 1, v23);
}

uint64_t sub_25A9D6358(void *a1)
{
  id v1 = objc_msgSend(a1, sel_contactIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25A9DCF68();

  return v3;
}

uint64_t sub_25A9D63BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v135 = a1;
  uint64_t v5 = sub_25A9DBFC8();
  OUTLINED_FUNCTION_1();
  uint64_t v137 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_121();
  uint64_t v133 = v8;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v9);
  uint64_t v134 = (char *)&v122 - v10;
  uint64_t v11 = sub_25A9DC848();
  OUTLINED_FUNCTION_1();
  uint64_t v130 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v122 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46B450);
  MEMORY[0x270FA5388](v16 - 8);
  OUTLINED_FUNCTION_121();
  uint64_t v136 = v17;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v18);
  uint64_t v131 = (uint64_t)&v122 - v19;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v20);
  uint64_t v132 = (uint64_t)&v122 - v21;
  OUTLINED_FUNCTION_66();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t *)((char *)&v122 - v23);
  uint64_t v25 = sub_25A9DCD88();
  __swift_storeEnumTagSinglePayload((uint64_t)v24, 1, 1, v25);
  uint64_t v26 = sub_25A9DBFB8();
  if (!v27) {
    goto LABEL_27;
  }
  uint64_t v28 = v26;
  uint64_t v29 = v27;
  uint64_t v30 = HIBYTE(v27) & 0xF;
  if ((v27 & 0x2000000000000000) == 0) {
    uint64_t v30 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v30)
  {
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v127 = v11;
  uint64_t v128 = a2;
  sub_25A9DBF68();
  if (!v31 || (v32 = sub_25A9DD018(), unint64_t v34 = v33, swift_bridgeObjectRelease(), !v34))
  {
    uint64_t v32 = 0x726568746FLL;
    swift_bridgeObjectRelease();
    unint64_t v34 = 0xE500000000000000;
  }
  BOOL v36 = sub_25A9DCF68() == v32 && v34 == v35;
  uint64_t v129 = v5;
  if (v36)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v37 = OUTLINED_FUNCTION_5_28();
  swift_bridgeObjectRelease();
  if (v37)
  {
LABEL_26:
    sub_25A9D7020((uint64_t)v24);
    swift_bridgeObjectRelease();
    *uint64_t v24 = v28;
    v24[1] = v29;
    uint64_t v42 = OUTLINED_FUNCTION_9_19();
    v43(v42);
    OUTLINED_FUNCTION_10_23();
    uint64_t v5 = v129;
    goto LABEL_27;
  }
  if (sub_25A9DCF68() == v32 && v34 == v38)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v40 = OUTLINED_FUNCTION_5_28();
  swift_bridgeObjectRelease();
  if (v40) {
    goto LABEL_26;
  }
  BOOL v41 = v32 == 0x726568746FLL && v34 == 0xE500000000000000;
  if (v41 || (OUTLINED_FUNCTION_5_28() & 1) != 0) {
    goto LABEL_26;
  }
  uint64_t v112 = sub_25A9994C0();
  uint64_t v113 = v130;
  (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v15, v112, v127);
  swift_bridgeObjectRetain();
  unint64_t v114 = sub_25A9DC828();
  os_log_type_t v115 = sub_25A9DD408();
  os_log_t v126 = v114;
  int v125 = v115;
  if (os_log_type_enabled(v114, v115))
  {
    uint64_t v116 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    uint64_t v139 = v124;
    BOOL v123 = v116;
    *(_DWORD *)uint64_t v116 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v138 = sub_25A8C10D0(v32, v34, &v139);
    sub_25A9DD508();
    swift_bridgeObjectRelease_n();
    os_log_t v117 = v126;
    uint64_t v118 = v123;
    _os_log_impl(&dword_25A8BB000, v126, (os_log_type_t)v125, "Unknown handle type: %{public}s", v123, 0xCu);
    uint64_t v119 = v124;
    swift_arrayDestroy();
    MEMORY[0x26114B890](v119, -1, -1);
    MEMORY[0x26114B890](v118, -1, -1);

    (*(void (**)(char *, uint64_t))(v130 + 8))(v15, v127);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v113 + 8))(v15, v127);
  }
  sub_25A9D7020((uint64_t)v24);
  uint64_t v5 = v129;
  *uint64_t v24 = v28;
  v24[1] = v29;
  uint64_t v120 = OUTLINED_FUNCTION_9_19();
  v121(v120);
  OUTLINED_FUNCTION_10_23();
LABEL_27:
  sub_25A9DBF78();
  if (!v44 || (uint64_t v45 = sub_25A9DD018(), v47 = v46, swift_bridgeObjectRelease(), !v47))
  {
LABEL_52:
    sub_25A9DBFB8();
    if (!v78) {
      goto LABEL_70;
    }
    uint64_t v79 = sub_25A9DD018();
    uint64_t v81 = v80;
    swift_bridgeObjectRelease();
    if (!v81) {
      goto LABEL_70;
    }
    sub_25A9DBFA8();
    if (v82)
    {
      sub_25A9DD018();
      uint64_t v84 = v83;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v85 = OUTLINED_FUNCTION_3_23();
      v86(v85);
      if (v84)
      {
        uint64_t v87 = sub_25A9DBFA8();
        if (!v88)
        {
          uint64_t v105 = OUTLINED_FUNCTION_7_24();
          v106(v105);
LABEL_69:
          swift_bridgeObjectRelease();
          goto LABEL_70;
        }
        if (v87 == v79 && v88 == v81)
        {
          uint64_t v108 = OUTLINED_FUNCTION_4_27();
          v109(v108);
          swift_bridgeObjectRelease();
        }
        else
        {
          char v90 = sub_25A9DD9E8();
          uint64_t v91 = OUTLINED_FUNCTION_4_27();
          v92(v91);
          swift_bridgeObjectRelease();
          if ((v90 & 1) == 0) {
            goto LABEL_69;
          }
        }
LABEL_65:
        unint64_t v97 = self;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D970);
        uint64_t v98 = swift_allocObject();
        *(_OWORD *)(v98 + 16) = xmmword_25A9DEA20;
        *(void *)(v98 + 32) = v79;
        *(void *)(v98 + 40) = v81;
        swift_bridgeObjectRetain();
        uint64_t v99 = (void *)sub_25A9DD158();
        swift_bridgeObjectRelease();
        id v100 = objc_msgSend(v97, sel_predicateForContactsMatchingHandleStrings_, v99);

        sub_25A9D6D8C((uint64_t)v100, v135);
        uint64_t v102 = v101;
        swift_bridgeObjectRelease();

        if (v102)
        {
          sub_25A9DD018();
          uint64_t v104 = v103;
          swift_bridgeObjectRelease();
          if (v104)
          {
            sub_25A9D6FB8((uint64_t)v24, v131);
LABEL_71:
            sub_25A9DBF78();
            sub_25A9DBF88();
            goto LABEL_72;
          }
        }
LABEL_70:
        sub_25A9DBFA8();
        sub_25A9D6FB8((uint64_t)v24, v136);
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v93 = OUTLINED_FUNCTION_3_23();
      v94(v93);
    }
    uint64_t v95 = OUTLINED_FUNCTION_7_24();
    v96(v95);
    goto LABEL_65;
  }
  uint64_t v48 = v3;
  sub_25A9DBFA8();
  if (!v49)
  {
    uint64_t v64 = OUTLINED_FUNCTION_2_26();
    v65(v64);
    goto LABEL_40;
  }
  uint64_t v48 = v49;
  sub_25A9DD018();
  uint64_t v51 = v50;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = OUTLINED_FUNCTION_2_26();
  v53(v52);
  if (!v51)
  {
LABEL_40:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v5);
    goto LABEL_41;
  }
  uint64_t v54 = sub_25A9DBFA8();
  uint64_t v56 = v55;
  uint64_t v57 = sub_25A9DBFB8();
  uint64_t v59 = v58;
  if (!v56)
  {
    uint64_t v74 = OUTLINED_FUNCTION_0_18();
    v75(v74);
    if (!v59) {
      goto LABEL_41;
    }
LABEL_50:
    swift_bridgeObjectRelease();
LABEL_51:
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  if (!v58)
  {
    uint64_t v76 = OUTLINED_FUNCTION_0_18();
    v77(v76);
    goto LABEL_50;
  }
  if (v54 == v57 && v56 == v58)
  {
    swift_bridgeObjectRelease();
    uint64_t v110 = OUTLINED_FUNCTION_0_18();
    v111(v110);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v61 = sub_25A9DD9E8();
    swift_bridgeObjectRelease();
    uint64_t v62 = OUTLINED_FUNCTION_0_18();
    v63(v62);
    swift_bridgeObjectRelease();
    if ((v61 & 1) == 0) {
      goto LABEL_51;
    }
  }
LABEL_41:
  unint64_t v66 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D970);
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_25A9DEA20;
  *(void *)(v67 + 32) = v45;
  *(void *)(v67 + 40) = v47;
  swift_bridgeObjectRetain();
  char v68 = (void *)sub_25A9DD158();
  swift_bridgeObjectRelease();
  id v69 = objc_msgSend(v66, sel_predicateForContactsWithIdentifiers_, v68);

  sub_25A9D6D8C((uint64_t)v69, v135);
  uint64_t v71 = v70;

  if (!v71) {
    goto LABEL_51;
  }
  sub_25A9DD018();
  uint64_t v73 = v72;
  swift_bridgeObjectRelease();
  if (!v73) {
    goto LABEL_51;
  }
  sub_25A9D6FB8((uint64_t)v24, v132);
  sub_25A9DBF88();
LABEL_72:
  sub_25A9DCD98();
  return sub_25A9D7020((uint64_t)v24);
}

uint64_t sub_25A9D6D8C(uint64_t a1, void *a2)
{
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_descriptorForRequiredKeysForStyle_, 0);
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32D990);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25A9E0500;
  *(void *)(v8 + 32) = v5;
  uint64_t v19 = v8;
  sub_25A9DD198();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_unknownObjectRetain();
  unint64_t v11 = v9(a1, v19, v6, v7);
  swift_bridgeObjectRelease();
  if (v11 >> 62) {
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v12)
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v14 = (v11 & 0xC000000000000001) != 0 ? (id)MEMORY[0x26114AA30](i - 4, v11) : *(id *)(v11 + 8 * i);
      uint64_t v15 = v14;
      uint64_t v16 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v17 = objc_msgSend(v4, sel_stringFromContact_style_, v14, 0);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v12 = sub_25A9DCF68();
        swift_bridgeObjectRelease();

        swift_unknownObjectRelease();
        return v12;
      }

      if (v16 == v12)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25A9DD7C8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_25A9D6FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46B450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A9D7020(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46B450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_28()
{
  return sub_25A9DD9E8();
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_23()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t sub_25A9D70EC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

BOOL sub_25A9D7128(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

uint64_t sub_25A9D7134@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, char a10)
{
  *(void *)a9 = result;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  *(void *)(a9 + 16) = a3;
  *(unsigned char *)(a9 + 24) = a4 & 1;
  *(void *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 40) = a6 & 1;
  *(void *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 56) = a8 & 1;
  *(unsigned char *)(a9 + 57) = a10;
  return result;
}

double sub_25A9D7170@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25A9D71C0(a1, (uint64_t)v8);
  uint64_t v3 = v9;
  __int16 v4 = v10;
  double result = *(double *)v8;
  long long v6 = v8[1];
  long long v7 = v8[2];
  *(_OWORD *)a2 = v8[0];
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 48) = v3;
  *(_WORD *)(a2 + 56) = v4;
  return result;
}

uint64_t sub_25A9D71C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46D390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_25A9D7228@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_WORD *)(a1 + 56) = 768;
  return result;
}

uint64_t sub_25A9D7244()
{
  return OUTLINED_FUNCTION_5_29();
}

uint64_t sub_25A9D7284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_25A9D72A8, v3, 0);
}

uint64_t sub_25A9D72A8()
{
  uint64_t v1 = v0[3];
  sub_25A9DB668();
  double v3 = v2;
  uint64_t v4 = v0[5];
  if (!v1)
  {
    double v5 = *(double *)(v4 + 144);
    uint64_t v10 = *(void *)(v4 + 152);
    int v11 = *(unsigned __int8 *)(v4 + 185) << 8;
    if (v11 == 768 || (*(unsigned char *)(v4 + 136) & 1) != 0)
    {
      *(double *)&uint64_t v12 = COERCE_DOUBLE(sub_25A8C41F4());
      if (v13) {
        double v7 = sub_25A900248();
      }
      else {
        double v7 = *(double *)&v12;
      }
      if (v11 == 768) {
        goto LABEL_20;
      }
    }
    else
    {
      double v7 = *(double *)(v4 + 128);
    }
    if ((v10 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    *(double *)&uint64_t v14 = COERCE_DOUBLE(sub_25A8C4314());
    if (v17)
    {
      double v16 = sub_25A9000F0();
      goto LABEL_23;
    }
LABEL_21:
    double v5 = *(double *)&v14;
    goto LABEL_24;
  }
  double v5 = *(double *)(v4 + 176);
  __int16 v6 = *(_WORD *)(v4 + 184);
  if (v6 & 0xFF00) == 0x300 || (*(unsigned char *)(v4 + 168))
  {
    *(double *)&uint64_t v8 = COERCE_DOUBLE(sub_25A8C4344());
    if (v9) {
      double v7 = sub_25A9002F0();
    }
    else {
      double v7 = *(double *)&v8;
    }
    if ((v6 & 0xFF00) == 0x300) {
      goto LABEL_15;
    }
  }
  else
  {
    double v7 = *(double *)(v4 + 160);
  }
  if ((v6 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_15:
  *(double *)&uint64_t v14 = COERCE_DOUBLE(sub_25A8C4374());
  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  double v16 = sub_25A900198();
LABEL_23:
  double v5 = v16;
LABEL_24:
  sub_25A932980();
  if (v19 == 1)
  {
    uint64_t v24 = v0[3];
    swift_bridgeObjectRetain();
    uint64_t v18 = v0[2];
    v23.n128_u64[0] = 0;
    v22.n128_u64[0] = 0;
  }
  else
  {
    uint64_t v24 = v19;
    v22.n128_u64[0] = v20;
    v23.n128_u64[0] = v21;
  }
  v22.n128_f64[0] = v22.n128_f64[0] + (v3 - v23.n128_f64[0]) / v5;
  if (v22.n128_f64[0] >= v7) {
    v22.n128_f64[0] = v7;
  }
  uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, __n128, __n128))v0[1];
  v23.n128_f64[0] = v3;
  return v25(v18, v24, v22, v23);
}

uint64_t sub_25A9D743C()
{
  OUTLINED_FUNCTION_3();
  v1[32] = v2;
  v1[33] = v0;
  v1[30] = v3;
  v1[31] = v4;
  uint64_t v5 = sub_25A9DB738();
  v1[34] = v5;
  OUTLINED_FUNCTION_2(v5);
  v1[35] = v6;
  v1[36] = swift_task_alloc();
  uint64_t v7 = sub_25A9DC848();
  v1[37] = v7;
  OUTLINED_FUNCTION_2(v7);
  v1[38] = v8;
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A9D7544, v0, 0);
}

uint64_t sub_25A9D7544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void (*a14)(uint64_t, uint64_t, uint64_t), uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_7_25();
  a27 = v29;
  a28 = v30;
  a26 = v28;
  if (sub_25A8C43A4())
  {
    uint64_t v31 = v28[43];
    uint64_t v33 = v28[37];
    uint64_t v32 = v28[38];
    uint64_t v34 = sub_25A9994C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v34, v33);
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_25A9DC828();
    os_log_type_t v36 = sub_25A9DD418();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v38 = v28[43];
    uint64_t v39 = v28[37];
    uint64_t v40 = v28[38];
    unint64_t v41 = v28[31];
    if (v37)
    {
      a12 = v28[30];
      a14 = (void (*)(uint64_t, uint64_t, uint64_t))v28[43];
      OUTLINED_FUNCTION_18_0();
      a13 = v39;
      a15 = OUTLINED_FUNCTION_6_1();
      a11 = v28 + 29;
      OUTLINED_FUNCTION_22_11(4.8751e-34);
      v28[29] = sub_25A8C10D0(a12, v41, &a15);
      sub_25A9DD508();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_21_10(&dword_25A8BB000, v42, v43, "PowerBudget: Policies are disabled. Returning eligible. bundleId: %{public}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(void (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v40 + 8))(a14, v39);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    }
LABEL_13:
    OUTLINED_FUNCTION_27_12();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_26_9();
    OUTLINED_FUNCTION_0_19();
    return v72(v68, v69, v70, v71, v72, v73, v74, v75, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
  }
  if (((*(_WORD *)(v28[33] + 184) & 0x100) == 0 || (*(_WORD *)(v28[33] + 184) & 0xFE00 | 0x100) == 0x300)
    && IOPSDrawingUnlimitedPower())
  {
    uint64_t v44 = v28[42];
    uint64_t v45 = v28[37];
    uint64_t v46 = v28[38];
    uint64_t v47 = sub_25A9994C0();
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
    v48(v44, v47, v45);
    swift_bridgeObjectRetain_n();
    uint64_t v49 = sub_25A9DC828();
    os_log_type_t v50 = sub_25A9DD3E8();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v52 = v28[42];
    uint64_t v54 = v28[37];
    uint64_t v53 = v28[38];
    unint64_t v55 = v28[31];
    if (v51)
    {
      a10 = v28[30];
      a11 = v28 + 28;
      a13 = v28[42];
      OUTLINED_FUNCTION_18_0();
      a12 = v54;
      a14 = v48;
      a15 = OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_22_11(4.8751e-34);
      v28[28] = sub_25A8C10D0(a10, v55, &a15);
      sub_25A9DD508();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_21_10(&dword_25A8BB000, v56, v57, "PowerBudget: Eligible through global and app policies because device is on power so policies are disabled. bundleId: %{public}s");
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v58(a13, v54);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v58(v52, v54);
    }
    uint64_t v76 = MEMORY[0x263F8EE78];
    v28[60] = v48;
    v28[61] = v76;
    v28[59] = v58;
    if ((sub_25A8C4454() & 1) != 0 || (uint64_t v77 = *(void *)(v28[33] + 120), (v28[62] = v77) == 0))
    {
      uint64_t v82 = v28[61];
      uint64_t v83 = *(void *)(v82 + 16);
      if (v83)
      {
        OUTLINED_FUNCTION_13_15();
        uint64_t v84 = v82 + 56;
        do
        {
          OUTLINED_FUNCTION_12_13();
          OUTLINED_FUNCTION_8_20();
          swift_bridgeObjectRelease();
          v84 += 32;
          --v83;
        }
        while (v83);
        swift_bridgeObjectRelease();
        uint64_t v85 = *(void *)(v82 + 16);
        swift_bridgeObjectRelease();
        if (v85)
        {
          OUTLINED_FUNCTION_6_30();
          sub_25A9DB6A8();
          sub_25A9330B4();
          uint64_t v86 = OUTLINED_FUNCTION_4_28();
          v87(v86);
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_0_19();
    return MEMORY[0x270FA2498](v78, v79, v80);
  }
  else
  {
    uint64_t v60 = v28[30];
    uint64_t v59 = v28[31];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D3A0);
    uint64_t inited = swift_initStackObject();
    v28[44] = inited;
    *(_OWORD *)(inited + 16) = xmmword_25A9E49B0;
    *(void *)(inited + 32) = 0;
    *(void *)(inited + 40) = 0;
    *(void *)(inited + 48) = v60;
    *(void *)(inited + 56) = v59;
    v28[45] = swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v62 = (void *)swift_task_alloc();
    v28[46] = v62;
    *uint64_t v62 = v28;
    v62[1] = sub_25A9D7A40;
    OUTLINED_FUNCTION_0_19();
    return sub_25A9D7284(v63, v64, v65);
  }
}

uint64_t sub_25A9D7A40()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0();
  *uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 264);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v6 = v5;
  v9[47] = v7;
  v9[48] = v8;
  v9[49] = v10;
  v9[50] = v11;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A9D7B2C, v4, 0);
}

uint64_t sub_25A9D7B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint8_t *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_7_25();
  a27 = v29;
  a28 = v30;
  a26 = v28;
  uint64_t v31 = *(void *)(v28 + 360);
  long long v32 = *(_OWORD *)(v28 + 392);
  *(_OWORD *)(v31 + 16) = *(_OWORD *)(v28 + 376);
  *(_OWORD *)(v31 + 32) = v32;
  uint64_t v33 = *(void *)(v28 + 296);
  if (*(double *)&v32 >= 1.0)
  {
    uint64_t v52 = *(void *)(v28 + 304);
    uint64_t v53 = *(void *)(v28 + 360);
    uint64_t v54 = *(void *)(v28 + 328);
    uint64_t v55 = sub_25A9994C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v54, v55, v33);
    uint64_t v56 = sub_25A9DC828();
    os_log_type_t v57 = sub_25A9DD3E8();
    BOOL v58 = os_log_type_enabled(v56, v57);
    uint64_t v59 = *(void *)(v28 + 328);
    uint64_t v60 = *(void *)(v28 + 296);
    uint64_t v61 = *(void *)(v28 + 304);
    if (v58)
    {
      uint64_t v62 = OUTLINED_FUNCTION_18_0();
      a15 = OUTLINED_FUNCTION_6_1();
      *(_DWORD *)uint64_t v62 = 136446210;
      OUTLINED_FUNCTION_7_9();
      uint64_t v63 = *(void *)(v53 + 24);
      long long v64 = *(_OWORD *)(v53 + 32);
      *(void *)(v28 + 112) = *(void *)(v53 + 16);
      *(void *)(v28 + 120) = v63;
      *(_OWORD *)(v28 + 128) = v64;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_25A9DCFC8();
      *(void *)(v62 + 4) = sub_25A8C10D0(v65, v66, &a15);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A8BB000, v56, v57, "PowerBudget: Passed policy: state: %{public}s", (uint8_t *)v62, 0xCu);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }

    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v60);
    swift_beginAccess();
    double v76 = *(double *)(v53 + 32) + -1.0;
    *(double *)(v53 + 32) = v76;
    OUTLINED_FUNCTION_7_9();
    uint64_t v78 = *(void *)(v53 + 16);
    uint64_t v77 = *(void *)(v53 + 24);
    uint64_t v79 = *(void *)(v53 + 40);
    swift_bridgeObjectRetain();
    uint64_t v80 = (char *)MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v80 = sub_25A9D8ACC(0, *((void *)v80 + 2) + 1, 1, (uint64_t)v80);
    }
    unint64_t v82 = *((void *)v80 + 2);
    unint64_t v81 = *((void *)v80 + 3);
    if (v82 >= v81 >> 1)
    {
      BOOL v90 = OUTLINED_FUNCTION_18_14(v81);
      uint64_t v80 = sub_25A9D8ACC((char *)v90, v91, v92, (uint64_t)v80);
    }
    *(void *)(v28 + 408) = v80;
    *((void *)v80 + 2) = v82 + 1;
    uint64_t v83 = &v80[32 * v82];
    *((void *)v83 + 4) = v78;
    *((void *)v83 + 5) = v77;
    *((double *)v83 + 6) = v76;
    *((void *)v83 + 7) = v79;
    uint64_t result = swift_release();
    uint64_t v84 = *(void *)(v28 + 352);
    if (*(void *)(v84 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v28 + 416) = *(void *)(v84 + 56);
      *(void *)(v28 + 424) = swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v85 = (void *)swift_task_alloc();
      *(void *)(v28 + 432) = v85;
      void *v85 = v28;
      v85[1] = sub_25A9D8050;
      OUTLINED_FUNCTION_0_19();
      return sub_25A9D7284(v86, v87, v88);
    }
  }
  else
  {
    uint64_t v34 = *(void **)(v28 + 360);
    uint64_t v35 = *(void *)(v28 + 320);
    uint64_t v36 = *(void *)(v28 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v37 = sub_25A9994C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v37, v33);
    uint64_t v39 = v34[2];
    uint64_t v38 = v34[3];
    uint64_t v40 = v34[4];
    uint64_t v41 = v34[5];
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_25A9DC828();
    os_log_type_t v43 = sub_25A9DD418();
    BOOL v44 = os_log_type_enabled(v42, v43);
    uint64_t v45 = *(void *)(v28 + 320);
    uint64_t v47 = *(void *)(v28 + 296);
    uint64_t v46 = *(void *)(v28 + 304);
    if (v44)
    {
      a11 = v28 + 80;
      a12 = v28 + 216;
      a14 = *(void *)(v28 + 320);
      uint64_t v48 = (uint8_t *)OUTLINED_FUNCTION_18_0();
      uint64_t v49 = OUTLINED_FUNCTION_6_1();
      a13 = v47;
      *(_DWORD *)uint64_t v48 = 136446210;
      a15 = v49;
      a10 = v48 + 4;
      *(void *)(v28 + 80) = v39;
      *(void *)(v28 + 88) = v38;
      *(void *)(v28 + 96) = v40;
      *(void *)(v28 + 104) = v41;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_25A9DCFC8();
      *(void *)(v28 + 216) = sub_25A8C10D0(v50, v51, &a15);
      sub_25A9DD508();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A8BB000, v42, v43, "PowerBudget: Failed policy: state: %{public}s", v48, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(a14, v47);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    }
    swift_release();
    OUTLINED_FUNCTION_27_12();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_26_9();
    OUTLINED_FUNCTION_0_19();
    return v71(v67, v68, v69, v70, v71, v72, v73, v74, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
  }
  return result;
}

uint64_t sub_25A9D8050()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0();
  *uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 264);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_8_0();
  *uint64_t v6 = v5;
  v9[55] = v7;
  v9[56] = v8;
  v9[57] = v10;
  v9[58] = v11;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A9D813C, v4, 0);
}

uint64_t sub_25A9D813C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t *a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t, uint64_t, uint64_t), uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_7_25();
  a27 = v29;
  a28 = v30;
  a26 = v28;
  uint64_t v31 = *(void *)(v28 + 424);
  long long v32 = *(_OWORD *)(v28 + 456);
  *(_OWORD *)(v31 + 16) = *(_OWORD *)(v28 + 440);
  *(_OWORD *)(v31 + 32) = v32;
  if (*(double *)&v32 < 1.0)
  {
    uint64_t v34 = *(void *)(v28 + 416);
    uint64_t v33 = *(void **)(v28 + 424);
    uint64_t v35 = *(void *)(v28 + 320);
    uint64_t v37 = *(void *)(v28 + 296);
    uint64_t v36 = *(void *)(v28 + 304);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = sub_25A9994C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v38, v37);
    uint64_t v39 = v33[2];
    uint64_t v40 = v33[3];
    uint64_t v41 = v33[4];
    uint64_t v42 = v33[5];
    swift_bridgeObjectRetain_n();
    os_log_type_t v43 = sub_25A9DC828();
    os_log_type_t v44 = sub_25A9DD418();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = *(void *)(v28 + 320);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 296);
    uint64_t v47 = *(void *)(v28 + 304);
    if (v45)
    {
      a10 = v28 + 80;
      a11 = v28 + 216;
      a13 = *(void *)(v28 + 320);
      uint64_t v49 = (uint8_t *)OUTLINED_FUNCTION_18_0();
      a12 = v48;
      a14 = v34;
      a15 = OUTLINED_FUNCTION_6_1();
      *(_DWORD *)uint64_t v49 = 136446210;
      a9 = v49 + 4;
      *(void *)(v28 + 80) = v39;
      *(void *)(v28 + 88) = v40;
      *(void *)(v28 + 96) = v41;
      *(void *)(v28 + 104) = v42;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_25A9DCFC8();
      *(void *)(v28 + 216) = sub_25A8C10D0(v50, v51, &a15);
      sub_25A9DD508();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A8BB000, v43, v44, "PowerBudget: Failed policy: state: %{public}s", v49, 0xCu);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(uint64_t, void (*)(uint64_t, uint64_t, uint64_t)))(v47 + 8))(a13, v48);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, void (*)(uint64_t, uint64_t, uint64_t)))(v47 + 8))(v46, v48);
    }
    swift_release();
    if (!v34) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  a14 = v28 + 144;
  swift_bridgeObjectRelease();
  uint64_t v52 = *(void *)(v28 + 424);
  uint64_t v53 = *(char **)(v28 + 408);
  uint64_t v54 = *(void *)(v28 + 328);
  uint64_t v55 = *(void *)(v28 + 296);
  uint64_t v56 = *(void *)(v28 + 304);
  uint64_t v57 = sub_25A9994C0();
  BOOL v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
  v58(v54, v57, v55);
  uint64_t v59 = sub_25A9DC828();
  os_log_type_t v60 = sub_25A9DD3E8();
  BOOL v61 = os_log_type_enabled(v59, v60);
  uint64_t v62 = *(void *)(v28 + 328);
  uint64_t v63 = *(void *)(v28 + 304);
  a13 = *(void *)(v28 + 296);
  if (v61)
  {
    a9 = (uint8_t *)(v28 + 192);
    a10 = v28 + 112;
    a12 = v58;
    uint64_t v64 = OUTLINED_FUNCTION_18_0();
    a11 = v62;
    a15 = OUTLINED_FUNCTION_6_1();
    *(_DWORD *)uint64_t v64 = 136446210;
    OUTLINED_FUNCTION_7_9();
    uint64_t v65 = *(void *)(v52 + 24);
    long long v66 = *(_OWORD *)(v52 + 32);
    *(void *)(v28 + 112) = *(void *)(v52 + 16);
    *(void *)(v28 + 120) = v65;
    *(_OWORD *)(v28 + 128) = v66;
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_25A9DCFC8();
    *(void *)(v64 + 4) = sub_25A8C10D0(v67, v68, &a15);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A8BB000, v59, v60, "PowerBudget: Passed policy: state: %{public}s", (uint8_t *)v64, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    BOOL v58 = a12;
    OUTLINED_FUNCTION_7();
  }

  uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
  v69(v62, a13);
  swift_beginAccess();
  double v70 = *(double *)(v52 + 32) + -1.0;
  *(double *)(v52 + 32) = v70;
  OUTLINED_FUNCTION_7_9();
  uint64_t v72 = *(void *)(v52 + 16);
  uint64_t v71 = *(void *)(v52 + 24);
  uint64_t v73 = *(void *)(v52 + 40);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v53 = sub_25A9D8ACC(0, *((void *)v53 + 2) + 1, 1, (uint64_t)v53);
  }
  unint64_t v75 = *((void *)v53 + 2);
  unint64_t v74 = *((void *)v53 + 3);
  if (v75 >= v74 >> 1)
  {
    BOOL v96 = OUTLINED_FUNCTION_18_14(v74);
    uint64_t v53 = sub_25A9D8ACC((char *)v96, v97, v98, (uint64_t)v53);
  }
  *(void *)(v28 + 408) = v53;
  *((void *)v53 + 2) = v75 + 1;
  double v76 = &v53[32 * v75];
  *((void *)v76 + 4) = v72;
  *((void *)v76 + 5) = v71;
  *((double *)v76 + 6) = v70;
  *((void *)v76 + 7) = v73;
  swift_release();
  swift_setDeallocating();
  sub_25A9D8A88();
  *(void *)(v28 + 480) = v58;
  *(void *)(v28 + 488) = v53;
  *(void *)(v28 + 472) = v69;
  if ((sub_25A8C4454() & 1) != 0
    || (uint64_t v77 = *(void *)(*(void *)(v28 + 264) + 120), (*(void *)(v28 + 496) = v77) == 0))
  {
    uint64_t v82 = *(void *)(v28 + 488);
    uint64_t v83 = *(void *)(v82 + 16);
    if (v83)
    {
      OUTLINED_FUNCTION_13_15();
      uint64_t v84 = v82 + 56;
      do
      {
        OUTLINED_FUNCTION_12_13();
        OUTLINED_FUNCTION_8_20();
        swift_bridgeObjectRelease();
        v84 += 32;
        --v83;
      }
      while (v83);
      swift_bridgeObjectRelease();
      uint64_t v85 = *(void *)(v82 + 16);
      swift_bridgeObjectRelease();
      if (v85)
      {
        OUTLINED_FUNCTION_6_30();
        sub_25A9DB6A8();
        sub_25A9330B4();
        uint64_t v86 = OUTLINED_FUNCTION_4_28();
        v87(v86);
      }
      goto LABEL_25;
    }
LABEL_24:
    swift_bridgeObjectRelease();
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_26_9();
    OUTLINED_FUNCTION_0_19();
    return v92(v88, v89, v90, v91, v92, v93, v94, v95, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
  }
  OUTLINED_FUNCTION_0_19();
  return MEMORY[0x270FA2498](v78, v79, v80);
}

uint64_t sub_25A9D86D4()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *(void *)(v0 + 264);
  *(void *)(v0 + 504) = sub_25A8DEA44();
  *(void *)(v0 + 512) = v2;
  *(unsigned char *)(v0 + 520) = v3;
  return MEMORY[0x270FA2498](sub_25A9D8744, v1, 0);
}

uint64_t sub_25A9D8744()
{
  if (*(unsigned __int8 *)(v0 + 520) == 255)
  {
    uint64_t v14 = *(void *)(v0 + 488);
    uint64_t v15 = *(void *)(v14 + 16);
    if (v15)
    {
      OUTLINED_FUNCTION_13_15();
      uint64_t v16 = v14 + 56;
      do
      {
        OUTLINED_FUNCTION_12_13();
        OUTLINED_FUNCTION_8_20();
        swift_bridgeObjectRelease();
        v16 += 32;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease();
      if (!v12)
      {
        uint64_t v13 = 0;
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_6_30();
      sub_25A9DB6A8();
      sub_25A9330B4();
      uint64_t v17 = OUTLINED_FUNCTION_4_28();
      v18(v17);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = 0;
    uint64_t v12 = 0;
LABEL_13:
    uint64_t v11 = 255;
    goto LABEL_14;
  }
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_25A9994C0();
  v1(v2, v4, v3);
  uint64_t v5 = sub_25A9DC828();
  os_log_type_t v6 = sub_25A9DD418();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25A8BB000, v5, v6, "PowerBudget: Failed policy: PowerTracker", v7, 2u);
    OUTLINED_FUNCTION_7();
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  uint64_t v9 = *(void *)(v0 + 312);
  uint64_t v10 = *(void *)(v0 + 296);

  v8(v9, v10);
  uint64_t v11 = *(unsigned __int8 *)(v0 + 520);
  uint64_t v13 = *(void *)(v0 + 504);
  uint64_t v12 = *(void *)(v0 + 512);
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_26_9();
  return v19(v13, v12, v11);
}

uint64_t sub_25A9D8964()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25A9D899C()
{
  return sub_25A937040();
}

uint64_t sub_25A9D8A08()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_25A9D8A38()
{
  sub_25A9D8A08();
  return MEMORY[0x270FA2418](v0);
}

void sub_25A9D8A64()
{
}

void sub_25A9D8A6C()
{
}

uint64_t sub_25A9D8A88()
{
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

char *sub_25A9D8ACC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46D3B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25A937DE8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A9D8BBC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_25A9D8BBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25A9DD7F8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PowerBudget()
{
  return self;
}

uint64_t sub_25A9D8CD8(uint64_t a1, unsigned int a2)
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

uint64_t sub_25A9D8D28(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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
      return OUTLINED_FUNCTION_23_11(result, a2);
    }
  }
  return result;
}

uint64_t sub_25A9D8D78(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25A9D8D90(void *result, int a2)
{
  if (a2 < 0)
  {
    *uint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    return (void *)OUTLINED_FUNCTION_23_11((uint64_t)result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for PowerBudget.Kind()
{
}

uint64_t sub_25A9D8DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25A9D8DF0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t sub_25A9D8E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_25A9D8E90(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
      return OUTLINED_FUNCTION_68(*(_DWORD *)a1 + 2147483646);
    }
    unint64_t v3 = *(void *)(a1 + 8);
    if (v3 >= 0xFFFFFFFF) {
      LODWORD(v3) = -1;
    }
    int v4 = v3 - 1;
    if (v4 < 0) {
      return OUTLINED_FUNCTION_68(-1);
    }
  }
  else
  {
    int v4 = -1;
  }
  return OUTLINED_FUNCTION_68(v4);
}

uint64_t sub_25A9D8EE0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      return OUTLINED_FUNCTION_23_11(result, a2);
    }
  }
  return result;
}

void type metadata accessor for PowerBudget.State()
{
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25A9D8F58(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 58)) {
      return OUTLINED_FUNCTION_68(*(_DWORD *)a1 + 252);
    }
    OUTLINED_FUNCTION_28_14();
    if (v3 < 0) {
      int v3 = -1;
    }
    BOOL v4 = __OFSUB__(v3, 1);
    int v5 = v3 - 1;
    if (v5 < 0 != v4) {
      return OUTLINED_FUNCTION_68(-1);
    }
  }
  else
  {
    int v5 = -1;
  }
  return OUTLINED_FUNCTION_68(v5);
}

uint64_t sub_25A9D8FA0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 58) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 58) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 57) = a2 + 3;
    }
  }
  return result;
}

void type metadata accessor for PowerBudget.Settings()
{
}

uint64_t sub_25A9D9000(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 58)) {
      return OUTLINED_FUNCTION_68(*(_DWORD *)a1 + 253);
    }
    OUTLINED_FUNCTION_28_14();
    if (v3 < 0) {
      return OUTLINED_FUNCTION_68(-1);
    }
  }
  else
  {
    int v3 = -1;
  }
  return OUTLINED_FUNCTION_68(v3);
}

uint64_t sub_25A9D9040(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 58) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 58) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 57) = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for PowerBudget.Settings.Overrides()
{
}

uint64_t OUTLINED_FUNCTION_5_29()
{
  *(void *)(v1 + 112) = v3;
  *(void *)(v1 + 120) = v2;
  long long v4 = v0[1];
  *(_OWORD *)(v1 + 128) = *v0;
  *(_OWORD *)(v1 + 144) = v4;
  *(_OWORD *)(v1 + 160) = v0[2];
  *(_OWORD *)(v1 + 170) = *(_OWORD *)((char *)v0 + 42);
  return v1;
}

void OUTLINED_FUNCTION_8_20()
{
  sub_25A932DF4();
}

uint64_t OUTLINED_FUNCTION_12_13()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_15()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_18_14@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_21_10(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23_11@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_12()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_29_8()
{
  return v0;
}

uint64_t PSUINMessageReactionTypeTapbackLikedReaction()
{
  return *MEMORY[0x263F10268];
}

uint64_t PSUINMessageReactionTypeTapbackDislikedReaction()
{
  return *MEMORY[0x263F10248];
}

uint64_t PSUINMessageReactionTypeTapbackEmphasizedReaction()
{
  return *MEMORY[0x263F10250];
}

uint64_t PSUINMessageReactionTypeTapbackLovedReaction()
{
  return *MEMORY[0x263F10270];
}

uint64_t PSUINMessageReactionTypeTapbackLaughedReaction()
{
  return *MEMORY[0x263F10260];
}

uint64_t PSUINMessageReactionTypeTapbackQuestionedReaction()
{
  return *MEMORY[0x263F10278];
}

id PSUMailAttachmentSpotlightPrefix()
{
  return (id)*MEMORY[0x263F3B1B0];
}

id PSUMailRichLinkSpotlightPrefix()
{
  return (id)*MEMORY[0x263F3B1B8];
}

void sub_25A9D9600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_25A9DA724(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A9DA8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

id PSUSummarizationLogging()
{
  if (PSUSummarizationLogging__pasOnceToken2 != -1) {
    dispatch_once(&PSUSummarizationLogging__pasOnceToken2, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)PSUSummarizationLogging__pasExprOnceResult;
  return v0;
}

void __PSUSummarizationLogging_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x26114B190]();
  os_log_t v1 = os_log_create("com.apple.suggestions", "summarization");
  uint64_t v2 = (void *)PSUSummarizationLogging__pasExprOnceResult;
  PSUSummarizationLogging__pasExprOnceResult = (uint64_t)v1;
}

void sub_25A9DAD34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A9DAE74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A9DAFC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getDNDModeConfigurationServiceClass_block_invoke(uint64_t a1)
{
  if (!DoNotDisturbLibraryCore_frameworkLibrary) {
    DoNotDisturbLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("DNDModeConfigurationService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDNDModeConfigurationServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DoNotDisturbLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DoNotDisturbLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t sub_25A9DB2F8()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_25A9DB308()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25A9DB318()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25A9DB328()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25A9DB338()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25A9DB348()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25A9DB358()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25A9DB368()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25A9DB378()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25A9DB388()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25A9DB398()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25A9DB3A8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25A9DB3B8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25A9DB3C8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25A9DB3D8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25A9DB3E8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25A9DB3F8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25A9DB408()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25A9DB418()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_25A9DB428()
{
  return MEMORY[0x270EEEAC0]();
}

uint64_t sub_25A9DB438()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_25A9DB448()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25A9DB478()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_25A9DB488()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_25A9DB498()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_25A9DB4A8()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_25A9DB4B8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_25A9DB508()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_25A9DB538()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25A9DB548()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A9DB558()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_25A9DB568()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25A9DB578()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25A9DB588()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25A9DB598()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25A9DB5A8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25A9DB5B8()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25A9DB5C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25A9DB5D8()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25A9DB5E8()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25A9DB608()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25A9DB618()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25A9DB628()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25A9DB638()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_25A9DB648()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25A9DB658()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25A9DB668()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25A9DB678()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_25A9DB688()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25A9DB698()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25A9DB6A8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25A9DB6B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25A9DB6C8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25A9DB6D8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25A9DB6E8()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_25A9DB6F8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25A9DB708()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25A9DB718()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25A9DB728()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25A9DB738()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25A9DB748()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25A9DB758()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25A9DB768()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25A9DB778()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25A9DB788()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25A9DB798()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25A9DB7A8()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_25A9DB7B8()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_25A9DB7C8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25A9DB7D8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25A9DB7E8()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25A9DB7F8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25A9DB808()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25A9DB818()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_25A9DB828()
{
  return MEMORY[0x270EF1508]();
}

uint64_t sub_25A9DB838()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_25A9DB848()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25A9DB858()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25A9DB868()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25A9DB888()
{
  return MEMORY[0x270F28810]();
}

uint64_t sub_25A9DB898()
{
  return MEMORY[0x270F28850]();
}

uint64_t sub_25A9DB8B8()
{
  return MEMORY[0x270F288A8]();
}

uint64_t sub_25A9DB8C8()
{
  return MEMORY[0x270F28900]();
}

uint64_t sub_25A9DB8D8()
{
  return MEMORY[0x270F28918]();
}

uint64_t sub_25A9DB8E8()
{
  return MEMORY[0x270F28930]();
}

uint64_t sub_25A9DB908()
{
  return MEMORY[0x270F289D8]();
}

uint64_t sub_25A9DB918()
{
  return MEMORY[0x270F28A20]();
}

uint64_t sub_25A9DB928()
{
  return MEMORY[0x270F28A50]();
}

uint64_t sub_25A9DB938()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_25A9DB948()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_25A9DB958()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_25A9DB968()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_25A9DB978()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_25A9DB988()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_25A9DB998()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_25A9DB9A8()
{
  return MEMORY[0x270F4C180]();
}

uint64_t sub_25A9DB9B8()
{
  return MEMORY[0x270F4C188]();
}

uint64_t sub_25A9DB9C8()
{
  return MEMORY[0x270F4C1E0]();
}

uint64_t sub_25A9DB9D8()
{
  return MEMORY[0x270F4C1E8]();
}

uint64_t sub_25A9DB9E8()
{
  return MEMORY[0x270F4C1F8]();
}

uint64_t sub_25A9DB9F8()
{
  return MEMORY[0x270F4C200]();
}

uint64_t sub_25A9DBA08()
{
  return MEMORY[0x270F4C208]();
}

uint64_t sub_25A9DBA18()
{
  return MEMORY[0x270F4C210]();
}

uint64_t sub_25A9DBA28()
{
  return MEMORY[0x270FA16B0]();
}

uint64_t sub_25A9DBA38()
{
  return MEMORY[0x270FA1708]();
}

uint64_t sub_25A9DBA48()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_25A9DBA58()
{
  return MEMORY[0x270FA1840]();
}

uint64_t sub_25A9DBA68()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_25A9DBA78()
{
  return MEMORY[0x270FA18D0]();
}

uint64_t sub_25A9DBA88()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_25A9DBA98()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25A9DBAA8()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_25A9DBAB8()
{
  return MEMORY[0x270F57888]();
}

uint64_t sub_25A9DBAC8()
{
  return MEMORY[0x270F578A0]();
}

uint64_t sub_25A9DBAD8()
{
  return MEMORY[0x270F578A8]();
}

uint64_t sub_25A9DBAE8()
{
  return MEMORY[0x270F578B0]();
}

uint64_t sub_25A9DBAF8()
{
  return MEMORY[0x270F578B8]();
}

uint64_t sub_25A9DBB08()
{
  return MEMORY[0x270F578C0]();
}

uint64_t sub_25A9DBB18()
{
  return MEMORY[0x270F578C8]();
}

uint64_t sub_25A9DBB28()
{
  return MEMORY[0x270F578D0]();
}

uint64_t sub_25A9DBB38()
{
  return MEMORY[0x270F578D8]();
}

uint64_t sub_25A9DBB48()
{
  return MEMORY[0x270F578E0]();
}

uint64_t sub_25A9DBB58()
{
  return MEMORY[0x270F578E8]();
}

uint64_t sub_25A9DBB68()
{
  return MEMORY[0x270F578F0]();
}

uint64_t sub_25A9DBB78()
{
  return MEMORY[0x270F578F8]();
}

uint64_t sub_25A9DBB88()
{
  return MEMORY[0x270F57900]();
}

uint64_t sub_25A9DBB98()
{
  return MEMORY[0x270F57908]();
}

uint64_t sub_25A9DBBA8()
{
  return MEMORY[0x270F57910]();
}

uint64_t sub_25A9DBBB8()
{
  return MEMORY[0x270F57918]();
}

uint64_t sub_25A9DBBC8()
{
  return MEMORY[0x270F57920]();
}

uint64_t sub_25A9DBBD8()
{
  return MEMORY[0x270F57928]();
}

uint64_t sub_25A9DBBE8()
{
  return MEMORY[0x270F57930]();
}

uint64_t sub_25A9DBBF8()
{
  return MEMORY[0x270F57938]();
}

uint64_t sub_25A9DBC18()
{
  return MEMORY[0x270F57948]();
}

uint64_t sub_25A9DBC28()
{
  return MEMORY[0x270F57950]();
}

uint64_t sub_25A9DBC38()
{
  return MEMORY[0x270F57958]();
}

uint64_t sub_25A9DBC48()
{
  return MEMORY[0x270F57960]();
}

uint64_t sub_25A9DBC58()
{
  return MEMORY[0x270F57968]();
}

uint64_t sub_25A9DBC68()
{
  return MEMORY[0x270F57970]();
}

uint64_t sub_25A9DBC78()
{
  return MEMORY[0x270F57990]();
}

uint64_t sub_25A9DBC88()
{
  return MEMORY[0x270F57998]();
}

uint64_t sub_25A9DBC98()
{
  return MEMORY[0x270F579A0]();
}

uint64_t sub_25A9DBCA8()
{
  return MEMORY[0x270F579A8]();
}

uint64_t sub_25A9DBCB8()
{
  return MEMORY[0x270F579B0]();
}

uint64_t sub_25A9DBCC8()
{
  return MEMORY[0x270F579B8]();
}

uint64_t sub_25A9DBCD8()
{
  return MEMORY[0x270F579C0]();
}

uint64_t sub_25A9DBCE8()
{
  return MEMORY[0x270F579C8]();
}

uint64_t sub_25A9DBCF8()
{
  return MEMORY[0x270F579D0]();
}

uint64_t sub_25A9DBD08()
{
  return MEMORY[0x270F579D8]();
}

uint64_t sub_25A9DBD18()
{
  return MEMORY[0x270F579E0]();
}

uint64_t sub_25A9DBD28()
{
  return MEMORY[0x270F579E8]();
}

uint64_t sub_25A9DBD38()
{
  return MEMORY[0x270F579F0]();
}

uint64_t sub_25A9DBD48()
{
  return MEMORY[0x270F579F8]();
}

uint64_t sub_25A9DBD58()
{
  return MEMORY[0x270F57A00]();
}

uint64_t sub_25A9DBD68()
{
  return MEMORY[0x270F57A08]();
}

uint64_t sub_25A9DBD78()
{
  return MEMORY[0x270F57A10]();
}

uint64_t sub_25A9DBD88()
{
  return MEMORY[0x270F57A18]();
}

uint64_t sub_25A9DBD98()
{
  return MEMORY[0x270F57A20]();
}

uint64_t sub_25A9DBDA8()
{
  return MEMORY[0x270F57A28]();
}

uint64_t sub_25A9DBDB8()
{
  return MEMORY[0x270F57A30]();
}

uint64_t sub_25A9DBDC8()
{
  return MEMORY[0x270F57A38]();
}

uint64_t sub_25A9DBDD8()
{
  return MEMORY[0x270F57A40]();
}

uint64_t sub_25A9DBDE8()
{
  return MEMORY[0x270F57A48]();
}

uint64_t sub_25A9DBDF8()
{
  return MEMORY[0x270F57A50]();
}

uint64_t sub_25A9DBE08()
{
  return MEMORY[0x270F57A58]();
}

uint64_t sub_25A9DBE18()
{
  return MEMORY[0x270F57A60]();
}

uint64_t sub_25A9DBE28()
{
  return MEMORY[0x270F57A68]();
}

uint64_t sub_25A9DBE38()
{
  return MEMORY[0x270F57A70]();
}

uint64_t sub_25A9DBE48()
{
  return MEMORY[0x270F57A78]();
}

uint64_t sub_25A9DBE58()
{
  return MEMORY[0x270F57A80]();
}

uint64_t sub_25A9DBE68()
{
  return MEMORY[0x270F57A88]();
}

uint64_t sub_25A9DBE78()
{
  return MEMORY[0x270F57A90]();
}

uint64_t sub_25A9DBE88()
{
  return MEMORY[0x270F57A98]();
}

uint64_t sub_25A9DBE98()
{
  return MEMORY[0x270F57AA0]();
}

uint64_t sub_25A9DBEA8()
{
  return MEMORY[0x270F57AA8]();
}

uint64_t sub_25A9DBEB8()
{
  return MEMORY[0x270F57AB0]();
}

uint64_t sub_25A9DBEC8()
{
  return MEMORY[0x270F57AB8]();
}

uint64_t sub_25A9DBED8()
{
  return MEMORY[0x270F57AC0]();
}

uint64_t sub_25A9DBEE8()
{
  return MEMORY[0x270F57AC8]();
}

uint64_t sub_25A9DBEF8()
{
  return MEMORY[0x270F57AD0]();
}

uint64_t sub_25A9DBF08()
{
  return MEMORY[0x270F57AD8]();
}

uint64_t sub_25A9DBF18()
{
  return MEMORY[0x270F57AE0]();
}

uint64_t sub_25A9DBF28()
{
  return MEMORY[0x270F57AE8]();
}

uint64_t sub_25A9DBF38()
{
  return MEMORY[0x270F57AF0]();
}

uint64_t sub_25A9DBF48()
{
  return MEMORY[0x270F57AF8]();
}

uint64_t sub_25A9DBF58()
{
  return MEMORY[0x270F57B00]();
}

uint64_t sub_25A9DBF68()
{
  return MEMORY[0x270F57B08]();
}

uint64_t sub_25A9DBF78()
{
  return MEMORY[0x270F57B10]();
}

uint64_t sub_25A9DBF88()
{
  return MEMORY[0x270F57B18]();
}

uint64_t sub_25A9DBF98()
{
  return MEMORY[0x270F57B20]();
}

uint64_t sub_25A9DBFA8()
{
  return MEMORY[0x270F57B28]();
}

uint64_t sub_25A9DBFB8()
{
  return MEMORY[0x270F57B30]();
}

uint64_t sub_25A9DBFC8()
{
  return MEMORY[0x270F57B38]();
}

uint64_t sub_25A9DBFD8()
{
  return MEMORY[0x270F57B40]();
}

uint64_t sub_25A9DBFE8()
{
  return MEMORY[0x270F57B48]();
}

uint64_t sub_25A9DBFF8()
{
  return MEMORY[0x270F57B50]();
}

uint64_t sub_25A9DC008()
{
  return MEMORY[0x270F57B58]();
}

uint64_t sub_25A9DC018()
{
  return MEMORY[0x270F57B60]();
}

uint64_t sub_25A9DC028()
{
  return MEMORY[0x270F57B68]();
}

uint64_t sub_25A9DC038()
{
  return MEMORY[0x270F57B70]();
}

uint64_t sub_25A9DC048()
{
  return MEMORY[0x270F57B78]();
}

uint64_t sub_25A9DC058()
{
  return MEMORY[0x270F57B80]();
}

uint64_t sub_25A9DC068()
{
  return MEMORY[0x270F57B88]();
}

uint64_t sub_25A9DC078()
{
  return MEMORY[0x270F57B90]();
}

uint64_t sub_25A9DC088()
{
  return MEMORY[0x270F57B98]();
}

uint64_t sub_25A9DC098()
{
  return MEMORY[0x270F57BA0]();
}

uint64_t sub_25A9DC0A8()
{
  return MEMORY[0x270F57BA8]();
}

uint64_t sub_25A9DC0B8()
{
  return MEMORY[0x270F57BB0]();
}

uint64_t sub_25A9DC0C8()
{
  return MEMORY[0x270F57BB8]();
}

uint64_t sub_25A9DC0D8()
{
  return MEMORY[0x270F57BC0]();
}

uint64_t sub_25A9DC0E8()
{
  return MEMORY[0x270F57BC8]();
}

uint64_t sub_25A9DC0F8()
{
  return MEMORY[0x270F57BD0]();
}

uint64_t sub_25A9DC108()
{
  return MEMORY[0x270F57BD8]();
}

uint64_t sub_25A9DC118()
{
  return MEMORY[0x270F57BE0]();
}

uint64_t sub_25A9DC128()
{
  return MEMORY[0x270F57BE8]();
}

uint64_t sub_25A9DC138()
{
  return MEMORY[0x270F57BF0]();
}

uint64_t sub_25A9DC148()
{
  return MEMORY[0x270F57BF8]();
}

uint64_t sub_25A9DC158()
{
  return MEMORY[0x270F57C00]();
}

uint64_t sub_25A9DC168()
{
  return MEMORY[0x270F57C08]();
}

uint64_t sub_25A9DC178()
{
  return MEMORY[0x270F57C10]();
}

uint64_t sub_25A9DC188()
{
  return MEMORY[0x270F57C18]();
}

uint64_t sub_25A9DC198()
{
  return MEMORY[0x270F57C20]();
}

uint64_t sub_25A9DC1A8()
{
  return MEMORY[0x270F57C28]();
}

uint64_t sub_25A9DC1B8()
{
  return MEMORY[0x270F57C30]();
}

uint64_t sub_25A9DC1C8()
{
  return MEMORY[0x270F57C38]();
}

uint64_t sub_25A9DC1D8()
{
  return MEMORY[0x270F57C40]();
}

uint64_t sub_25A9DC1E8()
{
  return MEMORY[0x270F57C48]();
}

uint64_t sub_25A9DC1F8()
{
  return MEMORY[0x270F57C50]();
}

uint64_t sub_25A9DC208()
{
  return MEMORY[0x270F57C58]();
}

uint64_t sub_25A9DC218()
{
  return MEMORY[0x270F57C60]();
}

uint64_t sub_25A9DC228()
{
  return MEMORY[0x270F57C68]();
}

uint64_t sub_25A9DC238()
{
  return MEMORY[0x270F57C70]();
}

uint64_t sub_25A9DC248()
{
  return MEMORY[0x270F57C78]();
}

uint64_t sub_25A9DC258()
{
  return MEMORY[0x270F57C80]();
}

uint64_t sub_25A9DC268()
{
  return MEMORY[0x270F57C88]();
}

uint64_t sub_25A9DC278()
{
  return MEMORY[0x270F57C90]();
}

uint64_t sub_25A9DC288()
{
  return MEMORY[0x270F57C98]();
}

uint64_t sub_25A9DC298()
{
  return MEMORY[0x270F57CA0]();
}

uint64_t sub_25A9DC2A8()
{
  return MEMORY[0x270F57CA8]();
}

uint64_t sub_25A9DC2B8()
{
  return MEMORY[0x270F57CB0]();
}

uint64_t sub_25A9DC2C8()
{
  return MEMORY[0x270F57CB8]();
}

uint64_t sub_25A9DC2D8()
{
  return MEMORY[0x270F57CC0]();
}

uint64_t sub_25A9DC2E8()
{
  return MEMORY[0x270F57CC8]();
}

uint64_t sub_25A9DC2F8()
{
  return MEMORY[0x270F57CD0]();
}

uint64_t sub_25A9DC308()
{
  return MEMORY[0x270F57CD8]();
}

uint64_t sub_25A9DC318()
{
  return MEMORY[0x270F57CE0]();
}

uint64_t sub_25A9DC328()
{
  return MEMORY[0x270F57CE8]();
}

uint64_t sub_25A9DC338()
{
  return MEMORY[0x270F57CF0]();
}

uint64_t sub_25A9DC348()
{
  return MEMORY[0x270F57CF8]();
}

uint64_t sub_25A9DC358()
{
  return MEMORY[0x270F57D00]();
}

uint64_t sub_25A9DC368()
{
  return MEMORY[0x270F57D08]();
}

uint64_t sub_25A9DC378()
{
  return MEMORY[0x270F57D10]();
}

uint64_t sub_25A9DC388()
{
  return MEMORY[0x270F57D18]();
}

uint64_t sub_25A9DC398()
{
  return MEMORY[0x270F57D20]();
}

uint64_t sub_25A9DC3A8()
{
  return MEMORY[0x270F57D28]();
}

uint64_t sub_25A9DC3B8()
{
  return MEMORY[0x270F57D30]();
}

uint64_t sub_25A9DC3C8()
{
  return MEMORY[0x270F57D38]();
}

uint64_t sub_25A9DC3D8()
{
  return MEMORY[0x270F57D40]();
}

uint64_t sub_25A9DC3E8()
{
  return MEMORY[0x270F57D48]();
}

uint64_t sub_25A9DC3F8()
{
  return MEMORY[0x270F57D50]();
}

uint64_t sub_25A9DC408()
{
  return MEMORY[0x270F57D58]();
}

uint64_t sub_25A9DC418()
{
  return MEMORY[0x270F57D60]();
}

uint64_t sub_25A9DC428()
{
  return MEMORY[0x270F57D68]();
}

uint64_t sub_25A9DC438()
{
  return MEMORY[0x270F57D70]();
}

uint64_t sub_25A9DC448()
{
  return MEMORY[0x270F57D78]();
}

uint64_t sub_25A9DC458()
{
  return MEMORY[0x270F57D88]();
}

uint64_t sub_25A9DC468()
{
  return MEMORY[0x270F57DA0]();
}

uint64_t sub_25A9DC478()
{
  return MEMORY[0x270F57DC0]();
}

uint64_t sub_25A9DC488()
{
  return MEMORY[0x270F57DC8]();
}

uint64_t sub_25A9DC498()
{
  return MEMORY[0x270F57DD0]();
}

uint64_t sub_25A9DC4A8()
{
  return MEMORY[0x270F57DD8]();
}

uint64_t sub_25A9DC4B8()
{
  return MEMORY[0x270F57DE0]();
}

uint64_t sub_25A9DC4C8()
{
  return MEMORY[0x270F57DE8]();
}

uint64_t sub_25A9DC4D8()
{
  return MEMORY[0x270F57DF0]();
}

uint64_t sub_25A9DC4E8()
{
  return MEMORY[0x270F57DF8]();
}

uint64_t sub_25A9DC4F8()
{
  return MEMORY[0x270F57E00]();
}

uint64_t sub_25A9DC508()
{
  return MEMORY[0x270F57E08]();
}

uint64_t sub_25A9DC518()
{
  return MEMORY[0x270F57E10]();
}

uint64_t sub_25A9DC528()
{
  return MEMORY[0x270F57E18]();
}

uint64_t sub_25A9DC538()
{
  return MEMORY[0x270F57E20]();
}

uint64_t sub_25A9DC548()
{
  return MEMORY[0x270F57E28]();
}

uint64_t sub_25A9DC558()
{
  return MEMORY[0x270F57E30]();
}

uint64_t sub_25A9DC568()
{
  return MEMORY[0x270F57E38]();
}

uint64_t sub_25A9DC578()
{
  return MEMORY[0x270F57E40]();
}

uint64_t sub_25A9DC588()
{
  return MEMORY[0x270F57E48]();
}

uint64_t sub_25A9DC598()
{
  return MEMORY[0x270F57E50]();
}

uint64_t sub_25A9DC5A8()
{
  return MEMORY[0x270F57E58]();
}

uint64_t sub_25A9DC5B8()
{
  return MEMORY[0x270F57E60]();
}

uint64_t sub_25A9DC5C8()
{
  return MEMORY[0x270F57E68]();
}

uint64_t sub_25A9DC5D8()
{
  return MEMORY[0x270F57E70]();
}

uint64_t sub_25A9DC5E8()
{
  return MEMORY[0x270F57E78]();
}

uint64_t sub_25A9DC5F8()
{
  return MEMORY[0x270F57E80]();
}

uint64_t sub_25A9DC608()
{
  return MEMORY[0x270F57E88]();
}

uint64_t sub_25A9DC618()
{
  return MEMORY[0x270F57E90]();
}

uint64_t sub_25A9DC628()
{
  return MEMORY[0x270F57E98]();
}

uint64_t sub_25A9DC638()
{
  return MEMORY[0x270F57EA0]();
}

uint64_t sub_25A9DC648()
{
  return MEMORY[0x270F57EA8]();
}

uint64_t sub_25A9DC658()
{
  return MEMORY[0x270F57EB0]();
}

uint64_t sub_25A9DC668()
{
  return MEMORY[0x270F57EB8]();
}

uint64_t sub_25A9DC678()
{
  return MEMORY[0x270F57EC0]();
}

uint64_t sub_25A9DC688()
{
  return MEMORY[0x270F57EC8]();
}

uint64_t sub_25A9DC698()
{
  return MEMORY[0x270F57ED0]();
}

uint64_t sub_25A9DC6A8()
{
  return MEMORY[0x270F57ED8]();
}

uint64_t sub_25A9DC6B8()
{
  return MEMORY[0x270F57EE0]();
}

uint64_t sub_25A9DC6C8()
{
  return MEMORY[0x270F57EE8]();
}

uint64_t sub_25A9DC6D8()
{
  return MEMORY[0x270F57EF0]();
}

uint64_t sub_25A9DC6E8()
{
  return MEMORY[0x270F57EF8]();
}

uint64_t sub_25A9DC6F8()
{
  return MEMORY[0x270F57F00]();
}

uint64_t sub_25A9DC708()
{
  return MEMORY[0x270F57F08]();
}

uint64_t sub_25A9DC718()
{
  return MEMORY[0x270F57F10]();
}

uint64_t sub_25A9DC728()
{
  return MEMORY[0x270F57F18]();
}

uint64_t sub_25A9DC738()
{
  return MEMORY[0x270F57F20]();
}

uint64_t sub_25A9DC748()
{
  return MEMORY[0x270F57F28]();
}

uint64_t sub_25A9DC758()
{
  return MEMORY[0x270F57F30]();
}

uint64_t sub_25A9DC768()
{
  return MEMORY[0x270F57F38]();
}

uint64_t sub_25A9DC778()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25A9DC788()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25A9DC798()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25A9DC7A8()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25A9DC7B8()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25A9DC7C8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25A9DC7D8()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_25A9DC7E8()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_25A9DC7F8()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_25A9DC808()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_25A9DC818()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_25A9DC828()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A9DC838()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A9DC848()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A9DC858()
{
  return MEMORY[0x270FA1BB0]();
}

uint64_t sub_25A9DC868()
{
  return MEMORY[0x270FA1BC8]();
}

uint64_t sub_25A9DC878()
{
  return MEMORY[0x270FA1BF0]();
}

uint64_t sub_25A9DC888()
{
  return MEMORY[0x270FA1C38]();
}

uint64_t sub_25A9DC898()
{
  return MEMORY[0x270FA1C60]();
}

uint64_t sub_25A9DC8A8()
{
  return MEMORY[0x270FA1D38]();
}

uint64_t sub_25A9DC8B8()
{
  return MEMORY[0x270FA1D68]();
}

uint64_t sub_25A9DC8C8()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t sub_25A9DC8D8()
{
  return MEMORY[0x270FA1D98]();
}

uint64_t sub_25A9DC8E8()
{
  return MEMORY[0x270F5C3A8]();
}

uint64_t sub_25A9DC8F8()
{
  return MEMORY[0x270F5C3B8]();
}

uint64_t sub_25A9DC908()
{
  return MEMORY[0x270F5C3F8]();
}

uint64_t sub_25A9DC918()
{
  return MEMORY[0x270F5C400]();
}

uint64_t sub_25A9DC928()
{
  return MEMORY[0x270F5C408]();
}

uint64_t sub_25A9DC938()
{
  return MEMORY[0x270F5C410]();
}

uint64_t sub_25A9DC948()
{
  return MEMORY[0x270F5C438]();
}

uint64_t sub_25A9DC958()
{
  return MEMORY[0x270F5C440]();
}

uint64_t sub_25A9DC968()
{
  return MEMORY[0x270F5C468]();
}

uint64_t sub_25A9DC978()
{
  return MEMORY[0x270F5C478]();
}

uint64_t sub_25A9DC988()
{
  return MEMORY[0x270F5C4E8]();
}

uint64_t sub_25A9DC998()
{
  return MEMORY[0x270F5C4F0]();
}

uint64_t sub_25A9DC9A8()
{
  return MEMORY[0x270F5C528]();
}

uint64_t sub_25A9DC9B8()
{
  return MEMORY[0x270F5C530]();
}

uint64_t sub_25A9DC9C8()
{
  return MEMORY[0x270F5C538]();
}

uint64_t sub_25A9DC9D8()
{
  return MEMORY[0x270F5C540]();
}

uint64_t sub_25A9DC9E8()
{
  return MEMORY[0x270F5C558]();
}

uint64_t sub_25A9DCA08()
{
  return MEMORY[0x270F5C568]();
}

uint64_t sub_25A9DCA18()
{
  return MEMORY[0x270F5C580]();
}

uint64_t sub_25A9DCA28()
{
  return MEMORY[0x270F5C590]();
}

uint64_t sub_25A9DCA38()
{
  return MEMORY[0x270F5C598]();
}

uint64_t sub_25A9DCA48()
{
  return MEMORY[0x270F5C5A8]();
}

uint64_t sub_25A9DCA58()
{
  return MEMORY[0x270F5C5B0]();
}

uint64_t sub_25A9DCA68()
{
  return MEMORY[0x270F5C5B8]();
}

uint64_t sub_25A9DCA78()
{
  return MEMORY[0x270F5C5C0]();
}

uint64_t sub_25A9DCA88()
{
  return MEMORY[0x270F5C5C8]();
}

uint64_t sub_25A9DCA98()
{
  return MEMORY[0x270F5C5D0]();
}

uint64_t sub_25A9DCAA8()
{
  return MEMORY[0x270F5C5E8]();
}

uint64_t sub_25A9DCAB8()
{
  return MEMORY[0x270F5C608]();
}

uint64_t sub_25A9DCAC8()
{
  return MEMORY[0x270F5C610]();
}

uint64_t sub_25A9DCAD8()
{
  return MEMORY[0x270F5C618]();
}

uint64_t sub_25A9DCAE8()
{
  return MEMORY[0x270F5C620]();
}

uint64_t sub_25A9DCAF8()
{
  return MEMORY[0x270F5C630]();
}

uint64_t sub_25A9DCB08()
{
  return MEMORY[0x270F5C638]();
}

uint64_t sub_25A9DCB18()
{
  return MEMORY[0x270F5C660]();
}

uint64_t sub_25A9DCB28()
{
  return MEMORY[0x270F5C668]();
}

uint64_t sub_25A9DCB38()
{
  return MEMORY[0x270F5C680]();
}

uint64_t sub_25A9DCB48()
{
  return MEMORY[0x270F5C690]();
}

uint64_t sub_25A9DCB58()
{
  return MEMORY[0x270F5C6A0]();
}

uint64_t sub_25A9DCB68()
{
  return MEMORY[0x270F5C6D8]();
}

uint64_t sub_25A9DCB78()
{
  return MEMORY[0x270F5C6E0]();
}

uint64_t sub_25A9DCB88()
{
  return MEMORY[0x270F5C738]();
}

uint64_t sub_25A9DCBF8()
{
  return MEMORY[0x270F5C780]();
}

uint64_t sub_25A9DCC08()
{
  return MEMORY[0x270F5C788]();
}

uint64_t sub_25A9DCC18()
{
  return MEMORY[0x270F5C7A8]();
}

uint64_t sub_25A9DCC58()
{
  return MEMORY[0x270F5C7D8]();
}

uint64_t sub_25A9DCC68()
{
  return MEMORY[0x270F5C7E0]();
}

uint64_t sub_25A9DCC78()
{
  return MEMORY[0x270F5C7E8]();
}

uint64_t sub_25A9DCC88()
{
  return MEMORY[0x270F5C820]();
}

uint64_t sub_25A9DCC98()
{
  return MEMORY[0x270F5C828]();
}

uint64_t sub_25A9DCCA8()
{
  return MEMORY[0x270F5C830]();
}

uint64_t sub_25A9DCCB8()
{
  return MEMORY[0x270F5C838]();
}

uint64_t sub_25A9DCCC8()
{
  return MEMORY[0x270F5C840]();
}

uint64_t sub_25A9DCCD8()
{
  return MEMORY[0x270F5C848]();
}

uint64_t sub_25A9DCCE8()
{
  return MEMORY[0x270F5C850]();
}

uint64_t sub_25A9DCCF8()
{
  return MEMORY[0x270F5C938]();
}

uint64_t sub_25A9DCD08()
{
  return MEMORY[0x270F5C948]();
}

uint64_t sub_25A9DCD18()
{
  return MEMORY[0x270F5C950]();
}

uint64_t sub_25A9DCD28()
{
  return MEMORY[0x270F5C958]();
}

uint64_t sub_25A9DCD38()
{
  return MEMORY[0x270F5C960]();
}

uint64_t sub_25A9DCD48()
{
  return MEMORY[0x270F5C968]();
}

uint64_t sub_25A9DCD58()
{
  return MEMORY[0x270F5C970]();
}

uint64_t sub_25A9DCD68()
{
  return MEMORY[0x270F5C998]();
}

uint64_t sub_25A9DCD78()
{
  return MEMORY[0x270F5C9A0]();
}

uint64_t sub_25A9DCD88()
{
  return MEMORY[0x270F5CA68]();
}

uint64_t sub_25A9DCD98()
{
  return MEMORY[0x270F5CA70]();
}

uint64_t sub_25A9DCDA8()
{
  return MEMORY[0x270F5CA90]();
}

uint64_t sub_25A9DCDB8()
{
  return MEMORY[0x270F5CAD0]();
}

uint64_t sub_25A9DCDC8()
{
  return MEMORY[0x270F5CAE0]();
}

uint64_t sub_25A9DCDD8()
{
  return MEMORY[0x270F5CAF0]();
}

uint64_t sub_25A9DCDE8()
{
  return MEMORY[0x270F5CB08]();
}

uint64_t sub_25A9DCDF8()
{
  return MEMORY[0x270F5CB18]();
}

uint64_t sub_25A9DCE08()
{
  return MEMORY[0x270F5CB28]();
}

uint64_t sub_25A9DCE18()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25A9DCE28()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A9DCE38()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A9DCE48()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_25A9DCE58()
{
  return MEMORY[0x270EEAAA0]();
}

uint64_t sub_25A9DCE68()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_25A9DCE78()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_25A9DCE88()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_25A9DCE98()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_25A9DCEA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25A9DCEB8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25A9DCEC8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25A9DCED8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A9DCEE8()
{
  return MEMORY[0x270FA2B58]();
}

uint64_t sub_25A9DCEF8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A9DCF08()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25A9DCF18()
{
  return MEMORY[0x270F9D508]();
}

uint64_t sub_25A9DCF28()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A9DCF38()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_25A9DCF48()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A9DCF58()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25A9DCF68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A9DCF78()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25A9DCF88()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25A9DCF98()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25A9DCFA8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25A9DCFB8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25A9DCFC8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A9DCFD8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25A9DCFE8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25A9DCFF8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25A9DD008()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_25A9DD018()
{
  return MEMORY[0x270F57F40]();
}

uint64_t sub_25A9DD028()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A9DD038()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25A9DD048()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25A9DD058()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25A9DD068()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A9DD078()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A9DD088()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25A9DD098()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_25A9DD0A8()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_25A9DD0B8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25A9DD0C8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25A9DD0D8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25A9DD0E8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25A9DD0F8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25A9DD138()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25A9DD148()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25A9DD158()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25A9DD168()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25A9DD178()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25A9DD188()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25A9DD198()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25A9DD1A8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25A9DD1B8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25A9DD1C8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A9DD1D8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25A9DD1E8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_25A9DD1F8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25A9DD208()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_25A9DD218()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25A9DD228()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25A9DD238()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A9DD248()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25A9DD258()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25A9DD268()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_25A9DD298()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_25A9DD2A8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_25A9DD2B8()
{
  return MEMORY[0x270FA1EE8]();
}

uint64_t sub_25A9DD2C8()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_25A9DD2D8()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_25A9DD2E8()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_25A9DD2F8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A9DD308()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A9DD318()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25A9DD338()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25A9DD348()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25A9DD358()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25A9DD368()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25A9DD378()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25A9DD388()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_25A9DD398()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25A9DD3A8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25A9DD3B8()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_25A9DD3C8()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25A9DD3D8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A9DD3E8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A9DD3F8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A9DD408()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25A9DD418()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A9DD428()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_25A9DD438()
{
  return MEMORY[0x270EF1F88]();
}

uint64_t sub_25A9DD448()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25A9DD458()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25A9DD468()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25A9DD478()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25A9DD488()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_25A9DD498()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25A9DD4A8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25A9DD4B8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25A9DD4C8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_25A9DD4D8()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_25A9DD4E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A9DD4F8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25A9DD508()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A9DD518()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A9DD528()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25A9DD538()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25A9DD548()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25A9DD558()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25A9DD568()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25A9DD578()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_25A9DD588()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A9DD598()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_25A9DD5A8()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_25A9DD5B8()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_25A9DD5C8()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_25A9DD5D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A9DD5E8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A9DD5F8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25A9DD608()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25A9DD618()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25A9DD628()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A9DD638()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A9DD648()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25A9DD658()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A9DD668()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A9DD678()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25A9DD688()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25A9DD698()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25A9DD6A8()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_25A9DD6B8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_25A9DD6C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A9DD6E8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25A9DD6F8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25A9DD708()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25A9DD718()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25A9DD728()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25A9DD738()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25A9DD748()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25A9DD758()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25A9DD768()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25A9DD778()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A9DD788()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25A9DD798()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25A9DD7A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A9DD7C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25A9DD7D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A9DD7E8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A9DD7F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A9DD808()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A9DD818()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25A9DD828()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25A9DD838()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25A9DD858()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25A9DD878()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25A9DD888()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25A9DD898()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25A9DD8A8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25A9DD8B8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25A9DD8C8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25A9DD8D8()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25A9DD8E8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25A9DD8F8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25A9DD948()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25A9DD958()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25A9DD978()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25A9DD988()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25A9DD998()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25A9DD9A8()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_25A9DD9B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A9DD9D8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25A9DD9E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A9DDA28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A9DDA38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A9DDA48()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25A9DDA88()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25A9DDA98()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A9DDAA8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A9DDAB8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A9DDAC8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A9DDAD8()
{
  return MEMORY[0x270EF2710]();
}

uint64_t sub_25A9DDAE8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A9DDAF8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A9DDB08()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A9DDB18()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25A9DDB28()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25A9DDB38()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_25A9DDB68()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x270EF4930]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x270F55168]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x270F55170]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PASKeepOnlyCharacterSet()
{
  return MEMORY[0x270F57F88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
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