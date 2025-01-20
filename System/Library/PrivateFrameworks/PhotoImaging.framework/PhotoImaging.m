uint64_t sub_1A9683490()
{
  uint64_t v0;

  v0 = sub_1A97F9FA8();
  __swift_allocate_value_buffer(v0, qword_1E9805100);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9805100);
  return sub_1A97F9F98();
}

void static PIModelCatalog.shared()()
{
  v0 = (void *)qword_1E9804FE0;
  if (qword_1E9804FE0
    || (id v1 = objc_msgSend(objc_allocWithZone((Class)PIModelCatalog), sel_init),
        v2 = (void *)qword_1E9804FE0,
        qword_1E9804FE0 = (uint64_t)v1,
        v2,
        (v0 = (void *)qword_1E9804FE0) != 0))
  {
    swift_dynamicCastUnknownClassUnconditional();
    id v3 = v0;
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall PIModelCatalog.init()(PIModelCatalog *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void PIModelCatalog.cleanupModelBundleURL()()
{
  OUTLINED_FUNCTION_22();
  v2 = (uint64_t *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString);
  if (*(void *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString + 8)) {
    goto LABEL_2;
  }
  sub_1A97F9E68();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_5();
  type metadata accessor for PIModelCatalog();
  sub_1A9683758();
  if (v1) {
    goto LABEL_4;
  }
  uint64_t v4 = sub_1A97F9DF8();
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_7();
  v7();
  uint64_t *v2 = v4;
  v2[1] = v6;
  swift_bridgeObjectRelease();
  if (v2[1])
  {
LABEL_2:
    swift_bridgeObjectRetain();
    sub_1A97F9E08();
    swift_bridgeObjectRelease();
LABEL_4:
    OUTLINED_FUNCTION_15();
    return;
  }
  __break(1u);
}

unint64_t type metadata accessor for PIModelCatalog()
{
  unint64_t result = qword_1E98050F0;
  if (!qword_1E98050F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E98050F0);
  }
  return result;
}

uint64_t sub_1A9683758()
{
  type metadata accessor for PIModelCatalog();
  uint64_t result = sub_1A968510C(v2);
  if (!v0)
  {
    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1(&v4);
    sub_1A97F9F28();
    __swift_project_boxed_opaque_existential_1(&v4, AssociatedTypeWitness);
    v3[3] = swift_getAssociatedTypeWitness();
    v3[4] = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1(v3);
    sub_1A97F9EC8();
    sub_1A97F9EF8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  }
  return result;
}

void PIModelCatalog.inpaintModelURL()()
{
}

void sub_1A9683A10()
{
  OUTLINED_FUNCTION_22();
  unint64_t v5 = v1;
  id v61 = v0;
  uint64_t v6 = v4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = 0xEA0000000000746ELL;
  unint64_t v62 = 0x69746E6961706E69;
  BOOL v8 = v2 == 0x746E6961706E69 && v3 == 0xE700000000000000;
  uint64_t v59 = v4;
  unint64_t v60 = v1;
  if (v8 || (uint64_t v9 = v3, v10 = v2, (sub_1A97FA108() & 1) != 0))
  {
    unint64_t v7 = 0xEA0000000000676ELL;
    goto LABEL_7;
  }
  unint64_t v62 = 0x656D656E69666572;
  BOOL v27 = v10 == 0x656D656E69666572 && v9 == 0xEA0000000000746ELL;
  if (v27 || (sub_1A97FA108() & 1) != 0)
  {
LABEL_7:
    unint64_t v65 = v7;
    uint64_t v11 = sub_1A97F9E68();
    v64 = &v58;
    OUTLINED_FUNCTION_0();
    uint64_t v58 = v12;
    MEMORY[0x1F4188790](v13);
    OUTLINED_FUNCTION_17();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803F00);
    v63 = &v58;
    MEMORY[0x1F4188790](v14 - 8);
    OUTLINED_FUNCTION_16();
    uint64_t v17 = v16 - v15;
    unint64_t v5 = 0x1E4F1C000uLL;
    id v18 = objc_msgSend(self, sel_standardUserDefaults);
    v19 = (void *)sub_1A97F9FB8();
    id v20 = objc_msgSend(v18, sel_objectForKey_, v19);

    if (v20)
    {
      sub_1A97FA058();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v66 = 0u;
      long long v67 = 0u;
    }
    sub_1A9687BDC((uint64_t)&v66, (uint64_t)&v68);
    unint64_t v21 = MEMORY[0x1E4FBC840];
    if (*((void *)&v69 + 1))
    {
      if (swift_dynamicCast())
      {
        if (v71) {
          goto LABEL_37;
        }
LABEL_16:
        id v22 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
        id v23 = sub_1A9686E8C(0xD000000000000013, 0x80000001A9813430);
        if (v23)
        {
          unint64_t v5 = v21;
          id v24 = v23;
          v25 = (void *)sub_1A97F9FB8();
          id v26 = objc_msgSend(v24, sel_objectForKey_, v25);

          if (v26)
          {
            sub_1A97FA058();

            swift_unknownObjectRelease();
          }
          else
          {

            long long v66 = 0u;
            long long v67 = 0u;
          }
          sub_1A9687BDC((uint64_t)&v66, (uint64_t)&v68);
          if (*((void *)&v69 + 1))
          {
            int v30 = swift_dynamicCast();
            uint64_t v32 = *((void *)&v66 + 1);
            uint64_t v31 = v66;
            if (!v30)
            {
              uint64_t v31 = 0;
              uint64_t v32 = 0;
            }
LABEL_36:
            uint64_t v70 = v31;
            uint64_t v71 = v32;
            swift_bridgeObjectRelease();
            if (!v71)
            {
              uint64_t v33 = 1;
              goto LABEL_39;
            }
LABEL_37:
            swift_bridgeObjectRetain();
            sub_1A97F9E08();
            swift_bridgeObjectRelease();
            uint64_t v33 = 0;
LABEL_39:

            __swift_storeEnumTagSinglePayload(v17, v33, 1, v11);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (__swift_getEnumTagSinglePayload(v17, 1, v11) == 1)
            {
              sub_1A9687B7C(v17, &qword_1E9803F00);
              OUTLINED_FUNCTION_26();
            }
            else
            {
              uint64_t v34 = v58;
              v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32);
              v35(v6, v17, v11);
              OUTLINED_FUNCTION_26();
              if (sub_1A9685BD4(v6))
              {
                swift_bridgeObjectRelease();
                v35(v59, v6, v11);
                goto LABEL_48;
              }
              (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v6, v11);
            }
            unint64_t v28 = v65;
            goto LABEL_45;
          }
        }
        else
        {
          long long v68 = 0u;
          long long v69 = 0u;
        }
        sub_1A9687B7C((uint64_t)&v68, &qword_1E9803E80);
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      sub_1A9687B7C((uint64_t)&v68, &qword_1E9803E80);
    }
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    goto LABEL_16;
  }
  unint64_t v28 = 0x80000001A9812D40;
  BOOL v29 = v10 == 0x61746E656D676573 && v9 == 0xEC0000006E6F6974;
  if (v29 || (sub_1A97FA108() & 1) != 0)
  {
    unint64_t v62 = 0xD00000000000001DLL;
LABEL_45:
    uint64_t v36 = sub_1A97F9E68();
    OUTLINED_FUNCTION_0();
    uint64_t v38 = v37;
    MEMORY[0x1F4188790](v39);
    OUTLINED_FUNCTION_16();
    uint64_t v42 = v41 - v40;
    *(void *)&long long v68 = 0;
    id v43 = objc_msgSend(v61, sel_cleanupModelBundleURL_, &v68);
    v44 = (void *)v68;
    if (v43)
    {
      v45 = v43;
      sub_1A97F9E38();
      id v46 = v44;

      *(void *)&long long v68 = v62;
      *((void *)&v68 + 1) = v28;
      sub_1A97F9FE8();
      uint64_t v47 = sub_1A97F9DE8();
      OUTLINED_FUNCTION_0();
      uint64_t v49 = v48;
      MEMORY[0x1F4188790](v50);
      OUTLINED_FUNCTION_18();
      (*(void (**)(unint64_t, void, uint64_t))(v49 + 104))(v5, *MEMORY[0x1E4F276C8], v47);
      sub_1A9687B30();
      sub_1A97F9E58();
      OUTLINED_FUNCTION_7();
      v51();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v36);
    }
    else
    {
      id v52 = (id)v68;
      swift_bridgeObjectRelease();
      sub_1A97F9DD8();

      swift_willThrow();
    }
    goto LABEL_48;
  }
  if (_MergedGlobals_7 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_1A97F9FA8();
  __swift_project_value_buffer(v53, (uint64_t)qword_1E9805100);
  v54 = sub_1A97F9F88();
  os_log_type_t v55 = sub_1A97FA028();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v56 = 0;
    _os_log_impl(&dword_1A9680000, v54, v55, "Unknown model name", v56, 2u);
    MEMORY[0x1AD0F9410](v56, -1, -1);
  }

  sub_1A96859A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(v57, 0xD000000000000012);
LABEL_48:
  OUTLINED_FUNCTION_15();
}

void PIModelCatalog.refinementModelURL()()
{
}

void PIModelCatalog.segmentationModelURL()()
{
}

id sub_1A96842D0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v7 = sub_1A97F9E68();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_18();
  id v11 = a1;
  a4();

  uint64_t v12 = (void *)sub_1A97F9E18();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
  return v12;
}

uint64_t PIModelCatalog.cleanupVersion.getter()
{
  sub_1A96844E8();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PIModelCatalog__metadataVersionInfo);
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1A97FA088();
    sub_1A968472C((uint64_t)v3, v1, &v4);
    swift_bridgeObjectRelease();
    sub_1A9684790((uint64_t)v3);
    if (v5)
    {
      if (swift_dynamicCast()) {
        return 0x6E6F6973726576;
      }
    }
    else
    {
      sub_1A9687B7C((uint64_t)&v4, &qword_1E9803E80);
    }
  }
  return 0;
}

void sub_1A96844E8()
{
  sub_1A9684B34();
  uint64_t v1 = OBJC_IVAR___PIModelCatalog__metadataVersionInfo;
  if (!*(void *)(v0 + OBJC_IVAR___PIModelCatalog__metadataVersionInfo))
  {
    sub_1A9685EB0();
    uint64_t v3 = sub_1A9686394(v2);
    swift_bridgeObjectRelease();
    *(void *)(v0 + v1) = v3;
    swift_bridgeObjectRelease();
  }
}

double sub_1A968472C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_1A968770C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1A9687974(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1A9684790(uint64_t a1)
{
  return a1;
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

uint64_t sub_1A9684828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1A9687750(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t PIModelCatalog.inpaintModelVersion.getter()
{
  return OUTLINED_FUNCTION_10(0x69746E6961706E69);
}

uint64_t sub_1A96848B0(uint64_t a1)
{
  sub_1A96844E8();
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___PIModelCatalog__metadataVersionInfo);
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A97FA088();
  sub_1A968472C((uint64_t)v8, v3, &v9);
  swift_bridgeObjectRelease();
  sub_1A9684790((uint64_t)v8);
  if (!v10)
  {
    sub_1A9687B7C((uint64_t)&v9, &qword_1E9803E80);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803ED0);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = sub_1A9684828(0x6E6F6973726576, 0xE700000000000000, a1);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t PIModelCatalog.refinementModelVersion.getter()
{
  return OUTLINED_FUNCTION_10(0x656D656E69666572);
}

id sub_1A9684A28(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    OUTLINED_FUNCTION_29();
    uint64_t v7 = (void *)sub_1A97F9FB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

uint64_t PIModelCatalog.segmentationModelVersion.getter()
{
  return sub_1A96848B0(0xD00000000000001DLL);
}

id PIModelCatalog.init()()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString);
  *uint64_t v1 = 0;
  v1[1] = 0;
  *(void *)(v0 + OBJC_IVAR___PIModelCatalog__metadataVersionInfo) = 0;
  v4.super_class = (Class)PIModelCatalog;
  id v2 = objc_msgSendSuper2(&v4, sel_init);
  sub_1A9684B34();
  sub_1A96844E8();

  return v2;
}

void sub_1A9684B34()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString);
  if (!*(void *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString + 8))
  {
    sub_1A97F9E68();
    OUTLINED_FUNCTION_0();
    MEMORY[0x1F4188790](v2);
    OUTLINED_FUNCTION_5();
    type metadata accessor for PIModelCatalog();
    sub_1A9683758();
    uint64_t v3 = sub_1A97F9DF8();
    uint64_t v5 = v4;
    uint64_t v6 = OUTLINED_FUNCTION_29();
    v7(v6);
    *uint64_t v1 = v3;
    v1[1] = v5;
    swift_bridgeObjectRelease();
  }
}

uint64_t PIModelCatalog.ModelLoadingError.errorDescription.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1A9684E3C(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  return v1;
}

uint64_t sub_1A9684E3C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A9684E58()
{
  return sub_1A97F9DA8();
}

uint64_t sub_1A9684E70()
{
  return sub_1A97F9DB8();
}

uint64_t sub_1A9684E88()
{
  return sub_1A97F9D98();
}

uint64_t PIModelCatalog.downloadCleanupModelBundle()()
{
  return OUTLINED_FUNCTION_9((uint64_t)sub_1A9684EC4);
}

uint64_t sub_1A9684EC4()
{
  OUTLINED_FUNCTION_21();
  type metadata accessor for PIModelCatalog();
  sub_1A968510C((uint64_t *)(v0 + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A9684F60;
  return sub_1A96851A4(v0 + 16);
}

uint64_t sub_1A9684F60()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_3();
  *(void *)(v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A96850AC;
  }
  else {
    uint64_t v2 = sub_1A968504C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A968504C()
{
  OUTLINED_FUNCTION_21();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A96850AC()
{
  OUTLINED_FUNCTION_21();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A968510C@<X0>(uint64_t *a1@<X8>)
{
  sub_1A97F9EB8();
  uint64_t v2 = v8;
  uint64_t v3 = v9;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v7, v8);
  a1[3] = v2;
  a1[4] = *(void *)(v3 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v4, v2);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
}

uint64_t sub_1A96851A4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_9((uint64_t)sub_1A96851BC);
}

uint64_t sub_1A96851BC()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = sub_1A97F9ED8();
  v0[3] = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  v0[4] = v3;
  uint64_t v5 = swift_task_alloc();
  v0[5] = v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_1A97F9EE8();
  sub_1A97F9EA8();
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 16))(v6, v5, v2);
  (*(void (**)(uint64_t *, uint64_t))(v4 + 88))(v6, v2);
  if (!MEMORY[0x1E4F78CB8] || (OUTLINED_FUNCTION_4(), !v7))
  {
    if (MEMORY[0x1E4F78CA8] && (OUTLINED_FUNCTION_4(), v7) || MEMORY[0x1E4F78CA0] && (OUTLINED_FUNCTION_4(), v7))
    {
      uint64_t v13 = OUTLINED_FUNCTION_2();
      v14(v13);
      uint64_t v15 = *v6;
      uint64_t v16 = v6[1];
      sub_1A96859A0();
      uint64_t v17 = (void *)swift_allocError();
      *(void *)uint64_t v18 = v15;
      *(void *)(v18 + 8) = v16;
      *(unsigned char *)(v18 + 16) = 0;
    }
    else
    {
      if (!MEMORY[0x1E4F78CB0] || (OUTLINED_FUNCTION_4(), !v7))
      {
        sub_1A96859A0();
        uint64_t v17 = (void *)swift_allocError();
        OUTLINED_FUNCTION_30(v26, (uint64_t)"Model not supported on current device or OS variant.");
        *(unsigned char *)(v27 + 16) = 0;
        swift_willThrow();
        unint64_t v28 = *(void (**)(uint64_t))(v4 + 8);
        uint64_t v29 = OUTLINED_FUNCTION_8();
        v28(v29);
        ((void (*)(uint64_t *, uint64_t))v28)(v6, v2);
        goto LABEL_17;
      }
      uint64_t v19 = OUTLINED_FUNCTION_2();
      v20(v19);
      uint64_t v21 = *v6;
      uint64_t v22 = v6[1];
      sub_1A96859A0();
      uint64_t v17 = (void *)swift_allocError();
      *(void *)uint64_t v23 = v21;
      *(void *)(v23 + 8) = v22;
      *(unsigned char *)(v23 + 16) = 3;
    }
    swift_willThrow();
    uint64_t v24 = OUTLINED_FUNCTION_8();
    v25(v24);
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    type metadata accessor for PIModelCatalog();
    sub_1A9686778();

    int v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
  uint64_t v8 = v0[2];
  uint64_t v9 = OUTLINED_FUNCTION_2();
  v10(v9);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v0[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EA0);
  OUTLINED_FUNCTION_0();
  v0[7] = v11;
  v0[8] = OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EA8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1A980ADD0;
  sub_1A9686BDC(v8, v12 + 32);
  sub_1A97F9E98();
  swift_bridgeObjectRelease();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EB0);
  v0[9] = v32;
  v0[10] = *(void *)(v32 - 8);
  v0[11] = OUTLINED_FUNCTION_27();
  sub_1A97FA008();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EB8);
  v0[12] = OUTLINED_FUNCTION_27();
  uint64_t v33 = (void *)swift_task_alloc();
  v0[13] = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_1A9685654;
  uint64_t v34 = OUTLINED_FUNCTION_23();
  return MEMORY[0x1F4187D58](v34);
}

uint64_t sub_1A9685654()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_3();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A9685728, 0, 0);
}

uint64_t sub_1A9685728()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = sub_1A97F9F68();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    uint64_t v3 = v0[8];
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v7 = v0[4];
    uint64_t v6 = v0[5];
    uint64_t v8 = v0[3];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v11 = *(void *)(v2 - 8);
    uint64_t v12 = OUTLINED_FUNCTION_27();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v1, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EC0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1A980ADD0;
    sub_1A97F9F58();
    *(void *)(v13 + 56) = MEMORY[0x1E4FBB3D0];
    *(void *)(v13 + 32) = v14;
    sub_1A97FA158();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v2);
    swift_task_dealloc();
    uint64_t v15 = (void *)swift_task_alloc();
    v0[13] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_1A9685654;
    uint64_t v16 = OUTLINED_FUNCTION_23();
    return MEMORY[0x1F4187D58](v16);
  }
}

unint64_t sub_1A96859A0()
{
  unint64_t result = qword_1E9803E98;
  if (!qword_1E9803E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9803E98);
  }
  return result;
}

uint64_t _s17ModelLoadingErrorOwxx(uint64_t a1)
{
  return sub_1A9685A00(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1A9685A00(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17ModelLoadingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_14(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(unsigned char *)(v2 + 16) = v5;
  return v2;
}

uint64_t _s17ModelLoadingErrorOwca(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_14(a1, a2);
  uint64_t v6 = *(void *)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(v2 + 16);
  *(unsigned char *)(v2 + 16) = v5;
  sub_1A9685A00(v6, v7, v8);
  return v2;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s17ModelLoadingErrorOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A9685A00(v4, v5, v6);
  return a1;
}

uint64_t _s17ModelLoadingErrorOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
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

uint64_t _s17ModelLoadingErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A9685B6C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1A9685B78(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PIModelCatalog.ModelLoadingError()
{
  return &type metadata for PIModelCatalog.ModelLoadingError;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1A9685BD4(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_defaultManager);
  sub_1A97F9E48();
  unsigned int v3 = (void *)sub_1A97F9FB8();
  swift_bridgeObjectRelease();
  unint64_t v4 = (unint64_t)objc_msgSend(v2, sel_fileExistsAtPath_, v3);

  if ((v4 & 1) == 0)
  {
    if (_MergedGlobals_7 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1A97F9FA8();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E9805100);
    uint64_t v6 = sub_1A97F9E68();
    uint64_t v31 = v27;
    OUTLINED_FUNCTION_0();
    uint64_t v8 = v7;
    uint64_t v10 = *(void *)(v9 + 64);
    MEMORY[0x1F4188790](v11);
    unint64_t v12 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v13((char *)v27 - v12, a1, v6);
    uint64_t v14 = sub_1A97F9F88();
    os_log_type_t v15 = sub_1A97FA028();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      os_log_t v28 = v14;
      uint64_t v17 = (uint8_t *)v16;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v29 = v18;
      v27[0] = v27;
      uint64_t v33 = v18;
      unsigned int v30 = v4;
      *(_DWORD *)uint64_t v17 = 136446210;
      v27[1] = v17 + 4;
      MEMORY[0x1F4188790](v18);
      v13((char *)v27 - v12, (uint64_t)v27 - v12, v6);
      uint64_t v19 = sub_1A97F9FC8();
      uint64_t v32 = sub_1A9686EF0(v19, v20, &v33);
      unint64_t v4 = v30;
      sub_1A97FA038();
      swift_bridgeObjectRelease();
      uint64_t v21 = OUTLINED_FUNCTION_25();
      v22(v21);
      os_log_t v23 = v28;
      _os_log_impl(&dword_1A9680000, v28, v15, "Override model path for inpainting is present, but model was not found at path: %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_11();
    }
    else
    {
      uint64_t v24 = OUTLINED_FUNCTION_25();
      v25(v24);
    }
  }
  return v4;
}

void sub_1A9685EB0()
{
  OUTLINED_FUNCTION_22();
  v35[4] = *MEMORY[0x1E4F143B8];
  if (*(void *)(v0 + OBJC_IVAR___PIModelCatalog__cleanupModelBundleURLString + 8))
  {
    uint64_t v2 = sub_1A97F9E68();
    uint64_t v31 = &v28;
    OUTLINED_FUNCTION_0();
    uint64_t v4 = v3;
    uint64_t v6 = *(void *)(v5 + 64);
    MEMORY[0x1F4188790](v7);
    swift_bridgeObjectRetain();
    sub_1A97F9E08();
    uint64_t v8 = swift_bridgeObjectRelease();
    MEMORY[0x1F4188790](v8);
    sub_1A97F9E28();
    sub_1A97F9E78();
    if (v1)
    {
      uint64_t v9 = *(void (**)(void))(v4 + 8);
      OUTLINED_FUNCTION_13();
      v9();
      OUTLINED_FUNCTION_13();
      v9();
LABEL_16:
      OUTLINED_FUNCTION_26();
      goto LABEL_17;
    }
    os_log_t v28 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = v4;
    unsigned int v30 = &v28;
    unint64_t v12 = self;
    uint64_t v13 = (void *)sub_1A97F9E88();
    *(void *)&v34[0] = 0;
    id v14 = objc_msgSend(v12, sel_JSONObjectWithData_options_error_, v13, 0, v34);

    id v15 = *(id *)&v34[0];
    if (v14)
    {
      sub_1A97FA058();
      swift_unknownObjectRelease();
      sub_1A9687974((uint64_t)v35, (uint64_t)v34);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EE0);
      uint64_t v16 = v2;
      if (swift_dynamicCast())
      {
        sub_1A9686758(v32, &v32);
        swift_bridgeObjectRelease();
        uint64_t v17 = v29;
        if (v33)
        {
          sub_1A9687A2C(&v32, v34);
          sub_1A9687974((uint64_t)v34, (uint64_t)&v32);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803EF0);
          if (swift_dynamicCast())
          {
            OUTLINED_FUNCTION_20();
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
            uint64_t v18 = *(void (**)(void))(v17 + 8);
            OUTLINED_FUNCTION_7();
            v18();
            OUTLINED_FUNCTION_7();
            v18();
            OUTLINED_FUNCTION_26();
            goto LABEL_17;
          }
          sub_1A96859A0();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_19();
          OUTLINED_FUNCTION_6(v26, v25 | 4);
          OUTLINED_FUNCTION_20();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
        }
        else
        {
          sub_1A9687B7C((uint64_t)&v32, &qword_1E9803E80);
          *(void *)&v34[0] = 0;
          *((void *)&v34[0] + 1) = 0xE000000000000000;
          sub_1A97FA098();
          swift_bridgeObjectRelease();
          *(void *)&v34[0] = 0xD000000000000018;
          *((void *)&v34[0] + 1) = 0x80000001A9813090;
          sub_1A9687AEC();
          sub_1A97FA0F8();
          sub_1A97F9FE8();
          swift_bridgeObjectRelease();
          long long v23 = v34[0];
          sub_1A96859A0();
          OUTLINED_FUNCTION_1();
          *(_OWORD *)uint64_t v24 = v23;
          *(unsigned char *)(v24 + 16) = 0;
          swift_willThrow();
          OUTLINED_FUNCTION_20();
        }
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
        uint64_t v27 = *(void (**)(void))(v17 + 8);
        OUTLINED_FUNCTION_7();
        v27();
        ((void (*)(char *, uint64_t))v27)(v28, v16);
        goto LABEL_16;
      }
      sub_1A96859A0();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_6(v22, v21 + 8);
      OUTLINED_FUNCTION_20();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
      unint64_t v20 = *(void (**)(void))(v29 + 8);
      OUTLINED_FUNCTION_13();
      v20();
    }
    else
    {
      uint64_t v19 = v15;
      sub_1A97F9DD8();

      swift_willThrow();
      OUTLINED_FUNCTION_20();
      unint64_t v20 = *(void (**)(void))(v29 + 8);
      OUTLINED_FUNCTION_13();
      v20();
    }
    OUTLINED_FUNCTION_13();
    v20();
    goto LABEL_16;
  }
  sub_1A96859A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(v11, v10 + 15);
LABEL_17:
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1A9686394(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803ED8);
    uint64_t v2 = sub_1A97FA0D8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
    id v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1A9687974(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1A9687A2C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1A9687A2C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1A9687A2C(v36, v37);
    sub_1A9687A2C(v37, &v33);
    uint64_t result = sub_1A97FA068();
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
    uint64_t result = (uint64_t)sub_1A9687A2C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v21));
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
    sub_1A9687A3C();
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

double sub_1A9686758@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_1A9687974(a1 + 32, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

void sub_1A9686778()
{
  OUTLINED_FUNCTION_22();
  uint64_t v2 = v1;
  uint64_t v39 = sub_1A97F9F48();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v3;
  uint64_t v5 = *(void *)(v4 + 64);
  ((void (*)(void))MEMORY[0x1F4188790])();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  uint64_t v6 = sub_1A97F9F18();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_17();
  sub_1A97F9F38();
  sub_1A97F9F08();
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  MEMORY[0x1F4188790](v9);
  unint64_t v10 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v38;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v10, v10, v39);
  (*(void (**)(char *, uint64_t))(v11 + 88))(v10, v39);
  if (!MEMORY[0x1E4F78D08] || (OUTLINED_FUNCTION_4(), !v12))
  {
    if (!MEMORY[0x1E4F78D10] || (OUTLINED_FUNCTION_4(), !v12))
    {
      if (MEMORY[0x1E4F78D18] && (OUTLINED_FUNCTION_4(), v12))
      {
        sub_1A96859A0();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_30(v29, (uint64_t)"subscription complete but model asset missing");
      }
      else
      {
        if (!MEMORY[0x1E4F78D20] || (OUTLINED_FUNCTION_4(), !v12))
        {
          if (MEMORY[0x1E4F78D00] && (OUTLINED_FUNCTION_4(), v12))
          {
            sub_1A96859A0();
            OUTLINED_FUNCTION_1();
            OUTLINED_FUNCTION_24();
            long long v33 = "non network error occured when fetching model";
          }
          else
          {
            if (!MEMORY[0x1E4F78CF8] || (OUTLINED_FUNCTION_4(), !v12))
            {
              sub_1A96859A0();
              OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_12(v35, 0xD00000000000001BLL);
              uint64_t v36 = *(void (**)(void))(v11 + 8);
              OUTLINED_FUNCTION_7();
              v36();
              ((void (*)(char *, uint64_t))v36)(v10, v39);
              goto LABEL_30;
            }
            sub_1A96859A0();
            OUTLINED_FUNCTION_1();
            unint64_t v32 = 0xD000000000000021;
            long long v33 = "network error when fetching model";
          }
          *(void *)uint64_t v26 = v32;
          *(void *)(v26 + 8) = (unint64_t)(v33 - 32) | 0x8000000000000000;
          char v28 = 1;
          goto LABEL_27;
        }
        sub_1A96859A0();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_24();
        *(void *)uint64_t v30 = v31 - 27;
        *(void *)(v30 + 8) = 0x80000001A9812F20;
      }
      *(unsigned char *)(v30 + 16) = 0;
LABEL_28:
      swift_willThrow();
      OUTLINED_FUNCTION_7();
      v34();
      goto LABEL_30;
    }
    sub_1A96859A0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_24();
    *(void *)uint64_t v26 = v27 + 3;
    *(void *)(v26 + 8) = 0x80000001A9812F70;
    char v28 = 3;
LABEL_27:
    *(unsigned char *)(v26 + 16) = v28;
    goto LABEL_28;
  }
  (*(void (**)(char *, uint64_t))(v11 + 96))(v10, v39);
  uint64_t v13 = sub_1A97F9F78();
  uint64_t v37 = (uint64_t)&v37;
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_16();
  uint64_t v19 = v18 - v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18 - v17, v10, v13);
  sub_1A9686C68(v19);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  sub_1A96859A0();
  OUTLINED_FUNCTION_1();
  *(void *)uint64_t v24 = v21;
  *(void *)(v24 + 8) = v23;
  *(unsigned char *)(v24 + 16) = 1;
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  OUTLINED_FUNCTION_7();
  v25();
LABEL_30:
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1A9686BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_1A9686C68(uint64_t a1)
{
  uint64_t v3 = sub_1A97F9F78();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v3);
  uint64_t v6 = OUTLINED_FUNCTION_29();
  v7(v6);
  if (!MEMORY[0x1E4F78D50] || (OUTLINED_FUNCTION_28(), !v8))
  {
    if (!MEMORY[0x1E4F78D48] || (OUTLINED_FUNCTION_28(), !v8))
    {
      if (!MEMORY[0x1E4F78D58] || (OUTLINED_FUNCTION_28(), !v8))
      {
        if (!MEMORY[0x1E4F78D40] || (OUTLINED_FUNCTION_28(), !v8))
        {
          OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_13();
          v9();
        }
      }
    }
  }
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_1A9686E8C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_1A97F9FB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1A9686EF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A9686FC4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A9687974((uint64_t)v12, *a3);
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
      sub_1A9687974((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1A9686FC4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1A968711C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1A97FA048();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1A96871F4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1A97FA0B8();
    if (!v8)
    {
      uint64_t result = sub_1A97FA0C8();
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

void *sub_1A968711C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A97FA0E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1A96871F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A968728C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1A9687468(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1A9687468((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A968728C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1A97F9FF8();
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
  unint64_t v3 = sub_1A9687400(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1A97FA0A8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1A97FA0E8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1A97FA0C8();
  __break(1u);
  return result;
}

void *sub_1A9687400(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803F08);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1A9687468(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803F08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  char v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A9687618(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A9687540(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1A9687540(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A97FA0E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1A9687618(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1A97FA0E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

unint64_t sub_1A968770C(uint64_t a1)
{
  uint64_t v2 = sub_1A97FA068();
  return sub_1A96877C8(a1, v2);
}

unint64_t sub_1A9687750(uint64_t a1, uint64_t a2)
{
  sub_1A97FA168();
  sub_1A97F9FD8();
  uint64_t v4 = sub_1A97FA178();
  return sub_1A9687890(a1, a2, v4);
}

unint64_t sub_1A96877C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1A96879D0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1AD0F77E0](v9, a1);
      sub_1A9684790((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1A9687890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A97FA108() & 1) == 0)
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
      while (!v14 && (sub_1A97FA108() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A9687974(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A96879D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_1A9687A2C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A9687A3C()
{
  return swift_release();
}

uint64_t sub_1A9687A44(uint64_t a1, unint64_t a2)
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

unint64_t sub_1A9687AEC()
{
  unint64_t result = qword_1E9803EE8;
  if (!qword_1E9803EE8)
  {
    sub_1A97F9E68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9803EE8);
  }
  return result;
}

unint64_t sub_1A9687B30()
{
  unint64_t result = qword_1E9803EF8;
  if (!qword_1E9803EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9803EF8);
  }
  return result;
}

uint64_t sub_1A9687B7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A9687BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9803E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x1AD0F9410);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return sub_1A96848B0(a1);
}

void OUTLINED_FUNCTION_11()
{
  JUMPOUT(0x1AD0F9410);
}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 3;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  return sub_1A9684E3C(v4, v5, v3);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_1A9687A44(v1, v0);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

void OUTLINED_FUNCTION_30(unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  *a1 = v2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = (a2 - 32) | 0x8000000000000000;
}

uint64_t __NUAssertLogger_block_invoke()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_173);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_75);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_18773);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_162);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25594);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26516);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_153()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_160);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_163()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A968C66C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

id NUAssertLogger_267()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_286);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NULogger()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_161);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NULogger_block_invoke_281()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_289()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_343()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_159);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_352()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_433()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_102);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_442()
{
  return MEMORY[0x1F4130BA0]();
}

id DictionaryRepresentationFromObservation(void *a1, _OWORD *a2)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  [a1 boundingBox];
  long long v3 = a2[1];
  *(_OWORD *)&v13.a = *a2;
  *(_OWORD *)&v13.c = v3;
  *(_OWORD *)&v13.tx = a2[2];
  CGRect v18 = CGRectApplyAffineTransform(v17, &v13);
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  v14[0] = @"x";
  char v7 = [NSNumber numberWithDouble:v18.origin.x];
  v15[0] = v7;
  v14[1] = @"y";
  int64_t v8 = [NSNumber numberWithDouble:y];
  v15[1] = v8;
  v14[2] = @"w";
  uint64_t v9 = [NSNumber numberWithDouble:width];
  v15[2] = v9;
  v14[3] = @"h";
  uint64_t v10 = [NSNumber numberWithDouble:height];
  v15[3] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v11;
}

uint64_t __NULogger_block_invoke_486()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_566()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_583);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_586()
{
  return MEMORY[0x1F4130BA0]();
}

__CFString *PISemanticStyleCastFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = @"Standard";
  if (([v1 isEqualToString:@"Standard"] & 1) == 0)
  {
    uint64_t v2 = @"TanWarm";
    if (([v1 isEqualToString:@"TanWarm"] & 1) == 0)
    {
      uint64_t v2 = @"BlushWarm";
      if (([v1 isEqualToString:@"BlushWarm"] & 1) == 0)
      {
        uint64_t v2 = @"Neutral";
        if (([v1 isEqualToString:@"Neutral"] & 1) == 0)
        {
          uint64_t v2 = @"Cool";
          if (([v1 isEqualToString:@"Cool"] & 1) == 0)
          {
            uint64_t v2 = @"NoFilter";
            if (([v1 isEqualToString:@"NoFilter"] & 1) == 0)
            {
              uint64_t v2 = @"WarmAuthentic";
              if (([v1 isEqualToString:@"WarmAuthentic"] & 1) == 0)
              {
                uint64_t v2 = @"StarkBW";
                if (([v1 isEqualToString:@"StarkBW"] & 1) == 0)
                {
                  uint64_t v2 = @"Colorful";
                  if (([v1 isEqualToString:@"Colorful"] & 1) == 0)
                  {
                    uint64_t v2 = @"UrbanCool";
                    if (([v1 isEqualToString:@"UrbanCool"] & 1) == 0)
                    {
                      uint64_t v2 = @"Earthy";
                      if (([v1 isEqualToString:@"Earthy"] & 1) == 0)
                      {
                        uint64_t v2 = @"CloudCover";
                        if (([v1 isEqualToString:@"CloudCover"] & 1) == 0)
                        {
                          uint64_t v2 = @"DreamyHues";
                          if (([v1 isEqualToString:@"DreamyHues"] & 1) == 0)
                          {
                            uint64_t v2 = @"GoldWarm";
                            if (([v1 isEqualToString:@"GoldWarm"] & 1) == 0)
                            {
                              uint64_t v2 = @"LongGray";
                              if (![v1 isEqualToString:@"LongGray"]) {
                                uint64_t v2 = @"None";
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v2;
}

uint64_t PISemanticStyleCastIsEqual(void *a1, const char *a2)
{
  return [a1 isEqualToString:a2];
}

uint64_t PISemanticStyleIsIdentity(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"None"];
}

uint64_t PISemanticStyleIsRenderSupported()
{
  if ([MEMORY[0x1E4F7A4A0] overrideSemanticStylesHardwareCheck]) {
    return 1;
  }
  id v1 = [MEMORY[0x1E4F7A5E0] currentPlatform];
  int v2 = [v1 supportsANE];

  if (!v2) {
    return 0;
  }
  long long v3 = [MEMORY[0x1E4F7A5E0] currentPlatform];
  uint64_t v4 = [v3 mainDevice];
  BOOL v0 = (unint64_t)[v4 family] > 6;

  return v0;
}

id PISemanticStyleCastToMakerNoteString(void *a1)
{
  v23[15] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)*MEMORY[0x1E4F55DA8];
  v22[0] = @"Standard";
  v22[1] = @"NoFilter";
  uint64_t v2 = *MEMORY[0x1E4F55DA0];
  v23[0] = v1;
  v23[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F55DC8];
  v22[2] = @"WarmAuthentic";
  v22[3] = @"StarkBW";
  uint64_t v4 = *MEMORY[0x1E4F55DB0];
  v23[2] = v3;
  v23[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F55D68];
  v22[4] = @"Colorful";
  v22[5] = @"DreamyHues";
  uint64_t v6 = *MEMORY[0x1E4F55D78];
  v23[4] = v5;
  v23[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4F55DC0];
  v22[6] = @"UrbanCool";
  v22[7] = @"Earthy";
  uint64_t v8 = *MEMORY[0x1E4F55D80];
  v23[6] = v7;
  v23[7] = v8;
  uint64_t v9 = *MEMORY[0x1E4F55D60];
  v22[8] = @"CloudCover";
  v22[9] = @"LongGray";
  uint64_t v10 = *MEMORY[0x1E4F55D90];
  v23[8] = v9;
  v23[9] = v10;
  uint64_t v11 = *MEMORY[0x1E4F55DB8];
  v22[10] = @"TanWarm";
  v22[11] = @"BlushWarm";
  uint64_t v12 = *MEMORY[0x1E4F55D58];
  v23[10] = v11;
  v23[11] = v12;
  uint64_t v13 = *MEMORY[0x1E4F55D88];
  v22[12] = @"GoldWarm";
  v22[13] = @"Neutral";
  uint64_t v14 = *MEMORY[0x1E4F55D98];
  v23[12] = v13;
  v23[13] = v14;
  v22[14] = @"Cool";
  v23[14] = *MEMORY[0x1E4F55D70];
  uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
  id v16 = a1;
  CGRect v17 = [v15 dictionaryWithObjects:v23 forKeys:v22 count:15];
  CGRect v18 = [v17 objectForKeyedSubscript:v16];

  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v1;
  }
  id v20 = v19;

  return v20;
}

id PISemanticStyleMakerNotePropertiesFromSettings(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [v1 objectForKeyedSubscript:@"version"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F155F8]];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
    }
    uint64_t v4 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v3;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Expected a valid version value from settings but got %@, skipping", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v3 = 0;
  }
  uint64_t v5 = [v1 objectForKeyedSubscript:@"tone"];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F15600]];

  uint64_t v6 = [v1 objectForKeyedSubscript:@"color"];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F155E0]];

  uint64_t v7 = [v1 objectForKeyedSubscript:@"intensity"];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F155E8]];

  uint64_t v8 = [v1 objectForKeyedSubscript:@"cast"];
  uint64_t v9 = PISemanticStyleCastToMakerNoteString(v8);

  if (v3) {
    uint64_t v10 = [v3 unsignedIntValue];
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F55F08], "makerNoteTagForSmartStyleCastType:smartStyleVersion:", v9, v10));
  [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F155D8]];

  [v2 setObject:&unk_1F0009728 forKeyedSubscript:*MEMORY[0x1E4F155F0]];
  return v2;
}

uint64_t __NULogger_block_invoke_739()
{
  return MEMORY[0x1F4130BA0]();
}

id PISemanticStyleSettingsFromMakerNoteProperties(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F155F8]];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
      }
      uint64_t v4 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = (uint64_t)v3;
        _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Invalid style version value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v3 = 0;
    }
  }
  [v2 setObject:v3 forKeyedSubscript:@"version"];
  uint64_t v5 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F155D8]];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
      }
      uint64_t v6 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = (uint64_t)v5;
        _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Invalid style cast value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v5 = 0;
    }
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F55F08], "smartStyleCastForMakerNoteTag:smartStyleVersion:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v3, "unsignedIntValue"));
  if (!v7)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
    }
    uint64_t v8 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      id v16 = v8;
      uint64_t v17 = [v5 unsignedIntegerValue];
      int v18 = [v3 unsignedIntValue];
      int v19 = 134218240;
      uint64_t v20 = v17;
      __int16 v21 = 1024;
      int v22 = v18;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Invalid style cast: %lu (%u), ignored.", (uint8_t *)&v19, 0x12u);
    }
  }
  [v2 setObject:v7 forKeyedSubscript:@"cast"];
  uint64_t v9 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F15600]];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
      }
      uint64_t v10 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = (uint64_t)v9;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Invalid style tone value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v9 = 0;
    }
  }
  [v2 setObject:v9 forKeyedSubscript:@"tone"];
  uint64_t v11 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F155E0]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
      }
      uint64_t v12 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = (uint64_t)v11;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Invalid style color value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v11 = 0;
    }
  }
  [v2 setObject:v11 forKeyedSubscript:@"color"];
  int v13 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F155E8]];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_734);
      }
      uint64_t v14 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = (uint64_t)v13;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Invalid style intensity value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      int v13 = 0;
    }
  }
  [v2 setObject:v13 forKeyedSubscript:@"intensity"];

  return v2;
}

id PISemanticStyleCurrentMetadataVersion()
{
  BOOL v0 = (void *)[objc_alloc(MEMORY[0x1E4F7A6D0]) initWithMajor:0 minor:14];
  return v0;
}

id PISemanticStyleCurrentRenderingVersion()
{
  BOOL v0 = (void *)[objc_alloc(MEMORY[0x1E4F7A6D0]) initWithMajor:1 minor:0];
  return v0;
}

id NUAssertLogger_794()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_122);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_820()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9692F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_930()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_944()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_1030()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_33);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_1044()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_1087()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_104);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_1101()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_1109()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_1215()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_187);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_1218()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_1270()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_1335()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_1354);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_1357()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_1384()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_1504()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_1518()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_1522);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_1524()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_1601()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A969EA64(_Unwind_Exception *a1)
{
}

id NUAssertLogger_1604()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void sub_1A969F000(_Unwind_Exception *a1)
{
}

void sub_1A969F18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

id NUAssertLogger_1960()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_435);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_1970()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_2079()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_2110()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2141);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_2144()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_2213()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_35);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_2227()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_2318()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_2370()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_2426()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96A88CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __NULogger_block_invoke_2468()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_2645()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_110);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_2660()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_2767()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2784);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_2787()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_3054()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_3067()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_3172()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_3232()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3251);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_3254()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_3385()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_137);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_3420()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_3461()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_3577()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_3592()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_3595()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3562);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_3758()
{
  return MEMORY[0x1F4130BA0]();
}

__CFString *PIParallaxStyleClockFontForKind(void *a1)
{
  v13[13] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F8D020];
  v12[0] = *MEMORY[0x1E4F8D030];
  v12[1] = v1;
  v13[0] = @"SF Soft Time";
  v13[1] = @"SF Soft Time";
  uint64_t v2 = *MEMORY[0x1E4F8CFD8];
  v12[2] = *MEMORY[0x1E4F8D028];
  void v12[3] = v2;
  v13[2] = @"SF Rounded Time";
  v13[3] = @"New York Time";
  uint64_t v3 = *MEMORY[0x1E4F8CFE8];
  v12[4] = *MEMORY[0x1E4F8CFD0];
  v12[5] = v3;
  v13[4] = @"New York Time";
  v13[5] = @"ADT Slab Time";
  uint64_t v4 = *MEMORY[0x1E4F8CFF8];
  v12[6] = *MEMORY[0x1E4F8CFE0];
  v12[7] = v4;
  v13[6] = @"ADT Slab Time";
  v13[7] = @"SF Stencil Time";
  uint64_t v5 = *MEMORY[0x1E4F8D000];
  v12[8] = *MEMORY[0x1E4F8CFF0];
  v12[9] = v5;
  v13[8] = @"SF Rail Time";
  v13[9] = @"ADT Slab Time";
  uint64_t v6 = *MEMORY[0x1E4F8D008];
  v12[10] = *MEMORY[0x1E4F8D018];
  v12[11] = v6;
  v13[10] = @"New York Heavy";
  v13[11] = @"SF Soft Time";
  v12[12] = *MEMORY[0x1E4F8D010];
  v13[12] = @"New York Heavy";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a1;
  uint64_t v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:13];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10) {
    uint64_t v10 = @"SF Soft Time";
  }

  return v10;
}

id NUAssertLogger_3803()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_3871()
{
  return MEMORY[0x1F4130BA0]();
}

__CFString *PIParallaxStyleTonalityDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unspecified Key";
  }
  else {
    return off_1E5D7F0E0[a1 - 1];
  }
}

uint64_t PIParallaxStyleTonalityFromMedianLuminance(double a1)
{
  uint64_t v1 = 3;
  if (a1 < 0.67) {
    uint64_t v1 = 2;
  }
  if (a1 < 0.33) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t PIParallaxStylePrefersVibrantClockForKind(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F8CFD8]]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F8CFD0]] ^ 1;
  }

  return v2;
}

id NUAssertLogger_4065()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_813);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_4106()
{
  return MEMORY[0x1F4130BA0]();
}

id NULogger_4131()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_815);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NULogger_block_invoke_4134()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96C411C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A96C4A54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *PIPosterSettlingEffectStatusDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E5D7F160[a1 - 1];
  }
}

id NUAssertLogger_4398()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_50);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_4419()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_4658()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_318);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_4676()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96CA714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__4677(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4678(uint64_t a1)
{
}

uint64_t __NULogger_block_invoke_4752()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_4957()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_125);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_4986()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_5054()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_5109);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_5092()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_5112()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_5247()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_275);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_5280()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_5391()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_5469()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_5508()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96D8284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5756(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5757(uint64_t a1)
{
}

id NUAssertLogger_5758()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_5772()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_5795()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96D8984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A96D9674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 128));
  _Unwind_Resume(a1);
}

void sub_1A96DA944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A96DB970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1A96DC848(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_6017()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_50_6052);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_6055()
{
  return MEMORY[0x1F4130BA0]();
}

double *GUTemp_to_xy(double *result, double *a2, double a3)
{
  if (a3 < 2000.0) {
    a3 = 2000.0;
  }
  double v3 = 50000.0;
  if (a3 <= 50000.0) {
    double v3 = a3;
  }
  double v4 = 1000.0 / (v3 * 1.4388 / 1.438);
  if (v3 >= 4500.0)
  {
    double v7 = v4 * v4;
    double v8 = v4 * (v4 * v4);
    if (v3 >= 7000.0)
    {
      double v5 = v7 * 1.9018 + v8 * -2.0064 + v4 * 0.24748;
      double v6 = 0.23704;
    }
    else
    {
      double v5 = v7 * 2.9678 + v8 * -4.607 + v4 * 0.09911;
      double v6 = 0.244063;
    }
  }
  else
  {
    double v5 = v4 * 1.0874 + v4 * v4 * -0.6734;
    double v6 = 0.15259;
  }
  double v9 = v5 + v6;
  if (v9 <= 0.35)
  {
    double v10 = v9 * 2.87 + v9 * -3.0 * v9;
    double v11 = -0.2751;
  }
  else
  {
    double v10 = v9 * (v9 * -1.05) + v9 * (v9 * -1.3295) * v9 + v9 * 2.0;
    double v11 = -0.15247;
  }
  *unint64_t result = v9;
  *a2 = v10 + v11;
  return result;
}

double GUGetAdaptationMatrix(double *a1, double *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = a1[1];
  double v4 = a1[2];
  double v5 = v3 * 0.2664 + *a1 * 0.8951 + v4 * -0.1614;
  double v6 = v3 * 1.7135 + *a1 * -0.7502 + v4 * 0.0367;
  double v7 = v3 * -0.0685 + *a1 * 0.0389 + v4 * 1.0296;
  uint64_t v11 = 0;
  uint64_t v14 = 0;
  long long v13 = 0u;
  long long v10 = 0u;
  double v9 = 0.99631656 / v5;
  double v12 = 1.02043099 / v6;
  double v15 = 0.81832442 / v7;
  GUMatrixMatrix(GUGetAdaptationMatrix_Bradford_mtx, &v9, a2);
  return GUMatrixMatrix(a2, GUGetAdaptationMatrix_invBradford_mtx, a2);
}

double GUInvertMatrix(double *a1, double *a2)
{
  double result = *a1;
  double v3 = a1[1];
  double v5 = a1[2];
  double v4 = a1[3];
  double v6 = a1[4];
  double v7 = a1[5];
  double v8 = a1[6];
  double v9 = a1[7];
  double v10 = a1[8];
  double v11 = -(*a1 * v7);
  double v12 = v5 * -(v8 * v6) + *a1 * v6 * v10 + v5 * v4 * v9 + -(v4 * v3) * v10 + v3 * v7 * v8 + v11 * v9;
  if (v12 != 0.0)
  {
    *a2 = (v6 * v10 - v9 * v7) / v12;
    a2[1] = (v9 * v5 - v3 * v10) / v12;
    a2[2] = (v3 * v7 - v6 * v5) / v12;
    a2[3] = (v10 * -v4 + v8 * v7) / v12;
    a2[4] = (v5 * -v8 + result * v10) / v12;
    a2[5] = (v11 + v4 * v5) / v12;
    a2[6] = (v4 * v9 - v8 * v6) / v12;
    a2[7] = (v9 * -result + v8 * v3) / v12;
    double result = (result * v6 - v4 * v3) / v12;
    a2[8] = result;
  }
  return result;
}

double GUMatrixMatrix(double *a1, double *a2, double *a3)
{
  double v3 = *a1;
  double v4 = a1[1];
  double v5 = a1[2];
  double v6 = a1[3];
  double v7 = a1[4];
  double v8 = a1[5];
  double v9 = a1[6];
  double v10 = a1[7];
  double v11 = a1[8];
  double v12 = *a2;
  double v13 = a2[1];
  double v14 = a2[2];
  double v15 = a2[3];
  double v16 = a2[4];
  double v17 = a2[5];
  double v18 = a2[6];
  double v19 = a2[7];
  double v20 = a2[8];
  double v21 = v7 * v13 + v4 * *a2 + v10 * v14;
  *a3 = v6 * v13 + *a1 * *a2 + v9 * v14;
  a3[1] = v21;
  a3[2] = v8 * v13 + v5 * v12 + v11 * v14;
  a3[3] = v6 * v16 + v3 * v15 + v9 * v17;
  a3[4] = v7 * v16 + v4 * v15 + v10 * v17;
  a3[5] = v8 * v16 + v5 * v15 + v11 * v17;
  a3[6] = v6 * v19 + v3 * v18 + v9 * v20;
  a3[7] = v7 * v19 + v4 * v18 + v10 * v20;
  double result = v8 * v19 + v5 * v18 + v11 * v20;
  a3[8] = result;
  return result;
}

id NUAssertLogger_6146()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_6166);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_6169()
{
  return MEMORY[0x1F4130BA0]();
}

double GUMatrixVector(double *a1, double *a2, double *a3)
{
  double v3 = *a2;
  double v4 = a2[1];
  double v5 = a2[2];
  *a3 = v4 * a1[1] + *a2 * *a1 + v5 * a1[2];
  a3[1] = v4 * a1[4] + v3 * a1[3] + v5 * a1[5];
  double result = v4 * a1[7] + v3 * a1[6] + v5 * a1[8];
  a3[2] = result;
  return result;
}

void sub_1A96E0624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id NUAssertLogger_6249()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_6272);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_6275()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96E1A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id a39)
{
}

id NUAssertLogger_6438()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_6490);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void CreateKeyframesFromHomographyDictionary(void *a1, CMTimeEpoch a2, uint64_t a3, void *a4, long long *a5)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v58 = a4;
  double v8 = [v7 objectForKeyedSubscript:@"stabCropRect"];
  double v9 = [v8 objectForKeyedSubscript:@"X"];
  uint64_t v10 = [v9 integerValue];
  double v11 = [v8 objectForKeyedSubscript:@"Y"];
  uint64_t v12 = [v11 integerValue];
  double v13 = [v8 objectForKeyedSubscript:@"Width"];
  uint64_t v14 = [v13 integerValue];
  id v52 = v8;
  double v15 = v8;
  uint64_t v16 = a3;
  double v17 = [v15 objectForKeyedSubscript:@"Height"];
  uint64_t v18 = [v17 integerValue];

  *(void *)&long long v82 = v10;
  *((void *)&v82 + 1) = v12;
  *(void *)&long long v83 = v14;
  *((void *)&v83 + 1) = v18;
  v80.value = 0;
  *(void *)&v80.timescale = 0;
  v80.epoch = a2;
  uint64_t v81 = v16;
  NUPixelRectFlipYOrigin();
  long long v19 = v86;
  *a5 = v85;
  a5[1] = v19;
  uint64_t v53 = v7;
  [v7 objectForKeyedSubscript:@"frameInstructions"];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v59)
  {
    *(float *)v20.i32 = (float)v16;
    v21.i32[0] = 0;
    v21.f32[1] = (float)v16;
    v21.i32[2] = 1.0;
    float32x4_t v57 = v21;
    int32x4_t v22 = vzip1q_s32((int32x4_t)xmmword_1A980B910, v20);
    v22.i32[3] = 0;
    int32x4_t v56 = v22;
    uint64_t v55 = *(void *)v77;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v77 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = v23;
        uint64_t v24 = *(void **)(*((void *)&v76 + 1) + 8 * v23);
        memset(&v80, 0, sizeof(v80));
        CFDictionaryRef v25 = [v24 objectForKeyedSubscript:@"rawTime"];
        CMTimeMakeFromDictionary(&v80, v25);

        uint64_t v26 = [v24 objectForKeyedSubscript:@"homography"];
        if ([v26 count] != 9)
        {
          uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
          v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void CreateKeyframesFromHomographyDictionary(NSDictionary *__strong, NUPixelSize, NSMutableArray<PIReframeKeyframe *> *__strong, NUPixelRect *)");
          [v50 handleFailureInFunction:v51 file:@"PIVideoStabilizeRequest.m" lineNumber:162 description:@"unexpected homography"];
        }
        long long v66 = [v26 objectAtIndexedSubscript:0];
        [v66 floatValue];
        v73.i64[0] = v27;
        unint64_t v65 = [v26 objectAtIndexedSubscript:1];
        [v65 floatValue];
        *(void *)&long long v70 = v28;
        long long v29 = [v26 objectAtIndexedSubscript:2];
        [v29 floatValue];
        *(void *)&long long v68 = v30;
        uint64_t v31 = [v26 objectAtIndexedSubscript:3];
        [v31 floatValue];
        __int32 v64 = v32;
        long long v33 = [v26 objectAtIndexedSubscript:4];
        [v33 floatValue];
        __int32 v63 = v34;
        uint64_t v35 = [v26 objectAtIndexedSubscript:5];
        [v35 floatValue];
        __int32 v62 = v36;
        uint64_t v37 = [v26 objectAtIndexedSubscript:6];
        [v37 floatValue];
        __int32 v61 = v38;
        uint64_t v39 = [v26 objectAtIndexedSubscript:7];
        [v39 floatValue];
        __int32 v60 = v40;
        uint64_t v41 = [v26 objectAtIndexedSubscript:8];
        [v41 floatValue];
        float32x4_t v42 = v73;
        v42.i32[1] = v64;
        v42.i32[2] = v61;
        float32x4_t v75 = v42;
        float32x4_t v43 = (float32x4_t)v70;
        v43.i32[1] = v63;
        v43.i32[2] = v60;
        float32x4_t v72 = v43;
        float32x4_t v44 = (float32x4_t)v68;
        v44.i32[1] = v62;
        v44.i32[2] = v45;
        float32x4_t v69 = v44;

        uint64_t v46 = 0;
        long long v82 = xmmword_1A980B920;
        long long v83 = xmmword_1A980B930;
        int32x4_t v84 = v56;
        long long v85 = 0u;
        long long v86 = 0u;
        int32x4_t v87 = 0u;
        do
        {
          *(long long *)((char *)&v85 + v46) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v75, COERCE_FLOAT(*(long long *)((char *)&v82 + v46))), v72, *(float32x2_t *)((char *)&v82 + v46), 1), v69, *(float32x4_t *)((char *)&v82 + v46), 2);
          v46 += 16;
        }
        while (v46 != 48);
        uint64_t v47 = 0;
        long long v82 = v85;
        long long v83 = v86;
        int32x4_t v84 = v87;
        long long v85 = 0u;
        long long v86 = 0u;
        int32x4_t v87 = 0u;
        do
        {
          *(long long *)((char *)&v85 + v47) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A980B920, COERCE_FLOAT(*(long long *)((char *)&v82 + v47))), (float32x4_t)xmmword_1A980B930, *(float32x2_t *)((char *)&v82 + v47), 1), v57, *(float32x4_t *)((char *)&v82 + v47), 2);
          v47 += 16;
        }
        while (v47 != 48);
        long long v70 = v86;
        float32x4_t v73 = (float32x4_t)v87;
        long long v68 = v85;
        uint64_t v48 = [PIReframeKeyframe alloc];
        long long v85 = *(_OWORD *)&v80.value;
        *(void *)&long long v86 = v80.epoch;
        uint64_t v49 = -[PIReframeKeyframe initWithTime:homography:](v48, "initWithTime:homography:", &v85, *(double *)&v68, *(double *)&v70, *(double *)v73.i64);
        [v58 addObject:v49];

        uint64_t v23 = v67 + 1;
      }
      while (v67 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v59);
  }
}

uint64_t __NUAssertLogger_block_invoke_6493()
{
  return MEMORY[0x1F4130BA0]();
}

_PIVideoStabilizeResult *PIVideoStabilizeResultFromHomographies(void *a1, CMTimeEpoch a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a1;
  id v7 = [v5 array];
  long long v12 = 0u;
  long long v13 = 0u;
  CreateKeyframesFromHomographyDictionary(v6, a2, a3, v7, &v12);
  double v8 = [_PIVideoStabilizeResult alloc];
  v11[0] = v12;
  v11[1] = v13;
  double v9 = [(_PIVideoStabilizeResult *)v8 initWithKeyframes:v7 stabCropRect:v11 analysisType:0 rawHomographies:v6];

  return v9;
}

void sub_1A96E2AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_6606()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_301);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_6618()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96E38DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __Block_byref_object_copy__6630(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6631(uint64_t a1)
{
}

uint64_t __NULogger_block_invoke_6664()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96E4EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A96E5CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose((const void *)(v41 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A96E6430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

double angular_error(double a1, double a2)
{
  double v2 = sqrt(a2 * a2 + a1 * a1) * 0.466690494;
  double v3 = 0.0;
  if (v2 > 0.0) {
    return acos((a2 * 0.330000013 + a1 * 0.330000013) / v2) * 180.0 / 3.14159265;
  }
  return v3;
}

void YIQFromRGB(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
  }
  double v15 = (os_log_t *)MEMORY[0x1E4F7A758];
  uint64_t v16 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    double v34 = *a1;
    double v35 = a1[1];
    double v36 = a1[2];
    *(_DWORD *)buf = 134218496;
    double v56 = v34;
    __int16 v57 = 2048;
    double v58 = v35;
    __int16 v59 = 2048;
    double v60 = v36;
    _os_log_debug_impl(&dword_1A9680000, v16, OS_LOG_TYPE_DEBUG, "RGB = %f, %f, %f", buf, 0x20u);
  }
  else if (!a1)
  {
    __int32 v40 = NUAssertLogger_6606();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      double v41 = [NSString stringWithFormat:@"Expected non-NULL pixels passed in"];
      *(_DWORD *)buf = 138543362;
      double v56 = v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float32x4_t v42 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float32x4_t v44 = NUAssertLogger_6606();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        double v48 = COERCE_DOUBLE(dispatch_get_specific(*v42));
        uint64_t v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = *(id *)&v48;
        v51 = [v49 callStackSymbols];
        double v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v56 = v48;
        __int16 v57 = 2114;
        double v58 = v52;
        _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v56 = v47;
      _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v18 = *a1;
  double v17 = a1[1];
  double v19 = a1[2];
  if (a5 != 0.0)
  {
    float v20 = a5;
    double v21 = exp2f(v20);
    double v18 = v18 / v21;
    double v17 = v17 / v21;
    double v19 = v19 / v21;
  }
  if (a6 != 1.0 && a7 != 0.0)
  {
    if (-(a7 - v18 * (a6 + a7)) >= 0.0) {
      double v18 = -(a7 - v18 * (a6 + a7));
    }
    else {
      double v18 = 0.0;
    }
    if (-(a7 - v17 * (a6 + a7)) >= 0.0) {
      double v17 = -(a7 - v17 * (a6 + a7));
    }
    else {
      double v17 = 0.0;
    }
    if (-(a7 - v19 * (a6 + a7)) >= 0.0) {
      double v19 = -(a7 - v19 * (a6 + a7));
    }
    else {
      double v19 = 0.0;
    }
  }
  double v22 = pow(v18, 4.0);
  double v23 = pow(v17, 4.0);
  long double v24 = pow(v19, 4.0);
  long double v25 = v23 * 0.404303581 + v22 * 0.592828095 + v24 * 0.00286814501;
  long double v26 = v23 * 0.843295753 + v22 * 0.0951450467 + v24 * 0.0615592338;
  long double v27 = v23 * 0.0696689114 + v22 * 0.0117029343 + v24 * 0.918628156;
  double v28 = pow(v25, 0.25);
  double v29 = pow(v26, 0.25);
  double v54 = pow(v27, 0.25);
  if (*v14 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
  }
  double v30 = v29 * -0.274453014 + v28 * 0.595716;
  double v31 = v29 * -0.522590995 + v28 * 0.211456001;
  __int32 v32 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    double v56 = v28;
    __int16 v57 = 2048;
    double v58 = v29;
    __int16 v59 = 2048;
    double v60 = v54;
    _os_log_debug_impl(&dword_1A9680000, v32, OS_LOG_TYPE_DEBUG, "RGB = %f, %f, %f", buf, 0x20u);
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
  }
  double v53 = v29 * 0.587000012 + v28 * 0.298999995;
  long long v33 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
  {
    double v37 = *a1;
    uint64_t v38 = *((void *)a1 + 1);
    uint64_t v39 = *((void *)a1 + 2);
    *(_DWORD *)buf = 134219264;
    double v56 = v53 + v54 * 0.114;
    __int16 v57 = 2048;
    double v58 = v30 + v54 * -0.321262985;
    __int16 v59 = 2048;
    double v60 = v31 + v54 * 0.311134994;
    __int16 v61 = 2048;
    double v62 = v37;
    __int16 v63 = 2048;
    uint64_t v64 = v38;
    __int16 v65 = 2048;
    uint64_t v66 = v39;
    _os_log_debug_impl(&dword_1A9680000, v33, OS_LOG_TYPE_DEBUG, "YIQ = %f, %f, %f from %f, %f, %f", buf, 0x3Eu);
  }
  *a2 = v53 + v54 * 0.114;
  *a3 = v30 + v54 * -0.321262985;
  *a4 = v31 + v54 * 0.311134994;
}

void sub_1A96E7AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 208), 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __NUAssertLogger_block_invoke_7216()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_7244()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_7245()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_524);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void sub_1A96EDAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v71 - 224), 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose((const void *)(v71 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7273(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7274(uint64_t a1)
{
}

id NUAssertLogger_7453()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_186);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_7468()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_7612()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_7830()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_7865);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_7868()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_8362()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_8370()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_8393()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A96FB304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8398(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8399(uint64_t a1)
{
}

void sub_1A96FB69C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8475()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_236);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_8509()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_8570()
{
  return MEMORY[0x1F4130BA0]();
}

id getVCPMediaAnalysisServiceClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  BOOL v0 = (void *)getVCPMediaAnalysisServiceClass_softClass;
  uint64_t v7 = getVCPMediaAnalysisServiceClass_softClass;
  if (!getVCPMediaAnalysisServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalysisServiceClass_block_invoke;
    v3[3] = &unk_1E5D81578;
    v3[4] = &v4;
    __getVCPMediaAnalysisServiceClass_block_invoke((uint64_t)v3);
    BOOL v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A96FF6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVCPMediaAnalysisServiceClass_block_invoke(uint64_t a1)
{
  MediaAnalysisLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    double v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"Class getVCPMediaAnalysisServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIPosterSettlingEffectLoader.m", 37, @"Unable to find class %s", "VCPMediaAnalysisService");

    __break(1u);
  }
}

void *MediaAnalysisLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaAnalysisLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5D7F950;
    uint64_t v6 = 0;
    MediaAnalysisLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  BOOL v0 = (void *)MediaAnalysisLibraryCore_frameworkLibrary;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    BOOL v0 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"void *MediaAnalysisLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIPosterSettlingEffectLoader.m", 36, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MediaAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisLibraryCore_frameworkLibrardouble y = result;
  return result;
}

void sub_1A9700768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void getMediaAnalysisResultsKey()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v0 = (void **)getMediaAnalysisResultsKeySymbolLoc_ptr;
  uint64_t v9 = getMediaAnalysisResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr)
  {
    id v1 = MediaAnalysisLibrary();
    void v7[3] = (uint64_t)dlsym(v1, "MediaAnalysisResultsKey");
    getMediaAnalysisResultsKeySymbolLoc_ptr = v7[3];
    BOOL v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    double v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultsKey(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PIPosterSettlingEffectLoader.m", 38, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A9700924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisSettlingEffectResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisSettlingEffectResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getMediaAnalysisResultAttributesKey()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v0 = (void **)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  uint64_t v9 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    id v1 = MediaAnalysisLibrary();
    void v7[3] = (uint64_t)dlsym(v1, "MediaAnalysisResultAttributesKey");
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = v7[3];
    BOOL v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    double v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultAttributesKey(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PIPosterSettlingEffectLoader.m", 39, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A9700ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectURLAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void getMediaAnalysisResultSettlingEffectStatusAttributeKey()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v0 = (void **)getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr;
  uint64_t v9 = getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr)
  {
    id v1 = MediaAnalysisLibrary();
    void v7[3] = (uint64_t)dlsym(v1, "MediaAnalysisResultSettlingEffectStatusAttributeKey");
    getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr = v7[3];
    BOOL v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    double v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectStatusAttributeKey(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PIPosterSettlingEffectLoader.m", 45, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A9700C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectFRCRecommendationAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                             + 24);
  return result;
}

void getMediaAnalysisPathConstraintsStabilizationResultsKey()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v0 = (void **)getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr;
  uint64_t v9 = getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr)
  {
    id v1 = MediaAnalysisLibrary();
    void v7[3] = (uint64_t)dlsym(v1, "MediaAnalysisPathConstraintsStabilizationResultsKey");
    getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr = v7[3];
    BOOL v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    double v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisPathConstraintsStabilizationResultsKey(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PIPosterSettlingEffectLoader.m", 43, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A9700E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisPathConstraintsStabilizationResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectStatusAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *__getMediaAnalysisResultAttributesKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultAttributesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultAttributesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A9701998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultsStabilizationCropAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void sub_1A9702BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectMissingMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectStabilizationFailureKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectVideoQualityGatingFailureKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                            + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectMetadataIntegrityFailureKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                           + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectFRCGatingFailureKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void *__getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultSettlingEffectStillTransitionGatingFailureKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                               + 24);
  return result;
}

void sub_1A97034CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8813()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_8826);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_8829()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97055B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8994()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9039);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_9042()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_9118()
{
  return MEMORY[0x1F4130BA0]();
}

id drawCircle(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v12 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v38 = *MEMORY[0x1E4F1E4E0];
  uint64_t v13 = v38;
  uint64_t v14 = NSNumber;
  id v15 = a2;
  id v16 = a1;
  double v17 = [v14 numberWithDouble:a6 * 1.15];
  v41[0] = v17;
  uint64_t v39 = *MEMORY[0x1E4F1E448];
  uint64_t v18 = v39;
  double v19 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v41[1] = v19;
  uint64_t v40 = *MEMORY[0x1E4F1E440];
  float v20 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", a4, a5);
  v41[2] = v20;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v38 count:3];
  double v22 = [v12 filterWithName:@"CICircleGenerator" withInputParameters:v21];

  double v23 = [v22 outputImage];
  long double v24 = [v23 imageByCompositingOverImage:v16];

  long double v25 = [NSNumber numberWithDouble:a6];
  [v22 setValue:v25 forKey:v13];

  [v22 setValue:v15 forKey:v18];
  long double v26 = [v22 outputImage];
  long double v27 = [v26 imageByCompositingOverImage:v24];

  if (v11)
  {
    double v28 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    double v29 = createLabelImage(v11, v28, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8));
    CGAffineTransformMakeScale(&v37, a6 / 40.0, a6 / 40.0);
    double v30 = [v29 imageByApplyingTransform:&v37];

    [v30 extent];
    CGAffineTransformMakeTranslation(&v36, a4 + v31 * -0.5, a5 - a6 + -5.0 - v32);
    long long v33 = [v30 imageByApplyingTransform:&v36];

    uint64_t v34 = [v33 imageByCompositingOverImage:v27];

    long double v27 = (void *)v34;
  }

  return v27;
}

id createLabelImage(void *a1, void *a2, CGFloat a3, CGFloat a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4F1E040];
  id v8 = a2;
  id v9 = a1;
  uint64_t v10 = [v7 textImageGeneratorFilter];
  [v10 setText:v9];

  [v10 setFontName:@"Helvetica"];
  LODWORD(v11) = 1109393408;
  [v10 setFontSize:v11];
  long long v12 = [v10 outputImage];
  uint64_t v13 = [MEMORY[0x1E4F1E040] roundedRectangleGeneratorFilter];
  [v12 extent];
  double v15 = v14 + 4.0;
  [v12 extent];
  objc_msgSend(v13, "setExtent:", 0.0, 0.0, v15, v16 + 4.0);
  [v13 setColor:v8];

  [v13 setRadius:0.0];
  CGAffineTransformMakeTranslation(&v23, 2.0, 2.0);
  double v17 = [v12 imageByApplyingTransform:&v23];

  uint64_t v18 = [v13 outputImage];
  double v19 = [v17 imageByCompositingOverImage:v18];

  CGAffineTransformMakeTranslation(&v22, a3, a4);
  float v20 = [v19 imageByApplyingTransform:&v22];

  return v20;
}

uint64_t __NULogger_block_invoke_9282()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_9283()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9103);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void sub_1A970A364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A970A730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9)
{
  _Unwind_Resume(a1);
}

id imageDataOfRowAverages(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11 = (void *)MEMORY[0x1E4F1E040];
  id v12 = a2;
  id v13 = a1;
  double v14 = [v11 rowAverageFilter];
  [v14 setInputImage:v12];

  objc_msgSend(v14, "setExtent:", a3, a4, a5, a6);
  double v15 = [v14 outputImage];
  [v15 extent];
  id v17 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)(4 * vcvtpd_s64_f64(v16))];
  uint64_t v18 = [v17 mutableBytes];
  uint64_t v19 = [v17 length];
  [v15 extent];
  objc_msgSend(v13, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v15, v18, v19, *MEMORY[0x1E4F1E2A8], 0);

  float v20 = (void *)[v17 copy];
  return v20;
}

uint64_t PICinematicAudioIsRenderSupported()
{
  BOOL v0 = [MEMORY[0x1E4F7A5E0] currentPlatform];
  id v1 = [v0 mainDevice];
  if ((unint64_t)[v1 family] < 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v0 supportsANE];
  }

  return v2;
}

id NUAssertLogger_9423()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9449);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_9452()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_9504()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9570);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_9573()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_9918()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_9921()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_9953()
{
  return MEMORY[0x1F4130BA0]();
}

id NULogger_9971()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

void sub_1A9715914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10000(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10001(uint64_t a1)
{
}

id NUAssertLogger_10283()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_10299);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_10302()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_10331()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_10400);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_10403()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97193F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10411(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10412(uint64_t a1)
{
}

void sub_1A971AAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t XXH32(char *a1, unint64_t a2, unsigned int a3)
{
  unint64_t v3 = (unint64_t)&a1[a2];
  if (a2 < 0x10)
  {
    int v13 = a3 + 374761393;
    uint64_t v7 = a1;
  }
  else
  {
    unsigned int v4 = a3 + 606290984;
    unsigned int v5 = a3 - 2048144777;
    unsigned int v6 = a3 + 1640531535;
    uint64_t v7 = a1;
    do
    {
      HIDWORD(v9) = v4 - 2048144777 * *(_DWORD *)v7;
      LODWORD(v9) = HIDWORD(v9);
      int v8 = v9 >> 19;
      unsigned int v4 = -1640531535 * v8;
      HIDWORD(v9) = v5 - 2048144777 * *((_DWORD *)v7 + 1);
      LODWORD(v9) = HIDWORD(v9);
      int v10 = v9 >> 19;
      unsigned int v5 = -1640531535 * v10;
      HIDWORD(v9) = a3 - 2048144777 * *((_DWORD *)v7 + 2);
      LODWORD(v9) = HIDWORD(v9);
      int v11 = v9 >> 19;
      a3 = -1640531535 * v11;
      HIDWORD(v9) = v6 - 2048144777 * *((_DWORD *)v7 + 3);
      LODWORD(v9) = HIDWORD(v9);
      int v12 = v9 >> 19;
      unsigned int v6 = -1640531535 * v12;
      v7 += 16;
    }
    while ((unint64_t)v7 <= v3 - 16);
    int v13 = ((1013904226 * v8) | (v4 >> 31))
        + 465361024 * v10
        + (v5 >> 25)
        + 2006650880 * v11
        + (a3 >> 20)
        - 423362560 * v12
        + (v6 >> 14);
  }
  unsigned int v14 = v13 + a2;
  if ((unint64_t)(v7 + 4) <= v3)
  {
    do
    {
      double v15 = v7 + 4;
      HIDWORD(v16) = v14 - 1028477379 * *(_DWORD *)v7;
      LODWORD(v16) = HIDWORD(v16);
      unsigned int v14 = 668265263 * (v16 >> 15);
      BOOL v17 = (unint64_t)(v7 + 8) > v3;
      v7 += 4;
    }
    while (!v17);
  }
  else
  {
    double v15 = v7;
  }
  if ((unint64_t)v15 < v3)
  {
    unint64_t v18 = &a1[a2] - v15;
    do
    {
      int v19 = *v15++;
      HIDWORD(v20) = v14 + 374761393 * v19;
      LODWORD(v20) = HIDWORD(v20);
      unsigned int v14 = -1640531535 * (v20 >> 21);
      --v18;
    }
    while (v18);
  }
  unsigned int v21 = -1028477379 * ((-2048144777 * (v14 ^ (v14 >> 15))) ^ ((-2048144777 * (v14 ^ (v14 >> 15))) >> 13));
  return v21 ^ HIWORD(v21);
}

unint64_t XXH64(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = (unint64_t)a1 + a2;
  if (a2 < 0x20)
  {
    unint64_t v13 = a3 + 0x27D4EB2F165667C5;
    uint64_t v7 = a1;
  }
  else
  {
    unint64_t v4 = a3 + 0x60EA27EEADC0B5D6;
    unint64_t v5 = a3 - 0x3D4D51C2D82B14B1;
    unint64_t v6 = a3 + 0x61C8864E7A143579;
    uint64_t v7 = a1;
    do
    {
      uint64_t v8 = __ROR8__(v4 - 0x3D4D51C2D82B14B1 * *(void *)v7, 33);
      unint64_t v4 = 0x9E3779B185EBCA87 * v8;
      uint64_t v9 = __ROR8__(v5 - 0x3D4D51C2D82B14B1 * *((void *)v7 + 1), 33);
      unint64_t v5 = 0x9E3779B185EBCA87 * v9;
      uint64_t v10 = *((void *)v7 + 3);
      uint64_t v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * *((void *)v7 + 2), 33);
      a3 = 0x9E3779B185EBCA87 * v11;
      v7 += 8;
      uint64_t v12 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * v10, 33);
      unint64_t v6 = 0x9E3779B185EBCA87 * v12;
    }
    while ((unint64_t)v7 <= v3 - 32);
    unint64_t v13 = 0x85EBCA77C2B2AE63
        - 0x61C8864E7A143579
        * ((0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((((0x3C6EF3630BD7950ELL * v8) | (v4 >> 63))
                + 0x1BBCD8C2F5E54380 * v9
                + (v5 >> 57)
                + 0x779B185EBCA87000 * v11
                + (a3 >> 52)
                - 0x1939E850D5E40000 * v12
                + (v6 >> 46)) ^ (0x9E3779B185EBCA87
                               * ((0x87BCB65480000000 * v8) | ((0xDEF35B010F796CA9 * v8) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v9) | ((0xDEF35B010F796CA9 * v9) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v11) | ((0xDEF35B010F796CA9 * v11) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v12) | ((0xDEF35B010F796CA9 * v12) >> 33))));
  }
  unint64_t v14 = v13 + a2;
  if ((unint64_t)(v7 + 2) <= v3)
  {
    do
    {
      double v15 = v7 + 2;
      unint64_t v14 = 0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * __ROR8__((0x9E3779B185EBCA87* ((0x93EA75A780000000 * *(void *)v7) | ((0xC2B2AE3D27D4EB4FLL * *(void *)v7) >> 33))) ^ v14, 37);
      BOOL v16 = (unint64_t)(v7 + 4) > v3;
      v7 += 2;
    }
    while (!v16);
  }
  else
  {
    double v15 = v7;
  }
  if ((unint64_t)(v15 + 1) <= v3) {
    unint64_t v14 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * *v15++) ^ v14, 41);
  }
  if ((unint64_t)v15 < v3)
  {
    unint64_t v17 = (char *)a1 + a2 - (char *)v15;
    do
    {
      unsigned int v18 = *(unsigned __int8 *)v15;
      double v15 = (unsigned int *)((char *)v15 + 1);
      unint64_t v14 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v18) ^ v14, 53);
      --v17;
    }
    while (v17);
  }
  unint64_t v19 = 0x165667B19E3779F9
      * ((0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 33))) >> 29));
  return v19 ^ HIDWORD(v19);
}

void *XXH32_createState()
{
  return malloc_type_malloc(0x30uLL, 0xC0F1A4A2uLL);
}

uint64_t XXH32_freeState(void *a1)
{
  return 0;
}

void *XXH64_createState()
{
  return malloc_type_malloc(0x58uLL, 0xC0F1A4A2uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  return 0;
}

uint64_t XXH32_reset(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(int32x2_t *)(a1 + 12) = vadd_s32(vdup_n_s32(a2), (int32x2_t)0x85EBCA7724234428);
  *(_DWORD *)(a1 + 20) = a2;
  *(_DWORD *)(a1 + 24) = a2 + 1640531535;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 44) = 0;
  return 0;
}

uint64_t XXH64_reset(int64x2_t *a1, unint64_t a2)
{
  a1[1] = vaddq_s64(vdupq_n_s64(a2), (int64x2_t)xmmword_1A980B990);
  a1[2].i64[0] = a2;
  a1[2].i64[1] = a2 + 0x61C8864E7A143579;
  a1->i64[0] = 0;
  a1->i64[1] = a2;
  a1[5].i32[0] = 0;
  return 0;
}

uint64_t XXH32_update(uint64_t a1, int32x4_t *__src, size_t __n)
{
  int v3 = __n;
  unint64_t v4 = __src;
  *(void *)a1 += __n;
  uint64_t v6 = *(unsigned int *)(a1 + 44);
  if (v6 + __n <= 0xF)
  {
    memcpy((void *)(a1 + v6 + 28), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 44) + v3;
LABEL_11:
    *(_DWORD *)(a1 + 44) = v7;
    return 0;
  }
  uint64_t v8 = (int32x4_t *)((char *)__src + __n);
  if (v6)
  {
    memcpy((void *)(a1 + 28 + v6), __src, (16 - v6));
    int32x4_t v9 = vmlaq_s32(*(int32x4_t *)(a1 + 12), *(int32x4_t *)(a1 + 28), vdupq_n_s32(0x85EBCA77));
    *(int32x4_t *)(a1 + 12) = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v9, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v9, 0x13uLL)), vdupq_n_s32(0x9E3779B1));
    unint64_t v4 = (int32x4_t *)((char *)v4 + (16 - *(_DWORD *)(a1 + 44)));
    *(_DWORD *)(a1 + 44) = 0;
  }
  if (v4 <= &v8[-1])
  {
    int32x4_t v10 = *(int32x4_t *)(a1 + 12);
    int32x4_t v11 = vdupq_n_s32(0x85EBCA77);
    int32x4_t v12 = vdupq_n_s32(0x9E3779B1);
    do
    {
      int32x4_t v13 = *v4++;
      int32x4_t v14 = vmlaq_s32(v10, v13, v11);
      int32x4_t v10 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v14, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v14, 0x13uLL)), v12);
    }
    while (v4 <= &v8[-1]);
    *(int32x4_t *)(a1 + 12) = v10;
  }
  if (v4 < v8)
  {
    size_t v7 = (char *)v8 - (char *)v4;
    memcpy((void *)(a1 + 28), v4, v7);
    goto LABEL_11;
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  id v1 = (_DWORD *)(a1 + 28);
  uint64_t v2 = *(unsigned int *)(a1 + 44);
  unint64_t v3 = a1 + 28 + v2;
  if (*(void *)a1 < 0x10uLL) {
    int v4 = *(_DWORD *)(a1 + 8) + 374761393;
  }
  else {
    int v4 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 12), (uint32x4_t)xmmword_1A980B9B0), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 12), (uint32x4_t)xmmword_1A980B9A0)));
  }
  unsigned int v5 = v4 + *(void *)a1;
  if (a1 + 32 <= v3)
  {
    do
    {
      uint64_t v6 = (unsigned __int8 *)(v1 + 1);
      HIDWORD(v7) = v5 - 1028477379 * *v1;
      LODWORD(v7) = HIDWORD(v7);
      unsigned int v5 = 668265263 * (v7 >> 15);
      BOOL v8 = (unint64_t)(v1 + 2) > v3;
      ++v1;
    }
    while (!v8);
  }
  else
  {
    uint64_t v6 = (unsigned __int8 *)(a1 + 28);
  }
  if ((unint64_t)v6 < v3)
  {
    uint64_t v9 = a1 + v2 - (void)v6 + 28;
    do
    {
      int v10 = *v6++;
      HIDWORD(v11) = v5 + 374761393 * v10;
      LODWORD(v11) = HIDWORD(v11);
      unsigned int v5 = -1640531535 * (v11 >> 21);
      --v9;
    }
    while (v9);
  }
  unsigned int v12 = -1028477379 * ((-2048144777 * (v5 ^ (v5 >> 15))) ^ ((-2048144777 * (v5 ^ (v5 >> 15))) >> 13));
  return v12 ^ HIWORD(v12);
}

uint64_t XXH64_update(uint64_t a1, char *__src, size_t __n)
{
  int v3 = __n;
  int v4 = __src;
  *(void *)a1 += __n;
  uint64_t v6 = *(unsigned int *)(a1 + 80);
  if (v6 + __n <= 0x1F)
  {
    memcpy((void *)(a1 + v6 + 48), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 80) + v3;
LABEL_11:
    *(_DWORD *)(a1 + 80) = v7;
    return 0;
  }
  BOOL v8 = &__src[__n];
  if (v6)
  {
    memcpy((void *)(a1 + 48 + v6), __src, (32 - v6));
    uint64_t v9 = __ROR8__(*(void *)(a1 + 24) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 56), 33);
    *(void *)(a1 + 16) = 0x9E3779B185EBCA87
                         * __ROR8__(*(void *)(a1 + 16) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 48), 33);
    *(void *)(a1 + 24) = 0x9E3779B185EBCA87 * v9;
    unint64_t v10 = 0x9E3779B185EBCA87 * __ROR8__(*(void *)(a1 + 40) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 72), 33);
    *(void *)(a1 + 32) = 0x9E3779B185EBCA87
                         * __ROR8__(*(void *)(a1 + 32) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 64), 33);
    *(void *)(a1 + 40) = v10;
    v4 += (32 - *(_DWORD *)(a1 + 80));
    *(_DWORD *)(a1 + 80) = 0;
  }
  if (v4 + 32 <= v8)
  {
    unint64_t v11 = *(void *)(a1 + 16);
    unint64_t v12 = *(void *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 32);
    unint64_t v13 = *(void *)(a1 + 40);
    do
    {
      unint64_t v11 = 0x9E3779B185EBCA87 * __ROR8__(v11 - 0x3D4D51C2D82B14B1 * *(void *)v4, 33);
      unint64_t v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 1), 33);
      unint64_t v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 2), 33);
      unint64_t v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 3), 33);
      v4 += 32;
    }
    while (v4 <= v8 - 32);
    *(void *)(a1 + 16) = v11;
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v14;
    *(void *)(a1 + 40) = v13;
  }
  if (v4 < v8)
  {
    size_t v7 = v8 - v4;
    memcpy((void *)(a1 + 48), v4, v7);
    goto LABEL_11;
  }
  return 0;
}

unint64_t XXH64_digest(uint64_t a1)
{
  id v1 = (void *)(a1 + 48);
  uint64_t v2 = *(unsigned int *)(a1 + 80);
  unint64_t v3 = a1 + 48 + v2;
  if (*(void *)a1 < 0x20uLL) {
    uint64_t v4 = *(void *)(a1 + 8) + 0x27D4EB2F165667C5;
  }
  else {
    uint64_t v4 = 0x85EBCA77C2B2AE63
  }
       - 0x61C8864E7A143579
       * ((0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * ((0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((__ROR8__(*(void *)(a1 + 24), 57)
               + __ROR8__(*(void *)(a1 + 16), 63)
               + __ROR8__(*(void *)(a1 + 32), 52)
               + __ROR8__(*(void *)(a1 + 40), 46)) ^ (0x9E3779B185EBCA87
                                                      * ((0x93EA75A780000000 * *(void *)(a1 + 16)) | ((0xC2B2AE3D27D4EB4FLL * *(void *)(a1 + 16)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(void *)(a1 + 24)) | ((0xC2B2AE3D27D4EB4FLL * *(void *)(a1 + 24)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(void *)(a1 + 32)) | ((0xC2B2AE3D27D4EB4FLL * *(void *)(a1 + 32)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(void *)(a1 + 40)) | ((0xC2B2AE3D27D4EB4FLL * *(void *)(a1 + 40)) >> 33))));
  unint64_t v5 = v4 + *(void *)a1;
  if (a1 + 56 <= v3)
  {
    do
    {
      uint64_t v6 = (unsigned int *)(v1 + 1);
      unint64_t v5 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * __ROR8__((0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *v1) | ((0xC2B2AE3D27D4EB4FLL * *v1) >> 33))) ^ v5, 37);
      BOOL v7 = (unint64_t)(v1 + 2) > v3;
      ++v1;
    }
    while (!v7);
  }
  else
  {
    uint64_t v6 = (unsigned int *)(a1 + 48);
  }
  if ((unint64_t)(v6 + 1) <= v3) {
    unint64_t v5 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * *v6++) ^ v5, 41);
  }
  if ((unint64_t)v6 < v3)
  {
    uint64_t v8 = a1 + v2 - (void)v6 + 48;
    do
    {
      unsigned int v9 = *(unsigned __int8 *)v6;
      uint64_t v6 = (unsigned int *)((char *)v6 + 1);
      unint64_t v5 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v9) ^ v5, 53);
      --v8;
    }
    while (v8);
  }
  unint64_t v10 = 0x165667B19E3779F9
      * ((0xC2B2AE3D27D4EB4FLL * (v5 ^ (v5 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v5 ^ (v5 >> 33))) >> 29));
  return v10 ^ HIDWORD(v10);
}

uint64_t __NULogger_block_invoke_10665()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_10758()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_88);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_10772()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_10778()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A971E708(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10814(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10815(uint64_t a1)
{
}

id NUAssertLogger_10928()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_500);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_10995()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_11149()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t flashFired(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"Flash"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 shortValue] & 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id apertureValue(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"FNumber"];
  if (v2
    || ([v1 objectForKeyedSubscript:@"ApertureValue"],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = NSNumber;
    [v2 doubleValue];
    uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id shutterSpeedValue(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"ShutterSpeedValue"];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [v1 objectForKeyedSubscript:@"ExposureTime"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    uint64_t v6 = [v1 objectForKeyedSubscript:@"ShutterSpeedValue"];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v5 = [NSNumber numberWithDouble:(double)exp2(-v8)];
  }
  else
  {
    uint64_t v5 = [v1 objectForKeyedSubscript:@"ExposureTime"];
  }
  unsigned int v9 = (void *)v5;

  return v9;
}

id isoValue(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"ISOSpeedRatings"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 count])
  {
    uint64_t v2 = NSNumber;
    uint64_t v3 = [v1 objectAtIndex:0];
    [v3 doubleValue];
    uint64_t v4 = objc_msgSend(v2, "numberWithDouble:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id NUAssertLogger_11297()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_11310);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_11313()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_11398()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_11470);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_11473()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_11535()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_44);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_11560()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_11566()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9728400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11656(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11657(uint64_t a1)
{
}

void *__getkSliderNetGatingMethodSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = ImageHarmonizationKitLibrary();
  uint64_t result = dlsym(v2, "kSliderNetGatingMethod");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSliderNetGatingMethodSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *ImageHarmonizationKitLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __ImageHarmonizationKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5D7FD88;
    uint64_t v6 = 0;
    ImageHarmonizationKitLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  BOOL v0 = (void *)ImageHarmonizationKitLibraryCore_frameworkLibrary;
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary)
  {
    BOOL v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ImageHarmonizationKitLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PISmartCopyPasteAutoCalculator.m", 25, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void __getIHKSliderNetCPModelClass_block_invoke(uint64_t a1)
{
  ImageHarmonizationKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("IHKSliderNetCPModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIHKSliderNetCPModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getIHKSliderNetCPModelClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PISmartCopyPasteAutoCalculator.m", 26, @"Unable to find class %s", "IHKSliderNetCPModel");

    __break(1u);
  }
}

uint64_t __ImageHarmonizationKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ImageHarmonizationKitLibraryCore_frameworkLibrardouble y = result;
  return result;
}

uint64_t __NUAssertLogger_block_invoke_11696()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_11809()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_299);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_11826()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_11831()
{
  return MEMORY[0x1F4130BA0]();
}

id PIStringFromIndexSet(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy__11870;
  unint64_t v13 = __Block_byref_object_dispose__11871;
  unint64_t v14 = @"[";
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PIStringFromIndexSet_block_invoke;
  v6[3] = &unk_1E5D7FF10;
  v6[4] = v7;
  v6[5] = &v9;
  [v1 enumerateIndexesUsingBlock:v6];
  uint64_t v2 = [(id)v10[5] stringByAppendingString:@"]"];
  uint64_t v3 = (void *)v10[5];
  v10[5] = v2;

  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_1A972BE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11870(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11871(uint64_t a1)
{
}

void __PIStringFromIndexSet_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:@","];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", @"%ld", a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t PIModelLoadingOptions(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [a1 URLByAppendingPathComponent:@"model.specialization.bundle"];
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB18];
    id v12 = v5;
    unint64_t v13 = [v11 standardUserDefaults];
    unint64_t v14 = [v13 objectForKey:v12];

    if (v14)
    {
      uint64_t v10 = [v14 localizedCaseInsensitiveContainsString:@"compiled"];
      if ([v14 localizedCaseInsensitiveContainsString:@"cpu"]) {
        v10 |= 2uLL;
      }
      if ([v14 localizedCaseInsensitiveContainsString:@"gpu"]) {
        v10 |= 4uLL;
      }
      if ([v14 localizedCaseInsensitiveContainsString:@"ane"])
      {
        v10 |= 8uLL;

        goto LABEL_13;
      }

      if (v10) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v10 = a3;
    goto LABEL_13;
  }
  uint64_t v10 = 1;
LABEL_13:

  return v10;
}

void sub_1A972DE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose((const void *)(v69 - 208), 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A972EB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __NULogger_block_invoke_12361()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97349E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12510(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12511(uint64_t a1)
{
}

id NULogger_12515()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

id NUAssertLogger_12535()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_648);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_12546()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_12800()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_12819()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_12955()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_12968);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_12971()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_13666()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_13682()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A974874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 240), 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13883(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13884(uint64_t a1)
{
}

uint64_t __NUAssertLogger_block_invoke_14018()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A974A13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_14042()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __Block_byref_object_copy__14055(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14056(uint64_t a1)
{
}

uint64_t __NULogger_block_invoke_14122()
{
  return MEMORY[0x1F4130BA0]();
}

char *___lightMapImageFromData_block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 771, "x == 0");
  }
  if (a5) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 772, "y == 0");
  }
  if (*(void *)(a1 + 40) != a6) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 773, "width == lmWidth");
  }
  uint64_t v8 = a7;
  if (*(void *)(a1 + 48) != a7) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 774, "height == lmHeight");
  }
  size_t v11 = 2 * a6;
  uint64_t result = (char *)[*(id *)(a1 + 32) bytes];
  unint64_t v13 = result;
  if (v11 == a3)
  {
    size_t v14 = *(void *)(a1 + 56);
    return (char *)memcpy(a2, result, v14);
  }
  else
  {
    for (; v8; --v8)
    {
      uint64_t result = (char *)memcpy(a2, v13, v11);
      v13 += v11;
      a2 += a3;
    }
  }
  return result;
}

id NUAssertLogger_14385()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14431);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_14434()
{
  return MEMORY[0x1F4130BA0]();
}

id NULogger_14487()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_143);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NULogger_block_invoke_14494()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_14610()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_288);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_14647()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9751D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__14656(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14657(uint64_t a1)
{
}

uint64_t __NURenderLogger_block_invoke()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9752454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9752C74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A97541D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A9755BC0(_Unwind_Exception *a1)
{
}

id NUAssertLogger_14928()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14944);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_14947()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_14961()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_15192()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_15335()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_15720()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_15728()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_274);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_15749()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9760668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15790(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15791(uint64_t a1)
{
}

void sub_1A97611F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A97615A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9762A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A97637D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t PIRetouchModeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kRepairModeDeclutter])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:kRepairModeObjectRemoval])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:kRepairModeRepair])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:kRepairModeClone])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

id PIRetouchModeToString(unint64_t a1)
{
  if (a1 > 4) {
    id v1 = (id *)&kRepairModeRepairML;
  }
  else {
    id v1 = (id *)off_1E5D80560[a1];
  }
  return *v1;
}

uint64_t __NULogger_block_invoke_16421()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_16488()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_16523);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_16526()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A976AC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16579(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16580(uint64_t a1)
{
}

id NUAssertLogger_16718()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_16740);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_16743()
{
  return MEMORY[0x1F4130BA0]();
}

void fixRedeye(void *a1, double a2)
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v190 = a1;
  uint64_t v3 = [v190 format];
  uint64_t v4 = [v3 bytesPerPixel];

  if (v4 != 8)
  {
    v144 = NUAssertLogger();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      v145 = [NSString stringWithFormat:@"Buffer must be RGBA16 type for red eye repairs"];
      *(_DWORD *)buf = 138543362;
      v193 = v145;
      _os_log_error_impl(&dword_1A9680000, v144, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v146 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v148 = NUAssertLogger();
    BOOL v149 = os_log_type_enabled(v148, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v149)
      {
        v173 = dispatch_get_specific(*v146);
        v174 = [MEMORY[0x1E4F29060] callStackSymbols];
        v175 = [v174 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v193 = v173;
        __int16 v194 = 2114;
        v195 = v175;
        _os_log_error_impl(&dword_1A9680000, v148, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v149)
    {
      v150 = [MEMORY[0x1E4F29060] callStackSymbols];
      v151 = [v150 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v193 = v151;
      _os_log_error_impl(&dword_1A9680000, v148, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_181:
    __break(1u);
  }
  uint64_t v5 = [v190 size];
  uint64_t v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F7A5D8] R16];
  v186 = (void *)v8;
  char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A598]), "initWithSize:format:", v5, v7, v8);
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v11 = objc_msgSend(v190, "bytesAtPoint:", 0, i);
      id v12 = (_WORD *)objc_msgSend(v9, "mutableBytesAtPoint:", 0, i);
      if (v5 >= 1)
      {
        unint64_t v13 = (unsigned __int16 *)(v11 + 2);
        uint64_t v14 = v5;
        do
        {
          unsigned int v15 = *(v13 - 1);
          unsigned int v16 = *v13;
          if (v15 > v16) {
            *id v12 = (v15 << 10) / (v16 + 1024);
          }
          v13 += 4;
          ++v12;
          --v14;
        }
        while (v14);
      }
    }
  }
  uint64_t v187 = v5;
  uint64_t v17 = v5 / 3;
  uint64_t v18 = v7 / 3;
  uint64_t v19 = 2 * v7 / 3;
  unsigned int v20 = *(unsigned __int16 *)objc_msgSend(v9, "bytesAtPoint:", v17, v7 / 3);
  if (v7 / 3 >= v19)
  {
    uint64_t v23 = v7 / 3;
    uint64_t v22 = v17;
    if (v20) {
      goto LABEL_21;
    }
LABEL_101:
    unsigned __int16 v101 = 0;
    v102 = 0;
    goto LABEL_121;
  }
  uint64_t v21 = 2 * v187 / 3;
  uint64_t v22 = v17;
  uint64_t v23 = v7 / 3;
  do
  {
    uint64_t v24 = objc_msgSend(v9, "bytesAtPoint:", 0, v18);
    if (v17 < v21)
    {
      uint64_t v25 = v17;
      do
      {
        unsigned int v26 = *(unsigned __int16 *)(v24 + 2 * v25);
        if (v20 < v26)
        {
          uint64_t v23 = v18;
          uint64_t v22 = v25;
        }
        if (v20 <= v26) {
          unsigned int v20 = *(unsigned __int16 *)(v24 + 2 * v25);
        }
        ++v25;
      }
      while (v21 != v25);
    }
    ++v18;
  }
  while (v18 != v19);
  if (!v20) {
    goto LABEL_101;
  }
LABEL_21:
  v185 = v9;
  uint64_t v188 = v7;
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F7A598]), "initWithSize:format:", v187, v7, v8);
  id v28 = v9;
  uint64_t v30 = [v27 size];
  if (v30 <= v22)
  {
    v152 = NUAssertLogger();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
    {
      v153 = [NSString stringWithFormat:@"reddestx out of bounds"];
      *(_DWORD *)buf = 138543362;
      v193 = v153;
      _os_log_error_impl(&dword_1A9680000, v152, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v154 = (const void **)MEMORY[0x1E4F7A308];
    v155 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v156 = NUAssertLogger();
    BOOL v157 = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);
    if (v155)
    {
      if (v157)
      {
        v176 = dispatch_get_specific(*v154);
        v177 = [MEMORY[0x1E4F29060] callStackSymbols];
        v178 = [v177 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v193 = v176;
        __int16 v194 = 2114;
        v195 = v178;
        _os_log_error_impl(&dword_1A9680000, v156, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
      goto LABEL_177;
    }
    if (v157)
    {
LABEL_163:
      v163 = [MEMORY[0x1E4F29060] callStackSymbols];
      v164 = [v163 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v193 = v164;
      _os_log_error_impl(&dword_1A9680000, v156, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_177:

    _NUAssertFailHandler();
    goto LABEL_181;
  }
  uint64_t v31 = v29;
  if (v29 <= v23)
  {
    v158 = NUAssertLogger();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
    {
      v159 = [NSString stringWithFormat:@"reddesty out of bounds"];
      *(_DWORD *)buf = 138543362;
      v193 = v159;
      _os_log_error_impl(&dword_1A9680000, v158, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v160 = (const void **)MEMORY[0x1E4F7A308];
    v161 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v156 = NUAssertLogger();
    BOOL v162 = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);
    if (v161)
    {
      if (v162)
      {
        v179 = dispatch_get_specific(*v160);
        v180 = [MEMORY[0x1E4F29060] callStackSymbols];
        v181 = [v180 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v193 = v179;
        __int16 v194 = 2114;
        v195 = v181;
        _os_log_error_impl(&dword_1A9680000, v156, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
      goto LABEL_177;
    }
    if (v162) {
      goto LABEL_163;
    }
    goto LABEL_177;
  }
  uint64_t v32 = objc_msgSend(v28, "bytesAtPoint:", 0, v23);
  uint64_t v33 = objc_msgSend(v27, "mutableBytesAtPoint:", 0, v23);
  if ((v22 & 0x8000000000000000) == 0)
  {
    uint64_t v34 = v22;
    unsigned int v35 = v20;
    do
    {
      if (v35 >= *(unsigned __int16 *)(v32 + 2 * v34)) {
        unsigned int v35 = *(unsigned __int16 *)(v32 + 2 * v34);
      }
      *(_WORD *)(v33 + 2 * v34--) = v35;
    }
    while (v34 != -1);
  }
  if (v22 + 1 < v30)
  {
    uint64_t v36 = ~v22 + v30;
    uint64_t v37 = 2 * v22 + 2;
    uint64_t v38 = (_WORD *)(v33 + v37);
    uint64_t v39 = (unsigned __int16 *)(v32 + v37);
    do
    {
      unsigned int v41 = *v39++;
      unsigned int v40 = v41;
      if (v20 >= v41) {
        unsigned int v20 = v40;
      }
      *v38++ = v20;
      --v36;
    }
    while (v36);
  }
  if (v23 >= 1)
  {
    uint64_t v42 = v23;
    do
    {
      float32x4_t v43 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v42 - 1);
      float32x4_t v44 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v42);
      BOOL v45 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v42 - 1);
      if (v30 >= 1)
      {
        uint64_t v46 = v30;
        do
        {
          unsigned int v48 = *v43++;
          unsigned int v47 = v48;
          unsigned int v50 = *v44++;
          __int16 v49 = v50;
          if (v47 >= v50) {
            LOWORD(v47) = v49;
          }
          *v45++ = v47;
          --v46;
        }
        while (v46);
      }
      BOOL v51 = v42-- <= 1;
    }
    while (!v51);
  }
  uint64_t v52 = v23 + 1;
  if (v23 + 1 < v31)
  {
    do
    {
      uint64_t v53 = v23;
      uint64_t v23 = v52;
      double v54 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v52);
      uint64_t v55 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v53);
      double v56 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v23);
      if (v30 >= 1)
      {
        uint64_t v57 = v30;
        do
        {
          unsigned int v59 = *v55++;
          unsigned int v58 = v59;
          unsigned int v61 = *v54++;
          __int16 v60 = v61;
          if (v58 >= v61) {
            LOWORD(v58) = v60;
          }
          *v56++ = v58;
          --v57;
        }
        while (v57);
      }
      uint64_t v52 = v23 + 1;
    }
    while (v23 + 1 != v31);
  }
  unsigned int v191 = 0;
  do
  {
    if (v31 < 1)
    {
      unsigned int v63 = 0;
    }
    else
    {
      uint64_t v62 = 0;
      unsigned int v63 = 0;
      do
      {
        uint64_t v64 = objc_msgSend(v28, "bytesAtPoint:", 0, v62);
        __int16 v65 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v62);
        uint64_t v66 = objc_msgSend(v27, "mutableBytesAtPoint:", 0, v62);
        if (v30 >= 2)
        {
          uint64_t v67 = v65 + 1;
          unsigned int v68 = *v65;
          uint64_t v69 = (_WORD *)(v66 + 2);
          long long v70 = (unsigned __int16 *)(v64 + 2);
          uint64_t v71 = v30 - 1;
          do
          {
            unsigned int v73 = *v70++;
            unsigned int v72 = v73;
            if (v68 < v73) {
              unsigned int v72 = v68;
            }
            unsigned int v74 = *v67++;
            unsigned int v68 = v74;
            if (v72 > v74)
            {
              *uint64_t v69 = v72;
              ++v63;
              unsigned int v68 = v72;
            }
            ++v69;
            --v71;
          }
          while (v71);
          unsigned int v75 = v65[v30 - 1];
          uint64_t v76 = v30 - 2;
          do
          {
            unsigned int v77 = *(unsigned __int16 *)(v64 + 2 * v76);
            if (v75 < v77) {
              unsigned int v77 = v75;
            }
            unsigned int v75 = v65[v76];
            if (v77 > v75)
            {
              *(_WORD *)(v66 + 2 * v76) = v77;
              ++v63;
              unsigned int v75 = v77;
            }
            BOOL v51 = v76-- <= 0;
          }
          while (!v51);
        }
        ++v62;
      }
      while (v62 != v31);
      if (v31 >= 2)
      {
        for (uint64_t j = 1; j != v31; ++j)
        {
          long long v79 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, j);
          CMTime v80 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, j - 1);
          uint64_t v81 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, j);
          if (v30 >= 1)
          {
            uint64_t v82 = v30;
            do
            {
              unsigned int v84 = *v80++;
              unsigned int v83 = v84;
              unsigned int v86 = *v79++;
              unsigned int v85 = v86;
              if (v86 < v83) {
                unsigned int v83 = v85;
              }
              if (v83 > (unsigned __int16)*v81)
              {
                *uint64_t v81 = v83;
                ++v63;
              }
              ++v81;
              --v82;
            }
            while (v82);
          }
        }
        uint64_t v87 = v31 - 2;
        do
        {
          v88 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v87);
          uint64_t v89 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v87 + 1);
          v90 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v87);
          if (v30 >= 1)
          {
            uint64_t v91 = v30;
            do
            {
              unsigned int v93 = *v89++;
              unsigned int v92 = v93;
              unsigned int v95 = *v88++;
              unsigned int v94 = v95;
              if (v95 < v92) {
                unsigned int v92 = v94;
              }
              if (v92 > (unsigned __int16)*v90)
              {
                _WORD *v90 = v92;
                ++v63;
              }
              ++v90;
              --v91;
            }
            while (v91);
          }
          BOOL v51 = v87-- <= 0;
        }
        while (!v51);
      }
    }
    if (v63 < (v30 * v31 / 128)) {
      break;
    }
    BOOL v96 = v191++ >= 7;
  }
  while (!v96);

  char v9 = v185;
  if (v188 < 1)
  {
    unsigned int v98 = 0;
  }
  else
  {
    uint64_t v97 = 0;
    unsigned int v98 = 0;
    do
    {
      v99 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v97);
      unsigned int v100 = *v99;
      if (v100 <= v99[v187 - 1]) {
        unsigned int v100 = v99[v187 - 1];
      }
      if (v98 <= v100) {
        unsigned int v98 = v100;
      }
      ++v97;
    }
    while (v188 != v97);
  }
  v103 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, 0);
  v104 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v188 - 1);
  uint64_t v105 = v187;
  if (v187 >= 1)
  {
    do
    {
      unsigned int v107 = *v103++;
      unsigned int v106 = v107;
      unsigned int v109 = *v104++;
      unsigned int v108 = v109;
      if (v106 <= v109) {
        unsigned int v106 = v108;
      }
      if (v98 <= v106) {
        unsigned int v98 = v106;
      }
      --v105;
    }
    while (v105);
  }
  if (v98 <= 0x2000)
  {
    if (v98 <= 0x200) {
      unsigned __int16 v101 = 512;
    }
    else {
      unsigned __int16 v101 = v98;
    }
    id v110 = objc_alloc(MEMORY[0x1E4F7A598]);
    v111 = [MEMORY[0x1E4F7A5D8] RG16];
    v102 = objc_msgSend(v110, "initWithSize:format:", v187, v188, v111);

    if (v188 >= 1)
    {
      for (uint64_t k = 0; k != v188; ++k)
      {
        v113 = (__int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, k);
        v114 = (__int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, k);
        uint64_t v115 = objc_msgSend(v102, "mutableBytesAtPoint:", 0, k);
        if (v187 >= 1)
        {
          v116 = (_WORD *)(v115 + 2);
          uint64_t v117 = v187;
          do
          {
            __int16 v118 = *v114++;
            *(v116 - 1) = v118;
            __int16 v119 = *v113++;
            _WORD *v116 = v119;
            v116 += 2;
            --v117;
          }
          while (v117);
        }
      }
    }
  }
  else
  {
    unsigned __int16 v101 = 0;
    v102 = 0;
  }

LABEL_121:
  if (!v102) {
    goto LABEL_146;
  }
  id v120 = v190;
  v189 = v102;
  id v121 = v102;
  if (!v120)
  {
    v165 = NUAssertLogger();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
    {
      v166 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "repairBuffer != nil");
      *(_DWORD *)buf = 138543362;
      v193 = v166;
      _os_log_error_impl(&dword_1A9680000, v165, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v167 = (const void **)MEMORY[0x1E4F7A308];
    v168 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v169 = NUAssertLogger();
    BOOL v170 = os_log_type_enabled(v169, OS_LOG_TYPE_ERROR);
    if (v168)
    {
      if (v170)
      {
        v182 = dispatch_get_specific(*v167);
        v183 = [MEMORY[0x1E4F29060] callStackSymbols];
        v184 = [v183 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v193 = v182;
        __int16 v194 = 2114;
        v195 = v184;
        _os_log_error_impl(&dword_1A9680000, v169, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v170)
    {
      v171 = [MEMORY[0x1E4F29060] callStackSymbols];
      v172 = [v171 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v193 = v172;
      _os_log_error_impl(&dword_1A9680000, v169, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_181;
  }
  uint64_t v122 = [v120 size];
  uint64_t v124 = v123;
  double v125 = 1.0;
  double v126 = 1.0 - a2;
  if (1.0 - a2 < 0.01) {
    double v126 = 0.01;
  }
  if (v126 <= 1.0) {
    double v125 = v126;
  }
  unsigned int v127 = vcvtd_n_u64_f64(v125, 0x11uLL);
  if (v127 <= 0x10000) {
    unsigned int v128 = 0x10000 - v127;
  }
  else {
    unsigned int v128 = 0;
  }
  if (v123 >= 1)
  {
    uint64_t v129 = v122;
    uint64_t v130 = 0;
    unsigned int v131 = (16777216.0 / (v125 * (double)v101));
    unsigned int v132 = HIWORD(v127);
    do
    {
      id v133 = v121;
      uint64_t v134 = objc_msgSend(v121, "bytesAtPoint:", 0, v130);
      v135 = (unsigned __int16 *)objc_msgSend(v120, "bytesAtPoint:", 0, v130);
      if (v129 >= 1)
      {
        v136 = (unsigned __int16 *)(v134 + 2);
        uint64_t v137 = v129;
        do
        {
          if (v101 < *(v136 - 1))
          {
            unsigned int v138 = *v136;
            BOOL v96 = v138 >= v101;
            unsigned int v139 = v138 - v101;
            if (!v96) {
              unsigned int v139 = 0;
            }
            unsigned int v140 = (v139 * v131) >> 8;
            if (v140 >= 0xFFFF) {
              unsigned int v140 = 0xFFFF;
            }
            int v141 = *v135;
            int v142 = v135[1];
            if (v132) {
              unsigned int v143 = v141 - v142;
            }
            else {
              unsigned int v143 = v141
            }
                   - v142
                   + (((v142 - ((v142 + ((((v142 * v142) >> 16) * v142) >> 16)) >> 1))
                     * ((v140 * v128) >> 16)) >> 16);
            unsigned __int16 *v135 = v141 - ((v143 * v140) >> 16);
          }
          v135 += 4;
          v136 += 2;
          --v137;
        }
        while (v137);
      }
      ++v130;
      id v121 = v133;
    }
    while (v130 != v124);
  }

  v102 = v189;
LABEL_146:
}

void sub_1A976EEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17, void *a18)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger(void)
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_17005);
  }
  BOOL v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A976F9C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void __getPNCropUtilitiesWrapperClass_block_invoke(uint64_t a1)
{
  PhotosIntelligenceLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PNCropUtilitiesWrapper");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPNCropUtilitiesWrapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPNCropUtilitiesWrapperClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIPNCropUtilitiesWrapper.m", 15, @"Unable to find class %s", "PNCropUtilitiesWrapper");

    __break(1u);
  }
}

void *PhotosIntelligenceLibrary()
{
  uint64_t v0 = PhotosIntelligenceLibraryCore();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotosIntelligenceLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIPNCropUtilitiesWrapper.m", 14, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t PhotosIntelligenceLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PhotosIntelligenceLibraryCore_frameworkLibrary;
  uint64_t v5 = PhotosIntelligenceLibraryCore_frameworkLibrary;
  if (!PhotosIntelligenceLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5D80600;
    long long v7 = *(_OWORD *)&off_1E5D80610;
    v3[3] = _sl_dlopen();
    PhotosIntelligenceLibraryCore_frameworkLibrardouble y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A976FC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PhotosIntelligenceLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PhotosIntelligenceLibraryCore_frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A9770074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  if (a15) {
    operator delete(a15);
  }
  if (a18) {
    operator delete(a18);
  }

  _Unwind_Resume(a1);
}

void sub_1A97700F0()
{
  JUMPOUT(0x1A97700DCLL);
}

void sub_1A9770100()
{
}

void sub_1A9770108()
{
  JUMPOUT(0x1A97700E0);
}

void sub_1A9770118()
{
}

void sub_1A9770120()
{
  JUMPOUT(0x1A97700E4);
}

void sub_1A977012C()
{
}

void sub_1A9770134()
{
  JUMPOUT(0x1A97700E8);
}

void sub_1A9770AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke_17192()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9770E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9771520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28)
{
  operator delete(v30);
  operator delete(v29);

  _Unwind_Resume(a1);
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    long long v6 = (_DWORD *)a1[1];
    long long v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A9771690(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D7E648, MEMORY[0x1E4FBA1C8]);
}

void sub_1A97717B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1A9771A48(_Unwind_Exception *a1)
{
  long long v7 = v5;

  _Unwind_Resume(a1);
}

id NUAssertLogger_17311()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_97);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_17332()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_18043()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_191);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_18066()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_18111()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97771B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18130(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18131(uint64_t a1)
{
}

void sub_1A9777AF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A9778AA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_18177()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_56);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NURenderLogger()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_58);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A760];
  return v0;
}

uint64_t __NURenderLogger_block_invoke_18211()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_18225()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_18295()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_18320);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_18323()
{
  return MEMORY[0x1F4130BA0]();
}

id _lightMapImageFromData(void *a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)[v5 length];
  if (v8)
  {
    LODWORD(v9) = [v6 intValue];
    int v10 = [v7 intValue];
    if (v9 && v10)
    {
      unint64_t v9 = (int)v9;
      unint64_t v11 = v10;
    }
    else
    {
      unint64_t v9 = vcvtmd_u64_f64(sqrt((double)(unint64_t)v8 * 0.5));
      unint64_t v11 = v9;
    }
    if (v8 == (void *)(2 * v9 * v11))
    {
      uint64_t v12 = *MEMORY[0x1E4F1E3D8];
      v21[0] = *MEMORY[0x1E4F1E3D0];
      v21[1] = v12;
      v22[0] = v5;
      v22[1] = @"PILocalLightHDR";
      unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      id v14 = objc_alloc(MEMORY[0x1E4F1E050]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = ___lightMapImageFromData_block_invoke_18371;
      v16[3] = &unk_1E5D80820;
      unint64_t v18 = v9;
      unint64_t v19 = v11;
      id v17 = v5;
      unsigned int v20 = v8;
      uint64_t v8 = (void *)[v14 initWithImageProvider:v16 width:v9 height:v11 format:*MEMORY[0x1E4F1E2D0] colorSpace:0 options:v13];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

id _scaledLightMapImage(void *a1, void *a2)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    [v3 extent];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v5 extent];
    v27.origin.x = v15;
    v27.origin.double y = v16;
    v27.size.double width = v17;
    v27.size.double height = v18;
    v25.origin.x = v8;
    v25.origin.double y = v10;
    v25.size.double width = v12;
    v25.size.double height = v14;
    if (CGRectEqualToRect(v25, v27))
    {
      id v6 = v3;
    }
    else
    {
      [v3 extent];
      v28.origin.x = 0.0;
      v28.origin.double y = 0.0;
      v28.size.double width = 1.0;
      v28.size.double height = 1.0;
      if (CGRectEqualToRect(v26, v28))
      {
        unint64_t v19 = [v3 imageByClampingToExtent];
        [v5 extent];
        uint64_t v20 = objc_msgSend(v19, "imageByCroppingToRect:");
      }
      else
      {
        v22[0] = @"inputSmallImage";
        v22[1] = @"inputSpatialSigma";
        v23[0] = v3;
        v23[1] = &unk_1F000F0D8;
        v22[2] = @"inputLumaSigma";
        v23[2] = &unk_1F000F0E8;
        unint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
        uint64_t v20 = [v5 imageByApplyingFilter:@"CIEdgePreserveUpsampleRGFilter" withInputParameters:v19];
      }
      id v6 = (id)v20;
    }
  }

  return v6;
}

char *___lightMapImageFromData_block_invoke_18371(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 54, "x == 0");
  }
  if (a5) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 55, "y == 0");
  }
  if (*(void *)(a1 + 40) != a6) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 56, "width == lmWidth");
  }
  uint64_t v8 = a7;
  if (*(void *)(a1 + 48) != a7) {
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 57, "height == lmHeight");
  }
  size_t v11 = 2 * a6;
  uint64_t result = (char *)[*(id *)(a1 + 32) bytes];
  double v13 = result;
  if (v11 == a3)
  {
    size_t v14 = *(void *)(a1 + 56);
    return (char *)memcpy(a2, result, v14);
  }
  else
  {
    for (; v8; --v8)
    {
      uint64_t result = (char *)memcpy(a2, v13, v11);
      v13 += v11;
      a2 += a3;
    }
  }
  return result;
}

uint64_t area_light_stats_from_histogram(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  long double v5 = 0.0;
  long double v6 = 0.0;
  do
  {
    double v7 = fmin((double)v4 / 255.0, 1.0);
    double v8 = *(double *)(a1 + 8 * v4);
    long double v5 = v5 + v8 * log(v7 + 0.00392156863);
    *(long double *)a2 = v5;
    long double v6 = v6 + v8 * log(1.0 - v7 + 0.00392156863);
    *(long double *)(a2 + 8) = v6;
    ++v4;
  }
  while (v4 != 256);
  *(long double *)a2 = exp(v5);
  *(long double *)(a2 + 8) = exp(v6);
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v12 = 0;
  double v13 = 1.0e-40;
  do
  {
    double v13 = v13 + *(double *)(a1 + v12);
    v12 += 8;
  }
  while (v12 != 2048);
  uint64_t v14 = 0;
  double v15 = 0.0;
  do
  {
    double v15 = v15 + *(double *)(a1 + v14);
    *(double *)&v29[v14] = v15 / v13;
    v14 += 8;
  }
  while (v14 != 2048);
  unint64_t v16 = 0;
  double v17 = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  double v18 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = 0.0;
  do
  {
    double v23 = *(double *)&v29[8 * v16];
    if (v23 >= 0.001 && v22 == 0.0) {
      double v22 = (double)v16 / 255.0;
    }
    if (v23 >= 0.02 && v21 == 0.0)
    {
      double v21 = (double)v16 / 255.0;
      *(double *)(a2 + 16) = v21;
    }
    if (v23 >= 0.1 && v20 == 0.0)
    {
      double v20 = (double)v16 / 255.0;
      *(double *)(a2 + 24) = v20;
    }
    if (v23 >= 0.25 && v19 == 0.0)
    {
      double v19 = (double)v16 / 255.0;
      *(double *)(a2 + 32) = v19;
    }
    if (v23 >= 0.5 && v18 == 0.0)
    {
      double v18 = (double)v16 / 255.0;
      *(double *)(a2 + 40) = v18;
    }
    if (v23 >= 0.98 && v17 == 0.0)
    {
      double v17 = (double)v16 / 255.0;
      *(double *)(a2 + 48) = v17;
    }
    if (v23 >= 1.0 && *(double *)(a2 + 72) == 0.0) {
      *(double *)(a2 + 72) = (double)v16 / 255.0;
    }
    ++v16;
  }
  while (v16 != 256);
  *(double *)(a2 + 64) = v22 * ((sqrt(v22) * -0.65 + 1.0) * 0.85);
  double v24 = 0.6 - v18 - v19;
  if (v11 >= 0.8 || *(double *)(a2 + 72) >= 1.0) {
    double v25 = v24 * 0.9;
  }
  else {
    double v25 = v24 + fmin(0.8 - v11, 0.2);
  }
  double v26 = v18 + v19;
  if (v26 > 0.6)
  {
    if (v17 >= 1.0) {
      double v27 = -0.4;
    }
    else {
      double v27 = -0.7;
    }
    double v25 = v26 + v27;
  }
  double v28 = fmax(v25, 0.1);
  if (v21 <= 0.015 || v17 <= 0.95 || v18 <= 0.14)
  {
    if (v21 > 0.055) {
      double v28 = -v28;
    }
  }
  else
  {
    double v28 = -v28;
  }
  *(double *)(a2 + 56) = v28 * 0.68;
  return result;
}

id arealight_coeffs_from_stats(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * a2];
  uint64_t v5 = [v4 mutableBytes];
  if (v2)
  {
    uint64_t v12 = (unsigned char *)(v5 + 1);
    do
    {
      polyfit_stats((uint64_t)v14, a1, v6, v7, v8, v9, v10, v11);
      *(float *)&double v7 = v14[2];
      double v6 = (v14[0] + 1.2) * 0.29412 * 255.0;
      *(v12 - 1) = llround(v6);
      *(float *)&double v6 = *(float *)&v7 * 255.0;
      *uint64_t v12 = llroundf(*(float *)&v7 * 255.0);
      v12 += 2;
      a1 += 80;
      --v2;
    }
    while (v2);
  }
  return v4;
}

id average_light_coeffs_from_stats(uint64_t a1, unint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2];
  uint64_t v5 = (unsigned char *)[v4 mutableBytes];
  if (a2)
  {
    float v12 = 0.0;
    unint64_t v13 = a2;
    float v14 = 0.0;
    do
    {
      polyfit_stats((uint64_t)v16, a1, v6, v7, v8, v9, v10, v11);
      *(float *)&double v6 = v16[0];
      *(float *)&double v7 = v17;
      float v14 = v14 + v16[0];
      float v12 = v12 + v17;
      a1 += 80;
      --v13;
    }
    while (v13);
  }
  else
  {
    float v14 = 0.0;
    float v12 = 0.0;
  }
  *uint64_t v5 = llround(((float)(v14 / (float)a2) + 1.2) * 0.29412 * 255.0);
  v5[1] = llroundf((float)(v12 / (float)a2) * 255.0);
  return v4;
}

float polyfit_stats(uint64_t a1, uint64_t a2, double a3, double a4, int8x16_t a5, double a6, float32x4_t a7, double a8)
{
  uint64_t v8 = 0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0x3EDEB85200000000;
  int v31 = 1065353216;
  double v9 = *(double *)(a2 + 40);
  a7.i32[1] = -1075629261;
  if (v9 >= 0.435) {
    double v10 = (v9 + -0.435) * -0.6 + 0.435;
  }
  else {
    double v10 = (0.435 - v9) * 0.6 + 0.435;
  }
  v29[0] = 0;
  float v11 = v10;
  *(float *)&v29[1] = v11;
  v29[2] = 1065353216;
  float32x4_t v12 = 0uLL;
  float32x2_t v13 = 0;
  float v14 = 0.0;
  a5.i64[0] = 0;
  do
  {
    a7.i32[0] = *(_DWORD *)((char *)&v30 + v8 * 4);
    *(float *)a5.i32 = *(float *)a5.i32 + a7.f32[0];
    float v15 = *(float *)&v29[v8];
    int32x4_t v16 = (int32x4_t)a7;
    *(float *)&v16.i32[1] = v15;
    float32x4_t v17 = (float32x4_t)vzip1q_s32(v16, v16);
    v17.i32[2] = a7.i32[0];
    v13.f32[0] = v13.f32[0] + (float)(a7.f32[0] * v15);
    a7.f32[1] = a7.f32[0] * a7.f32[0];
    a7.f32[2] = a7.f32[0] * (float)(a7.f32[0] * a7.f32[0]);
    float v14 = v14 + v15;
    a7.f32[3] = a7.f32[0] * a7.f32[0];
    float32x4_t v12 = vmlaq_f32(v12, v17, a7);
    ++v8;
  }
  while (v8 != 3);
  __asm { FMOV            V4.4S, #3.0 }
  _Q4.i32[1] = a5.i32[0];
  _Q4.i64[1] = __PAIR64__(LODWORD(v14), v12.u32[0]);
  float32x4_t v23 = (float32x4_t)vextq_s8(vextq_s8(a5, a5, 4uLL), (int8x16_t)v12, 0xCuLL);
  v23.i32[3] = v13.i32[0];
  *(float *)&a8 = v12.f32[0] / 3.0;
  v13.f32[0] = *(float *)a5.i32 / 3.0;
  float32x4_t v24 = vmlsq_lane_f32(v23, _Q4, v13, 0);
  float32x4_t v25 = vmlsq_lane_f32(v12, _Q4, *(float32x2_t *)&a8, 0);
  float32x4_t v26 = vmlsq_lane_f32(v25, v24, (float32x2_t)*(_OWORD *)&vdivq_f32(v25, v24), 1);
  float32x4_t v27 = vmlsq_laneq_f32(v24, v26, vdivq_f32(v24, v26), 2);
  *(float *)a1 = v26.f32[3] / v26.f32[2];
  *(_DWORD *)(a1 + 4) = vdivq_f32((float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&v27, 3), v27).i32[1];
  float result = *(double *)(a2 + 48);
  *(float *)(a1 + 8) = result;
  return result;
}

id getVCPMediaAnalysisServiceClass_18529()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVCPMediaAnalysisServiceClass_softClass_18530;
  uint64_t v7 = getVCPMediaAnalysisServiceClass_softClass_18530;
  if (!getVCPMediaAnalysisServiceClass_softClass_18530)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalysisServiceClass_block_invoke_18531;
    v3[3] = &unk_1E5D81578;
    v3[4] = &v4;
    __getVCPMediaAnalysisServiceClass_block_invoke_18531((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A977BC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVCPMediaAnalysisServiceClass_block_invoke_18531(uint64_t a1)
{
  MediaAnalysisLibrary_18532();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass_18530 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getVCPMediaAnalysisServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIParallaxAsset.m", 26, @"Unable to find class %s", "VCPMediaAnalysisService");

    __break(1u);
  }
}

void *MediaAnalysisLibrary_18532()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_18543)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaAnalysisLibraryCore_block_invoke_18544;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5D808D0;
    uint64_t v6 = 0;
    MediaAnalysisLibraryCore_frameworkLibrary_18543 = _sl_dlopen();
  }
  uint64_t v0 = (void *)MediaAnalysisLibraryCore_frameworkLibrary_18543;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_18543)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *MediaAnalysisLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PIParallaxAsset.m", 25, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MediaAnalysisLibraryCore_block_invoke_18544()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisLibraryCore_frameworkLibrary_18543 = result;
  return result;
}

void sub_1A977C5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisResultsKey_18554()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getMediaAnalysisResultsKeySymbolLoc_ptr_18573;
  uint64_t v9 = getMediaAnalysisResultsKeySymbolLoc_ptr_18573;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr_18573)
  {
    id v1 = MediaAnalysisLibrary_18532();
    void v7[3] = (uint64_t)dlsym(v1, "MediaAnalysisResultsKey");
    getMediaAnalysisResultsKeySymbolLoc_ptr_18573 = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultsKey(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PIParallaxAsset.m", 27, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A977C758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisSettlingEffectsGatingResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

id NUAssertLogger_18556()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_176_18569);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void *__getMediaAnalysisResultQualityKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisResultQualityKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultQualityKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NUAssertLogger_block_invoke_18572()
{
  return MEMORY[0x1F4130BA0]();
}

void *__getMediaAnalysisResultsKeySymbolLoc_block_invoke_18574(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultsKeySymbolLoc_ptr_18573 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A977CDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A977D104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMediaAnalysisResultAttributesKeySymbolLoc_block_invoke_18584(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisResultAttributesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultAttributesKeySymbolLoc_ptr_18583 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisResultPetsBoundsAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisPetsResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisPetsResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisPetsResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisPetsFaceResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaAnalysisLibrary_18532();
  uint64_t result = dlsym(v2, "MediaAnalysisPetsFaceResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A977DF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PIMsgImageBuffer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A977E004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A977E0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A977E430(_Unwind_Exception *a1)
{
  long long v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A977E5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke_18776()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A977E718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18777(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18778(uint64_t a1)
{
}

void sub_1A977EBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1A977FAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1A977FD08(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void MsgMatrix<double>::AppendRow<double>(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)a1 != 3)
  {
    int32x4_t v16 = NUAssertLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      float32x4_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "num == w");
      *(_DWORD *)buf = 138543362;
      double v28 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        float32x4_t v24 = dispatch_get_specific(*v18);
        float32x4_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        float32x4_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v28 = v24;
        __int16 v29 = 2114;
        uint64_t v30 = v26;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      double v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      float32x4_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
LABEL_29:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = 0;
  long long v5 = *(char **)(a1 + 16);
  do
  {
    unint64_t v6 = *(void *)(a1 + 24);
    if ((unint64_t)v5 >= v6)
    {
      uint64_t v8 = *(char **)(a1 + 8);
      uint64_t v9 = (v5 - v8) >> 3;
      unint64_t v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 61) {
        goto LABEL_29;
      }
      uint64_t v11 = v6 - (void)v8;
      if (v11 >> 2 > v10) {
        unint64_t v10 = v11 >> 2;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v12);
        uint64_t v8 = *(char **)(a1 + 8);
        long long v5 = *(char **)(a1 + 16);
      }
      else
      {
        uint64_t v13 = 0;
      }
      float v14 = (void *)(v12 + 8 * v9);
      *float v14 = *(void *)(a2 + 8 * v4);
      uint64_t v7 = (char *)(v14 + 1);
      while (v5 != v8)
      {
        uint64_t v15 = *((void *)v5 - 1);
        v5 -= 8;
        *--float v14 = v15;
      }
      *(void *)(a1 + 8) = v14;
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v12 + 8 * v13;
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *(void *)long long v5 = *(void *)(a2 + 8 * v4);
      uint64_t v7 = v5 + 8;
    }
    *(void *)(a1 + 16) = v7;
    ++v4;
    long long v5 = v7;
  }
  while (v4 != 3);
  ++*(_DWORD *)(a1 + 4);
}

void sub_1A9780040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t MsgMatrix<double>::operator()(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = *a1;
  if (v3 <= a2 || a1[1] <= a3)
  {
    uint64_t v7 = NUAssertLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "xi < w && yi < h");
      *(_DWORD *)buf = 138543362;
      float32x4_t v27 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v11 = NUAssertLogger();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v13 = dispatch_get_specific(*v9);
        float v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        float32x4_t v27 = v13;
        __int16 v28 = 2114;
        __int16 v29 = v15;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
LABEL_17:
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      float32x4_t v27 = v22;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_20:

    _NUAssertFailHandler();
    __break(1u);
  }
  unint64_t v4 = a2 + v3 * a3;
  uint64_t v5 = *((void *)a1 + 1);
  if (v4 >= (*((void *)a1 + 2) - v5) >> 3)
  {
    int32x4_t v16 = NUAssertLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      float32x4_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "index < data.size()");
      *(_DWORD *)buf = 138543362;
      float32x4_t v27 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    double v19 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v11 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!v19)
    {
      if (!v20) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if (v20)
    {
      float32x4_t v23 = dispatch_get_specific(*v18);
      float32x4_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      float32x4_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      float32x4_t v27 = v23;
      __int16 v28 = 2114;
      __int16 v29 = v25;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  return v5 + 8 * v4;
}

void sub_1A97804B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void *MsgMatrix<double>::T(unsigned int *a1, unsigned int *a2)
{
  unsigned int v5 = *a2;
  unsigned int v4 = a2[1];
  uint64_t v17 = 0;
  *a1 = v4;
  a1[1] = v5;
  __n128 result = std::vector<double>::vector((void *)a1 + 1, v5 * v4, &v17);
  uint64_t v7 = a2[1];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (uint64_t *)*((void *)a2 + 1);
    unint64_t v10 = (void *)*((void *)a1 + 1);
    uint64_t v11 = *a2;
    uint64_t v12 = 8 * *a1;
    do
    {
      uint64_t v13 = v9;
      float v14 = v10;
      uint64_t v15 = v11;
      if (v11)
      {
        do
        {
          uint64_t v16 = *v13++;
          *float v14 = v16;
          float v14 = (void *)((char *)v14 + v12);
          --v15;
        }
        while (v15);
      }
      ++v8;
      ++v10;
      v9 += v11;
    }
    while (v8 != v7);
  }
  return result;
}

void *std::vector<double>::vector(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A9780640(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

uint64_t __NULogger_block_invoke_19097()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A9782CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_19209()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19241);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

Class __getIHKFeatureVectorClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary_19221)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __ImageHarmonizationKitLibraryCore_block_invoke_19222;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5D80938;
    uint64_t v8 = 0;
    ImageHarmonizationKitLibraryCore_frameworkLibrary_19221 = _sl_dlopen();
  }
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary_19221)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *ImageHarmonizationKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PISliderNetAdjustmentsRequest.m", 28, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("IHKFeatureVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unsigned int v5 = [NSString stringWithUTF8String:"Class getIHKFeatureVectorClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PISliderNetAdjustmentsRequest.m", 29, @"Unable to find class %s", "IHKFeatureVector");

LABEL_10:
    __break(1u);
  }
  getIHKFeatureVectorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ImageHarmonizationKitLibraryCore_block_invoke_19222()
{
  uint64_t result = _sl_dlopen();
  ImageHarmonizationKitLibraryCore_frameworkLibrary_19221 = result;
  return result;
}

uint64_t __NUAssertLogger_block_invoke_19244()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_19348()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_19382()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_19402()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_19911()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19945);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_19938()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_19948()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_20030()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_20031()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_20015);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NUAssertLogger_20221()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_108);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_20233()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t smart_tone_stats_from_histogram(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3 + a2;
  if (a3 + a2 >= 2)
  {
    unint64_t v6 = (double *)result;
    unint64_t v7 = 0;
    double v8 = (double)a2 + -1.0;
    *(void *)(a4 + 72) = 0;
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    long double v9 = 0.0;
    long double v10 = 0.0;
    do
    {
      double v11 = fmin((double)v7 / v8, 1.0);
      double v12 = v6[v7];
      long double v9 = v9 + v12 * log(v11 + 0.00392156863);
      *(long double *)a4 = v9;
      long double v10 = v10 + v12 * log(1.0 - v11 + 0.00392156863);
      *(long double *)(a4 + 8) = v10;
      ++v7;
    }
    while (v4 != v7);
    *(long double *)a4 = exp(v9);
    *(long double *)(a4 + 8) = exp(v10);
    uint64_t result = MEMORY[0x1F4188790](v38);
    float v14 = (double *)((char *)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    double v15 = 1.0e-40;
    uint64_t v16 = v6;
    uint64_t v17 = v4;
    do
    {
      double v18 = *v16++;
      double v15 = v15 + v18;
      --v17;
    }
    while (v17);
    double v19 = 0.0;
    BOOL v20 = v14;
    uint64_t v21 = v4;
    do
    {
      double v22 = *v6++;
      double v19 = v19 + v22;
      *v20++ = v19 / v15;
      --v21;
    }
    while (v21);
    unint64_t v23 = 0;
    double v24 = 0.0;
    *(_OWORD *)(a4 + 16) = 0u;
    *(void *)(a4 + 48) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    double v25 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    do
    {
      double v30 = v14[v23];
      if (v30 >= 0.001 && v29 == 0.0) {
        double v29 = (double)v23 / v8;
      }
      if (v30 >= 0.02 && v28 == 0.0)
      {
        double v28 = (double)v23 / v8;
        *(double *)(a4 + 16) = v28;
      }
      if (v30 >= 0.1 && v27 == 0.0)
      {
        double v27 = (double)v23 / v8;
        *(double *)(a4 + 24) = v27;
      }
      if (v30 >= 0.25 && v26 == 0.0)
      {
        double v26 = (double)v23 / v8;
        *(double *)(a4 + 32) = v26;
      }
      if (v30 >= 0.5 && v25 == 0.0)
      {
        double v25 = (double)v23 / v8;
        *(double *)(a4 + 40) = v25;
      }
      if (v30 >= 0.98 && v24 == 0.0)
      {
        double v24 = (double)v23 / v8;
        *(double *)(a4 + 48) = v24;
      }
      if (v30 >= 1.0 && *(double *)(a4 + 72) == 0.0) {
        *(double *)(a4 + 72) = (double)v23 / v8;
      }
      ++v23;
    }
    while (v4 != v23);
    *(double *)(a4 + 64) = v29 * ((sqrt(v29) * -0.65 + 1.0) * 0.85);
    double v31 = 0.6 - v25 - v26;
    double v32 = *(double *)(a4 + 8);
    if (v32 >= 0.8 || *(double *)(a4 + 72) >= 1.0) {
      double v33 = v31 * 0.9;
    }
    else {
      double v33 = v31 + fmin(0.8 - v32, 0.2);
    }
    double v34 = v25 + v26;
    if (v34 > 0.6)
    {
      if (v24 >= 1.0) {
        double v35 = -0.4;
      }
      else {
        double v35 = -0.7;
      }
      double v33 = v34 + v35;
    }
    double v36 = fmax(v33, 0.1);
    if (v28 <= 0.015 || v24 <= 0.95 || v25 <= 0.14)
    {
      double v37 = -v36;
      if (v28 <= 0.055) {
        double v37 = v36;
      }
    }
    else
    {
      double v37 = -v36;
    }
    *(double *)(a4 + 56) = v37 * 0.68;
  }
  return result;
}

id NUAssertLogger_20707()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_404);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_20725()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_20731()
{
  return MEMORY[0x1F4130BA0]();
}

id NURenderLogger_21172()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A760];
  return v0;
}

uint64_t __NURenderLogger_block_invoke_21201()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_21762()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_21879()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_1258);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_21901()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_22297()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_411);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_22313()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_22534()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_22535()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_588);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NULogger_22543()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_586);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_22549()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97A2188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22558(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22559(uint64_t a1)
{
}

void sub_1A97A3748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 256), 8);
  _Block_object_dispose((const void *)(v61 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A97A50AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1A97AACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_22987()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23001);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_23004()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_23148()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23155);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_23158()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97B5208(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_23751()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_23842);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NULogger_23796()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_242);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NULogger_block_invoke_23799()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_23845()
{
  return MEMORY[0x1F4130BA0]();
}

double smart_color_adjustments_from_stats(double *a1, double *a2, double result)
{
  *a1 = 0.0;
  a1[1] = 0.0;
  a1[2] = 0.0;
  double v3 = a2[1];
  if (result == 0.0 || v3 >= 0.01)
  {
    double v4 = 0.0;
    if (result + result > 1.0 - v3) {
      double v4 = -(1.0 - v3 - result * 2.0) * 0.75;
    }
    if (result >= 0.0)
    {
      double v5 = result / 3.0;
      uint64_t result = result / (fmax(*a2, 0.5) * 3.0);
      if (*a2 <= 0.0) {
        uint64_t result = v5;
      }
    }
    *a1 = fmin(fmax(result, -1.0), 1.0);
    if (a2[3] > 0.75)
    {
      double v6 = *a2;
      if (v3 > 0.9 && v6 > 0.55 && v6 < 0.65) {
        double v4 = -v4;
      }
    }
    uint64_t result = fmin(fmax(v4 * 0.5, -1.0), 1.0);
    a1[1] = result;
  }
  return result;
}

void sub_1A97BFBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id NUAssertLogger_24119()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_184);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

void sub_1A97BFF10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24145(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24146(uint64_t a1)
{
}

uint64_t __NUAssertLogger_block_invoke_24164()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NULogger_block_invoke_24231()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_24469()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_24487);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_24490()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97C4EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL8NULoggerv_block_invoke()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97C5500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t isLivePhotoMetadataTrack(AVAssetTrack *a1)
{
  uint64_t v1 = [(AVAssetTrack *)a1 formatDescriptions];
  if ([v1 count] == 1
    && ([v1 firstObject],
        uint64_t v2 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    double v3 = CMMetadataFormatDescriptionGetIdentifiers(v2);
    double v4 = v3;
    if (v3) {
      uint64_t v5 = [v3 containsObject:*MEMORY[0x1E4F52790]];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1A97C55F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C565C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C56D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_24718()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_95_24738);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_24741()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97C6CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24787(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24788(uint64_t a1)
{
}

void sub_1A97C738C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke_24815()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t ___ZL8NULoggerv_block_invoke_24818()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97C7928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C7DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_1A97C7F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C80E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C857C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C88B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97C8F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float grainParams(float a1)
{
  if (a1 < 400.0) {
    int v1 = 1;
  }
  else {
    int v1 = 2;
  }
  if (a1 >= 50.0) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = 0;
  }
  float v3 = log10f(a1);
  float v4 = log10f(flt_1A980BA90[v2]);
  return fmaxf(flt_1A980BAA0[v2]+ (float)((float)(flt_1A980BAA0[v2 + 1] - flt_1A980BAA0[v2])* (float)((float)(v3 - v4) / (float)(log10f(flt_1A980BA90[v2 + 1]) - v4))), 0.5);
}

id applyGrainParams(void *a1, float a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  float v3 = grainParams(a2);
  int v5 = v4;
  int v7 = v6;
  double v8 = [a1 imageByApplyingGaussianBlurWithSigma:v3];
  v16[0] = @"inputRadius";
  LODWORD(v9) = v5;
  long double v10 = [NSNumber numberWithFloat:v9];
  v16[1] = @"inputIntensity";
  v17[0] = v10;
  LODWORD(v11) = v7;
  double v12 = [NSNumber numberWithFloat:v11];
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  float v14 = [v8 imageByApplyingFilter:@"CIUnsharpMask" withInputParameters:v13];

  return v14;
}

unint64_t __generateNoiseImage_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a6 != 1536) {
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 224, "width==512*3");
  }
  if (a7 != 1536) {
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 225, "height==512*3");
  }
  if (a4) {
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 226, "x==0");
  }
  if (a5) {
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 227, "y==0");
  }
  uint64_t v7 = 0;
  long long v8 = 0uLL;
  long long v9 = xmmword_1A980B990;
  uint64_t v10 = (a3 << 9) | 3;
  uint64_t v11 = (a3 << 10) | 1;
  do
  {
    unint64_t v12 = 0;
    uint64_t v13 = (unsigned char *)(a2 + v7 * a3);
    uint64_t v20 = v7;
    uint64_t v14 = 1536;
    do
    {
      uint64_t __src = v7 - 261632 * (v12 / 0x1FF);
      long long v26 = v8;
      long long v27 = v8;
      uint64_t v23 = *((void *)&v8 + 1);
      uint64_t v25 = *((void *)&v8 + 1);
      double v15 = &v13[v10];
      uint64_t v16 = &v13[v11];
      v21[1] = v8;
      long long v22 = v9;
      uint64_t v24 = 0x61C8864E7A143579;
      v21[0] = 0;
      XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
      unint64_t result = XXH64_digest((uint64_t)v21);
      long long v9 = xmmword_1A980B990;
      long long v8 = 0uLL;
      v13[2] = result;
      v13[1] = result;
      *uint64_t v13 = result;
      v13[3] = -1;
      *(v15 - 1) = result;
      *(v15 - 2) = result;
      *(v15 - 3) = result;
      *double v15 = -1;
      v16[1] = result;
      *uint64_t v16 = result;
      ++v12;
      *(v16 - 1) = result;
      v13 += 4;
      v7 += 512;
      void v16[2] = -1;
      --v14;
    }
    while (v14);
    uint64_t v7 = v20 + 1;
  }
  while (v20 != 511);
  return result;
}

uint64_t __NUAssertLogger_block_invoke_25172()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_25216()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25157);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_25282()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97CDB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPMediaAnalysisServiceClass_block_invoke_25325(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_25335)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MediaAnalysisLibraryCore_block_invoke_25336;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5D81598;
    uint64_t v8 = 0;
    MediaAnalysisLibraryCore_frameworkLibrary_25335 = _sl_dlopen();
  }
  if (!MediaAnalysisLibraryCore_frameworkLibrary_25335)
  {
    float v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"void *MediaAnalysisLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PISegmentation.m", 31, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("VCPMediaAnalysisService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    float v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v5 = [NSString stringWithUTF8String:"Class getVCPMediaAnalysisServiceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PISegmentation.m", 32, @"Unable to find class %s", "VCPMediaAnalysisService");

LABEL_10:
    __break(1u);
  }
  getVCPMediaAnalysisServiceClass_softClass_25324 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAnalysisLibraryCore_block_invoke_25336()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisLibraryCore_frameworkLibrary_25335 = result;
  return result;
}

void sub_1A97CED20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A97CEE28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A97CF0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_25467()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_25490);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_25493()
{
  return MEMORY[0x1F4130BA0]();
}

id optionsForFormat(void *a1)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unsigned int v2 = [MEMORY[0x1E4F7A698] currentSoftwareVersion];
  float v3 = [v2 platform];
  int v4 = [v2 buildNumber];
  int v5 = [NSString stringWithFormat:@"GU %@ %@", v3, v4];
  uint64_t v38 = *MEMORY[0x1E4F2FD88];
  v39[0] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  long long v7 = [MEMORY[0x1E4F7A5D8] RGBAf];
  int v8 = [v1 isEqualToPixelFormat:v7];

  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F2FBE0];
    v36[0] = *MEMORY[0x1E4F2F6B8];
    v36[1] = v9;
    v37[0] = &unk_1F000A070;
    v37[1] = MEMORY[0x1E4F1CC38];
    uint64_t v10 = *MEMORY[0x1E4F2F578];
    _OWORD v36[2] = *MEMORY[0x1E4F2FB40];
    v36[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F2F588];
    v37[2] = MEMORY[0x1E4F1CC38];
    _OWORD v37[3] = v11;
    v36[4] = *MEMORY[0x1E4F2FD40];
    v37[4] = v6;
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = v37;
    uint64_t v14 = v36;
    uint64_t v15 = 5;
LABEL_10:
    double v28 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
    goto LABEL_11;
  }
  uint64_t v16 = [MEMORY[0x1E4F7A5D8] RGBA16];
  int v17 = [v1 isEqualToPixelFormat:v16];

  if (v17)
  {
    uint64_t v18 = *MEMORY[0x1E4F2FB40];
    v34[0] = *MEMORY[0x1E4F2F6B8];
    v34[1] = v18;
    v35[0] = &unk_1F000A088;
    v35[1] = MEMORY[0x1E4F1CC38];
    uint64_t v19 = *MEMORY[0x1E4F2FD40];
    _OWORD v34[2] = *MEMORY[0x1E4F2F578];
    v34[3] = v19;
    v35[2] = *MEMORY[0x1E4F2F588];
    v35[3] = v6;
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = v35;
    uint64_t v14 = v34;
LABEL_9:
    uint64_t v15 = 4;
    goto LABEL_10;
  }
  uint64_t v20 = [MEMORY[0x1E4F7A5D8] ARGB8];
  int v21 = [v1 isEqualToPixelFormat:v20];

  if (v21)
  {
    uint64_t v22 = *MEMORY[0x1E4F2FB40];
    v32[0] = *MEMORY[0x1E4F2F6B8];
    v32[1] = v22;
    v33[0] = &unk_1F000A0A0;
    v33[1] = MEMORY[0x1E4F1CC38];
    uint64_t v23 = *MEMORY[0x1E4F2FD40];
    _OWORD v32[2] = *MEMORY[0x1E4F2F578];
    v32[3] = v23;
    v33[2] = *MEMORY[0x1E4F2F588];
    v33[3] = v6;
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = v33;
    uint64_t v14 = v32;
    goto LABEL_9;
  }
  uint64_t v24 = [MEMORY[0x1E4F7A5D8] BGRA8];
  int v25 = [v1 isEqualToPixelFormat:v24];

  if (v25)
  {
    uint64_t v26 = *MEMORY[0x1E4F2FB40];
    v30[0] = *MEMORY[0x1E4F2F6B8];
    v30[1] = v26;
    v31[0] = &unk_1F000A0A0;
    v31[1] = MEMORY[0x1E4F1CC38];
    uint64_t v27 = *MEMORY[0x1E4F2FD40];
    v30[2] = *MEMORY[0x1E4F2F578];
    v30[3] = v27;
    v31[2] = *MEMORY[0x1E4F2F588];
    v31[3] = v6;
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = v31;
    uint64_t v14 = v30;
    goto LABEL_9;
  }
  double v28 = 0;
LABEL_11:

  return v28;
}

void sub_1A97D187C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97D1F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A97D22AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke_25597()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97D2598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A97D2ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL8NULoggerv_block_invoke_25626()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_25708()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_389);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

id NULogger_25825()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A758];
  return v0;
}

uint64_t __NULogger_block_invoke_25831()
{
  return MEMORY[0x1F4130BA0]();
}

uint64_t __NUAssertLogger_block_invoke_25861()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97D55AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
}

id NUAssertLogger_26263()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_240);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_26277()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97DBC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v31 = (void *)STACK[0xB38];
  if (STACK[0xB38])
  {
    STACK[0xB40] = (unint64_t)v31;
    operator delete(v31);
  }
  uint64_t v32 = 0;
  while (1)
  {
    double v33 = *(void **)(&a30 + v32 + 2680);
    if (v33)
    {
      *(void *)(&a30 + v32 + 2688) = v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (v32 == -72)
    {
      double v34 = (void *)STACK[0xAD8];
      if (STACK[0xAD8])
      {
        STACK[0xAE0] = (unint64_t)v34;
        operator delete(v34);
      }
      double v35 = (void *)STACK[0xAC0];
      if (STACK[0xAC0])
      {
        STACK[0xAC8] = (unint64_t)v35;
        operator delete(v35);
      }
      double v36 = (void *)STACK[0xAA8];
      if (STACK[0xAA8])
      {
        STACK[0xAB0] = (unint64_t)v36;
        operator delete(v36);
      }
      double v37 = (void *)STACK[0xA90];
      if (STACK[0xA90])
      {
        STACK[0xA98] = (unint64_t)v37;
        operator delete(v37);
      }
      _Unwind_Resume(a1);
    }
  }
}

void _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
    int v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    long long v7 = &v4[4 * v6];
    uint64_t v9 = (char *)*a1;
    int v8 = (char *)a1[1];
    uint64_t v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        int v11 = *((_DWORD *)v8 - 1);
        v8 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v8 != v9);
      int v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm(char **a1, unint64_t a2)
{
  int v4 = *a1;
  int64_t v3 = a1[1];
  unint64_t v5 = (v3 - *a1) >> 4;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    uint64_t v16 = &v4[16 * a2];
    goto LABEL_20;
  }
  unint64_t v6 = a2 - v5;
  long long v7 = a1[2];
  if (a2 - v5 <= (v7 - v3) >> 4)
  {
    bzero(a1[1], 16 * v6);
    uint64_t v16 = &v3[16 * v6];
LABEL_20:
    a1[1] = v16;
    return;
  }
  if (a2 >> 60) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = v7 - v4;
  uint64_t v9 = v8 >> 3;
  if (v8 >> 3 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  int v11 = (char *)operator new(16 * v10);
  unint64_t v12 = &v11[16 * v5];
  uint64_t v13 = &v11[16 * v10];
  bzero(v12, 16 * v6);
  uint64_t v14 = &v12[16 * v6];
  if (v3 != v4)
  {
    do
    {
      long long v15 = *((_OWORD *)v3 - 1);
      v3 -= 16;
      *((_OWORD *)v12 - 1) = v15;
      v12 -= 16;
    }
    while (v3 != v4);
    int64_t v3 = *a1;
  }
  *a1 = v12;
  a1[1] = v14;
  a1[2] = v13;
  if (v3)
  {
    operator delete(v3);
  }
}

BOOL anonymous namespace'::_NTKUltraCubeFiller::isLocationOpen(int a1, uint64_t a2, int a3)
{
  int64_t v3 = (unsigned char *)(a2 + (a3 >> 16) * a1 + (__int16)a3);
  if (*v3) {
    return 0;
  }
  unsigned int v5 = v3[-a1] == 1;
  if (v3[-a1] == 1) {
    int v6 = 2;
  }
  else {
    int v6 = 1;
  }
  if (v3[~a1] == 1) {
    unsigned int v5 = v6;
  }
  if (v3[1 - a1] == 1) {
    ++v5;
  }
  long long v7 = &v3[a1];
  if (*v7 == 1) {
    ++v5;
  }
  if (*(v7 - 1) == 1) {
    ++v5;
  }
  if (v7[1] == 1) {
    ++v5;
  }
  if (*(v3 - 1) == 1) {
    ++v5;
  }
  if (v3[1] == 1) {
    unsigned int v8 = v5 + 1;
  }
  else {
    unsigned int v8 = v5;
  }
  return v8 > 2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

void sub_1A97DD1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void CGrNavigatorT<unsigned char,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

void CGrNavigatorT<__simd128_float32_t,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

uint64_t ___ZL14NUAssertLoggerv_block_invoke_26519()
{
  return MEMORY[0x1F4130BA0]();
}

void sub_1A97DDB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1A97DDEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A97DE58C(_Unwind_Exception *a1)
{
  long long v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1A97DE9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A97DF310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A97DF8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_26627()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26641);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_26644()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_26816()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_208);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_26832()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_26951()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_26971()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_27183()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_54_27201);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_27204()
{
  return MEMORY[0x1F4130BA0]();
}

BOOL PIAutoLoopFlavorProducesOnlyVideo(uint64_t a1)
{
  if (a1) {
    BOOL v1 = a1 == 3;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

__CFString *PIAutoLoopFlavorToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"AutoLoop";
  }
  else {
    return off_1E5D81738[a1];
  }
}

uint64_t PIAutoLoopFlavorFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"AutoLoop"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Mirror"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"LongExposure"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    [v1 isEqualToString:@"None"];
    uint64_t v2 = 0;
  }

  return v2;
}

id PIAutoLoopFindVideoSourceNode(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = 0;
    goto LABEL_13;
  }
  uint64_t v2 = v1;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isResolved]) {
        break;
      }
    }
LABEL_7:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = v2;
      goto LABEL_13;
    }
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = [v2 uniqueInputNode];

    uint64_t v2 = v3;
    if (!v3) {
      goto LABEL_13;
    }
  }
  id v6 = 0;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = [v2 resolvedSourceNode:&v6];
  id v4 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }

LABEL_13:
  return v3;
}

id PIAutoLoopRecipeForFlavor(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3)
  {
    int v11 = NUAssertLogger_27262();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v15 = NUAssertLogger_27262();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v19 = dispatch_get_specific(*v13);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        __int16 v25 = 2114;
        uint64_t v26 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      int v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  *(void *)buf = 0;
  if (MEMORY[0x1AD0F94E0]())
  {
    unsigned int v5 = [v4 objectForKeyedSubscript:@"loopRecipe_stabCropRect"];
    if (!v5)
    {
      if (a2)
      {
        if (a2 == 2)
        {
          id v6 = @"PingPong";
        }
        else if (a2 == 3)
        {
          id v6 = @"LongExposure";
        }
        else
        {
          id v6 = @"AutoLoop";
        }
      }
      else
      {
        id v6 = @"None";
      }
      unsigned int v8 = [v4 objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"recipe"];

      id v4 = (void *)v9;
    }

LABEL_19:
    long long v7 = v4;
    goto LABEL_20;
  }
  if (!a2) {
    [MEMORY[0x1E4F1CA00] raise:@"PI Exception" format:@"invalid recipe flavor"];
  }
  if (!liveAnalysisResultFromDictionary()) {
    goto LABEL_19;
  }
  if (liveAnalysisResultCopyRecipe()) {
    [MEMORY[0x1E4F1CA00] raise:@"PI Exception" format:@"Failed to extract from cookbook"];
  }
  long long v7 = alLoopRecipeToDict();

  liveAnalysisResultDestroy();
LABEL_20:
  return v7;
}

id NUAssertLogger_27262()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_93_27292);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NUAssertLogger_block_invoke_27295()
{
  return MEMORY[0x1F4130BA0]();
}

BOOL PIAutoLoopRecipeIsValid()
{
  return MEMORY[0x1AD0F94E0]() == 0;
}

id PIAutoLoopRecipeGetCropRectDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"loopRecipe_stabCropRect"];
  if (!v2)
  {
    id v3 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F4F120]];
    uint64_t v2 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4F130]];
  }
  return v2;
}

double PIAutoLoopRecipeGetCropRect(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    BOOL v16 = NUAssertLogger_27262();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      *(_DWORD *)buf = 138543362;
      double v30 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v20 = NUAssertLogger_27262();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific(*v18);
        __int16 v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        double v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v30 = v24;
        __int16 v31 = 2114;
        uint64_t v32 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v30 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v2 = v1;
  id v3 = PIAutoLoopRecipeGetCropRectDictionary(v1);
  int v4 = MEMORY[0x1AD0F94E0](v2);
  if (v4) {
    unsigned int v5 = @"origin_x";
  }
  else {
    unsigned int v5 = @"X";
  }
  if (v4) {
    id v6 = @"origin_y";
  }
  else {
    id v6 = @"Y";
  }
  if (v4) {
    long long v7 = @"width";
  }
  else {
    long long v7 = @"Width";
  }
  if (v4) {
    unsigned int v8 = @"height";
  }
  else {
    unsigned int v8 = @"Height";
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:v5];
  [v9 floatValue];
  float v11 = v10;

  unint64_t v12 = [v3 objectForKeyedSubscript:v6];
  [v12 floatValue];

  uint64_t v13 = [v3 objectForKeyedSubscript:v7];
  [v13 floatValue];

  uint64_t v14 = [v3 objectForKeyedSubscript:v8];
  [v14 floatValue];

  return v11;
}

BOOL PIAutoLoopRecipeHasGoodStabilization(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v9 = NUAssertLogger_27262();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      float v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v13 = NUAssertLogger_27262();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        int v17 = dispatch_get_specific(*v11);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        BOOL v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        __int16 v25 = v21;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v16;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v2 = v1;
  id v3 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F4F120]];
  int v4 = v3;
  if (v3)
  {
    unsigned int v5 = (__CFString *)*MEMORY[0x1E4F4F138];
  }
  else
  {
    unsigned int v5 = @"loopRecipe_stabilizeResult";
    id v3 = v2;
  }
  id v6 = [v3 objectForKeyedSubscript:v5];
  BOOL v7 = [v6 intValue] - 1 < 2;

  return v7;
}

void PIAutoLoopRecipeFrameTransformGetTime(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3)
  {
    unsigned int v5 = NUAssertLogger_27262();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "frameTransform != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v9 = NUAssertLogger_27262();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific(*v7);
        BOOL v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        BOOL v16 = [v14 callStackSymbols];
        int v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v13;
        __int16 v21 = 2114;
        uint64_t v22 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      float v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      unint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v18 = v3;
  CFDictionaryRef v4 = [v3 objectForKeyedSubscript:@"frameTransform_rawTime"];
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  CMTimeMakeFromDictionary((CMTime *)a2, v4);
}

double PIAutoLoopRecipeFrameTransformGetHomography(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    BOOL v10 = NUAssertLogger_27262();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      float v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "frameTransform != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    unint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v14 = NUAssertLogger_27262();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v18 = dispatch_get_specific(*v12);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        __int16 v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v18;
        __int16 v26 = 2114;
        uint64_t v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v2 = v1;
  id v3 = [v1 objectForKeyedSubscript:@"frameTransform_homography"];
  uint64_t v4 = 0;
  memset(v23, 0, sizeof(v23));
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    do
    {
      BOOL v7 = [v3 objectAtIndexedSubscript:v6];
      [v7 floatValue];
      *((_DWORD *)&v23[v4] + v5) = v8;

      ++v5;
      v6 += 3;
    }
    while (v5 != 3);
    ++v4;
  }
  while (v4 != 3);

  return *(double *)v23;
}

id PIAutoLoopRecipeComputeOutputGeometry(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v6 = NUAssertLogger_27262();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != NULL");
      BOOL v7 = (const void **)objc_claimAutoreleasedReturnValue();
      int buf = 138543362;
      buf_4 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v10 = NUAssertLogger_27262();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        __int16 v24 = dispatch_get_specific(*v8);
        __int16 v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        int v8 = [v25 callStackSymbols];
        uint64_t v27 = [v8 componentsJoinedByString:@"\n"];
        int buf = 138543618;
        buf_4 = (const void **)v24;
        __int16 buf_12 = 2114;
        buf_14 = v27;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v11)
    {
      unint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v8 = [v12 componentsJoinedByString:@"\n"];
      int buf = 138543362;
      buf_4 = v8;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v16 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  uint64_t v2 = v1;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    uint64_t v13 = NUAssertLogger_27262();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(videoOrientation)");
      BOOL v14 = (const void **)objc_claimAutoreleasedReturnValue();
      int buf = 138543362;
      buf_4 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v8 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v15 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v10 = NUAssertLogger_27262();
    int v16 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!v15)
    {
      if (v16)
      {
        int v17 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v8 = [v17 componentsJoinedByString:@"\n"];
        int buf = 138543362;
        buf_4 = v8;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
LABEL_27:

      int v21 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v16)
    {
      uint64_t v28 = dispatch_get_specific(*v8);
      double v29 = (void *)MEMORY[0x1E4F29060];
      id v30 = v28;
      int v8 = [v29 callStackSymbols];
      __int16 v31 = [v8 componentsJoinedByString:@"\n"];
      int buf = 138543618;
      buf_4 = (const void **)v28;
      __int16 buf_12 = 2114;
      buf_14 = v31;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_27;
  }
  if ((NUScaleIsValid() & 1) == 0)
  {
    id v18 = NUAssertLogger_27262();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(videoScale)");
      id v19 = (const void **)objc_claimAutoreleasedReturnValue();
      int buf = 138543362;
      buf_4 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v8 = (const void **)MEMORY[0x1E4F7A308];
    id v20 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v10 = NUAssertLogger_27262();
    int v21 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        int buf = 138543362;
        buf_4 = v23;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v21)
    {
      uint64_t v32 = dispatch_get_specific(*v8);
      uint64_t v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      double v35 = [v33 callStackSymbols];
      double v36 = [v35 componentsJoinedByString:@"\n"];
      int buf = 138543618;
      buf_4 = (const void **)v32;
      __int16 buf_12 = 2114;
      buf_14 = v36;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  PIAutoLoopRecipeGetCropRect(v2);
  NUPixelSizeFromCGSize();
  NUOrientationTransformImageSize();
  NUScaleInvert();
  NUScaleToDouble();
  NUPixelRectScale();
  id v3 = objc_alloc(MEMORY[0x1E4F7A508]);
  uint64_t v4 = objc_msgSend(v3, "initWithExtent:renderScale:orientation:", &buf, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8), 1);

  return v4;
}

id PIAutoLoopRecipeGetInstructionAtTime(void *a1, uint64_t a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3)
  {
    BOOL v11 = NUAssertLogger_27262();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v15 = NUAssertLogger_27262();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        __int16 v24 = dispatch_get_specific(*v13);
        __int16 v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v13 = [v25 callStackSymbols];
        uint64_t v27 = [v13 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v24;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v27;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v16)
    {
      int v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v17 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    int v21 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if ((*(unsigned char *)(a2 + 12) & 1) == 0)
  {
    id v18 = NUAssertLogger_27262();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(time)");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    id v20 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v15 = NUAssertLogger_27262();
    int v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543362;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v21)
    {
      uint64_t v28 = dispatch_get_specific(*v13);
      double v29 = (void *)MEMORY[0x1E4F29060];
      id v30 = v28;
      __int16 v31 = [v29 callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v32;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  uint64_t v4 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"loopRecipe_frameInstructions"];
  CMTime time = *(CMTime *)a2;
  id v34 = @"loopFrameData_presTime";
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&time, 0);
  v35[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

  unint64_t v8 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_27373);
  if (v8 >= [v5 count]) {
    [v5 lastObject];
  }
  else {
  uint64_t v9 = [v5 objectAtIndexedSubscript:v8];
  }

  return v9;
}

uint64_t __PIAutoLoopRecipeGetInstructionAtTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  memset(&v11, 0, sizeof(v11));
  id v4 = a3;
  CFDictionaryRef v5 = [a2 objectForKeyedSubscript:@"loopFrameData_presTime"];
  CMTimeMakeFromDictionary(&v11, v5);

  memset(&v10, 0, sizeof(v10));
  CFDictionaryRef v6 = [v4 objectForKeyedSubscript:@"loopFrameData_presTime"];

  CMTimeMakeFromDictionary(&v10, v6);
  CMTime time1 = v11;
  CMTime v8 = v10;
  if (CMTimeCompare(&time1, &v8) < 0) {
    return -1;
  }
  CMTime time1 = v11;
  CMTime v8 = v10;
  return CMTimeCompare(&time1, &v8) > 0;
}

void PIAutoLoopRecipeGetFrameDuration(void *a1@<X0>, CMTime *a2@<X8>)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3)
  {
    CMTime v10 = NUAssertLogger_27262();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CMTime v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      LODWORD(v23.value) = 138543362;
      *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    unint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v14 = NUAssertLogger_27262();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v18 = dispatch_get_specific(*v12);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        int v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        LODWORD(v23.value) = 138543618;
        *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v18;
        LOWORD(v23.flags) = 2114;
        *(void *)((char *)&v23.flags + 2) = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v17 = [v16 componentsJoinedByString:@"\n"];
      LODWORD(v23.value) = 138543362;
      *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v23, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  a2->value = 0;
  *(void *)&a2->timescale = 0;
  a2->epoch = 0;
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4F120]];
  CFDictionaryRef v6 = v5;
  if (v5)
  {
    CFDictionaryRef v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4F128]];
    CMTimeMakeFromDictionary(&v23, v7);
    *a2 = v23;
  }
  else
  {
    CFDictionaryRef v7 = [v4 objectForKeyedSubscript:@"loopRecipe_frameInstructions"];
    CMTime v8 = [(__CFDictionary *)v7 firstObject];
    CFDictionaryRef v9 = [v8 objectForKeyedSubscript:@"loopFrameData_presDur"];
    CMTimeMakeFromDictionary(&v23, v9);
    *a2 = v23;
  }
}

id PIAutoLoopRecipeGetFlavorParameters(void *a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3)
  {
    CMTime v8 = NUAssertLogger_27262();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      *(_DWORD *)int buf = 138543362;
      uint64_t v22 = v9;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CMTime v10 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v12 = NUAssertLogger_27262();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific(*v10);
        int v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        id v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)int buf = 138543618;
        uint64_t v22 = v16;
        __int16 v23 = 2114;
        uint64_t v24 = v20;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)int buf = 138543362;
      uint64_t v22 = v15;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  if ((unint64_t)(a2 - 1) > 2)
  {
    CFDictionaryRef v5 = 0;
  }
  else
  {
    CFDictionaryRef v5 = [v3 objectForKeyedSubscript:**((void **)&unk_1E5D81758 + a2 - 1)];
  }
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4F140]];

  return v6;
}

void PIAutoLoopRecipeGetTimeRangeForFlavor(void *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (!v5)
  {
    int v17 = NUAssertLogger_27262();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    id v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v21 = NUAssertLogger_27262();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v25 = dispatch_get_specific(*v19);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        double v29 = [v28 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v25;
        LOWORD(time.start.flags) = 2114;
        *(void *)((char *)&time.start.flags + 2) = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v22)
    {
      __int16 v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    _NUAssertFailHandler();
  }
  CFDictionaryRef v6 = v5;
  uint64_t v7 = MEMORY[0x1E4F1FA20];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *a3 = *MEMORY[0x1E4F1FA20];
  a3[1] = v8;
  a3[2] = *(_OWORD *)(v7 + 32);
  memset(&v34, 0, sizeof(v34));
  PIAutoLoopRecipeGetFrameDuration(v5, &v34);
  CFDictionaryRef v9 = PIAutoLoopRecipeGetFlavorParameters(v6, a2);
  CMTime v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4F158]];
  CMTime v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4F150]];
  unint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4F148]];
  memset(&v33, 0, sizeof(v33));
  if (v10)
  {
    int32_t v13 = [v10 intValue];
    time.CMTime start = v34;
    CMTimeMultiply(&v33, &time.start, v13);
  }
  else
  {
    CMTime v33 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  int v14 = [v11 intValue];
  int v15 = [v12 intValue];
  memset(&v32, 0, sizeof(v32));
  if (v11)
  {
    time.CMTime start = v34;
    CMTimeMultiply(&v32, &time.start, v15 + v14);
  }
  else
  {
    CMTime v32 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  if (v33.flags & 1) != 0 && (v32.flags)
  {
    CMTime start = v33;
    CMTime duration = v32;
    CMTimeRangeMake(&time, &start, &duration);
    long long v16 = *(_OWORD *)&time.start.epoch;
    *a3 = *(_OWORD *)&time.start.value;
    a3[1] = v16;
    a3[2] = *(_OWORD *)&time.duration.timescale;
  }
}

uint64_t __NUAssertLogger_block_invoke_27460()
{
  return MEMORY[0x1F4130BA0]();
}

id NUAssertLogger_27461()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_112);
  }
  uint64_t v0 = (void *)*MEMORY[0x1E4F7A748];
  return v0;
}

uint64_t __NULogger_block_invoke_27486()
{
  return MEMORY[0x1F4130BA0]();
}

unint64_t CMedian::CxParms::IdealTSize(CMedian::CxParms *this, int a2)
{
  if (*((unsigned char *)this + 49))
  {
    if (a2 == 16)
    {
      if (*((_DWORD *)this + 6) >= 0xBu) {
        goto LABEL_16;
      }
    }
    else if (a2 != 8 || *((_DWORD *)this + 6) >= 0x10u)
    {
LABEL_16:
      int v5 = *((_DWORD *)this + 6);
      if ((v5 - 48) > 0x4F)
      {
        if ((v5 - 24) <= 0x67)
        {
          if (*((unsigned char *)this + 48)) {
            goto LABEL_34;
          }
          if (!*((unsigned char *)this + 46))
          {
LABEL_27:
            unsigned int v3 = 192;
            uint64_t v4 = 1024;
            return v3 | (unint64_t)(v4 << 32);
          }
          goto LABEL_25;
        }
      }
      else if (!*((unsigned char *)this + 48) && !*((unsigned char *)this + 46))
      {
        goto LABEL_27;
      }
      if ((v5 - 3) > 0x3C) {
        goto LABEL_34;
      }
LABEL_25:
      if (!*((unsigned char *)this + 48) && !*((unsigned char *)this + 46)) {
        goto LABEL_27;
      }
LABEL_34:
      unsigned int v3 = 256;
      uint64_t v4 = 384;
      return v3 | (unint64_t)(v4 << 32);
    }
    uint64_t v4 = 160;
    unsigned int v3 = 160;
  }
  else
  {
    if (a2 == 8) {
      goto LABEL_16;
    }
    unsigned int v2 = *((_DWORD *)this + 6);
    if (v2 - 8 > 0x77 || *((unsigned char *)this + 48) || *((unsigned char *)this + 46))
    {
      if ((v2 & 0xFFFFFFFC) != 4 && (v2 - 1 > 6 || !*((unsigned char *)this + 48) && v2 >= 4 && !*((unsigned char *)this + 46)))
      {
        if (v2 - 8 <= 0x77 && (*((unsigned char *)this + 48) || *((unsigned char *)this + 46)))
        {
          uint64_t v4 = (int)sqrtf((float)*((unsigned int *)this + 8) + 65536.0) - 2 * v2;
          unsigned int v3 = v4;
          return v3 | (unint64_t)(v4 << 32);
        }
        goto LABEL_34;
      }
      unsigned int v3 = 93 - 2 * v2 - (93 - 2 * v2) % 9u;
      uint64_t v4 = 0x2000u / (unsigned __int16)(93 - 2 * v2 - (93 - 2 * v2) % 9u + 2 * v2) - 2 * v2;
    }
    else
    {
      unsigned int v3 = (2 * v2) & 0x7FFFFFF0;
      if (v3 <= 0x40) {
        unsigned int v3 = 64;
      }
      if (v2 >= 0x40) {
        unsigned int v3 = 128;
      }
      LODWORD(v4) = (*((_DWORD *)this + 7) + 0xFFFF) / (v3 + 2 * v2) - 2 * v2;
      if (v4 >= 4 * v3) {
        uint64_t v4 = 4 * v3;
      }
      else {
        uint64_t v4 = v4;
      }
    }
  }
  return v3 | (unint64_t)(v4 << 32);
}

uint64_t CDeleter<CMemBlockT<unsigned char>>::~CDeleter(uint64_t a1)
{
  *(void *)a1 = &unk_1EFFD4C38;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = **(void **)(a1 + 8);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
      **(void **)(a1 + 8) = 0;
    }
  }
  return a1;
}

void CDeleter<CMemBlockT<unsigned char>>::~CDeleter(uint64_t a1)
{
  id v1 = (void *)CDeleter<CMemBlockT<unsigned char>>::~CDeleter(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

double CMemBlockT<unsigned char>::Description@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(void *)(a2 + 80) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  *(void *)a2 = &unk_1EFFD4AC0;
  *(void *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 32) = 1;
  *(void *)(a2 + 64) = v4;
  *(void *)(a2 + 40) = 1;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = 0;
  return result;
}

uint64_t CMemBlock::IsZero(CMemBlock *this)
{
  return *((unsigned __int8 *)this + 13);
}

BOOL CMemBlock::Locked(CMemBlock *this)
{
  return *((_DWORD *)this + 4) != 0;
}

BOOL CMemBlock::Unlocked(CMemBlock *this)
{
  return *((_DWORD *)this + 4) == 0;
}

uint64_t CMemBlock::Valid(CMemBlock *this)
{
  return *((unsigned __int8 *)this + 12);
}

void CMemBlockT<unsigned char>::~CMemBlockT(CMemBlock *a1)
{
  CMemBlock::~CMemBlock(a1);
  CBaseRef::operator delete(v1);
}

uint64_t CMedian::CxParms::CxParms(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (CMemEnv **)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  int v5 = (CMemBlock **)(a1 + 16);
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = *(void *)a2;
  float v6 = *(float *)(a2 + 8);
  unsigned int v7 = (int)v6;
  int v8 = ((2 * v7) | 1) * ((2 * v7) | 1);
  *(_DWORD *)(a1 + 24) = (int)v6;
  *(_DWORD *)(a1 + 28) = v8;
  *(_DWORD *)(a1 + 36) = (int)(float)((float)(*(float *)(a2 + 12) * (float)(v8 - 1)) + 0.5);
  int v9 = vcvts_n_s32_f32(*(float *)(a2 + 16), 8uLL);
  int v10 = v9 & ~(v9 >> 31);
  if (v10 >= 255) {
    int v10 = 255;
  }
  *(_DWORD *)(a1 + 40) = v10;
  *(_WORD *)(a1 + 44) = *(_WORD *)(a2 + 20);
  int v11 = *(unsigned __int8 *)(a2 + 22);
  if (*(unsigned char *)(a2 + 23)) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  char v13 = !v12;
  *(unsigned char *)(a1 + 47) = v13;
  *(unsigned char *)(a1 + 46) = v11;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 24);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 27);
  if (!v12)
  {
    int v14 = (CMemBlock *)CBaseObject::operator new((CBaseObject *)0x40);
    CMemBlock::CMemBlock(v14, *v4, 0x8000, 1, 16);
    *(void *)int v14 = &unk_1EFFD4988;
    *int v5 = v14;
    double v56 = &unk_1EFFD4C38;
    uint64_t v57 = v5;
    LOBYTE(v58) = 1;
    if (!*((unsigned char *)v14 + 12))
    {
      CDeleter<CMemBlockT<unsigned char>>::~CDeleter((uint64_t)&v56);
      return a1;
    }
    LOBYTE(v58) = 0;
    CDeleter<CMemBlockT<unsigned char>>::~CDeleter((uint64_t)&v56);
    float v6 = *(float *)(a2 + 8);
    int v11 = *(unsigned __int8 *)(a2 + 22);
    unsigned int v7 = (int)v6;
  }
  int v15 = (unsigned char *)(a1 + 1590);
  if (v11)
  {
    if ((int)(float)(v6 * v6) <= 2) {
      int v16 = 2;
    }
    else {
      int v16 = (int)(float)(v6 * v6);
    }
    int v17 = 0;
    if (v7)
    {
      if (v7 + 1 > 2) {
        uint64_t v18 = v7 + 1;
      }
      else {
        uint64_t v18 = 2;
      }
      unsigned int v19 = v7 - 1;
      uint64_t v20 = 1;
      do
      {
        int v21 = (int)sqrtf((float)(v16 - v20 * v20));
        v15[v7 + v20] = v7 - v21;
        v15[v19] = v7 - v21;
        v17 += 4 * v21 + 2;
        ++v20;
        --v19;
      }
      while (v18 != v20);
    }
    v15[v7] = 0;
    int v22 = v17 + 2 * v7 + 1;
  }
  else
  {
    unsigned int v23 = (2 * v7) | 1;
    bzero(v15, v23);
    int v22 = v23 * v23;
  }
  int v24 = ((2 * *(_DWORD *)(a1 + 24)) | 1) * ((2 * *(_DWORD *)(a1 + 24)) | 1) - v22;
  *(_DWORD *)(a1 + 28) = v22;
  *(_DWORD *)(a1 + 32) = v24;
  *(_DWORD *)(a1 + 36) = (int)(float)((float)(*(float *)(a2 + 12) * (float)(v22 - 1)) + 0.5);
  if (!*(unsigned char *)(a1 + 47))
  {
LABEL_59:
    *(unsigned char *)a1 = 1;
    return a1;
  }
  uint64_t v25 = *v5;
  if (*v5)
  {
    double v56 = &unk_1EFFD4B38;
    LOBYTE(v57) = 0;
    unsigned int v58 = v25;
    if ((*(unsigned int (**)(CMemBlock *))(*(void *)v25 + 80))(v25))
    {
      if (!(_BYTE)v57)
      {
        CLock::~CLock((CLock *)&v56);
        return a1;
      }
    }
    else
    {
      LOBYTE(v57) = 1;
    }
    uint64_t v27 = 0;
    uint64_t v28 = (unsigned __int8 *)*((void *)*v5 + 4);
    float v29 = *(float *)(a2 + 12);
    float v30 = *(float *)(a2 + 8) * 0.000015379;
    v31.i64[0] = 0x200000002;
    v31.i64[1] = 0x200000002;
    int64x2_t v32 = vdupq_n_s64(4uLL);
    v33.i64[0] = 0x400000004;
    v33.i64[1] = 0x400000004;
    int64x2_t v55 = v32;
    while (1)
    {
      float v34 = (float)((float)(int)v27 * (float)(int)v27) * v30;
      *(unsigned char *)(a1 + v27 + 1334) = 0;
      if (*(unsigned char *)(a2 + 22))
      {
        if (v34 < 1.4142)
        {
          int v35 = (int)(float)((float)(v34 * -180.31) + 255.0) & ~((int)(float)((float)(v34 * -180.31) + 255.0) >> 31);
          if (v35 >= 255) {
            LOBYTE(v35) = -1;
          }
          float v34 = 1.4142;
          goto LABEL_39;
        }
      }
      else if (v34 < 1.0)
      {
        int v35 = (int)(float)(255.0 - (float)(v34 * 255.0));
        float v34 = 1.0;
LABEL_39:
        *(unsigned char *)(a1 + v27 + 1334) = v35;
      }
      int v36 = (int)v34;
      *(unsigned char *)(a1 + v27 + 53) = (int)v34;
      if (*(unsigned char *)(a2 + 22))
      {
        if (v36 < 0)
        {
          int v51 = 0;
        }
        else
        {
          uint64_t v37 = 0;
          unsigned int v38 = (int)(float)(v34 * v34);
          uint64_t v39 = (v36 + 1);
          uint64x2_t v40 = (uint64x2_t)vdupq_n_s64(v39 - 1);
          int32x4_t v41 = vdupq_n_s32(v38);
          int8x16_t v42 = 0uLL;
          int64x2_t v43 = (int64x2_t)xmmword_1A980B8B0;
          int64x2_t v44 = (int64x2_t)xmmword_1A980BA80;
          int32x4_t v45 = (int32x4_t)xmmword_1A980B9F0;
          do
          {
            int32x4_t v46 = (int32x4_t)v42;
            int32x4_t v47 = (int32x4_t)vcgeq_u64(v40, (uint64x2_t)v43);
            *(int32x2_t *)v26.i8 = vmovn_s64((int64x2_t)v47);
            int32x2_t v48 = (int32x2_t)vmovn_s32(v26);
            int32x4_t v49 = vcvtq_s32_f32(vsqrtq_f32(vcvtq_f32_s32(vmlsq_s32(v41, v45, v45))));
            if (v48.i8[0]) {
              v28[v37] = v49.i8[0] + 1;
            }
            if (vmovn_s32(v26).i8[2]) {
              v28[v37 + 1] = v49.i8[4] + 1;
            }
            int32x4_t v26 = (int32x4_t)vcgeq_u64(v40, (uint64x2_t)v44);
            int32x2_t v50 = (int32x2_t)vmovn_s32(vmovn_hight_s64(v48, (int64x2_t)v26));
            if (v50.i8[4]) {
              v28[v37 + 2] = v49.i8[8] + 1;
            }
            if (vmovn_s32(vmovn_hight_s64(v50, *(int64x2_t *)&v26)).i8[6]) {
              v28[v37 + 3] = v49.i8[12] + 1;
            }
            int8x16_t v42 = (int8x16_t)vaddq_s32(vaddq_s32(v46, v31), vshlq_n_s32(v49, 2uLL));
            v37 += 4;
            int64x2_t v44 = vaddq_s64(v44, v32);
            int64x2_t v43 = vaddq_s64(v43, v32);
            int32x4_t v45 = vaddq_s32(v45, v33);
          }
          while (((v39 + 3) & 0x1FFFFFFFCLL) != v37);
          int v51 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32(v47, v26), v42, (int8x16_t)v46));
        }
        int v52 = v51 - 2 * *v28 + 1;
      }
      else
      {
        int v52 = ((2 * v36) | 1) * ((2 * v36) | 1);
        *(_WORD *)(a1 + 2 * v27 + 310) = ((2 * v36) | 1) * ((2 * v36) | 1);
        if ((v36 & 0x80000000) == 0)
        {
          memset(v28, v36 + 1, (v36 + 1));
          v33.i64[0] = 0x400000004;
          v33.i64[1] = 0x400000004;
          int64x2_t v32 = v55;
          v31.i64[0] = 0x200000002;
          v31.i64[1] = 0x200000002;
        }
      }
      uint64_t v53 = a1 + 2 * v27;
      *(_WORD *)(v53 + 310) = v52;
      *(_WORD *)(v53 + 822) = (int)(float)((float)(v29 * (float)(v52 - 1)) + 0.5);
      v28 += 128;
      if (++v27 == 256)
      {
        CLock::~CLock((CLock *)&v56);
        goto LABEL_59;
      }
    }
  }
  return a1;
}

void sub_1A97EC4F4(_Unwind_Exception *a1)
{
  CBaseRef::operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t CMedian::CKernel13x9::IdealTSize(CMedian::CKernel13x9 *this)
{
  id v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 16);
  }
  else {
    return 0x10000000100;
  }
}

void CMedian::CKernel13x9::~CKernel13x9(CMedian::CKernel13x9 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernel13x9::Process_(CMedian::CKernel13x9 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v8 = (unsigned __int16 *)malloc_type_calloc(0x2CD50uLL, 1uLL, 0x46296C8EuLL);
  int v9 = (char *)(v8 + 5800);
  v23[1] = 0;
  v23[2] = v8 + 75432;
  long long v10 = *((_OWORD *)a2 + 3);
  long long v24 = xmmword_1A980BA20;
  long long v25 = v10;
  _OWORD v23[3] = 2 * v10;
  uint64_t v26 = 1;
  __int16 v27 = 1;
  v23[0] = &unk_1EFFD4A80;
  v16[1] = 0;
  int v17 = v8 + 83624;
  long long v11 = *((_OWORD *)a3 + 3);
  long long v19 = xmmword_1A980BA20;
  long long v20 = v11;
  uint64_t v18 = 2 * v11;
  uint64_t v21 = 1;
  __int16 v22 = 1;
  v16[0] = &unk_1EFFD4A80;
  uint64_t v12 = *((void *)a2 + 4);
  if (v12 == 4)
  {
    CMedian::OrdinalTransform((uint64_t)a2, v23, v9);
    uint64_t v14 = *((void *)this + 1587);
    bzero(v28, 0x540uLL);
    CMedian::Median13x9C_(v14, (uint64_t)v23, (uint64_t)v16, v28);
    CMedian::OrdinalTransform(v17, v18, (uint64_t)a3, (uint64_t)(v8 + 59048));
  }
  else if (v12 == 2)
  {
    CMedian::OrdinalTransform((uint64_t)a2, v23, v9);
    uint64_t v13 = *((void *)this + 1587);
    bzero(v28, 0x540uLL);
    CMedian::Median13x9C_(v13, (uint64_t)v23, (uint64_t)v16, v28);
    CMedian::OrdinalTransform((uint64_t)v17, v18, (uint64_t)a3, (uint64_t)(v8 + 50856));
  }
  free(v8);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v16);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v23);
  return 0;
}

uint64_t CMedian::OrdinalTransform(uint64_t result, void *a2, _OWORD *a3)
{
  uint64_t v3 = a2[6];
  uint64_t v4 = a2[7];
  a3[30] = 0u;
  a3[31] = 0u;
  a3[28] = 0u;
  a3[29] = 0u;
  a3[26] = 0u;
  a3[27] = 0u;
  a3[24] = 0u;
  a3[25] = 0u;
  a3[22] = 0u;
  a3[23] = 0u;
  a3[20] = 0u;
  a3[21] = 0u;
  a3[18] = 0u;
  a3[19] = 0u;
  a3[16] = 0u;
  a3[17] = 0u;
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  a3[287] = 0u;
  a3[286] = 0u;
  a3[285] = 0u;
  a3[284] = 0u;
  a3[283] = 0u;
  a3[282] = 0u;
  a3[281] = 0u;
  a3[280] = 0u;
  a3[279] = 0u;
  a3[278] = 0u;
  a3[277] = 0u;
  a3[276] = 0u;
  a3[275] = 0u;
  a3[274] = 0u;
  a3[273] = 0u;
  a3[272] = 0u;
  a3[271] = 0u;
  a3[270] = 0u;
  a3[269] = 0u;
  a3[268] = 0u;
  a3[267] = 0u;
  a3[266] = 0u;
  a3[265] = 0u;
  a3[264] = 0u;
  a3[263] = 0u;
  a3[262] = 0u;
  a3[261] = 0u;
  a3[260] = 0u;
  a3[259] = 0u;
  a3[258] = 0u;
  a3[257] = 0u;
  a3[256] = 0u;
  if (v4)
  {
    uint64_t v5 = 0;
    float v6 = *(unsigned __int8 **)(result + 16);
    uint64_t v7 = *(void *)(result + 24);
    do
    {
      if (v3)
      {
        int v8 = v6;
        uint64_t v9 = v3;
        do
        {
          unsigned int v10 = *v8;
          v8 += 2;
          ++*((_WORD *)a3 + v10);
          --v9;
        }
        while (v9);
      }
      ++v5;
      v6 += v7;
    }
    while (v5 != v4);
  }
  uint64_t v11 = 0;
  int v12 = 0;
  uint64_t v13 = a3 + 256;
  do
  {
    int v14 = *(unsigned __int16 *)((char *)a3 + v11);
    *(_WORD *)((char *)a3 + v11) = v12;
    v12 += v14;
    v11 += 2;
  }
  while (v11 != 512);
  if (v4)
  {
    uint64_t v15 = 0;
    int v16 = *(unsigned __int16 **)(result + 16);
    uint64_t v17 = *(void *)(result + 24);
    do
    {
      if (v3)
      {
        uint64_t v18 = 0;
        double result = (v15 << 8);
        long long v19 = v16;
        do
        {
          unsigned int v20 = *v19++;
          uint64_t v21 = *((unsigned __int16 *)a3 + v20);
          *((_WORD *)a3 + v20) = v21 + 1;
          ++*(_WORD *)((char *)v13 + ((v20 >> 7) & 0x1FELL));
          *((_DWORD *)a3 + v21 + 6144) = result | (v20 << 16) | v18++;
        }
        while (v3 != v18);
      }
      ++v15;
      int v16 = (unsigned __int16 *)((char *)v16 + v17);
    }
    while (v15 != v4);
  }
  uint64_t v22 = 0;
  int v23 = 0;
  do
  {
    int v24 = *(unsigned __int16 *)((char *)v13 + v22);
    *(_WORD *)((char *)v13 + v22) = v23;
    v23 += v24;
    v22 += 2;
  }
  while (v22 != 512);
  uint64_t v25 = (v4 * v3);
  if (v25)
  {
    uint64_t v26 = (unsigned int *)(a3 + 1536);
    uint64_t v27 = v25;
    do
    {
      unsigned int v28 = *v26++;
      unint64_t v29 = ((unint64_t)v28 >> 23) & 0x1FE;
      uint64_t v30 = *(unsigned __int16 *)((char *)v13 + v29);
      *(_WORD *)((char *)v13 + v29) = v30 + 1;
      *((_DWORD *)a3 + v30 + 14336) = v28;
      --v27;
    }
    while (v27);
    uint64_t v31 = 0;
    uint64_t v32 = a2[2];
    uint64_t v33 = a2[3];
    float v34 = a3 + 5632;
    do
    {
      int v35 = *((_DWORD *)v34 + v31 - 0x2000);
      *(_WORD *)(2 * v35 + v32 + v33 * BYTE1(v35)) = v31;
      *((_WORD *)v34 + v31++) = HIWORD(v35);
    }
    while (v25 != v31);
  }
  return result;
}

uint64_t CMedian::Median13x9C_(uint64_t result, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (2 * *(_DWORD *)(result + 24)) | 1u;
  if (v4 <= 0x3F)
  {
    uint64_t v6 = a3;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v10 = *(_DWORD *)(a3 + 48);
    int v11 = *(_DWORD *)(a3 + 56);
    int v12 = *(_DWORD *)(result + 36);
    uint64_t v13 = (unsigned __int8 *)(result + 1590);
    long long v102 = 0u;
    memset(v103, 0, 496);
    long long v100 = 0u;
    memset(v101, 0, sizeof(v101));
    uint64_t v14 = *(void *)(a2 + 24);
    do
    {
      int v15 = v13[v9];
      *(void *)&v103[8 * v9 - 16] = v8 + 2 * v13[v9];
      *((void *)&v101[-1] + v9++) = v8 + 2 * (v4 - v15);
      v8 += v14;
    }
    while (v4 != v9);
    bzero(a4, 0x540uLL);
    uint64_t v16 = 0;
    uint64_t v17 = (unsigned __int8 *)(a4 + 32);
    uint64_t v18 = (unsigned int *)(a4 + 288);
    do
    {
      uint64_t v19 = v13[v16];
      unsigned int v20 = (unsigned __int16 *)(*(void *)(a2 + 16) + 2 * v19 + *(void *)(a2 + 24) * v16);
      uint64_t v21 = (v4 - 2 * v19);
      do
      {
        unsigned int v22 = *v20++;
        unint64_t v23 = (unint64_t)v22 >> 5;
        unsigned int v24 = v18[v23];
        ++v17[v23];
        v18[v23] = (1 << v22) ^ v24;
        --v21;
      }
      while (v21);
      ++v16;
    }
    while (v16 != v4);
    unsigned int v92 = v13;
    unsigned int v25 = 0;
    LODWORD(v26) = 0;
    int v27 = v10 - 1;
    int v98 = v12;
    unsigned int v99 = 0;
    int v28 = v11 - 1;
    uint64_t v88 = *((void *)&v102 + 1);
    uint64_t v89 = v102;
    int v97 = 1;
    int v29 = v10 - 1;
    uint64_t v86 = *((void *)&v100 + 1);
    uint64_t v87 = v100;
    int v90 = v28;
    for (i = v10 - 1; ; int v27 = i)
    {
      unsigned int v95 = v25;
      uint64_t v96 = 2 * (int)v25;
      int v93 = v27 - v25;
      if ((int)v26 <= v28) {
        int v30 = v28;
      }
      else {
        int v30 = v26;
      }
      uint64_t v26 = (int)v26;
      uint64_t v94 = v30;
      while (1)
      {
        uint64_t v31 = *(void *)(v6 + 16);
        uint64_t v32 = v6;
        uint64_t v33 = *(void *)(v6 + 24) * v26;
        uint64_t v34 = v96 + v31;
        double result = Hist13x9CRead_(v17, v18, &v99, &v98);
        *(_WORD *)(v34 + v33) = result;
        if (v95 != v29) {
          break;
        }
        if (v26 == v94) {
          return result;
        }
        int v36 = v98;
        unsigned int v35 = v99;
        uint64_t v37 = v92;
        unsigned int v38 = v95;
        uint64_t v39 = v4;
        do
        {
          int v40 = *v37++;
          uint64_t v41 = *(void *)(a2 + 24);
          uint64_t v42 = *(void *)(a2 + 16) + 2 * v38;
          unint64_t v43 = *(unsigned __int16 *)(v41 * (v26 + v40) + v42);
          unint64_t v44 = *(unsigned __int16 *)(v41 * (v4 + v26 - v40) + v42);
          unsigned __int8 v45 = v17[v44 >> 5];
          v18[v44 >> 5] ^= 1 << v44;
          unint64_t v46 = v43 >> 5;
          unsigned int v47 = v18[v43 >> 5];
          v17[v44 >> 5] = v45 + 1;
          LOBYTE(v42) = v17[v43 >> 5];
          v18[v46] = v47 ^ (1 << v43);
          v36 += ((int)(v44 - v35) >> 31) + ((v43 - v35) >> 31);
          v17[v46] = v42 - 1;
          ++v38;
          --v39;
        }
        while (v39);
        int v97 = -v97;
        int v98 = v36;
        ++v26;
        int v29 = v93;
        uint64_t v6 = v32;
      }
      uint64_t v48 = v96 + *(void *)(a2 + 16) + *(void *)(a2 + 24) * v26;
      if (v97 == 1)
      {
        int v50 = v98;
        unsigned int v49 = v99;
        int v51 = (uint64_t *)v103;
        int v52 = (uint64_t *)v101;
        uint64_t v53 = v4;
        uint64_t v54 = v86;
        uint64_t v55 = v87;
        uint64_t v56 = v88;
        uint64_t v57 = v89;
        uint64_t v6 = v32;
        do
        {
          unint64_t v58 = *(unsigned __int16 *)(v57 + v48);
          unint64_t v59 = *(unsigned __int16 *)(v55 + v48);
          unint64_t v60 = v59 >> 5;
          unsigned __int8 v61 = v17[v59 >> 5];
          int v62 = v59 - v49;
          v18[v60] = v18[v59 >> 5] ^ (1 << v59);
          unint64_t v63 = v58 >> 5;
          unsigned int v64 = v18[v58 >> 5];
          v17[v60] = v61 + 1;
          LOBYTE(v60) = v17[v58 >> 5];
          v50 += (v62 >> 31) + ((v58 - v49) >> 31);
          v18[v63] = v64 ^ (1 << v58);
          v17[v63] = v60 - 1;
          uint64_t v57 = v56;
          uint64_t v65 = *v51++;
          uint64_t v56 = v65;
          uint64_t v55 = v54;
          uint64_t v66 = *v52++;
          uint64_t v54 = v66;
          --v53;
        }
        while (v53);
        unsigned int v25 = v95 + 1;
        int v97 = 1;
        int v98 = v50;
      }
      else
      {
        uint64_t v67 = v48 - 2;
        int v69 = v98;
        unsigned int v68 = v99;
        long long v70 = (uint64_t *)v103;
        uint64_t v71 = (uint64_t *)v101;
        uint64_t v72 = v4;
        uint64_t v73 = v86;
        uint64_t v74 = v87;
        uint64_t v75 = v88;
        uint64_t v76 = v89;
        uint64_t v6 = v32;
        do
        {
          unint64_t v77 = *(unsigned __int16 *)(v76 + v67);
          unint64_t v78 = *(unsigned __int16 *)(v74 + v67);
          unint64_t v79 = v77 >> 5;
          unsigned __int8 v80 = v17[v77 >> 5];
          int v81 = v77 - v68;
          v18[v79] = (1 << v77) ^ v18[v77 >> 5];
          unint64_t v82 = v78 >> 5;
          unsigned int v83 = v18[v78 >> 5];
          v17[v79] = v80 + 1;
          LOBYTE(v79) = v17[v78 >> 5];
          v69 += (v81 >> 31) + ((v78 - v68) >> 31);
          v18[v82] = v83 ^ (1 << v78);
          v17[v82] = v79 - 1;
          uint64_t v76 = v75;
          uint64_t v84 = *v70++;
          uint64_t v75 = v84;
          uint64_t v74 = v73;
          uint64_t v85 = *v71++;
          uint64_t v73 = v85;
          --v72;
        }
        while (v72);
        unsigned int v25 = v95 - 1;
        int v98 = v69;
      }
      int v28 = v90;
    }
  }
  return result;
}

uint64_t CMedian::OrdinalTransform(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(a3 + 56);
  if (*(_DWORD *)(a3 + 56))
  {
    uint64_t v5 = 0;
    unsigned int v6 = *(_DWORD *)(a3 + 48);
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    do
    {
      uint64_t v9 = (unsigned __int16 *)(result + v5 * a2);
      int v10 = (_WORD *)(v7 + v8 * v5);
      if (v6 >= 8)
      {
        for (unsigned int i = 8; i <= v6; i += 8)
        {
          __int16 v13 = *(_WORD *)(a4 + 2 * v9[1]);
          __int16 v14 = *(_WORD *)(a4 + 2 * v9[2]);
          __int16 v15 = *(_WORD *)(a4 + 2 * v9[3]);
          __int16 v16 = *(_WORD *)(a4 + 2 * v9[4]);
          __int16 v17 = *(_WORD *)(a4 + 2 * v9[5]);
          __int16 v18 = *(_WORD *)(a4 + 2 * v9[6]);
          __int16 v19 = *(_WORD *)(a4 + 2 * v9[7]);
          *int v10 = *(_WORD *)(a4 + 2 * *v9);
          v10[1] = v13;
          v10[2] = v14;
          v10[3] = v15;
          v10[4] = v16;
          v10[5] = v17;
          v9 += 8;
          v10[6] = v18;
          v10[7] = v19;
          v10 += 8;
        }
        unsigned int v11 = v6 & 0xFFFFFFF8;
      }
      else
      {
        unsigned int v11 = 0;
      }
      BOOL v20 = v6 >= v11;
      unsigned int v21 = v6 - v11;
      if (v21 != 0 && v20)
      {
        do
        {
          unsigned int v22 = *v9++;
          *v10++ = *(_WORD *)(a4 + 2 * v22);
          --v21;
        }
        while (v21);
      }
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

float CMedian::OrdinalTransform(uint64_t a1, void *a2, char *a3)
{
  uint64_t v6 = a2[6];
  uint64_t v7 = a2[7];
  bzero(a3, 0x2000uLL);
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(int **)(a1 + 16);
    uint64_t v10 = *(void *)(a1 + 24);
    do
    {
      if (v6)
      {
        unsigned int v11 = v9;
        uint64_t v12 = v6;
        do
        {
          int v13 = *v11++;
          ++*(_WORD *)&a3[2 * (((unsigned __int16)v13 ^ (unsigned __int16)(v13 >> 31)) & 0x7FF)];
          --v12;
        }
        while (v12);
      }
      ++v8;
      uint64_t v9 = (int *)((char *)v9 + v10);
    }
    while (v8 != v7);
  }
  uint64_t v14 = 0;
  int v15 = 0;
  __int16 v16 = a3 + 4096;
  do
  {
    int v17 = *(unsigned __int16 *)&a3[v14];
    *(_WORD *)&a3[v14] = v15;
    v15 += v17;
    v14 += 2;
  }
  while (v14 != 4096);
  if (v7)
  {
    uint64_t v18 = 0;
    __int16 v19 = *(int **)(a1 + 16);
    uint64_t v20 = *(void *)(a1 + 24);
    do
    {
      if (v6)
      {
        uint64_t v21 = 0;
        unsigned int v22 = v19;
        do
        {
          int v23 = *v22++;
          unsigned int v24 = ((v23 >> 31) | 0x80000000) ^ v23;
          uint64_t v25 = *(unsigned __int16 *)&a3[2 * (v24 & 0x7FF)];
          *(_WORD *)&a3[2 * (v24 & 0x7FF)] = v25 + 1;
          unsigned int v26 = (v24 >> 11) & 0x7FF;
          ++*(_WORD *)&v16[2 * v26];
          *(_WORD *)&a3[2 * v25 + 0x2000] = v26;
          *(_DWORD *)&a3[4 * v25 + 24576] = (v18 << 11) | v21++ | v24 & 0xFFC00000;
        }
        while (v6 != v21);
      }
      ++v18;
      __int16 v19 = (int *)((char *)v19 + v20);
    }
    while (v18 != v7);
  }
  int v27 = 0;
  for (uint64_t i = 4096; i != 0x2000; i += 2)
  {
    int v29 = *(unsigned __int16 *)&a3[i];
    *(_WORD *)&a3[i] = v27;
    v27 += v29;
  }
  bzero(a3, 0x800uLL);
  uint64_t v31 = (v7 * v6);
  if (v31)
  {
    uint64_t v32 = 0;
    uint64_t v33 = a3 + 24576;
    do
    {
      uint64_t v34 = *(unsigned __int16 *)&v33[2 * v32 - 0x4000];
      uint64_t v35 = *(unsigned __int16 *)&v16[2 * v34];
      *(_WORD *)&v16[2 * v34] = v35 + 1;
      unint64_t v36 = *(unsigned int *)&v33[4 * v32];
      ++*(_WORD *)&a3[(v36 >> 21) & 0x7FE];
      *(_DWORD *)&a3[4 * v35 + 57344] = v36;
      ++v32;
    }
    while (v31 != v32);
  }
  uint64_t v37 = 0;
  int v38 = 0;
  do
  {
    int v39 = *(unsigned __int16 *)&a3[v37];
    *(_WORD *)&a3[v37] = v38;
    v38 += v39;
    v37 += 2;
  }
  while (v37 != 4096);
  if (v31)
  {
    int v40 = (unsigned int *)(a3 + 57344);
    uint64_t v41 = (v7 * v6);
    do
    {
      unsigned int v42 = *v40++;
      unint64_t v43 = ((unint64_t)v42 >> 21) & 0x7FE;
      uint64_t v44 = *(unsigned __int16 *)&a3[v43];
      *(_WORD *)&a3[v43] = v44 + 1;
      *(_DWORD *)&a3[4 * v44 + 24576] = v42;
      --v41;
    }
    while (v41);
    uint64_t v45 = 0;
    uint64_t v46 = *(void *)(a1 + 16);
    uint64_t v47 = *(void *)(a1 + 24);
    uint64_t v48 = a2[2];
    uint64_t v49 = a2[3];
    do
    {
      int v50 = (float *)&a3[4 * v45];
      unint64_t v51 = *((unsigned int *)v50 + 6144);
      uint64_t v52 = (v51 >> 11) & 0x7FF;
      uint64_t v53 = v51 & 0x7FF;
      float result = *(float *)(v46 + 4 * v53 + v47 * v52);
      v50[26624] = result;
      *(_WORD *)(v48 + 2 * v53 + v49 * v52) = v45++;
    }
    while (v31 != v45);
  }
  return result;
}

uint64_t Hist13x9CRead_(unsigned __int8 *a1, unsigned int *a2, unsigned int *a3, int *a4)
{
  uint64_t v4 = 0;
  if (a1 && a2)
  {
    unint64_t v5 = *a3;
    unint64_t v6 = v5 >> 5;
    int v7 = -*a4;
    if (*a4 < 0)
    {
      __int16 v19 = a1 - 1;
      while (1)
      {
        uint64_t v20 = &v19[v6];
        v7 -= v19[v6];
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 1;
          goto LABEL_33;
        }
        v7 -= *(v20 - 1);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 2;
          goto LABEL_33;
        }
        v7 -= *(v20 - 2);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 3;
          goto LABEL_33;
        }
        v7 -= *(v20 - 3);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 4;
          goto LABEL_33;
        }
        v7 -= *(v20 - 4);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 5;
          goto LABEL_33;
        }
        v7 -= *(v20 - 5);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 6;
          goto LABEL_33;
        }
        v7 -= *(v20 - 6);
        if (v7 < 1) {
          break;
        }
        int v21 = *(v20 - 7);
        v6 -= 8;
        BOOL v10 = __OFSUB__(v7, v21);
        v7 -= v21;
        if ((v7 < 0) ^ v10 | (v7 == 0)) {
          goto LABEL_33;
        }
      }
      LODWORD(v6) = v6 - 7;
    }
    else
    {
      uint64_t v8 = &a1[v5 >> 5];
      LODWORD(v6) = v6 - 1;
      while (1)
      {
        int v9 = *v8;
        BOOL v10 = __OFADD__(v7, v9);
        int v11 = v7 + v9;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 1;
          goto LABEL_33;
        }
        int v12 = v8[1];
        BOOL v10 = __OFADD__(v11, v12);
        int v7 = v11 + v12;
        if (!((v7 < 0) ^ v10 | (v7 == 0)))
        {
          LODWORD(v6) = v6 + 2;
          goto LABEL_32;
        }
        int v13 = v8[2];
        BOOL v10 = __OFADD__(v7, v13);
        int v11 = v7 + v13;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 3;
          goto LABEL_33;
        }
        int v14 = v8[3];
        BOOL v10 = __OFADD__(v11, v14);
        int v7 = v11 + v14;
        if (!((v7 < 0) ^ v10 | (v7 == 0)))
        {
          LODWORD(v6) = v6 + 4;
          goto LABEL_32;
        }
        int v15 = v8[4];
        BOOL v10 = __OFADD__(v7, v15);
        int v11 = v7 + v15;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 5;
          goto LABEL_33;
        }
        int v16 = v8[5];
        BOOL v10 = __OFADD__(v11, v16);
        int v7 = v11 + v16;
        if (!((v7 < 0) ^ v10 | (v7 == 0))) {
          break;
        }
        int v17 = v8[6];
        BOOL v10 = __OFADD__(v7, v17);
        int v11 = v7 + v17;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 7;
          goto LABEL_33;
        }
        int v18 = v8[7];
        v8 += 8;
        int v7 = v11 + v18;
        LODWORD(v6) = v6 + 8;
        if (v7 >= 1) {
          goto LABEL_32;
        }
      }
      LODWORD(v6) = v6 + 6;
LABEL_32:
      int v7 = v11;
    }
LABEL_33:
    int v22 = 32 * v6;
    *a3 = 32 * v6;
    *a4 = -v7;
    unsigned int v23 = 1 - v7;
    int v24 = a2[v6];
    if (v23 >= 9)
    {
      do
      {
        int v25 = (((v24 - 1) & v24) - 1) & (v24 - 1) & v24;
        int v26 = (((v25 - 1) & v25) - 1) & (v25 - 1) & v25;
        int v27 = (((v26 - 1) & v26) - 1) & (v26 - 1) & v26;
        int v24 = (((v27 - 1) & v27) - 1) & (v27 - 1) & v27;
        v23 -= 8;
      }
      while (v23 > 8);
    }
    if (v23 >= 4)
    {
      do
      {
        int v28 = (((v24 - 1) & v24) - 1) & (v24 - 1) & v24;
        int v24 = (v28 - 1) & v28;
        v23 -= 3;
      }
      while (v23 > 3);
    }
    if (v23 >= 2)
    {
      do
      {
        v24 &= v24 - 1;
        --v23;
      }
      while (v23 > 1);
    }
    return (v22 | 0x1F) - __clz((v24 - 1) ^ v24);
  }
  return v4;
}

void CGrNavigatorT<unsigned short,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

unint64_t CMedian::CKernel13x9C::IdealTSize(CMedian::CKernel13x9C *this)
{
  id v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 16);
  }
  else {
    return 0x10000000100;
  }
}

void CMedian::CKernel13x9C::~CKernel13x9C(CMedian::CKernel13x9C *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernel13x9C::Process_(CMedian::CKernel13x9C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, int64x2_t *a5)
{
  puts("CKernel13x9C - local allocation");
  int v9 = (char *)malloc_type_calloc(0x2A540uLL, 1uLL, 0x58D52512uLL);
  BOOL v10 = v9 + 1344;
  v38[1] = 0;
  void v38[2] = v9 + 140608;
  long long v11 = *((_OWORD *)a2 + 3);
  long long v39 = xmmword_1A980BA20;
  long long v40 = v11;
  v38[3] = 2 * v11;
  uint64_t v41 = 1;
  __int16 v42 = 1;
  v38[0] = &unk_1EFFD4A80;
  v31[1] = 0;
  uint64_t v32 = (unsigned __int16 *)(v9 + 156992);
  long long v12 = *((_OWORD *)a3 + 3);
  long long v34 = xmmword_1A980BA20;
  long long v35 = v12;
  uint64_t v33 = 2 * v12;
  uint64_t v36 = 1;
  __int16 v37 = 1;
  v31[0] = &unk_1EFFD4A80;
  uint64_t v13 = *((void *)a2 + 4);
  if (v13 == 4)
  {
    int v18 = *(unsigned __int8 *)(*((void *)this + 1587) + 47);
    CMedian::OrdinalTransform((uint64_t)a2, v38, v10);
    uint64_t v19 = *((void *)this + 1587);
    if (a5 && v18)
    {
      uint64_t v20 = a5[1].i64[1];
      uint64_t v25 = a5[1].i64[0];
      uint64_t v26 = v20;
      int64x2_t v21 = vshrq_n_s64(vshlq_n_s64(a5[3], 0x20uLL), 0x20uLL);
      int64x2_t v27 = a5[2];
      int64x2_t v28 = v21;
      uint64_t v29 = a5[4].i64[0];
      __int16 v30 = 1;
      unsigned int v23 = &unk_1EFFD4A60;
      uint64_t v24 = 0;
      CMedian::Median13x9Comp_(v19, (uint64_t)v38, (uint64_t)v31, (uint64_t)&v23, v9);
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v23);
    }
    else
    {
      CMedian::Median13x9C_(v19, (uint64_t)v38, (uint64_t)v31, v9);
    }
    CMedian::OrdinalTransform(v32, v33, (uint64_t)a3, (uint64_t)(v9 + 107840));
  }
  else if (v13 == 2)
  {
    int v14 = *(unsigned __int8 *)(*((void *)this + 1587) + 47);
    CMedian::OrdinalTransform((uint64_t)a2, v38, v10);
    uint64_t v15 = *((void *)this + 1587);
    if (a5 && v14)
    {
      uint64_t v16 = a5[1].i64[1];
      uint64_t v25 = a5[1].i64[0];
      uint64_t v26 = v16;
      int64x2_t v17 = vshrq_n_s64(vshlq_n_s64(a5[3], 0x20uLL), 0x20uLL);
      int64x2_t v27 = a5[2];
      int64x2_t v28 = v17;
      uint64_t v29 = a5[4].i64[0];
      __int16 v30 = 1;
      unsigned int v23 = &unk_1EFFD4A60;
      uint64_t v24 = 0;
      CMedian::Median13x9Comp_(v15, (uint64_t)v38, (uint64_t)v31, (uint64_t)&v23, v9);
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v23);
    }
    else
    {
      CMedian::Median13x9C_(v15, (uint64_t)v38, (uint64_t)v31, v9);
    }
    CMedian::OrdinalTransform((uint64_t)v32, v33, (uint64_t)a3, (uint64_t)(v9 + 91456));
  }
  free(v9);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v31);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v38);
  return 0;
}

uint64_t CMedian::Median13x9Comp_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  unsigned int v197 = *(_DWORD *)(a3 + 48) - 1;
  uint64_t v7 = **(unsigned __int8 **)(a4 + 16);
  int v8 = *(unsigned __int16 *)(a1 + 2 * v7 + 822);
  uint64_t v9 = v7;
  int v10 = *(unsigned __int8 *)(a1 + v7 + 53);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 32);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(a3 + 56);
  int v14 = *(_DWORD *)(a1 + 24);
  bzero(a5, 0x540uLL);
  int v15 = v14;
  uint64_t v16 = (unsigned __int8 *)(a5 + 32);
  int64x2_t v17 = (unsigned int *)(a5 + 288);
  int v210 = v8;
  unsigned int v211 = 0;
  int v18 = -v10;
  uint64_t v19 = v9;
  do
  {
    if (v18 >= 0) {
      unsigned int v20 = v18;
    }
    else {
      unsigned int v20 = -v18;
    }
    int v21 = *(unsigned __int8 *)(v12 + (v9 << 7) + v20) - 1;
    int v22 = (unsigned __int16 *)(*(void *)(a2 + 16)
                             + *(void *)(a2 + 24) * (v18 + v14)
                             + 2 * (v14 - v21));
    uint64_t v23 = (2 * v21) | 1u;
    do
    {
      unsigned int v24 = *v22++;
      unint64_t v25 = (unint64_t)v24 >> 5;
      unsigned int v26 = v17[v25];
      ++v16[v25];
      v17[v25] = (1 << v24) ^ v26;
      --v23;
    }
    while (v23);
  }
  while (v18++ != v10);
  int v194 = v8;
  LODWORD(v28) = 0;
  int v29 = 0;
  uint64_t v196 = (int)v13;
  int v30 = v14 - 1;
  int v31 = v14 + 1;
  uint64_t v188 = v12 + 1;
  uint64_t v32 = v197;
  int v33 = 1;
  uint64_t v193 = v12;
  int v189 = v14 - 1;
  int v191 = v14 + 1;
LABEL_13:
  uint64_t v34 = v19;
  uint64_t v35 = v12 + (v19 << 7);
  uint64_t v28 = (int)v28;
  unsigned int v36 = v30 + v28;
  unsigned int v37 = v31 + v28;
  int v198 = (2 * v10) | 1;
  int v199 = -v10;
  uint64_t v195 = v19;
  while (1)
  {
    unsigned int v208 = v36;
    uint64_t v39 = *(void *)(a3 + 16);
    uint64_t v38 = *(void *)(a3 + 24);
    if (v34)
    {
      int v204 = v33;
      uint64_t v206 = v28;
      unsigned int v40 = v37;
      uint64_t v41 = v32;
      int v42 = v29;
      uint64_t v43 = *(void *)(a3 + 24);
      uint64_t result = Hist13x9CRead_(v16, v17, &v211, &v210);
      uint64_t v38 = v43;
      int v29 = v42;
      uint64_t v28 = v206;
      int v33 = v204;
      uint64_t v32 = v41;
      uint64_t v34 = v195;
      unsigned int v37 = v40;
    }
    else
    {
      uint64_t result = *(unsigned __int16 *)(*(void *)(a2 + 16)
                                   + 2 * (v29 + v15)
                                   + *(void *)(a2 + 24) * (v15 + v28));
    }
    *(_WORD *)(v38 * v28 + v39 + 2 * v29) = result;
    if (v29 != v32)
    {
      int v60 = v29 - (v33 == -1);
      unsigned int v61 = v208;
      if (v33 < 1)
      {
        uint64_t v19 = *(unsigned __int8 *)(*(void *)(a4 + 16) + v60 + *(void *)(a4 + 24) * v28);
        uint64_t v62 = v19;
        uint64_t v12 = v193;
        uint64_t v63 = v34;
      }
      else
      {
        uint64_t v19 = *(unsigned __int8 *)(*(void *)(a4 + 16) + v60 + 1 + *(void *)(a4 + 24) * v28);
        uint64_t v62 = v34;
        uint64_t v63 = v19;
        uint64_t v12 = v193;
      }
      int v64 = v210 - v194;
      int v205 = *(unsigned __int8 *)(a1 + v19 + 53);
      int v194 = *(unsigned __int16 *)(a1 + 2 * v19 + 822);
      int v65 = v64 + v194;
      if (*(unsigned __int16 *)(a1 + 310 + 2 * v62) != *(unsigned __int16 *)(a1 + 310 + 2 * v63))
      {
        uint64_t v201 = v19;
        unsigned int v209 = v32;
        uint64_t v90 = v12 + (v62 << 7);
        uint64_t v91 = v12 + (v63 << 7);
        LODWORD(v92) = *(unsigned __int8 *)(a1 + 53 + v62);
        int v207 = v28;
        int v93 = v15 + v28;
        unsigned int v94 = v211;
        if (*(unsigned __int8 *)(a1 + 53 + v63) <= v92) {
          uint64_t v92 = v92;
        }
        else {
          uint64_t v92 = *(unsigned __int8 *)(a1 + 53 + v63);
        }
        while (1)
        {
          unsigned int v95 = *(unsigned __int8 *)(v90 + v92);
          uint64_t v96 = *(unsigned __int8 *)(v91 + v92);
          uint64_t v97 = *(void *)(a2 + 24);
          uint64_t v98 = 2 * (v60 + v15) + *(void *)(a2 + 16);
          uint64_t v99 = v98 + v97 * (v93 - v92);
          uint64_t v100 = v98 + v97 * (v93 + v92);
          if (*(unsigned char *)(v90 + v92))
          {
            int v101 = 1 - v95;
            if (*(unsigned char *)(v91 + v92))
            {
              int v102 = 2 - v96;
              if (v101 != 2 - v96)
              {
                if (v101 >= v102) {
                  unsigned int v103 = 2 - v96;
                }
                else {
                  unsigned int v103 = 1 - v95;
                }
                if (v101 > v102) {
                  int v102 = 1 - v95;
                }
                if (v101 <= 2 - (int)v96) {
                  int v104 = -v33;
                }
                else {
                  int v104 = v33;
                }
                if (v102 != v103)
                {
                  uint64_t v105 = (int)v103;
                  unsigned int v106 = (unsigned __int16 *)(v99 + 2 * (int)v103);
                  uint64_t v107 = -(uint64_t)(v102 - v105);
                  uint64_t v108 = v107;
                  do
                  {
                    unsigned int v109 = *v106++;
                    unint64_t v110 = (unint64_t)v109 >> 5;
                    unsigned int v111 = v17[v110];
                    v16[v110] += v104;
                    v65 -= v104 & ((int)(v109 - v94) >> 31);
                    v17[v110] = (1 << v109) ^ v111;
                    BOOL v112 = __CFADD__(v108++, 1);
                  }
                  while (!v112);
                  if (v92 < 1)
                  {
                    uint64_t v12 = v193;
                  }
                  else
                  {
                    v113 = (unsigned __int16 *)(v100 + 2 * v105);
                    uint64_t v12 = v193;
                    do
                    {
                      unsigned int v114 = *v113++;
                      unint64_t v115 = (unint64_t)v114 >> 5;
                      unsigned int v116 = v17[v115];
                      v16[v115] += v104;
                      v65 -= v104 & ((int)(v114 - v94) >> 31);
                      v17[v115] = (1 << v114) ^ v116;
                      BOOL v112 = __CFADD__(v107++, 1);
                    }
                    while (!v112);
                  }
                }
              }
              unsigned int v139 = v96 + 1;
              if (v96 + 1 != v95)
              {
                uint64_t v140 = v139 >= v95 ? v95 : v139;
                int v141 = v139 <= v95 ? v95 : v139;
                int v142 = v139 >= v95 ? v33 : -v33;
                if (v141 != v140)
                {
                  unsigned int v143 = (unsigned __int16 *)(v99 + 2 * v140);
                  uint64_t v144 = (v141 - v140);
                  uint64_t v145 = v144;
                  do
                  {
                    unsigned int v146 = *v143++;
                    unint64_t v147 = (unint64_t)v146 >> 5;
                    unsigned int v148 = v17[v147];
                    v16[v147] += v142;
                    v65 -= v142 & ((int)(v146 - v94) >> 31);
                    v17[v147] = (1 << v146) ^ v148;
                    --v145;
                  }
                  while (v145);
                  if (v92 < 1) {
                    goto LABEL_88;
                  }
                  BOOL v149 = (unsigned __int16 *)(v100 + 2 * v140);
                  do
                  {
                    unsigned int v150 = *v149++;
                    unint64_t v151 = (unint64_t)v150 >> 5;
                    unsigned int v152 = v17[v151];
                    v16[v151] += v142;
                    v65 -= v142 & ((int)(v150 - v94) >> 31);
                    v17[v151] = (1 << v150) ^ v152;
                    --v144;
                  }
                  while (v144);
                }
              }
            }
            else
            {
              uint64_t v128 = v101;
              uint64_t v129 = (unsigned __int16 *)(v99 + 2 * v101);
              uint64_t v130 = 2 * v95 - 1;
              uint64_t v131 = v130;
              do
              {
                unsigned int v132 = *v129++;
                unint64_t v133 = (unint64_t)v132 >> 5;
                unsigned int v134 = v17[v133];
                v16[v133] -= v33;
                v65 += v33 & ((int)(v132 - v94) >> 31);
                v17[v133] = (1 << v132) ^ v134;
                --v131;
              }
              while (v131);
              if (v92 < 1) {
                goto LABEL_88;
              }
              v135 = (unsigned __int16 *)(v100 + 2 * v128);
              do
              {
                unsigned int v136 = *v135++;
                unint64_t v137 = (unint64_t)v136 >> 5;
                unsigned int v138 = v17[v137];
                v16[v137] -= v33;
                v65 += v33 & ((int)(v136 - v94) >> 31);
                v17[v137] = (1 << v136) ^ v138;
                --v130;
              }
              while (v130);
            }
          }
          else
          {
            uint64_t v117 = 2 - v96;
            __int16 v118 = (unsigned __int16 *)(v99 + 2 * (2 - v96));
            uint64_t v119 = (2 * v96 - 1);
            uint64_t v120 = v119;
            do
            {
              unsigned int v121 = *v118++;
              unint64_t v122 = (unint64_t)v121 >> 5;
              unsigned int v123 = v17[v122];
              v16[v122] += v33;
              v65 -= v33 & ((int)(v121 - v94) >> 31);
              v17[v122] = (1 << v121) ^ v123;
              --v120;
            }
            while (v120);
            if (v92 < 1)
            {
LABEL_88:
              int v210 = v65;
              int v30 = v189;
              uint64_t v32 = v209;
              int v10 = v205;
              LODWORD(v28) = v207;
              uint64_t v19 = v201;
              goto LABEL_97;
            }
            uint64_t v124 = (unsigned __int16 *)(v100 + 2 * v117);
            do
            {
              unsigned int v125 = *v124++;
              unint64_t v126 = (unint64_t)v125 >> 5;
              unsigned int v127 = v17[v126];
              v16[v126] += v33;
              v65 -= v33 & ((int)(v125 - v94) >> 31);
              v17[v126] = (1 << v125) ^ v127;
              --v119;
            }
            while (v119);
          }
          if (v92-- <= 0) {
            goto LABEL_88;
          }
        }
      }
      uint64_t v66 = v32;
      uint64_t v67 = v19 << 7;
      unsigned int v68 = v211;
      int v69 = v60 + v15;
      int v70 = v60 + v15 + 1;
      uint64_t v71 = (v15 + v28);
      if (v33 == 1)
      {
        int v10 = *(unsigned __int8 *)(a1 + v19 + 53);
        if (*(unsigned char *)(a1 + v19 + 53))
        {
          uint64_t v200 = v19;
          uint64_t v72 = (unsigned __int8 *)(v188 + v67);
          uint64_t v73 = *(unsigned __int8 *)(a1 + v19 + 53);
          unsigned int v74 = v37;
          do
          {
            int v75 = *v72++;
            uint64_t v76 = *(void *)(a2 + 16) + *(void *)(a2 + 24) * v74;
            unint64_t v77 = *(unsigned __int16 *)(v76 + 2 * (v69 + v75));
            unint64_t v78 = v77 >> 5;
            unint64_t v79 = *(unsigned __int16 *)(v76 + 2 * (v70 - v75));
            unsigned __int8 v80 = v16[v77 >> 5];
            v17[v78] = (1 << v77) ^ v17[v77 >> 5];
            unint64_t v81 = v79 >> 5;
            unsigned int v82 = v17[v79 >> 5];
            v16[v78] = v80 + 1;
            v16[v81] = v16[v79 >> 5] - 1;
            unsigned int v83 = v65 + ((int)(v77 - v68) >> 31) + ((v79 - v68) >> 31);
            uint64_t v84 = *(void *)(a2 + 16);
            uint64_t v85 = *(void *)(a2 + 24);
            v17[v81] = v82 ^ (1 << v79);
            uint64_t v86 = v84 + v85 * v61;
            unint64_t v87 = *(unsigned __int16 *)(v86 + 2 * (v69 + v75));
            unint64_t v88 = v87 >> 5;
            unint64_t v89 = *(unsigned __int16 *)(v86 + 2 * (v70 - v75));
            LOBYTE(v84) = v16[v87 >> 5];
            v17[v88] = (1 << v87) ^ v17[v87 >> 5];
            LODWORD(v81) = v17[v89 >> 5];
            v16[v88] = v84 + 1;
            LOBYTE(v88) = v16[v89 >> 5];
            int v65 = v83 + ((int)(v87 - v68) >> 31) + ((v89 - v68) >> 31);
            v17[v89 >> 5] = v81 ^ (1 << v89);
            v16[v89 >> 5] = v88 - 1;
            --v61;
            ++v74;
            --v73;
          }
          while (v73);
          unsigned int v68 = v211;
          int v30 = v189;
          uint64_t v32 = v66;
          uint64_t v19 = v200;
        }
        else
        {
          int v30 = v189;
        }
        int v174 = *(unsigned __int8 *)(v12 + v67);
        uint64_t v175 = *(void *)(a2 + 16) + *(void *)(a2 + 24) * v71;
        unint64_t v176 = *(unsigned __int16 *)(v175 + 2 * (v70 - v174));
        unint64_t v177 = *(unsigned __int16 *)(v175 + 2 * (v69 + v174));
        unint64_t v178 = v177 >> 5;
        unsigned __int8 v179 = v16[v177 >> 5];
        v17[v178] = (1 << v177) ^ v17[v177 >> 5];
        unsigned int v180 = v17[v176 >> 5];
        v16[v178] = v179 + 1;
        LOBYTE(v178) = v16[v176 >> 5];
        int v210 = v65 + ((int)(v177 - v68) >> 31) + ((v176 - v68) >> 31);
        v17[v176 >> 5] = v180 ^ (1 << v176);
        v16[v176 >> 5] = v178 - 1;
      }
      else
      {
        int v10 = *(unsigned __int8 *)(a1 + v19 + 53);
        if (*(unsigned char *)(a1 + v19 + 53))
        {
          uint64_t v202 = v19;
          int v154 = v28;
          v155 = (unsigned __int8 *)(v188 + v67);
          uint64_t v156 = *(unsigned __int8 *)(a1 + v19 + 53);
          unsigned int v157 = v37;
          do
          {
            int v158 = *v155++;
            uint64_t v159 = *(void *)(a2 + 16) + *(void *)(a2 + 24) * v157;
            unint64_t v160 = *(unsigned __int16 *)(v159 + 2 * (v70 - v158));
            unint64_t v161 = v160 >> 5;
            unint64_t v162 = *(unsigned __int16 *)(v159 + 2 * (v69 + v158));
            unsigned __int8 v163 = v16[v160 >> 5];
            v17[v161] = v17[v160 >> 5] ^ (1 << v160);
            unint64_t v164 = v162 >> 5;
            unsigned int v165 = v17[v162 >> 5];
            v16[v161] = v163 + 1;
            v16[v164] = v16[v162 >> 5] - 1;
            unsigned int v166 = v65 + ((int)(v160 - v68) >> 31) + ((v162 - v68) >> 31);
            uint64_t v167 = *(void *)(a2 + 16);
            uint64_t v168 = *(void *)(a2 + 24);
            v17[v164] = v165 ^ (1 << v162);
            uint64_t v169 = v167 + v168 * v61;
            unint64_t v170 = *(unsigned __int16 *)(v169 + 2 * (v70 - v158));
            unint64_t v171 = v170 >> 5;
            unint64_t v172 = *(unsigned __int16 *)(v169 + 2 * (v69 + v158));
            LOBYTE(v167) = v16[v170 >> 5];
            v17[v171] = (1 << v170) ^ v17[v170 >> 5];
            unint64_t v173 = v172 >> 5;
            LODWORD(v164) = v17[v172 >> 5];
            v16[v171] = v167 + 1;
            LOBYTE(v171) = v16[v172 >> 5];
            int v65 = v166 + ((int)(v170 - v68) >> 31) + ((v172 - v68) >> 31);
            v17[v173] = v164 ^ (1 << v172);
            v16[v173] = v171 - 1;
            --v61;
            ++v157;
            --v156;
          }
          while (v156);
          unsigned int v68 = v211;
          int v30 = v189;
          uint64_t v32 = v66;
          LODWORD(v28) = v154;
          uint64_t v19 = v202;
        }
        else
        {
          int v30 = v189;
        }
        int v181 = *(unsigned __int8 *)(v12 + v67);
        uint64_t v182 = *(void *)(a2 + 16) + *(void *)(a2 + 24) * v71;
        unint64_t v183 = *(unsigned __int16 *)(v182 + 2 * (v70 - v181));
        unint64_t v184 = *(unsigned __int16 *)(v182 + 2 * (v69 + v181));
        unint64_t v185 = v183 >> 5;
        unsigned __int8 v186 = v16[v183 >> 5];
        int v187 = v183 - v68;
        v17[v183 >> 5] ^= 1 << v183;
        LODWORD(v183) = v17[v184 >> 5];
        v16[v185] = v186 + 1;
        LOBYTE(v185) = v16[v184 >> 5];
        int v210 = v65 + (v187 >> 31) + ((v184 - v68) >> 31);
        v17[v184 >> 5] = v183 ^ (1 << v184);
        v16[v184 >> 5] = v185 - 1;
      }
LABEL_97:
      if (v33 == 1) {
        int v29 = v60 + 1;
      }
      else {
        int v29 = v60;
      }
      int v31 = v191;
      goto LABEL_13;
    }
    uint64_t v45 = v28 + 1;
    if (v28 + 1 >= v196) {
      return result;
    }
    int v46 = v210;
    unsigned int v47 = v211;
    int v48 = v15 + v28;
    int v49 = v15 + v28 + 1;
    int v50 = v198;
    int v51 = v199;
    do
    {
      if (v51 >= 0) {
        unsigned int v52 = v51;
      }
      else {
        unsigned int v52 = -v51;
      }
      int v53 = *(unsigned __int8 *)(v35 + v52);
      uint64_t v54 = *(void *)(a2 + 24);
      uint64_t v55 = *(void *)(a2 + 16) + 2 * (v15 + v32 + v51);
      unint64_t v56 = *(unsigned __int16 *)(v54 * (v49 - v53) + v55);
      unint64_t v57 = *(unsigned __int16 *)(v54 * (v48 + v53) + v55);
      LOBYTE(v54) = v16[v57 >> 5];
      v17[v57 >> 5] ^= 1 << v57;
      unint64_t v58 = v56 >> 5;
      unsigned int v59 = v17[v56 >> 5];
      v16[v57 >> 5] = v54 + 1;
      LOBYTE(v55) = v16[v56 >> 5];
      v17[v58] = v59 ^ (1 << v56);
      v46 += ((int)(v57 - v47) >> 31) + ((v56 - v47) >> 31);
      v16[v58] = v55 - 1;
      ++v51;
      --v50;
    }
    while (v50);
    int v210 = v46;
    int v33 = -v33;
    int v29 = v32;
    uint64_t v32 = v197 - v32;
    unsigned int v36 = v208 + 1;
    ++v37;
    uint64_t v28 = v45;
  }
}

CMedian::CKernel13x9 *CMedian::CKernel13x9::CKernel13x9(CMedian::CKernel13x9 *this, const CMedian::CxParms *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_1EFFD4BB0;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 1587) = a2;
  *(void *)this = &unk_1EFFD4D08;
  *((_DWORD *)this + 6) = 9;
  return this;
}

CMedian::CKernel13x9C *CMedian::CKernel13x9C::CKernel13x9C(CMedian::CKernel13x9C *this, const CMedian::CxParms *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_1EFFD4BB0;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 1587) = a2;
  *(void *)this = &unk_1EFFD4D78;
  *((_DWORD *)this + 6) = 9;
  return this;
}

void CBaseRef::operator delete(void *a1)
{
  if (a1)
  {
    int v1 = *((_DWORD *)a1 + 2);
    BOOL v2 = __OFSUB__(v1, 1);
    int v3 = v1 - 1;
    if (v3 < 0 != v2)
    {
      --CMemEnv::excount;
      free(a1);
    }
    else
    {
      *((_DWORD *)a1 + 2) = v3;
    }
  }
}

void *CBaseObject::operator new(CBaseObject *this)
{
  uint64_t result = malloc_type_calloc(this, 1uLL, 0xE48945EEuLL);
  if (result)
  {
    ++CMemEnv::excount;
    if ((unint64_t)result < CBaseObject::minaddr) {
      CBaseObject::minaddr = (uint64_t)result;
    }
    if ((unint64_t)result > CBaseObject::maxaddr) {
      CBaseObject::maxaddr = (uint64_t)result;
    }
  }
  return result;
}

uint64_t bensort_(uint64_t result, int a2, int a3)
{
  if (!result) {
    return result;
  }
  uint64_t v4 = (unsigned int *)result;
  while (1)
  {
    int v5 = a3 - a2;
    if (a3 - a2 <= 2) {
      break;
    }
    signed int v6 = v4[(a2 + a3) >> 1];
    int v7 = a2 + 1;
    signed int v8 = v4[a2];
    int v9 = -2;
    int v10 = 2;
    int v11 = a2;
    int v12 = a3;
    do
    {
      int v13 = v10;
      if (v8 >= v6) {
        int v14 = v11;
      }
      else {
        int v14 = v11 + 1;
      }
      if (v6 >= v8) {
        int v15 = 0;
      }
      else {
        int v15 = -1;
      }
      signed int v16 = v4[((v12 - v7) & v15) + v7];
      v4[((v12 - v11) & v15) + v11] = v8;
      if (v6 >= v8) {
        ++v7;
      }
      int v17 = v12 - (v6 < v8);
      if (v16 >= v6) {
        int v11 = v14;
      }
      else {
        int v11 = v14 + 1;
      }
      if (v6 >= v16) {
        int v18 = 0;
      }
      else {
        int v18 = -1;
      }
      uint64_t result = ((v17 - v14) & v18) + v14;
      signed int v8 = v4[((v17 - v7) & v18) + v7];
      v4[(int)result] = v16;
      if (v6 >= v16) {
        ++v7;
      }
      int v12 = v17 - (v6 < v16);
      int v19 = v9 + 4;
      v9 += 2;
      int v10 = v13 + 2;
      BOOL v20 = v19 <= v5;
    }
    while (v19 < v5);
    while (v20)
    {
      if (v8 >= v6)
      {
        if (v8 > v6)
        {
          unsigned int v21 = v4[v12];
          v4[v12--] = v8;
          signed int v8 = v21;
          goto LABEL_28;
        }
      }
      else
      {
        v4[v11++] = v8;
      }
      signed int v8 = v4[v7++];
LABEL_28:
      BOOL v20 = ++v13 <= v5;
    }
    int v22 = v12 + 1;
    if (v11 <= v12)
    {
      int v23 = v22 - v11;
      unsigned int v24 = &v4[v11];
      do
      {
        *v24++ = v6;
        --v23;
      }
      while (v23);
    }
    if (v11 - 1 > a2) {
      uint64_t result = bensort_(v4, a2, v11 - 1);
    }
    a2 = v22;
    if (v22 >= a3) {
      return result;
    }
  }
  unsigned int v25 = v4[a2];
  if (v5 == 1)
  {
    unsigned int v26 = v4[a3];
    if (v25 > v26)
    {
      v4[a2] = v26;
      v4[a3] = v25;
    }
  }
  else
  {
    int64x2_t v27 = &v4[a2];
    unsigned int v28 = v27[1];
    unsigned int v29 = v27[2];
    if (v25 <= v28) {
      unsigned int v30 = v27[1];
    }
    else {
      unsigned int v30 = v4[a2];
    }
    if (v25 >= v28) {
      unsigned int v25 = v27[1];
    }
    if (v25 <= v29) {
      unsigned int v31 = v27[2];
    }
    else {
      unsigned int v31 = v25;
    }
    if (v25 >= v29) {
      unsigned int v25 = v27[2];
    }
    if (v30 <= v31) {
      unsigned int v32 = v31;
    }
    else {
      unsigned int v32 = v30;
    }
    if (v30 < v31) {
      unsigned int v31 = v30;
    }
    *int64x2_t v27 = v25;
    v27[1] = v31;
    void v27[2] = v32;
  }
  return result;
}

void CMedian::CKernel8C::~CKernel8C(CMedian::CKernel8C *this)
{
  *(void *)this = &unk_1EFFD4E58;
  CLock::~CLock((CMedian::CKernel8C *)((char *)this + 12704));
  CKernel::~CKernel(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1EFFD4E58;
  CLock::~CLock((CMedian::CKernel8C *)((char *)this + 12704));
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::Median(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  int v3 = (const CGrNavigator *)v2;
  uint64_t v5 = v4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (*(float *)(v1 + 8) == 0.0)
  {
    uint64_t v6 = *(unsigned int *)(v2 + 56);
    if (*(_DWORD *)(v2 + 56))
    {
      uint64_t v7 = 0;
      size_t v8 = 2 * *(void *)(v2 + 48);
      do
      {
        memcpy((void *)(*((void *)v3 + 2) + *((void *)v3 + 3) * v7), (const void *)(*(void *)(v5 + 16) + *(void *)(v5 + 24) * v7), v8);
        ++v7;
      }
      while (v6 != v7);
    }
    return 0;
  }
  if (!*(unsigned char *)(v1 + 25))
  {
    CMedian::CxParms::CxParms((uint64_t)v35, v1);
    if (!v35[0])
    {
      uint64_t v9 = 7;
      goto LABEL_42;
    }
    if (v38 - 8 <= 0x77 && v40 == 0 && v39 == 0)
    {
      unsigned int v26 = v36;
      __int16 v28 = 0;
      uint64_t v29 = 0;
      long long v30 = 0u;
      int v31 = 0;
      bzero(v32, 0x3000uLL);
      v32[784] = 0u;
      pthread_mutex_init(&v33, 0);
      char v25 = 1;
      uint64_t v34 = v35;
      unsigned int v24 = &unk_1EFFD4DB0;
      uint64_t v27 = 0x1000000010;
      uint64_t v21 = CKernel::Process((CKernel *)&v24, (const CGrNavigator *)v5, v3, 0);
      goto LABEL_38;
    }
    if ((v38 & 0xFFFFFFFC) == 4)
    {
      if (!(v40 | v39))
      {
        CMedian::CKernel13x9::CKernel13x9((CMedian::CKernel13x9 *)&v24, (const CMedian::CxParms *)v35);
        uint64_t v21 = CKernel::Process((CKernel *)&v24, (const CGrNavigator *)v5, v3, 0);
LABEL_38:
        uint64_t v9 = v21;
        CKernel::~CKernel((CKernel *)&v24);
        goto LABEL_39;
      }
    }
    else if (v38 - 1 > 6)
    {
      goto LABEL_45;
    }
    if (v40 || v38 < 4 || v39)
    {
      CMedian::CKernel13x9C::CKernel13x9C((CMedian::CKernel13x9C *)&v24, (const CMedian::CxParms *)v35);
      uint64_t v21 = CKernel::Process((CKernel *)&v24, (const CGrNavigator *)v5, v3, 0);
      goto LABEL_38;
    }
LABEL_45:
    if (v38 - 8 <= 0x77 && v40 | v39)
    {
      CMedian::CKernel16C::CKernel16C((CMedian::CKernel16C *)&v24, (const CMedian::CxParms *)v35);
      uint64_t v9 = CKernel::Process((CKernel *)&v24, (const CGrNavigator *)v5, v3, 0);
      CMedian::CKernel16C::~CKernel16C((CMedian::CKernel16C *)&v24);
    }
    else
    {
      uint64_t v9 = 0;
    }
LABEL_39:
    if (v35[0])
    {
      if (!v37) {
        return v9;
      }
      (*(void (**)(uint64_t))(*(void *)v37 + 8))(v37);
    }
LABEL_42:
    uint64_t v37 = 0;
    return v9;
  }
  CMedian::CxParms::CxParms((uint64_t)v35, v1);
  uint64_t v11 = *(unsigned int *)(v5 + 56);
  CGrNavigator::CGrNavigator((CGrNavigator *)v22, v36, *(unsigned int *)(v5 + 48), v11, 1);
  v22[0] = &unk_1EFFD4A60;
  if (v23)
  {
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        int v13 = (__int16 *)(*(void *)(v5 + 16) + *(void *)(v5 + 24) * i);
        int v14 = (char *)(v22[2] + v22[3] * i);
        uint64_t v15 = v11;
        do
        {
          int v16 = *v13++;
          unsigned int v17 = v16 >> 7;
          if (v16 < 0) {
            char v18 = -1;
          }
          else {
            char v18 = v17;
          }
          *v14++ = v18;
          --v15;
        }
        while (v15);
      }
    }
    CMedian::CKernel8x16::CKernel8x16((CMedian::CKernel8x16 *)&v24, (const CMedian::CxParms *)v35);
    uint64_t v9 = CKernel::Process((CKernel *)&v24, (const CGrNavigator *)v22, v3, 0);
    CKernel::~CKernel((CKernel *)&v24);
  }
  else
  {
    uint64_t v9 = 7;
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
  if (v35[0] && v37) {
    (*(void (**)(uint64_t))(*(void *)v37 + 8))(v37);
  }
  return v9;
}

{
  uint64_t v1;
  uint64_t v2;
  const CGrNavigator *v3;
  const CGrNavigator *v4;
  const CGrNavigator *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  long long v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float *v19;
  uint64_t v20;
  _WORD *v21;
  uint64_t v22;
  unsigned int v23;
  float *v24;
  _WORD *v25;
  float v26;
  int v27;
  int v28;
  BOOL v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int16 *v33;
  uint64_t v34;
  float *v35;
  uint64_t v36;
  unsigned int v37;
  unsigned __int16 *v38;
  float *v39;
  unsigned int v40;
  void v41[9];
  char v42;
  long long v43;
  long long v44;
  __int16 v45;
  uint64_t v46;
  long long v47;
  int v48;
  unsigned char v49[12544];
  long long v50;
  pthread_mutex_t v51;
  char *v52;
  char v53[8];
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;

  uint64_t v1 = MEMORY[0x1F4188790](a1);
  int v3 = (const CGrNavigator *)v2;
  uint64_t v5 = v4;
  int v60 = *MEMORY[0x1E4F143B8];
  if (*(float *)(v1 + 8) != 0.0)
  {
    int v10 = v1;
    CMedian::CxParms::CxParms((uint64_t)v53, v1);
    if (!v53[0])
    {
      uint64_t v9 = 7;
      goto LABEL_29;
    }
    if (v59)
    {
      *(void *)&uint64_t v44 = v54;
      *((void *)&v44 + 1) = 0x100000001;
      uint64_t v45 = 256;
      int v46 = 0;
      unsigned int v47 = 0u;
      int v48 = 0;
      bzero(v49, 0x3000uLL);
      int v50 = 0u;
      pthread_mutex_init(&v51, 0);
      BYTE8(v43) = 1;
      unsigned int v52 = v53;
      *(void *)&uint64_t v43 = &unk_1EFFD4E20;
      uint64_t v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
LABEL_25:
      uint64_t v9 = v11;
      CKernel::~CKernel((CKernel *)&v43);
      goto LABEL_26;
    }
    if (v56 - 8 <= 0x77 && v58 == 0 && v57 == 0)
    {
      *(void *)&uint64_t v44 = v54;
      uint64_t v45 = 0;
      int v46 = 0;
      unsigned int v47 = 0u;
      int v48 = 0;
      bzero(v49, 0x3000uLL);
      int v50 = 0u;
      pthread_mutex_init(&v51, 0);
      BYTE8(v43) = 1;
      unsigned int v52 = v53;
      *(void *)&uint64_t v43 = &unk_1EFFD4DE8;
      *((void *)&v44 + 1) = 0x800000010;
      uint64_t v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
      goto LABEL_25;
    }
    if ((v56 & 0xFFFFFFFC) == 4)
    {
      if (!v58 && !v57)
      {
        CMedian::CKernel13x9::CKernel13x9((CMedian::CKernel13x9 *)&v43, (const CMedian::CxParms *)v53);
        uint64_t v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
        goto LABEL_25;
      }
    }
    else if (v56 - 1 > 6)
    {
      goto LABEL_33;
    }
    if (v58 || v56 < 4 || v57)
    {
      CMedian::CKernel13x9C::CKernel13x9C((CMedian::CKernel13x9C *)&v43, (const CMedian::CxParms *)v53);
      uint64_t v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
      goto LABEL_25;
    }
LABEL_33:
    if (*(__int16 *)(v10 + 20) == -1)
    {
      CGrNavigator::CGrNavigator((CGrNavigator *)&v43, *(CMemEnv **)v10, *((void *)v5 + 6), *((void *)v5 + 7), 2);
      *(void *)&uint64_t v43 = &unk_1EFFD4A80;
      if (v49[0])
      {
        CGrNavigator::CGrNavigator((CGrNavigator *)v41, *(CMemEnv **)v10, *((void *)v3 + 6), *((void *)v3 + 7), 2);
        v41[0] = &unk_1EFFD4A80;
        if (v42)
        {
          int v16 = *((void *)v5 + 7);
          if (v16)
          {
            LODWORD(v17) = 0;
            char v18 = *((void *)v5 + 6);
            int v19 = (float *)*((void *)v5 + 2);
            BOOL v20 = *((void *)v5 + 3);
            int v22 = *((void *)&v44 + 1);
            uint64_t v21 = (_WORD *)v44;
            do
            {
              if (v18)
              {
                char v23 = 1;
                unsigned int v24 = v19;
                char v25 = v21;
                do
                {
                  unsigned int v26 = *v24++;
                  uint64_t v27 = vcvts_n_s32_f32(v26, 0x10uLL);
                  __int16 v28 = v27 & ~(v27 >> 31);
                  if (v28 >= 0xFFFF) {
                    LOWORD(v28) = -1;
                  }
                  *v25++ = v28;
                  uint64_t v29 = v18 > v23++;
                }
                while (v29);
              }
              unsigned int v17 = (v17 + 1);
              uint64_t v21 = (_WORD *)((char *)v21 + v22);
              int v19 = (float *)((char *)v19 + v20);
            }
            while (v16 > v17);
          }
          uint64_t v9 = CMedian::Median(v10);
          if (!v9)
          {
            long long v30 = *((void *)v3 + 7);
            if (v30)
            {
              LODWORD(v31) = 0;
              unsigned int v32 = *((void *)v3 + 6);
              pthread_mutex_t v33 = (unsigned __int16 *)v41[2];
              uint64_t v34 = v41[3];
              uint64_t v35 = (float *)*((void *)v3 + 2);
              unsigned int v36 = *((void *)v3 + 3);
              do
              {
                if (v32)
                {
                  uint64_t v37 = 1;
                  unsigned int v38 = v33;
                  unsigned __int8 v39 = v35;
                  do
                  {
                    unsigned __int8 v40 = *v38++;
                    *v39++ = (float)v40 * 0.000015259;
                    uint64_t v29 = v32 > v37++;
                  }
                  while (v29);
                }
                int v31 = (v31 + 1);
                uint64_t v35 = (float *)((char *)v35 + v36);
                pthread_mutex_t v33 = (unsigned __int16 *)((char *)v33 + v34);
              }
              while (v30 > v31);
            }
            uint64_t v9 = 0;
          }
        }
        else
        {
          uint64_t v9 = 7;
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v41);
      }
      else
      {
        uint64_t v9 = 7;
      }
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v43);
    }
    else
    {
      uint64_t v15 = *(_OWORD *)(v10 + 16);
      uint64_t v43 = *(_OWORD *)v10;
      uint64_t v44 = v15;
      WORD2(v44) = -1;
      uint64_t v9 = CMedian::Median(&v43, v5, v3);
    }
LABEL_26:
    if (v53[0])
    {
      if (!v55) {
        return v9;
      }
      (*(void (**)(uint64_t))(*(void *)v55 + 8))(v55);
    }
LABEL_29:
    uint64_t v55 = 0;
    return v9;
  }
  uint64_t v6 = *(unsigned int *)(v2 + 56);
  if (*(_DWORD *)(v2 + 56))
  {
    uint64_t v7 = 0;
    size_t v8 = 4 * *(void *)(v2 + 48);
    do
    {
      memcpy((void *)(*((void *)v3 + 2) + *((void *)v3 + 3) * v7), (const void *)(*((void *)v5 + 2) + *((void *)v5 + 3) * v7), v8);
      ++v7;
    }
    while (v6 != v7);
  }
  return 0;
}

void sub_1A97EE9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  CMedian::CKernel16C::~CKernel16C((CMedian::CKernel16C *)va);
  if (*v12)
  {
    if (STACK[0x3220]) {
      (*(void (**)(unint64_t))(*(void *)STACK[0x3220] + 8))(STACK[0x3220]);
    }
  }
  _Unwind_Resume(a1);
}

void CMedian::CKernel16C::~CKernel16C(CMedian::CKernel16C *this)
{
  *(void *)this = &unk_1EFFD4CD0;
  CLock::~CLock((CMedian::CKernel16C *)((char *)this + 12704));
  CKernel::~CKernel(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1EFFD4CD0;
  CLock::~CLock((CMedian::CKernel16C *)((char *)this + 12704));
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

void sub_1A97EF018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a9);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a19);
  if (*v19)
  {
    if (STACK[0x3200]) {
      (*(void (**)(unint64_t))(*(void *)STACK[0x3200] + 8))(STACK[0x3200]);
    }
  }
  _Unwind_Resume(a1);
}

unint64_t CMedian::CKernel16C::IdealTSize(CMedian::CKernel16C *this)
{
  uint64_t v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 16);
  }
  else {
    return 0x10000000100;
  }
}

uint64_t CMedian::CKernel16C::Process_(CMedian::CKernel16C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v5 = (CKernel *)MEMORY[0x1F4188790](this);
  uint64_t v7 = v6;
  unsigned int v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  int v14 = v5;
  uint64_t v334 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = CKernel::BorrowData(v5);
  if (!v15) {
    return 7;
  }
  int v16 = (CMemBlock *)v15;
  uint64_t v17 = *(void *)(v15 + 32);
  unsigned int v18 = v9;
  int v19 = (char *)(v17 + 611256 * v9);
  uint64_t v20 = (uint64_t)(v19 + 9280);
  v314[1] = 0;
  v315 = v19 + 337008;
  long long v21 = *(_OWORD *)(v13 + 48);
  long long v317 = xmmword_1A980BA20;
  long long v318 = v21;
  uint64_t v316 = 2 * v21;
  uint64_t v319 = 1;
  __int16 v320 = 1;
  v314[0] = &unk_1EFFD4A80;
  v307[1] = 0;
  v308 = v19 + 496056;
  long long v22 = *(_OWORD *)(v11 + 48);
  long long v310 = xmmword_1A980BA20;
  long long v311 = v22;
  uint64_t v309 = 2 * v22;
  uint64_t v312 = 1;
  __int16 v313 = 1;
  v307[0] = &unk_1EFFD4A80;
  uint64_t v23 = *((void *)v14 + 1587);
  if (v7 && *(unsigned char *)(v23 + 46) && *(unsigned char *)(v23 + 47))
  {
    unsigned int v277 = v9;
    CMedian::Median16CFlattenHistComp_(v23, v13, (uint64_t)v314, v20);
    uint64_t v24 = *((void *)v14 + 1587);
    char v25 = *(unsigned __int8 **)(v7 + 16);
    uint64_t v26 = *(void *)(v7 + 24);
    long long v28 = *(_OWORD *)(v7 + 32);
    int64x2_t v27 = *(int64x2_t *)(v7 + 48);
    v327 = 0;
    v328 = v25;
    long long v330 = v28;
    int64x2_t v331 = vshrq_n_s64(vshlq_n_s64(v27, 0x20uLL), 0x20uLL);
    uint64_t v29 = *(void *)(v7 + 64);
    uint64_t v329 = v26;
    uint64_t v332 = v29;
    __int16 v333 = 1;
    v326 = (char *)&unk_1EFFD4A60;
    unsigned int v289 = v311 - 1;
    uint64_t v30 = *v25;
    int v275 = *(unsigned __int16 *)(v24 + 2 * v30 + 822);
    uint64_t v31 = *(void *)(v24 + 16);
    v269 = (void *)v7;
    int v302 = *(unsigned __int8 *)(v24 + v30 + 53);
    if (v31) {
      uint64_t v32 = *(void *)(v31 + 32);
    }
    else {
      uint64_t v32 = 0;
    }
    int v297 = DWORD2(v311);
    uint64_t v273 = v24;
    int v109 = *(_DWORD *)(v24 + 24);
    bzero(v19, 0x2440uLL);
    int v110 = v109;
    unsigned int v111 = (unsigned __int8 *)(v19 + 32);
    BOOL v112 = (unsigned int *)(v19 + 1056);
    int v113 = v302;
    int v114 = -v302;
    uint64_t v115 = v30;
    do
    {
      if (v114 >= 0) {
        unsigned int v116 = v114;
      }
      else {
        unsigned int v116 = -v114;
      }
      int v117 = *(unsigned __int8 *)(v32 + (v30 << 7) + v116) - 1;
      __int16 v118 = &v315[2 * (v110 - v117) + v316 * (v114 + v110)];
      uint64_t v119 = (2 * v117) | 1u;
      do
      {
        unsigned int v120 = *(unsigned __int16 *)v118;
        v118 += 2;
        unint64_t v121 = ((unint64_t)v120 >> 3) & 0x1FFC;
        int v122 = *(unsigned int *)((char *)v112 + v121);
        ++v111[(unint64_t)v120 >> 6];
        *(unsigned int *)((char *)v112 + v121) = (0x80000000 >> v120) ^ v122;
        --v119;
      }
      while (v119);
    }
    while (v114++ != v302);
    v270 = (void *)v13;
    uint64_t v279 = v17;
    v281 = v16;
    v283 = (void *)v11;
    LODWORD(v124) = 0;
    int v125 = 0;
    unsigned int v126 = v275 - *v111;
    v323[0] = 64;
    uint64_t v288 = v297;
    unsigned int v322 = v126;
    int v127 = v110 - 1;
    int v128 = v110 + 1;
    uint64_t v268 = v32 + 1;
    uint64_t v129 = v289;
    uint64_t v130 = 1;
    uint64_t v274 = v32;
LABEL_46:
    uint64_t v131 = v115;
    uint64_t v132 = v32 + (v115 << 7);
    int v294 = -v113;
    uint64_t v124 = (int)v124;
    unsigned int v133 = v127 + v124;
    unsigned int v134 = v128 + v124;
    int v291 = (2 * v113) | 1;
    uint64_t v286 = v115;
    while (1)
    {
      unsigned int v305 = v133;
      uint64_t v135 = (uint64_t)v308;
      if (v131)
      {
        unsigned int v298 = v134;
        uint64_t v136 = v130;
        uint64_t v137 = v124;
        int v138 = v125;
        __int16 v139 = Hist16CRead_(v111, v112, v323, (int *)&v322);
        uint64_t v135 = (uint64_t)v308;
        int v125 = v138;
        uint64_t v124 = v137;
        uint64_t v130 = v136;
        uint64_t v131 = v286;
        unsigned int v134 = v298;
      }
      else
      {
        __int16 v139 = *(_WORD *)&v315[2 * (v125 + v110) + v316 * (v110 + v124)];
      }
      *(_WORD *)(v309 * v124 + v135 + 2 * v125) = v139;
      if (v125 != v129)
      {
        uint64_t v152 = v131;
        int v153 = v125 - (v130 == -1);
        unsigned int v154 = v305;
        if ((int)v130 < 1)
        {
          uint64_t v115 = v328[v153 + v329 * v124];
          uint64_t v155 = v115;
        }
        else
        {
          uint64_t v115 = v328[v153 + 1 + v329 * v124];
          uint64_t v155 = v152;
          uint64_t v152 = v115;
        }
        uint64_t v32 = v274;
        int v156 = v322 - v275;
        int v113 = *(unsigned __int8 *)(v273 + v115 + 53);
        int v275 = *(unsigned __int16 *)(v273 + 2 * v115 + 822);
        unsigned int v157 = v156 + v275;
        if (*(unsigned __int16 *)(v273 + 310 + 2 * v155) == *(unsigned __int16 *)(v273 + 310 + 2 * v152))
        {
          uint64_t v158 = v115 << 7;
          unsigned int v159 = v323[0];
          int v160 = v153 + v110;
          int v161 = v153 + v110 + 1;
          uint64_t v162 = (v110 + v124);
          if (v130 == 1)
          {
            if (*(unsigned char *)(v273 + v115 + 53))
            {
              int v299 = v153;
              uint64_t v163 = v115;
              int v164 = v124;
              unsigned int v165 = (unsigned __int8 *)(v268 + v158);
              uint64_t v166 = *(unsigned __int8 *)(v273 + v115 + 53);
              unsigned int v167 = v134;
              do
              {
                int v168 = *v165++;
                uint64_t v169 = &v315[v316 * v167];
                unint64_t v170 = *(unsigned __int16 *)&v169[2 * (v161 - v168)];
                unint64_t v171 = *(unsigned __int16 *)&v169[2 * (v160 + v168)];
                int v172 = v171 - v159;
                unsigned __int8 v173 = v111[v171 >> 6];
                *(unsigned int *)((char *)v112 + ((v171 >> 3) & 0x1FFC)) ^= 0x80000000 >> v171;
                v111[v171 >> 6] = v173 + 1;
                unsigned __int8 v174 = v111[v170 >> 6];
                *(unsigned int *)((char *)v112 + ((v170 >> 3) & 0x1FFC)) ^= 0x80000000 >> v170;
                v111[v170 >> 6] = v174 - 1;
                uint64_t v175 = &v315[v316 * v154];
                unint64_t v176 = *(unsigned __int16 *)&v175[2 * (v160 + v168)];
                unint64_t v177 = *(unsigned __int16 *)&v175[2 * (v161 - v168)];
                v157 += ((v170 - v159) >> 31)
                      + (v172 >> 31)
                      + ((v177 - v159) >> 31)
                      + ((int)(v176 - v159) >> 31);
                LOBYTE(v170) = v111[v176 >> 6];
                *(unsigned int *)((char *)v112 + ((v176 >> 3) & 0x1FFC)) ^= 0x80000000 >> v176;
                v111[v176 >> 6] = v170 + 1;
                LOBYTE(v170) = v111[v177 >> 6];
                *(unsigned int *)((char *)v112 + ((v177 >> 3) & 0x1FFC)) ^= 0x80000000 >> v177;
                v111[v177 >> 6] = v170 - 1;
                --v154;
                ++v167;
                --v166;
              }
              while (v166);
              unsigned int v159 = v323[0];
              uint64_t v32 = v274;
              LODWORD(v124) = v164;
              uint64_t v115 = v163;
              int v153 = v299;
            }
            int v178 = *(unsigned __int8 *)(v32 + v158);
            unsigned __int8 v179 = &v315[v316 * v162];
            unint64_t v180 = *(unsigned __int16 *)&v179[2 * (v161 - v178)];
            unint64_t v181 = *(unsigned __int16 *)&v179[2 * (v160 + v178)];
            unsigned int v322 = v157 + ((v180 - v159) >> 31) + ((int)(v181 - v159) >> 31);
            uint64_t v182 = (v180 >> 3) & 0x1FFC;
            unint64_t v183 = v180 >> 6;
            unsigned __int8 v184 = v111[v181 >> 6];
            *(unsigned int *)((char *)v112 + ((v181 >> 3) & 0x1FFC)) ^= 0x80000000 >> v181;
            int v185 = *(unsigned int *)((char *)v112 + v182);
            v111[v181 >> 6] = v184 + 1;
            unsigned __int8 v186 = v111[v180 >> 6];
            unsigned int v187 = 0x80000000 >> v180;
          }
          else
          {
            if (*(unsigned char *)(v273 + v115 + 53))
            {
              int v301 = v153;
              uint64_t v236 = v115;
              int v237 = v124;
              v238 = (unsigned __int8 *)(v268 + v158);
              uint64_t v239 = *(unsigned __int8 *)(v273 + v115 + 53);
              unsigned int v240 = v134;
              do
              {
                int v241 = *v238++;
                v242 = &v315[v316 * v240];
                unint64_t v243 = *(unsigned __int16 *)&v242[2 * (v161 - v241)];
                unint64_t v244 = *(unsigned __int16 *)&v242[2 * (v160 + v241)];
                unsigned __int8 v245 = v111[v243 >> 6];
                *(unsigned int *)((char *)v112 + ((v243 >> 3) & 0x1FFC)) ^= 0x80000000 >> v243;
                v111[v243 >> 6] = v245 + 1;
                unsigned __int8 v246 = v111[v244 >> 6];
                *(unsigned int *)((char *)v112 + ((v244 >> 3) & 0x1FFC)) ^= 0x80000000 >> v244;
                unsigned int v247 = v157 + ((v244 - v159) >> 31);
                v111[v244 >> 6] = v246 - 1;
                v248 = &v315[v316 * v154];
                unint64_t v249 = *(unsigned __int16 *)&v248[2 * (v161 - v241)];
                unint64_t v250 = *(unsigned __int16 *)&v248[2 * (v160 + v241)];
                unsigned int v157 = v247
                     + ((int)(v243 - v159) >> 31)
                     + ((int)(v249 - v159) >> 31)
                     + ((v250 - v159) >> 31);
                LOBYTE(v248) = v111[v249 >> 6];
                *(unsigned int *)((char *)v112 + ((v249 >> 3) & 0x1FFC)) ^= 0x80000000 >> v249;
                v111[v249 >> 6] = (_BYTE)v248 + 1;
                LOBYTE(v243) = v111[v250 >> 6];
                *(unsigned int *)((char *)v112 + ((v250 >> 3) & 0x1FFC)) ^= 0x80000000 >> v250;
                v111[v250 >> 6] = v243 - 1;
                --v154;
                ++v240;
                --v239;
              }
              while (v239);
              unsigned int v159 = v323[0];
              uint64_t v32 = v274;
              LODWORD(v124) = v237;
              uint64_t v115 = v236;
              int v153 = v301;
            }
            int v251 = *(unsigned __int8 *)(v32 + v158);
            v252 = &v315[v316 * v162];
            unint64_t v253 = *(unsigned __int16 *)&v252[2 * (v161 - v251)];
            unint64_t v254 = *(unsigned __int16 *)&v252[2 * (v160 + v251)];
            unsigned int v322 = v157 + ((v254 - v159) >> 31) + ((int)(v253 - v159) >> 31);
            uint64_t v182 = (v254 >> 3) & 0x1FFC;
            unint64_t v183 = v254 >> 6;
            unsigned __int8 v255 = v111[v253 >> 6];
            *(unsigned int *)((char *)v112 + ((v253 >> 3) & 0x1FFC)) ^= 0x80000000 >> v253;
            int v185 = *(unsigned int *)((char *)v112 + v182);
            v111[v253 >> 6] = v255 + 1;
            unsigned __int8 v186 = v111[v254 >> 6];
            unsigned int v187 = 0x80000000 >> v254;
          }
          *(unsigned int *)((char *)v112 + v182) = v185 ^ v187;
          v111[v183] = v186 - 1;
          goto LABEL_139;
        }
        int v306 = *(unsigned __int8 *)(v273 + v115 + 53);
        uint64_t v292 = v115;
        int v295 = v124;
        uint64_t v188 = v274 + (v155 << 7);
        uint64_t v189 = v274 + (v152 << 7);
        LODWORD(v190) = *(unsigned __int8 *)(v273 + 53 + v155);
        int v300 = v153;
        int v191 = v110 + v124;
        uint64_t v192 = 2 * (v153 + v110);
        unsigned int v193 = v323[0];
        if (*(unsigned __int8 *)(v273 + 53 + v152) <= v190) {
          uint64_t v190 = v190;
        }
        else {
          uint64_t v190 = *(unsigned __int8 *)(v273 + 53 + v152);
        }
        while (1)
        {
          unsigned int v194 = *(unsigned __int8 *)(v188 + v190);
          uint64_t v195 = *(unsigned __int8 *)(v189 + v190);
          uint64_t v196 = (uint64_t)&v315[v192 + v316 * (v191 - v190)];
          uint64_t v197 = (uint64_t)&v315[v192 + v316 * (v191 + v190)];
          if (*(unsigned char *)(v188 + v190))
          {
            int v198 = 1 - v194;
            if (*(unsigned char *)(v189 + v190))
            {
              int v199 = 2 - v195;
              if (v198 == 2 - v195)
              {
                uint64_t v200 = v129;
              }
              else
              {
                if (v198 >= v199) {
                  unsigned int v214 = 2 - v195;
                }
                else {
                  unsigned int v214 = 1 - v194;
                }
                if (v198 <= v199) {
                  unsigned int v215 = 2 - v195;
                }
                else {
                  unsigned int v215 = 1 - v194;
                }
                if (v198 <= v199) {
                  int v216 = -(int)v130;
                }
                else {
                  int v216 = v130;
                }
                unsigned int v217 = v215 - v214;
                if (v215 == v214 || !v196)
                {
                  uint64_t v200 = v129;
                }
                else
                {
                  uint64_t v200 = v129;
                  v218 = (unsigned __int16 *)(v196 + 2 * (int)v214);
                  uint64_t v219 = -(uint64_t)v217;
                  do
                  {
                    unsigned int v220 = *v218++;
                    v111[(unint64_t)v220 >> 6] += v216;
                    v157 -= v216 & ((int)(v220 - v193) >> 31);
                    *(unsigned int *)((char *)v112 + (((unint64_t)v220 >> 3) & 0x1FFC)) ^= 0x80000000 >> v220;
                    BOOL v221 = __CFADD__(v219++, 1);
                  }
                  while (!v221);
                }
                if (v190 >= 1 && v215 != v214 && v197)
                {
                  v222 = (unsigned __int16 *)(v197 + 2 * (int)v214);
                  uint64_t v223 = -(uint64_t)v217;
                  do
                  {
                    unsigned int v224 = *v222++;
                    v111[(unint64_t)v224 >> 6] += v216;
                    v157 -= v216 & ((int)(v224 - v193) >> 31);
                    *(unsigned int *)((char *)v112 + (((unint64_t)v224 >> 3) & 0x1FFC)) ^= 0x80000000 >> v224;
                    BOOL v221 = __CFADD__(v223++, 1);
                  }
                  while (!v221);
                }
              }
              unsigned int v225 = v195 + 1;
              if (v195 + 1 == v194
                || (v225 >= v194 ? (uint64_t v226 = v194) : (uint64_t v226 = v225),
                    v225 <= v194 ? (unsigned int v227 = v194) : (unsigned int v227 = v225),
                    v225 >= v194 ? (int v228 = v130) : (int v228 = -(int)v130),
                    v227 == v226))
              {
                uint64_t v129 = v200;
              }
              else
              {
                v229 = (unsigned __int16 *)(v196 + 2 * v226);
                uint64_t v230 = v227 - v226;
                uint64_t v231 = v230;
                do
                {
                  unsigned int v232 = *v229++;
                  v111[(unint64_t)v232 >> 6] += v228;
                  v157 -= v228 & ((int)(v232 - v193) >> 31);
                  *(unsigned int *)((char *)v112 + (((unint64_t)v232 >> 3) & 0x1FFC)) ^= 0x80000000 >> v232;
                  --v231;
                }
                while (v231);
                if (v190 < 1)
                {
                  uint64_t v129 = v200;
LABEL_132:
                  unsigned int v322 = v157;
                  uint64_t v32 = v274;
                  uint64_t v115 = v292;
                  LODWORD(v124) = v295;
                  int v113 = v306;
                  int v153 = v300;
LABEL_139:
                  if (v130 == 1) {
                    int v125 = v153 + 1;
                  }
                  else {
                    int v125 = v153;
                  }
                  int v127 = v110 - 1;
                  int v128 = v110 + 1;
                  goto LABEL_46;
                }
                v233 = (unsigned __int16 *)(v197 + 2 * v226);
                uint64_t v129 = v200;
                do
                {
                  unsigned int v234 = *v233++;
                  v111[(unint64_t)v234 >> 6] += v228;
                  v157 -= v228 & ((int)(v234 - v193) >> 31);
                  *(unsigned int *)((char *)v112 + (((unint64_t)v234 >> 3) & 0x1FFC)) ^= 0x80000000 >> v234;
                  --v230;
                }
                while (v230);
              }
            }
            else
            {
              uint64_t v208 = 2 * v194 - 1;
              if (v196)
              {
                unsigned int v209 = (unsigned __int16 *)(v196 + 2 * v198);
                uint64_t v210 = v208;
                do
                {
                  unsigned int v211 = *v209++;
                  v111[(unint64_t)v211 >> 6] -= v130;
                  v157 += v130 & ((int)(v211 - v193) >> 31);
                  *(unsigned int *)((char *)v112 + (((unint64_t)v211 >> 3) & 0x1FFC)) ^= 0x80000000 >> v211;
                  --v210;
                }
                while (v210);
              }
              if (v190 < 1) {
                goto LABEL_132;
              }
              if (v197)
              {
                v212 = (unsigned __int16 *)(v197 + 2 * v198);
                do
                {
                  unsigned int v213 = *v212++;
                  v111[(unint64_t)v213 >> 6] -= v130;
                  v157 += v130 & ((int)(v213 - v193) >> 31);
                  *(unsigned int *)((char *)v112 + (((unint64_t)v213 >> 3) & 0x1FFC)) ^= 0x80000000 >> v213;
                  --v208;
                }
                while (v208);
              }
            }
          }
          else
          {
            uint64_t v201 = 2 - v195;
            uint64_t v202 = (2 * v195 - 1);
            if (v196)
            {
              v203 = (unsigned __int16 *)(v196 + 2 * v201);
              uint64_t v204 = (2 * v195 - 1);
              do
              {
                unsigned int v205 = *v203++;
                v111[(unint64_t)v205 >> 6] += v130;
                v157 -= v130 & ((int)(v205 - v193) >> 31);
                *(unsigned int *)((char *)v112 + (((unint64_t)v205 >> 3) & 0x1FFC)) ^= 0x80000000 >> v205;
                --v204;
              }
              while (v204);
            }
            if (v190 < 1) {
              goto LABEL_132;
            }
            if (v197)
            {
              uint64_t v206 = (unsigned __int16 *)(v197 + 2 * v201);
              do
              {
                unsigned int v207 = *v206++;
                v111[(unint64_t)v207 >> 6] += v130;
                v157 -= v130 & ((int)(v207 - v193) >> 31);
                *(unsigned int *)((char *)v112 + (((unint64_t)v207 >> 3) & 0x1FFC)) ^= 0x80000000 >> v207;
                --v202;
              }
              while (v202);
            }
          }
          BOOL v235 = v190-- <= 0;
          if (v235) {
            goto LABEL_132;
          }
        }
      }
      if (v124 + 1 >= v288) {
        break;
      }
      unsigned int v140 = v322;
      unsigned int v141 = v323[0];
      int v142 = v291;
      int v143 = v294;
      do
      {
        if (v143 >= 0) {
          unsigned int v144 = v143;
        }
        else {
          unsigned int v144 = -v143;
        }
        int v145 = *(unsigned __int8 *)(v132 + v144);
        unsigned int v146 = &v315[2 * (v110 + v129 + v143)];
        unint64_t v147 = *(unsigned __int16 *)&v146[v316 * (v110 + v124 + 1 - v145)];
        unint64_t v148 = *(unsigned __int16 *)&v146[v316 * (v110 + v124 + v145)];
        uint64_t v149 = (v147 >> 3) & 0x1FFC;
        unsigned __int8 v150 = v111[v148 >> 6];
        *(unsigned int *)((char *)v112 + ((v148 >> 3) & 0x1FFC)) ^= 0x80000000 >> v148;
        LODWORD(v146) = *(unsigned int *)((char *)v112 + v149);
        v111[v148 >> 6] = v150 + 1;
        unsigned __int8 v151 = v111[v147 >> 6];
        *(unsigned int *)((char *)v112 + v149) = v146 ^ (0x80000000 >> v147);
        v140 += ((v147 - v141) >> 31) + ((int)(v148 - v141) >> 31);
        v111[v147 >> 6] = v151 - 1;
        ++v143;
        --v142;
      }
      while (v142);
      unsigned int v322 = v140;
      uint64_t v130 = -(int)v130;
      int v125 = v129;
      uint64_t v129 = v289 - v129;
      unsigned int v133 = v305 + 1;
      ++v134;
      ++v124;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v326);
    CMedian::OrdinalTransform((uint64_t)v308, v309, (uint64_t)v283, v279 + 611256 * v277 + 205936);
    unint64_t v256 = *((void *)&v311 + 1);
    int v16 = v281;
    if (*((void *)&v311 + 1))
    {
      uint64_t v257 = 0;
      unint64_t v258 = v311;
      do
      {
        if (v258)
        {
          uint64_t v259 = v269[4];
          uint64_t v260 = *((void *)v14 + 1587);
          uint64_t v261 = v270[2];
          uint64_t v262 = v270[3];
          uint64_t v263 = v270[4];
          uint64_t v264 = v283[4];
          v265 = (_WORD *)(v283[2] + v283[3] * v257);
          v266 = (unsigned __int8 *)(v269[2] + v269[3] * v257);
          unsigned int v267 = 1;
          do
          {
            if (*(unsigned char *)(v260 + *v266 + 1334)) {
              *v265 += ((*(unsigned __int16 *)(v261
            }
                                             + v262 * (*(_DWORD *)(v260 + 24) + v257)
                                             + v263 * (v267 + *(_DWORD *)(v260 + 24) - 1))
                       - (unsigned __int16)*v265)
                      * *(unsigned __int8 *)(v260 + *v266 + 1334)) >> 8;
            v265 = (_WORD *)((char *)v265 + v264);
            v266 += v259;
            BOOL v235 = v258 > v267++;
          }
          while (v235);
        }
        ++v257;
      }
      while (v256 > v257);
    }
  }
  else
  {
    CMedian::Median16CFlattenHistComp_(v23, v13, (uint64_t)v314, v20);
    uint64_t v33 = *((void *)v14 + 1587);
    uint64_t v34 = *(unsigned int *)(v33 + 24);
    if (v34 <= 0x7F)
    {
      v280 = v16;
      uint64_t v282 = v11;
      v284 = v14;
      int v35 = v311;
      int v303 = DWORD2(v311);
      int v36 = *(_DWORD *)(v33 + 36);
      uint64_t v37 = (2 * v34) | 1;
      unsigned int v38 = (unsigned __int8 *)(v33 + 1590);
      bzero(&v326, 0x800uLL);
      bzero(v323, 0x800uLL);
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = v316;
      do
      {
        int v42 = v38[v40];
        (&v326)[v40] = (char *)(v39 + 2 * v38[v40]);
        *(void *)&v323[2 * v40++] = v39 + 2 * (v37 - v42);
        v39 += v41;
      }
      while (v37 != v40);
      bzero(v19, 0x2440uLL);
      uint64_t v43 = 0;
      uint64_t v44 = (unsigned __int8 *)(v19 + 32);
      uint64_t v45 = (unsigned int *)(v19 + 1056);
      do
      {
        uint64_t v46 = v38[v43];
        unsigned int v47 = &v315[2 * v46 + v316 * v43];
        uint64_t v48 = (v37 - 2 * v46);
        do
        {
          unsigned int v49 = *(unsigned __int16 *)v47;
          v47 += 2;
          unint64_t v50 = ((unint64_t)v49 >> 3) & 0x1FFC;
          int v51 = *(unsigned int *)((char *)v45 + v50);
          ++v44[(unint64_t)v49 >> 6];
          *(unsigned int *)((char *)v45 + v50) = (0x80000000 >> v49) ^ v51;
          --v48;
        }
        while (v48);
        ++v43;
      }
      while (v43 != v37);
      v290 = v38;
      unsigned int v278 = v9;
      int v52 = 0;
      LODWORD(v53) = 0;
      int v54 = v35 - 1;
      unsigned int v322 = 0;
      int v321 = v36;
      int v55 = v303 - 1;
      v285 = v326;
      v276 = v327;
      int v304 = 1;
      int v56 = v35 - 1;
      uint64_t v272 = *(void *)v323;
      uint64_t v271 = v324;
      int v287 = v55;
LABEL_15:
      uint64_t v296 = 2 * v52;
      int v57 = v52;
      int v293 = v54 - v52;
      if ((int)v53 <= v55) {
        int v58 = v55;
      }
      else {
        int v58 = v53;
      }
      uint64_t v53 = (int)v53;
      uint64_t v59 = v58;
      while (1)
      {
        *(_WORD *)&v308[v296 + v309 * v53] = Hist16CRead_(v44, v45, &v322, &v321);
        if (v57 != v56)
        {
          uint64_t v72 = (uint64_t)&v315[v296 + v316 * v53];
          if (v304 == 1)
          {
            unsigned int v73 = v322;
            unsigned int v74 = &v328;
            int v75 = (uint64_t *)v325;
            uint64_t v76 = v37;
            int v77 = v321;
            uint64_t v78 = v271;
            uint64_t v79 = v272;
            unsigned __int8 v80 = v276;
            unint64_t v81 = v285;
            do
            {
              unint64_t v82 = *(unsigned __int16 *)&v81[v72];
              unint64_t v83 = *(unsigned __int16 *)(v79 + v72);
              v77 += ((v82 - v73) >> 31) + ((int)(v83 - v73) >> 31);
              unint64_t v84 = v83 >> 6;
              uint64_t v85 = (v82 >> 3) & 0x1FFC;
              unsigned __int8 v86 = v44[v83 >> 6];
              *(unsigned int *)((char *)v45 + ((v83 >> 3) & 0x1FFC)) ^= 0x80000000 >> v83;
              LODWORD(v83) = *(unsigned int *)((char *)v45 + v85);
              v44[v84] = v86 + 1;
              unsigned __int8 v87 = v44[v82 >> 6];
              *(unsigned int *)((char *)v45 + v85) = v83 ^ (0x80000000 >> v82);
              v44[v82 >> 6] = v87 - 1;
              unint64_t v81 = v80;
              unint64_t v88 = (char *)*v74++;
              unsigned __int8 v80 = v88;
              uint64_t v79 = v78;
              uint64_t v89 = *v75++;
              uint64_t v78 = v89;
              --v76;
            }
            while (v76);
            int v321 = v77;
            int v52 = v57 + 1;
            int v304 = 1;
          }
          else
          {
            uint64_t v90 = v72 - 2;
            unsigned int v91 = v322;
            uint64_t v92 = &v328;
            int v93 = (uint64_t *)v325;
            uint64_t v94 = v37;
            int v95 = v321;
            uint64_t v96 = v271;
            uint64_t v97 = v272;
            uint64_t v98 = v276;
            uint64_t v99 = v285;
            do
            {
              unint64_t v100 = *(unsigned __int16 *)&v99[v90];
              unint64_t v101 = *(unsigned __int16 *)(v97 + v90);
              v95 += ((v101 - v91) >> 31) + ((int)(v100 - v91) >> 31);
              unint64_t v102 = v100 >> 6;
              uint64_t v103 = (v101 >> 3) & 0x1FFC;
              unsigned __int8 v104 = v44[v100 >> 6];
              *(unsigned int *)((char *)v45 + ((v100 >> 3) & 0x1FFC)) ^= 0x80000000 >> v100;
              LODWORD(v100) = *(unsigned int *)((char *)v45 + v103);
              v44[v102] = v104 + 1;
              unsigned __int8 v105 = v44[v101 >> 6];
              *(unsigned int *)((char *)v45 + v103) = v100 ^ (0x80000000 >> v101);
              v44[v101 >> 6] = v105 - 1;
              uint64_t v99 = v98;
              unsigned int v106 = (char *)*v92++;
              uint64_t v98 = v106;
              uint64_t v97 = v96;
              uint64_t v107 = *v93++;
              uint64_t v96 = v107;
              --v94;
            }
            while (v94);
            int v52 = v57 - 1;
            int v321 = v95;
          }
          int v54 = v35 - 1;
          int v55 = v287;
          goto LABEL_15;
        }
        if (v53 == v59) {
          break;
        }
        unsigned int v60 = v322;
        int v61 = v321;
        uint64_t v62 = v290;
        int v63 = v57;
        uint64_t v64 = v37;
        do
        {
          int v65 = *v62++;
          uint64_t v66 = &v315[2 * v63];
          unint64_t v67 = *(unsigned __int16 *)&v66[v316 * (v53 + v65)];
          unint64_t v68 = *(unsigned __int16 *)&v66[v316 * (v37 + v53 - v65)];
          uint64_t v69 = (v67 >> 3) & 0x1FFC;
          unsigned __int8 v70 = v44[v68 >> 6];
          *(unsigned int *)((char *)v45 + ((v68 >> 3) & 0x1FFC)) ^= 0x80000000 >> v68;
          LODWORD(v66) = *(unsigned int *)((char *)v45 + v69);
          v44[v68 >> 6] = v70 + 1;
          unsigned __int8 v71 = v44[v67 >> 6];
          *(unsigned int *)((char *)v45 + v69) = v66 ^ (0x80000000 >> v67);
          v61 += ((v67 - v60) >> 31) + ((int)(v68 - v60) >> 31);
          v44[v67 >> 6] = v71 - 1;
          ++v63;
          --v64;
        }
        while (v64);
        int v321 = v61;
        int v304 = -v304;
        ++v53;
        int v56 = v293;
      }
      uint64_t v11 = v282;
      int v14 = v284;
      int v16 = v280;
      unsigned int v18 = v278;
    }
    CMedian::OrdinalTransform((uint64_t)v308, v309, v11, v17 + 611256 * v18 + 205936);
  }
  CKernel::ReturnData(v14, v16);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v307);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v314);
  return 0;
}

void sub_1A97F0368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void CMedian::Median16CFlattenHistComp_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = *(_DWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  unsigned int v8 = (unsigned __int8 *)(a4 + 16);
  uint64_t v9 = a4 + 65568;
  uint64_t v10 = a4 + 196656;
  bzero(v104, 0x808uLL);
  unint64_t v11 = *(unsigned int *)(a1 + 24);
  bzero(v8, *(unsigned __int16 *)(a1 + 44) + 1);
  int v12 = v7;
  if (!v7)
  {
    unsigned int v14 = 0;
    goto LABEL_36;
  }
  unint64_t v13 = 0;
  unsigned int v14 = 0;
  unint64_t v15 = (v7 - v11);
  uint64_t v16 = v7;
  uint64_t v17 = a1 + 1590;
  do
  {
    unsigned int v18 = (unsigned __int16 *)(*(void *)(a2 + 16) + *(void *)(a2 + 24) * v13);
    if (v13 < v11 || (unsigned int v19 = v6, v13 >= v15))
    {
      unsigned int v20 = v12 + ~v13;
      if (v13 < v11) {
        unsigned int v20 = v13;
      }
      uint64_t v21 = *(unsigned __int8 *)(a1 + 1590 + v20);
      v18 += v21;
      unsigned int v19 = v6 - 2 * v21;
    }
    if (v19 < 0xA)
    {
      unsigned int v51 = 0;
    }
    else
    {
      int v22 = v18[1];
      int v23 = *v18;
      for (unsigned int i = 9; i < v19; i += 8)
      {
        uint64_t v25 = v18[2];
        uint64_t v26 = v18[3];
        unsigned __int8 v27 = v8[v23] + 1;
        if (v8[v23] == 255) {
          v105[v14++] = v23;
        }
        int v28 = v8[v22];
        int v29 = v22 ^ v23;
        v8[v23] = v27;
        uint64_t v30 = v18[4];
        unsigned int v31 = v28 + ((v29 - 1) >> 31) - 255;
        if (v28 + ((v29 - 1) >> 31) == 255) {
          v105[v14++] = v22;
        }
        int v32 = v8[v25];
        int v33 = v25 ^ v22;
        v8[v22] = v31;
        int v34 = v8[v26];
        uint64_t v35 = v18[5];
        unsigned int v36 = v32 + ((v33 - 1) >> 31) - 255;
        if (v32 + ((v33 - 1) >> 31) == 255) {
          v105[v14++] = v25;
        }
        int v37 = v26 ^ v25;
        v8[v25] = v36;
        int v38 = v8[v30];
        uint64_t v39 = v18[6];
        unsigned int v40 = v34 + ((v37 - 1) >> 31) - 255;
        if (!v40) {
          v105[v14++] = v26;
        }
        int v41 = v30 ^ v26;
        v8[v26] = v40;
        int v42 = v8[v35];
        uint64_t v43 = v18[7];
        unsigned int v44 = v38 + ((v41 - 1) >> 31) - 255;
        if (v38 + ((v41 - 1) >> 31) == 255) {
          v105[v14++] = v30;
        }
        int v45 = v35 ^ v30;
        v8[v30] = v44;
        int v46 = v8[v39];
        unsigned int v47 = v18 + 8;
        int v23 = v18[8];
        unsigned int v48 = v42 + ((v45 - 1) >> 31) - 255;
        if (!v48) {
          v105[v14++] = v35;
        }
        int v49 = v39 ^ v35;
        v8[v35] = v48;
        int v50 = v8[v43];
        int v22 = v18[9];
        if (v46 + ((v49 - 1) >> 31) == 255) {
          v105[v14++] = v39;
        }
        v8[v39] = v46 + (v49 - 1 < 0) + 1;
        if (v50 + (((v43 ^ v39) - 1) >> 31) == 255) {
          v105[v14++] = v43;
        }
        v8[v43] = v50 + ((int)((v43 ^ v39) - 1) < 0) + 1;
        v18 += 8;
      }
      unsigned int v51 = ((v19 - 10) & 0xFFFFFFF8) + 8;
      unsigned int v18 = v47;
    }
    BOOL v52 = v19 >= v51;
    unsigned int v53 = v19 - v51;
    if (v53 != 0 && v52)
    {
      do
      {
        int v54 = *v18++;
        unsigned int v55 = v8[v54] + 1;
        v105[v14] = v54;
        v14 += v55 >> 8;
        v8[v54] = v55;
        --v53;
      }
      while (v53);
    }
    ++v13;
  }
  while (v13 != v16);
  if (v14 >= 2)
  {
    int v56 = v12;
    bensort_((uint64_t)v105, 0, v14 - 1);
    int v12 = v56;
LABEL_36:
    uint64_t v17 = a1 + 1590;
  }
  v105[v14] = -1;
  LODWORD(v57) = v105[0];
  int v58 = *(unsigned __int16 *)(a1 + 44);
  if (!*(_WORD *)(a1 + 44))
  {
    LODWORD(v59) = 0;
    unsigned int v60 = 1;
LABEL_67:
    int v75 = v8[v59];
    uint64_t v76 = v59;
    if (v57 == v59)
    {
      int v77 = v58 + 1;
      do
      {
        v75 += 256;
        int v78 = v105[v77++];
      }
      while (v78 == v76);
    }
    for (*(_WORD *)(v9 + 2 * v76) = v60; v75; --v75)
      *(_WORD *)(v10 + 2 * v60++) = v76;
    goto LABEL_72;
  }
  unint64_t v59 = 0;
  int v58 = 0;
  unsigned int v60 = 1;
  do
  {
    unsigned int v61 = *(_DWORD *)&v8[v59];
    unsigned int v62 = bswap32(v61);
    if ((v57 ^ v59) < 4)
    {
      unsigned int v72 = HIBYTE(v62);
      *(_WORD *)(v9 + 2 * v59) = v60;
      if (v59 == v57)
      {
        do
        {
          v72 += 256;
          uint64_t v57 = v105[++v58];
        }
        while (v59 == v57);
      }
      for (; v72; --v72)
        *(_WORD *)(v10 + 2 * v60++) = v59;
      int v73 = BYTE2(v62);
      *(_WORD *)(v9 + 2 * (v59 | 1)) = v60;
      if ((v59 | 1) == v57)
      {
        do
        {
          v73 += 256;
          uint64_t v57 = v105[++v58];
        }
        while ((v59 | 1) == v57);
      }
      for (; v73; --v73)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 1;
      int v74 = BYTE1(v62);
      *(_WORD *)(v9 + 2 * (v59 | 2)) = v60;
      if ((v59 | 2) == v57)
      {
        do
        {
          v74 += 256;
          uint64_t v57 = v105[++v58];
        }
        while ((v59 | 2) == v57);
      }
      for (; v74; --v74)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 2;
      unsigned int v62 = v62;
      *(_WORD *)(v9 + 2 * (v59 | 3)) = v60;
      if ((v59 | 3) == v57)
      {
        do
        {
          v62 += 256;
          uint64_t v57 = v105[++v58];
        }
        while ((v59 | 3) == v57);
      }
      for (; v62; --v62)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 3;
    }
    else if (v61)
    {
      *(_WORD *)(v9 + 2 * v59) = v60;
      unsigned int v63 = v60 + HIBYTE(v62);
      *(_WORD *)(v9 + ((2 * v59) | 2)) = v63;
      unsigned int v64 = v63 + BYTE2(v62);
      *(_WORD *)(v9 + ((2 * v59) | 4)) = v64;
      unsigned int v65 = v64 + BYTE1(v62);
      *(_WORD *)(v9 + ((2 * v59) | 6)) = v65;
      unsigned int v66 = v65 + v62;
      unsigned int v67 = v66 - v60;
      if (v66 != v60)
      {
        unint64_t v68 = (_WORD *)(v10 + 2 * v60);
        if (v67 <= 1) {
          unsigned int v67 = 1;
        }
        uint64_t v69 = 2 * v67;
        int v70 = v59;
        do
        {
          unsigned int v71 = __clz(v62);
          v70 += v71 >> 3;
          unsigned int v62 = (v62 << (v71 & 0x18)) - 0x1000000;
          *v68++ = v70;
          v69 -= 2;
        }
        while (v69);
        unsigned int v60 = v66;
      }
    }
    v59 += 4;
  }
  while (v59 < *(unsigned __int16 *)(a1 + 44));
  if (!WORD1(v59)) {
    goto LABEL_67;
  }
LABEL_72:
  int v79 = v12 - 1;
  if (v12 - 1 >= 0)
  {
    uint64_t v80 = *(void *)(a2 + 16);
    uint64_t v81 = *(void *)(a2 + 24);
    unint64_t v82 = (v12 - v11);
    unint64_t v83 = (v12 - 1);
    uint64_t v84 = *(void *)(a3 + 16);
    uint64_t v85 = *(void *)(a3 + 24);
    do
    {
      unsigned __int8 v86 = (unsigned __int16 *)(v80 + v81 * v83);
      unsigned __int8 v87 = (_WORD *)(v84 + v85 * v83);
      if (v83 < v11 || v83 >= v82)
      {
        unsigned int v89 = v79 - v83;
        if (v83 < v11) {
          unsigned int v89 = v83;
        }
        uint64_t v90 = *(unsigned __int8 *)(v17 + v89);
        v86 += v90;
        v87 += v90;
        unsigned int v88 = v6 - 2 * v90;
      }
      else
      {
        unsigned int v88 = v6;
      }
      unsigned int v91 = v88 - 1;
      if (v88 != 1)
      {
        unsigned int v92 = 0;
        uint64_t v93 = v86[1];
        uint64_t v94 = *v86;
        do
        {
          __int16 v95 = *(_WORD *)(v9 + 2 * v94);
          __int16 v96 = *(_WORD *)(v9 + 2 * v93);
          unsigned int v97 = 0x80000000 - (unsigned __int16)(v93 ^ v94);
          *(_WORD *)(v9 + 2 * v94) = v95 + (v97 >> 30);
          *(_WORD *)(v9 + 2 * v93) = v96 + (v97 >> 30);
          unsigned int v98 = v86[2];
          v86 += 2;
          uint64_t v94 = v98;
          uint64_t v93 = v86[1];
          *unsigned __int8 v87 = v95;
          v87[1] = v96 + (v97 >> 31);
          v87 += 2;
          v92 += 2;
        }
        while (v92 < v91);
        unsigned int v91 = v88 & 0xFFFFFFFE;
      }
      BOOL v52 = v88 >= v91;
      unsigned int v99 = v88 - v91;
      if (v99 != 0 && v52)
      {
        do
        {
          unsigned int v100 = *v86++;
          __int16 v101 = *(_WORD *)(v9 + 2 * v100);
          *v87++ = v101;
          *(_WORD *)(v9 + 2 * v100) = v101 + 1;
          --v99;
        }
        while (v99);
      }
    }
    while ((uint64_t)v83-- > 0);
  }
}

uint64_t Hist16CRead_(unsigned __int8 *a1, unsigned int *a2, unsigned int *a3, int *a4)
{
  uint64_t result = 0;
  if (!a1 || !a2) {
    return result;
  }
  unint64_t v6 = *a3;
  unint64_t v7 = v6 >> 6;
  int v8 = -*a4;
  uint64_t v9 = &a1[v6 >> 6];
  if (*a4 < 0)
  {
    if (v6 >= 0x100)
    {
      while (1)
      {
        int v20 = v8 - a1[v7 - 1];
        if (v20 < 1)
        {
          unsigned int v28 = v7 - 1;
          goto LABEL_96;
        }
        int v8 = v20 - a1[v7 - 2];
        if (v8 < 1)
        {
          unsigned int v28 = v7 - 2;
          goto LABEL_50;
        }
        int v20 = v8 - a1[v7 - 3];
        if (v20 < 1) {
          break;
        }
        int v8 = v20 - a1[v7 - 4];
        int v21 = v7;
        v7 -= 4;
        BOOL v22 = v8 < 1 || v21 <= 7;
        if (v22)
        {
          uint64_t v9 = &a1[v7];
          goto LABEL_35;
        }
      }
      unsigned int v28 = v7 - 3;
LABEL_96:
      int v29 = v8;
      goto LABEL_52;
    }
    int v20 = -*a4;
LABEL_35:
    if (v8 >= 1 && (int)v7 >= 1)
    {
      uint64_t v25 = v9 - 1;
      int v20 = v8;
      do
      {
        int v26 = *v25--;
        int v29 = v20;
        v20 -= v26;
        unsigned int v28 = v7 - 1;
        BOOL v27 = v20 >= 1 && v7 > 1;
        LODWORD(v7) = v7 - 1;
      }
      while (v27);
      goto LABEL_52;
    }
    unsigned int v28 = v7;
LABEL_50:
    int v29 = v20;
  }
  else
  {
    int v10 = v7 - 1;
    if (v6 >> 7 > 0x1FE)
    {
      int v17 = v7 - 1;
      int v16 = -*a4;
      unsigned int v18 = v9;
LABEL_26:
      if (v8 > 0 || v17 > 1023)
      {
        unsigned int v28 = v17;
        int v29 = v8;
        int v8 = v16;
      }
      else
      {
        int v29 = v8;
        do
        {
          int v8 = v29;
          unsigned int v28 = v17 + 1;
          int v23 = *v18++;
          BOOL v12 = __OFADD__(v29, v23);
          v29 += v23;
          if (!((v29 < 0) ^ v12 | (v29 == 0))) {
            break;
          }
          BOOL v22 = v17++ < 1023;
        }
        while (v22);
      }
    }
    else
    {
      while (1)
      {
        int v11 = *v9;
        BOOL v12 = __OFADD__(v8, v11);
        int v13 = v8 + v11;
        if (!((v13 < 0) ^ v12 | (v13 == 0)))
        {
          unsigned int v28 = v10 + 1;
          int v29 = v13;
          goto LABEL_46;
        }
        int v14 = v9[1];
        BOOL v12 = __OFADD__(v13, v14);
        int v8 = v13 + v14;
        if (!((v8 < 0) ^ v12 | (v8 == 0)))
        {
          unsigned int v28 = v10 + 2;
          int v29 = v8;
          int v8 = v13;
          goto LABEL_46;
        }
        int v15 = v9[2];
        int v16 = v8 + v15;
        if (!((v8 + v15 < 0) ^ __OFADD__(v8, v15) | (v8 + v15 == 0))) {
          break;
        }
        int v17 = v10 + 4;
        unsigned int v18 = v9 + 4;
        int v19 = v9[3];
        BOOL v12 = __OFADD__(v16, v19);
        int v8 = v16 + v19;
        if ((v8 < 0) ^ v12 | (v8 == 0))
        {
          v9 += 4;
          BOOL v22 = v10 < 1017;
          v10 += 4;
          if (v22) {
            continue;
          }
        }
        goto LABEL_26;
      }
      unsigned int v28 = v10 + 3;
      int v29 = v8 + v15;
    }
LABEL_46:
    if (v28 > 0x3FF)
    {
      *a3 = 65472;
      *a4 = a1[1023] - v8;
      return 0xFFFFLL;
    }
  }
  int v20 = v8;
LABEL_52:
  uint64_t result = v28 << 6;
  *a3 = result;
  *a4 = -v20;
  uint64_t v30 = &a2[2 * (v28 & 0x3FFFFFF)];
  if (v20 + v29 < 0)
  {
    int v33 = v30[1];
    int v34 = v29 - (v33 & 1);
    if (v34 < 1) {
      return result | 0x3F;
    }
    int v35 = v34 + (v33 << 30 >> 31);
    if (!v35) {
      return result | 0x3E;
    }
    int v36 = v35 + (v33 << 29 >> 31);
    if (v36)
    {
      int v37 = v36 + (v33 << 28 >> 31);
      if (v37)
      {
        int v38 = v37 + (v33 << 27 >> 31);
        if (v38)
        {
          int v39 = v38 + (v33 << 26 >> 31);
          if (v39)
          {
            int v40 = v39 + (v33 << 25 >> 31);
            if (v40)
            {
              int v41 = v40 + ((char)v33 >> 7);
              if (v41)
              {
                int v42 = v41 + (v33 << 23 >> 31);
                if (v42)
                {
                  int v43 = v42 + (v33 << 22 >> 31);
                  if (v43)
                  {
                    int v44 = v43 + (v33 << 21 >> 31);
                    if (v44)
                    {
                      int v45 = v44 + (v33 << 20 >> 31);
                      if (v45)
                      {
                        int v46 = v45 + (v33 << 19 >> 31);
                        if (v46)
                        {
                          int v47 = v46 + (v33 << 18 >> 31);
                          if (v47)
                          {
                            int v48 = v47 + (v33 << 17 >> 31);
                            if (v48)
                            {
                              int v49 = v48 + ((__int16)v33 >> 15);
                              if (v49)
                              {
                                int v50 = v49 + (v33 << 15 >> 31);
                                if (v50)
                                {
                                  int v51 = v50 + (v33 << 14 >> 31);
                                  if (v51)
                                  {
                                    int v52 = v51 + (v33 << 13 >> 31);
                                    if (v52)
                                    {
                                      int v53 = v52 + (v33 << 12 >> 31);
                                      if (v53)
                                      {
                                        int v54 = v53 + (v33 << 11 >> 31);
                                        if (v54)
                                        {
                                          int v55 = v54 + (v33 << 10 >> 31);
                                          if (v55)
                                          {
                                            int v56 = v55 + (v33 << 9 >> 31);
                                            if (v56)
                                            {
                                              int v57 = v56 + (v33 << 8 >> 31);
                                              if (v57)
                                              {
                                                int v58 = v57 + (v33 << 7 >> 31);
                                                if (v58)
                                                {
                                                  int v59 = v58 + (v33 << 6 >> 31);
                                                  if (v59)
                                                  {
                                                    int v60 = v59 + ((32 * v33) >> 31);
                                                    if (v60)
                                                    {
                                                      int v61 = v60 + ((16 * v33) >> 31);
                                                      if (v61)
                                                      {
                                                        int v62 = v61 + ((8 * v33) >> 31);
                                                        if (v62)
                                                        {
                                                          int v63 = v62 + ((4 * v33) >> 31);
                                                          if (v63)
                                                          {
                                                            int v64 = v63 + ((2 * v33) >> 31);
                                                            if (v64)
                                                            {
                                                              int v65 = v64 + (v33 >> 31);
                                                              if (v65)
                                                              {
                                                                unsigned int v66 = *v30;
                                                                int v67 = v65 - (v66 & 1);
                                                                if (v67)
                                                                {
                                                                  int v101 = v67 + ((int)(v66 << 30) >> 31);
                                                                  if (v101)
                                                                  {
                                                                    int v102 = v101 + ((int)(v66 << 29) >> 31);
                                                                    if (v102)
                                                                    {
                                                                      int v103 = v102 + ((int)(v66 << 28) >> 31);
                                                                      if (v103)
                                                                      {
                                                                        int v104 = v103 + ((int)(v66 << 27) >> 31);
                                                                        if (v104)
                                                                        {
                                                                          int v105 = v104 + ((int)(v66 << 26) >> 31);
                                                                          if (v105)
                                                                          {
                                                                            int v106 = v105 + ((int)(v66 << 25) >> 31);
                                                                            if (v106)
                                                                            {
                                                                              int v107 = v106 + ((char)v66 >> 7);
                                                                              if (v107)
                                                                              {
                                                                                int v108 = v107 + ((int)(v66 << 23) >> 31);
                                                                                if (v108)
                                                                                {
                                                                                  int v109 = v108 + ((int)(v66 << 22) >> 31);
                                                                                  if (v109)
                                                                                  {
                                                                                    int v110 = v109
                                                                                         + ((int)(v66 << 21) >> 31);
                                                                                    if (v110)
                                                                                    {
                                                                                      int v111 = v110
                                                                                           + ((int)(v66 << 20) >> 31);
                                                                                      if (v111)
                                                                                      {
                                                                                        int v112 = v111
                                                                                             + ((int)(v66 << 19) >> 31);
                                                                                        if (v112)
                                                                                        {
                                                                                          int v113 = v112
                                                                                               + ((int)(v66 << 18) >> 31);
                                                                                          if (v113)
                                                                                          {
                                                                                            int v114 = v113
                                                                                                 + ((int)(v66 << 17) >> 31);
                                                                                            if (v114)
                                                                                            {
                                                                                              int v115 = v114 + ((__int16)v66 >> 15);
                                                                                              if (v115)
                                                                                              {
                                                                                                int v116 = v115 + ((int)(v66 << 15) >> 31);
                                                                                                if (v116)
                                                                                                {
                                                                                                  int v117 = v116 + ((int)(v66 << 14) >> 31);
                                                                                                  if (v117)
                                                                                                  {
                                                                                                    int v118 = v117 + ((int)(v66 << 13) >> 31);
                                                                                                    if (v118)
                                                                                                    {
                                                                                                      int v119 = v118 + ((int)(v66 << 12) >> 31);
                                                                                                      if (v119)
                                                                                                      {
                                                                                                        int v120 = v119 + ((int)(v66 << 11) >> 31);
                                                                                                        if (v120)
                                                                                                        {
                                                                                                          int v121 = v120 + ((int)(v66 << 10) >> 31);
                                                                                                          if (v121)
                                                                                                          {
                                                                                                            int v122 = v121 + ((int)(v66 << 9) >> 31);
                                                                                                            if (v122)
                                                                                                            {
                                                                                                              int v123 = v122 + ((int)(v66 << 8) >> 31);
                                                                                                              if (v123)
                                                                                                              {
                                                                                                                int v124 = v123 + ((int)(v66 << 7) >> 31);
                                                                                                                if (v124)
                                                                                                                {
                                                                                                                  int v125 = v124 + ((int)(v66 << 6) >> 31);
                                                                                                                  if (v125)
                                                                                                                  {
                                                                                                                    int v126 = v125 + ((int)(32 * v66) >> 31);
                                                                                                                    if (v126)
                                                                                                                    {
                                                                                                                      int v127 = v126 + ((int)(16 * v66) >> 31);
                                                                                                                      if (!v127) {
                                                                                                                        return result | 4;
                                                                                                                      }
                                                                                                                      int v128 = v127 + ((int)(8 * v66) >> 31);
                                                                                                                      if (!v128) {
                                                                                                                        return result | 3;
                                                                                                                      }
                                                                                                                      int v129 = v128 + ((int)(4 * v66) >> 31);
                                                                                                                      if (!v129) {
                                                                                                                        return result | 2;
                                                                                                                      }
                                                                                                                      int v78 = v129 + ((int)(2 * v66) >> 31) == 0;
                                                                                                                      return result | v78;
                                                                                                                    }
LABEL_102:
                                                                                                                    int v78 = 5;
                                                                                                                    return result | v78;
                                                                                                                  }
                                                                                                                  return result | 6;
                                                                                                                }
                                                                                                                return result | 7;
                                                                                                              }
                                                                                                              return result | 8;
                                                                                                            }
LABEL_110:
                                                                                                            int v78 = 9;
                                                                                                            return result | v78;
                                                                                                          }
LABEL_112:
                                                                                                          int v78 = 10;
                                                                                                          return result | v78;
                                                                                                        }
LABEL_114:
                                                                                                        int v78 = 11;
                                                                                                        return result | v78;
                                                                                                      }
                                                                                                      return result | 0xC;
                                                                                                    }
LABEL_118:
                                                                                                    int v78 = 13;
                                                                                                    return result | v78;
                                                                                                  }
                                                                                                  return result | 0xE;
                                                                                                }
                                                                                                return result | 0xF;
                                                                                              }
                                                                                              return result | 0x10;
                                                                                            }
LABEL_156:
                                                                                            int v78 = 17;
                                                                                            return result | v78;
                                                                                          }
LABEL_158:
                                                                                          int v78 = 18;
                                                                                          return result | v78;
                                                                                        }
LABEL_160:
                                                                                        int v78 = 19;
                                                                                        return result | v78;
                                                                                      }
LABEL_162:
                                                                                      int v78 = 20;
                                                                                      return result | v78;
                                                                                    }
LABEL_164:
                                                                                    int v78 = 21;
                                                                                    return result | v78;
                                                                                  }
LABEL_166:
                                                                                  int v78 = 22;
                                                                                  return result | v78;
                                                                                }
LABEL_168:
                                                                                int v78 = 23;
                                                                                return result | v78;
                                                                              }
                                                                              return result | 0x18;
                                                                            }
LABEL_172:
                                                                            int v78 = 25;
                                                                            return result | v78;
                                                                          }
LABEL_174:
                                                                          int v78 = 26;
                                                                          return result | v78;
                                                                        }
LABEL_176:
                                                                        int v78 = 27;
                                                                        return result | v78;
                                                                      }
                                                                      return result | 0x1C;
                                                                    }
LABEL_180:
                                                                    int v78 = 29;
                                                                    return result | v78;
                                                                  }
                                                                  return result | 0x1E;
                                                                }
                                                                return result | 0x1F;
                                                              }
                                                              return result | 0x20;
                                                            }
LABEL_188:
                                                            int v78 = 33;
                                                            return result | v78;
                                                          }
LABEL_190:
                                                          int v78 = 34;
                                                          return result | v78;
                                                        }
LABEL_192:
                                                        int v78 = 35;
                                                        return result | v78;
                                                      }
LABEL_194:
                                                      int v78 = 36;
                                                      return result | v78;
                                                    }
LABEL_196:
                                                    int v78 = 37;
                                                    return result | v78;
                                                  }
LABEL_198:
                                                  int v78 = 38;
                                                  return result | v78;
                                                }
LABEL_200:
                                                int v78 = 39;
                                                return result | v78;
                                              }
LABEL_202:
                                              int v78 = 40;
                                              return result | v78;
                                            }
LABEL_204:
                                            int v78 = 41;
                                            return result | v78;
                                          }
LABEL_206:
                                          int v78 = 42;
                                          return result | v78;
                                        }
LABEL_208:
                                        int v78 = 43;
                                        return result | v78;
                                      }
LABEL_210:
                                      int v78 = 44;
                                      return result | v78;
                                    }
LABEL_212:
                                    int v78 = 45;
                                    return result | v78;
                                  }
LABEL_214:
                                  int v78 = 46;
                                  return result | v78;
                                }
LABEL_216:
                                int v78 = 47;
                                return result | v78;
                              }
                              return result | 0x30;
                            }
LABEL_220:
                            int v78 = 49;
                            return result | v78;
                          }
LABEL_222:
                          int v78 = 50;
                          return result | v78;
                        }
LABEL_224:
                        int v78 = 51;
                        return result | v78;
                      }
LABEL_226:
                      int v78 = 52;
                      return result | v78;
                    }
LABEL_228:
                    int v78 = 53;
                    return result | v78;
                  }
LABEL_230:
                  int v78 = 54;
                  return result | v78;
                }
LABEL_232:
                int v78 = 55;
                return result | v78;
              }
              return result | 0x38;
            }
LABEL_236:
            int v78 = 57;
            return result | v78;
          }
LABEL_238:
          int v78 = 58;
          return result | v78;
        }
LABEL_240:
        int v78 = 59;
        return result | v78;
      }
      return result | 0x3C;
    }
LABEL_244:
    int v78 = 61;
    return result | v78;
  }
  unsigned int v31 = *v30;
  int v32 = v20 + (*v30 >> 31);
  if (v32 > 0) {
    return result;
  }
  int v68 = (v31 >> 30) & 1;
  BOOL v12 = __OFADD__(v32, v68);
  int v69 = v32 + v68;
  if (!((v69 < 0) ^ v12 | (v69 == 0))) {
    return result | 1;
  }
  int v70 = (v31 >> 29) & 1;
  BOOL v12 = __OFADD__(v69, v70);
  int v71 = v69 + v70;
  if (!((v71 < 0) ^ v12 | (v71 == 0))) {
    return result | 2;
  }
  int v72 = (v31 >> 28) & 1;
  BOOL v12 = __OFADD__(v71, v72);
  int v73 = v71 + v72;
  if (!((v73 < 0) ^ v12 | (v73 == 0))) {
    return result | 3;
  }
  int v74 = (v31 >> 27) & 1;
  BOOL v12 = __OFADD__(v73, v74);
  int v75 = v73 + v74;
  if (!((v75 < 0) ^ v12 | (v75 == 0))) {
    return result | 4;
  }
  int v76 = (v31 >> 26) & 1;
  BOOL v12 = __OFADD__(v75, v76);
  int v77 = v75 + v76;
  if (!((v77 < 0) ^ v12 | (v77 == 0))) {
    goto LABEL_102;
  }
  int v79 = (v31 >> 25) & 1;
  BOOL v12 = __OFADD__(v77, v79);
  int v80 = v77 + v79;
  if (!((v80 < 0) ^ v12 | (v80 == 0))) {
    return result | 6;
  }
  int v81 = HIBYTE(v31) & 1;
  BOOL v12 = __OFADD__(v80, v81);
  int v82 = v80 + v81;
  if (!((v82 < 0) ^ v12 | (v82 == 0))) {
    return result | 7;
  }
  int v83 = (v31 >> 23) & 1;
  BOOL v12 = __OFADD__(v82, v83);
  int v84 = v82 + v83;
  if (!((v84 < 0) ^ v12 | (v84 == 0))) {
    return result | 8;
  }
  int v85 = (v31 >> 22) & 1;
  BOOL v12 = __OFADD__(v84, v85);
  int v86 = v84 + v85;
  if (!((v86 < 0) ^ v12 | (v86 == 0))) {
    goto LABEL_110;
  }
  int v87 = (v31 >> 21) & 1;
  BOOL v12 = __OFADD__(v86, v87);
  int v88 = v86 + v87;
  if (!((v88 < 0) ^ v12 | (v88 == 0))) {
    goto LABEL_112;
  }
  int v89 = (v31 >> 20) & 1;
  BOOL v12 = __OFADD__(v88, v89);
  int v90 = v88 + v89;
  if (!((v90 < 0) ^ v12 | (v90 == 0))) {
    goto LABEL_114;
  }
  int v91 = (v31 >> 19) & 1;
  BOOL v12 = __OFADD__(v90, v91);
  int v92 = v90 + v91;
  if (!((v92 < 0) ^ v12 | (v92 == 0))) {
    return result | 0xC;
  }
  int v93 = (v31 >> 18) & 1;
  BOOL v12 = __OFADD__(v92, v93);
  int v94 = v92 + v93;
  if (!((v94 < 0) ^ v12 | (v94 == 0))) {
    goto LABEL_118;
  }
  int v95 = (v31 >> 17) & 1;
  BOOL v12 = __OFADD__(v94, v95);
  int v96 = v94 + v95;
  if (!((v96 < 0) ^ v12 | (v96 == 0))) {
    return result | 0xE;
  }
  int v97 = HIWORD(v31) & 1;
  BOOL v12 = __OFADD__(v96, v97);
  int v98 = v96 + v97;
  if (!((v98 < 0) ^ v12 | (v98 == 0))) {
    return result | 0xF;
  }
  int v99 = (v31 >> 15) & 1;
  BOOL v12 = __OFADD__(v98, v99);
  int v100 = v98 + v99;
  if (!((v100 < 0) ^ v12 | (v100 == 0))) {
    return result | 0x10;
  }
  int v130 = (v31 >> 14) & 1;
  BOOL v12 = __OFADD__(v100, v130);
  int v131 = v100 + v130;
  if (!((v131 < 0) ^ v12 | (v131 == 0))) {
    goto LABEL_156;
  }
  int v132 = (v31 >> 13) & 1;
  BOOL v12 = __OFADD__(v131, v132);
  int v133 = v131 + v132;
  if (!((v133 < 0) ^ v12 | (v133 == 0))) {
    goto LABEL_158;
  }
  int v134 = (v31 >> 12) & 1;
  BOOL v12 = __OFADD__(v133, v134);
  int v135 = v133 + v134;
  if (!((v135 < 0) ^ v12 | (v135 == 0))) {
    goto LABEL_160;
  }
  int v136 = (v31 >> 11) & 1;
  BOOL v12 = __OFADD__(v135, v136);
  int v137 = v135 + v136;
  if (!((v137 < 0) ^ v12 | (v137 == 0))) {
    goto LABEL_162;
  }
  int v138 = (v31 >> 10) & 1;
  BOOL v12 = __OFADD__(v137, v138);
  int v139 = v137 + v138;
  if (!((v139 < 0) ^ v12 | (v139 == 0))) {
    goto LABEL_164;
  }
  int v140 = (v31 >> 9) & 1;
  BOOL v12 = __OFADD__(v139, v140);
  int v141 = v139 + v140;
  if (!((v141 < 0) ^ v12 | (v141 == 0))) {
    goto LABEL_166;
  }
  int v142 = (v31 >> 8) & 1;
  BOOL v12 = __OFADD__(v141, v142);
  int v143 = v141 + v142;
  if (!((v143 < 0) ^ v12 | (v143 == 0))) {
    goto LABEL_168;
  }
  int v144 = (v31 >> 7) & 1;
  BOOL v12 = __OFADD__(v143, v144);
  int v145 = v143 + v144;
  if (!((v145 < 0) ^ v12 | (v145 == 0))) {
    return result | 0x18;
  }
  int v146 = (v31 >> 6) & 1;
  BOOL v12 = __OFADD__(v145, v146);
  int v147 = v145 + v146;
  if (!((v147 < 0) ^ v12 | (v147 == 0))) {
    goto LABEL_172;
  }
  int v148 = (v31 >> 5) & 1;
  BOOL v12 = __OFADD__(v147, v148);
  int v149 = v147 + v148;
  if (!((v149 < 0) ^ v12 | (v149 == 0))) {
    goto LABEL_174;
  }
  int v150 = (v31 >> 4) & 1;
  BOOL v12 = __OFADD__(v149, v150);
  int v151 = v149 + v150;
  if (!((v151 < 0) ^ v12 | (v151 == 0))) {
    goto LABEL_176;
  }
  int v152 = (v31 >> 3) & 1;
  BOOL v12 = __OFADD__(v151, v152);
  int v153 = v151 + v152;
  if (!((v153 < 0) ^ v12 | (v153 == 0))) {
    return result | 0x1C;
  }
  int v154 = (v31 >> 2) & 1;
  BOOL v12 = __OFADD__(v153, v154);
  int v155 = v153 + v154;
  if (!((v155 < 0) ^ v12 | (v155 == 0))) {
    goto LABEL_180;
  }
  int v156 = (v31 >> 1) & 1;
  BOOL v12 = __OFADD__(v155, v156);
  int v157 = v155 + v156;
  if (!((v157 < 0) ^ v12 | (v157 == 0))) {
    return result | 0x1E;
  }
  int v158 = *v30 & 1;
  BOOL v12 = __OFADD__(v157, v158);
  int v159 = v157 + v158;
  if (!((v159 < 0) ^ v12 | (v159 == 0))) {
    return result | 0x1F;
  }
  unsigned int v160 = v30[1];
  int v161 = v159 + (v160 >> 31);
  if (v161 > 0) {
    return result | 0x20;
  }
  int v162 = (v160 >> 30) & 1;
  BOOL v12 = __OFADD__(v161, v162);
  int v163 = v161 + v162;
  if (!((v163 < 0) ^ v12 | (v163 == 0))) {
    goto LABEL_188;
  }
  int v164 = (v160 >> 29) & 1;
  BOOL v12 = __OFADD__(v163, v164);
  int v165 = v163 + v164;
  if (!((v165 < 0) ^ v12 | (v165 == 0))) {
    goto LABEL_190;
  }
  int v166 = (v160 >> 28) & 1;
  BOOL v12 = __OFADD__(v165, v166);
  int v167 = v165 + v166;
  if (!((v167 < 0) ^ v12 | (v167 == 0))) {
    goto LABEL_192;
  }
  int v168 = (v160 >> 27) & 1;
  BOOL v12 = __OFADD__(v167, v168);
  int v169 = v167 + v168;
  if (!((v169 < 0) ^ v12 | (v169 == 0))) {
    goto LABEL_194;
  }
  int v170 = (v160 >> 26) & 1;
  BOOL v12 = __OFADD__(v169, v170);
  int v171 = v169 + v170;
  if (!((v171 < 0) ^ v12 | (v171 == 0))) {
    goto LABEL_196;
  }
  int v172 = (v160 >> 25) & 1;
  BOOL v12 = __OFADD__(v171, v172);
  int v173 = v171 + v172;
  if (!((v173 < 0) ^ v12 | (v173 == 0))) {
    goto LABEL_198;
  }
  int v174 = HIBYTE(v160) & 1;
  BOOL v12 = __OFADD__(v173, v174);
  int v175 = v173 + v174;
  if (!((v175 < 0) ^ v12 | (v175 == 0))) {
    goto LABEL_200;
  }
  int v176 = (v160 >> 23) & 1;
  BOOL v12 = __OFADD__(v175, v176);
  int v177 = v175 + v176;
  if (!((v177 < 0) ^ v12 | (v177 == 0))) {
    goto LABEL_202;
  }
  int v178 = (v160 >> 22) & 1;
  BOOL v12 = __OFADD__(v177, v178);
  int v179 = v177 + v178;
  if (!((v179 < 0) ^ v12 | (v179 == 0))) {
    goto LABEL_204;
  }
  int v180 = (v160 >> 21) & 1;
  BOOL v12 = __OFADD__(v179, v180);
  int v181 = v179 + v180;
  if (!((v181 < 0) ^ v12 | (v181 == 0))) {
    goto LABEL_206;
  }
  int v182 = (v160 >> 20) & 1;
  BOOL v12 = __OFADD__(v181, v182);
  int v183 = v181 + v182;
  if (!((v183 < 0) ^ v12 | (v183 == 0))) {
    goto LABEL_208;
  }
  int v184 = (v160 >> 19) & 1;
  BOOL v12 = __OFADD__(v183, v184);
  int v185 = v183 + v184;
  if (!((v185 < 0) ^ v12 | (v185 == 0))) {
    goto LABEL_210;
  }
  int v186 = (v160 >> 18) & 1;
  BOOL v12 = __OFADD__(v185, v186);
  int v187 = v185 + v186;
  if (!((v187 < 0) ^ v12 | (v187 == 0))) {
    goto LABEL_212;
  }
  int v188 = (v160 >> 17) & 1;
  BOOL v12 = __OFADD__(v187, v188);
  int v189 = v187 + v188;
  if (!((v189 < 0) ^ v12 | (v189 == 0))) {
    goto LABEL_214;
  }
  int v190 = HIWORD(v160) & 1;
  BOOL v12 = __OFADD__(v189, v190);
  int v191 = v189 + v190;
  if (!((v191 < 0) ^ v12 | (v191 == 0))) {
    goto LABEL_216;
  }
  int v192 = (v160 >> 15) & 1;
  BOOL v12 = __OFADD__(v191, v192);
  int v193 = v191 + v192;
  if (!((v193 < 0) ^ v12 | (v193 == 0))) {
    return result | 0x30;
  }
  int v194 = (v160 >> 14) & 1;
  BOOL v12 = __OFADD__(v193, v194);
  int v195 = v193 + v194;
  if (!((v195 < 0) ^ v12 | (v195 == 0))) {
    goto LABEL_220;
  }
  int v196 = (v160 >> 13) & 1;
  BOOL v12 = __OFADD__(v195, v196);
  int v197 = v195 + v196;
  if (!((v197 < 0) ^ v12 | (v197 == 0))) {
    goto LABEL_222;
  }
  int v198 = (v160 >> 12) & 1;
  BOOL v12 = __OFADD__(v197, v198);
  int v199 = v197 + v198;
  if (!((v199 < 0) ^ v12 | (v199 == 0))) {
    goto LABEL_224;
  }
  int v200 = (v160 >> 11) & 1;
  BOOL v12 = __OFADD__(v199, v200);
  int v201 = v199 + v200;
  if (!((v201 < 0) ^ v12 | (v201 == 0))) {
    goto LABEL_226;
  }
  int v202 = (v160 >> 10) & 1;
  BOOL v12 = __OFADD__(v201, v202);
  int v203 = v201 + v202;
  if (!((v203 < 0) ^ v12 | (v203 == 0))) {
    goto LABEL_228;
  }
  int v204 = (v160 >> 9) & 1;
  BOOL v12 = __OFADD__(v203, v204);
  int v205 = v203 + v204;
  if (!((v205 < 0) ^ v12 | (v205 == 0))) {
    goto LABEL_230;
  }
  int v206 = (v160 >> 8) & 1;
  BOOL v12 = __OFADD__(v205, v206);
  int v207 = v205 + v206;
  if (!((v207 < 0) ^ v12 | (v207 == 0))) {
    goto LABEL_232;
  }
  int v208 = (v160 >> 7) & 1;
  BOOL v12 = __OFADD__(v207, v208);
  int v209 = v207 + v208;
  if (!((v209 < 0) ^ v12 | (v209 == 0))) {
    return result | 0x38;
  }
  int v210 = (v160 >> 6) & 1;
  BOOL v12 = __OFADD__(v209, v210);
  int v211 = v209 + v210;
  if (!((v211 < 0) ^ v12 | (v211 == 0))) {
    goto LABEL_236;
  }
  int v212 = (v160 >> 5) & 1;
  BOOL v12 = __OFADD__(v211, v212);
  int v213 = v211 + v212;
  if (!((v213 < 0) ^ v12 | (v213 == 0))) {
    goto LABEL_238;
  }
  int v214 = (v160 >> 4) & 1;
  BOOL v12 = __OFADD__(v213, v214);
  int v215 = v213 + v214;
  if (!((v215 < 0) ^ v12 | (v215 == 0))) {
    goto LABEL_240;
  }
  int v216 = (v160 >> 3) & 1;
  BOOL v12 = __OFADD__(v215, v216);
  int v217 = v215 + v216;
  if (!((v217 < 0) ^ v12 | (v217 == 0))) {
    return result | 0x3C;
  }
  int v218 = (v160 >> 2) & 1;
  BOOL v12 = __OFADD__(v217, v218);
  int v219 = v217 + v218;
  if (!((v219 < 0) ^ v12 | (v219 == 0))) {
    goto LABEL_244;
  }
  if ((int)(v219 + ((v160 >> 1) & 1)) >= 1) {
    int v220 = 62;
  }
  else {
    int v220 = 63;
  }
  return v220 | result;
}

CMedian::CKernel16C *CMedian::CKernel16C::CKernel16C(CMedian::CKernel16C *this, const CMedian::CxParms *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_1EFFD4BB0;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 1587) = a2;
  *(void *)this = &unk_1EFFD4CD0;
  uint64_t v5 = *((void *)a2 + 2);
  *((void *)this + 1588) = &unk_1EFFD4B38;
  *((unsigned char *)this + 12712) = 0;
  *((void *)this + 1590) = v5;
  if (!v5 || !(*(unsigned int (**)(uint64_t))(*(void *)v5 + 80))(v5)) {
    *((unsigned char *)this + 12712) = 1;
  }
  return this;
}

void sub_1A97F14B4(_Unwind_Exception *a1)
{
  CKernel::~CKernel(v1);
  _Unwind_Resume(a1);
}

uint64_t CGrid::Zero(uint64_t a1, int32x2_t *a2)
{
  int32x2_t v3 = vmovn_s64(*(int64x2_t *)(a1 + 104));
  if (a2)
  {
    int32x2_t v3 = vmin_s32(v3, a2[1]);
    int32x2_t v4 = vmax_s32(*a2, 0);
  }
  else
  {
    int32x2_t v4 = 0;
  }
  int32x2_t v5 = vcgt_s32(v3, v4);
  if ((v5.i32[0] & v5.i32[1] & 1) == 0) {
    return 0;
  }
  int32x2_t v19 = v4;
  v20[0] = &unk_1EFFD4A00;
  v20[1] = a1;
  __int16 v27 = 0;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 32))(a1)) {
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = (uint64_t *)(v8 ? v8 + 32 : a1 + 24);
  uint64_t v10 = *v9;
  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v11 = *(void *)(a1 + 128);
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = 0;
  int64x2_t v25 = *(int64x2_t *)(a1 + 104);
  uint64_t v26 = 1;
  int32x2_t v13 = vmin_s32(v3, vmovn_s64(v25));
  int32x2_t v14 = vcge_s32(v19, v13);
  if ((v14.i32[0] | v14.i32[1]))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
    int v15 = 0;
  }
  else
  {
    uint64_t v21 = v10 + v12 * v19.u32[0] + v11 * v19.u32[1];
    int32x2_t v16 = vsub_s32(v13, v19);
    v17.i64[0] = v16.i32[0];
    v17.i64[1] = v16.i32[1];
    int64x2_t v25 = v17;
    int v15 = 1;
  }
  LOBYTE(v27) = v15;
  if (v15)
  {
    if (v25.i64[1])
    {
      uint64_t v6 = 0;
      do
        bzero((void *)(v21 + v22 * v6++), (v23 * v25.i32[0]));
      while (v25.i64[1] != v6);
    }
    uint64_t v7 = 0;
  }
  else
  {
LABEL_19:
    uint64_t v7 = 7;
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)v20);
  return v7;
}

void CGrNavigator::~CGrNavigator(CGrNavigator *this)
{
  *(void *)this = &unk_1EFFD4A00;
  if (*((unsigned char *)this + 72))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
      if (*((unsigned char *)this + 73))
      {
        uint64_t v3 = *((void *)this + 1);
        if (v3) {
          (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
        }
      }
      *((void *)this + 1) = 0;
    }
  }
  *((unsigned char *)this + 72) = 0;
}

{
  void *v1;
  uint64_t vars8;

  CGrNavigator::~CGrNavigator(this);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

uint64_t CGrid::Unlocked(CGrid *this)
{
  return (*(unsigned int (**)(CGrid *))(*(void *)this + 48))(this) ^ 1;
}

uint64_t CGrid::Locked(CGrid *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 48))();
  }
  else {
    return 1;
  }
}

uint64_t CGrid::Unlock(CGrid *this)
{
  uint64_t result = *((void *)this + 1);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 88))();
  }
  return result;
}

uint64_t CGrid::Lock(CGrid *this)
{
  uint64_t result = *((void *)this + 1);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 80))();
  }
  return result;
}

uint64_t CGrid::Description@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 8);
  *(void *)a2 = &unk_1EFFD4AC0;
  if (v2)
  {
    *(_OWORD *)(a2 + 72) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(this + 104);
    uint64_t v5 = *(void *)(this + 112);
    *(_DWORD *)(a2 + 32) = 2;
    uint64_t v6 = *(void *)(this + 120);
    uint64_t v7 = *(void *)(this + 128);
    *(void *)(a2 + 64) = v4;
    *(void *)(a2 + 72) = v5;
    *(void *)(a2 + 40) = v6;
    *(void *)(a2 + 48) = v7;
    *(void *)(a2 + 8) = v3;
    *(void *)(a2 + 16) = v7 * v5;
    *(void *)(a2 + 24) = 0;
  }
  else
  {
    *(void *)(a2 + 8) = *(void *)(this + 24);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(this + 32);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(this + 48);
    uint64_t v8 = a2 + 64;
    uint64_t v9 = this + 56;
    do
    {
      uint64_t v10 = (void *)(v8 + v2);
      *(v10 - 3) = *(void *)(v9 + v2);
      *uint64_t v10 = *(void *)(v9 + v2 + 24);
      v2 += 8;
    }
    while (v2 != 24);
  }
  return this;
}

double CGrid::Description(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void *__return_ptr))(*(void *)a1 + 24))(v4);
  *(void *)(a2 + 8) = v4[1];
  *(_OWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 40) = v7;
  *(_OWORD *)(a2 + 56) = v8;
  double result = *(double *)&v9;
  *(_OWORD *)(a2 + 72) = v9;
  return result;
}

void CGrid::~CGrid(CGrid *this)
{
  CGrid::~CGrid(this);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

{
  uint64_t v2;

  *(void *)this = &unk_1EFFD4AE0;
  if (*((unsigned char *)this + 137))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
      *((void *)this + 1) = 0;
    }
  }
  *((unsigned char *)this + 136) = 0;
}

uint64_t CGridP::Zero(uint64_t a1, int32x2_t *a2)
{
  int32x2_t v3 = vmovn_s64(*(int64x2_t *)(a1 + 104));
  if (a2)
  {
    int32x2_t v3 = vmin_s32(v3, a2[1]);
    int32x2_t v4 = vmax_s32(*a2, 0);
  }
  else
  {
    int32x2_t v4 = 0;
  }
  int32x2_t v21 = v4;
  int32x2_t v5 = vcgt_s32(v3, v4);
  if ((v5.i32[0] & v5.i32[1] & 1) == 0 || !*(void *)(a1 + 144)) {
    return 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    v22[0] = &unk_1EFFD4A00;
    v22[1] = a1;
    __int16 v29 = 0;
    if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 32))(a1)) {
      break;
    }
    if (!(_BYTE)v29) {
      goto LABEL_22;
    }
LABEL_17:
    uint64_t v17 = v27.i64[1];
    if (v27.i64[1])
    {
      uint64_t v18 = 0;
      size_t v19 = (v25 * v27.i32[0]);
      do
        bzero((void *)(v23 + v24 * v18++), v19);
      while (v17 != v18);
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
    if ((unint64_t)++v6 >= *(void *)(a1 + 144)) {
      return 0;
    }
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7) {
    long long v8 = (void *)(v7 + 32);
  }
  else {
    long long v8 = (void *)(a1 + 24);
  }
  uint64_t v9 = *v8 + *(void *)(a1 + 152) * v6;
  uint64_t v11 = *(void *)(a1 + 120);
  uint64_t v10 = *(void *)(a1 + 128);
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  uint64_t v25 = v11;
  uint64_t v26 = 0;
  int64x2_t v27 = *(int64x2_t *)(a1 + 104);
  uint64_t v28 = 1;
  int32x2_t v12 = vmin_s32(v3, vmovn_s64(v27));
  int32x2_t v13 = vcge_s32(v21, v12);
  if ((v13.i32[0] | v13.i32[1]))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
    int v14 = 0;
  }
  else
  {
    uint64_t v23 = v9 + v11 * v21.u32[0] + v10 * v21.u32[1];
    int32x2_t v15 = vsub_s32(v12, v21);
    v16.i64[0] = v15.i32[0];
    v16.i64[1] = v15.i32[1];
    int64x2_t v27 = v16;
    int v14 = 1;
  }
  LOBYTE(v29) = v14;
  if (v14) {
    goto LABEL_17;
  }
LABEL_22:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
  return 7;
}

void CGridP::~CGridP(CGridP *this)
{
  CGrid::~CGrid(this);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

int32x2_t CGrNavigator::CGrNavigator(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  *(_WORD *)(a1 + 72) = 0;
  *(void *)a1 = &unk_1EFFD4A00;
  *(void *)(a1 + 8) = 0;
  int32x2_t result = vmovn_s64(*(int64x2_t *)(a2 + 48));
  int32x2_t v4 = 0;
  if (!a3
    || (int32x2_t v4 = vmax_s32(*a3, 0),
        int32x2_t result = vmin_s32(result, a3[1]),
        int32x2_t v5 = vcge_s32(v4, result),
        ((v5.i32[0] | v5.i32[1]) & 1) == 0))
  {
    uint64_t v6 = *(void *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 16) + v6 * v4.u32[1];
    *(void *)(a1 + 24) = v6;
    long long v8 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 16) = v7 + *(void *)(a2 + 32) * v4.u32[0];
    int32x2_t result = vsub_s32(result, v4);
    *(void *)&long long v9 = result.i32[0];
    *((void *)&v9 + 1) = result.i32[1];
    int32x2_t result = (int32x2_t)result.i32[0];
    *(_OWORD *)(a1 + 32) = v8;
    *(_OWORD *)(a1 + 48) = v9;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(unsigned char *)(a1 + 72) = 1;
  }
  return result;
}

void CGrNavigator::CGrNavigator(CGrNavigator *this, CMemEnv *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)this = &unk_1EFFD4A00;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = a5;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = a3;
  *((void *)this + 7) = a4;
  *((void *)this + 8) = 1;
  *((unsigned char *)this + 72) = 0;
  uint64_t v10 = (char *)CBaseObject::operator new((CBaseObject *)0xA0);
  *((void *)v10 + 3) = 0;
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = &unk_1EFFD4AC0;
  *((void *)v10 + 4) = 0;
  *((void *)v10 + 5) = 0;
  *((_DWORD *)v10 + 12) = 0;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(void *)uint64_t v10 = &unk_1EFFD4B58;
  *((void *)v10 + 13) = a3;
  *((void *)v10 + 14) = a4;
  *((_WORD *)v10 + 68) = 256;
  unint64_t v11 = (a5 * a3 + 31) & 0xFFFFFFFFFFFFFFE0;
  *((void *)v10 + 15) = a5;
  *((void *)v10 + 16) = v11;
  uint64_t v12 = v11 * a4;
  *((void *)v10 + 18) = 1;
  *((void *)v10 + 19) = v12;
  int32x2_t v13 = (CMemBlock *)CBaseObject::operator new((CBaseObject *)0x40);
  CMemBlock::CMemBlock(v13, a2, v12, 1, 32);
  *((void *)v10 + 1) = v13;
  if (v13)
  {
    if ((*(uint64_t (**)(CMemBlock *))(*(void *)v13 + 32))(v13))
    {
      v10[136] = 1;
      uint64_t v14 = *(void *)v10;
      goto LABEL_8;
    }
    uint64_t v15 = *((void *)v10 + 1);
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    }
    *((void *)v10 + 1) = 0;
  }
  uint64_t v14 = *(void *)v10;
  if (!v10[136])
  {
LABEL_13:
    (*(void (**)(char *))(*(void *)v10 + 8))(v10);
    return;
  }
LABEL_8:
  if ((*(unsigned int (**)(char *))(v14 + 32))(v10)) {
    goto LABEL_13;
  }
  uint64_t v16 = *((void *)v10 + 1);
  if (v16) {
    uint64_t v17 = (uint64_t *)(v16 + 32);
  }
  else {
    uint64_t v17 = (uint64_t *)(v10 + 24);
  }
  uint64_t v18 = *v17;
  *((void *)this + 3) = *((void *)v10 + 16);
  *((void *)this + 5) = *((void *)v10 + 19);
  *((void *)this + 1) = v10;
  *((void *)this + 2) = v18;
  *((_WORD *)this + 36) = 257;
}

void sub_1A97F1FBC(_Unwind_Exception *a1)
{
  CBaseRef::operator delete(v2);
  CGrid::~CGrid(v1);
  --CMemEnv::excount;
  free(v4);
  _Unwind_Resume(a1);
}

unint64_t CMedian::CKernel8x16::IdealTSize(CMedian::CKernel8x16 *this)
{
  uint64_t v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 8);
  }
  else {
    return 0x100000000C0;
  }
}

void CMedian::CKernel8x16::~CKernel8x16(CMedian::CKernel8x16 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernel8x16::Process_(CMedian::CKernel8x16 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  unint64_t v5 = *((void *)a3 + 6);
  if (v5 >= 0x10)
  {
    uint64_t v21 = *((void *)this + 1587);
    int v9 = *(_DWORD *)(v21 + 24);
    uint64_t v10 = (uint16x8_t *)malloc_type_calloc(0x22E0uLL, 1uLL, 0x69BF368BuLL);
    if (v5)
    {
      unsigned int v11 = 0;
      int v20 = 2 * v9;
      do
      {
        unsigned int v12 = v5 - 16;
        if (v11 + 16 <= v5) {
          unsigned int v12 = v11;
        }
        unsigned int v11 = v12 + 16;
        uint64_t v13 = *((void *)a2 + 7);
        int32x2_t v29 = (int32x2_t)v12;
        int v30 = v12 + 16 + v20;
        int v31 = v13;
        uint64_t v14 = *((void *)a3 + 7);
        int32x2_t v26 = (int32x2_t)v12;
        unsigned int v27 = v12 + 16;
        int v28 = v14;
        CGrNavigator::CGrNavigator((uint64_t)v24, (uint64_t)a2, &v29);
        v24[0] = &unk_1EFFD4A60;
        CGrNavigator::CGrNavigator((uint64_t)v23, (uint64_t)a3, &v26);
        v23[0] = &unk_1EFFD4AA0;
        uint64_t v15 = (v25 - 15);
        bzero(v10, 0x22E0uLL);
        if (v15)
        {
          uint64_t v17 = v24[2];
          uint64_t v16 = v24[3];
          uint64_t v18 = v15;
          do
          {
            Hist8x16Inc((uint64_t)v10, v17, v15);
            v17 += v16;
            --v18;
          }
          while (v18);
        }
        if (a5)
        {
          CGrNavigator::CGrNavigator((uint64_t)v22, (uint64_t)a5, &v26);
          v22[0] = &unk_1EFFD4A60;
          Median8x16Strip_(v21, (uint64_t)v24, v23, v10);
          CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
        }
        else
        {
          Median8x16Strip_(v21, (uint64_t)v24, v23, v10);
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v23);
        CGrNavigator::~CGrNavigator((CGrNavigator *)v24);
      }
      while (v11 < v5);
    }
    free(v10);
  }
  return 0;
}

uint64_t Hist8x16Inc(uint64_t result, uint64_t a2, int a3)
{
  unint64_t v3 = 0;
  uint64_t v4 = (a3 + 8);
  uint64_t v5 = result + 640;
  uint64_t v6 = result + 4738;
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(unsigned __int8 *)(a2 + (v4 + v3));
    uint64_t v10 = *(unsigned __int8 *)(a2 + v3 + 8);
    uint64_t v11 = v5 + 16 * *(unsigned __int8 *)(a2 + (v3 + a3));
    uint64_t v12 = v5 + 16 * *(unsigned __int8 *)(a2 + v3);
    do
    {
      ++*(_WORD *)(v12 + 2 * v8);
      --*(_WORD *)(v11 + 2 * v8++);
    }
    while (v7 != v8);
    if (v3 <= 6)
    {
      uint64_t v13 = v6 + 16 * v9;
      unint64_t v14 = v3;
      uint64_t v15 = v6 + 16 * v10;
      do
      {
        --*(_WORD *)(v15 + 2 * v14);
        ++*(_WORD *)(v13 + 2 * v14++);
      }
      while (v14 != 7);
    }
    ++v3;
    ++v7;
  }
  while (v3 != 8);
  if (v4 >= 9)
  {
    uint64_t v16 = v4 - 8;
    uint64_t v17 = (unsigned __int8 *)(a2 + 8);
    do
    {
      unsigned int v18 = *v17++;
      ++*(_WORD *)(result + 128 + 2 * v18);
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t Median8x16Strip_(uint64_t result, uint64_t a2, void *a3, uint16x8_t *a4)
{
  uint64_t v18 = result;
  uint64_t v4 = a3[7];
  if (v4)
  {
    uint64_t v8 = 0;
    int v9 = *(_DWORD *)(result + 24);
    int v10 = (2 * v9) | 1;
    int v11 = *(unsigned __int8 *)(result + 49);
    uint64_t v12 = (v4 - 1);
    int v13 = 2 * v9 + 1;
    if (*(unsigned char *)(result + 49)) {
      goto LABEL_4;
    }
LABEL_3:
    int32x2_t result = (uint64_t)Hist8x16Read16(a4, a3[2] + a3[3] * v8, *(_DWORD *)(v18 + 36));
LABEL_4:
    while (v12 != v8)
    {
      uint64_t v14 = *(void *)(a2 + 16);
      uint64_t v15 = *(void *)(a2 + 24);
      uint64_t v16 = (uint8x8_t *)(v14 + v15 * v8);
      uint64_t v17 = (uint8x8_t *)(v14 + v15 * (v13 + v8));
      int32x2_t result = Hist8x16Step((uint64_t)a4, (uint64_t)v17, (uint64_t)v16, v10);
      if (!v11) {
        int32x2_t result = (uint64_t)Hist8x16Delta2((int16x8_t *)a4, v17, v16, v10);
      }
      ++v8;
      if (!v11) {
        goto LABEL_3;
      }
    }
  }
  return result;
}

unsigned __int8 *Hist8x16Read16(uint16x8_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = a1 + 552;
  uint16x8_t v20 = (uint16x8_t)vdupq_n_s16(a3);
  uint64_t v7 = a1 + 40;
  uint64_t i64 = (uint64_t)a1[8].i64;
  Hist8x16Adjust8x_((unsigned __int8 *)&a1[552], a1 + 554, (uint64_t)a1[40].i64, (uint64_t)a1[8].i64, v20);
  int32x2_t result = Hist8x16Adjust8x_(&a1[552].u8[1], a1 + 555, (uint64_t)a1[296].i64, i64, v20);
  uint64_t v10 = 0;
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v12 = v6->u8[0];
    unsigned int v13 = a1[554].u16[i];
    if (v13 <= a3)
    {
      uint64_t v15 = v10 * 2 + 16 * v12;
      while (1)
      {
        v13 += (unsigned __int16)(a1[8].i16[v12] + *(__int16 *)((char *)a1[40].i16 + v15));
        if (v13 > a3) {
          break;
        }
        ++v12;
        v15 += 16;
        if (v12 == 256)
        {
          LOBYTE(v12) = 0;
          break;
        }
      }
    }
    else if (v6->i8[0])
    {
      int v14 = 8 * v12 - 8;
      do
      {
        LODWORD(v12) = v12 - 1;
        if (!v14) {
          break;
        }
        v13 -= (unsigned __int16)(*(_WORD *)(i64 + 2 * v12) + v7->i16[i + (v14 & 0xFFFFFFF8)]);
        v14 -= 8;
      }
      while (v13 > a3);
    }
    *(unsigned char *)(a2 + i) = v12;
    uint64_t v16 = a1[552].u8[1];
    unsigned int v17 = a1[555].u16[i];
    if (v17 <= a3)
    {
      uint64_t v19 = 16 * v16 + 4736;
      while (1)
      {
        v17 += (unsigned __int16)(a1[8].i16[v16] + *(__int16 *)((char *)&a1->i16[v10] + v19));
        if (v17 > a3) {
          break;
        }
        ++v16;
        v19 += 16;
        if (v16 == 256)
        {
          LOBYTE(v16) = 0;
          break;
        }
      }
    }
    else if (a1[552].i8[1])
    {
      int v18 = 8 * v16 - 8;
      do
      {
        LODWORD(v16) = v16 - 1;
        if (!v18) {
          break;
        }
        v17 -= (unsigned __int16)(*(_WORD *)(i64 + 2 * v16) + a1[296].i16[i + (v18 & 0xFFFFFFF8)]);
        v18 -= 8;
      }
      while (v17 > a3);
    }
    *(unsigned char *)(a2 + i + 8) = v16;
    ++v10;
  }
  return result;
}

uint64_t Hist8x16Step(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  Hist8x16Inc(a1, a2, a4);
  return Hist8x16Dec(a1, a3, a4);
}

int16x8_t *Hist8x16Delta2(int16x8_t *result, uint8x8_t *a2, uint8x8_t *a3, unsigned int a4)
{
  unsigned int v4 = result[552].u8[0];
  unsigned int v5 = result[552].u8[1];
  if (a4 > 0x10)
  {
    uint64_t v14 = 0;
    unint64_t v15 = a4 & 0xFFFFFFF8;
    unsigned int v16 = a4;
    do
    {
      unint64_t v17 = v16 - (unint64_t)(a4 & 0xFFFFFFF8);
      int v18 = &result[554].i16[v14];
      unsigned int v19 = (unsigned __int16)*v18;
      for (uint64_t i = v14; i != 8; ++i)
      {
        if (a2->u8[i] < v4) {
          ++v19;
        }
        unsigned int v19 = (__PAIR64__(v19, a3->u8[i]) - v4) >> 32;
      }
      *int v18 = v19;
      unsigned int v19 = (unsigned __int16)v19;
      uint64_t v21 = (uint8x8_t *)((char *)a2 + (a4 & 0xFFFFFFF8));
      uint64_t v22 = (uint8x8_t *)((char *)a3 + (a4 & 0xFFFFFFF8));
      if (v15 < v14 + a4)
      {
        do
        {
          unsigned int v23 = v21->u8[0];
          uint64_t v21 = (uint8x8_t *)((char *)v21 + 1);
          if (v23 < v4) {
            ++v19;
          }
          unsigned int v24 = v22->u8[0];
          uint64_t v22 = (uint8x8_t *)((char *)v22 + 1);
          unsigned int v19 = (__PAIR64__(v19, v24) - v4) >> 32;
          --v17;
        }
        while (v17);
      }
      *int v18 = v19;
      ++v14;
      ++v16;
    }
    while (v14 != 8);
    uint8x8_t v25 = (uint8x8_t)vdup_n_s8(v4);
    int8x8_t v26 = vsub_s8((int8x8_t)vcgt_u8(v25, a3[1]), (int8x8_t)vcgt_u8(v25, a2[1]));
    int8x8_t v27 = vpadd_s8(v26, v26);
    int8x8_t v28 = vpadd_s8(v27, v27);
    int16x8_t v29 = vaddw_s8(result[554], vpadd_s8(v28, v28));
    result[554] = v29;
    uint8x8_t v30 = (uint8x8_t)vdup_n_s8(v5);
    if (v15 < 0x11)
    {
      int8x8_t v33 = 0;
      int8x8_t v31 = 0;
    }
    else
    {
      int8x8_t v31 = 0;
      unint64_t v32 = 16;
      int8x8_t v33 = 0;
      do
      {
        uint8x8_t v34 = a2[v32 / 8];
        uint8x8_t v35 = a3[v32 / 8];
        int8x8_t v31 = vadd_s8(vsub_s8(v31, (int8x8_t)vcgt_u8(v25, v34)), (int8x8_t)vcgt_u8(v25, v35));
        int8x8_t v33 = vadd_s8(vsub_s8(v33, (int8x8_t)vcgt_u8(v30, v34)), (int8x8_t)vcgt_u8(v30, v35));
        if ((v32 & 0x38) == 0)
        {
          int8x8_t v36 = vpadd_s8(v31, v31);
          int8x8_t v37 = vpadd_s8(v36, v36);
          int8x8_t v38 = vpadd_s8(v33, v33);
          int8x8_t v39 = vpadd_s8(v38, v38);
          int16x8_t v40 = result[555];
          int16x8_t v29 = vaddw_s8(v29, vpadd_s8(v37, v37));
          result[554] = v29;
          result[555] = vaddw_s8(v40, vpadd_s8(v39, v39));
          int8x8_t v33 = 0;
          int8x8_t v31 = 0;
        }
        v32 += 8;
      }
      while (v32 < v15);
    }
    uint64_t v41 = 0;
    int8x8_t v42 = vpadd_s8(v31, v31);
    int8x8_t v43 = vpadd_s8(v42, v42);
    int8x8_t v44 = vpadd_s8(v33, v33);
    int8x8_t v45 = vpadd_s8(v44, v44);
    int16x8_t v46 = result[555];
    result[554] = vaddw_s8(v29, vpadd_s8(v43, v43));
    int16x8_t v47 = vaddw_s8(v46, vpadd_s8(v45, v45));
    result[555] = v47;
    int8x8_t v48 = vsub_s8((int8x8_t)vcgt_u8(v30, *(uint8x8_t *)((char *)a3 + v15)), (int8x8_t)vcgt_u8(v30, *(uint8x8_t *)((char *)a2 + v15)));
    int8x8_t v49 = vpadd_s8(v48, v48);
    int8x8_t v50 = vpadd_s8(v49, v49);
    uint64_t v51 = (v15 + 8);
    unsigned int v52 = a4 + 8;
    int v53 = a3 + 1;
    result[555] = vaddw_s8(v47, vpadd_s8(v50, v50));
    int v54 = (uint8x8_t *)((char *)a3 + v51);
    for (uint64_t j = 8; j != 16; ++j)
    {
      uint64_t v56 = v52 - v51;
      int v57 = &result[554].i16[j];
      unsigned int v58 = (unsigned __int16)*v57;
      uint64_t v59 = v41;
      do
      {
        if (a2[1].u8[v59] < v5) {
          ++v58;
        }
        unsigned int v58 = (__PAIR64__(v58, v53->u8[v59++]) - v5) >> 32;
      }
      while (v59 != 8);
      *int v57 = v58;
      unsigned int v58 = (unsigned __int16)v58;
      int v60 = (uint8x8_t *)((char *)a2 + v51);
      int v61 = (unsigned __int8 *)v54;
      if (v51 < j + a4)
      {
        do
        {
          unsigned int v62 = v60->u8[0];
          int v60 = (uint8x8_t *)((char *)v60 + 1);
          if (v62 < v5) {
            ++v58;
          }
          unsigned int v63 = *v61++;
          unsigned int v58 = (__PAIR64__(v58, v63) - v5) >> 32;
          --v56;
        }
        while (v56);
      }
      *int v57 = v58;
      ++v52;
      ++v41;
    }
  }
  else
  {
    for (unint64_t k = 0; k != 8; ++k)
    {
      uint64_t v7 = &result[554].i16[k];
      unsigned int v8 = (unsigned __int16)*v7;
      unint64_t v9 = k;
      do
      {
        if (a2->u8[v9] < v4) {
          ++v8;
        }
        unsigned int v8 = (__PAIR64__(v8, a3->u8[v9++]) - v4) >> 32;
      }
      while (v9 < k + a4);
      *uint64_t v7 = v8;
    }
    for (uint64_t m = 8; m != 16; ++m)
    {
      int v11 = &result[554].i16[m];
      unsigned int v12 = (unsigned __int16)*v11;
      unint64_t v13 = m;
      do
      {
        if (a2->u8[v13] < v5) {
          ++v12;
        }
        unsigned int v12 = (__PAIR64__(v12, a3->u8[v13++]) - v5) >> 32;
      }
      while (v13 < m + (unint64_t)a4);
      *int v11 = v12;
    }
  }
  return result;
}

uint64_t Hist8x16Dec(uint64_t result, uint64_t a2, int a3)
{
  unint64_t v3 = 0;
  int v4 = a3 + 7;
  uint64_t v5 = (a3 + 8);
  uint64_t v6 = result + 640;
  uint64_t v7 = result + 4738;
  uint64_t v8 = 8;
  do
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(unsigned __int8 *)(v3 + a2 + 8);
    uint64_t v11 = *(unsigned __int8 *)(a2 + (v5 + v3));
    uint64_t v12 = v6 + 16 * *(unsigned __int8 *)(a2 + (v4 - v3));
    uint64_t v13 = v6 + 16 * *(unsigned __int8 *)(a2 - v3 + 7);
    do
    {
      --*(_WORD *)(v13 + 2 * v9);
      ++*(_WORD *)(v12 + 2 * v9++);
    }
    while (v8 != v9);
    if (v3 <= 6)
    {
      uint64_t v14 = v7 + 16 * v11;
      unint64_t v15 = v3;
      uint64_t v16 = v7 + 16 * v10;
      do
      {
        ++*(_WORD *)(v16 + 2 * v15);
        --*(_WORD *)(v14 + 2 * v15++);
      }
      while (v15 != 7);
    }
    ++v3;
    --v8;
  }
  while (v3 != 8);
  if (v5 >= 9)
  {
    uint64_t v17 = v5 - 8;
    int v18 = (unsigned __int8 *)(a2 + 8);
    do
    {
      unsigned int v19 = *v18++;
      --*(_WORD *)(result + 128 + 2 * v19);
      --v17;
    }
    while (v17);
  }
  return result;
}

unsigned __int8 *Hist8x16Adjust8x_(unsigned __int8 *result, uint16x8_t *a2, uint64_t a3, uint64_t a4, uint16x8_t a5)
{
  uint16x8_t v5 = a5;
  uint64_t v8 = result;
  uint64_t v9 = *result;
  uint64_t v10 = (int16x4_t *)(a4 + 2 * v9);
  int16x8_t v11 = *(int16x8_t *)a2;
  if (vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16(*a2, a5))))
  {
    uint64_t v12 = (int16x8_t *)&v10[-2];
    uint64_t v13 = (int16x8_t *)(a3 + 16 * v9 - 64);
    while (1)
    {
      char v14 = v9
          ? 1
          : Hist8x16Adjust8x_(unsigned char *,unsigned short *,unsigned short *,unsigned short *,__simd128_uint16_t)::first;
      if ((v14 & 1) == 0) {
        break;
      }
      LODWORD(v9) = v9 - 8;
      int16x8_t v15 = *v12--;
      int16x8_t v16 = vnegq_s16(v15);
      int16x8_t v11 = vsubq_s16(vaddq_s16(vaddq_s16(vsubq_s16(vaddq_s16(vdupq_laneq_s16(v16, 7), v11), v13[3]), vaddq_s16(vaddq_s16(vdupq_laneq_s16(v16, 6), vdupq_laneq_s16(v16, 5)), vdupq_laneq_s16(v16, 4))), vaddq_s16(vaddq_s16(vaddq_s16(vdupq_lane_s16(*(int16x4_t *)v16.i8, 3), vdupq_lane_s16(*(int16x4_t *)v16.i8, 2)), vdupq_lane_s16(*(int16x4_t *)v16.i8, 1)), vdupq_lane_s16(*(int16x4_t *)v16.i8, 0))), vaddq_s16(vaddq_s16(vaddq_s16(v13[2], v13[1]), vaddq_s16(*v13, v13[-1])), vaddq_s16(vaddq_s16(v13[-2], v13[-3]), v13[-4])));
      v13 -= 8;
      if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)v11, v5))) & 1) == 0) {
        goto LABEL_14;
      }
    }
    Hist8x16Adjust8x_(unsigned char *,unsigned short *,unsigned short *,unsigned short *,__simd128_uint16_t)::first = 1;
    int16x8_t v21 = v11;
    int32x2_t result = (unsigned __int8 *)puts("Hist8x16Adjust8x -- attempting to adjust below zero!!");
    int16x8_t v11 = v21;
    LOBYTE(v9) = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v17 = (int16x8_t *)(a3 + 16 * v9);
      uint16x8_t v18 = (uint16x8_t)vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(vdupq_lane_s16(*v10, 0), vaddq_s16(v11, *v17)), vaddq_s16(vdupq_lane_s16(*v10, 1), vdupq_lane_s16(*v10, 2))), vaddq_s16(vaddq_s16(vdupq_lane_s16(*v10, 3), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 4)), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 5))), vaddq_s16(vaddq_s16(vaddq_s16(vdupq_laneq_s16(*(int16x8_t *)v10->i8, 6), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 7)), v17[1]), v17[2])), vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(v17[3], v17[4]), v17[5]), v17[6]), v17[7]));
      if (vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16(v18, v5)))) {
        break;
      }
      if ((v9 + 8) >= 0x100)
      {
        uint16x8_t v20 = v18;
        int32x2_t result = (unsigned __int8 *)puts("Hist8x16Adjust8x -- ind >= 256!!");
        uint16x8_t v5 = a5;
        uint16x8_t v18 = v20;
      }
      v10 += 2;
      v9 += 8;
      int16x8_t v11 = (int16x8_t)v18;
    }
  }
LABEL_14:
  *uint64_t v8 = v9;
  *a2 = (uint16x8_t)v11;
  return result;
}

void CGrNavigatorTC<unsigned char>::~CGrNavigatorTC(CGrNavigator *a1)
{
  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

CMedian::CKernel8x16 *CMedian::CKernel8x16::CKernel8x16(CMedian::CKernel8x16 *this, const CMedian::CxParms *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_1EFFD4BB0;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 1587) = a2;
  *(void *)this = &unk_1EFFD4D40;
  *((_DWORD *)this + 6) = 16;
  return this;
}

void CGrNavigatorT<float,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

uint64_t CInwardBlur::ProcessBuffer_(uint64_t a1, void *a2, void *a3)
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2[6];
  uint64_t v6 = a2[7];
  uint64_t v8 = a3[7];
  LODWORD(v9) = v6;
  int v10 = v6;
  if (v8)
  {
    uint64_t v11 = 0;
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (v12 - 1);
    do
    {
      if (v14 >= 2)
      {
        for (uint64_t i = 1; i != v14; ++i)
        {
          int16x8_t v16 = (unsigned char *)(i + a3[2] + v11 * a3[3]);
          if (!*v16 && ((v16[1] | *(v16 - 1)) & 4) != 0) {
            *int16x8_t v16 = 3;
          }
        }
      }
      uint64_t v17 = (unsigned char *)(a3[2] + a3[3] * v11);
      if (!*v17 && (v17[1] & 4) != 0) {
        *uint64_t v17 = 3;
      }
      if (!v17[v14] && (v17[(v12 - 2)] & 4) != 0) {
        v17[v14] = 3;
      }
      ++v11;
    }
    while (v11 != v13);
    unint64_t v18 = 0;
    unint64_t v19 = (v8 - 1);
    do
    {
      if ((int)v18 - 1 >= 0) {
        int v20 = v19;
      }
      else {
        int v20 = 0;
      }
      if ((int)v18 - 1 <= v19) {
        int v20 = v18 - 1;
      }
      unint64_t v21 = v18 + 1;
      if ((int)v18 + 1 >= 0) {
        int v22 = v19;
      }
      else {
        int v22 = 0;
      }
      if (v18 < v19) {
        int v22 = v18 + 1;
      }
      if (v12)
      {
        uint64_t v23 = a3[2];
        uint64_t v24 = a3[3];
        uint8x8_t v25 = (unsigned char *)(v23 + v24 * v20);
        int8x8_t v26 = (unsigned char *)(v23 + v24 * v18);
        int8x8_t v27 = (unsigned char *)(v23 + v24 * v22);
        uint64_t v28 = v12;
        do
        {
          if (!*v26 && ((*v27 | *v25) & 2) != 0) {
            *int8x8_t v26 = 1;
          }
          ++v27;
          ++v25;
          ++v26;
          --v28;
        }
        while (v28);
      }
      unint64_t v18 = v21;
    }
    while (v21 != v13);
    uint64_t v9 = a2[7];
    int v10 = v9;
  }
  if (v9)
  {
    uint64_t v29 = 0;
    uint64_t v30 = a2[6];
    uint64_t v31 = a3[2];
    uint64_t v32 = a3[3];
    unsigned int v33 = v9 - 1;
    do
    {
      if (v30)
      {
        uint64_t v34 = 0;
        uint64_t v35 = a2[2] + a2[3] * v29;
        do
        {
          if ((*(unsigned char *)(v31 + v29 * v32 + v34) & 5) == 1)
          {
            int v36 = 0;
            float32x4_t v37 = 0uLL;
            for (int j = -1; j != 2; ++j)
            {
              unsigned int v39 = j + v34;
              if (j + (int)v34 >= 0) {
                LODWORD(v40) = v30 - 1;
              }
              else {
                LODWORD(v40) = 0;
              }
              if (v39 <= (int)v30 - 1) {
                uint64_t v40 = v39;
              }
              else {
                uint64_t v40 = v40;
              }
              uint64_t v41 = v40 + v31;
              uint64_t v42 = a2[2] + 16 * v40;
              for (int k = -1; k != 2; ++k)
              {
                LODWORD(v44) = v29 + k;
                if ((int)v29 + k >= 0) {
                  unsigned int v45 = v33;
                }
                else {
                  unsigned int v45 = 0;
                }
                if (v44 <= v33) {
                  uint64_t v44 = v44;
                }
                else {
                  uint64_t v44 = v45;
                }
                if ((*(unsigned char *)(v41 + v32 * v44) & 4) != 0)
                {
                  float32x4_t v37 = vaddq_f32(*(float32x4_t *)(v42 + a2[3] * v44), v37);
                  ++v36;
                }
              }
            }
            *(float32x4_t *)(v35 + 16 * v34) = vmulq_n_f32(v37, flt_1A9812B04[v36 - 1]);
          }
          ++v34;
        }
        while (v34 != v30);
      }
      ++v29;
    }
    while (v29 != v10);
  }
  unsigned int v46 = *(_DWORD *)(a1 + 24);
  _ZF = v46 == 0;
  unsigned int v48 = v46 >> CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
  char v50 = !_ZF && v48 < 2;
  if v7 < 5 || v6 < 5 || (v50)
  {
LABEL_118:
    CMemBlock::CMemBlock((CMemBlock *)&v171, *(CMemEnv **)a1, (48 * v7 + 96) & 0xFFFFFFFF0, 0, 16);
    int v171 = &unk_1EFFD4910;
    if (!v172)
    {
      uint64_t v93 = 7;
LABEL_153:
      CMemBlock::~CMemBlock((CMemBlock *)&v171);
      return v93;
    }
    int v163 = &unk_1EFFD4B38;
    char v164 = 0;
    int v165 = &v171;
    if (CMemBlock::Lock((CMemBlock *)&v171))
    {
      if (!v164)
      {
        uint64_t v93 = 7;
LABEL_152:
        CLock::~CLock((CLock *)&v163);
        goto LABEL_153;
      }
    }
    else
    {
      char v164 = 1;
    }
    int v113 = 0;
    unsigned int v114 = 1 << CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
    if ((1 << CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting) >= 0x10) {
      unsigned int v114 = 16;
    }
    if (v114 <= 1) {
      unsigned int v114 = 1;
    }
    float32x4_t v115 = (float32x4_t)vdupq_n_s32(0x3DE38E39u);
    do
    {
      uint64_t v117 = a2[6];
      uint64_t v116 = a2[7];
      int v118 = (_OWORD *)(v175 + 16);
      int v119 = (_OWORD *)(v175 + 16 + 16 * v117);
      int v120 = v119 + 2;
      int v121 = &v119[v117 + 2];
      int v122 = v121 + 2;
      int v123 = (long long *)a2[2];
      int v124 = v123;
      int v125 = v119 + 2;
      uint64_t v126 = v117;
      uint64_t v127 = v117;
      if (v117)
      {
        do
        {
          long long v128 = *v124++;
          *v125++ = v128;
          --v127;
        }
        while (v127);
        v119[1] = v119[2];
        uint64_t v129 = (v117 - 1);
        *int v121 = v120[v129];
        int v130 = v121 + 2;
        uint64_t v131 = v126;
        do
        {
          long long v132 = *v123++;
          *v130++ = v132;
          --v131;
        }
        while (v131);
        uint64_t v133 = v126;
      }
      else
      {
        uint64_t v133 = 0;
        long long v134 = v119[0x100000001];
        v119[1] = v119[2];
        v119[2] = v134;
        uint64_t v129 = 0xFFFFFFFFLL;
      }
      v121[1] = v121[2];
      v122[v133] = v122[v129];
      uint64_t v135 = v116;
      if (v116)
      {
        unint64_t v136 = 0;
        unint64_t v137 = (v116 - 1);
        int v138 = v122;
        do
        {
          if (v136 < v137)
          {
            if (v126)
            {
              int v139 = (long long *)(a2[3] + a2[3] * v136 + a2[2]);
              int v140 = v118;
              uint64_t v141 = v126;
              do
              {
                long long v142 = *v139++;
                *v140++ = v142;
                --v141;
              }
              while (v141);
              uint64_t v143 = v126;
            }
            else
            {
              uint64_t v143 = 0;
            }
            *(v118 - 1) = *v118;
            v118[v143] = v118[v129];
            int v138 = v118;
          }
          if (v126)
          {
            uint64_t v144 = 0;
            int v145 = (unsigned __int8 *)(a3[2] + a3[3] * v136);
            do
            {
              unsigned int v146 = *v145++;
              if (v146 <= 3) {
                *(float32x4_t *)(v144 * 16 + a2[2] + v136 * a2[3]) = vmulq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32((float32x4_t)v120[v144], (float32x4_t)v120[v144 - 1]), vaddq_f32((float32x4_t)v120[v144 + 1], (float32x4_t)v122[v144 - 1])), vaddq_f32(vaddq_f32((float32x4_t)v122[v144], (float32x4_t)v122[v144 + 1]), (float32x4_t)v138[v144 - 1])), vaddq_f32((float32x4_t)v138[v144], (float32x4_t)v138[v144 + 1])), v115);
              }
              ++v144;
            }
            while (v126 != v144);
          }
          ++v136;
          int v118 = v120;
          int v120 = v122;
          int v122 = v138;
        }
        while (v136 != v135);
      }
      ++v113;
    }
    while (v113 != v114);
    uint64_t v93 = 0;
    goto LABEL_152;
  }
  uint64_t v51 = (v6 + 1) >> 1;
  CGrNavigator::CGrNavigator((CGrNavigator *)&v171, *(CMemEnv **)a1, (v7 + 1) >> 1, v51, 16);
  int v171 = &unk_1EFFD4A20;
  if (v178)
  {
    CGrNavigator::CGrNavigator((CGrNavigator *)&v163, *(CMemEnv **)a1, (v7 + 1) >> 1, v51, 1);
    int v163 = &unk_1EFFD4A60;
    if (v170)
    {
      uint64_t v157 = v173;
      uint64_t v158 = v174;
      int64x2_t v52 = vshrq_n_s64(vshlq_n_s64(v176, 0x20uLL), 0x20uLL);
      long long v159 = v175;
      int64x2_t v160 = v52;
      uint64_t v161 = v177;
      __int16 v162 = 1;
      int v155 = &unk_1EFFD4A20;
      uint64_t v156 = 0;
      __int16 v154 = 1;
      int v149 = v165;
      uint64_t v150 = v166;
      long long v151 = v167;
      int64x2_t v152 = vshrq_n_s64(vshlq_n_s64(v168, 0x20uLL), 0x20uLL);
      uint64_t v153 = v169;
      v148[0] = &unk_1EFFD4A60;
      v148[1] = 0;
      unsigned int v53 = *((_DWORD *)a2 + 12);
      unsigned int v54 = *((_DWORD *)a2 + 14);
      __asm { FMOV            V0.4S, #1.0 }
      *(void *)&long long v58 = 0x3F0000003F000000;
      *((void *)&v58 + 1) = 0x3F0000003F000000;
      v179[0] = _Q0;
      v179[1] = v58;
      __asm { FMOV            V0.4S, #0.25 }
      v179[2] = vdupq_n_s32(0x3EAAAAABu);
      v179[3] = _Q0;
      uint64_t v60 = v52.u32[2];
      if (v52.i32[2])
      {
        uint64_t v61 = 0;
        uint64_t v62 = v52.u32[0];
        do
        {
          if (v62)
          {
            unsigned int v63 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            uint64_t v66 = (2 * v61);
            LODWORD(v67) = (2 * v61) | 1;
            if (v67 >= v54) {
              uint64_t v67 = v66;
            }
            else {
              uint64_t v67 = v67;
            }
            do
            {
              if (v63 + 1 >= v53) {
                uint64_t v68 = v63;
              }
              else {
                uint64_t v68 = v63 + 1;
              }
              uint64_t v69 = a3[2];
              uint64_t v70 = a3[3];
              uint64_t v71 = v69 + v63;
              int v72 = *(unsigned __int8 *)(v71 + v70 * v66);
              uint64_t v73 = v68 + v69;
              int v74 = *(unsigned __int8 *)(v73 + v70 * v66);
              uint64_t v75 = v70 * v67;
              int v76 = *(unsigned __int8 *)(v71 + v75);
              int v77 = *(unsigned __int8 *)(v73 + v75);
              int v78 = v149;
              uint64_t v79 = v150;
              if ((v74 | v72 | v76 | v77))
              {
                uint64_t v83 = a2[2];
                uint64_t v84 = a2[3];
                uint64_t v85 = v84 * v66;
                uint64_t v86 = v83 + 16 * v63;
                float32x4_t v87 = 0uLL;
                if (v72) {
                  float32x4_t v87 = *(float32x4_t *)(v86 + v85);
                }
                uint64_t v88 = v83 + 16 * v68;
                int v89 = v74 & 1;
                if (v74) {
                  float32x4_t v87 = vaddq_f32(*(float32x4_t *)(v88 + v85), v87);
                }
                uint64_t v90 = v84 * v67;
                int v91 = v76 & 1;
                if (v91) {
                  float32x4_t v87 = vaddq_f32(*(float32x4_t *)(v86 + v90), v87);
                }
                int v92 = v77 & 1;
                if (v92) {
                  float32x4_t v87 = vaddq_f32(*(float32x4_t *)(v88 + v90), v87);
                }
                *(float32x4_t *)(v64 + v157 + v61 * v158) = vmulq_f32((float32x4_t)v179[(v72 & 1u) - 1 + v89 + v91 + v92], v87);
                char v80 = 7;
              }
              else
              {
                char v80 = 0;
                uint64_t v81 = a2[2];
                uint64_t v82 = a2[3];
                *(float32x4_t *)(v64 + v157 + v61 * v158) = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)(v81 + 16 * v68 + v82 * v66), *(float32x4_t *)(v81 + 16 * v63 + v82 * v66)), vaddq_f32(*(float32x4_t *)(v81 + 16 * v63 + v82 * v67), *(float32x4_t *)(v81 + 16 * v68 + v82 * v67))), _Q0);
              }
              *((unsigned char *)v78 + v61 * v79 + v65++) = v80;
              v64 += 16;
              v63 += 2;
            }
            while (v62 != v65);
          }
          ++v61;
        }
        while (v61 != v60);
      }
      CGrNavigator::~CGrNavigator((CGrNavigator *)v148);
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v155);
      ++CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
      uint64_t v93 = CInwardBlur::ProcessBuffer_(a1, &v171, &v163);
      --CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
      if (v93)
      {
        char v94 = 0;
      }
      else
      {
        uint64_t v157 = v173;
        uint64_t v158 = v174;
        int64x2_t v95 = vshrq_n_s64(vshlq_n_s64(v176, 0x20uLL), 0x20uLL);
        long long v159 = v175;
        int64x2_t v160 = v95;
        uint64_t v161 = v177;
        __int16 v162 = 1;
        int v155 = &unk_1EFFD4A20;
        uint64_t v156 = 0;
        uint64_t v96 = *((unsigned int *)a2 + 14);
        if (*((_DWORD *)a2 + 14))
        {
          uint64_t v97 = 0;
          unsigned int v98 = (v95.i32[2] << 8) - 257;
          unsigned int v99 = (v95.i32[0] << 8) - 257;
          uint64_t v100 = *((unsigned int *)a2 + 12);
          v101.i64[0] = 0x3F0000003F000000;
          v101.i64[1] = 0x3F0000003F000000;
          v102.i64[0] = 0x3F0000003F000000;
          v102.i64[1] = 0x3F0000003F000000;
          do
          {
            float32x4_t v102 = vsubq_f32(v101, v102);
            if (v100)
            {
              uint64_t v103 = 0;
              int v104 = 0;
              uint64_t v105 = 0;
              unsigned int v106 = v97 << 7;
              if ((v97 & 0x1000000) != 0) {
                unsigned int v107 = 0;
              }
              else {
                unsigned int v107 = v98;
              }
              if (v106 > v98) {
                unsigned int v106 = v107;
              }
              uint64_t v108 = v106 >> 8;
              v109.i64[0] = 0x3F0000003F000000;
              v109.i64[1] = 0x3F0000003F000000;
              do
              {
                float32x4_t v109 = vsubq_f32(v101, v109);
                if (!*(unsigned char *)(v105 + a3[2] + v97 * a3[3]))
                {
                  if (v104 >= 0) {
                    unsigned int v110 = v99;
                  }
                  else {
                    unsigned int v110 = 0;
                  }
                  if (v104 <= v99) {
                    unsigned int v110 = v104;
                  }
                  uint64_t v111 = v157 + ((v110 >> 4) & 0xFFFFFF0);
                  float32x4_t v112 = vmlaq_f32(*(float32x4_t *)(v111 + v158 * v108), v109, vsubq_f32(*(float32x4_t *)(v111 + v158 * v108 + 16), *(float32x4_t *)(v111 + v158 * v108)));
                  *(float32x4_t *)(v103 + a2[2] + v97 * a2[3]) = vmlaq_f32(v112, v102, vmlaq_f32(vsubq_f32(*(float32x4_t *)(v111+ v158 * (v108 + 1)), v112), v109, vsubq_f32(*(float32x4_t *)(v111+ v158 * (v108 + 1)+ 16), *(float32x4_t *)(v111+ v158 * (v108 + 1)))));
                }
                ++v105;
                v104 += 128;
                v103 += 16;
              }
              while (v100 != v105);
            }
            ++v97;
          }
          while (v97 != v96);
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)&v155);
        uint64_t v93 = 0;
        char v94 = 1;
      }
    }
    else
    {
      char v94 = 0;
      uint64_t v93 = 7;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v163);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v171);
    if (v94) {
      goto LABEL_118;
    }
  }
  else
  {
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v171);
    return 7;
  }
  return v93;
}

void sub_1A97F37D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t CMemBlockT<__simd128_float32_t>::Resize(CMemBlock *a1, uint64_t a2, int a3, int a4)
{
  return CMemBlock::Resize(a1, 16 * a2, a3, a4);
}

double CMemBlockT<__simd128_float32_t>::Description@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(void *)(a2 + 80) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  *(void *)a2 = &unk_1EFFD4AC0;
  *(void *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 32) = 1;
  *(void *)(a2 + 64) = v4 >> 4;
  *(void *)(a2 + 40) = 16;
  *(void *)(a2 + 16) = v4 & 0xFFFFFFFFFFFFFFF0;
  *(void *)(a2 + 24) = 0;
  return result;
}

void CMemBlockT<__simd128_float32_t>::~CMemBlockT(CMemBlock *a1)
{
  CMemBlock::~CMemBlock(a1);
  CBaseRef::operator delete(v1);
}

BOOL LinesCross(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  float v8 = a8 - a6;
  float v9 = a3 - a1;
  float v10 = a7 - a5;
  float v11 = a4 - a2;
  float v12 = -(float)((float)(v11 * v10) - (float)(v9 * v8));
  return fabsf(v12) >= 0.0001
      && fmaxf(fabsf((float)((float)(1.0 / v12)* (float)-(float)((float)(v11 * (float)(a1 - a5)) - (float)((float)(a2 - a6) * v9)))+ -0.5), fabsf((float)((float)(1.0 / v12)* (float)-(float)((float)((float)(a1 - a5) * v8) - (float)((float)(a2 - a6) * v10)))+ -0.5)) < 0.5;
}

uint64_t ConnectIsophotes(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  uint64_t result = 0;
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return result;
  }
  uint64_t v6 = a3;
  if (!a3) {
    return result;
  }
  uint64_t v7 = 2 * a4;
  if ((int)v7 + 2 > a2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v151 = 0;
  int v152 = 0;
  float32x2_t v149 = 0;
  __int32 v150 = 0;
  memset(__src, 0, sizeof(__src));
  uint64_t v110 = a2 - 1;
  if (v7 >= v110) {
    return result;
  }
  float32x2_t v8 = 0;
  float32x2_t v9 = 0;
  unint64_t v112 = 0;
  unint64_t v10 = v7 | 1;
  unint64_t v11 = a2;
  int32x2_t v12 = 0;
  float v111 = 0.0;
  float v13 = 0.1;
  double v14 = 1.0;
  int32x2_t v15 = 0;
  unsigned int v108 = 2 * a4;
  uint64_t v16 = 2 * a4;
  *(float *)&int v17 = 0.1;
  unint64_t v117 = a2;
  uint64_t v118 = a1;
  do
  {
    uint64_t v113 = v16 + 1;
    unint64_t v114 = v10;
    if (v16 + 1 < v11)
    {
      uint64_t v18 = a1 + 28 * v16;
      float v19 = *(float *)v18;
      float v20 = *(float *)(v18 + 4);
      float v22 = *(float *)(v18 + 8);
      float v21 = *(float *)(v18 + 12);
      int v123 = (float32x2_t *)(v18 + 20);
      float32x4_t v115 = (uint64_t *)(v18 + 16);
      unsigned int v116 = v16;
      int32x2_t v23 = v12;
      int32x2_t v24 = v15;
      int v120 = (float32x2_t *)v18;
      float v122 = *(float *)(v18 + 16);
      float32x2_t v25 = v8;
      float32x2_t v26 = v9;
      float v27 = *(float *)&v17;
      float v129 = v20;
      float v130 = *(float *)v18;
      float v134 = v21;
      do
      {
        uint64_t v28 = (float32x2_t *)(a1 + 28 * v10);
        float v29 = v28[1].f32[0];
        float v30 = v28[1].f32[1];
        float v31 = v28->f32[0] - v19;
        float v32 = v28->f32[1] - v20;
        double v33 = v14 / sqrtf((float)(v31 * v31) + (float)(v32 * v32));
        float v34 = v33 * v31;
        float v35 = v33 * v32;
        float v36 = (float)(v22 * v34) + (float)(v21 * v35);
        float v37 = (float)(v29 * v34) + (float)(v30 * v35);
        if ((float)(v36 * v37) >= 0.0)
        {
          int32x2_t v139 = v23;
          int32x2_t v140 = v24;
          float v141 = v27;
          float v38 = v28[2].f32[0];
          float v39 = -(float)((float)(v29 * v35) - (float)(v30 * v34));
          if ((float)((float)-(float)((float)(v22 * v35) - (float)(v21 * v34)) * v39) > 0.0
            && fabsf(v39 - (float)((float)(v22 * v35) - (float)(v21 * v34))) > 0.4)
          {
            int32x2_t v12 = v23;
            int32x2_t v15 = v24;
            float32x2_t v8 = v25;
            float32x2_t v9 = v26;
            *(float *)&int v17 = v27;
            goto LABEL_36;
          }
          float32x2_t v131 = v25;
          float32x2_t v132 = v26;
          float v40 = acosf(fminf(fabsf(v37), fabsf(v36)));
          float v41 = 0.0;
          if (v40 < 1.1781) {
            float v41 = 0.4 / (float)(v40 + 0.4);
          }
          float v42 = v41 * fminf(v38, v122);
          __asm
          {
            FMOV            V2.2S, #5.0
            FMOV            V3.2S, #1.0
          }
          float32x2_t v49 = vmla_f32(_D3, _D2, vabd_f32(*v123, *(float32x2_t *)(a1 + 28 * v10 + 20)));
          float v50 = v42 / vmul_lane_f32(v49, v49, 1).f32[0];
          *(float *)&int v17 = v141;
          if (v50 <= v141)
          {
            int32x2_t v12 = v139;
            int32x2_t v15 = v140;
            float32x2_t v8 = v131;
            float32x2_t v9 = v132;
            goto LABEL_35;
          }
          float v124 = v40;
          int v121 = LODWORD(v50);
          int32x2_t v126 = (int32x2_t)v120[1];
          float32x2_t v127 = *v120;
          float32x2_t v128 = *v28;
          int32x2_t v125 = (int32x2_t)v28[1];
          if (a4)
          {
            uint64_t v51 = 0;
            float32x2_t v52 = vsub_f32(v128, v127);
            *(float32x2_t *)v53.f32 = v120[1];
            float32x2_t v54 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(v126, 1), v125), (float32x2_t)vrev64_s32((int32x2_t)v52)), v52, (float32x2_t)__PAIR64__(v125.u32[1], v126.u32[0]));
            v55.i16[0] = vcltz_f32(v54).u16[0];
            v55.i16[1] = v55.i16[0];
            v55.i16[2] = vcgtz_f32(v54).i16[2];
            v55.i16[3] = v55.i16[2];
            *(float32x2_t *)&v53.u32[2] = v28[1];
            *(float32x2_t *)v56.f32 = *v120;
            *(float32x2_t *)&v56.u32[2] = *v28;
            float32x4_t v57 = vmlaq_n_f32(v56, (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v55), (int8x16_t)vnegq_f32(v53), (int8x16_t)v53), (float)((float)((float)(v124 * v124) * v13) + 0.333) * sqrtf(vaddv_f32(vmul_f32(v52, v52))));
            LODWORD(v58) = *(float32x2_t *)v120->f32;
            float32x2_t v137 = *v28;
            float32x2_t v138 = *v120;
            *(float32x2_t *)v59.i8 = *v120;
            float32x2_t v135 = (float32x2_t)vextq_s8((int8x16_t)v57, (int8x16_t)v57, 8uLL).u64[0];
            v59.u64[1] = (unint64_t)v135;
            v53.i64[0] = v57.i64[0];
            *(float32x2_t *)&v53.u32[2] = *v28;
            int8x16_t v60 = vbslq_s8((int8x16_t)vcgtq_f32(v56, v57), v59, (int8x16_t)v53);
            float32x4_t v61 = (float32x4_t)vextq_s8(v60, v60, 8uLL);
            float32x2_t v136 = *(float32x2_t *)v57.f32;
            float32x4_t v62 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v57, v56), v59, (int8x16_t)v53);
            int8x16_t v63 = (int8x16_t)vcgtq_f32(v61, v62);
            v53.i64[1] = v61.i64[1];
            v61.i64[1] = v62.i64[1];
            v53.i64[0] = v62.i64[0];
            int8x16_t v144 = vbslq_s8(v63, (int8x16_t)v53, (int8x16_t)v61);
            float32x2_t v143 = (float32x2_t)vextq_s8(v144, v144, 8uLL).u64[0];
            while (1)
            {
              uint64_t v64 = (void *)(v6 + 352 * v51);
              int32x2_t v146 = (int32x2_t)v64[1];
              float32x2_t v147 = *(float32x2_t *)((char *)v64 + 28);
              int32x2_t v145 = *(int32x2_t *)((char *)v64 + 36);
              float v65 = *((float *)v64 + 15);
              float32x2_t v148 = *(float32x2_t *)v64;
              if (LinesCross(v58, v127.f32[1], v128.f32[0], v128.f32[1], COERCE_FLOAT(*v64), COERCE_FLOAT(HIDWORD(*v64)), v147.f32[0], v147.f32[1]))
              {
                break;
              }
              float32x2_t v66 = vsub_f32(v147, v148);
              *(int32x2_t *)v67.f32 = v146;
              float32x2_t v68 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(v146, 1), v145), (float32x2_t)vrev64_s32((int32x2_t)v66)), v66, (float32x2_t)__PAIR64__(v145.u32[1], v146.u32[0]));
              v69.i16[0] = vcltz_f32(v68).u16[0];
              v69.i16[1] = v69.i16[0];
              v69.i16[2] = vcgtz_f32(v68).i16[2];
              v69.i16[3] = v69.i16[2];
              *(int32x2_t *)&v67.u32[2] = v145;
              *(float32x2_t *)v70.f32 = v148;
              *(float32x2_t *)&v70.u32[2] = v147;
              float32x4_t v71 = vmlaq_n_f32(v70, (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v69), (int8x16_t)vnegq_f32(v67), (int8x16_t)v67), (float)((float)((float)(v65 * v65) * v13) + 0.333) * sqrtf(vaddv_f32(vmul_f32(v66, v66))));
              *(float32x2_t *)v72.f32 = v148;
              *(float32x2_t *)&v72.u32[2] = v147;
              float32x2_t v73 = (float32x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v71, 8uLL).u64[0];
              *(float32x2_t *)v67.f32 = v148;
              *(float32x2_t *)&v67.u32[2] = v73;
              v74.i64[0] = v71.i64[0];
              v74.u64[1] = (unint64_t)v147;
              int8x16_t v75 = vbslq_s8((int8x16_t)vcgtq_f32(v72, v71), (int8x16_t)v67, v74);
              float32x4_t v76 = (float32x4_t)vextq_s8(v75, v75, 8uLL);
              float32x4_t v77 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v71, v72), (int8x16_t)v67, v74);
              _Q4 = (int8x16_t)vcgtq_f32(v76, v77);
              v74.i64[1] = v76.i64[1];
              v76.i64[1] = v77.i64[1];
              v74.i64[0] = v77.i64[0];
              int8x16_t v79 = vbslq_s8(_Q4, v74, (int8x16_t)v76);
              __asm { FMOV            V4.2S, #4.0 }
              *(int32x2_t *)v79.i8 = vcge_f32(vmaxnm_f32(*(float32x2_t *)v79.i8, *(float32x2_t *)v144.i8), vadd_f32(vminnm_f32((float32x2_t)*(_OWORD *)&vextq_s8(v79, v79, 8uLL), v143), *(float32x2_t *)_Q4.i8));
              if (((v79.i32[0] | v79.i32[1]) & 1) == 0)
              {
                float v80 = v22;
                float v81 = v13;
                uint64_t v82 = 0;
                uint64_t v157 = 0;
                memset(v156, 0, sizeof(v156));
                uint64_t v155 = 0;
                float v83 = 0.0;
                memset(v154, 0, sizeof(v154));
                do
                {
                  float v84 = 1.0 - v83;
                  float v85 = (float)(v84 * v84) * v84;
                  float v86 = (float)(v83 * 3.0) * (float)(v84 * v84);
                  float v87 = (float)(1.0 - v83) * (float)(3.0 * (float)(v83 * v83));
                  float v88 = (float)(v83 * v83) * v83;
                  *(float32x2_t *)((char *)v156 + v82) = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v138, v85), v136, v86), v135, v87), v137, v88);
                  *(float32x2_t *)((char *)v154 + v82) = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v148, v85), *(float32x2_t *)v71.f32, v86), v73, v87), v147, v88);
                  float v83 = v83 + 0.0625;
                  v82 += 8;
                }
                while (v82 != 136);
                unint64_t v89 = 0;
                BOOL v90 = 1;
                float v91 = *((float *)v156 + 1);
                float v92 = *(float *)v156;
LABEL_24:
                uint64_t v93 = 0;
                unint64_t v94 = v89 + 1;
                int64x2_t v95 = (float *)v156 + 2 * v89 + 2;
                float v97 = *v95;
                float v96 = v95[1];
                do
                {
                  uint64_t v98 = v93 + 8;
                  if (v93 == 128)
                  {
                    BOOL v90 = v89 < 0xF;
                    float v91 = v96;
                    float v92 = v97;
                    ++v89;
                    if (v94 != 16) {
                      goto LABEL_24;
                    }
                    uint64_t v6 = a3;
                    float v13 = v81;
                    float v22 = v80;
                    float v21 = v134;
                    float v58 = v127.f32[0];
                    goto LABEL_31;
                  }
                  BOOL v99 = LinesCross(v92, v91, v97, v96, *(float *)((char *)v154 + v93), *(float *)((char *)v154 + v93 + 4), *(float *)((char *)v154 + v93 + 8), *(float *)((char *)v154 + v93 + 12));
                  uint64_t v93 = v98;
                }
                while (!v99);
                uint64_t v6 = a3;
                float v13 = v81;
                float v22 = v80;
                float v21 = v134;
                float v58 = v127.f32[0];
                if (v90) {
                  break;
                }
              }
LABEL_31:
              if (++v51 == a4) {
                goto LABEL_32;
              }
            }
            int32x2_t v12 = v139;
            int32x2_t v15 = v140;
            float32x2_t v8 = v131;
            float32x2_t v9 = v132;
            *(float *)&int v17 = v141;
            unint64_t v11 = v117;
            a1 = v118;
LABEL_35:
            double v14 = 1.0;
LABEL_36:
            float v20 = v129;
            float v19 = v130;
            goto LABEL_37;
          }
LABEL_32:
          uint64_t v151 = *v115;
          int v152 = *((_DWORD *)v115 + 2);
          float32x2_t v149 = v28[2];
          __int32 v150 = v28[3].i32[0];
          memset(__src, 0, sizeof(__src));
          float v111 = v124;
          unint64_t v11 = v117;
          unint64_t v112 = __PAIR64__(v116, v10);
          a1 = v118;
          double v14 = 1.0;
          float32x2_t v9 = v127;
          float32x2_t v8 = v128;
          int32x2_t v15 = v125;
          int32x2_t v12 = v126;
          float v20 = v129;
          float v19 = v130;
          int v17 = v121;
        }
        else
        {
          int32x2_t v12 = v23;
          int32x2_t v15 = v24;
          float32x2_t v8 = v25;
          float32x2_t v9 = v26;
          *(float *)&int v17 = v27;
        }
LABEL_37:
        ++v10;
        int32x2_t v23 = v12;
        int32x2_t v24 = v15;
        float32x2_t v25 = v8;
        float32x2_t v26 = v9;
        float v27 = *(float *)&v17;
      }
      while (v10 < v11);
    }
    unint64_t v10 = v114 + 1;
    uint64_t v16 = v113;
  }
  while (v113 != v110);
  if (HIDWORD(v112) == v112) {
    return 0;
  }
  uint64_t v100 = (_OWORD *)(a1 + 28 * HIDWORD(v112));
  v156[0] = *v100;
  *(_OWORD *)((char *)v156 + 12) = *(_OWORD *)((char *)v100 + 12);
  float32x4_t v101 = (_OWORD *)(a1 + 28 * v108);
  long long v102 = *(_OWORD *)((char *)v101 + 12);
  *uint64_t v100 = *v101;
  *(_OWORD *)((char *)v100 + 12) = v102;
  *(_OWORD *)((char *)v101 + 12) = *(_OWORD *)((char *)v156 + 12);
  *float32x4_t v101 = v156[0];
  if (v112 == v108) {
    unsigned int v103 = HIDWORD(v112);
  }
  else {
    unsigned int v103 = v112;
  }
  int v104 = (_OWORD *)(a1 + 28 * v103);
  v156[0] = *v104;
  *(_OWORD *)((char *)v156 + 12) = *(_OWORD *)((char *)v104 + 12);
  uint64_t v105 = (_OWORD *)(a1 + 28 * (v108 | 1));
  long long v106 = *(_OWORD *)((char *)v105 + 12);
  _OWORD *v104 = *v105;
  *(_OWORD *)((char *)v104 + 12) = v106;
  *(_OWORD *)((char *)v105 + 12) = *(_OWORD *)((char *)v156 + 12);
  *uint64_t v105 = v156[0];
  uint64_t v107 = v6 + 352 * a4;
  *(float32x2_t *)uint64_t v107 = v9;
  *(int32x2_t *)(v107 + 8) = v12;
  *(void *)(v107 + 16) = v151;
  *(_DWORD *)(v107 + 24) = v152;
  *(float32x2_t *)(v107 + 28) = v8;
  *(int32x2_t *)(v107 + 36) = v15;
  *(float32x2_t *)(v107 + 44) = v149;
  *(_DWORD *)(v107 + 52) = v150;
  *(float *)(v107 + 56) = *(float *)&v17;
  *(float *)(v107 + 60) = v111;
  memcpy((void *)(v107 + 64), __src, 0x120uLL);
  return ConnectIsophotes(a1, a2, v6, a4 + 1) + 1;
}

double ReadEdgeColors_(_OWORD *a1, float *a2, float *a3)
{
  unsigned int v3 = 0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  memset(v19, 0, sizeof(v19));
  float v4 = *a2;
  float v5 = a2[1];
  float v6 = *a3;
  float v7 = a3[1];
  int v20 = 0;
  do
  {
    for (unsigned int i = 0; i != 9; ++i)
    {
      int v9 = vcvts_n_s32_f32((float)(v6 * (float)((float)v3 - v4)) + (float)(v7 * (float)((float)i - v5)), 8uLL);
      unsigned int v10 = v9 + 1024;
      if (v9 >= -1024) {
        unsigned int v11 = 2047;
      }
      else {
        unsigned int v11 = 0;
      }
      if (v10 <= 0x7FF) {
        unsigned int v11 = v10;
      }
      float v12 = (float)v11;
      unsigned int v13 = v11 >> 8;
      float v14 = v12 * 0.0039062;
      float v15 = *((float *)v19 + v13 + 1);
      *((float *)v19 + v13) = (float)(*((float *)v19 + v13) + 1.0) - v14;
      *((float *)v19 + v13 + 1) = v14 + v15;
    }
    ++v3;
  }
  while (v3 != 9);
  for (uint64_t j = 0; j != 36; j += 4)
  {
    float v17 = *(float *)((char *)v19 + j);
    if (v17 > 0.0) {
      *(float *)((char *)v19 + j) = 1.0 / v17;
    }
  }
  double result = 0.0;
  *a1 = 0u;
  a1[8] = 0u;
  return result;
}

uint64_t CInwardBlur::InwardBlur(uint64_t a1)
{
  uint64_t v1 = (CMemEnv **)MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  float v5 = v4;
  float v7 = v6;
  float32x2_t v8 = v1;
  uint64_t v429 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = v6[3].u32[0];
  uint64_t v10 = v6[3].u32[2];
  CGrNavigator::CGrNavigator((CGrNavigator *)v378, *v1, v9, v10, 16);
  v378[0] = &unk_1EFFD4A20;
  if (!v384)
  {
    uint64_t v34 = 7;
    goto LABEL_179;
  }
  CGrNavigator::CGrNavigator((CGrNavigator *)v372, *v8, v9, v10, 1);
  v372[0] = &unk_1EFFD4A60;
  if (!v377)
  {
    uint64_t v34 = 7;
    goto LABEL_178;
  }
  uint64_t v342 = (uint64_t)v8;
  uint64_t v11 = v382.u32[2];
  if (v382.i32[2])
  {
    uint64_t v12 = 0;
    uint64_t v13 = v382.u32[0];
    uint64_t v14 = 16 * v382.u32[0];
    do
    {
      if (v13)
      {
        uint64_t v15 = 0;
        do
        {
          *(_OWORD *)(v15 + v379 + v12 * v380) = *(_OWORD *)(v15 + v7[1].i64[0] + v12 * v7[1].i64[1]);
          v15 += 16;
        }
        while (v14 != v15);
      }
      ++v12;
    }
    while (v12 != v11);
  }
  if (v3)
  {
    uint64_t v16 = *(void *)(v3 + 32);
    if (v16 != 4)
    {
      if (v16 != 2)
      {
        if (v16 != 1) {
          goto LABEL_77;
        }
        float v17 = *((float *)v8 + 7);
        float v18 = 256.0;
        if (v17 >= 1.0)
        {
          if (v17 < 256.0)
          {
LABEL_17:
            size_t __len = v375;
            unsigned int v19 = v376;
            size_t v21 = *((unsigned int *)v8 + 2);
            unint64_t v20 = *((unsigned int *)v8 + 3);
            int v22 = *((_DWORD *)v8 + 5);
            size_t v358 = *((unsigned int *)v8 + 4);
            uint64_t v23 = *(unsigned int *)(v3 + 56);
            if (*(_DWORD *)(v3 + 56))
            {
              uint64_t v24 = 0;
              uint64_t v25 = *(unsigned int *)(v3 + 48);
              do
              {
                if (v25)
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if ((int)v17 <= *(unsigned __int8 *)(i
                                                                      + *(void *)(v3 + 16)
                                                                      + v24 * *(void *)(v3 + 24)))
                      char v27 = 0;
                    else {
                      char v27 = 7;
                    }
                    *(unsigned char *)(v373 + (v21 + i) + v374 * (v20 + v24)) = v27;
                  }
                }
                ++v24;
              }
              while (v24 != v23);
            }
            if (v19)
            {
              unint64_t v28 = 0;
              uint64_t v29 = v19;
              unint64_t v30 = v19 - v22;
              do
              {
                uint64_t v31 = v373 + v374 * v28;
                if (v28 < v20 || v28 >= v30)
                {
                  float v32 = (void *)(v373 + v374 * v28);
                  size_t v33 = __len;
                }
                else
                {
                  memset((void *)(v373 + v374 * v28), 7, v21);
                  float v32 = (void *)(v31 + __len - v358);
                  size_t v33 = v358;
                }
                memset(v32, 7, v33);
                ++v28;
              }
              while (v29 != v28);
            }
            goto LABEL_77;
          }
          float v18 = 0.0039062;
        }
        float v17 = v17 * v18;
        goto LABEL_17;
      }
      float v53 = *((float *)v8 + 7);
      if (v53 >= 1.0)
      {
        float v54 = 256.0;
        if (v53 >= 256.0)
        {
LABEL_61:
          size_t __lenb = v375;
          unsigned int v55 = v376;
          size_t v57 = *((unsigned int *)v8 + 2);
          unint64_t v56 = *((unsigned int *)v8 + 3);
          int v58 = *((_DWORD *)v8 + 5);
          size_t v360 = *((unsigned int *)v8 + 4);
          uint64_t v59 = *(unsigned int *)(v3 + 56);
          if (*(_DWORD *)(v3 + 56))
          {
            uint64_t v60 = 0;
            uint64_t v61 = *(unsigned int *)(v3 + 48);
            do
            {
              if (v61)
              {
                uint64_t v62 = 0;
                unsigned int v63 = v57;
                do
                {
                  if ((int)v53 <= *(unsigned __int16 *)(v62
                                                                     + *(void *)(v3 + 16)
                                                                     + v60 * *(void *)(v3 + 24)))
                    char v64 = 0;
                  else {
                    char v64 = 7;
                  }
                  *(unsigned char *)(v373 + v63 + v374 * (v56 + v60)) = v64;
                  v62 += 2;
                  ++v63;
                }
                while (2 * v61 != v62);
              }
              ++v60;
            }
            while (v60 != v59);
          }
          if (v55)
          {
            unint64_t v65 = 0;
            uint64_t v66 = v55;
            unint64_t v67 = v55 - v58;
            do
            {
              uint64_t v68 = v373 + v374 * v65;
              if (v65 < v56 || v65 >= v67)
              {
                int16x4_t v69 = (void *)(v373 + v374 * v65);
                size_t v70 = __lenb;
              }
              else
              {
                memset((void *)(v373 + v374 * v65), 7, v57);
                int16x4_t v69 = (void *)(v68 + __lenb - v360);
                size_t v70 = v360;
              }
              memset(v69, 7, v70);
              ++v65;
            }
            while (v66 != v65);
          }
          goto LABEL_77;
        }
      }
      else
      {
        float v54 = 65536.0;
      }
      float v53 = v53 * v54;
      goto LABEL_61;
    }
    float v35 = *((float *)v8 + 7);
    float v36 = v35 * 0.000015259;
    if (v35 < 256.0) {
      float v36 = v35 * 0.0039062;
    }
    if (v35 >= 1.0) {
      float v35 = v36;
    }
    size_t __lena = v375;
    unsigned int v37 = v376;
    size_t v39 = *((unsigned int *)v8 + 2);
    unint64_t v38 = *((unsigned int *)v8 + 3);
    int v40 = *((_DWORD *)v8 + 5);
    size_t v359 = *((unsigned int *)v8 + 4);
    uint64_t v41 = *(unsigned int *)(v3 + 56);
    if (*(_DWORD *)(v3 + 56))
    {
      uint64_t v42 = 0;
      uint64_t v43 = *(unsigned int *)(v3 + 48);
      do
      {
        if (v43)
        {
          uint64_t v44 = 0;
          unsigned int v45 = v39;
          do
          {
            if (*(float *)(v44 + *(void *)(v3 + 16) + v42 * *(void *)(v3 + 24)) < v35) {
              char v46 = 7;
            }
            else {
              char v46 = 0;
            }
            *(unsigned char *)(v373 + v45 + v374 * (v38 + v42)) = v46;
            v44 += 4;
            ++v45;
          }
          while (4 * v43 != v44);
        }
        ++v42;
      }
      while (v42 != v41);
    }
    if (v37)
    {
      unint64_t v47 = 0;
      uint64_t v48 = v37;
      unint64_t v49 = v37 - v40;
      do
      {
        uint64_t v50 = v373 + v374 * v47;
        if (v47 < v38 || v47 >= v49)
        {
          uint64_t v51 = (void *)(v373 + v374 * v47);
          size_t v52 = __lena;
        }
        else
        {
          memset((void *)(v373 + v374 * v47), 7, v39);
          uint64_t v51 = (void *)(v50 + __lena - v359);
          size_t v52 = v359;
        }
        memset(v51, 7, v52);
        ++v47;
      }
      while (v48 != v47);
    }
  }
LABEL_77:
  uint64_t v71 = v342;
  if (!*(unsigned char *)(v342 + 42)) {
    goto LABEL_177;
  }
  bzero(v409, 0x700uLL);
  bzero(v407, 0x2C00uLL);
  v340 = v5;
  uint64_t v341 = v3;
  v339 = v7;
  if (*(unsigned char *)(v342 + 44))
  {
    int v72 = *(_DWORD *)(v342 + 48);
    int64x2_t __lenc = v7[3];
    bzero(v407, 352 * v72);
    if (v72 >= 1)
    {
      uint64_t v73 = v72;
      int32x2_t v74 = *(int32x2_t *)(v342 + 8);
      float32x2_t v75 = vcvt_f32_u32((uint32x2_t)vsub_s32(vmovn_s64(__lenc), vadd_s32(v74, *(int32x2_t *)(v342 + 16))));
      float32x2_t v76 = vcvt_f32_u32((uint32x2_t)v74);
      float32x4_t v77 = (float *)v408;
      int v78 = (float *)(v342 + 72);
      do
      {
        *((float32x2_t *)v77 - 5) = vmla_f32(v76, v75, *(float32x2_t *)(v78 - 5));
        *(float32x2_t *)(v77 - 3) = vmla_f32(v76, v75, *(float32x2_t *)(v78 - 3));
        __float2 v79 = __sincosf_stret(*(v78 - 1));
        *(v77 - 8) = v79.__cosval;
        *(v77 - 7) = v79.__sinval;
        float v80 = *v78;
        v78 += 6;
        __float2 v81 = __sincosf_stret(v80);
        *(v77 - 1) = v81.__cosval;
        *float32x4_t v77 = v81.__sinval;
        v77 += 88;
        --v73;
      }
      while (v73);
    }
    goto LABEL_122;
  }
  CGrNavigator::CGrNavigator((CGrNavigator *)&v385, *(CMemEnv **)v342, v7[3].i64[0], v7[3].i64[1], 1);
  int32x2_t v385 = (int32x2_t)&unk_1EFFD4A60;
  if (!v392) {
    goto LABEL_118;
  }
  uint64_t v82 = *(unsigned int *)(v342 + 32);
  bzero(v410, 0x400uLL);
  int v83 = v390;
  int v84 = v391;
  uint64_t v85 = v390;
  uint64_t v86 = v391;
  if (v391)
  {
    uint64_t v87 = 0;
    do
    {
      if (v83)
      {
        uint64_t v88 = 0;
        uint64_t v89 = 0;
        do
        {
          int v90 = vcvts_n_s32_f32(*(float *)(v88 + v7[1].i64[0] + v87 * v7[1].i64[1] + 4 * v82), 8uLL);
          int v91 = v90 & ~(v90 >> 31);
          if (v91 >= 255) {
            int v91 = 255;
          }
          ++*((_DWORD *)v410 + v91);
          *(unsigned char *)(v89 + v388 + v87 * v389) = v91;
          ++v89;
          v88 += 16;
        }
        while (v85 != v89);
      }
      ++v87;
    }
    while (v87 != v86);
  }
  if ((v84 * v83) >= 0x10)
  {
    signed int v92 = (v84 * v83) >> 4;
    unsigned int v93 = 255;
    do
    {
      int v94 = v93 - 1;
      v92 -= *((_DWORD *)v410 + v93);
    }
    while (v92 >= 1 && v93-- != 1);
    if (v84 && v94 <= 0x7F)
    {
      uint64_t v96 = 0;
      if (v94 <= 16) {
        int v97 = 16;
      }
      else {
        int v97 = v94;
      }
      do
      {
        if (v83)
        {
          uint64_t v98 = 0;
          uint64_t v99 = 0;
          do
          {
            float v100 = (float)(*(float *)(v98 + v7[1].i64[0] + v96 * v7[1].i64[1] + 4 * v82) * 32768.0)
                 * (float)(1.0 / (float)v97);
            int v101 = (int)v100 & ~((int)v100 >> 31);
            if (v101 >= 255) {
              int v101 = 255;
            }
            uint64_t v102 = v388;
            uint64_t v103 = v389;
            ++*((_DWORD *)v410 + v101);
            *(unsigned char *)(v99 + v102 + v96 * v103) = v101;
            ++v99;
            v98 += 16;
          }
          while (v85 != v99);
        }
        ++v96;
      }
      while (v96 != v86);
    }
  }
  unsigned int v104 = vmaxvq_u32(*(uint32x4_t *)(v342 + 8));
  if (v104 < 8
    || ((unsigned int v105 = v104 - 5, v105 >= 8) ? (v106 = 8) : (v106 = v105),
        v390 >= v391 ? (unint64_t v107 = v391) : (unint64_t v107 = v390),
        v107 < (4 * v106)))
  {
LABEL_118:
    unsigned int v108 = 0;
    goto LABEL_119;
  }
  CGrNavigator::CGrNavigator((CGrNavigator *)v402, *(CMemEnv **)v342, v390 - (2 * v106), v391 - (2 * v106), 1);
  v402[0] = &unk_1EFFD4A60;
  if (!v406)
  {
    unsigned int v108 = 0;
    goto LABEL_374;
  }
  uint64_t v394 = 0x3F00000042020000;
  int v395 = 1065353216;
  __int16 v396 = -1;
  int v397 = 0;
  __int16 v398 = 0;
  v393 = *(CMemEnv **)v342;
  *(float *)&uint64_t v394 = (float)v106;
  CMedian::CxParms::CxParms((uint64_t)&v424, (uint64_t)&v393);
  if ((_BYTE)v424)
  {
    if ((v426 - 3) > 0x3C || v428 || v427)
    {
      BYTE8(v411) = 0;
      *(void *)&long long v411 = &unk_1EFFD4BB0;
      uint64_t v412 = *((void *)&v424 + 1);
      uint64_t v413 = 0x100000001;
      LOWORD(v414) = 0;
      *((void *)&v414 + 1) = 0;
      int64x2_t v415 = 0u;
      LODWORD(v416) = 0;
      bzero(v417, 0x3000uLL);
      long long v418 = 0u;
      pthread_mutex_init(&v419, 0);
      BYTE8(v411) = 1;
      v420 = &v424;
      *(void *)&long long v411 = &unk_1EFFD4E58;
      v421 = &unk_1EFFD4B38;
      char v422 = 0;
      uint64_t v423 = v425;
      if (!v425 || !(*(unsigned int (**)(uint64_t))(*(void *)v425 + 80))(v425)) {
        char v422 = 1;
      }
      int v230 = CKernel::Process((CKernel *)&v411, (const CGrNavigator *)&v385, (const CGrNavigator *)v402, 0);
      *(void *)&long long v411 = &unk_1EFFD4E58;
      CLock::~CLock((CLock *)&v421);
      CKernel::~CKernel((CKernel *)&v411);
    }
    else
    {
      CMedian::CKernel8x16::CKernel8x16((CMedian::CKernel8x16 *)&v411, (const CMedian::CxParms *)&v424);
      int v230 = CKernel::Process((CKernel *)&v411, (const CGrNavigator *)&v385, (const CGrNavigator *)v402, 0);
      CKernel::~CKernel((CKernel *)&v411);
    }
    if ((_BYTE)v424)
    {
      if (!v425) {
        goto LABEL_256;
      }
      (*(void (**)(uint64_t))(*(void *)v425 + 8))(v425);
    }
  }
  else
  {
    int v230 = 7;
  }
  uint64_t v425 = 0;
LABEL_256:
  if (v230 || (unint64_t v231 = (v106 + 4), v232 = v106 - 4 + v405, v232 <= v231))
  {
    unsigned int v357 = 0;
    goto LABEL_373;
  }
  unsigned int v357 = 0;
  unint64_t v233 = v106 - 4 + v404;
  uint64_t v234 = v373;
  unint64_t v335 = (v106 + 4);
  uint64_t v336 = v374;
  uint64_t v236 = v402[2];
  uint64_t v235 = v403;
  int v333 = -3 - v106;
  int v332 = -4 - v106;
  float32x2_t v237 = (float32x2_t)vdup_n_s32(0x3B808081u);
  unint64_t v238 = v335;
  unsigned int v239 = v106 + 4;
  int __lenf = v106;
  unint64_t v334 = v106 - 4 + v405;
  unint64_t v344 = v233;
  uint64_t v337 = v373;
  uint64_t v338 = v403;
  do
  {
    if (v233 > v231)
    {
      uint64_t v240 = v336 * v238;
      uint64_t v241 = v336 * v238 + v234;
      uint64_t v242 = v336 * (v239 - 1);
      unint64_t v346 = v239 + 1;
      uint64_t v347 = v241;
      uint64_t v243 = v336 * v346;
      uint64_t v244 = v235 * (v239 - v106 - 2);
      uint64_t v245 = v235 * (v239 - v106 + 2);
      float v246 = (float)v239;
      float v247 = (float)(v239 + 16);
      unint64_t v248 = v231;
      unsigned int v249 = v231;
      uint64_t v348 = v336 * v238;
      uint64_t v350 = v245;
      uint64_t v355 = v242;
      uint64_t v352 = v244;
      int v345 = v239 - v106 - 4;
      while (1)
      {
        uint64_t v250 = v248 + v234;
        if (*(unsigned char *)(v248 + v234 + v240))
        {
          unint64_t v248 = v249 + 1;
          int v251 = *(unsigned __int8 *)(v241 + v248);
          int v252 = *(unsigned __int8 *)(v250 + v242);
          int v253 = *(unsigned __int8 *)(v250 + v243);
          if (*(unsigned char *)(v241 + v249 - 1)) {
            BOOL v254 = v251 == 0;
          }
          else {
            BOOL v254 = 1;
          }
          BOOL v257 = !v254 && v252 != 0 && v253 != 0 || (*(unsigned __int8 *)(v241 + v249 - 1) | v251) == 0;
          int v258 = v252 | v253;
          if (v257 || v258 == 0) {
            goto LABEL_283;
          }
          uint64_t v260 = v236 + v249 - v106 - 2;
          uint64_t v261 = v236 + v249 - v106 + 2;
          unsigned int v262 = *(unsigned __int8 *)(v261 + v244);
          unsigned int v263 = *(unsigned __int8 *)(v260 + v245);
          unsigned int v264 = *(unsigned __int8 *)(v261 + v245);
          unsigned int v265 = (*(unsigned __int8 *)(v260 + v244) - v264) * (*(unsigned __int8 *)(v260 + v244) - v264);
          if (v265 <= (v262 - v263) * (v262 - v263)) {
            unsigned int v265 = (v262 - v263) * (v262 - v263);
          }
          if (v265 >= 0x100)
          {
            unsigned int v363 = *(unsigned __int8 *)(v260 + v244);
            float v266 = powf((float)v265, 0.25);
            if (v263 >= v264) {
              unsigned int v267 = v264;
            }
            else {
              unsigned int v267 = v263;
            }
            if (v263 <= v264) {
              unsigned int v268 = v264;
            }
            else {
              unsigned int v268 = v263;
            }
            unsigned int v269 = v363;
            if (v363 >= v262) {
              unsigned int v270 = v262;
            }
            else {
              unsigned int v270 = v363;
            }
            if (v363 <= v262) {
              unsigned int v269 = v262;
            }
            if (v270 >= v267) {
              unsigned int v270 = v267;
            }
            if (v269 <= v268) {
              unsigned int v271 = v268;
            }
            else {
              unsigned int v271 = v269;
            }
            if (v271 - v270 >= 0x10)
            {
              float v272 = v266 * 0.0625;
              unsigned int v364 = v270;
              unsigned int v273 = v270 + v271;
              bzero(&v411, 0x480uLL);
              uint64_t v274 = 0;
              int v275 = 0;
              unsigned int v276 = 0;
              unsigned int v277 = v273 >> 1;
              LODWORD(v106) = __lenf;
              uint64_t v235 = v338;
              do
              {
                uint64_t v278 = 0;
                uint64_t v279 = v236 + v338 * (v345 + v274);
                do
                {
                  unsigned int v280 = *(unsigned __int8 *)(v279 + v332 + v249 + v278);
                  unsigned int v281 = *(unsigned __int8 *)(v279 + v333 + v249 + v278);
                  if (v280 != v281 && (int)((v281 - v277) * (v280 - v277)) <= 0)
                  {
                    if (v280 < v281) {
                      ++v275;
                    }
                    else {
                      --v275;
                    }
                    float v283 = (float)(int)(v277 - v280) / (float)(int)(v281 - v280);
                    v284 = (float *)&v411 + 2 * v276;
                    float *v284 = (float)((float)v278 + -4.0) + v283;
                    v284[1] = (float)v274 + -4.0;
                    ++v276;
                  }
                  ++v278;
                }
                while (v278 != 8);
                ++v274;
              }
              while (v274 != 9);
              uint64_t v285 = 0;
              int v286 = 0;
              do
              {
                uint64_t v287 = 0;
                uint64_t v288 = (v345 + v285);
                uint64_t v289 = v338 * v288;
                uint64_t v290 = v338 * (v288 + 1);
                do
                {
                  uint64_t v291 = v332 + v249 + v287 + v236;
                  unsigned int v292 = *(unsigned __int8 *)(v291 + v289);
                  unsigned int v293 = *(unsigned __int8 *)(v291 + v290);
                  if (v292 != v293 && (int)((v293 - v277) * (v292 - v277)) <= 0)
                  {
                    if (v292 < v293) {
                      ++v286;
                    }
                    else {
                      --v286;
                    }
                    float v295 = (float)(int)(v277 - v292) / (float)(int)(v293 - v292);
                    uint64_t v296 = (float *)&v411 + 2 * v276;
                    *uint64_t v296 = (float)v287 + -4.0;
                    v296[1] = (float)((float)v285 + -4.0) + v295;
                    ++v276;
                  }
                  ++v287;
                }
                while (v287 != 9);
                ++v285;
              }
              while (v285 != 8);
              if (v276)
              {
                uint64_t v297 = v276;
                float32x2_t v298 = 0;
                float v299 = 0.0;
                int v300 = (float32x2_t *)&v411;
                float32x2_t v301 = 0;
                uint64_t v234 = v337;
                uint64_t v243 = v336 * v346;
                uint64_t v242 = v355;
                uint64_t v245 = v350;
                uint64_t v244 = v352;
                do
                {
                  float32x2_t v302 = *v300++;
                  float32x2_t v303 = v302;
                  float v299 = vmul_lane_f32(v303, v303, 1).f32[0] + v299;
                  float32x2_t v301 = vadd_f32(v302, v301);
                  float32x2_t v298 = vmla_f32(v298, v303, v303);
                  --v297;
                }
                while (v297);
              }
              else
              {
                float32x2_t v298 = 0;
                float v299 = 0.0;
                float32x2_t v301 = 0;
                uint64_t v234 = v337;
                uint64_t v243 = v336 * v346;
                uint64_t v242 = v355;
                uint64_t v245 = v350;
                uint64_t v244 = v352;
              }
              float v304 = -(float)(vmuls_lane_f32(v301.f32[0], v301, 1) - (float)(v299 * (float)v276));
              float32x2_t v305 = vmla_n_f32(vneg_f32(vmul_f32(v301, v301)), v298, (float)v276);
              float v306 = (float)v249;
              float v307 = (float)((float)(v301.f32[1] - (float)((float)(v304 / v305.f32[0]) * v301.f32[0])) / (float)v276)
                   + v246;
              float v308 = sqrtf((float)((float)(v304 / v305.f32[0]) * (float)(v304 / v305.f32[0])) + 1.0);
              float v309 = 1.0 / v308;
              float v310 = (float)(v304 / v305.f32[0]) / v308;
              float v311 = -(float)(1.0 / v308);
              if (v286 < 1) {
                float v311 = v309;
              }
              else {
                float v310 = -v310;
              }
              float v312 = v304 / v305.f32[1];
              float v313 = (float)((float)(v301.f32[0] - (float)(v312 * v301.f32[1])) / (float)v276) + v306;
              float v314 = sqrtf((float)(v312 * v312) + 1.0);
              float v315 = v312 / v314;
              float v316 = 1.0 / v314;
              float v317 = -v315;
              float v318 = -v316;
              if (v275 >= 0)
              {
                float v318 = v316;
                float v317 = v315;
              }
              if (v305.f32[0] <= v305.f32[1]) {
                float v319 = v246;
              }
              else {
                float v319 = v307;
              }
              if (v305.f32[0] <= v305.f32[1]) {
                float v320 = v313;
              }
              else {
                float v320 = (float)v249;
              }
              if (v305.f32[0] <= v305.f32[1]) {
                float v321 = v318;
              }
              else {
                float v321 = v310;
              }
              if (v305.f32[0] > v305.f32[1]) {
                float v317 = v311;
              }
              unint64_t v233 = v344;
              if (v357)
              {
                uint64_t v322 = 0;
                v323 = (float *)v409;
                while (1)
                {
                  if ((float)(*v323 + 16.0) >= v306 && *v323 <= (float)(v249 + 16))
                  {
                    float v325 = v323[1];
                    if ((float)(v325 + 16.0) >= v246 && v325 <= v247) {
                      break;
                    }
                  }
                  ++v322;
                  v323 += 7;
                  if (v357 == v322) {
                    goto LABEL_362;
                  }
                }
                uint64_t v329 = (float *)&v409[7 * v322];
                float v330 = v329[4];
                v328 = v329 + 4;
                if (v272 > v330)
                {
                  int64x2_t v331 = (float *)&v409[7 * v322];
                  v331[2] = v317;
                  v331[3] = v321;
                  float *v323 = v320;
                  v323[1] = v319;
                  goto LABEL_367;
                }
              }
              else
              {
LABEL_362:
                if (v272 > 0.0)
                {
                  if (v357 + 1 > 0x3F)
                  {
                    unsigned int v357 = 0;
                    uint64_t v71 = v342;
                    goto LABEL_373;
                  }
                  v327 = (float *)&v409[7 * v357];
                  v327[2] = v317;
                  v327[3] = v321;
                  uint64_t v322 = v357;
                  float *v327 = v320;
                  v327[1] = v319;
                  v328 = v327 + 4;
                  ++v357;
LABEL_367:
                  float *v328 = v272;
                  *(float32x2_t *)&v409[7 * v322 + 5] = vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(v271, v364)), v237);
                }
              }
              uint64_t v241 = v347;
              uint64_t v240 = v348;
              goto LABEL_283;
            }
            LODWORD(v106) = __lenf;
            unint64_t v233 = v344;
            uint64_t v234 = v337;
            uint64_t v235 = v338;
            uint64_t v241 = v347;
            uint64_t v240 = v348;
            uint64_t v243 = v336 * v346;
            uint64_t v242 = v355;
            uint64_t v245 = v350;
            uint64_t v244 = v352;
          }
          else
          {
            LODWORD(v106) = __lenf;
          }
        }
        else
        {
          unint64_t v248 = v249 + 1;
        }
LABEL_283:
        unsigned int v249 = v248;
        if (v233 <= v248)
        {
          uint64_t v71 = v342;
          unint64_t v232 = v334;
          unint64_t v231 = v335;
          unint64_t v238 = v346;
          goto LABEL_370;
        }
      }
    }
    unint64_t v238 = v239 + 1;
LABEL_370:
    unsigned int v239 = v238;
  }
  while (v232 > v238);
LABEL_373:
  unsigned int v108 = v357;
LABEL_374:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v402);
LABEL_119:
  CGrNavigator::~CGrNavigator((CGrNavigator *)&v385);
  int v109 = ConnectIsophotes((uint64_t)v409, v108, (uint64_t)v407, 0);
  int v72 = v109;
  int64x2_t v110 = v5[3];
  *(unsigned char *)(v71 + 44) = 1;
  *(_DWORD *)(v71 + 48) = v109;
  if (v109 >= 1)
  {
    int32x2_t v111 = *(int32x2_t *)(v71 + 8);
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)v115.f32 = vdiv_f32(_D2, vcvt_f32_u32((uint32x2_t)vsub_s32(vmovn_s64(v110), vadd_s32(v111, *(int32x2_t *)(v71 + 16)))));
    v115.i64[1] = v115.i64[0];
    float32x4_t __lend = v115;
    *(float32x2_t *)v115.f32 = vcvt_f32_u32((uint32x2_t)v111);
    v115.i64[1] = v115.i64[0];
    float32x4_t v361 = v115;
    uint64_t v116 = v109;
    unint64_t v117 = (float *)(v71 + 72);
    uint64_t v118 = (float *)v408;
    do
    {
      v119.i64[0] = *((void *)v118 - 5);
      v119.i64[1] = *(void *)(v118 - 3);
      *(float32x4_t *)(v117 - 5) = vmulq_f32(vsubq_f32(v119, v361), __lend);
      *(v117 - 1) = atan2f(*(v118 - 7), *(v118 - 8));
      *unint64_t v117 = atan2f(*v118, *(v118 - 1));
      v117 += 6;
      v118 += 88;
      --v116;
    }
    while (v116);
  }
LABEL_122:
  if (v72)
  {
    uint64_t v120 = 0;
    uint64_t v343 = v72;
    do
    {
      uint64_t __lene = v120;
      int v121 = &v407[22 * v120];
      unsigned int v122 = v382.i32[0];
      unsigned int v123 = v382.u32[2];
      float v124 = *((float *)v121 + 2);
      float v125 = *((float *)v121 + 3);
      float v126 = *((float *)v121 + 9);
      float v127 = *((float *)v121 + 10);
      float v128 = *((float *)v121 + 7) - *(float *)v121;
      float v356 = *((float *)v121 + 7);
      float v362 = v128;
      float v129 = *(float *)v121;
      float v353 = *(float *)v121;
      float v130 = *((float *)v121 + 8) - *((float *)v121 + 1);
      float v354 = v130;
      float v349 = *((float *)v121 + 1);
      float v131 = *((float *)v121 + 8);
      float v351 = v131;
      float v132 = (float)(v128 * v124) + (float)(v130 * v125);
      if (v132 >= 0.0) {
        float v133 = *((float *)v121 + 2);
      }
      else {
        float v133 = -v124;
      }
      if (v132 >= 0.0) {
        float v134 = *((float *)v121 + 3);
      }
      else {
        float v134 = -v125;
      }
      float v135 = (float)(v126 * v128) + (float)(v127 * v130);
      if (v135 <= 0.0) {
        float v136 = *((float *)v121 + 9);
      }
      else {
        float v136 = -v126;
      }
      if (v135 <= 0.0) {
        float v137 = *((float *)v121 + 10);
      }
      else {
        float v137 = -v127;
      }
      unsigned __int32 v138 = v382.i32[0] - 9;
      if ((int)v129 >= 4) {
        __int32 v139 = v382.i32[0] - 9;
      }
      else {
        __int32 v139 = 0;
      }
      int v140 = (int)*((float *)v121 + 1);
      if ((int)v129 - 4 <= v138) {
        unsigned int v141 = (int)v129 - 4;
      }
      else {
        unsigned int v141 = v139;
      }
      unsigned __int32 v142 = v382.i32[2] - 9;
      unsigned int v143 = v140 - 4;
      if (v140 >= 4) {
        __int32 v144 = v382.i32[2] - 9;
      }
      else {
        __int32 v144 = 0;
      }
      if (v143 <= v142) {
        unsigned int v145 = v143;
      }
      else {
        unsigned int v145 = v144;
      }
      if ((int)v356 >= 4) {
        __int32 v146 = v382.i32[0] - 9;
      }
      else {
        __int32 v146 = 0;
      }
      if ((int)v356 - 4 <= v138) {
        unsigned int v147 = (int)v356 - 4;
      }
      else {
        unsigned int v147 = v146;
      }
      if ((int)v131 >= 4) {
        __int32 v148 = v382.i32[2] - 9;
      }
      else {
        __int32 v148 = 0;
      }
      int32x2_t v385 = (int32x2_t)__PAIR64__(v145, v141);
      unsigned int v386 = v141 + 9;
      unsigned int v387 = v145 + 9;
      if ((int)v131 - 4 <= v142) {
        unsigned int v149 = (int)v131 - 4;
      }
      else {
        unsigned int v149 = v148;
      }
      v393 = (CMemEnv *)__PAIR64__(v149, v147);
      LODWORD(v394) = v147 + 9;
      HIDWORD(v394) = v149 + 9;
      CGrNavigator::CGrNavigator((uint64_t)v410, (uint64_t)v378, &v385);
      v410[0] = &unk_1EFFD4A20;
      CGrNavigator::CGrNavigator((uint64_t)v402, (uint64_t)v378, (int32x2_t *)&v393);
      v402[0] = &unk_1EFFD4A20;
      *(float *)&long long v424 = v353 - (float)v141;
      *((float *)&v424 + 1) = v349 - (float)v145;
      float v400 = v134;
      float v401 = -v133;
      ReadEdgeColors_(&v411, (float *)&v424, &v400);
      float v400 = v356 - (float)v147;
      float v401 = v351 - (float)v149;
      v399[0] = -v137;
      v399[1] = v136;
      ReadEdgeColors_(&v424, &v400, v399);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v402);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v410);
      float32x2_t v150 = *(float32x2_t *)((char *)v121 + 28);
      float32x2_t v151 = *(float32x2_t *)v121;
      v152.i64[0] = *((void *)v121 + 1);
      int32x2_t v153 = (int32x2_t)vsub_f32(v150, *(float32x2_t *)v121);
      v154.i32[0] = v152.i32[0];
      v154.i32[1] = HIDWORD(*(void *)((char *)v121 + 36));
      float32x2_t v155 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(*(int32x2_t *)v152.f32, 1), *(int32x2_t *)((char *)v121 + 36)), (float32x2_t)vrev64_s32(v153)), (float32x2_t)v153, v154);
      v154.i16[0] = vcltz_f32(v155).u16[0];
      v154.i16[1] = v154.i16[0];
      v154.i16[2] = vcgtz_f32(v155).i16[2];
      v154.i16[3] = v154.i16[2];
      v152.i64[1] = *(void *)((char *)v121 + 36);
      float32x4_t v156 = (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16((int16x4_t)v154), (int8x16_t)vnegq_f32(v152), (int8x16_t)v152);
      v152.i64[0] = *(void *)v121;
      *(float32x2_t *)&v152.u32[2] = v150;
      int8x16_t v157 = (int8x16_t)vmlaq_n_f32(v152, v156, (float)((float)((float)(*((float *)v121 + 15) * *((float *)v121 + 15)) * 0.1) + 0.333)* sqrtf(vaddv_f32(vmul_f32((float32x2_t)v153, (float32x2_t)v153))));
      float v158 = 0.75 / sqrtf((float)(v362 * v362) + (float)(v354 * v354));
      float32x2_t v159 = (float32x2_t)vextq_s8(v157, v157, 8uLL).u64[0];
      float v160 = 0.0;
      do
      {
        float32x2_t v161 = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v151, (float)((float)(1.0 - v160) * (float)(1.0 - v160)) * (float)(1.0 - v160)), *(float32x2_t *)v157.i8, (float)(v160 * 3.0) * (float)((float)(1.0 - v160) * (float)(1.0 - v160))), v159, (float)(1.0 - v160) * (float)(3.0 * (float)(v160 * v160))), v150, (float)(v160 * v160) * v160);
        float v162 = -(float)((float)(v160 * v137) - (float)((float)(1.0 - v160) * v134));
        float v163 = -(float)((float)((float)(1.0 - v160) * v133) - (float)(v160 * v136));
        double v164 = 1.0 / sqrtf((float)(v162 * v162) + (float)(v163 * v163));
        float v165 = v164 * v162;
        float v166 = v164 * v163;
        for (int j = -4; j != 5; ++j)
        {
          uint64_t v168 = (int)(float)((float)(v161.f32[0] + 0.5) + (float)((float)j * v165));
          uint64_t v169 = (int)(float)((float)(v161.f32[1] + 0.5) + (float)((float)j * v166));
          if (v168 < v122 && v169 < v123)
          {
            uint64_t v171 = v374 * v169;
            uint64_t v172 = v373 + v168;
            if (!*(unsigned char *)(v172 + v374 * v169))
            {
              int v173 = vcvts_n_s32_f32((float)((float)((float)v168 - v161.f32[0]) * v165)+ (float)((float)((float)v169 - v161.f32[1]) * v166), 8uLL);
              unsigned int v174 = v173 + 1024;
              if (v173 >= -1024) {
                int v175 = 1792;
              }
              else {
                int v175 = 0;
              }
              if (v174 <= 0x7FF) {
                int v175 = v174;
              }
              *(_OWORD *)(v379 + 16 * v168 + v380 * v169) = *(&v411 + (v175 >> 8));
              *(unsigned char *)(v171 + v172) = 7;
            }
          }
        }
        float v160 = v160 + v158;
      }
      while (v160 < 1.0);
      uint64_t v120 = __lene + 1;
    }
    while (__lene + 1 != v343);
  }
  float v5 = v340;
  uint64_t v3 = v341;
  float v7 = v339;
  uint64_t v71 = v342;
LABEL_177:
  uint64_t v34 = CInwardBlur::ProcessBuffer_(v71, v378, v372);
  if (v34) {
    goto LABEL_178;
  }
  uint64_t v413 = v380;
  *((void *)&v411 + 1) = 0;
  uint64_t v412 = v379;
  long long v414 = v381;
  int64x2_t v415 = vshrq_n_s64(vshlq_n_s64(v382, 0x20uLL), 0x20uLL);
  uint64_t v416 = v383;
  v417[0] = 1;
  *(void *)&long long v411 = &unk_1EFFD4A20;
  uint64_t v177 = v5[3].u32[2];
  if (v5[3].i32[2])
  {
    uint64_t v178 = 0;
    unsigned int v179 = *(_DWORD *)(v71 + 8);
    int v180 = *(_DWORD *)(v71 + 12);
    uint64_t v181 = v5[3].u32[0];
    do
    {
      if (v181)
      {
        uint64_t v182 = 0;
        unsigned int v183 = v179;
        do
        {
          *(_OWORD *)(v182 + v5[1].i64[0] + v178 * v5[1].i64[1]) = *(_OWORD *)(v412
                                                                             + 16 * v183
                                                                             + v413 * (v180 + v178));
          v182 += 16;
          ++v183;
        }
        while (16 * v181 != v182);
      }
      ++v178;
    }
    while (v178 != v177);
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)&v411);
  uint64_t v34 = 0;
  if (!v3 || !*(unsigned char *)(v71 + 41)) {
    goto LABEL_178;
  }
  uint64_t v184 = *(void *)(v3 + 32);
  switch(v184)
  {
    case 4:
      uint64_t v199 = v5[3].u32[2];
      float v200 = *(float *)(v71 + 28);
      float v201 = v200 * 0.000015259;
      if (v200 < 256.0) {
        float v201 = v200 * 0.0039062;
      }
      if (v200 >= 1.0) {
        float v200 = v201;
      }
      if (!v5[3].i32[2]) {
        break;
      }
      uint64_t v202 = 0;
      uint64_t v203 = v5[3].u32[0];
      float v204 = (float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
           - (float)(v200 * (float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001));
      float v205 = v204 + v200;
      float v206 = 1.0 / v204;
      while (!v203)
      {
LABEL_221:
        uint64_t v34 = 0;
        if (++v202 == v199) {
          goto LABEL_178;
        }
      }
      uint64_t v207 = 0;
      uint64_t v208 = 0;
      uint64_t v209 = 0;
      while (1)
      {
        uint64_t v210 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v202);
        uint64_t v211 = v7[1].i64[0] + 16 * (v209 + *(_DWORD *)(v71 + 8));
        uint64_t v212 = v5[1].i64[0] + v202 * v5[1].i64[1];
        float v213 = *(float *)(v208 + *(void *)(v3 + 16) + v202 * *(void *)(v3 + 24));
        if (v213 < v200) {
          break;
        }
        if (v213 <= v205)
        {
          float32x4_t v214 = vmlaq_n_f32(*(float32x4_t *)(v211 + v210), vsubq_f32(*(float32x4_t *)(v207 + v212), *(float32x4_t *)(v211 + v210)), (float)(v213 - v200) * v206);
          goto LABEL_219;
        }
LABEL_220:
        ++v209;
        v208 += 4;
        v207 += 16;
        if (v203 == v209) {
          goto LABEL_221;
        }
      }
      float32x4_t v214 = *(float32x4_t *)(v210 + v211);
LABEL_219:
      *(float32x4_t *)(v207 + v212) = v214;
      goto LABEL_220;
    case 2:
      uint64_t v215 = v5[3].u32[2];
      float v216 = *(float *)(v71 + 28);
      float v217 = 256.0;
      if (v216 >= 1.0)
      {
        if (v216 < 256.0)
        {
LABEL_227:
          if (!v5[3].i32[2]) {
            break;
          }
          uint64_t v218 = 0;
          unsigned int v219 = (int)v216;
          unsigned int v220 = (float)(4295000000.0
                                     / (float)((float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
                                             * (float)(0xFFFF - (int)v216)));
          uint64_t v221 = v5[3].u32[0];
          while (!v221)
          {
LABEL_237:
            uint64_t v34 = 0;
            if (++v218 == v215) {
              goto LABEL_178;
            }
          }
          uint64_t v222 = 0;
          uint64_t v223 = 0;
          uint64_t v224 = 0;
          while (1)
          {
            uint64_t v225 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v218);
            uint64_t v226 = v7[1].i64[0] + 16 * (v224 + *(_DWORD *)(v71 + 8));
            uint64_t v227 = v5[1].i64[0] + v218 * v5[1].i64[1];
            unsigned int v228 = *(unsigned __int16 *)(v223 + *(void *)(v3 + 16) + v218 * *(void *)(v3 + 24));
            if (v228 <= v219) {
              break;
            }
            if (0xFFFFFFFF / v220 + (int)v216 > v228)
            {
              float32x4_t v229 = vmlaq_n_f32(*(float32x4_t *)(v226 + v225), vsubq_f32(*(float32x4_t *)(v222 + v227), *(float32x4_t *)(v226 + v225)), (float)(((v228 - v219) * v220) >> 16) * 0.000015259);
LABEL_235:
              *(float32x4_t *)(v222 + v227) = v229;
            }
            ++v224;
            v223 += 2;
            v222 += 16;
            if (v221 == v224) {
              goto LABEL_237;
            }
          }
          float32x4_t v229 = *(float32x4_t *)(v225 + v226);
          goto LABEL_235;
        }
        float v217 = 0.0039062;
      }
      float v216 = v216 * v217;
      goto LABEL_227;
    case 1:
      uint64_t v185 = v5[3].u32[2];
      float v186 = *(float *)(v71 + 28);
      float v187 = 256.0;
      if (v186 < 1.0) {
        goto LABEL_194;
      }
      if (v186 >= 256.0)
      {
        float v187 = 0.0039062;
LABEL_194:
        float v186 = v186 * v187;
      }
      if (v5[3].i32[2])
      {
        uint64_t v188 = 0;
        unsigned int v189 = (int)v186;
        unsigned int v190 = (int)(float)(65535.0
                          / (float)((float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
                                  * (float)(255 - (int)v186)));
        uint64_t v191 = v5[3].u32[0];
        while (!v191)
        {
LABEL_205:
          uint64_t v34 = 0;
          if (++v188 == v185) {
            goto LABEL_178;
          }
        }
        uint64_t v192 = 0;
        uint64_t v193 = 0;
        while (2)
        {
          uint64_t v194 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v188);
          uint64_t v195 = v7[1].i64[0] + 16 * (v193 + *(_DWORD *)(v71 + 8));
          uint64_t v196 = v5[1].i64[0] + v188 * v5[1].i64[1];
          unsigned int v197 = *(unsigned __int8 *)(v193 + *(void *)(v3 + 16) + v188 * *(void *)(v3 + 24));
          if (v197 <= v189)
          {
            float32x4_t v198 = *(float32x4_t *)(v194 + v195);
LABEL_203:
            *(float32x4_t *)(v192 + v196) = v198;
          }
          else if (v197 < (int)(float)(65535.0 / (float)v190))
          {
            float32x4_t v198 = vmlaq_n_f32(*(float32x4_t *)(v195 + v194), vsubq_f32(*(float32x4_t *)(v192 + v196), *(float32x4_t *)(v195 + v194)), (float)(int)((v197 - v189) * v190) * 0.000015259);
            goto LABEL_203;
          }
          ++v193;
          v192 += 16;
          if (v191 == v193) {
            goto LABEL_205;
          }
          continue;
        }
      }
      break;
  }
  uint64_t v34 = 0;
LABEL_178:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v372);
LABEL_179:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v378);
  return v34;
}

void sub_1A97F5D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  CKernel::~CKernel((CKernel *)&STACK[0x3930]);
  if (*v69)
  {
    if (STACK[0x6B00]) {
      (*(void (**)(unint64_t))(*(void *)STACK[0x6B00] + 8))(STACK[0x6B00]);
    }
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a69);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a53);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a33);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a43);
  _Unwind_Resume(a1);
}

unint64_t CMedian::CKernel16x128::IdealTSize(CMedian::CKernel16x128 *this)
{
  uint64_t v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 16);
  }
  else {
    return 0x10000000100;
  }
}

void CMedian::CKernel16x128::~CKernel16x128(CMedian::CKernel16x128 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernel16x128::Process_(CMedian::CKernel16x128 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = CKernel::BorrowData(this);
  if (!v9) {
    return 7;
  }
  uint64_t v10 = *(void *)(v9 + 32) + 788016 * a4;
  uint64_t v12 = *((void *)a2 + 6);
  uint64_t v11 = *((void *)a2 + 7);
  float32x4_t v115 = (CMemBlock *)v9;
  uint64_t v116 = (_WORD *)(v10 + 67072);
  v125[1] = 0;
  uint64_t v126 = v10 + 394800;
  uint64_t v127 = (2 * v12 + 14) & 0xFFFFFFF0;
  long long v128 = xmmword_1A980BA20;
  uint64_t v129 = v12;
  uint64_t v130 = v11;
  uint64_t v131 = 1;
  __int16 v132 = 1;
  v125[0] = &unk_1EFFD4A80;
  v118[1] = 0;
  uint64_t v119 = v10 + 656944;
  unint64_t v114 = a3;
  long long v13 = *((_OWORD *)a3 + 3);
  long long v121 = xmmword_1A980BA20;
  long long v122 = v13;
  uint64_t v120 = (2 * v13 + 14) & 0xFFFFFFF0;
  uint64_t v123 = 1;
  __int16 v124 = 1;
  unint64_t v117 = this;
  v118[0] = &unk_1EFFD4A80;
  uint64_t v14 = *((void *)this + 1587);
  uint64_t v15 = v10 + 67088;
  uint64_t v16 = v10 + 132640;
  float v17 = (_WORD *)(v10 + 263728);
  bzero((void *)(v10 + 67088), *(unsigned __int16 *)(v14 + 44) + 1);
  int v18 = v11;
  int v19 = *(_DWORD *)(v14 + 36);
  int v20 = *(_DWORD *)(v14 + 28);
  if (v11)
  {
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    do
    {
      uint64_t v23 = (unsigned __int16 *)(*((void *)a2 + 2) + *((void *)a2 + 3) * v21);
      if (v12 < 0xA)
      {
        unsigned int v53 = 0;
      }
      else
      {
        unsigned int v24 = v23[1];
        unsigned int v25 = *v23;
        unsigned int v26 = 9;
        char v27 = (unsigned __int16 *)(*((void *)a2 + 2) + *((void *)a2 + 3) * v21);
        do
        {
          uint64_t v28 = v27[2];
          int v29 = *(unsigned __int8 *)(v15 + v24);
          uint64_t v30 = v27[3];
          char v31 = *(unsigned char *)(v15 + v25) + 1;
          if (*(unsigned __int8 *)(v15 + v25) == 255) {
            v134[v22++] = v25;
          }
          int v32 = v24 ^ v25;
          *(unsigned char *)(v15 + v25) = v31;
          int v33 = *(unsigned __int8 *)(v15 + v28);
          uint64_t v34 = v27[4];
          unsigned int v35 = v29 + ((v32 - 1) >> 31) - 255;
          if (!v35) {
            v134[v22++] = v24;
          }
          int v36 = v28 ^ v24;
          *(unsigned char *)(v15 + v24) = v35;
          int v37 = *(unsigned __int8 *)(v15 + v30);
          uint64_t v38 = v27[5];
          unsigned int v39 = v33 + ((v36 - 1) >> 31) - 255;
          if (!v39) {
            v134[v22++] = v28;
          }
          int v40 = v30 ^ v28;
          *(unsigned char *)(v15 + v28) = v39;
          int v41 = *(unsigned __int8 *)(v15 + v34);
          uint64_t v42 = v27[6];
          unsigned int v43 = v37 + ((v40 - 1) >> 31) - 255;
          if (!v43) {
            v134[v22++] = v30;
          }
          int v44 = v34 ^ v30;
          *(unsigned char *)(v15 + v30) = v43;
          int v45 = *(unsigned __int8 *)(v15 + v38);
          uint64_t v46 = v27[7];
          unsigned int v47 = v41 + ((v44 - 1) >> 31) - 255;
          if (!v47) {
            v134[v22++] = v34;
          }
          int v48 = v38 ^ v34;
          *(unsigned char *)(v15 + v34) = v47;
          int v49 = *(unsigned __int8 *)(v15 + v42);
          uint64_t v23 = v27 + 8;
          unsigned int v25 = v27[8];
          unsigned int v50 = v45 + ((v48 - 1) >> 31) - 255;
          if (!v50) {
            v134[v22++] = v38;
          }
          int v51 = v42 ^ v38;
          *(unsigned char *)(v15 + v38) = v50;
          int v52 = *(unsigned __int8 *)(v15 + v46);
          unsigned int v24 = v27[9];
          if (v49 + ((v51 - 1) >> 31) == 255) {
            v134[v22++] = v42;
          }
          *(unsigned char *)(v15 + v42) = v49 + (v51 - 1 < 0) + 1;
          if (v52 + (((v46 ^ v42) - 1) >> 31) == 255) {
            v134[v22++] = v46;
          }
          *(unsigned char *)(v15 + v46) = v52 + ((int)((v46 ^ v42) - 1) < 0) + 1;
          v26 += 8;
          v27 += 8;
        }
        while (v26 < v12);
        unsigned int v53 = ((v12 - 10) & 0xFFFFFFF8) + 8;
      }
      BOOL v54 = v12 >= v53;
      int v55 = v12 - v53;
      if (v55 != 0 && v54)
      {
        do
        {
          unsigned int v56 = *v23++;
          unsigned int v57 = *(unsigned __int8 *)(v15 + v56) + 1;
          v134[v22] = v56;
          v22 += v57 >> 8;
          *(unsigned char *)(v15 + v56) = v57;
          --v55;
        }
        while (v55);
      }
      ++v21;
    }
    while (v21 != v18);
    if (v22 >= 2)
    {
      uint64_t v112 = v10;
      uint64_t v113 = v14;
      int v58 = v18;
      int v59 = v20;
      bensort_((uint64_t)v134, 0, v22 - 1);
      int v20 = v59;
      int v18 = v58;
      uint64_t v10 = v112;
      uint64_t v14 = v113;
    }
  }
  else
  {
    unsigned int v22 = 0;
  }
  v134[v22] = -1;
  int v133 = -1;
  LODWORD(v61) = v22 - 1;
  LODWORD(v62) = v134[v22 - 1];
  uint64_t v63 = *(unsigned __int16 *)(v14 + 44);
  if (*(unsigned char *)(v14 + 46) && *(unsigned char *)(v14 + 47))
  {
    LODWORD(v64) = 0;
LABEL_52:
    uint64_t v68 = v116;
    int16x4_t v69 = (uint64_t *)v117;
    *float v17 = v64;
    unint64_t v70 = (v64 + 1);
    uint64_t v71 = 1;
    if ((v70 & 3) != 0 && v70 < v63)
    {
      uint64_t v71 = 1;
      do
      {
        int v72 = *(unsigned __int8 *)(v15 + v70);
        if (v70 == v62)
        {
          uint64_t v61 = (int)v61;
          do
          {
            v72 += 256;
            uint64_t v62 = v134[++v61];
          }
          while (v70 == v62);
        }
        *(_WORD *)(v16 + 2 * v70) = v71;
        if (v72)
        {
          int v73 = v71;
          do
          {
            uint64_t v71 = (v73 + 1);
            v17[v73++] = v70;
            --v72;
          }
          while (v72);
        }
        ++v70;
      }
      while ((v70 & 3) != 0 && v70 < v63);
    }
    goto LABEL_63;
  }
  if (v20 + ~v19 < 0)
  {
    LODWORD(v63) = v63 + 1;
  }
  else
  {
    int v65 = 0;
    ++v63;
    do
    {
      --v63;
      v65 += *(unsigned __int8 *)(v15 + v63);
      if (v62 == v63)
      {
        uint64_t v61 = (int)v61;
        do
        {
          v65 += 256;
          int v66 = v134[--v61];
        }
        while (v66 == v62);
        LODWORD(v62) = v66;
      }
      *(_WORD *)(v16 + 2 * v63) = -1;
    }
    while (v65 <= v20 + ~v19);
  }
  LODWORD(v62) = v134[0];
  if (v19 < 0)
  {
    if ((v63 & 0x80000000) == 0)
    {
      LODWORD(v61) = 0;
      LODWORD(v70) = 0;
      *float v17 = -1;
      uint64_t v71 = 1;
      uint64_t v68 = v116;
      int16x4_t v69 = (uint64_t *)v117;
LABEL_63:
      if ((int)v70 < (int)v63 - 3)
      {
        do
        {
          uint64_t v74 = v70;
          unsigned int v75 = *(_DWORD *)(v15 + v70);
          unsigned int j = bswap32(v75);
          if ((v70 ^ v62) < 4)
          {
            unsigned int v80 = HIBYTE(j);
            *(_WORD *)(v16 + 2 * v74) = v71;
            if (v62 == v74)
            {
              uint64_t v61 = (int)v61;
              do
              {
                v80 += 256;
                LODWORD(v62) = v134[++v61];
              }
              while (v62 == v74);
            }
            for (; v80; --v80)
            {
              v17[v71] = v74;
              uint64_t v71 = (v71 + 1);
            }
            int v81 = BYTE2(j);
            *(_WORD *)(v16 + 2 * (v74 + 1)) = v71;
            if (v62 == v74 + 1)
            {
              uint64_t v61 = (int)v61;
              do
              {
                v81 += 256;
                int v82 = v134[++v61];
              }
              while (v82 == v62);
              LODWORD(v62) = v82;
            }
            for (; v81; --v81)
            {
              v17[v71] = v74 + 1;
              uint64_t v71 = (v71 + 1);
            }
            int v83 = BYTE1(j);
            *(_WORD *)(v16 + 2 * (v74 + 2)) = v71;
            if (v62 == v74 + 2)
            {
              uint64_t v61 = (int)v61;
              do
              {
                v83 += 256;
                int v84 = v134[++v61];
              }
              while (v84 == v62);
              LODWORD(v62) = v84;
            }
            for (; v83; --v83)
            {
              v17[v71] = v74 + 2;
              uint64_t v71 = (v71 + 1);
            }
            unsigned int j = j;
            *(_WORD *)(v16 + 2 * (v74 + 3)) = v71;
            if (v62 == v74 + 3)
            {
              uint64_t v61 = (int)v61;
              do
              {
                j += 256;
                int v85 = v134[++v61];
              }
              while (v85 == v62);
              LODWORD(v62) = v85;
            }
            for (; j; --j)
            {
              v17[v71] = v74 + 3;
              uint64_t v71 = (v71 + 1);
            }
          }
          else if (v75)
          {
            *(_WORD *)(v16 + 2 * v70) = v71;
            for (unsigned int i = HIBYTE(j); i; --i)
            {
              v17[v71] = v74;
              uint64_t v71 = (v71 + 1);
            }
            int v78 = BYTE2(j);
            *(_WORD *)(v16 + 2 * (v74 + 1)) = v71;
            if (BYTE2(j))
            {
              do
              {
                v17[v71] = v74 + 1;
                uint64_t v71 = (v71 + 1);
                --v78;
              }
              while (v78);
            }
            int v79 = BYTE1(j);
            *(_WORD *)(v16 + 2 * (v74 + 2)) = v71;
            if (BYTE1(j))
            {
              do
              {
                v17[v71] = v74 + 2;
                uint64_t v71 = (v71 + 1);
                --v79;
              }
              while (v79);
            }
            *(_WORD *)(v16 + 2 * (v74 + 3)) = v71;
            for (unsigned int j = j; j; --j)
            {
              v17[v71] = v74 + 3;
              uint64_t v71 = (v71 + 1);
            }
          }
          LODWORD(v70) = v74 + 4;
        }
        while ((int)v74 + 4 < (int)v63 - 3);
      }
      if (v70 >= v63)
      {
        LODWORD(v88) = v71;
      }
      else
      {
        uint64_t v86 = v70;
        do
        {
          int v87 = *(unsigned __int8 *)(v15 + v86);
          if (v86 == v62)
          {
            uint64_t v61 = (int)v61;
            do
            {
              v87 += 256;
              uint64_t v62 = v134[++v61];
            }
            while (v86 == v62);
          }
          *(_WORD *)(v16 + 2 * v86) = v71;
          if (v87)
          {
            do
            {
              uint64_t v88 = (v71 + 1);
              v17[v71] = v86;
              LODWORD(v71) = v71 + 1;
              --v87;
            }
            while (v87);
          }
          else
          {
            uint64_t v88 = v71;
          }
          ++v86;
          uint64_t v71 = v88;
        }
        while (v86 != v63);
      }
      *uint64_t v68 = v88;
      v17[v88] = v63;
      uint64_t v89 = (v18 - 1);
      if (v18 - 1 >= 0)
      {
        uint64_t v90 = *((void *)a2 + 2);
        uint64_t v91 = *((void *)a2 + 3);
        uint64_t v92 = v126;
        uint64_t v93 = v127;
        do
        {
          int v94 = (unsigned __int16 *)(v90 + v91 * v89);
          int64x2_t v95 = (_WORD *)(v92 + v93 * v89);
          uint64_t v96 = *v94;
          int v97 = *(unsigned __int16 *)(v16 + 2 * v96);
          if (v12 != 1)
          {
            int v98 = v12 - 1;
            do
            {
              unsigned int v100 = v94[1];
              ++v94;
              uint64_t v99 = v100;
              if ((unsigned __int16)v97 - 1 <= 0xFFFD) {
                *(_WORD *)(v16 + 2 * v96) = v97 + 1;
              }
              __int16 v101 = *(_WORD *)(v16 + 2 * v99);
              *v95++ = v97;
              LOWORD(v97) = v101;
              uint64_t v96 = v99;
              --v98;
            }
            while (v98);
            uint64_t v96 = *v94;
            int v97 = *(unsigned __int16 *)(v16 + 2 * v96);
          }
          *int64x2_t v95 = v97;
          if ((v97 - 1) < 0xFFFE) {
            *(_WORD *)(v16 + 2 * v96) = v97 + 1;
          }
        }
        while (v89-- > 0);
      }
      goto LABEL_123;
    }
    uint64_t v68 = v116;
    int16x4_t v69 = (uint64_t *)v117;
  }
  else
  {
    int v67 = 0;
    LODWORD(v61) = 0;
    uint64_t v64 = -1;
    do
    {
      ++v64;
      v67 += *(unsigned __int8 *)(v15 + v64);
      if (v64 == v62)
      {
        uint64_t v61 = (int)v61;
        do
        {
          v67 += 256;
          uint64_t v62 = v134[++v61];
        }
        while (v64 == v62);
      }
      *(_WORD *)(v16 + 2 * v64) = 0;
    }
    while (v67 <= v19);
    if ((int)v64 < (int)v63) {
      goto LABEL_52;
    }
    uint64_t v68 = v116;
    int16x4_t v69 = (uint64_t *)v117;
    if ((v64 & 0x80000000) == 0)
    {
      uint64_t v103 = v115;
      uint64_t v104 = *((unsigned int *)v114 + 14);
      if (*((_DWORD *)v114 + 14))
      {
        uint64_t v105 = 0;
        uint64_t v106 = *((unsigned int *)v114 + 12);
        unint64_t v107 = (_WORD *)*((void *)v114 + 2);
        uint64_t v108 = *((void *)v114 + 3);
        uint64_t v109 = *((void *)v114 + 4);
        do
        {
          int64x2_t v110 = v107;
          for (uint64_t k = v106; k; --k)
          {
            *int64x2_t v110 = v64;
            int64x2_t v110 = (_WORD *)((char *)v110 + v109);
          }
          ++v105;
          unint64_t v107 = (_WORD *)((char *)v107 + v108);
        }
        while (v105 != v104);
      }
      goto LABEL_124;
    }
  }
LABEL_123:
  CMedian::Median16x128_(v69[1587], v125, (uint64_t)v118, v10, (unsigned __int16)*v68);
  CMedian::OrdinalTransform(v119, v120, (uint64_t)v114, (uint64_t)v17);
  uint64_t v103 = v115;
LABEL_124:
  CKernel::ReturnData((CKernel *)v69, v103);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v118);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v125);
  return 0;
}

void sub_1A97F66EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void CMedian::Median16x128_(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = a5;
  unsigned int v10 = *(_DWORD *)(a3 + 48);
  int v11 = *(_DWORD *)(a1 + 24);
  int v38 = 2 * v11;
  unsigned int v12 = (2 * v11) & 0xFFFFFFF0;
  if (((2 * v11) & 0xFFFFFF80) != 0) {
    unsigned int v12 = 128;
  }
  if (v12 <= v10) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v10 & 0xFFFFFFF0;
  }
  if (v13 >= v10)
  {
    uint64_t v37 = *(void *)(a3 + 56);
    uint64_t v22 = (2 * v11) | 1u;
    unsigned int v23 = *(_DWORD *)(a1 + 36);
    bzero((void *)a4, 0x10600uLL);
    uint64_t v24 = a2[2];
    uint64_t v25 = a2[3];
    if ((*(_WORD *)(v24 + 2 * ((v11 & 0x7FFFFFFF) + (v13 >> 1)) + v25 * (v11 & 0x7FFFFFFF)) & 0xFFF0) != 0) {
      int v26 = *(_WORD *)(v24 + 2 * ((v11 & 0x7FFFFFFF) + (v13 >> 1)) + v25 * (v11 & 0x7FFFFFFF)) & 0xFFF0;
    }
    else {
      int v26 = 16;
    }
    if (v13)
    {
      char v27 = (_WORD *)a4;
      uint64_t v28 = v13;
      do
      {
        *v27++ = v26;
        --v28;
      }
      while (v28);
    }
    uint64_t v29 = 0;
    do
      Hist16x128Inc(a4, a2[2] + a2[3] * v29++, v22, v26, v13);
    while (v22 != v29);
    *(unsigned char *)(a4 + 1280) = 0;
    *(unsigned char *)(a4 + 66815) = 0;
    if (v13)
    {
      int v30 = *(unsigned __int16 *)(a4 + 768);
      uint64_t v31 = v13 - 1;
      int v32 = (unsigned __int16 *)(a4 + 514);
      do
      {
        int v33 = *v32++;
        v30 += v33;
        --v31;
      }
      while (v31);
      do
      {
        uint64_t v34 = a4 + 2 * v31;
        *(_WORD *)(v34 + 256) = v30;
        int v35 = *(unsigned __int16 *)(a4 + 512 + 2 * (v31++ + 129));
        int v30 = v30 + v35 - *(unsigned __int16 *)(v34 + 514);
      }
      while (v13 != v31);
    }
    if (v37)
    {
      Hist16x128ReadC1(a4, *(void *)(a3 + 16), v23, v13, v5);
      if (v37 != 1)
      {
        uint64_t v36 = 0;
        do
        {
          Hist16x128Step(a4, (unsigned __int16 *)(a2[2] + a2[3] * (v38 + 1 + v36)), (unsigned __int16 *)(a2[2] + a2[3] * v36), v22, v13);
          ++v36;
          Hist16x128ReadC1(a4, *(void *)(a3 + 16) + *(void *)(a3 + 24) * v36, v23, v13, v5);
        }
        while (v37 - 1 != v36);
      }
    }
  }
  else if (!__CFADD__(v10 - 1, v13))
  {
    unsigned int v15 = 0;
    if ((v10 - 1 + v13) / v13 <= 1) {
      unsigned int v16 = 1;
    }
    else {
      unsigned int v16 = (v10 - 1 + v13) / v13;
    }
    do
    {
      unsigned int v17 = v13 + v15;
      if (v13 + v15 >= v10) {
        unsigned int v17 = v10;
      }
      unsigned int v18 = v15 - 8;
      if ((v17 & 0xF) == 0) {
        unsigned int v18 = v15;
      }
      uint64_t v19 = *(void *)(a3 + 56);
      int32x2_t v44 = (int32x2_t)v18;
      unsigned int v45 = v17;
      int v46 = v19;
      uint64_t v20 = a2[7];
      int32x2_t v41 = (int32x2_t)v18;
      unsigned int v42 = v17 + v38;
      int v43 = v20;
      CGrNavigator::CGrNavigator((uint64_t)v40, (uint64_t)a2, &v41);
      v40[0] = &unk_1EFFD4A80;
      *(int32x2_t *)&double v21 = CGrNavigator::CGrNavigator((uint64_t)v39, a3, &v44);
      v39[0] = &unk_1EFFD4A80;
      CMedian::Median16x128_(a1, v40, v39, a4, a5, v21);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v39);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v40);
      v15 += v13;
      --v16;
    }
    while (v16);
  }
}

void sub_1A97F6A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va1);
  _Unwind_Resume(a1);
}

uint64_t Hist16x128Inc(uint64_t result, uint64_t a2, unsigned int a3, int a4, unsigned int a5)
{
  uint64_t v5 = result + 1280;
  if (a5 >= 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = result + 512;
    uint64_t v8 = result + 514;
    do
    {
      uint64_t v9 = *(unsigned __int16 *)(a2 + 2 * v6);
      uint64_t v10 = *(unsigned __int16 *)(a2 + 2 * a3 + 2 * v6);
      __int16 v11 = *(_WORD *)(v8 + 2 * v6);
      uint64_t v12 = v6 + 1;
      __int16 v13 = *(_WORD *)(v7 + 2 * (v6 + 129));
      *(unsigned char *)(v5 + v9) = v6 + 1;
      *(unsigned char *)(v5 + v10) = v6 - 127;
      if ((int)v9 >= a4) {
        __int16 v14 = v11;
      }
      else {
        __int16 v14 = v11 + 1;
      }
      if ((int)v10 >= a4) {
        __int16 v15 = v13;
      }
      else {
        __int16 v15 = v13 + 1;
      }
      *(_WORD *)(v8 + 2 * v6) = v14;
      *(_WORD *)(v7 + 2 * (v6++ + 129)) = v15;
    }
    while (a5 - 1 != v12);
  }
  __int16 v16 = *(_WORD *)(result + 768);
  LODWORD(v17) = a3 - (a5 - 1);
  if (a3 != a5 - 1)
  {
    unsigned int v18 = (unsigned __int16 *)(a2 + 2 * (a5 - 1));
    if (v17 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v17;
    }
    do
    {
      int v20 = *v18++;
      uint64_t v19 = v20;
      if (v20 < a4) {
        ++v16;
      }
      *(unsigned char *)(v5 + v19) = 0x80;
      --v17;
    }
    while (v17);
  }
  *(_WORD *)(result + 768) = v16;
  return result;
}

uint64_t Hist16x128ReadC1(uint64_t result, uint64_t a2, unsigned int a3, int a4, unsigned int a5)
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; *(_WORD *)(a2 + 2 * i++) = v10)
    {
      unint64_t v10 = result + 2 * i;
      uint64_t v6 = (_WORD *)(v10 + 256);
      unsigned int v7 = *(unsigned __int16 *)(v10 + 256);
      unsigned int v8 = *(unsigned __int16 *)v10;
      int v9 = i + 129;
      LODWORD(v10) = v8;
      if (v7 <= a3)
      {
        do
        {
          LODWORD(v10) = v8;
          if ((v8 & 0x3F) == 0)
          {
            if (v8 >= a5) {
              break;
            }
            *uint64_t v6 = v7;
            *(_WORD *)(result + 2 * i) = v8;
          }
          ++v8;
          v7 += ((*(unsigned __int8 *)(result + v10 + 1280) - v9) >> 7) & 1;
        }
        while (v7 <= a3);
      }
      else
      {
        do
        {
          if ((v10 & 0x3F) == 0)
          {
            if (!v10) {
              break;
            }
            *uint64_t v6 = v7;
            *(_WORD *)(result + 2 * i) = v10;
          }
          unint64_t v10 = (v10 - 1);
          v7 += (*(unsigned __int8 *)(result + v10 + 1280) - v9) << 24 >> 31;
        }
        while (v7 > a3);
      }
    }
  }
  return result;
}

uint64_t Hist16x128Step(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, unsigned int a5)
{
  uint64_t result = Hist16x128Delta1_(a1, a2, a3, a4, a5);
  uint64_t v11 = a1 + 1280;
  if (a5 >= 2)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = a2[a4 + v12];
      uint64_t v14 = a3[v12];
      uint64_t v15 = a3[a4 + v12];
      *(unsigned char *)(v11 + a2[v12]) = v12 + 1;
      *(unsigned char *)(v11 + v13) = (v12 + 1) ^ 0x80;
      *(unsigned char *)(v11 + v14) = 0;
      *(unsigned char *)(v11 + v15) = 0;
      ++v12;
    }
    while (a5 - 1 != v12);
  }
  unsigned int v16 = a5 - 1;
  LODWORD(v17) = a4 - (a5 - 1);
  if (a4 != a5 - 1)
  {
    unsigned int v18 = &a2[v16];
    uint64_t v19 = &a3[v16];
    if (v17 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v17;
    }
    do
    {
      unsigned int v21 = *v18++;
      uint64_t v20 = v21;
      unsigned int v22 = *v19++;
      *(unsigned char *)(v11 + v20) = 0x80;
      *(unsigned char *)(v11 + v22) = 0;
      --v17;
    }
    while (v17);
  }
  *(unsigned char *)(a1 + 1280) = 0;
  *(unsigned char *)(a1 + 66815) = 0;
  return result;
}

uint64_t Hist16x128Delta1_(uint64_t result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, int a5)
{
  if (a5)
  {
    unint64_t v5 = 0;
    unsigned int v6 = a4;
    do
    {
      unsigned int v7 = (unsigned __int16 *)(result + 2 * v5);
      if (*v7 <= 1u) {
        unsigned int v8 = 1;
      }
      else {
        unsigned int v8 = *v7;
      }
      unsigned int v9 = v7[128];
      unint64_t v10 = a2;
      uint64_t v11 = a3;
      uint64_t v12 = v6;
      if (v5 < v5 + a4)
      {
        do
        {
          unsigned int v13 = *v10++;
          BOOL v14 = v13 >= v8;
          unsigned int v16 = *v11++;
          unsigned int v15 = v16;
          if (!v14) {
            ++v9;
          }
          unsigned int v9 = (__PAIR64__(v9, v15) - v8) >> 32;
          --v12;
        }
        while (v5 != v12);
      }
      ++v5;
      v7[128] = v9;
      ++v6;
      ++a3;
      ++a2;
    }
    while (v5 != a5);
  }
  return result;
}

unint64_t CMedian::CKernel32x128::IdealTSize(CMedian::CKernel32x128 *this)
{
  uint64_t v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 16);
  }
  else {
    return 0x10000000100;
  }
}

void CMedian::CKernel32x128::~CKernel32x128(CMedian::CKernel32x128 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernel32x128::Process_(CMedian::CKernel32x128 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  unsigned int v7 = (unsigned __int16 *)malloc_type_calloc(0x1F4600uLL, 1uLL, 0xE0D31C87uLL);
  unsigned int v8 = (unsigned int *)(v7 + 434944);
  unsigned int v9 = (unsigned int *)(v7 + 172800);
  unint64_t v10 = v7 + 41728;
  uint64_t v11 = *((void *)a2 + 6);
  uint64_t v12 = *((void *)a2 + 7);
  uint64_t v71 = a2;
  unsigned int v13 = (2 * v11 + 14) & 0xFFFFFFF0;
  BOOL v14 = v7 + 33536;
  unsigned int v15 = v7 + 697088;
  v79[1] = 0;
  v79[2] = v7 + 697088;
  v79[3] = v13;
  long long v80 = xmmword_1A980BA20;
  uint64_t v81 = v11;
  uint64_t v82 = v12;
  uint64_t v83 = 1;
  __int16 v84 = 1;
  v79[0] = &unk_1EFFD4A80;
  v72[1] = 0;
  int v73 = v7 + 828160;
  long long v16 = *((_OWORD *)a3 + 3);
  long long v75 = xmmword_1A980BA20;
  long long v76 = v16;
  uint64_t v74 = (2 * v16 + 14) & 0xFFFFFFF0;
  uint64_t v77 = 1;
  __int16 v78 = 1;
  v72[0] = &unk_1EFFD4A80;
  uint64_t v68 = a3;
  uint64_t v69 = *(unsigned int *)(*((void *)this + 1587) + 36);
  uint64_t v17 = v7 + 37632;
  bzero(v7 + 33536, 0x4000uLL);
  if (v12)
  {
    uint64_t v18 = 0;
    uint64_t v19 = (int *)*((void *)v71 + 2);
    uint64_t v20 = *((void *)v71 + 3);
    do
    {
      if (v11)
      {
        unsigned int v21 = v19;
        uint64_t v22 = v11;
        do
        {
          int v23 = *v21++;
          ++v14[((unsigned __int16)v23 ^ (unsigned __int16)(v23 >> 31)) & 0x7FF];
          --v22;
        }
        while (v22);
      }
      ++v18;
      uint64_t v19 = (int *)((char *)v19 + v20);
    }
    while (v18 != v12);
  }
  uint64_t v24 = 0;
  int v25 = 0;
  do
  {
    int v26 = v14[v24];
    v14[v24] = v25;
    v25 += v26;
    ++v24;
  }
  while (v24 != 2048);
  if (v12)
  {
    uint64_t v27 = 0;
    uint64_t v28 = (int *)*((void *)v71 + 2);
    uint64_t v29 = *((void *)v71 + 3);
    int v30 = v7 + 33536;
    do
    {
      if (v11)
      {
        uint64_t v31 = 0;
        int v32 = v28;
        do
        {
          int v33 = *v32++;
          unsigned int v34 = ((v33 >> 31) | 0x80000000) ^ v33;
          uint64_t v35 = v14[v34 & 0x7FF];
          v14[v34 & 0x7FF] = v35 + 1;
          unsigned int v36 = (v34 >> 11) & 0x7FF;
          ++*(_DWORD *)&v17[2 * v36];
          v30[v35 + 0x2000] = v36;
          *(_DWORD *)&v30[2 * v35 + 139264] = (v27 << 11) | v31++ | v34 & 0xFFC00000;
        }
        while (v11 != v31);
      }
      ++v27;
      uint64_t v28 = (int *)((char *)v28 + v29);
    }
    while (v27 != v12);
  }
  uint64_t v37 = 0;
  int v38 = 0;
  do
  {
    int v39 = *(_DWORD *)&v17[v37];
    *(_DWORD *)&v17[v37] = v38;
    v38 += v39;
    v37 += 2;
  }
  while (v37 != 4096);
  bzero(v14, 0x1000uLL);
  uint64_t v40 = (v12 * v11);
  if (v40)
  {
    uint64_t v41 = (v12 * v11);
    unsigned int v42 = (unsigned int *)(v7 + 172800);
    do
    {
      int v43 = *v10++;
      uint64_t v44 = *(unsigned int *)&v17[2 * v43];
      *(_DWORD *)&v17[2 * v43] = v44 + 1;
      unsigned int v45 = *v42++;
      ++*(_DWORD *)((char *)v14 + (((unint64_t)v45 >> 20) & 0xFFC));
      *(_DWORD *)&v7[2 * v44 + 434944] = v45;
      --v41;
    }
    while (v41);
  }
  uint64_t v46 = 0;
  int v47 = 0;
  do
  {
    int v48 = v14[v46];
    v14[v46] = v47;
    v47 += v48;
    ++v46;
  }
  while (v46 != 2048);
  unsigned int v49 = v69;
  if (v40)
  {
    uint64_t v50 = v40;
    do
    {
      unsigned int v51 = *v8++;
      unint64_t v52 = ((unint64_t)v51 >> 20) & 0xFFC;
      uint64_t v53 = *(unsigned int *)((char *)v14 + v52);
      *(_DWORD *)((char *)v14 + v52) = v53 + 1;
      *(_DWORD *)&v7[2 * v53 + 172800] = v51;
      --v50;
    }
    while (v50);
  }
  uint64_t v54 = *((void *)v71 + 2);
  uint64_t v55 = *((void *)v71 + 3);
  LODWORD(v56) = v69 + 0x10000;
  if (v40 >= (int)v69 + 0x10000) {
    uint64_t v56 = v56;
  }
  else {
    uint64_t v56 = v40;
  }
  if (v69)
  {
    uint64_t v57 = v69;
    do
    {
      unsigned int v58 = *v9++;
      *(unsigned __int16 *)((char *)&v15[v58 & 0x7FF] + v13 * (unint64_t)((v58 >> 11) & 0x7FF)) = 0;
      --v57;
    }
    while (v57);
  }
  if (v56 > v69)
  {
    uint64_t v59 = 0;
    do
    {
      unint64_t v60 = *(unsigned int *)&v7[2 * v69 + 172800 + 2 * v59];
      uint64_t v61 = (v60 >> 11) & 0x7FF;
      uint64_t v62 = v60 & 0x7FF;
      int v63 = *(_DWORD *)(v54 + 4 * v62 + v55 * v61);
      *(unsigned __int16 *)((char *)&v15[v62] + v13 * (unint64_t)v61) = v59;
      *(_DWORD *)&v7[2 * v59++ + 893696] = v63;
    }
    while (v56 - v69 != v59);
    unsigned int v49 = v56;
  }
  if (v49 < v40)
  {
    uint64_t v64 = &v7[2 * v49 + 172800];
    uint64_t v65 = v40 - v49;
    do
    {
      unsigned int v66 = *(_DWORD *)v64;
      v64 += 2;
      *(unsigned __int16 *)((char *)&v15[v66 & 0x7FF] + v13 * (unint64_t)((v66 >> 11) & 0x7FF)) = -1;
      --v65;
    }
    while (v65);
  }
  CMedian::Median16x128_(*((void *)this + 1587), v79, (uint64_t)v72, (uint64_t)v7, 0xFFFFLL);
  CMedian::OrdinalTransform(v73, v74, (uint64_t)v68, (uint64_t)(v7 + 893696));
  free(v7);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v72);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v79);
  return 0;
}

void sub_1A97F71D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va1);
  _Unwind_Resume(a1);
}

unsigned __int16 *CMedian::OrdinalTransform(unsigned __int16 *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(a3 + 56);
  if (*(_DWORD *)(a3 + 56))
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(unsigned int *)(a3 + 48);
    uint64_t v7 = *(_DWORD **)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    do
    {
      uint64_t v9 = result;
      uint64_t v10 = v7;
      for (uint64_t i = v6; i; --i)
      {
        unsigned int v12 = *v9++;
        *v10++ = *(_DWORD *)(a4 + 4 * v12);
      }
      ++v5;
      uint64_t v7 = (_DWORD *)((char *)v7 + v8);
      uint64_t result = (unsigned __int16 *)((char *)result + a2);
    }
    while (v5 != v4);
  }
  return result;
}

unint64_t CMemEnv::Ref2Ptr(CMemEnv *this, unint64_t a2)
{
  return a2 ^ 0xCAFDECAF;
}

uint64_t CMemEnv::Lock(CMemEnv *this, void *a2)
{
  return 0;
}

void CMemEnv::Dispose(CMemEnv *this, void *a2)
{
  uint64_t v4 = (void *)(*(uint64_t (**)(CMemEnv *))(*(void *)this + 56))(this);
  --*((_DWORD *)this + 2);
  if (a2 && v4)
  {
    free(v4);
  }
}

uint64_t CMemEnv::Allocate(CMemEnv *this, size_t size, int a3)
{
  if (!a3)
  {
    uint64_t result = (uint64_t)malloc_type_malloc(size, 0x404686BAuLL);
    if (!result) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(size, 1uLL, 0xEF60B083uLL);
  if (result)
  {
LABEL_5:
    ++*((_DWORD *)this + 2);
    return result ^ 0xCAFDECAFLL;
  }
  return result;
}

uint64_t CMemEnv::Valid(CMemEnv *this)
{
  return 1;
}

void CMemEnv::~CMemEnv(void *this)
{
}

void CMemEnv::~CMemEnv(CMemEnv *this)
{
  *(void *)this = &unk_1EFFD4BE8;
}

uint64_t CKernel::Process(CKernel *this, const CGrNavigator *a2, const CGrNavigator *a3, const CGrNavigator *a4)
{
  int v8 = *((_DWORD *)a2 + 12);
  int v9 = *((_DWORD *)a2 + 14);
  unsigned int v10 = *((_DWORD *)a3 + 12);
  unsigned int v11 = *((_DWORD *)a3 + 14);
  uint64_t v12 = (*(uint64_t (**)(CKernel *))(*(void *)this + 24))(this);
  int v13 = 16 * v12;
  BOOL v14 = 16 * (int)v12 >= v10 && 16 * HIDWORD(v12) >= v11;
  uint64_t v83 = a2;
  __int16 v84 = a4;
  unsigned int v80 = v11;
  if (!v14)
  {
    if (v11)
    {
      uint64_t v82 = a3;
      unsigned int v15 = 0;
      int v78 = v9 - v11;
      int v79 = 16 * HIDWORD(v12);
      unsigned int v81 = v13 + v8 - v10;
      while (1)
      {
        unsigned int v16 = 0;
        unsigned int v17 = v15 + v79;
        uint64_t v18 = v12;
        while (v16 < v10)
        {
          unsigned int v19 = v16 + v13;
          unint64_t v102 = __PAIR64__(v15, v16);
          int v103 = v16 + v13;
          unsigned int v104 = v15 + v79;
          unint64_t v99 = __PAIR64__(v15, v16);
          unsigned int v100 = v81 + v16;
          int v101 = v78 + v15 + v79;
          CGrNavigator::CGrNavigator((uint64_t)v95, (uint64_t)v82, (int32x2_t *)&v102);
          *(int32x2_t *)&double v20 = CGrNavigator::CGrNavigator((uint64_t)v91, (uint64_t)v83, (int32x2_t *)&v99);
          if (a4)
          {
            *(int32x2_t *)&double v21 = CGrNavigator::CGrNavigator((uint64_t)v87, (uint64_t)a4, (int32x2_t *)&v102);
            uint64_t v22 = (*(uint64_t (**)(CKernel *, unsigned char *, unsigned char *, unsigned char *, double))(*(void *)this + 32))(this, v91, v95, v87, v21);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v87);
            if (!v22) {
              goto LABEL_14;
            }
            char v23 = 0;
            uint64_t v18 = v22;
          }
          else
          {
            uint64_t v24 = (*(uint64_t (**)(CKernel *, unsigned char *, unsigned char *, void, double))(*(void *)this + 32))(this, v91, v95, 0, v20);
            if (!v24)
            {
LABEL_14:
              char v23 = 1;
              goto LABEL_15;
            }
            char v23 = 0;
            uint64_t v18 = v24;
          }
LABEL_15:
          CGrNavigator::~CGrNavigator((CGrNavigator *)v91);
          CGrNavigator::~CGrNavigator((CGrNavigator *)v95);
          unsigned int v16 = v19;
          a4 = v84;
          if ((v23 & 1) == 0) {
            return v18;
          }
        }
        uint64_t v12 = v18;
        v15 += v79;
        uint64_t v18 = 0;
        if (v17 >= v80) {
          return v18;
        }
      }
    }
    return 0;
  }
  int v25 = *((unsigned __int8 *)this + 33);
  if (*((unsigned char *)this + 33))
  {
    uint64_t v26 = *((void *)a2 + 3) | *((void *)a2 + 2) | *((void *)a2 + 5);
    unint64_t v27 = v26 & -v26;
    uint64_t v28 = *((void *)a3 + 3) | *((void *)a3 + 2) | *((void *)a3 + 5);
    BOOL v29 = (v28 & (unint64_t)-v28) >= 0x10 && v27 >= 0x10;
    int v25 = !v29;
    if (a4)
    {
      uint64_t v30 = *((void *)a4 + 3) | *((void *)a4 + 2) | *((void *)a4 + 5);
      if ((v30 & (unint64_t)-v30) < 0x10) {
        int v25 = 1;
      }
    }
  }
  unint64_t v31 = *((void *)a3 + 6);
  unint64_t v32 = *((unsigned int *)this + 6);
  unint64_t v33 = *((unsigned int *)this + 7);
  if (v31 % v33) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = v31 >= v32;
  }
  if (!v34 || v25 != 0)
  {
    if (v31 <= v32) {
      LODWORD(v36) = *((_DWORD *)this + 6);
    }
    else {
      uint64_t v36 = *((void *)a3 + 6);
    }
    if (v36 % v33) {
      uint64_t v37 = (v33 + v36 - 1) & -(int)v33;
    }
    else {
      uint64_t v37 = v36;
    }
    CGrNavigator::CGrNavigator((CGrNavigator *)v95, *((CMemEnv **)this + 2), v37 - v31 + *((void *)a2 + 6), *((void *)a2 + 7), *((void *)a2 + 4));
    CGrNavigator::CGrNavigator((CGrNavigator *)v91, *((CMemEnv **)this + 2), v37, *((void *)a3 + 7), *((void *)a3 + 4));
    uint64_t v38 = 7;
    if (v98 && v94)
    {
      uint64_t v39 = *((void *)a3 + 6);
      uint64_t v40 = *((void *)a3 + 4);
      if (*((void *)a2 + 7))
      {
        uint64_t v41 = 0;
        size_t v42 = (*((_DWORD *)a2 + 8) * *((_DWORD *)a2 + 12));
        unsigned int v43 = 1;
        do
        {
          memcpy((void *)(v96 + v97 * v41), (const void *)(*((void *)a2 + 2) + *((void *)a2 + 3) * v41), v42);
          uint64_t v41 = v43;
          BOOL v44 = *((void *)a2 + 7) > (unint64_t)v43++;
        }
        while (v44);
      }
      unsigned int v45 = v40 * v39;
      if (*((unsigned char *)this + 32) && *((void *)a3 + 7))
      {
        uint64_t v46 = 0;
        unsigned int v47 = 1;
        do
        {
          memcpy((void *)(v92 + v93 * v46), (const void *)(*((void *)a3 + 2) + *((void *)a3 + 3) * v46), v45);
          uint64_t v46 = v47;
          BOOL v44 = *((void *)a3 + 7) > (unint64_t)v47++;
        }
        while (v44);
      }
      if (v84)
      {
        CGrNavigator::CGrNavigator((CGrNavigator *)v87, *((CMemEnv **)this + 2), v37, *((void *)v84 + 7), *((void *)v84 + 4));
        if (v90)
        {
          if (*((void *)v84 + 7))
          {
            uint64_t v48 = 0;
            size_t v49 = (*((_DWORD *)v84 + 8) * *((_DWORD *)v84 + 12));
            unsigned int v50 = 1;
            do
            {
              memcpy((void *)(v88 + v89 * v48), (const void *)(*((void *)v84 + 2) + *((void *)v84 + 3) * v48), v49);
              uint64_t v48 = v50;
              BOOL v44 = *((void *)v84 + 7) > (unint64_t)v50++;
            }
            while (v44);
          }
          uint64_t v38 = (*(uint64_t (**)(CKernel *, unsigned char *, unsigned char *, unsigned char *))(*(void *)this + 32))(this, v95, v91, v87);
          if (!v38)
          {
            CGrNavigator::~CGrNavigator((CGrNavigator *)v87);
LABEL_85:
            if (*((void *)a3 + 7))
            {
              uint64_t v75 = 0;
              unsigned int v76 = 1;
              do
              {
                memcpy((void *)(*((void *)a3 + 2) + *((void *)a3 + 3) * v75), (const void *)(v92 + v93 * v75), v45);
                uint64_t v75 = v76;
                BOOL v44 = *((void *)a3 + 7) > (unint64_t)v76++;
              }
              while (v44);
            }
            uint64_t v38 = 0;
            goto LABEL_91;
          }
        }
        else
        {
          uint64_t v38 = 7;
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v87);
      }
      else
      {
        uint64_t v38 = (*(uint64_t (**)(CKernel *, unsigned char *, unsigned char *, void))(*(void *)this + 32))(this, v95, v91, 0);
        if (!v38) {
          goto LABEL_85;
        }
      }
    }
LABEL_91:
    uint64_t v18 = v38;
    CGrNavigator::~CGrNavigator((CGrNavigator *)v91);
    CGrNavigator::~CGrNavigator((CGrNavigator *)v95);
    return v18;
  }
  unsigned int v51 = v10 + v12 - 1;
  unsigned int v52 = v51 / v12;
  unsigned int v53 = (v11 - 1 + HIDWORD(v12)) / HIDWORD(v12);
  uint64_t v54 = v53 * (v51 / v12);
  *((_DWORD *)this + 16) = v54;
  if (!__CFADD__(v11 - 1, HIDWORD(v12)))
  {
    int v55 = 0;
    unsigned int v56 = (v9 - v11) & 0xFFFFFFFE;
    if (v52 <= 1) {
      uint64_t v57 = 1;
    }
    else {
      uint64_t v57 = v52;
    }
    if (v53 <= 1) {
      unsigned int v53 = 1;
    }
    do
    {
      if (v51 >= v12)
      {
        int v58 = 0;
        int v59 = 0;
        int v60 = v55 * HIDWORD(v12) + HIDWORD(v12);
        if (v60 >= (int)v80) {
          int v60 = v80;
        }
        uint64_t v61 = v57;
        do
        {
          uint64_t v62 = v55 * v52 + v59;
          if ((int)v32 + v58 <= v10) {
            int v63 = v58;
          }
          else {
            int v63 = v10 - v32;
          }
          signed int v64 = v63 + v12;
          int v65 = v63 & ~(v63 >> 31);
          if (v64 >= (int)v10) {
            signed int v64 = v10;
          }
          unsigned int v66 = (char *)this + 16 * v62;
          *((_DWORD *)v66 + 2066) = v65;
          *((_DWORD *)v66 + 2067) = (v55 * HIDWORD(v12)) & ~((v55 * HIDWORD(v12)) >> 31);
          *((_DWORD *)v66 + 2068) = v64;
          *((_DWORD *)v66 + 2069) = v60;
          *(_OWORD *)(v66 + 4168) = *(_OWORD *)(v66 + 8264);
          int v67 = *((_DWORD *)v66 + 1045);
          *((_DWORD *)v66 + 1044) += (v8 - v10) & 0xFFFFFFFE;
          *((_DWORD *)v66 + 1045) = v67 + v56;
          *((unsigned char *)this + v62 + 12360) = 0;
          ++v59;
          v58 += v12;
          --v61;
        }
        while (v61);
      }
      ++v55;
    }
    while (v55 != v53);
  }
  if (v54)
  {
    uint64_t v68 = 0;
    *((void *)this + 5) = v83;
    *((void *)this + 6) = a3;
    uint64_t v69 = (_DWORD *)((char *)this + 80);
    *((void *)this + 7) = v84;
    do
    {
      *((void *)v69 - 1) = this;
      *uint64_t v69 = v68;
      v69 += 4;
      ++v68;
    }
    while (v54 != v68);
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_group_t v71 = dispatch_group_create();
    if (v71)
    {
      int v72 = v71;
      if (*((_DWORD *)this + 16))
      {
        unsigned int v73 = 0;
        uint64_t v74 = MEMORY[0x1E4F143A8];
        do
        {
          block[0] = v74;
          block[1] = 0x40000000;
          block[2] = ___ZN7CKernel7ProcessERK12CGrNavigatorS2_PS1__block_invoke;
          block[3] = &__block_descriptor_tmp;
          block[4] = this;
          unsigned int v86 = v73;
          dispatch_group_async(v72, global_queue, block);
          ++v73;
        }
        while (v73 < *((_DWORD *)this + 16));
      }
      dispatch_group_wait(v72, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v72);
    }
  }
  return 0;
}

void sub_1A97F7A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a30);
  CGrNavigator::~CGrNavigator((CGrNavigator *)(v30 - 216));
  _Unwind_Resume(a1);
}

void ___ZN7CKernel7ProcessERK12CGrNavigatorS2_PS1__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 16 * *(unsigned int *)(a1 + 40);
  uint64_t v2 = *(unsigned int *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = (unsigned char *)(v3 + v2 + 12360);
  if (!*v4)
  {
    *uint64_t v4 = 1;
    uint64_t v5 = (int32x2_t *)(v3 + 16 * v2);
    CGrNavigator::CGrNavigator((uint64_t)v12, *(void *)(v3 + 40), v5 + 521);
    uint64_t v6 = v5 + 1033;
    *(int32x2_t *)&double v7 = CGrNavigator::CGrNavigator((uint64_t)v11, *(void *)(v3 + 48), v6);
    uint64_t v8 = *(void *)(v3 + 56);
    if (v8)
    {
      *(int32x2_t *)&double v9 = CGrNavigator::CGrNavigator((uint64_t)v10, v8, v6);
      (**(void (***)(uint64_t, unsigned char *, unsigned char *, void, unsigned char *, double))v3)(v3, v12, v11, 0, v10, v9);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v10);
    }
    else
    {
      (**(void (***)(uint64_t, unsigned char *, unsigned char *, void, void, double))v3)(v3, v12, v11, 0, 0, v7);
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v11);
    CGrNavigator::~CGrNavigator((CGrNavigator *)v12);
  }
}

void sub_1A97F7BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)(v11 - 112));
  _Unwind_Resume(a1);
}

uint64_t CKernel::IdealTSize(CKernel *this)
{
  return 0x16000000160;
}

uint64_t CKernel::Process_(CKernel *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v5 = *((void *)a3 + 6);
  uint64_t v6 = *((void *)a3 + 7);
  uint64_t v7 = v6;
  unint64_t v8 = (*((_DWORD *)a2 + 12) - v5);
  unsigned int v9 = (*((_DWORD *)a2 + 14) - v6) >> 1;
  uint64_t v10 = *((void *)a3 + 4);
  if (v10 == 1)
  {
    if (v6)
    {
      uint64_t v22 = 0;
      unint64_t v23 = v8 >> 1;
      do
      {
        if (v5)
        {
          uint64_t v24 = 0;
          do
          {
            *(unsigned char *)(*((void *)a3 + 2) + *((void *)a3 + 3) * v22 + *((void *)a3 + 4) * v24) = ~*(unsigned char *)(*((void *)a2 + 2) + *((void *)a2 + 3) * (v9 + v22) + *((void *)a2 + 4) * (v23 + v24));
            ++v24;
          }
          while (v5 != v24);
        }
        ++v22;
      }
      while (v22 != v7);
    }
  }
  else
  {
    unsigned int v11 = v8 >> 1;
    if (v10 == 2)
    {
      if (v6)
      {
        uint64_t v25 = 0;
        uint64_t v26 = *((void *)a2 + 2);
        uint64_t v27 = *((void *)a2 + 3);
        uint64_t v28 = *((void *)a2 + 4);
        BOOL v29 = (_WORD *)*((void *)a3 + 2);
        uint64_t v30 = *((void *)a3 + 3);
        do
        {
          if (v5)
          {
            unsigned int v31 = v11;
            unint64_t v32 = v29;
            uint64_t v33 = v5;
            do
            {
              *v32++ = 0x8000 - *(_WORD *)(v26 + v27 * (v9 + v25) + v28 * v31++);
              --v33;
            }
            while (v33);
          }
          ++v25;
          BOOL v29 = (_WORD *)((char *)v29 + v30);
        }
        while (v25 != v7);
      }
    }
    else if (v10 == 4 && v6 != 0)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *((void *)a2 + 2);
      uint64_t v15 = *((void *)a2 + 3);
      uint64_t v16 = *((void *)a2 + 4);
      uint64_t v18 = (float *)*((void *)a3 + 2);
      uint64_t v17 = *((void *)a3 + 3);
      do
      {
        if (v5)
        {
          unsigned int v19 = v11;
          double v20 = v18;
          uint64_t v21 = v5;
          do
          {
            *v20++ = 1.0 - *(float *)(v14 + v15 * (v9 + v13) + v16 * v19++);
            --v21;
          }
          while (v21);
        }
        ++v13;
        uint64_t v18 = (float *)((char *)v18 + v17);
      }
      while (v13 != v7);
    }
  }
  return 0;
}

void CKernel::~CKernel(CKernel *this)
{
  *(void *)this = &unk_1EFFD4BB0;
  freeDataNodes(*((void *)this + 1577));
  *((void *)this + 1577) = 0;
  freeDataNodes(*((void *)this + 1578));
  *((void *)this + 1578) = 0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 12632));
  *((unsigned char *)this + 8) = 0;
}

uint64_t freeDataNodes(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    do
    {
      uint64_t v2 = (void *)v1[1];
      if (*v1) {
        (*(void (**)(void))(*(void *)*v1 + 8))(*v1);
      }
      uint64_t result = MEMORY[0x1AD0F8810](v1, 0x20C40A4A59CD2);
      uint64_t v1 = v2;
    }
    while (v2);
  }
  return result;
}

uint64_t CKernel::BorrowData(CKernel *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 12632);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 12632));
  uint64_t v3 = (void *)*((void *)this + 1577);
  if (!v3) {
    operator new();
  }
  *((void *)this + 1577) = v3[1];
  v3[1] = 0;
  uint64_t v4 = *((void *)this + 1578);
  if (v4)
  {
    do
    {
      uint64_t v5 = v4;
      uint64_t v4 = *(void *)(v4 + 8);
    }
    while (v4);
    uint64_t v6 = (void *)(v5 + 8);
  }
  else
  {
    uint64_t v6 = (void *)((char *)this + 12624);
  }
  *uint64_t v6 = v3;
  if (*v3)
  {
    (*(void (**)(void))(*(void *)*v3 + 80))(*v3);
    uint64_t v7 = *v3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  pthread_mutex_unlock(v2);
  return v7;
}

void sub_1A97F7F68(_Unwind_Exception *a1)
{
  CBaseRef::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t CKernel::ReturnData(CKernel *this, CMemBlock *a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 12632);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 12632));
  uint64_t v5 = *((void *)this + 1578);
  if (v5)
  {
    if (*(CMemBlock **)v5 == a2)
    {
      *((void *)this + 1578) = *(void *)(v5 + 8);
      *(void *)(v5 + 8) = 0;
      a2 = *(CMemBlock **)v5;
      if (*(void *)v5) {
LABEL_8:
      }
        (*(void (**)(CMemBlock *))(*(void *)a2 + 88))(a2);
LABEL_9:
      uint64_t v7 = *((void *)this + 1577);
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = *(void *)(v7 + 8);
        }
        while (v7);
        unsigned int v9 = (void *)(v8 + 8);
      }
      else
      {
        unsigned int v9 = (void *)((char *)this + 12616);
      }
      *unsigned int v9 = v5;
    }
    else
    {
      while (1)
      {
        uint64_t v6 = v5;
        uint64_t v5 = *(void *)(v5 + 8);
        if (!v5) {
          break;
        }
        if (*(CMemBlock **)v5 == a2)
        {
          *(void *)(v6 + 8) = *(void *)(v5 + 8);
          *(void *)(v5 + 8) = 0;
          if (a2) {
            goto LABEL_8;
          }
          goto LABEL_9;
        }
      }
    }
  }
  return pthread_mutex_unlock(v4);
}

unint64_t CMedian::CKernel8C::IdealTSize(CMedian::CKernel8C *this)
{
  uint64_t v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 8);
  }
  else {
    return 0x10000000100;
  }
}

uint64_t CMedian::CKernel8C::Process_(CMedian::CKernel8C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, int64x2_t *a5)
{
  unsigned int v9 = this;
  uint64_t v339 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = CKernel::BorrowData(this);
  if (!v10) {
    return 7;
  }
  unsigned int v11 = (CMemBlock *)v10;
  uint64_t v12 = (unsigned __int16 *)(*(void *)(v10 + 32) + 576 * a4);
  uint64_t v13 = *((void *)v9 + 1587);
  if (*(unsigned char *)(v13 + 46) && a5 && *(unsigned char *)(v13 + 47))
  {
    uint64_t v14 = *((void *)a2 + 2);
    uint64_t v332 = 0;
    uint64_t v333 = v14;
    long long v334 = *(_OWORD *)((char *)a2 + 24);
    long long v335 = *(_OWORD *)((char *)a2 + 40);
    long long v336 = *(_OWORD *)((char *)a2 + 56);
    char v337 = *((unsigned char *)a2 + 72);
    char v338 = 0;
    int64x2_t v331 = &unk_1EFFD4A60;
    uint64_t v15 = *((void *)a3 + 2);
    uint64_t v324 = 0;
    uint64_t v325 = v15;
    long long v16 = *(_OWORD *)((char *)a3 + 40);
    long long v326 = *(_OWORD *)((char *)a3 + 24);
    long long v327 = v16;
    long long v17 = *(_OWORD *)((char *)a3 + 56);
    long long v328 = v17;
    char v329 = *((unsigned char *)a3 + 72);
    char v330 = 0;
    v323 = &unk_1EFFD4AA0;
    uint64_t v18 = a5[1].i64[1];
    float v318 = (unsigned __int8 *)a5[1].i64[0];
    *(void *)float v319 = v18;
    int64x2_t v19 = vshrq_n_s64(vshlq_n_s64(a5[3], 0x20uLL), 0x20uLL);
    *(int64x2_t *)&v319[8] = a5[2];
    *(int64x2_t *)&v319[24] = v19;
    *(void *)&v319[40] = a5[4].i64[0];
    __int16 v320 = 1;
    float v316 = &unk_1EFFD4A60;
    uint64_t v317 = 0;
    unsigned int v287 = DWORD2(v16) - 1;
    uint64_t v20 = *v318;
    unsigned int v21 = *(unsigned __int16 *)(v13 + 2 * v20 + 822);
    int v22 = *(unsigned __int8 *)(v13 + v20 + 53);
    uint64_t v23 = *(void *)(v13 + 16);
    if (v23) {
      uint64_t v24 = *(void *)(v23 + 32);
    }
    else {
      uint64_t v24 = 0;
    }
    int v144 = v17;
    uint64_t v279 = v13;
    int v145 = *(_DWORD *)(v13 + 24);
    bzero(v12, 0x240uLL);
    int v146 = v145;
    unsigned int v147 = v12 + 16;
    v308[0] = 0;
    unsigned int v322 = v21;
    uint64_t v148 = v20;
    uint64_t v149 = v24 + (v20 << 7);
    int v150 = -v22;
    uint64_t v151 = v333;
    uint64_t v152 = v334;
    do
    {
      if (v150 >= 0) {
        unsigned int v153 = v150;
      }
      else {
        unsigned int v153 = -v150;
      }
      int v154 = *(unsigned __int8 *)(v149 + v153) - 1;
      float32x2_t v155 = (unsigned __int8 *)(v151 + v152 * (v150 + v146) + (v146 - v154));
      if (v155)
      {
        uint64_t v156 = (2 * v154) | 1u;
        do
        {
          int v157 = *v155++;
          ++v147[v157];
          --v156;
        }
        while (v156);
      }
      BOOL v227 = v150++ == v22;
    }
    while (!v227);
    unsigned int v278 = v21;
    unsigned int v281 = v11;
    float v283 = v9;
    LODWORD(v158) = 0;
    int v159 = 0;
    int v160 = v146 - 1;
    int v161 = v146 + 1;
    uint64_t v275 = v24 + 1;
    uint64_t v162 = v287;
    int v163 = 1;
    uint64_t v164 = v279;
    uint64_t v277 = v24;
LABEL_73:
    v284 = (unsigned char *)(v164 + v148 + 1334);
    uint64_t v296 = v148;
    uint64_t v165 = v24 + (v148 << 7);
    int v293 = -v22;
    uint64_t v158 = (int)v158;
    int v291 = (2 * v22) | 1;
    unsigned int v166 = v160 + v158;
    for (unsigned int i = v161 + v158; ; ++i)
    {
      uint64_t v168 = v325;
      long long v169 = v326;
      if (v296)
      {
        int v170 = v159;
        unsigned int v302 = i;
        unsigned int v303 = v166;
        uint64_t v171 = v158;
        unsigned int v299 = v162;
        int v172 = Hist8CRead_(v147, v308, (int *)&v322);
        if (*v284)
        {
          int v159 = v170;
          uint64_t v158 = v171;
          v172 += ((*(unsigned __int8 *)(v151 + (v170 + v146) + v152 * (v146 + v171)) - v172)
                 * *v284) >> 8;
        }
        else
        {
          uint64_t v158 = v171;
          int v159 = v170;
        }
        uint64_t v162 = v299;
        unsigned int v166 = v303;
        unsigned int i = v302;
      }
      else
      {
        LOBYTE(v172) = *(unsigned char *)(v151 + (v159 + v146) + v152 * (v146 + v158));
      }
      *(unsigned char *)(*((void *)&v169 + 1) * v159 + v168 + v169 * v158) = v172;
      if (v159 != v162)
      {
        int v182 = v159 - (v163 == -1);
        if (v163 < 1)
        {
          uint64_t v183 = v318[v182 + *(void *)v319 * v158];
          uint64_t v184 = v296;
          uint64_t v186 = v183;
          uint64_t v185 = v183;
        }
        else
        {
          uint64_t v183 = v318[v182 + 1 + *(void *)v319 * v158];
          uint64_t v184 = v183;
          uint64_t v185 = v296;
          uint64_t v186 = v296;
          uint64_t v296 = v183;
        }
        unsigned int v187 = *(unsigned __int16 *)(v279 + 2 * v183 + 822);
        int v307 = *(unsigned __int8 *)(v279 + v183 + 53);
        unsigned int v188 = v322 - v278 + v187;
        int v276 = v158;
        if (*(unsigned __int16 *)(v279 + 310 + 2 * v186) != *(unsigned __int16 *)(v279 + 310 + 2 * v184))
        {
          uint64_t v194 = v162;
          uint64_t v304 = v183;
          uint64_t v211 = v277 + (v185 << 7);
          unsigned int v212 = *(unsigned __int8 *)(v279 + 53 + v184);
          int v213 = v146 + v158;
          uint64_t v151 = v333;
          uint64_t v152 = v334;
          uint64_t v214 = v333 + (v182 + v146);
          unsigned int v215 = v308[0];
          if (v212 <= *(unsigned __int8 *)(v279 + 53 + v186)) {
            uint64_t v216 = *(unsigned __int8 *)(v279 + 53 + v186);
          }
          else {
            uint64_t v216 = v212;
          }
          while (1)
          {
            uint64_t v217 = *(unsigned __int8 *)(v211 + v216);
            uint64_t v218 = *(unsigned __int8 *)(v277 + (v296 << 7) + v216);
            uint64_t v219 = v214 + v152 * (v213 - v216);
            uint64_t v220 = v214 + v152 * (v213 + v216);
            if (*(unsigned char *)(v211 + v216))
            {
              uint64_t v221 = 1 - v217;
              if (*(unsigned char *)(v277 + (v296 << 7) + v216))
              {
                int v222 = 2 - v218;
                if (v221 != 2 - v218)
                {
                  if ((int)v221 >= v222) {
                    int v223 = 2 - v218;
                  }
                  else {
                    int v223 = 1 - v217;
                  }
                  if ((int)v221 <= v222) {
                    int v224 = 2 - v218;
                  }
                  else {
                    int v224 = 1 - v217;
                  }
                  if ((int)v221 <= v222) {
                    int v225 = -v163;
                  }
                  else {
                    int v225 = v163;
                  }
                  unsigned int v226 = v224 - v223;
                  BOOL v227 = v224 == v223 || v219 == 0;
                  if (!v227)
                  {
                    unsigned int v228 = (unsigned __int8 *)(v219 + v223);
                    uint64_t v229 = -(uint64_t)v226;
                    do
                    {
                      int v230 = *v228++;
                      v188 -= v225 & ((int)(v230 - v215) >> 31);
                      v147[v230] += v225;
                      BOOL v231 = __CFADD__(v229++, 1);
                    }
                    while (!v231);
                  }
                  if (v216 >= 1 && v224 != v223 && v220)
                  {
                    unint64_t v232 = (unsigned __int8 *)(v220 + v223);
                    uint64_t v233 = -(uint64_t)v226;
                    do
                    {
                      int v234 = *v232++;
                      v188 -= v225 & ((int)(v234 - v215) >> 31);
                      v147[v234] += v225;
                      BOOL v231 = __CFADD__(v233++, 1);
                    }
                    while (!v231);
                  }
                }
                unsigned int v248 = v218 + 1;
                if (v218 + 1 != v217)
                {
                  uint64_t v249 = v248 >= v217 ? v217 : v248;
                  int v250 = v248 <= v217 ? v217 : v248;
                  int v251 = v248 >= v217 ? v163 : -v163;
                  if (v250 != v249)
                  {
                    int v252 = (unsigned __int8 *)(v219 + v249);
                    uint64_t v253 = (v250 - v249);
                    uint64_t v254 = v253;
                    do
                    {
                      int v255 = *v252++;
                      v188 -= v251 & ((int)(v255 - v215) >> 31);
                      v147[v255] += v251;
                      --v254;
                    }
                    while (v254);
                    if (v216 < 1) {
                      goto LABEL_160;
                    }
                    unint64_t v256 = (unsigned __int8 *)(v220 + v249);
                    do
                    {
                      int v257 = *v256++;
                      v188 -= v251 & ((int)(v257 - v215) >> 31);
                      v147[v257] += v251;
                      --v253;
                    }
                    while (v253);
                  }
                }
              }
              else
              {
                uint64_t v242 = (2 * v217 - 1);
                if (v219)
                {
                  uint64_t v243 = (unsigned __int8 *)(v219 + v221);
                  uint64_t v244 = v242;
                  do
                  {
                    int v245 = *v243++;
                    v188 += v163 & ((int)(v245 - v215) >> 31);
                    v147[v245] -= v163;
                    --v244;
                  }
                  while (v244);
                }
                if (v216 < 1) {
                  goto LABEL_160;
                }
                if (v220)
                {
                  float v246 = (unsigned __int8 *)(v220 + v221);
                  do
                  {
                    int v247 = *v246++;
                    v188 += v163 & ((int)(v247 - v215) >> 31);
                    v147[v247] -= v163;
                    --v242;
                  }
                  while (v242);
                }
              }
            }
            else
            {
              uint64_t v235 = 2 - v218;
              uint64_t v236 = (2 * v218 - 1);
              if (v219)
              {
                float32x2_t v237 = (unsigned __int8 *)(v219 + v235);
                uint64_t v238 = (2 * v218 - 1);
                do
                {
                  int v239 = *v237++;
                  v188 -= v163 & ((int)(v239 - v215) >> 31);
                  v147[v239] += v163;
                  --v238;
                }
                while (v238);
              }
              if (v216 < 1)
              {
LABEL_160:
                unsigned int v322 = v188;
                uint64_t v148 = v304;
                goto LABEL_165;
              }
              if (v220)
              {
                uint64_t v240 = (unsigned __int8 *)(v220 + v235);
                do
                {
                  int v241 = *v240++;
                  v188 -= v163 & ((int)(v241 - v215) >> 31);
                  v147[v241] += v163;
                  --v236;
                }
                while (v236);
              }
            }
            if (v216-- <= 0) {
              goto LABEL_160;
            }
          }
        }
        uint64_t v189 = v183 << 7;
        uint64_t v151 = v333;
        uint64_t v152 = v334;
        unsigned int v190 = v308[0];
        int v191 = v182 + v146;
        int v192 = v182 + v146 + 1;
        uint64_t v193 = (v146 + v158);
        uint64_t v194 = v162;
        uint64_t v148 = v183;
        if (v163 == 1)
        {
          uint64_t v195 = *(unsigned __int8 *)(v279 + v183 + 53);
          if (v307)
          {
            uint64_t v196 = (unsigned __int8 *)(v275 + v189);
            do
            {
              int v197 = *v196++;
              uint64_t v198 = v152 * i;
              uint64_t v199 = (v192 - v197) + v151;
              uint64_t v200 = (v191 + v197) + v151;
              uint64_t v201 = *(unsigned __int8 *)(v200 + v198);
              uint64_t v202 = *(unsigned __int8 *)(v199 + v198);
              ++v147[v201];
              unsigned int v203 = v202 - v190;
              --v147[v202];
              uint64_t v204 = v152 * v166;
              uint64_t v205 = *(unsigned __int8 *)(v200 + v204);
              uint64_t v206 = *(unsigned __int8 *)(v199 + v204);
              ++v147[v205];
              v188 += ((int)(v201 - v190) >> 31)
                    + (v203 >> 31)
                    + ((v206 - v190) >> 31)
                    + ((int)(v205 - v190) >> 31);
              --v147[v206];
              --v166;
              ++i;
              --v195;
            }
            while (v195);
          }
          int v207 = *(unsigned __int8 *)(v277 + v189);
          uint64_t v208 = v151 + v152 * v193;
          uint64_t v209 = *(unsigned __int8 *)(v208 + (v192 - v207));
          uint64_t v210 = *(unsigned __int8 *)(v208 + (v191 + v207));
          LODWORD(v208) = v210 - v190;
          ++v147[v210];
          LOWORD(v210) = v147[v209];
          unsigned int v322 = v188 + ((int)v208 >> 31) + ((v209 - v190) >> 31);
          v147[v209] = v210 - 1;
        }
        else
        {
          uint64_t v259 = *(unsigned __int8 *)(v279 + v183 + 53);
          if (v307)
          {
            uint64_t v260 = (unsigned __int8 *)(v275 + v189);
            do
            {
              int v261 = *v260++;
              uint64_t v262 = v152 * i;
              uint64_t v263 = (v192 - v261) + v151;
              uint64_t v264 = *(unsigned __int8 *)(v263 + v262);
              uint64_t v265 = (v191 + v261) + v151;
              uint64_t v266 = *(unsigned __int8 *)(v265 + v262);
              ++v147[v264];
              unsigned int v267 = v266 - v190;
              --v147[v266];
              uint64_t v268 = v152 * v166;
              uint64_t v269 = *(unsigned __int8 *)(v263 + v268);
              uint64_t v270 = *(unsigned __int8 *)(v265 + v268);
              ++v147[v269];
              v188 += ((int)(v264 - v190) >> 31)
                    + (v267 >> 31)
                    + ((int)(v269 - v190) >> 31)
                    + ((v270 - v190) >> 31);
              --v147[v270];
              --v166;
              ++i;
              --v259;
            }
            while (v259);
          }
          int v271 = *(unsigned __int8 *)(v277 + v189);
          uint64_t v272 = v151 + v152 * v193;
          uint64_t v273 = *(unsigned __int8 *)(v272 + (v192 - v271));
          uint64_t v274 = *(unsigned __int8 *)(v272 + (v191 + v271));
          ++v147[v273];
          LOWORD(v271) = v147[v274];
          unsigned int v322 = v188 + ((int)(v273 - v190) >> 31) + ((v274 - v190) >> 31);
          v147[v274] = v271 - 1;
        }
LABEL_165:
        unsigned int v278 = v187;
        if (v163 == 1) {
          int v159 = v182 + 1;
        }
        else {
          int v159 = v182;
        }
        uint64_t v164 = v279;
        LODWORD(v158) = v276;
        uint64_t v24 = v277;
        int v161 = v146 + 1;
        int v160 = v146 - 1;
        int v22 = v307;
        uint64_t v162 = v194;
        goto LABEL_73;
      }
      if (v158 + 1 >= v144) {
        break;
      }
      unsigned int v173 = v322;
      uint64_t v151 = v333;
      uint64_t v152 = v334;
      unsigned int v174 = v308[0];
      int v175 = v291;
      int v176 = v293;
      do
      {
        if (v176 >= 0) {
          unsigned int v177 = v176;
        }
        else {
          unsigned int v177 = -v176;
        }
        int v178 = *(unsigned __int8 *)(v165 + v177);
        uint64_t v179 = v151 + (v146 + v162 + v176);
        uint64_t v180 = *(unsigned __int8 *)(v152 * (v146 + v158 + 1 - v178) + v179);
        uint64_t v181 = *(unsigned __int8 *)(v152 * (v146 + v158 + v178) + v179);
        ++v147[v181];
        v173 += ((int)(v181 - v174) >> 31) + ((v180 - v174) >> 31);
        --v147[v180];
        ++v176;
        --v175;
      }
      while (v175);
      unsigned int v322 = v173;
      int v163 = -v163;
      int v159 = v162;
      uint64_t v162 = v287 - v162;
      ++v166;
      ++v158;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v316);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v323);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v331);
    unsigned int v11 = v281;
    unsigned int v9 = v283;
  }
  else
  {
    uint64_t v25 = (unsigned __int8 *)*((void *)a2 + 2);
    uint64_t v317 = 0;
    float v318 = v25;
    *(_OWORD *)float v319 = *(_OWORD *)((char *)a2 + 24);
    *(_OWORD *)&v319[16] = *(_OWORD *)((char *)a2 + 40);
    *(_OWORD *)&v319[32] = *(_OWORD *)((char *)a2 + 56);
    __int16 v320 = *((unsigned __int8 *)a2 + 72);
    float v316 = &unk_1EFFD4A60;
    uint64_t v26 = *((void *)a3 + 2);
    uint64_t v309 = 0;
    uint64_t v310 = v26;
    long long v27 = *(_OWORD *)((char *)a3 + 40);
    long long v311 = *(_OWORD *)((char *)a3 + 24);
    long long v312 = v27;
    long long v313 = *(_OWORD *)((char *)a3 + 56);
    char v314 = *((unsigned char *)a3 + 72);
    char v315 = 0;
    *(void *)float v308 = &unk_1EFFD4AA0;
    int v28 = v313;
    uint64_t v29 = *(void *)v319;
    int v30 = DWORD2(v27);
    if (*(unsigned char *)(v13 + 48))
    {
      uint64_t v31 = (2 * *(_DWORD *)(v13 + 24)) | 1u;
      if (v31 <= 0xFF)
      {
        bzero(&v331, 0x400uLL);
        bzero(&v323, 0x400uLL);
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        do
        {
          *((_DWORD *)&v331 + v33) = v32;
          *((_DWORD *)&v323 + v33++) = v31 + v32;
          v32 += v29;
        }
        while (v31 != v33);
        bzero(v12, 0x240uLL);
        uint64_t v34 = 0;
        uint64_t v35 = v12 + 16;
        do
        {
          uint64_t v36 = &v25[v29 * v34];
          if (v36)
          {
            uint64_t v37 = v31;
            do
            {
              int v38 = *v36++;
              ++v35[v38];
              --v37;
            }
            while (v37);
          }
          ++v34;
        }
        while (v34 != v31);
        unsigned int v280 = v11;
        uint64_t v282 = v9;
        int v39 = 0;
        LODWORD(v40) = 0;
        int v41 = v30 - 1;
        unsigned int v322 = 0;
        int v321 = (v31 * v31) >> 1;
        int v42 = v28 - 1;
        uint64_t v297 = v331;
        uint64_t v294 = HIDWORD(v331);
        int v43 = 1;
        int v44 = v30 - 1;
        uint64_t v288 = v323;
        uint64_t v285 = HIDWORD(v323);
        for (j = v28 - 1; ; int v42 = j)
        {
          uint64_t v45 = v39;
          int v46 = v39;
          int v305 = v41 - v39;
          if ((int)v40 <= v42) {
            int v47 = v42;
          }
          else {
            int v47 = v40;
          }
          uint64_t v40 = (int)v40;
          uint64_t v48 = v47;
          while (1)
          {
            *(unsigned char *)(v310 + v311 * v40 + *((void *)&v311 + 1) * v45) = Hist8CRead_(v35, &v322, &v321);
            size_t v49 = v318;
            uint64_t v50 = *(void *)v319 * v40;
            if (v46 != v44) {
              break;
            }
            if (v40 == v48) {
              goto LABEL_60;
            }
            uint64_t v51 = *(void *)v319 * (v31 + v40);
            unsigned int v52 = v322;
            int v53 = v321;
            int v54 = v46;
            uint64_t v55 = v31;
            do
            {
              unsigned int v56 = &v49[v54];
              uint64_t v57 = v56[v50];
              uint64_t v58 = v56[v51];
              ++v35[v58];
              v53 += ((int)(v58 - v52) >> 31) + ((v57 - v52) >> 31);
              --v35[v57];
              ++v54;
              --v55;
            }
            while (v55);
            int v321 = v53;
            int v43 = -v43;
            ++v40;
            int v44 = v305;
          }
          int v59 = &v318[v45 + v50];
          if (v43 == 1)
          {
            unsigned int v60 = v322;
            uint64_t v61 = (unsigned int *)&v332;
            uint64_t v62 = (unsigned int *)&v324;
            uint64_t v63 = v31;
            int v64 = v321;
            uint64_t v65 = v285;
            uint64_t v66 = v288;
            uint64_t v67 = v294;
            uint64_t v68 = v297;
            do
            {
              uint64_t v69 = v59[v68];
              uint64_t v70 = v59[v66];
              ++v35[v70];
              v64 += ((int)(v70 - v60) >> 31) + ((v69 - v60) >> 31);
              --v35[v69];
              uint64_t v68 = v67;
              unsigned int v71 = *v61++;
              uint64_t v67 = v71;
              uint64_t v66 = v65;
              unsigned int v72 = *v62++;
              uint64_t v65 = v72;
              --v63;
            }
            while (v63);
            int v321 = v64;
            int v39 = v46 + 1;
            int v43 = 1;
          }
          else
          {
            unsigned int v73 = v59 - 1;
            unsigned int v74 = v322;
            uint64_t v75 = (unsigned int *)&v332;
            unsigned int v76 = (unsigned int *)&v324;
            uint64_t v77 = v31;
            int v78 = v321;
            uint64_t v79 = v285;
            uint64_t v80 = v288;
            uint64_t v81 = v294;
            uint64_t v82 = v297;
            do
            {
              uint64_t v83 = v73[v82];
              uint64_t v84 = v73[v80];
              ++v35[v83];
              v78 += ((int)(v83 - v74) >> 31) + ((v84 - v74) >> 31);
              --v35[v84];
              uint64_t v82 = v81;
              unsigned int v85 = *v75++;
              uint64_t v81 = v85;
              uint64_t v80 = v79;
              unsigned int v86 = *v76++;
              uint64_t v79 = v86;
              --v77;
            }
            while (v77);
            int v39 = v46 - 1;
            int v321 = v78;
          }
          int v41 = v30 - 1;
        }
      }
    }
    else
    {
      unsigned int v280 = (CMemBlock *)v10;
      uint64_t v282 = v9;
      int v88 = *(_DWORD *)(v13 + 24);
      int v89 = *(_DWORD *)(v13 + 36);
      uint64_t v301 = (2 * v88);
      uint64_t v90 = (2 * v88) | 1u;
      uint64_t v91 = (unsigned __int8 *)(v13 + 1590);
      bzero(&v331, 0x400uLL);
      bzero(&v323, 0x400uLL);
      uint64_t v92 = 0;
      uint64_t v93 = 0;
      do
      {
        int v94 = v91[v93];
        *((_DWORD *)&v331 + v93) = v92 + v94;
        *((_DWORD *)&v323 + v93++) = v90 + v92 - v94;
        v92 += v29;
      }
      while (v90 != v93);
      *((_DWORD *)&v331 + v90) = 0;
      *((_DWORD *)&v323 + v90) = 0;
      bzero(v12, 0x240uLL);
      uint64_t v95 = 0;
      uint64_t v96 = v12 + 16;
      do
      {
        uint64_t v97 = v91[v95];
        char v98 = &v25[v97 + v29 * v95];
        if (v98)
        {
          uint64_t v99 = (v90 - 2 * v97);
          do
          {
            int v100 = *v98++;
            ++v96[v100];
            --v99;
          }
          while (v99);
        }
        ++v95;
      }
      while (v95 != v90);
      int v101 = 0;
      LODWORD(v102) = 0;
      int v103 = v30 - 1;
      unsigned int v322 = 0;
      int v321 = v89;
      int v104 = v28 - 1;
      uint64_t v292 = v331;
      uint64_t v290 = HIDWORD(v331);
      int v105 = 1;
      int v106 = v103;
      uint64_t v289 = v323;
      uint64_t v286 = HIDWORD(v323);
      int v298 = v103;
      int v295 = v104;
LABEL_43:
      uint64_t v107 = v101;
      int v108 = v101;
      int v306 = v103 - v101;
      if ((int)v102 <= v104) {
        int v109 = v104;
      }
      else {
        int v109 = v102;
      }
      uint64_t v102 = (int)v102;
      uint64_t v110 = v109;
      while (1)
      {
        *(unsigned char *)(v310 + v311 * v102 + *((void *)&v311 + 1) * v107) = Hist8CRead_(v96, &v322, &v321);
        int32x2_t v111 = v318;
        uint64_t v112 = *(void *)v319;
        if (v108 != v106)
        {
          long long v122 = &v318[v107 + *(void *)v319 * v102];
          if (v105 == 1)
          {
            unsigned int v123 = v322;
            uint64_t v124 = -1;
            int v125 = v321;
            uint64_t v126 = v286;
            uint64_t v127 = v289;
            uint64_t v128 = v290;
            uint64_t v129 = v292;
            do
            {
              uint64_t v130 = v122[v129];
              uint64_t v131 = v122[v127];
              ++v96[v131];
              unsigned int v132 = v130 - v123;
              --v96[v130];
              uint64_t v129 = v128;
              uint64_t v128 = *((unsigned int *)&v331 + (v124 + 3));
              v125 += ((int)(v131 - v123) >> 31) + (v132 >> 31);
              uint64_t v127 = v126;
              uint64_t v126 = *((unsigned int *)&v323 + (v124++ + 3));
            }
            while (v301 != v124);
            int v321 = v125;
            int v101 = v108 + 1;
            int v105 = 1;
          }
          else
          {
            int v133 = v122 - 1;
            unsigned int v134 = v322;
            uint64_t v135 = -1;
            int v136 = v321;
            uint64_t v137 = v286;
            uint64_t v138 = v289;
            uint64_t v139 = v290;
            uint64_t v140 = v292;
            do
            {
              uint64_t v141 = v133[v140];
              uint64_t v142 = v133[v138];
              int v143 = v136 + ((int)(v141 - v134) >> 31);
              ++v96[v141];
              --v96[v142];
              uint64_t v140 = v139;
              uint64_t v139 = *((unsigned int *)&v331 + (v135 + 3));
              int v136 = v143 + ((v142 - v134) >> 31);
              uint64_t v138 = v137;
              uint64_t v137 = *((unsigned int *)&v323 + (v135++ + 3));
            }
            while (v301 != v135);
            int v101 = v108 - 1;
            int v321 = v136;
          }
          int v103 = v298;
          int v104 = v295;
          goto LABEL_43;
        }
        uint64_t v113 = v91;
        if (v102 == v110) {
          break;
        }
        unsigned int v114 = v322;
        int v115 = v321;
        int v116 = v108;
        uint64_t v117 = v90;
        do
        {
          int v118 = *v113++;
          uint64_t v119 = &v111[v116];
          uint64_t v120 = v119[v112 * (v102 + v118)];
          uint64_t v121 = v119[v112 * (v90 + v102 - v118)];
          ++v96[v121];
          v115 += ((int)(v121 - v114) >> 31) + ((v120 - v114) >> 31);
          --v96[v120];
          ++v116;
          --v117;
        }
        while (v117);
        int v321 = v115;
        int v105 = -v105;
        ++v102;
        int v106 = v306;
      }
LABEL_60:
      unsigned int v11 = v280;
      unsigned int v9 = v282;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v308);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v316);
  }
  CKernel::ReturnData(v9, v11);
  return 0;
}

uint64_t Hist8CRead_(unsigned __int16 *a1, unsigned int *a2, int *a3)
{
  uint64_t result = *a2;
  int v5 = -*a3;
  uint64_t v6 = &a1[result];
  if (*a3 < 0)
  {
    long long v16 = v6 - 1;
    while (1)
    {
      v5 -= *v16;
      if (v5 < 1)
      {
        uint64_t result = (result - 1);
        goto LABEL_31;
      }
      v5 -= *(v16 - 1);
      if (v5 < 1)
      {
        uint64_t result = (result - 2);
        goto LABEL_31;
      }
      v5 -= *(v16 - 2);
      if (v5 < 1)
      {
        uint64_t result = (result - 3);
        goto LABEL_31;
      }
      v5 -= *(v16 - 3);
      if (v5 < 1)
      {
        uint64_t result = (result - 4);
        goto LABEL_31;
      }
      v5 -= *(v16 - 4);
      if (v5 < 1)
      {
        uint64_t result = (result - 5);
        goto LABEL_31;
      }
      v5 -= *(v16 - 5);
      if (v5 < 1)
      {
        uint64_t result = (result - 6);
        goto LABEL_31;
      }
      v5 -= *(v16 - 6);
      if (v5 < 1) {
        break;
      }
      int v17 = *(v16 - 7);
      uint64_t result = (result - 8);
      v16 -= 8;
      BOOL v8 = __OFSUB__(v5, v17);
      v5 -= v17;
      if ((v5 < 0) ^ v8 | (v5 == 0)) {
        goto LABEL_31;
      }
    }
    uint64_t result = (result - 7);
  }
  else
  {
    LODWORD(result) = result - 1;
    while (1)
    {
      int v7 = *v6;
      BOOL v8 = __OFADD__(v5, v7);
      int v9 = v5 + v7;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        uint64_t result = (result + 1);
        goto LABEL_31;
      }
      int v10 = v6[1];
      BOOL v8 = __OFADD__(v9, v10);
      int v5 = v9 + v10;
      if (!((v5 < 0) ^ v8 | (v5 == 0)))
      {
        uint64_t result = (result + 2);
        goto LABEL_30;
      }
      int v11 = v6[2];
      BOOL v8 = __OFADD__(v5, v11);
      int v9 = v5 + v11;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        uint64_t result = (result + 3);
        goto LABEL_31;
      }
      int v12 = v6[3];
      BOOL v8 = __OFADD__(v9, v12);
      int v5 = v9 + v12;
      if (!((v5 < 0) ^ v8 | (v5 == 0)))
      {
        uint64_t result = (result + 4);
        goto LABEL_30;
      }
      int v13 = v6[4];
      BOOL v8 = __OFADD__(v5, v13);
      int v9 = v5 + v13;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        uint64_t result = (result + 5);
        goto LABEL_31;
      }
      int v14 = v6[5];
      BOOL v8 = __OFADD__(v9, v14);
      int v5 = v9 + v14;
      if (!((v5 < 0) ^ v8 | (v5 == 0))) {
        break;
      }
      int v15 = v6[6];
      BOOL v8 = __OFADD__(v5, v15);
      int v9 = v5 + v15;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        uint64_t result = (result + 7);
        goto LABEL_31;
      }
      int v5 = v9 + v6[7];
      uint64_t result = (result + 8);
      v6 += 8;
      if (v5 >= 1) {
        goto LABEL_30;
      }
    }
    uint64_t result = (result + 6);
LABEL_30:
    int v5 = v9;
  }
LABEL_31:
  *a2 = result;
  *a3 = -v5;
  return result;
}

uint64_t CMemBlock::Resize(CMemBlock *this, unint64_t a2, int a3, int a4)
{
  uint64_t v18 = &unk_1EFFD4B38;
  char v19 = 0;
  uint64_t v20 = this;
  if (this && (*(unsigned int (**)(CMemBlock *))(*(void *)this + 80))(this)) {
    goto LABEL_19;
  }
  char v19 = 1;
  if (*((void *)this + 5) == a2)
  {
    uint64_t v8 = 0;
    if (a4 && (a3 & 1) == 0) {
      uint64_t v8 = (*(uint64_t (**)(CMemBlock *))(*(void *)this + 72))(this);
    }
    goto LABEL_20;
  }
  uint64_t v9 = *((void *)this + 7);
  if (!v9
    || (uint64_t v10 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)v9 + 24))(v9, (*((_DWORD *)this + 12) + a2), 0)) == 0)
  {
LABEL_19:
    uint64_t v8 = 7;
    goto LABEL_20;
  }
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 7) + 40))(*((void *)this + 7), v10);
  if (v8)
  {
LABEL_20:
    CLock::~CLock((CLock *)&v18);
    return v8;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 7) + 56))(*((void *)this + 7), v10);
  unint64_t v12 = *((void *)this + 6);
  unint64_t v13 = (v12 + v11) / v12 * v12;
  if (a3)
  {
    int v14 = (const void *)*((void *)this + 4);
    if (*((void *)this + 5) >= a2) {
      unint64_t v15 = a2;
    }
    else {
      unint64_t v15 = *((void *)this + 5);
    }
    if (v12 + v11 != (v12 + v11) % v12 && v14 != 0) {
      memcpy((void *)v13, v14, v15);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (a2 > v15 && a4) {
    bzero((void *)(v15 + v13), (a2 - v15));
  }
  (*(void (**)(void, uint64_t))(**((void **)this + 7) + 48))(*((void *)this + 7), v10);
  CLock::~CLock((CLock *)&v18);
  (*(void (**)(void, void))(**((void **)this + 7) + 32))(*((void *)this + 7), *((void *)this + 3));
  uint64_t v8 = 0;
  *((void *)this + 3) = v10;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = a2;
  return v8;
}

void sub_1A97F9594(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CLock::~CLock((CLock *)va);
  _Unwind_Resume(a1);
}

void CLock::~CLock(CLock *this)
{
  *(void *)this = &unk_1EFFD4B38;
  if (*((unsigned char *)this + 8))
  {
    uint64_t v1 = *((void *)this + 2);
    if (v1) {
      (*(void (**)(uint64_t))(*(void *)v1 + 88))(v1);
    }
  }
}

{
  uint64_t vars8;

  CLock::~CLock(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMemBlock::Unlock(uint64_t this)
{
  int v1 = *(_DWORD *)(this + 16) - 1;
  *(_DWORD *)(this + 16) = v1;
  if (!v1)
  {
    uint64_t v2 = this;
    this = *(void *)(this + 56);
    if (this)
    {
      this = (*(uint64_t (**)(uint64_t, void))(*(void *)this + 48))(this, *(void *)(v2 + 24));
      *(void *)(v2 + 32) = 0;
    }
  }
  return this;
}

uint64_t CMemBlock::Lock(CMemBlock *this)
{
  int v2 = *((_DWORD *)this + 4);
  if (v2)
  {
    *((_DWORD *)this + 4) = v2 + 1;
LABEL_3:
    uint64_t result = 0;
    *((unsigned char *)this + 13) = 0;
    return result;
  }
  uint64_t v4 = *((void *)this + 7);
  if (!v4) {
    return 7;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 40))(v4, *((void *)this + 3));
  if (!result)
  {
    ++*((_DWORD *)this + 4);
    *((void *)this + 4) = (unint64_t)(*((void *)this + 6)
                                             + (*(uint64_t (**)(void, void))(**((void **)this + 7) + 56))(*((void *)this + 7), *((void *)this + 3)))/ *((void *)this + 6)* *((void *)this + 6);
    if (*((unsigned char *)this + 13))
    {
      *((unsigned char *)this + 13) = 0;
      (*(void (**)(CMemBlock *))(*(void *)this + 72))(this);
    }
    goto LABEL_3;
  }
  return result;
}

uint64_t CMemBlock::Zero(CMemBlock *this)
{
  if (!*((unsigned char *)this + 13) || (*(unsigned int (**)(CMemBlock *))(*(void *)this + 48))(this))
  {
    if ((*(unsigned int (**)(CMemBlock *))(*(void *)this + 48))(this)) {
      bzero(*((void **)this + 4), *((void *)this + 5));
    }
    else {
      *((unsigned char *)this + 13) = 1;
    }
  }
  return 0;
}

uint64_t CMemBlock::Description@<X0>(CMemBlock *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1EFFD4AC0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  uint64_t v4 = *((void *)this + 4);
  uint64_t v3 = *((void *)this + 5);
  uint64_t result = (*(uint64_t (**)(void, void))(**((void **)this + 7) + 56))(*((void *)this + 7), *((void *)this + 3));
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v4 - result;
  *(_DWORD *)(a2 + 32) = 1;
  *(void *)(a2 + 64) = v3;
  *(void *)(a2 + 40) = 1;
  *(void *)(a2 + 8) = v4;
  return result;
}

void CMemDescriptor::~CMemDescriptor(void *this)
{
  if (this)
  {
    --CMemEnv::excount;
    free(this);
  }
}

uint64_t CMemBlock::Free(CMemBlock *this)
{
  uint64_t result = *((void *)this + 7);
  if (result)
  {
    uint64_t v4 = *((void *)this + 3);
    uint64_t v3 = (void *)((char *)this + 24);
    if (v4)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
      *uint64_t v3 = 0;
      v3[1] = 0;
    }
  }
  return result;
}

uint64_t CMemBlock::Allocate(CMemBlock *this, uint64_t a2, char a3)
{
  *((_DWORD *)this + 4) = 0;
  *((unsigned char *)this + 13) = a3;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = a2;
  uint64_t v5 = *((void *)this + 6);
  uint64_t v4 = *((void *)this + 7);
  uint64_t v6 = v5 & -v5;
  *((void *)this + 6) = v6;
  uint64_t v7 = 7;
  if (v4)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 24))(v4, (v6 + a2));
    *((void *)this + 3) = v8;
    if (v8) {
      return 0;
    }
    else {
      return 7;
    }
  }
  return v7;
}

void CMemBlock::~CMemBlock(CMemBlock *this)
{
  CMemBlock::~CMemBlock(this);
  CBaseRef::operator delete(v1);
}

{
  void *v2;
  uint64_t v3;

  *(void *)this = &unk_1EFFD4C58;
  if (*((int *)this + 2) <= 0 && *((unsigned char *)this + 14))
  {
    int v2 = (void *)((char *)this + 24);
    if (*((void *)this + 3))
    {
      uint64_t v3 = *((void *)this + 7);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(void *)v3 + 32))(v3);
        pthread_mutex_t *v2 = 0;
        *((void *)this + 4) = 0;
      }
    }
    *((unsigned char *)this + 12) = 0;
  }
}

void CMemBlock::CMemBlock(CMemBlock *this, CMemEnv *a2, uint64_t a3, char a4, uint64_t a5)
{
  *((_DWORD *)this + 2) = 0;
  *(void *)this = &unk_1EFFD4C58;
  *((unsigned char *)this + 12) = 0;
  *((unsigned char *)this + 13) = a4;
  *((unsigned char *)this + 14) = 1;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = a3;
  *((void *)this + 6) = -a5 & a5;
  *((void *)this + 7) = a2;
  if (!CMemBlock::Allocate(this, a3, a4)) {
    *((unsigned char *)this + 12) = 1;
  }
}

unint64_t CMedian::CKernelBilateral::IdealTSize(CMedian::CKernelBilateral *this)
{
  int v1 = (CMedian::CxParms *)*((void *)this + 1587);
  if (v1) {
    return CMedian::CxParms::IdealTSize(v1, 8);
  }
  else {
    return 0x10000000100;
  }
}

void CMedian::CKernelBilateral::~CKernelBilateral(CMedian::CKernelBilateral *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1AD0F8810);
}

uint64_t CMedian::CKernelBilateral::Process_(CMedian::CKernelBilateral *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5, double a6, double a7, double a8, double a9)
{
  if (*((void *)a3 + 4) == 4)
  {
    uint64_t v9 = *((void *)this + 1587);
    unsigned int v10 = *(_DWORD *)(v9 + 40);
    int32x2_t v11 = 0;
    if (v10) {
      *(float *)v11.i32 = (float)v10 * 0.0039062;
    }
    float v12 = *(float *)v11.i32 * 0.0039062;
    if (*(float *)v11.i32 < 1.0) {
      float v12 = *(float *)v11.i32;
    }
    unint64_t v13 = *((void *)a3 + 7);
    if (v13)
    {
      uint64_t v14 = 0;
      unsigned int v15 = 0;
      int v16 = *(_DWORD *)(v9 + 24);
      unsigned int v17 = 2 * v16;
      uint64_t v18 = (2 * v16) | 1u;
      unint64_t v19 = *((void *)a3 + 6);
      int v20 = v16 & 0x7FFFFFFF;
      uint64_t v21 = *((void *)a2 + 2);
      uint64_t v22 = *((void *)a2 + 3);
      int v23 = *(unsigned __int8 *)(v9 + 50);
      if (v17 / 6 <= 1) {
        unsigned int v24 = 1;
      }
      else {
        unsigned int v24 = v17 / 6;
      }
      uint64_t v25 = *((void *)a3 + 2);
      uint64_t v26 = *((void *)a3 + 3);
      do
      {
        if (v19)
        {
          uint64_t v27 = 0;
          uint64_t v29 = v26 * v14;
          do
          {
            uint64_t v30 = 0;
            uint64_t v31 = v21 + 4 * (v20 + v27);
            uint64_t v28 = v22 * (v15 + v20);
            v11.i32[0] = *(_DWORD *)(v31 + v28);
            if (v23) {
              LODWORD(a9) = *(_DWORD *)(v31 + v28);
            }
            else {
              *(float *)&a9 = 1.0;
            }
            *(float *)&a9 = *(float *)&a9 * v12;
            float32x4_t v32 = (float32x4_t)vdupq_lane_s32(v11, 0);
            float32x4_t v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0);
            float v34 = 0.0;
            float v35 = 0.0;
            do
            {
              uint64_t v36 = (float *)(v21 + 4 * v27 + v22 * (v15 + v30));
              if (v17 >= 6)
              {
                uint64_t v37 = v36 + 5;
                unsigned int v38 = v24;
                do
                {
                  float v39 = *(v37 - 1);
                  float v40 = vabds_f32(v39, *(float *)v11.i32);
                  float v41 = vabds_f32(*v37, *(float *)v11.i32);
                  float v42 = vabds_f32(*(float *)&a9, v40) + (float)(*(float *)&a9 - v40);
                  float v43 = vabds_f32(*(float *)&a9, v41) + (float)(*(float *)&a9 - v41);
                  float32x4_t v44 = *(float32x4_t *)(v37 - 5);
                  float32x4_t v45 = vabdq_f32(v44, v32);
                  float32x4_t v46 = vaddq_f32(vabdq_f32(v33, v45), vsubq_f32(v33, v45));
                  float32x4_t v47 = vmulq_f32(v46, v44);
                  float v35 = (float)(vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v47, v47)) + (float)(v42 * v39))
                      + (float)(v35 + (float)(v43 * *v37));
                  float v34 = (float)(v42 + (float)(v43 + v34)) + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v46, v46));
                  v37 += 6;
                  --v38;
                }
                while (v38);
                v36 += 6 * v24;
              }
              int v48 = 6 * (v18 / 6) - v18;
              do
              {
                float v49 = *v36++;
                float v50 = vabds_f32(v49, *(float *)v11.i32);
                float v51 = vabds_f32(*(float *)&a9, v50) + (float)(*(float *)&a9 - v50);
                float v35 = v35 + (float)(v51 * v49);
                float v34 = v51 + v34;
              }
              while (!__CFADD__(v48++, 1));
              ++v30;
            }
            while (v30 != v18);
            if (v34 <= 0.0) {
              float v53 = 1.0;
            }
            else {
              float v53 = v34;
            }
            *(float *)(4 * v27++ + v25 + v29) = v35 / v53;
          }
          while (v19 > v27);
        }
        uint64_t v14 = ++v15;
      }
      while (v13 > v15);
    }
  }
  return 0;
}

uint64_t sub_1A97F9D98()
{
  return MEMORY[0x1F40E3A88]();
}

uint64_t sub_1A97F9DA8()
{
  return MEMORY[0x1F40E3AA0]();
}

uint64_t sub_1A97F9DB8()
{
  return MEMORY[0x1F40E3AB8]();
}

uint64_t sub_1A97F9DC8()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1A97F9DD8()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1A97F9DE8()
{
  return MEMORY[0x1F40E48D0]();
}

uint64_t sub_1A97F9DF8()
{
  return MEMORY[0x1F40E48F0]();
}

uint64_t sub_1A97F9E08()
{
  return MEMORY[0x1F40E4940]();
}

uint64_t sub_1A97F9E18()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1A97F9E28()
{
  return MEMORY[0x1F40E49F0]();
}

uint64_t sub_1A97F9E38()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1A97F9E48()
{
  return MEMORY[0x1F40E4AB0]();
}

uint64_t sub_1A97F9E58()
{
  return MEMORY[0x1F40E4B60]();
}

uint64_t sub_1A97F9E68()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1A97F9E78()
{
  return MEMORY[0x1F40E4BE8]();
}

uint64_t sub_1A97F9E88()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1A97F9E98()
{
  return MEMORY[0x1F4130128]();
}

uint64_t sub_1A97F9EA8()
{
  return MEMORY[0x1F4130130]();
}

uint64_t sub_1A97F9EB8()
{
  return MEMORY[0x1F4130148]();
}

uint64_t sub_1A97F9EC8()
{
  return MEMORY[0x1F4130178]();
}

uint64_t sub_1A97F9ED8()
{
  return MEMORY[0x1F4130188]();
}

uint64_t sub_1A97F9EE8()
{
  return MEMORY[0x1F41301B8]();
}

uint64_t sub_1A97F9EF8()
{
  return MEMORY[0x1F41301F0]();
}

uint64_t sub_1A97F9F08()
{
  return MEMORY[0x1F4130200]();
}

uint64_t sub_1A97F9F18()
{
  return MEMORY[0x1F4130210]();
}

uint64_t sub_1A97F9F28()
{
  return MEMORY[0x1F4130218]();
}

uint64_t sub_1A97F9F38()
{
  return MEMORY[0x1F4130230]();
}

uint64_t sub_1A97F9F48()
{
  return MEMORY[0x1F4130250]();
}

uint64_t sub_1A97F9F58()
{
  return MEMORY[0x1F4130280]();
}

uint64_t sub_1A97F9F68()
{
  return MEMORY[0x1F4130288]();
}

uint64_t sub_1A97F9F78()
{
  return MEMORY[0x1F41302A0]();
}

uint64_t sub_1A97F9F88()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A97F9F98()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A97F9FA8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A97F9FB8()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1A97F9FC8()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1A97F9FD8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A97F9FE8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A97F9FF8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A97FA008()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A97FA028()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A97FA038()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A97FA048()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A97FA058()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A97FA068()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A97FA078()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A97FA088()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A97FA098()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A97FA0A8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A97FA0B8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A97FA0C8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A97FA0D8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A97FA0E8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A97FA0F8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A97FA108()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A97FA118()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A97FA128()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A97FA138()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A97FA148()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A97FA158()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1A97FA168()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A97FA178()
{
  return MEMORY[0x1F4185EF8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A0](gray, alpha);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x1F40E9790](metadata, parent, path);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CFArrayRef)MEMORY[0x1F40DF3F8](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x1F40DF4C8](font);
  return result;
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

uint64_t CVImageBufferSetColorSpace()
{
  return MEMORY[0x1F40DFC48]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t FigLivePhotoMetadataComputeDeserializationSize()
{
  return MEMORY[0x1F410D3E8]();
}

uint64_t FigLivePhotoMetadataDeserializeIntoBuffer()
{
  return MEMORY[0x1F410D3F8]();
}

uint64_t ICAnalyzeInputMotion()
{
  return MEMORY[0x1F4124CC0]();
}

uint64_t ICCalcCinematicL1Corrections()
{
  return MEMORY[0x1F4124CD0]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1F4124CF8]();
}

uint64_t ICGetResultHomographies()
{
  return MEMORY[0x1F4124D38]();
}

uint64_t ICSynthesizeAnalysis()
{
  return MEMORY[0x1F4124D58]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t NSArrayFromNUPixelRect()
{
  return MEMORY[0x1F41308E8]();
}

void NSLog(NSString *format, ...)
{
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x1F40E7220](aString);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromNUPixelRect()
{
  return MEMORY[0x1F41308F0]();
}

uint64_t NSStringFromNUPixelSize()
{
  return MEMORY[0x1F41308F8]();
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t NUAbsolutePointInRect()
{
  return MEMORY[0x1F4130900]();
}

uint64_t NUAbsoluteTime()
{
  return MEMORY[0x1F4130908]();
}

uint64_t NUAlignPixelRectToPixelGrid()
{
  return MEMORY[0x1F4130910]();
}

uint64_t NUAuxiliaryImageTypeFromString()
{
  return MEMORY[0x1F4130918]();
}

uint64_t NUAuxiliaryImageTypeToString()
{
  return MEMORY[0x1F4130920]();
}

uint64_t NUCGAffineTransformByMappingFromRectToRect()
{
  return MEMORY[0x1F4130928]();
}

uint64_t NUCGRectConvertFromRectToRect()
{
  return MEMORY[0x1F4130930]();
}

uint64_t NUDeepArrayHash()
{
  return MEMORY[0x1F4130938]();
}

uint64_t NUFileTypeFromExtension()
{
  return MEMORY[0x1F4130940]();
}

uint64_t NUHeight()
{
  return MEMORY[0x1F4130948]();
}

uint64_t NUIsAppleInternal()
{
  return MEMORY[0x1F4130950]();
}

uint64_t NUIsRoughlyEqual()
{
  return MEMORY[0x1F4130958]();
}

uint64_t NUIsRoughlyLessThan()
{
  return MEMORY[0x1F4130960]();
}

uint64_t NUMakeDictionary1()
{
  return MEMORY[0x1F4130968]();
}

uint64_t NUMakeDictionary2()
{
  return MEMORY[0x1F4130970]();
}

uint64_t NUMakeDictionary3()
{
  return MEMORY[0x1F4130978]();
}

uint64_t NUMakeDictionary4()
{
  return MEMORY[0x1F4130980]();
}

uint64_t NUMakeDictionary5()
{
  return MEMORY[0x1F4130988]();
}

uint64_t NUMakeDictionary6()
{
  return MEMORY[0x1F4130990]();
}

uint64_t NUMakeDictionary7()
{
  return MEMORY[0x1F4130998]();
}

uint64_t NUMaxX()
{
  return MEMORY[0x1F41309A0]();
}

uint64_t NUMaxY()
{
  return MEMORY[0x1F41309A8]();
}

uint64_t NUMinX()
{
  return MEMORY[0x1F41309B0]();
}

uint64_t NUMinY()
{
  return MEMORY[0x1F41309B8]();
}

uint64_t NUOrientationConcat()
{
  return MEMORY[0x1F41309C0]();
}

uint64_t NUOrientationHasFlip()
{
  return MEMORY[0x1F41309C8]();
}

uint64_t NUOrientationInverse()
{
  return MEMORY[0x1F41309D0]();
}

uint64_t NUOrientationIsValid()
{
  return MEMORY[0x1F41309D8]();
}

uint64_t NUOrientationMakeTransformWithSize()
{
  return MEMORY[0x1F41309E0]();
}

uint64_t NUOrientationName()
{
  return MEMORY[0x1F41309E8]();
}

uint64_t NUOrientationTransformImageRect()
{
  return MEMORY[0x1F41309F0]();
}

uint64_t NUOrientationTransformImageSize()
{
  return MEMORY[0x1F41309F8]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x1F4130A08]();
}

uint64_t NUPixelPointFromCGPoint()
{
  return MEMORY[0x1F4130A10]();
}

uint64_t NUPixelPointInRect()
{
  return MEMORY[0x1F4130A18]();
}

uint64_t NUPixelRectConstrainToRect()
{
  return MEMORY[0x1F4130A20]();
}

uint64_t NUPixelRectDenormalize()
{
  return MEMORY[0x1F4130A28]();
}

uint64_t NUPixelRectDilate()
{
  return MEMORY[0x1F4130A30]();
}

uint64_t NUPixelRectEqualToRect()
{
  return MEMORY[0x1F4130A38]();
}

uint64_t NUPixelRectFlipYOrigin()
{
  return MEMORY[0x1F4130A40]();
}

uint64_t NUPixelRectFromArray()
{
  return MEMORY[0x1F4130A48]();
}

uint64_t NUPixelRectFromCGRect()
{
  return MEMORY[0x1F4130A50]();
}

uint64_t NUPixelRectInset()
{
  return MEMORY[0x1F4130A58]();
}

uint64_t NUPixelRectIntersection()
{
  return MEMORY[0x1F4130A60]();
}

uint64_t NUPixelRectIntersectsRect()
{
  return MEMORY[0x1F4130A68]();
}

uint64_t NUPixelRectIsEmpty()
{
  return MEMORY[0x1F4130A70]();
}

uint64_t NUPixelRectIsNull()
{
  return MEMORY[0x1F4130A78]();
}

uint64_t NUPixelRectMaxCenteredInRect()
{
  return MEMORY[0x1F4130A80]();
}

uint64_t NUPixelRectNormalize()
{
  return MEMORY[0x1F4130A88]();
}

uint64_t NUPixelRectOffset()
{
  return MEMORY[0x1F4130A90]();
}

uint64_t NUPixelRectScale()
{
  return MEMORY[0x1F4130A98]();
}

uint64_t NUPixelRectScaleRational()
{
  return MEMORY[0x1F4130AA0]();
}

uint64_t NUPixelRectSetOrigin()
{
  return MEMORY[0x1F4130AA8]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x1F4130AB0]();
}

uint64_t NUPixelRectUnion()
{
  return MEMORY[0x1F4130AB8]();
}

uint64_t NUPixelSizeEqualToSize()
{
  return MEMORY[0x1F4130AC0]();
}

uint64_t NUPixelSizeFromCGSize()
{
  return MEMORY[0x1F4130AC8]();
}

uint64_t NUPixelSizeIsEmpty()
{
  return MEMORY[0x1F4130AD0]();
}

uint64_t NUPixelSizeLargestDimension()
{
  return MEMORY[0x1F4130AD8]();
}

uint64_t NUPixelSizeToCGRect()
{
  return MEMORY[0x1F4130AE0]();
}

uint64_t NUPixelSizeToCGSize()
{
  return MEMORY[0x1F4130AE8]();
}

uint64_t NURectDenormalize()
{
  return MEMORY[0x1F4130AF0]();
}

uint64_t NURectFlipYOrigin()
{
  return MEMORY[0x1F4130AF8]();
}

uint64_t NURectNormalize()
{
  return MEMORY[0x1F4130B00]();
}

uint64_t NUScaleCompare()
{
  return MEMORY[0x1F4130B08]();
}

uint64_t NUScaleDivide()
{
  return MEMORY[0x1F4130B10]();
}

uint64_t NUScaleEqual()
{
  return MEMORY[0x1F4130B18]();
}

uint64_t NUScaleFromString()
{
  return MEMORY[0x1F4130B28]();
}

uint64_t NUScaleFromValue()
{
  return MEMORY[0x1F4130B30]();
}

uint64_t NUScaleInvert()
{
  return MEMORY[0x1F4130B38]();
}

uint64_t NUScaleIsValid()
{
  return MEMORY[0x1F4130B40]();
}

uint64_t NUScaleMake()
{
  return MEMORY[0x1F4130B48]();
}

uint64_t NUScaleRect()
{
  return MEMORY[0x1F4130B50]();
}

uint64_t NUScaleToDouble()
{
  return MEMORY[0x1F4130B58]();
}

uint64_t NUScaleToFillSizeInSize()
{
  return MEMORY[0x1F4130B60]();
}

uint64_t NUScaleToString()
{
  return MEMORY[0x1F4130B68]();
}

uint64_t NUScaleToValue()
{
  return MEMORY[0x1F4130B70]();
}

uint64_t NUStringFromTime()
{
  return MEMORY[0x1F4130B78]();
}

uint64_t NUStringFromTimeRange()
{
  return MEMORY[0x1F4130B80]();
}

uint64_t NUWidth()
{
  return MEMORY[0x1F4130B88]();
}

uint64_t PFExists()
{
  return MEMORY[0x1F413F310]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x1F41406B0]();
}

uint64_t PFFigCreateCVPixelBufferFromURL()
{
  return MEMORY[0x1F41406B8]();
}

uint64_t PFFigEncodeCVPixelBufferToData()
{
  return MEMORY[0x1F41406C0]();
}

uint64_t PFFigEncodeCVPixelBufferToURL()
{
  return MEMORY[0x1F41406C8]();
}

uint64_t PFFilter()
{
  return MEMORY[0x1F413F318]();
}

uint64_t PFFind()
{
  return MEMORY[0x1F413F320]();
}

uint64_t PFMap()
{
  return MEMORY[0x1F413F338]();
}

uint64_t PFParallaxLayerStyleSupportedKinds()
{
  return MEMORY[0x1F4140738]();
}

uint64_t PFPosterClassificationName()
{
  return MEMORY[0x1F4140748]();
}

uint64_t PFPosterClassificationNamed()
{
  return MEMORY[0x1F4140750]();
}

uint64_t PFPosterEnableHeadroom()
{
  return MEMORY[0x1F4140760]();
}

uint64_t PFPosterEnableSmartTextColor()
{
  return MEMORY[0x1F4140770]();
}

uint64_t PFPosterSettlingEffectGatingLevelDescription()
{
  return MEMORY[0x1F4140778]();
}

uint64_t PFReduce()
{
  return MEMORY[0x1F413F370]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x1F413F388]();
}

uint64_t PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision()
{
  return MEMORY[0x1F4140890]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DB8]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DC8]();
}

uint64_t PTDisparityInNormalizedRectFromPixelBuffer()
{
  return MEMORY[0x1F4145B40]();
}

uint64_t PTGroupIDIsValid()
{
  return MEMORY[0x1F4145B48]();
}

uint64_t PTTrackIDIsValid()
{
  return MEMORY[0x1F4145B50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

uint64_t _NUAssertContinueHandler()
{
  return MEMORY[0x1F4130B90]();
}

uint64_t _NUAssertFailHandler()
{
  return MEMORY[0x1F4130B98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

uint64_t alLoopRecipeDestroy()
{
  return MEMORY[0x1F410BD00]();
}

uint64_t alLoopRecipeToDict()
{
  return MEMORY[0x1F410BD08]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

uint64_t autoloopErrorCodeToString()
{
  return MEMORY[0x1F410BD10]();
}

uint64_t autoloopSettingsDestroy()
{
  return MEMORY[0x1F410BD18]();
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

uint64_t createAutoLoopSettingsForAsset()
{
  return MEMORY[0x1F410BD38]();
}

uint64_t dgels_NEWLAPACK()
{
  return MEMORY[0x1F40D16E0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t liveAnalysisResultCopyRecipe()
{
  return MEMORY[0x1F410BD50]();
}

uint64_t liveAnalysisResultDestroy()
{
  return MEMORY[0x1F410BD58]();
}

uint64_t liveAnalysisResultFromDictionary()
{
  return MEMORY[0x1F410BD60]();
}

uint64_t liveAnalysisResultToDictionary()
{
  return MEMORY[0x1F410BD68]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t nu_rgb_to_tempTint()
{
  return MEMORY[0x1F4130BA8]();
}

uint64_t nu_xy_to_tempTint()
{
  return MEMORY[0x1F4130BB0]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

uint64_t runLiveAnalysisPipeline()
{
  return MEMORY[0x1F410BD70]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

vImage_Error vImageConvert_16UToF(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x1F40D23B0](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23C0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x1F40D25A0](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoARGBFFFF(const vImage_Buffer *srcA, const vImage_Buffer *srcR, const vImage_Buffer *srcG, const vImage_Buffer *srcB, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2638](srcA, srcR, srcG, srcB, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

uint64_t validateLiveAnalysisDictionaryVersion()
{
  return MEMORY[0x1F410BD78]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SensitiveContentAnalysisML(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___SCMLImageLabelCoder(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SensitiveContentAnalysisML)) {
    return dlopenHelper_SensitiveContentAnalysisML(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SCMLImageSanitizerConfiguration(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SensitiveContentAnalysisML)) {
    return dlopenHelper_SensitiveContentAnalysisML(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SCMLImageSanitizer(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SensitiveContentAnalysisML)) {
    return dlopenHelper_SensitiveContentAnalysisML(result);
  }
  return result;
}