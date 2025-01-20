double sub_25BC77F9C@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *a2;
  v7 = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_25BC97E48(v4, v5, v6, v7))
  {
    *(void *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    *(void *)(a3 + 24) = &unk_270952440;
    *(void *)(a3 + 32) = &off_270952458;
  }
  return result;
}

char *sub_25BC78020(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void (*v32)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t, unint64_t);
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t inited;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  void v57[5];
  uint64_t v58[4];
  uint64_t v59;

  v59 = a1;
  v52 = sub_25BCA1420();
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_10();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_25BCA1480();
  MEMORY[0x270FA5388](v20 - 8);
  OUTLINED_FUNCTION_10();
  uint64_t v23 = v22 - v21;
  v55 = a6;
  sub_25BC7A97C(a6, (uint64_t)v58, &qword_26B34B688);
  v54 = a7;
  sub_25BC7A97C(a7, (uint64_t)v57, &qword_26B34BF50);
  id v24 = objc_allocWithZone((Class)type metadata accessor for SASafariAssistantAssetManager());
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_25BC7DA18(a8);
  v25 = sub_25BC7D4DC(a3, a4, v59, a2, (uint64_t)v58, (uint64_t)v57, a8, a9, v24);
  v26 = *(void **)&v25[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_activityMonitor];
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v19, *MEMORY[0x263F5D0A0], v52);
  v27 = v25;
  swift_retain();
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  swift_allocObject();
  uint64_t v28 = sub_25BC9696C(v26, 38, v23, 0, 1);
  uint64_t v29 = v28;
  if ((v27[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_shouldReportAnalytics] & 1) == 0) {
    *(unsigned char *)(v28 + qword_26A554C38) = 1;
  }
  unint64_t v30 = *(void *)(a4 + 40);
  if (!v30)
  {

    swift_bridgeObjectRelease();
    *(unsigned char *)(v29 + qword_26A554C30) = 79;
    sub_25BC96FE8();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    v33 = sub_25BCA1510();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B34BF78);
    v34 = sub_25BCA14F0();
    v35 = sub_25BCA17E0();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_25BC76000, v34, v35, "SafariSummarizationPrefetch - Missing countryCode, unable to subscribe to AssetProvider", v36, 2u);
      MEMORY[0x261174A10](v36, -1, -1);
    }

    sub_25BCA15A0();
    OUTLINED_FUNCTION_27();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554628);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25BCA2560;
    *(void *)(inited + 32) = sub_25BCA15A0();
    *(void *)(inited + 40) = v38;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD000000000000039;
    *(void *)(inited + 56) = 0x800000025BCA4770;
    v39 = sub_25BCA1560();
    v40 = objc_allocWithZone(MEMORY[0x263F087E8]);
    v41 = OUTLINED_FUNCTION_13();
    v43 = 1;
    goto LABEL_17;
  }
  uint64_t v31 = *(void *)(a4 + 32);
  v32 = *(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t, unint64_t))&v27[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler];
  swift_bridgeObjectRetain();
  swift_retain();

  v32(v58, v31, v30, v59, a2);
  swift_release();
  if (!v58[3])
  {
    sub_25BC7E0F0((uint64_t)v58, &qword_26A554630);
    *(unsigned char *)(v29 + qword_26A554C30) = 94;
    sub_25BC96FE8();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    v44 = sub_25BCA1510();
    __swift_project_value_buffer(v44, (uint64_t)qword_26B34BF78);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v45 = sub_25BCA14F0();
    v53 = sub_25BCA17E0();
    if (os_log_type_enabled(v45, v53))
    {
      v46 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      v58[0] = v51;
      *(_DWORD *)v46 = 136643075;
      swift_bridgeObjectRetain();
      v57[0] = sub_25BC9E6B4(v31, v30, v58);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v46 + 12) = 2085;
      swift_bridgeObjectRetain();
      v57[0] = sub_25BC9E6B4(v59, a2, v58);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25BC76000, v45, v53, "SafariSummarizationPrefetch - Unsupported countryCode: %{sensitive}s and locale: %{sensitive}s", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v51, -1, -1);
      MEMORY[0x261174A10](v46, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_25BCA15A0();
    OUTLINED_FUNCTION_27();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554628);
    v47 = swift_initStackObject();
    *(_OWORD *)(v47 + 16) = xmmword_25BCA2560;
    *(void *)(v47 + 32) = sub_25BCA15A0();
    *(void *)(v47 + 40) = v48;
    *(void *)(v47 + 72) = MEMORY[0x263F8D310];
    *(void *)(v47 + 48) = 0xD000000000000025;
    *(void *)(v47 + 56) = 0x800000025BCA47B0;
    v39 = sub_25BCA1560();
    v49 = objc_allocWithZone(MEMORY[0x263F087E8]);
    v41 = OUTLINED_FUNCTION_13();
    v43 = 2;
LABEL_17:
    sub_25BC7AB54(v41, v42, v43, v39);
    swift_willThrow();

    swift_release();
    OUTLINED_FUNCTION_24();
    swift_unknownObjectRelease();
    sub_25BC7E0F0(v54, &qword_26B34BF50);
    sub_25BC7E0F0(v55, &qword_26B34B688);
    return v27;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25BC7E0F0((uint64_t)v58, &qword_26A554630);
  *(unsigned char *)(v29 + qword_26A554C30) = 78;
  sub_25BC96FE8();
  swift_release();
  OUTLINED_FUNCTION_24();
  swift_unknownObjectRelease();
  sub_25BC7E0F0(v54, &qword_26B34BF50);
  sub_25BC7E0F0(v55, &qword_26B34B688);
  return v27;
}

uint64_t sub_25BC787F4(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC78810);
}

uint64_t sub_25BC78810()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(v0 + 160);
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v6 = *(void *)(v2 + 32);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                   + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    swift_bridgeObjectRetain();
    swift_retain();
    v7(v6, v3, v5, v4);
    swift_release();
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 80))
    {
      uint64_t v8 = *(void *)(v0 + 176);
      sub_25BC7DABC((long long *)(v0 + 56), v0 + 16);
      uint64_t v9 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      *(void *)(v0 + 184) = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      v10 = (void *)(v8 + v9);
      OUTLINED_FUNCTION_11();
      uint64_t v11 = *__swift_project_boxed_opaque_existential_1(v10, v10[3]);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      *(void *)(v0 + 120) = &unk_270952440;
      *(void *)(v0 + 128) = &off_270952458;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), (uint64_t)&unk_270952440);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
      *(void *)(v11 + 96) = sub_25BC834F4();
      swift_unknownObjectRelease();
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
      v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v12;
      void *v12 = v0;
      v12[1] = sub_25BC78AA8;
      return sub_25BC821C8();
    }
    sub_25BC7E0F0(v0 + 56, &qword_26A554630);
  }
  else
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25BCA1510();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B34BF78);
    uint64_t v15 = (void *)sub_25BCA14F0();
    os_log_type_t v16 = sub_25BCA17E0();
    if (OUTLINED_FUNCTION_20(v16))
    {
      uint64_t v17 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v17);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v18, v19, "SafariSummarizationPrefetch - Missing countryCode, unable to subscribe to AssetProvider");
      OUTLINED_FUNCTION_7();
    }
  }
  OUTLINED_FUNCTION_5();
  return v20();
}

uint64_t sub_25BC78AA8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1 + 96;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v2);
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25BC78B7C()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_23(*(void *)(v1 + 184));
  uint64_t v2 = (void *)OUTLINED_FUNCTION_22();
  *(void *)(v1 + 200) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25BC78C1C;
  return v4(v0);
}

uint64_t sub_25BC78C1C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25BC78CE4()
{
  OUTLINED_FUNCTION_4();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_5();
  return v1();
}

uint64_t sub_25BC78D5C(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_25BCA15A0();
  uint64_t v7 = v6;
  v3[4] = v6;
  a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25BC7E43C;
  return sub_25BC787F4(v5, v7);
}

uint64_t sub_25BC78E30(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554678);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25BCA1780();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_26A554688;
  v8[5] = v7;
  sub_25BC7AD9C((uint64_t)v5, (uint64_t)&unk_26A554698, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_25BC78F34(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC78F50);
}

void sub_25BC78F50()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  unint64_t v3 = *(void *)(v2 + 40);
  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v5 = *(void *)(v0 + 144);
    uint64_t v7 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v1
                                                                            + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    swift_bridgeObjectRetain();
    swift_retain();
    v7(v4, v3, v6, v5);
    swift_release();
    if (*(void *)(v0 + 80))
    {
      uint64_t v8 = *(void *)(v0 + 152);
      sub_25BC7DABC((long long *)(v0 + 56), v0 + 16);
      uint64_t v9 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      *(void *)(v0 + 160) = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      uint64_t v10 = (void *)(v8 + v9);
      OUTLINED_FUNCTION_11();
      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      OUTLINED_FUNCTION_25();
      if ((sub_25BC7B8E0() & 1) == 0)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_25();
        uint64_t v23 = (void *)swift_task_alloc();
        *(void *)(v0 + 168) = v23;
        *uint64_t v23 = v0;
        v23[1] = sub_25BC7938C;
        OUTLINED_FUNCTION_12();
        __asm { BR              X1 }
      }
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_25BCA1510();
      __swift_project_value_buffer(v11, (uint64_t)qword_26B34BF78);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v12 = sub_25BCA14F0();
      os_log_type_t v13 = sub_25BCA1800();
      BOOL v14 = os_log_type_enabled(v12, v13);
      unint64_t v15 = *(void *)(v0 + 144);
      if (v14)
      {
        uint64_t v28 = *(void *)(v0 + 136);
        uint64_t v16 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136643075;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 120) = sub_25BC9E6B4(v4, v3, &v29);
        sub_25BCA1880();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v16 + 12) = 2085;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 128) = sub_25BC9E6B4(v28, v15, &v29);
        sub_25BCA1880();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25BC76000, v12, v13, "SafariSummarizationPrefetch - Asset already downloaded, skip triggering force download of asset with countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_25BC7E0F0(v0 + 56, &qword_26A554630);
    }
  }
  else
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25BCA1510();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B34BF78);
    uint64_t v18 = (void *)sub_25BCA14F0();
    os_log_type_t v19 = sub_25BCA17E0();
    if (OUTLINED_FUNCTION_20(v19))
    {
      uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v20);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v21, v22, "SafariSummarizationPrefetch - Missing countryCode, unable to call forceDownloadAssetsIfNeeded");
      OUTLINED_FUNCTION_7();
    }
  }
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_25BC7938C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25BC79454()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_23(*(void *)(v1 + 160));
  uint64_t v2 = (void *)OUTLINED_FUNCTION_22();
  *(void *)(v1 + 176) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25BC794F4;
  return v4(v0);
}

uint64_t sub_25BC794F4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25BC795DC(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = OUTLINED_FUNCTION_13();
  return sub_25BC78E30(v10, v11);
}

uint64_t sub_25BC7965C(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_25BCA15A0();
  uint64_t v7 = v6;
  v3[4] = v6;
  a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *id v8 = v3;
  v8[1] = sub_25BC79730;
  return sub_25BC78F34(v5, v7);
}

uint64_t sub_25BC79730()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *(void (***)(void))(v1 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v2[2](v2);
  _Block_release(v2);
  OUTLINED_FUNCTION_5();
  return v6();
}

id sub_25BC79858(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554648);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_10();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_25BCA11F0();
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10();
  uint64_t v14 = v13 - v12;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8();
  uint64_t v15 = sub_25BC9B2B4(a1, a2);
  if (!v16) {
    goto LABEL_4;
  }
  uint64_t v17 = v15;
  uint64_t v18 = v16;
  sub_25BCA11E0();
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {
    swift_bridgeObjectRelease();
    sub_25BC7E0F0(v7, &qword_26A554648);
LABEL_4:
    id v19 = objc_allocWithZone((Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel());
    return sub_25BC7A660(0, 0, 0);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v14, v7, v8);
  uint64_t v21 = sub_25BCA11A0();
  char v23 = 0;
  if (v21)
  {
    uint64_t v22 = *(void *)(v21 + 16);
    swift_bridgeObjectRelease();
    if (v22) {
      char v23 = 1;
    }
  }
  id v24 = objc_allocWithZone((Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel());
  id v20 = sub_25BC7A660(v17, v18, v23);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  return v20;
}

uint64_t sub_25BC79B28(uint64_t a1, unint64_t a2)
{
  id v2 = objc_msgSend(sub_25BC79858(a1, a2), sel_prefilterUrl);
  swift_unknownObjectRelease();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25BCA15A0();

  return v3;
}

uint64_t sub_25BC79C3C()
{
  *(void *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC79C54);
}

uint64_t sub_25BC79C54()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25BC79CFC;
  return sub_25BC8187C();
}

uint64_t sub_25BC79CFC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *id v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v3();
}

uint64_t sub_25BC79E38(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BC79EE0;
  return sub_25BC79C3C();
}

uint64_t sub_25BC79EE0()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  id v2 = *(void (***)(void))(v1 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  OUTLINED_FUNCTION_5();
  return v6();
}

void sub_25BC79FE4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8();
  sub_25BC81DD4();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter);
  OUTLINED_FUNCTION_11();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_25BC98CC4();
}

uint64_t sub_25BC7A0A0(uint64_t a1, uint64_t a2)
{
  void (*v10)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _WORD *v15;
  long long v17;
  uint64_t v18;
  void v19[5];

  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  uint64_t v5 = *(void *)(v4 + 40);
  if (v5)
  {
    uint64_t v8 = *(void *)(v4 + 32);
    uint64_t v10 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                                            + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v10(&v17, v8, v5, a1, a2);
    swift_bridgeObjectRelease();
    swift_release();
    if (v18)
    {
      sub_25BC7DABC(&v17, (uint64_t)v19);
      uint64_t v11 = (void *)(v3 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider);
      OUTLINED_FUNCTION_11();
      __swift_project_boxed_opaque_existential_1(v11, v11[3]);
      __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      sub_25BC7C6B4();
      OUTLINED_FUNCTION_27();
      sub_25BC7DD64((uint64_t)v19, (uint64_t)&v17);
      if (!v9)
      {
        __swift_project_boxed_opaque_existential_1(v11, v11[3]);
        __swift_project_boxed_opaque_existential_1(&v17, v18);
        sub_25BC7CB2C();
        OUTLINED_FUNCTION_27();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    }
    else
    {
      sub_25BC7E0F0((uint64_t)&v17, &qword_26A554630);
    }
  }
  else
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25BCA1510();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B34BF78);
    uint64_t v13 = sub_25BCA14F0();
    uint64_t v14 = sub_25BCA17E0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v15);
      _os_log_impl(&dword_25BC76000, v13, v14, "SafariSummarizationPrefetch - Missing countryCode, unable to get Asset Version", 0, 2u);
      OUTLINED_FUNCTION_7();
    }
  }
  return OUTLINED_FUNCTION_13();
}

uint64_t sub_25BC7A34C()
{
  *(void *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC7A364);
}

uint64_t sub_25BC7A364()
{
  OUTLINED_FUNCTION_9();
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25BCA1510();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B34BF78);
  uint64_t v2 = (void *)sub_25BCA14F0();
  os_log_type_t v3 = sub_25BCA17C0();
  if (OUTLINED_FUNCTION_20(v3))
  {
    uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v4);
    OUTLINED_FUNCTION_14(&dword_25BC76000, v5, v6, "SafariSummarizationPrefetch - Loading data for filter");
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25BC79CFC;
  return sub_25BC98E64();
}

void sub_25BC7A49C()
{
}

id sub_25BC7A4DC()
{
  return sub_25BC7A708(type metadata accessor for SASafariAssistantAssetManager);
}

uint64_t type metadata accessor for SASafariAssistantAssetManager()
{
  return self;
}

uint64_t sub_25BC7A5F0()
{
  return OUTLINED_FUNCTION_13();
}

uint64_t sub_25BC7A650()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_hasMatchedPattern);
}

id sub_25BC7A660(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_prefilterUrl];
  *uint64_t v4 = a1;
  v4[1] = a2;
  v3[OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_hasMatchedPattern] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel();
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_25BC7A6B0()
{
}

id sub_25BC7A6F0()
{
  return sub_25BC7A708(type metadata accessor for PrefilterSafariSummarizationPrefetchModel);
}

id sub_25BC7A708(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for PrefilterSafariSummarizationPrefetchModel()
{
  return self;
}

uint64_t sub_25BC7A778(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25BC7A7C4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC7A7E4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_cond_t(uint64_t a1)
{
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_25BC7A844(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC7A864(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_mutex_t(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for SABuildType(uint64_t a1)
{
}

void type metadata accessor for SATreatmentAllocStatus(uint64_t a1)
{
}

void sub_25BC7A8F0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
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

uint64_t sub_25BC7A97C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v4 = OUTLINED_FUNCTION_13();
  v5(v4);
  return a2;
}

uint64_t sub_25BC7A9DC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRetain();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = 0;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25BC7AA24(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = 0;
  return v1;
}

void *sub_25BC7AA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_25BC7DC24(a1, a2);
  objc_super v6 = (_DWORD *)swift_slowAlloc();
  v3[5] = v6;
  *objc_super v6 = 0;
  sub_25BC7DC68(a1, a2);
  return v3;
}

uint64_t sub_25BC7AAB8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_retain();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = 0;
  swift_release();
  return v1;
}

uint64_t sub_25BC7AB00(char a1)
{
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(v1 + 16) = Lock.init()();
  *(unsigned char *)(v1 + 24) = a1;
  return v1;
}

id sub_25BC7AB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_25BCA1530();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_25BC7AC04(uint64_t a1, uint64_t a2, int *a3)
{
  objc_super v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_25BC7E44C;
  return v6();
}

uint64_t sub_25BC7ACD0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25BC7E44C;
  return v7();
}

uint64_t sub_25BC7AD9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BCA1780();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25BC7E0F0(a1, &qword_26A554678);
  }
  else
  {
    sub_25BCA1770();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BCA1730();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25BC7AF0C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BC7AFE8;
  return v6(a1);
}

uint64_t sub_25BC7AFE8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v3();
}

unint64_t sub_25BC7B0AC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x261174A20](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x261174A20](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25BC7B138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v20 = type metadata accessor for SASafariAssistantAssetProvider();
  uint64_t v21 = &off_270951AB0;
  *(void *)&long long v19 = a5;
  *(void *)(a10 + 24) = 0;
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34BF28);
  swift_allocObject();
  *(void *)(a10 + 136) = sub_25BC7AA24(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34BF10);
  swift_allocObject();
  *(void *)(a10 + 152) = sub_25BC7AA54(0, 0, 0);
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34BE88);
  swift_allocObject();
  *(void *)(a10 + 160) = sub_25BC7AB00(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34BF30);
  swift_allocObject();
  *(void *)(a10 + 168) = sub_25BC7AAB8(0);
  *(void *)(a10 + 32) = a1;
  *(void *)(a10 + 40) = a2;
  *(void *)(a10 + 48) = a3;
  *(void *)(a10 + 56) = a4;
  sub_25BC7DABC(&v19, a10 + 64);
  *(void *)(a10 + 144) = 0;
  *(unsigned char *)(a10 + 128) = a7;
  *(void *)(a10 + 104) = a6;
  *(void *)(a10 + 112) = a8;
  *(void *)(a10 + 120) = a9;
  return a10;
}

uint64_t sub_25BC7B298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9)
{
  uint64_t v23 = a8;
  uint64_t v25 = type metadata accessor for SASafariAssistantAssetProvider();
  v26 = &off_270951AB0;
  v24[0] = a5;
  type metadata accessor for SASafariAssistantPrefetchRequestFilter();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x270FA5388](v17);
  long long v19 = (void *)((char *)&v24[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = sub_25BC7B138(a1, a2, a3, a4, *v19, a6, a7, v23, a9, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v21;
}

uint64_t sub_25BC7B404(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_25BCA1510();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[5] = &unk_270952440;
  v1[6] = &off_270952458;
  return MEMORY[0x270FA2498](sub_25BC7B4D8, 0, 0);
}

uint64_t sub_25BC7B4D8()
{
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(v0 + 2, (uint64_t)&unk_270952440);
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  unint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_25BC7B584;
  return sub_25BC84098();
}

uint64_t sub_25BC7B584()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_18();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v3 + 16);
    swift_task_dealloc();
    OUTLINED_FUNCTION_5();
    return v9();
  }
}

void sub_25BC7B694()
{
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 88), (uint64_t)qword_26B34BF78);
  uint64_t v1 = OUTLINED_FUNCTION_17();
  v2(v1);
  uint64_t v3 = sub_25BCA14F0();
  os_log_type_t v4 = sub_25BCA17E0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v7 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 88);
  if (v5)
  {
    id v23 = *(id *)(v0 + 120);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315651;
    *(void *)(v0 + 56) = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v24);
    uint64_t v10 = sub_25BCA1880();
    *(_WORD *)(v9 + 12) = 2085;
    *(void *)(v0 + 64) = OUTLINED_FUNCTION_6(v10, v11, v12, v13);
    uint64_t v14 = sub_25BCA1880();
    *(_WORD *)(v9 + 22) = 2085;
    *(void *)(v0 + 72) = OUTLINED_FUNCTION_6(v14, v15, v16, v17);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v3, v4, "SafariSummarizationPrefetch - Failed to update loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  else
  {

    uint64_t v18 = OUTLINED_FUNCTION_16();
    v20(v18, v19);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_25BC7B8E0()
{
  uint64_t v0 = sub_25BCA1510();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  os_log_type_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v31 - v5;
  v36 = &unk_270952440;
  v37 = &off_270952458;
  __swift_project_boxed_opaque_existential_1(v35, (uint64_t)&unk_270952440);
  swift_beginAccess();
  swift_retain();
  uint64_t v7 = sub_25BC98424();
  swift_release();
  uint64_t v8 = sub_25BC98758(v7);
  swift_bridgeObjectRelease();
  if (v8
    && (__swift_project_boxed_opaque_existential_1(v35, (uint64_t)v36),
        uint64_t v9 = sub_25BC9875C(v8),
        swift_bridgeObjectRelease(),
        v9))
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v10, v0);
    id v11 = v9;
    uint64_t v12 = sub_25BCA14F0();
    os_log_type_t v13 = sub_25BCA1800();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v32 = v0;
      uint64_t v14 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v34 = v31;
      *(_DWORD *)uint64_t v14 = 136315907;
      id v15 = objc_msgSend(v11, sel_metadata);
      uint64_t v16 = sub_25BCA1540();

      if (qword_26A554370 != -1) {
        swift_once();
      }
      uint64_t v17 = qword_26A554E28;
      uint64_t v18 = unk_26A554E30;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_25BC987A4(v17, v18, v16);
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21) {
        uint64_t v22 = v19;
      }
      else {
        uint64_t v22 = 1701736302;
      }
      if (!v21) {
        unint64_t v21 = 0xE400000000000000;
      }
      uint64_t v33 = sub_25BC9E6B4(v22, v21, &v34);
      sub_25BCA1880();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v33 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v34);
      sub_25BCA1880();
      *(_WORD *)(v14 + 22) = 2085;
      uint64_t v33 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v34);
      sub_25BCA1880();
      *(_WORD *)(v14 + 32) = 2085;
      uint64_t v33 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v34);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v12, v13, "SafariSummarizationPrefetch - Has loadedAssets version %s, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v14, 0x2Au);
      uint64_t v23 = v31;
      swift_arrayDestroy();
      MEMORY[0x261174A10](v23, -1, -1);
      MEMORY[0x261174A10](v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    }
    uint64_t v29 = 1;
  }
  else
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v24, v0);
    uint64_t v25 = sub_25BCA14F0();
    os_log_type_t v26 = sub_25BCA1800();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v34 = v28;
      *(_DWORD *)uint64_t v27 = 136315651;
      uint64_t v33 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v34);
      sub_25BCA1880();
      *(_WORD *)(v27 + 12) = 2085;
      uint64_t v33 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v34);
      sub_25BCA1880();
      *(_WORD *)(v27 + 22) = 2085;
      uint64_t v33 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v34);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v25, v26, "SafariSummarizationPrefetch - No loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v28, -1, -1);
      MEMORY[0x261174A10](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    uint64_t v29 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return v29;
}

uint64_t sub_25BC7BF60(void *a1)
{
  v1[17] = a1;
  v1[18] = *a1;
  uint64_t v2 = sub_25BCA1520();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  uint64_t v3 = sub_25BCA1510();
  v1[22] = v3;
  v1[23] = *(void *)(v3 - 8);
  v1[24] = swift_task_alloc();
  v1[5] = &unk_270952440;
  v1[6] = &off_270952458;
  return MEMORY[0x270FA2498](sub_25BC7C0B8, 0, 0);
}

void sub_25BC7C0B8()
{
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[22], (uint64_t)qword_26B34BF78);
  uint64_t v1 = OUTLINED_FUNCTION_17();
  v2(v1);
  uint64_t v3 = sub_25BCA14F0();
  os_log_type_t v4 = sub_25BCA1800();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[23];
  if (v5)
  {
    uint64_t v32 = v0[24];
    uint64_t v33 = v0[22];
    uint64_t v7 = swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136316163;
    v0[12] = sub_25BC9E6B4(0xD000000000000011, 0x800000025BCA4840, v34);
    sub_25BCA1880();
    *(_WORD *)(v7 + 12) = 2080;
    v0[13] = sub_25BC9E6B4(0xD000000000000018, 0x800000025BCA4590, v34);
    uint64_t v8 = sub_25BCA1880();
    *(_WORD *)(v7 + 22) = 2085;
    v0[14] = OUTLINED_FUNCTION_6(v8, v9, v10, v11);
    uint64_t v12 = sub_25BCA1880();
    *(_WORD *)(v7 + 32) = 2085;
    v0[15] = OUTLINED_FUNCTION_6(v12, v13, v14, v15);
    sub_25BCA1880();
    *(_WORD *)(v7 + 42) = 2080;
    v0[16] = sub_25BC9E6B4(0xD00000000000001DLL, 0x800000025BCA4860, v34);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v3, v4, "SafariSummarizationPrefetch - Attempting to asynchronously retrieve assets on-demand, for subscriberName: %s, subscriptionName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s, assetName: %s", (uint8_t *)v7, 0x34u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v32, v33);
  }
  else
  {

    uint64_t v16 = OUTLINED_FUNCTION_16();
    v18(v16, v17);
  }
  uint64_t v19 = v0[17];
  if (!*(void *)(v19 + 96))
  {
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_25();
    *(void *)(v19 + 96) = sub_25BC834F4();
    swift_unknownObjectRelease();
    uint64_t v19 = v0[17];
  }
  uint64_t v21 = v0[20];
  uint64_t v20 = v0[21];
  uint64_t v23 = v0[18];
  uint64_t v22 = v0[19];
  sub_25BC7DD64(v19 + 40, (uint64_t)(v0 + 7));
  uint64_t v24 = v0[10];
  uint64_t v25 = v0[11];
  os_log_type_t v26 = (void *)OUTLINED_FUNCTION_16();
  __swift_project_boxed_opaque_existential_1(v26, v27);
  sub_25BC7DDC8();
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v20, *MEMORY[0x263F8F060], v22);
  v0[25] = sub_25BCA1810();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  uint64_t v28 = swift_allocObject();
  v0[26] = v28;
  *(void *)(v28 + 16) = v23;
  uint64_t v29 = (void *)swift_task_alloc();
  v0[27] = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_25BC7C534;
  v34[12] = v24;
  v34[13] = v25;
  OUTLINED_FUNCTION_12();
  __asm { BRAA            X9, X16 }
}

uint64_t sub_25BC7C534()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *(void **)(v1 + 200);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1();
  *os_log_type_t v4 = v3;
  swift_task_dealloc();
  swift_release();

  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25BC7C630()
{
  OUTLINED_FUNCTION_9();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v1();
}

uint64_t sub_25BC7C6B4()
{
  uint64_t v0 = sub_25BCA1510();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = &unk_270952440;
  uint64_t v28 = &off_270952458;
  __swift_project_boxed_opaque_existential_1(v26, (uint64_t)&unk_270952440);
  swift_beginAccess();
  swift_retain();
  uint64_t v4 = sub_25BC98424();
  swift_release();
  uint64_t v5 = sub_25BC98758(v4);
  swift_bridgeObjectRelease();
  if (v5
    && (__swift_project_boxed_opaque_existential_1(v26, (uint64_t)v27),
        uint64_t v6 = sub_25BC9875C(v5),
        swift_bridgeObjectRelease(),
        v6))
  {
    id v7 = objc_msgSend(v6, sel_metadata);
    uint64_t v8 = sub_25BCA1540();

    if (qword_26A554370 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_26A554E28;
    uint64_t v10 = unk_26A554E30;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25BC987A4(v9, v10, v8);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13)
    {
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      uint64_t v14 = __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v14, v0);
      swift_bridgeObjectRetain_n();
      uint64_t v15 = sub_25BCA14F0();
      os_log_type_t v16 = sub_25BCA1800();
      int v17 = v16;
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v18 = swift_slowAlloc();
        HIDWORD(v22) = v17;
        uint64_t v19 = v18;
        uint64_t v23 = swift_slowAlloc();
        uint64_t v25 = v23;
        *(_DWORD *)uint64_t v19 = 136315907;
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_25BC9E6B4(v11, v13, &v25);
        sub_25BCA1880();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        uint64_t v24 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v25);
        sub_25BCA1880();
        *(_WORD *)(v19 + 22) = 2085;
        uint64_t v24 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v25);
        sub_25BCA1880();
        *(_WORD *)(v19 + 32) = 2085;
        uint64_t v24 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v25);
        sub_25BCA1880();
        _os_log_impl(&dword_25BC76000, v15, BYTE4(v22), "SafariSummarizationPrefetch - Has loadedAssets version %s, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v19, 0x2Au);
        uint64_t v20 = v23;
        swift_arrayDestroy();
        MEMORY[0x261174A10](v20, -1, -1);
        MEMORY[0x261174A10](v19, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    else
    {

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v11;
}

uint64_t sub_25BC7CB2C()
{
  uint64_t v0 = sub_25BCA1510();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)&v33 - v6;
  MEMORY[0x270FA5388](v5);
  v38 = &unk_270952440;
  v39 = &off_270952458;
  if (qword_26A554360 != -1) {
    swift_once();
  }
  __swift_project_boxed_opaque_existential_1(v37, (uint64_t)&unk_270952440);
  swift_beginAccess();
  uint64_t v8 = sub_25BC98758(qword_26A554888);
  if (v8)
  {
    uint64_t v9 = v8;
    __swift_project_boxed_opaque_existential_1(v37, (uint64_t)v38);
    uint64_t v10 = sub_25BC988B4(v9);
    uint64_t v12 = v11;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_22;
    }
  }
  else
  {
    swift_endAccess();
  }
  __swift_project_boxed_opaque_existential_1(v37, (uint64_t)v38);
  __swift_project_boxed_opaque_existential_1(v37, (uint64_t)v38);
  id v13 = (id)sub_25BC8599C(0);
  id v14 = objc_msgSend(v13, sel_metadata);
  uint64_t v15 = sub_25BCA1540();

  if (qword_26A554370 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26A554E28;
  uint64_t v17 = unk_26A554E30;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25BC987A4(v16, v17, v15);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19)
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v7, v20, v0);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_25BCA14F0();
    os_log_type_t v22 = sub_25BCA1800();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v36[0] = v33;
      *(_DWORD *)uint64_t v23 = 136315907;
      id v34 = v13;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25BC9E6B4(v10, v19, v36);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v35 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, v36);
      sub_25BCA1880();
      *(_WORD *)(v23 + 22) = 2085;
      uint64_t v35 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v36);
      sub_25BCA1880();
      *(_WORD *)(v23 + 32) = 2085;
      uint64_t v35 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v36);
      id v13 = v34;
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v21, v22, "SafariSummarizationPrefetch - Caching downloadedAssets version %s, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v23, 0x2Au);
      uint64_t v24 = v33;
      swift_arrayDestroy();
      MEMORY[0x261174A10](v24, -1, -1);
      MEMORY[0x261174A10](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v7, v0);
    __swift_project_boxed_opaque_existential_1(v37, (uint64_t)v38);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554638);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25BCA2560;
    __swift_project_boxed_opaque_existential_1(v37, (uint64_t)v38);
    *(void *)(inited + 32) = v10;
    *(void *)(inited + 40) = v19;
    sub_25BC7DCF0();
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_25BCA1560();
    swift_beginAccess();
    sub_25BC97670(v31);
    swift_endAccess();
  }
  else
  {

    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v25, v0);
    os_log_type_t v26 = sub_25BCA14F0();
    os_log_type_t v27 = sub_25BCA1800();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v36[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315651;
      id v34 = v13;
      uint64_t v35 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, v36);
      sub_25BCA1880();
      *(_WORD *)(v28 + 12) = 2085;
      uint64_t v35 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v36);
      sub_25BCA1880();
      *(_WORD *)(v28 + 22) = 2085;
      uint64_t v35 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v36);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v26, v27, "SafariSummarizationPrefetch - No downloadedAssets version, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v29, -1, -1);
      MEMORY[0x261174A10](v28, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    uint64_t v10 = 0;
  }
LABEL_22:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  return v10;
}

char *sub_25BC7D4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v63 = a7;
  uint64_t v60 = a4;
  uint64_t v57 = a3;
  uint64_t v14 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_shouldReportAnalytics;
  uint64_t v15 = a9;
  unint64_t v16 = sub_25BC7B0AC(0x3E8uLL);
  uint64_t v56 = v14;
  *((unsigned char *)a9 + v14) = v16 == 0;
  *(void *)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_activityMonitor] = a1;
  uint64_t v17 = &v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext];
  *(void *)uint64_t v17 = a2;
  *((void *)v17 + 1) = &off_2709517A8;
  uint64_t v62 = a5;
  sub_25BC7A97C(a5, (uint64_t)&v65, &qword_26B34B688);
  uint64_t v18 = a8;
  if (v66)
  {
    sub_25BC7DABC(&v65, (uint64_t)&v67);
    swift_retain();
    uint64_t v19 = a2;
    swift_retain();
  }
  else
  {
    swift_retain_n();
    uint64_t v19 = a2;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B34BF68);
    sub_25BC7DA70();
    uint64_t v20 = sub_25BCA1560();
    uint64_t v21 = type metadata accessor for SASafariAssistantAssetProvider();
    swift_allocObject();
    os_log_type_t v22 = sub_25BC815FC(a1, v20, v16 == 0);
    uint64_t v68 = v21;
    v69 = &off_270951AB0;
    *(void *)&long long v67 = v22;
    sub_25BC7E0F0((uint64_t)&v65, &qword_26B34B688);
  }
  uint64_t v23 = (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider];
  sub_25BC7DABC(&v67, (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider]);
  if (v63)
  {
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v63;
    *(void *)(v24 + 24) = v18;
    uint64_t v25 = sub_25BC7DBEC;
  }
  else
  {
    uint64_t v25 = sub_25BC77F9C;
    uint64_t v24 = 0;
  }
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  *(void *)(v26 + 24) = v24;
  os_log_type_t v27 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler];
  void *v27 = sub_25BC7DB0C;
  v27[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26;
  sub_25BC7A97C(a6, (uint64_t)&v65, &qword_26B34BF50);
  uint64_t v61 = a6;
  uint64_t v58 = a1;
  uint64_t v59 = v19;
  if (v66)
  {
    uint64_t v28 = v63;
    sub_25BC7DA18(v63);
    swift_bridgeObjectRelease();
    sub_25BC7DABC(&v65, (uint64_t)&v67);
  }
  else
  {
    OUTLINED_FUNCTION_11();
    sub_25BC7DD64(v23, (uint64_t)&v67);
    char v29 = *((unsigned char *)a9 + v56);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v67, v68);
    uint64_t v56 = (uint64_t)&v56;
    OUTLINED_FUNCTION_2();
    MEMORY[0x270FA5388](v30);
    OUTLINED_FUNCTION_10();
    uint64_t v33 = (uint64_t *)(v32 - v31);
    (*(void (**)(uint64_t))(v34 + 16))(v32 - v31);
    uint64_t v35 = *v33;
    swift_retain();
    uint64_t v36 = a1;
    uint64_t v28 = v63;
    sub_25BC7DA18(v63);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v37 = OUTLINED_FUNCTION_16();
    uint64_t v40 = sub_25BC7B298(v37, v38, v57, v60, v35, v36, v29, v39, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
    uint64_t v68 = type metadata accessor for SASafariAssistantPrefetchRequestFilter();
    v69 = &off_2709524F0;
    *(void *)&long long v67 = v40;
    sub_25BC7E0F0((uint64_t)&v65, &qword_26B34BF50);
  }
  sub_25BC7DABC(&v67, (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter]);

  v41 = (objc_class *)type metadata accessor for SASafariAssistantAssetManager();
  v64.receiver = v15;
  v64.super_class = v41;
  v42 = (char *)objc_msgSendSuper2(&v64, sel_init);
  v43 = &v42[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider];
  swift_beginAccess();
  uint64_t v44 = *((void *)v43 + 3);
  uint64_t v45 = *((void *)v43 + 4);
  uint64_t v46 = OUTLINED_FUNCTION_16();
  __swift_mutable_project_boxed_opaque_existential_1(v46, v47);
  v48 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v45 + 16);
  v49 = v42;
  v48(v42, &off_270951630, v44, v45);
  swift_endAccess();
  uint64_t v50 = (uint64_t)&v49[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter];
  swift_beginAccess();
  uint64_t v51 = *(void *)(v50 + 24);
  uint64_t v52 = *(void *)(v50 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v50, v51);
  v53 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v52 + 16);
  v54 = v49;
  v53(v42, &off_270951620, v51, v52);
  swift_endAccess();

  sub_25BC7DA60(v28);
  swift_release();
  swift_release();
  sub_25BC7E0F0(v61, &qword_26B34BF50);
  sub_25BC7E0F0(v62, &qword_26B34B688);
  return v54;
}

uint64_t sub_25BC7DA18(uint64_t result)
{
  if (result) {
    return swift_retain();
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

uint64_t sub_25BC7DA60(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_25BC7DA70()
{
  unint64_t result = qword_26B34BF40;
  if (!qword_26B34BF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34BF40);
  }
  return result;
}

uint64_t sub_25BC7DABC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25BC7DAD4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC7DB0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void *, void *))(v4 + 16);
  v8[0] = a1;
  v8[1] = a2;
  v7[0] = a3;
  v7[1] = a4;
  return v5(v8, v7);
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

uint64_t sub_25BC7DBEC(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(v2 + 16))(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_25BC7DC24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25BC7DC68(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
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

unint64_t sub_25BC7DCF0()
{
  unint64_t result = qword_26A554640;
  if (!qword_26A554640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554640);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25BC7DD64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25BC7DDC8()
{
  unint64_t result = qword_26A554660;
  if (!qword_26A554660)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A554660);
  }
  return result;
}

uint64_t sub_25BC7DE08()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25BC7DE18(void *a1)
{
}

uint64_t sub_25BC7DE20()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC7DE60()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25BC7E44C;
  uint64_t v3 = OUTLINED_FUNCTION_13();
  return v4(v3);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25BC7DF2C()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25BC7E44C;
  uint64_t v3 = OUTLINED_FUNCTION_16();
  return v4(v3);
}

uint64_t objectdestroy_58Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BC7E028(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  id v7 = (void *)OUTLINED_FUNCTION_15(v6);
  *id v7 = v8;
  v7[1] = sub_25BC7E44C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A554690 + dword_26A554690);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_25BC7E0F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BC7E14C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_15(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25BC7E1FC;
  id v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5546A0 + dword_26A5546A0);
  return v7(v2, v3);
}

uint64_t sub_25BC7E1FC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v3();
}

uint64_t sub_25BC7E2C0()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25BC7E1FC;
  uint64_t v3 = OUTLINED_FUNCTION_19();
  return v4(v3);
}

uint64_t objectdestroy_74Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25BC7E3A4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25BC7E44C;
  uint64_t v3 = OUTLINED_FUNCTION_19();
  return v4(v3);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)va);
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x261174A10);
}

void *OUTLINED_FUNCTION_8()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_20(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

_WORD *OUTLINED_FUNCTION_21(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_task_alloc();
}

void *OUTLINED_FUNCTION_23@<X0>(uint64_t a1@<X8>)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + a1), *(void *)(v1 + a1 + 24));
  uint64_t v4 = *(void *)(v3 + 40);
  return __swift_project_boxed_opaque_existential_1(v2, v4);
}

uint64_t OUTLINED_FUNCTION_24()
{
  sub_25BC7DA60(v0);
  return swift_release();
}

void *OUTLINED_FUNCTION_25()
{
  uint64_t v3 = *(void *)(v1 + 40);
  return __swift_project_boxed_opaque_existential_1(v0, v3);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_slowAlloc();
}

uint64_t sub_25BC7E6DC()
{
  return 0x6E6F697461727564;
}

uint64_t sub_25BC7E6F4()
{
  return 1701869940;
}

BOOL sub_25BC7E704(char a1)
{
  if (qword_26A5543E0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v2 = *(void *)(qword_26A554EF8 + 16);
    if (!v2) {
      break;
    }
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      if (qword_25BCA27B8[*(char *)(qword_26A554EF8 + 32 + v3)] == qword_25BCA27B8[a1])
      {
        int v5 = *(unsigned __int8 *)(qword_26A554EF8 + 32 + v3);
        return v5 == 45;
      }
      ++v3;
      if (v4 == v2) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v5 = 45;
  return v5 == 45;
}

BOOL sub_25BC7E7B8(char a1)
{
  if (qword_26A554380 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v2 = *(void *)(qword_26A554E48 + 16);
    if (!v2) {
      break;
    }
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      if (qword_25BCA27B8[*(char *)(qword_26A554E48 + 32 + v3)] == qword_25BCA27B8[a1])
      {
        int v5 = *(unsigned __int8 *)(qword_26A554E48 + 32 + v3);
        return v5 == 45;
      }
      ++v3;
      if (v4 == v2) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v5 = 45;
  return v5 == 45;
}

uint64_t sub_25BC7E86C(char a1)
{
  return qword_25BCA27B8[a1];
}

void sub_25BC7E884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  switch(*(void *)(a10 + 16))
  {
    case 0:
      OUTLINED_FUNCTION_1_0();
      sub_25BCA14B0();
      return;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_25BCA2560;
      uint64_t v11 = v10 + 32;
      uint64_t v12 = a10 + 32;
      goto LABEL_8;
    case 2:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      id v13 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_0(v13, (__n128)xmmword_25BCA26A0);
      uint64_t v11 = (uint64_t)&v13[4].n128_i64[1];
      uint64_t v12 = a10 + 72;
      goto LABEL_8;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v14 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_0(v14, (__n128)xmmword_25BCA2690);
      sub_25BC7DD64(a10 + 72, (uint64_t)&v14[4].n128_i64[1]);
      uint64_t v11 = (uint64_t)&v14[7];
      uint64_t v12 = a10 + 112;
      goto LABEL_8;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v15 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_0(v15, (__n128)xmmword_25BCA2680);
      sub_25BC7DD64(a10 + 72, (uint64_t)&v15[4].n128_i64[1]);
      sub_25BC7DD64(a10 + 112, (uint64_t)&v15[7]);
      uint64_t v11 = (uint64_t)&v15[9].n128_i64[1];
      uint64_t v12 = a10 + 152;
      goto LABEL_8;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      unint64_t v16 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_0(v16, (__n128)xmmword_25BCA2670);
      sub_25BC7DD64(a10 + 72, (uint64_t)&v16[4].n128_i64[1]);
      sub_25BC7DD64(a10 + 112, (uint64_t)&v16[7]);
      sub_25BC7DD64(a10 + 152, (uint64_t)&v16[9].n128_i64[1]);
      uint64_t v11 = (uint64_t)&v16[12];
      uint64_t v12 = a10 + 192;
LABEL_8:
      sub_25BC7DD64(v12, v11);
      OUTLINED_FUNCTION_1_0();
      sub_25BCA14B0();
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_25BC7EB0C()
{
  return sub_25BC7E880(*v0);
}

BOOL sub_25BC7EB1C()
{
  return sub_25BC7E7B8(*v0);
}

BOOL sub_25BC7EB24()
{
  return sub_25BC7E704(*v0);
}

uint64_t OUTLINED_FUNCTION_0_0(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_25BC7DD64(v2 + 32, (uint64_t)&a1[2]);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t sub_25BC7EB64()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BCA1410();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  id v6 = objc_msgSend(self, sel_currentLocale);
  sub_25BCA1400();

  uint64_t v7 = sub_25BCA13F0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_sharedConfiguration);
  if (v10) {
    id v10 = (id)sub_25BC90148(v10);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(v1 + 32) = v10;
  *(void *)(v1 + 40) = v11;
  swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = sub_25BCA1430();
  *(void *)(v1 + 56) = v12;
  swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = sub_25BCA1440();
  *(void *)(v1 + 72) = v13;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25BC7ECE8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25BC7ED20()
{
  sub_25BC7ECE8();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for DeviceContext()
{
  return self;
}

uint64_t sub_25BC7ED7C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_25BC7EE1C()
{
  uint64_t v1 = *v0;
  MEMORY[0x261174A10](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 88));
  return v0;
}

uint64_t sub_25BC7EEB8()
{
  sub_25BC7EE1C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for AtomicProperty()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25BC7EF5C()
{
  return sub_25BC8014C(v0);
}

uint64_t sub_25BC7EF68()
{
  return swift_initClassMetadata2();
}

id sub_25BC7EFB8()
{
  id v1 = objc_msgSend(v0, sel_response);
  return v1;
}

uint64_t sub_25BC7EFF0()
{
  OUTLINED_FUNCTION_3_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_3_0();

  OUTLINED_FUNCTION_3_0();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC7F058()
{
  OUTLINED_FUNCTION_3_0();
  if ((*(unsigned char *)(v0 + *(void *)(v1 + 120)) & 1) == 0) {
    sub_25BC7FB00();
  }
  uint64_t v2 = sub_25BC914C8();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6_0();

  OUTLINED_FUNCTION_6_0();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_25BC7F0E8()
{
  uint64_t v0 = sub_25BC7F058();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for NetworkSpan()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BC7F154()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = *(void *)(v0 + *(void *)(v2 + 128));
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BC91634();
  sub_25BCA17E0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v5 = OUTLINED_FUNCTION_1_1();
  *(_OWORD *)(v5 + 16) = xmmword_25BCA2560;
  uint64_t v6 = *(void *)(v1 + *(void *)(*(void *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554840);
  uint64_t v7 = sub_25BCA15F0();
  uint64_t v9 = v8;
  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  unint64_t v10 = sub_25BC8004C();
  *(void *)(v5 + 64) = v10;
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v129 = v4;
  uint64_t v11 = (__n128 *)OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(v11, v12, v13, v14, v15, v16, v17, v18, v105, v111, v117, v124, v129, v135, v19);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v118 = v6;
  uint64_t v20 = v6;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v21(ObjectType, v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
  uint64_t v22 = sub_25BCA15F0();
  v11[3].n128_u64[1] = MEMORY[0x263F8D310];
  v11[4].n128_u64[0] = v10;
  v11[2].n128_u64[0] = v22;
  v11[2].n128_u64[1] = v23;
  uint64_t v136 = v3;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_25BC7F610();
  if (v27)
  {
    sub_25BCA17E0();
    v79 = (__n128 *)OUTLINED_FUNCTION_1_1();
    __n128 v88 = OUTLINED_FUNCTION_4_0(v79, v80, v81, v82, v83, v84, v85, v86, v106, ObjectType, v118, v10, v130, v3, v87);
    ((void (*)(uint64_t, uint64_t, __n128))v21)(v116, v123, v88);
    uint64_t v89 = sub_25BCA15F0();
    unint64_t v90 = MEMORY[0x263F8D310];
    uint64_t v78 = v128;
    v79[3].n128_u64[1] = MEMORY[0x263F8D310];
    v79[4].n128_u64[0] = v128;
    v79[2].n128_u64[0] = v89;
    v79[2].n128_u64[1] = v91;
    sub_25BCA14A0();
    unint64_t v77 = v90;
  }
  else
  {
    uint64_t v28 = v25;
    int v29 = v26;
    unint64_t v30 = HIDWORD(v26);
    uint64_t v119 = v24;
    sub_25BCA17E0();
    uint64_t v31 = (__n128 *)OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_4_0(v31, v32, v33, v34, v35, v36, v37, v38, v106, ObjectType, v119, v10, v130, v136, v39);
    uint64_t v40 = MEMORY[0x263F8D750];
    v41[7] = v42;
    v41[8] = v40;
    v41[4] = v28;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    v43 = (__n128 *)OUTLINED_FUNCTION_1_1();
    uint64_t v44 = MEMORY[0x263F8E8F8];
    OUTLINED_FUNCTION_4_0(v43, v45, v46, v47, v48, v49, v50, v51, v107, v113, v120, v125, v131, v137, v52);
    uint64_t v53 = MEMORY[0x263F8E960];
    *(void *)(v54 + 56) = v44;
    *(void *)(v54 + 64) = v53;
    *(_DWORD *)(v54 + 32) = v30;
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    v55 = (__n128 *)OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_4_0(v55, v56, v57, v58, v59, v60, v61, v62, v108, v114, v121, v126, v132, v138, v63);
    *(void *)(v64 + 56) = v44;
    *(void *)(v64 + 64) = v53;
    *(_DWORD *)(v64 + 32) = v29;
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    long long v65 = (__n128 *)OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_4_0(v65, v66, v67, v68, v69, v70, v71, v72, v109, v115, v122, v127, v133, v139, v73);
    uint64_t v74 = MEMORY[0x263F8D5B8];
    v75[7] = v76;
    v75[8] = v74;
    v75[4] = v123;
    sub_25BCA14A0();
    unint64_t v77 = MEMORY[0x263F8D310];
    uint64_t v78 = v128;
  }
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  v92 = (__n128 *)OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(v92, v93, v94, v95, v96, v97, v98, v99, v110, v116, v123, v128, v134, v140, v100);
  id v101 = *(id *)(v1 + *(void *)(*(void *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554848);
  uint64_t v102 = sub_25BCA15F0();
  v92[3].n128_u64[1] = v77;
  v92[4].n128_u64[0] = v78;
  v92[2].n128_u64[0] = v102;
  v92[2].n128_u64[1] = v103;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  return sub_25BCA14A0();
}

uint64_t sub_25BC7F610()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = *(void *)(v0 + *(void *)(v1 + 464) + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v5 = v4(ObjectType, v2);
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  if (!v7)
  {

LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v16 = OUTLINED_FUNCTION_1_1();
    *(_OWORD *)(v16 + 16) = xmmword_25BCA2560;
    uint64_t v73 = v4(ObjectType, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
    uint64_t v17 = sub_25BCA15F0();
    uint64_t v19 = v18;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_25BC8004C();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    OUTLINED_FUNCTION_7_0((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
    swift_bridgeObjectRelease();
    sub_25BC91B60();
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  objc_msgSend(v7, sel_statusCode);
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2))
  {

    *(double *)&uint64_t result = 0.0;
    return result;
  }
  *(void *)&long long v78 = 0xD000000000000021;
  *((void *)&v78 + 1) = 0x800000025BCA4B90;
  uint64_t v8 = sub_25BCA18F0();
  OUTLINED_FUNCTION_2_0(v8, v9, v10, v11, v12, v13, v14, v15, v54, v58, v62, v64, v69, v73, v74, v75, v76, v77, v78);
  sub_25BC80098((uint64_t)&v73);
  if (v79) {
    OUTLINED_FUNCTION_0_1();
  }
  else {
    sub_25BC800EC((uint64_t)&v78);
  }
  *(void *)&long long v78 = 0xD00000000000001DLL;
  *((void *)&v78 + 1) = 0x800000025BCA4BC0;
  uint64_t v21 = sub_25BCA18F0();
  OUTLINED_FUNCTION_2_0(v21, v22, v23, v24, v25, v26, v27, v28, v55, v59, v63, v65, v70, v73, v74, v75, v76, v77, v78);
  sub_25BC80098((uint64_t)&v73);
  if (v79) {
    OUTLINED_FUNCTION_0_1();
  }
  else {
    sub_25BC800EC((uint64_t)&v78);
  }
  uint64_t v29 = sub_25BCA18F0();
  OUTLINED_FUNCTION_2_0(v29, v30, v31, v32, v33, v34, v35, v36, v56, 0xD00000000000001BLL, 0x800000025BCA4BE0, v66, v71, v73, v74, v75, v76, v77, v78);
  sub_25BC80098((uint64_t)&v73);
  if (v79)
  {
    if (OUTLINED_FUNCTION_0_1())
    {
      uint64_t v68 = v60;
      goto LABEL_19;
    }
  }
  else
  {
    sub_25BC800EC((uint64_t)&v78);
  }
  uint64_t v37 = sub_25BCA18F0();
  OUTLINED_FUNCTION_2_0(v37, v38, v39, v40, v41, v42, v43, v44, v57, 0xD00000000000001BLL, 0x800000025BCA4C00, v67, v72, v73, v74, v75, v76, v77, v78);
  sub_25BC80098((uint64_t)&v73);
  if (!v79)
  {
    sub_25BC800EC((uint64_t)&v78);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
LABEL_19:
  double v45 = *(double *)&v68;
  uint64_t v46 = sub_25BCA18F0();
  OUTLINED_FUNCTION_2_0(v46, v47, v48, v49, v50, v51, v52, v53, v57, 0xD00000000000001ALL, 0x800000025BCA4C20, v68, v72, v73, v74, v75, v76, v77, v78);
  swift_bridgeObjectRelease();

  sub_25BC80098((uint64_t)&v73);
  if (v79)
  {
    if (OUTLINED_FUNCTION_0_1())
    {
      *(double *)&uint64_t result = v61 - v45;
      return result;
    }
  }
  else
  {
    sub_25BC800EC((uint64_t)&v78);
  }
LABEL_25:
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t sub_25BC7FA18(uint64_t a1, unint64_t a2, double a3)
{
  int v3 = a2;
  unint64_t v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25BCA2680;
  uint64_t v8 = MEMORY[0x263F8D750];
  *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  uint64_t v9 = MEMORY[0x263F8E8F8];
  uint64_t v10 = MEMORY[0x263F8E960];
  *(void *)(v7 + 96) = MEMORY[0x263F8E8F8];
  *(void *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v10;
  uint64_t v11 = MEMORY[0x263F8D538];
  *(_DWORD *)(v7 + 112) = v6;
  uint64_t v12 = MEMORY[0x263F8D5B8];
  *(void *)(v7 + 176) = v11;
  *(void *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_25BC924C8("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

void sub_25BC7FB00()
{
  OUTLINED_FUNCTION_3_0();
  if ((*(unsigned char *)(v0 + *(void *)(v1 + 120)) & 1) == 0)
  {
    sub_25BC7F610();
    if (v2)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v6 = OUTLINED_FUNCTION_1_1();
      *(_OWORD *)(v6 + 16) = xmmword_25BCA2560;
      OUTLINED_FUNCTION_6_0();
      uint64_t v8 = *(void *)(v0 + *(void *)(v7 + 464) + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
      uint64_t v10 = sub_25BCA15F0();
      uint64_t v12 = v11;
      *(void *)(v6 + 56) = MEMORY[0x263F8D310];
      *(void *)(v6 + 64) = sub_25BC8004C();
      *(void *)(v6 + 32) = v10;
      *(void *)(v6 + 40) = v12;
      OUTLINED_FUNCTION_7_0((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_6_0();
      (*(void (**)(uint64_t, uint64_t))(v3 + 568))(v4, v5);
    }
    sub_25BC91B60();
  }
}

uint64_t sub_25BC7FC3C()
{
  return sub_25BC91BA8((void (*)(void))sub_25BC80040);
}

uint64_t sub_25BC7FC7C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  if (*(void *)(a1 + *(void *)(*(void *)a1 + 480)))
  {
    swift_unknownObjectRetain();
    if (nw_activity_is_activated())
    {
      nw_activity_complete_with_reason();
    }
    else
    {
      sub_25BCA17C0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_25BCA2560;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554CC0);
      uint64_t v4 = sub_25BCA15F0();
      uint64_t v6 = v5;
      *(void *)(v3 + 56) = MEMORY[0x263F8D310];
      *(void *)(v3 + 64) = sub_25BC8004C();
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = v6;
      sub_25BCA14A0();
      swift_bridgeObjectRelease();
    }
    a1 = swift_unknownObjectRelease();
  }
  return a2(a1);
}

uint64_t sub_25BC7FDF0(uint64_t a1, unint64_t a2, double a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554810);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BCA2680;
  if (qword_26A5543A8 != -1) {
    swift_once();
  }
  uint64_t v7 = unk_26A554EA0;
  *(void *)(inited + 32) = qword_26A554E98;
  *(void *)(inited + 40) = v7;
  id v8 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = objc_msgSend(v8, sel_initWithInteger_, a1);
  if (qword_26A5543A0 != -1) {
    swift_once();
  }
  uint64_t v9 = unk_26A554E90;
  *(void *)(inited + 56) = qword_26A554E88;
  *(void *)(inited + 64) = v9;
  id v10 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 72) = objc_msgSend(v10, sel_initWithDouble_, a3);
  *(void *)(inited + 80) = 0xD000000000000010;
  *(void *)(inited + 88) = 0x800000025BCA4940;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, a2);
  if (qword_26A554398 != -1) {
    swift_once();
  }
  uint64_t v11 = unk_26A554E80;
  *(void *)(inited + 104) = qword_26A554E78;
  *(void *)(inited + 112) = v11;
  id v12 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 120) = objc_msgSend(v12, sel_initWithUnsignedInt_, HIDWORD(a2));
  sub_25BC80000();
  return sub_25BCA1560();
}

unint64_t sub_25BC80000()
{
  unint64_t result = qword_26A554C10;
  if (!qword_26A554C10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A554C10);
  }
  return result;
}

uint64_t sub_25BC80040()
{
  return sub_25BC7FC7C(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

unint64_t sub_25BC8004C()
{
  unint64_t result = qword_26A554830;
  if (!qword_26A554830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554830);
  }
  return result;
}

uint64_t sub_25BC80098(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BC800EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BC8014C(void *a1)
{
  id v1 = objc_msgSend(a1, sel__timingData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25BCA1540();

  return v3;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19)
{
  return sub_25BC986F4((uint64_t)&a14, v19, &a19);
}

__n128 OUTLINED_FUNCTION_4_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_25BCA14A0();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  return sub_25BC924C8(a1, 68, 2, v1);
}

uint64_t AtomicValue.__allocating_init(_:)()
{
  uint64_t v0 = swift_allocObject();
  AtomicValue.init(_:)();
  return v0;
}

uint64_t AtomicValue.init(_:)()
{
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(v0 + 16) = Lock.init()();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2();
  (*(void (**)(void))(v1 + 32))();
  return v0;
}

void AtomicValue.load()(uint64_t a1@<X8>)
{
  Lock.lock()();
  OUTLINED_FUNCTION_6_0();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  swift_beginAccess();
  OUTLINED_FUNCTION_0_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a1, v4);
  Lock.unlock()();
}

void AtomicValue.store(_:)(uint64_t a1)
{
  Lock.lock()();
  OUTLINED_FUNCTION_6_0();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  swift_beginAccess();
  OUTLINED_FUNCTION_0_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, a1);
  swift_endAccess();
  Lock.unlock()();
}

void AtomicValue.store(resultOf:)(void (*a1)(unsigned char *))
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v13[-v8];
  Lock.lock()();
  OUTLINED_FUNCTION_6_0();
  uint64_t v11 = v1 + *(void *)(v10 + 96);
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v7, v11, v3);
  uint64_t v12 = v14;
  a1(v7);
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  if (!v12)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 40))(v11, v9, v3);
    swift_endAccess();
  }
  sub_25BC8069C();
}

void sub_25BC8069C()
{
}

uint64_t *AtomicValue.deinit()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  return v0;
}

uint64_t AtomicValue.__deallocating_deinit()
{
  AtomicValue.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25BC80798()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for AtomicValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AtomicValue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AtomicValue);
}

uint64_t dispatch thunk of AtomicValue.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

id sub_25BC80890(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  id v6 = objc_msgSend(v3, sel_newHashesArray, sub_25BC809A4(a1, a2), v14);
  uint64_t v7 = MEMORY[0x261173B60](&v13, 8);
  unint64_t v9 = v8;
  uint64_t v10 = (void *)sub_25BCA1350();

  id v11 = objc_msgSend(v3, sel_getWithHashes_, v6);
  sub_25BC81100(v7, v9);

  return v11;
}

uint64_t sub_25BC809A4(uint64_t a1, unint64_t a2)
{
  return sub_25BC809AC(a1, a2, 8);
}

uint64_t sub_25BC809AC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return -1;
  }
  uint64_t v5 = sub_25BC80A18();
  unint64_t v7 = v6;
  uint64_t v8 = sub_25BC80CE0(v5, v6, a3);
  sub_25BC810EC(v5, v7);
  return v8;
}

uint64_t sub_25BC80A18()
{
  uint64_t v0 = sub_25BCA15E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BCA15D0();
  uint64_t v4 = sub_25BCA15B0();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15) {
    return v4;
  }
  uint64_t v8 = sub_25BCA1720();
  *(void *)(v8 + 16) = 32;
  *(_OWORD *)(v8 + 32) = 0u;
  *(_OWORD *)(v8 + 48) = 0u;
  uint64_t v17 = v8;
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v4 >> 32 < (int)v4)
      {
        __break(1u);
        sub_25BC810EC(v4, v6);
        swift_release();
        swift_release();
        __break(1u);
        JUMPOUT(0x25BC80CD0);
      }
      sub_25BC814FC(v4, v6);
      sub_25BC814FC(v4, v6);
      sub_25BC8128C((int)v4, v4 >> 32, v6 & 0x3FFFFFFFFFFFFFFFLL, v4, v6, (uint64_t)&v17);
      goto LABEL_10;
    case 2uLL:
      uint64_t v12 = *(void *)(v4 + 16);
      uint64_t v13 = *(void *)(v4 + 24);
      sub_25BC814FC(v4, v6);
      sub_25BC814FC(v4, v6);
      swift_retain();
      swift_retain();
      sub_25BC8128C(v12, v13, v6 & 0x3FFFFFFFFFFFFFFFLL, v4, v6, (uint64_t)&v17);
      swift_release();
      swift_release();
LABEL_10:
      sub_25BC810EC(v4, v6);
      goto LABEL_11;
    case 3uLL:
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      goto LABEL_7;
    default:
      uint64_t v9 = BYTE6(v6);
      uint64_t v10 = v6 & 0xFFFFFFFFFFFFLL;
      uint64_t v11 = v4;
LABEL_7:
      sub_25BC8135C(v11, v10, v9, v4, v6, (uint64_t)&v17);
      sub_25BC810EC(v4, v6);
LABEL_11:
      uint64_t v14 = swift_bridgeObjectRetain();
      uint64_t v7 = sub_25BC80FFC(v14);
      sub_25BC810EC(v4, v6);
      swift_bridgeObjectRelease();
      break;
  }
  return v7;
}

uint64_t sub_25BC80CE0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 60 == 15) {
    return -1;
  }
  if (a3 < 0)
  {
    __break(1u);
LABEL_13:
    uint64_t v5 = (uint64_t)sub_25BC81454(v5);
    goto LABEL_8;
  }
  unint64_t v3 = a2;
  uint64_t v4 = a1;
  if (a3 >= 8) {
    size_t v7 = 8;
  }
  else {
    size_t v7 = a3;
  }
  sub_25BC81158(a1, a2);
  uint64_t v5 = sub_25BC80E48(0, v7);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = sub_25BCA1340();
  unint64_t v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554860);
  sub_25BC81468();
  sub_25BC81510(&qword_26A554870, &qword_26A554860);
  sub_25BCA1150();
  sub_25BC81100(v8, v10);
  uint64_t v6 = *(void *)(v5 + 32);
  swift_bridgeObjectRelease();
  if (v6 < 0) {
    uint64_t v6 = -v6;
  }
  sub_25BC810EC(v4, v3);
  return v6;
}

uint64_t sub_25BC80E48(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25BCA1980();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_25BCA1720();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

unsigned __int8 *sub_25BC80F04(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = sub_25BCA1370();
  if ((v7 & 0x8000000000000000) != 0 || (CC_LONG v8 = v7, HIDWORD(v7)))
  {
    uint64_t result = (unsigned __int8 *)sub_25BCA1980();
    __break(1u);
  }
  else
  {
    sub_25BC811B0(0);
    return CC_SHA256(a1, v8, (unsigned __int8 *)(*(void *)a5 + 32));
  }
  return result;
}

uint64_t sub_25BC80FFC(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554878);
  uint64_t v10 = sub_25BC81510(&qword_26A554880, &qword_26A554878);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = *v2 + 32;
  uint64_t v4 = v3 + *(void *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_25BC81214(v3, v4, &v7);
  swift_bridgeObjectRelease();
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_25BC810C4(uint64_t a1, unint64_t a2)
{
  return (unint64_t)sub_25BC80890(a1, a2) & 1;
}

uint64_t sub_25BC810EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25BC81100(a1, a2);
  }
  return a1;
}

uint64_t sub_25BC81100(uint64_t a1, unint64_t a2)
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

uint64_t sub_25BC81158(uint64_t a1, unint64_t a2)
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

char *sub_25BC811B0(int64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || a1 > *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v3 + 16) <= a1) {
      int64_t v5 = a1;
    }
    else {
      int64_t v5 = *(void *)(v3 + 16);
    }
    uint64_t result = sub_25BC8D2E4(result, v5, 0, v3);
    uint64_t v3 = (uint64_t)result;
  }
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_25BC81214@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = sub_25BCA1310();
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = MEMORY[0x261173B20]();
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = MEMORY[0x261173B30]();
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_25BC8128C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t result = sub_25BCA1200();
  uint64_t v12 = (char *)result;
  if (result)
  {
    uint64_t result = sub_25BCA1220();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = sub_25BCA1210();
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = &v12[v16];
  if (v12) {
    uint64_t v18 = (uint64_t)v17;
  }
  else {
    uint64_t v18 = 0;
  }
  sub_25BC80F04(v12, v18, a4, a5, a6);
  return sub_25BC81100(a4, a5);
}

uint64_t sub_25BC8135C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  __int16 v10 = a2;
  char v11 = BYTE2(a2);
  char v12 = BYTE3(a2);
  char v13 = BYTE4(a2);
  char v14 = BYTE5(a2);
  sub_25BC80F04(&v9, (uint64_t)&v9 + a3, a4, a5, a6);
  return sub_25BC81100(a4, a5);
}

char *sub_25BC81454(uint64_t a1)
{
  return sub_25BC8D2E4(0, *(void *)(a1 + 16), 0, a1);
}

unint64_t sub_25BC81468()
{
  unint64_t result = qword_26A554868;
  if (!qword_26A554868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554868);
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

uint64_t sub_25BC814FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25BC81158(a1, a2);
  }
  return a1;
}

uint64_t sub_25BC81510(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25BC81554()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554948);
  sub_25BC7DA70();
  uint64_t result = sub_25BCA1560();
  qword_26A554888 = result;
  return result;
}

void sub_25BC815A8()
{
  qword_26A554E18 = 0x6E756F632E616273;
  unk_26A554E20 = 0xEF65646F63797274;
}

void sub_25BC815D8()
{
  qword_26A554E28 = 0x6E6F6973726576;
  unk_26A554E30 = 0xE700000000000000;
}

void *sub_25BC815FC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  v3[4] = 0;
  swift_unknownObjectWeakInit();
  id v8 = objc_msgSend(self, sel_sharedManager);
  v3[8] = sub_25BC8B15C(0, &qword_26B34BF70);
  v3[9] = &off_270951A78;
  v3[5] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34BF68);
  sub_25BC7DA70();
  uint64_t v9 = sub_25BCA1560();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B34BF18);
  swift_allocObject();
  v4[11] = sub_25BC7A9DC(v9);
  v4[12] = 0;
  v4[2] = a1;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_allocObject();
  v4[11] = sub_25BC7A9DC(a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  *((unsigned char *)v4 + 80) = a3;
  return v4;
}

uint64_t sub_25BC81784()
{
  if (*(void *)(v0 + 96))
  {
    swift_unknownObjectRetain();
    sub_25BC84024();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_11();
  swift_retain();
  uint64_t v3 = sub_25BC98424();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B34BF58);
  OUTLINED_FUNCTION_62(v1);
  sub_25BC98624(v3);
  swift_release();
  swift_release();
  sub_25BC8B0B4(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_25BC81848()
{
  sub_25BC81784();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_25BC8187C()
{
  *(void *)(v1 + 64) = v0;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC81894);
}

uint64_t sub_25BC81894()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = *(void *)(v0 + 64);
  OUTLINED_FUNCTION_11();
  swift_retain();
  uint64_t v5 = sub_25BC98424();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B34BF58);
  OUTLINED_FUNCTION_62(v2);
  sub_25BC98624(v5);
  swift_release();
  if (*(void *)(v1 + 96))
  {
    swift_unknownObjectRetain();
    sub_25BC84024();
    swift_unknownObjectRelease();
  }
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  void *v3 = v0;
  v3[1] = sub_25BC81994;
  return sub_25BC8305C();
}

uint64_t sub_25BC81994()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_0();
  void *v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 80) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25BC81A70()
{
  OUTLINED_FUNCTION_9();
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25BCA1510();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
  uint64_t v1 = sub_25BCA14F0();
  os_log_type_t v2 = sub_25BCA1800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v3);
    OUTLINED_FUNCTION_73(&dword_25BC76000, v1, v2, "SafariSummarizationPrefetch - Successfully cleaned cache");
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_5();
  return v4();
}

uint64_t sub_25BC81B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_56();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)v22[10];
  uint64_t v26 = sub_25BCA1510();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B34BF78);
  id v27 = v25;
  id v28 = v25;
  uint64_t v29 = sub_25BCA14F0();
  os_log_type_t v30 = sub_25BCA17E0();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = (void *)v22[10];
  if (v31)
  {
    a9 = v22 + 5;
    a10 = v22 + 7;
    uint64_t v33 = OUTLINED_FUNCTION_34();
    uint64_t v34 = (void *)OUTLINED_FUNCTION_33();
    a11 = OUTLINED_FUNCTION_32();
    *(_DWORD *)uint64_t v33 = 138412802;
    id v35 = v32;
    uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
    v22[5] = v36;
    sub_25BCA1880();
    *uint64_t v34 = v36;

    *(_WORD *)(v33 + 12) = 2080;
    v22[6] = OUTLINED_FUNCTION_52(v37, 0x800000025BCA4840, &a11);
    sub_25BCA1880();
    *(_WORD *)(v33 + 22) = 2080;
    v22[7] = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &a11);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v29, v30, "SafariSummarizationPrefetch - Failed to unsubscribe with error: %@, from subscription name %s, assetSetName: %s", (uint8_t *)v33, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_7();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_68();
  return v39(v38, v39, v40, v41, v42, v43, v44, v45, a9, a10, a11, a12, a13, a14);
}

void sub_25BC81DD4()
{
  OUTLINED_FUNCTION_11();
  swift_retain();
  uint64_t v5 = sub_25BC98424();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B34BF58);
  OUTLINED_FUNCTION_62(v0);
  sub_25BC98624(v5);
  swift_release();
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25BCA1510();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B34BF78);
  os_log_type_t v2 = sub_25BCA14F0();
  os_log_type_t v3 = sub_25BCA1800();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v4);
    OUTLINED_FUNCTION_73(&dword_25BC76000, v2, v3, "SafariSummarizationPrefetch - Successfully cleaned cache");
    OUTLINED_FUNCTION_7();
  }
}

void sub_25BC81EE0(void *a1)
{
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BCA1510();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B34BF78);
  id v3 = a1;
  uint64_t v4 = sub_25BCA14F0();
  os_log_type_t v5 = sub_25BCA1800();
  uint64_t v6 = &off_2654A4000;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134219522;
    id v15 = objc_msgSend(v3, sel_downloadStatus);
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v7 + 12) = 2048;
    objc_msgSend(v3, sel_completedPercent, v15);
    uint64_t v16 = v8;
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v7 + 22) = 2048;
    id v17 = objc_msgSend(v3, sel_completedBytes, v16);
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v7 + 32) = 2048;
    objc_msgSend(v3, sel_totalBytes, v17);
    OUTLINED_FUNCTION_16_0();

    *(_WORD *)(v7 + 42) = 2080;
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_52(v9, v10, &v18);
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v7 + 52) = 2080;
    sub_25BC9E6B4(0xD000000000000018, 0x800000025BCA4590, &v18);
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v7 + 62) = 2080;
    uint64_t v14 = sub_25BC9E6B4(0xD00000000000001DLL, 0x800000025BCA4860, &v18);
    uint64_t v6 = &off_2654A4000;
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v4, v5, "SafariSummarizationPrefetch - Progress retrieving assets on-demand has downloadStatus: %lu, completedPercent: %f%%, completedBytes: %ld, totalBytes: %ld, for subscriberName: %s, subscriptionName: %s, assetName: %s", (uint8_t *)v7, 0x48u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
  }
  if (objc_msgSend(v3, (SEL)v6[147], v14) == (id)4)
  {
    uint64_t v11 = sub_25BCA14F0();
    os_log_type_t v12 = sub_25BCA1800();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v13);
      OUTLINED_FUNCTION_73(&dword_25BC76000, v11, v12, "SafariSummarizationPrefetch - Progress retrieving assets on-demand complete. Asset downloaded (or skipped)");
      OUTLINED_FUNCTION_7();
    }
  }
}

uint64_t sub_25BC821C8()
{
  OUTLINED_FUNCTION_4();
  v1[39] = v0;
  uint64_t v2 = sub_25BCA1510();
  v1[40] = v2;
  OUTLINED_FUNCTION_4_1(v2);
  v1[41] = v3;
  v1[42] = OUTLINED_FUNCTION_41();
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554930);
  OUTLINED_FUNCTION_47(v4);
  v1[45] = OUTLINED_FUNCTION_81();
  uint64_t v5 = sub_25BCA13E0();
  v1[46] = v5;
  OUTLINED_FUNCTION_4_1(v5);
  v1[47] = v6;
  v1[48] = OUTLINED_FUNCTION_41();
  v1[49] = swift_task_alloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25BC822CC()
{
  uint64_t v45 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BCA26A0;
  if (qword_26A554368 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[49];
  uint64_t v3 = v0[46];
  uint64_t v4 = v0[47];
  uint64_t v5 = v0[45];
  uint64_t v6 = unk_26A554E20;
  *(void *)(inited + 32) = qword_26A554E18;
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = 0x6E6F6D6D6F63;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 64) = 0xD000000000000010;
  *(void *)(inited + 72) = 0x800000025BCA4E10;
  *(void *)(inited + 80) = 0x6E6F6D6D6F63;
  *(void *)(inited + 88) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25BCA1560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554938);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25BCA2560;
  *(void *)(v8 + 32) = 0xD000000000000014;
  *(void *)(v8 + 40) = 0x800000025BCA4820;
  *(void *)(v8 + 48) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554940);
  uint64_t v9 = sub_25BCA1560();
  sub_25BCA13C0();
  sub_25BCA1380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v2, v3);
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v3);
  id v10 = objc_allocWithZone(MEMORY[0x263F84080]);
  OUTLINED_FUNCTION_13_0();
  id v13 = sub_25BC8A2A8(v11, v12, v9, 0, v5);
  v0[53] = v13;
  if (v13)
  {
    uint64_t v14 = v13;
    sub_25BC7DD64(v0[39] + 40, (uint64_t)(v0 + 21));
    uint64_t v15 = v0[25];
    uint64_t v16 = (void *)OUTLINED_FUNCTION_43();
    __swift_project_boxed_opaque_existential_1(v16, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548E8);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_25BCA2B00;
    *(void *)(v18 + 32) = v14;
    uint64_t v44 = v18;
    sub_25BCA1710();
    v0[50] = v44;
    uint64_t v43 = (uint64_t (*)(unint64_t))(*(void *)(v15 + 8) + **(int **)(v15 + 8));
    id v19 = v14;
    uint64_t v20 = (void *)swift_task_alloc();
    v0[51] = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_25BC828BC;
    OUTLINED_FUNCTION_13_0();
    return v43(0xD000000000000011);
  }
  else
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0[40], (uint64_t)qword_26B34BF78);
    uint64_t v22 = OUTLINED_FUNCTION_17();
    v23(v22);
    uint64_t v24 = sub_25BCA14F0();
    os_log_type_t v25 = sub_25BCA17E0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = v0[49];
    uint64_t v29 = v0[46];
    uint64_t v28 = v0[47];
    if (v26)
    {
      uint64_t v42 = v0[49];
      uint64_t v30 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315907;
      OUTLINED_FUNCTION_13_0();
      v0[29] = OUTLINED_FUNCTION_52(v31, v32, &v44);
      sub_25BCA1880();
      *(_WORD *)(v30 + 12) = 2080;
      v0[26] = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v44);
      uint64_t v33 = sub_25BCA1880();
      *(_WORD *)(v30 + 22) = 2085;
      v0[27] = OUTLINED_FUNCTION_2_1(v33, v34, &v44);
      uint64_t v35 = sub_25BCA1880();
      *(_WORD *)(v30 + 32) = 2085;
      v0[28] = OUTLINED_FUNCTION_2_1(v35, v36, &v44);
      sub_25BCA1880();
      OUTLINED_FUNCTION_85(&dword_25BC76000, v37, v38, "SafariSummarizationPrefetch - Failed to initialize UAFAssetSetSubscription for subscription name %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_51();
      v39();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v42, v29);
    }
    else
    {

      OUTLINED_FUNCTION_51();
      v40();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    }
    OUTLINED_FUNCTION_67();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_5();
    return v41();
  }
}

uint64_t sub_25BC828BC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v6 = v5;
  *(void *)(v3 + 416) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25BC829A0()
{
  BOOL v26 = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 21));
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[40], (uint64_t)qword_26B34BF78);
  uint64_t v1 = OUTLINED_FUNCTION_17();
  v2(v1);
  uint64_t v3 = sub_25BCA14F0();
  os_log_type_t v4 = sub_25BCA1800();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[53];
  uint64_t v7 = v0[46];
  uint64_t v8 = v0[47];
  if (v5)
  {
    uint64_t v24 = v0[49];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v25 = v23;
    *(_DWORD *)uint64_t v9 = 136315907;
    v0[35] = OUTLINED_FUNCTION_52(v23, 0x800000025BCA4840, &v25);
    sub_25BCA1880();
    *(_WORD *)(v9 + 12) = 2080;
    v0[36] = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v25);
    uint64_t v10 = sub_25BCA1880();
    *(_WORD *)(v9 + 22) = 2085;
    v0[37] = OUTLINED_FUNCTION_2_1(v10, v11, &v25);
    uint64_t v12 = sub_25BCA1880();
    *(_WORD *)(v9 + 32) = 2085;
    v0[38] = OUTLINED_FUNCTION_2_1(v12, v13, &v25);
    sub_25BCA1880();
    OUTLINED_FUNCTION_85(&dword_25BC76000, v14, v15, "SafariSummarizationPrefetch - Successfully UAFAssetSetManager.subscribed to assets with subscriberName: %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    OUTLINED_FUNCTION_51();
    v16();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v24, v7);
  }
  else
  {

    OUTLINED_FUNCTION_51();
    v17();
    uint64_t v18 = OUTLINED_FUNCTION_43();
    v20(v18, v19);
  }
  OUTLINED_FUNCTION_67();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v21();
}

uint64_t sub_25BC82C8C()
{
  uint64_t v38 = v0;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 21));
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[52];
  uint64_t v3 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[40];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B34BF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_25BCA14F0();
  os_log_type_t v36 = sub_25BCA17E0();
  BOOL v9 = os_log_type_enabled(v8, v36);
  uint64_t v11 = (void *)v0[52];
  uint64_t v10 = (void *)v0[53];
  uint64_t v12 = v0[49];
  uint64_t v13 = v0[47];
  if (v9)
  {
    uint64_t v34 = (void *)v0[53];
    uint64_t v35 = v0[46];
    uint64_t v14 = swift_slowAlloc();
    unint64_t v32 = (void *)OUTLINED_FUNCTION_33();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138413315;
    id v15 = v11;
    uint64_t v33 = v12;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[30] = v16;
    sub_25BCA1880();
    *unint64_t v32 = v16;

    *(_WORD *)(v14 + 12) = 2080;
    OUTLINED_FUNCTION_13_0();
    v0[31] = OUTLINED_FUNCTION_52(v17, v18, &v37);
    sub_25BCA1880();
    *(_WORD *)(v14 + 22) = 2080;
    OUTLINED_FUNCTION_13_0();
    v0[32] = sub_25BC9E6B4(v19, v20, &v37);
    uint64_t v21 = OUTLINED_FUNCTION_49();
    *(_WORD *)(v14 + 32) = 2085;
    v0[33] = OUTLINED_FUNCTION_2_1(v21, v22, &v37);
    uint64_t v23 = OUTLINED_FUNCTION_49();
    *(_WORD *)(v14 + 42) = 2085;
    v0[34] = OUTLINED_FUNCTION_2_1(v23, v24, &v37);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v8, v36, "SafariSummarizationPrefetch - Failed to UAFAssetSetManager.subscribe error: %@, subscriberName: %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v14, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    OUTLINED_FUNCTION_39();
    v25();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v33, v35);
  }
  else
  {

    OUTLINED_FUNCTION_39();
    v26();
    uint64_t v27 = OUTLINED_FUNCTION_43();
    v29(v27, v28);
  }
  OUTLINED_FUNCTION_67();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v30();
}

uint64_t sub_25BC8305C()
{
  *(void *)(v1 + 16) = v0;
  *(void *)(v1 + 24) = *v0;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC8309C);
}

uint64_t sub_25BC8309C()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[4] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25BC83188;
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25BC83188()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25BC8326C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25BC83284()
{
  OUTLINED_FUNCTION_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v0();
}

uint64_t sub_25BC832E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554928);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  sub_25BC7DD64(a2 + 40, (uint64_t)v13);
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)&v13[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  (*(void (**)(unint64_t, unint64_t, void *, void, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v8 + 48))(0xD000000000000011, 0x800000025BCA4840, &unk_270951418, 0, sub_25BC8B040, v10, v7, v8);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_25BC83490(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554928);
    return sub_25BCA1740();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554928);
    return sub_25BCA1750();
  }
}

uint64_t sub_25BC834F4()
{
  uint64_t v1 = *v0;
  sub_25BC7DD64((uint64_t)(v0 + 5), (uint64_t)v10);
  uint64_t v2 = v11;
  uint64_t v3 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v9[3] = MEMORY[0x263F8D310];
  v9[0] = 0xD000000000000014;
  v9[1] = 0x800000025BCA4820;
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v1;
  uint64_t v6 = *(uint64_t (**)(void *, void, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v3 + 24);
  swift_retain();
  uint64_t v7 = v6(v9, 0, sub_25BC8AE6C, v5, v2, v3);
  swift_release();
  swift_release();
  sub_25BC8AE74((uint64_t)v9, (uint64_t *)&unk_26A554850);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v7;
}

uint64_t sub_25BC83658(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554678);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v38 = (uint64_t)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BCA1510();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v39 = a1 + 16;
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26B34BF78);
  uint64_t v35 = *(void (**)(char *))(v5 + 16);
  uint64_t v36 = v11;
  v35(v10);
  uint64_t v12 = sub_25BCA14F0();
  os_log_type_t v13 = sub_25BCA1800();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v33 = v5;
    uint64_t v15 = v14;
    uint64_t v16 = swift_slowAlloc();
    v42[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315651;
    uint64_t v34 = v8;
    uint64_t v41 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, v42);
    uint64_t v32 = v4;
    sub_25BCA1880();
    *(_WORD *)(v15 + 12) = 2085;
    uint64_t v41 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v42);
    sub_25BCA1880();
    *(_WORD *)(v15 + 22) = 2085;
    uint64_t v41 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, v42);
    uint64_t v4 = v32;
    uint64_t v8 = v34;
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v12, v13, "SafariSummarizationPrefetch - Observing referenced assetSet is updated for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x261174A10](v16, -1, -1);
    uint64_t v17 = v15;
    uint64_t v5 = v33;
    MEMORY[0x261174A10](v17, -1, -1);
  }

  unint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v10, v4);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v20 = Strong;
    uint64_t v21 = sub_25BCA1780();
    uint64_t v22 = v38;
    __swift_storeEnumTagSinglePayload(v38, 1, 1, v21);
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = 0;
    v23[3] = 0;
    uint64_t v24 = v37;
    v23[4] = v20;
    v23[5] = v24;
    sub_25BC98994(v22, (uint64_t)&unk_26A554920, (uint64_t)v23);
    return swift_release();
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v35)(v8, v36, v4);
    BOOL v26 = sub_25BCA14F0();
    os_log_type_t v27 = sub_25BCA17E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v41 = v29;
      *(_DWORD *)uint64_t v28 = 136315651;
      uint64_t v34 = v8;
      uint64_t v40 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, &v41);
      sub_25BCA1880();
      *(_WORD *)(v28 + 12) = 2085;
      uint64_t v40 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v41);
      sub_25BCA1880();
      *(_WORD *)(v28 + 22) = 2085;
      uint64_t v40 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, &v41);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v26, v27, "SafariSummarizationPrefetch - Failed to update loadedAssets due to self for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v29, -1, -1);
      MEMORY[0x261174A10](v28, -1, -1);

      uint64_t v30 = v34;
    }
    else
    {

      uint64_t v30 = v8;
    }
    return ((uint64_t (*)(char *, uint64_t))v18)(v30, v4);
  }
}

uint64_t sub_25BC83BD4()
{
  uint64_t v1 = sub_25BCA1510();
  v0[5] = v1;
  v0[6] = *(void *)(v1 - 8);
  v0[7] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BC83CC0;
  return sub_25BC84098();
}

uint64_t sub_25BC83CC0()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_18();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_5();
    return v10();
  }
}

uint64_t sub_25BC83DC0()
{
  uint64_t v19 = v0;
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v4 = __swift_project_value_buffer(v1, (uint64_t)qword_26B34BF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  uint64_t v5 = sub_25BCA14F0();
  os_log_type_t v6 = sub_25BCA17E0();
  if (os_log_type_enabled(v5, v6))
  {
    id v17 = *(id *)(v0 + 72);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315651;
    OUTLINED_FUNCTION_13_0();
    uint64_t v9 = sub_25BC9E6B4(0xD000000000000014, v8, &v18);
    OUTLINED_FUNCTION_26_0(v9);
    uint64_t v10 = sub_25BCA1880();
    *(_WORD *)(v7 + 12) = 2085;
    *(void *)(v0 + 24) = OUTLINED_FUNCTION_2_1(v10, v11, &v18);
    uint64_t v12 = sub_25BCA1880();
    *(_WORD *)(v7 + 22) = 2085;
    *(void *)(v0 + 32) = OUTLINED_FUNCTION_2_1(v12, v13, &v18);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v5, v6, "SafariSummarizationPrefetch - Failed to update loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {

    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_51();
  v14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v15();
}

uint64_t sub_25BC84024()
{
  sub_25BC7DD64(v0 + 40, (uint64_t)v4);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  uint64_t v1 = OUTLINED_FUNCTION_16();
  v2(v1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_25BC84098()
{
  OUTLINED_FUNCTION_4();
  v1[31] = v0;
  uint64_t v2 = sub_25BCA1510();
  v1[32] = v2;
  OUTLINED_FUNCTION_4_1(v2);
  v1[33] = v3;
  v1[34] = OUTLINED_FUNCTION_41();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D0);
  OUTLINED_FUNCTION_47(v4);
  v1[40] = OUTLINED_FUNCTION_81();
  uint64_t v5 = sub_25BCA1300();
  v1[41] = v5;
  OUTLINED_FUNCTION_4_1(v5);
  v1[42] = v6;
  v1[43] = OUTLINED_FUNCTION_41();
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  uint64_t v7 = sub_25BCA1420();
  v1[46] = v7;
  OUTLINED_FUNCTION_4_1(v7);
  v1[47] = v8;
  v1[48] = OUTLINED_FUNCTION_81();
  uint64_t v9 = sub_25BCA1480();
  OUTLINED_FUNCTION_47(v9);
  v1[49] = OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25BC8421C()
{
  v179 = v0;
  uint64_t v1 = v0;
  uint64_t v3 = v0 + 31;
  uint64_t v2 = v0[31];
  uint64_t v4 = v0[49];
  uint64_t v5 = *(void **)(v2 + 16);
  (*(void (**)(void, void, void))(v0[47] + 104))(v0[48], *MEMORY[0x263F5D0A0], v0[46]);
  swift_retain();
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  swift_allocObject();
  uint64_t v6 = sub_25BC9696C(v5, 36, v4, 0, 1);
  uint64_t v7 = v6;
  v0[50] = v6;
  if ((*(unsigned char *)(v2 + 80) & 1) == 0) {
    *(unsigned char *)(v6 + qword_26A554C38) = 1;
  }
  uint64_t v8 = (void *)sub_25BC8599C(v6);
  v0[51] = v8;
  uint64_t v9 = v8;
  v170 = v0 + 17;
  v172 = v0 + 19;
  id v10 = objc_msgSend(v8, sel_location);
  if (!v10)
  {
    __swift_storeEnumTagSinglePayload(v0[40], 1, 1, v0[41]);
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v0[44];
  uint64_t v13 = v0[41];
  uint64_t v14 = v0[42];
  v174 = v9;
  uint64_t v15 = v1[40];
  sub_25BCA12A0();

  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
  v16(v15, v12, v13);
  __swift_storeEnumTagSinglePayload(v15, 0, 1, v13);
  uint64_t v17 = v15;
  uint64_t v9 = v174;
  if (__swift_getEnumTagSinglePayload(v17, 1, v13) == 1)
  {
LABEL_7:
    sub_25BC8AE74(v1[40], &qword_26A5548D0);
    *(unsigned char *)(v7 + qword_26A554C30) = 83;
    sub_25BC96FE8();
    if (qword_26B34B690 != -1) {
      uint64_t v19 = swift_once();
    }
    uint64_t v20 = OUTLINED_FUNCTION_5_1(v19, (uint64_t)qword_26B34BF78);
    v21(v20);
    id v22 = v9;
    uint64_t v23 = sub_25BCA14F0();
    os_log_type_t v24 = sub_25BCA17E0();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_t v164 = (os_log_t)(v3 - 21);
      uint64_t v25 = v3 - 13;
      uint64_t v26 = OUTLINED_FUNCTION_34();
      os_log_type_t v27 = (void *)OUTLINED_FUNCTION_33();
      v178[0] = OUTLINED_FUNCTION_32();
      *(_DWORD *)uint64_t v26 = 138740483;
      void *v25 = v22;
      id v28 = v22;
      sub_25BCA1880();
      void *v27 = v22;

      *(_WORD *)(v26 + 12) = 2085;
      uint64_t *v170 = OUTLINED_FUNCTION_2_1(v29, v30, v178);
      uint64_t v31 = sub_25BCA1880();
      *(_WORD *)(v26 + 22) = 2085;
      v164->isa = (Class)OUTLINED_FUNCTION_2_1(v31, v32, v178);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v23, v24, "SafariSummarizationPrefetch - Failed to get asset location for asset: %{sensitive}@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v26, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_92();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      OUTLINED_FUNCTION_16();
    }
    OUTLINED_FUNCTION_15_0();
    v33();
    sub_25BC8A4B4();
    uint64_t v34 = swift_allocError();
    OUTLINED_FUNCTION_36(v34, v35);

    swift_release();
    goto LABEL_18;
  }
  v167 = v3 - 17;
  v16(v1[45], v1[40], v1[41]);
  uint64_t v18 = sub_25BCA1290();
  v169 = v1;
  uint64_t v177 = v7;
  if (v18)
  {
    if (qword_26B34B690 != -1) {
      uint64_t v18 = swift_once();
    }
    uint64_t v36 = OUTLINED_FUNCTION_5_1(v18, (uint64_t)qword_26B34BF78);
    v37(v36);
    id v38 = v174;
    uint64_t v39 = sub_25BCA14F0();
    os_log_type_t v40 = sub_25BCA1800();
    if (os_log_type_enabled(v39, v40))
    {
      v158 = v3 - 1;
      uint64_t v41 = OUTLINED_FUNCTION_34();
      log = v39;
      uint64_t v42 = (void *)OUTLINED_FUNCTION_33();
      os_log_t v162 = (os_log_t)OUTLINED_FUNCTION_32();
      v178[0] = (uint64_t)v162;
      *(_DWORD *)uint64_t v41 = 138740483;
      *(v3 - 3) = v38;
      id v43 = v38;
      uint64_t v9 = v174;
      sub_25BCA1880();
      void *v42 = v38;

      *(_WORD *)(v41 + 12) = 2085;
      uint64_t v46 = OUTLINED_FUNCTION_2_1(v44, v45, v178);
      OUTLINED_FUNCTION_26_0(v46);
      uint64_t v47 = OUTLINED_FUNCTION_49();
      *(_WORD *)(v41 + 22) = 2085;
      uint64_t v49 = OUTLINED_FUNCTION_2_1(v47, v48, v178);
      OUTLINED_FUNCTION_26_0(v49);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, log, v40, "SafariSummarizationPrefetch - Successfully retrieved reachable asset location for asset: %{sensitive}@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v41, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      uint64_t v1 = v169;
      OUTLINED_FUNCTION_7();
    }
    else
    {

      OUTLINED_FUNCTION_43();
    }
    OUTLINED_FUNCTION_15_0();
    v54();
  }
  id v55 = objc_msgSend(v9, sel_metadata, v158);
  uint64_t v56 = sub_25BCA1540();

  if (qword_26A554370 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = OUTLINED_FUNCTION_16();
  uint64_t v59 = sub_25BC987A4(v57, v58, v56);
  unint64_t v61 = v60;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[52] = v61;
  if (!v61)
  {
    *(unsigned char *)(v7 + qword_26A554C30) = 83;
    sub_25BC96FE8();
    if (qword_26B34B690 != -1) {
      uint64_t v105 = swift_once();
    }
    uint64_t v106 = OUTLINED_FUNCTION_5_1(v105, (uint64_t)qword_26B34BF78);
    v107(v106);
    id v108 = v174;
    uint64_t v109 = sub_25BCA14F0();
    os_log_type_t v110 = sub_25BCA17E0();
    BOOL v111 = os_log_type_enabled(v109, v110);
    uint64_t v112 = v1[36];
    uint64_t v113 = v1[32];
    uint64_t v114 = v1[33];
    if (v111)
    {
      uint64_t v176 = v1[36];
      v166 = v3 - 15;
      uint64_t v115 = OUTLINED_FUNCTION_34();
      uint64_t v116 = (void *)OUTLINED_FUNCTION_33();
      v178[0] = OUTLINED_FUNCTION_32();
      *(_DWORD *)uint64_t v115 = 138740483;
      void *v167 = v108;
      id v117 = v108;
      OUTLINED_FUNCTION_16();
      sub_25BCA1880();
      *uint64_t v116 = v108;

      *(_WORD *)(v115 + 12) = 2085;
      uint64_t v120 = OUTLINED_FUNCTION_2_1(v118, v119, v178);
      OUTLINED_FUNCTION_26_0(v120);
      uint64_t v121 = sub_25BCA1880();
      *(_WORD *)(v115 + 22) = 2085;
      uint64_t *v166 = OUTLINED_FUNCTION_2_1(v121, v122, v178);
      sub_25BCA1880();
      OUTLINED_FUNCTION_74(&dword_25BC76000, v123, v124, "SafariSummarizationPrefetch - Failed to get asset metadata version for asset: %{sensitive}@, countryCode: %{sensitive}s, locale: %{sensitive}s", v125, v126, v127, v128, v159, (uint64_t)log, (uint64_t)v162, (uint64_t)v109, v110);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v176, v113);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v112, v113);
    }
    sub_25BC8A4B4();
    uint64_t v138 = swift_allocError();
    OUTLINED_FUNCTION_36(v138, v139);

    swift_release();
    uint64_t v50 = OUTLINED_FUNCTION_43();
    v51(v50);
LABEL_18:
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
    OUTLINED_FUNCTION_5();
    goto LABEL_19;
  }
  uint64_t v171 = v59;
  unint64_t v175 = v61;
  v168 = v3 - 7;
  OUTLINED_FUNCTION_11();
  swift_retain();
  uint64_t v62 = sub_25BC98424();
  swift_release();
  uint64_t v63 = sub_25BC98758(v62);
  swift_bridgeObjectRelease();
  if (!v63) {
    goto LABEL_36;
  }
  uint64_t v64 = sub_25BC9875C(v63);
  swift_bridgeObjectRelease();
  if (!v64) {
    goto LABEL_36;
  }
  id v65 = objc_msgSend(v64, sel_metadata);
  uint64_t v66 = sub_25BCA1540();

  uint64_t v67 = qword_26A554E28;
  uint64_t v68 = unk_26A554E30;
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_25BC987A4(v67, v68, v66);
  uint64_t v71 = v70;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v72 = 0x26B34B000uLL;
  if (v71)
  {
    if (v69 == v59 && v71 == v175)
    {
      uint64_t v75 = swift_bridgeObjectRelease();
    }
    else
    {
      char v74 = sub_25BCA1A70();
      uint64_t v75 = swift_bridgeObjectRelease();
      if ((v74 & 1) == 0) {
        goto LABEL_35;
      }
    }
    if (qword_26B34B690 != -1) {
      uint64_t v75 = swift_once();
    }
    uint64_t v140 = OUTLINED_FUNCTION_5_1(v75, (uint64_t)qword_26B34BF78);
    v141(v140);
    id v142 = v174;
    swift_bridgeObjectRetain_n();
    id v143 = v142;
    v144 = sub_25BCA14F0();
    os_log_type_t v173 = sub_25BCA17E0();
    if (os_log_type_enabled(v144, v173))
    {
      v145 = v3 - 6;
      v160 = v3 - 5;
      uint64_t v146 = swift_slowAlloc();
      v163 = v144;
      v147 = (void *)OUTLINED_FUNCTION_33();
      v178[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v146 = 136315907;
      swift_bridgeObjectRetain();
      uint64_t *v168 = sub_25BC9E6B4(v171, v175, v178);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v146 + 12) = 2117;
      void *v145 = v143;
      v148 = v1;
      id v149 = v143;
      unint64_t v72 = 0x26B34B000;
      sub_25BCA1880();
      void *v147 = v143;

      uint64_t v1 = v148;
      *(_WORD *)(v146 + 22) = 2085;
      uint64_t *v160 = OUTLINED_FUNCTION_2_1(v150, v151, v178);
      uint64_t v152 = OUTLINED_FUNCTION_49();
      *(_WORD *)(v146 + 32) = 2085;
      uint64_t v154 = OUTLINED_FUNCTION_2_1(v152, v153, v178);
      OUTLINED_FUNCTION_26_0(v154);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v163, v173, "SafariSummarizationPrefetch - Skipping update to loadedAssets, already updated to asset version: %s, asset: %{sensitive}@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v146, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_9_0();
      v155();
    }
    else
    {
      OUTLINED_FUNCTION_59();

      uint64_t v156 = OUTLINED_FUNCTION_16();
      v157(v156);
    }
    *(unsigned char *)(v177 + qword_26A554C30) = 93;
    sub_25BC96FE8();

    goto LABEL_46;
  }
LABEL_35:

LABEL_36:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554900);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BCA2560;
  *(void *)(inited + 32) = v174;
  sub_25BC8B15C(0, &qword_26A554908);
  sub_25BC7DCF0();
  id v77 = v174;
  uint64_t v78 = sub_25BCA1560();
  swift_retain();
  uint64_t v79 = sub_25BC98424();
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v178[0] = v79;
  sub_25BC978B8(v78, isUniquelyReferenced_nonNull_native);
  uint64_t v81 = v178[0];
  swift_bridgeObjectRelease();
  sub_25BC98624(v81);
  swift_release();
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v82 = v1[45];
  uint64_t v84 = v1[42];
  uint64_t v83 = v1[43];
  uint64_t v85 = v1[41];
  uint64_t v86 = v1[37];
  uint64_t v87 = v169[33];
  uint64_t v88 = v169[32];
  uint64_t v89 = __swift_project_value_buffer(v88, (uint64_t)qword_26B34BF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16))(v86, v89, v88);
  uint64_t v1 = v169;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v83, v82, v85);
  swift_bridgeObjectRetain_n();
  unint64_t v90 = sub_25BCA14F0();
  os_log_type_t v165 = sub_25BCA1800();
  if (os_log_type_enabled(v90, v165))
  {
    unint64_t v91 = v3 - 11;
    uint64_t v92 = swift_slowAlloc();
    v178[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v92 = 136316163;
    swift_bridgeObjectRetain();
    uint64_t *v172 = sub_25BC9E6B4(v171, v175, v178);
    sub_25BCA1880();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v92 + 12) = 2085;
    sub_25BC8ADAC();
    uint64_t v93 = sub_25BCA1A50();
    *unint64_t v91 = sub_25BC9E6B4(v93, v94, v178);
    uint64_t v1 = v169;
    sub_25BCA1880();
    swift_bridgeObjectRelease();
    uint64_t v95 = OUTLINED_FUNCTION_57();
    v96(v95);
    *(_WORD *)(v92 + 22) = 2080;
    OUTLINED_FUNCTION_13_0();
    uint64_t v98 = sub_25BC9E6B4(0xD00000000000001DLL, v97, v178);
    OUTLINED_FUNCTION_26_0(v98);
    uint64_t v99 = OUTLINED_FUNCTION_49();
    *(_WORD *)(v92 + 32) = 2085;
    uint64_t v101 = OUTLINED_FUNCTION_2_1(v99, v100, v178);
    OUTLINED_FUNCTION_26_0(v101);
    uint64_t v102 = OUTLINED_FUNCTION_49();
    *(_WORD *)(v92 + 42) = 2085;
    uint64_t v104 = OUTLINED_FUNCTION_2_1(v102, v103, v178);
    OUTLINED_FUNCTION_26_0(v104);
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v90, v165, "SafariSummarizationPrefetch - Successfully loaded the retrieved asset version: %s, assetLocation: %{sensitive}s, assetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v92, 0x34u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v129 = OUTLINED_FUNCTION_57();
    v130(v129);
  }

  OUTLINED_FUNCTION_15_0();
  v131();
  *(unsigned char *)(v177 + qword_26A554C30) = 78;
  sub_25BC96FE8();
  unint64_t v72 = 0x26B34B000uLL;
LABEL_46:
  uint64_t v132 = MEMORY[0x261174AC0](v1[31] + 24);
  v1[53] = v132;
  if (v132)
  {
    uint64_t v133 = (void *)swift_task_alloc();
    v1[54] = v133;
    *uint64_t v133 = v1;
    v133[1] = sub_25BC857A4;
    return sub_25BC7A34C();
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v72 + 1680) != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1[32], (uint64_t)qword_26B34BF78);
  uint64_t v134 = sub_25BCA14F0();
  os_log_type_t v135 = sub_25BCA17E0();
  if (os_log_type_enabled(v134, v135))
  {
    uint64_t v136 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v136);
    OUTLINED_FUNCTION_73(&dword_25BC76000, v134, v135, "SafariSummarizationPrefetch - Failed to call didUpdateLoadedAssets since delegate is not set");
    OUTLINED_FUNCTION_7();
  }

  swift_release();
  OUTLINED_FUNCTION_25_0();
  v137();
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
  uint64_t v52 = (uint64_t (*)(void))v1[1];
LABEL_19:
  return v52();
}

uint64_t sub_25BC857A4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25BC85888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_56();
  uint64_t v15 = (void *)v14[51];
  swift_unknownObjectRelease();

  swift_release();
  uint64_t v26 = v14[36];
  uint64_t v27 = v14[35];
  uint64_t v28 = v14[34];
  OUTLINED_FUNCTION_25_0();
  v16();
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
  OUTLINED_FUNCTION_68();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, v26, v27, v28, a12, a13, a14);
}

uint64_t sub_25BC8599C(uint64_t a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BCA26A0;
  if (qword_26A554368 != -1) {
    swift_once();
  }
  uint64_t v6 = unk_26A554E20;
  *(void *)(inited + 32) = qword_26A554E18;
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = 0x6E6F6D6D6F63;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 64) = 0xD000000000000010;
  *(void *)(inited + 72) = 0x800000025BCA4E10;
  *(void *)(inited + 80) = 0x6E6F6D6D6F63;
  *(void *)(inited + 88) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25BCA1560();
  uint64_t v8 = (void *)MEMORY[0x2611743E0]();
  sub_25BC85B14(v3, v7, a1, &v10);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_25BC85B14(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v47 = a4;
  uint64_t v48 = a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_25BCA1510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v49 = v6;
  uint64_t v50 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v45[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v45[-v11];
  id v13 = objc_msgSend(self, sel_currentProcess);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548E8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_25BCA2B00;
  sub_25BC8B15C(0, &qword_26A5548F0);
  *(void *)(v14 + 32) = sub_25BC86320();
  v53[0] = (id)v14;
  sub_25BCA1710();
  id v15 = objc_allocWithZone(MEMORY[0x263F64408]);
  id v16 = sub_25BC8A40C(0xD000000000000020, 0x800000025BCA4E30, v13);
  v53[0] = 0;
  id v51 = v16;
  if (objc_msgSend(v16, sel_acquireWithError_, v53))
  {
    id v17 = v53[0];
  }
  else
  {
    id v18 = v53[0];
    uint64_t v19 = (void *)sub_25BCA1240();

    swift_willThrow();
  }
  sub_25BC7DD64(a1 + 40, (uint64_t)v53);
  uint64_t v20 = v54;
  uint64_t v21 = v55;
  __swift_project_boxed_opaque_existential_1(v53, v54);
  uint64_t v22 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v21 + 32))(0xD000000000000014, 0x800000025BCA4820, a2, v20, v21);
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    uint64_t v24 = (void *)sub_25BCA1590();
    id v25 = objc_msgSend(v23, sel_assetNamed_, v24);

    if (v25)
    {

      *uint64_t v47 = v25;
    }
    else
    {
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      uint64_t v33 = v49;
      uint64_t v34 = __swift_project_value_buffer(v49, (uint64_t)qword_26B34BF78);
      uint64_t v35 = v50;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v50 + 16))(v10, v34, v33);
      uint64_t v36 = sub_25BCA14F0();
      os_log_type_t v37 = sub_25BCA17E0();
      int v38 = v37;
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v39 = swift_slowAlloc();
        int v46 = v38;
        uint64_t v40 = v39;
        uint64_t v47 = (void *)swift_slowAlloc();
        v53[0] = v47;
        *(_DWORD *)uint64_t v40 = 136315907;
        uint64_t v52 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, (uint64_t *)v53);
        sub_25BCA1880();
        *(_WORD *)(v40 + 12) = 2080;
        uint64_t v52 = sub_25BC9E6B4(0xD00000000000001DLL, 0x800000025BCA4860, (uint64_t *)v53);
        sub_25BCA1880();
        *(_WORD *)(v40 + 22) = 2085;
        uint64_t v52 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)v53);
        sub_25BCA1880();
        *(_WORD *)(v40 + 32) = 2085;
        uint64_t v52 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)v53);
        sub_25BCA1880();
        _os_log_impl(&dword_25BC76000, v36, (os_log_type_t)v46, "SafariSummarizationPrefetch - Failed to retrieve AssetSet: %s, with name: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v40, 0x2Au);
        uint64_t v41 = v47;
        swift_arrayDestroy();
        MEMORY[0x261174A10](v41, -1, -1);
        MEMORY[0x261174A10](v40, -1, -1);

        (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v10, v49);
      }
      else
      {

        (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v10, v33);
      }
      if (v48)
      {
        *(unsigned char *)(v48 + qword_26A554C30) = 82;
        sub_25BC96FE8();
      }
      sub_25BC8A4B4();
      swift_allocError();
      unsigned char *v43 = 6;
      swift_willThrow();
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v26 = v49;
    uint64_t v27 = __swift_project_value_buffer(v49, (uint64_t)qword_26B34BF78);
    uint64_t v28 = v50;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v50 + 16))(v12, v27, v26);
    uint64_t v29 = sub_25BCA14F0();
    os_log_type_t v30 = sub_25BCA17E0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      v53[0] = v32;
      *(_DWORD *)uint64_t v31 = 136315651;
      uint64_t v52 = sub_25BC9E6B4(0xD000000000000014, 0x800000025BCA4820, (uint64_t *)v53);
      sub_25BCA1880();
      *(_WORD *)(v31 + 12) = 2085;
      uint64_t v52 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)v53);
      sub_25BCA1880();
      *(_WORD *)(v31 + 22) = 2085;
      uint64_t v52 = sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)v53);
      sub_25BCA1880();
      _os_log_impl(&dword_25BC76000, v29, v30, "SafariSummarizationPrefetch - Failed to retrieve AssetSet: %s, countryCode: %{sensitive}s, locale: %{sensitive}s. Most likely due to UAF assets not downloaded", (uint8_t *)v31, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v32, -1, -1);
      MEMORY[0x261174A10](v31, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v12, v26);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v28 + 8))(v12, v26);
    }
    if (v48)
    {
      *(unsigned char *)(v48 + qword_26A554C30) = 81;
      sub_25BC96FE8();
    }
    sub_25BC8A4B4();
    swift_allocError();
    unsigned char *v42 = 6;
    swift_willThrow();
  }
  id v44 = v51;
  objc_msgSend(v51, sel_invalidate);
}

id sub_25BC86320()
{
  uint64_t v0 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributeWithDomain_name_, v0, v1);

  return v2;
}

os_log_t sub_25BC863B4(uint64_t a1)
{
  v74[1] = a1;
  uint64_t v3 = v2;
  sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v79 = v5;
  uint64_t v80 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_31();
  uint64_t v78 = v6;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v7);
  id v77 = (char *)v74 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D0);
  uint64_t v10 = OUTLINED_FUNCTION_47(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_25BCA1300();
  OUTLINED_FUNCTION_0_3();
  os_log_t v76 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_69();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_64(v18, v19, v20, v21, v22, v23, v24, v25, v74[0]);
  uint64_t v26 = sub_25BCA1420();
  OUTLINED_FUNCTION_0_3();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_10();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = sub_25BCA1480();
  uint64_t v34 = OUTLINED_FUNCTION_47(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_10();
  uint64_t v37 = v36 - v35;
  int v38 = *(void **)(v3 + 16);
  (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v32, *MEMORY[0x263F5D0A0], v26);
  swift_retain();
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  swift_allocObject();
  uint64_t v39 = sub_25BC9696C(v38, 34, v37, 0, 1);
  uint64_t v40 = (char *)v39;
  if ((*(unsigned char *)(v3 + 80) & 1) == 0) {
    *(unsigned char *)(v39 + qword_26A554C38) = 1;
  }
  swift_beginAccess();
  swift_retain();
  uint64_t v41 = sub_25BC98424();
  swift_release();
  uint64_t v42 = sub_25BC98758(v41);
  swift_bridgeObjectRelease();
  if (v42 && (id v43 = sub_25BC9875C(v42), swift_bridgeObjectRelease(), v43))
  {
    id v44 = objc_msgSend(v43, sel_location);
    uint64_t v45 = v80;
    if (v44)
    {
      int v46 = v44;
      sub_25BCA12A0();

      Class isa = v76[4].isa;
      ((void (*)(uint64_t, uint64_t, uint64_t))isa)(v13, v1, v14);
      __swift_storeEnumTagSinglePayload(v13, 0, 1, v14);
      if (__swift_getEnumTagSinglePayload(v13, 1, v14) != 1)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t))isa)(v74[0], v13, v14);
        v40[qword_26A554C30] = 78;
        sub_25BC96FE8();
        OUTLINED_FUNCTION_66();
        OUTLINED_FUNCTION_7_1();
        v48();
        id v49 = objc_msgSend(v43, sel_metadata);
        os_log_t v50 = (os_log_t)sub_25BCA1540();

        swift_release();
        OUTLINED_FUNCTION_15_0();
        v51();
        return v50;
      }
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
    }
    sub_25BC8AE74(v13, &qword_26A5548D0);
    v40[qword_26A554C30] = 83;
    sub_25BC96FE8();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    os_log_t v50 = (os_log_t)v45;
    OUTLINED_FUNCTION_44(v45, (uint64_t)qword_26B34BF78);
    uint64_t v60 = v79;
    OUTLINED_FUNCTION_80();
    unint64_t v61 = v77;
    OUTLINED_FUNCTION_7_1();
    v62();
    id v63 = v43;
    uint64_t v64 = sub_25BCA14F0();
    os_log_type_t v65 = sub_25BCA17E0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = swift_slowAlloc();
      os_log_t v76 = v64;
      uint64_t v67 = v66;
      uint64_t v75 = (void *)swift_slowAlloc();
      uint64_t v78 = OUTLINED_FUNCTION_32();
      uint64_t v82 = v78;
      *(_DWORD *)uint64_t v67 = 138740483;
      uint64_t v81 = (uint64_t)v63;
      id v68 = v63;
      sub_25BCA1880();
      void *v75 = v43;

      *(_WORD *)(v67 + 12) = 2085;
      uint64_t v69 = OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_87(v69);
      *(_WORD *)(v67 + 22) = 2085;
      uint64_t v70 = OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_87(v70);
      os_log_t v50 = v76;
      _os_log_impl(&dword_25BC76000, v76, v65, "SafariSummarizationPrefetch - Failed to get loaded asset location for asset: %{sensitive}@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v67, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_9_0();
      v71();
    }
    else
    {

      (*(void (**)(char *, os_log_t))(v60 + 8))(v61, v50);
    }
    sub_25BC8A4B4();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_35(v72, 6);
    swift_release();
  }
  else
  {
    v40[qword_26A554C30] = 82;
    id v77 = v40;
    sub_25BC96FE8();
    uint64_t v53 = v79;
    uint64_t v52 = v80;
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_44(v52, (uint64_t)qword_26B34BF78);
    uint64_t v54 = v78;
    OUTLINED_FUNCTION_7_1();
    v55();
    os_log_t v50 = (os_log_t)sub_25BCA14F0();
    os_log_type_t v56 = sub_25BCA17E0();
    if (os_log_type_enabled(v50, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315651;
      OUTLINED_FUNCTION_13_0();
      uint64_t v81 = sub_25BC9E6B4(0xD000000000000014, v58, &v82);
      OUTLINED_FUNCTION_60();
      *(_WORD *)(v57 + 12) = 2085;
      uint64_t v81 = OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_60();
      *(_WORD *)(v57 + 22) = 2085;
      uint64_t v81 = OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_60();
      _os_log_impl(&dword_25BC76000, v50, v56, "SafariSummarizationPrefetch - Failed to get loaded asset for assetNamed: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v57, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v78, v52);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v52);
    }
    sub_25BC8A4B4();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_35(v59, 6);
    swift_release();
  }
  return v50;
}

uint64_t sub_25BC86BDC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v179 = a1;
  unint64_t v180 = a2;
  os_log_type_t v165 = a4;
  sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v173 = v7;
  uint64_t v174 = v8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_31();
  uint64_t v169 = v9;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_70();
  uint64_t v167 = v11;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_70();
  uint64_t v168 = v13;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v14);
  v166 = (char *)&v158 - v15;
  sub_25BCA1250();
  OUTLINED_FUNCTION_0_3();
  uint64_t v171 = v17;
  uint64_t v172 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_29();
  uint64_t v170 = v18;
  sub_25BCA1420();
  OUTLINED_FUNCTION_0_3();
  uint64_t v176 = v20;
  uint64_t v177 = v19;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_29();
  os_log_t v175 = v21;
  uint64_t v22 = sub_25BCA1480();
  uint64_t v23 = OUTLINED_FUNCTION_47(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_29();
  uint64_t v178 = v24;
  uint64_t v25 = sub_25BCA1300();
  OUTLINED_FUNCTION_0_3();
  uint64_t v181 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_30();
  unint64_t v30 = v28 - v29;
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v34 = (void (*)(uint64_t))((char *)&v158 - v33);
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v158 - v36;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_69();
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v158 - v39;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v41 = v5;
  uint64_t v42 = v182;
  uint64_t result = (uint64_t)sub_25BC863B4((uint64_t)v40);
  if (v42) {
    return result;
  }
  uint64_t v44 = result;
  v161 = (void (*)(uint64_t))v30;
  uint64_t v159 = v34;
  v160 = v37;
  uint64_t v162 = 0;
  uint64_t v163 = v4;
  v182 = v40;
  uint64_t v164 = v25;
  uint64_t v186 = result;
  uint64_t v45 = *(void **)(v5 + 16);
  v176[13](v175, *MEMORY[0x263F5D0A0], v177);
  swift_retain();
  uint64_t v46 = v178;
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  swift_allocObject();
  uint64_t v47 = sub_25BC9696C(v45, 35, v46, 0, 1);
  unint64_t v48 = v47;
  uint64_t v49 = v44;
  if ((*(unsigned char *)(v41 + 80) & 1) == 0) {
    *(unsigned char *)(v47 + qword_26A554C38) = 1;
  }
  uint64_t v178 = sub_25BC8B15C(0, &qword_26A5548C8);
  uint64_t v50 = sub_25BC809A4(v179, v180);
  if (v50 < 0)
  {
    uint64_t result = sub_25BCA1980();
    __break(1u);
    return result;
  }
  unint64_t v51 = v50;
  uint64_t v52 = swift_bridgeObjectRetain();
  uint64_t v53 = sub_25BC87EAC(v52);
  char v55 = v54;
  swift_bridgeObjectRelease();
  if (v55) {
    unint64_t v56 = 1;
  }
  else {
    unint64_t v56 = v53;
  }
  if (!v56)
  {
    __break(1u);
    goto LABEL_66;
  }
  unint64_t v183 = v51 % v56;
  sub_25BCA1A50();
  unint64_t v183 = 0xD000000000000019;
  unint64_t v184 = 0x800000025BCA4DF0;
  sub_25BCA1640();
  swift_bridgeObjectRelease();
  uint64_t v57 = v183;
  unint64_t v30 = v184;
  swift_bridgeObjectRetain();
  uint64_t v179 = v57;
  uint64_t v58 = sub_25BC987A4(v57, v30, v49);
  unint64_t v60 = v59;
  swift_bridgeObjectRelease();
  if (!v60)
  {
    if (qword_26B34B690 == -1)
    {
LABEL_13:
      OUTLINED_FUNCTION_44(v173, (uint64_t)qword_26B34BF78);
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_7_1();
      v68();
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_25BCA14F0();
      os_log_type_t v70 = sub_25BCA17E0();
      if (os_log_type_enabled(v69, v70))
      {
        unint64_t v180 = v48;
        uint64_t v71 = swift_slowAlloc();
        v185[0] = OUTLINED_FUNCTION_32();
        *(_DWORD *)uint64_t v71 = 136315907;
        swift_bridgeObjectRetain();
        unint64_t v183 = sub_25BC9E6B4(v179, v30, v185);
        sub_25BCA1880();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v71 + 12) = 2053;
        unint64_t v183 = v51;
        sub_25BCA1880();
        *(_WORD *)(v71 + 22) = 2048;
        unint64_t v183 = v56;
        sub_25BCA1880();
        *(_WORD *)(v71 + 32) = 2080;
        if (qword_26A554370 != -1) {
          swift_once();
        }
        uint64_t v72 = qword_26A554E28;
        uint64_t v73 = unk_26A554E30;
        OUTLINED_FUNCTION_17_0();
        uint64_t v74 = v186;
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_25BC987A4(v72, v73, v74);
        unint64_t v77 = v76;
        swift_endAccess();
        swift_bridgeObjectRelease();
        if (v77) {
          uint64_t v78 = v75;
        }
        else {
          uint64_t v78 = 6369134;
        }
        if (v77) {
          unint64_t v79 = v77;
        }
        else {
          unint64_t v79 = 0xE300000000000000;
        }
        unint64_t v183 = sub_25BC9E6B4(v78, v79, v185);
        sub_25BCA1880();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25BC76000, v69, v70, "SafariSummarizationPrefetch - Failed to find %s key in metadata dictionary for hash: %{sensitive}llu, numShards: %llu, version: %s", (uint8_t *)v71, 0x2Au);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        OUTLINED_FUNCTION_91();
        OUTLINED_FUNCTION_9_0();
        v80();
        unint64_t v48 = v180;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_15_0();
        v109();
      }
      *(unsigned char *)(v48 + qword_26A554C30) = 85;
      sub_25BC96FE8();
      sub_25BC8A4B4();
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_35(v110, 8);
      swift_release();
      OUTLINED_FUNCTION_15_0();
      v111();
      return swift_bridgeObjectRelease();
    }
LABEL_66:
    swift_once();
    goto LABEL_13;
  }
  unint64_t v180 = v48;
  unint64_t v183 = v58;
  unint64_t v184 = v60;
  (*(void (**)(uint64_t, void, uint64_t))(v171 + 104))(v170, *MEMORY[0x263F06E50], v172);
  sub_25BC8A500();
  uint64_t v61 = v163;
  uint64_t v62 = v182;
  sub_25BCA12F0();
  OUTLINED_FUNCTION_51();
  v63();
  uint64_t v64 = v162;
  char v65 = sub_25BCA1280();
  if (v64)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v181 + 8);
    uint64_t v67 = v164;
    v66(v61, v164);
    v66((uint64_t)v62, v67);
    return swift_bridgeObjectRelease();
  }
  unint64_t v81 = v60;
  uint64_t v177 = v58;
  uint64_t v82 = v164;
  uint64_t v83 = v168;
  if ((v65 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v112 = v173;
    OUTLINED_FUNCTION_44(v173, (uint64_t)qword_26B34BF78);
    uint64_t v113 = v174;
    uint64_t v114 = v167;
    OUTLINED_FUNCTION_7_1();
    v115();
    OUTLINED_FUNCTION_80();
    uint64_t v116 = v161;
    OUTLINED_FUNCTION_7_1();
    v117();
    uint64_t v118 = sub_25BCA14F0();
    int v119 = sub_25BCA17E0();
    if (os_log_type_enabled(v118, (os_log_type_t)v119))
    {
      LODWORD(v179) = v119;
      uint64_t v120 = OUTLINED_FUNCTION_58();
      v185[0] = OUTLINED_FUNCTION_32();
      *(_DWORD *)uint64_t v120 = 136643075;
      uint64_t v121 = sub_25BCA12C0();
      uint64_t v123 = OUTLINED_FUNCTION_61(v121, v122);
      OUTLINED_FUNCTION_71(v123);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      uint64_t v124 = OUTLINED_FUNCTION_22_0();
      v116(v124);
      *(_WORD *)(v120 + 12) = 2080;
      if (qword_26A554370 != -1) {
        swift_once();
      }
      uint64_t v125 = qword_26A554E28;
      uint64_t v126 = unk_26A554E30;
      OUTLINED_FUNCTION_17_0();
      uint64_t v127 = v186;
      swift_bridgeObjectRetain();
      uint64_t v128 = sub_25BC987A4(v125, v126, v127);
      uint64_t v130 = v129;
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v130) {
        uint64_t v131 = v128;
      }
      else {
        uint64_t v131 = 6369134;
      }
      unint64_t v183 = OUTLINED_FUNCTION_72(v131);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC76000, v118, (os_log_type_t)v179, "SafariSummarizationPrefetch - Failed to find bloom filter asset at path: %{sensitive}s, version: %s", (uint8_t *)v120, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_9_0();
      v132();
      uint64_t v82 = v164;
      uint64_t v62 = v182;
    }
    else
    {
      uint64_t v133 = OUTLINED_FUNCTION_22_0();
      v116(v133);

      (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v114, v112);
    }
    *(unsigned char *)(v180 + qword_26A554C30) = 80;
    sub_25BC96FE8();
    sub_25BC8A4B4();
    OUTLINED_FUNCTION_20_0();
    *uint64_t v134 = 0;
    swift_willThrow();
    swift_release();
    ((void (*)(uint64_t, uint64_t))v116)(v163, v82);
    ((void (*)(char *, uint64_t))v116)(v62, v82);
    return swift_bridgeObjectRelease();
  }
  uint64_t v162 = 0;
  sub_25BCA12C0();
  uint64_t v84 = (void (**)(os_log_t, void, uint64_t))sub_25BC87E48();
  if (!v84)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v135 = v174;
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v136 = v173;
    OUTLINED_FUNCTION_44(v173, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_7_1();
    v137();
    uint64_t v138 = v159;
    OUTLINED_FUNCTION_7_1();
    v139();
    uint64_t v140 = sub_25BCA14F0();
    int v141 = sub_25BCA17E0();
    if (os_log_type_enabled(v140, (os_log_type_t)v141))
    {
      LODWORD(v179) = v141;
      uint64_t v142 = OUTLINED_FUNCTION_58();
      v185[0] = OUTLINED_FUNCTION_32();
      *(_DWORD *)uint64_t v142 = 136643075;
      uint64_t v143 = sub_25BCA12C0();
      uint64_t v145 = OUTLINED_FUNCTION_61(v143, v144);
      OUTLINED_FUNCTION_71(v145);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      uint64_t v146 = OUTLINED_FUNCTION_21_0();
      v138(v146);
      *(_WORD *)(v142 + 12) = 2080;
      if (qword_26A554370 != -1) {
        swift_once();
      }
      uint64_t v147 = qword_26A554E28;
      uint64_t v148 = unk_26A554E30;
      OUTLINED_FUNCTION_17_0();
      uint64_t v149 = v186;
      swift_bridgeObjectRetain();
      uint64_t v150 = sub_25BC987A4(v147, v148, v149);
      uint64_t v152 = v151;
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v152) {
        uint64_t v153 = v150;
      }
      else {
        uint64_t v153 = 6369134;
      }
      unint64_t v183 = OUTLINED_FUNCTION_72(v153);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC76000, v140, (os_log_type_t)v179, "SafariSummarizationPrefetch - Failed to deserialize installed bloom filter binary at path: %{sensitive}s, version: %s", (uint8_t *)v142, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_9_0();
      v154();
      uint64_t v82 = v164;
    }
    else
    {
      uint64_t v156 = OUTLINED_FUNCTION_21_0();
      v138(v156);

      (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v83, v136);
    }
    *(unsigned char *)(v180 + qword_26A554C30) = 88;
    sub_25BC96FE8();
    sub_25BC8A4B4();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_35(v157, 1);
    swift_release();
    ((void (*)(uint64_t, uint64_t))v138)(v163, v82);
    ((void (*)(char *, uint64_t))v138)(v182, v82);
    return swift_bridgeObjectRelease();
  }
  uint64_t v176 = v84;
  uint64_t v85 = v174;
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v86 = v173;
  OUTLINED_FUNCTION_44(v173, (uint64_t)qword_26B34BF78);
  OUTLINED_FUNCTION_7_1();
  v87();
  uint64_t v88 = v181;
  OUTLINED_FUNCTION_66();
  uint64_t v89 = v82;
  OUTLINED_FUNCTION_7_1();
  v90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v91 = v85;
  uint64_t v92 = sub_25BCA14F0();
  int v93 = sub_25BCA1800();
  if (os_log_type_enabled(v92, (os_log_type_t)v93))
  {
    LODWORD(v172) = v93;
    os_log_t v175 = v92;
    uint64_t v94 = swift_slowAlloc();
    v185[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v94 = 136315907;
    swift_bridgeObjectRetain();
    unint64_t v183 = sub_25BC9E6B4(v179, v30, v185);
    sub_25BCA1880();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v94 + 12) = 2080;
    swift_bridgeObjectRetain();
    unint64_t v183 = sub_25BC9E6B4(v177, v81, v185);
    sub_25BCA1880();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v94 + 22) = 2080;
    if (qword_26A554370 != -1) {
      swift_once();
    }
    uint64_t v95 = qword_26A554E28;
    uint64_t v96 = unk_26A554E30;
    OUTLINED_FUNCTION_17_0();
    uint64_t v97 = v186;
    swift_bridgeObjectRetain();
    uint64_t v98 = sub_25BC987A4(v95, v96, v97);
    unint64_t v100 = v99;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (v100) {
      uint64_t v101 = v98;
    }
    else {
      uint64_t v101 = 6369134;
    }
    if (v100) {
      unint64_t v102 = v100;
    }
    else {
      unint64_t v102 = 0xE300000000000000;
    }
    unint64_t v183 = sub_25BC9E6B4(v101, v102, v185);
    sub_25BCA1880();
    swift_bridgeObjectRelease();
    *(_WORD *)(v94 + 32) = 2085;
    uint64_t v103 = sub_25BCA12C0();
    unint64_t v183 = OUTLINED_FUNCTION_61(v103, v104);
    sub_25BCA1880();
    swift_bridgeObjectRelease();
    uint64_t v105 = *(void (**)(void))(v181 + 8);
    uint64_t v106 = v164;
    OUTLINED_FUNCTION_25_0();
    v105();
    os_log_t v107 = v175;
    _os_log_impl(&dword_25BC76000, v175, (os_log_type_t)v172, "SafariSummarizationPrefetch - Successfully fetched and deserialized bloom filter shard binary: %s, file: %s, version: %s, at path: %{sensitive}s", (uint8_t *)v94, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_9_0();
    v108();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v105 = *(void (**)(void))(v88 + 8);
    uint64_t v106 = v89;
    OUTLINED_FUNCTION_15_0();
    v105();

    (*(void (**)(char *, uint64_t))(v91 + 8))(v166, v86);
  }
  v155 = v165;
  *(unsigned char *)(v180 + qword_26A554C30) = 78;
  sub_25BC96FE8();
  v155[3] = v178;
  v155[4] = &off_270951A68;
  swift_release();
  void *v155 = v176;
  ((void (*)(uint64_t, uint64_t))v105)(v163, v106);
  ((void (*)(char *, uint64_t))v105)(v182, v106);
  return swift_bridgeObjectRelease();
}

id sub_25BC87E48()
{
  uint64_t v0 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bloomFilterWithPathToFile_, v0);

  return v1;
}

uint64_t sub_25BC87EAC(uint64_t a1)
{
  uint64_t v3 = sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_30();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v70 - v11;
  OUTLINED_FUNCTION_13_0();
  uint64_t result = sub_25BC987A4(0xD000000000000017, v13, a1);
  if (!v15)
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_7_1();
    v23();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_25BCA14F0();
    os_log_type_t v25 = sub_25BCA17E0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v71 = v5;
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      v72[0] = OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v26 = 136315138;
      if (qword_26A554370 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_26A554E28;
      uint64_t v28 = unk_26A554E30;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_25BC987A4(v27, v28, a1);
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      if (v31) {
        uint64_t v32 = v29;
      }
      else {
        uint64_t v32 = 6369134;
      }
      if (v31) {
        unint64_t v33 = v31;
      }
      else {
        unint64_t v33 = 0xE300000000000000;
      }
      uint64_t v34 = sub_25BC9E6B4(v32, v33, v72);
      OUTLINED_FUNCTION_48(v34);
      OUTLINED_FUNCTION_59();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC76000, v24, v25, "SafariSummarizationPrefetch - Failed to find num_bloom_filter_shards key in metadata dictionary, version: %s", v26, 0xCu);
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_9_0();
      v35();
      return 0;
    }

    OUTLINED_FUNCTION_59();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
    return 0;
  }
  uint64_t v16 = v15;
  uint64_t v17 = HIBYTE(v15) & 0xF;
  uint64_t v18 = result & 0xFFFFFFFFFFFFLL;
  if ((v16 & 0x2000000000000000) != 0) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v19)
  {
    swift_bridgeObjectRelease();
LABEL_73:
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_7_1();
    v56();
    swift_bridgeObjectRetain_n();
    uint64_t v57 = sub_25BCA14F0();
    os_log_type_t v58 = sub_25BCA17E0();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v71 = v5;
      unint64_t v59 = (uint8_t *)swift_slowAlloc();
      v72[0] = OUTLINED_FUNCTION_34();
      *(_DWORD *)unint64_t v59 = 136315138;
      if (qword_26A554370 != -1) {
        swift_once();
      }
      uint64_t v60 = qword_26A554E28;
      uint64_t v61 = unk_26A554E30;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_25BC987A4(v60, v61, a1);
      unint64_t v64 = v63;
      swift_bridgeObjectRelease();
      if (v64) {
        uint64_t v65 = v62;
      }
      else {
        uint64_t v65 = 6369134;
      }
      if (v64) {
        unint64_t v66 = v64;
      }
      else {
        unint64_t v66 = 0xE300000000000000;
      }
      uint64_t v67 = sub_25BC9E6B4(v65, v66, v72);
      OUTLINED_FUNCTION_48(v67);
      OUTLINED_FUNCTION_59();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC76000, v57, v58, "SafariSummarizationPrefetch - num_bloom_filter_shards value incorrect in metadata dictionary, version: %s", v59, 0xCu);
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_9_0();
      v68();
      return 0;
    }

    OUTLINED_FUNCTION_59();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v3);
    return 0;
  }
  if ((v16 & 0x1000000000000000) != 0)
  {
    unint64_t v21 = (unint64_t)sub_25BC8A54C(result, v16, 10);
    char v1 = v69;
    goto LABEL_63;
  }
  if ((v16 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      uint64_t v20 = (unsigned __int8 *)((v16 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v20 = (unsigned __int8 *)sub_25BCA1940();
    }
    unint64_t v21 = (unint64_t)sub_25BC8A634(v20, v18, 10);
    char v1 = v22 & 1;
LABEL_63:
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0) {
      return v21;
    }
    goto LABEL_73;
  }
  v72[0] = result;
  v72[1] = v16 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v17) {
      goto LABEL_91;
    }
    if (v17 == 1) {
      goto LABEL_47;
    }
    OUTLINED_FUNCTION_38();
    if (!v40 && v39) {
      goto LABEL_47;
    }
    unint64_t v21 = v43;
    if (v42 != 2)
    {
      OUTLINED_FUNCTION_38();
      if (!v40 && v39) {
        goto LABEL_47;
      }
      unint64_t v21 = 10 * v21 + v45;
      if (v44 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_54();
          if (!v40 && v39) {
            goto LABEL_47;
          }
          if (!is_mul_ok(v21, v46)) {
            goto LABEL_47;
          }
          BOOL v39 = __CFADD__(10 * v21, v47);
          unint64_t v21 = 10 * v21 + v47;
          if (v39) {
            goto LABEL_47;
          }
          OUTLINED_FUNCTION_55();
          if (v40) {
            goto LABEL_63;
          }
        }
      }
    }
LABEL_62:
    char v1 = 0;
    goto LABEL_63;
  }
  if (result != 45)
  {
    if (!v17 || (result - 48) > 9u) {
      goto LABEL_47;
    }
    unint64_t v21 = (result - 48);
    if (v17 != 1)
    {
      OUTLINED_FUNCTION_38();
      if (!v40 && v39) {
        goto LABEL_47;
      }
      unint64_t v21 = 10 * v21 + v49;
      if (v48 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_54();
          if (!v40 && v39) {
            goto LABEL_47;
          }
          if (!is_mul_ok(v21, v50)) {
            goto LABEL_47;
          }
          BOOL v39 = __CFADD__(10 * v21, v51);
          unint64_t v21 = 10 * v21 + v51;
          if (v39) {
            goto LABEL_47;
          }
          OUTLINED_FUNCTION_55();
          if (v40) {
            goto LABEL_63;
          }
        }
      }
    }
    goto LABEL_62;
  }
  if (v17)
  {
    if (v17 != 1)
    {
      OUTLINED_FUNCTION_38();
      if (v40 || !v39)
      {
        unint64_t v21 = 0;
        BOOL v39 = v38 == 0;
        unint64_t v41 = -(uint64_t)v38;
        if (!v39) {
          goto LABEL_48;
        }
        if (v37 == 2)
        {
          char v1 = 0;
          unint64_t v21 = v41;
          goto LABEL_63;
        }
        unsigned __int8 v52 = v36 - 48;
        if ((v36 - 48) <= 9u && is_mul_ok(v41, 0xAuLL))
        {
          unint64_t v53 = 10 * v41;
          unint64_t v21 = v53 - v52;
          if (v53 >= v52)
          {
            if (v37 == 3) {
              goto LABEL_62;
            }
            while (1)
            {
              OUTLINED_FUNCTION_54();
              if (!v40 && v39) {
                break;
              }
              if (!is_mul_ok(v21, v54)) {
                break;
              }
              BOOL v39 = 10 * v21 >= v55;
              unint64_t v21 = 10 * v21 - v55;
              if (!v39) {
                break;
              }
              OUTLINED_FUNCTION_55();
              if (v40) {
                goto LABEL_63;
              }
            }
          }
        }
      }
    }
LABEL_47:
    unint64_t v21 = 0;
LABEL_48:
    char v1 = 1;
    goto LABEL_63;
  }
  __break(1u);
LABEL_91:
  __break(1u);
  return result;
}

void (*sub_25BC88594(NSObject *a1, void *a2, NSObject *a3))(void)
{
  os_log_t v148 = a3;
  os_log_t v143 = a1;
  sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v144 = v5;
  uint64_t v145 = v6;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_31();
  uint64_t v142 = v7;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_70();
  uint64_t v141 = v9;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_70();
  uint64_t v140 = v11;
  OUTLINED_FUNCTION_27_0();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_64(v13, v14, v15, v16, v17, v18, v19, v20, v137[0]);
  uint64_t v21 = sub_25BCA1250();
  OUTLINED_FUNCTION_0_3();
  uint64_t v146 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_10();
  uint64_t v26 = v25 - v24;
  uint64_t v27 = sub_25BCA1300();
  OUTLINED_FUNCTION_0_3();
  uint64_t v147 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_30();
  uint64_t v32 = v30 - v31;
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_69();
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)v137 - v36;
  MEMORY[0x270FA5388](v35);
  BOOL v39 = (char *)v137 - v38;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v40 = (uint64_t)v149;
  os_log_t v41 = sub_25BC863B4((uint64_t)v39);
  if (!v40)
  {
    uint64_t v43 = v146;
    v137[0] = (uint64_t)v3;
    v137[1] = v32;
    v137[2] = (uint64_t)v37;
    uint64_t v138 = (void (*)(void))v27;
    uint64_t v139 = v39;
    os_log_t v149 = v41;
    uint64_t v44 = sub_25BC987A4(0xD000000000000015, 0x800000025BCA4D90, (uint64_t)v41);
    if (v45)
    {
      uint64_t v46 = v44;
      unint64_t v47 = v45;
      v150[0] = v44;
      v150[1] = v45;
      (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v26, *MEMORY[0x263F06E50], v21);
      sub_25BC8A500();
      uint64_t v48 = v139;
      sub_25BCA12F0();
      OUTLINED_FUNCTION_15_0();
      v49();
      char v50 = sub_25BCA1290();
      os_log_t v51 = v148;
      if (v50)
      {
        OUTLINED_FUNCTION_13_0();
        uint64_t v69 = sub_25BC987A4(0xD000000000000015, v68, (uint64_t)v149);
        if (v70)
        {
          uint64_t v3 = (void (*)(void))v69;
          uint64_t v142 = v46;
          if (qword_26B34B690 != -1) {
            swift_once();
          }
          OUTLINED_FUNCTION_44(v144, (uint64_t)qword_26B34BF78);
          OUTLINED_FUNCTION_7_1();
          v71();
          OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_7_1();
          v72();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v73 = sub_25BCA14F0();
          LODWORD(v146) = sub_25BCA1800();
          if (os_log_type_enabled(v73, (os_log_type_t)v146))
          {
            os_log_t v143 = v73;
            uint64_t v74 = swift_slowAlloc();
            uint64_t v141 = swift_slowAlloc();
            v150[0] = v141;
            *(_DWORD *)uint64_t v74 = 136315651;
            swift_bridgeObjectRetain();
            uint64_t v75 = sub_25BC9E6B4(v142, v47, v150);
            OUTLINED_FUNCTION_89(v75);
            sub_25BCA1880();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v74 + 12) = 2080;
            if (qword_26A554370 != -1) {
              swift_once();
            }
            swift_bridgeObjectRetain();
            uint64_t v76 = OUTLINED_FUNCTION_79();
            uint64_t v78 = v77;
            swift_bridgeObjectRelease();
            if (v78) {
              uint64_t v79 = v76;
            }
            else {
              uint64_t v79 = 6369134;
            }
            uint64_t v80 = OUTLINED_FUNCTION_72(v79);
            OUTLINED_FUNCTION_88(v80);
            OUTLINED_FUNCTION_84();
            swift_bridgeObjectRelease();
            *(_WORD *)(v74 + 22) = 2085;
            uint64_t v81 = sub_25BCA12C0();
            uint64_t v83 = OUTLINED_FUNCTION_61(v81, v82);
            OUTLINED_FUNCTION_88(v83);
            swift_bridgeObjectRelease();
            uint64_t v84 = *(void (**)(void))(v147 + 8);
            uint64_t v85 = v138;
            OUTLINED_FUNCTION_25_0();
            v84();
            os_log_t v86 = v143;
            _os_log_impl(&dword_25BC76000, v143, (os_log_type_t)v146, "SafariSummarizationPrefetch - Successfully fetched url path filter jsonl file: %s, version: %s, at path: %{sensitive}s", (uint8_t *)v74, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_7();
            uint64_t v87 = v85;
            OUTLINED_FUNCTION_7();

            OUTLINED_FUNCTION_65();
            OUTLINED_FUNCTION_9_0();
            v88();
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            uint64_t v133 = *(void (**)(void))(v47 + 8);
            uint64_t v134 = v138;
            OUTLINED_FUNCTION_39();
            v133();

            OUTLINED_FUNCTION_65();
            OUTLINED_FUNCTION_9_0();
            v135();
            uint64_t v87 = v134;
            uint64_t v84 = v133;
          }
          *((unsigned char *)&v148->isa + qword_26A554C30) = 78;
          sub_25BC96FE8();
          ((void (*)(char *, void (*)(void)))v84)(v139, v87);
        }
        else
        {
          swift_bridgeObjectRelease();
          *((unsigned char *)&v51->isa + qword_26A554C30) = 92;
          sub_25BC96FE8();
          uint64_t v112 = v138;
          if (qword_26B34B690 != -1) {
            swift_once();
          }
          uint64_t v113 = v144;
          OUTLINED_FUNCTION_44(v144, (uint64_t)qword_26B34BF78);
          uint64_t v114 = v145;
          OUTLINED_FUNCTION_66();
          uint64_t v115 = v140;
          OUTLINED_FUNCTION_7_1();
          v116();
          OUTLINED_FUNCTION_63();
          uint64_t v3 = (void (*)(void))v137[0];
          OUTLINED_FUNCTION_7_1();
          v117();
          swift_bridgeObjectRetain();
          uint64_t v118 = sub_25BCA14F0();
          int v119 = sub_25BCA17E0();
          if (os_log_type_enabled(v118, (os_log_type_t)v119))
          {
            LODWORD(v146) = v119;
            os_log_t v148 = v118;
            uint64_t v120 = OUTLINED_FUNCTION_58();
            uint64_t v142 = OUTLINED_FUNCTION_32();
            v150[0] = v142;
            *(_DWORD *)uint64_t v120 = 136643075;
            uint64_t v121 = sub_25BCA12C0();
            uint64_t v123 = sub_25BC9E6B4(v121, v122, v150);
            OUTLINED_FUNCTION_89(v123);
            sub_25BCA1880();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_82();
            OUTLINED_FUNCTION_39();
            v3();
            *(_WORD *)(v120 + 12) = 2080;
            if (qword_26A554370 != -1) {
              swift_once();
            }
            uint64_t v124 = qword_26A554E28;
            uint64_t v125 = unk_26A554E30;
            swift_bridgeObjectRetain();
            uint64_t v126 = sub_25BC987A4(v124, v125, (uint64_t)v149);
            unint64_t v128 = v127;
            swift_bridgeObjectRelease();
            if (v128) {
              uint64_t v129 = v126;
            }
            else {
              uint64_t v129 = 6369134;
            }
            if (v128) {
              unint64_t v130 = v128;
            }
            else {
              unint64_t v130 = 0xE300000000000000;
            }
            uint64_t v151 = sub_25BC9E6B4(v129, v130, v150);
            sub_25BCA1880();
            OUTLINED_FUNCTION_84();
            swift_bridgeObjectRelease();
            os_log_t v131 = v148;
            _os_log_impl(&dword_25BC76000, v148, (os_log_type_t)v146, "SafariSummarizationPrefetch - Failed to find path filter hash at path: %{sensitive}s, version: %s", (uint8_t *)v120, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_7();
            OUTLINED_FUNCTION_7();

            OUTLINED_FUNCTION_65();
            OUTLINED_FUNCTION_9_0();
            v132();
            uint64_t v112 = v138;
          }
          else
          {
            OUTLINED_FUNCTION_82();
            OUTLINED_FUNCTION_39();
            v3();

            swift_bridgeObjectRelease_n();
            (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v115, v113);
          }
          sub_25BC8A4B4();
          OUTLINED_FUNCTION_20_0();
          OUTLINED_FUNCTION_35(v136, 5);
          ((void (*)(os_log_t, void (*)(void)))v3)(v143, v112);
          ((void (*)(char *, void (*)(void)))v3)(v139, v112);
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        *((unsigned char *)&v51->isa + qword_26A554C30) = 80;
        sub_25BC96FE8();
        if (qword_26B34B690 != -1) {
          swift_once();
        }
        uint64_t v91 = v144;
        OUTLINED_FUNCTION_44(v144, (uint64_t)qword_26B34BF78);
        uint64_t v92 = v145;
        OUTLINED_FUNCTION_7_1();
        v93();
        OUTLINED_FUNCTION_63();
        OUTLINED_FUNCTION_7_1();
        v94();
        swift_bridgeObjectRetain();
        uint64_t v95 = sub_25BCA14F0();
        int v96 = sub_25BCA17E0();
        if (os_log_type_enabled(v95, (os_log_type_t)v96))
        {
          LODWORD(v142) = v96;
          os_log_t v148 = v95;
          uint64_t v97 = OUTLINED_FUNCTION_58();
          uint64_t v146 = OUTLINED_FUNCTION_32();
          v150[0] = v146;
          *(_DWORD *)uint64_t v97 = 136643075;
          uint64_t v98 = sub_25BCA12C0();
          uint64_t v100 = OUTLINED_FUNCTION_61(v98, v99);
          OUTLINED_FUNCTION_89(v100);
          sub_25BCA1880();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_83();
          uint64_t v147 = v101;
          OUTLINED_FUNCTION_39();
          v102();
          *(_WORD *)(v97 + 12) = 2080;
          if (qword_26A554370 != -1) {
            swift_once();
          }
          swift_bridgeObjectRetain();
          uint64_t v103 = OUTLINED_FUNCTION_79();
          uint64_t v105 = v104;
          swift_bridgeObjectRelease();
          if (v105) {
            uint64_t v106 = v103;
          }
          else {
            uint64_t v106 = 6369134;
          }
          uint64_t v151 = OUTLINED_FUNCTION_72(v106);
          sub_25BCA1880();
          OUTLINED_FUNCTION_84();
          swift_bridgeObjectRelease();
          os_log_t v107 = v148;
          _os_log_impl(&dword_25BC76000, v148, (os_log_type_t)v142, "SafariSummarizationPrefetch - Failed to find path filter asset at path: %{sensitive}s, version: %s", (uint8_t *)v97, 0x16u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_7();
          OUTLINED_FUNCTION_7();

          OUTLINED_FUNCTION_65();
          OUTLINED_FUNCTION_9_0();
          v108();
          uint64_t v3 = v138;
          uint64_t v48 = v139;
          uint64_t v109 = (void (*)(void))v147;
        }
        else
        {
          os_log_type_t v110 = *(void (**)(void))(v47 + 8);
          OUTLINED_FUNCTION_83();
          OUTLINED_FUNCTION_39();
          v110();
          uint64_t v109 = v110;

          OUTLINED_FUNCTION_84();
          (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v141, v91);
          uint64_t v3 = v138;
        }
        sub_25BC8A4B4();
        OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_35(v111, 3);
        ((void (*)(os_log_t, void (*)(void)))v109)(v143, v3);
        ((void (*)(char *, void (*)(void)))v109)(v48, v3);
      }
    }
    else
    {
      *((unsigned char *)&v148->isa + qword_26A554C30) = 85;
      sub_25BC96FE8();
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      uint64_t v52 = v144;
      OUTLINED_FUNCTION_44(v144, (uint64_t)qword_26B34BF78);
      uint64_t v53 = v145;
      uint64_t v54 = v142;
      OUTLINED_FUNCTION_7_1();
      v55();
      swift_bridgeObjectRetain();
      unint64_t v56 = sub_25BCA14F0();
      os_log_type_t v57 = sub_25BCA17E0();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = OUTLINED_FUNCTION_58();
        v150[0] = OUTLINED_FUNCTION_32();
        *(_DWORD *)uint64_t v58 = 136315394;
        uint64_t v59 = sub_25BC9E6B4(0xD000000000000015, 0x800000025BCA4D90, v150);
        OUTLINED_FUNCTION_89(v59);
        sub_25BCA1880();
        *(_WORD *)(v58 + 12) = 2080;
        if (qword_26A554370 != -1) {
          swift_once();
        }
        uint64_t v60 = qword_26A554E28;
        uint64_t v61 = unk_26A554E30;
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_25BC987A4(v60, v61, (uint64_t)v149);
        unint64_t v64 = v63;
        swift_bridgeObjectRelease();
        if (v64) {
          uint64_t v65 = v62;
        }
        else {
          uint64_t v65 = 6369134;
        }
        if (v64) {
          unint64_t v66 = v64;
        }
        else {
          unint64_t v66 = 0xE300000000000000;
        }
        uint64_t v151 = sub_25BC9E6B4(v65, v66, v150);
        sub_25BCA1880();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25BC76000, v56, v57, "SafariSummarizationPrefetch - Failed to find path filter filename for %s in metadata, version: %s", (uint8_t *)v58, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_9_0();
        v67();
        uint64_t v3 = v138;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v52);
        uint64_t v3 = v138;
      }
      sub_25BC8A4B4();
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_35(v89, 2);
      OUTLINED_FUNCTION_9_0();
      v90();
    }
  }
  return v3;
}

BOOL sub_25BC89424(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25BC89434()
{
  return sub_25BCA1B00();
}

uint64_t sub_25BC8945C()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC894A4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

BOOL sub_25BC894EC(char *a1, char *a2)
{
  return sub_25BC89424(*a1, *a2);
}

uint64_t sub_25BC894F8()
{
  return sub_25BC8945C();
}

uint64_t sub_25BC89500()
{
  return sub_25BC89434();
}

uint64_t sub_25BC89508()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC8955C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A554958 + dword_26A554958);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25BC7E1FC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25BC89630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v8 = sub_25BCA1590();
  v5[15] = v8;
  sub_25BC8B15C(0, &qword_26A554960);
  uint64_t v9 = sub_25BCA1700();
  v5[16] = v9;
  v5[2] = v5;
  v5[3] = sub_25BC8977C;
  uint64_t v10 = swift_continuation_init();
  v5[10] = MEMORY[0x263EF8330];
  v5[11] = 0x40000000;
  v5[12] = sub_25BC89890;
  v5[13] = &block_descriptor_65;
  v5[14] = v10;
  objc_msgSend(v6, sel_subscribe_subscriptions_queue_completion_, v8, v9, a4, v5 + 10);
  return MEMORY[0x270FA23F0](v5 + 2);
}

uint64_t sub_25BC8977C()
{
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  uint64_t v4 = (void *)v3[16];
  uint64_t v5 = (void *)v3[15];
  if (v3[6]) {
    swift_willThrow();
  }

  uint64_t v6 = *(uint64_t (**)(void))(v1 + 8);
  return v6();
}

uint64_t sub_25BC89890(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_25BC898F0(v2, (uint64_t)v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t sub_25BC898F0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554968);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25BC89958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))((char *)&dword_26A554950 + dword_26A554950);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_25BC7E44C;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_25BC89A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v10 = v8;
  uint64_t v16 = sub_25BCA1590();
  v9[16] = v16;
  if (a4) {
    a4 = sub_25BCA1590();
  }
  v9[17] = a4;
  if (a5) {
    a5 = sub_25BCA1700();
  }
  v9[18] = a5;
  if (a7)
  {
    v9[14] = a7;
    v9[15] = a8;
    v9[10] = MEMORY[0x263EF8330];
    v9[11] = 1107296256;
    v9[12] = sub_25BC89D54;
    v9[13] = &block_descriptor_62;
    a7 = _Block_copy(v9 + 10);
    swift_retain();
    swift_release();
  }
  v9[19] = a7;
  v9[2] = v9;
  v9[3] = sub_25BC89C44;
  uint64_t v17 = swift_continuation_init();
  v9[10] = MEMORY[0x263EF8330];
  v9[11] = 0x40000000;
  v9[12] = sub_25BC89DBC;
  v9[13] = &block_descriptor_59;
  v9[14] = v17;
  objc_msgSend(v10, sel_updateAssetsForSubscriber_subscriptionName_policies_queue_detailedProgress_completion_, v16, a4, a5, a6, a7, v9 + 10);
  return MEMORY[0x270FA23F0](v9 + 2);
}

uint64_t sub_25BC89C44()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = (void *)v1[18];
  id v3 = (void *)v1[17];
  uint64_t v4 = (void *)v1[16];
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v6 = v5;
  _Block_release(v7);

  OUTLINED_FUNCTION_5();
  return v8();
}

void sub_25BC89D54(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25BC89DBC(uint64_t a1)
{
  return j__swift_continuation_resume(*(void *)(a1 + 32));
}

id sub_25BC89DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC89DEC(a1, a2, a3, a4);
}

id sub_25BC89DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25BC8B0F4(a1, (uint64_t)v18);
  uint64_t v8 = v19;
  if (v19)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(v18, v19);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v9);
    uint64_t v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = sub_25BCA1A60();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    uint64_t v13 = 0;
  }
  aBlock[4] = a3;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BC89FC8;
  aBlock[3] = &block_descriptor_57;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = objc_msgSend(v4, sel_observeAssetSet_queue_handler_, v13, a2, v14);
  swift_unknownObjectRelease();
  _Block_release(v14);
  swift_release();
  return v15;
}

uint64_t sub_25BC89FC8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_25BC8A00C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25BC8A030(a1, a2, a3);
}

id sub_25BC8A030(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_25BCA1590();
  if (a3) {
    a3 = (void *)sub_25BCA1530();
  }
  id v6 = objc_msgSend(v3, sel_retrieveAssetSet_usages_, v5, a3);

  return v6;
}

id sub_25BC8A0B4(uint64_t a1)
{
  return sub_25BC8A0D8(a1);
}

id sub_25BC8A0D8(uint64_t a1)
{
  return objc_msgSend(v1, sel_removeObserver_, a1);
}

void sub_25BC8A0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
}

uint64_t type metadata accessor for SASafariAssistantAssetProvider()
{
  return self;
}

void sub_25BC8A134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v11 = (void *)sub_25BCA1590();
  uint64_t v12 = (void *)sub_25BCA1700();
  if (a5)
  {
    v13[4] = a5;
    v13[5] = a6;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_25BC8A23C;
    void v13[3] = &block_descriptor;
    a5 = _Block_copy(v13);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v7, sel_unsubscribe_subscriptionNames_queue_completion_, v11, v12, a4, a5);
  _Block_release(a5);
}

void sub_25BC8A23C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_25BC8A2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v10 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554940);
    uint64_t v11 = (void *)sub_25BCA1530();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      uint64_t v12 = (void *)sub_25BCA1530();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = sub_25BCA13E0();
  uint64_t v14 = 0;
  if (__swift_getEnumTagSinglePayload(a5, 1, v13) != 1)
  {
    uint64_t v14 = (void *)sub_25BCA1390();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a5, v13);
  }
  id v15 = objc_msgSend(v6, sel_initWithName_assetSets_usageAliases_expires_, v10, v11, v12, v14);

  return v15;
}

id sub_25BC8A40C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_25BCA1590();
  swift_bridgeObjectRelease();
  sub_25BC8B15C(0, &qword_26A5548F8);
  id v6 = (void *)sub_25BCA1700();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v3, sel_initWithExplanation_target_attributes_, v5, a3, v6);

  return v7;
}

unint64_t sub_25BC8A4B4()
{
  unint64_t result = qword_26A5548C0;
  if (!qword_26A5548C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5548C0);
  }
  return result;
}

unint64_t sub_25BC8A500()
{
  unint64_t result = qword_26A554C80;
  if (!qword_26A554C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554C80);
  }
  return result;
}

unsigned __int8 *sub_25BC8A54C(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25BCA16D0();
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
  uint64_t v6 = sub_25BC8A8B0(v4, v5);
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
    uint64_t v8 = (unsigned __int8 *)sub_25BCA1940();
  }
LABEL_7:
  uint64_t v12 = sub_25BC8A634(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12;
}

unsigned __int8 *sub_25BC8A634(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v17 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v18 = a3 + 48;
        unsigned __int8 v19 = a3 + 55;
        unsigned __int8 v20 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = 58;
        }
        else
        {
          unsigned __int8 v20 = 97;
          unsigned __int8 v19 = 65;
        }
        if (result)
        {
          unint64_t v9 = 0;
          uint64_t v21 = result + 1;
          do
          {
            unsigned int v22 = *v21;
            if (v22 < 0x30 || v22 >= v18)
            {
              if (v22 < 0x41 || v22 >= v19)
              {
                uint64_t v13 = 0;
                if (v22 < 0x61 || v22 >= v20) {
                  return (unsigned __int8 *)v13;
                }
                char v23 = -87;
              }
              else
              {
                char v23 = -55;
              }
            }
            else
            {
              char v23 = -48;
            }
            if (!is_mul_ok(v9, a3)) {
              return 0;
            }
            unint64_t v24 = v9 * a3;
            unsigned __int8 v25 = v22 + v23;
            BOOL v16 = __CFADD__(v24, v25);
            unint64_t v9 = v24 + v25;
            if (v16) {
              return 0;
            }
            ++v21;
            --v17;
          }
          while (v17);
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
        unsigned __int8 v26 = a3 + 48;
        unsigned __int8 v27 = a3 + 55;
        unsigned __int8 v28 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = 58;
        }
        else
        {
          unsigned __int8 v28 = 97;
          unsigned __int8 v27 = 65;
        }
        if (result)
        {
          unint64_t v29 = 0;
          do
          {
            unsigned int v30 = *result;
            if (v30 < 0x30 || v30 >= v26)
            {
              if (v30 < 0x41 || v30 >= v27)
              {
                uint64_t v13 = 0;
                if (v30 < 0x61 || v30 >= v28) {
                  return (unsigned __int8 *)v13;
                }
                char v31 = -87;
              }
              else
              {
                char v31 = -55;
              }
            }
            else
            {
              char v31 = -48;
            }
            if (!is_mul_ok(v29, a3)) {
              return 0;
            }
            unint64_t v32 = v29 * a3;
            unsigned __int8 v33 = v30 + v31;
            BOOL v16 = __CFADD__(v32, v33);
            unint64_t v29 = v32 + v33;
            if (v16) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)v29;
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
          unint64_t v9 = 0;
          for (i = result + 1; ; ++i)
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
            if (!is_mul_ok(v9, a3)) {
              return 0;
            }
            unint64_t v14 = v9 * a3;
            unsigned __int8 v15 = v11 + v12;
            BOOL v16 = v14 >= v15;
            unint64_t v9 = v14 - v15;
            if (!v16) {
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

uint64_t sub_25BC8A8B0(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_25BC8A91C((uint64_t)sub_25BC8A918, 0, a1, a2);
  uint64_t v6 = sub_25BC8A950(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_25BC8A91C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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

uint64_t sub_25BC8A950(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25BC8AAA8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25BC9EBC0(v9, 0);
      unint64_t v12 = sub_25BC8ABA8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25BCA1940();
LABEL_4:
        JUMPOUT(0x261173E10);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261173E10](v11 + 4, v11[2]);
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
    return MEMORY[0x261173E10]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25BC8AAA8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25BC9EC28(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25BC9EC28(v6, v5, v4);
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

unint64_t sub_25BC8ABA8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[4] = v12;
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
      unint64_t result = sub_25BC9EC28(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_25BCA16B0();
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
          unint64_t result = sub_25BCA1940();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_25BC9EC28(v12, a6, a7);
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
    unint64_t v12 = sub_25BCA1680();
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

unint64_t sub_25BC8ADAC()
{
  unint64_t result = qword_26A554910;
  if (!qword_26A554910)
  {
    sub_25BCA1300();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A554910);
  }
  return result;
}

uint64_t sub_25BC8ADFC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BC8AE34()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC8AE6C()
{
  return sub_25BC83658(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25BC8AE74(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

uint64_t sub_25BC8AEC0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BC8AF00()
{
  OUTLINED_FUNCTION_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25BC7E44C;
  return sub_25BC83BD4();
}

uint64_t sub_25BC8AFB8(uint64_t a1)
{
  return sub_25BC832E0(a1, *(void *)(v1 + 16));
}

uint64_t sub_25BC8AFC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554928);
  OUTLINED_FUNCTION_90();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 80) | 7;
  OUTLINED_FUNCTION_9_0();
  v2();
  uint64_t v3 = OUTLINED_FUNCTION_43();
  return MEMORY[0x270FA0238](v3, v4, v1);
}

uint64_t sub_25BC8B040(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554928);
  return sub_25BC83490(a1);
}

uint64_t sub_25BC8B0B4(uint64_t a1)
{
  return a1;
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

uint64_t sub_25BC8B0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BC8B15C(uint64_t a1, unint64_t *a2)
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SafariSummarizationPrefetchAssetsError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SafariSummarizationPrefetchAssetsError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x25BC8B2F8);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_25BC8B320(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BC8B32C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SafariSummarizationPrefetchAssetsError()
{
  return &type metadata for SafariSummarizationPrefetchAssetsError;
}

unint64_t sub_25BC8B348()
{
  unint64_t result = qword_26A554970;
  if (!qword_26A554970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554970);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, a3);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v2, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_25BC9E6B4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)(v0 - 72));
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_26_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_35@<X0>(unsigned char *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1, unsigned char *a2)
{
  *a2 = 6;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  return sub_25BC9E6B4(0xD000000000000011, a2, a3);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1, unint64_t a2)
{
  return sub_25BC9E6B4(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1)
{
  return MEMORY[0x270F9D190](0, a1);
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 176) = (char *)&a9 - v9;
  return 0;
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_72(uint64_t a1)
{
  return sub_25BC9E6B4(a1, v1, (uint64_t *)(v2 - 96));
}

void OUTLINED_FUNCTION_73(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

void OUTLINED_FUNCTION_74(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_log_type_t type)
{
  _os_log_impl(a1, v13, type, a4, v14, 0x20u);
}

uint64_t OUTLINED_FUNCTION_79()
{
  uint64_t v4 = *(void *)(v2 - 104);
  return sub_25BC987A4(v1, v0, v4);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_83()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_85(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_87(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_88(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return sub_25BCA1880();
}

uint64_t OUTLINED_FUNCTION_89(uint64_t result)
{
  *(void *)(v1 - 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_92()
{
  return swift_arrayDestroy();
}

uint64_t sub_25BC8B9EC()
{
  return 45;
}

uint64_t sub_25BC8B9F4()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_25BC94B10();
  }
  uint64_t v1 = sub_25BC939B8();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_25BC8BA7C()
{
  uint64_t v1 = v0;
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BC93AD0();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25BCA2560;
  uint64_t v3 = *(void *)(v1 + *(void *)(*(void *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554840);
  uint64_t v4 = sub_25BCA15F0();
  uint64_t v6 = v5;
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  unint64_t v7 = sub_25BC8004C();
  *(void *)(v2 + 64) = v7;
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25BCA2560;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v42 = v3;
  uint64_t v9 = v3;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v10(ObjectType, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
  uint64_t v11 = sub_25BCA15F0();
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = v7;
  unint64_t v44 = v7;
  *(void *)(v8 + 32) = v11;
  *(void *)(v8 + 40) = v12;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25BC9459C();
  if (v16)
  {
    sub_25BCA17E0();
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_25BCA2560;
    v10(ObjectType, v42);
    uint64_t v33 = sub_25BCA15F0();
    uint64_t v34 = MEMORY[0x263F8D310];
    unint64_t v31 = v7;
    *(void *)(v32 + 56) = MEMORY[0x263F8D310];
    *(void *)(v32 + 64) = v7;
    *(void *)(v32 + 32) = v33;
    *(void *)(v32 + 40) = v35;
    sub_25BCA14A0();
    uint64_t v30 = v34;
  }
  else
  {
    uint64_t v17 = v14;
    int v18 = v15;
    unint64_t v19 = HIDWORD(v15);
    uint64_t v43 = v13;
    sub_25BCA17E0();
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = MEMORY[0x263F8D6C8];
    *(_OWORD *)(v20 + 16) = xmmword_25BCA2560;
    uint64_t v22 = MEMORY[0x263F8D750];
    *(void *)(v20 + 56) = v21;
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 32) = v17;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = MEMORY[0x263F8E8F8];
    *(_OWORD *)(v23 + 16) = xmmword_25BCA2560;
    uint64_t v25 = MEMORY[0x263F8E960];
    *(void *)(v23 + 56) = v24;
    *(void *)(v23 + 64) = v25;
    *(_DWORD *)(v23 + 32) = v19;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_25BCA2560;
    *(void *)(v26 + 56) = v24;
    *(void *)(v26 + 64) = v25;
    *(_DWORD *)(v26 + 32) = v18;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    sub_25BCA17E0();
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = MEMORY[0x263F8D538];
    *(_OWORD *)(v27 + 16) = xmmword_25BCA2560;
    uint64_t v29 = MEMORY[0x263F8D5B8];
    *(void *)(v27 + 56) = v28;
    *(void *)(v27 + 64) = v29;
    *(void *)(v27 + 32) = v43;
    sub_25BCA14A0();
    uint64_t v30 = MEMORY[0x263F8D310];
    unint64_t v31 = v44;
  }
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_25BCA2560;
  id v37 = *(id *)(v1 + *(void *)(*(void *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554848);
  uint64_t v38 = sub_25BCA15F0();
  *(void *)(v36 + 56) = v30;
  *(void *)(v36 + 64) = v31;
  *(void *)(v36 + 32) = v38;
  *(void *)(v36 + 40) = v39;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  return sub_25BCA14A0();
}

uint64_t sub_25BC8BFAC(uint64_t a1, unint64_t a2, double a3)
{
  int v3 = a2;
  unint64_t v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25BCA2680;
  uint64_t v8 = MEMORY[0x263F8D750];
  *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  uint64_t v9 = MEMORY[0x263F8E8F8];
  uint64_t v10 = MEMORY[0x263F8E960];
  *(void *)(v7 + 96) = MEMORY[0x263F8E8F8];
  *(void *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v10;
  uint64_t v11 = MEMORY[0x263F8D538];
  *(_DWORD *)(v7 + 112) = v6;
  uint64_t v12 = MEMORY[0x263F8D5B8];
  *(void *)(v7 + 176) = v11;
  *(void *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_25BC9596C("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC8C094()
{
  if (qword_26A5543C0 != -1) {
    swift_once();
  }
  qword_26A554E38 = qword_26A554EC8;
  unk_26A554E40 = unk_26A554ED0;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_25BC8C100()
{
  if (qword_26A554378 != -1) {
    swift_once();
  }
  return &qword_26A554E38;
}

void sub_25BC8C14C()
{
  qword_26A554E48 = (uint64_t)&unk_2709513C8;
}

unint64_t sub_25BC8C160()
{
  return 0xD000000000000010;
}

uint64_t sub_25BC8C17C()
{
  sub_25BC8C100();
  uint64_t v0 = qword_26A554E38;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_25BC8C1B8()
{
  return sub_25BC904FC();
}

uint64_t sub_25BC8C1C0()
{
  return sub_25BC905E8();
}

uint64_t sub_25BC8C1C8()
{
  return sub_25BC906A0();
}

uint64_t sub_25BC8C1D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25BC8B9EC();
  *a1 = result;
  return result;
}

uint64_t sub_25BC8C1FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25BC7E86C(*v1);
  *a1 = result;
  return result;
}

BOOL sub_25BC8C228(char *a1, char *a2)
{
  return sub_25BC904B4(*a1, *a2);
}

uint64_t sub_25BC8C234()
{
  uint64_t v1 = v0 + qword_26A554E50;
  uint64_t v2 = sub_25BCA1480();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t sub_25BC8C2A0()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_25BC94B10();
  }
  uint64_t v1 = sub_25BC8B9F4();
  uint64_t v2 = v1 + qword_26A554E50;
  uint64_t v3 = sub_25BCA1480();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v1;
}

uint64_t sub_25BC8C318()
{
  uint64_t v0 = sub_25BC8C2A0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ResourceAccessNetworkSpan()
{
  uint64_t result = qword_26A554978;
  if (!qword_26A554978) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BC8C3B4()
{
  uint64_t result = sub_25BCA1480();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25BC8C44C()
{
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BC8BA7C();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25BCA2560;
  uint64_t v1 = sub_25BCA1460();
  uint64_t v3 = v2;
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  unint64_t v5 = sub_25BC8004C();
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  OUTLINED_FUNCTION_0_4();
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25BCA2560;
  uint64_t v7 = sub_25BCA1460();
  *(void *)(v6 + 56) = v4;
  *(void *)(v6 + 64) = v5;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  OUTLINED_FUNCTION_0_4();
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  return sub_25BCA14A0();
}

uint64_t sub_25BC8C5E0(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6 = sub_25BC7FDF0(a1, a2, a3);
  if (qword_26A554390 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26A554E68;
  uint64_t v8 = unk_26A554E70;
  swift_bridgeObjectRetain();
  sub_25BCA1470();
  id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, sub_25BCA1450());
  swift_isUniquelyReferenced_nonNull_native();
  sub_25BC9779C((uint64_t)v9, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25BC95A1C(v6);
  swift_bridgeObjectRelease();
  return sub_25BC8BFAC(a1, a2, a3);
}

uint64_t getEnumTagSinglePayload for ResourceAccessActivity(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD4)
  {
    if (a2 + 44 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 44) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 45;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2D;
  int v5 = v6 - 45;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ResourceNetworkActivity(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD3)
  {
    unsigned int v6 = ((a2 - 212) >> 8) + 1;
    *uint64_t result = a2 + 44;
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
        JUMPOUT(0x25BC8C874);
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
          *uint64_t result = a2 + 44;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceNetworkActivity()
{
  return &type metadata for ResourceNetworkActivity;
}

unint64_t sub_25BC8C8B0()
{
  unint64_t result = qword_26A554988;
  if (!qword_26A554988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554988);
  }
  return result;
}

unint64_t sub_25BC8C8FC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25BC8C92C();
  unint64_t result = sub_25BC8C978();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25BC8C92C()
{
  unint64_t result = qword_26A554990;
  if (!qword_26A554990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554990);
  }
  return result;
}

unint64_t sub_25BC8C978()
{
  unint64_t result = qword_26A554998;
  if (!qword_26A554998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554998);
  }
  return result;
}

unint64_t sub_25BC8C9C8()
{
  unint64_t result = qword_26A5549A0;
  if (!qword_26A5549A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5549A0);
  }
  return result;
}

unint64_t sub_25BC8CA14(uint64_t a1)
{
  unint64_t result = sub_25BC8CA3C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25BC8CA3C()
{
  unint64_t result = qword_26A5549A8;
  if (!qword_26A5549A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5549A8);
  }
  return result;
}

uint64_t sub_25BC8CA9C()
{
  sub_25BC8B0B4(v0 + 16);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

void *sub_25BC8CAD4(uint64_t a1, uint64_t a2)
{
  v2[3] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for Locker();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = (_DWORD *)swift_slowAlloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = 0;
  uint64_t v6 = MEMORY[0x263F8EE80];
  v2[4] = v4;
  v2[5] = v6;
  v2[3] = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_25BC8CB70()
{
  uint64_t v1 = v0;
  uint64_t v14 = MEMORY[0x263F8EE78];
  int v2 = *(os_unfair_lock_s **)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_25BC8CE7C(v3, (void (*)(uint64_t, uint64_t, uint64_t))sub_25BC8D7C8);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2);
  if (MEMORY[0x261174AC0](v1 + 16))
  {
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    uint64_t v7 = swift_bridgeObjectRetain();
    v6(v7, ObjectType, v4);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = *(void *)(v14 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    id v9 = (uint64_t *)(v14 + 40);
    do
    {
      uint64_t v10 = *v9;
      uint64_t v11 = swift_getObjectType();
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v10 + 72);
      swift_unknownObjectRetain();
      v12(v11, v10);
      swift_unknownObjectRelease();
      v9 += 2;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_25BC8B0B4(v1 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25BC8CD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = MEMORY[0x261174AC0](a3 + 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v10 + 64))(ObjectType, v10);
    swift_unknownObjectRetain();
    sub_25BC8D258();
    uint64_t v12 = *(char **)(*a4 + 16);
    sub_25BC8D2A4(v12);
    uint64_t v13 = *a4;
    *(void *)(v13 + 16) = v12 + 1;
    uint64_t v14 = v13 + 16 * (void)v12;
    *(void *)(v14 + 32) = v9;
    *(void *)(v14 + 40) = v10;
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_25BC8D968();
    char v16 = (void *)sub_25BCA1840();
    sub_25BCA17E0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_25BCA2560;
    *(void *)(v17 + 56) = MEMORY[0x263F8D310];
    *(void *)(v17 + 64) = sub_25BC8004C();
    *(void *)(v17 + 32) = a1;
    *(void *)(v17 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_25BCA14A0();

    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC8CE7C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  sub_25BC8D930(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v19[4];
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v5 << 6);
  while (1)
  {
    unint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v16, v17, v18);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v11 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v11 >= v7) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    int64_t v13 = v5 + 1;
    if (!v12)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v7) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v4 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v7) {
          return swift_release();
        }
        unint64_t v12 = *(void *)(v4 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v7) {
            return swift_release();
          }
          unint64_t v12 = *(void *)(v4 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v7) {
              return swift_release();
            }
            unint64_t v12 = *(void *)(v4 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v5 + 6;
              while (v14 < v7)
              {
                unint64_t v12 = *(void *)(v4 + 8 * v14++);
                if (v12)
                {
                  int64_t v13 = v14 - 1;
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
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v5 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_25BC8D004()
{
  sub_25BC8CB70();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for ActivityMonitor()
{
  return self;
}

uint64_t type metadata accessor for ActivityMonitor.WeakReference()
{
  return self;
}

uint64_t sub_25BC8D080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v10 = sub_25BC8D6C0(a2, a3);
  swift_endAccess();
  uint64_t result = swift_release();
  if (!v10)
  {
    if (MEMORY[0x261174AC0](a1 + 16))
    {
      uint64_t v12 = *(void *)(a1 + 24);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 40))(a4, a5, ObjectType, v12);
      swift_unknownObjectRelease();
    }
    uint64_t v14 = swift_getObjectType();
    unint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(v14, a5);
    sub_25BCA17E0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25BCA26A0;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(v14, a5);
    uint64_t v19 = v18;
    uint64_t v20 = MEMORY[0x263F8D310];
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    unint64_t v21 = sub_25BC8004C();
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    (*(void (**)(uint64_t, uint64_t))(a5 + 40))(v14, a5);
    uint64_t v22 = sub_25BCA1930();
    *(void *)(v16 + 96) = v20;
    *(void *)(v16 + 104) = v21;
    *(void *)(v16 + 72) = v22;
    *(void *)(v16 + 80) = v23;
    sub_25BCA14A0();

    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_25BC8D258()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_25BC8D3C8(result, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = (uint64_t)result;
  }
  return result;
}

char *sub_25BC8D2A4(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_25BC8D3C8((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

char *sub_25BC8D2E4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549D0);
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
  if (v5)
  {
    sub_25BC9E1FC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25BC8D4B8(0, v8, v12, a4);
  }
  return v10;
}

char *sub_25BC8D3C8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549C0);
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
  if (v5)
  {
    sub_25BC9E42C((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25BC8D5A8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_25BC8D4B8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_25BCA19D0();
  __break(1u);
  return result;
}

uint64_t sub_25BC8D5A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549C8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25BCA19D0();
  __break(1u);
  return result;
}

uint64_t sub_25BC8D6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25BC9EE78(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549B0);
  sub_25BCA1950();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  type metadata accessor for ActivityMonitor.WeakReference();
  sub_25BCA1970();
  uint64_t *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25BC8D7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC8CD10(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_25BC8D7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  uint64_t v10 = v9;
  size_t v11 = *(os_unfair_lock_s **)(*(void *)(a2 + 32) + 16);
  os_unfair_lock_lock(v11);
  sub_25BC8D080(a2, v8, v10, a1, a4);
  os_unfair_lock_unlock(v11);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  sub_25BC8D8A0(a2, a1, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC8D8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = MEMORY[0x261174AC0](a1 + 16);
  if (result)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a4, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_25BC8D930@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

unint64_t sub_25BC8D968()
{
  unint64_t result = qword_26A5549B8;
  if (!qword_26A5549B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5549B8);
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_25BC8D9AC()
{
}

char *sub_25BC8DA20(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ActivityMonitor();
  swift_allocObject();
  uint64_t v4 = sub_25BC8CAD4(0, 0);
  type metadata accessor for DeviceContext();
  swift_allocObject();
  uint64_t v5 = sub_25BC7EB64();
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  memset(v8, 0, sizeof(v8));
  uint64_t v9 = 0;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SASafariAssistantAssetManager());
  swift_bridgeObjectRetain();
  return sub_25BC7D4DC((uint64_t)v4, v5, a1, a2, (uint64_t)v10, (uint64_t)v8, 0, 0, v6);
}

char *sub_25BC8DB48(uint64_t a1, unint64_t a2)
{
  type metadata accessor for DeviceContext();
  swift_allocObject();
  uint64_t v4 = sub_25BC7EB64();
  uint64_t v5 = sub_25BC8DCB8(a1, a2, v4);
  swift_release();
  return v5;
}

SAAssetManagerFactory __swiftcall SAAssetManagerFactory.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SAAssetManagerFactory)objc_msgSend(v0, sel_init);
}

id SAAssetManagerFactory.init()()
{
  v1.super_class = (Class)SAAssetManagerFactory;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for SAAssetManagerFactory(uint64_t a1)
{
  return sub_25BC8B15C(a1, &qword_26A5549D8);
}

char *sub_25BC8DCB8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  type metadata accessor for ActivityMonitor();
  swift_allocObject();
  id v6 = sub_25BC8CAD4(0, 0);
  type metadata accessor for SASafariAssistantAssetManager();
  uint64_t v14 = 0;
  *(_OWORD *)uint64_t v12 = 0u;
  long long v13 = 0u;
  uint64_t v11 = 0;
  *(_OWORD *)uint64_t v9 = 0u;
  long long v10 = 0u;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  char v7 = sub_25BC78020(a1, a2, (uint64_t)v6, a3, (uint64_t)&off_2709517A8, (uint64_t)v12, (uint64_t)v9, 0, 0);
  swift_release();
  return v7;
}

uint64_t sub_25BC8DE18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = a1;
  uint64_t v4 = (void *)sub_25BCA1590();
  unsigned __int8 v5 = objc_msgSend(v4, sel__web_looksLikeIPAddress);

  if (v5)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_25BC8A500();
    uint64_t v6 = sub_25BCA18A0();
    uint64_t v3 = sub_25BC8DEF4(v6, v3);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_25BC8DEF4(uint64_t a1, uint64_t a2)
{
  char v10 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_25BC8DFCC(a1, &v8, &v10);
  if (v10 == 1)
  {
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25BCA1630();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = sub_25BCA1630();
    if (v4 && v5 == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      return a2;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_25BC8DFCC(uint64_t a1, void *a2, char *a3)
{
  MEMORY[0x261173E00](16);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 16 * v6 + 24;
    do
    {
      swift_bridgeObjectRetain();
      if (v7) {
        sub_25BCA1660();
      }
      sub_25BC8E140();
      sub_25BCA1650();
      swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      uint64_t v9 = (void *)sub_25BCA1590();
      int IsDomainTopLevel = _CFHostIsDomainTopLevel();

      if (IsDomainTopLevel)
      {
        *a3 = 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        char v11 = *a3;
        swift_bridgeObjectRelease();
        if (v11) {
          break;
        }
      }
      v8 -= 16;
      ++v7;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_25BC8E140()
{
  unint64_t result = qword_26A5549E8;
  if (!qword_26A5549E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5549E8);
  }
  return result;
}

uint64_t destroy for SASafariAssistantUrlPathFilterModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s12SearchAssets35SASafariAssistantUrlPathFilterModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SASafariAssistantUrlPathFilterModel(void *a1, void *a2)
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

uint64_t assignWithTake for SASafariAssistantUrlPathFilterModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SASafariAssistantUrlPathFilterModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SASafariAssistantUrlPathFilterModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterModel()
{
  return &type metadata for SASafariAssistantUrlPathFilterModel;
}

BOOL sub_25BC8E360(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25BC8E370()
{
  return sub_25BCA1B00();
}

uint64_t sub_25BC8E398(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D616E74736F68 && a2 == 0xE800000000000000;
  if (v3 || (sub_25BCA1A70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265755168746170 && a2 == 0xEF676E6972747379)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25BCA1A70();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25BC8E498()
{
  return 2;
}

uint64_t sub_25BC8E4A0()
{
  return 0;
}

uint64_t sub_25BC8E4AC(char a1)
{
  if (a1) {
    return 0x7265755168746170;
  }
  else {
    return 0x656D616E74736F68;
  }
}

BOOL sub_25BC8E4F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25BC8E360(*a1, *a2);
}

uint64_t sub_25BC8E4FC()
{
  return sub_25BC8EA74();
}

uint64_t sub_25BC8E518()
{
  return sub_25BC8E370();
}

uint64_t sub_25BC8E524()
{
  return sub_25BC8E4AC(*v0);
}

uint64_t sub_25BC8E52C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BC8E398(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25BC8E554()
{
  return sub_25BC8E4A0();
}

uint64_t sub_25BC8E574@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25BC8E498();
  *a1 = result;
  return result;
}

uint64_t sub_25BC8E59C(uint64_t a1)
{
  unint64_t v2 = sub_25BC8EE40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BC8E5D8(uint64_t a1)
{
  unint64_t v2 = sub_25BC8EE40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BC8E614(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A18);
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BC8EE40();
  sub_25BCA1B30();
  sub_25BCA1A20();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A00);
    uint64_t v8 = sub_25BC8EED8(&qword_26A554A20, (void (*)(void))sub_25BC8EF48);
    OUTLINED_FUNCTION_1_2(v8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_25BC8E788(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549F0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BC8EE40();
  sub_25BCA1B20();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v4 = sub_25BCA19F0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A00);
    sub_25BC8EED8(&qword_26A554A08, (void (*)(void))sub_25BC8EE8C);
    swift_bridgeObjectRetain();
    sub_25BCA1A10();
    uint64_t v6 = OUTLINED_FUNCTION_2_2();
    v7(v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_25BC8E994(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1752457584 && a2 == 0xE400000000000000;
  if (v3 || (sub_25BCA1A70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261507972657571 && a2 == 0xEA00000000006D61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25BCA1A70();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25BC8EA74()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC8EABC(char a1)
{
  if (a1) {
    return 0x7261507972657571;
  }
  else {
    return 1752457584;
  }
}

uint64_t sub_25BC8EAF0(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A68);
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BC8F2E0();
  sub_25BCA1B30();
  sub_25BCA1A30();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A58);
    uint64_t v8 = sub_25BC8F32C(&qword_26A554A70);
    OUTLINED_FUNCTION_1_2(v8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_25BC8EC4C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A48);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_25BC8F2E0();
  sub_25BCA1B20();
  if (!v1)
  {
    uint64_t v4 = sub_25BCA1A00();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A58);
    sub_25BC8F32C(&qword_26A554A60);
    sub_25BCA1A10();
    uint64_t v5 = OUTLINED_FUNCTION_3_1();
    v6(v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

uint64_t sub_25BC8EDF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25BC8E788(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_25BC8EE20(void *a1)
{
  return sub_25BC8E614(a1);
}

unint64_t sub_25BC8EE40()
{
  unint64_t result = qword_26A5549F8;
  if (!qword_26A5549F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5549F8);
  }
  return result;
}

unint64_t sub_25BC8EE8C()
{
  unint64_t result = qword_26A554A10;
  if (!qword_26A554A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A10);
  }
  return result;
}

uint64_t sub_25BC8EED8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A554A00);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25BC8EF48()
{
  unint64_t result = qword_26A554A28;
  if (!qword_26A554A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A28);
  }
  return result;
}

unsigned char *sub_25BC8EF9C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterModel.CodingKeys()
{
  return &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys;
}

void *initializeBufferWithCopyOfBuffer for SASafariAssistantUrlPathFilterPatternModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SASafariAssistantUrlPathFilterPatternModel()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SASafariAssistantUrlPathFilterPatternModel(void *a1, void *a2)
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

void *assignWithTake for SASafariAssistantUrlPathFilterPatternModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SASafariAssistantUrlPathFilterPatternModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SASafariAssistantUrlPathFilterPatternModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterPatternModel()
{
  return &type metadata for SASafariAssistantUrlPathFilterPatternModel;
}

unint64_t sub_25BC8F104()
{
  unint64_t result = qword_26A554A30;
  if (!qword_26A554A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A30);
  }
  return result;
}

uint64_t sub_25BC8F150()
{
  return sub_25BC8EABC(*v0);
}

uint64_t sub_25BC8F158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BC8E994(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25BC8F180(uint64_t a1)
{
  unint64_t v2 = sub_25BC8F2E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BC8F1BC(uint64_t a1)
{
  unint64_t v2 = sub_25BC8F2E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BC8F1F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25BC8EC4C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_25BC8F224(void *a1)
{
  return sub_25BC8EAF0(a1);
}

unint64_t sub_25BC8F244()
{
  unint64_t result = qword_26A554A38;
  if (!qword_26A554A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A38);
  }
  return result;
}

unint64_t sub_25BC8F294()
{
  unint64_t result = qword_26A554A40;
  if (!qword_26A554A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A40);
  }
  return result;
}

unint64_t sub_25BC8F2E0()
{
  unint64_t result = qword_26A554A50;
  if (!qword_26A554A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A50);
  }
  return result;
}

uint64_t sub_25BC8F32C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A554A58);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s12SearchAssets35SASafariAssistantUrlPathFilterModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12SearchAssets35SASafariAssistantUrlPathFilterModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BC8F4E4);
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

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterPatternModel.CodingKeys()
{
  return &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys;
}

unint64_t sub_25BC8F520()
{
  unint64_t result = qword_26A554A78;
  if (!qword_26A554A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A78);
  }
  return result;
}

unint64_t sub_25BC8F570()
{
  unint64_t result = qword_26A554A80;
  if (!qword_26A554A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A80);
  }
  return result;
}

unint64_t sub_25BC8F5C0()
{
  unint64_t result = qword_26A554A88;
  if (!qword_26A554A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554A88);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  return MEMORY[0x270F9F458](v3 - 88, v3 - 66, v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t sub_25BC8F6A0()
{
  uint64_t v0 = sub_25BCA1410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_currentLocale);
  sub_25BCA1400();

  uint64_t v5 = sub_25BCA13F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

id sub_25BC8F7BC()
{
  id result = objc_msgSend(self, sel_sharedConfiguration);
  if (result) {
    return (id)sub_25BC90148(result);
  }
  return result;
}

id sub_25BC8F818(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

id sub_25BC8F8B4(void *a1)
{
  id v1 = a1;
  sub_25BC8F958();
  uint64_t v3 = v2;

  if (v3)
  {
    id v4 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t sub_25BC8F958()
{
  uint64_t v0 = (void *)sub_25BCA1590();
  uint64_t v1 = MGCopyAnswer();

  if (!v1) {
    return 0;
  }
  if (swift_dynamicCast()) {
    return v3;
  }
  return 0;
}

uint64_t sub_25BC8F9FC()
{
  if (qword_26A554388 != -1) {
    swift_once();
  }
  if (byte_26A554E60) {
    return 2;
  }
  else {
    return 4;
  }
}

uint64_t sub_25BC8FA8C()
{
  uint64_t v1 = sub_25BC901B8(v0);
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = (void *)sub_25BCA1590();
    id v5 = objc_msgSend(v3, sel_safariAssistantAssetManagerWithLocale_, v4);

    uint64_t v6 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_assetVersionForLocale_, v6);

    swift_unknownObjectRelease();
    if (v7)
    {
      uint64_t v1 = sub_25BCA15A0();
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

id SADeviceInfo.init()()
{
  v1.super_class = (Class)SADeviceInfo;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t SATreatmentAllocStatus.description.getter(unsigned int a1)
{
  if (a1 > 3) {
    return 0xD000000000000020;
  }
  else {
    return *(void *)&aUnknown_1[8 * a1];
  }
}

unint64_t sub_25BC8FCE8()
{
  return SATreatmentAllocStatus.description.getter(*v0);
}

unint64_t SABuildType.description.getter(unsigned int a1)
{
  if (a1 > 4) {
    return 0xD000000000000015;
  }
  else {
    return *(void *)&aUnknown_2[8 * a1];
  }
}

unint64_t sub_25BC8FD34()
{
  return SABuildType.description.getter(*v0);
}

id sub_25BC8FD54(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25BC8FDB0(a3);
  if (v3)
  {
    id v4 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t sub_25BC8FDB0(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_25BC8FDF4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___SATrialExperiment__deploymentID);
  id v2 = v1;
  return v1;
}

void *sub_25BC8FE58()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___SATrialExperiment__compatibilityVersion);
  id v2 = v1;
  return v1;
}

uint64_t sub_25BC8FEBC()
{
  return *(unsigned int *)(v0 + OBJC_IVAR___SATrialExperiment__allocationStatus);
}

id _sSo12SADeviceInfoC12SearchAssetsEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

id SATrialExperiment.init()()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR___SATrialExperiment__experimentNamespace);
  *uint64_t v1 = 0;
  v1[1] = 0;
  id v2 = (void *)(v0 + OBJC_IVAR___SATrialExperiment__experimentID);
  *id v2 = 0;
  v2[1] = 0;
  uint64_t v3 = (void *)(v0 + OBJC_IVAR___SATrialExperiment__treatmentID);
  void *v3 = 0;
  v3[1] = 0;
  *(void *)(v0 + OBJC_IVAR___SATrialExperiment__deploymentID) = 0;
  *(void *)(v0 + OBJC_IVAR___SATrialExperiment__compatibilityVersion) = 0;
  *(_DWORD *)(v0 + OBJC_IVAR___SATrialExperiment__allocationStatus) = 0;
  v5.super_class = (Class)SATrialExperiment;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SADeviceInfo(uint64_t a1)
{
  return sub_25BC8B15C(a1, &qword_26A554AC0);
}

uint64_t type metadata accessor for SATrialExperiment(uint64_t a1)
{
  return sub_25BC8B15C(a1, &qword_26A554AC8);
}

uint64_t sub_25BC9008C()
{
  uint64_t result = sub_25BC900B0();
  byte_26A554E60 = result & 1;
  return result;
}

uint64_t sub_25BC900B0()
{
  uint64_t v0 = (void *)sub_25BCA1590();
  uint64_t v1 = MGCopyAnswer();

  if (v1) {
    return swift_dynamicCast() & v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC90148(void *a1)
{
  id v2 = objc_msgSend(a1, sel_countryCode);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25BCA15A0();

  return v3;
}

uint64_t sub_25BC901B8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_systemLocale);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_25BCA15A0();

  return v3;
}

uint64_t getEnumTagSinglePayload for ResourceAccessOutcome(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0x93)
  {
    if (a2 + 109 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 109) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 110;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x6E;
  int v5 = v6 - 110;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ResourceAccessOutcome(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 109 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 109) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x93) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x92)
  {
    unsigned int v6 = ((a2 - 147) >> 8) + 1;
    *uint64_t result = a2 + 109;
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
        JUMPOUT(0x25BC90370);
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
          *uint64_t result = a2 + 109;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessOutcome()
{
  return &type metadata for ResourceAccessOutcome;
}

unsigned char *storeEnumTagSinglePayload for ResourceAccessActivity(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD3)
  {
    unsigned int v6 = ((a2 - 212) >> 8) + 1;
    *uint64_t result = a2 + 44;
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
        JUMPOUT(0x25BC90474);
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
          *uint64_t result = a2 + 44;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessActivity()
{
  return &type metadata for ResourceAccessActivity;
}

uint64_t sub_25BC904AC()
{
  return 1;
}

BOOL sub_25BC904B4(char a1, char a2)
{
  return qword_25BCA3820[a1] == qword_25BCA3820[a2];
}

BOOL sub_25BC904D8(char a1, char a2)
{
  return qword_25BCA34B0[a1] == qword_25BCA34B0[a2];
}

uint64_t sub_25BC904FC()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC90550()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC905A8()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC905E8()
{
  return sub_25BCA1B00();
}

uint64_t sub_25BC9061C()
{
  return sub_25BCA1B00();
}

uint64_t sub_25BC90650()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC906A0()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC906F4()
{
  return sub_25BCA1B10();
}

uint64_t sub_25BC9072C(uint64_t a1)
{
  uint64_t v3 = a1 - 496;
  if (!(!v2 & v1))
  {
    uint64_t result = 29;
    switch(v3)
    {
      case 0:
        return 15;
      case 1:
        return 16;
      case 2:
        return 17;
      case 3:
        return 18;
      case 4:
        return 19;
      case 5:
        return 20;
      case 6:
        return 21;
      case 7:
        return 22;
      case 8:
        return 23;
      case 9:
        return 24;
      case 10:
        return 25;
      case 11:
        return 26;
      case 12:
        return 27;
      case 13:
        return 28;
      case 14:
        return result;
      case 15:
        return 30;
      case 16:
        return 31;
      case 17:
        return 32;
      case 18:
        return 33;
      case 19:
        return 34;
      case 20:
        return 35;
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 82:
      case 83:
        return 110;
      case 54:
        return 36;
      case 55:
        return 37;
      case 56:
        return 38;
      case 57:
        return 39;
      case 58:
        return 40;
      case 59:
        return 41;
      case 60:
        return 42;
      case 61:
        return 43;
      case 62:
        return 44;
      case 79:
        return 45;
      case 80:
        return 46;
      case 81:
        return 47;
      case 84:
        return 48;
      case 85:
        return 49;
      case 86:
        return 50;
      case 87:
        return 51;
      default:
        JUMPOUT(0);
    }
  }
  switch(a1)
  {
    case 700:
      return 56;
    case 701:
      return 57;
    case 702:
      return 58;
    case 1101:
      return 75;
    case 1102:
      return 76;
    case 1200:
      return 77;
    case 1420:
      return 102;
  }
  return 110;
}

uint64_t sub_25BC90ED8(char a1)
{
  return qword_25BCA34B0[a1];
}

uint64_t sub_25BC90EEC(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 7;
      break;
    case 8:
      uint64_t result = 8;
      break;
    case 9:
      uint64_t result = 9;
      break;
    case 10:
      uint64_t result = 10;
      break;
    case 11:
      uint64_t result = 11;
      break;
    case 12:
      uint64_t result = 12;
      break;
    case 13:
      uint64_t result = 13;
      break;
    case 14:
      uint64_t result = 14;
      break;
    case 15:
      uint64_t result = 15;
      break;
    case 16:
      uint64_t result = 16;
      break;
    case 17:
      uint64_t result = 17;
      break;
    case 18:
      uint64_t result = 18;
      break;
    case 19:
      uint64_t result = 19;
      break;
    case 20:
      uint64_t result = 20;
      break;
    case 21:
      uint64_t result = 21;
      break;
    case 22:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
      goto LABEL_10;
    case 23:
      uint64_t result = 22;
      break;
    case 24:
      uint64_t result = 23;
      break;
    case 25:
      uint64_t result = 24;
      break;
    case 26:
      uint64_t result = 25;
      break;
    case 27:
      uint64_t result = 26;
      break;
    case 28:
      uint64_t result = 27;
      break;
    case 29:
      uint64_t result = 28;
      break;
    case 30:
      uint64_t result = 29;
      break;
    case 31:
      uint64_t result = 30;
      break;
    case 50:
      uint64_t result = 31;
      break;
    case 60:
      uint64_t result = 32;
      break;
    case 61:
      uint64_t result = 33;
      break;
    case 62:
      uint64_t result = 34;
      break;
    case 63:
      uint64_t result = 35;
      break;
    case 65:
      uint64_t result = 36;
      break;
    case 66:
      uint64_t result = 37;
      break;
    case 67:
      uint64_t result = 38;
      break;
    default:
      switch(a1)
      {
        case 100:
          uint64_t result = 39;
          break;
        case 200:
          uint64_t result = 40;
          break;
        case 300:
          uint64_t result = 41;
          break;
        case 301:
          uint64_t result = 42;
          break;
        case 400:
          uint64_t result = 43;
          break;
        case 500:
          uint64_t result = 44;
          break;
        default:
LABEL_10:
          uint64_t result = 45;
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_25BC911C4(char a1)
{
  return qword_25BCA3820[a1];
}

BOOL sub_25BC911D8(char *a1, char *a2)
{
  return sub_25BC904D8(*a1, *a2);
}

uint64_t sub_25BC911E4()
{
  return sub_25BC90550();
}

uint64_t sub_25BC911EC()
{
  return sub_25BC9061C();
}

uint64_t sub_25BC911F4()
{
  return sub_25BC90650();
}

uint64_t sub_25BC911FC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25BC9072C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25BC91228@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25BC90ED8(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25BC91254@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25BC90EEC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25BC91280@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25BC911C4(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_25BC912B0()
{
  unint64_t result = qword_26A554AD0;
  if (!qword_26A554AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554AD0);
  }
  return result;
}

unint64_t sub_25BC91300()
{
  unint64_t result = qword_26A554AD8[0];
  if (!qword_26A554AD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A554AD8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_25BCA1620();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_25BCA1620();
}

void sub_25BC91388()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_25BC9272C();
    if (v1 <= 0x3F)
    {
      sub_25BCA13E0();
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t sub_25BC914C8()
{
  OUTLINED_FUNCTION_1_4();
  if ((*(unsigned char *)(v0 + *(void *)(v2 + 120)) & 1) == 0) {
    (*(void (**)(void))(v1 + 400))();
  }
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v3 + 8))();

  OUTLINED_FUNCTION_3_0();
  sub_25BC93038(v0 + *(void *)(v4 + 136), (uint64_t *)&unk_26A554C70);
  OUTLINED_FUNCTION_3_0();
  sub_25BCA13E0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0();
  v5();
  swift_release();
  return v0;
}

uint64_t sub_25BC91634()
{
  OUTLINED_FUNCTION_3_2();
  type metadata accessor for ActivitySpan.ActivityData();
  swift_retain();
  sub_25BCA1098((void (*)(void))sub_25BC92D50);
  swift_release();
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25BCA2690;
  sub_25BC91CE0();
  uint64_t v1 = sub_25BCA1930();
  uint64_t v3 = v2;
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  unint64_t v5 = sub_25BC8004C();
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  uint64_t v6 = sub_25BC91C88();
  *(void *)(v0 + 96) = v4;
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 72) = v6;
  *(void *)(v0 + 80) = v7;
  uint64_t v8 = sub_25BC91C30();
  *(void *)(v0 + 136) = v4;
  *(void *)(v0 + 144) = v5;
  *(void *)(v0 + 112) = v8;
  *(void *)(v0 + 120) = v9;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  if ((v21 & 1) == 0)
  {
    sub_25BCA17E0();
    uint64_t v10 = OUTLINED_FUNCTION_5_2();
    *(_OWORD *)(v10 + 16) = xmmword_25BCA2560;
    uint64_t v11 = sub_25BCA1930();
    *(void *)(v10 + 56) = v4;
    *(void *)(v10 + 64) = v5;
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v12;
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRetain();
      sub_25BCA17E0();
      uint64_t v13 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v13 + 16) = xmmword_25BCA2560;
      *(void *)(v13 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BF8);
      *(void *)(v13 + 64) = sub_25BC81510((unint64_t *)&unk_26A554C00, &qword_26A554BF8);
      *(void *)(v13 + 32) = v23;
      OUTLINED_FUNCTION_4_3();
      swift_bridgeObjectRelease();
    }
  }
  if (v22)
  {
    swift_bridgeObjectRetain();
    sub_25BCA17E0();
    uint64_t v14 = OUTLINED_FUNCTION_5_2();
    *(_OWORD *)(v14 + 16) = xmmword_25BCA2560;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BE8);
    *(void *)(v14 + 64) = sub_25BC81510(&qword_26A554BF0, &qword_26A554BE8);
    *(void *)(v14 + 32) = v22;
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
  }
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25BCA19A0();
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_13;
    }
  }
  if (v15 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v17 = 0;
  do
  {
    ++v17;
    swift_unknownObjectRetain();
    sub_25BCA17E0();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_25BCA2560;
    swift_unknownObjectRetain();
    uint64_t v19 = sub_25BCA15F0();
    *(void *)(v18 + 56) = v4;
    *(void *)(v18 + 64) = v5;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v20;
    sub_25BCA14A0();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  while (v15 != v17);
LABEL_13:
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  sub_25BCA14A0();
  if (sub_25BC91D50())
  {
    sub_25BCA17F0();
    sub_25BCA14A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC91B60()
{
  OUTLINED_FUNCTION_3_0();
  return (*(uint64_t (**)(uint64_t (*)(), void))(v0 + 408))(nullsub_1, 0);
}

uint64_t sub_25BC91BA8(void (*a1)(void))
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v3 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_25BC92A08(v1, a1);
  os_unfair_lock_unlock(v4);
  return swift_release();
}

uint64_t sub_25BC91C30()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_2();
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 24))();
}

uint64_t sub_25BC91C88()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_2();
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 32))();
}

uint64_t sub_25BC91CE0()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_2();
  return v1(*(void *)(v0 + 80));
}

uint64_t sub_25BC91D50()
{
  OUTLINED_FUNCTION_3_2();
  uint64_t v2 = *(void *)(v1 + 80);
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v3);
  unint64_t v5 = (char *)v12 - v4;
  OUTLINED_FUNCTION_3_2();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, v0 + *(void *)(v6 + 112), v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554C18);
  if (swift_dynamicCast())
  {
    sub_25BC7DABC(v12, (uint64_t)v14);
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    char v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_25BC93038((uint64_t)v12, (uint64_t *)&unk_26A554C20);
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_25BC91E98()
{
  uint64_t v0 = sub_25BCA13E0();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  unint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_1();
  v6();
  sub_25BCA13A0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v0);
}

uint64_t sub_25BC91FA0()
{
  return sub_25BCA15F0();
}

uint64_t sub_25BC91FD0()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = *v0;
  uint64_t v43 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v38[-v7];
  uint64_t v48 = *(void *)(v2 + 80);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = *(void *)(v1 + 24);
  uint64_t v42 = (void *)(v1 + 24);
  uint64_t v40 = *(void *)(v1 + 32);
  int v39 = *(unsigned __int8 *)(v1 + 40);
  char v13 = *(unsigned char *)(v1 + 41);
  uint64_t v14 = *(void *)(v1 + 48);
  uint64_t v15 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v45 = *(void *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v46 = v16;
  swift_bridgeObjectRetain();
  sub_25BC92A58(v14);
  OUTLINED_FUNCTION_6_0();
  uint64_t v44 = v10;
  uint64_t v47 = v14;
  if ((v13 & 1) == 0 && v15)
  {
    uint64_t v17 = v48;
    OUTLINED_FUNCTION_7_1();
    v18();
    OUTLINED_FUNCTION_9_1();
    sub_25BC92F8C(v1, (uint64_t)v8);
    uint64_t v19 = sub_25BCA14E0();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v19);
    if (result != 1)
    {
      OUTLINED_FUNCTION_6_0();
      uint64_t v22 = *(void *)(v1 + *(void *)(v21 + 128));
      uint64_t v23 = *(void *)(v43 + 88);
      swift_bridgeObjectRetain();
      sub_25BC925FC((uint64_t)v8, v22, v41, v40, v39, v15, v17, v23);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_0();
      v24();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_9_0();
      v25();
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v26 = v48;
  OUTLINED_FUNCTION_7_1();
  v27();
  OUTLINED_FUNCTION_9_1();
  sub_25BC92F8C(v1, (uint64_t)v6);
  uint64_t v28 = sub_25BCA14E0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v28);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_6_0();
  sub_25BC9256C((uint64_t)v6, *(void *)(v1 + *(void *)(v29 + 128)), v26, *(void *)(v43 + 88));
  OUTLINED_FUNCTION_9_0();
  v30();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0();
  v31();
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v33 = Strong;
    uint64_t v34 = type metadata accessor for ActivitySpan();
    sub_25BC8D7D0(v1, v33, v34, (uint64_t)&off_270952220);
    char v50 = 1;
    *(void *)&v49[14] = 0;
    *(void *)&v49[6] = 0;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v35 = v42;
    void *v42 = 0;
    v35[1] = 0;
    *((unsigned char *)v35 + 16) = 0;
    *(unsigned char *)(v1 + 41) = v50;
    *(_OWORD *)(v1 + 42) = *(_OWORD *)v49;
    uint64_t v36 = MEMORY[0x263F8EE78];
    *(void *)(v1 + 56) = *(void *)&v49[14];
    *(void *)(v1 + 64) = v36;
    *(void *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6_0();
    *(unsigned char *)(v1 + *(void *)(v37 + 120)) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_25BC91D50())
    {
      sub_25BCA17F0();
      sub_25BCA14A0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC924CC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = *(os_unfair_lock_s **)(*(void *)(v4 + *(void *)(v9 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_25BC92C0C(v4, a1, a2, a3, a4);
  os_unfair_lock_unlock(v10);
  return swift_release();
}

uint64_t sub_25BC9256C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25BCA1820();
  (*(void (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  return sub_25BCA14C0();
}

void sub_25BC925FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = sub_25BCA1820();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 40))(a7, a8);
  LOBYTE(v20) = a5;
  sub_25BC7E884(v16, a2, v17, v18, v19, a1, a3, a4, v20, a6);
}

uint64_t sub_25BC926BC()
{
  sub_25BC914C8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ActivitySpan()
{
  return __swift_instantiateGenericMetadata();
}

void sub_25BC9272C()
{
  if (!qword_26A554B60[0])
  {
    sub_25BCA14E0();
    unint64_t v0 = sub_25BCA1860();
    if (!v1) {
      atomic_store(v0, qword_26A554B60);
    }
  }
}

uint64_t sub_25BC92784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_25BC9278C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC927D8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_25BC92840(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t sub_25BC928FC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_25BC92964(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t sub_25BC929A4(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ActivitySpan.ActivityData()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BC92A08(uint64_t result, void (*a2)(void))
{
  if ((*(unsigned char *)(result + *(void *)(*(void *)result + 120)) & 1) == 0)
  {
    a2();
    return sub_25BC91FD0();
  }
  return result;
}

void sub_25BC92A58(uint64_t a1)
{
  if (sub_25BC92D58(a1))
  {
    OUTLINED_FUNCTION_3_0();
    sub_25BCA17D0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_25BCA26A0;
    uint64_t v2 = sub_25BC91C88();
    uint64_t v4 = v3;
    uint64_t v5 = MEMORY[0x263F8D310];
    *(void *)(v1 + 56) = MEMORY[0x263F8D310];
    unint64_t v6 = sub_25BC8004C();
    *(void *)(v1 + 64) = v6;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v4;
    sub_25BC80000();
    OUTLINED_FUNCTION_11_0();
    uint64_t v7 = sub_25BCA1550();
    *(void *)(v1 + 96) = v5;
    *(void *)(v1 + 104) = v6;
    *(void *)(v1 + 72) = v7;
    *(void *)(v1 + 80) = v8;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    sub_25BC91C30();
    sub_25BC91C88();
    sub_25BC8D9AC();
    uint64_t v9 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_0();
    id v10 = (id)sub_25BCA1530();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC92C0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 41) = 0;
  *(void *)(a1 + 56) = a5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC92C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 41);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(unsigned char *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 17) = v3;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v6;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_25BC92CD4()
{
  return *(id *)(v0 + *(void *)(*(void *)v0 + 128));
}

uint64_t sub_25BC92CF8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t sub_25BC92D24()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t sub_25BC92D50@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC92C58(v1, a1);
}

uint64_t sub_25BC92D58(uint64_t a1)
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = *(void *)(v2 + 80);
  OUTLINED_FUNCTION_2_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - v7;
  OUTLINED_FUNCTION_7_1();
  v9();
  uint64_t DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  uint64_t v11 = dynamic_cast_existential_1_conditional(DynamicType);
  uint64_t v13 = 0;
  if (v11 && a1)
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    uint64_t v17 = v16(v14, v15);
    uint64_t v19 = v18;
    sub_25BCA16F0();
    uint64_t v20 = sub_25BCA1870();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = a1;
    sub_25BC9779C(v20, v17, v19);
    uint64_t v21 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    uint64_t v24 = v23;
    sub_25BC91E98();
    uint64_t v25 = sub_25BCA17B0();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = v21;
    sub_25BC9779C(v25, v22, v24);
    uint64_t v13 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t sub_25BC92F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_25BC93038(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_25BCA14A0();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0;
}

void sub_25BC9314C()
{
}

void sub_25BC9316C()
{
}

void sub_25BC93198()
{
}

void sub_25BC931B8()
{
}

void sub_25BC931E0()
{
}

void sub_25BC93200()
{
}

void sub_25BC93220()
{
}

void sub_25BC9324C()
{
}

void OUTLINED_FUNCTION_0_6(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = v2;
}

uint64_t sub_25BC93280()
{
  uint64_t v0 = sub_25BCA1510();
  __swift_allocate_value_buffer(v0, qword_26B34BF78);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
  return sub_25BCA1500();
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

uint64_t sub_25BC9335C(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = (id *)v6;
  uint64_t v49 = a4;
  uint64_t v50 = a6;
  int v47 = a5;
  uint64_t v48 = a3;
  int v54 = a2;
  uint64_t v53 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v51 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v45 - v11;
  uint64_t v52 = sub_25BCA13E0();
  uint64_t v13 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0;
  *(_WORD *)(v6 + 40) = 256;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 64) = MEMORY[0x263F8EE78];
  *(void *)(v6 + 72) = 0;
  *(unsigned char *)(v6 + 81) = 0;
  unint64_t v57 = 0xD000000000000010;
  unint64_t v58 = 0x800000025BCA4F40;
  uint64_t v55 = 45;
  unint64_t v56 = 0xE100000000000000;
  sub_25BC8B15C(0, (unint64_t *)&qword_26A5549B8);
  uint64_t v59 = 95;
  unint64_t v60 = 0xE100000000000000;
  unint64_t v44 = sub_25BC8A500();
  sub_25BCA18B0();
  if (qword_26A5543D8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v6 + 88) = sub_25BCA1850();
  uint64_t v16 = v6 + *(void *)(*(void *)v6 + 136);
  uint64_t v17 = sub_25BCA14E0();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  uint64_t v18 = *((void *)*v7 + 19);
  type metadata accessor for Locker();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = (_DWORD *)swift_slowAlloc();
  *(void *)(v19 + 16) = v20;
  *uint64_t v20 = 0;
  *(id *)((char *)v7 + v18) = (id)v19;
  sub_25BCA13D0();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)v7 + *((void *)*v7 + 18), v15, v52);
  uint64_t v21 = v53;
  swift_weakAssign();
  char v22 = v54;
  *((unsigned char *)v7 + 80) = v54;
  id v23 = v7[11];
  swift_retain();
  sub_25BCA14D0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v17);
  uint64_t v24 = (uint64_t)v7 + *((void *)*v7 + 17);
  swift_beginAccess();
  uint64_t v52 = v24;
  sub_25BC97370((uint64_t)v12, v24);
  swift_endAccess();
  unint64_t v57 = (unint64_t)v7;
  swift_retain();
  uint64_t v25 = sub_25BCA15F0();
  uint64_t v27 = v26;
  uint64_t v28 = *(os_unfair_lock_s **)(v21[4] + 16);
  os_unfair_lock_lock(v28);
  uint64_t v29 = v21 + 2;
  if (MEMORY[0x261174AC0](v21 + 2))
  {
    uint64_t v46 = v17;
    uint64_t v30 = v21[3];
    swift_beginAccess();
    unint64_t v31 = v21;
    uint64_t v32 = v21[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25BC988F8(v25, v27, v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v33)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v30 + 32))(v7, &off_270952220, ObjectType, v30);
    }
    swift_unknownObjectRelease();
    uint64_t v21 = v31;
    char v22 = v54;
    uint64_t v17 = v46;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v35 + 24) = &off_270952220;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_25BC976F0(v35, v25, v27);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v28);
  swift_bridgeObjectRelease();
  if (MEMORY[0x261174AC0](v29))
  {
    uint64_t v36 = v21[3];
    uint64_t v37 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v36 + 8))(v7, &off_270952220, v37, v36);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  uint64_t v38 = v51;
  sub_25BC92F8C(v52, v51);
  uint64_t result = __swift_getEnumTagSinglePayload(v38, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v40 = v7[11];
    uint64_t v41 = sub_25BCA1830();
    uint64_t v42 = sub_25BC965C0(v22);
    LOBYTE(v44) = v47;
    sub_25BC7E884(v41, (uint64_t)v40, (uint64_t)v42, v43, 2, v38, v48, v49, v44, v50);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v38, v17);
    sub_25BC95AAC();
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_25BC939BC()
{
  if (*(unsigned char *)(v0 + 81) != 1) {
    (*(void (**)(void))(*(void *)v0 + 400))();
  }
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_3_0();
  sub_25BC97BBC(v0 + *(void *)(v1 + 136), (uint64_t *)&unk_26A554C70);
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v0 + *(void *)(v2 + 144);
  sub_25BCA13E0();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  swift_release();
  return v0;
}

uint64_t sub_25BC93AD0()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v0 + *(void *)(v1 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  char v28 = *(unsigned char *)(v0 + 41);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  unint64_t v5 = *(void *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v2);
  swift_release();
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25BCA2690;
  sub_25BC965C0(*(unsigned char *)(v0 + 80));
  uint64_t v8 = sub_25BCA1930();
  uint64_t v10 = v9;
  uint64_t v11 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v12 = sub_25BC8004C();
  *(void *)(v7 + 64) = v12;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  if (qword_26A554378 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_26A554E38;
  uint64_t v13 = unk_26A554E40;
  *(void *)(v7 + 96) = v11;
  *(void *)(v7 + 104) = v12;
  *(void *)(v7 + 72) = v14;
  *(void *)(v7 + 80) = v13;
  *(void *)(v7 + 136) = v11;
  *(void *)(v7 + 144) = v12;
  unint64_t v27 = v12;
  *(void *)(v7 + 112) = 0xD000000000000010;
  *(void *)(v7 + 120) = 0x800000025BCA4F40;
  swift_bridgeObjectRetain();
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
    sub_25BCA17E0();
    uint64_t v15 = OUTLINED_FUNCTION_1_1();
    *(_OWORD *)(v15 + 16) = xmmword_25BCA2560;
    uint64_t v16 = sub_25BCA1930();
    *(void *)(v15 + 56) = MEMORY[0x263F8D310];
    *(void *)(v15 + 64) = v12;
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v17;
    OUTLINED_FUNCTION_4_4();
    swift_bridgeObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRetain();
      sub_25BCA17E0();
      uint64_t v18 = OUTLINED_FUNCTION_1_1();
      *(_OWORD *)(v18 + 16) = xmmword_25BCA2560;
      *(void *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BF8);
      *(void *)(v18 + 64) = sub_25BC81510((unint64_t *)&unk_26A554C00, &qword_26A554BF8);
      *(void *)(v18 + 32) = v6;
      OUTLINED_FUNCTION_4_4();
      swift_bridgeObjectRelease();
    }
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_25BCA17E0();
    uint64_t v19 = OUTLINED_FUNCTION_1_1();
    *(_OWORD *)(v19 + 16) = xmmword_25BCA2560;
    *(void *)(v19 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BE8);
    *(void *)(v19 + 64) = sub_25BC81510(&qword_26A554BF0, &qword_26A554BE8);
    *(void *)(v19 + 32) = v3;
    OUTLINED_FUNCTION_4_4();
    swift_bridgeObjectRelease();
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25BCA19A0();
    uint64_t v20 = result;
  }
  else
  {
    uint64_t v20 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (v20)
  {
    if (v20 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v22 = 0;
    uint64_t v23 = MEMORY[0x263F8D310];
    do
    {
      ++v22;
      swift_unknownObjectRetain();
      sub_25BCA17E0();
      uint64_t v24 = OUTLINED_FUNCTION_1_1();
      *(_OWORD *)(v24 + 16) = xmmword_25BCA2560;
      swift_unknownObjectRetain();
      uint64_t v25 = sub_25BCA15F0();
      *(void *)(v24 + 56) = v23;
      *(void *)(v24 + 64) = v27;
      *(void *)(v24 + 32) = v25;
      *(void *)(v24 + 40) = v26;
      sub_25BCA14A0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v20 != v22);
  }
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  sub_25BCA14A0();
  if (sub_25BC94DA4())
  {
    sub_25BCA17F0();
    sub_25BCA14A0();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC9400C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + *(void *)(*(void *)v0 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  char v27 = *(unsigned char *)(v0 + 41);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  unint64_t v4 = *(void *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  swift_release();
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25BCA2690;
  sub_25BC965C0(*(unsigned char *)(v0 + 80));
  uint64_t v7 = sub_25BCA1930();
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  unint64_t v11 = sub_25BC8004C();
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  if (qword_26A5543D8 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_26A554EE8;
  uint64_t v12 = unk_26A554EF0;
  *(void *)(v6 + 96) = v10;
  *(void *)(v6 + 104) = v11;
  *(void *)(v6 + 72) = v13;
  *(void *)(v6 + 80) = v12;
  *(void *)(v6 + 136) = v10;
  *(void *)(v6 + 144) = v11;
  unint64_t v26 = v11;
  *(void *)(v6 + 112) = 0xD000000000000010;
  *(void *)(v6 + 120) = 0x800000025BCA4F40;
  swift_bridgeObjectRetain();
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_25BCA17E0();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_25BCA2560;
    uint64_t v15 = sub_25BCA1930();
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = v11;
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v16;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_25BCA17E0();
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_25BCA2560;
      *(void *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BF8);
      *(void *)(v17 + 64) = sub_25BC81510((unint64_t *)&unk_26A554C00, &qword_26A554BF8);
      *(void *)(v17 + 32) = v5;
      sub_25BCA14A0();
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_25BCA17E0();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_25BCA2560;
    *(void *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554BE8);
    *(void *)(v18 + 64) = sub_25BC81510(&qword_26A554BF0, &qword_26A554BE8);
    *(void *)(v18 + 32) = v2;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25BCA19A0();
    uint64_t v19 = result;
  }
  else
  {
    uint64_t v19 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (v19)
  {
    if (v19 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = 0;
    uint64_t v22 = MEMORY[0x263F8D310];
    do
    {
      ++v21;
      swift_unknownObjectRetain();
      sub_25BCA17E0();
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_25BCA2560;
      swift_unknownObjectRetain();
      uint64_t v24 = sub_25BCA15F0();
      *(void *)(v23 + 56) = v22;
      *(void *)(v23 + 64) = v26;
      *(void *)(v23 + 32) = v24;
      *(void *)(v23 + 40) = v25;
      sub_25BCA14A0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v19 != v21);
  }
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  sub_25BCA14A0();
  if (sub_25BC94E8C())
  {
    sub_25BCA17F0();
    sub_25BCA14A0();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC9459C()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = *(void *)(v0 + *(void *)(v2 + 464) + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  uint64_t v6 = v5(ObjectType, v3);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    self;
    uint64_t v8 = (void *)swift_dynamicCastObjCClass();
    if (v8)
    {
      objc_msgSend(v8, sel_statusCode);
      if (!(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(ObjectType, v3))
      {

        *(double *)&uint64_t result = 0.0;
        return result;
      }
      *(void *)&long long v96 = 0xD000000000000021;
      *((void *)&v96 + 1) = 0x800000025BCA4B90;
      uint64_t v9 = sub_25BCA18F0();
      OUTLINED_FUNCTION_2_4(v9, v10, v11, v12, v13, v14, v15, v16, v64, v68, v72, v76, v80, v82, v87, v91, v92, v93, v94,
        v95,
        v96);
      sub_25BC80098((uint64_t)&v91);
      if (v97) {
        OUTLINED_FUNCTION_1_5();
      }
      else {
        sub_25BC97BBC((uint64_t)&v96, (uint64_t *)&unk_26A554850);
      }
      *(void *)&long long v96 = 0xD00000000000001DLL;
      *((void *)&v96 + 1) = 0x800000025BCA4BC0;
      uint64_t v28 = sub_25BCA18F0();
      OUTLINED_FUNCTION_2_4(v28, v29, v30, v31, v32, v33, v34, v35, v65, v69, v73, v77, v81, v83, v88, v91, v92, v93, v94,
        v95,
        v96);
      sub_25BC80098((uint64_t)&v91);
      if (v97) {
        OUTLINED_FUNCTION_1_5();
      }
      else {
        sub_25BC97BBC((uint64_t)&v96, (uint64_t *)&unk_26A554850);
      }
      uint64_t v39 = sub_25BCA18F0();
      OUTLINED_FUNCTION_2_4(v39, v40, v41, v42, v43, v44, v45, v46, v66, v70, v74, 0xD00000000000001BLL, 0x800000025BCA4BE0, v84, v89, v91, v92, v93, v94,
        v95,
        v96);
      sub_25BC80098((uint64_t)&v91);
      if (v97)
      {
        if (OUTLINED_FUNCTION_1_5())
        {
          uint64_t v86 = v78;
          goto LABEL_26;
        }
      }
      else
      {
        sub_25BC97BBC((uint64_t)&v96, (uint64_t *)&unk_26A554850);
      }
      uint64_t v47 = sub_25BCA18F0();
      OUTLINED_FUNCTION_2_4(v47, v48, v49, v50, v51, v52, v53, v54, v67, v71, v75, 0xD00000000000001BLL, 0x800000025BCA4C00, v85, v90, v91, v92, v93, v94,
        v95,
        v96);
      sub_25BC80098((uint64_t)&v91);
      if (v97)
      {
        if (swift_dynamicCast())
        {
LABEL_26:
          double v55 = *(double *)&v86;
          uint64_t v56 = sub_25BCA18F0();
          OUTLINED_FUNCTION_2_4(v56, v57, v58, v59, v60, v61, v62, v63, v67, v71, v75, 0xD00000000000001ALL, 0x800000025BCA4C20, v86, v90, v91, v92, v93, v94,
            v95,
            v96);
          swift_bridgeObjectRelease();

          sub_25BC80098((uint64_t)&v91);
          if (v97)
          {
            if (OUTLINED_FUNCTION_1_5())
            {
              *(double *)&uint64_t result = v79 - v55;
              return result;
            }
          }
          else
          {
            sub_25BC97BBC((uint64_t)&v96, (uint64_t *)&unk_26A554850);
          }
          goto LABEL_32;
        }
      }
      else
      {
        sub_25BC97BBC((uint64_t)&v96, (uint64_t *)&unk_26A554850);
      }
      swift_bridgeObjectRelease();

LABEL_32:
      *(double *)&uint64_t result = 0.0;
      return result;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v17 = OUTLINED_FUNCTION_1_1();
  *(_OWORD *)(v17 + 16) = xmmword_25BCA2560;
  uint64_t v91 = v5(ObjectType, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
  uint64_t v18 = sub_25BCA15F0();
  uint64_t v20 = v19;
  uint64_t v21 = MEMORY[0x263F8D310];
  *(void *)(v17 + 56) = MEMORY[0x263F8D310];
  unint64_t v22 = sub_25BC8004C();
  *(void *)(v17 + 64) = v22;
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v20;
  OUTLINED_FUNCTION_6_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s", 68);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  uint64_t v24 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v23 + 152)) + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v24);
  if ((*(unsigned char *)(v1 + 81) & 1) == 0)
  {
    OUTLINED_FUNCTION_6_0();
    uint64_t v26 = *(void *)(v1 + *(void *)(v25 + 480));
    if (v26)
    {
      swift_unknownObjectRetain();
      if (nw_activity_is_activated())
      {
        OUTLINED_FUNCTION_6_0();
        nw_activity_complete_with_reason();
      }
      else
      {
        sub_25BCA17C0();
        uint64_t v36 = OUTLINED_FUNCTION_1_1();
        *(_OWORD *)(v36 + 16) = xmmword_25BCA2560;
        uint64_t v91 = v26;
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554CC0);
        uint64_t v37 = sub_25BCA15F0();
        *(void *)(v36 + 56) = v21;
        *(void *)(v36 + 64) = v22;
        *(void *)(v36 + 32) = v37;
        *(void *)(v36 + 40) = v38;
        sub_25BCA14A0();
        swift_bridgeObjectRelease();
      }
      swift_unknownObjectRelease();
    }
    sub_25BC950A4();
  }
  os_unfair_lock_unlock(v24);
  swift_release();
  swift_release();
  *(double *)&uint64_t result = 0.0;
  return result;
}

void sub_25BC94B10()
{
  if ((v0[81] & 1) == 0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = sub_25BC9459C();
    uint64_t v5 = MEMORY[0x263F8D310];
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
      uint64_t v7 = OUTLINED_FUNCTION_1_1();
      *(_OWORD *)(v7 + 16) = xmmword_25BCA2560;
      uint64_t v8 = *(void *)&v0[*(void *)(*(void *)v0 + 464) + 8];
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A554838);
      uint64_t v10 = sub_25BCA15F0();
      uint64_t v12 = v11;
      *(void *)(v7 + 56) = v5;
      *(void *)(v7 + 64) = sub_25BC8004C();
      *(void *)(v7 + 32) = v10;
      *(void *)(v7 + 40) = v12;
      OUTLINED_FUNCTION_6_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s", 68);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(void *)v0 + 568))(v3, v4, *(double *)&v2);
    }
    uint64_t v13 = *(os_unfair_lock_s **)(*(void *)&v1[*(void *)(*(void *)v1 + 152)] + 16);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v13);
    if ((v1[81] & 1) == 0)
    {
      if (*(void *)&v1[*(void *)(*(void *)v1 + 480)])
      {
        swift_unknownObjectRetain();
        if (nw_activity_is_activated())
        {
          nw_activity_complete_with_reason();
        }
        else
        {
          sub_25BCA17C0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
          uint64_t v14 = OUTLINED_FUNCTION_1_1();
          *(_OWORD *)(v14 + 16) = xmmword_25BCA2560;
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554CC0);
          uint64_t v15 = sub_25BCA15F0();
          uint64_t v17 = v16;
          *(void *)(v14 + 56) = v5;
          *(void *)(v14 + 64) = sub_25BC8004C();
          *(void *)(v14 + 32) = v15;
          *(void *)(v14 + 40) = v17;
          sub_25BCA14A0();
          swift_bridgeObjectRelease();
        }
        swift_unknownObjectRelease();
      }
      sub_25BC950A4();
    }
    os_unfair_lock_unlock(v13);
    swift_release();
    swift_release();
  }
}

BOOL sub_25BC94DA4()
{
  char v1 = *(unsigned char *)(v0 + 80);
  v9[3] = &type metadata for ResourceNetworkActivity;
  void v9[4] = &off_270951D48;
  LOBYTE(v9[0]) = v1;
  uint64_t v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceNetworkActivity);
  if (qword_26A554380 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(qword_26A554E48 + 16);
    if (!v3) {
      break;
    }
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_25BCA3B98[*(char *)(qword_26A554E48 + 32 + v4)] == qword_25BCA3B98[v2])
      {
        int v6 = *(unsigned __int8 *)(qword_26A554E48 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v6 = 45;
LABEL_9:
  BOOL v7 = v6 == 45;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

BOOL sub_25BC94E8C()
{
  char v1 = *(unsigned char *)(v0 + 80);
  v9[3] = &type metadata for ResourceAccessActivity;
  void v9[4] = &off_270952270;
  LOBYTE(v9[0]) = v1;
  uint64_t v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_26A5543E0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(qword_26A554EF8 + 16);
    if (!v3) {
      break;
    }
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_25BCA3B98[*(char *)(qword_26A554EF8 + 32 + v4)] == qword_25BCA3B98[v2])
      {
        int v6 = *(unsigned __int8 *)(qword_26A554EF8 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v6 = 45;
LABEL_9:
  BOOL v7 = v6 == 45;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

uint64_t sub_25BC94F74()
{
  uint64_t v1 = sub_25BCA13E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(void *)(v5 + 144), v1);
  sub_25BCA13A0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_25BC950A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v38 - v6;
  uint64_t v9 = v0 + 24;
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v10 = *(void *)(v0 + 32);
  char v11 = *(unsigned char *)(v0 + 40);
  char v12 = *(unsigned char *)(v0 + 41);
  uint64_t v13 = (void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v39 = v8;
  uint64_t v40 = v13;
  uint64_t v15 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v41 = *(void *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v42 = v16;
  swift_bridgeObjectRetain();
  uint64_t v43 = v14;
  sub_25BC95CB8(v14);
  char v17 = *(unsigned char *)(v1 + 80);
  uint64_t v18 = v1 + *(void *)(*(void *)v1 + 136);
  if ((v12 & 1) == 0 && v15)
  {
    swift_beginAccess();
    sub_25BC92F8C(v18, (uint64_t)v7);
    uint64_t v19 = sub_25BCA14E0();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19);
    if (result != 1)
    {
      uint64_t v21 = *(void *)(v1 + 88);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_25BCA1820();
      uint64_t v23 = sub_25BC965C0(v17);
      LOBYTE(v37) = v11;
      sub_25BC7E884(v22, v21, (uint64_t)v23, v24, 2, (uint64_t)v7, v39, v10, v37, v15);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v7, v19);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_25BC92F8C(v18, (uint64_t)v5);
  uint64_t v25 = sub_25BCA14E0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v25);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  sub_25BCA1820();
  sub_25BC965C0(v17);
  sub_25BCA14C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v5, v25);
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v27 = Strong;
    uint64_t v44 = v1;
    swift_retain();
    uint64_t v28 = sub_25BCA15F0();
    uint64_t v30 = v29;
    uint64_t v31 = *(os_unfair_lock_s **)(*(void *)(v27 + 32) + 16);
    os_unfair_lock_lock(v31);
    sub_25BC8D080(v27, v28, v30, v1, (uint64_t)&off_270952220);
    os_unfair_lock_unlock(v31);
    swift_bridgeObjectRelease();
    if (MEMORY[0x261174AC0](v27 + 16))
    {
      uint64_t v32 = *(void *)(v27 + 24);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v34 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v32 + 16);
      uint64_t v35 = swift_retain();
      v34(v35, &off_270952220, ObjectType, v32);
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(unsigned char *)(v9 + 16) = 0;
    *(unsigned char *)(v1 + 41) = 1;
    uint64_t v36 = v40;
    *uint64_t v40 = 0;
    v36[1] = 0;
    *(void *)(v1 + 64) = MEMORY[0x263F8EE78];
    *(void *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_25BC94DA4())
    {
      sub_25BCA17F0();
      sub_25BCA14A0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC95508()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v38 - v6;
  uint64_t v9 = v0 + 24;
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v10 = *(void *)(v0 + 32);
  char v11 = *(unsigned char *)(v0 + 40);
  char v12 = *(unsigned char *)(v0 + 41);
  uint64_t v13 = (void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v39 = v8;
  uint64_t v40 = v13;
  uint64_t v15 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v41 = *(void *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v42 = v16;
  swift_bridgeObjectRetain();
  uint64_t v43 = v14;
  sub_25BC95EBC(v14);
  char v17 = *(unsigned char *)(v1 + 80);
  uint64_t v18 = v1 + *(void *)(*(void *)v1 + 136);
  if ((v12 & 1) == 0 && v15)
  {
    swift_beginAccess();
    sub_25BC92F8C(v18, (uint64_t)v7);
    uint64_t v19 = sub_25BCA14E0();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19);
    if (result != 1)
    {
      uint64_t v21 = *(void *)(v1 + 88);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_25BCA1820();
      uint64_t v23 = sub_25BC965C0(v17);
      LOBYTE(v37) = v11;
      sub_25BC7E884(v22, v21, (uint64_t)v23, v24, 2, (uint64_t)v7, v39, v10, v37, v15);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v7, v19);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_25BC92F8C(v18, (uint64_t)v5);
  uint64_t v25 = sub_25BCA14E0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v25);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  sub_25BCA1820();
  sub_25BC965C0(v17);
  sub_25BCA14C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v5, v25);
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v27 = Strong;
    uint64_t v44 = v1;
    swift_retain();
    uint64_t v28 = sub_25BCA15F0();
    uint64_t v30 = v29;
    uint64_t v31 = *(os_unfair_lock_s **)(*(void *)(v27 + 32) + 16);
    os_unfair_lock_lock(v31);
    sub_25BC8D080(v27, v28, v30, v1, (uint64_t)&off_270952220);
    os_unfair_lock_unlock(v31);
    swift_bridgeObjectRelease();
    if (MEMORY[0x261174AC0](v27 + 16))
    {
      uint64_t v32 = *(void *)(v27 + 24);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v34 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v32 + 16);
      uint64_t v35 = swift_retain();
      v34(v35, &off_270952220, ObjectType, v32);
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(unsigned char *)(v9 + 16) = 0;
    *(unsigned char *)(v1 + 41) = 1;
    uint64_t v36 = v40;
    *uint64_t v40 = 0;
    v36[1] = 0;
    *(void *)(v1 + 64) = MEMORY[0x263F8EE78];
    *(void *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_25BC94E8C())
    {
      sub_25BCA17F0();
      sub_25BCA14A0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC95970(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = *(os_unfair_lock_s **)(*(void *)(v4 + *(void *)(v9 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v10);
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a2;
  *(unsigned char *)(v4 + 40) = a3;
  *(unsigned char *)(v4 + 41) = 0;
  *(void *)(v4 + 56) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v10);
  return swift_release();
}

uint64_t sub_25BC95A20(uint64_t a1)
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v3 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  *(void *)(v1 + 48) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v4);
  return swift_release();
}

uint64_t sub_25BC95AAC()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 80);
  void v8[3] = &type metadata for ResourceAccessActivity;
  v8[4] = &off_270952298;
  LOBYTE(v8[0]) = v2;
  uint64_t v3 = *(char *)__swift_project_boxed_opaque_existential_1(v8, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_26A5543E8 != -1) {
LABEL_13:
  }
    swift_once();
  uint64_t v4 = *(void *)(qword_26A554F00 + 16);
  if (v4)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v6 = i + 1;
      if (__OFADD__(i, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      if (qword_25BCA3B98[*(char *)(qword_26A554F00 + 32 + i)] == qword_25BCA3B98[v3]) {
        break;
      }
      if (v6 == v4) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      }
    }
    sub_25BCA1640();
    if (qword_26A5543D8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_25BCA1640();
    swift_bridgeObjectRelease();
    sub_25BC965C0(v2);
    sub_25BCA1930();
    sub_25BCA1640();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25BCA1640();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_25BC963C4(0xD000000000000010, 0x800000025BCA4F40, v1);
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

void sub_25BC95CB8(uint64_t a1)
{
  if (sub_25BC960C0(a1))
  {
    sub_25BCA17D0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_25BCA26A0;
    if (qword_26A554378 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_26A554E38;
    uint64_t v3 = unk_26A554E40;
    uint64_t v4 = MEMORY[0x263F8D310];
    *(void *)(v1 + 56) = MEMORY[0x263F8D310];
    unint64_t v5 = sub_25BC8004C();
    *(void *)(v1 + 64) = v5;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v3;
    sub_25BC8B15C(0, (unint64_t *)&qword_26A554C10);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25BCA1550();
    *(void *)(v1 + 96) = v4;
    *(void *)(v1 + 104) = v5;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25BC8D9AC();
    uint64_t v8 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
    id v9 = (id)sub_25BCA1530();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_25BC95EBC(uint64_t a1)
{
  if (sub_25BC96224(a1))
  {
    sub_25BCA17D0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_25BCA26A0;
    if (qword_26A5543D8 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_26A554EE8;
    uint64_t v3 = unk_26A554EF0;
    uint64_t v4 = MEMORY[0x263F8D310];
    *(void *)(v1 + 56) = MEMORY[0x263F8D310];
    unint64_t v5 = sub_25BC8004C();
    *(void *)(v1 + 64) = v5;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v3;
    sub_25BC8B15C(0, (unint64_t *)&qword_26A554C10);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25BCA1550();
    *(void *)(v1 + 96) = v4;
    *(void *)(v1 + 104) = v5;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    sub_25BCA14A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25BC8D9AC();
    uint64_t v8 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
    id v9 = (id)sub_25BCA1530();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BC960C0(uint64_t a1)
{
  uint64_t v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceNetworkActivity);
  if (!a1) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  uint64_t v10 = sub_25BCA1870();
  swift_isUniquelyReferenced_nonNull_native();
  sub_25BC9779C(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v13 = v12;
  sub_25BC94F74();
  uint64_t v14 = sub_25BCA17B0();
  swift_isUniquelyReferenced_nonNull_native();
  sub_25BC9779C(v14, v11, v13);
  uint64_t v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_25BC96224(uint64_t a1)
{
  uint64_t v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceAccessActivity);
  if (!a1) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  uint64_t v10 = sub_25BCA1870();
  swift_isUniquelyReferenced_nonNull_native();
  sub_25BC9779C(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v13 = v12;
  sub_25BC94F74();
  uint64_t v14 = sub_25BCA17B0();
  swift_isUniquelyReferenced_nonNull_native();
  sub_25BC9779C(v14, v11, v13);
  uint64_t v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_25BC96388(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 72) = os_transaction_create();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC963C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_25BCA1900();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = sub_25BCA1940();
    }
    sub_25BC97B44(v5, v6, (uint64_t (*)(void))sub_25BC97780);
    return swift_release();
  }
  *(void *)(a3 + 72) = os_transaction_create();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC964E0()
{
  if (qword_26A5543C8 != -1) {
    swift_once();
  }
  qword_26A554EE8 = qword_26A554ED8;
  unk_26A554EF0 = unk_26A554EE0;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_25BC9654C()
{
  if (qword_26A5543D8 != -1) {
    swift_once();
  }
  return &qword_26A554EE8;
}

void sub_25BC96598()
{
  qword_26A554EF8 = (uint64_t)&unk_2709513A0;
}

void sub_25BC965AC()
{
  qword_26A554F00 = (uint64_t)&unk_2709513F0;
}

const char *sub_25BC965C0(char a1)
{
  uint64_t result = "unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = "configuration";
      break;
    case 2:
      uint64_t result = "parsecdSearch";
      break;
    case 3:
      uint64_t result = "parsecdZeroKeyWord";
      break;
    case 4:
      uint64_t result = "parsecdLookup";
      break;
    case 5:
      uint64_t result = "parsecdFlight";
      break;
    case 6:
      uint64_t result = "parsecdMoreResults";
      break;
    case 7:
      uint64_t result = "parsecdCard";
      break;
    case 8:
      uint64_t result = "parsecdWarm";
      break;
    case 9:
      uint64_t result = "bagResourceDownload";
      break;
    case 10:
      uint64_t result = "pegasusKitVisualSearch";
      break;
    case 11:
      uint64_t result = "pegasusKitSiriPersonalization";
      break;
    case 12:
      uint64_t result = "pegasusKitHashtagImages";
      break;
    case 13:
      uint64_t result = "pegasusKitAssistant";
      break;
    case 14:
      uint64_t result = "pegasusKitBagFetchXPC";
      break;
    case 15:
      uint64_t result = "pegasusKitContextFetchXPC";
      break;
    case 16:
      uint64_t result = "pegasusKitLookup";
      break;
    case 17:
      uint64_t result = "pegasusKitSpotlightZKW";
      break;
    case 18:
      uint64_t result = "pegasusKitEngagementSearch";
      break;
    case 19:
      uint64_t result = "engagementCache";
      break;
    case 20:
      uint64_t result = "topicCache";
      break;
    case 21:
      uint64_t result = "pegasusKitIntelligencePlatform";
      break;
    case 22:
      uint64_t result = "pegasusKitIntelligenceFlow";
      break;
    case 23:
      uint64_t result = "pegasusKitSafariAssistantPrefetch";
      break;
    case 24:
      uint64_t result = "pegasusKitSafariAssistantSummarize";
      break;
    case 25:
      uint64_t result = "pegasusKitEncryptedVisualSearch";
      break;
    case 26:
      uint64_t result = "pegasusKitSportsWatchFace";
      break;
    case 27:
      uint64_t result = "pegasusKitLookupSearch";
      break;
    case 28:
      uint64_t result = "pegasusKitEncryptedVisualSearchConfig";
      break;
    case 29:
      uint64_t result = "pegasusKitSafariSearch";
      break;
    case 30:
      uint64_t result = "pegasusKitCameraVisualSearch";
      break;
    case 31:
      uint64_t result = "installedAppWhitelist";
      break;
    case 32:
      uint64_t result = "assetDeliveryPreloadAsset";
      break;
    case 33:
      uint64_t result = "assetDeliveryPrefilterPrefetch";
      break;
    case 34:
      uint64_t result = "assetDeliveryGetPreloadedData";
      break;
    case 35:
      uint64_t result = "assetDeliveryBloomFilter";
      break;
    case 36:
      uint64_t result = "assetDeliveryRetrieveAsset";
      break;
    case 37:
      uint64_t result = "assetDeliveryRedact";
      break;
    case 38:
      uint64_t result = "assetDeliveryFeatureSupported";
      break;
    case 39:
      uint64_t result = "contextFetchAMSTreatments";
      break;
    case 40:
      uint64_t result = "feedbackEnumerator";
      break;
    case 41:
      uint64_t result = "aggregation";
      break;
    case 42:
      uint64_t result = "uploadaggregates";
      break;
    case 43:
      uint64_t result = "clientXPCConnection";
      break;
    case 44:
      uint64_t result = "sbaPlugin";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25BC96910()
{
  sub_25BC9654C();
  uint64_t v0 = qword_26A554EE8;
  swift_bridgeObjectRetain();
  return v0;
}

const char *sub_25BC9694C()
{
  return sub_25BC965C0(*v0);
}

uint64_t sub_25BC9696C(void *a1, int a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  *(unsigned char *)(v6 + qword_26A554C30) = 0;
  char v11 = a5 & 1;
  *(void *)(v6 + qword_26A554F08) = 0;
  uint64_t v12 = v6 + qword_26A554F10;
  *(void *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 8) = 1;
  *(unsigned char *)(v6 + qword_26A554C38) = 0;
  uint64_t v13 = v6 + qword_26A554F18;
  uint64_t v14 = sub_25BCA1480();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  *(void *)uint64_t v12 = a4;
  *(unsigned char *)(v12 + 8) = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  if (a5)
  {
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25BCA2560;
    uint64_t v17 = sub_25BCA1460();
    uint64_t v19 = v18;
    *(void *)(inited + 56) = MEMORY[0x263F8D310];
    *(void *)(inited + 64) = sub_25BC8004C();
    *(void *)(inited + 32) = v17;
    *(void *)(inited + 40) = v19;
    uint64_t v20 = "client=%{signpost.description:attribute,public}s";
    uint64_t v21 = a1;
    int v22 = a2;
    uint64_t v23 = 48;
    uint64_t v24 = inited;
  }
  else
  {
    uint64_t v25 = swift_initStackObject();
    *(_OWORD *)(v25 + 16) = xmmword_25BCA26A0;
    uint64_t v26 = sub_25BCA1460();
    uint64_t v28 = v27;
    *(void *)(v25 + 56) = MEMORY[0x263F8D310];
    unint64_t v29 = sub_25BC8004C();
    *(void *)(v25 + 32) = v26;
    *(void *)(v25 + 40) = v28;
    uint64_t v30 = MEMORY[0x263F8E9C0];
    *(void *)(v25 + 96) = MEMORY[0x263F8E970];
    *(void *)(v25 + 104) = v30;
    *(void *)(v25 + 64) = v29;
    *(void *)(v25 + 72) = a4;
    uint64_t v20 = "client=%{signpost.description:attribute,public}s, identifier=%{signpost.description:attribute,public}llu";
    uint64_t v21 = a1;
    int v22 = a2;
    uint64_t v23 = 104;
    uint64_t v24 = v25;
  }
  uint64_t v31 = sub_25BC9335C(v21, v22, (uint64_t)v20, v23, 2, v24);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v31;
}

uint64_t sub_25BC96B7C()
{
  swift_release();
  uint64_t v1 = v0 + qword_26A554F18;
  sub_25BCA1480();
  OUTLINED_FUNCTION_3_3();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  return v4(v1, v2);
}

uint64_t sub_25BC96BF0()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_25BC96FE8();
  }
  uint64_t v1 = sub_25BC939BC();
  swift_release();
  uint64_t v2 = v1 + qword_26A554F18;
  sub_25BCA1480();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t))(v3 + 8))(v2);
  return v1;
}

uint64_t sub_25BC96C70()
{
  uint64_t v0 = sub_25BC96BF0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ResourceAccessSpan()
{
  uint64_t result = qword_26A554C48;
  if (!qword_26A554C48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BC96D0C()
{
  uint64_t result = sub_25BCA1480();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25BC96DC4()
{
  sub_25BCA17E0();
  sub_25BCA14A0();
  sub_25BC9400C();
  sub_25BCA17E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
  uint64_t v1 = OUTLINED_FUNCTION_1_1();
  *(_OWORD *)(v1 + 16) = xmmword_25BCA2560;
  uint64_t v2 = sub_25BCA15F0();
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  unint64_t v6 = sub_25BC8004C();
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_7_2();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v7 = OUTLINED_FUNCTION_1_1();
  *(_OWORD *)(v7 + 16) = xmmword_25BCA2560;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554CD0);
  uint64_t v8 = sub_25BCA15F0();
  *(void *)(v7 + 56) = v5;
  *(void *)(v7 + 64) = v6;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  OUTLINED_FUNCTION_7_2();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  uint64_t v10 = OUTLINED_FUNCTION_1_1();
  uint64_t v11 = *(void *)(v0 + qword_26A554F08);
  *(_OWORD *)(v10 + 16) = xmmword_25BCA2560;
  *(void *)(v10 + 56) = v5;
  *(void *)(v10 + 64) = v6;
  BOOL v12 = v11 == 0;
  uint64_t v13 = 7562617;
  if (v12) {
    uint64_t v13 = 28526;
  }
  unint64_t v14 = 0xE300000000000000;
  if (v12) {
    unint64_t v14 = 0xE200000000000000;
  }
  *(void *)(v10 + 32) = v13;
  *(void *)(v10 + 40) = v14;
  sub_25BCA14A0();
  swift_bridgeObjectRelease();
  sub_25BCA17E0();
  return sub_25BCA14A0();
}

void sub_25BC96FE8()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0)
  {
    uint64_t v1 = v0;
    if (*(void *)(v0 + qword_26A554F08))
    {
      swift_retain();
      sub_25BC94B10();
      swift_release();
    }
    uint64_t v2 = MEMORY[0x263F8D310];
    if ((*(unsigned char *)(v0 + qword_26A554C38) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A554C90);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25BCA26A0;
      if (qword_26A5543B0 != -1) {
        swift_once();
      }
      uint64_t v4 = unk_26A554EB0;
      *(void *)(inited + 32) = qword_26A554EA8;
      *(void *)(inited + 40) = v4;
      swift_bridgeObjectRetain();
      sub_25BCA1470();
      *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, sub_25BCA1450());
      if (qword_26A5543B8 != -1) {
        swift_once();
      }
      uint64_t v5 = unk_26A554EC0;
      *(void *)(inited + 56) = qword_26A554EB8;
      *(void *)(inited + 64) = v5;
      uint64_t v6 = qword_25BCA3D00[*(char *)(v1 + qword_26A554C30)];
      id v7 = objc_allocWithZone(NSNumber);
      swift_bridgeObjectRetain();
      *(void *)(inited + 72) = objc_msgSend(v7, sel_initWithUnsignedInteger_, v6);
      sub_25BC8B15C(0, (unint64_t *)&unk_26A554C98);
      uint64_t v8 = sub_25BCA1560();
      sub_25BC973D8(v8);
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_25BC95A20(v10);
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554820);
    uint64_t v11 = OUTLINED_FUNCTION_1_1();
    *(_OWORD *)(v11 + 16) = xmmword_25BCA2560;
    uint64_t v12 = sub_25BCA15F0();
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = v2;
    *(void *)(v11 + 64) = sub_25BC8004C();
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    OUTLINED_FUNCTION_6_1((uint64_t)"outcome=%{signpost.description:attribute,public}s", 49);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_0();
    uint64_t v16 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v15 + 152)) + 16);
    swift_retain();
    os_unfair_lock_lock(v16);
    if ((*(unsigned char *)(v1 + 81) & 1) == 0) {
      sub_25BC95508();
    }
    os_unfair_lock_unlock(v16);
    swift_release();
  }
}

unint64_t sub_25BC972A8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25BC972D8();
  unint64_t result = sub_25BC97324();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25BC972D8()
{
  unint64_t result = qword_26A554C60;
  if (!qword_26A554C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554C60);
  }
  return result;
}

unint64_t sub_25BC97324()
{
  unint64_t result = qword_26A554C68;
  if (!qword_26A554C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554C68);
  }
  return result;
}

uint64_t sub_25BC97370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_25BC973D8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A554CB0);
    uint64_t v2 = (void *)sub_25BCA19C0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
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
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v8 = v7 | (v6 << 6);
      }
      else
      {
        int64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_34;
        }
        if (v9 >= v27)
        {
LABEL_31:
          sub_25BC97BB4();
          return;
        }
        unint64_t v10 = *(void *)(v28 + 8 * v9);
        int64_t v11 = v6 + 1;
        if (!v10)
        {
          int64_t v11 = v6 + 2;
          if (v6 + 2 >= v27) {
            goto LABEL_31;
          }
          unint64_t v10 = *(void *)(v28 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v6 + 3;
            if (v6 + 3 >= v27) {
              goto LABEL_31;
            }
            unint64_t v10 = *(void *)(v28 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v6 + 4;
              if (v6 + 4 >= v27) {
                goto LABEL_31;
              }
              unint64_t v10 = *(void *)(v28 + 8 * v11);
              if (!v10)
              {
                int64_t v12 = v6 + 5;
                if (v6 + 5 >= v27) {
                  goto LABEL_31;
                }
                unint64_t v10 = *(void *)(v28 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    int64_t v11 = v12 + 1;
                    if (__OFADD__(v12, 1)) {
                      goto LABEL_35;
                    }
                    if (v11 >= v27) {
                      goto LABEL_31;
                    }
                    unint64_t v10 = *(void *)(v28 + 8 * v11);
                    ++v12;
                    if (v10) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v11 = v6 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v10 - 1) & v10;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        int64_t v6 = v11;
      }
      uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      id v17 = v16;
      unint64_t v18 = sub_25BC9EE78(v15, v14);
      unint64_t v19 = v18;
      if ((v20 & 1) == 0) {
        break;
      }
      uint64_t v21 = (uint64_t *)(v2[6] + 16 * v18);
      swift_bridgeObjectRelease();
      *uint64_t v21 = v15;
      v21[1] = v14;
      uint64_t v22 = v2[7];

      *(void *)(v22 + 8 * v19) = v17;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v18;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v18);
    *uint64_t v23 = v15;
    v23[1] = v14;
    *(void *)(v2[7] + 8 * v18) = v17;
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
}

uint64_t sub_25BC97670(uint64_t a1)
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  sub_25BC978C4(a1, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_26A554CE0);
  *uint64_t v1 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC976F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_25BC97998(a1, a2, a3);
  uint64_t *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC97780(uint64_t a1)
{
  return sub_25BC96388(a1, v1);
}

void sub_25BC9779C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25BC9EE78(a2, a3);
  OUTLINED_FUNCTION_9_2();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554CA8);
  if ((sub_25BCA1950() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_25BC9EE78(a2, a3);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    sub_25BCA1A90();
    __break(1u);
    return;
  }
  unint64_t v10 = v12;
LABEL_5:
  uint64_t v14 = *v3;
  if (v11)
  {
    uint64_t v15 = v14[7];

    *(void *)(v15 + 8 * v10) = a1;
  }
  else
  {
    sub_25BC97AFC(v10, a2, a3, a1, v14);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_25BC978B8(uint64_t a1, uint64_t a2)
{
  return sub_25BC978C4(a1, a2, &qword_26A554CD8);
}

unint64_t sub_25BC978C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_25BC9EEF0();
  OUTLINED_FUNCTION_9_2();
  if (v8)
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v9 = v6;
  char v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if ((sub_25BCA1950() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v11 = sub_25BC9EEF0();
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    unint64_t result = sub_25BCA1A90();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  uint64_t v13 = *v3;
  if ((v10 & 1) == 0) {
    return sub_25BC97AC0(v9, a1, v13);
  }
  uint64_t v14 = *(void *)(v13 + 56);
  unint64_t result = swift_bridgeObjectRelease();
  *(void *)(v14 + 8 * v9) = a1;
  return result;
}

uint64_t sub_25BC97998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_25BC9EE78(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549B0);
  if ((sub_25BCA1950() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25BC9EE78(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_25BCA1A90();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_25BC97AFC(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25BC97AC0(unint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 8 * (result >> 6) + 64) |= 1 << result;
  *(void *)(*(void *)(a3 + 56) + 8 * result) = a2;
  uint64_t v3 = *(void *)(a3 + 16);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4) {
    __break(1u);
  }
  else {
    *(void *)(a3 + 16) = v5;
  }
  return result;
}

unint64_t sub_25BC97AFC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

uint64_t sub_25BC97B44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result = swift_conformsToProtocol2();
  if (result) {
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_25BC97BB4()
{
  return swift_release();
}

uint64_t sub_25BC97BBC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  return sub_25BC986F4((uint64_t)&a16, v21, &a21);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return sub_25BCA14A0();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2)
{
  return sub_25BC95970(a1, a2, 2, v2);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_25BCA14A0();
}

uint64_t sub_25BC97CD0()
{
  uint64_t result = sub_25BCA1590();
  qword_26A554F20 = result;
  return result;
}

uint64_t sub_25BC97D14()
{
  return 0;
}

void type metadata accessor for SafariAssistantAssetSpecifierLocale()
{
}

uint64_t sub_25BC97D28(unsigned int *a1, int a2)
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

unsigned char *sub_25BC97D78(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25BC97E14);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for SafariAssistantAssetSpecifierCountryCode()
{
}

uint64_t sub_25BC97E48(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (qword_26A5543F8 != -1) {
    swift_once();
  }
  if ((sub_25BC98330(a1, a2, (void *)qword_26A554F28) & 1) == 0) {
    goto LABEL_8;
  }
  if (qword_26A554400 != -1) {
    swift_once();
  }
  if (sub_25BC98330(a3, a4, (void *)qword_26A554F30))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
LABEL_8:
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25BCA1510();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B34BF78);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v10 = sub_25BCA14F0();
    os_log_type_t v11 = sub_25BCA17E0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = v13;
      *(_DWORD *)uint64_t v12 = 136643075;
      swift_bridgeObjectRetain();
      sub_25BC9E6B4(a1, a2, &v14);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2085;
      swift_bridgeObjectRetain();
      sub_25BC9E6B4(a3, a4, &v14);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25BC76000, v10, v11, "SafariSummarizationPrefetch - Unsupported countryCode %{sensitive}s or locale %{sensitive}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261174A10](v13, -1, -1);
      MEMORY[0x261174A10](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return 1;
  }
}

BOOL sub_25BC98110@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25BC981A8();
  *a1 = result;
  return result;
}

unint64_t sub_25BC98158()
{
  unint64_t result = qword_26B34BF48;
  if (!qword_26B34BF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34BF48);
  }
  return result;
}

BOOL sub_25BC981A8()
{
  uint64_t v0 = sub_25BCA19E0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_25BC981EC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25BC981A8();
  *a1 = result;
  return result;
}

uint64_t sub_25BC9822C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j__OUTLINED_FUNCTION_0_7();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25BC98258()
{
  unint64_t result = qword_26B34BF38;
  if (!qword_26B34BF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34BF38);
  }
  return result;
}

double sub_25BC982A4(uint64_t a1)
{
  return sub_25BC982D4(a1, 21333, 0xE200000000000000, &qword_26A554F28);
}

double sub_25BC982B8(uint64_t a1)
{
  return sub_25BC982D4(a1, 0x53555F6E65, 0xE500000000000000, &qword_26A554F30);
}

double sub_25BC982D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554CF0);
  uint64_t v7 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v7 + 16) = xmmword_25BCA2560;
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = a3;
  *a4 = v7;
  return result;
}

uint64_t sub_25BC98330(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25BCA1A70();
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
    if (v12 || (sub_25BCA1A70() & 1) != 0) {
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

void type metadata accessor for SASafariAssistantAssetSpecifier()
{
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return 0x6E6F6D6D6F63;
}

uint64_t sub_25BC98424()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_25BC98464()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[5];
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0[2];
  sub_25BC7DC24(v2, v0[3]);
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_25BC984C0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 16);
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_25BC984F8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_unlock(v1);
  return v2;
}

void sub_25BC98538(char a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(unsigned char *)(v1 + 16) = a1;
  os_unfair_lock_unlock(v3);
}

uint64_t sub_25BC98584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (os_unfair_lock_s *)v3[5];
  os_unfair_lock_lock(v7);
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_25BC7DC24(a1, a2);
  sub_25BC7DC68(v8, v9);
  os_unfair_lock_unlock(v7);
  return sub_25BC7DC68(a1, a2);
}

uint64_t sub_25BC98624(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC9868C(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(void *)(v1 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v3);
  return swift_release();
}

double sub_25BC986F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_25BC9EE34(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_25BC9F9EC(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void *sub_25BC9875C(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v2 = sub_25BC9EEF4();
  if ((v3 & 1) == 0) {
    return 0;
  }
  unsigned int v4 = *(void **)(*(void *)(a1 + 56) + 8 * v2);
  id v5 = v4;
  return v4;
}

uint64_t sub_25BC987A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25BC9EE78(a1, a2);
    if (v3) {
      OUTLINED_FUNCTION_56_0();
    }
  }
  return OUTLINED_FUNCTION_13();
}

uint64_t sub_25BC987E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25BC9EE78(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC9882C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_25BC9EF54(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC98870(uint64_t a1)
{
  if (*(void *)(a1 + 16) && (sub_25BC9EEF4(), (v1 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25BC988B4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_25BC9EEF4();
    if (v1) {
      OUTLINED_FUNCTION_56_0();
    }
  }
  return OUTLINED_FUNCTION_13();
}

uint64_t sub_25BC988F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25BC9EE78(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

void sub_25BC9893C(char a1)
{
  Lock.lock()();
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1;
  Lock.unlock()();
}

uint64_t sub_25BC98994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BCA1780();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25BC9FB8C(a1, &qword_26A554678);
  }
  else
  {
    sub_25BCA1770();
    OUTLINED_FUNCTION_9_0();
    v7();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_51_0();
    sub_25BCA1730();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25BC98AFC()
{
  swift_retain();
  char v0 = sub_25BC984C0();
  swift_release();
  return v0 & 1;
}

uint64_t sub_25BC98B38(char a1)
{
  swift_retain();
  sub_25BC98538(a1);
  return swift_release();
}

uint64_t sub_25BC98B80()
{
  swift_retain();
  uint64_t v0 = sub_25BC98464();
  swift_release();
  return v0;
}

uint64_t sub_25BC98BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_25BC98584(a1, a2, a3);
  return swift_release();
}

uint64_t sub_25BC98C34()
{
  swift_retain();
  uint64_t v0 = sub_25BC984F8();
  swift_release();
  return v0;
}

uint64_t sub_25BC98C70(uint64_t a1)
{
  swift_retain();
  swift_retain();
  sub_25BC9868C(a1);
  swift_release();
  return swift_release();
}

void sub_25BC98CC4()
{
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25BCA1510();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B34BF78);
  uint64_t v1 = sub_25BCA14F0();
  os_log_type_t v2 = sub_25BCA1800();
  if (os_log_type_enabled(v1, v2))
  {
    char v3 = (uint8_t *)OUTLINED_FUNCTION_26();
    *(_WORD *)char v3 = 0;
    _os_log_impl(&dword_25BC76000, v1, v2, "SafariSummarizationPrefetch - Canceling task if needed", v3, 2u);
    OUTLINED_FUNCTION_7();
  }

  if (sub_25BC98C34())
  {
    sub_25BCA1790();
    swift_release();
  }
  sub_25BC98C70(0);
  OUTLINED_FUNCTION_18();
  sub_25BC98BD4(v4, v5, v6);
  oslog = sub_25BCA14F0();
  os_log_type_t v7 = sub_25BCA1800();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_26();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25BC76000, oslog, v7, "SafariSummarizationPrefetch - Successfully reset filter", v8, 2u);
    OUTLINED_FUNCTION_7();
  }
}

uint64_t sub_25BC98E64()
{
  *(void *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC98E7C);
}

uint64_t sub_25BC98E7C()
{
  uint64_t v1 = *(void *)(v0[5] + 160);
  swift_retain();
  Lock.lock()();
  swift_beginAccess();
  if (*(unsigned char *)(v1 + 24))
  {
    Lock.unlock()();
    swift_release();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25BCA1510();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B34BF78);
    char v3 = (void *)sub_25BCA14F0();
    os_log_type_t v4 = sub_25BCA1800();
    if (OUTLINED_FUNCTION_20(v4))
    {
      uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v5);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v6, v7, "SafariSummarizationPrefetch - Throttling new submission. Loading the url path filter data is already in progress");
      OUTLINED_FUNCTION_7();
    }

    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8(0);
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    Lock.unlock()();
    swift_release();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25BCA1510();
    v0[6] = __swift_project_value_buffer(v10, (uint64_t)qword_26B34BF78);
    uint64_t v11 = (void *)sub_25BCA14F0();
    os_log_type_t v12 = sub_25BCA1800();
    if (OUTLINED_FUNCTION_20(v12))
    {
      uint64_t v13 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v13);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v14, v15, "SafariSummarizationPrefetch - Start loading the url path filter data");
      OUTLINED_FUNCTION_7();
    }

    uint64_t v16 = (void *)swift_task_alloc();
    v0[7] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_25BC990B0;
    return sub_25BC994A4();
  }
}

uint64_t sub_25BC990B0()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  v3[8] = v1;
  v3[9] = v2;
  v3[10] = v4;
  v3[11] = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25BC9919C()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_25BC98B80();
  uint64_t v3 = v0[9];
  if (v2)
  {
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    uint64_t v6 = v0[8];
    swift_bridgeObjectRetain();
    sub_25BC7DC68(v4, v5);
    if (v6 == v4 && v5 == v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_15:
      uint64_t v14 = (void *)sub_25BCA14F0();
      os_log_type_t v15 = sub_25BCA1800();
      if (!OUTLINED_FUNCTION_20(v15))
      {
        uint64_t v19 = 0;
        goto LABEL_22;
      }
      uint64_t v16 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v16);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v17, v18, "SafariSummarizationPrefetch - Finish loading the url path filter data");
      uint64_t v19 = 0;
      goto LABEL_20;
    }
    char v8 = sub_25BCA1A70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_14;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (sub_25BCA17A0())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_25BCA14F0();
    os_log_type_t v10 = sub_25BCA1800();
    if (OUTLINED_FUNCTION_20(v10))
    {
      uint64_t v11 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v11);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v12, v13, "SafariSummarizationPrefetch - Task cancelled, skip updating urlRedactPatterns");
      OUTLINED_FUNCTION_7();
    }

    goto LABEL_15;
  }
  sub_25BC98BD4(v0[8], v0[9], v0[10]);
  uint64_t v14 = (void *)sub_25BCA14F0();
  os_log_type_t v20 = sub_25BCA1800();
  if (OUTLINED_FUNCTION_20(v20))
  {
    uint64_t v21 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v21);
    OUTLINED_FUNCTION_14(&dword_25BC76000, v22, v23, "SafariSummarizationPrefetch - Finish loading the url path filter data");
    uint64_t v19 = 1;
LABEL_20:
    OUTLINED_FUNCTION_7();
    goto LABEL_22;
  }
  uint64_t v19 = 1;
LABEL_22:

  swift_retain();
  sub_25BC9893C(0);
  swift_release();
  uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
  return v24(v19);
}

uint64_t sub_25BC993D8()
{
  uint64_t v1 = (void *)sub_25BCA14F0();
  os_log_type_t v2 = sub_25BCA1800();
  if (OUTLINED_FUNCTION_20(v2))
  {
    uint64_t v3 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v3);
    OUTLINED_FUNCTION_14(&dword_25BC76000, v4, v5, "SafariSummarizationPrefetch - Finish loading the url path filter data");
    OUTLINED_FUNCTION_7();
  }

  swift_retain();
  sub_25BC9893C(0);
  swift_release();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6(0);
}

uint64_t sub_25BC994A4()
{
  OUTLINED_FUNCTION_4();
  v1[30] = v0;
  uint64_t v2 = sub_25BCA1100();
  v1[31] = v2;
  OUTLINED_FUNCTION_4_1(v2);
  v1[32] = v3;
  v1[33] = OUTLINED_FUNCTION_81();
  uint64_t v4 = sub_25BCA15E0();
  v1[34] = v4;
  OUTLINED_FUNCTION_4_1(v4);
  v1[35] = v5;
  v1[36] = OUTLINED_FUNCTION_81();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D50);
  v1[37] = v6;
  OUTLINED_FUNCTION_4_1(v6);
  v1[38] = v7;
  v1[39] = OUTLINED_FUNCTION_81();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D58);
  v1[40] = v8;
  OUTLINED_FUNCTION_4_1(v8);
  v1[41] = v9;
  v1[42] = OUTLINED_FUNCTION_81();
  uint64_t v10 = sub_25BCA1300();
  v1[43] = v10;
  OUTLINED_FUNCTION_4_1(v10);
  v1[44] = v11;
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  uint64_t v12 = sub_25BCA1420();
  v1[49] = v12;
  OUTLINED_FUNCTION_4_1(v12);
  v1[50] = v13;
  v1[51] = OUTLINED_FUNCTION_81();
  uint64_t v14 = sub_25BCA1480();
  OUTLINED_FUNCTION_47(v14);
  v1[52] = OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v15, v16, v17);
}

uint64_t sub_25BC99678()
{
  uint64_t v63 = v0;
  uint64_t v2 = v0 + 240;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 416);
  uint64_t v4 = *(void **)(v1 + 104);
  (*(void (**)(void, void, void))(*(void *)(v0 + 400) + 104))(*(void *)(v0 + 408), *MEMORY[0x263F5D0A0], *(void *)(v0 + 392));
  swift_retain();
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  OUTLINED_FUNCTION_53();
  uint64_t v5 = OUTLINED_FUNCTION_46_0(v4, 32, v3);
  uint64_t v6 = v5;
  *(void *)(v0 + 424) = v5;
  if ((*(unsigned char *)(v1 + 128) & 1) == 0) {
    *(unsigned char *)(v5 + qword_26A554C38) = 1;
  }
  uint64_t v7 = *(void **)v2;
  uint64_t v8 = *(void *)(*(void *)v2 + 40);
  if (!v8)
  {
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25BCA1510();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B34BF78);
    uint64_t v19 = sub_25BCA14F0();
    os_log_type_t v20 = sub_25BCA1800();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_26();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_25BC76000, v19, v20, "SafariSummarizationPrefetch - AssetProvider or CountryCode are nil, return empty UrlRedactMap", v21, 2u);
      OUTLINED_FUNCTION_7();
    }

    uint64_t v22 = qword_26A554C30;
    char v23 = 79;
    goto LABEL_12;
  }
  uint64_t v9 = v7[4];
  uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7[14];
  uint64_t v11 = v7[6];
  uint64_t v12 = v7[7];
  swift_retain();
  v10(v9, v8, v11, v12);
  swift_release();
  if (!*(void *)(v0 + 80))
  {
    sub_25BC9FB8C(v0 + 56, &qword_26A554630);
    uint64_t v22 = qword_26A554C30;
    char v23 = 94;
LABEL_12:
    *((unsigned char *)&v6->isa + v22) = v23;
    sub_25BC96FE8();
    sub_25BC9FCD0();
    OUTLINED_FUNCTION_20_0();
    *uint64_t v24 = 0;
    swift_willThrow();
    swift_release();
    goto LABEL_34;
  }
  uint64_t v13 = *(void *)(v0 + 240);
  sub_25BC7DABC((long long *)(v0 + 56), v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v13 + 64), *(void *)(v13 + 88));
  uint64_t v14 = OUTLINED_FUNCTION_51_0();
  uint64_t v16 = sub_25BC88594(v14, v15, v6);
  *(void *)(v0 + 432) = v16;
  *(void *)(v0 + 440) = v17;
  uint64_t v25 = (uint64_t)v16;
  unint64_t v26 = v17;
  uint64_t v61 = (void *)v0;
  (*(void (**)(void, void, void))(*(void *)(v0 + 352) + 32))(*(void *)(v0 + 384), *(void *)(v0 + 376), *(void *)(v0 + 344));
  uint64_t v27 = sub_25BC98B80();
  if (!v28) {
    goto LABEL_19;
  }
  uint64_t v29 = v27;
  uint64_t v30 = v28;
  swift_bridgeObjectRetain();
  sub_25BC7DC68(v29, v30);
  if (v25 == v29 && v30 == v26)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v32 = sub_25BCA1A70();
    swift_bridgeObjectRelease();
    if ((v32 & 1) == 0)
    {
LABEL_19:
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      uint64_t v33 = (void *)v0;
      uint64_t v34 = *(void *)(v0 + 352);
      uint64_t v35 = sub_25BCA1510();
      v61[56] = __swift_project_value_buffer(v35, (uint64_t)qword_26B34BF78);
      v61[57] = *(void *)(v34 + 16);
      v61[58] = (v34 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v36 = OUTLINED_FUNCTION_13();
      v37(v36);
      uint64_t v38 = sub_25BCA14F0();
      os_log_type_t v39 = sub_25BCA1800();
      BOOL v40 = os_log_type_enabled(v38, v39);
      uint64_t v41 = v61[44];
      if (v40)
      {
        uint64_t v42 = (uint64_t *)(v2 - 16);
        uint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_14_0();
        v62[0] = OUTLINED_FUNCTION_34();
        *(_DWORD *)uint64_t v43 = 136642819;
        uint64_t v44 = sub_25BCA12C0();
        uint64_t *v42 = sub_25BC9E6B4(v44, v45, v62);
        uint64_t v33 = v61;
        sub_25BCA1880();
        swift_bridgeObjectRelease();
        uint64_t v46 = *(void (**)(void))(v41 + 8);
        OUTLINED_FUNCTION_15_0();
        v46();
        _os_log_impl(&dword_25BC76000, v38, v39, "SafariSummarizationPrefetch - Scanning url path filter jsonl file at path: %{sensitive}s", v43, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();
      }
      else
      {
        uint64_t v46 = *(void (**)(void))(v41 + 8);
        ((void (*)(void, void))v46)(v61[46], v61[43]);
      }

      v33[59] = v46;
      v33[60] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D68);
      v33[23] = sub_25BCA1560();
      sub_25BCA12D0();
      sub_25BCA1230();
      OUTLINED_FUNCTION_15_0();
      v52();
      *((_DWORD *)v33 + 130) = *MEMORY[0x263F060B8];
      *((unsigned char *)v33 + 524) = 0;
      unint64_t v53 = sub_25BC9FD1C();
      uint64_t v54 = (void *)swift_task_alloc();
      v33[61] = v54;
      void *v54 = v33;
      v54[1] = sub_25BC99FF8;
      uint64_t v55 = v33[40];
      return MEMORY[0x270FA1E80](v33 + 18, v55, v53);
    }
  }
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  uint64_t v47 = sub_25BCA1510();
  __swift_project_value_buffer(v47, (uint64_t)qword_26B34BF78);
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_25BCA14F0();
  os_log_type_t v49 = sub_25BCA1800();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (_DWORD *)OUTLINED_FUNCTION_14_0();
    uint64_t v51 = OUTLINED_FUNCTION_34();
    *uint64_t v50 = 136315138;
    v62[0] = v51;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 232) = sub_25BC9E6B4(v25, v26, v62);
    sub_25BCA1880();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_59_0(&dword_25BC76000, v48, v49, "SafariSummarizationPrefetch - Skip processing for Url Path Filter, already loaded hash %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
  }

  *((unsigned char *)&v6->isa + qword_26A554C30) = 93;
  sub_25BC96FE8();
  sub_25BC9FCD0();
  OUTLINED_FUNCTION_20_0();
  *uint64_t v56 = 2;
  swift_willThrow();
  swift_release();
  uint64_t v57 = OUTLINED_FUNCTION_16_1();
  v58(v57);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
LABEL_34:
  OUTLINED_FUNCTION_38_0();
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
  OUTLINED_FUNCTION_5();
  return v59();
}

uint64_t sub_25BC99FF8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_1();
  void *v3 = v2;
  *(void *)(v4 + 496) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25BC9A0D8()
{
  *(_OWORD *)(v0 + 504) = *(_OWORD *)(v0 + 144);
  return OUTLINED_FUNCTION_3((uint64_t)sub_25BC9A0F8);
}

uint64_t sub_25BC9A0F8()
{
  uint64_t v115 = v0;
  uint64_t v1 = (void *)(v0 + 184);
  uint64_t v2 = *(uint8_t **)(v0 + 512);
  if (!v2)
  {
    OUTLINED_FUNCTION_25_0();
    v24();
    uint64_t v25 = *(void *)(v0 + 184);
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_25BCA14F0();
    uint64_t v27 = sub_25BCA1800();
    if (os_log_type_enabled(v26, (os_log_type_t)v27))
    {
      uint64_t v28 = (uint8_t *)OUTLINED_FUNCTION_14_0();
      *(_DWORD *)uint64_t v28 = 134217984;
      *(void *)(v0 + 192) = *(void *)(v25 + 16);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC76000, v26, (os_log_type_t)v27, "SafariSummarizationPrefetch - Made UrlRedactMap with %ld entries", v28, 0xCu);
      OUTLINED_FUNCTION_7();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    if (!(!v42 & v41))
    {
      char v43 = 78;
      switch(*(unsigned char *)(v0 + 524))
      {
        case 0:
          goto LABEL_19;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 0x10:
        case 0x11:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
          goto LABEL_18;
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
        case 0xE:
        case 0xF:
          goto LABEL_66;
        default:
          JUMPOUT(0);
      }
    }
    switch(*(unsigned char *)(v0 + 524))
    {
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
        goto LABEL_66;
      default:
LABEL_18:
        char v43 = *(unsigned char *)(v0 + 524);
LABEL_19:
        uint64_t v44 = *(void (**)(void))(v0 + 472);
        *(unsigned char *)(*(void *)(v0 + 424) + qword_26A554C30) = v43;
        sub_25BC96FE8();
        swift_release();
        OUTLINED_FUNCTION_25_0();
        v44();
        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        swift_beginAccess();
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
        OUTLINED_FUNCTION_21_1();
        __asm { BRAA            X4, X16 }
        return result;
    }
    goto LABEL_66;
  }
  if (sub_25BCA17A0())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 184) = sub_25BCA1560();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_25BCA14F0();
    os_log_type_t v4 = sub_25BCA17E0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v5);
      _os_log_impl(&dword_25BC76000, v3, v4, "SafariSummarizationPrefetch - Task cancelled, exit scanning path filter json file", v2, 2u);
      OUTLINED_FUNCTION_7();
    }
    uint64_t v6 = *(void *)(v0 + 424);

    *(unsigned char *)(v6 + qword_26A554C30) = 91;
    sub_25BC96FE8();
    sub_25BC9FCD0();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_20_0();
    *uint64_t v8 = 3;
    swift_willThrow();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
    uint64_t v10 = *(void *)(v0 + 384);
    uint64_t v11 = *(void *)(v0 + 360);
    uint64_t v12 = *(void *)(v0 + 344);
    OUTLINED_FUNCTION_25_0();
    v13();
    *(void *)(v0 + 184) = sub_25BCA1560();
    swift_bridgeObjectRelease();
    v9(v11, v10, v12);
    id v14 = v7;
    id v15 = v7;
    uint64_t v16 = sub_25BCA14F0();
    os_log_type_t v17 = sub_25BCA17E0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v109 = (void *)OUTLINED_FUNCTION_33();
      v114[0] = OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v18 = 136643075;
      uint64_t v19 = sub_25BCA12C0();
      os_log_type_t typea = v17;
      *(void *)(v0 + 168) = sub_25BC9E6B4(v19, v20, v114);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_25_0();
      v21();
      *(_WORD *)(v18 + 12) = 2112;
      id v22 = v7;
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 176) = v23;
      sub_25BCA1880();
      *uint64_t v109 = v23;

      _os_log_impl(&dword_25BC76000, v16, typea, "SafariSummarizationPrefetch - Failed while scanning url path filter jsonl file at path: %{sensitive}s, with error: %@", (uint8_t *)v18, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_25_0();
      v47();
    }
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
    uint64_t v49 = *(void *)(v0 + 384);
    uint64_t v50 = *(void *)(v0 + 344);
    *(unsigned char *)(*(void *)(v0 + 424) + qword_26A554C30) = 88;
    sub_25BC96FE8();
    swift_willThrow();
    swift_release();
    v48(v49, v50);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    OUTLINED_FUNCTION_38_0();
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
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_21_1();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v30 = *(void *)(v0 + 280);
  uint64_t v29 = *(void *)(v0 + 288);
  uint64_t v31 = *(void *)(v0 + 272);
  sub_25BCA15D0();
  uint64_t v32 = sub_25BCA15B0();
  unint64_t v34 = v33;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
  if (v34 >> 60 == 15)
  {
    uint64_t v35 = (void *)sub_25BCA14F0();
    os_log_type_t v36 = sub_25BCA17E0();
    if (OUTLINED_FUNCTION_20(v36))
    {
      uint64_t v37 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v37);
      OUTLINED_FUNCTION_14(&dword_25BC76000, v38, v39, "SafariSummarizationPrefetch - Failed to scan line in path filter jsonl file");
      OUTLINED_FUNCTION_7();
    }

    char v40 = 86;
    goto LABEL_50;
  }
  unint64_t v53 = *(void **)(v0 + 496);
  uint64_t v54 = *(unsigned int *)(v0 + 520);
  uint64_t v56 = *(void *)(v0 + 256);
  uint64_t v55 = *(void *)(v0 + 264);
  id v112 = (id)v32;
  uint64_t v57 = *(void *)(v0 + 248);
  sub_25BCA1140();
  OUTLINED_FUNCTION_53();
  sub_25BCA1130();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104))(v55, v54, v57);
  sub_25BCA1110();
  sub_25BC9FD70();
  sub_25BCA1120();
  if (v53)
  {
    swift_release();
    sub_25BC814FC(v32, v34);
    id v58 = v53;
    sub_25BC814FC(v32, v34);
    id v59 = v53;
    uint64_t v60 = sub_25BCA14F0();
    os_log_type_t v61 = sub_25BCA17E0();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = OUTLINED_FUNCTION_58();
      uint64_t v63 = (void *)OUTLINED_FUNCTION_33();
      v114[0] = OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v62 = 136643075;
      sub_25BCA15D0();
      uint64_t v64 = sub_25BCA15C0();
      if (v65)
      {
        unint64_t v66 = v65;
      }
      else
      {
        uint64_t v64 = 0;
        unint64_t v66 = 0xE000000000000000;
      }
      *(void *)(v62 + 4) = sub_25BC9E6B4(v64, v66, v114);
      swift_bridgeObjectRelease();
      sub_25BC810EC((uint64_t)v112, v34);
      sub_25BC810EC((uint64_t)v112, v34);
      *(_WORD *)(v62 + 12) = 2112;
      id v67 = v53;
      uint64_t v68 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v62 + 14) = v68;
      *uint64_t v63 = v68;

      _os_log_impl(&dword_25BC76000, v60, v61, "SafariSummarizationPrefetch - Failed to deserialize scanned json line %{sensitive}s, with error: %@. Skipping this line", (uint8_t *)v62, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      sub_25BC810EC((uint64_t)v112, v34);
    }
    else
    {
      sub_25BC810EC((uint64_t)v112, v34);

      sub_25BC810EC((uint64_t)v112, v34);
      sub_25BC810EC((uint64_t)v112, v34);
    }
    char v40 = 87;
LABEL_50:
    *(unsigned char *)(v0 + 524) = v40;
LABEL_51:
    sub_25BC9FD1C();
    uint64_t v97 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v97;
    *uint64_t v97 = v0;
    v97[1] = sub_25BC99FF8;
    OUTLINED_FUNCTION_21_1();
    return MEMORY[0x270FA1E80]();
  }
  os_log_t log = (os_log_t)v34;
  uint64_t v69 = *(void *)(v0 + 104);
  uint64_t v111 = *(void *)(v0 + 96);
  uint64_t v70 = *(void *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554A58);
  uint64_t v71 = sub_25BCA1560();
  uint64_t v72 = v0;
  uint64_t v73 = (void *)v71;
  uint64_t v74 = *(void *)(v70 + 16);
  uint64_t v106 = v72;
  if (!v74) {
    goto LABEL_44;
  }
  *(void *)type = v69;
  uint64_t v113 = v1;
  uint64_t v75 = (void *)(v72 + 208);
  swift_bridgeObjectRetain();
  uint64_t v76 = (uint64_t *)(v70 + 40);
  do
  {
    uint64_t v77 = *(v76 - 1);
    uint64_t v78 = *v76;
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    void *v75 = v73;
    unint64_t v79 = sub_25BC9EF54(v77);
    if (__OFADD__(v73[2], (v80 & 1) == 0))
    {
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
    unint64_t v81 = v79;
    char v82 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D80);
    if (sub_25BCA1950())
    {
      unint64_t v83 = sub_25BC9EF54(v77);
      if ((v82 & 1) != (v84 & 1)) {
        goto LABEL_54;
      }
      unint64_t v81 = v83;
    }
    uint64_t v73 = (void *)*v75;
    if (v82)
    {
      uint64_t v85 = v73[7];
      swift_bridgeObjectRelease();
      *(void *)(v85 + 8 * v81) = v78;
    }
    else
    {
      v73[(v81 >> 6) + 8] |= 1 << v81;
      *(void *)(v73[6] + 8 * v81) = v77;
      *(void *)(v73[7] + 8 * v81) = v78;
      uint64_t v86 = v73[2];
      BOOL v87 = __OFADD__(v86, 1);
      uint64_t v88 = v86 + 1;
      if (v87) {
        goto LABEL_64;
      }
      v73[2] = v88;
    }
    swift_bridgeObjectRelease();
    v76 += 2;
    --v74;
  }
  while (v74);
  swift_bridgeObjectRelease();
  uint64_t v1 = v113;
  uint64_t v69 = *(void *)type;
LABEL_44:
  swift_bridgeObjectRetain();
  uint64_t v89 = *v1;
  swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v106 + 216) = v89;
  uint64_t v90 = v69;
  unint64_t v91 = sub_25BC9EE78(v111, v69);
  if (__OFADD__(*(void *)(v89 + 16), (v92 & 1) == 0)) {
    goto LABEL_65;
  }
  unint64_t v93 = v91;
  char v94 = v92;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D88);
  if ((sub_25BCA1950() & 1) == 0)
  {
LABEL_58:
    uint64_t v100 = *(void **)(v106 + 216);
    if (v94)
    {
      uint64_t v101 = v100[7];
      swift_bridgeObjectRelease();
      *(void *)(v101 + 8 * v93) = v73;
LABEL_62:
      uint64_t v0 = v106;
      *uint64_t v1 = v100;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      sub_25BC810EC((uint64_t)v112, (unint64_t)log);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    v100[(v93 >> 6) + 8] |= 1 << v93;
    unint64_t v102 = (uint64_t *)(v100[6] + 16 * v93);
    *unint64_t v102 = v111;
    v102[1] = v90;
    *(void *)(v100[7] + 8 * v93) = v73;
    uint64_t v103 = v100[2];
    BOOL v87 = __OFADD__(v103, 1);
    uint64_t v104 = v103 + 1;
    if (!v87)
    {
      v100[2] = v104;
      swift_bridgeObjectRetain();
      goto LABEL_62;
    }
LABEL_66:
    __break(1u);
    JUMPOUT(0x25BC9AE04);
  }
  unint64_t v95 = sub_25BC9EE78(v111, v90);
  if ((v94 & 1) == (v96 & 1))
  {
    unint64_t v93 = v95;
    goto LABEL_58;
  }
LABEL_54:
  OUTLINED_FUNCTION_21_1();
  return sub_25BCA1A90();
}

uint64_t sub_25BC9AEC4()
{
  OUTLINED_FUNCTION_4();
  *(void *)(v0 + 160) = *(void *)(v0 + 496);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554968);
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25BC9AF5C()
{
  uint64_t v24 = v0;
  uint64_t v1 = (void *)v0[62];
  uint64_t v2 = (void (*)(uint64_t))v0[57];
  OUTLINED_FUNCTION_25_0();
  v3();
  v0[23] = sub_25BCA1560();
  swift_bridgeObjectRelease();
  uint64_t v4 = OUTLINED_FUNCTION_51_0();
  v2(v4);
  id v5 = v1;
  id v6 = v1;
  uint64_t v7 = sub_25BCA14F0();
  os_log_type_t v8 = sub_25BCA17E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = OUTLINED_FUNCTION_58();
    id v22 = (void *)OUTLINED_FUNCTION_33();
    uint64_t v23 = OUTLINED_FUNCTION_34();
    *(_DWORD *)uint64_t v9 = 136643075;
    uint64_t v10 = sub_25BCA12C0();
    uint64_t v11 = v1;
    v0[21] = sub_25BC9E6B4(v10, v12, &v23);
    sub_25BCA1880();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_0();
    v13();
    *(_WORD *)(v9 + 12) = 2112;
    id v14 = v1;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v15;
    sub_25BCA1880();
    *id v22 = v15;

    _os_log_impl(&dword_25BC76000, v7, v8, "SafariSummarizationPrefetch - Failed while scanning url path filter jsonl file at path: %{sensitive}s, with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_9_0();
    v16();
  }
  os_log_type_t v17 = (void (*)(uint64_t, uint64_t))v0[59];
  uint64_t v18 = v0[48];
  uint64_t v19 = v0[43];
  *(unsigned char *)(v0[53] + qword_26A554C30) = 88;
  sub_25BC96FE8();
  swift_willThrow();
  swift_release();
  v17(v18, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  OUTLINED_FUNCTION_38_0();
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
  OUTLINED_FUNCTION_5();
  return v20();
}

uint64_t sub_25BC9B2B4(uint64_t a1, unint64_t a2)
{
  void (*v91)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(void);
  void (*v109)(void);
  void (*v110)(void);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(void);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(uint64_t);
  uint64_t v119;
  unint64_t v120;
  void *v121;
  os_log_type_t v122;
  _DWORD *v123;
  uint64_t v124;
  uint64_t v125;
  void (*v126)(void);
  uint64_t v127;
  void (*v128)(uint64_t);
  uint64_t v129;
  void (*v130)(void);
  uint8_t *v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  uint64_t v138;
  void (*v139)(void);
  void (*v140)(void);
  uint64_t v141;
  os_log_type_t v142;
  NSObject *v143;
  os_log_type_t v144;
  _WORD *v145;
  void (*v146)(void);
  void (*v147)(void);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  long long v165[2];
  long long v166;
  uint8_t *v167;
  uint64_t v168;
  uint64_t v169[5];

  uint64_t v164 = sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v159 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_33_0(v7);
  uint64_t v154 = sub_25BCA1420();
  OUTLINED_FUNCTION_0_3();
  uint64_t v153 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_33_0(v10);
  uint64_t v11 = sub_25BCA1480();
  uint64_t v12 = OUTLINED_FUNCTION_47(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_29();
  v155 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554678);
  uint64_t v15 = OUTLINED_FUNCTION_47(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_33_0(v16);
  sub_25BCA13E0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v151 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_10();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554648);
  uint64_t v20 = OUTLINED_FUNCTION_47(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_31();
  v160 = v21;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v148 - v23;
  uint64_t v25 = sub_25BCA11F0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v162 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_29();
  v161 = v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D0);
  uint64_t v30 = OUTLINED_FUNCTION_47(v29);
  MEMORY[0x270FA5388](v30);
  uint64_t v31 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_3();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_10();
  uint64_t v37 = v36 - v35;
  v157 = a1;
  uint64_t v163 = a2;
  sub_25BCA12E0();
  if (__swift_getEnumTagSinglePayload(v2, 1, v31) == 1)
  {
    sub_25BC9FB8C(v2, &qword_26A5548D0);
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v164, (uint64_t)qword_26B34BF78);
    unint64_t v38 = v163;
    OUTLINED_FUNCTION_32_0();
    uint64_t v39 = (void *)sub_25BCA14F0();
    os_log_type_t v40 = sub_25BCA17E0();
    if (OUTLINED_FUNCTION_22_1(v40))
    {
      char v41 = (_DWORD *)OUTLINED_FUNCTION_14_0();
      v169[0] = OUTLINED_FUNCTION_34();
      _DWORD *v41 = 136642819;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25BC9E6B4(v157, v38, v169);
      OUTLINED_FUNCTION_64_0(v42);
      sub_25BCA1880();
      OUTLINED_FUNCTION_47_0();
      OUTLINED_FUNCTION_61_0(&dword_25BC76000, v43, v44, "SafariSummarizationPrefetch - Invalid URL (%{sensitive}s) found");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      OUTLINED_FUNCTION_18_0();
    }
    return 0;
  }
  os_log_t v149 = v33;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v37, v2, v31);
  sub_25BCA11C0();
  uint64_t v45 = v31;
  uint64_t v46 = v25;
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25) == 1)
  {
    sub_25BC9FB8C((uint64_t)v24, &qword_26A554648);
    uint64_t v47 = v160;
    OUTLINED_FUNCTION_52_0();
    __swift_storeEnumTagSinglePayload(v48, v49, v50, v25);
    uint64_t v51 = sub_25BC9DC5C(v37, v47, 0);
    unint64_t v53 = v52;
    sub_25BC9FB8C(v47, &qword_26A554648);
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v54 = v164;
    __swift_project_value_buffer(v164, (uint64_t)qword_26B34BF78);
    uint64_t v55 = v159;
    uint64_t v56 = v158;
    OUTLINED_FUNCTION_7_1();
    v57();
    OUTLINED_FUNCTION_32_0();
    id v58 = sub_25BCA14F0();
    os_log_type_t v59 = sub_25BCA17D0();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (_DWORD *)OUTLINED_FUNCTION_14_0();
      v169[0] = OUTLINED_FUNCTION_34();
      *uint64_t v60 = 136642819;
      uint64_t v162 = v37;
      uint64_t v163 = v45;
      if (v53) {
        uint64_t v61 = v51;
      }
      else {
        uint64_t v61 = 6369134;
      }
      if (v53) {
        unint64_t v62 = v53;
      }
      else {
        unint64_t v62 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_25BC9E6B4(v61, v62, v169);
      OUTLINED_FUNCTION_64_0(v63);
      sub_25BCA1880();
      OUTLINED_FUNCTION_18_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_59_0(&dword_25BC76000, v58, v59, "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with query items, return original url: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

      OUTLINED_FUNCTION_9_0();
      v64();
      (*(void (**)(uint64_t, unint64_t))(v149 + 8))(v162, v163);
      return v51;
    }
    OUTLINED_FUNCTION_18_0();

    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v54);
LABEL_37:
    (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v37, v45);
    return v51;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v162 + 32))(v161, v24, v25);
  uint64_t v65 = v156;
  if ((sub_25BC98AFC() & 1) == 0)
  {
    sub_25BCA13D0();
    sub_25BCA13B0();
    double v67 = v66;
    OUTLINED_FUNCTION_9_0();
    v68();
    if (v67 < *(double *)(v65 + 144))
    {
      uint64_t v69 = v25;
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      os_log_type_t v70 = __swift_project_value_buffer(v164, (uint64_t)qword_26B34BF78);
      swift_retain();
      uint64_t v71 = sub_25BCA14F0();
      os_log_type_t v72 = sub_25BCA1800();
      if (OUTLINED_FUNCTION_40(v72))
      {
        *(_DWORD *)OUTLINED_FUNCTION_14_0() = 134217984;
        v169[0] = *(void *)(v65 + 144);
        sub_25BCA1880();
        swift_release();
        OUTLINED_FUNCTION_59_0(&dword_25BC76000, v71, v70, "SafariSummarizationPrefetch - Skipping, assets unavailable. Consider request eligible. Next check at %f");
        OUTLINED_FUNCTION_7();
      }
      else
      {

        swift_release();
      }
      uint64_t v111 = v162;
      id v112 = v160;
      uint64_t v113 = v161;
      OUTLINED_FUNCTION_7_1();
      v114();
      __swift_storeEnumTagSinglePayload(v112, 0, 1, v69);
      uint64_t v115 = sub_25BC9DC5C(v37, v112, 1);
      uint64_t v116 = v112;
      uint64_t v51 = v115;
      sub_25BC9FB8C(v116, &qword_26A554648);
      (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v113, v69);
      id v117 = OUTLINED_FUNCTION_37();
      v118(v117);
      return v51;
    }
    uint64_t v73 = MEMORY[0x261174AC0](v65 + 16);
    if (!v73)
    {
      uint64_t v129 = v162;
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_7_1();
      v130();
      uint64_t v51 = OUTLINED_FUNCTION_27_1();
      sub_25BC9FB8C(a1, &qword_26A554648);
      (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v25, v25);
      goto LABEL_37;
    }
    uint64_t v74 = v65;
    uint64_t v75 = v73;
    uint64_t v76 = *(void *)(v74 + 24);
    sub_25BCA1780();
    uint64_t v77 = v150;
    OUTLINED_FUNCTION_52_0();
    __swift_storeEnumTagSinglePayload(v78, v79, v80, v81);
    uint64_t v82 = swift_allocObject();
    swift_weakInit();
    unint64_t v83 = (void *)swift_allocObject();
    v83[2] = 0;
    v83[3] = 0;
    v83[4] = v82;
    v83[5] = v75;
    v83[6] = v76;
    swift_unknownObjectRetain();
    uint64_t v84 = sub_25BC98994(v77, (uint64_t)&unk_26A554D38, (uint64_t)v83);
    sub_25BC98C70(v84);
    swift_unknownObjectRelease();
    uint64_t v65 = v74;
  }
  uint64_t v159 = v46;
  uint64_t v85 = *(void **)(v65 + 104);
  (*(void (**)(uint64_t, void, uint64_t))(v153 + 104))(v152, *MEMORY[0x263F5D0A0], v154);
  swift_retain();
  uint64_t v86 = v155;
  sub_25BCA1490();
  type metadata accessor for ResourceAccessSpan();
  OUTLINED_FUNCTION_53();
  uint64_t v87 = OUTLINED_FUNCTION_46_0(v85, 33, v86);
  uint64_t v88 = v87;
  if ((*(unsigned char *)(v65 + 128) & 1) == 0) {
    *(unsigned char *)(v87 + qword_26A554C38) = 1;
  }
  uint64_t v89 = *(void *)(v65 + 40);
  if (!v89)
  {
    OUTLINED_FUNCTION_54_0(qword_26A554C30);
    uint64_t v103 = v162;
    uint64_t v104 = v160;
    uint64_t v105 = v161;
    uint64_t v106 = v159;
    OUTLINED_FUNCTION_7_1();
    v107();
    __swift_storeEnumTagSinglePayload(v104, 0, 1, v106);
    uint64_t v51 = sub_25BC9DC5C(v37, v104, 1);
    swift_release();
    sub_25BC9FB8C(v104, &qword_26A554648);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v105, v106);
    goto LABEL_37;
  }
  uint64_t v90 = *(void *)(v65 + 32);
  unint64_t v91 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 112);
  char v92 = *(void *)(v65 + 48);
  unint64_t v93 = *(void *)(v65 + 56);
  swift_retain();
  v91(&v166, v90, v89, v92, v93);
  swift_release();
  if (!v167)
  {
    sub_25BC9FB8C((uint64_t)&v166, &qword_26A554630);
    OUTLINED_FUNCTION_54_0(qword_26A554C30);
    swift_release();
    OUTLINED_FUNCTION_9_0();
    v109();
    OUTLINED_FUNCTION_9_0();
    v110();
    return 0;
  }
  sub_25BC7DABC(&v166, (uint64_t)v169);
  char v94 = sub_25BCA12B0();
  if (!v95)
  {
LABEL_43:
    int v119 = v88;
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v164, (uint64_t)qword_26B34BF78);
    uint64_t v120 = v163;
    OUTLINED_FUNCTION_32_0();
    uint64_t v121 = (void *)sub_25BCA14F0();
    unint64_t v122 = sub_25BCA17E0();
    if (OUTLINED_FUNCTION_22_1(v122))
    {
      uint64_t v123 = (_DWORD *)OUTLINED_FUNCTION_14_0();
      *(void *)&v166 = OUTLINED_FUNCTION_34();
      *uint64_t v123 = 136642819;
      swift_bridgeObjectRetain();
      *(void *)&v165[0] = sub_25BC9E6B4(v157, v120, (uint64_t *)&v166);
      sub_25BCA1880();
      OUTLINED_FUNCTION_47_0();
      OUTLINED_FUNCTION_61_0(&dword_25BC76000, v124, v125, "SafariSummarizationPrefetch - Invalid URL (%{sensitive}s) found");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      OUTLINED_FUNCTION_18_0();
    }
    *(unsigned char *)(v119 + qword_26A554C30) = 89;
    sub_25BC96FE8();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v169);
    OUTLINED_FUNCTION_9_0();
    v126();
    unint64_t v127 = OUTLINED_FUNCTION_37();
    v128(v127);
    return 0;
  }
  char v96 = v94;
  uint64_t v97 = v95;
  uint64_t v98 = sub_25BCA12B0();
  if (!v99 || (uint64_t v100 = sub_25BC8DE18(v98, v99), v102 = v101, swift_bridgeObjectRelease(), !v102))
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v65 + 64), *(void *)(v65 + 88));
  sub_25BC86BDC(v100, v102, v169, v165);
  sub_25BC7DABC(v165, (uint64_t)&v166);
  sub_25BC98B38(1);
  os_log_t v131 = v167;
  uint64_t v132 = v168;
  __swift_project_boxed_opaque_existential_1(&v166, (uint64_t)v167);
  uint64_t v133 = (*(uint64_t (**)(uint64_t, unint64_t, uint8_t *, uint64_t))(v132 + 8))(v100, v102, v131, v132);
  swift_bridgeObjectRelease();
  if ((v133 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v141 = v164;
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v142 = __swift_project_value_buffer(v141, (uint64_t)qword_26B34BF78);
    os_log_t v143 = sub_25BCA14F0();
    uint64_t v144 = sub_25BCA1800();
    if (OUTLINED_FUNCTION_40(v144))
    {
      uint64_t v145 = (_WORD *)OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_21(v145);
      _os_log_impl(&dword_25BC76000, v143, v142, "SafariSummarizationPrefetch - Domain is not in allow-list, request ineligible", v131, 2u);
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_54_0(qword_26A554C30);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v169);
    OUTLINED_FUNCTION_9_0();
    v146();
    OUTLINED_FUNCTION_9_0();
    v147();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    return 0;
  }
  uint64_t v134 = v164;
  if (qword_26B34B690 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v134, (uint64_t)qword_26B34BF78);
  uint64_t v135 = sub_25BCA14F0();
  uint64_t v136 = sub_25BCA1800();
  if (os_log_type_enabled(v135, v136))
  {
    uint64_t v137 = (uint8_t *)OUTLINED_FUNCTION_26();
    *(_WORD *)uint64_t v137 = 0;
    _os_log_impl(&dword_25BC76000, v135, v136, "SafariSummarizationPrefetch - Domain is in allow-list, request eligible", v137, 2u);
    OUTLINED_FUNCTION_7();
  }

  uint64_t v138 = sub_25BC9CA0C(v37, v161, v96, v97);
  swift_bridgeObjectRelease();
  uint64_t v51 = v138;
  *(unsigned char *)(v88 + qword_26A554C30) = 78;
  sub_25BC96FE8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v169);
  OUTLINED_FUNCTION_9_0();
  v139();
  OUTLINED_FUNCTION_9_0();
  v140();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  return v51;
}

uint64_t sub_25BC9C404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 56) = a4;
  *(void *)(v5 + 64) = a5;
  return MEMORY[0x270FA2498](sub_25BC9C424, 0, 0);
}

uint64_t sub_25BC9C424()
{
  uint64_t v15 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[9] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25BCA1510();
    v0[10] = __swift_project_value_buffer(v3, (uint64_t)qword_26B34BF78);
    swift_retain();
    uint64_t v4 = sub_25BCA14F0();
    os_log_type_t v5 = sub_25BCA1800();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = OUTLINED_FUNCTION_58();
      uint64_t v14 = OUTLINED_FUNCTION_34();
      *(_DWORD *)uint64_t v6 = 136643075;
      uint64_t v7 = v2[6];
      unint64_t v8 = v2[7];
      swift_bridgeObjectRetain();
      v0[5] = sub_25BC9E6B4(v7, v8, &v14);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2048;
      v0[6] = v2[18];
      sub_25BCA1880();
      swift_release();
      _os_log_impl(&dword_25BC76000, v4, v5, "SafariSummarizationPrefetch - Call delegate.didNotFindAssetAfterThrottlingPeriodExpired for locale %{sensitive}s. No loaded assets. Next check at %f", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
      swift_release();
    }

    uint64_t v12 = v2[6];
    uint64_t v11 = v2[7];
    v0[11] = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[12] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_25BC9C6CC;
    return sub_25BC787F4(v12, v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
    return v9();
  }
}

uint64_t sub_25BC9C6CC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25BC9C7B0()
{
  sub_25BC98B80();
  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v5 = v4 != 0;
    uint64_t v6 = sub_25BCA14F0();
    os_log_type_t v7 = sub_25BCA1800();
    if (!os_log_type_enabled(v6, v7)) {
      goto LABEL_8;
    }
    BOOL v8 = v4 != 0;
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_33();
    *(_DWORD *)uint64_t v9 = 67109120;
    *(_DWORD *)(v1 + 104) = v8;
    sub_25BCA1880();
    _os_log_impl(&dword_25BC76000, v6, v7, "SafariSummarizationPrefetch - After delegate.didNotFindAssetAfterThrottlingPeriodExpired hasUrlRedactMap %{BOOL}d", v9, 8u);
    goto LABEL_6;
  }
  uint64_t v6 = sub_25BCA14F0();
  os_log_type_t v10 = sub_25BCA1800();
  if (os_log_type_enabled(v6, v10))
  {
    uint64_t v11 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v11);
    _os_log_impl(&dword_25BC76000, v6, v10, "SafariSummarizationPrefetch - After delegate.didNotFindAssetAfterThrottlingPeriodExpired, no urlRedactPatterns", v0, 2u);
    char v5 = 0;
LABEL_6:
    OUTLINED_FUNCTION_7();
    goto LABEL_8;
  }
  char v5 = 0;
LABEL_8:

  sub_25BC9DF78(v5);
  uint64_t v12 = (void *)sub_25BCA14F0();
  os_log_type_t v13 = sub_25BCA1800();
  if (OUTLINED_FUNCTION_20(v13))
  {
    uint64_t v14 = (_WORD *)OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_21(v14);
    OUTLINED_FUNCTION_14(&dword_25BC76000, v15, v16, "SafariSummarizationPrefetch - Posting notification SafariAssistantFilterDataLoaded");
    OUTLINED_FUNCTION_7();
  }

  id v17 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5543F0 != -1) {
    swift_once();
  }
  objc_msgSend(v17, sel_postNotificationName_object_, qword_26A554F20, 0);

  sub_25BC98C70(0);
  swift_release();
  OUTLINED_FUNCTION_5();
  return v18();
}

uint64_t sub_25BC9CA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v132 = a4;
  uint64_t v131 = a3;
  uint64_t v140 = sub_25BCA1510();
  OUTLINED_FUNCTION_0_3();
  uint64_t v135 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v136 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_3();
  uint64_t v134 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_31();
  uint64_t v130 = v11;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v12);
  unint64_t v122 = (char *)&v122 - v13;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v14);
  unint64_t v127 = (char *)&v122 - v15;
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x270FA5388](v16);
  uint64_t v126 = (char *)&v122 - v17;
  sub_25BCA1420();
  OUTLINED_FUNCTION_0_3();
  uint64_t v123 = v19;
  uint64_t v124 = v18;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_29_0();
  uint64_t v20 = sub_25BCA1480();
  uint64_t v21 = OUTLINED_FUNCTION_47(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_29();
  uint64_t v125 = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554648);
  uint64_t v24 = OUTLINED_FUNCTION_47(v23);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_10();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = sub_25BCA11F0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_10();
  uint64_t v34 = v33 - v32;
  uint64_t v35 = *(void (**)(void))(v30 + 16);
  OUTLINED_FUNCTION_41_0();
  v35();
  uint64_t v36 = sub_25BCA11A0();
  if (!v36)
  {
    uint64_t v49 = v135;
    uint64_t v139 = v34;
    OUTLINED_FUNCTION_52_0();
    uint64_t v137 = v28;
    __swift_storeEnumTagSinglePayload(v50, v51, v52, v28);
    uint64_t v53 = sub_25BC9DC5C(a1, v27, 0);
    unint64_t v55 = v54;
    sub_25BC9FB8C(v27, &qword_26A554648);
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    uint64_t v56 = v140;
    __swift_project_value_buffer(v140, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_7_1();
    v57();
    OUTLINED_FUNCTION_32_0();
    id v58 = sub_25BCA14F0();
    os_log_type_t v59 = sub_25BCA1800();
    if (!os_log_type_enabled(v58, v59))
    {
      OUTLINED_FUNCTION_18_0();

      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v5, v56);
      OUTLINED_FUNCTION_23_0();
      v79();
      return v53;
    }
    uint64_t v60 = (uint8_t *)OUTLINED_FUNCTION_14_0();
    v142[0] = OUTLINED_FUNCTION_34();
    uint64_t v138 = v53;
    uint64_t v129 = v30;
    *(_DWORD *)uint64_t v60 = 136642819;
    if (v55) {
      uint64_t v61 = v53;
    }
    else {
      uint64_t v61 = 6369134;
    }
    if (v55) {
      unint64_t v62 = v55;
    }
    else {
      unint64_t v62 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v141 = sub_25BC9E6B4(v61, v62, v142);
    sub_25BCA1880();
    OUTLINED_FUNCTION_18_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25BC76000, v58, v59, "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with query items, return original url: %{sensitive}s", v60, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();

    OUTLINED_FUNCTION_9_0();
    v63();
    OUTLINED_FUNCTION_9_0();
    v64();
    return v138;
  }
  uint64_t v37 = v36;
  OUTLINED_FUNCTION_41_0();
  v35();
  OUTLINED_FUNCTION_50();
  uint64_t v135 = a1;
  uint64_t v138 = sub_25BC9DC5C(a1, v27, 1);
  unint64_t v39 = v38;
  sub_25BC9FB8C(v27, &qword_26A554648);
  unint64_t v128 = v39;
  if (!v39)
  {
    OUTLINED_FUNCTION_23_0();
    v78();
    swift_bridgeObjectRelease();
    return v138;
  }
  uint64_t v139 = v34;
  uint64_t v137 = v28;
  uint64_t v129 = v30;
  uint64_t v40 = sub_25BC98B80();
  if (!v41) {
    goto LABEL_17;
  }
  uint64_t v43 = v40;
  uint64_t v28 = v41;
  uint64_t v30 = v42;
  uint64_t v44 = v132;
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_25BC987E8(v131, v44, v30);
  swift_bridgeObjectRelease();
  sub_25BC7DC68(v43, v28);
  if (v45)
  {
    unint64_t v46 = *(void *)(sub_25BCA1270() + 16);
    swift_bridgeObjectRelease();
    if (v46 < 2)
    {
      uint64_t v48 = 0;
    }
    else
    {
      uint64_t v47 = *(void *)(sub_25BCA1270() + 16);
      swift_bridgeObjectRelease();
      uint64_t v48 = v47 - 1;
    }
    uint64_t v82 = sub_25BC9882C(v48, v45);
    swift_bridgeObjectRelease();
    if (v82)
    {
      swift_bridgeObjectRelease();
      uint64_t v83 = v133;
      uint64_t v84 = *(void **)(v133 + 104);
      (*(void (**)(uint64_t, void, uint64_t))(v123 + 104))(v4, *MEMORY[0x263F5D0A0], v124);
      swift_retain();
      uint64_t v85 = v125;
      sub_25BCA1490();
      type metadata accessor for ResourceAccessSpan();
      OUTLINED_FUNCTION_53();
      uint64_t v138 = OUTLINED_FUNCTION_46_0(v84, 37, v85);
      if ((*(unsigned char *)(v83 + 128) & 1) == 0) {
        *(unsigned char *)(v138 + qword_26A554C38) = 1;
      }
      uint64_t v86 = sub_25BC9D600(v37, v82);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v87 = v134;
      uint64_t v88 = v126;
      if (!*(void *)(v86 + 16)) {
        swift_bridgeObjectRelease();
      }
      sub_25BCA11B0();
      *(unsigned char *)(v138 + qword_26A554C30) = 78;
      sub_25BC96FE8();
      OUTLINED_FUNCTION_41_0();
      v35();
      OUTLINED_FUNCTION_50();
      uint64_t v89 = v135;
      uint64_t v53 = sub_25BC9DC5C(v135, v27, 0);
      unint64_t v91 = v90;
      sub_25BC9FB8C(v27, &qword_26A554648);
      uint64_t v92 = *(void *)(v87 + 16);
      uint64_t v93 = v136;
      ((void (*)(char *, uint64_t, uint64_t))v92)(v88, v89, v136);
      if (!v91)
      {
        uint64_t v53 = sub_25BCA1260();
        unint64_t v91 = v94;
      }
      unint64_t v95 = v127;
      uint64_t v97 = *(void *)(v87 + 8);
      uint64_t v96 = v87 + 8;
      uint64_t v133 = v97;
      OUTLINED_FUNCTION_15_0();
      v98();
      if (qword_26B34B690 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v140, (uint64_t)qword_26B34BF78);
      ((void (*)(char *, uint64_t, uint64_t))v92)(v95, v89, v93);
      OUTLINED_FUNCTION_32_0();
      uint64_t v99 = sub_25BCA14F0();
      os_log_type_t v100 = sub_25BCA1800();
      if (os_log_type_enabled(v99, v100))
      {
        OUTLINED_FUNCTION_58();
        v142[0] = OUTLINED_FUNCTION_48_0();
        *(_DWORD *)uint64_t v92 = 136643075;
        swift_bridgeObjectRetain();
        uint64_t v101 = sub_25BC9E6B4(v53, v91, v142);
        OUTLINED_FUNCTION_43_0(v101);
        uint64_t v134 = v96;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_47_0();
        *(_WORD *)(v92 + 12) = 2085;
        uint64_t v102 = sub_25BCA1260();
        uint64_t v104 = sub_25BC9E6B4(v102, v103, v142);
        OUTLINED_FUNCTION_42(v104);
        sub_25BCA1880();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_9_0();
        v105();
        _os_log_impl(&dword_25BC76000, v99, v100, "SafariSummarizationPrefetch - Redacted url string %{sensitive}s, from original %{sensitive}s", (uint8_t *)v92, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7();

        swift_release();
      }
      else
      {

        swift_release();
        OUTLINED_FUNCTION_51_0();
        OUTLINED_FUNCTION_15_0();
        v117();
        OUTLINED_FUNCTION_18_0();
      }
      goto LABEL_42;
    }
    swift_bridgeObjectRelease();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v140, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_55_0();
    OUTLINED_FUNCTION_7_1();
    v106();
    unint64_t v107 = v128;
    swift_bridgeObjectRetain_n();
    id v108 = (void *)sub_25BCA14F0();
    os_log_type_t v109 = sub_25BCA1800();
    BOOL v110 = OUTLINED_FUNCTION_22_1(v109);
    uint64_t v53 = v138;
    if (v110)
    {
      OUTLINED_FUNCTION_58();
      uint64_t v140 = OUTLINED_FUNCTION_48_0();
      v142[0] = v140;
      MEMORY[0] = 136643075;
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_25BC9E6B4(v53, v107, v142);
      OUTLINED_FUNCTION_43_0(v111);
      sub_25BCA1880();
      swift_bridgeObjectRelease_n();
      MEMORY[0xC] = 2085;
      uint64_t v112 = sub_25BCA1260();
      uint64_t v141 = sub_25BC9E6B4(v112, v113, v142);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23_0();
      v114();
      OUTLINED_FUNCTION_60_0(&dword_25BC76000, v115, v116, "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with number of components, return Redacted url string %{sensitive}s, from original url: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {

      uint64_t v119 = OUTLINED_FUNCTION_16_1();
      v120(v119);
      swift_bridgeObjectRelease_n();
    }
    OUTLINED_FUNCTION_9_0();
    v121();
  }
  else
  {
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_26B34B690 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v140, (uint64_t)qword_26B34BF78);
    OUTLINED_FUNCTION_55_0();
    uint64_t v65 = v130;
    OUTLINED_FUNCTION_7_1();
    v66();
    unint64_t v67 = v128;
    OUTLINED_FUNCTION_32_0();
    uint64_t v68 = (void *)sub_25BCA14F0();
    os_log_type_t v69 = sub_25BCA1800();
    BOOL v70 = OUTLINED_FUNCTION_22_1(v69);
    uint64_t v53 = v138;
    uint64_t v71 = v139;
    if (v70)
    {
      OUTLINED_FUNCTION_58();
      v142[0] = OUTLINED_FUNCTION_48_0();
      *(_DWORD *)uint64_t v28 = 136643075;
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_25BC9E6B4(v53, v67, v142);
      OUTLINED_FUNCTION_43_0(v72);
      OUTLINED_FUNCTION_58_0();
      OUTLINED_FUNCTION_47_0();
      *(_WORD *)(v28 + 12) = 2085;
      uint64_t v73 = sub_25BCA1260();
      uint64_t v75 = sub_25BC9E6B4(v73, v74, v142);
      OUTLINED_FUNCTION_42(v75);
      sub_25BCA1880();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v65, v136);
      OUTLINED_FUNCTION_60_0(&dword_25BC76000, v76, v77, "SafariSummarizationPrefetch - Url redacted due to no matching url pattern with domain, return Redacted url string %{sensitive}s, from original url: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();

LABEL_42:
      (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v139, v137);
      return v53;
    }

    uint64_t v80 = OUTLINED_FUNCTION_16_1();
    v81(v80);
    OUTLINED_FUNCTION_18_0();
    (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v71, v137);
  }
  return v53;
}

uint64_t sub_25BC9D600(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = sub_25BCA1190();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_2();
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v46 = MEMORY[0x263F8EE78];
    sub_25BC9F738(0, v8, 0);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    uint64_t v10 = v6 + 16;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v42 = *(void *)(v10 + 56);
    uint64_t v43 = v11;
    do
    {
      v43(v2, v12, v45);
      uint64_t v13 = sub_25BCA1170();
      uint64_t v15 = v14;
      uint64_t v16 = sub_25BCA1180();
      uint64_t v18 = v17;
      OUTLINED_FUNCTION_9_0();
      v19();
      uint64_t v9 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25BC9F738(0, *(void *)(v46 + 16) + 1, 1);
        uint64_t v9 = v46;
      }
      unint64_t v21 = *(void *)(v9 + 16);
      unint64_t v20 = *(void *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_25BC9F738((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v9 = v46;
      }
      *(void *)(v9 + 16) = v21 + 1;
      uint64_t v22 = (void *)(v9 + 32 * v21);
      v22[4] = v13;
      v22[5] = v15;
      v22[6] = v16;
      v22[7] = v18;
      v12 += v42;
      --v8;
    }
    while (v8);
  }
  uint64_t v23 = sub_25BC9DBCC(v9);
  uint64_t v44 = *(void *)(a2 + 16);
  if (v44)
  {
    sub_25BC8A500();
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
    uint64_t v25 = v44;
    while (1)
    {
      uint64_t v26 = (void *)sub_25BCA18A0();
      uint64_t v27 = (uint64_t)v26;
      uint64_t v28 = v26[2];
      if (!v28)
      {
LABEL_27:
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      if (*(void *)(v23 + 16))
      {
        uint64_t v29 = v26[4];
        uint64_t v30 = v26[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25BC9EE78(v29, v30);
        if (v31)
        {
          uint64_t v32 = 0;
          uint64_t v33 = v27 + 56;
          uint64_t v34 = v28 - 1;
          while (1)
          {
            uint64_t result = swift_bridgeObjectRelease();
            if (v34 == v32)
            {
              swift_bridgeObjectRelease();
              goto LABEL_27;
            }
            if ((unint64_t)++v32 >= *(void *)(v27 + 16)) {
              break;
            }
            if (!*(void *)(v23 + 16))
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_22;
            }
            uint64_t v36 = v33 + 16;
            uint64_t v39 = v33 - 8;
            uint64_t v37 = *(void *)(v33 - 8);
            uint64_t v38 = *(void *)(v39 + 8);
            swift_bridgeObjectRetain();
            sub_25BC9EE78(v37, v38);
            uint64_t v33 = v36;
            if ((v40 & 1) == 0)
            {
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
LABEL_22:
              uint64_t v25 = v44;
              goto LABEL_23;
            }
          }
          __break(1u);
          return result;
        }
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
LABEL_23:
      if (++v24 == v25)
      {
        swift_bridgeObjectRelease();
        uint64_t v27 = MEMORY[0x263F8EE78];
        goto LABEL_28;
      }
    }
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
LABEL_28:
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_25BC9D99C(v27, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v41;
}

uint64_t sub_25BC9D99C(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = sub_25BCA1190();
  uint64_t v5 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  v23[0] = v2;
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_25BC9F718(0, v8, 0);
  uint64_t v9 = v26;
  v23[1] = v5 + 32;
  uint64_t v24 = a2;
  uint64_t v10 = (uint64_t *)(a1 + 40);
  do
  {
    uint64_t v11 = *(v10 - 1);
    uint64_t v12 = *v10;
    uint64_t v13 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    if (v13)
    {
      unint64_t v14 = sub_25BC9EE78(v11, v12);
      if (v15)
      {
        uint64_t v16 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v14);
        uint64_t v17 = *v16;
        uint64_t v18 = v16[1];
        swift_bridgeObjectRetain();
        uint64_t v19 = v18;
        goto LABEL_9;
      }
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v19 = 1;
LABEL_9:
    sub_25BCA1160();
    sub_25BC9F758(v17, v19);
    swift_bridgeObjectRelease();
    uint64_t v26 = v9;
    unint64_t v21 = *(void *)(v9 + 16);
    unint64_t v20 = *(void *)(v9 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_25BC9F718(v20 > 1, v21 + 1, 1);
      uint64_t v9 = v26;
    }
    v10 += 2;
    *(void *)(v9 + 16) = v21 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v21, v7, v25);
    --v8;
    a2 = v24;
  }
  while (v8);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_25BC9DBCC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D10);
    uint64_t v3 = sub_25BCA19C0();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t v6 = v3;
  sub_25BC9F52C(a1, 1, &v6);
  uint64_t v4 = v6;
  if (v1) {
    swift_release();
  }
  return v4;
}

uint64_t sub_25BC9DC5C(uint64_t a1, uint64_t a2, char a3)
{
  v38[1] = a1;
  uint64_t v6 = sub_25BCA11F0();
  OUTLINED_FUNCTION_0_3();
  v38[0] = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5548D0);
  uint64_t v12 = OUTLINED_FUNCTION_47(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_29_0();
  uint64_t v13 = sub_25BCA1300();
  OUTLINED_FUNCTION_0_3();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)v38 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554648);
  uint64_t v23 = OUTLINED_FUNCTION_47(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_10();
  uint64_t v26 = v25 - v24;
  sub_25BC9E194(a2, v25 - v24);
  if ((a3 & 1) != 0 && !__swift_getEnumTagSinglePayload(v26, 1, v6)) {
    sub_25BCA11B0();
  }
  if (__swift_getEnumTagSinglePayload(v26, 1, v6))
  {
    OUTLINED_FUNCTION_52_0();
    __swift_storeEnumTagSinglePayload(v27, v28, v29, v13);
  }
  else
  {
    uint64_t v30 = v38[0];
    OUTLINED_FUNCTION_7_1();
    v31();
    sub_25BCA11D0();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v6);
  }
  OUTLINED_FUNCTION_7_1();
  v32();
  if (__swift_getEnumTagSinglePayload(v3, 1, v13) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v19, v13);
    sub_25BC9FB8C(v3, &qword_26A5548D0);
  }
  else
  {
    OUTLINED_FUNCTION_25_0();
    v33();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v21, v3, v13);
  }
  uint64_t v34 = sub_25BCA1260();
  uint64_t v36 = v35;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v13);
  v38[2] = v34;
  v38[3] = v36;
  sub_25BC8A500();
  sub_25BCA18C0();
  swift_bridgeObjectRelease();
  sub_25BC9FB8C(v26, &qword_26A554648);
  return OUTLINED_FUNCTION_13();
}

uint64_t sub_25BC9DF78(char a1)
{
  uint64_t v2 = v1;
  sub_25BCA13E0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_2();
  if (a1)
  {
    return sub_25BC98B38(1);
  }
  else
  {
    sub_25BC98B38(0);
    double v6 = 0.0;
    uint64_t result = sub_25BCA17A0();
    if ((result & 1) == 0)
    {
      sub_25BCA13D0();
      sub_25BCA13B0();
      double v8 = v7;
      OUTLINED_FUNCTION_23_0();
      uint64_t result = v9();
      double v6 = v8 + 3600.0;
    }
    *(double *)(v2 + 144) = v6;
  }
  return result;
}

uint64_t sub_25BC9E07C()
{
  sub_25BC8B0B4(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25BC9E0E4()
{
  sub_25BC9E07C();
  return MEMORY[0x270FA0228](v0, 176, 7);
}

uint64_t type metadata accessor for SASafariAssistantPrefetchRequestFilter()
{
  return self;
}

ValueMetadata *type metadata accessor for SAPrefetchUrlRedactPatterns()
{
  return &type metadata for SAPrefetchUrlRedactPatterns;
}

uint64_t sub_25BC9E14C(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_25BC9E194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A554648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_25BC9E1FC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_45();
    __src = (char *)OUTLINED_FUNCTION_44_0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25BC9E268(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_25BCA19D0();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_25BCA1190(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_25BCA1190();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

char *sub_25BC9E398(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25BCA19D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_25BC9E42C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_45();
    __src = (char *)OUTLINED_FUNCTION_44_0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_25BC9E49C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_25BCA1190() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_25BCA19D0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25BC9E5B4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25BCA19D0();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D28);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25BC9E6B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_18();
  uint64_t v9 = sub_25BC9E784(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_25BC9F9EC((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_25BC9F9EC((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_25BC9E784(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25BC9E8DC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25BCA1890();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25BC9E9B4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25BCA1940();
    if (!v8)
    {
      uint64_t result = sub_25BCA1980();
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

void *sub_25BC9E8DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25BCA19D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25BC9E9B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BC9EA4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25BC9EC84(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25BC9EC84((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BC9EA4C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25BCA1670();
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
  unint64_t v3 = sub_25BC9EBC0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25BCA1920();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25BCA19D0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25BCA1980();
  __break(1u);
  return result;
}

void *sub_25BC9EBC0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BC9EC28(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_25BCA16C0();
    OUTLINED_FUNCTION_39_0(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x261173E90](15, a1 >> 16);
    OUTLINED_FUNCTION_39_0(v3);
    return v4 | 8;
  }
}

char *sub_25BC9EC84(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5549D0);
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
    sub_25BC9E1FC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25BC9ED5C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25BC9ED5C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25BCA19D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

unint64_t sub_25BC9EE34(uint64_t a1)
{
  uint64_t v2 = sub_25BCA18D0();
  return sub_25BC9EF98(a1, v2);
}

unint64_t sub_25BC9EE78(uint64_t a1, uint64_t a2)
{
  sub_25BCA1AF0();
  sub_25BCA1620();
  uint64_t v4 = sub_25BCA1B10();
  return sub_25BC9F060(a1, a2, v4);
}

uint64_t sub_25BC9EEF4()
{
  sub_25BCA1AF0();
  sub_25BCA1620();
  uint64_t v0 = sub_25BCA1B10();
  return sub_25BC9F144(v0);
}

unint64_t sub_25BC9EF54(uint64_t a1)
{
  uint64_t v2 = sub_25BCA1AE0();
  return sub_25BC9F170(a1, v2);
}

unint64_t sub_25BC9EF98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25BC9FDBC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611740E0](v9, a1);
      sub_25BC80098((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25BC9F060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25BCA1A70() & 1) == 0)
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
      while (!v14 && (sub_25BCA1A70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25BC9F144(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

unint64_t sub_25BC9F170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_25BC9F20C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D10);
  char v36 = a2;
  uint64_t v6 = sub_25BCA19B0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v2;
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
  {
    unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25BCA1AF0();
    sub_25BCA1620();
    uint64_t result = sub_25BCA1B10();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) == 0)
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
        uint64_t v31 = *(void *)(v12 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
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
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    *uint64_t v32 = v23;
    v32[1] = v22;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v27) = v37;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_41;
    }
    if (v17 >= v11)
    {
      swift_release();
      uint64_t v3 = v34;
      uint64_t v18 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v35 + 8 * v17);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_32;
      }
      unint64_t v19 = *(void *)(v35 + 8 * v14);
      if (!v19) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v19 - 1) & v19;
  }
  int64_t v20 = v17 + 2;
  if (v20 < v11)
  {
    unint64_t v19 = *(void *)(v35 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v14 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_42;
        }
        if (v14 >= v11) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v35 + 8 * v14);
        ++v20;
        if (v19) {
          goto LABEL_18;
        }
      }
    }
    int64_t v14 = v20;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v34;
LABEL_34:
  if (v36)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_25BC9F510(0, (unint64_t)(v33 + 63) >> 6, v18);
    }
    else {
      *uint64_t v18 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25BC9F510(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_25BC9F52C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  for (unint64_t i = (uint64_t *)(a1 + 56); ; i += 4)
  {
    uint64_t v8 = *(i - 3);
    uint64_t v7 = *(i - 2);
    uint64_t v9 = *i;
    uint64_t v30 = *(i - 1);
    unint64_t v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_25BC9EE78(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D18);
        sub_25BCA1960();
      }
    }
    else
    {
      sub_25BC9F20C(v15, a2 & 1);
      unint64_t v17 = sub_25BC9EE78(v8, v7);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_18;
      }
      unint64_t v12 = v17;
    }
    unint64_t v19 = (void *)*a3;
    if (v16)
    {
      int64_t v20 = (uint64_t *)(v19[7] + 16 * v12);
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = (void *)(v19[7] + 16 * v12);
      swift_bridgeObjectRelease();
      *uint64_t v23 = v22;
      v23[1] = v21;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      uint64_t v24 = (uint64_t *)(v19[6] + 16 * v12);
      *uint64_t v24 = v8;
      v24[1] = v7;
      unint64_t v25 = (void *)(v19[7] + 16 * v12);
      void *v25 = v30;
      v25[1] = v9;
      uint64_t v26 = v19[2];
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_17;
      }
      v19[2] = v28;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_25BCA1A90();
  __break(1u);
  return result;
}

size_t sub_25BC9F718(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25BC9F76C(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

char *sub_25BC9F738(char *a1, int64_t a2, char a3)
{
  size_t result = sub_25BC9F908(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

uint64_t sub_25BC9F758(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

size_t sub_25BC9F76C(size_t result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D08);
  uint64_t v10 = *(void *)(sub_25BCA1190() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  void v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25BCA1190() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_25BC9E268(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25BC9E49C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_25BC9F908(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A554D20);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25BC9E398(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25BC9E5B4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_25BC9F9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25BC9FA48()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BC9FA80()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25BC9FAC8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_15(v7);
  *uint64_t v8 = v9;
  v8[1] = sub_25BC7E1FC;
  return sub_25BC9C404(a1, v3, v4, v5, v6);
}

uint64_t sub_25BC9FB8C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_9_0();
  v3();
  return a1;
}

uint64_t sub_25BC9FBE4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC9FC1C(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_15(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25BC7E1FC;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A554D40 + dword_26A554D40);
  return v7(a1, v3);
}

unint64_t sub_25BC9FCD0()
{
  unint64_t result = qword_26A554D60;
  if (!qword_26A554D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554D60);
  }
  return result;
}

unint64_t sub_25BC9FD1C()
{
  unint64_t result = qword_26A554D70;
  if (!qword_26A554D70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A554D58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554D70);
  }
  return result;
}

unint64_t sub_25BC9FD70()
{
  unint64_t result = qword_26A554D78;
  if (!qword_26A554D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A554D78);
  }
  return result;
}

uint64_t sub_25BC9FDBC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t getEnumTagSinglePayload for SafariSummarizationPrefetchRequestFilterError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SafariSummarizationPrefetchRequestFilterError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BC9FF6CLL);
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

ValueMetadata *type metadata accessor for SafariSummarizationPrefetchRequestFilterError()
{
  return &type metadata for SafariSummarizationPrefetchRequestFilterError;
}

unint64_t sub_25BC9FFA8()
{
  unint64_t result = qword_26A554D90[0];
  if (!qword_26A554D90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A554D90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_22_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return *(void *)(v0 - 272);
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_25BC9DC5C(v2, v1, 1);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_25BCA1300();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_33_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_39_0(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

BOOL OUTLINED_FUNCTION_40(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t result)
{
  *(void *)(v1 - 104) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_25BCA19D0();
}

uint64_t OUTLINED_FUNCTION_46_0(void *a1, int a2, uint64_t a3)
{
  return sub_25BC9696C(a1, a2, a3, 0, 1);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_54_0(uint64_t a1@<X8>)
{
  *(unsigned char *)(v2 + a1) = v1;
  sub_25BC96FE8();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_25BCA1880();
}

void OUTLINED_FUNCTION_59_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_60_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_61_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t Lock.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  Lock.init()();
  return v0;
}

Swift::Void __swiftcall Lock.lock()()
{
}

Swift::Void __swiftcall Lock.unlock()()
{
}

uint64_t sub_25BCA0414(uint64_t (*a1)(void))
{
  uint64_t result = a1(*(void *)(v1 + 16));
  if (result) {
    __break(1u);
  }
  return result;
}

uint64_t Lock.init()()
{
  uint64_t v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  uint64_t result = pthread_mutex_init(v1, 0);
  if (!result) {
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t Lock.deinit()
{
  MEMORY[0x261174A10](*(void *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t Lock.__deallocating_deinit()
{
  MEMORY[0x261174A10](*(void *)(v0 + 16), -1, -1);
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void Lock.withLock<A>(_:)()
{
  OUTLINED_FUNCTION_4_5();
  Lock.lock()();
  v0();
  Lock.unlock()();
}

void Lock.withLockVoid(_:)()
{
  OUTLINED_FUNCTION_4_5();
  Lock.lock()();
  v0();
  Lock.unlock()();
}

uint64_t ConditionLock.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ConditionLock.init(value:)(a1);
  return v2;
}

uint64_t ConditionLock.init(value:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)v1;
  uint64_t v5 = *(void *)(v4 + 112);
  *(void *)&v2[v5] = swift_slowAlloc();
  uint64_t v6 = *(void *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(&v2[*(void *)(*(void *)v2 + 96)], a1, v6);
  type metadata accessor for Lock();
  uint64_t v8 = swift_allocObject();
  Lock.init()();
  *(void *)&v2[*(void *)(*(void *)v2 + 104)] = v8;
  LODWORD(v8) = pthread_cond_init(*(pthread_cond_t **)&v2[*(void *)(*(void *)v2 + 112)], 0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  if (!v8) {
    return (uint64_t)v2;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Lock()
{
  return self;
}

uint64_t *ConditionLock.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x261174A10](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 112)), -1, -1);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(v2 + 96));
  swift_release();
  return v0;
}

uint64_t ConditionLock.__deallocating_deinit()
{
  ConditionLock.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

Swift::Void __swiftcall ConditionLock.lock()()
{
}

Swift::Void __swiftcall ConditionLock.unlock()()
{
}

uint64_t sub_25BCA0878()
{
  OUTLINED_FUNCTION_3_0();
  return v0();
}

void ConditionLock.value.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  ConditionLock.lock()();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = (char *)v1 + *(void *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v5);
  ConditionLock.unlock()();
}

uint64_t ConditionLock.lock(whenValue:)()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_1_4();
  uint64_t v18 = v3;
  uint64_t v19 = v2;
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0_8();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - v9;
  ConditionLock.lock()();
  uint64_t v11 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v12 = *(void *)(*(void *)v0 + 112);
  uint64_t v13 = *(void *)(*(void *)v0 + 104);
  swift_beginAccess();
  BOOL v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  while (1)
  {
    v14(v10, v11, v5);
    char v15 = OUTLINED_FUNCTION_2_5(v19, v18);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    if (v15) {
      break;
    }
    uint64_t result = pthread_cond_wait(*(pthread_cond_t **)(v1 + v12), *(pthread_mutex_t **)(*(void *)(v1 + v13) + 16));
    if (result)
    {
      __break(1u);
      return result;
    }
  }
  return result;
}

uint64_t ConditionLock.lock(whenValue:timeoutSeconds:)(uint64_t a1, double a2)
{
  uint64_t v29 = a1;
  uint64_t v35 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_4();
  uint64_t v28 = v4;
  uint64_t v6 = *(void *)(v5 + 80);
  OUTLINED_FUNCTION_0_8();
  uint64_t v8 = v7;
  double v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - v11;
  if (v10 < 0.0)
  {
    __break(1u);
    goto LABEL_14;
  }
  ConditionLock.lock()();
  double v13 = a2 * 1000000000.0;
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v34.tv_sec = 0;
  v34.tv_usec = 0;
  gettimeofday(&v34, 0);
  uint64_t v14 = 1000 * v34.tv_usec;
  BOOL v15 = __OFADD__((uint64_t)v13, v14);
  uint64_t v16 = (uint64_t)v13 + v14;
  if (v15)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  if (__OFADD__(v34.tv_sec, v16 / 1000000000)) {
    goto LABEL_18;
  }
  v33.tv_sec = v34.tv_sec + v16 / 1000000000;
  v33.tv_nsec = v16 % 1000000000;
  uint64_t v17 = *v2;
  uint64_t v18 = (uint64_t)v2 + *(void *)(*v2 + 96);
  uint64_t v27 = *(void *)(*v2 + 112);
  uint64_t v19 = *(void *)(v17 + 104);
  swift_beginAccess();
  uint64_t v20 = v8 + 16;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v22 = (void (**)(char *, uint64_t))(v20 - 8);
  do
  {
    v21(v12, v18, v6);
    char v23 = OUTLINED_FUNCTION_2_5(v29, v28);
    (*v22)(v12, v6);
    if (v23) {
      return v23 & 1;
    }
    int v24 = pthread_cond_timedwait(*(pthread_cond_t **)((char *)v2 + v27), *(pthread_mutex_t **)(*(uint64_t *)((char *)v2 + v19) + 16), &v33);
  }
  while (!v24);
  if (v24 == 60)
  {
    ConditionLock.unlock()();
    return v23 & 1;
  }
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  int v26 = v24;
  sub_25BCA1910();
  sub_25BCA1640();
  int v30 = v26;
  sub_25BCA1A50();
  sub_25BCA1640();
  swift_bridgeObjectRelease();
  sub_25BCA1640();
  uint64_t result = sub_25BCA1990();
  __break(1u);
  return result;
}

uint64_t ConditionLock.unlock(withValue:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 24))(v4, a1);
  swift_endAccess();
  ConditionLock.unlock()();
  OUTLINED_FUNCTION_3_0();
  uint64_t result = pthread_cond_broadcast(*(pthread_cond_t **)((char *)v1 + *(void *)(v5 + 112)));
  if (result) {
    __break(1u);
  }
  return result;
}

uint64_t method lookup function for Lock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Lock);
}

uint64_t dispatch thunk of Lock.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_25BCA0EF0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ConditionLock()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ConditionLock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConditionLock);
}

uint64_t dispatch thunk of ConditionLock.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t OUTLINED_FUNCTION_2_5@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a2 + 88);
  return MEMORY[0x270F9D598](v3, a1, v2, v5);
}

uint64_t sub_25BCA1034()
{
  MEMORY[0x261174A10](*(void *)(v0 + 16), -1, -1);
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for Locker()
{
  return self;
}

void sub_25BCA1098(void (*a1)(void))
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t sub_25BCA1100()
{
  return MEMORY[0x270EEDD68]();
}

uint64_t sub_25BCA1110()
{
  return MEMORY[0x270EEDD70]();
}

uint64_t sub_25BCA1120()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25BCA1130()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25BCA1140()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25BCA1150()
{
  return MEMORY[0x270EEE280]();
}

uint64_t sub_25BCA1160()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25BCA1170()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_25BCA1180()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_25BCA1190()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25BCA11A0()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_25BCA11B0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_25BCA11C0()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_25BCA11D0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25BCA11E0()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_25BCA11F0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25BCA1200()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25BCA1210()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25BCA1220()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25BCA1230()
{
  return MEMORY[0x270EEEE78]();
}

uint64_t sub_25BCA1240()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BCA1250()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25BCA1260()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25BCA1270()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t sub_25BCA1280()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_25BCA1290()
{
  return MEMORY[0x270EEFDE0]();
}

uint64_t sub_25BCA12A0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25BCA12B0()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t sub_25BCA12C0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25BCA12D0()
{
  return MEMORY[0x270EEFE98]();
}

uint64_t sub_25BCA12E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25BCA12F0()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_25BCA1300()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25BCA1310()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25BCA1320()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25BCA1330()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25BCA1340()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_25BCA1350()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25BCA1360()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_25BCA1370()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_25BCA1380()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_25BCA1390()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25BCA13A0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25BCA13B0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25BCA13C0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25BCA13D0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25BCA13E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25BCA13F0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25BCA1400()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_25BCA1410()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25BCA1420()
{
  return MEMORY[0x270F53140]();
}

uint64_t sub_25BCA1430()
{
  return MEMORY[0x270F53160]();
}

uint64_t sub_25BCA1440()
{
  return MEMORY[0x270F53168]();
}

uint64_t sub_25BCA1450()
{
  return MEMORY[0x270F53180]();
}

uint64_t sub_25BCA1460()
{
  return MEMORY[0x270F53350]();
}

uint64_t sub_25BCA1470()
{
  return MEMORY[0x270F53358]();
}

uint64_t sub_25BCA1480()
{
  return MEMORY[0x270F53360]();
}

uint64_t sub_25BCA1490()
{
  return MEMORY[0x270F53368]();
}

uint64_t sub_25BCA14A0()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25BCA14B0()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25BCA14C0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25BCA14D0()
{
  return MEMORY[0x270FA2CB8]();
}

uint64_t sub_25BCA14E0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25BCA14F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BCA1500()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BCA1510()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BCA1520()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25BCA1530()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25BCA1540()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25BCA1550()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25BCA1560()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25BCA1590()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BCA15A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BCA15B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25BCA15C0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25BCA15D0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25BCA15E0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25BCA15F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25BCA1600()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25BCA1610()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25BCA1620()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BCA1630()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25BCA1640()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25BCA1650()
{
  return MEMORY[0x270F9D7A8]();
}

uint64_t sub_25BCA1660()
{
  return MEMORY[0x270F9D7B0]();
}

uint64_t sub_25BCA1670()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BCA1680()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25BCA1690()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25BCA16B0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25BCA16C0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25BCA16D0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25BCA16F0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25BCA1700()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25BCA1710()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25BCA1720()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25BCA1730()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BCA1740()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25BCA1750()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25BCA1770()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25BCA1780()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25BCA1790()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25BCA17A0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25BCA17B0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_25BCA17C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25BCA17D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25BCA17E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BCA17F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25BCA1800()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25BCA1810()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25BCA1820()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25BCA1830()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25BCA1840()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_25BCA1850()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25BCA1860()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25BCA1870()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_25BCA1880()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BCA1890()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BCA18A0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25BCA18B0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25BCA18C0()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_25BCA18D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25BCA18E0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25BCA18F0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25BCA1900()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25BCA1910()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25BCA1920()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BCA1930()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25BCA1940()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BCA1950()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25BCA1960()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25BCA1970()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25BCA1980()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BCA1990()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BCA19A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25BCA19B0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BCA19C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BCA19D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BCA19E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25BCA19F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25BCA1A00()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25BCA1A10()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25BCA1A20()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25BCA1A30()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25BCA1A50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25BCA1A60()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25BCA1A70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BCA1A90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BCA1AA0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BCA1AB0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BCA1AC0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BCA1AD0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BCA1AE0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25BCA1AF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BCA1B00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BCA1B10()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BCA1B20()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25BCA1B30()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x270EE2A58]();
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x270EF7A10]();
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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