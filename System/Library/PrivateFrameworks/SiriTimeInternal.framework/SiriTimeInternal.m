uint64_t type metadata accessor for ApplicationContext()
{
  return self;
}

uint64_t static ApplicationContext.shared.getter()
{
  if (qword_268BBE6C0)
  {
    uint64_t v0 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v0 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v0;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v0;
}

id AppInstallUtil.isAppInstalled.getter()
{
  uint64_t v1 = sub_23CA0E410();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  MEMORY[0x270FA5388](v3);
  v5 = (char *)&v21 - v4;
  unsigned int v6 = *v0;
  if (v6 >= 3) {
    uint64_t v7 = 0xD000000000000010;
  }
  else {
    uint64_t v7 = 0xD000000000000015;
  }
  if (v6 >= 3) {
    unint64_t v8 = 0x800000023CA14F90;
  }
  else {
    unint64_t v8 = 0x800000023CA14F00;
  }
  id v9 = objc_allocWithZone(MEMORY[0x263F01878]);
  id v10 = sub_23C9B8E70(v7, v8, 1);
  id v11 = objc_msgSend(v10, sel_applicationState);
  id v12 = objc_msgSend(v11, sel_isInstalled);

  if (qword_268BBDEE0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_268BBEAD0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v13, v1);
  v14 = sub_23CA0E3F0();
  os_log_type_t v15 = sub_23CA0E6E0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v25[0] = v22;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v23 = v1;
    uint64_t v24 = sub_23C9BC474(v7, v8, v25);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    if (v12) {
      uint64_t v17 = 0x454C4C4154534E49;
    }
    else {
      uint64_t v17 = 0x54534E4920544F4ELL;
    }
    if (v12) {
      unint64_t v18 = 0xE900000000000044;
    }
    else {
      unint64_t v18 = 0xED000044454C4C41;
    }
    uint64_t v24 = sub_23C9BC474(v17, v18, v25);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v14, v15, "ClockTimerAppUtil: LSApplicationRecord: %s – %s", (uint8_t *)v16, 0x16u);
    uint64_t v19 = v22;
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v19, -1, -1);
    MEMORY[0x23ECEDBE0](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v12;
}

id sub_23C9B8E70(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  v5 = (void *)sub_23CA0E4C0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_23CA0CC00();

    swift_willThrow();
  }
  return v6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t UsoTask.alarmEntity.getter()
{
  sub_23CA0D890();
  sub_23C9B9300((uint64_t)v11, (uint64_t)v9);
  if (v10)
  {
    sub_23C9B9300((uint64_t)v9, (uint64_t)v8);
    sub_23CA0D9F0();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_23CA0D6C0();
      goto LABEL_19;
    }
    sub_23CA0D9C0();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_23CA0D820();
      goto LABEL_19;
    }
    sub_23CA0D9D0();
    if (swift_dynamicCast()) {
      goto LABEL_18;
    }
    sub_23CA0DA90();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_23CA0DC50();
      swift_release();
      uint64_t v0 = v6;
      if (v6)
      {
        swift_release();
        sub_23C9F4E50((uint64_t)v11);
LABEL_20:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
        goto LABEL_27;
      }
      swift_retain();
      sub_23CA0DC40();
LABEL_19:
      swift_release_n();
      sub_23C9F4E50((uint64_t)v11);
      uint64_t v0 = v7;
      goto LABEL_20;
    }
    sub_23CA0DB70();
    if (swift_dynamicCast()) {
      goto LABEL_18;
    }
    sub_23CA0DD20();
    if (swift_dynamicCast()) {
      goto LABEL_18;
    }
    sub_23CA0DA10();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_23CA0DC60();
      goto LABEL_19;
    }
    sub_23CA0DA80();
    if (swift_dynamicCast()
      || (sub_23CA0D9E0(), swift_dynamicCast())
      || (sub_23CA0DA00(), swift_dynamicCast()))
    {
LABEL_18:
      swift_retain();
      sub_23CA0D9B0();
      goto LABEL_19;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  }
  if (qword_268BBDEE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23CA0E410();
  __swift_project_value_buffer(v1, (uint64_t)qword_268BBEB68);
  uint64_t v2 = sub_23CA0E3F0();
  os_log_type_t v3 = sub_23CA0E700();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_23C9B6000, v2, v3, "Parse entity: failed to parse task with unknown task. Returning nil entity", v4, 2u);
    MEMORY[0x23ECEDBE0](v4, -1, -1);
  }

  sub_23C9F4E50((uint64_t)v11);
  uint64_t v0 = 0;
LABEL_27:
  sub_23C9F4E50((uint64_t)v9);
  return v0;
}

uint64_t sub_23C9B9300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()()
{
  return sub_23C9B940C(3, "Multi-timer on iOS FeatureFlag is enabled!");
}

uint64_t sub_23C9B940C(char a1, const char *a2)
{
  id v11 = &type metadata for Features;
  unint64_t v12 = sub_23C9B952C();
  v10[0] = a1;
  char v4 = sub_23CA0D480();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  if (v4)
  {
    if (qword_268BBDE40 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_23CA0E410();
    __swift_project_value_buffer(v5, (uint64_t)qword_268BBE320);
    uint64_t v6 = sub_23CA0E3F0();
    os_log_type_t v7 = sub_23CA0E710();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_23C9B6000, v6, v7, a2, v8, 2u);
      MEMORY[0x23ECEDBE0](v8, -1, -1);
    }
  }
  return v4 & 1;
}

unint64_t sub_23C9B952C()
{
  unint64_t result = qword_268BBE338;
  if (!qword_268BBE338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE338);
  }
  return result;
}

unint64_t sub_23C9B9580()
{
  unint64_t result = qword_268BBE340;
  if (!qword_268BBE340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE340);
  }
  return result;
}

const char *sub_23C9B95D4()
{
  if (*v0 == 5) {
    return "Siri";
  }
  else {
    return "SiriTime";
  }
}

const char *sub_23C9B9604()
{
  return sub_23C9C8EE4(*v0);
}

uint64_t getEnumTagSinglePayload for HALAlarmDeviceContext(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

id UsoEntity_common_Duration.valueInSeconds.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB98);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0D960();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v49 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v45 = (char *)&v42 - v7;
  unint64_t v8 = sub_23CA0D930();
  if (!v8) {
    goto LABEL_39;
  }
  unint64_t v9 = v8;
  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
    goto LABEL_38;
  }
  if (!sub_23CA0E9C0())
  {
LABEL_38:
    swift_bridgeObjectRelease();
LABEL_39:
    if (qword_268BBDEF0 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_23CA0E410();
    __swift_project_value_buffer(v37, (uint64_t)qword_268BBEB80);
    v38 = sub_23CA0E3F0();
    os_log_type_t v39 = sub_23CA0E710();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_23C9B6000, v38, v39, "DurationComponents is nil or empty!", v40, 2u);
      MEMORY[0x23ECEDBE0](v40, -1, -1);
    }

    v41 = self;
    return objc_msgSend(v41, sel_defaultDuration);
  }
LABEL_4:
  unint64_t v10 = sub_23C9F4EB0(v9);
  swift_bridgeObjectRelease();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_23CA0E9C0();
    uint64_t v11 = (uint64_t)result;
    if (result) {
      goto LABEL_6;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id result = (id)swift_bridgeObjectRetain();
  if (!v11) {
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_6:
  uint64_t v13 = v11 - 1;
  if (v11 >= 1)
  {
    uint64_t v14 = 0;
    unint64_t v52 = v10 & 0xC000000000000001;
    v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
    v50 = (void (**)(char *, uint64_t))(v4 + 8);
    v43 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    v44 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    unsigned int v48 = *MEMORY[0x263F72BB0];
    v47 = (void (**)(char *, void, uint64_t))(v4 + 104);
    double v15 = 0.0;
    unint64_t v51 = v10;
    while (1)
    {
      if (v52) {
        MEMORY[0x23ECED190](v14, v10);
      }
      else {
        swift_retain();
      }
      if (!sub_23CA0DCB0())
      {
        if (qword_268BBDEF0 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_23CA0E410();
        __swift_project_value_buffer(v22, (uint64_t)qword_268BBEB80);
        uint64_t v23 = sub_23CA0E3F0();
        os_log_type_t v24 = sub_23CA0E710();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_23C9B6000, v23, v24, "Value is nil in the DurationComponent, use SiriTimeTimerConstants.minimumDuration as the default value", v25, 2u);
          MEMORY[0x23ECEDBE0](v25, -1, -1);
        }

        objc_msgSend(self, sel_minimumDuration);
        double v17 = v16;
LABEL_9:
        swift_release();
        double v15 = v15 + v17;
        if (v13 == v14) {
          return (id)swift_bridgeObjectRelease_n();
        }
        goto LABEL_10;
      }
      sub_23CA0D6D0();
      swift_release();
      unint64_t v18 = sub_23C9B9DD4(0.0, 1.0, 0.1, 0.3);
      if ((v18 & 0x100000000) != 0)
      {
        if (qword_268BBDEF0 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_23CA0E410();
        __swift_project_value_buffer(v26, (uint64_t)qword_268BBEB80);
        v27 = sub_23CA0E3F0();
        os_log_type_t v28 = sub_23CA0E710();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_23C9B6000, v27, v28, "Failed to resolve parse to quantity value, use SiriTimeTimerConstants.minimumDuration as the default value", v29, 2u);
          MEMORY[0x23ECEDBE0](v29, -1, -1);
        }

        objc_msgSend(self, sel_minimumDuration);
        double v17 = v30;
        swift_release();
        goto LABEL_9;
      }
      float v19 = *(float *)&v18;
      uint64_t v20 = v13;
      if (!sub_23CA0DCA0()) {
        break;
      }
      sub_23CA0D950();
      swift_release();
      if ((*v46)(v2, 1, v3) == 1) {
        goto LABEL_29;
      }
      uint64_t v21 = v45;
      (*v43)(v45, v2, v3);
LABEL_34:
      double v36 = sub_23C9BAA88();
      (*v50)(v21, v3);
      swift_release();
      swift_release();
      double v15 = v15 + v36 * v19;
      if (v20 == v14) {
        return (id)swift_bridgeObjectRelease_n();
      }
      uint64_t v13 = v20;
      unint64_t v10 = v51;
LABEL_10:
      ++v14;
    }
    (*v44)(v2, 1, 1, v3);
LABEL_29:
    v31 = v2;
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBEB98);
    if (qword_268BBDEF0 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_23CA0E410();
    __swift_project_value_buffer(v32, (uint64_t)qword_268BBEB80);
    v33 = sub_23CA0E3F0();
    os_log_type_t v34 = sub_23CA0E700();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_23C9B6000, v33, v34, "DurationComponent is underspecified and is missing a Unit, using Minute as default unit", v35, 2u);
      MEMORY[0x23ECEDBE0](v35, -1, -1);
    }

    uint64_t v21 = v49;
    (*v47)(v49, v48, v3);
    uint64_t v2 = v31;
    goto LABEL_34;
  }
  __break(1u);
  return result;
}

unint64_t sub_23C9B9DD4(float a1, float a2, float a3, float a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE758);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23CA0D840();
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  double v16 = (char *)&v70 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE760);
  MEMORY[0x270FA5388](v17 - 8);
  float v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23CA0D800();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  os_log_type_t v24 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v72 = (char *)&v70 - v25;
  sub_23CA0D810();
  sub_23CA0D990();
  if (v74)
  {
    sub_23CA0D7F0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
    {
      swift_release();
      sub_23C9BAA2C((uint64_t)v19, &qword_268BBE760);
      goto LABEL_4;
    }
    v31 = v72;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v72, v19, v20);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v31, v20);
    int v32 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v24, v20);
    if (v32 == *MEMORY[0x263F72A28])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 1000000000.0;
      goto LABEL_70;
    }
    int v34 = v32;
    if (v32 == *MEMORY[0x263F72A20])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 12.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x263F72A40])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 1000.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x263F72A48])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 1.0e12;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x263F729E0])
    {
      float v60 = a2 * 0.5;
      float v61 = a1 * 0.5;
LABEL_52:
      float v62 = v61 + v60;
      MEMORY[0x23ECECFE0](10.0);
      sub_23CA0CC50();
      v63 = (void *)sub_23CA0E770();
      sub_23CA0E690();
      float v65 = v64;
      swift_release();

      a1 = roundf(v62 * v65) / v65;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      goto LABEL_53;
    }
    if (v32 == *MEMORY[0x263F72A38])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 1000000.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x263F72A08])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      float v30 = 100000.0;
      goto LABEL_70;
    }
    if (v32 != *MEMORY[0x263F729F0])
    {
      if (v32 == *MEMORY[0x263F72A18])
      {
        float v61 = a2 * a3;
        float v67 = 1.0 - a3;
LABEL_74:
        float v60 = v67 * a1;
        goto LABEL_52;
      }
      if (v32 != *MEMORY[0x263F729F8])
      {
        if (v32 == *MEMORY[0x263F729E8])
        {
          (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
          swift_release();
          LOBYTE(v29) = 0;
          float v30 = 10000.0;
          goto LABEL_70;
        }
        if (v32 != *MEMORY[0x263F72A10])
        {
          if (v32 == *MEMORY[0x263F72A30])
          {
            (*(void (**)(char *, uint64_t))(v21 + 8))(v72, v20);
            swift_release();
            LOBYTE(v29) = 0;
            float v30 = 100.0;
            goto LABEL_70;
          }
          if (v32 == *MEMORY[0x263F729D8])
          {
            (*(void (**)(char *, uint64_t))(v21 + 8))(v72, v20);
            swift_release();
            LOBYTE(v29) = 0;
            float v30 = 10000000.0;
            goto LABEL_70;
          }
          int v68 = *MEMORY[0x263F72A00];
          v69 = *(void (**)(char *, uint64_t))(v21 + 8);
          v69(v72, v20);
          swift_release();
          if (v34 != v68)
          {
            v69(v24, v20);
            goto LABEL_69;
          }
LABEL_53:
          LOBYTE(v29) = 0;
          float v30 = a1;
          goto LABEL_70;
        }
        float v61 = a2 * a4;
        float v67 = 1.0 - a4;
        goto LABEL_74;
      }
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
    swift_release();
    LOBYTE(v29) = 0;
    float v30 = a2;
    goto LABEL_70;
  }
LABEL_4:
  sub_23CA0D880();
  sub_23CA0D990();
  if (v74)
  {
    uint64_t v26 = sub_23CA0D870();
    char v28 = v27;
    swift_release();
    if ((v28 & 1) == 0)
    {
      LOBYTE(v29) = 0;
      float v30 = (float)v26;
      goto LABEL_70;
    }
LABEL_69:
    float v30 = 0.0;
    LOBYTE(v29) = 1;
    goto LABEL_70;
  }
  sub_23CA0D860();
  sub_23CA0D990();
  if (v74)
  {
    sub_23CA0D830();
    uint64_t v33 = v71;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v10, 1, v11) == 1)
    {
      sub_23C9BAA2C((uint64_t)v10, &qword_268BBE758);
      goto LABEL_31;
    }
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v16, v10, v11);
    (*(void (**)(char *, void, uint64_t))(v33 + 104))(v14, *MEMORY[0x263F72AC8], v11);
    sub_23C9DFA88();
    sub_23CA0E580();
    sub_23CA0E580();
    if (v74 == v73[0] && v75 == v73[1])
    {
      swift_bridgeObjectRelease_n();
      v40 = *(void (**)(char *, uint64_t))(v33 + 8);
      v40(v14, v11);
      v40(v16, v11);
    }
    else
    {
      char v45 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v46 = *(void (**)(char *, uint64_t))(v33 + 8);
      v46(v14, v11);
      v46(v16, v11);
      if ((v45 & 1) == 0)
      {
LABEL_31:
        uint64_t v47 = sub_23CA0D850();
        if (v48)
        {
          uint64_t v49 = v48;
          LODWORD(v73[0]) = 0;
          uint64_t v50 = MEMORY[0x270FA5388](v47);
          *(&v70 - 2) = (uint64_t)v73;
          if ((v49 & 0x1000000000000000) != 0 || !(v49 & 0x2000000000000000 | v51 & 0x1000000000000000))
          {
            sub_23CA0E8D0();
            swift_release();
            swift_bridgeObjectRelease();
            char v56 = v74;
          }
          else
          {
            MEMORY[0x270FA5388](v50);
            *(&v70 - 2) = (uint64_t)sub_23C9DF9D4;
            *(&v70 - 1) = v53;
            if ((v49 & 0x2000000000000000) != 0)
            {
              uint64_t v74 = v52;
              uint64_t v75 = v49 & 0xFFFFFFFFFFFFFFLL;
              char v56 = (v52 > 0x20u || ((0x100003E01uLL >> v52) & 1) == 0)
                 && (v59 = (unsigned char *)_swift_stdlib_strtof_clocale()) != 0
                 && *v59 == 0;
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              if ((v52 & 0x1000000000000000) != 0)
              {
                uint64_t v54 = (v49 & 0xFFFFFFFFFFFFFFFLL) + 32;
                uint64_t v55 = v52 & 0xFFFFFFFFFFFFLL;
              }
              else
              {
                uint64_t v54 = sub_23CA0E950();
              }
              char v56 = sub_23C9DF974(v54, v55, (void (*)(uint64_t *__return_ptr))sub_23C9DFA44);
              swift_release();
              swift_bridgeObjectRelease();
            }
          }
          if (v56) {
            float v30 = *(float *)v73;
          }
          else {
            float v30 = 0.0;
          }
          LOBYTE(v29) = v56 ^ 1;
          goto LABEL_70;
        }
LABEL_68:
        swift_release();
        goto LABEL_69;
      }
    }
    swift_release();
    LOBYTE(v29) = 0;
    float v30 = 0.01;
    goto LABEL_70;
  }
  sub_23CA0DB50();
  sub_23CA0D990();
  if (!v74)
  {
    sub_23CA0DC90();
    sub_23CA0D990();
    if (!v74) {
      goto LABEL_69;
    }
    if (sub_23CA0DC80())
    {
      if (sub_23CA0DC70())
      {
        sub_23CA0D6D0();
        uint64_t v57 = sub_23C9B9DD4(a1, a2, 0.1, 0.3);
        swift_release();
        if ((v57 & 0x100000000) == 0)
        {
          swift_retain();
          sub_23CA0D6D0();
          swift_release();
          uint64_t v58 = sub_23C9B9DD4(a1, a2, 0.1, 0.3);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          if ((v58 & 0x100000000) == 0)
          {
            LOBYTE(v29) = 0;
            float v30 = *(float *)&v57 * *(float *)&v58;
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    goto LABEL_68;
  }
  uint64_t v35 = sub_23CA0DB30();
  if (v36 & 1) != 0 || (uint64_t v37 = v35, v38 = sub_23CA0DB40(), (v39))
  {
    float v30 = 0.0;
    int v29 = 1;
  }
  else
  {
    if (!v38) {
      goto LABEL_68;
    }
    int v29 = 0;
    float v30 = (float)v37 / (float)v38;
  }
  uint64_t v41 = sub_23CA0DB20();
  char v43 = v42;
  swift_release();
  if ((v43 & 1) == 0)
  {
    float v44 = v30;
    if (v29) {
      float v44 = 0.0;
    }
    float v30 = v44 + (float)v41;
    LOBYTE(v29) = 0;
  }
LABEL_70:
  LOBYTE(v74) = v29 & 1;
  return LODWORD(v30) | ((unint64_t)(v29 & 1) << 32);
}

uint64_t sub_23C9BAA2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_23C9BAA88()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  MEMORY[0x270FA5388](v1 - 8);
  v81 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0CBE0();
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v87 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  v76 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v92 = (char *)&v71 - v6;
  uint64_t v7 = sub_23CA0CCB0();
  uint64_t v88 = *(void *)(v7 - 8);
  uint64_t v89 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v75 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v85 = (char *)&v71 - v10;
  uint64_t v11 = sub_23CA0CD60();
  uint64_t v79 = *(void *)(v11 - 8);
  uint64_t v80 = v11;
  MEMORY[0x270FA5388](v11);
  v78 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA0CE20();
  uint64_t v83 = *(void *)(v13 - 8);
  uint64_t v84 = v13;
  MEMORY[0x270FA5388](v13);
  v82 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEBA8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
  uint64_t v90 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v77 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v91 = (uint8_t *)&v71 - v21;
  uint64_t v22 = sub_23CA0D960();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  int v29 = (char *)&v71 - v28;
  MEMORY[0x270FA5388](v27);
  v31 = (char *)&v71 - v30;
  int v32 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v32((char *)&v71 - v30, v0, v22);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v31, v22);
  double result = 1.0;
  if (v33 != *MEMORY[0x263F72BB8])
  {
    if (v33 == *MEMORY[0x263F72BB0]) {
      return 60.0;
    }
    if (v33 == *MEMORY[0x263F72B80]) {
      return 86400.0;
    }
    if (v33 == *MEMORY[0x263F72B88]) {
      return 3600.0;
    }
    uint64_t v74 = *(void (**)(char *, uint64_t, double))(v23 + 8);
    v74(v31, v22, 1.0);
    sub_23C9F6B10((uint64_t)v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v17, 1, v18) == 1)
    {
      sub_23C9BAA2C((uint64_t)v17, &qword_268BBEBA8);
      if (qword_268BBDEF0 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_23CA0E410();
      __swift_project_value_buffer(v35, (uint64_t)qword_268BBEB80);
      v32(v29, v0, v22);
      char v36 = sub_23CA0E3F0();
      os_log_type_t v37 = sub_23CA0E700();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        v92 = (char *)swift_slowAlloc();
        v94 = v92;
        *(_DWORD *)uint64_t v38 = 136315138;
        v91 = v38 + 4;
        v32(v26, (uint64_t)v29, v22);
        uint64_t v39 = sub_23CA0E4F0();
        uint64_t v93 = sub_23C9BC474(v39, v40, (uint64_t *)&v94);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v74)(v29, v22);
        _os_log_impl(&dword_23C9B6000, v36, v37, "Unexpected duration unit %s. Using zero for this component.", v38, 0xCu);
        uint64_t v41 = v92;
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v41, -1, -1);
        MEMORY[0x23ECEDBE0](v38, -1, -1);
      }
      else
      {
        ((void (*)(char *, uint64_t))v74)(v29, v22);
      }
    }
    else
    {
      uint64_t v42 = *(int *)(v18 + 48);
      uint64_t v43 = sub_23CA0CE10();
      uint64_t v44 = *(void *)(v43 - 8);
      uint64_t v45 = v44;
      uint64_t v90 = *(void *)(v44 + 32);
      uint64_t v46 = (uint64_t)v91;
      ((void (*)(uint8_t *, char *, uint64_t))v90)(v91, v17, v43);
      uint64_t v72 = *(void *)&v17[v42];
      *(void *)(v46 + v42) = v72;
      uint64_t v47 = v78;
      sub_23CA0CD30();
      uint64_t v48 = v82;
      sub_23CA0CD40();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v47, v80);
      uint64_t v49 = v85;
      sub_23CA0CC90();
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7E8);
      uint64_t v51 = *(void *)(v44 + 72);
      uint64_t v52 = *(unsigned __int8 *)(v44 + 80);
      uint64_t v53 = (v52 + 32) & ~v52;
      v78 = (char *)(v53 + v51);
      uint64_t v79 = v50;
      uint64_t v74 = (void (*)(char *, uint64_t, double))(v52 | 7);
      uint64_t v54 = swift_allocObject();
      long long v73 = xmmword_23CA0F8D0;
      *(_OWORD *)(v54 + 16) = xmmword_23CA0F8D0;
      uint64_t v80 = v45;
      uint64_t v55 = v77;
      uint64_t v56 = v46;
      uint64_t v57 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v77, v56, v43);
      ((void (*)(uint64_t, char *, uint64_t))v90)(v54 + v53, v55, v43);
      sub_23C9F7478(v54);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_23CA0CD90();
      swift_bridgeObjectRelease();
      uint64_t v58 = (uint64_t)v81;
      sub_23CA0CDD0();
      uint64_t v59 = v88;
      uint64_t v60 = v89;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v58, 1, v89) == 1)
      {
        sub_23C9BAA2C(v58, &qword_268BBE460);
        (*(void (**)(char *, uint64_t))(v86 + 8))(v92, v87);
      }
      else
      {
        float v61 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v75, v58, v60);
        uint64_t v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = v73;
        uint64_t v63 = v59;
        (*(void (**)(uint64_t, void, uint64_t))(v80 + 104))(v62 + v53, *MEMORY[0x263F078C8], v43);
        sub_23C9F7478(v62);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        float v64 = v76;
        sub_23CA0CD80();
        swift_bridgeObjectRelease();
        uint64_t v90 = sub_23CA0CB90();
        char v66 = v65;
        uint64_t v67 = v87;
        int v68 = *(void (**)(char *, uint64_t))(v86 + 8);
        v68(v64, v87);
        uint64_t v69 = v63;
        uint64_t v60 = v89;
        uint64_t v70 = *(void (**)(char *, uint64_t))(v69 + 8);
        v70(v61, v89);
        if ((v66 & 1) == 0)
        {
          v68(v92, v67);
          v70(v49, v60);
          (*(void (**)(char *, uint64_t))(v83 + 8))(v57, v84);
          sub_23C9BAA2C((uint64_t)v91, &qword_268BBE418);
          return (double)v72 * (double)v90;
        }
        uint64_t v59 = v88;
        v68(v92, v67);
      }
      (*(void (**)(char *, uint64_t))(v59 + 8))(v49, v60);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v57, v84);
      sub_23C9BAA2C((uint64_t)v91, &qword_268BBE418);
    }
    return 0.0;
  }
  return result;
}

id INIntent.withEndpointId.getter()
{
  id v8 = v0;
  id v1 = objc_msgSend(v0, sel__metadata);

  if (!v1)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10118]), sel_init);
    objc_msgSend(v0, sel__setMetadata_, v2);
  }
  id v3 = objc_msgSend(v0, sel__metadata);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_23CA0D060();
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_23CA0D2D0();
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    sub_23CA0D2C0();
    if (v5)
    {
      uint64_t v6 = (void *)sub_23CA0E4C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
    objc_msgSend(v4, sel_setEndpointId_, v6);
  }
  return v8;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id INIntent.withIntentId.getter()
{
  id v9 = v0;
  id v1 = objc_msgSend(v0, sel__metadata);

  if (!v1)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10118]), sel_init);
    objc_msgSend(v0, sel__setMetadata_, v2);
  }
  id v3 = objc_msgSend(v0, sel__metadata);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_23CA0E080();
    uint64_t v5 = (void *)sub_23CA0E070();
    if (v5)
    {
      sub_23CA0E060();
      swift_release();
      sub_23CA0CFA0();
      uint64_t v7 = v6;
      swift_release();
      if (v7)
      {
        uint64_t v5 = (void *)sub_23CA0E4C0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    objc_msgSend(v4, sel_setIntentId_, v5);
  }
  return v9;
}

uint64_t SiriTimeDeviceResolutionService.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23CA0E320();
  uint64_t result = sub_23CA0E300();
  uint64_t v4 = MEMORY[0x263F75980];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t initializeWithCopy for SiriTimeDeviceContextProvider(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t SiriTimeDeviceContextProvider.init(sharedContext:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23C9BB9E8(a1, a2);
}

uint64_t sub_23C9BB9E8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for SiriTimeMeasurement()
{
  uint64_t result = qword_268BBECE0;
  if (!qword_268BBECE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriTimeMeasurement.init(_:log:startTime:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v7 = sub_23CA0CD10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = *a1;
  uint64_t v12 = (int *)type metadata accessor for SiriTimeMeasurement();
  *(_OWORD *)(a4 + v12[7]) = xmmword_23CA0F8E0;
  *(void *)(a4 + v12[8]) = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v13 = v12[9];
  sub_23CA0CD00();
  id v14 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v15 = (void *)sub_23CA0CCE0();
  id v16 = objc_msgSend(v14, sel_initWithNSUUID_, v15);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(a4 + v13) = v16;
  *(unsigned char *)(a4 + 8) = v11;
  uint64_t v17 = a4 + v12[6];
  uint64_t v18 = sub_23CA0E410();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, a2, v18);
  *(void *)a4 = v22;
  sub_23C9FCCA4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(a2, v18);
}

uint64_t initializeWithCopy for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA0E410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  unint64_t v13 = *(void *)(v12 + 8);
  if (v13 <= 2)
  {
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  }
  else
  {
    *(void *)uint64_t v11 = *(void *)v12;
    *(void *)(v11 + 8) = v13;
    swift_bridgeObjectRetain();
  }
  uint64_t v14 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v15 = *(void **)(a2 + v14);
  *(void *)(a1 + v14) = v15;
  id v16 = v15;
  return a1;
}

void destroy for SiriTimeMeasurement(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_23CA0E410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  if (*(void *)(a1 + a2[7] + 8) >= 3uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = *(void **)(a1 + a2[9]);
}

Swift::Void __swiftcall SiriTimeMeasurement.logDelta()()
{
  id v1 = (int *)type metadata accessor for SiriTimeMeasurement();
  MEMORY[0x270FA5388](v1);
  long long v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23CA0E410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = mach_absolute_time();
  if (qword_268BBDF18 != -1) {
    swift_once();
  }
  if (v8 < *v0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (!HIDWORD(qword_268BBECC0))
  {
LABEL_12:
    __break(1u);
    return;
  }
  double v9 = (double)(v8 - *v0) * (double)(qword_268BBECC0 / HIDWORD(qword_268BBECC0)) / 1000000.0;
  sub_23C9FD480();
  uint64_t v10 = (char *)v0 + v1[7];
  unint64_t v11 = *((void *)v10 + 1);
  if (v11 != 2 && *(double *)((char *)v0 + v1[8]) < v9)
  {
    uint64_t v12 = *(void *)v10;
    sub_23C9E1A50(*(void *)v10, *((void *)v10 + 1));
    sub_23C9FDB84(v12, v11, 0, 0);
    sub_23C9FE030(v12, v11);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)v0 + v1[6], v4);
  sub_23C9BC19C((uint64_t)v0, (uint64_t)v3);
  unint64_t v13 = sub_23CA0E3F0();
  os_log_type_t v14 = sub_23CA0E710();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = v4;
    uint64_t v17 = v16;
    uint64_t v28 = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    LOBYTE(v27) = v3[8];
    unint64_t v18 = SiriTimeMeasurement.LogDescription.rawValue.getter();
    uint64_t v27 = sub_23C9BC474(v18, v19, &v28);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    sub_23C9BC760((uint64_t)v3);
    *(_WORD *)(v15 + 12) = 2080;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECC8);
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = MEMORY[0x263F8D538];
    *(_OWORD *)(v20 + 16) = xmmword_23CA0F8D0;
    uint64_t v22 = MEMORY[0x263F8D5B8];
    *(void *)(v20 + 56) = v21;
    *(void *)(v20 + 64) = v22;
    *(double *)(v20 + 32) = v9;
    uint64_t v23 = sub_23CA0E4E0();
    uint64_t v27 = sub_23C9BC474(v23, v24, &v28);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v13, v14, "SiriTime external dependency \"%s\": %s ms", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v17, -1, -1);
    MEMORY[0x23ECEDBE0](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v26);
  }
  else
  {
    sub_23C9BC760((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_23C9BC19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriTimeMeasurement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t SiriTimeMeasurement.LogDescription.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
    case 3:
    case 6:
    case 7:
    case 9:
    case 0xA:
    case 0xC:
    case 0x20:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000016;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xF:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 0x12:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 0x13:
      unint64_t result = 0xD000000000000025;
      break;
    case 0x14:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 0x15:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x16:
      unint64_t result = 0xD000000000000016;
      break;
    case 0x17:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x18:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x19:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x1A:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x1B:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x1C:
      unint64_t result = 0xD000000000000025;
      break;
    case 0x1D:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 0x1E:
      unint64_t result = 0xD000000000000026;
      break;
    case 0x1F:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 0x21:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x23:
      unint64_t result = 0x203A746163626F42;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9BC474(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23C9BC548(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23C9BC704((uint64_t)v12, *a3);
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
      sub_23C9BC704((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23C9BC548(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23CA0E7D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23C9BC7BC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_23CA0E950();
  if (!v8)
  {
    sub_23CA0E9A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23CA0EA00();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23C9BC704(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23C9BC760(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriTimeMeasurement();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C9BC7BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23C9BC854(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23C9C88C4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23C9C88C4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C9BC854(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_23C9C885C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23CA0E900();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23CA0E9A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23CA0E560();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23CA0EA00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23CA0E9A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_23C9BC9CC(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_23CA0E860();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    unint64_t v3 = (uint64_t *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
    unint64_t v3 = (uint64_t *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_23C9C557C((uint64_t)&v8, v3 + 4, v2, a1);
  uint64_t result = sub_23C9EFC6C();
  if (v6 == v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t NLContextUpdate.set(undoDirectInvocation:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6F0);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23CA0D430();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  return sub_23CA0D1C0();
}

uint64_t PunchOutApp.toResponseFrameworkCommandAction()@<X0>(uint64_t a1@<X8>)
{
  v57[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_23CA0CD10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23CA0CC40();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = *v1;
  LOBYTE(v57[0]) = *v1;
  PunchOutApp.url.getter((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_23C9D8A04((uint64_t)v9);
    if (qword_268BBDF30 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_23CA0E410();
    __swift_project_value_buffer(v15, (uint64_t)qword_268BC2D00);
    uint64_t v16 = sub_23CA0E3F0();
    os_log_type_t v17 = sub_23CA0E700();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      unint64_t v19 = (void *)swift_slowAlloc();
      v57[0] = v19;
      *(_DWORD *)unint64_t v18 = 136315138;
      LOBYTE(v56) = v14;
      uint64_t v20 = sub_23CA0E4F0();
      uint64_t v56 = sub_23C9BC474(v20, v21, (uint64_t *)v57);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v16, v17, "Error creating URL for punchout for app %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v19, -1, -1);
      MEMORY[0x23ECEDBE0](v18, -1, -1);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
    uint64_t v23 = (void *)sub_23CA0CC10();
    objc_msgSend(v22, sel_setPunchOutUri_, v23);

    id v24 = v22;
    sub_23CA0CD00();
    sub_23CA0CCD0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v25 = (void *)sub_23CA0E4C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_setAceId_, v25);

    id v26 = objc_msgSend(v24, sel_dictionary);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = self;
      v57[0] = 0;
      id v29 = objc_msgSend(v28, sel_dataWithPropertyList_format_options_error_, v27, 200, 0, v57);
      id v30 = v57[0];
      if (v29)
      {
        uint64_t v31 = sub_23CA0CC70();
        unint64_t v33 = v32;

        sub_23CA0CC60();
        sub_23CA0E130();
        sub_23C9BD308(v31, v33);

        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        uint64_t v34 = sub_23CA0E140();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(a1, 0, 1, v34);
      }
      char v36 = v30;
      os_log_type_t v37 = (void *)sub_23CA0CC00();

      swift_willThrow();
      if (qword_268BBDF30 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_23CA0E410();
      __swift_project_value_buffer(v38, (uint64_t)qword_268BC2D00);
      id v39 = v37;
      id v40 = v37;
      uint64_t v41 = sub_23CA0E3F0();
      os_log_type_t v42 = sub_23CA0E700();
      int v43 = v42;
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v44 = swift_slowAlloc();
        int v54 = v43;
        uint64_t v45 = (uint8_t *)v44;
        uint64_t v55 = (void *)swift_slowAlloc();
        uint64_t v56 = (uint64_t)v37;
        v57[0] = v55;
        uint64_t v53 = v45;
        *(_DWORD *)uint64_t v45 = 136315138;
        uint64_t v52 = v45 + 4;
        id v46 = v37;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
        uint64_t v47 = sub_23CA0E4F0();
        uint64_t v56 = sub_23C9BC474(v47, v48, (uint64_t *)v57);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();

        uint64_t v49 = v53;
        _os_log_impl(&dword_23C9B6000, v41, (os_log_type_t)v54, "Error generating ACE punch out command: %s", v53, 0xCu);
        uint64_t v50 = v55;
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v50, -1, -1);
        MEMORY[0x23ECEDBE0](v49, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
  uint64_t v51 = sub_23CA0E140();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(a1, 1, 1, v51);
}

uint64_t sub_23C9BD308(uint64_t a1, unint64_t a2)
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

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isTimerBobcatLocaleExpansionEnabled()()
{
  return sub_23C9B940C(4, "TimerBobcat locale expansion FeatureFlag is enabled!");
}

unint64_t sub_23C9BD370()
{
  unint64_t result = qword_268BBF040;
  if (!qword_268BBF040)
  {
    sub_23CA0D100();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBF040);
  }
  return result;
}

uint64_t Siri_Nlu_External_UserParse.firstUsoTask.getter()
{
  uint64_t v0 = sub_23CA0D5E0();
  uint64_t v48 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0D570();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v47 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23CA0D490();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v45 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v46 = (char *)&v40 - v13;
  uint64_t v14 = sub_23CA0D4A0();
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v41 = v2;
    uint64_t v42 = v0;
    uint64_t v43 = v10;
    uint64_t v44 = v9;
    uint64_t v40 = v4;
    unint64_t v18 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v16 = v4 + 16;
    os_log_type_t v17 = v18;
    unint64_t v19 = v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    uint64_t v20 = *(void *)(v16 + 56);
    while (1)
    {
      v17(v6, v19, v3);
      if (sub_23CA0D4F0()) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v16 - 8))(v6, v3);
      v19 += v20;
      if (!--v15)
      {
        uint64_t v21 = 1;
        uint64_t v22 = v43;
        uint64_t v23 = v44;
        uint64_t v2 = v41;
        uint64_t v0 = v42;
        uint64_t v25 = (uint64_t)v47;
        uint64_t v24 = v48;
        uint64_t v4 = v40;
        goto LABEL_8;
      }
    }
    uint64_t v4 = v40;
    uint64_t v25 = (uint64_t)v47;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v47, v6, v3);
    uint64_t v21 = 0;
    uint64_t v22 = v43;
    uint64_t v23 = v44;
    uint64_t v2 = v41;
    uint64_t v0 = v42;
    uint64_t v24 = v48;
  }
  else
  {
    uint64_t v21 = 1;
    uint64_t v23 = v9;
    uint64_t v22 = v10;
    uint64_t v25 = (uint64_t)v47;
    uint64_t v24 = v48;
  }
LABEL_8:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v25, v21, 1, v3);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v25, 1, v3) != 1)
  {
    sub_23CA0D530();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v25, v3);
    id v26 = v45;
    sub_23CA0D5B0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v2, v0);
    uint64_t v27 = v46;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v46, v26, v23);
    sub_23CA0D6A0();
    unint64_t v34 = MEMORY[0x23ECEBFE0]();
    unint64_t v35 = v34;
    if (v34 >> 62)
    {
      if (sub_23CA0E9C0()) {
        goto LABEL_20;
      }
    }
    else if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_20:
      if ((v35 & 0xC000000000000001) != 0)
      {
        uint64_t v32 = MEMORY[0x23ECED190](0, v35);
        goto LABEL_23;
      }
      if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v32 = *(void *)(v35 + 32);
        swift_retain();
LABEL_23:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v23);
        swift_release();
        return v32;
      }
      __break(1u);
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    if (qword_268BBDE68 == -1)
    {
LABEL_26:
      uint64_t v36 = sub_23CA0E410();
      __swift_project_value_buffer(v36, (uint64_t)qword_268BBE3E8);
      os_log_type_t v37 = sub_23CA0E3F0();
      os_log_type_t v38 = sub_23CA0E700();
      if (os_log_type_enabled(v37, v38))
      {
        id v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v39 = 0;
        _os_log_impl(&dword_23C9B6000, v37, v38, "NLToSiriKitIntentConverter userStartUSOGraph has no tasks. Returning nil intent", v39, 2u);
        MEMORY[0x23ECEDBE0](v39, -1, -1);
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v23);
      return 0;
    }
LABEL_31:
    swift_once();
    goto LABEL_26;
  }
  sub_23C9BAA2C(v25, &qword_268BBE400);
  if (qword_268BBDE68 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_23CA0E410();
  __swift_project_value_buffer(v28, (uint64_t)qword_268BBE3E8);
  id v29 = sub_23CA0E3F0();
  os_log_type_t v30 = sub_23CA0E700();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_23C9B6000, v29, v30, "Failed to parse userParse. Returning nil intent", v31, 2u);
    MEMORY[0x23ECEDBE0](v31, -1, -1);
  }

  return 0;
}

uint64_t SiriReferenceResolutionResolver.hasReference(usoEntity:)(uint64_t result)
{
  if (result)
  {
    __swift_project_boxed_opaque_existential_1(v1, v1[3]);
    swift_retain();
    char v2 = sub_23CA0E210();
    swift_release();
    return v2 & 1;
  }
  return result;
}

uint64_t UsoEntity_common_DateTime.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  MEMORY[0x270FA5388](v0 - 8);
  char v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0D8B0();
  if (!sub_23CA0E040())
  {
    uint64_t v5 = sub_23CA0DFB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_23CA0DFC0();
  swift_release();
  uint64_t v4 = sub_23CA0DFB0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
    return v3;
  }
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
  if (sub_23CA0E040())
  {
    sub_23CA0DF60();
    swift_release();
  }
  return v3;
}

uint64_t static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(uint64_t a1, uint64_t a2)
{
  return sub_23C9BDBD8(a1, 0, a2);
}

uint64_t sub_23C9BDBD8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v163 = a3;
  int v162 = a2;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE490);
  uint64_t v135 = *(void *)(v134 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v134);
  v128 = (char *)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v164 = (char *)&v127 - v6;
  uint64_t v161 = sub_23CA0DE40();
  uint64_t v159 = *(void *)(v161 - 8);
  MEMORY[0x270FA5388](v161);
  v160 = (char *)&v127 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_23CA0DE50();
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  v158 = (char *)&v127 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_23CA0DE70();
  uint64_t v139 = *(void *)(v138 - 8);
  MEMORY[0x270FA5388](v138);
  v166 = (char *)&v127 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_23CA0DE80();
  uint64_t v152 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153);
  v155 = (char *)&v127 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23CA0CE40();
  MEMORY[0x270FA5388](v11 - 8);
  v154 = (char *)&v127 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_23CA0CD10();
  uint64_t v148 = *(void *)(v151 - 8);
  MEMORY[0x270FA5388](v151);
  v146 = (char *)&v127 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_23CA0E410();
  uint64_t v149 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  v143 = (char *)&v127 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for SiriTimeMeasurement();
  uint64_t v15 = MEMORY[0x270FA5388](v144);
  v145 = (char *)&v127 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v165 = (uint64_t)&v127 - v17;
  uint64_t v136 = sub_23CA0DE30();
  uint64_t v137 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  v171 = (char *)&v127 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_23CA0CE10();
  uint64_t v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  v131 = (char *)&v127 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23CA0CD60();
  uint64_t v142 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  v150 = (char *)&v127 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v147 = (char *)&v127 - v24;
  MEMORY[0x270FA5388](v23);
  v168 = (char *)&v127 - v25;
  uint64_t v141 = sub_23CA0DED0();
  uint64_t v140 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  uint64_t v27 = (char *)&v127 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_23CA0CE20();
  uint64_t v170 = *(void *)(v167 - 8);
  MEMORY[0x270FA5388](v167);
  v172 = (char *)&v127 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE498);
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v31 = (char *)&v127 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_23CA0CBE0();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  unint64_t v35 = (char *)&v127 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  v130 = (char *)&v127 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v127 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v127 - v42;
  uint64_t v44 = sub_23CA0CCB0();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v174 = v44;
  uint64_t v175 = v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  MEMORY[0x270FA5388](v46);
  v176 = (char *)&v127 - v48;
  uint64_t v173 = a1;
  if (!a1)
  {
    if (qword_268BBDE70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v169, (uint64_t)qword_268BBE448);
    uint64_t v51 = sub_23CA0E3F0();
    os_log_type_t v52 = sub_23CA0E710();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_23C9B6000, v51, v52, "Can NOT infer dateTime from nil.", v53, 2u);
      MEMORY[0x23ECEDBE0](v53, -1, -1);
    }

    return 0;
  }
  uint64_t v129 = v47;
  if (!v163)
  {
    uint64_t v50 = v174;
    uint64_t v49 = v175;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v175 + 56))(v43, 1, 1, v174);
    swift_retain();
    goto LABEL_12;
  }
  swift_retain();
  DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)(1, (uint64_t)v31);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
  {
    sub_23C9BAA2C((uint64_t)v31, &qword_268BBE498);
    uint64_t v50 = v174;
    uint64_t v49 = v175;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v175 + 56))(v43, 1, 1, v174);
LABEL_12:
    if (qword_268BBDE78 != -1) {
      swift_once();
    }
    uint64_t v56 = __swift_project_value_buffer(v36, (uint64_t)qword_268BC2CE0);
    sub_23C9BFA3C(v56, (uint64_t)v41);
    uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    if (v55(v41, 1, v50) == 1)
    {
      sub_23C9BAA2C((uint64_t)v41, &qword_268BBE460);
      sub_23CA0CCA0();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v176, v41, v50);
    }
    sub_23C9BAA2C((uint64_t)v43, &qword_268BBE460);
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v35, v31, v32);
  int v54 = v172;
  sub_23CA0CDF0();
  sub_23CA0CDC0();
  (*(void (**)(char *, uint64_t))(v170 + 8))(v54, v167);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
  uint64_t v50 = v174;
  uint64_t v49 = v175;
  uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v175 + 48);
  if (v55(v43, 1, v174) == 1) {
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v176, v43, v50);
LABEL_18:
  if (qword_268BBE6C0)
  {
    uint64_t v57 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v57 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v57;
    swift_retain();
    swift_release();
  }
  sub_23C9BFAA4(v57 + 16, (uint64_t)v181);
  swift_retain();
  swift_release();
  sub_23CA0DEC0();
  uint64_t v58 = v172;
  sub_23CA0CDF0();
  __swift_project_boxed_opaque_existential_1(v181, v181[3]);
  uint64_t v59 = v168;
  sub_23CA0D080();
  sub_23C9D4430(MEMORY[0x263F8EE78]);
  char v60 = sub_23CA0DEB0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v142 + 8))(v59, v20);
  uint64_t v61 = v170 + 8;
  uint64_t v62 = *(void (**)(char *, uint64_t))(v170 + 8);
  v62(v58, v167);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v27, v141);
  if (v60)
  {
    uint64_t v170 = v61;
    if (qword_268BBDE70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v169, (uint64_t)qword_268BBE448);
    uint64_t v63 = sub_23CA0E3F0();
    os_log_type_t v64 = sub_23CA0E710();
    if (os_log_type_enabled(v63, v64))
    {
      char v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v65 = 0;
      _os_log_impl(&dword_23C9B6000, v63, v64, "witching hours active; moving referenceDate back by 1 day", v65, 2u);
      MEMORY[0x23ECEDBE0](v65, -1, -1);
    }

    char v66 = v172;
    sub_23CA0CDF0();
    uint64_t v67 = v132;
    int v68 = v131;
    uint64_t v69 = v133;
    (*(void (**)(char *, void, uint64_t))(v132 + 104))(v131, *MEMORY[0x263F07870], v133);
    uint64_t v70 = (uint64_t)v130;
    uint64_t v71 = v176;
    sub_23CA0CDE0();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
    v62(v66, v167);
    uint64_t v73 = v174;
    uint64_t v72 = v175;
    if (v55((char *)v70, 1, v174) == 1)
    {
      sub_23C9BAA2C(v70, &qword_268BBE460);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
      (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v71, v70, v73);
    }
  }
  sub_23CA0DE20();
  if (qword_268BBE6C0)
  {
    uint64_t v74 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v74 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v74;
    swift_retain();
    swift_release();
  }
  sub_23C9BFAA4(v74 + 16, (uint64_t)&v179);
  swift_retain();
  swift_release();
  if (qword_268BBDE70 != -1) {
    swift_once();
  }
  uint64_t v75 = v169;
  uint64_t v76 = __swift_project_value_buffer(v169, (uint64_t)qword_268BBE448);
  uint64_t v77 = v149;
  v78 = *(void (**)(char *))(v149 + 16);
  uint64_t v79 = v143;
  uint64_t v170 = v76;
  v78(v143);
  uint64_t v167 = mach_absolute_time();
  uint64_t v80 = (int *)v144;
  uint64_t v81 = (uint64_t)v145;
  *(_OWORD *)&v145[*(int *)(v144 + 28)] = xmmword_23CA0F8E0;
  *(void *)(v81 + v80[8]) = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v142 = v80[9];
  v82 = v146;
  sub_23CA0CD00();
  id v83 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v84 = (void *)sub_23CA0CCE0();
  id v85 = objc_msgSend(v83, sel_initWithNSUUID_, v84);

  (*(void (**)(char *, uint64_t))(v148 + 8))(v82, v151);
  *(void *)(v81 + v142) = v85;
  *(unsigned char *)(v81 + 8) = 27;
  ((void (*)(uint64_t, char *, uint64_t))v78)(v81 + v80[6], v79, v75);
  *(void *)uint64_t v81 = v167;
  sub_23C9FCCA4();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v75);
  sub_23C9D43CC(v81, v165);
  __swift_project_boxed_opaque_existential_1(&v179, v180);
  sub_23CA0D080();
  __swift_project_boxed_opaque_existential_1(&v179, v180);
  sub_23CA0D080();
  __swift_project_boxed_opaque_existential_1(&v179, v180);
  sub_23CA0D080();
  sub_23CA0CE30();
  (*(void (**)(char *, void, uint64_t))(v152 + 104))(v155, *MEMORY[0x263F6D440], v153);
  sub_23CA0CDF0();
  (*(void (**)(uint64_t, char *, uint64_t))(v175 + 16))(v129, v176, v174);
  sub_23CA0DEA0();
  swift_allocObject();
  sub_23CA0DE90();
  uint64_t v86 = (unsigned int *)MEMORY[0x263F6D428];
  if ((v162 & 1) == 0) {
    uint64_t v86 = (unsigned int *)MEMORY[0x263F6D420];
  }
  (*(void (**)(char *, void, uint64_t))(v156 + 104))(v158, *v86, v157);
  (*(void (**)(char *, void, uint64_t))(v159 + 104))(v160, *MEMORY[0x263F6D418], v161);
  sub_23C9D4430(MEMORY[0x263F8EE78]);
  sub_23CA0DE60();
  uint64_t v87 = v164;
  sub_23CA0DE10();
  SiriTimeMeasurement.logDelta()();
  uint64_t v88 = v135;
  uint64_t v89 = v128;
  uint64_t v90 = v134;
  (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v128, v87, v134);
  if ((*(unsigned int (**)(char *, uint64_t))(v88 + 88))(v89, v90) == *MEMORY[0x263F6D398])
  {
    (*(void (**)(char *, uint64_t))(v88 + 96))(v89, v90);
    uint64_t v91 = *(void *)v89;
    swift_retain_n();
    v92 = sub_23CA0E3F0();
    os_log_type_t v93 = sub_23CA0E710();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      uint64_t v178 = v95;
      *(_DWORD *)v94 = 136315138;
      if (sub_23CA0E040())
      {
        char v96 = sub_23CA0DF50();
        swift_release();
        char v97 = v96 & 1;
      }
      else
      {
        char v97 = 2;
      }
      LOBYTE(v177) = v97;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4A8);
      uint64_t v115 = sub_23CA0E4F0();
      uint64_t v177 = sub_23C9BC474(v115, v116, &v178);
      sub_23CA0E7C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v92, v93, "[DateTimeInferenceUtils.infer] Inference recommended meridiemSetByUser = %s", v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v95, -1, -1);
      MEMORY[0x23ECEDBE0](v94, -1, -1);

      uint64_t v88 = v135;
    }
    else
    {

      swift_release_n();
    }
    v117 = v166;
    if (sub_23CA0E040() || v163 && sub_23CA0E040())
    {
      sub_23CA0DF50();
      swift_release();
    }
    if (sub_23CA0E040())
    {
      char v118 = sub_23CA0DF50();
      swift_release();
      if ((v118 & 1) == 0 && sub_23CA0E040())
      {
        sub_23CA0DF60();
        swift_release();
      }
      swift_retain_n();
      v119 = sub_23CA0E3F0();
      os_log_type_t v120 = sub_23CA0E710();
      if (os_log_type_enabled(v119, v120))
      {
        v121 = (uint8_t *)swift_slowAlloc();
        uint64_t v122 = swift_slowAlloc();
        uint64_t v178 = v122;
        *(_DWORD *)v121 = 136315138;
        if (sub_23CA0E040())
        {
          char v123 = sub_23CA0DF50();
          swift_release();
          char v124 = v123 & 1;
        }
        else
        {
          char v124 = 2;
        }
        LOBYTE(v177) = v124;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4A8);
        uint64_t v125 = sub_23CA0E4F0();
        uint64_t v177 = sub_23C9BC474(v125, v126, &v178);
        sub_23CA0E7C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C9B6000, v119, v120, "[DateTimeInferenceUtils.infer] Returning with meridiemSetByUser = %s", v121, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v122, -1, -1);
        MEMORY[0x23ECEDBE0](v121, -1, -1);
        swift_release();

        swift_release();
        (*(void (**)(char *, uint64_t))(v135 + 8))(v87, v134);
        (*(void (**)(char *, uint64_t))(v139 + 8))(v166, v138);
        goto LABEL_71;
      }
      swift_release();
      swift_release_n();
    }
    else
    {
      if (sub_23CA0E040())
      {
        sub_23CA0DF60();
        swift_release();
      }
      swift_release();
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v134);
    (*(void (**)(char *, uint64_t))(v139 + 8))(v117, v138);
LABEL_71:
    sub_23C9BC760(v165);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v171, v136);
    (*(void (**)(char *, uint64_t))(v175 + 8))(v176, v174);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v179);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v181);
    return v91;
  }
  v98 = *(void (**)(char *, uint64_t))(v88 + 8);
  v98(v89, v90);
  swift_retain_n();
  v99 = sub_23CA0E3F0();
  os_log_type_t v100 = sub_23CA0E700();
  BOOL v101 = os_log_type_enabled(v99, v100);
  uint64_t v135 = v88 + 8;
  v172 = (char *)v98;
  if (v101)
  {
    v102 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = swift_slowAlloc();
    uint64_t v178 = v103;
    *(_DWORD *)v102 = 136315138;
    uint64_t v104 = sub_23CA0E000();
    uint64_t v177 = sub_23C9BC474(v104, v105, &v178);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v99, v100, "Not confident when inferring alarm time, dateTime = %s", v102, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v103, -1, -1);
    MEMORY[0x23ECEDBE0](v102, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_retain_n();
  v106 = sub_23CA0E3F0();
  os_log_type_t v107 = sub_23CA0E700();
  if (os_log_type_enabled(v106, v107))
  {
    v108 = (uint8_t *)swift_slowAlloc();
    uint64_t v109 = swift_slowAlloc();
    uint64_t v178 = v109;
    *(_DWORD *)v108 = 136315138;
    uint64_t v177 = sub_23CA0E010();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4A0);
    uint64_t v110 = sub_23CA0E790();
    unint64_t v112 = v111;
    swift_release();
    uint64_t v177 = sub_23C9BC474(v110, v112, &v178);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v106, v107, "%s", v108, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v109, -1, -1);
    MEMORY[0x23ECEDBE0](v108, -1, -1);
    swift_release();

    swift_release();
    v113 = v164;
  }
  else
  {
    swift_release_n();

    swift_release();
    v113 = v87;
  }
  ((void (*)(char *, uint64_t))v172)(v113, v134);
  (*(void (**)(char *, uint64_t))(v139 + 8))(v166, v138);
  sub_23C9BC760(v165);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v171, v136);
  (*(void (**)(char *, uint64_t))(v175 + 8))(v176, v174);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v179);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v181);
  return 0;
}

uint64_t sub_23C9BFA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C9BFAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

INDateComponentsRange_optional __swiftcall DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(Swift::Bool shouldUseInferredMeridiem, Swift::Bool insertToEndTime)
{
  uint64_t v3 = v2;
  BOOL v68 = insertToEndTime;
  BOOL v73 = shouldUseInferredMeridiem;
  v78[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE498);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v69 = (char *)&v66 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v76 = (objc_class *)((char *)&v66 - v10);
  uint64_t v11 = sub_23CA0CBE0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v74 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v66 - v15;
  v17.super.isa = DateTime.asDateComponentsRange()().super.isa;
  if (qword_268BBDEB8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_23CA0E410();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_268BBE7A8);
  uint64_t v20 = v17.super.isa;
  uint64_t v75 = v19;
  uint64_t v21 = sub_23CA0E3F0();
  os_log_type_t v22 = sub_23CA0E710();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v70 = v7;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v67 = v3;
    uint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v71 = v12;
    uint64_t v72 = v11;
    uint64_t v27 = (void *)v26;
    *(_DWORD *)uint64_t v25 = 138412290;
    v78[0] = (uint64_t)v20;
    uint64_t v28 = v20;
    sub_23CA0E7C0();
    void *v27 = v20;

    _os_log_impl(&dword_23C9B6000, v21, v22, "Got inferred dateTime.asDateComponentsRange(): %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
    swift_arrayDestroy();
    uint64_t v29 = v27;
    uint64_t v12 = v71;
    uint64_t v11 = v72;
    MEMORY[0x23ECEDBE0](v29, -1, -1);
    uint64_t v30 = v25;
    uint64_t v3 = v67;
    MEMORY[0x23ECEDBE0](v30, -1, -1);
  }
  else
  {
  }
  id v31 = [(objc_class *)v20 allDay];
  uint64_t v32 = v76;
  if (v31)
  {
    uint64_t v33 = v31;
    sub_23C9C07EC();
    uint64_t v34 = (void *)sub_23CA0E730();
    char v35 = sub_23CA0E750();

    if (v35)
    {
      uint64_t v36 = sub_23CA0E3F0();
      os_log_type_t v37 = sub_23CA0E710();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_23C9B6000, v36, v37, "User didn't mention a time point, mentioned a day.", v38, 2u);
        MEMORY[0x23ECEDBE0](v38, -1, -1);

LABEL_23:
        id v54 = 0;
        goto LABEL_24;
      }

      goto LABEL_22;
    }
  }
  id v40 = [(objc_class *)v20 startDateComponents];
  if (!v40)
  {
    (*(void (**)(objc_class *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v32, 1, 1, v11);
    goto LABEL_17;
  }
  uint64_t v41 = v40;
  uint64_t v42 = v74;
  sub_23CA0CAE0();

  uint64_t v43 = *(void (**)(objc_class *, char *, uint64_t))(v12 + 32);
  v43(v32, v42, v11);
  uint64_t v44 = *(void (**)(objc_class *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v44(v32, 0, 1, v11);
  if ((*(unsigned int (**)(objc_class *, uint64_t, uint64_t))(v12 + 48))(v32, 1, v11) == 1)
  {
LABEL_17:
    sub_23C9BAA2C((uint64_t)v32, &qword_268BBE498);
    swift_retain_n();
    uint64_t v48 = sub_23CA0E3F0();
    os_log_type_t v49 = sub_23CA0E710();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v77 = v3;
      v78[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      sub_23CA0E050();
      uint64_t v76 = v20;
      sub_23C9C0E9C(&qword_268BBE7C8, MEMORY[0x263F6D778]);
      uint64_t v52 = sub_23CA0EB80();
      uint64_t v77 = sub_23C9BC474(v52, v53, v78);
      sub_23CA0E7C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v48, v49, "Failed to get startDateComponents from inferred dateTime: %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v51, -1, -1);
      MEMORY[0x23ECEDBE0](v50, -1, -1);

      goto LABEL_23;
    }

    swift_release_n();
LABEL_22:

    goto LABEL_23;
  }
  v43((objc_class *)v16, (char *)v32, v11);
  if ((sub_23C9C082C(v3, v73) & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    goto LABEL_22;
  }
  uint64_t v45 = (uint64_t)v69;
  if (v68)
  {
    v44((objc_class *)v69, 1, 1, v11);
    uint64_t v46 = (uint64_t)v70;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v70, v16, v11);
    uint64_t v47 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v69, v16, v11);
    uint64_t v47 = 1;
    v44((objc_class *)v45, 0, 1, v11);
    uint64_t v46 = (uint64_t)v70;
  }
  v44((objc_class *)v46, v47, 1, v11);
  id v56 = [(objc_class *)v20 recurrenceRule];
  id v57 = objc_allocWithZone(MEMORY[0x263F0FA60]);
  id v54 = sub_23C9C0EE4(v45, v46, v56);
  uint64_t v58 = (objc_class *)v54;
  uint64_t v59 = sub_23CA0E3F0();
  char v60 = v20;
  os_log_type_t v61 = sub_23CA0E710();
  if (os_log_type_enabled(v59, v61))
  {
    uint64_t v76 = (objc_class *)v16;
    uint64_t v71 = v12;
    uint64_t v72 = v11;
    uint64_t v62 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v62 = 138412290;
    if (v58)
    {
      v78[0] = (uint64_t)v58;
      os_log_type_t v64 = v58;
      sub_23CA0E7C0();
      id v65 = v54;
    }
    else
    {
      v78[0] = 0;
      sub_23CA0E7C0();
      id v65 = 0;
    }
    void *v63 = v65;

    _os_log_impl(&dword_23C9B6000, v59, v61, "Transformed in asTimePoint() to 24 Hour date time: %@", v62, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v63, -1, -1);
    MEMORY[0x23ECEDBE0](v62, -1, -1);
    uint64_t v58 = v60;
    uint64_t v12 = v71;
    uint64_t v11 = v72;
    uint64_t v16 = (char *)v76;
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
LABEL_24:
  uint64_t v55 = (objc_class *)v54;
  result.value.super.isa = v55;
  result.is_nil = v39;
  return result;
}

INDateComponentsRange __swiftcall DateTime.asDateComponentsRange()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE468);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v27 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_23CA0CE40();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_23CA0CE20();
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23CA0CD60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v25 = v4;
  if (qword_268BBE6C0)
  {
    uint64_t v14 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v14 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v14;
    swift_retain();
    swift_release();
  }
  sub_23C9BFAA4(v14 + 16, (uint64_t)v29);
  swift_retain();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v29, v30);
  sub_23CA0D080();
  sub_23CA0CD40();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v13, v7);
  __swift_project_boxed_opaque_existential_1(v29, v30);
  sub_23CA0D080();
  uint64_t v16 = (uint64_t)v27;
  sub_23CA0CD50();
  v15(v11, v7);
  uint64_t v17 = v28;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v16, 1, v28) == 1)
  {
    uint64_t v18 = v25;
    sub_23CA0CE30();
    sub_23C9BAA2C(v16, &qword_268BBE468);
  }
  else
  {
    uint64_t v18 = v25;
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v25, v16, v17);
  }
  uint64_t v19 = v26;
  uint64_t v20 = v24;
  uint64_t v21 = sub_23CA0E020();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v18, v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  return (INDateComponentsRange)v21;
}

unint64_t sub_23C9C07EC()
{
  unint64_t result = qword_268BBE4D0;
  if (!qword_268BBE4D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BBE4D0);
  }
  return result;
}

uint64_t sub_23C9C082C(uint64_t a1, char a2)
{
  if (!sub_23CA0E040())
  {
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23CA0E410();
    __swift_project_value_buffer(v12, (uint64_t)qword_268BBE7A8);
    uint64_t v13 = sub_23CA0E3F0();
    os_log_type_t v14 = sub_23CA0E710();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_23C9B6000, v13, v14, "adjustHour(in:inferMeridiem:) Can not find time in inferred dateTime.", v15, 2u);
      MEMORY[0x23ECEDBE0](v15, -1, -1);
    }

    return 0;
  }
  sub_23C9C0BF0(a2 & 1);
  if (v3)
  {
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_23CA0E410();
    __swift_project_value_buffer(v16, (uint64_t)qword_268BBE7A8);
    uint64_t v17 = sub_23CA0E3F0();
    os_log_type_t v18 = sub_23CA0E710();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_23C9B6000, v17, v18, "adjustHour(in:inferMeridiem:) Can not find hour in inferred dateTime.", v19, 2u);
      MEMORY[0x23ECEDBE0](v19, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
    return 0;
  }
  sub_23CA0CB30();
  if (qword_268BBDEB8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_23CA0E410();
  __swift_project_value_buffer(v4, (uint64_t)qword_268BBE7A8);
  swift_retain_n();
  uint64_t v5 = sub_23CA0E3F0();
  os_log_type_t v6 = sub_23CA0E710();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_23CA0DF80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7E0);
    uint64_t v9 = sub_23CA0E4F0();
    sub_23C9BC474(v9, v10, &v21);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2048;
    sub_23CA0E7C0();
    _os_log_impl(&dword_23C9B6000, v5, v6, "adjustHour(in:inferMeridiem:), original hour = %s, fixed hour = %ld", (uint8_t *)v7, 0x16u);
    uint64_t v11 = 1;
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v8, -1, -1);
    MEMORY[0x23ECEDBE0](v7, -1, -1);
    swift_release();
  }
  else
  {

    swift_release_n();
    return 1;
  }
  return v11;
}

uint64_t sub_23C9C0BF0(int a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23CA0DFB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v19 - v10;
  uint64_t v12 = sub_23CA0DF80();
  if ((v13 & 1) == 0 && ((sub_23CA0DF50() | a1) & 1) != 0 && v12 && (unint64_t)(v12 - 13) >= 0xB)
  {
    if (v12 == 24) {
      return 0;
    }
    sub_23CA0DFC0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_23C9BAA2C((uint64_t)v4, &qword_268BBE7C0);
      return v12;
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F6D580], v5);
    sub_23C9C0E9C(&qword_268BBE7D8, MEMORY[0x263F6D588]);
    sub_23CA0E580();
    sub_23CA0E580();
    uint64_t v15 = v19[0];
    uint64_t v14 = v19[1];
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    v16(v11, v5);
    if (v14 == v15)
    {
      if (v12 == 12) {
        return v12;
      }
      BOOL v17 = __OFADD__(v12, 12);
      v12 += 12;
      if (!v17) {
        return v12;
      }
      __break(1u);
    }
    if (v12 == 12) {
      return 0;
    }
  }
  return v12;
}

uint64_t sub_23C9C0E9C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_23C9C0EE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_23CA0CBE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  uint64_t v11 = 0;
  if (v10(a1, 1, v8) != 1)
  {
    uint64_t v11 = (void *)sub_23CA0CAD0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  if (v10(a2, 1, v8) == 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (void *)sub_23CA0CAD0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  }
  id v13 = objc_msgSend(v4, sel_initWithStartDateComponents_endDateComponents_recurrenceRule_, v11, v12, a3);

  return v13;
}

uint64_t UsoEntity_common_Alarm.relativeOffsetInMinutes.getter()
{
  uint64_t v0 = sub_23CA0DC30();
  uint64_t v69 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v65 = (char *)v62 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC70);
  MEMORY[0x270FA5388](v68);
  uint64_t v3 = (char *)v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC78);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v67 = (uint64_t)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v70 = (uint64_t)v62 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v71 = (uint64_t)v62 - v9;
  uint64_t v10 = sub_23CA0D8F0();
  uint64_t v72 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v66 = (char *)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC80);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC88);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  os_log_type_t v18 = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v62 - v22;
  uint64_t v24 = sub_23CA0D7C0();
  if (!v24) {
    return 0;
  }
  uint64_t v25 = v24;
  if (!sub_23CA0D7C0() || (v63 = v3, uint64_t v26 = v0, v27 = sub_23CA0D8D0(), swift_release(), (v64 = v27) == 0))
  {
LABEL_35:
    swift_release();
    return 0;
  }
  uint64_t v28 = sub_23CA0D900();
  swift_release();
  uint64_t v29 = v26;
  if (v28)
  {
    uint64_t v30 = sub_23CA0D900();
    v62[1] = v25;
    if (v30)
    {
      sub_23CA0D8E0();
      swift_release();
      uint64_t v31 = v72;
    }
    else
    {
      uint64_t v31 = v72;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v23, 1, 1, v10);
    }
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v21, *MEMORY[0x263F72B10], v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v21, 0, 1, v10);
    uint64_t v32 = (uint64_t)&v14[*(int *)(v12 + 48)];
    sub_23C9D6238((uint64_t)v23, (uint64_t)v14, &qword_268BBEC88);
    sub_23C9D6238((uint64_t)v21, v32, &qword_268BBEC88);
    uint64_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
    if (v33((uint64_t)v14, 1, v10) == 1)
    {
      sub_23C9BAA2C((uint64_t)v21, &qword_268BBEC88);
      sub_23C9BAA2C((uint64_t)v23, &qword_268BBEC88);
      if (v33(v32, 1, v10) == 1)
      {
        sub_23C9BAA2C((uint64_t)v14, &qword_268BBEC88);
        goto LABEL_17;
      }
LABEL_14:
      sub_23C9BAA2C((uint64_t)v14, &qword_268BBEC80);
      goto LABEL_34;
    }
    sub_23C9D6238((uint64_t)v14, (uint64_t)v18, &qword_268BBEC88);
    if (v33(v32, 1, v10) == 1)
    {
      sub_23C9BAA2C((uint64_t)v21, &qword_268BBEC88);
      sub_23C9BAA2C((uint64_t)v23, &qword_268BBEC88);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v10);
      goto LABEL_14;
    }
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 32);
    uint64_t v72 = v26;
    char v35 = v66;
    v34(v66, v32, v10);
    sub_23C9FB6B0(&qword_268BBEC98, MEMORY[0x263F72B18]);
    char v36 = sub_23CA0E4B0();
    os_log_type_t v37 = *(void (**)(char *, uint64_t))(v31 + 8);
    uint64_t v38 = v35;
    uint64_t v29 = v72;
    v37(v38, v10);
    sub_23C9BAA2C((uint64_t)v21, &qword_268BBEC88);
    sub_23C9BAA2C((uint64_t)v23, &qword_268BBEC88);
    v37(v18, v10);
    sub_23C9BAA2C((uint64_t)v14, &qword_268BBEC88);
    if ((v36 & 1) == 0) {
      goto LABEL_34;
    }
  }
LABEL_17:
  uint64_t v39 = sub_23CA0D920();
  swift_release();
  if (!v39) {
    goto LABEL_28;
  }
  if (sub_23CA0D920())
  {
    uint64_t v40 = v71;
    sub_23CA0DC20();
    swift_release();
    uint64_t v41 = (uint64_t)v63;
    uint64_t v42 = v69;
  }
  else
  {
    uint64_t v42 = v69;
    uint64_t v40 = v71;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v71, 1, 1, v29);
    uint64_t v41 = (uint64_t)v63;
  }
  uint64_t v43 = v70;
  (*(void (**)(uint64_t, void, uint64_t))(v42 + 104))(v70, *MEMORY[0x263F732A0], v29);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v43, 0, 1, v29);
  uint64_t v44 = v41 + *(int *)(v68 + 48);
  sub_23C9D6238(v40, v41, &qword_268BBEC78);
  sub_23C9D6238(v43, v44, &qword_268BBEC78);
  uint64_t v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
  if (v45(v41, 1, v29) == 1)
  {
    sub_23C9BAA2C(v43, &qword_268BBEC78);
    sub_23C9BAA2C(v40, &qword_268BBEC78);
    if (v45(v44, 1, v29) == 1)
    {
      sub_23C9BAA2C(v41, &qword_268BBEC78);
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  uint64_t v46 = v67;
  sub_23C9D6238(v41, v67, &qword_268BBEC78);
  if (v45(v44, 1, v29) == 1)
  {
    sub_23C9BAA2C(v70, &qword_268BBEC78);
    sub_23C9BAA2C(v71, &qword_268BBEC78);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v46, v29);
LABEL_26:
    sub_23C9BAA2C(v41, &qword_268BBEC70);
LABEL_34:
    swift_release();
    goto LABEL_35;
  }
  uint64_t v47 = v65;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v65, v44, v29);
  sub_23C9FB6B0(&qword_268BBEC90, MEMORY[0x263F732B0]);
  char v48 = sub_23CA0E4B0();
  os_log_type_t v49 = *(void (**)(char *, uint64_t))(v42 + 8);
  v49(v47, v29);
  sub_23C9BAA2C(v70, &qword_268BBEC78);
  sub_23C9BAA2C(v71, &qword_268BBEC78);
  v49((char *)v46, v29);
  sub_23C9BAA2C(v41, &qword_268BBEC78);
  if ((v48 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_28:
  UsoEntity_common_Duration.valueInSeconds.getter();
  double v51 = v50;
  objc_msgSend(self, sel_minimumDuration);
  if (v52 >= v51) {
    goto LABEL_34;
  }
  if (qword_268BBDF10 != -1)
  {
    uint64_t v72 = 0x404E000000000000;
    swift_once();
  }
  uint64_t v53 = sub_23CA0E410();
  __swift_project_value_buffer(v53, (uint64_t)qword_268BBEC58);
  id v54 = sub_23CA0E3F0();
  os_log_type_t v55 = sub_23CA0E710();
  if (os_log_type_enabled(v54, v55))
  {
    id v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    uint64_t v74 = v57;
    *(_DWORD *)id v56 = 136315138;
    uint64_t v58 = sub_23CA0E680();
    uint64_t v73 = sub_23C9BC474(v58, v59, &v74);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v54, v55, "Got UsoEntity_common_Alarm relativeOffsetInMinutes (from now): %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v57, -1, -1);
    MEMORY[0x23ECEDBE0](v56, -1, -1);
  }

  uint64_t v60 = sub_23CA0E670();
  swift_release();
  swift_release();
  return v60;
}

uint64_t static DateTimeInferenceUtils.defaultAnchorDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268BBDE78 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_268BC2CE0);
  sub_23C9BFA3C(v5, (uint64_t)v4);
  uint64_t v6 = sub_23CA0CCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  }
  sub_23C9BAA2C((uint64_t)v4, &qword_268BBE460);
  return sub_23CA0CCA0();
}

uint64_t Bool.number.getter()
{
  return sub_23CA0E720();
}

uint64_t SirikitApp.init(app:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23CA0CD60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268BBE6C0)
  {
    uint64_t v9 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v9 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v9;
    swift_retain();
    swift_release();
  }
  sub_23C9BFAA4(v9 + 16, (uint64_t)v39);
  swift_retain();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v39, v40);
  char v10 = sub_23CA0D0C0();
  sub_23C9BFAA4((uint64_t)v39, (uint64_t)v38);
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
    sub_23C9BFAA4((uint64_t)v39, (uint64_t)v37);
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
LABEL_8:
    sub_23CA0E110();
    swift_allocObject();
    sub_23CA0E100();
    sub_23CA0E1C0();
    if (v12)
    {
      sub_23CA0E500();
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_23CA0E140();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 0, 1, v13);
    }
    else
    {
      uint64_t v14 = sub_23CA0E140();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
    }
    sub_23CA0E0F0();
    swift_release();
    sub_23C9BAA2C((uint64_t)v4, &qword_268BBEB08);
    sub_23CA0E0E0();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_23CA0E120();
    swift_release();
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(v38, v38[3]);
  char v11 = sub_23CA0D070();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  sub_23C9BFAA4((uint64_t)v39, (uint64_t)v37);
  if (v11) {
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  char v17 = sub_23CA0D0B0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  if (v17) {
    goto LABEL_8;
  }
  os_log_type_t v18 = (void *)sub_23CA0D250();
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(v18, sel_appNameMap);

    if (v20)
    {
      uint64_t v21 = sub_23CA0E480();

      __swift_project_boxed_opaque_existential_1(v39, v40);
      sub_23CA0D080();
      uint64_t v22 = self;
      sub_23CA0CD20();
      uint64_t v23 = (void *)sub_23CA0E4C0();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v22, sel_getFallbackLocales_includingNonSiriLocales_, v23, 1);

      uint64_t v25 = sub_23CA0E5B0();
      MEMORY[0x270FA5388](v26);
      *(&v34 - 2) = v25;
      sub_23C9F2564(v21, sub_23C9F2054);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  if (qword_268BBDEE0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_23CA0E410();
  __swift_project_value_buffer(v27, (uint64_t)qword_268BBEAD0);
  swift_retain_n();
  uint64_t v28 = sub_23CA0E3F0();
  os_log_type_t v29 = sub_23CA0E700();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v35 = a1;
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    sub_23CA0E1D0();
    sub_23C9F1FFC();
    uint64_t v32 = sub_23CA0EB80();
    uint64_t v35 = sub_23C9BC474(v32, v33, &v36);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v28, v29, "Could not get app info from App object: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v31, -1, -1);
    MEMORY[0x23ECEDBE0](v30, -1, -1);

    swift_release();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v15 = 0;
LABEL_12:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  return v15;
}

uint64_t sub_23C9C22C8()
{
  unint64_t v33 = v0;
  if (qword_268BBDF50 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = sub_23CA0E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BBEFD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  id v7 = v5;
  uint64_t v8 = sub_23CA0E3F0();
  os_log_type_t v9 = sub_23CA0E710();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v0[11];
  uint64_t v11 = v0[12];
  uint64_t v13 = v0[10];
  if (v10)
  {
    uint64_t v14 = (void *)v0[5];
    uint64_t v29 = v0[10];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v15 = 136315394;
    os_log_type_t type = v9;
    id v16 = objc_msgSend(v14, sel_patternId);
    uint64_t v17 = sub_23CA0E4D0();
    unint64_t v19 = v18;

    v0[2] = sub_23C9BC474(v17, v19, &v32);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v15 + 12) = 2080;
    sub_23CA0D300();
    uint64_t v20 = sub_23CA0E4F0();
    v0[3] = sub_23C9BC474(v20, v21, &v32);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v29);
    _os_log_impl(&dword_23C9B6000, v8, type, "generatePatternOutput #Response output for pattern %s, dialogPhase: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v30, -1, -1);
    MEMORY[0x23ECEDBE0](v15, -1, -1);
  }
  else
  {
    uint64_t v22 = (void *)v0[5];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }

  sub_23CA0D200();
  swift_allocObject();
  v0[13] = sub_23CA0D1F0();
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F6FB20] + MEMORY[0x263F6FB20]);
  uint64_t v23 = (void *)swift_task_alloc();
  v0[14] = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_23C9C274C;
  uint64_t v24 = v0[7];
  uint64_t v25 = v0[4];
  uint64_t v26 = v0[5];
  return v31(v25, v26, v24);
}

uint64_t sub_23C9C2610()
{
  swift_release();
  uint64_t v1 = (void *)sub_23CA0CBF0();
  sub_23C9FDB84((uint64_t)v1, 0, 0, 0x80u);

  SiriTimeMeasurement.logDelta()();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23C9C26C8()
{
  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9C274C()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_23C9C2610;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_23C9C26C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t OutputGenerationManifest.generatePatternOutput(result:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  v4[8] = sub_23CA0D100();
  v4[9] = swift_task_alloc();
  uint64_t v5 = sub_23CA0D380();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9C22C8, 0, 0);
}

uint64_t sub_23C9C295C()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0[25];
  unint64_t v2 = v0[19];
  uint64_t v3 = v0[14];
  sub_23C9C4FAC((uint64_t)(v0 + 7));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_23C9C3974(v2, v1, v3, (void (*)(_OWORD *__return_ptr, id *, uint64_t, uint64_t))sub_23C9C583C, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))sub_23C9CE03C);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23CA0E410();
  __swift_project_value_buffer(v5, (uint64_t)qword_268BBE900);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_23CA0E3F0();
  os_log_type_t v7 = sub_23CA0E710();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = MEMORY[0x23ECECE40](v10, &type metadata for HALTimerDeviceContext);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v0[15] = sub_23C9BC474(v11, v13, &v16);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C9B6000, v6, v7, "fetchTimerContexts() got firing timers context: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v9, -1, -1);
    MEMORY[0x23ECEDBE0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v4);
}

uint64_t sub_23C9C2BE4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[13];
  v0[25] = v1;
  sub_23C9C4FAC((uint64_t)(v0 + 2));
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[22];
    uint64_t v3 = sub_23CA0E300();
    uint64_t v4 = MEMORY[0x263F75980];
    v0[10] = v2;
    v0[11] = v4;
    v0[7] = v3;
    uint64_t v5 = swift_task_alloc();
    v0[26] = v5;
    *(void *)(v5 + 16) = v0 + 7;
    uint64_t v6 = (void *)swift_task_alloc();
    v0[27] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE930);
    *uint64_t v6 = v0;
    v6[1] = sub_23C9C34CC;
    return MEMORY[0x270FA2318](v0 + 14, 0, 0, 0xD00000000000001ELL, 0x800000023CA16720, sub_23C9EE744, v5, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_268BBDED0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23CA0E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_268BBE900);
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_23C9B6000, v9, v10, "Failed to fetch device units for alarm contexts", v11, 2u);
      MEMORY[0x23ECEDBE0](v11, -1, -1);
    }

    unint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v13 = MEMORY[0x263F8EE78];
    return v12(v13);
  }
}

uint64_t sub_23C9C2E24()
{
  unint64_t v1 = v0[12];
  v0[19] = v1;
  unint64_t v2 = sub_23C9EAE78(v1);
  v0[20] = v2;
  v0[21] = 0;
  uint64_t v3 = sub_23CA0E320();
  v0[22] = v3;
  v0[2] = sub_23CA0E300();
  uint64_t v4 = MEMORY[0x263F75980];
  v0[5] = v3;
  v0[6] = v4;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = swift_task_alloc();
    v0[23] = v5;
    *(void *)(v5 + 16) = v0 + 2;
    *(void *)(v5 + 24) = v2;
    uint64_t v6 = (void *)swift_task_alloc();
    v0[24] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE928);
    *uint64_t v6 = v0;
    v6[1] = sub_23C9C33B4;
    unint64_t v8 = 0x800000023CA16700;
    uint64_t v9 = sub_23C9EE750;
    os_log_type_t v10 = v0 + 13;
    unint64_t v11 = 0xD000000000000017;
    uint64_t v12 = v5;
LABEL_5:
    return MEMORY[0x270FA2318](v10, 0, 0, v11, v8, v9, v12, v7);
  }
  unint64_t v13 = sub_23C9D47A4(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  v0[25] = v13;
  sub_23C9C4FAC((uint64_t)(v0 + 2));
  if (*(void *)(v13 + 16))
  {
    uint64_t v14 = v0[22];
    uint64_t v15 = sub_23CA0E300();
    v0[10] = v14;
    v0[11] = v4;
    v0[7] = v15;
    uint64_t v16 = swift_task_alloc();
    v0[26] = v16;
    *(void *)(v16 + 16) = v0 + 7;
    uint64_t v17 = (void *)swift_task_alloc();
    v0[27] = v17;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE930);
    *uint64_t v17 = v0;
    v17[1] = sub_23C9C34CC;
    unint64_t v11 = 0xD00000000000001ELL;
    unint64_t v8 = 0x800000023CA16720;
    uint64_t v9 = sub_23C9EE744;
    os_log_type_t v10 = v0 + 14;
    uint64_t v12 = v16;
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_23CA0E410();
  __swift_project_value_buffer(v18, (uint64_t)qword_268BBE900);
  unint64_t v19 = sub_23CA0E3F0();
  os_log_type_t v20 = sub_23CA0E700();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v21 = 0;
    _os_log_impl(&dword_23C9B6000, v19, v20, "Failed to fetch device units for alarm contexts", v21, 2u);
    MEMORY[0x23ECEDBE0](v21, -1, -1);
  }

  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v23 = MEMORY[0x263F8EE78];
  return v22(v23);
}

uint64_t sub_23C9C3178()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9C2E24, 0, 0);
}

uint64_t SiriTimeDeviceContextProvider.fetchTimerContexts()()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_23C9C32B0, 0, 0);
}

uint64_t sub_23C9C32B0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = swift_task_alloc();
  v0[17] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE920);
  *uint64_t v3 = v0;
  v3[1] = sub_23C9C3178;
  return MEMORY[0x270FA2318](v0 + 12, 0, 0, 0xD000000000000014, 0x800000023CA16740, sub_23C9EDC5C, v2, v4);
}

uint64_t sub_23C9C33B4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9C2BE4, 0, 0);
}

uint64_t sub_23C9C34CC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9C295C, 0, 0);
}

uint64_t sub_23C9C35E4(unint64_t a1)
{
  return sub_23C9EE3D4(a1, "Fetching timer context for %ld devices", "Fetching timerContexts: got nil context array");
}

uint64_t sub_23C9C35F8(unint64_t a1, uint64_t a2, const char *a3, const char *a4)
{
  if (a1)
  {
    unint64_t v6 = a1 >> 62;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_23CA0E9C0()) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_4:
        if (qword_268BBDED0 != -1) {
          swift_once();
        }
        uint64_t v8 = sub_23CA0E410();
        __swift_project_value_buffer(v8, (uint64_t)qword_268BBE900);
        swift_bridgeObjectRetain_n();
        uint64_t v9 = sub_23CA0E3F0();
        os_log_type_t v10 = sub_23CA0E710();
        if (os_log_type_enabled(v9, v10))
        {
          unint64_t v11 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v11 = 134217984;
          if (v6)
          {
            swift_bridgeObjectRetain();
            sub_23CA0E9C0();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          sub_23CA0E7C0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23C9B6000, v9, v10, a3, v11, 0xCu);
          MEMORY[0x23ECEDBE0](v11, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_23CA0E410();
  __swift_project_value_buffer(v12, (uint64_t)qword_268BBE900);
  unint64_t v13 = sub_23CA0E3F0();
  os_log_type_t v14 = sub_23CA0E700();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_23C9B6000, v13, v14, a4, v15, 2u);
    MEMORY[0x23ECEDBE0](v15, -1, -1);
  }

LABEL_19:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE9A0);
  return sub_23CA0E640();
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23C9C3974(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *__return_ptr, id *, uint64_t, uint64_t), uint64_t (*a5)(BOOL, unint64_t, uint64_t, uint64_t, __n128))
{
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_23CA0E9C0())
  {
    os_log_type_t v20 = a5;
    uint64_t v9 = MEMORY[0x263F8EE78];
    for (uint64_t i = 4; ; ++i)
    {
      a5 = (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))(i - 4);
      id v12 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23ECED190](i - 4, a1) : *(id *)(a1 + 8 * i);
      unint64_t v13 = v12;
      uint64_t v14 = i - 3;
      if (__OFADD__(a5, 1)) {
        break;
      }
      id v27 = v12;
      a4(v26, &v27, a2, a3);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v9;
      }

      if (*(void *)&v26[0])
      {
        __n128 v25 = (__n128)v26[0];
        long long v24 = v26[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v9 = ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t))v20)(0, *(void *)(v9 + 16) + 1, 1, v9);
        }
        unint64_t v16 = *(void *)(v9 + 16);
        unint64_t v15 = *(void *)(v9 + 24);
        __n128 v17 = v25;
        if (v16 >= v15 >> 1)
        {
          uint64_t v18 = v20(v15 > 1, v16 + 1, 1, v9, v25);
          __n128 v17 = v25;
          uint64_t v9 = v18;
        }
        *(void *)(v9 + 16) = v16 + 1;
        uint64_t v11 = v9 + 32 * v16;
        *(__n128 *)(v11 + 32) = v17;
        *(_OWORD *)(v11 + 48) = v24;
      }
      if (v14 == v8)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23C9C3B68()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EE754, 0, 0);
}

uint64_t SiriTimeDeviceResolutionService.resolveDevicesAsync(_:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_23C9C3CA0, 0, 0);
}

uint64_t sub_23C9C3CA0()
{
  uint64_t v1 = v0[3];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[4];
    uint64_t v3 = swift_task_alloc();
    v0[5] = v3;
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE928);
    *uint64_t v4 = v0;
    v4[1] = sub_23C9C3B68;
    return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD000000000000017, 0x800000023CA16700, sub_23C9ECFEC, v3, v5);
  }
  else
  {
    unint64_t v6 = sub_23C9D47A4(MEMORY[0x263F8EE78]);
    uint64_t v7 = (uint64_t (*)(unint64_t))v0[1];
    return v7(v6);
  }
}

uint64_t sub_23C9C3DF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9C3E38(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23CA0CD10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = sub_23CA0E4A0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    __n128 v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      unint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_23C9EE384(&qword_268BBE9B0);
      char v22 = sub_23CA0E4B0();
      uint64_t v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      uint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    __n128 v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_23C9C48B8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23C9C4134(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_23CA0E870();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23C9EE454(0, (unint64_t *)&qword_268BBE6C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_23CA0E860();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_23C9ECFFC(v7, result + 1, &qword_268BBE6B0, (unint64_t *)&qword_268BBE6C8, 0x263F28488, (void (*)(unint64_t))sub_23C9DBE40);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_23C9DBE40(v26);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_23C9DC4A8(v8, v23);
    *uint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_23CA0E740();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_23C9EE454(0, (unint64_t *)&qword_268BBE6C8);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_23CA0E750();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_23CA0E750();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_23C9C4724((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native, (void (*)(uint64_t))sub_23C9DBE40, (unint64_t *)&qword_268BBE6C8, 0x263F28488, &qword_268BBE6B0);
    *uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23C9C442C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_23CA0E870();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23C9EE454(0, (unint64_t *)&qword_268BBE698);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_23CA0E860();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_23C9ECFFC(v7, result + 1, &qword_268BBE6B8, (unint64_t *)&qword_268BBE698, 0x263F28470, (void (*)(unint64_t))sub_23C9DBE34);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_23C9DBE34(v26);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_23C9DC4A8(v8, v23);
    *uint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_23CA0E740();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_23C9EE454(0, (unint64_t *)&qword_268BBE698);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_23CA0E750();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_23CA0E750();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_23C9C4724((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native, (void (*)(uint64_t))sub_23C9DBE34, (unint64_t *)&qword_268BBE698, 0x263F28470, &qword_268BBE6B8);
    *uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

void sub_23C9C4724(uint64_t a1, unint64_t a2, char a3, void (*a4)(uint64_t), unint64_t *a5, uint64_t a6, uint64_t *a7)
{
  unint64_t v11 = *(void *)(*v7 + 16);
  unint64_t v12 = *(void *)(*v7 + 24);
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v13 = v11 + 1;
  if (a3)
  {
    a4(v13);
  }
  else
  {
    if (v12 > v11)
    {
      sub_23C9ED200(a7);
      goto LABEL_14;
    }
    sub_23C9ED648(v13, a7);
  }
  uint64_t v14 = *v7;
  uint64_t v15 = sub_23CA0E740();
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_23C9EE454(0, a5);
    id v17 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
    char v18 = sub_23CA0E750();

    if (v18)
    {
LABEL_13:
      sub_23CA0ECE0();
      __break(1u);
    }
    else
    {
      uint64_t v19 = ~v16;
      while (1)
      {
        a2 = (a2 + 1) & v19;
        if (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
        char v21 = sub_23CA0E750();

        if (v21) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v22 = *v7;
  *(void *)(*v7 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v22 + 48) + 8 * a2) = a1;
  uint64_t v23 = *(void *)(v22 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24) {
    __break(1u);
  }
  else {
    *(void *)(v22 + 16) = v25;
  }
}

uint64_t sub_23C9C48B8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23CA0CD10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_23C9DC0E8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23C9ED3A4();
      goto LABEL_12;
    }
    sub_23C9ED8C0();
  }
  uint64_t v12 = *v3;
  sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
  uint64_t v13 = sub_23CA0E4A0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    id v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_23C9EE384(&qword_268BBE9B0);
      char v21 = sub_23CA0E4B0();
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
  uint64_t result = sub_23CA0ECE0();
  __break(1u);
  return result;
}

uint64_t sub_23C9C4B30(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA28);
  return sub_23C9C4BA8(a1);
}

uint64_t sub_23C9C4BA8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    if (qword_268BBDED8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_23CA0E410();
    __swift_project_value_buffer(v2, (uint64_t)qword_268BBE9B8);
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_23CA0E3F0();
    os_log_type_t v4 = sub_23CA0E710();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      unint64_t v21 = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      sub_23CA0CD10();
      sub_23CA0E2E0();
      sub_23C9C3DF0((unint64_t *)&qword_268BBE6A8, MEMORY[0x263F07508]);
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_23CA0E490();
      unint64_t v9 = v8;
      swift_bridgeObjectRelease();
      sub_23C9BC474(v7, v9, (uint64_t *)&v21);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v3, v4, "Find candidate devices: %s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v6, -1, -1);
      MEMORY[0x23ECEDBE0](v5, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v21 = a1;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_268BBDED8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23CA0E410();
    __swift_project_value_buffer(v10, (uint64_t)qword_268BBE9B8);
    swift_bridgeObjectRetain_n();
    unint64_t v11 = sub_23CA0E3F0();
    os_log_type_t v12 = sub_23CA0E700();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      unint64_t v21 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v15 = sub_23CA0CD10();
      uint64_t v16 = swift_bridgeObjectRetain();
      uint64_t v17 = MEMORY[0x23ECECE40](v16, v15);
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_23C9BC474(v17, v19, (uint64_t *)&v21);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v11, v12, "SiriTimeDeviceResolutionService.resolveDevice() found no device with ids %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v14, -1, -1);
      MEMORY[0x23ECEDBE0](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v21 = sub_23C9D47A4(MEMORY[0x263F8EE78]);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA28);
  return sub_23CA0E640();
}

uint64_t sub_23C9C4FAC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23C9C5000(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA18);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  sub_23CA0E3D0();
  uint64_t v6 = (void *)sub_23CA0E3C0();
  if (qword_268BBDED8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_23CA0E410();
  __swift_project_value_buffer(v7, (uint64_t)qword_268BBE9B8);
  unint64_t v8 = sub_23CA0E3F0();
  os_log_type_t v9 = sub_23CA0E710();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_23C9B6000, v8, v9, "Fetching deviceCapabilities.", v10, 2u);
    MEMORY[0x23ECEDBE0](v10, -1, -1);
  }

  sub_23C9BFAA4(a2, (uint64_t)v19);
  uint64_t v16 = v19[4];
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23CA0F560;
  *(void *)(v11 + 32) = v6;
  uint64_t v18 = v11;
  sub_23CA0E5D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v3);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  id v14 = v6;
  sub_23CA0E340();
  swift_release();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t sub_23C9C52A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA18);
  return sub_23C9C5314();
}

uint64_t sub_23C9C5314()
{
  if (qword_268BBDED8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_23CA0E410();
  __swift_project_value_buffer(v0, (uint64_t)qword_268BBE9B8);
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_23CA0E3F0();
  os_log_type_t v2 = sub_23CA0E710();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v11 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    sub_23CA0E2E0();
    sub_23CA0E370();
    sub_23C9C3DF0(&qword_268BBEA20, MEMORY[0x263F75970]);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_23CA0E490();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    sub_23C9BC474(v5, v7, &v11);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v1, v2, "Got capabilitesMap: %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v4, -1, -1);
    MEMORY[0x23ECEDBE0](v3, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_23C9BC9CC(v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA18);
  return sub_23CA0E640();
}

uint64_t sub_23C9C557C(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  unint64_t v6 = a2;
  unint64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_23CA0E970();
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v4 = result | 0x8000000000000000;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v11 = 0;
    a3 = 0;
LABEL_45:
    *unint64_t v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v8 = a4 + 64;
  uint64_t v20 = ~v19;
  uint64_t v21 = -v19;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v10 = v22 & *(void *)(a4 + 64);
  uint64_t v9 = v20;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v23 = v9;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_23CA0E990())
    {
      a3 = v12;
LABEL_44:
      uint64_t v9 = v23;
      goto LABEL_45;
    }
    sub_23CA0E2E0();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v25;
    uint64_t result = swift_unknownObjectRelease();
    if (!v25) {
      goto LABEL_43;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3) {
      goto LABEL_44;
    }
  }
  if (v10)
  {
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v16);
  if (v17) {
    goto LABEL_23;
  }
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    int64_t v16 = v11;
LABEL_23:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
LABEL_7:
    uint64_t result = (uint64_t)*(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v18 = v16 + 2;
  if (v16 + 2 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    int64_t v16 = v18;
    goto LABEL_23;
  }
  int64_t v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16 + 2;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    unint64_t v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v24)
    {
      unint64_t v10 = 0;
      int64_t v11 = v24 - 1;
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

void sub_23C9C583C(void **a1@<X0>, NSObject *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v115 = a4;
  os_log_t v114 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23CA0CD10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  int64_t v16 = (char *)&v107 - v15;
  MEMORY[0x270FA5388](v14);
  os_log_type_t v120 = (char *)&v107 - v17;
  int64_t v18 = *a1;
  id v19 = objc_msgSend(v18, sel_identifier);
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_8;
  }
  uint64_t v20 = v19;
  unint64_t v112 = a3;
  sub_23CA0CCF0();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v16, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_8:
    sub_23C9BAA2C((uint64_t)v8, &qword_268BBE360);
    if (qword_268BBDED0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_23CA0E410();
    __swift_project_value_buffer(v39, (uint64_t)qword_268BBE900);
    id v40 = v18;
    uint64_t v41 = sub_23CA0E3F0();
    os_log_type_t v42 = sub_23CA0E700();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      os_log_type_t v120 = (char *)swift_slowAlloc();
      *(void *)&long long v118 = v120;
      *(_DWORD *)uint64_t v43 = 136315138;
      os_log_t v114 = (os_log_t)(v43 + 4);
      id v44 = v40;
      id v45 = objc_msgSend(v44, sel_description);
      uint64_t v46 = sub_23CA0E4D0();
      unint64_t v48 = v47;

      *(void *)&long long v116 = sub_23C9BC474(v46, v48, (uint64_t *)&v118);
      sub_23CA0E7C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v41, v42, "Device had invalid UUID for fetched timers: %s", (uint8_t *)v43, 0xCu);
      uint64_t v49 = (uint64_t)v120;
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v49, -1, -1);
      MEMORY[0x23ECEDBE0](v43, -1, -1);
    }
    else
    {
    }
    goto LABEL_23;
  }
  uint64_t v113 = v10;
  v21(v120, v8, v9);
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_23CA0E410();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_268BBE900);
  id v24 = v18;
  uint64_t v25 = sub_23CA0E3F0();
  os_log_type_t v26 = sub_23CA0E710();
  int v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    LODWORD(v110) = v27;
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v109 = swift_slowAlloc();
    *(void *)&long long v118 = v109;
    *(_DWORD *)uint64_t v28 = 136315138;
    os_log_type_t v107 = v28 + 4;
    v108 = v28;
    id v29 = v24;
    uint64_t v30 = v13;
    uint64_t v31 = v23;
    uint64_t v32 = v9;
    id v33 = objc_msgSend(v29, sel_description);
    uint64_t v34 = sub_23CA0E4D0();
    id v111 = v24;
    unint64_t v36 = v35;

    uint64_t v9 = v32;
    uint64_t v23 = v31;
    unint64_t v13 = v30;
    *(void *)&long long v116 = sub_23C9BC474(v34, v36, (uint64_t *)&v118);
    sub_23CA0E7C0();

    id v24 = v111;
    swift_bridgeObjectRelease();
    os_log_type_t v37 = v108;
    _os_log_impl(&dword_23C9B6000, v25, (os_log_type_t)v110, "Searching timer from device context %s", v108, 0xCu);
    uint64_t v38 = v109;
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v38, -1, -1);
    MEMORY[0x23ECEDBE0](v37, -1, -1);
  }
  else
  {
  }
  uint64_t v51 = v113;
  os_log_t v50 = v114;
  if (!v114[2].isa || (unint64_t v52 = sub_23CA06C10((uint64_t)v120), (v53 & 1) == 0))
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v13, v120, v9);
    uint64_t v62 = sub_23CA0E3F0();
    os_log_type_t v63 = sub_23CA0E700();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(void *)&long long v118 = v65;
      *(_DWORD *)uint64_t v64 = 136315138;
      os_log_t v114 = (os_log_t)(v64 + 4);
      sub_23C9EE384(&qword_268BBE990);
      uint64_t v66 = sub_23CA0EB80();
      *(void *)&long long v116 = sub_23C9BC474(v66, v67, (uint64_t *)&v118);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      uint64_t v68 = *(void (**)(char *, uint64_t))(v51 + 8);
      v68(v13, v9);
      _os_log_impl(&dword_23C9B6000, v62, v63, "Unable to find device for fetched timers: %s", (uint8_t *)v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v65, -1, -1);
      MEMORY[0x23ECEDBE0](v64, -1, -1);

      v68(v120, v9);
    }
    else
    {

      uint64_t v69 = *(void (**)(char *, uint64_t))(v51 + 8);
      v69(v13, v9);
      v69(v120, v9);
    }
    goto LABEL_23;
  }
  id v54 = *((id *)v50[7].isa + v52);
  id v55 = objc_msgSend(v24, sel_serializedContextByKey);
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = sub_23CA0E480();

    uint64_t v58 = sub_23CA0E4D0();
    if (*(void *)(v57 + 16) && (unint64_t v60 = sub_23CA06B98(v58, v59), (v61 & 1) != 0))
    {
      sub_23C9BC704(*(void *)(v57 + 56) + 32 * v60, (uint64_t)&v116);
    }
    else
    {
      long long v116 = 0u;
      long long v117 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v117 + 1))
    {
      sub_23C9C6860(&v116, &v118);
      id v72 = objc_allocWithZone(MEMORY[0x263F28490]);
      __swift_project_boxed_opaque_existential_1(&v118, v119);
      id v73 = objc_msgSend(v72, sel_initWithSerializedBackingStore_, sub_23CA0ECA0());
      swift_unknownObjectRelease();
      uint64_t v74 = v73;
      os_log_t v114 = v23;
      uint64_t v75 = sub_23CA0E3F0();
      os_log_type_t v76 = sub_23CA0E710();
      if (os_log_type_enabled(v75, v76))
      {
        id v111 = v54;
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        uint64_t v110 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v77 = 138412290;
        *(void *)&long long v116 = v74;
        v78 = v74;
        uint64_t v79 = v74;
        id v54 = v111;
        sub_23CA0E7C0();
        uint64_t v80 = v110;
        *uint64_t v110 = v78;

        uint64_t v74 = v78;
        _os_log_impl(&dword_23C9B6000, v75, v76, "fetchTimerContexts() timerSnapshot = %@", v77, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v80, -1, -1);
        MEMORY[0x23ECEDBE0](v77, -1, -1);
      }
      else
      {

        uint64_t v75 = v74;
      }
      unint64_t v87 = (unint64_t)v112;
      uint64_t v88 = v113;

      id v89 = [v74 timersByID];
      if (v89)
      {
        uint64_t v90 = v89;
        sub_23C9EE454(0, (unint64_t *)&qword_268BBE6C8);
        sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
        uint64_t v91 = sub_23CA0E480();

        if (*(void *)(v91 + 16))
        {
          uint64_t v92 = swift_bridgeObjectRetain();
          sub_23C9EC02C(v92, (unint64_t *)&qword_268BBE6C8, 0x263F28488, &qword_268BBE998, (void (*)(id *, id))sub_23C9C4134);
          uint64_t v94 = v93;
          id v95 = v54;
          swift_bridgeObjectRetain();
          uint64_t v96 = sub_23C9E9E14(v95, v87);
          uint64_t v98 = v97;

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v118);
          (*(void (**)(char *, uint64_t))(v88 + 8))(v120, v9);
          v99 = v115;
          *uint64_t v115 = v95;
          v99[1] = v94;
          v99[2] = v96;
          v99[3] = v98;
          return;
        }
        swift_bridgeObjectRelease();
      }
      os_log_type_t v100 = v54;
      BOOL v101 = sub_23CA0E3F0();
      os_log_type_t v102 = sub_23CA0E710();
      if (os_log_type_enabled(v101, v102))
      {
        os_log_t v114 = v101;
        uint64_t v103 = (uint8_t *)swift_slowAlloc();
        unint64_t v112 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v103 = 138412290;
        *(void *)&long long v116 = v100;
        uint64_t v104 = v74;
        unint64_t v105 = v100;
        uint64_t v88 = v113;
        sub_23CA0E7C0();
        v106 = v112;
        *unint64_t v112 = v100;

        BOOL v101 = v114;
        _os_log_impl(&dword_23C9B6000, v114, v102, "Didn't find any timers on device: %@", v103, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v106, -1, -1);
        MEMORY[0x23ECEDBE0](v103, -1, -1);
      }
      else
      {

        uint64_t v104 = v100;
      }

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v118);
      (*(void (**)(char *, uint64_t))(v88 + 8))(v120, v9);
      long long v70 = 0uLL;
      uint64_t v71 = v115;
LABEL_24:
      *uint64_t v71 = v70;
      v71[1] = v70;
      return;
    }
    sub_23C9BAA2C((uint64_t)&v116, &qword_268BBE988);
    id v81 = v54;
    v82 = sub_23CA0E3F0();
    os_log_type_t v83 = sub_23CA0E700();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      unint64_t v112 = (void *)swift_slowAlloc();
      os_log_t v114 = v82;
      *(_DWORD *)uint64_t v84 = 138412290;
      *(void *)&long long v118 = v81;
      id v85 = v81;
      uint64_t v51 = v113;
      v82 = v114;
      sub_23CA0E7C0();
      uint64_t v86 = v112;
      *unint64_t v112 = v81;

      _os_log_impl(&dword_23C9B6000, v82, v83, "Failed to get timer snapshot data from %@", v84, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v86, -1, -1);
      MEMORY[0x23ECEDBE0](v84, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v120, v9);
LABEL_23:
    long long v70 = 0uLL;
    uint64_t v71 = v115;
    goto LABEL_24;
  }
  __break(1u);
}

unint64_t sub_23C9C65DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  id v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_23C9FFD68(v23, v24);
      char v19 = sub_23CA0E4B0();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_23C9C677C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23CA0ECB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23CA0ECB0() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_23C9C6860(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23C9C6870(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23C9EE454(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *initializeWithCopy for HALAlarmDeviceContext(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

uint64_t initializeBufferWithCopyOfBuffer for HALAlarmDeviceContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HALAlarmDeviceContext(id *a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t destroy for SiriTimeDeviceContextProvider(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1);
}

uint64_t static DirectInvocationUtils.isQuickStopDirectInvocation(_:)()
{
  if (sub_23CA0D410() == 0xD00000000000003ALL && v0 == 0x800000023CA16120)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v2 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    return v2 & 1;
  }
}

uint64_t sub_23C9C6D54()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBDE28);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBDE28);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[11] = a8;
  v9[12] = v8;
  v9[9] = a6;
  v9[10] = a7;
  v9[7] = a4;
  v9[8] = a5;
  v9[5] = a2;
  v9[6] = a3;
  void v9[4] = a1;
  uint64_t v10 = sub_23CA0D380();
  v9[13] = v10;
  v9[14] = *(void *)(v10 - 8);
  v9[15] = swift_task_alloc();
  uint64_t v11 = sub_23CA0D100();
  v9[16] = v11;
  v9[17] = *(void *)(v11 - 8);
  v9[18] = swift_task_alloc();
  v9[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9C6F58, 0, 0);
}

uint64_t sub_23C9C6F58()
{
  uint64_t v46 = v0;
  if (qword_268BBDE20 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v4 = (void *)v0[12];
  uint64_t v5 = v0[5];
  uint64_t v6 = sub_23CA0E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BBDE28);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v1, v5, v2);
  id v8 = v4;
  uint64_t v9 = sub_23CA0E3F0();
  os_log_type_t v10 = sub_23CA0E710();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[19];
  if (v11)
  {
    uint64_t v41 = v0[17];
    uint64_t v39 = v0[18];
    uint64_t v40 = v0[16];
    uint64_t v13 = (void *)v0[12];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v45 = v42;
    *(_DWORD *)uint64_t v14 = 136315394;
    id v15 = objc_msgSend(v13, sel_catId);
    uint64_t v16 = sub_23CA0E4D0();
    uint64_t v38 = v7;
    unint64_t v18 = v17;

    v0[2] = sub_23C9BC474(v16, v18, &v45);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 12) = 2080;
    v38(v39, v12, v40);
    uint64_t v19 = sub_23CA0E4F0();
    v0[3] = sub_23C9BC474(v19, v20, &v45);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v12, v40);
    _os_log_impl(&dword_23C9B6000, v9, v10, "#Response 2.0 dialog-only generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v42, -1, -1);
    MEMORY[0x23ECEDBE0](v14, -1, -1);
  }
  else
  {
    uint64_t v21 = v0[16];
    uint64_t v22 = v0[17];
    uint64_t v23 = (void *)v0[12];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
  }

  uint64_t v24 = v0[15];
  uint64_t v25 = (void *)v0[12];
  unint64_t v43 = v0[11];
  unint64_t v27 = v0[9];
  uint64_t v26 = v0[10];
  uint64_t v28 = v0[8];
  uint64_t v30 = v0[5];
  uint64_t v29 = v0[6];
  sub_23CA0D200();
  swift_allocObject();
  v0[20] = sub_23CA0D1F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23CA0F560;
  *(void *)(v31 + 32) = v25;
  uint64_t v45 = v31;
  sub_23CA0E5D0();
  uint64_t v32 = v45;
  v0[21] = v45;
  id v33 = v25;
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v30, v29, v28, v27, v26, v43, 0, v24);
  id v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F6FB28] + MEMORY[0x263F6FB28]);
  uint64_t v34 = (void *)swift_task_alloc();
  v0[22] = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_23C9C7340;
  uint64_t v35 = v0[15];
  uint64_t v36 = v0[4];
  return v44(v36, v32, v35);
}

uint64_t sub_23C9C7340()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 120);
  uint64_t v2 = *(void *)(*(void *)v0 + 112);
  uint64_t v3 = *(void *)(*(void *)v0 + 104);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_23C9C74D8, 0, 0);
}

uint64_t sub_23C9C74D8()
{
  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[22] = v14;
  v9[23] = v8;
  v9[20] = a7;
  v9[21] = a8;
  v9[18] = a5;
  v9[19] = a6;
  v9[16] = a3;
  v9[17] = a4;
  v9[14] = a1;
  v9[15] = a2;
  uint64_t v10 = sub_23CA0D380();
  unsigned char v9[24] = v10;
  v9[25] = *(void *)(v10 - 8);
  v9[26] = swift_task_alloc();
  uint64_t v11 = sub_23CA0D100();
  v9[27] = v11;
  v9[28] = *(void *)(v11 - 8);
  v9[29] = swift_task_alloc();
  v9[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9C76A4, 0, 0);
}

uint64_t sub_23C9C76A4()
{
  uint64_t v56 = v0;
  sub_23C9C8A14(*(void *)(v0 + 136), v0 + 56);
  if (*(void *)(v0 + 80))
  {
    sub_23C9BB9E8((long long *)(v0 + 56), v0 + 16);
    if (qword_268BBDE20 != -1) {
      swift_once();
    }
    uint64_t v1 = *(void *)(v0 + 240);
    uint64_t v2 = *(void *)(v0 + 216);
    uint64_t v3 = *(void *)(v0 + 224);
    uint64_t v4 = *(void **)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v6 = sub_23CA0E410();
    __swift_project_value_buffer(v6, (uint64_t)qword_268BBDE28);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v7(v1, v5, v2);
    id v8 = v4;
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E710();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v50 = *(void *)(v0 + 224);
      uint64_t v48 = *(void *)(v0 + 232);
      uint64_t v49 = *(void *)(v0 + 216);
      os_log_type_t typea = v10;
      uint64_t v13 = *(void **)(v0 + 184);
      uint64_t v14 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v55 = v51;
      *(_DWORD *)uint64_t v14 = 136315394;
      id v15 = objc_msgSend(v13, sel_catId);
      uint64_t v47 = v7;
      uint64_t v16 = sub_23CA0E4D0();
      unint64_t v18 = v17;

      *(void *)(v0 + 96) = sub_23C9BC474(v16, v18, &v55);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v14 + 12) = 2080;
      v47(v48, v12, v49);
      uint64_t v19 = sub_23CA0E4F0();
      *(void *)(v0 + 104) = sub_23C9BC474(v19, v20, &v55);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v12, v49);
      _os_log_impl(&dword_23C9B6000, v9, typea, "#Response 2.0 dialog/snippet generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v51, -1, -1);
      MEMORY[0x23ECEDBE0](v14, -1, -1);
    }
    else
    {
      uint64_t v31 = *(void *)(v0 + 216);
      uint64_t v32 = *(void *)(v0 + 224);
      id v33 = *(void **)(v0 + 184);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v12, v31);
    }

    uint64_t v34 = *(void *)(v0 + 208);
    uint64_t v35 = *(void **)(v0 + 184);
    unint64_t typeb = *(void *)(v0 + 176);
    unint64_t v37 = *(void *)(v0 + 160);
    uint64_t v36 = *(void *)(v0 + 168);
    uint64_t v38 = *(void *)(v0 + 152);
    uint64_t v40 = *(void *)(v0 + 120);
    uint64_t v39 = *(void *)(v0 + 128);
    sub_23CA0D200();
    swift_allocObject();
    *(void *)(v0 + 248) = sub_23CA0D1F0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_23CA0F560;
    *(void *)(v41 + 32) = v35;
    uint64_t v55 = v41;
    sub_23CA0E5D0();
    uint64_t v42 = v55;
    *(void *)(v0 + 256) = v55;
    id v43 = v35;
    static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v40, v39, v38, v37, v36, typeb, 0, v34);
    os_log_type_t type = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F6FB10] + MEMORY[0x263F6FB10]);
    id v44 = (void *)swift_task_alloc();
    *(void *)(v0 + 264) = v44;
    *id v44 = v0;
    v44[1] = sub_23C9C7B4C;
    uint64_t v45 = *(void *)(v0 + 208);
    uint64_t v46 = *(void *)(v0 + 112);
    return type(v46, v0 + 16, v42, v45);
  }
  else
  {
    sub_23C9C8A7C(v0 + 56);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_23C9C7D6C;
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 168);
    uint64_t v25 = *(void *)(v0 + 144);
    uint64_t v26 = *(void *)(v0 + 152);
    uint64_t v27 = *(void *)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 128);
    uint64_t v29 = *(void *)(v0 + 112);
    return DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)(v29, v27, v28, v25, v26, v23, v24, v22);
  }
}

uint64_t sub_23C9C7B4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 208);
  uint64_t v2 = *(void *)(*(void *)v0 + 200);
  uint64_t v3 = *(void *)(*(void *)v0 + 192);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_23C9C7CE4, 0, 0);
}

uint64_t sub_23C9C7CE4()
{
  SiriTimeMeasurement.logDelta()();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9C7D6C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t DialogExecutionResult.generateConversationOutput(dialogPhase:context:conversationModel:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[12] = v14;
  v9[13] = v8;
  v9[10] = a7;
  v9[11] = a8;
  v9[8] = a5;
  v9[9] = a6;
  v9[6] = a3;
  v9[7] = a4;
  void v9[4] = a1;
  v9[5] = a2;
  uint64_t v10 = sub_23CA0D380();
  v9[14] = v10;
  v9[15] = *(void *)(v10 - 8);
  v9[16] = swift_task_alloc();
  uint64_t v11 = sub_23CA0D100();
  v9[17] = v11;
  v9[18] = *(void *)(v11 - 8);
  v9[19] = swift_task_alloc();
  v9[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9C8000, 0, 0);
}

uint64_t sub_23C9C8000()
{
  uint64_t v47 = v0;
  if (qword_268BBDE20 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = (void *)v0[13];
  uint64_t v5 = v0[5];
  uint64_t v6 = sub_23CA0E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BBDE28);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v1, v5, v2);
  id v8 = v4;
  uint64_t v9 = sub_23CA0E3F0();
  os_log_type_t v10 = sub_23CA0E710();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[20];
  if (v11)
  {
    uint64_t v42 = v0[18];
    uint64_t v40 = v0[19];
    uint64_t v41 = v0[17];
    uint64_t v13 = (void *)v0[13];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v46 = v43;
    *(_DWORD *)uint64_t v14 = 136315394;
    id v15 = objc_msgSend(v13, sel_catId);
    uint64_t v16 = sub_23CA0E4D0();
    uint64_t v39 = v7;
    unint64_t v18 = v17;

    v0[2] = sub_23C9BC474(v16, v18, &v46);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 12) = 2080;
    v39(v40, v12, v41);
    uint64_t v19 = sub_23CA0E4F0();
    v0[3] = sub_23C9BC474(v19, v20, &v46);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v12, v41);
    _os_log_impl(&dword_23C9B6000, v9, v10, "#Response 2.0 dialog/snippet conversation space generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v43, -1, -1);
    MEMORY[0x23ECEDBE0](v14, -1, -1);
  }
  else
  {
    uint64_t v21 = v0[17];
    uint64_t v22 = v0[18];
    uint64_t v23 = (void *)v0[13];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
  }

  uint64_t v24 = v0[16];
  uint64_t v25 = (void *)v0[13];
  unint64_t v44 = v0[12];
  unint64_t v27 = v0[10];
  uint64_t v26 = v0[11];
  uint64_t v28 = v0[9];
  uint64_t v30 = v0[5];
  uint64_t v29 = v0[6];
  sub_23CA0D200();
  swift_allocObject();
  v0[21] = sub_23CA0D1F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23CA0F560;
  *(void *)(v31 + 32) = v25;
  uint64_t v46 = v31;
  sub_23CA0E5D0();
  uint64_t v32 = v46;
  v0[22] = v46;
  id v33 = v25;
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v30, v29, v28, v27, v26, v44, 0, v24);
  uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F6FB18] + MEMORY[0x263F6FB18]);
  uint64_t v34 = (void *)swift_task_alloc();
  v0[23] = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_23C9C83EC;
  uint64_t v35 = v0[16];
  uint64_t v36 = v0[7];
  uint64_t v37 = v0[4];
  return v45(v37, v36, v32, v35);
}

uint64_t sub_23C9C83EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 128);
  uint64_t v2 = *(void *)(*(void *)v0 + 120);
  uint64_t v3 = *(void *)(*(void *)v0 + 112);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_23C9C8584, 0, 0);
}

uint64_t sub_23C9C8584()
{
  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t Output.generateFlow()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_23CA0D2F0();
  sub_23CA0CF00();
  swift_allocObject();
  v11[1] = sub_23CA0CEF0();
  uint64_t v9 = sub_23CA0CF50();
  swift_release();
  return v9;
}

uint64_t sub_23C9C8794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_23C9C87B8, 0, 0);
}

uint64_t sub_23C9C87B8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  long long v6 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 24) = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v1);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v2);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void *sub_23C9C885C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDFB8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C9C88C4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDFB8);
    os_log_type_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    os_log_type_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9C8A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C9C8A7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C9C8ADC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23C9C8B64(uint64_t a1)
{
  long long v7 = *(_OWORD *)(v1 + 16);
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80));
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(_OWORD *)(v5 + 32) = v7;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v4;
  *(void *)(v5 + 8) = sub_23C9C8C60;
  return MEMORY[0x270FA2498](sub_23C9C87B8, 0, 0);
}

uint64_t sub_23C9C8C60()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
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

uint64_t sub_23C9C8E1C()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE320);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE320);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

const char *sub_23C9C8EE4(char a1)
{
  uint64_t result = "timer_RF";
  switch(a1)
  {
    case 1:
      uint64_t result = "confirmations_RF";
      break;
    case 2:
      uint64_t result = "cross_device";
      break;
    case 3:
      uint64_t result = "multiTimeriOS";
      break;
    case 4:
      uint64_t result = "timer_bobcat_locale_expansion";
      break;
    case 5:
      uint64_t result = "uod_asr_on_server_enabled_homepod";
      break;
    case 6:
      uint64_t result = "suggestion_hints";
      break;
    case 7:
      uint64_t result = "sleep_timers_tvOS";
      break;
    case 8:
      uint64_t result = "alarm_smart";
      break;
    case 9:
      uint64_t result = "week_of_year";
      break;
    case 10:
      uint64_t result = "clock_smart";
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_23C9C8FF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C9C9008()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9C9050()
{
  return sub_23CA0ED10();
}

uint64_t sub_23C9C907C()
{
  return sub_23CA0ED20();
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isTimerResponseFrameworkEnabled()()
{
  return sub_23C9C9124(0, "TimerResponseFramework FeatureFlag enabled: %{BOOL}d");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()()
{
  return sub_23C9C9124(1, "ResponseFrameworkConfirmations FeatureFlag enabled: %{BOOL}d");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()()
{
  return 0;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isSuggestionHintsEnabled()()
{
  return sub_23C9B940C(6, "SuggestionHints FeatureFlag is enabled!");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isAlarmSmartEnabled()()
{
  return sub_23C9C927C(8, "alarm_smart FeatureFlag enabled: %{BOOL}d");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isSleepTimersEnabled()()
{
  return 0;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isWeekOfYearEnabled()()
{
  return sub_23C9C9124(9, "WeekOfYear FeatureFlag enabled: %{BOOL}d");
}

uint64_t sub_23C9C9124(char a1, const char *a2)
{
  size_t v11 = &type metadata for Features;
  unint64_t v12 = sub_23C9B952C();
  LOBYTE(v10[0]) = a1;
  char v4 = sub_23CA0D480();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  if (qword_268BBDE40 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23CA0E410();
  __swift_project_value_buffer(v5, (uint64_t)qword_268BBE320);
  unint64_t v6 = sub_23CA0E3F0();
  os_log_type_t v7 = sub_23CA0E710();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    v10[0] = v4 & 1;
    sub_23CA0E7C0();
    _os_log_impl(&dword_23C9B6000, v6, v7, a2, v8, 8u);
    MEMORY[0x23ECEDBE0](v8, -1, -1);
  }

  return v4 & 1;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isClockSmartEnabled()()
{
  return sub_23C9C927C(10, "clock_smart FeatureFlag enabled: %{BOOL}d");
}

uint64_t sub_23C9C927C(char a1, const char *a2)
{
  unint64_t v12 = &type metadata for Features;
  unint64_t v13 = sub_23C9B952C();
  LOBYTE(v11[0]) = a1;
  char v4 = sub_23CA0D480();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  if (v4) {
    char v5 = _s16SiriTimeInternal0aB16FeatureFlagsImplV19isTimerSmartEnabledSbyF_0();
  }
  else {
    char v5 = 0;
  }
  if (qword_268BBDE40 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_23CA0E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BBE320);
  os_log_type_t v7 = sub_23CA0E3F0();
  os_log_type_t v8 = sub_23CA0E710();
  if (os_log_type_enabled(v7, v8))
  {
    int64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v9 = 67109120;
    v11[0] = v5 & 1;
    sub_23CA0E7C0();
    _os_log_impl(&dword_23C9B6000, v7, v8, a2, v9, 8u);
    MEMORY[0x23ECEDBE0](v9, -1, -1);
  }

  return v5 & 1;
}

ValueMetadata *type metadata accessor for SiriTimeFeatureFlagsImpl()
{
  return &type metadata for SiriTimeFeatureFlagsImpl;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Features(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Features(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x23C9C9554);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t sub_23C9C957C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23C9C9588(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

uint64_t sub_23C9C95A4()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE348);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE348);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t String.toDismissSnoozeId.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_23CA0CA70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v8 - 8);
  os_log_type_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0CCC0();
  uint64_t v11 = sub_23CA0CD10();
  int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11);
  sub_23C9C9AC4((uint64_t)v10);
  if (v12 != 1)
  {
LABEL_5:
    if (qword_268BBDE48 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_23CA0E410();
    __swift_project_value_buffer(v19, (uint64_t)qword_268BBE348);
    unint64_t v20 = sub_23CA0E3F0();
    os_log_type_t v21 = sub_23CA0E710();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_23C9B6000, v20, v21, "[toDismissSnoozeId] Alarm/Timer ID is already a UUID - not modifying", v22, 2u);
      MEMORY[0x23ECEDBE0](v22, -1, -1);
    }

    swift_bridgeObjectRetain();
    return a1;
  }
  *(void *)&long long v30 = a1;
  *((void *)&v30 + 1) = a2;
  unint64_t v13 = sub_23C9C9B24();
  uint64_t v14 = MEMORY[0x23ECED0A0](61, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x263F8D310], v13);
  if (*(void *)(v14 + 16) == 2)
  {
    long long v29 = *(_OWORD *)(v14 + 64);
    uint64_t v15 = *(void *)(v14 + 80);
    uint64_t v16 = *(void *)(v14 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    long long v30 = v29;
    uint64_t v31 = v15;
    uint64_t v32 = v16;
    sub_23CA0CA50();
    sub_23C9C9B78();
    a1 = sub_23CA0E7F0();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    if (v18) {
      return a1;
    }
    __break(1u);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (qword_268BBDE48 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_23CA0E410();
  __swift_project_value_buffer(v23, (uint64_t)qword_268BBE348);
  swift_bridgeObjectRetain_n();
  uint64_t v24 = sub_23CA0E3F0();
  os_log_type_t v25 = sub_23CA0E700();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(void *)&long long v30 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_23C9BC474(a1, a2, (uint64_t *)&v30);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C9B6000, v24, v25, "Bad alarm/timer identifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v27, -1, -1);
    MEMORY[0x23ECEDBE0](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_23C9C9AC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23C9C9B24()
{
  unint64_t result = qword_268BBE368;
  if (!qword_268BBE368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE368);
  }
  return result;
}

unint64_t sub_23C9C9B78()
{
  unint64_t result = qword_268BBE370;
  if (!qword_268BBE370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE370);
  }
  return result;
}

uint64_t sub_23C9C9BCC()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE378);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE378);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v48 = a2;
  unint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v5 = sub_23CA0D5A0();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)&v42 - v9;
  uint64_t v11 = sub_23CA0D490();
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE390);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23CA0F560;
  *(void *)(v20 + 32) = a1;
  uint64_t v52 = v20;
  sub_23CA0E5D0();
  uint64_t v21 = v52;
  uint64_t v22 = sub_23CA0D750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  swift_retain();
  uint64_t v23 = MEMORY[0x23ECEBFA0](v21, v19);
  swift_bridgeObjectRelease();
  sub_23C9CA44C((uint64_t)v19);
  uint64_t v24 = v23;
  sub_23CA0D6B0();
  uint64_t v42 = v14;
  uint64_t v43 = v16;
  unint64_t v44 = v8;
  uint64_t v45 = v5;
  if (qword_268BBDE50 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_23CA0E410();
  __swift_project_value_buffer(v25, (uint64_t)qword_268BBE378);
  unint64_t v26 = v49;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v27 = sub_23CA0E3F0();
  os_log_type_t v28 = sub_23CA0E710();
  uint64_t v29 = v11;
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v52 = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_23C9BC474(v48, v26, &v52);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v51 = v24;
    sub_23CA0DDD0();
    sub_23C9CAE64();
    uint64_t v32 = sub_23CA0EB80();
    uint64_t v51 = sub_23C9BC474(v32, v33, &v52);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v27, v28, "#%sNLContextUpdateFactory sending SystemPrompted dialog act with graph: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v31, -1, -1);
    MEMORY[0x23ECEDBE0](v30, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = v45;
  uint64_t v35 = v46;
  uint64_t v36 = v47;
  uint64_t v37 = v42;
  uint64_t v38 = v43;
  sub_23CA0D590();
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v38, v29);
  sub_23CA0D580();
  uint64_t v39 = v50;
  sub_23CA0D620();
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v44, v10, v34);
  sub_23CA0D610();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v34);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v29);
  uint64_t v40 = sub_23CA0D630();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
}

uint64_t sub_23C9CA44C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static DialogActBuilder.buildPromptConfirmationDialogActFrom(_:forDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v72 = a3;
  uint64_t v70 = a2;
  uint64_t v74 = a4;
  uint64_t v62 = sub_23CA0D4E0();
  uint64_t v69 = *(void *)(v62 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v62);
  unint64_t v67 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v68 = (char *)&v55 - v7;
  uint64_t v61 = sub_23CA0D570();
  uint64_t v63 = *(void *)(v61 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v61);
  uint64_t v64 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v66 = (char *)&v55 - v10;
  uint64_t v11 = sub_23CA0D690();
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = sub_23CA0D490();
  uint64_t v71 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v55 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE390);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_23CA0F560;
  *(void *)(v26 + 32) = a1;
  v76[0] = v26;
  sub_23CA0E5D0();
  uint64_t v27 = v76[0];
  uint64_t v28 = sub_23CA0D750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v25, 1, 1, v28);
  swift_retain();
  uint64_t v29 = MEMORY[0x23ECEBFA0](v27, v25);
  swift_bridgeObjectRelease();
  sub_23C9CA44C((uint64_t)v25);
  uint64_t v73 = v29;
  sub_23CA0D6B0();
  uint64_t v56 = v20;
  uint64_t v57 = v14;
  uint64_t v59 = v22;
  uint64_t v60 = v17;
  if (qword_268BBDE50 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_23CA0E410();
  __swift_project_value_buffer(v30, (uint64_t)qword_268BBE378);
  uint64_t v31 = a1;
  swift_retain_n();
  unint64_t v32 = v72;
  swift_bridgeObjectRetain_n();
  unint64_t v33 = sub_23CA0E3F0();
  os_log_type_t v34 = sub_23CA0E710();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v58 = v11;
  uint64_t v36 = v16;
  uint64_t v37 = v71;
  if (v35)
  {
    os_log_type_t v38 = v34;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v76[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_23C9BC474(v70, v32, v76);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 2080;
    uint64_t v75 = v31;
    sub_23CA0D6E0();
    swift_retain();
    uint64_t v41 = sub_23CA0E4F0();
    uint64_t v75 = sub_23C9BC474(v41, v42, v76);
    sub_23CA0E7C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v33, v38, "#%sNLContextUpdateFactory sending SystemOffered dialog act with graph: %s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v40, -1, -1);
    MEMORY[0x23ECEDBE0](v39, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  unint64_t v44 = v68;
  uint64_t v43 = v69;
  uint64_t v45 = v61;
  uint64_t v47 = v66;
  uint64_t v46 = v67;
  uint64_t v48 = v65;
  sub_23CA0D680();
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v56, v59, v60);
  sub_23CA0D670();
  sub_23CA0D560();
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v57, v36, v58);
  sub_23CA0D550();
  sub_23CA0D4D0();
  uint64_t v49 = v63;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v64, v47, v45);
  sub_23CA0D4C0();
  uint64_t v50 = v74;
  sub_23CA0D620();
  uint64_t v51 = v46;
  uint64_t v52 = v62;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v51, v44, v62);
  sub_23CA0D600();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v52);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v45);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v36, v58);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v59, v60);
  uint64_t v53 = sub_23CA0D630();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v50, 0, 1, v53);
}

unint64_t sub_23C9CAE64()
{
  unint64_t result = qword_268BBE3A0;
  if (!qword_268BBE3A0)
  {
    sub_23CA0DDD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE3A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogActBuilder()
{
  return &type metadata for DialogActBuilder;
}

SiriTimeInternal::SiriTimeAppBundleId_optional __swiftcall SiriTimeAppBundleId.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_23CA0EA10();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t SiriTimeAppBundleId.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 7:
    case 8:
      unint64_t result = 0xD000000000000035;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9CB030(unsigned __int8 *a1, char *a2)
{
  return sub_23C9FC304(*a1, *a2);
}

unint64_t sub_23C9CB040()
{
  unint64_t result = qword_268BBE3A8;
  if (!qword_268BBE3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE3A8);
  }
  return result;
}

uint64_t sub_23C9CB094()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9CB0DC()
{
  return sub_23C9F3694();
}

uint64_t sub_23C9CB0E4()
{
  return sub_23CA0ED20();
}

SiriTimeInternal::SiriTimeAppBundleId_optional sub_23C9CB128(Swift::String *a1)
{
  return SiriTimeAppBundleId.init(rawValue:)(*a1);
}

unint64_t sub_23C9CB134@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriTimeAppBundleId.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTimeAppBundleId(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriTimeAppBundleId(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x23C9CB2B8);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeAppBundleId()
{
  return &type metadata for SiriTimeAppBundleId;
}

uint64_t sub_23C9CB2F0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE3B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE3B0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

NSObject *sub_23C9CB3BC(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = sub_23CA0E2D0();
  if (v2 > 1999)
  {
    int v3 = v1;
    if (v2 != 2000)
    {
      int v3 = v1;
      if (v2 != 3000) {
        goto LABEL_7;
      }
    }
    goto LABEL_13;
  }
  if (!v2)
  {
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_23CA0E410();
    __swift_project_value_buffer(v4, (uint64_t)qword_268BBEC30);
    int v3 = sub_23CA0E3F0();
    os_log_type_t v5 = sub_23CA0E710();
    if (os_log_type_enabled(v3, v5))
    {
      unsigned int v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl(&dword_23C9B6000, v3, v5, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v6, 2u);
      MEMORY[0x23ECEDBE0](v6, -1, -1);
    }

    goto LABEL_13;
  }
  int v3 = v1;
  if (v2 == 1000)
  {
LABEL_13:

    BOOL v7 = v1;
    return v1;
  }
LABEL_7:

  return 0;
}

uint64_t HALDeviceContext.remoteDevice.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(a2 + 8);
  os_log_type_t v5 = (void *)v4();
  char v6 = DeviceUnit.isRemote.getter();

  if (v6) {
    return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
  }
  else {
    return 0;
  }
}

uint64_t static HALDeviceContext.remoteExecutionId(for:from:)(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_23CA0E2D0();
  uint64_t result = 0;
  if (v4 > 1999)
  {
    if (v4 != 2000 && v4 != 3000) {
      return result;
    }
  }
  else if (v4)
  {
    if (v4 != 1000) {
      return result;
    }
  }
  else
  {
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23CA0E410();
    __swift_project_value_buffer(v6, (uint64_t)qword_268BBEC30);
    BOOL v7 = sub_23CA0E3F0();
    os_log_type_t v8 = sub_23CA0E710();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_23C9B6000, v7, v8, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v9, 2u);
      MEMORY[0x23ECEDBE0](v9, -1, -1);
    }
  }
  if (sub_23C9CB890((uint64_t)a1, a2)) {
    return 0;
  }
  if (qword_268BBDE58 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23CA0E410();
  __swift_project_value_buffer(v10, (uint64_t)qword_268BBE3B0);
  id v11 = a1;
  uint64_t v12 = sub_23CA0E3F0();
  os_log_type_t v13 = sub_23CA0E710();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v16 = sub_23CA0E2B0();
    sub_23C9BC474(v16, v17, &v20);
    sub_23CA0E7C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v18 = sub_23CA0E2C0();
    sub_23C9BC474(v18, v19, &v20);
    sub_23CA0E7C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v12, v13, "Remote device %s doesn't support intent handling. Will send ace command to remote assistant %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v15, -1, -1);
    MEMORY[0x23ECEDBE0](v14, -1, -1);
  }
  else
  {
  }
  return sub_23CA0E2C0();
}

uint64_t sub_23C9CB890(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_23CA0E9C0())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x23ECED190](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_23CA0E2E0();
      char v7 = sub_23CA0E750();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_23CA0E750();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x23ECED190](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_23CA0E750();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t HALDeviceContext.shouldDismissSilently.getter(uint64_t a1, uint64_t a2)
{
  return sub_23C9CBA50(a1, a2, DeviceUnit.shouldDismissSilently.getter);
}

uint64_t HALDeviceContext.shouldPromptForConfirmation.getter(uint64_t a1, uint64_t a2)
{
  return sub_23C9CBA50(a1, a2, DeviceUnit.shouldPromptForConfirmation.getter);
}

uint64_t HALDeviceContext.isRemote.getter(uint64_t a1, uint64_t a2)
{
  return sub_23C9CBA50(a1, a2, DeviceUnit.isRemote.getter);
}

uint64_t sub_23C9CBA50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v4 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  LOBYTE(a3) = a3();

  return a3 & 1;
}

BOOL HALDeviceContext.isLocal.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  sub_23CA0E2D0();
  uint64_t v3 = sub_23CA0E3E0();
  uint64_t v4 = sub_23CA0E3E0();

  return v3 == v4;
}

uint64_t HALDeviceContext.isCommunal.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  char v3 = _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0();

  return v3 & 1;
}

NSObject *sub_23C9CBB40()
{
  return sub_23C9CB3BC(*v0);
}

uint64_t dispatch thunk of HALTemporalItem.isFiring.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HALDeviceContext.device.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HALDeviceContext.remoteDevice.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23C9CBBA0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE3C8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE3C8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

BOOL static TemporalEntityMatching.MatchResult.LabelMatchType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TemporalEntityMatching.MatchResult.LabelMatchType.hash(into:)()
{
  return sub_23CA0ED10();
}

uint64_t TemporalEntityMatching.MatchResult.LabelMatchType.hashValue.getter()
{
  return sub_23CA0ED20();
}

BOOL static TemporalEntityMatching.MatchResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 5) {
    return v3 == 5;
  }
  if (v3 == 5) {
    return 0;
  }
  return v2 == v3;
}

BOOL sub_23C9CBD2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 5) {
    return v3 == 5;
  }
  if (v3 == 5) {
    return 0;
  }
  return v2 == v3;
}

void static TemporalEntityMatching.matchLabel(intentsSearchTitle:entityTitle:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, int64_t a4@<X3>, char *a5@<X8>)
{
  int64_t v55 = a4;
  uint64_t v45 = a5;
  uint64_t v8 = sub_23CA0CA70();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = a1;
  unint64_t v59 = a2;
  sub_23CA0CA40();
  unint64_t v12 = sub_23C9C9B24();
  uint64_t v13 = sub_23CA0E7E0();
  unint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v11, v8);
  uint64_t v58 = a3;
  unint64_t v59 = v55;
  sub_23CA0CA40();
  uint64_t v17 = sub_23CA0E7E0();
  unint64_t v19 = v18;
  v16(v11, v8);
  uint64_t v20 = HIBYTE(v15) & 0xF;
  uint64_t v50 = v13 & 0xFFFFFFFFFFFFLL;
  uint64_t v51 = v20;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v20 = v13 & 0xFFFFFFFFFFFFLL;
  }
  int64_t v55 = v20;
  if (v20)
  {
    uint64_t v58 = v17;
    unint64_t v59 = v19;
    uint64_t v56 = v13;
    unint64_t v57 = v15;
    if (sub_23CA0E810())
    {
      uint64_t v58 = v17;
      unint64_t v59 = v19;
      uint64_t v56 = v13;
      unint64_t v57 = v15;
      BOOL v21 = sub_23CA0E800() != 0;
      swift_bridgeObjectRelease();
LABEL_39:
      swift_bridgeObjectRelease();
      char v23 = 2 * v21;
      goto LABEL_42;
    }
    uint64_t v58 = v13;
    unint64_t v59 = v15;
    uint64_t v56 = v17;
    unint64_t v57 = v19;
    if (sub_23CA0E810()) {
      goto LABEL_41;
    }
    unint64_t v44 = v12;
    uint64_t v53 = v13;
    unint64_t v54 = v15;
    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
    uint64_t v48 = v17 & 0xFFFFFFFFFFFFLL;
    uint64_t v49 = HIBYTE(v19) & 0xF;
    if ((v19 & 0x2000000000000000) != 0) {
      uint64_t v24 = HIBYTE(v19) & 0xF;
    }
    else {
      uint64_t v24 = v17 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v52 = v17;
    if (v24)
    {
      uint64_t v46 = (v19 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v47 = v19 & 0xFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain();
      uint64_t v25 = 0;
      do
      {
        if ((v19 & 0x1000000000000000) != 0)
        {
          sub_23CA0E8E0();
        }
        else
        {
          if ((v19 & 0x2000000000000000) != 0)
          {
            uint64_t v56 = v17;
            unint64_t v57 = v47;
          }
          else if ((v17 & 0x1000000000000000) == 0)
          {
            sub_23CA0E950();
          }
          sub_23CA0E960();
        }
        uint64_t v27 = v26;
        sub_23CA0CA40();
        char v28 = sub_23CA0CA60();
        v16(v11, v8);
        if ((v28 & 1) == 0) {
          sub_23CA0E510();
        }
        v25 += v27;
        uint64_t v17 = v52;
      }
      while (v25 < v24);
      swift_bridgeObjectRelease();
      uint64_t v47 = v58;
      uint64_t v48 = v59;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
    }
    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
    uint64_t v49 = v54 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    int64_t v29 = 0;
    do
    {
      if ((v54 & 0x1000000000000000) != 0)
      {
        sub_23CA0E8E0();
      }
      else
      {
        if ((v54 & 0x2000000000000000) != 0)
        {
          uint64_t v56 = v53;
          unint64_t v57 = v49;
        }
        else if ((v53 & 0x1000000000000000) == 0)
        {
          sub_23CA0E950();
        }
        sub_23CA0E960();
      }
      uint64_t v31 = v30;
      sub_23CA0CA40();
      char v32 = sub_23CA0CA60();
      v16(v11, v8);
      if ((v32 & 1) == 0) {
        sub_23CA0E510();
      }
      v29 += v31;
    }
    while (v29 < v55);
    swift_bridgeObjectRelease();
    uint64_t v33 = v58;
    unint64_t v34 = v59;
    uint64_t v36 = v47;
    unint64_t v35 = v48;
    uint64_t v58 = v47;
    unint64_t v59 = v48;
    uint64_t v56 = v33;
    unint64_t v57 = v34;
    if (sub_23CA0E810())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v58 = v36;
      unint64_t v59 = v35;
      uint64_t v56 = v33;
      unint64_t v57 = v34;
      BOOL v21 = sub_23CA0E800() != 0;
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
    uint64_t v58 = v33;
    unint64_t v59 = v34;
    uint64_t v56 = v36;
    unint64_t v57 = v35;
    char v37 = sub_23CA0E810();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v37)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v23 = 3;
      goto LABEL_42;
    }
    if (qword_268BBDE60 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_23CA0E410();
    __swift_project_value_buffer(v38, (uint64_t)qword_268BBE3C8);
    swift_bridgeObjectRetain();
    unint64_t v39 = v54;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_23CA0E3F0();
    os_log_type_t v41 = sub_23CA0E6E0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v58 = v43;
      *(_DWORD *)uint64_t v42 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_23C9BC474(v52, v19, &v58);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v42 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_23C9BC474(v53, v39, &v58);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23C9B6000, v40, v41, "Titles don't match: MTTimer – %s, SiriTimer - %s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v43, -1, -1);
      MEMORY[0x23ECEDBE0](v42, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    char v23 = 5;
  }
  else
  {
    uint64_t v22 = HIBYTE(v19) & 0xF;
    if ((v19 & 0x2000000000000000) == 0) {
      uint64_t v22 = v17 & 0xFFFFFFFFFFFFLL;
    }
    char v23 = v22 != 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_42:
  char *v45 = v23;
}

void static TemporalEntityMatching.matchLabel(intentsSearchTitle:entityTitle:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X8>)
{
  if (!a2)
  {
    if (a4)
    {
      uint64_t v10 = HIBYTE(a4) & 0xF;
      if ((a4 & 0x2000000000000000) == 0) {
        uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
      }
      if (v10)
      {
        char v11 = 1;
LABEL_21:
        *a5 = v11;
        return;
      }
    }
LABEL_18:
    *a5 = 0;
    return;
  }
  if (!a4)
  {
    uint64_t v12 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
    }
    if (v12)
    {
      uint64_t v13 = qword_268BBDE60;
      swift_bridgeObjectRetain();
      if (v13 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_23CA0E410();
      __swift_project_value_buffer(v14, (uint64_t)qword_268BBE3C8);
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_23CA0E3F0();
      os_log_type_t v16 = sub_23CA0E6E0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v19 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        sub_23C9BC474(a1, a2, &v19);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23C9B6000, v15, v16, "Title doesn't match: MTTimer – nil, SiriTimer - %s", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v18, -1, -1);
        MEMORY[0x23ECEDBE0](v17, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      char v11 = 5;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  static TemporalEntityMatching.matchLabel(intentsSearchTitle:entityTitle:)(a1, a2, a3, a4, a5);
  swift_bridgeObjectRelease();
}

unint64_t sub_23C9CC6A8()
{
  unint64_t result = qword_268BBE3E0;
  if (!qword_268BBE3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE3E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TemporalEntityMatching()
{
  return &type metadata for TemporalEntityMatching;
}

uint64_t getEnumTagSinglePayload for TemporalEntityMatching.MatchResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB)
  {
    unsigned int v2 = a2 + 5;
    if (a2 + 5 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 5;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 5;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23C9CC7B8);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 5;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 5;
  unsigned int v9 = v7 - 5;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for TemporalEntityMatching.MatchResult(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 5;
  if (a3 + 5 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFB) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v7 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x23C9CC8A0);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_23C9CC8C8(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 5) {
    return v1 - 4;
  }
  else {
    return 0;
  }
}

unsigned char *sub_23C9CC8DC(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for TemporalEntityMatching.MatchResult()
{
  return &type metadata for TemporalEntityMatching.MatchResult;
}

uint64_t getEnumTagSinglePayload for TemporalEntityMatching.MatchResult.LabelMatchType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TemporalEntityMatching.MatchResult.LabelMatchType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9CCA58);
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

ValueMetadata *type metadata accessor for TemporalEntityMatching.MatchResult.LabelMatchType()
{
  return &type metadata for TemporalEntityMatching.MatchResult.LabelMatchType;
}

uint64_t sub_23C9CCA90()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE3E8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE3E8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t SIRINLUUserDialogAct.firstUsoTask.getter()
{
  unint64_t v0 = sub_23CA0D770();
  unint64_t v1 = v0;
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_23CA0E9C0();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v2 = MEMORY[0x23ECED190](0, v1);
      }
      else
      {
        if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_19:
          swift_once();
LABEL_7:
          uint64_t v3 = sub_23CA0E410();
          __swift_project_value_buffer(v3, (uint64_t)qword_268BBE3E8);
          swift_retain_n();
          unsigned int v4 = sub_23CA0E3F0();
          os_log_type_t v5 = sub_23CA0E710();
          if (os_log_type_enabled(v4, v5))
          {
            uint64_t v6 = swift_slowAlloc();
            uint64_t v7 = swift_slowAlloc();
            v17[0] = v7;
            *(_DWORD *)uint64_t v6 = 136315394;
            uint64_t v8 = sub_23CA0DDF0();
            sub_23C9BC474(v8, v9, v17);
            sub_23CA0E7C0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v6 + 12) = 2080;
            uint64_t v10 = sub_23CA0DDE0();
            sub_23C9BC474(v10, v11, v17);
            sub_23CA0E7C0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23C9B6000, v4, v5, "NLv4TranslationParse: Input is entity=%s verb=%s", (uint8_t *)v6, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x23ECEDBE0](v7, -1, -1);
            MEMORY[0x23ECEDBE0](v6, -1, -1);
          }
          else
          {

            swift_release_n();
          }
          return v2;
        }
        uint64_t v2 = *(void *)(v1 + 32);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      if (qword_268BBDE68 == -1) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_268BBDE68 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_23CA0E410();
  __swift_project_value_buffer(v13, (uint64_t)qword_268BBE3E8);
  uint64_t v14 = sub_23CA0E3F0();
  os_log_type_t v15 = sub_23CA0E700();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    _os_log_impl(&dword_23C9B6000, v14, v15, "NLv4TranslationParse: No tasks in input?", v16, 2u);
    MEMORY[0x23ECEDBE0](v16, -1, -1);
  }

  return 0;
}

uint64_t static Siri_Nlu_External_SystemDialogAct.buildDisambiguationDialogActFrom(_:includeBinaryPrompt:)@<X0>(unint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v64 = sub_23CA0D4E0();
  uint64_t v63 = *(void *)(v64 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v64);
  uint64_t v62 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (char *)v60 - v8;
  uint64_t v73 = sub_23CA0D660();
  uint64_t v72 = *(void *)(v73 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v73);
  uint64_t v65 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v71 = (char *)v60 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE390);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_23CA0D490();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v92 = (char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_23CA0D5E0();
  uint64_t v17 = *(void *)(v93 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v93);
  id v81 = (char *)v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  os_log_type_t v83 = (char *)v60 - v20;
  uint64_t v21 = sub_23CA0D570();
  uint64_t v82 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v84 = (char *)v60 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v77 = (char *)v60 - v27;
  uint64_t v68 = sub_23CA0D630();
  uint64_t v67 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v70 = (char *)v60 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0D620();
  unint64_t v90 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_23CA0E9C0();
    uint64_t v29 = result;
  }
  else
  {
    uint64_t v29 = *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v69 = a3;
  int v66 = a2;
  v60[1] = v24;
  if (v29)
  {
    if (v29 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v89 = v29;
    uint64_t v31 = 0;
    unint64_t v87 = (void (**)(char *, uint64_t))(v17 + 8);
    unint64_t v88 = v90 & 0xC000000000000001;
    uint64_t v86 = v82 + 8;
    uint64_t v79 = (void (**)(char *, char *, uint64_t))(v82 + 16);
    uint64_t v80 = (void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v78 = v82 + 32;
    unint64_t v91 = MEMORY[0x263F8EE78];
    *((void *)&v32 + 1) = 3;
    long long v85 = xmmword_23CA0F560;
    *(void *)&long long v32 = 136315138;
    long long v75 = v32;
    uint64_t v74 = MEMORY[0x263F8EE58] + 8;
    uint64_t v33 = v83;
    unint64_t v34 = v77;
    uint64_t v76 = v21;
    do
    {
      if (v88)
      {
        uint64_t v35 = MEMORY[0x23ECED190](v31, v90);
      }
      else
      {
        uint64_t v35 = *(void *)(v90 + 8 * v31 + 32);
        swift_retain();
      }
      sub_23CA0D560();
      sub_23CA0D5D0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = v85;
      *(void *)(v36 + 32) = v35;
      uint64_t v95 = v36;
      sub_23CA0E5D0();
      uint64_t v37 = v95;
      swift_retain();
      sub_23CA0D740();
      uint64_t v38 = sub_23CA0D750();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v14, 0, 1, v38);
      MEMORY[0x23ECEBFA0](v37, v14);
      swift_bridgeObjectRelease();
      sub_23C9BAA2C((uint64_t)v14, &qword_268BBE390);
      sub_23CA0D6B0();
      swift_release();
      sub_23CA0D5C0();
      (*v80)(v81, v33, v93);
      sub_23CA0D540();
      (*v79)(v84, v34, v21);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v91 = sub_23C9CDD74(0, *(void *)(v91 + 16) + 1, 1, v91, &qword_268BBE440, MEMORY[0x263F71570], MEMORY[0x263F71570]);
      }
      unint64_t v40 = *(void *)(v91 + 16);
      unint64_t v39 = *(void *)(v91 + 24);
      if (v40 >= v39 >> 1) {
        unint64_t v91 = sub_23C9CDD74(v39 > 1, v40 + 1, 1, v91, &qword_268BBE440, MEMORY[0x263F71570], MEMORY[0x263F71570]);
      }
      unint64_t v41 = v91;
      *(void *)(v91 + 16) = v40 + 1;
      uint64_t v42 = v82;
      (*(void (**)(unint64_t, char *, uint64_t))(v82 + 32))(v41+ ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(void *)(v42 + 72) * v40, v84, v21);
      swift_release();
      uint64_t v33 = v83;
      (*v87)(v83, v93);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v21);
      ++v31;
    }
    while (v89 != v31);
  }
  else
  {
    unint64_t v91 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v43 = v71;
  sub_23CA0D650();
  swift_bridgeObjectRetain();
  sub_23CA0D640();
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v65, v43, v73);
  unint64_t v44 = v70;
  sub_23CA0D5F0();
  if (v66)
  {
    uint64_t v45 = v61;
    sub_23CA0D4D0();
    sub_23CA0D560();
    sub_23CA0D4C0();
    uint64_t v46 = v63;
    uint64_t v47 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v62, v45, v64);
    sub_23CA0D600();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  }
  if (qword_268BBDE68 != -1) {
    swift_once();
  }
  uint64_t v48 = sub_23CA0E410();
  __swift_project_value_buffer(v48, (uint64_t)qword_268BBE3E8);
  swift_bridgeObjectRetain_n();
  uint64_t v49 = sub_23CA0E3F0();
  os_log_type_t v50 = sub_23CA0E710();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v95 = v52;
    *(_DWORD *)uint64_t v51 = 134218242;
    uint64_t v94 = *(void *)(v91 + 16);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2080;
    uint64_t v53 = swift_bridgeObjectRetain();
    uint64_t v54 = MEMORY[0x23ECECE40](v53, v21);
    unint64_t v56 = v55;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_23C9BC474(v54, v56, &v95);
    unint64_t v44 = v70;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v49, v50, "#NLContextUpdateFactory sending SystemGaveOptions dialog act with %ld choices: %s", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v52, -1, -1);
    MEMORY[0x23ECEDBE0](v51, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v57 = v67;
  uint64_t v58 = v69;
  uint64_t v59 = v68;
  (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v69, v44, v68);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v57 + 56))(v58, 0, 1, v59);
}

uint64_t sub_23C9CDD40(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C9CDD74(a1, a2, a3, a4, &qword_268BBE438, MEMORY[0x263F07490], MEMORY[0x263F07490]);
}

uint64_t sub_23C9CDD74(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_23CA0E9A0();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C9CE4EC(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_23C9CDFF4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_23C9CE050(a1, a2, a3, a4, &qword_268BBE430);
}

uint64_t sub_23C9CE008(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23C9CDD74(a1, a2, a3, a4, &qword_268BBE428, MEMORY[0x263F07508], MEMORY[0x263F07508]);
}

void *sub_23C9CE03C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_23C9CE050(a1, a2, a3, a4, &qword_268BBE420);
}

void *sub_23C9CE050(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      unint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 1;
      }
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 5);
      uint64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v11 = (void *)MEMORY[0x263F8EE78];
      uint64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[4 * v9 + 4]) {
          memmove(v14, a4 + 4, 32 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23C9CE648(0, v9, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C9CE16C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE410);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_23CA0E9A0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C9CE738(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_23C9CE3DC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE408);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23C9CE894(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C9CE4EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9CE648(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9CE738(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9CE894(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9CE98C()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE448);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE448);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23C9CEA54()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  __swift_allocate_value_buffer(v0, qword_268BC2CE0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2CE0);
  uint64_t v2 = sub_23CA0CCB0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(v1, 1, 1, v2);
}

uint64_t static DateTimeInferenceUtils.dateComponents(forDateTime:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE468);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE470);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CA0E030();
  uint64_t v7 = sub_23CA0E040();
  uint64_t v8 = sub_23CA0CE20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = sub_23CA0CE40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_23CA0CBD0();
  if (v6)
  {
    swift_retain();
    sub_23CA0DF00();
    swift_release();
    sub_23CA0CB50();
    swift_retain();
    sub_23CA0DF10();
    swift_release();
    sub_23CA0CB70();
    swift_retain();
    sub_23CA0DEF0();
    swift_release();
  }
  else
  {
    sub_23CA0CB50();
    sub_23CA0CB70();
  }
  sub_23CA0CB00();
  if (v7)
  {
    swift_retain();
    sub_23CA0DF70();
    char v11 = v10;
    swift_release();
    if (v11) {
      sub_23CA0DF80();
    }
    sub_23CA0CB30();
    swift_retain();
    sub_23CA0DF90();
    swift_release();
  }
  else
  {
    sub_23CA0CB30();
  }
  sub_23CA0CB80();
  swift_release();
  return swift_release();
}

uint64_t static DateTimeInferenceUtils.inferDateTimeRange(from:anchorDate:)(uint64_t a1, uint64_t a2)
{
  return sub_23C9BDBD8(a1, 1, a2);
}

uint64_t static DateTimeInferenceUtils.simpleTimeResolution(forDateComponents:meridiemSetByUser:allowNearest:referenceDate:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  v398 = a4;
  int v368 = a3;
  int v385 = a2;
  uint64_t v392 = a1;
  uint64_t v390 = sub_23CA0CDA0();
  uint64_t v397 = *(void *)(v390 - 8);
  MEMORY[0x270FA5388](v390);
  v389 = (char *)&v328 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v396 = sub_23CA0CDB0();
  uint64_t v395 = *(void *)(v396 - 8);
  MEMORY[0x270FA5388](v396);
  v388 = (char *)&v328 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v400 = sub_23CA0CD70();
  uint64_t v399 = *(void *)(v400 - 8);
  MEMORY[0x270FA5388](v400);
  v387 = (char *)&v328 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v381 = (void *)sub_23CA0CE10();
  uint64_t v380 = *(v381 - 1);
  MEMORY[0x270FA5388](v381);
  v379 = (char *)&v328 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v360 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  uint64_t v10 = MEMORY[0x270FA5388](v360);
  uint64_t v367 = (uint64_t)&v328 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v359 = (uint64_t)&v328 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v366 = (char *)&v328 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v372 = (uint64_t)&v328 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v345 = (char *)&v328 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v362 = (char *)&v328 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v349 = (char *)&v328 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v358 = (char *)&v328 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v357 = (char *)&v328 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v328 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  v363 = (char *)&v328 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v370 = (char **)((char *)&v328 - v34);
  MEMORY[0x270FA5388](v33);
  uint64_t v393 = (uint64_t)&v328 - v35;
  uint64_t v36 = sub_23CA0CCB0();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v361 = (char *)&v328 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v342 = (char *)&v328 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v340 = (char *)&v328 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v341 = (char *)&v328 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v351 = (char *)&v328 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v350 = (char *)&v328 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v355 = (void (*)(char *, uint64_t, uint64_t))((char *)&v328 - v51);
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  uint64_t v54 = (char *)&v328 - v53;
  uint64_t v55 = MEMORY[0x270FA5388](v52);
  v343 = (char *)&v328 - v56;
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  v344 = (char *)&v328 - v58;
  uint64_t v59 = MEMORY[0x270FA5388](v57);
  v354 = (char *)&v328 - v60;
  uint64_t v61 = MEMORY[0x270FA5388](v59);
  v346 = (char *)&v328 - v62;
  uint64_t v63 = MEMORY[0x270FA5388](v61);
  v347 = (char *)&v328 - v64;
  uint64_t v65 = MEMORY[0x270FA5388](v63);
  v348 = (char *)&v328 - v66;
  uint64_t v67 = MEMORY[0x270FA5388](v65);
  v369 = (char *)&v328 - v68;
  uint64_t v69 = MEMORY[0x270FA5388](v67);
  v384 = (char *)&v328 - v70;
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v352 = (char *)&v328 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v353 = (char *)&v328 - v74;
  uint64_t v75 = MEMORY[0x270FA5388](v73);
  v383 = (char *)&v328 - v76;
  MEMORY[0x270FA5388](v75);
  uint64_t v78 = (char *)&v328 - v77;
  uint64_t v377 = sub_23CA0CE20();
  uint64_t v378 = *(void *)(v377 - 8);
  MEMORY[0x270FA5388](v377);
  uint64_t v80 = (char *)&v328 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_23CA0CBE0();
  uint64_t v82 = *(void *)(v81 - 8);
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  v356 = (char *)&v328 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = MEMORY[0x270FA5388](v83);
  v373 = (char *)&v328 - v86;
  MEMORY[0x270FA5388](v85);
  unint64_t v88 = (char *)&v328 - v87;
  uint64_t v89 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
  uint64_t v365 = v82 + 16;
  v364 = v89;
  v89((char *)&v328 - v87, (char *)v392, v81);
  sub_23CA0CB50();
  sub_23CA0CB70();
  sub_23CA0CB00();
  uint64_t v90 = sub_23CA0CB20();
  if (v91)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(a5, 1, 1, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v88, v81);
  }
  uint64_t v338 = (uint64_t)v30;
  uint64_t v332 = v90;
  v386 = v88;
  uint64_t v371 = v82;
  uint64_t v382 = v81;
  sub_23CA0CDF0();
  if (qword_268BBDE70 != -1) {
    swift_once();
  }
  uint64_t v92 = sub_23CA0E410();
  uint64_t v93 = __swift_project_value_buffer(v92, (uint64_t)qword_268BBE448);
  uint64_t v94 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v376 = v37 + 16;
  v375 = v94;
  ((void (*)(char *))v94)(v78);
  uint64_t v392 = v93;
  uint64_t v95 = sub_23CA0E3F0();
  os_log_type_t v96 = sub_23CA0E6F0();
  BOOL v97 = os_log_type_enabled(v95, v96);
  uint64_t v401 = v36;
  uint64_t v394 = v37;
  v391 = v80;
  uint64_t v339 = a5;
  v328 = v54;
  if (v97)
  {
    uint64_t v98 = (uint8_t *)swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    uint64_t v406 = v99;
    *(_DWORD *)uint64_t v98 = 136315138;
    sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
    uint64_t v100 = sub_23CA0EB80();
    uint64_t v405 = sub_23C9BC474(v100, v101, &v406);
    uint64_t v37 = v394;
    uint64_t v102 = v393;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    v374 = *(void (**)(char *, uint64_t))(v37 + 8);
    v374(v78, v401);
    _os_log_impl(&dword_23C9B6000, v95, v96, "simpleDateTimeResolution: Using referenceDate %s", v98, 0xCu);
    swift_arrayDestroy();
    uint64_t v103 = v99;
    uint64_t v36 = v401;
    MEMORY[0x23ECEDBE0](v103, -1, -1);
    MEMORY[0x23ECEDBE0](v98, -1, -1);

    uint64_t v104 = v383;
    unint64_t v105 = v381;
    uint64_t v106 = v380;
  }
  else
  {
    v374 = *(void (**)(char *, uint64_t))(v37 + 8);
    v374(v78, v36);

    uint64_t v104 = v383;
    unint64_t v105 = v381;
    uint64_t v106 = v380;
    uint64_t v102 = v393;
  }
  v108 = v379;
  (*(void (**)(char *, void, void *))(v106 + 104))(v379, *MEMORY[0x263F078C8], v105);
  sub_23CA0CDE0();
  (*(void (**)(char *, void *))(v106 + 8))(v108, v105);
  uint64_t v109 = (unsigned int *)MEMORY[0x263F07800];
  uint64_t v110 = (unsigned int *)MEMORY[0x263F077E0];
  if (v385)
  {
    id v111 = (void (*)(void, void, void))v370;
    sub_23C9BFA3C(v102, (uint64_t)v370);
    unint64_t v112 = *(void **)(v37 + 48);
    if (((unsigned int (*)(void, uint64_t, uint64_t))v112)(v111, 1, v36) != 1)
    {
      uint64_t v113 = *(char **)(v37 + 32);
      uint64_t v380 = v37 + 32;
      v379 = v113;
      ((void (*)(char *, void, uint64_t))v113)(v104, v111, v36);
      os_log_t v114 = v387;
      (*(void (**)(char *, void, uint64_t))(v399 + 104))(v387, *MEMORY[0x263F07768], v400);
      uint64_t v115 = *v109;
      v381 = v112;
      uint64_t v116 = v395;
      long long v117 = v388;
      uint64_t v118 = v396;
      (*(void (**)(char *, uint64_t, uint64_t))(v395 + 104))(v388, v115, v396);
      uint64_t v119 = v397;
      os_log_type_t v120 = v389;
      uint64_t v121 = v390;
      (*(void (**)(char *, void, uint64_t))(v397 + 104))(v389, *MEMORY[0x263F077E0], v390);
      uint64_t v122 = v363;
      sub_23CA0CE00();
      char v123 = v120;
      uint64_t v124 = v401;
      (*(void (**)(char *, uint64_t))(v119 + 8))(v123, v121);
      id v111 = (void (*)(void, void, void))v122;
      (*(void (**)(char *, uint64_t))(v116 + 8))(v117, v118);
      (*(void (**)(char *, uint64_t))(v399 + 8))(v114, v400);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v381)(v122, 1, v124) != 1)
      {
        v186 = v353;
        v187 = v122;
        v188 = v379;
        ((void (*)(char *, char *, uint64_t))v379)(v353, v187, v124);
        v189 = v352;
        v375(v352, v186, v124);
        v190 = sub_23CA0E3F0();
        os_log_type_t v191 = sub_23CA0E6F0();
        if (os_log_type_enabled(v190, v191))
        {
          v192 = (uint8_t *)swift_slowAlloc();
          uint64_t v193 = swift_slowAlloc();
          uint64_t v406 = v193;
          *(_DWORD *)v192 = 136315138;
          sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
          uint64_t v194 = sub_23CA0EB80();
          uint64_t v405 = sub_23C9BC474(v194, v195, &v406);
          uint64_t v196 = v401;
          sub_23CA0E7C0();
          swift_bridgeObjectRelease();
          uint64_t v197 = v394;
          v198 = v374;
          v374(v189, v196);
          _os_log_impl(&dword_23C9B6000, v190, v191, "simpleDateTimeResolution: exact match: %s", v192, 0xCu);
          swift_arrayDestroy();
          uint64_t v199 = v193;
          v188 = v379;
          MEMORY[0x23ECEDBE0](v199, -1, -1);
          MEMORY[0x23ECEDBE0](v192, -1, -1);

          v198(v383, v196);
          uint64_t v124 = v196;
        }
        else
        {

          uint64_t v197 = v394;
          v208 = v374;
          v374(v189, v124);
          v208(v383, v124);
        }
        sub_23C9BAA2C(v393, &qword_268BBE460);
        (*(void (**)(char *, uint64_t))(v378 + 8))(v391, v377);
        uint64_t v209 = v371;
        uint64_t v210 = v339;
        ((void (*)(uint64_t, char *, uint64_t))v188)(v339, v186, v124);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v197 + 56))(v210, 0, 1, v124);
        return (*(uint64_t (**)(char *, uint64_t))(v209 + 8))(v386, v382);
      }
      v374(v383, v124);
      uint64_t v109 = (unsigned int *)MEMORY[0x263F07800];
    }
    sub_23C9BAA2C((uint64_t)v111, &qword_268BBE460);
    uint64_t v110 = (unsigned int *)MEMORY[0x263F077E0];
  }
  uint64_t v125 = v399;
  unint64_t v126 = *(char **)(v399 + 104);
  uint64_t v127 = v387;
  unsigned int v333 = *MEMORY[0x263F07780];
  v363 = (char *)(v399 + 104);
  v353 = v126;
  ((void (*)(char *))v126)(v387);
  int v128 = *v109;
  uint64_t v129 = v395;
  v130 = *(char ***)(v395 + 104);
  v131 = v388;
  LODWORD(v379) = v128;
  uint64_t v380 = v395 + 104;
  v370 = v130;
  ((void (*)(char *))v130)(v388);
  unsigned int v132 = *v110;
  uint64_t v133 = v397;
  uint64_t v134 = *(void (**)(void))(v397 + 104);
  uint64_t v135 = v389;
  unsigned int v329 = v132;
  uint64_t v136 = v390;
  uint64_t v337 = v397 + 104;
  v336 = v134;
  v134(v389);
  uint64_t v137 = v338;
  sub_23CA0CE00();
  uint64_t v138 = v137;
  uint64_t v139 = *(char **)(v133 + 8);
  uint64_t v397 = v133 + 8;
  v352 = v139;
  ((void (*)(char *, uint64_t))v139)(v135, v136);
  uint64_t v140 = *(void (**)(char *, uint64_t))(v129 + 8);
  uint64_t v395 = v129 + 8;
  v334 = v140;
  v140(v131, v396);
  uint64_t v141 = v401;
  uint64_t v142 = *(void (**)(char *, uint64_t))(v125 + 8);
  uint64_t v399 = v125 + 8;
  v335 = v142;
  v142(v127, v400);
  uint64_t v143 = v394;
  v145 = (char *)(v394 + 48);
  uint64_t v144 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v394 + 48);
  if (v144(v137, 1, v141) == 1)
  {
    sub_23C9BAA2C(v137, &qword_268BBE460);
    v146 = sub_23CA0E3F0();
    os_log_type_t v147 = sub_23CA0E6F0();
    BOOL v148 = os_log_type_enabled(v146, v147);
    uint64_t v149 = v371;
    if (v148)
    {
      v150 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v150 = 0;
      _os_log_impl(&dword_23C9B6000, v146, v147, "simpleDateTimeResolution: unable to find next matching date for date components", v150, 2u);
      MEMORY[0x23ECEDBE0](v150, -1, -1);
    }

    sub_23C9BAA2C(v393, &qword_268BBE460);
    (*(void (**)(char *, uint64_t))(v378 + 8))(v391, v377);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v394 + 56))(v339, 1, 1, v141);
    return (*(uint64_t (**)(char *, uint64_t))(v149 + 8))(v386, v382);
  }
  v381 = v144;
  uint64_t v151 = *(void (**)(char *, uint64_t, uint64_t))(v143 + 32);
  uint64_t v152 = v384;
  v151(v384, v138, v141);
  uint64_t v153 = v369;
  v375(v369, v152, v141);
  v154 = sub_23CA0E3F0();
  os_log_type_t v155 = sub_23CA0E6F0();
  uint64_t v156 = v155;
  BOOL v157 = os_log_type_enabled(v154, v155);
  uint64_t v330 = v143 + 32;
  v383 = v145;
  if (v157)
  {
    v158 = (uint8_t *)swift_slowAlloc();
    uint64_t v159 = swift_slowAlloc();
    uint64_t v406 = v159;
    *(_DWORD *)v158 = 136315138;
    sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
    uint64_t v160 = sub_23CA0EB80();
    uint64_t v405 = sub_23C9BC474(v160, v161, &v406);
    uint64_t v141 = v401;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    v374(v153, v141);
    _os_log_impl(&dword_23C9B6000, v154, (os_log_type_t)v156, "simpleDateTimeResolution: nextMatching: %s", v158, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v159, -1, -1);
    MEMORY[0x23ECEDBE0](v158, -1, -1);
  }
  else
  {
    v374(v153, v141);
  }

  int v162 = v373;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE438);
  unint64_t v163 = (*(unsigned __int8 *)(v143 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80);
  uint64_t v338 = *(void *)(v143 + 72);
  uint64_t v164 = swift_allocObject();
  *(_OWORD *)(v164 + 16) = xmmword_23CA0F8D0;
  v369 = (char *)v163;
  v375((char *)(v164 + v163), v384, v141);
  unint64_t v407 = v164;
  uint64_t v165 = v382;
  v331 = v151;
  if (v385) {
    goto LABEL_53;
  }
  v364(v162, v386, v382);
  if (__OFADD__(v332, 12))
  {
    __break(1u);
    goto LABEL_97;
  }
  sub_23CA0CB30();
  v166 = sub_23CA0E3F0();
  os_log_type_t v167 = sub_23CA0E6F0();
  if (os_log_type_enabled(v166, v167))
  {
    v168 = (uint8_t *)swift_slowAlloc();
    uint64_t v169 = swift_slowAlloc();
    uint64_t v406 = v169;
    *(_DWORD *)v168 = 136315138;
    swift_beginAccess();
    sub_23C9D4374(&qword_268BBE478, MEMORY[0x263F063B0]);
    uint64_t v170 = sub_23CA0EB80();
    uint64_t v405 = sub_23C9BC474(v170, v171, &v406);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v166, v167, "simpleDateTimeResolution: using components for nextMatchingOffset: %s", v168, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v169, -1, -1);
    MEMORY[0x23ECEDBE0](v168, -1, -1);
  }

  v172 = sub_23CA0E3F0();
  os_log_type_t v173 = sub_23CA0E6F0();
  if (os_log_type_enabled(v172, v173))
  {
    uint64_t v174 = (uint8_t *)swift_slowAlloc();
    uint64_t v175 = swift_slowAlloc();
    uint64_t v406 = v175;
    *(_DWORD *)uint64_t v174 = 136315138;
    swift_beginAccess();
    sub_23C9D4374(&qword_268BBE478, MEMORY[0x263F063B0]);
    uint64_t v176 = sub_23CA0EB80();
    uint64_t v405 = sub_23C9BC474(v176, v177, &v406);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v172, v173, "simpleDateTimeResolution: using components for nextMatchingOffset: %s", v174, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v175, -1, -1);
    MEMORY[0x23ECEDBE0](v174, -1, -1);
  }

  swift_beginAccess();
  uint64_t v178 = v387;
  uint64_t v179 = v400;
  ((void (*)(char *, void, uint64_t))v353)(v387, v333, v400);
  uint64_t v180 = v388;
  uint64_t v181 = v396;
  ((void (*)(char *, void, uint64_t))v370)(v388, v379, v396);
  v182 = v389;
  uint64_t v183 = v390;
  ((void (*)(char *, void, uint64_t))v336)(v389, v329, v390);
  uint64_t v184 = (uint64_t)v357;
  sub_23CA0CE00();
  ((void (*)(char *, uint64_t))v352)(v182, v183);
  v334(v180, v181);
  v335(v178, v179);
  uint64_t v141 = v401;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v381)(v184, 1, v401) != 1)
  {
    v200 = v348;
    uint64_t v151 = v331;
    v331(v348, v184, v141);
    v201 = v347;
    v375(v347, v200, v141);
    v202 = sub_23CA0E3F0();
    os_log_type_t v203 = sub_23CA0E6F0();
    if (os_log_type_enabled(v202, v203))
    {
      v204 = (uint8_t *)swift_slowAlloc();
      uint64_t v205 = swift_slowAlloc();
      uint64_t v405 = v205;
      *(_DWORD *)v204 = 136315138;
      sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
      uint64_t v206 = sub_23CA0EB80();
      uint64_t v403 = sub_23C9BC474(v206, v207, &v405);
      uint64_t v141 = v401;
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      v374(v201, v141);
      _os_log_impl(&dword_23C9B6000, v202, v203, "simpleDateTimeResolution: nextMatchingOffset: %s", v204, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v205, -1, -1);
      MEMORY[0x23ECEDBE0](v204, -1, -1);
    }
    else
    {
      v374(v201, v141);
    }

    uint64_t v165 = v382;
    uint64_t v156 = (uint64_t)v346;
    v375(v346, v200, v141);
    unint64_t v211 = v407;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_36;
    }
    goto LABEL_99;
  }
  sub_23C9BAA2C(v184, &qword_268BBE460);
  uint64_t v151 = v331;
  uint64_t v165 = v382;
  for (uint64_t i = (uint64_t)v358; ; uint64_t i = (uint64_t)v358)
  {
    sub_23C9BFA3C(v393, i);
    v214 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v381;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v381)(i, 1, v141) == 1)
    {
      sub_23C9BAA2C(i, &qword_268BBE460);
    }
    else
    {
      v215 = v354;
      v151(v354, i, v141);
      v216 = v387;
      uint64_t v217 = v400;
      ((void (*)(char *, void, uint64_t))v353)(v387, *MEMORY[0x263F07768], v400);
      v218 = v388;
      uint64_t v219 = v396;
      ((void (*)(char *, void, uint64_t))v370)(v388, v379, v396);
      v220 = v389;
      uint64_t v221 = v390;
      ((void (*)(char *, void, uint64_t))v336)(v389, v329, v390);
      uint64_t v222 = (uint64_t)v349;
      sub_23CA0CE00();
      ((void (*)(char *, uint64_t))v352)(v220, v221);
      v334(v218, v219);
      uint64_t v223 = v217;
      uint64_t v141 = v401;
      v335(v216, v223);
      if (v214(v222, 1, v141) != 1)
      {
        v225 = v344;
        v226 = (void (*)(char *, char *, uint64_t))v331;
        v331(v344, v222, v141);
        v227 = v343;
        v375(v343, v225, v141);
        v228 = sub_23CA0E3F0();
        os_log_type_t v229 = sub_23CA0E6F0();
        BOOL v230 = os_log_type_enabled(v228, v229);
        uint64_t v165 = v382;
        if (v230)
        {
          v231 = (uint8_t *)swift_slowAlloc();
          uint64_t v232 = swift_slowAlloc();
          uint64_t v405 = v232;
          *(_DWORD *)v231 = 136315138;
          sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
          uint64_t v233 = sub_23CA0EB80();
          uint64_t v403 = sub_23C9BC474(v233, v234, &v405);
          uint64_t v141 = v401;
          v226 = (void (*)(char *, char *, uint64_t))v331;
          sub_23CA0E7C0();
          swift_bridgeObjectRelease();
          v374(v227, v141);
          _os_log_impl(&dword_23C9B6000, v228, v229, "simpleDateTimeResolution: exact match: %s", v231, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23ECEDBE0](v232, -1, -1);
          MEMORY[0x23ECEDBE0](v231, -1, -1);
        }
        else
        {
          v374(v227, v141);
        }

        v235 = v328;
        v375(v328, v225, v141);
        unint64_t v236 = v407;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v238 = v371;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v236 = sub_23C9CDD40(0, *(void *)(v236 + 16) + 1, 1, v236);
        }
        unint64_t v240 = *(void *)(v236 + 16);
        unint64_t v239 = *(void *)(v236 + 24);
        if (v240 >= v239 >> 1) {
          unint64_t v236 = sub_23C9CDD40(v239 > 1, v240 + 1, 1, v236);
        }
        *(void *)(v236 + 16) = v240 + 1;
        v226(&v369[v236 + v240 * v338], v235, v141);
        unint64_t v407 = v236;
        v241 = v374;
        v374(v225, v141);
        v241(v354, v141);
        uint64_t v224 = v238;
        goto LABEL_52;
      }
      v374(v215, v141);
      sub_23C9BAA2C(v222, &qword_268BBE460);
      uint64_t v165 = v382;
    }
    uint64_t v224 = v371;
LABEL_52:
    (*(void (**)(char *, uint64_t))(v224 + 8))(v373, v165);
LABEL_53:
    if ((v368 & 1) == 0) {
      goto LABEL_80;
    }
    v242 = sub_23CA0E3F0();
    os_log_type_t v243 = sub_23CA0E6F0();
    if (os_log_type_enabled(v242, v243))
    {
      v244 = (uint8_t *)swift_slowAlloc();
      uint64_t v245 = swift_slowAlloc();
      uint64_t v405 = v245;
      *(_DWORD *)v244 = 136315138;
      swift_beginAccess();
      sub_23C9D4374(&qword_268BBE478, MEMORY[0x263F063B0]);
      uint64_t v246 = sub_23CA0EB80();
      uint64_t v403 = sub_23C9BC474(v246, v247, &v405);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v242, v243, "simpleDateTimeResolution: using components for previousMatching: %s", v244, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v245, -1, -1);
      MEMORY[0x23ECEDBE0](v244, -1, -1);
    }

    swift_beginAccess();
    v248 = v387;
    uint64_t v151 = (void (*)(char *, uint64_t, uint64_t))v400;
    ((void (*)(char *, void, uint64_t))v353)(v387, v333, v400);
    v249 = v389;
    LODWORD(v373) = *MEMORY[0x263F077F0];
    uint64_t v250 = v390;
    v336(v389);
    v251 = v388;
    uint64_t v156 = v396;
    ((void (*)(char *, void, uint64_t))v370)(v388, v379, v396);
    unint64_t v211 = (unint64_t)v362;
    sub_23CA0CE00();
    v334(v251, v156);
    ((void (*)(char *, uint64_t))v352)(v249, v250);
    v335(v248, (uint64_t)v151);
    uint64_t v141 = v401;
    if (((unsigned int (*)(unint64_t, uint64_t, uint64_t))v381)(v211, 1, v401) == 1)
    {
      sub_23C9BAA2C(v211, &qword_268BBE460);
      uint64_t v165 = v382;
    }
    else
    {
      uint64_t v151 = v355;
      v331((char *)v355, v211, v141);
      v252 = v350;
      v375(v350, (char *)v151, v141);
      v253 = sub_23CA0E3F0();
      os_log_type_t v254 = sub_23CA0E6F0();
      if (os_log_type_enabled(v253, v254))
      {
        v255 = (uint8_t *)swift_slowAlloc();
        uint64_t v256 = swift_slowAlloc();
        uint64_t v405 = v256;
        *(_DWORD *)v255 = 136315138;
        sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
        uint64_t v257 = sub_23CA0EB80();
        uint64_t v403 = sub_23C9BC474(v257, v258, &v405);
        uint64_t v141 = v401;
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();
        v374(v252, v141);
        _os_log_impl(&dword_23C9B6000, v253, v254, "simpleDateTimeResolution: previousMatching: %s", v255, 0xCu);
        swift_arrayDestroy();
        uint64_t v259 = v256;
        uint64_t v151 = v355;
        MEMORY[0x23ECEDBE0](v259, -1, -1);
        MEMORY[0x23ECEDBE0](v255, -1, -1);
      }
      else
      {
        v374(v252, v141);
      }

      uint64_t v156 = (uint64_t)v351;
      v375(v351, (char *)v151, v141);
      unint64_t v163 = v407;
      char v260 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v165 = v382;
      if ((v260 & 1) == 0) {
LABEL_97:
      }
        unint64_t v163 = sub_23C9CDD40(0, *(void *)(v163 + 16) + 1, 1, v163);
      unint64_t v211 = *(void *)(v163 + 16);
      unint64_t v261 = *(void *)(v163 + 24);
      if (v211 >= v261 >> 1) {
        unint64_t v163 = sub_23C9CDD40(v261 > 1, v211 + 1, 1, v163);
      }
      *(void *)(v163 + 16) = v211 + 1;
      v331(&v369[v163 + v211 * v338], v156, v141);
      unint64_t v407 = v163;
      v374((char *)v151, v141);
    }
    if (v385) {
      goto LABEL_80;
    }
    v200 = v356;
    v364(v356, v386, v165);
    if (!__OFADD__(v332, 12)) {
      break;
    }
    __break(1u);
LABEL_99:
    unint64_t v211 = sub_23C9CDD40(0, *(void *)(v211 + 16) + 1, 1, v211);
LABEL_36:
    unint64_t v213 = *(void *)(v211 + 16);
    unint64_t v212 = *(void *)(v211 + 24);
    if (v213 >= v212 >> 1) {
      unint64_t v211 = sub_23C9CDD40(v212 > 1, v213 + 1, 1, v211);
    }
    *(void *)(v211 + 16) = v213 + 1;
    v151(&v369[v211 + v213 * v338], v156, v141);
    unint64_t v407 = v211;
    v374(v200, v141);
  }
  sub_23CA0CB30();
  v262 = sub_23CA0E3F0();
  os_log_type_t v263 = sub_23CA0E6F0();
  if (os_log_type_enabled(v262, v263))
  {
    v264 = (uint8_t *)swift_slowAlloc();
    uint64_t v265 = swift_slowAlloc();
    uint64_t v405 = v265;
    *(_DWORD *)v264 = 136315138;
    swift_beginAccess();
    sub_23C9D4374(&qword_268BBE478, MEMORY[0x263F063B0]);
    uint64_t v266 = sub_23CA0EB80();
    uint64_t v403 = sub_23C9BC474(v266, v267, &v405);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v262, v263, "simpleDateTimeResolution: using components for otherPrevious: %s", v264, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v265, -1, -1);
    MEMORY[0x23ECEDBE0](v264, -1, -1);
  }

  uint64_t v268 = v373;
  swift_beginAccess();
  v269 = v387;
  uint64_t v270 = v400;
  ((void (*)(char *, void, uint64_t))v353)(v387, v333, v400);
  v271 = v389;
  uint64_t v272 = v268;
  uint64_t v273 = v390;
  ((void (*)(char *, uint64_t, uint64_t))v336)(v389, v272, v390);
  v274 = v388;
  uint64_t v275 = v396;
  ((void (*)(char *, void, uint64_t))v370)(v388, v379, v396);
  uint64_t v276 = (uint64_t)v345;
  sub_23CA0CE00();
  v334(v274, v275);
  ((void (*)(char *, uint64_t))v352)(v271, v273);
  v335(v269, v270);
  uint64_t v141 = v401;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v381)(v276, 1, v401) == 1)
  {
    sub_23C9BAA2C(v276, &qword_268BBE460);
    uint64_t v277 = v371;
  }
  else
  {
    v278 = v341;
    v331(v341, v276, v141);
    v279 = v340;
    v375(v340, v278, v141);
    v280 = sub_23CA0E3F0();
    os_log_type_t v281 = sub_23CA0E6F0();
    if (os_log_type_enabled(v280, v281))
    {
      v282 = (uint8_t *)swift_slowAlloc();
      uint64_t v283 = swift_slowAlloc();
      uint64_t v405 = v283;
      *(_DWORD *)v282 = 136315138;
      sub_23C9D4374(&qword_268BBE480, MEMORY[0x263F07490]);
      uint64_t v284 = sub_23CA0EB80();
      uint64_t v403 = sub_23C9BC474(v284, v285, &v405);
      uint64_t v141 = v401;
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      v374(v279, v141);
      _os_log_impl(&dword_23C9B6000, v280, v281, "simpleDateTimeResolution: otherPreviousOffset: %s", v282, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v283, -1, -1);
      MEMORY[0x23ECEDBE0](v282, -1, -1);
    }
    else
    {
      v374(v279, v141);
    }

    v286 = v342;
    v375(v342, v278, v141);
    unint64_t v287 = v407;
    char v288 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v277 = v371;
    if ((v288 & 1) == 0) {
      unint64_t v287 = sub_23C9CDD40(0, *(void *)(v287 + 16) + 1, 1, v287);
    }
    unint64_t v290 = *(void *)(v287 + 16);
    unint64_t v289 = *(void *)(v287 + 24);
    if (v290 >= v289 >> 1) {
      unint64_t v287 = sub_23C9CDD40(v289 > 1, v290 + 1, 1, v287);
    }
    *(void *)(v287 + 16) = v290 + 1;
    v331(&v369[v287 + v290 * v338], (uint64_t)v286, v141);
    unint64_t v407 = v287;
    v374(v278, v141);
  }
  (*(void (**)(char *, uint64_t))(v277 + 8))(v356, v382);
LABEL_80:
  swift_bridgeObjectRetain_n();
  v291 = sub_23CA0E3F0();
  os_log_type_t v292 = sub_23CA0E6F0();
  if (os_log_type_enabled(v291, v292))
  {
    v293 = (uint8_t *)swift_slowAlloc();
    uint64_t v294 = swift_slowAlloc();
    uint64_t v405 = v294;
    *(_DWORD *)v293 = 136315138;
    uint64_t v295 = swift_bridgeObjectRetain();
    uint64_t v296 = MEMORY[0x23ECECE40](v295, v141);
    unint64_t v298 = v297;
    swift_bridgeObjectRelease();
    uint64_t v403 = sub_23C9BC474(v296, v298, &v405);
    v299 = v398;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v291, v292, "simpleDateTimeResolution: Found matches for inferred time: %s", v293, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v294, -1, -1);
    MEMORY[0x23ECEDBE0](v293, -1, -1);

    uint64_t v300 = v372;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v300 = v372;
    v299 = v398;
  }
  uint64_t v301 = swift_beginAccess();
  uint64_t v302 = v407;
  MEMORY[0x270FA5388](v301);
  *(&v328 - 2) = v299;
  uint64_t v403 = v302;
  swift_bridgeObjectRetain_n();
  sub_23C9D28A0((uint64_t (*)(char *, unint64_t))sub_23C9D430C, (uint64_t)(&v328 - 4));
  uint64_t v303 = v394;
  swift_bridgeObjectRelease();
  uint64_t v304 = v403;
  swift_bridgeObjectRelease();
  uint64_t v305 = v401;
  if (*(void *)(v304 + 16))
  {
    v375((char *)v300, &v369[v304], v401);
    v306 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v303 + 56);
    v306(v300, 0, 1, v305);
  }
  else
  {
    v306 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v303 + 56);
    v306(v300, 1, 1, v401);
  }
  uint64_t v307 = (uint64_t)v366;
  swift_release();
  sub_23C9BFA3C(v300, v307);
  v308 = sub_23CA0E3F0();
  os_log_type_t v309 = sub_23CA0E6F0();
  if (os_log_type_enabled(v308, v309))
  {
    v310 = (uint8_t *)swift_slowAlloc();
    uint64_t v311 = swift_slowAlloc();
    uint64_t v403 = v311;
    *(_DWORD *)v310 = 136315138;
    sub_23C9BFA3C(v307, v359);
    uint64_t v312 = sub_23CA0E4F0();
    uint64_t v404 = sub_23C9BC474(v312, v313, &v403);
    sub_23CA0E7C0();
    uint64_t v305 = v401;
    swift_bridgeObjectRelease();
    sub_23C9BAA2C(v307, &qword_268BBE460);
    _os_log_impl(&dword_23C9B6000, v308, v309, "simpleDateTimeResolution: Selecting date for inference: %s", v310, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v311, -1, -1);
    MEMORY[0x23ECEDBE0](v310, -1, -1);
  }
  else
  {
    sub_23C9BAA2C(v307, &qword_268BBE460);
  }

  uint64_t v209 = v371;
  v314 = v391;
  uint64_t v315 = v367;
  sub_23C9BFA3C(v300, v367);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v381)(v315, 1, v305) != 1)
  {
    sub_23C9BAA2C(v300, &qword_268BBE460);
    v374(v384, v305);
    sub_23C9BAA2C(v393, &qword_268BBE460);
    (*(void (**)(char *, uint64_t))(v378 + 8))(v314, v377);
    v325 = v361;
    v326 = (void (*)(uint64_t, char *, uint64_t))v331;
    v331(v361, v315, v305);
    uint64_t v327 = v339;
    v326(v339, v325, v305);
    v306(v327, 0, 1, v305);
    return (*(uint64_t (**)(char *, uint64_t))(v209 + 8))(v386, v382);
  }
  sub_23C9BAA2C(v315, &qword_268BBE460);
  v316 = sub_23CA0E3F0();
  os_log_type_t v317 = sub_23CA0E6F0();
  if (os_log_type_enabled(v316, v317))
  {
    v318 = (uint8_t *)swift_slowAlloc();
    uint64_t v319 = swift_slowAlloc();
    uint64_t v404 = v319;
    *(_DWORD *)v318 = 136315138;
    v320 = v386;
    swift_beginAccess();
    sub_23C9D4374(&qword_268BBE478, MEMORY[0x263F063B0]);
    v321 = v320;
    uint64_t v322 = v382;
    uint64_t v323 = sub_23CA0EB80();
    uint64_t v402 = sub_23C9BC474(v323, v324, &v404);
    uint64_t v305 = v401;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v316, v317, "simpleDateTimeResolution: No matches found for %s", v318, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v319, -1, -1);
    MEMORY[0x23ECEDBE0](v318, -1, -1);

    sub_23C9BAA2C(v372, &qword_268BBE460);
    v374(v384, v305);
    sub_23C9BAA2C(v393, &qword_268BBE460);
    (*(void (**)(char *, uint64_t))(v378 + 8))(v391, v377);
  }
  else
  {

    sub_23C9BAA2C(v300, &qword_268BBE460);
    v374(v384, v305);
    sub_23C9BAA2C(v393, &qword_268BBE460);
    (*(void (**)(char *, uint64_t))(v378 + 8))(v314, v377);
    v321 = v386;
    uint64_t v322 = v382;
  }
  v306(v339, 1, 1, v305);
  return (*(uint64_t (**)(char *, uint64_t))(v371 + 8))(v321, v322);
}

uint64_t sub_23C9D28A0(uint64_t (*a1)(char *, unint64_t), uint64_t a2)
{
  sub_23CA0CCB0();
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = (void *)sub_23C9D42F8(v5);
  }
  uint64_t result = sub_23C9D2960(a1, a2);
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_23C9D2960(uint64_t (*a1)(char *, unint64_t), uint64_t a2)
{
  uint64_t v168 = a2;
  os_log_type_t v167 = (uint64_t (*)(char *, char *))a1;
  uint64_t v4 = sub_23CA0CCB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v154 = (char *)&v139 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v161 = (char *)&v139 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v139 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v139 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  os_log_type_t v147 = (char *)&v139 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v139 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v139 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v139 - v24;
  v166 = v2;
  uint64_t v26 = v2[1];
  uint64_t result = sub_23CA0EB70();
  if (result >= v26)
  {
    if (v26 < 0) {
      goto LABEL_144;
    }
    if (v26) {
      return sub_23C9D36A8(0, v26, 1, v167, v168);
    }
    return result;
  }
  if (v26 >= 0) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v26 + 1;
  }
  if (v26 <= -2) {
    goto LABEL_153;
  }
  uint64_t v164 = v5;
  uint64_t v165 = v4;
  uint64_t v144 = v23;
  uint64_t v143 = v25;
  uint64_t v142 = result;
  if (v26 < 2)
  {
    uint64_t v31 = v5;
    uint64_t v33 = MEMORY[0x263F8EE78];
    unint64_t v162 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    if (v26 != 1)
    {
      unint64_t v83 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v35 = (char *)MEMORY[0x263F8EE78];
      uint64_t v36 = v3;
LABEL_110:
      uint64_t v145 = v33;
      if (v83 >= 2)
      {
        uint64_t v132 = *v166;
        do
        {
          unint64_t v133 = v83 - 2;
          if (v83 < 2) {
            goto LABEL_139;
          }
          if (!v132) {
            goto LABEL_152;
          }
          uint64_t v134 = *(void *)&v35[16 * v133 + 32];
          uint64_t v135 = *(void *)&v35[16 * v83 + 24];
          sub_23C9D39E4(v132 + *(void *)(v164 + 72) * v134, v132 + *(void *)(v164 + 72) * *(void *)&v35[16 * v83 + 16], v132 + *(void *)(v164 + 72) * v135, v162, (uint64_t (*)(char *, unint64_t))v167, v168);
          if (v36) {
            break;
          }
          if (v135 < v134) {
            goto LABEL_140;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v35 = sub_23C9D42E4((uint64_t)v35);
          }
          if (v133 >= *((void *)v35 + 2)) {
            goto LABEL_141;
          }
          uint64_t v136 = &v35[16 * v133 + 32];
          *(void *)uint64_t v136 = v134;
          *((void *)v136 + 1) = v135;
          unint64_t v137 = *((void *)v35 + 2);
          if (v83 > v137) {
            goto LABEL_142;
          }
          memmove(&v35[16 * v83 + 16], &v35[16 * v83 + 32], 16 * (v137 - v83));
          *((void *)v35 + 2) = v137 - 1;
          unint64_t v83 = v137 - 1;
        }
        while (v137 > 2);
      }
LABEL_123:
      swift_bridgeObjectRelease();
      *(void *)(v145 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    BOOL v148 = v20;
    uint64_t v152 = v15;
    uint64_t v153 = v12;
    uint64_t v145 = MEMORY[0x263F8EE78];
  }
  else
  {
    BOOL v148 = v20;
    uint64_t v152 = v15;
    uint64_t v153 = v12;
    uint64_t v29 = v28 >> 1;
    uint64_t v30 = sub_23CA0E5F0();
    uint64_t v31 = v5;
    *(void *)(v30 + 16) = v29;
    unint64_t v32 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v145 = v30;
    unint64_t v162 = v30 + v32;
  }
  uint64_t v34 = 0;
  uint64_t v158 = v31 + 16;
  uint64_t v159 = (void (**)(unint64_t, uint64_t))(v31 + 8);
  unint64_t v163 = (void (**)(char *, char *, uint64_t))(v31 + 32);
  uint64_t v35 = (char *)MEMORY[0x263F8EE78];
  uint64_t v36 = v3;
  while (1)
  {
    uint64_t v37 = (uint64_t)v34;
    uint64_t v38 = (uint64_t)(v34 + 1);
    if ((uint64_t)(v34 + 1) >= v26) {
      goto LABEL_57;
    }
    uint64_t v156 = v26;
    uint64_t v39 = *v166;
    uint64_t v40 = *(void *)(v31 + 72);
    uint64_t v151 = (uint64_t)(v34 + 1);
    uint64_t v41 = v39 + v40 * v38;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    uint64_t v43 = v143;
    uint64_t v44 = (uint64_t)v34;
    uint64_t v45 = v165;
    v42(v143, v41, v165);
    uint64_t v160 = v40;
    uint64_t v46 = v39 + v40 * v44;
    unint64_t v47 = (unint64_t)v144;
    BOOL v157 = (char *)v42;
    v42(v144, v46, v45);
    LODWORD(v155) = v167(v43, (char *)v47);
    if (v36)
    {
      uint64_t v138 = *v159;
      (*v159)(v47, v45);
      v138((unint64_t)v43, v45);
      goto LABEL_123;
    }
    v146 = v35;
    uint64_t v48 = *v159;
    (*v159)(v47, v45);
    v48((unint64_t)v43, v45);
    uint64_t v49 = v44 + 2;
    uint64_t v50 = v156;
    uint64_t v149 = v39;
    uint64_t v37 = v44;
    if (v44 + 2 >= v156)
    {
      uint64_t v38 = v44 + 2;
    }
    else
    {
      uint64_t v141 = (char *)v44;
      uint64_t v51 = v39;
      uint64_t v150 = v160 * v49;
      v151 *= v160;
      unint64_t v52 = (unint64_t)v147;
      while (1)
      {
        uint64_t v53 = v148;
        uint64_t v54 = v165;
        uint64_t v55 = v157;
        ((void (*)(char *, uint64_t, uint64_t))v157)(v148, v51 + v150, v165);
        ((void (*)(unint64_t, uint64_t, uint64_t))v55)(v52, v51 + v151, v54);
        int v56 = v167(v53, (char *)v52);
        v48(v52, v54);
        v48((unint64_t)v53, v54);
        if ((v155 ^ v56)) {
          break;
        }
        ++v49;
        v51 += v160;
        if (v156 == v49)
        {
          uint64_t v50 = v156;
          uint64_t v38 = v156;
          uint64_t v37 = (uint64_t)v141;
          goto LABEL_24;
        }
      }
      uint64_t v38 = v49;
      uint64_t v37 = (uint64_t)v141;
      uint64_t v50 = v156;
    }
LABEL_24:
    uint64_t v35 = v146;
    uint64_t v57 = v164;
    if ((v155 & 1) == 0)
    {
      uint64_t v58 = v165;
      goto LABEL_38;
    }
    if (v38 < v37) {
      goto LABEL_148;
    }
    uint64_t v58 = v165;
    if (v37 < v38) {
      break;
    }
LABEL_38:
    if (v38 < v50) {
      goto LABEL_39;
    }
LABEL_57:
    if (v38 < v37) {
      goto LABEL_143;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v35 = sub_23C9D40A8(0, *((void *)v35 + 2) + 1, 1, v35);
    }
    unint64_t v82 = *((void *)v35 + 2);
    unint64_t v81 = *((void *)v35 + 3);
    unint64_t v83 = v82 + 1;
    if (v82 >= v81 >> 1) {
      uint64_t v35 = sub_23C9D40A8((char *)(v81 > 1), v82 + 1, 1, v35);
    }
    *((void *)v35 + 2) = v83;
    uint64_t v84 = v35 + 32;
    uint64_t v85 = &v35[16 * v82 + 32];
    *(void *)uint64_t v85 = v37;
    *((void *)v85 + 1) = v38;
    BOOL v157 = (char *)v38;
    if (v82)
    {
      while (1)
      {
        unint64_t v86 = v83 - 1;
        if (v83 >= 4)
        {
          char v91 = &v84[16 * v83];
          uint64_t v92 = *((void *)v91 - 8);
          uint64_t v93 = *((void *)v91 - 7);
          BOOL v97 = __OFSUB__(v93, v92);
          uint64_t v94 = v93 - v92;
          if (v97) {
            goto LABEL_128;
          }
          uint64_t v96 = *((void *)v91 - 6);
          uint64_t v95 = *((void *)v91 - 5);
          BOOL v97 = __OFSUB__(v95, v96);
          uint64_t v89 = v95 - v96;
          char v90 = v97;
          if (v97) {
            goto LABEL_129;
          }
          unint64_t v98 = v83 - 2;
          uint64_t v99 = &v84[16 * v83 - 32];
          uint64_t v101 = *(void *)v99;
          uint64_t v100 = *((void *)v99 + 1);
          BOOL v97 = __OFSUB__(v100, v101);
          uint64_t v102 = v100 - v101;
          if (v97) {
            goto LABEL_131;
          }
          BOOL v97 = __OFADD__(v89, v102);
          uint64_t v103 = v89 + v102;
          if (v97) {
            goto LABEL_134;
          }
          if (v103 >= v94)
          {
            uint64_t v121 = &v84[16 * v86];
            uint64_t v123 = *(void *)v121;
            uint64_t v122 = *((void *)v121 + 1);
            BOOL v97 = __OFSUB__(v122, v123);
            uint64_t v124 = v122 - v123;
            if (v97) {
              goto LABEL_138;
            }
            BOOL v114 = v89 < v124;
            goto LABEL_94;
          }
        }
        else
        {
          if (v83 != 3)
          {
            uint64_t v115 = *((void *)v35 + 4);
            uint64_t v116 = *((void *)v35 + 5);
            BOOL v97 = __OFSUB__(v116, v115);
            uint64_t v108 = v116 - v115;
            char v109 = v97;
            goto LABEL_88;
          }
          uint64_t v88 = *((void *)v35 + 4);
          uint64_t v87 = *((void *)v35 + 5);
          BOOL v97 = __OFSUB__(v87, v88);
          uint64_t v89 = v87 - v88;
          char v90 = v97;
        }
        if (v90) {
          goto LABEL_130;
        }
        unint64_t v98 = v83 - 2;
        uint64_t v104 = &v84[16 * v83 - 32];
        uint64_t v106 = *(void *)v104;
        uint64_t v105 = *((void *)v104 + 1);
        BOOL v107 = __OFSUB__(v105, v106);
        uint64_t v108 = v105 - v106;
        char v109 = v107;
        if (v107) {
          goto LABEL_133;
        }
        uint64_t v110 = &v84[16 * v86];
        uint64_t v112 = *(void *)v110;
        uint64_t v111 = *((void *)v110 + 1);
        BOOL v97 = __OFSUB__(v111, v112);
        uint64_t v113 = v111 - v112;
        if (v97) {
          goto LABEL_136;
        }
        if (__OFADD__(v108, v113)) {
          goto LABEL_137;
        }
        if (v108 + v113 >= v89)
        {
          BOOL v114 = v89 < v113;
LABEL_94:
          if (v114) {
            unint64_t v86 = v98;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v109) {
          goto LABEL_132;
        }
        long long v117 = &v84[16 * v86];
        uint64_t v119 = *(void *)v117;
        uint64_t v118 = *((void *)v117 + 1);
        BOOL v97 = __OFSUB__(v118, v119);
        uint64_t v120 = v118 - v119;
        if (v97) {
          goto LABEL_135;
        }
        if (v120 < v108) {
          goto LABEL_105;
        }
LABEL_96:
        unint64_t v125 = v86 - 1;
        if (v86 - 1 >= v83)
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
          goto LABEL_147;
        }
        if (!*v166) {
          goto LABEL_149;
        }
        unint64_t v126 = v35;
        uint64_t v127 = &v84[16 * v125];
        uint64_t v128 = *(void *)v127;
        uint64_t v129 = &v84[16 * v86];
        uint64_t v130 = *((void *)v129 + 1);
        sub_23C9D39E4(*v166 + *(void *)(v164 + 72) * *(void *)v127, *v166 + *(void *)(v164 + 72) * *(void *)v129, *v166 + *(void *)(v164 + 72) * v130, v162, (uint64_t (*)(char *, unint64_t))v167, v168);
        if (v36) {
          goto LABEL_123;
        }
        if (v130 < v128) {
          goto LABEL_125;
        }
        if (v86 > *((void *)v126 + 2)) {
          goto LABEL_126;
        }
        *(void *)uint64_t v127 = v128;
        *(void *)&v84[16 * v125 + 8] = v130;
        unint64_t v131 = *((void *)v126 + 2);
        if (v86 >= v131) {
          goto LABEL_127;
        }
        uint64_t v35 = v126;
        unint64_t v83 = v131 - 1;
        memmove(&v84[16 * v86], v129 + 16, 16 * (v131 - 1 - v86));
        *((void *)v35 + 2) = v131 - 1;
        if (v131 <= 2) {
          goto LABEL_105;
        }
      }
    }
    unint64_t v83 = 1;
LABEL_105:
    uint64_t v26 = v166[1];
    uint64_t v34 = v157;
    uint64_t v31 = v164;
    if ((uint64_t)v157 >= v26)
    {
      uint64_t v33 = v145;
      goto LABEL_110;
    }
  }
  uint64_t v59 = 0;
  uint64_t v60 = v160 * (v38 - 1);
  uint64_t v61 = v38 * v160;
  uint64_t v141 = (char *)v37;
  uint64_t v62 = v37 * v160;
  BOOL v157 = (char *)v38;
  do
  {
    if (v37 != v38 + v59 - 1)
    {
      uint64_t v63 = v149;
      if (!v149) {
        goto LABEL_151;
      }
      unint64_t v64 = v149 + v62;
      uint64_t v65 = (char *)(v149 + v60);
      os_log_type_t v155 = *v163;
      v155(v154, (char *)(v149 + v62), v165);
      if (v62 < v60 || v64 >= v63 + v61)
      {
        uint64_t v58 = v165;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        uint64_t v58 = v165;
        if (v62 != v60) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      v155(v65, v154, v58);
      uint64_t v57 = v164;
      uint64_t v38 = (uint64_t)v157;
    }
    ++v37;
    --v59;
    v60 -= v160;
    v61 -= v160;
    v62 += v160;
  }
  while (v37 < v38 + v59);
  uint64_t v35 = v146;
  uint64_t v37 = (uint64_t)v141;
  uint64_t v50 = v156;
  if (v38 >= v156) {
    goto LABEL_57;
  }
LABEL_39:
  if (__OFSUB__(v38, v37)) {
    goto LABEL_145;
  }
  if (v38 - v37 >= v142) {
    goto LABEL_57;
  }
  if (__OFADD__(v37, v142)) {
    goto LABEL_146;
  }
  if (v37 + v142 >= v50) {
    uint64_t v66 = v50;
  }
  else {
    uint64_t v66 = v37 + v142;
  }
  if (v66 >= v37)
  {
    if (v38 != v66)
    {
      v146 = v35;
      uint64_t v67 = *(void (**)(void, void, void))(v57 + 16);
      uint64_t v149 = *(void *)(v57 + 72);
      uint64_t v150 = (uint64_t)v67;
      uint64_t v160 = v149 * (v38 - 1);
      uint64_t v68 = v38 * v149;
      uint64_t v141 = (char *)v37;
      uint64_t v140 = v66;
      do
      {
        uint64_t v69 = 0;
        BOOL v157 = (char *)v38;
        uint64_t v151 = v68;
        while (1)
        {
          uint64_t v71 = *v166;
          os_log_type_t v155 = (void (*)(char *, char *, uint64_t))(v68 + v69);
          uint64_t v156 = v37;
          uint64_t v72 = v152;
          uint64_t v73 = (void (*)(char *, uint64_t, uint64_t))v150;
          ((void (*)(char *, uint64_t, uint64_t))v150)(v152, v68 + v69 + v71, v58);
          unint64_t v74 = (unint64_t)v153;
          v73(v153, v160 + v69 + v71, v58);
          char v75 = v167(v72, (char *)v74);
          uint64_t v76 = *v159;
          (*v159)(v74, v58);
          v76((unint64_t)v72, v58);
          if ((v75 & 1) == 0) {
            break;
          }
          uint64_t v77 = *v166;
          if (!*v166) {
            goto LABEL_150;
          }
          uint64_t v68 = v151;
          uint64_t v78 = (char *)(v77 + v160 + v69);
          uint64_t v79 = *v163;
          uint64_t v80 = v165;
          (*v163)(v161, (char *)(v77 + v151 + v69), v165);
          uint64_t v58 = v80;
          swift_arrayInitWithTakeFrontToBack();
          v79(v78, v161, v80);
          v69 -= v149;
          uint64_t v70 = v157;
          uint64_t v37 = v156 + 1;
          uint64_t v36 = 0;
          if (v157 == (char *)(v156 + 1)) {
            goto LABEL_54;
          }
        }
        uint64_t v58 = v165;
        uint64_t v36 = 0;
        uint64_t v70 = v157;
        uint64_t v68 = v151;
LABEL_54:
        uint64_t v38 = (uint64_t)(v70 + 1);
        v160 += v149;
        v68 += v149;
        uint64_t v37 = (uint64_t)v141;
      }
      while (v38 != v140);
      uint64_t v38 = v140;
      uint64_t v35 = v146;
    }
    goto LABEL_57;
  }
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
LABEL_152:
  __break(1u);
LABEL_153:
  uint64_t result = sub_23CA0E9A0();
  __break(1u);
  return result;
}

uint64_t sub_23C9D36A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, char *), uint64_t a5)
{
  uint64_t v6 = v5;
  unint64_t v47 = a4;
  uint64_t v48 = a5;
  uint64_t v10 = sub_23CA0CCB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v52 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v44 = (char *)&v36 - v15;
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v38 = a2;
  if (a3 != a2)
  {
    uint64_t v43 = (char *)&v36 - v17;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v18 = v11 + 16;
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v41 = (void (**)(char *, uint64_t))(v18 - 8);
    uint64_t v42 = v19;
    uint64_t v49 = (void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v54 = v20 * (a3 - 1);
    uint64_t v39 = v18;
    uint64_t v40 = v20;
    uint64_t v21 = v20 * a3;
    uint64_t v23 = (char *)&v36 - v17;
    uint64_t v22 = v44;
    uint64_t v37 = a1;
    while (2)
    {
      uint64_t v24 = 0;
      uint64_t v45 = v21;
      uint64_t v46 = a3;
      while (1)
      {
        uint64_t v26 = *v53;
        uint64_t v50 = v21 + v24;
        uint64_t v51 = a1;
        uint64_t v27 = v21 + v24 + v26;
        uint64_t v28 = v42;
        v42(v23, v27, v10);
        v28(v22, v54 + v24 + v26, v10);
        char v29 = v47(v23, v22);
        if (v6)
        {
          uint64_t v35 = *v41;
          (*v41)(v22, v10);
          return ((uint64_t (*)(char *, uint64_t))v35)(v23, v10);
        }
        char v30 = v29;
        uint64_t v31 = *v41;
        (*v41)(v22, v10);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v23, v10);
        if ((v30 & 1) == 0) {
          break;
        }
        uint64_t v32 = *v53;
        if (!*v53)
        {
          __break(1u);
          return result;
        }
        uint64_t v6 = 0;
        uint64_t v21 = v45;
        uint64_t v33 = v32 + v54 + v24;
        uint64_t v34 = *v49;
        (*v49)(v52, v32 + v45 + v24, v10);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v34)(v33, v52, v10);
        v24 -= v40;
        a1 = v51 + 1;
        uint64_t v25 = v46;
        uint64_t v22 = v44;
        if (v46 == v51 + 1) {
          goto LABEL_10;
        }
      }
      uint64_t v6 = 0;
      uint64_t v21 = v45;
      uint64_t v25 = v46;
LABEL_10:
      a3 = v25 + 1;
      v54 += v40;
      v21 += v40;
      a1 = v37;
      if (a3 != v38) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_23C9D39E4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(char *, unint64_t), uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v75 = a6;
  uint64_t v76 = a5;
  uint64_t v12 = sub_23CA0CCB0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v66 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v66 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v66 - v22;
  uint64_t v77 = *(void *)(v24 + 72);
  if (!v77)
  {
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (a2 - a1 == 0x8000000000000000 && v77 == -1) {
    goto LABEL_77;
  }
  int64_t v25 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v77 == -1) {
    goto LABEL_78;
  }
  uint64_t v26 = (uint64_t)(a2 - a1) / v77;
  unint64_t v82 = a1;
  unint64_t v81 = a4;
  uint64_t v27 = v25 / v77;
  unint64_t v78 = a3;
  if (v26 >= v25 / v77)
  {
    if ((v27 & 0x8000000000000000) == 0)
    {
      unint64_t v30 = a1;
      uint64_t v31 = v27 * v77;
      unint64_t v71 = v21;
      if (a4 < a2 || a2 + v31 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v45 = a4 + v31;
      unint64_t v80 = a4 + v31;
      unint64_t v82 = a2;
      if (v31 >= 1 && v30 < a2)
      {
        uint64_t v47 = -v77;
        uint64_t v48 = *(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 16);
        uint64_t v74 = v13 + 16;
        uint64_t v69 = v48;
        uint64_t v70 = (void (**)(unint64_t, uint64_t))(v13 + 8);
        uint64_t v66 = -v77;
        unint64_t v67 = a4;
        uint64_t v72 = v12;
        unint64_t v68 = v30;
        while (1)
        {
          uint64_t v49 = v47;
          uint64_t v50 = v69;
          v69((unint64_t)v17, v45 + v47, v12);
          uint64_t v77 = a2;
          unint64_t v51 = a2 + v49;
          unint64_t v52 = v17;
          unint64_t v53 = v71;
          v50(v71, v51, v12);
          char v54 = v76(v52, v53);
          if (v7) {
            break;
          }
          char v55 = v54;
          uint64_t v79 = 0;
          unint64_t v56 = v78;
          uint64_t v73 = (char *)(v78 + v49);
          uint64_t v57 = *v70;
          (*v70)(v53, v12);
          v57((unint64_t)v52, v12);
          uint64_t v17 = v52;
          if (v55)
          {
            uint64_t v58 = v73;
            if (v56 < v77 || (unint64_t)v73 >= v77)
            {
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v7 = v79;
              unint64_t v60 = v68;
            }
            else
            {
              BOOL v59 = v56 == v77;
              uint64_t v7 = v79;
              unint64_t v60 = v68;
              if (!v59) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v47 = v66;
            v82 += v66;
          }
          else
          {
            unint64_t v61 = v80;
            v80 += v49;
            uint64_t v58 = v73;
            BOOL v62 = v56 < v61 || (unint64_t)v73 >= v61;
            unint64_t v51 = v77;
            if (v62)
            {
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v47 = v66;
              uint64_t v7 = v79;
              unint64_t v60 = v68;
            }
            else
            {
              BOOL v59 = v56 == v61;
              uint64_t v7 = v79;
              unint64_t v60 = v68;
              if (v59)
              {
                uint64_t v47 = v49;
              }
              else
              {
                swift_arrayInitWithTakeBackToFront();
                uint64_t v47 = v66;
              }
            }
          }
          unint64_t v45 = v80;
          if (v80 > v67)
          {
            a2 = v51;
            unint64_t v78 = (unint64_t)v58;
            uint64_t v12 = v72;
            if (v51 > v60) {
              continue;
            }
          }
          goto LABEL_75;
        }
        unint64_t v64 = *v70;
        (*v70)(v53, v12);
        v64((unint64_t)v52, v12);
      }
      goto LABEL_75;
    }
  }
  else if ((v26 & 0x8000000000000000) == 0)
  {
    unint64_t v28 = a1;
    uint64_t v29 = v26 * v77;
    uint64_t v73 = v20;
    if (a4 < v28 || v28 + v29 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v28)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v71 = a4 + v29;
    unint64_t v80 = a4 + v29;
    BOOL v32 = v29 < 1 || a2 >= v78;
    if (!v32)
    {
      uint64_t v70 = *(void (***)(unint64_t, uint64_t))(v13 + 16);
      uint64_t v74 = v13 + 16;
      uint64_t v33 = (void (**)(char *, uint64_t))(v13 + 8);
      while (1)
      {
        uint64_t v34 = v70;
        ((void (*)(char *, unint64_t, uint64_t))v70)(v23, a2, v12);
        uint64_t v35 = v23;
        uint64_t v36 = v73;
        ((void (*)(char *, unint64_t, uint64_t))v34)(v73, a4, v12);
        char v37 = v76(v35, (unint64_t)v36);
        if (v7) {
          break;
        }
        char v38 = v37;
        uint64_t v79 = 0;
        uint64_t v39 = *v33;
        (*v33)(v36, v12);
        v39(v35, v12);
        unint64_t v40 = v82;
        uint64_t v23 = v35;
        if (v38)
        {
          unint64_t v41 = a2 + v77;
          if (v82 < a2 || v82 >= v41)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v82 == a2)
          {
            unint64_t v40 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v43 = v81 + v77;
          if (v82 < v81 || v82 >= v43)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v82 != v81)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v81 = v43;
          unint64_t v41 = a2;
        }
        unint64_t v82 = v40 + v77;
        a4 = v81;
        if (v81 < v71)
        {
          a2 = v41;
          BOOL v32 = v41 >= v78;
          uint64_t v7 = v79;
          if (!v32) {
            continue;
          }
        }
        goto LABEL_75;
      }
      uint64_t v63 = *v33;
      (*v33)(v36, v12);
      v63(v35, v12);
    }
LABEL_75:
    sub_23C9D41A4(&v82, &v81, (uint64_t *)&v80);
    return 1;
  }
LABEL_79:
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

char *sub_23C9D40A8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE488);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23C9D41A4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_23CA0CCB0();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_23CA0EA00();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_23C9D42E4(uint64_t a1)
{
  return sub_23C9D40A8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23C9D42F8(void *a1)
{
  return sub_23C9DCA44(0, a1[2], 0, a1);
}

BOOL sub_23C9D430C()
{
  sub_23CA0CC80();
  double v1 = fabs(v0);
  sub_23CA0CC80();
  return v1 < fabs(v2);
}

uint64_t sub_23C9D4374(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for DateTimeInferenceUtils()
{
  return &type metadata for DateTimeInferenceUtils;
}

uint64_t sub_23C9D43CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriTimeMeasurement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C9D4430(uint64_t a1)
{
  return sub_23C9D446C(a1, &qword_268BBE528, &qword_268BBE530, (uint64_t (*)(char *))sub_23CA06AC0, MEMORY[0x263F6D6D8]);
}

unint64_t sub_23C9D446C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(void))
{
  uint64_t v29 = a5;
  unint64_t v30 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v12 = sub_23CA0E9F0();
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  uint64_t v15 = *(int *)(v8 + 48);
  uint64_t v16 = v12 + 64;
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v28[1] = a1;
  uint64_t v18 = a1 + v17;
  uint64_t v19 = *(void *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_23C9D6238(v18, (uint64_t)v11, a2);
    unint64_t result = v30(v11);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v16 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v23 = v13[6];
    uint64_t v24 = v29(0);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v11, v24);
    *(void *)(v13[7] + 8 * v22) = *(void *)&v11[v15];
    uint64_t v25 = v13[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    v13[2] = v27;
    v18 += v19;
    if (!--v14)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23C9D466C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE518);
  uint64_t v2 = sub_23CA0E9F0();
  unint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23C9D6238(v6, (uint64_t)&v15, &qword_268BBE520);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_23CA06B98(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *int64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_23C9C6860(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23C9D47A4(uint64_t a1)
{
  return sub_23C9D446C(a1, &qword_268BBE508, &qword_268BBE510, (uint64_t (*)(char *))sub_23CA06C10, MEMORY[0x263F07508]);
}

uint64_t sub_23C9D47E0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE4B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE4B0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

SiriTimeInternal::ButtonOption_optional __swiftcall ButtonOption.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_23CA0EA10();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ButtonOption.rawValue.getter()
{
  if (*v0) {
    return 0x6C65636E6163;
  }
  else {
    return 7562617;
  }
}

uint64_t sub_23C9D493C(char *a1, char *a2)
{
  return sub_23C9FBE54(*a1, *a2);
}

uint64_t sub_23C9D4948()
{
  return sub_23C9F2D40();
}

uint64_t sub_23C9D4950()
{
  return sub_23C9F3474();
}

uint64_t sub_23C9D4958()
{
  return sub_23C9F383C();
}

SiriTimeInternal::ButtonOption_optional sub_23C9D4960(Swift::String *a1)
{
  return ButtonOption.init(rawValue:)(*a1);
}

uint64_t sub_23C9D496C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ButtonOption.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static DirectInvocationUtils.siriKitConfirmationResponse(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23CA0D410();
  uint64_t v4 = v3;
  char v5 = (void *)sub_23CA0D000();
  id v6 = objc_msgSend(v5, sel_identifier);

  uint64_t v7 = sub_23CA0E4D0();
  uint64_t v9 = v8;

  if (v2 == v7 && v4 == v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  char v11 = sub_23CA0ECB0();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    if (qword_268BBDE80 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_23CA0E410();
    __swift_project_value_buffer(v17, (uint64_t)qword_268BBE4B0);
    uint64_t v18 = sub_23CA0E3F0();
    os_log_type_t v19 = sub_23CA0E710();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_23C9B6000, v18, v19, "User selected SiriKit confirm action", v20, 2u);
      MEMORY[0x23ECEDBE0](v20, -1, -1);
    }

    char v21 = (unsigned int *)MEMORY[0x263F6FC98];
    goto LABEL_22;
  }
  uint64_t v12 = (void *)sub_23CA0CFF0();
  id v13 = objc_msgSend(v12, sel_identifier);

  uint64_t v14 = sub_23CA0E4D0();
  uint64_t v16 = v15;

  if (v2 == v14 && v4 == v16) {
    goto LABEL_8;
  }
  char v22 = sub_23CA0ECB0();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_16;
  }
  uint64_t v34 = (void *)sub_23CA0CFE0();
  id v35 = objc_msgSend(v34, sel_identifier);

  uint64_t v36 = sub_23CA0E4D0();
  uint64_t v38 = v37;

  if (v2 == v36 && v4 == v38)
  {
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    if (qword_268BBDE80 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_23CA0E410();
    __swift_project_value_buffer(v23, (uint64_t)qword_268BBE4B0);
    uint64_t v24 = sub_23CA0E3F0();
    os_log_type_t v25 = sub_23CA0E710();
    if (os_log_type_enabled(v24, v25))
    {
      BOOL v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v26 = 0;
      _os_log_impl(&dword_23C9B6000, v24, v25, "User selected SiriKit cancel/reject action", v26, 2u);
      MEMORY[0x23ECEDBE0](v26, -1, -1);
    }

    char v21 = (unsigned int *)MEMORY[0x263F6FC90];
LABEL_22:
    uint64_t v27 = *v21;
    uint64_t v28 = sub_23CA0D2B0();
    uint64_t v41 = *(void *)(v28 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 104))(a1, v27, v28);
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56);
    uint64_t v30 = a1;
    uint64_t v31 = 0;
    uint64_t v32 = v28;
    goto LABEL_23;
  }
  char v39 = sub_23CA0ECB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_17;
  }
  uint64_t v40 = sub_23CA0D2B0();
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
  uint64_t v32 = v40;
  uint64_t v30 = a1;
  uint64_t v31 = 1;
LABEL_23:
  return v29(v30, v31, 1, v32);
}

SiriTimeInternal::DirectInvocationUtils::Timer::URI_optional __swiftcall DirectInvocationUtils.Timer.URI.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Timer::URI_optional)sub_23C9D50C8(v1);
}

unint64_t DirectInvocationUtils.Timer.URI.rawValue.getter()
{
  unint64_t result = 0xD000000000000031;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000034;
      break;
    case 2:
      unint64_t result = 0xD000000000000042;
      break;
    case 3:
    case 4:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000036;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9D4E6C(char *a1, char *a2)
{
  return sub_23C9FB6F8(*a1, *a2);
}

uint64_t sub_23C9D4E78()
{
  return sub_23C9F2DB8();
}

uint64_t sub_23C9D4E80()
{
  return sub_23C9F309C();
}

uint64_t sub_23C9D4E88()
{
  return sub_23C9F3A14();
}

SiriTimeInternal::DirectInvocationUtils::Timer::URI_optional sub_23C9D4E90(Swift::String *a1)
{
  return DirectInvocationUtils.Timer.URI.init(rawValue:)(*a1);
}

unint64_t sub_23C9D4E9C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationUtils.Timer.URI.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriTimeInternal::DirectInvocationUtils::Timer::UserInfoKey_optional __swiftcall DirectInvocationUtils.Timer.UserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Timer::UserInfoKey_optional)sub_23C9D523C(v1);
}

uint64_t DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter()
{
  return *(void *)&aVerb_1[8 * *v0];
}

uint64_t sub_23C9D4EF4(char *a1, char *a2)
{
  return sub_23C9FB8C0(*a1, *a2);
}

uint64_t sub_23C9D4F00(uint64_t a1, uint64_t a2)
{
  return sub_23C9D53E4(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C9F318C);
}

uint64_t sub_23C9D4F18()
{
  return sub_23C9F318C();
}

uint64_t sub_23C9D4F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C9D5454(a1, a2, a3, (void (*)(unsigned char *, uint64_t))sub_23C9F318C);
}

SiriTimeInternal::DirectInvocationUtils::Timer::UserInfoKey_optional sub_23C9D4F38(Swift::String *a1)
{
  return DirectInvocationUtils.Timer.UserInfoKey.init(rawValue:)(*a1);
}

uint64_t sub_23C9D4F44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static DirectInvocationUtils.Timer.makeReformedAlarmInvocation(hour:minute:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23CA0F910;
  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = 1651664246;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = 0x657461657263;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 72) = v9;
  *(void *)(inited + 80) = 1920298856;
  uint64_t v10 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = a1;
  *(void *)(inited + 120) = v10;
  *(void *)(inited + 128) = 0x6574756E696DLL;
  *(void *)(inited + 168) = v10;
  *(void *)(inited + 136) = 0xE600000000000000;
  *(void *)(inited + 144) = a2;
  sub_23C9D466C(inited);
  if (a4)
  {
    uint64_t v15 = v9;
    *(void *)&long long v14 = a3;
    *((void *)&v14 + 1) = a4;
    sub_23C9C6860(&v14, v13);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23C9D58F4(v13, 0x6C6562616CLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  return sub_23CA0D400();
}

SiriTimeInternal::DirectInvocationUtils::Alarm::URI_optional __swiftcall DirectInvocationUtils.Alarm.URI.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Alarm::URI_optional)sub_23C9D50C8(v1);
}

uint64_t sub_23C9D50C8@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 6;
  if (v2 < 6) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

unint64_t DirectInvocationUtils.Alarm.URI.rawValue.getter()
{
  unint64_t result = 0xD000000000000031;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000034;
      break;
    case 2:
    case 3:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 4:
      unint64_t result = 0xD000000000000036;
      break;
    case 5:
      unint64_t result = 0xD000000000000042;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9D51D8(char *a1, char *a2)
{
  return sub_23C9FB948(*a1, *a2);
}

uint64_t sub_23C9D51E4()
{
  return sub_23C9F2EC4();
}

uint64_t sub_23C9D51EC()
{
  return sub_23C9F31E0();
}

uint64_t sub_23C9D51F4()
{
  return sub_23C9F390C();
}

SiriTimeInternal::DirectInvocationUtils::Alarm::URI_optional sub_23C9D51FC(Swift::String *a1)
{
  return DirectInvocationUtils.Alarm.URI.init(rawValue:)(*a1);
}

unint64_t sub_23C9D5208@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationUtils.Alarm.URI.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriTimeInternal::DirectInvocationUtils::Alarm::UserInfoKey_optional __swiftcall DirectInvocationUtils.Alarm.UserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Alarm::UserInfoKey_optional)sub_23C9D523C(v1);
}

uint64_t sub_23C9D523C@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 9;
  if (v2 < 9) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

unint64_t DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x72506E6F74747562;
      break;
    case 2:
      unint64_t result = 0x64496D72616C61;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6953656C646E6168;
      break;
    case 5:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 6:
      unint64_t result = 0x706D6F4365746164;
      break;
    case 7:
      unint64_t result = 1920298856;
      break;
    case 8:
      unint64_t result = 0x6574756E696DLL;
      break;
    default:
      unint64_t result = 1651664246;
      break;
  }
  return result;
}

uint64_t sub_23C9D53C0(unsigned __int8 *a1, char *a2)
{
  return sub_23C9FBB10(*a1, *a2);
}

uint64_t sub_23C9D53CC(uint64_t a1, uint64_t a2)
{
  return sub_23C9D53E4(a1, a2, (void (*)(unsigned char *, uint64_t))sub_23C9F32D0);
}

uint64_t sub_23C9D53E4(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  uint64_t v5 = *v3;
  sub_23CA0ED00();
  a3(v7, v5);
  return sub_23CA0ED20();
}

uint64_t sub_23C9D5434()
{
  return sub_23C9F32D0();
}

uint64_t sub_23C9D543C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C9D5454(a1, a2, a3, (void (*)(unsigned char *, uint64_t))sub_23C9F32D0);
}

uint64_t sub_23C9D5454(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t))
{
  uint64_t v6 = *v4;
  sub_23CA0ED00();
  a4(v8, v6);
  return sub_23CA0ED20();
}

SiriTimeInternal::DirectInvocationUtils::Alarm::UserInfoKey_optional sub_23C9D54A0(Swift::String *a1)
{
  return DirectInvocationUtils.Alarm.UserInfoKey.init(rawValue:)(*a1);
}

unint64_t sub_23C9D54AC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static DirectInvocationUtils.Alarm.reformToTimer(duration:label:)(unint64_t a1, unint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23CA0F920;
  *(void *)(inited + 32) = 1651664246;
  *(void *)(inited + 40) = 0xE400000000000000;
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0x657461657263;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x6E6F697461727564;
  *(void *)(inited + 88) = 0xE800000000000000;
  uint64_t v6 = sub_23CA0E670();
  *(void *)(inited + 120) = sub_23C9C07EC();
  *(void *)(inited + 96) = v6;
  sub_23C9D466C(inited);
  if (a2)
  {
    uint64_t v7 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
    }
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_23C9D5A48(1, a1, a2, v8);
      swift_bridgeObjectRelease();
      uint64_t v9 = sub_23CA0E7B0();
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23C9D5AE4(1uLL, a1, a2, v12);
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      *(void *)&v17[0] = v9;
      *((void *)&v17[0] + 1) = v11;
      uint64_t v19 = v14;
      sub_23C9D5B94();
      swift_bridgeObjectRetain();
      sub_23CA0E540();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = v5;
      *(void *)&long long v18 = v9;
      *((void *)&v18 + 1) = v11;
      sub_23C9C6860(&v18, v17);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_23C9D58F4(v17, 0x6C6562616CLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
  }
  return sub_23CA0D400();
}

unint64_t static DirectInvocationUtils.Alarm.handleVerbActionPayload(verbStr:alarmId:handleSilently:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23CA0F910;
  *(void *)(inited + 32) = 1651664246;
  *(void *)(inited + 40) = 0xE400000000000000;
  uint64_t v11 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = 0x64496D72616C61;
  *(void *)(inited + 88) = 0xE700000000000000;
  *(void *)(inited + 96) = a3;
  *(void *)(inited + 104) = a4;
  *(void *)(inited + 120) = v11;
  strcpy((char *)(inited + 128), "handleSilently");
  *(unsigned char *)(inited + 143) = -18;
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23C9D466C(inited);
}

unint64_t static DirectInvocationUtils.Alarm.buttonPressPayload(verbStr:isConfirm:)(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    uint64_t v5 = 7562617;
  }
  else {
    uint64_t v5 = 0x6C65636E6163;
  }
  if (a3) {
    unint64_t v6 = 0xE300000000000000;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23CA0F920;
  *(void *)(inited + 32) = 1651664246;
  *(void *)(inited + 40) = 0xE400000000000000;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 72) = v8;
  strcpy((char *)(inited + 80), "buttonPressed");
  *(void *)(inited + 120) = v8;
  *(_WORD *)(inited + 94) = -4864;
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 104) = v6;
  swift_bridgeObjectRetain();
  return sub_23C9D466C(inited);
}

_OWORD *sub_23C9D58F4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_23CA06B98(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23CA07050();
      goto LABEL_7;
    }
    sub_23CA06CE4(v15, a4 & 1);
    unint64_t v21 = sub_23CA06B98(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      long long v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    unint64_t result = (_OWORD *)sub_23CA0ECF0();
    __break(1u);
    return result;
  }
LABEL_7:
  long long v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return sub_23C9C6860(a1, v19);
  }
LABEL_13:
  sub_23CA06FE4(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_23C9D5A48(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_23CA0E530();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_23C9D5AE4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
  }
  unint64_t v4 = a3;
  unint64_t v5 = a2;
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v7 = 11;
  }
  unint64_t v8 = v7 | (v6 << 16);
  a1 = sub_23CA0E530();
  if (a2) {
    a1 = v8;
  }
  if (4 * v6 < a1 >> 14) {
    goto LABEL_14;
  }
  a2 = v8;
  a3 = v5;
  a4 = v4;
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

unint64_t sub_23C9D5B94()
{
  unint64_t result = qword_268BBE4D8;
  if (!qword_268BBE4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE4D8);
  }
  return result;
}

unint64_t sub_23C9D5BEC()
{
  unint64_t result = qword_268BBE4E0;
  if (!qword_268BBE4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE4E0);
  }
  return result;
}

unint64_t sub_23C9D5C44()
{
  unint64_t result = qword_268BBE4E8;
  if (!qword_268BBE4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE4E8);
  }
  return result;
}

unint64_t sub_23C9D5C9C()
{
  unint64_t result = qword_268BBE4F0;
  if (!qword_268BBE4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE4F0);
  }
  return result;
}

unint64_t sub_23C9D5CF4()
{
  unint64_t result = qword_268BBE4F8;
  if (!qword_268BBE4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE4F8);
  }
  return result;
}

unint64_t sub_23C9D5D4C()
{
  unint64_t result = qword_268BBE500;
  if (!qword_268BBE500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE500);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ButtonOption(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ButtonOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9D5EFCLL);
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

unsigned char *sub_23C9D5F24(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ButtonOption()
{
  return &type metadata for ButtonOption;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils()
{
  return &type metadata for DirectInvocationUtils;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer()
{
  return &type metadata for DirectInvocationUtils.Timer;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer.URI()
{
  return &type metadata for DirectInvocationUtils.Timer.URI;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer.UserInfoKey()
{
  return &type metadata for DirectInvocationUtils.Timer.UserInfoKey;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm()
{
  return &type metadata for DirectInvocationUtils.Alarm;
}

uint64_t getEnumTagSinglePayload for ClockTimeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s16SiriTimeInternal21DirectInvocationUtilsO5TimerO3URIOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9D60FCLL);
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

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm.URI()
{
  return &type metadata for DirectInvocationUtils.Alarm.URI;
}

unsigned char *_s16SiriTimeInternal21DirectInvocationUtilsO5TimerO11UserInfoKeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x23C9D6200);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey()
{
  return &type metadata for DirectInvocationUtils.Alarm.UserInfoKey;
}

uint64_t sub_23C9D6238(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_23C9D62A4()
{
  unk_268BBE546 = -4864;
}

uint64_t static SiriClockSnippetModels.bundleName.getter()
{
  if (qword_268BBDE88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268BBE538;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_23C9D633C()
{
  return 1;
}

uint64_t sub_23C9D6350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C9DB6A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C9D637C()
{
  return 0;
}

void sub_23C9D6388(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C9D6394(uint64_t a1)
{
  unint64_t v2 = sub_23C9D68DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9D63D0(uint64_t a1)
{
  unint64_t v2 = sub_23C9D68DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23C9D640C()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9D6450()
{
  return sub_23CA0ED10();
}

uint64_t sub_23C9D6478()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9D64BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C9DB740(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C9D64E8(uint64_t a1)
{
  unint64_t v2 = sub_23C9D6930();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9D6524(uint64_t a1)
{
  unint64_t v2 = sub_23C9D6930();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriClockSnippetModels.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE548);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v19 = v2;
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ClockTimeSnippetModel(0);
  MEMORY[0x270FA5388](v18);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriClockSnippetModels(0);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE550);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  BOOL v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C9D68DC();
  sub_23CA0ED40();
  sub_23C9D8B98(v17, (uint64_t)v10, type metadata accessor for SiriClockSnippetModels);
  sub_23C9D6E0C((uint64_t)v10, (uint64_t)v7, type metadata accessor for ClockTimeSnippetModel);
  sub_23C9D6930();
  sub_23CA0EAF0();
  sub_23C9D6DC4(&qword_268BBE568, (void (*)(uint64_t))type metadata accessor for ClockTimeSnippetModel);
  uint64_t v15 = v19;
  sub_23CA0EB50();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v15);
  sub_23C9D6984((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t type metadata accessor for ClockTimeSnippetModel(uint64_t a1)
{
  return sub_23C9D68A4(a1, (uint64_t *)&unk_268BBE628);
}

uint64_t type metadata accessor for SiriClockSnippetModels(uint64_t a1)
{
  return sub_23C9D68A4(a1, (uint64_t *)&unk_268BBE618);
}

uint64_t sub_23C9D68A4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_23C9D68DC()
{
  unint64_t result = qword_268BBE558;
  if (!qword_268BBE558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE558);
  }
  return result;
}

unint64_t sub_23C9D6930()
{
  unint64_t result = qword_268BBE560;
  if (!qword_268BBE560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE560);
  }
  return result;
}

uint64_t sub_23C9D6984(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClockTimeSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SiriClockSnippetModels.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for SiriClockSnippetModels(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE570);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE578);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  char v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C9D68DC();
  uint64_t v28 = v10;
  uint64_t v11 = v27;
  sub_23CA0ED30();
  if (!v11)
  {
    uint64_t v27 = a1;
    uint64_t v12 = v25;
    uint64_t v13 = v26;
    uint64_t v14 = sub_23CA0EAC0();
    uint64_t v15 = *(void *)(v14 + 16);
    uint64_t v22 = v14;
    if (v15 == 1)
    {
      sub_23C9D6930();
      sub_23CA0EA30();
      uint64_t v16 = v24;
      type metadata accessor for ClockTimeSnippetModel(0);
      sub_23C9D6DC4(&qword_268BBE588, (void (*)(uint64_t))type metadata accessor for ClockTimeSnippetModel);
      sub_23CA0EAB0();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v6);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v13);
      a1 = v27;
      sub_23C9D6E0C((uint64_t)v5, v23, type metadata accessor for SiriClockSnippetModels);
    }
    else
    {
      uint64_t v17 = sub_23CA0E940();
      swift_allocError();
      uint64_t v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE580);
      *uint64_t v19 = v3;
      sub_23CA0EA40();
      sub_23CA0E930();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
      swift_willThrow();
      uint64_t v20 = v24;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v13);
      a1 = v27;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_23C9D6DC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9D6E0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C9D6E74()
{
  if (qword_268BBDE88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268BBE538;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_23C9D6EE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriClockSnippetModels.init(from:)(a1, a2);
}

uint64_t sub_23C9D6EF8(void *a1)
{
  return SiriClockSnippetModels.encode(to:)(a1);
}

uint64_t ClockTimeSnippetModel.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClockTimeSnippetModel.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ClockTimeSnippetModel.id.modify())()
{
  return nullsub_1;
}

uint64_t ClockTimeSnippetModel.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 20);
  uint64_t v4 = sub_23CA0CCB0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ClockTimeSnippetModel.date.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 20);
  uint64_t v4 = sub_23CA0CCB0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*ClockTimeSnippetModel.date.modify())()
{
  return nullsub_1;
}

uint64_t ClockTimeSnippetModel.currentTimeStaticTitle.getter()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  sub_23CA0CE90();
  return v1;
}

uint64_t sub_23C9D711C@<X0>(void *a1@<X8>)
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t result = sub_23CA0CE90();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C9D717C()
{
  return sub_23CA0CEA0();
}

uint64_t ClockTimeSnippetModel.currentTimeStaticTitle.setter()
{
  return sub_23CA0CEA0();
}

uint64_t (*ClockTimeSnippetModel.currentTimeStaticTitle.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  v2[4] = sub_23CA0CE80();
  return sub_23C9D72B0;
}

uint64_t ClockTimeSnippetModel.timeDescriptiveAbsolute.getter()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  sub_23CA0CE90();
  return v1;
}

uint64_t sub_23C9D7300@<X0>(void *a1@<X8>)
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t result = sub_23CA0CE90();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C9D7360()
{
  return sub_23CA0CEA0();
}

uint64_t ClockTimeSnippetModel.timeDescriptiveAbsolute.setter()
{
  return sub_23CA0CEA0();
}

uint64_t (*ClockTimeSnippetModel.timeDescriptiveAbsolute.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  v2[4] = sub_23CA0CE80();
  return sub_23C9D72B0;
}

uint64_t ClockTimeSnippetModel.locale.getter()
{
  return sub_23CA0CE90();
}

uint64_t sub_23C9D74D8(uint64_t a1)
{
  uint64_t v2 = sub_23CA0CD60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  sub_23CA0CEA0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t ClockTimeSnippetModel.locale.setter(uint64_t a1)
{
  uint64_t v2 = sub_23CA0CD60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  sub_23CA0CEA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*ClockTimeSnippetModel.locale.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  v2[4] = sub_23CA0CE80();
  return sub_23C9D72B0;
}

void sub_23C9D77B0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t ClockTimeSnippetModel.punchoutURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 36);
  return sub_23C9D7840(v3, a1);
}

uint64_t sub_23C9D7840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClockTimeSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 36);
  return sub_23C9D78EC(a1, v3);
}

uint64_t sub_23C9D78EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ClockTimeSnippetModel.punchoutURL.modify())()
{
  return nullsub_1;
}

uint64_t ClockTimeSnippetModel.init(id:date:currentTimeStaticTitle:timeDescriptiveAbsolute:locale:punchoutURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v30 = a3;
  uint64_t v37 = a10;
  uint64_t v15 = sub_23CA0CD60();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v33 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v30 - v19;
  uint64_t v21 = type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v34 = (uint64_t)a9 + *(int *)(v21 + 36);
  uint64_t v22 = v34;
  uint64_t v23 = sub_23CA0CC40();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *a9 = a1;
  a9[1] = a2;
  uint64_t v24 = (char *)a9 + *(int *)(v21 + 20);
  uint64_t v25 = sub_23CA0CCB0();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v24, a3, v25);
  uint64_t v38 = v31;
  uint64_t v39 = v32;
  sub_23CA0CE70();
  uint64_t v38 = v35;
  uint64_t v39 = v36;
  sub_23CA0CE70();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v27(v20, (uint64_t)a8, v15);
  v27(v33, (uint64_t)v20, v15);
  sub_23CA0CE70();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v16 + 8);
  v28(v20, v15);
  v28(a8, v15);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v25);
  return sub_23C9D78EC(v37, v34);
}

unint64_t sub_23C9D7C4C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 1702125924;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 5:
      unint64_t result = 0x74756F68636E7570;
      break;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

unint64_t sub_23C9D7D0C()
{
  return sub_23C9D7C4C(*v0);
}

uint64_t sub_23C9D7D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C9DB7BC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C9D7D3C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23C9D7D48(uint64_t a1)
{
  unint64_t v2 = sub_23C9D8100();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9D7D84(uint64_t a1)
{
  unint64_t v2 = sub_23C9D8100();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ClockTimeSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE5A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C9D8100();
  sub_23CA0ED40();
  char v14 = 0;
  sub_23CA0EB10();
  if (!v1)
  {
    type metadata accessor for ClockTimeSnippetModel(0);
    char v13 = 1;
    sub_23CA0CCB0();
    sub_23C9D6DC4(&qword_268BBE5B0, MEMORY[0x263F07490]);
    sub_23CA0EB50();
    char v12 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    sub_23C9D8A64(&qword_268BBE5B8);
    sub_23CA0EB50();
    char v11 = 3;
    sub_23CA0EB50();
    char v10 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
    sub_23C9D8ACC(&qword_268BBE5C0);
    sub_23CA0EB50();
    char v9 = 5;
    sub_23CA0CC40();
    sub_23C9D6DC4(&qword_268BBE5D8, MEMORY[0x263F06EA8]);
    sub_23CA0EB00();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23C9D8100()
{
  unint64_t result = qword_268BBE5A8;
  if (!qword_268BBE5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE5A8);
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

uint64_t ClockTimeSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v50 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  uint64_t v59 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  unint64_t v51 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  uint64_t v55 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v52 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v58 = (char *)v46 - v10;
  uint64_t v11 = sub_23CA0CCB0();
  uint64_t v56 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE5E0);
  uint64_t v57 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v15 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (void *)((char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = (uint64_t)v19 + *(int *)(v17 + 36);
  uint64_t v21 = sub_23CA0CC40();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v62 = v20;
  v22(v20, 1, 1, v21);
  uint64_t v23 = a1[3];
  uint64_t v63 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_23C9D8100();
  unint64_t v61 = v15;
  uint64_t v24 = v64;
  sub_23CA0ED30();
  if (v24)
  {
    uint64_t v28 = v62;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    return sub_23C9D8A04(v28);
  }
  else
  {
    v46[1] = v21;
    uint64_t v47 = (int *)v16;
    uint64_t v48 = v11;
    unint64_t v64 = v19;
    uint64_t v25 = v58;
    uint64_t v26 = v59;
    char v70 = 0;
    uint64_t v27 = sub_23CA0EAA0();
    uint64_t v29 = v64;
    *unint64_t v64 = v27;
    v29[1] = v30;
    char v69 = 1;
    sub_23C9D6DC4(&qword_268BBE5E8, MEMORY[0x263F07490]);
    uint64_t v31 = v13;
    uint64_t v32 = v48;
    sub_23CA0EAB0();
    uint64_t v33 = v47;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))((char *)v29 + v47[5], v31, v32);
    char v68 = 2;
    sub_23C9D8A64(&qword_268BBE5F0);
    uint64_t v34 = v25;
    uint64_t v35 = v54;
    sub_23CA0EAB0();
    uint64_t v36 = (char *)v29 + v33[6];
    uint64_t v37 = (uint64_t)v29;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v38(v36, v34, v35);
    char v67 = 3;
    uint64_t v39 = v52;
    uint64_t v58 = 0;
    sub_23CA0EAB0();
    v38((char *)(v37 + v47[7]), v39, v35);
    char v66 = 4;
    sub_23C9D8ACC(&qword_268BBE5F8);
    uint64_t v40 = v51;
    uint64_t v41 = v53;
    uint64_t v42 = v60;
    sub_23CA0EAB0();
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v37 + v47[8], v40, v41);
    char v65 = 5;
    sub_23C9D6DC4(&qword_268BBE600, MEMORY[0x263F06EA8]);
    uint64_t v43 = (uint64_t)v50;
    uint64_t v44 = v61;
    sub_23CA0EA90();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v44, v42);
    sub_23C9D78EC(v43, v62);
    sub_23C9D8B98(v37, v49, type metadata accessor for ClockTimeSnippetModel);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    return sub_23C9D6984(v37);
  }
}

uint64_t sub_23C9D8A04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C9D8A64(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBE590);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C9D8ACC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBE598);
    uint64_t v3 = (void (*)(uint64_t))MEMORY[0x263F07690];
    sub_23C9D6DC4(&qword_268BBE5C8, MEMORY[0x263F07690]);
    sub_23C9D6DC4(&qword_268BBE5D0, v3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C9D8B98(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C9D8C00()
{
  return sub_23C9D6DC4(&qword_268BBE608, (void (*)(uint64_t))type metadata accessor for SiriClockSnippetModels);
}

uint64_t sub_23C9D8C48()
{
  return sub_23C9D6DC4(&qword_268BBE610, (void (*)(uint64_t))type metadata accessor for SiriClockSnippetModels);
}

uint64_t sub_23C9D8C90()
{
  return sub_23C9D6DC4(&qword_268BBE588, (void (*)(uint64_t))type metadata accessor for ClockTimeSnippetModel);
}

uint64_t sub_23C9D8CD8()
{
  return sub_23C9D6DC4(&qword_268BBE568, (void (*)(uint64_t))type metadata accessor for ClockTimeSnippetModel);
}

uint64_t sub_23C9D8D20()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_23C9D8D2C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C9D8D38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClockTimeSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23C9D8D50(void *a1)
{
  return ClockTimeSnippetModel.encode(to:)(a1);
}

uint64_t sub_23C9D8D78()
{
  return sub_23CA0CE90();
}

char *initializeBufferWithCopyOfBuffer for SiriClockSnippetModels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (char *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
    uint64_t v8 = v7[5];
    uint64_t v9 = &v4[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23CA0CCB0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = v7[6];
    uint64_t v14 = &v4[v13];
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v4[v7[7]], (char *)a2 + v7[7], v16);
    uint64_t v18 = v7[8];
    uint64_t v19 = &v4[v18];
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = v7[9];
    uint64_t v23 = &v4[v22];
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = sub_23CA0CC40();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
      memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return v4;
}

uint64_t destroy for SiriClockSnippetModels(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v3 = a1 + v2[5];
  uint64_t v4 = sub_23CA0CCB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = a1 + v2[6];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + v2[7], v6);
  uint64_t v8 = a1 + v2[8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + v2[9];
  uint64_t v11 = sub_23CA0CC40();
  uint64_t v14 = *(void *)(v11 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v10, 1, v11);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v13(v10, v11);
  }
  return result;
}

char *initializeWithCopy for SiriClockSnippetModels(char *a1, char *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v4;
  uint64_t v5 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_23CA0CCB0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = v5[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(&a1[v5[7]], &a2[v5[7]], v14);
  uint64_t v16 = v5[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = v5[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = sub_23CA0CC40();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

char *assignWithCopy for SiriClockSnippetModels(char *a1, char *a2)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(&a1[v4[7]], &a2[v4[7]], v12);
  uint64_t v14 = v4[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = v4[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_23CA0CC40();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v16) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (!v16)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

char *initializeWithTake for SiriClockSnippetModels(char *a1, char *a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13(&a1[v4[7]], &a2[v4[7]], v12);
  uint64_t v14 = v4[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = v4[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_23CA0CC40();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

char *assignWithTake for SiriClockSnippetModels(char *a1, char *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = v5[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40);
  v14(v11, v12, v13);
  v14(&a1[v5[7]], &a2[v5[7]], v13);
  uint64_t v15 = v5[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = v5[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_23CA0CC40();
  uint64_t v23 = *(void *)(v22 - 8);
  int v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  LODWORD(v17) = v24(v20, 1, v22);
  int v25 = v24(v21, 1, v22);
  if (!v17)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v20, v21, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriClockSnippetModels(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClockTimeSnippetModel(0);
  return MEMORY[0x270FA0340](a1, a2, v4, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for SiriClockSnippetModels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ClockTimeSnippetModel(0);
  return MEMORY[0x270FA0580](a1, a2, a3, v6, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_23C9D9C90()
{
  return 0;
}

uint64_t sub_23C9D9C98(uint64_t a1)
{
  uint64_t result = type metadata accessor for ClockTimeSnippetModel(319);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for ClockTimeSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (char *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23CA0CCB0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = &v4[v13];
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v4[a3[7]], (char *)a2 + a3[7], v16);
    uint64_t v18 = a3[8];
    uint64_t v19 = &v4[v18];
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = a3[9];
    uint64_t v23 = &v4[v22];
    int v24 = (char *)a2 + v22;
    uint64_t v25 = sub_23CA0CC40();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
      memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return v4;
}

uint64_t destroy for ClockTimeSnippetModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_23CA0CCB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[7], v7);
  uint64_t v9 = a1 + a2[8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[9];
  uint64_t v12 = sub_23CA0CC40();
  uint64_t v15 = *(void *)(v12 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v12);
  if (!result)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    return v14(v11, v12);
  }
  return result;
}

char *initializeWithCopy for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_23CA0CCB0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v16(&a1[a3[7]], &a2[a3[7]], v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_23CA0CC40();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

char *assignWithCopy for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(&a1[a3[7]], &a2[a3[7]], v13);
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_23CA0CC40();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  LODWORD(v17) = v24(v20, 1, v22);
  int v25 = v24(v21, 1, v22);
  if (!v17)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v20, v21, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

char *initializeWithTake for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v14(&a1[a3[7]], &a2[a3[7]], v13);
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_23CA0CC40();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *assignWithTake for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_23CA0CCB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(&a1[a3[7]], &a2[a3[7]], v14);
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = sub_23CA0CC40();
  uint64_t v24 = *(void *)(v23 - 8);
  int v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v18) = v25(v21, 1, v23);
  int v26 = v25(v22, 1, v23);
  if (!v18)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClockTimeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23C9DAB20);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_23CA0CCB0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_11;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_11;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[9];
  return v16(v18, a2, v17);
}

uint64_t storeEnumTagSinglePayload for ClockTimeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23C9DAD08);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_23CA0CCB0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_9;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE598);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[9];
  return v16(v18, a2, a2, v17);
}

void sub_23C9DAEDC()
{
  sub_23CA0CCB0();
  if (v0 <= 0x3F)
  {
    sub_23C9DB088();
    if (v1 <= 0x3F)
    {
      sub_23C9DB0E0(319, &qword_268BBE640, MEMORY[0x263F07690], MEMORY[0x263F77230]);
      if (v2 <= 0x3F)
      {
        sub_23C9DB0E0(319, (unint64_t *)&qword_268BBE648, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_23C9DB088()
{
  if (!qword_268BBE638)
  {
    unint64_t v0 = sub_23CA0CEB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268BBE638);
    }
  }
}

void sub_23C9DB0E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for ClockTimeSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9DB210);
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

ValueMetadata *type metadata accessor for ClockTimeSnippetModel.CodingKeys()
{
  return &type metadata for ClockTimeSnippetModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriClockSnippetModels.CodingKeys()
{
  return &type metadata for SiriClockSnippetModels.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimeEventSender.Attribute(unsigned int *a1, int a2)
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

unsigned char *_s16SiriTimeInternal22SiriClockSnippetModelsO10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23C9DB350);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriClockSnippetModels.TimeViewCodingKeys()
{
  return &type metadata for SiriClockSnippetModels.TimeViewCodingKeys;
}

unint64_t sub_23C9DB38C()
{
  unint64_t result = qword_268BBE650;
  if (!qword_268BBE650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE650);
  }
  return result;
}

unint64_t sub_23C9DB3E4()
{
  unint64_t result = qword_268BBE658;
  if (!qword_268BBE658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE658);
  }
  return result;
}

unint64_t sub_23C9DB43C()
{
  unint64_t result = qword_268BBE660;
  if (!qword_268BBE660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE660);
  }
  return result;
}

unint64_t sub_23C9DB494()
{
  unint64_t result = qword_268BBE668;
  if (!qword_268BBE668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE668);
  }
  return result;
}

unint64_t sub_23C9DB4EC()
{
  unint64_t result = qword_268BBE670;
  if (!qword_268BBE670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE670);
  }
  return result;
}

unint64_t sub_23C9DB544()
{
  unint64_t result = qword_268BBE678;
  if (!qword_268BBE678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE678);
  }
  return result;
}

unint64_t sub_23C9DB59C()
{
  unint64_t result = qword_268BBE680;
  if (!qword_268BBE680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE680);
  }
  return result;
}

unint64_t sub_23C9DB5F4()
{
  unint64_t result = qword_268BBE688;
  if (!qword_268BBE688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE688);
  }
  return result;
}

unint64_t sub_23C9DB64C()
{
  unint64_t result = qword_268BBE690;
  if (!qword_268BBE690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE690);
  }
  return result;
}

uint64_t sub_23C9DB6A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x77656956656D6974 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C9DB728()
{
  return 0x77656956656D6974;
}

uint64_t sub_23C9DB740(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C9DB7B0()
{
  return 12383;
}

uint64_t sub_23C9DB7BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023CA16190 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023CA161B0 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x74756F68636E7570 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

id HALAlarmDeviceContext.device.getter()
{
  return *v0;
}

uint64_t HALAlarmDeviceContext.alarms.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HALAlarmDeviceContext.remoteExecutionId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HALAlarmDeviceContext.remoteExecutionId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*HALAlarmDeviceContext.remoteExecutionId.modify())()
{
  return nullsub_1;
}

uint64_t HALAlarmDeviceContext.firingAlarms.getter()
{
  if ((*(void *)(v0 + 8) & 0xC000000000000001) != 0)
  {
    uint64_t v1 = MEMORY[0x263F8EE88];
    uint64_t v16 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRetain();
    sub_23CA0E850();
    if (sub_23CA0E880())
    {
      sub_23C9DC4AC();
      do
      {
        swift_dynamicCast();
        if (objc_msgSend(v15, sel_isFiring))
        {
          uint64_t v2 = v16;
          unint64_t v3 = *(void *)(v16 + 16);
          if (*(void *)(v16 + 24) <= v3)
          {
            sub_23C9DBE4C(v3 + 1, &qword_268BBE6B8);
            uint64_t v2 = v16;
          }
          uint64_t result = sub_23CA0E740();
          uint64_t v5 = v2 + 56;
          uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
          unint64_t v7 = result & ~v6;
          unint64_t v8 = v7 >> 6;
          if (((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
          {
            unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v10 = 0;
            unint64_t v11 = (unint64_t)(63 - v6) >> 6;
            do
            {
              if (++v8 == v11 && (v10 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              BOOL v12 = v8 == v11;
              if (v8 == v11) {
                unint64_t v8 = 0;
              }
              v10 |= v12;
              uint64_t v13 = *(void *)(v5 + 8 * v8);
            }
            while (v13 == -1);
            unint64_t v9 = __clz(__rbit64(~v13)) + (v8 << 6);
          }
          *(void *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
          *(void *)(*(void *)(v2 + 48) + 8 * v9) = v15;
          ++*(void *)(v2 + 16);
        }
        else
        {
        }
      }
      while (sub_23CA0E880());
      uint64_t v1 = v16;
    }
    swift_release();
  }
  else
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    return (uint64_t)sub_23C9DC570(v14);
  }
  return v1;
}

id sub_23C9DBCA8()
{
  return *v0;
}

uint64_t Array<A>.firingDevices()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  uint64_t v3 = MEMORY[0x263F8EE78];
  do
  {
    long long v13 = *(_OWORD *)(v2 - 3);
    uint64_t v5 = *(v2 - 1);
    uint64_t v4 = *v2;
    swift_bridgeObjectRetain();
    id v6 = (id)v13;
    swift_bridgeObjectRetain();
    uint64_t v7 = HALAlarmDeviceContext.firingAlarms.getter();
    if ((v7 & 0xC000000000000001) != 0) {
      uint64_t v8 = sub_23CA0E860();
    }
    else {
      uint64_t v8 = *(void *)(v7 + 16);
    }
    swift_bridgeObjectRelease();
    if (v8)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_23C9DC870(0, *(void *)(v3 + 16) + 1, 1);
      }
      unint64_t v10 = *(void *)(v3 + 16);
      unint64_t v9 = *(void *)(v3 + 24);
      if (v10 >= v9 >> 1) {
        sub_23C9DC870(v9 > 1, v10 + 1, 1);
      }
      *(void *)(v3 + 16) = v10 + 1;
      uint64_t v11 = v3 + 32 * v10;
      *(_OWORD *)(v11 + 32) = v13;
      *(void *)(v11 + 48) = v5;
      *(void *)(v11 + 56) = v4;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v2 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  long long v13;

  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  uint64_t v3 = MEMORY[0x263F8EE78];
  do
  {
    long long v13 = *(_OWORD *)(v2 - 3);
    uint64_t v5 = *(v2 - 1);
    uint64_t v4 = *v2;
    swift_bridgeObjectRetain();
    id v6 = (id)v13;
    swift_bridgeObjectRetain();
    uint64_t v7 = HALTimerDeviceContext.firingTimers.getter();
    if ((v7 & 0xC000000000000001) != 0) {
      uint64_t v8 = sub_23CA0E860();
    }
    else {
      uint64_t v8 = *(void *)(v7 + 16);
    }
    swift_bridgeObjectRelease();
    if (v8)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_23C9DCA14(0, *(void *)(v3 + 16) + 1, 1);
      }
      unint64_t v10 = *(void *)(v3 + 16);
      unint64_t v9 = *(void *)(v3 + 24);
      if (v10 >= v9 >> 1) {
        sub_23C9DCA14(v9 > 1, v10 + 1, 1);
      }
      *(void *)(v3 + 16) = v10 + 1;
      uint64_t v11 = v3 + 32 * v10;
      *(_OWORD *)(v11 + 32) = v13;
      *(void *)(v11 + 48) = v5;
      *(void *)(v11 + 56) = v4;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v2 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23C9DBE34(uint64_t a1)
{
  return sub_23C9DBE4C(a1, &qword_268BBE6B8);
}

uint64_t sub_23C9DBE40(uint64_t a1)
{
  return sub_23C9DBE4C(a1, &qword_268BBE6B0);
}

uint64_t sub_23C9DBE4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_23CA0E8A0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_23CA0E740();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_23C9DC0E8()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_23CA0CD10();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6A0);
  uint64_t v5 = sub_23CA0E8A0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v38 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v39 = v4;
    int64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v37) {
          goto LABEL_33;
        }
        unint64_t v20 = v38[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v20 = v38[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v20 = v38[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v36;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v38 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v38[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v38[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v2 + 72);
      uint64_t v25 = v2;
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 32);
      v26(v14, v23 + v24 * v18, v15);
      sub_23C9DC9BC();
      uint64_t result = sub_23CA0E4A0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v39;
      int64_t v13 = v40;
      uint64_t v2 = v25;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

unint64_t sub_23C9DC4AC()
{
  unint64_t result = qword_268BBE698;
  if (!qword_268BBE698)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BBE698);
  }
  return result;
}

unint64_t sub_23C9DC4EC(uint64_t a1, uint64_t a2)
{
  sub_23CA0E740();
  unint64_t result = sub_23CA0E840();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t *sub_23C9DC570(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_23C9DC6D4((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_23C9DC6D4((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x23ECEDBE0](v7, -1, -1);
  }
  return v6;
}

unint64_t *sub_23C9DC6D4(unint64_t *result, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    unint64_t result = (unint64_t *)objc_msgSend(*(id *)(*(void *)(a3 + 48) + 8 * v13), sel_isFiring);
    if (result)
    {
      *(unint64_t *)((char *)v4 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return (unint64_t *)sub_23C9DD580(v4, a2, v5, a3);
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v11) {
    goto LABEL_24;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23C9DC870(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_23C9DCC84(a1, a2, a3, *v3, &qword_268BBE430);
  *char v3 = (char *)result;
  return result;
}

uint64_t assignWithCopy for HALAlarmDeviceContext(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HALAlarmDeviceContext(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for HALAlarmDeviceContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HALAlarmDeviceContext()
{
  return &type metadata for HALAlarmDeviceContext;
}

unint64_t sub_23C9DC9BC()
{
  unint64_t result = qword_268BBE6A8;
  if (!qword_268BBE6A8)
  {
    sub_23CA0CD10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE6A8);
  }
  return result;
}

uint64_t sub_23C9DCA14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_23C9DCC84(a1, a2, a3, *v3, &qword_268BBE420);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_23C9DCA44(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE438);
  uint64_t v10 = *(void *)(sub_23CA0CCB0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  _OWORD v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_23CA0CCB0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  int64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  int64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9DCC84(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[32 * v9]) {
      memmove(v14, v15, 32 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v9] || v14 >= &v15[32 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t ApplicationContext.deviceState.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C9BFAA4(v1 + 16, a1);
}

uint64_t ApplicationContext.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t ApplicationContext.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t method lookup function for ApplicationContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ApplicationContext);
}

id HALTimerDeviceContext.device.getter()
{
  return *v0;
}

uint64_t HALTimerDeviceContext.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HALTimerDeviceContext.remoteExecutionId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HALTimerDeviceContext.firingTimers.getter()
{
  if ((*(void *)(v0 + 8) & 0xC000000000000001) != 0)
  {
    uint64_t v1 = MEMORY[0x263F8EE88];
    uint64_t v16 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRetain();
    sub_23CA0E850();
    if (sub_23CA0E880())
    {
      sub_23C9DD238();
      do
      {
        swift_dynamicCast();
        if (objc_msgSend(v15, sel_isFiring))
        {
          uint64_t v2 = v16;
          unint64_t v3 = *(void *)(v16 + 16);
          if (*(void *)(v16 + 24) <= v3)
          {
            sub_23C9DBE40(v3 + 1);
            uint64_t v2 = v16;
          }
          uint64_t result = sub_23CA0E740();
          uint64_t v5 = v2 + 56;
          uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
          unint64_t v7 = result & ~v6;
          unint64_t v8 = v7 >> 6;
          if (((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
          {
            unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v10 = 0;
            unint64_t v11 = (unint64_t)(63 - v6) >> 6;
            do
            {
              if (++v8 == v11 && (v10 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              BOOL v12 = v8 == v11;
              if (v8 == v11) {
                unint64_t v8 = 0;
              }
              v10 |= v12;
              uint64_t v13 = *(void *)(v5 + 8 * v8);
            }
            while (v13 == -1);
            unint64_t v9 = __clz(__rbit64(~v13)) + (v8 << 6);
          }
          *(void *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
          *(void *)(*(void *)(v2 + 48) + 8 * v9) = v15;
          ++*(void *)(v2 + 16);
        }
        else
        {
        }
      }
      while (sub_23CA0E880());
      uint64_t v1 = v16;
    }
    swift_release();
  }
  else
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    return (uint64_t)sub_23C9DD278(v14);
  }
  return v1;
}

unint64_t sub_23C9DD238()
{
  unint64_t result = qword_268BBE6C8;
  if (!qword_268BBE6C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BBE6C8);
  }
  return result;
}

unint64_t *sub_23C9DD278(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_23C9DD3DC((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    unint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_23C9DD3DC((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x23ECEDBE0](v7, -1, -1);
  }
  return v6;
}

unint64_t *sub_23C9DD3DC(unint64_t *result, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    unint64_t result = (unint64_t *)objc_msgSend(*(id *)(*(void *)(a3 + 48) + 8 * v13), sel_isFiring);
    if (result)
    {
      *(unint64_t *)((char *)v4 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return (unint64_t *)sub_23C9DD58C(v4, a2, v5, a3, &qword_268BBE6B0);
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v11) {
    goto LABEL_24;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23C9DD580(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C9DD58C(a1, a2, a3, a4, &qword_268BBE6B8);
}

uint64_t sub_23C9DD58C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a4;
  if (!a3)
  {
    uint64_t v10 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v10;
  }
  uint64_t v6 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v5;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t result = sub_23CA0E8C0();
  uint64_t v10 = result;
  unint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = *a1;
  }
  uint64_t v12 = 0;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    uint64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_39;
    }
    if (v16 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v29[v16];
    ++v12;
    if (!v17)
    {
      uint64_t v12 = v16 + 1;
      if (v16 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v17 = v29[v12];
      if (!v17)
      {
        uint64_t v12 = v16 + 2;
        if (v16 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v17 = v29[v12];
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v5 + 48) + 8 * v15);
    uint64_t result = sub_23CA0E740();
    uint64_t v20 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v13 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v10 + 48) + 8 * v23) = v19;
    ++*(void *)(v10 + 16);
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6) {
      goto LABEL_36;
    }
  }
  uint64_t v18 = v16 + 3;
  if (v18 >= a2) {
    goto LABEL_36;
  }
  unint64_t v17 = v29[v18];
  if (v17)
  {
    uint64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v29[v12];
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for HALTimerDeviceContext()
{
  return &type metadata for HALTimerDeviceContext;
}

uint64_t sub_23C9DD7F8()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE6D0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE6D0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t NLContextUpdate.add(nluSystemDialogAct:)(uint64_t a1)
{
  uint64_t v2 = sub_23CA0D1A0();
  if (v2)
  {
    if (*(void *)(v2 + 16))
    {
      if (qword_268BBDE90 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_23CA0E410();
      __swift_project_value_buffer(v3, (uint64_t)qword_268BBE6D0);
      swift_bridgeObjectRetain();
      unint64_t v4 = sub_23CA0E3F0();
      os_log_type_t v5 = sub_23CA0E700();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v18 = v7;
        *(_DWORD *)uint64_t v6 = 136315138;
        uint64_t v8 = sub_23CA0D630();
        uint64_t v9 = swift_bridgeObjectRetain();
        uint64_t v10 = MEMORY[0x23ECECE40](v9, v8);
        unint64_t v12 = v11;
        swift_bridgeObjectRelease();
        sub_23C9BC474(v10, v12, &v18);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C9B6000, v4, v5, "Attempted to set additional SDA on NLContextUpdate. This is unsupported and the last-in SDA will be used. Dropping previous SDA: %s", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v7, -1, -1);
        MEMORY[0x23ECEDBE0](v6, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6E8);
  uint64_t v13 = sub_23CA0D630();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23CA0F8D0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16))(v16 + v15, a1, v13);
  return sub_23CA0D1B0();
}

uint64_t sub_23C9DDB70()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE6F8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE6F8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t SiriTimeCrossDeviceAnalytics.init(action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23CA0E3A0();
  os_log_type_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

void SiriTimeCrossDeviceAnalytics.logSharedAnalyticsStarted(selectedDevice:)(void *a1)
{
  uint64_t v44 = a1;
  uint64_t v1 = sub_23CA0E240();
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v46 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v43 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE710);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23CA0E3A0();
  uint64_t v38 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23CA0E3B0();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v47 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA0CD10();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v37 - v18;
  sub_23CA0D060();
  __swift_project_boxed_opaque_existential_1(v48, v48[3]);
  sub_23CA0D2E0();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    sub_23CA0CCC0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v7, v40, v5);
      uint64_t v25 = sub_23CA0E390();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v39, 1, 1, v25);
      BOOL v26 = v47;
      sub_23CA0E380();
      sub_23CA0E320();
      uint64_t v40 = sub_23CA0E310();
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE718);
      unint64_t v28 = v43;
      unint64_t v29 = &v43[*(int *)(v27 + 64)];
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_23CA0F560;
      unint64_t v31 = v44;
      *(void *)(v30 + 32) = v44;
      v48[0] = v30;
      sub_23CA0E5D0();
      *unint64_t v28 = v48[0];
      v28[1] = 0;
      uint64_t v32 = v41;
      uint64_t v33 = v42;
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v29, v26, v42);
      uint64_t v35 = v45;
      uint64_t v34 = v46;
      (*(void (**)(void *, void, uint64_t))(v45 + 104))(v28, *MEMORY[0x263F75948], v46);
      id v36 = v31;
      sub_23CA0E2F0();
      swift_release();
      (*(void (**)(void *, uint64_t))(v35 + 8))(v28, v34);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v47, v33);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return;
    }
    sub_23C9C9AC4((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  }
  if (qword_268BBDE98 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_23CA0E410();
  __swift_project_value_buffer(v21, (uint64_t)qword_268BBE6F8);
  unint64_t v22 = sub_23CA0E3F0();
  os_log_type_t v23 = sub_23CA0E700();
  if (os_log_type_enabled(v22, v23))
  {
    char v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v24 = 0;
    _os_log_impl(&dword_23C9B6000, v22, v23, "DismissAlarm.logSharedAnalyticsStarted(selectedDevice:) returning - request UUID missing or invalid", v24, 2u);
    MEMORY[0x23ECEDBE0](v24, -1, -1);
  }
}

void SiriTimeCrossDeviceAnalytics.logSharedAnalyticsEnded(result:)(uint64_t a1)
{
  uint64_t v42 = a1;
  uint64_t v1 = sub_23CA0E240();
  uint64_t v44 = *(void *)(v1 - 8);
  uint64_t v45 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v43 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE710);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23CA0E3A0();
  uint64_t v36 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23CA0E3B0();
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v39 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA0CD10();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v35 - v18;
  sub_23CA0D060();
  __swift_project_boxed_opaque_existential_1(v46, v46[3]);
  sub_23CA0D2E0();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    sub_23CA0CCC0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v7, v38, v5);
      uint64_t v25 = sub_23CA0E390();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v37, 1, 1, v25);
      BOOL v26 = v39;
      sub_23CA0E380();
      sub_23CA0E320();
      sub_23CA0E310();
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE720);
      unint64_t v28 = v43;
      unint64_t v29 = &v43[*(int *)(v27 + 48)];
      uint64_t v31 = v40;
      uint64_t v30 = v41;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v26, v41);
      uint64_t v32 = sub_23CA0E230();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(v29, v42, v32);
      uint64_t v34 = v44;
      uint64_t v33 = v45;
      (*(void (**)(char *, void, uint64_t))(v44 + 104))(v28, *MEMORY[0x263F75928], v45);
      sub_23CA0E2F0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v33);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v30);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return;
    }
    sub_23C9C9AC4((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  }
  if (qword_268BBDE98 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_23CA0E410();
  __swift_project_value_buffer(v21, (uint64_t)qword_268BBE6F8);
  unint64_t v22 = sub_23CA0E3F0();
  os_log_type_t v23 = sub_23CA0E700();
  if (os_log_type_enabled(v22, v23))
  {
    char v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v24 = 0;
    _os_log_impl(&dword_23C9B6000, v22, v23, "DismissAlarm.logSharedAnalyticsEnded(result:) returning - request UUID missing or invalid", v24, 2u);
    MEMORY[0x23ECEDBE0](v24, -1, -1);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for SiriTimeCrossDeviceAnalytics(uint64_t a1)
{
  uint64_t v2 = sub_23CA0E3A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23C9DEB0C);
}

uint64_t sub_23C9DEB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23C9DEB8C);
}

uint64_t sub_23C9DEB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA0E3A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SiriTimeCrossDeviceAnalytics()
{
  uint64_t result = qword_268BBE728;
  if (!qword_268BBE728) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C9DEC48()
{
  uint64_t result = sub_23CA0E3A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t DeviceState.isPhoneOrPad.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = sub_23CA0D0A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  if (v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_23CA0D090();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
  return v7 & 1;
}

BOOL static DecideAction.PromptExpectation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DecideAction.PromptExpectation.hash(into:)()
{
  return sub_23CA0ED10();
}

uint64_t DecideAction.PromptExpectation.hashValue.getter()
{
  return sub_23CA0ED20();
}

unint64_t sub_23C9DEE68()
{
  unint64_t result = qword_268BBE738;
  if (!qword_268BBE738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE738);
  }
  return result;
}

ValueMetadata *type metadata accessor for DecideAction()
{
  return &type metadata for DecideAction;
}

uint64_t getEnumTagSinglePayload for DecideAction.PromptExpectation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DecideAction.PromptExpectation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9DF028);
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

ValueMetadata *type metadata accessor for DecideAction.PromptExpectation()
{
  return &type metadata for DecideAction.PromptExpectation;
}

uint64_t DeviceUnit.dialogType.getter()
{
  _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0();
  sub_23CA0E2D0();
  return sub_23CA0E500();
}

uint64_t DeviceUnit.room.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C9DF1A8(MEMORY[0x263F75968], a1);
}

uint64_t DeviceUnit.deviceName.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C9DF1A8(MEMORY[0x263F75960], a1);
}

uint64_t sub_23C9DF1A8@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  a1();
  if (v3)
  {
    sub_23CA0E500();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_23CA0E140();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    uint64_t v6 = v4;
    uint64_t v7 = a2;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = sub_23CA0E140();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v6 = v9;
    uint64_t v7 = a2;
    uint64_t v8 = 1;
  }
  return v5(v7, v8, 1, v6);
}

uint64_t PunchOutApp.url.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v28 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  switch(*v1)
  {
    case 1:
      unint64_t v12 = self;
      uint64_t v13 = (void *)sub_23CA0E4C0();
      id v14 = objc_msgSend(v12, sel_mtURLForScheme_, v13);

      if (v14)
      {
        sub_23CA0CC20();

        uint64_t v15 = sub_23CA0CC40();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
      }
      else
      {
        uint64_t v24 = sub_23CA0CC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v10, 1, 1, v24);
      }
      uint64_t v25 = (uint64_t)v10;
      goto LABEL_17;
    case 2:
      uint64_t v16 = self;
      unint64_t v17 = (void *)sub_23CA0E4C0();
      id v18 = objc_msgSend(v16, sel_mtURLForScheme_, v17);

      if (v18)
      {
        sub_23CA0CC20();

        uint64_t v19 = sub_23CA0CC40();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 0, 1, v19);
      }
      else
      {
        uint64_t v26 = sub_23CA0CC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v8, 1, 1, v26);
      }
      uint64_t v25 = (uint64_t)v8;
      goto LABEL_17;
    case 4:
      uint64_t v20 = self;
      uint64_t v21 = (void *)sub_23CA0E4C0();
      id v22 = objc_msgSend(v20, sel_mtURLForScheme_, v21);

      if (v22)
      {
        sub_23CA0CC20();

        uint64_t v23 = sub_23CA0CC40();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 0, 1, v23);
      }
      else
      {
        uint64_t v27 = sub_23CA0CC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v5, 1, 1, v27);
      }
      uint64_t v25 = (uint64_t)v5;
LABEL_17:
      uint64_t result = sub_23C9DF65C(v25, a1);
      break;
    default:
      uint64_t result = sub_23CA0CC30();
      break;
  }
  return result;
}

uint64_t sub_23C9DF65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

SiriTimeInternal::PunchOutApp_optional __swiftcall PunchOutApp.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_23CA0EA10();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

void *static PunchOutApp.allCases.getter()
{
  return &unk_26F0A1950;
}

uint64_t PunchOutApp.rawValue.getter()
{
  return *(void *)&aSleep_2[8 * *v0];
}

uint64_t sub_23C9DF750(char *a1, char *a2)
{
  return sub_23C9FBEEC(*a1, *a2);
}

uint64_t sub_23C9DF75C()
{
  return sub_23C9F2FD0();
}

uint64_t sub_23C9DF764()
{
  return sub_23C9F34D4();
}

uint64_t sub_23C9DF76C()
{
  return sub_23C9F37D4();
}

SiriTimeInternal::PunchOutApp_optional sub_23C9DF774(Swift::String *a1)
{
  return PunchOutApp.init(rawValue:)(*a1);
}

uint64_t sub_23C9DF780@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PunchOutApp.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23C9DF7A8(void *a1@<X8>)
{
  *a1 = &unk_26F0A1978;
}

unint64_t sub_23C9DF7BC()
{
  unint64_t result = qword_268BBE740;
  if (!qword_268BBE740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE740);
  }
  return result;
}

unint64_t sub_23C9DF814()
{
  unint64_t result = qword_268BBE748;
  if (!qword_268BBE748)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBE750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE748);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PunchOutApp(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9DF93CLL);
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

ValueMetadata *type metadata accessor for PunchOutApp()
{
  return &type metadata for PunchOutApp;
}

uint64_t sub_23C9DF974(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_23C9DF9D4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtof_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_23C9DFA44@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unint64_t sub_23C9DFA88()
{
  unint64_t result = qword_268BBE768;
  if (!qword_268BBE768)
  {
    sub_23CA0D840();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBE768);
  }
  return result;
}

uint64_t sub_23C9DFAE0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE770);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE770);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_23C9DFBA8()
{
  qword_268BBE788 = 0x656D695469726953;
  unk_268BBE790 = 0xE800000000000000;
}

uint64_t sub_23C9DFBCC()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_processName);

  uint64_t v2 = sub_23CA0E4D0();
  uint64_t v4 = v3;

  if (v2 == 0x747365746378 && v4 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v8 = 0;
  }
  else
  {
    char v6 = sub_23CA0ECB0();
    uint64_t result = swift_bridgeObjectRelease();
    char v8 = v6 ^ 1;
  }
  byte_268BC2CF8 = v8 & 1;
  return result;
}

uint64_t static BarbaraWalters.stopThePresses(for:)(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = (uint64_t (**)(void, void))a1[4];
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(a1, v1);
  return sub_23C9E16E4((uint64_t)v3, v1, v2);
}

void sub_23C9DFCEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  if (qword_268BBDEA0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_23CA0E410();
  __swift_project_value_buffer(v13, (uint64_t)qword_268BBE770);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v14 = sub_23CA0E3F0();
  os_log_type_t v15 = sub_23CA0E710();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v18 = a6;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v16 = 136315906;
    swift_bridgeObjectRetain();
    sub_23C9BC474(a2, a3, &v19);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_23C9BC474(a4, a5, &v19);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_23C9BC474(v18, a7, &v19);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 32) = 1024;
    sub_23CA0E7C0();
    _os_log_impl(&dword_23C9B6000, v14, v15, "SiriTime#%s#%s did AutoBugCapture for %s: %{BOOL}d", (uint8_t *)v16, 0x26u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v17, -1, -1);
    MEMORY[0x23ECEDBE0](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t static BarbaraWalters.tryReport<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[3] = a2;
  v4[4] = a3;
  char v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  char v6 = (void *)swift_task_alloc();
  v4[5] = v6;
  *char v6 = v4;
  v6[1] = sub_23C9E007C;
  return v8(a1);
}

uint64_t sub_23C9E007C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_23C9E01B0, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_23C9E01B0()
{
  uint64_t v1 = *(void **)(v0 + 48);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
  uint64_t v3 = sub_23CA0EC90();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
  }
  else
  {
    uint64_t v4 = (void *)swift_allocError();
    void *v5 = *(void *)(v0 + 16);
  }
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  char v8 = (void *)sub_23CA0CBF0();

  swift_bridgeObjectRetain();
  sub_23C9FDB84(v7, v6, (uint64_t)v8, 0x73u);
  swift_bridgeObjectRelease();

  swift_willThrow();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t static BarbaraWalters.logAndReturnError<A>(context:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, v13, v14);
  uint64_t v15 = sub_23CA0EC90();
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a4);
  }
  else
  {
    uint64_t v16 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v17, v11, a4);
  }
  uint64_t v18 = (void *)sub_23CA0CBF0();

  swift_bridgeObjectRetain();
  sub_23C9FDB84(a1, a2, (uint64_t)v18, 0x73u);

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(v21, a3, a4);
}

unint64_t ABCReport.type.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*(unsigned __int8 *)(v0 + 24) >> 4)
  {
    case 1:
      uint64_t v2 = 0x4972656D6954;
      return v2 & 0xFFFFFFFFFFFFLL | 0x746E000000000000;
    case 2:
      uint64_t v3 = 0x5272656D6954;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7365000000000000;
    case 3:
      uint64_t v2 = 0x496D72616C41;
      return v2 & 0xFFFFFFFFFFFFLL | 0x746E000000000000;
    case 4:
      uint64_t v3 = 0x526D72616C41;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7365000000000000;
    case 5:
      uint64_t v4 = 0x5572656D6954;
      goto LABEL_11;
    case 6:
      uint64_t v4 = 0x556D72616C41;
LABEL_11:
      unint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x646E000000000000;
      break;
    case 7:
      unint64_t result = 0x656C646E61686E55;
      break;
    case 8:
      unint64_t result = 0x614C676F6C616944;
      break;
    case 9:
      unint64_t result = 0x6E65646E65706544;
      break;
    case 0xA:
      return result;
    default:
      unint64_t result = 0x676E696D6954;
      break;
  }
  return result;
}

unint64_t ABCReport.subType.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  unsigned int v3 = *((unsigned __int8 *)v0 + 24);
  unint64_t result = 0x656C646E61686E55;
  switch(v3 >> 4)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 9u:
      if (v0[1])
      {
        unint64_t v5 = 0xD000000000000018;
        BOOL v6 = v0[1] == 1;
        uint64_t v7 = 0x726F727245;
        goto LABEL_4;
      }
      unint64_t result = 0x45726567616E614DLL;
      break;
    case 7u:
      unint64_t result = 0xD000000000000015;
      switch(v3 & 0xF)
      {
        case 1u:
          unint64_t result = 0x6465746365707845;
          break;
        case 2u:
          return result;
        case 3u:
          unint64_t result = 0x656C646E61686E55;
          break;
        case 4u:
          uint64_t v9 = v0[2] | v1;
          if (v9 | v2)
          {
            if (v2 == 1 && v9 == 0) {
              unint64_t result = 0xD00000000000001BLL;
            }
            else {
              unint64_t result = 0xD000000000000013;
            }
          }
          else
          {
            unint64_t result = 0x61437463656A624FLL;
          }
          break;
        default:
          unint64_t result = 0x496E776F6E6B6E55;
          break;
      }
      break;
    case 8u:
      if (v0[1])
      {
        unint64_t v5 = 0xD000000000000011;
        BOOL v6 = v0[1] == 1;
        uint64_t v7 = 0x726F727245656341;
LABEL_4:
        if (v6) {
          unint64_t result = v5;
        }
        else {
          unint64_t result = v7;
        }
      }
      else
      {
        unint64_t result = 0x65736E6F70736552;
      }
      break;
    case 0xAu:
      return result;
    default:
      unint64_t v8 = 0xD000000000000019;
      if (v1) {
        unint64_t v8 = 0xD00000000000001BLL;
      }
      if (v1 == 1) {
        unint64_t result = 0xD00000000000001CLL;
      }
      else {
        unint64_t result = v8;
      }
      break;
  }
  return result;
}

unint64_t TimingErrorSubType.typeDescription.getter()
{
  unint64_t v1 = 0xD000000000000019;
  uint64_t v2 = *(void *)(v0 + 8);
  if (v2) {
    unint64_t v1 = 0xD00000000000001BLL;
  }
  if (v2 == 1) {
    return 0xD00000000000001CLL;
  }
  else {
    return v1;
  }
}

unint64_t UnhandledAbortSubtype.typeDescription.getter()
{
  unint64_t v1 = 0xD000000000000013;
  uint64_t v2 = *v0;
  unint64_t result = 0xD000000000000015;
  switch(*((unsigned char *)v0 + 24))
  {
    case 1:
      unint64_t result = 0x6465746365707845;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x656C646E61686E55;
      break;
    case 4:
      if (v2 == 1 && *(_OWORD *)(v0 + 1) == 0) {
        unint64_t v1 = 0xD00000000000001BLL;
      }
      if (v0[1] | v0[2] | v2) {
        unint64_t result = v1;
      }
      else {
        unint64_t result = 0x61437463656A624FLL;
      }
      break;
    default:
      unint64_t result = 0x496E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t DialogLayerErrorSubType.typeDescription.getter()
{
  unint64_t v1 = 0xD000000000000011;
  if (*(unsigned char *)(v0 + 8) != 1) {
    unint64_t v1 = 0x726F727245656341;
  }
  if (*(unsigned char *)(v0 + 8)) {
    return v1;
  }
  else {
    return 0x65736E6F70736552;
  }
}

uint64_t ErrorSubType.typeDescription.getter()
{
  unint64_t v1 = 0xD000000000000018;
  if (*(unsigned char *)(v0 + 8) != 1) {
    unint64_t v1 = 0x726F727245;
  }
  if (*(unsigned char *)(v0 + 8)) {
    return v1;
  }
  else {
    return 0x45726567616E614DLL;
  }
}

unint64_t ABCReport.context.getter()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  unsigned int v4 = *(unsigned __int8 *)(v0 + 24);
  unint64_t result = 0xD00000000000001DLL;
  switch(v4 >> 4)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 9u:
      unint64_t result = ErrorSubType.context.getter();
      break;
    case 7u:
      unint64_t result = UnhandledAbortSubtype.context.getter();
      break;
    case 8u:
      unint64_t result = DialogLayerErrorSubType.context.getter();
      break;
    case 0xAu:
      return result;
    default:
      if (v2)
      {
        if (v2 == 1)
        {
          sub_23C9E1B84(*(void *)v0, 1, *(void *)(v0 + 16), *(unsigned char *)(v0 + 24), (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
          unint64_t result = 0xD000000000000033;
        }
        else
        {
          sub_23C9E1A50(v1, v2);
          sub_23CA0E8F0();
          sub_23CA0E550();
          sub_23CA0E550();
          sub_23C9E1B84(v1, v2, v3, v4, (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
          unint64_t result = 0;
        }
      }
      else
      {
        sub_23C9E1B84(*(void *)v0, 0, *(void *)(v0 + 16), *(unsigned char *)(v0 + 24), (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
        unint64_t result = 0xD000000000000037;
      }
      break;
  }
  return result;
}

unint64_t TimingErrorSubType.context.getter()
{
  unint64_t result = 0xD000000000000037;
  uint64_t v2 = *(void *)(v0 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      return 0xD000000000000033;
    }
    else
    {
      sub_23CA0E8F0();
      sub_23CA0E550();
      sub_23CA0E550();
      return 0;
    }
  }
  return result;
}

unint64_t UnhandledAbortSubtype.context.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void **)(v0 + 16);
  switch(*(unsigned char *)(v0 + 24))
  {
    case 1:
      unint64_t v14 = 0;
      swift_bridgeObjectRetain();
      sub_23CA0E8F0();
      sub_23CA0E550();
      sub_23CA0E550();
      sub_23C9E1A8C(v1, v2, v3, 1);
      goto LABEL_4;
    case 2:
      swift_bridgeObjectRetain();
      return v1;
    case 3:
      id v4 = v3;
      id v5 = objc_msgSend(v4, sel_underlyingErrors);
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
      uint64_t v7 = sub_23CA0E5B0();

      uint64_t v8 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease();
      sub_23CA0E8F0();
      swift_bridgeObjectRelease();
      if (v8)
      {
        id v9 = objc_msgSend(v4, sel_domain);
        sub_23CA0E4D0();

        sub_23CA0E550();
        swift_bridgeObjectRelease();
        sub_23CA0E550();
        objc_msgSend(v4, sel_code);
        sub_23CA0EB80();
        sub_23CA0E550();
        swift_bridgeObjectRelease();
        sub_23CA0E550();
        id v10 = objc_msgSend(v4, sel_underlyingErrors);
        uint64_t v11 = sub_23CA0E5B0();

        MEMORY[0x23ECECE40](v11, v6);
        swift_bridgeObjectRelease();
      }
      else
      {
        id v12 = objc_msgSend(v4, sel_domain);
        sub_23CA0E4D0();

        sub_23CA0E550();
        swift_bridgeObjectRelease();
        sub_23CA0E550();
        objc_msgSend(v4, sel_code);
        sub_23CA0EB80();
      }
      sub_23CA0E550();
      swift_bridgeObjectRelease();
      sub_23CA0E8F0();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000011;
      sub_23CA0E550();
      sub_23CA0E550();
      sub_23CA0E550();
      swift_bridgeObjectRelease();
      sub_23CA0E550();

      return v14;
    case 4:
      return 0xD000000000000034;
    default:
      sub_23CA0E8F0();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000019;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7A0);
      sub_23CA0E4F0();
      sub_23CA0E550();
      swift_bridgeObjectRelease();
LABEL_4:
      sub_23CA0E550();
      return v14;
  }
}

uint64_t DialogLayerErrorSubType.context.getter()
{
  return sub_23C9E13D0((void (*)(void, uint64_t))sub_23C9E2788, (void (*)(void *, uint64_t))sub_23C9E2784);
}

uint64_t ErrorSubType.context.getter()
{
  return sub_23C9E13D0((void (*)(void, uint64_t))sub_23C9E1AFC, (void (*)(void *, uint64_t))sub_23C9E1A78);
}

uint64_t sub_23C9E13D0(void (*a1)(void, uint64_t), void (*a2)(void *, uint64_t))
{
  id v4 = *(void **)v2;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 8);
  a1(*(void *)v2, v5);
  id v6 = objc_msgSend(v4, sel_underlyingErrors);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
  uint64_t v8 = sub_23CA0E5B0();

  uint64_t v9 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  sub_23CA0E8F0();
  swift_bridgeObjectRelease();
  if (v9)
  {
    id v10 = objc_msgSend(v4, sel_domain);
    sub_23CA0E4D0();

    sub_23CA0E550();
    swift_bridgeObjectRelease();
    sub_23CA0E550();
    objc_msgSend(v4, sel_code);
    sub_23CA0EB80();
    sub_23CA0E550();
    swift_bridgeObjectRelease();
    sub_23CA0E550();
    id v11 = objc_msgSend(v4, sel_underlyingErrors);
    a2(v4, v5);
    uint64_t v12 = sub_23CA0E5B0();

    MEMORY[0x23ECECE40](v12, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = objc_msgSend(v4, sel_domain);
    sub_23CA0E4D0();

    sub_23CA0E550();
    swift_bridgeObjectRelease();
    sub_23CA0E550();
    objc_msgSend(v4, sel_code);
    a2(v4, v5);
    sub_23CA0EB80();
  }
  sub_23CA0E550();
  swift_bridgeObjectRelease();
  return 0x206E69616D6F44;
}

uint64_t sub_23C9E16E4(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, void))
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  if (qword_268BBDEB0 != -1) {
    swift_once();
  }
  if (byte_268BC2CF8 == 1)
  {
    uint64_t v21 = v5;
    if (qword_268BBDEA0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23CA0E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_268BBE770);
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_23C9B6000, v9, v10, "SiriTime initiating AutoBugCapture report...", v11, 2u);
      MEMORY[0x23ECEDBE0](v11, -1, -1);
    }

    uint64_t v24 = a3[1](a2, a3);
    uint64_t v13 = v12;
    uint64_t v23 = a3[2](a2, a3);
    uint64_t v15 = v14;
    uint64_t v22 = a3[3](a2, a3);
    uint64_t v17 = v16;
    if (qword_268BBDEA8 != -1) {
      swift_once();
    }
    sub_23CA0E0D0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_23CA0E0C0();
    uint64_t v18 = (void *)swift_allocObject();
    uint64_t v19 = v23;
    v18[2] = v24;
    v18[3] = v13;
    v18[4] = v19;
    v18[5] = v15;
    v18[6] = v22;
    v18[7] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23CA0E0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    uint64_t v5 = v21;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_23C9E1A50(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23C9E1A64(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23C9E1A78(id a1, unsigned __int8 a2)
{
  if (a2 <= 2u) {
}
  }

void sub_23C9E1A8C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a4 == 3)
  {
    swift_bridgeObjectRelease();
  }
  else if (a4 == 2 || a4 == 1)
  {
    swift_bridgeObjectRelease();
  }
}

id sub_23C9E1AFC(id result, unsigned __int8 a2)
{
  if (a2 <= 2u) {
    return result;
  }
  return result;
}

uint64_t dispatch thunk of Report.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Report.subType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Report.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ReportSubtype.typeDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReportSubtype.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for BarbaraWalters()
{
  return &type metadata for BarbaraWalters;
}

uint64_t sub_23C9E1B84(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, void), uint64_t (*a8)(void))
{
  switch(a4 >> 4)
  {
    case 0:
      uint64_t result = a5();
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      uint64_t result = a6();
      break;
    case 7:
      uint64_t result = a7(result, a2, a3, a4 & 0xF);
      break;
    case 8:
      uint64_t result = a8();
      break;
    default:
      return result;
  }
  return result;
}

void sub_23C9E1C00(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a4 == 3)
  {
    swift_bridgeObjectRetain();
    id v5 = a3;
  }
  else if (a4 == 2 || a4 == 1)
  {
    swift_bridgeObjectRetain();
  }
}

uint64_t destroy for ABCReport(uint64_t a1)
{
  return sub_23C9E1B84(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
}

uint64_t initializeWithCopy for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_23C9E1B84(*(void *)a2, v4, v5, v6, (uint64_t (*)(void))sub_23C9E1A50, (uint64_t (*)(void))sub_23C9E1AFC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1C00, sub_23C9E2788);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_23C9E1B84(*(void *)a2, v4, v5, v6, (uint64_t (*)(void))sub_23C9E1A50, (uint64_t (*)(void))sub_23C9E1AFC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1C00, sub_23C9E2788);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_23C9E1B84(v7, v8, v9, v10, (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_23C9E1B84(v5, v7, v6, v8, (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
  return a1;
}

uint64_t getEnumTagSinglePayload for ABCReport(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x16 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 22);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 24) >> 4) & 0xFFFFFFEF | (16 * ((*(unsigned __int8 *)(a1 + 24) >> 3) & 1))) ^ 0x1F;
  if (v3 >= 0x15) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ABCReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x15)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 22;
    if (a3 >= 0x16) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x16) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(unsigned char *)(result + 24) = 8 * (((-a2 & 0x10) != 0) - 2 * a2);
    }
  }
  return result;
}

uint64_t sub_23C9E200C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 24);
  if (v1 <= 0x9F) {
    return v1 >> 4;
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_23C9E2028(uint64_t result)
{
  *(unsigned char *)(result + 24) &= 0xFu;
  return result;
}

uint64_t sub_23C9E2038(uint64_t result, unsigned int a2)
{
  if (a2 < 0xA)
  {
    *(unsigned char *)(result + 24) = *(unsigned char *)(result + 24) & 7 | (16 * a2);
  }
  else
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 10;
    *(unsigned char *)(result + 24) = -96;
  }
  return result;
}

ValueMetadata *type metadata accessor for ABCReport()
{
  return &type metadata for ABCReport;
}

unint64_t destroy for TimingErrorSubType(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16SiriTimeInternal18TimingErrorSubTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for TimingErrorSubType(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
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

uint64_t assignWithTake for TimingErrorSubType(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TimingErrorSubType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TimingErrorSubType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_23C9E22A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_23C9E22BC(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for TimingErrorSubType()
{
  return &type metadata for TimingErrorSubType;
}

uint64_t initializeBufferWithCopyOfBuffer for ErrorSubType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_23C9E1AFC(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for ErrorSubType(uint64_t a1)
{
}

uint64_t *assignWithCopy for ErrorSubType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23C9E2620(a1, a2, a3, (void (*)(void, void))sub_23C9E1AFC, (void (*)(uint64_t, uint64_t))sub_23C9E1A78);
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t assignWithTake for ErrorSubType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_23C9E1A78(v4, v5);
  return a1;
}

uint64_t sub_23C9E23CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_23C9E23D4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ErrorSubType()
{
  return &type metadata for ErrorSubType;
}

void destroy for UnhandledAbortSubtype(uint64_t a1)
{
}

uint64_t initializeWithCopy for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_23C9E1C00(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_23C9E1C00(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void **)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_23C9E1A8C(v7, v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v6 = *(void **)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_23C9E1A8C(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnhandledAbortSubtype(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UnhandledAbortSubtype(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23C9E25B0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_23C9E25C8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnhandledAbortSubtype()
{
  return &type metadata for UnhandledAbortSubtype;
}

uint64_t *assignWithCopy for DialogLayerErrorSubType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23C9E2620(a1, a2, a3, (void (*)(void, void))sub_23C9E2788, (void (*)(uint64_t, uint64_t))sub_23C9E2784);
}

uint64_t *sub_23C9E2620(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, void), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  unsigned __int8 v8 = *((unsigned char *)a2 + 8);
  a4(*a2, v8);
  uint64_t v9 = *a1;
  *a1 = v7;
  uint64_t v10 = *((unsigned __int8 *)a1 + 8);
  *((unsigned char *)a1 + 8) = v8;
  a5(v9, v10);
  return a1;
}

uint64_t _s16SiriTimeInternal12ErrorSubTypeOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s16SiriTimeInternal12ErrorSubTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogLayerErrorSubType()
{
  return &type metadata for DialogLayerErrorSubType;
}

uint64_t sub_23C9E271C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_23C9E2764(uint64_t a1)
{
  sub_23C9DFCEC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

Swift::String __swiftcall String.labelCapitalization()()
{
  unint64_t v2 = v1;
  unint64_t v3 = v0;
  swift_bridgeObjectRetain();
  sub_23C9D5A48(1, v3, v2, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_23CA0E7B0();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C9D5AE4(1uLL, v3, v2, v8);
  swift_bridgeObjectRelease();
  sub_23C9D5B94();
  swift_bridgeObjectRetain();
  sub_23CA0E540();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v5;
  uint64_t v10 = v7;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

id String.toINSpeakableString.getter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F0FFA0]);
  swift_bridgeObjectRetain();
  unint64_t v1 = (void *)sub_23CA0E4C0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSpokenPhrase_, v1);

  return v2;
}

uint64_t DateTime.asDate()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23CA0CE20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE498);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23CA0CBE0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)(1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23C9BAA2C((uint64_t)v8, &qword_268BBE498);
    uint64_t v13 = sub_23CA0CCB0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_23CA0CDF0();
    sub_23CA0CDC0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_23C9E2B8C()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE7A8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE7A8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t UsoEntity_common_RecurringDateTime.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0DCD0();
  if (!sub_23CA0E040())
  {
    uint64_t v5 = sub_23CA0DFB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_23CA0DFC0();
  swift_release();
  uint64_t v4 = sub_23CA0DFB0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
    return v3;
  }
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
  if (sub_23CA0E040())
  {
    sub_23CA0DF60();
    swift_release();
  }
  return v3;
}

uint64_t TerminalElement.DateTimeValue.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0D6F0();
  if (!sub_23CA0E040())
  {
    uint64_t v5 = sub_23CA0DFB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_23CA0DFC0();
  swift_release();
  uint64_t v4 = sub_23CA0DFB0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
    return v3;
  }
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
  if (sub_23CA0E040())
  {
    sub_23CA0DF60();
    swift_release();
  }
  return v3;
}

uint64_t TerminalElement.Time.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23C9E3078();
  if (!v3) {
    return v3;
  }
  if (!sub_23CA0E040())
  {
    uint64_t v5 = sub_23CA0DFB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_7;
  }
  sub_23CA0DFC0();
  swift_release();
  uint64_t v4 = sub_23CA0DFB0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_7:
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
    return v3;
  }
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBE7C0);
  if (sub_23CA0E040())
  {
    sub_23CA0DF60();
    swift_release();
  }
  return v3;
}

uint64_t sub_23C9E3078()
{
  uint64_t v76 = sub_23CA0CBE0();
  uint64_t v74 = *(void *)(v76 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v76);
  unint64_t v71 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  unint64_t v83 = (char *)&v68 - v3;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE460);
  MEMORY[0x270FA5388](v77);
  unint64_t v78 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_23CA0CCB0();
  uint64_t v5 = *(void *)(v80 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v80);
  uint64_t v72 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v81 = (char *)&v68 - v8;
  uint64_t v73 = sub_23CA0CE20();
  uint64_t v75 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v84 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23CA0D710();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v68 - v15;
  if (qword_268BBDEB8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_23CA0E410();
  uint64_t v18 = __swift_project_value_buffer(v17, (uint64_t)qword_268BBE7A8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v70 = v0;
  v19(v16, v0, v10);
  os_log_t v79 = v18;
  uint64_t v20 = sub_23CA0E3F0();
  os_log_type_t v21 = sub_23CA0E710();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v82 = v5;
  if (v22)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    v86[0] = v69;
    *(_DWORD *)uint64_t v23 = 136315138;
    char v68 = v23 + 4;
    v19(v14, (uint64_t)v16, v10);
    uint64_t v24 = sub_23CA0E4F0();
    uint64_t v85 = sub_23C9BC474(v24, v25, v86);
    uint64_t v5 = v82;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    _os_log_impl(&dword_23C9B6000, v20, v21, "TerminalElement.Time converting to DateTime: %s", v23, 0xCu);
    uint64_t v26 = v69;
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v26, -1, -1);
    MEMORY[0x23ECEDBE0](v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }

  sub_23CA0CDF0();
  uint64_t v27 = v83;
  uint64_t v28 = v80;
  unint64_t v29 = v81;
  uint64_t v30 = (uint64_t)v78;
  if (qword_268BBDE78 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v77, (uint64_t)qword_268BC2CE0);
  sub_23C9BFA3C(v31, v30);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v30, 1, v28) == 1)
  {
    sub_23C9BAA2C(v30, &qword_268BBE460);
    sub_23CA0CCA0();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v29, v30, v28);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7E8);
  uint64_t v32 = sub_23CA0CE10();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(void *)(v33 + 72);
  unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_23CA0F910;
  unint64_t v37 = v36 + v35;
  uint64_t v38 = *(void (**)(unint64_t, void, uint64_t))(v33 + 104);
  v38(v37, *MEMORY[0x263F078A0], v32);
  v38(v37 + v34, *MEMORY[0x263F078A8], v32);
  v38(v37 + 2 * v34, *MEMORY[0x263F07870], v32);
  sub_23C9F7478(v36);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23CA0CD90();
  swift_bridgeObjectRelease();
  sub_23CA0CAF0();
  if (v39 & 1) != 0 || (sub_23CA0CB60(), (v40) || (uint64_t v41 = sub_23CA0CB40(), (v42))
  {
    uint64_t v54 = v82;
    uint64_t v55 = v72;
    (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v72, v29, v28);
    uint64_t v56 = sub_23CA0E3F0();
    os_log_type_t v57 = sub_23CA0E700();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v86[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      sub_23C9C0E9C(&qword_268BBE480, MEMORY[0x263F07490]);
      uint64_t v60 = sub_23CA0EB80();
      uint64_t v85 = sub_23C9BC474(v60, v61, v86);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      uint64_t v62 = *(void (**)(char *, uint64_t))(v54 + 8);
      v62(v55, v28);
      _os_log_impl(&dword_23C9B6000, v56, v57, "Unable to parse date from defaultAnchorDate: %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v59, -1, -1);
      MEMORY[0x23ECEDBE0](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v83, v76);
      v62(v81, v28);
    }
    else
    {

      uint64_t v63 = *(void (**)(char *, uint64_t))(v54 + 8);
      v63(v55, v28);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v83, v76);
      v63(v29, v28);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v84, v73);
    return 0;
  }
  else
  {
    unint64_t v78 = (char *)v41;
    uint64_t v43 = v74;
    uint64_t v44 = v71;
    uint64_t v45 = v27;
    uint64_t v46 = v76;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v71, v45, v76);
    uint64_t v47 = sub_23CA0E3F0();
    os_log_type_t v48 = sub_23CA0E710();
    if (os_log_type_enabled(v47, v48))
    {
      os_log_t v79 = v47;
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      v86[0] = v77;
      *(_DWORD *)uint64_t v49 = 136315138;
      sub_23C9C0E9C(&qword_268BBE478, MEMORY[0x263F063B0]);
      uint64_t v50 = sub_23CA0EB80();
      uint64_t v85 = sub_23C9BC474(v50, v51, v86);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      unint64_t v52 = *(void (**)(char *, uint64_t))(v43 + 8);
      v52(v71, v46);
      uint64_t v47 = v79;
      _os_log_impl(&dword_23C9B6000, v79, v48, "Extracted date components from anchor: %s", v49, 0xCu);
      uint64_t v53 = v77;
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v53, -1, -1);
      MEMORY[0x23ECEDBE0](v49, -1, -1);
    }
    else
    {
      unint64_t v52 = *(void (**)(char *, uint64_t))(v43 + 8);
      v52(v44, v46);
    }

    uint64_t v66 = v82;
    uint64_t v67 = v73;
    sub_23CA0DF30();
    swift_allocObject();
    sub_23CA0DF20();
    sub_23CA0D700();
    sub_23CA0E050();
    swift_allocObject();
    uint64_t v64 = sub_23CA0DEE0();
    v52(v83, v46);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v80);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v84, v67);
  }
  return v64;
}

uint64_t DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v86 = a1;
  uint64_t v89 = a2;
  uint64_t v3 = sub_23CA0DFB0();
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v82 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v75 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE468);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v88 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE470);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v87 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23CA0CBE0();
  uint64_t v90 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7C0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  unint64_t v83 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v75 - v18;
  if (sub_23CA0E040())
  {
    uint64_t v20 = sub_23CA0DF90();
    uint64_t v81 = v2;
    if (v21)
    {
      if (qword_268BBDEB8 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_23CA0E410();
      __swift_project_value_buffer(v26, (uint64_t)qword_268BBE7A8);
      uint64_t v27 = sub_23CA0E3F0();
      os_log_type_t v28 = sub_23CA0E710();
      if (os_log_type_enabled(v27, v28))
      {
        unint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v85 = v7;
        uint64_t v30 = v3;
        uint64_t v31 = v14;
        uint64_t v32 = v12;
        uint64_t v33 = v29;
        *(_WORD *)unint64_t v29 = 0;
        _os_log_impl(&dword_23C9B6000, v27, v28, "dateComponentsIn24HourClock: Inferring 0 for undefined minutes", v29, 2u);
        uint64_t v34 = v33;
        uint64_t v12 = v32;
        uint64_t v14 = v31;
        uint64_t v3 = v30;
        uint64_t v7 = v85;
        MEMORY[0x23ECEDBE0](v34, -1, -1);
      }

      uint64_t v85 = 0;
    }
    else
    {
      uint64_t v85 = (char *)v20;
    }
    uint64_t v35 = sub_23CA0DF80();
    if ((v36 & 1) == 0)
    {
      uint64_t v80 = v35;
      if (qword_268BBDEB8 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_23CA0E410();
      uint64_t v38 = __swift_project_value_buffer(v37, (uint64_t)qword_268BBE7A8);
      swift_retain_n();
      uint64_t v79 = v38;
      char v39 = sub_23CA0E3F0();
      os_log_type_t v40 = sub_23CA0E710();
      BOOL v41 = os_log_type_enabled(v39, v40);
      uint64_t v78 = v3;
      if (v41)
      {
        uint64_t v42 = swift_slowAlloc();
        uint64_t v76 = v14;
        uint64_t v43 = v42;
        uint64_t v75 = swift_slowAlloc();
        v93[0] = v75;
        *(_DWORD *)uint64_t v43 = 134218754;
        uint64_t v92 = v80;
        uint64_t v77 = v12;
        sub_23CA0E7C0();
        *(_WORD *)(v43 + 12) = 2048;
        uint64_t v92 = (uint64_t)v85;
        sub_23CA0E7C0();
        *(_WORD *)(v43 + 22) = 2080;
        sub_23CA0DFC0();
        uint64_t v44 = sub_23CA0E790();
        unint64_t v46 = v45;
        sub_23C9BAA2C((uint64_t)v19, &qword_268BBE7C0);
        uint64_t v92 = sub_23C9BC474(v44, v46, v93);
        uint64_t v12 = v77;
        sub_23CA0E7C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 32) = 1024;
        LOBYTE(v44) = sub_23CA0DF50();
        swift_release();
        LODWORD(v92) = v44 & 1;
        sub_23CA0E7C0();
        swift_release();
        _os_log_impl(&dword_23C9B6000, v39, v40, "dateComponentsIn24HourClock: Hour = %ld, minute = %ld, meridiem = %s, meridiemSetByUser = %{BOOL}d", (uint8_t *)v43, 0x26u);
        uint64_t v47 = v75;
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v47, -1, -1);
        uint64_t v48 = v43;
        uint64_t v14 = v76;
        MEMORY[0x23ECEDBE0](v48, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      uint64_t v53 = sub_23CA0CE20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v87, 1, 1, v53);
      uint64_t v54 = sub_23CA0CE40();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v88, 1, 1, v54);
      sub_23CA0CBD0();
      if (sub_23CA0E030())
      {
        sub_23CA0DF10();
        if ((v55 & 1) == 0) {
          sub_23CA0CB70();
        }
        sub_23CA0DEF0();
        if ((v56 & 1) == 0) {
          sub_23CA0CB00();
        }
        sub_23CA0DF00();
        if ((v57 & 1) == 0) {
          sub_23CA0CB50();
        }
        swift_release();
      }
      sub_23CA0CB80();
      if ((sub_23CA0DF50() & 1) != 0 || (v86) && v80 && (unint64_t)(v80 - 13) > 0xA && v80 != 24)
      {
        uint64_t v68 = (uint64_t)v83;
        sub_23CA0DFC0();
        uint64_t v69 = v78;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v68, 1, v78) != 1)
        {
          uint64_t v70 = v84;
          (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v7, v68, v69);
          unint64_t v71 = v82;
          (*(void (**)(char *, void, uint64_t))(v70 + 104))(v82, *MEMORY[0x263F6D580], v69);
          sub_23C9C0E9C(&qword_268BBE7D8, MEMORY[0x263F6D588]);
          uint64_t v85 = v7;
          sub_23CA0E580();
          sub_23CA0E580();
          uint64_t v72 = v93[0];
          uint64_t v73 = v92;
          uint64_t v74 = *(void (**)(char *, uint64_t))(v70 + 8);
          v74(v71, v69);
          if (v72 == v73 && v80 != 12)
          {
            uint64_t result = v80 + 12;
            if (__OFADD__(v80, 12))
            {
              __break(1u);
              return result;
            }
          }
          sub_23CA0CB30();
          v74(v85, v69);
          goto LABEL_35;
        }
        sub_23C9BAA2C(v68, &qword_268BBE7C0);
      }
      sub_23CA0CB30();
LABEL_35:
      uint64_t v58 = sub_23CA0E3F0();
      os_log_type_t v59 = sub_23CA0E710();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        v93[0] = v61;
        *(_DWORD *)uint64_t v60 = 136315138;
        swift_beginAccess();
        sub_23C9C0E9C(&qword_268BBE478, MEMORY[0x263F063B0]);
        uint64_t v62 = sub_23CA0EB80();
        uint64_t v91 = sub_23C9BC474(v62, v63, v93);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C9B6000, v58, v59, "dateComponentsIn24HourClock: Got dateComponents: %s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v61, -1, -1);
        MEMORY[0x23ECEDBE0](v60, -1, -1);
        swift_release();
      }
      else
      {

        swift_release();
      }
      swift_beginAccess();
      uint64_t v67 = v89;
      (*(void (**)(uint64_t, char *, uint64_t))(v90 + 16))(v89, v14, v12);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v90 + 56))(v67, 0, 1, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v14, v12);
    }
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_23CA0E410();
    __swift_project_value_buffer(v49, (uint64_t)qword_268BBE7A8);
    uint64_t v50 = sub_23CA0E3F0();
    os_log_type_t v51 = sub_23CA0E700();
    if (os_log_type_enabled(v50, v51))
    {
      unint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v52 = 0;
      _os_log_impl(&dword_23C9B6000, v50, v51, "dateComponentsIn24HourClock: Can't parse inferred dateTime, inferred dateTime has no valid hour/minute.", v52, 2u);
      MEMORY[0x23ECEDBE0](v52, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_23CA0E410();
    __swift_project_value_buffer(v22, (uint64_t)qword_268BBE7A8);
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v24 = sub_23CA0E710();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_23C9B6000, v23, v24, "dateComponentsIn24HourClock: Can NOT get time from inferred dateTime.", v25, 2u);
      MEMORY[0x23ECEDBE0](v25, -1, -1);
    }
  }
  uint64_t v64 = v89;
  char v65 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v90 + 56);
  return v65(v64, 1, 1, v12);
}

INDateComponentsRange_optional __swiftcall DateTime.toINAlarmSearchDateTime(isTimeRange:)(Swift::Bool isTimeRange)
{
  if (isTimeRange)
  {
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_23CA0E410();
    __swift_project_value_buffer(v1, (uint64_t)qword_268BBE7A8);
    swift_retain_n();
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v3 = sub_23CA0E710();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v18 = v5;
      *(_DWORD *)uint64_t v4 = 136315138;
      if (sub_23CA0E010())
      {
        uint64_t v6 = sub_23CA0DFE0();
        unint64_t v8 = v7;
        swift_release();
      }
      else
      {
        uint64_t v6 = 0;
        unint64_t v8 = 0xE000000000000000;
      }
      sub_23C9BC474(v6, v8, &v18);
      sub_23CA0E7C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v2, v3, "Found time range info from SiriInference: %s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v5, -1, -1);
      MEMORY[0x23ECEDBE0](v4, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    v17.value = DateTime.asDateComponentsRange()();
  }
  else
  {
    if (qword_268BBDEB8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_23CA0E410();
    __swift_project_value_buffer(v9, (uint64_t)qword_268BBE7A8);
    swift_retain_n();
    uint64_t v10 = sub_23CA0E3F0();
    os_log_type_t v11 = sub_23CA0E710();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v18 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      if (sub_23CA0E040())
      {
        uint64_t v14 = sub_23CA0DF40();
        unint64_t v16 = v15;
        swift_release();
      }
      else
      {
        uint64_t v14 = 0;
        unint64_t v16 = 0xE000000000000000;
      }
      sub_23C9BC474(v14, v16, &v18);
      sub_23CA0E7C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v10, v11, "Found time point info from SiriInference: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v13, -1, -1);
      MEMORY[0x23ECEDBE0](v12, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(0, 0);
  }
  return v17;
}

Swift::Bool __swiftcall DateTime.isValidForReformationFromTimer()()
{
  uint64_t v0 = sub_23CA0E040();
  if (v0)
  {
    sub_23CA0DF80();
    char v2 = v1;
    swift_release();
    LOBYTE(v0) = (v2 & 1) == 0;
  }
  return v0;
}

uint64_t DateTime.Time.dateComponents()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE468);
  MEMORY[0x270FA5388](v0 - 8);
  char v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE470);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CA0CE20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = sub_23CA0CE40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  sub_23C9C0BF0(0);
  sub_23CA0DF90();
  sub_23CA0DFA0();
  return sub_23CA0CBD0();
}

uint64_t sub_23C9E4E64()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE7F0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE7F0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t YesNoSearchWindowStrategy.__allocating_init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  uint64_t v20 = sub_23CA0D380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v19, a1, v20);
  sub_23C9BB9E8(a2, v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  char v21 = (void *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer);
  *char v21 = a3;
  v21[1] = a4;
  uint64_t v22 = (void *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer);
  *uint64_t v22 = a5;
  v22[1] = a6;
  uint64_t v23 = (void *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput);
  *uint64_t v23 = a7;
  v23[1] = a8;
  os_log_type_t v24 = (void *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation);
  *os_log_type_t v24 = a9;
  v24[1] = a10;
  unint64_t v25 = (void *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer);
  void *v25 = a11;
  v25[1] = a12;
  return v18;
}

uint64_t YesNoSearchWindowStrategy.init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v19 = v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  uint64_t v20 = sub_23CA0D380();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v19, a1, v20);
  sub_23C9BB9E8(a2, v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  char v21 = (void *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer);
  *char v21 = a3;
  v21[1] = a4;
  uint64_t v22 = (void *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer);
  *uint64_t v22 = a5;
  v22[1] = a6;
  uint64_t v23 = (void *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput);
  *uint64_t v23 = a7;
  v23[1] = a8;
  os_log_type_t v24 = (void *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation);
  *os_log_type_t v24 = a9;
  v24[1] = a10;
  unint64_t v25 = (void *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer);
  void *v25 = a11;
  v25[1] = a12;
  return v12;
}

uint64_t YesNoSearchWindowStrategy.makePromptForYesNoResponse()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E51D4, 0, 0);
}

uint64_t sub_23C9E51D4()
{
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(*(void *)(v0 + 24)
                                     + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer)
                         + **(int **)(*(void *)(v0 + 24)
                                    + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C9E52AC;
  return v3();
}

uint64_t sub_23C9E52AC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23C9E53E0, 0, 0);
  }
}

uint64_t sub_23C9E53E0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator + 24);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator), v2);
  uint64_t v4 = v1 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  void *v5 = v0;
  v5[1] = sub_23C9E54BC;
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[2];
  return MEMORY[0x270F67AD8](v7, v6, v4, v2, v3);
}

uint64_t sub_23C9E54BC()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_23C9E5634;
  }
  else {
    uint64_t v2 = sub_23C9E55D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23C9E55D0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9E5634()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t YesNoSearchWindowStrategy.actionForInput(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v135 = a1;
  uint64_t v126 = sub_23CA0D430();
  uint64_t v129 = *(void (**)(char *, uint64_t))(v126 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v126);
  uint64_t v118 = (char *)&v114 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v128 = (char *)&v114 - v3;
  uint64_t v133 = sub_23CA0D570();
  uint64_t v120 = *(void *)(v133 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v133);
  unint64_t v125 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v127 = (char *)&v114 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v130 = (char *)&v114 - v8;
  uint64_t v121 = sub_23CA0D4B0();
  uint64_t v132 = *(void *)(v121 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v121);
  long long v117 = (char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v119 = (char *)&v114 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v131 = (char *)&v114 - v13;
  uint64_t v14 = sub_23CA0D470();
  uint64_t v122 = *(void *)(v14 - 8);
  uint64_t v123 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v124 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23CA0D440();
  uint64_t v136 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v114 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  unint64_t v25 = (char *)&v114 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  os_log_type_t v28 = (char *)&v114 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v114 - v29;
  uint64_t v31 = sub_23CA0DE00();
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v114 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0D3E0();
  uint64_t v35 = v136;
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v136 + 88))(v30, v16);
  if (v36 == *MEMORY[0x263F6FF50])
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v19, v30, v16);
    (*(void (**)(char *, uint64_t))(v35 + 96))(v19, v16);
LABEL_5:
    uint64_t v40 = v134;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v34, v19, v31);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v16);
    (*(void (**)(char *))(v40
                                   + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput))(v34);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v34, v31);
  }
  uint64_t v37 = v25;
  uint64_t v116 = v22;
  char v39 = v131;
  uint64_t v38 = v132;
  if (v36 == *MEMORY[0x263F6FF78])
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v19, v30, v16);
    (*(void (**)(char *, uint64_t))(v35 + 96))(v19, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE848);
    swift_release();
    goto LABEL_5;
  }
  if (v36 == *MEMORY[0x263F6FF70])
  {
    uint64_t v42 = v116;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v116, v30, v16);
    uint64_t v43 = v35;
    (*(void (**)(char *, uint64_t))(v35 + 96))(v42, v16);
    uint64_t v44 = v126;
    (*((void (**)(char *, char *, uint64_t))v129 + 2))(v128, v42, v126);
    uint64_t v45 = sub_23CA0D410();
    uint64_t v47 = v46;
    uint64_t v48 = (void *)sub_23CA0CFE0();
    id v49 = objc_msgSend(v48, sel_identifier);

    uint64_t v50 = sub_23CA0E4D0();
    uint64_t v52 = v51;

    if (v45 == v50 && v47 == v52)
    {
      swift_bridgeObjectRelease_n();
LABEL_15:
      sub_23CA0D130();
      char v55 = (void (*)(char *, uint64_t))*((void *)v129 + 1);
      v55(v128, v44);
      v55(v116, v44);
      return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v30, v16);
    }
    char v54 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v54) {
      goto LABEL_15;
    }
    uint64_t v115 = v30;
    uint64_t v71 = v44;
    uint64_t v72 = (void (*)(char *, uint64_t))*((void *)v129 + 1);
    v72(v128, v71);
    uint64_t v73 = sub_23CA0D410();
    uint64_t v75 = v74;
    uint64_t v76 = (void *)sub_23CA0D000();
    id v77 = objc_msgSend(v76, sel_identifier);

    uint64_t v78 = sub_23CA0E4D0();
    uint64_t v80 = v79;

    if (v73 == v78 && v75 == v80)
    {
      uint64_t v81 = v116;
LABEL_25:
      swift_bridgeObjectRelease_n();
      goto LABEL_32;
    }
    char v82 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v82)
    {
      uint64_t v81 = v116;
LABEL_32:
      v72(v81, v126);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v115, v16);
      return sub_23CA0D140();
    }
    uint64_t v104 = v16;
    (*((void (**)(char *, char *, uint64_t))v129 + 4))(v118, v116, v126);
    uint64_t v105 = sub_23CA0D410();
    uint64_t v107 = v106;
    uint64_t v108 = (void *)sub_23CA0CFF0();
    id v109 = objc_msgSend(v108, sel_identifier);

    uint64_t v110 = sub_23CA0E4D0();
    uint64_t v112 = v111;

    if (v105 == v110 && v107 == v112)
    {
      uint64_t v81 = v118;
      uint64_t v16 = v104;
      goto LABEL_25;
    }
    char v113 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = v104;
    if (v113)
    {
      uint64_t v81 = v118;
      goto LABEL_32;
    }
    v72(v118, v126);
    uint64_t v35 = v43;
    uint64_t v30 = v115;
    goto LABEL_59;
  }
  if (v36 == *MEMORY[0x263F6FF58])
  {
    uint64_t v53 = v37;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v30, v16);
    (*(void (**)(char *, uint64_t))(v35 + 96))(v53, v16);
    self;
    if (swift_dynamicCastObjCClass())
    {
      sub_23CA0D130();
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v30, v16);
    }
    self;
    if (swift_dynamicCastObjCClass() || (self, swift_dynamicCastObjCClass()))
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v16);
      swift_unknownObjectRelease();
      return sub_23CA0D140();
    }
    swift_unknownObjectRelease();
LABEL_59:
    sub_23CA0D150();
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v30, v16);
  }
  if (v36 != *MEMORY[0x263F6FF80]) {
    goto LABEL_59;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v28, v30, v16);
  char v56 = *(void (**)(char *, uint64_t))(v35 + 96);
  uint64_t v134 = v16;
  v56(v28, v16);
  char v57 = v124;
  (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v124, v28, v123);
  sub_23CA0D460();
  uint64_t v58 = sub_23CA0D4A0();
  os_log_type_t v59 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v60 = v121;
  v59(v39, v121);
  uint64_t v61 = *(void *)(v58 + 16);
  uint64_t v132 = v38 + 8;
  uint64_t v129 = v59;
  if (!v61)
  {
    swift_bridgeObjectRelease();
    uint64_t v69 = v133;
    uint64_t v70 = v119;
LABEL_34:
    sub_23CA0D460();
    uint64_t v83 = sub_23CA0D4A0();
    v59(v70, v60);
    uint64_t v84 = *(void *)(v83 + 16);
    uint64_t v115 = v30;
    if (v84)
    {
      uint64_t v85 = *(void (**)(char *, unint64_t, uint64_t))(v120 + 16);
      unint64_t v86 = v83 + ((*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80));
      uint64_t v87 = (void (**)(char *, uint64_t))(v120 + 8);
      uint64_t v88 = *(void *)(v120 + 72);
      swift_bridgeObjectRetain();
      uint64_t v89 = v127;
      uint64_t v90 = v133;
      while (1)
      {
        v85(v89, v86, v90);
        char v91 = sub_23CA0D510();
        (*v87)(v89, v90);
        if (v91) {
          break;
        }
        v86 += v88;
        if (!--v84)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v69 = v133;
          uint64_t v92 = v134;
          uint64_t v30 = v115;
          uint64_t v93 = v120;
          uint64_t v60 = v121;
          char v57 = v124;
          goto LABEL_41;
        }
      }
      swift_bridgeObjectRelease_n();
      sub_23CA0D140();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v92 = v134;
      uint64_t v93 = v120;
LABEL_41:
      uint64_t v94 = v117;
      sub_23CA0D460();
      uint64_t v95 = sub_23CA0D4A0();
      v129(v94, v60);
      uint64_t v96 = *(void *)(v95 + 16);
      if (!v96)
      {
        swift_bridgeObjectRelease();
LABEL_51:
        sub_23CA0D150();
        (*(void (**)(char *, uint64_t))(v122 + 8))(v57, v123);
        return (*(uint64_t (**)(char *, uint64_t))(v136 + 8))(v30, v92);
      }
      uint64_t v99 = *(void (**)(char *, unint64_t, uint64_t))(v93 + 16);
      uint64_t v98 = v93 + 16;
      BOOL v97 = v99;
      unint64_t v100 = v95 + ((*(unsigned __int8 *)(v98 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 64));
      uint64_t v101 = *(void *)(v98 + 56);
      swift_bridgeObjectRetain();
      uint64_t v102 = v125;
      while (1)
      {
        v97(v102, v100, v69);
        char v103 = sub_23CA0D520();
        (*(void (**)(char *, uint64_t))(v98 - 8))(v102, v69);
        if (v103) {
          break;
        }
        v100 += v101;
        if (!--v96)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v92 = v134;
          uint64_t v30 = v115;
          char v57 = v124;
          goto LABEL_51;
        }
      }
      swift_bridgeObjectRelease_n();
      sub_23CA0D130();
    }
    (*(void (**)(char *, uint64_t))(v122 + 8))(v124, v123);
    return (*(uint64_t (**)(char *, uint64_t))(v136 + 8))(v115, v134);
  }
  uint64_t v62 = *(void (**)(char *, unint64_t, uint64_t))(v120 + 16);
  unint64_t v63 = v58 + ((*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80));
  uint64_t v64 = (void (**)(char *, uint64_t))(v120 + 8);
  uint64_t v65 = *(void *)(v120 + 72);
  unint64_t v131 = (char *)v58;
  swift_bridgeObjectRetain();
  uint64_t v66 = v130;
  uint64_t v67 = v133;
  while (1)
  {
    v62(v66, v63, v67);
    char v68 = sub_23CA0D500();
    (*v64)(v66, v67);
    if (v68) {
      break;
    }
    v63 += v65;
    if (!--v61)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v69 = v133;
      char v57 = v124;
      uint64_t v60 = v121;
      uint64_t v70 = v119;
      os_log_type_t v59 = v129;
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRelease_n();
  sub_23CA0D140();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v124, v123);
  return (*(uint64_t (**)(char *, uint64_t))(v136 + 8))(v30, v134);
}

uint64_t YesNoSearchWindowStrategy.parseConfirmationResponse(input:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_23CA0D430();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE858);
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_23CA0D570();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v6 = sub_23CA0D4B0();
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  uint64_t v7 = sub_23CA0D470();
  v3[18] = v7;
  v3[19] = *(void *)(v7 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v8 = sub_23CA0D440();
  v3[21] = v8;
  v3[22] = *(void *)(v8 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  uint64_t v9 = sub_23CA0DE00();
  v3[28] = v9;
  v3[29] = *(void *)(v9 - 8);
  v3[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9E67E0, 0, 0);
}

uint64_t sub_23C9E67E0()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  sub_23CA0D3E0();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v4 == *MEMORY[0x263F6FF50])
  {
    uint64_t v6 = v0[22];
    uint64_t v5 = v0[23];
    uint64_t v7 = v0[21];
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v5, v0[27], v7);
    (*(void (**)(uint64_t, uint64_t))(v6 + 96))(v5, v7);
LABEL_5:
    uint64_t v11 = v0[27];
    uint64_t v12 = v0[22];
    uint64_t v13 = v0[21];
    uint64_t v14 = v0[4];
    (*(void (**)(void, void, void))(v0[29] + 32))(v0[30], v0[23], v0[28]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v142 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v14
                                                                + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation)
                                                    + **(int **)(v14
                                                               + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation));
    uint64_t v15 = (void *)swift_task_alloc();
    v0[31] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_23C9E75B4;
    uint64_t v16 = v0[30];
    uint64_t v17 = v0[2];
    return v142(v17, v16);
  }
  if (v4 == *MEMORY[0x263F6FF78])
  {
    uint64_t v9 = v0[22];
    uint64_t v8 = v0[23];
    uint64_t v10 = v0[21];
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v8, v0[27], v10);
    (*(void (**)(uint64_t, uint64_t))(v9 + 96))(v8, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE848);
    swift_release();
    goto LABEL_5;
  }
  if (v4 != *MEMORY[0x263F6FF70])
  {
    if (v4 == *MEMORY[0x263F6FF58])
    {
      uint64_t v33 = v0[25];
      uint64_t v34 = v0[21];
      uint64_t v35 = v0[22];
      (*(void (**)(uint64_t, void, uint64_t))(v35 + 16))(v33, v0[27], v34);
      (*(void (**)(uint64_t, uint64_t))(v35 + 96))(v33, v34);
      self;
      if (swift_dynamicCastObjCClass())
      {
        uint64_t v36 = v0[27];
        uint64_t v37 = v0[21];
        uint64_t v38 = v0[22];
        uint64_t v39 = v0[9];
        uint64_t v40 = (unsigned int *)MEMORY[0x263F6FC98];
      }
      else
      {
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_48;
        }
        uint64_t v36 = v0[27];
        uint64_t v37 = v0[21];
        uint64_t v38 = v0[22];
        uint64_t v39 = v0[9];
        uint64_t v40 = (unsigned int *)MEMORY[0x263F6FC90];
      }
      uint64_t v85 = *v40;
      uint64_t v86 = sub_23CA0D2B0();
      uint64_t v87 = *(void *)(v86 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 104))(v39, v85, v86);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v87 + 56))(v39, 0, 1, v86);
      sub_23CA0D3D0();
      swift_unknownObjectRelease();
LABEL_46:
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
      goto LABEL_55;
    }
    if (v4 != *MEMORY[0x263F6FF80]) {
      goto LABEL_48;
    }
    uint64_t v51 = v0[26];
    uint64_t v52 = v0[21];
    uint64_t v53 = v0[22];
    uint64_t v55 = v0[19];
    uint64_t v54 = v0[20];
    uint64_t v57 = v0[17];
    uint64_t v56 = v0[18];
    uint64_t v58 = v0[14];
    uint64_t v59 = v0[15];
    (*(void (**)(uint64_t, void, uint64_t))(v53 + 16))(v51, v0[27], v52);
    (*(void (**)(uint64_t, uint64_t))(v53 + 96))(v51, v52);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32))(v54, v51, v56);
    sub_23CA0D460();
    uint64_t v60 = sub_23CA0D4A0();
    uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v61(v57, v58);
    uint64_t v62 = *(void *)(v60 + 16);
    if (v62)
    {
      unint64_t v137 = v61;
      uint64_t v63 = v0[11];
      uint64_t v66 = *(void (**)(uint64_t, unint64_t, uint64_t))(v63 + 16);
      uint64_t v65 = v63 + 16;
      uint64_t v64 = v66;
      unint64_t v67 = v60 + ((*(unsigned __int8 *)(v65 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 64));
      uint64_t v68 = *(void *)(v65 + 56);
      swift_bridgeObjectRetain();
      while (1)
      {
        uint64_t v69 = v0[13];
        uint64_t v70 = v0[10];
        v64(v69, v67, v70);
        char v71 = sub_23CA0D500();
        (*(void (**)(uint64_t, uint64_t))(v65 - 8))(v69, v70);
        if (v71) {
          break;
        }
        v67 += v68;
        if (!--v62)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v61 = v137;
          goto LABEL_33;
        }
      }
      uint64_t v108 = v0[22];
      uint64_t v139 = v0[21];
      uint64_t v141 = v0[27];
      uint64_t v109 = v0[19];
      uint64_t v110 = v0[20];
      uint64_t v111 = v0[18];
      uint64_t v112 = v0[9];
      swift_bridgeObjectRelease_n();
      char v113 = (unsigned int *)MEMORY[0x263F6FC98];
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_33:
      uint64_t v95 = v0[16];
      uint64_t v96 = v0[14];
      sub_23CA0D460();
      uint64_t v97 = sub_23CA0D4A0();
      v61(v95, v96);
      uint64_t v98 = *(void *)(v97 + 16);
      if (!v98)
      {
        swift_bridgeObjectRelease();
LABEL_41:
        if (qword_268BBDEC0 != -1) {
          swift_once();
        }
        uint64_t v114 = sub_23CA0E410();
        __swift_project_value_buffer(v114, (uint64_t)qword_268BBE7F0);
        uint64_t v115 = sub_23CA0E3F0();
        os_log_type_t v116 = sub_23CA0E6F0();
        if (os_log_type_enabled(v115, v116))
        {
          long long v117 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v117 = 0;
          _os_log_impl(&dword_23C9B6000, v115, v116, "Unable to parse a confirmation response from the given USO parse", v117, 2u);
          MEMORY[0x23ECEDBE0](v117, -1, -1);
        }
        uint64_t v36 = v0[27];
        uint64_t v37 = v0[21];
        uint64_t v38 = v0[22];
        uint64_t v119 = v0[19];
        uint64_t v118 = v0[20];
        uint64_t v120 = v0[18];
        uint64_t v121 = v0[9];

        uint64_t v122 = sub_23CA0D2B0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v122 - 8) + 56))(v121, 1, 1, v122);
        sub_23CA0D3D0();
        (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v118, v120);
        goto LABEL_46;
      }
      uint64_t v99 = v0[11];
      uint64_t v102 = *(void (**)(uint64_t, unint64_t, uint64_t))(v99 + 16);
      uint64_t v100 = v99 + 16;
      uint64_t v101 = v102;
      unint64_t v103 = v97 + ((*(unsigned __int8 *)(v100 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 64));
      uint64_t v104 = *(void *)(v100 + 56);
      swift_bridgeObjectRetain();
      while (1)
      {
        uint64_t v105 = v0[12];
        uint64_t v106 = v0[10];
        v101(v105, v103, v106);
        char v107 = sub_23CA0D510();
        (*(void (**)(uint64_t, uint64_t))(v100 - 8))(v105, v106);
        if (v107) {
          break;
        }
        v103 += v104;
        if (!--v98)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_41;
        }
      }
      uint64_t v108 = v0[22];
      uint64_t v139 = v0[21];
      uint64_t v141 = v0[27];
      uint64_t v109 = v0[19];
      uint64_t v110 = v0[20];
      uint64_t v111 = v0[18];
      uint64_t v112 = v0[9];
      swift_bridgeObjectRelease_n();
      char v113 = (unsigned int *)MEMORY[0x263F6FC90];
    }
    uint64_t v132 = *v113;
    uint64_t v133 = sub_23CA0D2B0();
    uint64_t v134 = *(void *)(v133 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v134 + 104))(v112, v132, v133);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v134 + 56))(v112, 0, 1, v133);
    sub_23CA0D3D0();
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v110, v111);
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v141, v139);
    goto LABEL_55;
  }
  uint64_t v19 = v0[24];
  uint64_t v20 = v0[21];
  uint64_t v21 = v0[22];
  uint64_t v22 = v0[8];
  uint64_t v23 = v0[5];
  uint64_t v24 = v0[6];
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 16))(v19, v0[27], v20);
  (*(void (**)(uint64_t, uint64_t))(v21 + 96))(v19, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v19, v23);
  uint64_t v25 = sub_23CA0D410();
  uint64_t v27 = v26;
  os_log_type_t v28 = (void *)sub_23CA0D000();
  id v29 = objc_msgSend(v28, sel_identifier);

  uint64_t v30 = sub_23CA0E4D0();
  uint64_t v32 = v31;

  if (v25 != v30 || v27 != v32)
  {
    char v41 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v41) {
      goto LABEL_16;
    }
    uint64_t v72 = v0[24];
    uint64_t v73 = v0[7];
    uint64_t v74 = v0[5];
    uint64_t v75 = v0[6];
    uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
    v76(v0[8], v74);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v75 + 32))(v73, v72, v74);
    uint64_t v77 = sub_23CA0D410();
    uint64_t v79 = v78;
    uint64_t v80 = (void *)sub_23CA0CFF0();
    id v81 = objc_msgSend(v80, sel_identifier);

    uint64_t v82 = sub_23CA0E4D0();
    uint64_t v84 = v83;

    if (v77 == v82 && v79 == v84)
    {
      swift_bridgeObjectRelease_n();
LABEL_31:
      uint64_t v42 = v0[22];
      uint64_t v140 = v0[21];
      uint64_t v143 = v0[27];
      uint64_t v89 = v0[9];
      uint64_t v138 = v0[7];
      uint64_t v90 = v0[5];
      char v91 = v76;
      uint64_t v92 = *MEMORY[0x263F6FC90];
      uint64_t v93 = sub_23CA0D2B0();
      uint64_t v94 = *(void *)(v93 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 104))(v89, v92, v93);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v94 + 56))(v89, 0, 1, v93);
      sub_23CA0D3D0();
      v91(v138, v90);
      goto LABEL_17;
    }
    char v88 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v88) {
      goto LABEL_31;
    }
    v76(v0[7], v0[5]);
LABEL_48:
    if (qword_268BBDEC0 != -1) {
      swift_once();
    }
    uint64_t v123 = sub_23CA0E410();
    __swift_project_value_buffer(v123, (uint64_t)qword_268BBE7F0);
    uint64_t v124 = sub_23CA0E3F0();
    os_log_type_t v125 = sub_23CA0E6F0();
    if (os_log_type_enabled(v124, v125))
    {
      uint64_t v126 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v126 = 0;
      _os_log_impl(&dword_23C9B6000, v124, v125, "Unable to parse a confirmation response from the given parse", v126, 2u);
      MEMORY[0x23ECEDBE0](v126, -1, -1);
    }
    uint64_t v127 = v0[27];
    uint64_t v128 = v0[21];
    uint64_t v129 = v0[22];
    uint64_t v130 = v0[9];

    uint64_t v131 = sub_23CA0D2B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56))(v130, 1, 1, v131);
    sub_23CA0D3D0();
    (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v127, v128);
    goto LABEL_55;
  }
  swift_bridgeObjectRelease_n();
LABEL_16:
  uint64_t v136 = v0[24];
  uint64_t v42 = v0[22];
  uint64_t v140 = v0[21];
  uint64_t v143 = v0[27];
  uint64_t v44 = v0[8];
  uint64_t v43 = v0[9];
  uint64_t v46 = v0[5];
  uint64_t v45 = v0[6];
  uint64_t v47 = *MEMORY[0x263F6FC98];
  uint64_t v48 = sub_23CA0D2B0();
  uint64_t v49 = *(void *)(v48 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 104))(v43, v47, v48);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56))(v43, 0, 1, v48);
  sub_23CA0D3D0();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
  v50(v44, v46);
  v50(v136, v46);
LABEL_17:
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v143, v140);
LABEL_55:
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
  uint64_t v135 = (uint64_t (*)(void))v0[1];
  return v135();
}

uint64_t sub_23C9E75B4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 232);
  uint64_t v4 = *(void *)(*(void *)v1 + 224);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_23C9E783C;
  }
  else {
    uint64_t v5 = sub_23C9E7724;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_23C9E7724()
{
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9E783C()
{
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t YesNoSearchWindowStrategy.makeConfirmationRejectedResponse()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E7974, 0, 0);
}

uint64_t sub_23C9E7974()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[3]
                                                   + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer)
                                       + **(int **)(v0[3]
                                                  + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C9E84D0;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t YesNoSearchWindowStrategy.makeFlowCancelledResponse()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E7A74, 0, 0);
}

uint64_t sub_23C9E7A74()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[3]
                                                   + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer)
                                       + **(int **)(v0[3]
                                                  + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23C9E7B54;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t sub_23C9E7B54()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t YesNoSearchWindowStrategy.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  uint64_t v2 = sub_23CA0D380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t YesNoSearchWindowStrategy.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  uint64_t v2 = sub_23CA0D380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23C9E7E34(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E51D4, 0, 0);
}

uint64_t sub_23C9E7E58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23C9E84D4;
  return YesNoSearchWindowStrategy.parseConfirmationResponse(input:)(a1, a2);
}

uint64_t sub_23C9E7F00(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = sub_23C9E848C(&qword_268BBE8C8);
  void *v5 = v2;
  v5[1] = sub_23C9C8C60;
  return MEMORY[0x270F66330](a1, v4, v6);
}

uint64_t sub_23C9E7FF4(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = sub_23C9E848C(&qword_268BBE8C8);
  void *v5 = v2;
  v5[1] = sub_23C9E84D4;
  return MEMORY[0x270F66338](a1, v4, v6);
}

uint64_t sub_23C9E80E8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = sub_23C9E848C(&qword_268BBE8C8);
  void *v5 = v2;
  v5[1] = sub_23C9E84D4;
  return MEMORY[0x270F66340](a1, v4, v6);
}

uint64_t sub_23C9E81DC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E7974, 0, 0);
}

uint64_t sub_23C9E81FC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23C9E7A74, 0, 0);
}

uint64_t sub_23C9E821C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_23C9E84D4;
  return MEMORY[0x270F666F8](a1, a2, v9, a4);
}

uint64_t sub_23C9E8304()
{
  return sub_23C9E848C(qword_268BBE870);
}

uint64_t type metadata accessor for YesNoSearchWindowStrategy()
{
  uint64_t result = qword_268BBE8B8;
  if (!qword_268BBE8B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C9E8384()
{
  return MEMORY[0x263F6FF10];
}

uint64_t sub_23C9E8390()
{
  return type metadata accessor for YesNoSearchWindowStrategy();
}

uint64_t sub_23C9E8398()
{
  uint64_t result = sub_23CA0D380();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for YesNoSearchWindowStrategy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for YesNoSearchWindowStrategy);
}

uint64_t dispatch thunk of YesNoSearchWindowStrategy.__allocating_init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_23C9E848C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for YesNoSearchWindowStrategy();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C9E84D8()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE8D0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE8D0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t static ResponseDisambigUtils.windowingResponse(for:)()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    if (qword_268BBDEC8 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_23CA0E410();
    __swift_project_value_buffer(v0, (uint64_t)qword_268BBE8D0);
    uint64_t v1 = sub_23CA0E3F0();
    os_log_type_t v2 = sub_23CA0E710();
    if (!os_log_type_enabled(v1, v2)) {
      goto LABEL_7;
    }
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    uint64_t v4 = "ResponseDisambigUtils.windowingResponse(userDialogAct:) User accepted the task, will reprompt.";
LABEL_6:
    _os_log_impl(&dword_23C9B6000, v1, v2, v4, v3, 2u);
    MEMORY[0x23ECEDBE0](v3, -1, -1);
LABEL_7:

    return sub_23CA0D3A0();
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    if (qword_268BBDEC8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23CA0E410();
    __swift_project_value_buffer(v6, (uint64_t)qword_268BBE8D0);
    uint64_t v7 = sub_23CA0E3F0();
    os_log_type_t v8 = sub_23CA0E710();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_23C9B6000, v7, v8, "ResponseDisambigUtils.windowingResponse(userDialogAct:) User rejected the task, will go to next page.", v9, 2u);
      MEMORY[0x23ECEDBE0](v9, -1, -1);
    }

    return sub_23CA0D390();
  }
  else
  {
    self;
    if (!swift_dynamicCastObjCClass())
    {
      if (qword_268BBDEC8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_23CA0E410();
      __swift_project_value_buffer(v14, (uint64_t)qword_268BBE8D0);
      uint64_t v1 = sub_23CA0E3F0();
      os_log_type_t v2 = sub_23CA0E710();
      if (!os_log_type_enabled(v1, v2)) {
        goto LABEL_7;
      }
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      uint64_t v4 = "ResponseDisambigUtils.windowingResponse(userDialogAct:) User made no confirmation choice – continue the task.";
      goto LABEL_6;
    }
    if (qword_268BBDEC8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23CA0E410();
    __swift_project_value_buffer(v10, (uint64_t)qword_268BBE8D0);
    uint64_t v11 = sub_23CA0E3F0();
    os_log_type_t v12 = sub_23CA0E710();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_23C9B6000, v11, v12, "ResponseDisambigUtils.windowingResponse(userDialogAct:) User cancelled the task.", v13, 2u);
      MEMORY[0x23ECEDBE0](v13, -1, -1);
    }

    return sub_23CA0D3B0();
  }
}

uint64_t static ResponseDisambigUtils.windowingResponse(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23CA0D570();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)&v43 - v7;
  MEMORY[0x270FA5388](v6);
  os_log_type_t v12 = (char *)&v43 - v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v43 = v10;
    uint64_t v45 = a2;
    uint64_t v46 = a1;
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v14 = v9 + 16;
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
    uint64_t v47 = *(void *)(v14 + 56);
    uint64_t v48 = v15;
    uint64_t v17 = (void (**)(char *, uint64_t))(v14 - 8);
    swift_bridgeObjectRetain();
    uint64_t v18 = v13;
    uint64_t v19 = v16;
    uint64_t v44 = v18;
    while (1)
    {
      v48(v12, v19, v4);
      char v20 = sub_23CA0D500();
      uint64_t v21 = *v17;
      (*v17)(v12, v4);
      if (v20) {
        break;
      }
      v19 += v47;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v22 = v16;
        uint64_t v23 = v44;
        do
        {
          v48(v8, v22, v4);
          char v24 = sub_23CA0D510();
          v21(v8, v4);
          if (v24)
          {
            swift_bridgeObjectRelease();
            if (qword_268BBDEC8 != -1) {
              swift_once();
            }
            uint64_t v35 = sub_23CA0E410();
            __swift_project_value_buffer(v35, (uint64_t)qword_268BBE8D0);
            uint64_t v36 = sub_23CA0E3F0();
            os_log_type_t v37 = sub_23CA0E710();
            if (os_log_type_enabled(v36, v37))
            {
              uint64_t v38 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v38 = 0;
              _os_log_impl(&dword_23C9B6000, v36, v37, "ResponseDisambigUtils.windowingResponse(usoParse:) User rejected the task, will go to next page.", v38, 2u);
              MEMORY[0x23ECEDBE0](v38, -1, -1);
            }

            return sub_23CA0D390();
          }
          v22 += v47;
          --v23;
        }
        while (v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v25 = v43;
        uint64_t v26 = v44;
        while (1)
        {
          v48(v25, v16, v4);
          char v27 = sub_23CA0D520();
          v21(v25, v4);
          if (v27) {
            break;
          }
          v16 += v47;
          if (!--v26)
          {
            swift_bridgeObjectRelease();
            goto LABEL_12;
          }
        }
        swift_bridgeObjectRelease();
        if (qword_268BBDEC8 != -1) {
          swift_once();
        }
        uint64_t v39 = sub_23CA0E410();
        __swift_project_value_buffer(v39, (uint64_t)qword_268BBE8D0);
        uint64_t v40 = sub_23CA0E3F0();
        os_log_type_t v41 = sub_23CA0E710();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_23C9B6000, v40, v41, "ResponseDisambigUtils.windowingResponse(usoParse:) User cancelled/rejected the task, will cancel the request.", v42, 2u);
          MEMORY[0x23ECEDBE0](v42, -1, -1);
        }

        return sub_23CA0D3B0();
      }
    }
    swift_bridgeObjectRelease();
    if (qword_268BBDEC8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_23CA0E410();
    __swift_project_value_buffer(v33, (uint64_t)qword_268BBE8D0);
    id v29 = sub_23CA0E3F0();
    os_log_type_t v30 = sub_23CA0E710();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      uint64_t v32 = "ResponseDisambigUtils.windowingResponse(usoParse:) User accepted the task, will reprompt.";
      goto LABEL_20;
    }
  }
  else
  {
LABEL_12:
    if (qword_268BBDEC8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_23CA0E410();
    __swift_project_value_buffer(v28, (uint64_t)qword_268BBE8D0);
    id v29 = sub_23CA0E3F0();
    os_log_type_t v30 = sub_23CA0E710();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      uint64_t v32 = "ResponseDisambigUtils.windowingResponse(usoParse:) User made no confirmation choice – continue the task.";
LABEL_20:
      _os_log_impl(&dword_23C9B6000, v29, v30, v32, v31, 2u);
      MEMORY[0x23ECEDBE0](v31, -1, -1);
    }
  }

  return sub_23CA0D3A0();
}

uint64_t static ResponseDisambigUtils.parseWindowActionFromInput<A>(input:windowInputType:items:choiceSelector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[11] = a6;
  v7[12] = a7;
  v7[9] = a4;
  v7[10] = a5;
  v7[7] = a2;
  v7[8] = a3;
  v7[6] = a1;
  uint64_t v8 = sub_23CA0D3C0();
  v7[13] = v8;
  v7[14] = *(void *)(v8 - 8);
  v7[15] = swift_task_alloc();
  v7[16] = swift_task_alloc();
  uint64_t v9 = sub_23CA0D3F0();
  v7[17] = v9;
  v7[18] = *(void *)(v9 - 8);
  v7[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9E8FBC, 0, 0);
}

uint64_t sub_23C9E8FBC()
{
  uint64_t v49 = v0;
  if (qword_268BBDEC8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[7];
  uint64_t v5 = sub_23CA0E410();
  v0[20] = __swift_project_value_buffer(v5, (uint64_t)qword_268BBE8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  uint64_t v6 = sub_23CA0E3F0();
  os_log_type_t v7 = sub_23CA0E710();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[18];
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[17];
  if (v8)
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v48 = v13;
    *(_DWORD *)os_log_type_t v12 = 136315138;
    sub_23C9E9DBC(&qword_268BBE8F8, MEMORY[0x263F6FF40]);
    uint64_t v14 = sub_23CA0EB80();
    v0[5] = sub_23C9BC474(v14, v15, &v48);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    _os_log_impl(&dword_23C9B6000, v6, v7, "ResponseDisambigUtils.parseWindowActionFromInput(input:items:): %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v13, -1, -1);
    MEMORY[0x23ECEDBE0](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 8))(v0[19], v0[17]);
  }

  uint64_t v16 = v0[15];
  uint64_t v17 = v0[13];
  uint64_t v18 = v0[14];
  (*(void (**)(void, void, uint64_t))(v18 + 16))(v0[16], v0[8], v17);
  sub_23CA0D3A0();
  sub_23C9E9DBC(&qword_268BBE8F0, MEMORY[0x263F6FEE8]);
  char v19 = sub_23CA0E4B0();
  char v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v20(v16, v17);
  if ((v19 & 1) == 0)
  {
    uint64_t v27 = v0[15];
    uint64_t v28 = v0[13];
    sub_23CA0D390();
    char v29 = sub_23CA0E4B0();
    v20(v27, v28);
    uint64_t v30 = v0[16];
    if (v29)
    {
      v20(v0[16], v0[13]);
      uint64_t v31 = sub_23CA0E3F0();
      os_log_type_t v32 = sub_23CA0E710();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_23C9B6000, v31, v32, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned .proceedWithNextWindow", v33, 2u);
        MEMORY[0x23ECEDBE0](v33, -1, -1);
      }

      sub_23CA0E620();
      sub_23CA0D220();
    }
    else
    {
      uint64_t v38 = v0[15];
      uint64_t v39 = v0[13];
      sub_23CA0D3B0();
      char v40 = sub_23CA0E4B0();
      v20(v38, v39);
      v20(v30, v39);
      os_log_type_t v41 = sub_23CA0E3F0();
      os_log_type_t v42 = sub_23CA0E710();
      BOOL v43 = os_log_type_enabled(v41, v42);
      if (v40)
      {
        if (v43)
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v44 = 0;
          _os_log_impl(&dword_23C9B6000, v41, v42, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned .cancel", v44, 2u);
          MEMORY[0x23ECEDBE0](v44, -1, -1);
        }

        sub_23CA0E620();
        sub_23CA0D240();
      }
      else
      {
        if (v43)
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v45 = 0;
          _os_log_impl(&dword_23C9B6000, v41, v42, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned unknown or .unsupported – .repeatWindow", v45, 2u);
          MEMORY[0x23ECEDBE0](v45, -1, -1);
        }

        sub_23CA0E620();
        sub_23CA0D210();
      }
    }
    goto LABEL_25;
  }
  uint64_t v21 = v0[12];
  uint64_t v22 = v0[9];
  v20(v0[16], v0[13]);
  if (MEMORY[0x23ECECE90](v22, v21) == 1)
  {
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v24 = sub_23CA0E710();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_23C9B6000, v23, v24, "ResponseDisambigUtils.parseWindowActionFromInput: Only single item and user indicated positive response – .complete", v25, 2u);
      MEMORY[0x23ECEDBE0](v25, -1, -1);
    }
    uint64_t v26 = v0[9];

    v0[4] = v26;
    sub_23CA0E620();
    sub_23CA0D230();
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v46 = (uint64_t (*)(void))v0[1];
    return v46();
  }
  uint64_t v47 = (uint64_t (*)(uint64_t, uint64_t))(v0[10] + *(int *)v0[10]);
  uint64_t v34 = (void *)swift_task_alloc();
  v0[21] = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_23C9E96AC;
  uint64_t v35 = v0[9];
  uint64_t v36 = v0[7];
  return v47(v36, v35);
}

uint64_t sub_23C9E96AC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 176) = a1;
  *(void *)(v3 + 184) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_23C9E9AB8;
  }
  else {
    uint64_t v4 = sub_23C9E97C0;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_23C9E97C0()
{
  uint64_t v1 = v0[22];
  if (!v1) {
    goto LABEL_4;
  }
  v0[2] = v1;
  sub_23CA0E620();
  swift_getWitnessTable();
  if (sub_23CA0E6C0())
  {
    swift_bridgeObjectRelease();
LABEL_4:
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v3 = sub_23CA0E710();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_23C9B6000, v2, v3, "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned empty results – .repeatWindow", v4, 2u);
      MEMORY[0x23ECEDBE0](v4, -1, -1);
    }

    sub_23CA0E620();
    goto LABEL_18;
  }
  uint64_t v5 = MEMORY[0x23ECECE90](v1, v0[12]);
  if (v5 != 1)
  {
    if (v5)
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_23CA0E3F0();
      os_log_type_t v7 = sub_23CA0E710();
      if (os_log_type_enabled(v6, v7))
      {
        BOOL v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v8 = 0;
        uint64_t v9 = "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned multiple results – .repeatWindow";
        goto LABEL_16;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_23CA0E3F0();
      os_log_type_t v7 = sub_23CA0E700();
      if (os_log_type_enabled(v6, v7))
      {
        BOOL v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v8 = 0;
        uint64_t v9 = "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned empty result. This shouldn't be a po"
             "ssible codepath to execute.";
LABEL_16:
        _os_log_impl(&dword_23C9B6000, v6, v7, v9, v8, 2u);
        MEMORY[0x23ECEDBE0](v8, -1, -1);
      }
    }

LABEL_18:
    sub_23CA0D210();
    goto LABEL_19;
  }
  uint64_t v10 = sub_23CA0E3F0();
  os_log_type_t v11 = sub_23CA0E710();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl(&dword_23C9B6000, v10, v11, "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned single result – .complete", v12, 2u);
    MEMORY[0x23ECEDBE0](v12, -1, -1);
  }
  uint64_t v13 = v0[22];

  v0[3] = v13;
  sub_23CA0D230();
  swift_bridgeObjectRelease();
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_23C9E9AB8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static ResponseDisambigUtils.calculateWindow<A>(windowItems:allItems:windowSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_23CA0E7A0();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 >= 1)
  {
    uint64_t v21 = a3;
    uint64_t v22 = v15;
    uint64_t v23 = a5;
    uint64_t v25 = a2;
    sub_23CA0E620();
    swift_getWitnessTable();
    char v18 = sub_23CA0E6C0();
    uint64_t result = 0;
    if (v18) {
      return result;
    }
    uint64_t v25 = a1;
    sub_23CA0E6B0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v10);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v13, a4);
      uint64_t v24 = a2;
      sub_23CA0E6D0();
      if (v26 != 1)
      {
        uint64_t v20 = v25;
        (*(void (**)(char *, uint64_t))(v14 + 8))(v17, a4);
        return v20 / v21;
      }
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, a4);
    }
  }
  return 0;
}

uint64_t sub_23C9E9DBC(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for ResponseDisambigUtils()
{
  return &type metadata for ResponseDisambigUtils;
}

uint64_t sub_23C9E9E14(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_23CA0E2D0();
  uint64_t result = 0;
  if (v4 > 1999)
  {
    if (v4 != 2000 && v4 != 3000) {
      return result;
    }
  }
  else if (v4)
  {
    if (v4 != 1000) {
      return result;
    }
  }
  else
  {
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23CA0E410();
    __swift_project_value_buffer(v6, (uint64_t)qword_268BBEC30);
    os_log_type_t v7 = sub_23CA0E3F0();
    os_log_type_t v8 = sub_23CA0E710();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_23C9B6000, v7, v8, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v9, 2u);
      MEMORY[0x23ECEDBE0](v9, -1, -1);
    }
  }
  if (sub_23C9CB890((uint64_t)a1, a2)) {
    return 0;
  }
  if (qword_268BBDE58 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23CA0E410();
  __swift_project_value_buffer(v10, (uint64_t)qword_268BBE3B0);
  id v11 = a1;
  uint64_t v12 = sub_23CA0E3F0();
  os_log_type_t v13 = sub_23CA0E710();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v16 = sub_23CA0E2B0();
    sub_23C9BC474(v16, v17, &v20);
    sub_23CA0E7C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v18 = sub_23CA0E2C0();
    sub_23C9BC474(v18, v19, &v20);
    sub_23CA0E7C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v12, v13, "Remote device %s doesn't support intent handling. Will send ace command to remote assistant %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v15, -1, -1);
    MEMORY[0x23ECEDBE0](v14, -1, -1);
  }
  else
  {
  }
  return sub_23CA0E2C0();
}

uint64_t sub_23C9EA128()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE900);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE900);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t SiriTimeDeviceContextProvider.fetchAlarmContexts()()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_23C9EA210, 0, 0);
}

uint64_t sub_23C9EA210()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = swift_task_alloc();
  v0[17] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE920);
  *uint64_t v3 = v0;
  v3[1] = sub_23C9EA314;
  return MEMORY[0x270FA2318](v0 + 12, 0, 0, 0xD000000000000014, 0x800000023CA166E0, sub_23C9EB1F4, v2, v4);
}

uint64_t sub_23C9EA314()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EA42C, 0, 0);
}

uint64_t sub_23C9EA42C()
{
  unint64_t v1 = v0[12];
  v0[19] = v1;
  unint64_t v2 = sub_23C9EAE78(v1);
  v0[20] = v2;
  v0[21] = 0;
  uint64_t v3 = sub_23CA0E320();
  v0[22] = v3;
  v0[2] = sub_23CA0E300();
  uint64_t v4 = MEMORY[0x263F75980];
  v0[5] = v3;
  v0[6] = v4;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = swift_task_alloc();
    v0[23] = v5;
    *(void *)(v5 + 16) = v0 + 2;
    *(void *)(v5 + 24) = v2;
    uint64_t v6 = (void *)swift_task_alloc();
    v0[24] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE928);
    *uint64_t v6 = v0;
    v6[1] = sub_23C9EA780;
    unint64_t v8 = 0x800000023CA16700;
    uint64_t v9 = sub_23C9ECFEC;
    uint64_t v10 = v0 + 13;
    unint64_t v11 = 0xD000000000000017;
    uint64_t v12 = v5;
LABEL_5:
    return MEMORY[0x270FA2318](v10, 0, 0, v11, v8, v9, v12, v7);
  }
  unint64_t v13 = sub_23C9D47A4(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  v0[25] = v13;
  sub_23C9C4FAC((uint64_t)(v0 + 2));
  if (*(void *)(v13 + 16))
  {
    uint64_t v14 = v0[22];
    uint64_t v15 = sub_23CA0E300();
    v0[10] = v14;
    v0[11] = v4;
    v0[7] = v15;
    uint64_t v16 = swift_task_alloc();
    v0[26] = v16;
    *(void *)(v16 + 16) = v0 + 7;
    unint64_t v17 = (void *)swift_task_alloc();
    v0[27] = v17;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE930);
    *unint64_t v17 = v0;
    v17[1] = sub_23C9EAAD8;
    unint64_t v11 = 0xD00000000000001ELL;
    unint64_t v8 = 0x800000023CA16720;
    uint64_t v9 = sub_23C9ECFF4;
    uint64_t v10 = v0 + 14;
    uint64_t v12 = v16;
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_23CA0E410();
  __swift_project_value_buffer(v18, (uint64_t)qword_268BBE900);
  unint64_t v19 = sub_23CA0E3F0();
  os_log_type_t v20 = sub_23CA0E700();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_23C9B6000, v19, v20, "Failed to fetch device units for alarm contexts", v21, 2u);
    MEMORY[0x23ECEDBE0](v21, -1, -1);
  }

  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v23 = MEMORY[0x263F8EE78];
  return v22(v23);
}

uint64_t sub_23C9EA780()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EA898, 0, 0);
}

uint64_t sub_23C9EA898()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[13];
  v0[25] = v1;
  sub_23C9C4FAC((uint64_t)(v0 + 2));
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[22];
    uint64_t v3 = sub_23CA0E300();
    uint64_t v4 = MEMORY[0x263F75980];
    v0[10] = v2;
    v0[11] = v4;
    v0[7] = v3;
    uint64_t v5 = swift_task_alloc();
    v0[26] = v5;
    *(void *)(v5 + 16) = v0 + 7;
    uint64_t v6 = (void *)swift_task_alloc();
    v0[27] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE930);
    *uint64_t v6 = v0;
    v6[1] = sub_23C9EAAD8;
    return MEMORY[0x270FA2318](v0 + 14, 0, 0, 0xD00000000000001ELL, 0x800000023CA16720, sub_23C9ECFF4, v5, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_268BBDED0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23CA0E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_268BBE900);
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_23C9B6000, v9, v10, "Failed to fetch device units for alarm contexts", v11, 2u);
      MEMORY[0x23ECEDBE0](v11, -1, -1);
    }

    uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v13 = MEMORY[0x263F8EE78];
    return v12(v13);
  }
}

uint64_t sub_23C9EAAD8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EABF0, 0, 0);
}

uint64_t sub_23C9EABF0()
{
  unint64_t v17 = v0;
  uint64_t v1 = v0[25];
  unint64_t v2 = v0[19];
  uint64_t v3 = v0[14];
  sub_23C9C4FAC((uint64_t)(v0 + 7));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_23C9C3974(v2, v1, v3, (void (*)(_OWORD *__return_ptr, id *, uint64_t, uint64_t))sub_23C9EB23C, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))sub_23C9CDFF4);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23CA0E410();
  __swift_project_value_buffer(v5, (uint64_t)qword_268BBE900);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_23CA0E3F0();
  os_log_type_t v7 = sub_23CA0E710();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = MEMORY[0x23ECECE40](v10, &type metadata for HALAlarmDeviceContext);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v0[15] = sub_23C9BC474(v11, v13, &v16);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C9B6000, v6, v7, "fetchAlarmContexts() got firing alarms context: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v9, -1, -1);
    MEMORY[0x23ECEDBE0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v4);
}

unint64_t sub_23C9EAE78(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23CA0CD10();
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  os_log_type_t v32 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v26 = (char *)&v24 - v10;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v11; uint64_t v11 = sub_23CA0E9C0())
  {
    uint64_t v24 = v2;
    uint64_t v30 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    unint64_t v31 = a1 & 0xC000000000000001;
    uint64_t v28 = (void (**)(char *, char *, uint64_t))(v27 + 32);
    char v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
    unint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v13 = 4;
    unint64_t v25 = a1;
    while (1)
    {
      id v14 = v31 ? (id)MEMORY[0x23ECED190](v13 - 4, a1) : *(id *)(a1 + 8 * v13);
      unint64_t v2 = v14;
      uint64_t v15 = v13 - 3;
      if (__OFADD__(v13 - 4, 1)) {
        break;
      }
      id v16 = objc_msgSend(v14, sel_identifier);
      if (v16)
      {
        unint64_t v17 = v16;
        sub_23CA0CCF0();

        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = 1;
      }
      (*v30)(v6, v18, 1, v7);

      if ((*v29)(v6, 1, v7) == 1)
      {
        sub_23C9BAA2C((uint64_t)v6, &qword_268BBE360);
      }
      else
      {
        unint64_t v19 = *v28;
        os_log_type_t v20 = v26;
        (*v28)(v26, v6, v7);
        v19(v32, v20, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v12 = sub_23C9CE008(0, *(void *)(v12 + 16) + 1, 1, v12);
        }
        unint64_t v22 = *(void *)(v12 + 16);
        unint64_t v21 = *(void *)(v12 + 24);
        if (v22 >= v21 >> 1) {
          unint64_t v12 = sub_23C9CE008(v21 > 1, v22 + 1, 1, v12);
        }
        *(void *)(v12 + 16) = v22 + 1;
        v19((char *)(v12+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v22), v32, v7);
        a1 = v25;
      }
      ++v13;
      if (v15 == v11)
      {
        swift_bridgeObjectRelease();
        return v12;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23C9EB1F4(uint64_t a1)
{
  return sub_23C9EC1E4(a1, *(void *)(v1 + 16), &qword_268BBE9A0, MEMORY[0x263F28290], (uint64_t)&unk_26F0A3198, (uint64_t)sub_23C9EE730);
}

void sub_23C9EB23C(void **a1@<X0>, NSObject *a2@<X1>, NSObject *a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v119 = a3;
  os_log_t v120 = a2;
  uint64_t v122 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23CA0CD10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v113 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (uint8_t *)&v113 - v16;
  uint64_t v18 = *a1;
  id v19 = objc_msgSend(v18, sel_identifier);
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_8;
  }
  os_log_type_t v20 = v19;
  uint64_t v121 = v17;
  sub_23CA0CCF0();

  unint64_t v21 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v21(v7, v15, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v118 = v9;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
LABEL_8:
    sub_23C9BAA2C((uint64_t)v7, &qword_268BBE360);
    if (qword_268BBDED0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_23CA0E410();
    __swift_project_value_buffer(v36, (uint64_t)qword_268BBE900);
    id v37 = v18;
    uint64_t v38 = sub_23CA0E3F0();
    os_log_type_t v39 = sub_23CA0E700();
    if (os_log_type_enabled(v38, v39))
    {
      char v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(void *)&long long v125 = v41;
      *(_DWORD *)char v40 = 136315138;
      uint64_t v121 = v40 + 4;
      id v42 = v37;
      id v43 = objc_msgSend(v42, sel_description);
      uint64_t v44 = sub_23CA0E4D0();
      unint64_t v46 = v45;

      *(void *)&long long v123 = sub_23C9BC474(v44, v46, (uint64_t *)&v125);
      sub_23CA0E7C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v38, v39, "Device had invalid UUID for fetched alarms: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v41, -1, -1);
      MEMORY[0x23ECEDBE0](v40, -1, -1);
    }
    else
    {
    }
    uint64_t v47 = v122;
    *uint64_t v122 = 0u;
    v47[1] = 0u;
    return;
  }
  v21((char *)v121, v7, v8);
  if (qword_268BBDED0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_23CA0E410();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_268BBE900);
  uint64_t v24 = v18;
  unint64_t v25 = sub_23CA0E3F0();
  os_log_type_t v26 = sub_23CA0E710();
  BOOL v27 = os_log_type_enabled(v25, v26);
  long long v117 = v24;
  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v114 = swift_slowAlloc();
    *(void *)&long long v125 = v114;
    uint64_t v116 = v23;
    *(_DWORD *)uint64_t v28 = 136315138;
    char v113 = v28 + 4;
    char v29 = v24;
    uint64_t v115 = v8;
    id v30 = v29;
    id v31 = objc_msgSend(v29, sel_description);
    uint64_t v32 = sub_23CA0E4D0();
    unint64_t v34 = v33;

    *(void *)&long long v123 = sub_23C9BC474(v32, v34, (uint64_t *)&v125);
    uint64_t v23 = v116;
    sub_23CA0E7C0();

    uint64_t v8 = v115;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v25, v26, "Searching alarm from device context %s", v28, 0xCu);
    uint64_t v35 = v114;
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v35, -1, -1);
    MEMORY[0x23ECEDBE0](v28, -1, -1);
  }
  else
  {
  }
  uint64_t v48 = v118;
  os_log_t v49 = v120;
  uint64_t v50 = (uint64_t)v121;
  if (v120[2].isa && (unint64_t v51 = sub_23CA06C10((uint64_t)v121), (v52 & 1) != 0))
  {
    uint64_t v53 = *((id *)v49[7].isa + v51);
    id v54 = objc_msgSend(v117, sel_serializedContextByKey);
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = sub_23CA0E480();

      uint64_t v57 = sub_23CA0E4D0();
      if (*(void *)(v56 + 16) && (unint64_t v59 = sub_23CA06B98(v57, v58), (v60 & 1) != 0))
      {
        sub_23C9BC704(*(void *)(v56 + 56) + 32 * v59, (uint64_t)&v123);
      }
      else
      {
        long long v123 = 0u;
        long long v124 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v124 + 1))
      {
        sub_23C9C6860(&v123, &v125);
        id v70 = objc_allocWithZone(MEMORY[0x263F28478]);
        __swift_project_boxed_opaque_existential_1(&v125, v126);
        id v71 = objc_msgSend(v70, sel_initWithSerializedBackingStore_, sub_23CA0ECA0());
        swift_unknownObjectRelease();
        uint64_t v72 = v71;
        uint64_t v116 = v23;
        uint64_t v73 = sub_23CA0E3F0();
        os_log_type_t v74 = sub_23CA0E710();
        if (os_log_type_enabled(v73, v74))
        {
          uint64_t v115 = v8;
          uint64_t v75 = (uint8_t *)swift_slowAlloc();
          uint64_t v76 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v75 = 138412290;
          *(void *)&long long v123 = v72;
          uint64_t v77 = v72;
          os_log_t v120 = v53;
          uint64_t v78 = v77;
          uint64_t v8 = v115;
          sub_23CA0E7C0();
          void *v76 = v72;

          uint64_t v53 = v120;
          _os_log_impl(&dword_23C9B6000, v73, v74, "fetchAlarmContexts() alarmSnapshot = %@", v75, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
          swift_arrayDestroy();
          MEMORY[0x23ECEDBE0](v76, -1, -1);
          MEMORY[0x23ECEDBE0](v75, -1, -1);
        }
        else
        {

          uint64_t v73 = v72;
        }

        id v87 = [v72 alarmsByID];
        if (v87)
        {
          char v88 = v87;
          sub_23C9EE454(0, (unint64_t *)&qword_268BBE698);
          sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
          uint64_t v89 = sub_23CA0E480();

          if (*(void *)(v89 + 16))
          {
            uint64_t v90 = swift_bridgeObjectRetain();
            sub_23C9EC02C(v90, (unint64_t *)&qword_268BBE698, 0x263F28470, &qword_268BBE9A8, (void (*)(id *, id))sub_23C9C442C);
            uint64_t v92 = v91;
            uint64_t v93 = v53;
            uint64_t v94 = v72;
            unint64_t v95 = (unint64_t)v119;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v96 = sub_23C9E9E14(v93, v95);
            uint64_t v97 = v8;
            uint64_t v99 = v98;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v125);
            (*(void (**)(uint8_t *, uint64_t))(v118 + 8))(v121, v97);
            uint64_t v100 = v122;
            *(void *)uint64_t v122 = v93;
            v100[1] = v92;
            v100[2] = v96;
            v100[3] = v99;
            return;
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v102 = v117;
        unint64_t v103 = sub_23CA0E3F0();
        os_log_type_t v104 = sub_23CA0E710();
        os_log_t v120 = v103;
        if (os_log_type_enabled(v103, v104))
        {
          uint64_t v105 = (uint8_t *)swift_slowAlloc();
          long long v117 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v105 = 138412290;
          uint64_t v119 = v72;
          *(void *)&long long v123 = v102;
          uint64_t v106 = v102;
          char v107 = v119;
          sub_23CA0E7C0();
          uint64_t v108 = v117;
          void *v117 = v102;

          os_log_t v109 = v120;
          _os_log_impl(&dword_23C9B6000, v120, v104, "Didn't find any alarms on device: %@", v105, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
          swift_arrayDestroy();
          MEMORY[0x23ECEDBE0](v108, -1, -1);
          MEMORY[0x23ECEDBE0](v105, -1, -1);
          uint64_t v111 = (uint64_t)v121;
          uint64_t v110 = v122;
          uint64_t v112 = v118;
        }
        else
        {

          char v107 = v102;
          uint64_t v111 = (uint64_t)v121;
          uint64_t v110 = v122;
          uint64_t v112 = v118;
          os_log_t v109 = v120;
        }

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v125);
        (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v8);
        *uint64_t v110 = 0u;
        v110[1] = 0u;
      }
      else
      {
        sub_23C9BAA2C((uint64_t)&v123, &qword_268BBE988);
        uint64_t v79 = v117;
        uint64_t v80 = sub_23CA0E3F0();
        os_log_type_t v81 = sub_23CA0E700();
        if (os_log_type_enabled(v80, v81))
        {
          uint64_t v115 = v8;
          uint64_t v82 = (uint8_t *)swift_slowAlloc();
          uint64_t v83 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v82 = 138412290;
          *(void *)&long long v125 = v79;
          uint64_t v84 = v79;
          os_log_t v120 = v53;
          id v85 = v84;
          uint64_t v8 = v115;
          uint64_t v50 = (uint64_t)v121;
          sub_23CA0E7C0();
          *uint64_t v83 = v79;

          uint64_t v53 = v120;
          _os_log_impl(&dword_23C9B6000, v80, v81, "Failed to get snapshot data from %@", v82, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
          swift_arrayDestroy();
          uint64_t v86 = v83;
          uint64_t v48 = v118;
          MEMORY[0x23ECEDBE0](v86, -1, -1);
          MEMORY[0x23ECEDBE0](v82, -1, -1);
        }
        else
        {
        }
        uint64_t v101 = v122;

        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v50, v8);
        *uint64_t v101 = 0u;
        v101[1] = 0u;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v12, v50, v8);
    uint64_t v61 = sub_23CA0E3F0();
    os_log_type_t v62 = sub_23CA0E700();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(void *)&long long v125 = v64;
      *(_DWORD *)uint64_t v63 = 136315138;
      os_log_t v120 = (os_log_t)(v63 + 4);
      sub_23C9EE384(&qword_268BBE990);
      uint64_t v65 = sub_23CA0EB80();
      *(void *)&long long v123 = sub_23C9BC474(v65, v66, (uint64_t *)&v125);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();
      unint64_t v67 = *(void (**)(char *, uint64_t))(v48 + 8);
      v67(v12, v8);
      _os_log_impl(&dword_23C9B6000, v61, v62, "Unable to find device for fetched alarms: %s", (uint8_t *)v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v64, -1, -1);
      MEMORY[0x23ECEDBE0](v63, -1, -1);

      v67((char *)v121, v8);
    }
    else
    {

      uint64_t v68 = *(void (**)(char *, uint64_t))(v48 + 8);
      v68(v12, v8);
      v68((char *)v50, v8);
    }
    uint64_t v69 = v122;
    *uint64_t v122 = 0u;
    v69[1] = 0u;
  }
}

void sub_23C9EC02C(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, void (*a5)(id *, id))
{
  sub_23C9EE454(0, a2);
  sub_23C9C6870(a4, a2);
  int64_t v9 = 0;
  v20[1] = (id)sub_23CA0E6A0();
  uint64_t v10 = a1 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a1 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v14) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v10 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v18 = *(void *)(v10 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_23;
        }
        unint64_t v18 = *(void *)(v10 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v14) {
            goto LABEL_23;
          }
          unint64_t v18 = *(void *)(v10 + 8 * v9);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    a5(v20, *(id *)(*(void *)(a1 + 56) + 8 * v16));
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v14)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v18 = *(void *)(v10 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v10 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_23C9EC1E4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v16[1] = a5;
  v16[2] = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  sub_23C9BFAA4(a2, (uint64_t)v17);
  v16[0] = v17[4];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE980);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23CA0F8D0;
  *(void *)(inited + 32) = sub_23CA0E4D0();
  *(void *)(inited + 40) = v12;
  sub_23C9F77D8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_23CA0E1E0();
  swift_release();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
}

uint64_t SiriTimeDeviceContextProvider.isNothingPlaying.getter()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_23C9EC3E8, 0, 0);
}

uint64_t sub_23C9EC3E8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_23C9EC4E4;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 5, 0, 0, 0xD000000000000010, 0x800000023CA16760, sub_23C9EDCA4, v2, v4);
}

uint64_t sub_23C9EC4E4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EC5FC, 0, 0);
}

uint64_t sub_23C9EC5FC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

void sub_23C9EC614(unint64_t a1)
{
  if (!a1)
  {
    if (qword_268BBDED0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23CA0E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_268BBE900);
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_24;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    uint64_t v12 = "SharedContextProvider#fetchDeviceContexts Got nil context array, returning nil...";
    goto LABEL_23;
  }
  if (qword_268BBDED0 != -1) {
LABEL_39:
  }
    swift_once();
  uint64_t v2 = sub_23CA0E410();
  __swift_project_value_buffer(v2, (uint64_t)qword_268BBE900);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_23CA0E3F0();
  os_log_type_t v4 = sub_23CA0E710();
  unint64_t v5 = a1 >> 62;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    if (v5)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_23CA0E9C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)&long long v38 = v7;
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v3, v4, "SharedContextProvider#fetchDeviceContexts Got media context for %ld devices...", v6, 0xCu);
    MEMORY[0x23ECEDBE0](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!v5)
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_23CA0E9C0();
  if (!v13)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (!os_log_type_enabled(v9, v10))
    {
LABEL_24:

      LOBYTE(v38) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE978);
      sub_23CA0E640();
      return;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    uint64_t v12 = "Not found primary device in deviceContexts";
LABEL_23:
    _os_log_impl(&dword_23C9B6000, v9, v10, v12, v11, 2u);
    MEMORY[0x23ECEDBE0](v11, -1, -1);
    goto LABEL_24;
  }
LABEL_14:
  uint64_t v14 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v15 = (id)MEMORY[0x23ECED190](v14 - 4, a1);
    }
    else {
      id v15 = *(id *)(a1 + 8 * v14);
    }
    unint64_t v16 = v15;
    uint64_t v17 = v14 - 3;
    if (__OFADD__(v14 - 4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (objc_msgSend(v15, sel_proximity) == (id)4000) {
      break;
    }

    ++v14;
    if (v17 == v13) {
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_serializedContextByKey);
  if (v18)
  {
    int64_t v19 = v18;
    uint64_t v20 = sub_23CA0E480();

    uint64_t v21 = sub_23CA0E4D0();
    if (*(void *)(v20 + 16) && (unint64_t v23 = sub_23CA06B98(v21, v22), (v24 & 1) != 0))
    {
      sub_23C9BC704(*(void *)(v20 + 56) + 32 * v23, (uint64_t)&v36);
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v37 + 1))
    {
      sub_23C9C6860(&v36, &v38);
      id v25 = objc_allocWithZone(MEMORY[0x263F28540]);
      __swift_project_boxed_opaque_existential_1(&v38, v39);
      id v26 = objc_msgSend(v25, sel_initWithSerializedBackingStore_, sub_23CA0ECA0());
      swift_unknownObjectRelease();
      BOOL v27 = v26;
      uint64_t v28 = sub_23CA0E3F0();
      os_log_type_t v29 = sub_23CA0E6F0();
      if (os_log_type_enabled(v28, v29))
      {
        id v30 = (uint8_t *)swift_slowAlloc();
        id v31 = (void *)swift_slowAlloc();
        *(_DWORD *)id v30 = 138412290;
        *(void *)&long long v36 = v27;
        uint64_t v32 = v27;
        sub_23CA0E7C0();
        void *v31 = v27;

        _os_log_impl(&dword_23C9B6000, v28, v29, "SharedContextProvider#fetchDeviceContexts serializedContextSnapshots: %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7D0);
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v31, -1, -1);
        MEMORY[0x23ECEDBE0](v30, -1, -1);
      }
      else
      {

        uint64_t v28 = v27;
      }

      LOBYTE(v36) = [v27 playbackState] != (id)1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE978);
      sub_23CA0E640();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v38);
    }
    else
    {
      sub_23C9BAA2C((uint64_t)&v36, &qword_268BBE988);
      unint64_t v33 = sub_23CA0E3F0();
      os_log_type_t v34 = sub_23CA0E710();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_23C9B6000, v33, v34, "SharedContextProvider#fetchDeviceContexts no playback state found for media context", v35, 2u);
        MEMORY[0x23ECEDBE0](v35, -1, -1);
      }

      LOBYTE(v38) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE978);
      sub_23CA0E640();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23C9ECC84()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_23C9ECD2C;
  v2[16] = v0;
  return MEMORY[0x270FA2498](sub_23C9EA210, 0, 0);
}

uint64_t sub_23C9ECD2C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_23C9ECE28()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_23C9EE74C;
  v2[16] = v0;
  return MEMORY[0x270FA2498](sub_23C9C32B0, 0, 0);
}

uint64_t sub_23C9ECED0()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_23C9ECEF0, 0, 0);
}

uint64_t sub_23C9ECEF0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_23C9EC4E4;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 5, 0, 0, 0xD000000000000010, 0x800000023CA16760, sub_23C9EE748, v2, v4);
}

uint64_t sub_23C9ECFEC(uint64_t a1)
{
  return sub_23C9EEA70(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_23C9ECFF4(uint64_t a1)
{
  return sub_23C9C5000(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C9ECFFC(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, void (*a6)(unint64_t))
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v8 = sub_23CA0E8B0();
    uint64_t v21 = v8;
    sub_23CA0E850();
    if (sub_23CA0E880())
    {
      sub_23C9EE454(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v8 = v21;
        unint64_t v15 = *(void *)(v21 + 16);
        if (*(void *)(v21 + 24) <= v15)
        {
          a6(v15 + 1);
          uint64_t v8 = v21;
        }
        uint64_t result = sub_23CA0E740();
        uint64_t v10 = v8 + 56;
        uint64_t v11 = -1 << *(unsigned char *)(v8 + 32);
        unint64_t v12 = result & ~v11;
        unint64_t v13 = v12 >> 6;
        if (((-1 << v12) & ~*(void *)(v8 + 56 + 8 * (v12 >> 6))) != 0)
        {
          unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 56 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v16 = 0;
          unint64_t v17 = (unint64_t)(63 - v11) >> 6;
          do
          {
            if (++v13 == v17 && (v16 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v18 = v13 == v17;
            if (v13 == v17) {
              unint64_t v13 = 0;
            }
            v16 |= v18;
            uint64_t v19 = *(void *)(v10 + 8 * v13);
          }
          while (v19 == -1);
          unint64_t v14 = __clz(__rbit64(~v19)) + (v13 << 6);
        }
        *(void *)(v10 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
        *(void *)(*(void *)(v8 + 48) + 8 * v14) = v20;
        ++*(void *)(v8 + 16);
      }
      while (sub_23CA0E880());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v8;
}

id sub_23C9ED200(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_23CA0E890();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    BOOL v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23C9ED3A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23CA0CD10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6A0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_23CA0E890();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_23C9ED648(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_23CA0E8A0();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  os_log_type_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_23CA0E740();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23C9ED8C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23CA0CD10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6A0);
  uint64_t v7 = sub_23CA0E8A0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  os_log_type_t v34 = v0;
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
  int64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
    uint64_t result = sub_23CA0E4A0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23C9EDC5C(uint64_t a1)
{
  return sub_23C9EC1E4(a1, *(void *)(v1 + 16), &qword_268BBE9A0, MEMORY[0x263F282C8], (uint64_t)&unk_26F0A3170, (uint64_t)sub_23C9C35E4);
}

uint64_t sub_23C9EDCA4(uint64_t a1)
{
  return sub_23C9EC1E4(a1, *(void *)(v1 + 16), &qword_268BBE978, MEMORY[0x263F282B0], (uint64_t)&unk_26F0A3148, (uint64_t)sub_23C9EE310);
}

uint64_t dispatch thunk of DeviceContextProviding.fetchAlarmContexts()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23C9EE74C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of DeviceContextProviding.fetchTimerContexts()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23C9EE74C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of DeviceContextProviding.isNothingPlaying.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23C9ECD2C;
  return v7(a1, a2);
}

uint64_t *assignWithCopy for SiriTimeDeviceContextProvider(uint64_t *a1, uint64_t *a2)
{
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
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
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
          *uint64_t result = *a2;
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SiriTimeDeviceContextProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeDeviceContextProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTimeDeviceContextProvider(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeDeviceContextProvider()
{
  return &type metadata for SiriTimeDeviceContextProvider;
}

uint64_t sub_23C9EE304()
{
  return objectdestroyTm(&qword_268BBE978);
}

void sub_23C9EE310(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE978);
  sub_23C9EC614(a1);
}

uint64_t sub_23C9EE384(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23CA0CD10();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C9EE3C8()
{
  return objectdestroyTm(&qword_268BBE9A0);
}

uint64_t sub_23C9EE3D4(unint64_t a1, const char *a2, const char *a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BBE9A0) - 8);
  return sub_23C9C35F8(a1, v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, a3);
}

uint64_t sub_23C9EE454(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23C9EE490(uint64_t a1)
{
  uint64_t v2 = sub_23CA0CD10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v28 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v27 = (char *)v21 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE360);
  MEMORY[0x270FA5388](v7 - 8);
  int v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  sub_23C9EE384((unint64_t *)&qword_268BBE6A8);
  uint64_t v29 = sub_23CA0E6A0();
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = v11 + 40;
    uint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v25 = v12;
    int64_t v22 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v23 = v14;
    uint64_t v26 = v11;
    int64_t v16 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    v21[1] = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v18 = (uint64_t)v27;
    unint64_t v17 = v28;
    while (1)
    {
      v25(v9, v13, v2);
      unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v9, 0, 1, v2);
      if ((*v24)(v9, 1, v2) == 1) {
        break;
      }
      (*v22)(v17, v9, v2);
      sub_23C9C3E38(v18, v17);
      (*v16)(v18, v2);
      v13 += v23;
      if (!--v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v19(v9, 1, 1, v2);
  }
  return v29;
}

uint64_t sub_23C9EE724()
{
  return objectdestroyTm(&qword_268BBE9A0);
}

uint64_t sub_23C9EE730(unint64_t a1)
{
  return sub_23C9EE3D4(a1, "Fetching alarm context for %ld devices", "Fetching alarmContexts: got nil context array");
}

uint64_t sub_23C9EE754()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t SiriTimeDeviceResolutionService.devicesCapableOfIntentHandling.getter()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_23C9EE78C, 0, 0);
}

uint64_t sub_23C9EE78C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE930);
  *uint64_t v3 = v0;
  v3[1] = sub_23C9EE890;
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD00000000000001ELL, 0x800000023CA16720, sub_23C9ECFF4, v2, v4);
}

uint64_t sub_23C9EE890()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9EE754, 0, 0);
}

uint64_t sub_23C9EE9A8()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBE9B8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBE9B8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23C9EEA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA28);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  sub_23C9BFAA4(a2, (uint64_t)v14);
  uint64_t v13 = v14[4];
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_23C9EE490(v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  sub_23CA0E330();
  swift_release();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
}

uint64_t SiriTimeDeviceResolutionService.targetingDevices()()
{
  v1[7] = v0;
  uint64_t v2 = sub_23CA0E260();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_23CA0E290();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9EED44, 0, 0);
}

uint64_t sub_23C9EED44()
{
  sub_23CA0E280();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE9E8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23CA0F8D0;
  sub_23CA0E250();
  v0[2] = v1;
  sub_23C9C3DF0(&qword_268BBE9F0, MEMORY[0x263F75950]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE9F8);
  sub_23C9EFB6C();
  sub_23CA0E830();
  sub_23CA0E270();
  if (qword_268BBDED8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23CA0E410();
  v0[14] = __swift_project_value_buffer(v2, (uint64_t)qword_268BBE9B8);
  uint64_t v3 = sub_23CA0E3F0();
  os_log_type_t v4 = sub_23CA0E710();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23C9B6000, v3, v4, "targetingDevices() Begin resolving targetable devices", v5, 2u);
    MEMORY[0x23ECEDBE0](v5, -1, -1);
  }
  uint64_t v7 = v0[12];
  uint64_t v6 = v0[13];
  uint64_t v8 = v0[11];
  uint64_t v9 = (void *)v0[7];

  uint64_t v10 = v9[3];
  uint64_t v11 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA08);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  v0[15] = v13;
  *(_OWORD *)(v13 + 16) = xmmword_23CA0F8D0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16))(v13 + v12, v6, v8);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[16] = v14;
  void *v14 = v0;
  v14[1] = sub_23C9EF004;
  return MEMORY[0x270F72EE0](v13, 0, v10, v11);
}

uint64_t sub_23C9EF004(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    os_log_type_t v4 = sub_23C9EF370;
  }
  else
  {
    swift_bridgeObjectRelease();
    os_log_type_t v4 = sub_23C9EF120;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_23C9EF120()
{
  int64_t v20 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_23CA0E3F0();
  os_log_type_t v2 = sub_23CA0E710();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = v0[17];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v19 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_23CA0E9C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v8 = v0[12];
    uint64_t v17 = v0[11];
    uint64_t v18 = v0[13];
    v0[5] = v7;
    uint64_t v9 = sub_23CA0EB80();
    v0[6] = sub_23C9BC474(v9, v10, &v19);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C9B6000, v1, v2, "targetingDevices() found targetable device count: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v6, -1, -1);
    MEMORY[0x23ECEDBE0](v5, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v18, v17);
  }
  else
  {
    uint64_t v12 = v0[12];
    uint64_t v11 = v0[13];
    uint64_t v13 = v0[11];

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  uint64_t v14 = v0[17];
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v14);
}

uint64_t sub_23C9EF370()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  swift_bridgeObjectRelease();
  id v2 = v1;
  id v3 = v1;
  unint64_t v4 = sub_23CA0E3F0();
  os_log_type_t v5 = sub_23CA0E700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 144);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v19 = v8;
    *(void *)(v0 + 24) = v6;
    id v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
    uint64_t v10 = sub_23CA0E4F0();
    *(void *)(v0 + 32) = sub_23C9BC474(v10, v11, &v19);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C9B6000, v4, v5, "Error fetching targeting accessories from #hal: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v8, -1, -1);
    MEMORY[0x23ECEDBE0](v7, -1, -1);
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 144);
  }
  uint64_t v14 = *(void *)(v0 + 96);
  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v17 = MEMORY[0x263F8EE78];
  return v16(v17);
}

uint64_t SiriTimeDeviceResolutionService.currentLocalDevice()()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_23C9EF5A8, 0, 0);
}

uint64_t sub_23C9EF5A8()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *unint64_t v4 = v0;
  v4[1] = sub_23C9EF664;
  return MEMORY[0x270F72ED8](4000, 4000, v2, v3);
}

uint64_t sub_23C9EF664(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = v1;
  swift_task_dealloc();
  if (v1) {
    unint64_t v4 = sub_23C9EF940;
  }
  else {
    unint64_t v4 = sub_23C9EF778;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_23C9EF778()
{
  unint64_t v1 = *(void *)(v0 + 48);
  if (v1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_23CA0E9C0())
  {
    uint64_t v3 = *(void *)(v0 + 48);
    unint64_t v4 = v1 & 0xC000000000000001;
    if ((v1 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(v3 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x23ECED190](0, v3);
LABEL_5:
      unint64_t v1 = (unint64_t)v5;
      sub_23CA0E2D0();
      uint64_t v6 = sub_23CA0E3E0();
      if (v6 == sub_23CA0E3E0())
      {
LABEL_6:
        swift_bridgeObjectRelease_n();
        goto LABEL_19;
      }

      if (v2 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = *(void *)(v0 + 48);
      uint64_t v11 = 5;
      while (1)
      {
        uint64_t v12 = v11 - 3;
        if (__OFADD__(v11 - 4, 1)) {
          break;
        }
        unint64_t v1 = (unint64_t)*(id *)(v4 + 8 * v11);
        sub_23CA0E2D0();
        uint64_t v13 = sub_23CA0E3E0();
        if (v13 == sub_23CA0E3E0()) {
          goto LABEL_6;
        }

        ++v11;
        if (v12 == v2) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v7 = 1;
    while (1)
    {
      uint64_t v8 = MEMORY[0x23ECED190](v7, *(void *)(v0 + 48));
      uint64_t v9 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        break;
      }
      unint64_t v1 = v8;
      sub_23CA0E2D0();
      uint64_t v10 = sub_23CA0E3E0();
      if (v10 == sub_23CA0E3E0()) {
        goto LABEL_6;
      }
      swift_unknownObjectRelease();
      ++v7;
      if (v9 == v2) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease_n();
  unint64_t v1 = 0;
LABEL_19:
  uint64_t v14 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v14(v1);
}

uint64_t sub_23C9EF940()
{
  uint64_t v17 = v0;
  if (qword_268BBDED8 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[7];
  uint64_t v2 = sub_23CA0E410();
  __swift_project_value_buffer(v2, (uint64_t)qword_268BBE9B8);
  id v3 = v1;
  id v4 = v1;
  id v5 = sub_23CA0E3F0();
  os_log_type_t v6 = sub_23CA0E700();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[7];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[2] = v8;
    id v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
    uint64_t v12 = sub_23CA0E4F0();
    v0[3] = sub_23C9BC474(v12, v13, &v16);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C9B6000, v5, v6, "Unable to get devicesWithProximity: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v10, -1, -1);
    MEMORY[0x23ECEDBE0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14(0);
}

unint64_t sub_23C9EFB6C()
{
  unint64_t result = qword_268BBEA00;
  if (!qword_268BBEA00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBE9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEA00);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeDeviceResolutionService()
{
  return &type metadata for SiriTimeDeviceResolutionService;
}

uint64_t sub_23C9EFBD8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA18);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_23C9EFC6C()
{
  return swift_release();
}

uint64_t sub_23C9EFC74()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEA28);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

id SASTButtonItem.init(label:commands:)()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_setCentered_, 1);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(qword_268BBEA90);
  uint64_t v2 = (void *)sub_23CA0E5A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCommands_, v2);

  objc_msgSend(v0, sel_setAction_, v1);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F38]), sel_init);
  uint64_t v4 = (void *)sub_23CA0E4C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v4);

  objc_msgSend(v0, sel_setDecoratedLabel_, v3);
  return v0;
}

uint64_t NoOpFlow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NoOpFlow.init()()
{
  return v0;
}

uint64_t sub_23C9EFEA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_23C9EFEC4, 0, 0);
}

uint64_t sub_23C9EFEC4()
{
  sub_23CA0D190();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9EFF24()
{
  return sub_23CA0CF60();
}

uint64_t type metadata accessor for NoOpFlow()
{
  return self;
}

unint64_t sub_23C9EFFA4()
{
  unint64_t result = qword_268BBEAA8[0];
  if (!qword_268BBEAA8[0])
  {
    type metadata accessor for NoOpFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268BBEAA8);
  }
  return result;
}

uint64_t NoOpFlow.deinit()
{
  return v0;
}

uint64_t NoOpFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23C9F0010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_23C9ECD2C;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_23C9F00C0()
{
  return sub_23CA0CF60();
}

uint64_t sub_23C9F011C()
{
  type metadata accessor for NoOpFlow();
  return sub_23CA0CF90();
}

uint64_t method lookup function for NoOpFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NoOpFlow);
}

uint64_t dispatch thunk of NoOpFlow.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of NoOpFlow.on(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of NoOpFlow.execute()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 96) + **(int **)(*(void *)v1 + 96));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23C9C8C60;
  return v6(a1);
}

uint64_t dispatch thunk of NoOpFlow.execute(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_23C9F02D4()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEAD0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEAD0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t AppInstallUtil.Domain.appTypeToInstall.getter()
{
  if (*v0 >= 3u) {
    return 0x68746C616568;
  }
  else {
    return 0x6B636F6C63;
  }
}

SiriTimeInternal::AppInstallUtil::Domain_optional __swiftcall AppInstallUtil.Domain.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_23CA0EA10();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t AppInstallUtil.Domain.rawValue.getter()
{
  return *(void *)&aClock_2[8 * *v0];
}

uint64_t sub_23C9F0444(char *a1, char *a2)
{
  return sub_23C9FBDEC(*a1, *a2);
}

uint64_t sub_23C9F0450()
{
  return sub_23C9F303C();
}

uint64_t sub_23C9F0458()
{
  return sub_23C9F3434();
}

uint64_t sub_23C9F0460()
{
  return sub_23C9F38B0();
}

SiriTimeInternal::AppInstallUtil::Domain_optional sub_23C9F0468(Swift::String *a1)
{
  return AppInstallUtil.Domain.init(rawValue:)(*a1);
}

uint64_t sub_23C9F0474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppInstallUtil.Domain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriTimeInternal::AppInstallUtil __swiftcall AppInstallUtil.init(domain:)(SiriTimeInternal::AppInstallUtil domain)
{
  *uint64_t v1 = *(unsigned char *)domain.domain;
  return domain;
}

uint64_t AppInstallUtil.installOrOpenURL(installOnly:)(char a1)
{
  if ((a1 & 1) != 0 || *v1 < 3u) {
    return sub_23C9F053C();
  }
  return sub_23CA0CC30();
}

uint64_t sub_23C9F053C()
{
  sub_23CA0E8F0();
  swift_bridgeObjectRelease();
  sub_23CA0E550();
  swift_bridgeObjectRelease();
  sub_23CA0CC30();
  return swift_bridgeObjectRelease();
}

uint64_t AppInstallUtil.appStorePunchout(installOnly:)@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  v53[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_23CA0CD10();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23CA0CC40();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v16 = *v2;
  if (a1)
  {
    if (v16 >= 3) {
      char v17 = 5;
    }
    else {
      char v17 = 0;
    }
    LOBYTE(v52) = v17;
    goto LABEL_8;
  }
  if (v16 < 3)
  {
    LOBYTE(v52) = 0;
LABEL_8:
    sub_23C9F053C();
    goto LABEL_10;
  }
  sub_23CA0CC30();
LABEL_10:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23C9BAA2C((uint64_t)v11, &qword_268BBEAF0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
    uint64_t v19 = (void *)sub_23CA0CC10();
    objc_msgSend(v18, sel_setPunchOutUri_, v19);

    id v20 = v18;
    sub_23CA0CD00();
    sub_23CA0CCD0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v21 = (void *)sub_23CA0E4C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setAceId_, v21);

    id v22 = objc_msgSend(v20, sel_dictionary);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = self;
      v53[0] = 0;
      id v25 = objc_msgSend(v24, sel_dataWithPropertyList_format_options_error_, v23, 200, 0, v53);
      id v26 = v53[0];
      if (v25)
      {
        uint64_t v27 = sub_23CA0CC70();
        unint64_t v29 = v28;

        sub_23CA0CC60();
        sub_23CA0E130();
        sub_23C9BD308(v27, v29);

        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
        uint64_t v30 = sub_23CA0E140();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a2, 0, 1, v30);
      }
      uint64_t v32 = v26;
      uint64_t v33 = (void *)sub_23CA0CC00();

      swift_willThrow();
      if (qword_268BBDEE0 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_23CA0E410();
      __swift_project_value_buffer(v34, (uint64_t)qword_268BBEAD0);
      id v35 = v33;
      id v36 = v33;
      uint64_t v37 = sub_23CA0E3F0();
      os_log_type_t v38 = sub_23CA0E700();
      int v39 = v38;
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v40 = swift_slowAlloc();
        int v50 = v39;
        uint64_t v41 = (uint8_t *)v40;
        unint64_t v51 = (void *)swift_slowAlloc();
        uint64_t v52 = (uint64_t)v33;
        v53[0] = v51;
        os_log_t v49 = v41;
        *(_DWORD *)uint64_t v41 = 136315138;
        uint64_t v48 = v41 + 4;
        id v42 = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
        uint64_t v43 = sub_23CA0E4F0();
        uint64_t v52 = sub_23C9BC474(v43, v44, (uint64_t *)v53);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();

        unint64_t v45 = v49;
        _os_log_impl(&dword_23C9B6000, v37, (os_log_type_t)v50, "Error generating ACE punch out command: %s", v49, 0xCu);
        unint64_t v46 = v51;
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v46, -1, -1);
        MEMORY[0x23ECEDBE0](v45, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  uint64_t v47 = sub_23CA0E140();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(a2, 1, 1, v47);
}

uint64_t AppInstallDialogOutputUtil.init(domain:fallbackCAT:)@<X0>(char *a1@<X0>, long long *a2@<X1>, char *a3@<X8>)
{
  char v4 = *a1;
  *a3 = *a1;
  uint64_t result = sub_23C9BB9E8(a2, (uint64_t)(a3 + 8));
  a3[48] = v4;
  return result;
}

uint64_t AppInstallDialogOutputUtil.makeLaunchAppView()()
{
  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_23CA0CC40();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9F0E5C, 0, 0);
}

uint64_t sub_23C9F0E5C()
{
  if (**(unsigned __int8 **)(v0 + 16) >= 3u)
  {
    sub_23CA0CC30();
  }
  else
  {
    sub_23CA0E8F0();
    swift_bridgeObjectRelease();
    sub_23CA0E550();
    sub_23CA0CC30();
    swift_bridgeObjectRelease();
  }
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23C9BAA2C(v3, &qword_268BBEAF0);
    if (qword_268BBDEE0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_23CA0E410();
    __swift_project_value_buffer(v4, (uint64_t)qword_268BBEAD0);
    uint64_t v5 = sub_23CA0E3F0();
    os_log_type_t v6 = sub_23CA0E700();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23C9B6000, v5, v6, "AlarmButtonFactory.makeLaunchAppView returned invalid URL for sleep punchout URL", v7, 2u);
      MEMORY[0x23ECEDBE0](v7, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v9 = MEMORY[0x263F8EE78];
    return v8(v9);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(*(void *)(v0 + 48), v3, v1);
    id v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v11;
    *id v11 = v0;
    v11[1] = sub_23C9F110C;
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v13 = MEMORY[0x263F8EE78];
    return sub_23C9F134C(v13, v12);
  }
}

uint64_t sub_23C9F110C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_23C9F12C4;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_23C9F1234;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_23C9F1234()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  uint64_t v1 = v0[9];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_23C9F12C4()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_23C9F134C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_23CA0D170();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB28);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_23CA0D270();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23C9F14CC, 0, 0);
}

uint64_t sub_23C9F14CC()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = v2[4];
  uint64_t v4 = v2[5];
  __swift_project_boxed_opaque_existential_1(v2 + 1, v3);
  unsigned __int8 v5 = AppInstallUtil.isAppInstalled.getter();
  sub_23CA0E500();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_23CA0E140();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
  id v11 = (uint64_t (*)(uint64_t, BOOL, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  v0[13] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_23C9F1694;
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[9];
  return v11(v8, (v5 & 1) == 0, v9, v3, v4);
}

uint64_t sub_23C9F1694()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  sub_23C9BAA2C(v2, &qword_268BBEB08);
  if (v0) {
    uint64_t v3 = sub_23C9F1BD0;
  }
  else {
    uint64_t v3 = sub_23C9F17CC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_23C9F17CC()
{
  uint64_t v1 = sub_23CA0D260();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_23CA0D290();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v0[8], v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v8 = v0[8];
  if (v7 == 1)
  {
    sub_23C9BAA2C(v0[8], &qword_268BBEB28);
    if (qword_268BBDEE0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_23CA0E410();
    __swift_project_value_buffer(v9, (uint64_t)qword_268BBEAD0);
    uint64_t v10 = sub_23CA0E3F0();
    os_log_type_t v11 = sub_23CA0E700();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_23C9B6000, v10, v11, "AppInstallDialogOutputUtil.makeOpenAppButtonViews failed to get button text from template", v12, 2u);
      MEMORY[0x23ECEDBE0](v12, -1, -1);
    }
    unint64_t v13 = v0[2];

    if (v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = MEMORY[0x263F8EE78];
    }
    if (v14 >> 62)
    {
      sub_23C9F2CA4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_23CA0E9B0();
      swift_bridgeObjectRelease_n();
      unint64_t v14 = v24;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23CA0ECC0();
      swift_bridgeObjectRelease();
      sub_23C9F2CA4();
    }
  }
  else
  {
    uint64_t v16 = v0[6];
    uint64_t v15 = v0[7];
    uint64_t v17 = v0[5];
    unint64_t v18 = v0[2];
    sub_23CA0D280();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
    sub_23CA0D160();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    unint64_t v19 = sub_23C9F1C5C();
    swift_bridgeObjectRelease();
    if (v18) {
      unint64_t v20 = v18;
    }
    else {
      unint64_t v20 = MEMORY[0x263F8EE78];
    }
    if (v20 >> 62)
    {
      sub_23C9F2CA4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_23CA0E9B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23CA0ECC0();
      sub_23C9F2CA4();
      uint64_t v21 = v20;
    }
    swift_bridgeObjectRelease();
    sub_23C9F205C(v19);
    unint64_t v14 = v21;
  }
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v22 = (uint64_t (*)(unint64_t))v0[1];
  return v22(v14);
}

uint64_t sub_23C9F1BD0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9F1C5C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F08]), sel_init);
  uint64_t v1 = (void *)sub_23CA0E4C0();
  objc_msgSend(v0, sel_setText_, v1);

  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  uint64_t v3 = (void *)sub_23CA0CC10();
  objc_msgSend(v2, sel_setPunchOutUri_, v3);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23CA0F560;
  *(void *)(v4 + 32) = v2;
  sub_23CA0E5D0();
  id v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_268BBEA90);
  uint64_t v6 = (void *)sub_23CA0E5A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCommands_, v6);

  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23CA0F560;
  *(void *)(v7 + 32) = v0;
  uint64_t v9 = v7;
  sub_23CA0E5D0();

  return v9;
}

uint64_t sub_23C9F1DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a5[2];
  if (!v11) {
    return 0;
  }
  BOOL v12 = a5[4] == a1 && a5[5] == a2;
  if (v12 || (uint64_t result = sub_23CA0ECB0(), (result & 1) != 0))
  {
LABEL_7:
    sub_23CA0E1B0();
    swift_allocObject();
    sub_23CA0E1A0();
    sub_23CA0E500();
    uint64_t v14 = sub_23CA0E140();
    uint64_t v15 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    v15(v10, 0, 1, v14);
    sub_23CA0E180();
    swift_release();
    sub_23C9BAA2C((uint64_t)v10, &qword_268BBEB08);
    sub_23CA0E500();
    v15(v10, 0, 1, v14);
    sub_23CA0E170();
    swift_release();
    sub_23C9BAA2C((uint64_t)v10, &qword_268BBEB08);
    uint64_t v16 = sub_23CA0E190();
    swift_release();
    return v16;
  }
  if (v11 == 1) {
    return 0;
  }
  uint64_t v17 = a5 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v19 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    if (*(v17 - 1) == a1 && *v17 == a2) {
      goto LABEL_7;
    }
    uint64_t result = sub_23CA0ECB0();
    if (result) {
      goto LABEL_7;
    }
    uint64_t v16 = 0;
    v17 += 2;
    if (v19 == v11) {
      return v16;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_23C9F1FFC()
{
  unint64_t result = qword_268BBEB10;
  if (!qword_268BBEB10)
  {
    sub_23CA0E1D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB10);
  }
  return result;
}

uint64_t sub_23C9F2054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C9F1DD0(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_23C9F205C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23CA0E9C0();
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
    uint64_t v5 = sub_23CA0E9C0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
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
    unint64_t v4 = MEMORY[0x23ECED1A0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_23C9F2360(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_23CA0E9C0();
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
  return sub_23CA0E5D0();
}

void (*sub_23C9F2228(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23C9F22D8(v6, a2, a3);
  return sub_23C9F2290;
}

void sub_23C9F2290(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23C9F22D8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x23ECED190](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_23C9F2358;
  }
  __break(1u);
  return result;
}

void sub_23C9F2358(id *a1)
{
}

uint64_t sub_23C9F2360(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23CA0E9C0();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_23CA0E9C0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23C9F2CE4();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB38);
          uint64_t v12 = sub_23C9F2228(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_23C9F2CA4();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_23CA0EA00();
  __break(1u);
  return result;
}

uint64_t sub_23C9F2564(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t v22 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v23 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v6)
  {
    unint64_t v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_22:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    unint64_t v18 = (uint64_t *)(*(void *)(a1 + 56) + v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v21 = a2(v16, v17, v19, v20);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v21)
    {
      MEMORY[0x23ECECE10](result);
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23CA0E5E0();
      }
      sub_23CA0E600();
      uint64_t result = sub_23CA0E5D0();
    }
  }
  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v11 >= v23) {
    goto LABEL_26;
  }
  unint64_t v12 = *(void *)(v22 + 8 * v11);
  ++v8;
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v23) {
    goto LABEL_26;
  }
  unint64_t v12 = *(void *)(v22 + 8 * v8);
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v23) {
    goto LABEL_26;
  }
  unint64_t v12 = *(void *)(v22 + 8 * v8);
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 3;
  if (v11 + 3 >= v23) {
    goto LABEL_26;
  }
  unint64_t v12 = *(void *)(v22 + 8 * v8);
  if (v12)
  {
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_22;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v23)
  {
LABEL_26:
    swift_release();
    return v24;
  }
  unint64_t v12 = *(void *)(v22 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v23) {
      goto LABEL_26;
    }
    unint64_t v12 = *(void *)(v22 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_21;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_23C9F27BC()
{
  unint64_t result = qword_268BBEB18;
  if (!qword_268BBEB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB18);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallUtil()
{
  return &type metadata for AppInstallUtil;
}

uint64_t _s16SiriTimeInternal14AppInstallUtilV6DomainOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s16SiriTimeInternal14AppInstallUtilV6DomainOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9F2984);
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

ValueMetadata *type metadata accessor for AppInstallUtil.Domain()
{
  return &type metadata for AppInstallUtil.Domain;
}

uint64_t dispatch thunk of AppInstallCAT.redirectToApp(isInstall:appType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *int64_t v11 = v5;
  v11[1] = sub_23C9C8C60;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t destroy for AppInstallDialogOutputUtil(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
}

uint64_t initializeWithCopy for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallDialogOutputUtil(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallDialogOutputUtil(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallDialogOutputUtil()
{
  return &type metadata for AppInstallDialogOutputUtil;
}

unint64_t sub_23C9F2CA4()
{
  unint64_t result = qword_268BBEB30;
  if (!qword_268BBEB30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BBEB30);
  }
  return result;
}

unint64_t sub_23C9F2CE4()
{
  unint64_t result = qword_268BBEB40;
  if (!qword_268BBEB40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBEB38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB40);
  }
  return result;
}

uint64_t sub_23C9F2D40()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F2DB8()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F2EC4()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F2FD0()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F303C()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F309C()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F318C()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F31E0()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F32D0()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F3434()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F3474()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F34D4()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F3528()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F3694()
{
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F37D4()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F383C()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F38B0()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F390C()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F3A14()
{
  return sub_23CA0ED20();
}

SiriTimeInternal::SiriTimeEventSender::TaskType_optional __swiftcall SiriTimeEventSender.TaskType.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_23CA0EA10();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t SiriTimeEventSender.TaskType.rawValue.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x616572436F646E55;
      break;
    case 2:
      unint64_t result = 0x656C65446F646E55;
      break;
    case 3:
      return result;
    case 4:
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x616572436F646E55;
      break;
    case 6:
      unint64_t result = 0x656C65446F646E55;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x54746E6572727543;
      break;
  }
  return result;
}

uint64_t sub_23C9F3CAC(char *a1, char *a2)
{
  return sub_23C9FBF74(*a1, *a2);
}

uint64_t sub_23C9F3CB8()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F3D00()
{
  return sub_23C9F3528();
}

uint64_t sub_23C9F3D08()
{
  return sub_23CA0ED20();
}

SiriTimeInternal::SiriTimeEventSender::TaskType_optional sub_23C9F3D4C(Swift::String *a1)
{
  return SiriTimeEventSender.TaskType.init(rawValue:)(*a1);
}

unint64_t sub_23C9F3D58@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriTimeEventSender.TaskType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriTimeInternal::SiriTimeEventSender::ReasonDescription_optional __swiftcall SiriTimeEventSender.ReasonDescription.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_23CA0ECD0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 8;
  switch(v3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      char v5 = 1;
      goto LABEL_10;
    case 2:
      char v5 = 2;
      goto LABEL_10;
    case 3:
      char v5 = 3;
      goto LABEL_10;
    case 4:
      char v5 = 4;
      goto LABEL_10;
    case 5:
      char v5 = 5;
      goto LABEL_10;
    case 6:
      char v5 = 6;
      goto LABEL_10;
    case 7:
      char v5 = 7;
LABEL_10:
      char v6 = v5;
      break;
    case 8:
      break;
    case 9:
      char v6 = 9;
      break;
    case 10:
      char v6 = 10;
      break;
    case 11:
      char v6 = 11;
      break;
    case 12:
      char v6 = 12;
      break;
    case 13:
      char v6 = 13;
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    default:
      char v6 = 26;
      break;
  }
  *unint64_t v2 = v6;
  return result;
}

unint64_t SiriTimeEventSender.ReasonDescription.rawValue.getter()
{
  unint64_t result = 0xD000000000000020;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 5:
      unint64_t result = 0x6E6F697461727544;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    case 0xA:
    case 0xD:
    case 0xE:
    case 0x15:
    case 0x18:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000015;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000013;
      break;
    case 0xF:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000020;
      break;
    case 0x12:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 0x13:
      unint64_t result = 0xD000000000000013;
      break;
    case 0x14:
      unint64_t result = 0xD000000000000012;
      break;
    case 0x16:
      unint64_t result = 0xD000000000000012;
      break;
    case 0x17:
      unint64_t result = 0xD000000000000012;
      break;
    case 0x19:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9F418C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C9FC248(*a1, *a2);
}

uint64_t sub_23C9F4198()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F4200()
{
  SiriTimeEventSender.ReasonDescription.rawValue.getter();
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9F4264()
{
  return sub_23CA0ED20();
}

SiriTimeInternal::SiriTimeEventSender::ReasonDescription_optional sub_23C9F42C8(Swift::String *a1)
{
  return SiriTimeEventSender.ReasonDescription.init(rawValue:)(*a1);
}

unint64_t sub_23C9F42D4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriTimeEventSender.ReasonDescription.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t SiriTimeEventSender.Attribute.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t SiriTimeEventSender.Attribute.rawValue.getter()
{
  return 0x72726F4369726953;
}

uint64_t sub_23C9F4388@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_23C9F43DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriTimeEventSender.Attribute.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, char *a5)
{
  uint64_t v19 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB48);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23CA0D110();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a4) = *a4;
  char v15 = *a5;
  sub_23CA0CFB0();
  v18[1] = v20[4];
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  sub_23CA0D050();
  sub_23C9F471C(v19, (uint64_t)v10);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = (_BYTE)a4;
  *(unsigned char *)(v16 + 17) = v15;
  sub_23CA0D030();
  sub_23CA0CFC0();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
}

uint64_t sub_23C9F471C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C9F4784(uint64_t a1, char a2, char a3)
{
  if ((a2 & 1) == 0) {
    uint64_t result = sub_23CA0D020();
  }
  if (a3 != 26)
  {
    SiriTimeEventSender.ReasonDescription.rawValue.getter();
    return sub_23CA0D010();
  }
  return result;
}

uint64_t sub_23C9F4808()
{
  return MEMORY[0x270FA0238](v0, 18, 7);
}

uint64_t sub_23C9F4818(uint64_t a1)
{
  return sub_23C9F4784(a1, *(unsigned char *)(v1 + 16), *(unsigned char *)(v1 + 17));
}

unint64_t sub_23C9F4828()
{
  unint64_t result = qword_268BBEB50;
  if (!qword_268BBEB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB50);
  }
  return result;
}

unint64_t sub_23C9F4880()
{
  unint64_t result = qword_268BBEB58;
  if (!qword_268BBEB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB58);
  }
  return result;
}

unint64_t sub_23C9F48D8()
{
  unint64_t result = qword_268BBEB60;
  if (!qword_268BBEB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEB60);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender()
{
  return &type metadata for SiriTimeEventSender;
}

unsigned char *storeEnumTagSinglePayload for SiriTimeEventSender.TaskType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x23C9F4A08);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.TaskType()
{
  return &type metadata for SiriTimeEventSender.TaskType;
}

uint64_t getEnumTagSinglePayload for SiriTimeEventSender.ReasonDescription(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 25;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1A;
  int v8 = v6 - 26;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriTimeEventSender.ReasonDescription(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE6)
  {
    unsigned int v6 = ((a2 - 231) >> 8) + 1;
    *unint64_t result = a2 + 25;
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
        JUMPOUT(0x23C9F4B9CLL);
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
          *unint64_t result = a2 + 25;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.ReasonDescription()
{
  return &type metadata for SiriTimeEventSender.ReasonDescription;
}

unsigned char *storeEnumTagSinglePayload for SiriTimeEventSender.Attribute(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23C9F4C70);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.Attribute()
{
  return &type metadata for SiriTimeEventSender.Attribute;
}

uint64_t sub_23C9F4CA8()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F4D04()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F4D64()
{
  return sub_23CA0E520();
}

uint64_t sub_23C9F4D88()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEB68);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEB68);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23C9F4E50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE988);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C9F4EB0(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_23CA0E9C0();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v4 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x23ECED190](i - 4, a1);
          uint64_t v5 = i - 3;
          if (__OFADD__(v4, 1)) {
            goto LABEL_15;
          }
        }
        else
        {
          swift_retain();
          uint64_t v5 = i - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        swift_getKeyPath();
        swift_retain();
        swift_getAtKeyPath();
        swift_release();
        uint64_t v6 = swift_release_n();
        if (v8)
        {
          MEMORY[0x23ECECE10](v6);
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23CA0E5E0();
          }
          sub_23CA0E600();
          sub_23CA0E5D0();
        }
        if (v5 == v2)
        {
          swift_bridgeObjectRelease();
          return v9;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

unint64_t sub_23C9F5064(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEBA8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
  uint64_t v25 = *(void *)(v27 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v26 = (uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v24 = (uint64_t)v22 - v9;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_23CA0E9C0();
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_3:
      v22[1] = v2;
      unint64_t v11 = a1 & 0xC000000000000001;
      uint64_t v12 = (unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
      unint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t v14 = 4;
      unint64_t v23 = a1;
      while (1)
      {
        uint64_t v15 = v14 - 4;
        if (v11)
        {
          uint64_t v2 = MEMORY[0x23ECED190](v14 - 4, a1);
          BOOL v16 = __OFADD__(v15, 1);
          uint64_t v17 = v14 - 3;
          if (v16) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v2 = *(void *)(a1 + 8 * v14);
          swift_retain();
          BOOL v16 = __OFADD__(v15, 1);
          uint64_t v17 = v14 - 3;
          if (v16)
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        UsoEntity_common_DurationComponent.componentValue.getter((uint64_t)v6);
        swift_release();
        if ((*v12)(v6, 1, v27) == 1)
        {
          sub_23C9BAA2C((uint64_t)v6, &qword_268BBEBA8);
        }
        else
        {
          uint64_t v18 = v24;
          sub_23C9F73D4((uint64_t)v6, v24);
          sub_23C9F73D4(v18, v26);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v13 = sub_23C9CE16C(0, *(void *)(v13 + 16) + 1, 1, v13);
          }
          unint64_t v20 = *(void *)(v13 + 16);
          unint64_t v19 = *(void *)(v13 + 24);
          if (v20 >= v19 >> 1) {
            unint64_t v13 = sub_23C9CE16C(v19 > 1, v20 + 1, 1, v13);
          }
          *(void *)(v13 + 16) = v20 + 1;
          sub_23C9F73D4(v26, v13+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v20);
          a1 = v23;
        }
        ++v14;
        if (v17 == v10)
        {
          swift_bridgeObjectRelease();
          return v13;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23C9F5358()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEB80);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEB80);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id UsoEntity_common_DurationComponent.valueInSeconds.getter()
{
  if (sub_23CA0DCB0())
  {
    sub_23CA0D6D0();
    swift_release();
    if ((sub_23C9B9DD4(0.0, 1.0, 0.1, 0.3) & 0x100000000) != 0)
    {
      if (qword_268BBDEF0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_23CA0E410();
      __swift_project_value_buffer(v6, (uint64_t)qword_268BBEB80);
      uint64_t v7 = sub_23CA0E3F0();
      os_log_type_t v8 = sub_23CA0E710();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_23C9B6000, v7, v8, "Failed to resolve parse to quantity value, use SiriTimeTimerConstants.minimumDuration as the default value", v9, 2u);
        MEMORY[0x23ECEDBE0](v9, -1, -1);
      }

      objc_msgSend(self, sel_minimumDuration);
      return (id)swift_release();
    }
    else
    {
      sub_23C9F7118();
      return (id)swift_release();
    }
  }
  else
  {
    if (qword_268BBDEF0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_23CA0E410();
    __swift_project_value_buffer(v1, (uint64_t)qword_268BBEB80);
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v3 = sub_23CA0E710();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_23C9B6000, v2, v3, "Value is nil in the DurationComponent, use SiriTimeTimerConstants.minimumDuration as the default value", v4, 2u);
      MEMORY[0x23ECEDBE0](v4, -1, -1);
    }

    uint64_t v5 = self;
    return objc_msgSend(v5, sel_minimumDuration);
  }
}

uint64_t UsoEntity_common_Duration.dateComponents(direction:)@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v69 = sub_23CA0CE10();
  uint64_t v3 = *(void *)(v69 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v69);
  char v60 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v62 = (char *)&v40 - v6;
  uint64_t v7 = sub_23CA0DC30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE468);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE470);
  MEMORY[0x270FA5388](v14 - 8);
  BOOL v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void (**)(void, void))sub_23CA0CBE0();
  uint64_t v58 = (uint64_t)*(v17 - 1);
  MEMORY[0x270FA5388](v17);
  id v71 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = sub_23CA0D930();
  if (v19)
  {
    unint64_t v20 = v19;
    if (v19 >> 62) {
      goto LABEL_67;
    }
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      do
      {
        uint64_t v56 = v17;
        uint64_t v21 = sub_23CA0CE20();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
        uint64_t v22 = sub_23CA0CE40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 1, 1, v22);
        sub_23CA0CBD0();
        unint64_t v23 = sub_23C9F4EB0(v20);
        swift_bridgeObjectRelease();
        unint64_t v24 = sub_23C9F5064(v23);
        swift_bridgeObjectRelease();
        unint64_t v13 = *(char **)(v24 + 16);
        if (!v13)
        {
LABEL_65:
          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(uint64_t (**)(uint64_t, uint64_t), char *, void (**)(void, void)))(v58 + 32))(a2, v71, v56);
        }
        id v54 = a2;
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
        uint64_t v25 = *(void *)(v67 - 8);
        uint64_t v26 = *(unsigned __int8 *)(v25 + 80);
        unsigned int v66 = *MEMORY[0x263F732A8];
        uint64_t v64 = *(void *)(v25 + 72);
        uint64_t v65 = *(void (**)(char *, void, uint64_t))(v8 + 104);
        int v63 = *MEMORY[0x263F07878];
        BOOL v16 = (char *)(v24 + ((v26 + 32) & ~v26));
        uint64_t v68 = v8 + 104;
        uint64_t v17 = (void (**)(void, void))(v8 + 8);
        uint64_t v8 = v3 + 16;
        int v61 = *MEMORY[0x263F078A0];
        a2 = (uint64_t (**)(uint64_t, uint64_t))(v3 + 88);
        int v59 = *MEMORY[0x263F078A8];
        int v57 = *MEMORY[0x263F07870];
        int v55 = *MEMORY[0x263F07890];
        int v52 = *MEMORY[0x263F078C0];
        int v51 = *MEMORY[0x263F078C8];
        int v50 = *MEMORY[0x263F078E8];
        int v49 = *MEMORY[0x263F07850];
        int v48 = *MEMORY[0x263F078D8];
        int v47 = *MEMORY[0x263F07848];
        int v46 = *MEMORY[0x263F07830];
        int v45 = *MEMORY[0x263F07860];
        int v44 = *MEMORY[0x263F07828];
        int v43 = *MEMORY[0x263F078F0];
        int v42 = *MEMORY[0x263F078F8];
        uint64_t v40 = (void (**)(char *, uint64_t))(v3 + 8);
        int v41 = *MEMORY[0x263F07840];
        unint64_t v53 = v24;
        swift_bridgeObjectRetain();
        while (1)
        {
          v65(v10, v66, v7);
          sub_23C9F7790(&qword_268BBEBA0, MEMORY[0x263F732B0]);
          sub_23CA0E580();
          sub_23CA0E580();
          if (v74 == v72 && v75 == v73)
          {
            swift_bridgeObjectRelease_n();
            (*v17)(v10, v7);
          }
          else
          {
            uint64_t v3 = sub_23CA0ECB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            (*v17)(v10, v7);
            if ((v3 & 1) == 0)
            {
              uint64_t v3 = (uint64_t)v60;
              uint64_t v28 = v69;
              (*(void (**)(char *, char *, uint64_t))v8)(v60, v16, v69);
              int v29 = (*a2)(v3, v28);
              if (v29 != v63)
              {
                if (v29 != v61)
                {
                  if (v29 != v59)
                  {
                    if (v29 != v57)
                    {
                      if (v29 != v55)
                      {
                        if (v29 != v52)
                        {
                          if (v29 != v51)
                          {
                            if (v29 != v50)
                            {
                              if (v29 != v49)
                              {
                                if (v29 != v48)
                                {
                                  if (v29 != v47)
                                  {
                                    if (v29 != v46)
                                    {
                                      if (v29 != v45)
                                      {
                                        if (v29 != v44)
                                        {
                                          if (v29 != v43 && v29 != v42 && v29 != v41) {
                                            (*v40)(v60, v69);
                                          }
                                          goto LABEL_7;
                                        }
                                        goto LABEL_59;
                                      }
LABEL_57:
                                      sub_23CA0CAC0();
                                      goto LABEL_7;
                                    }
LABEL_55:
                                    sub_23CA0CA90();
                                    goto LABEL_7;
                                  }
LABEL_53:
                                  sub_23CA0CAA0();
                                  goto LABEL_7;
                                }
LABEL_51:
                                sub_23CA0CBB0();
                                goto LABEL_7;
                              }
LABEL_49:
                              sub_23CA0CAB0();
                              goto LABEL_7;
                            }
LABEL_47:
                            sub_23CA0CBC0();
                            goto LABEL_7;
                          }
LABEL_45:
                          sub_23CA0CBA0();
                          goto LABEL_7;
                        }
LABEL_43:
                        sub_23CA0CB80();
                        goto LABEL_7;
                      }
LABEL_41:
                      sub_23CA0CB30();
                      goto LABEL_7;
                    }
LABEL_39:
                    sub_23CA0CB00();
                    goto LABEL_7;
                  }
LABEL_37:
                  sub_23CA0CB70();
                  goto LABEL_7;
                }
LABEL_35:
                sub_23CA0CB50();
                goto LABEL_7;
              }
              goto LABEL_6;
            }
          }
          uint64_t v30 = *(void *)&v16[*(int *)(v67 + 48)];
          unint64_t v20 = -v30;
          if (__OFSUB__(0, v30)) {
            break;
          }
          uint64_t v3 = (uint64_t)v62;
          uint64_t v31 = v69;
          (*(void (**)(char *, char *, uint64_t))v8)(v62, v16, v69);
          int v32 = (*a2)(v3, v31);
          if (v32 != v63)
          {
            if (v32 != v61)
            {
              if (v32 != v59)
              {
                if (v32 != v57)
                {
                  if (v32 != v55)
                  {
                    if (v32 != v52)
                    {
                      if (v32 != v51)
                      {
                        if (v32 != v50)
                        {
                          if (v32 != v49)
                          {
                            if (v32 != v48)
                            {
                              if (v32 != v47)
                              {
                                if (v32 != v46)
                                {
                                  if (v32 != v45)
                                  {
                                    if (v32 != v44)
                                    {
                                      if (v32 != v43 && v32 != v42 && v32 != v41) {
                                        (*v40)(v62, v69);
                                      }
                                      goto LABEL_7;
                                    }
LABEL_59:
                                    sub_23CA0CA80();
                                    goto LABEL_7;
                                  }
                                  goto LABEL_57;
                                }
                                goto LABEL_55;
                              }
                              goto LABEL_53;
                            }
                            goto LABEL_51;
                          }
                          goto LABEL_49;
                        }
                        goto LABEL_47;
                      }
                      goto LABEL_45;
                    }
                    goto LABEL_43;
                  }
                  goto LABEL_41;
                }
                goto LABEL_39;
              }
              goto LABEL_37;
            }
            goto LABEL_35;
          }
LABEL_6:
          sub_23CA0CB10();
LABEL_7:
          v16 += v64;
          if (!--v13)
          {
            swift_bridgeObjectRelease();
            a2 = v54;
            goto LABEL_65;
          }
        }
        __break(1u);
LABEL_67:
        ;
      }
      while (sub_23CA0E9C0());
    }
    swift_bridgeObjectRelease();
  }
  if (qword_268BBDEF0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_23CA0E410();
  __swift_project_value_buffer(v34, (uint64_t)qword_268BBEB80);
  id v35 = sub_23CA0E3F0();
  os_log_type_t v36 = sub_23CA0E710();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl(&dword_23C9B6000, v35, v36, "DurationComponents is nil or empty!", v37, 2u);
    MEMORY[0x23ECEDBE0](v37, -1, -1);
  }

  uint64_t v38 = sub_23CA0CE20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v16, 1, 1, v38);
  uint64_t v39 = sub_23CA0CE40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v13, 1, 1, v39);
  return sub_23CA0CBD0();
}

uint64_t UsoEntity_common_DurationComponent.componentValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEBA8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v34 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB98);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA0D960();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  BOOL v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_23CA0DCA0())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    goto LABEL_6;
  }
  sub_23CA0D950();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
LABEL_6:
    uint64_t v17 = &qword_268BBEB98;
    uint64_t v18 = (uint64_t)v12;
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  sub_23C9F6B10((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v17 = &qword_268BBEBA8;
    uint64_t v18 = (uint64_t)v3;
LABEL_7:
    sub_23C9BAA2C(v18, v17);
    uint64_t v19 = 1;
    uint64_t v20 = v35;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v20, v19, 1, v4);
  }
  uint64_t v22 = *(int *)(v4 + 48);
  uint64_t v23 = sub_23CA0CE10();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v24 + 32);
  uint64_t v32 = v24 + 32;
  uint64_t v33 = v25;
  v25((uint64_t)v9, v3, v23);
  *(void *)&v9[v22] = *(void *)&v3[v22];
  if (!sub_23CA0DCB0())
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_16;
  }
  sub_23CA0D6D0();
  swift_release();
  unint64_t v26 = sub_23C9B9DD4(0.0, 1.0, 0.1, 0.3);
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if ((v26 & 0x100000000) != 0)
  {
LABEL_16:
    uint64_t v28 = 1;
    goto LABEL_17;
  }
  if ((~v26 & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v27.n128_u32[0] = v26;
  if (*(float *)&v26 <= -9.2234e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (*(float *)&v26 < 9.2234e18)
  {
    uint64_t v28 = (uint64_t)*(float *)&v26;
LABEL_17:
    uint64_t v29 = *(int *)(v4 + 48);
    uint64_t v31 = v33;
    uint64_t v30 = v34;
    ((void (*)(char *, char *, uint64_t, __n128))v33)(v34, v9, v23, v27);
    uint64_t v20 = v35;
    v31(v35, v30, v23);
    uint64_t v19 = 0;
    *(void *)(v20 + v29) = v28;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v20, v19, 1, v4);
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t DateComponents.update(with:value:)(uint64_t a1)
{
  uint64_t v2 = sub_23CA0CE10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (result == *MEMORY[0x263F07878]) {
    return sub_23CA0CB10();
  }
  if (result == *MEMORY[0x263F078A0]) {
    return sub_23CA0CB50();
  }
  if (result == *MEMORY[0x263F078A8]) {
    return sub_23CA0CB70();
  }
  if (result == *MEMORY[0x263F07870]) {
    return sub_23CA0CB00();
  }
  if (result == *MEMORY[0x263F07890]) {
    return sub_23CA0CB30();
  }
  if (result == *MEMORY[0x263F078C0]) {
    return sub_23CA0CB80();
  }
  if (result == *MEMORY[0x263F078C8]) {
    return sub_23CA0CBA0();
  }
  if (result == *MEMORY[0x263F078E8]) {
    return sub_23CA0CBC0();
  }
  if (result == *MEMORY[0x263F07850]) {
    return sub_23CA0CAB0();
  }
  if (result == *MEMORY[0x263F078D8]) {
    return sub_23CA0CBB0();
  }
  if (result == *MEMORY[0x263F07848]) {
    return sub_23CA0CAA0();
  }
  if (result == *MEMORY[0x263F07830]) {
    return sub_23CA0CA90();
  }
  if (result == *MEMORY[0x263F07860]) {
    return sub_23CA0CAC0();
  }
  if (result == *MEMORY[0x263F07828]) {
    return sub_23CA0CA80();
  }
  if (result != *MEMORY[0x263F078F0]
    && result != *MEMORY[0x263F078F8]
    && result != *MEMORY[0x263F07840])
  {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_23C9F6B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23CA0D960();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F72B70])
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  int v11 = v8;
  if (v8 == *MEMORY[0x263F72B60])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v14 = *MEMORY[0x263F07830];
    uint64_t v15 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(a1, v14, v15);
    uint64_t v16 = 2;
LABEL_24:
    *(void *)(a1 + v13) = v16;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  if (v8 == *MEMORY[0x263F72B98])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F078A0];
LABEL_23:
    uint64_t v22 = *v17;
    uint64_t v23 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(a1, v22, v23);
    uint64_t v16 = 1;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x263F72BC0])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v18 = *MEMORY[0x263F078A0];
    uint64_t v19 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(a1, v18, v19);
    uint64_t v16 = 100;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x263F72BB8])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F078C8];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72B78])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F078D8];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72BB0])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F078C0];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72B80])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F07870];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72B88])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F07890];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72B68])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v20 = *MEMORY[0x263F07828];
    uint64_t v21 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(a1, v20, v21);
    uint64_t v16 = 1000000;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x263F72BA0])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F078A8];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F72BA8])
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
    uint64_t v13 = *(int *)(v12 + 48);
    uint64_t v24 = *MEMORY[0x263F078A0];
    uint64_t v25 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(a1, v24, v25);
    uint64_t v16 = 10;
    goto LABEL_24;
  }
  int v26 = *MEMORY[0x263F72B90];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
  if (v11 == v26)
  {
    uint64_t v28 = *(int *)(v27 + 48);
    uint64_t v29 = *MEMORY[0x263F07830];
    uint64_t v30 = v27;
    uint64_t v31 = sub_23CA0CE10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(a1, v29, v31);
    *(void *)(a1 + v28) = 1;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a1, 0, 1, v30);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(a1, 1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_23C9F7118()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB98);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0D960();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v16 - v8;
  if (sub_23CA0DCA0())
  {
    sub_23CA0D950();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
      uint64_t v7 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBEB98);
  if (qword_268BBDEF0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23CA0E410();
  __swift_project_value_buffer(v10, (uint64_t)qword_268BBEB80);
  int v11 = sub_23CA0E3F0();
  os_log_type_t v12 = sub_23CA0E700();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_23C9B6000, v11, v12, "DurationComponent is underspecified and is missing a Unit, using Minute as default unit", v13, 2u);
    MEMORY[0x23ECEDBE0](v13, -1, -1);
  }

  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F72BB0], v3);
LABEL_10:
  double v14 = sub_23C9BAA88();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v14;
}

uint64_t sub_23C9F73D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C9F743C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_23CA0D730();
  *a1 = v3;
  return result;
}

uint64_t sub_23C9F7478(uint64_t a1)
{
  uint64_t v2 = sub_23CA0CE10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEBB0);
    uint64_t v9 = sub_23CA0E8C0();
    uint64_t v10 = 0;
    os_log_type_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_23C9F7790(&qword_268BBEBB8, MEMORY[0x263F07908]);
      uint64_t v16 = sub_23CA0E4A0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_23C9F7790(&qword_268BBEBC0, MEMORY[0x263F07908]);
          char v23 = sub_23CA0E4B0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_23C9F7790(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9F77D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEBC8);
    uint64_t v3 = sub_23CA0E8C0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_23CA0ED00();
      swift_bridgeObjectRetain();
      sub_23CA0E520();
      uint64_t result = sub_23CA0ED20();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_23CA0ECB0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          unint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_23CA0ECB0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_23C9F797C()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEBD0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEBD0);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23C9F7A44()
{
  uint64_t v0 = sub_23CA0E200();
  uint64_t result = sub_23CA0E1F0();
  qword_268BBEC00 = v0;
  unk_268BBEC08 = MEMORY[0x263F740F8];
  qword_268BBEBE8 = result;
  return result;
}

uint64_t static SiriReferenceResolutionResolver.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268BBDF00 != -1) {
    swift_once();
  }
  return sub_23C9F7AF4((uint64_t)&qword_268BBEBE8, a1);
}

uint64_t sub_23C9F7AF4(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(NSObject *a1@<X0>, uint64_t a2@<X8>)
{
  os_log_t v105 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC10);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v84 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_23CA0E430();
  uint64_t v82 = *(void *)(v83 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v83);
  os_log_type_t v81 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v89 = (char *)&v81 - v7;
  uint64_t v8 = sub_23CA0E470();
  uint64_t v90 = *(void *)(v8 - 8);
  uint64_t v91 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  id v85 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v93 = (char *)&v81 - v11;
  uint64_t v12 = sub_23CA0E440();
  uint64_t v102 = *(void *)(v12 - 8);
  uint64_t v103 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v99 = (char **)((char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC18);
  uint64_t v14 = MEMORY[0x270FA5388](v101);
  uint64_t v100 = (void **)((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v107 = (uint64_t)&v81 - v16;
  uint64_t v17 = sub_23CA0CD10();
  uint64_t v97 = *(void *)(v17 - 8);
  uint64_t v98 = v17;
  MEMORY[0x270FA5388](v17);
  unint64_t v19 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23CA0E410();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  BOOL v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (int *)type metadata accessor for SiriTimeMeasurement();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v106 = (uint64_t)&v81 - v28;
  uint64_t v29 = sub_23CA0E460();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
  uint64_t v92 = a2;
  uint64_t v88 = v29;
  id v87 = v31;
  uint64_t v86 = v30 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t))v31)(a2, 1, 1);
  if (qword_268BBDEF8 != -1) {
    swift_once();
  }
  uint64_t v32 = __swift_project_value_buffer(v20, (uint64_t)qword_268BBEBD0);
  uint64_t v33 = *(void (**)(char *))(v21 + 16);
  uint64_t v96 = v32;
  v33(v23);
  uint64_t v95 = mach_absolute_time();
  *(_OWORD *)&v27[v24[7]] = xmmword_23CA0F8E0;
  *(void *)&v27[v24[8]] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v94 = v24[9];
  sub_23CA0CD00();
  id v34 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v35 = v21;
  uint64_t v36 = (void *)sub_23CA0CCE0();
  id v37 = objc_msgSend(v34, sel_initWithNSUUID_, v36);

  (*(void (**)(char *, uint64_t))(v97 + 8))(v19, v98);
  *(void *)&v27[v94] = v37;
  v27[8] = 31;
  ((void (*)(char *, char *, uint64_t))v33)(&v27[v24[6]], v23, v20);
  *(void *)uint64_t v27 = v95;
  sub_23C9FCCA4();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v23, v20);
  uint64_t v38 = v106;
  sub_23C9D43CC((uint64_t)v27, v106);
  __swift_project_boxed_opaque_existential_1(v104, v104[3]);
  uint64_t v39 = v99;
  void *v99 = v105;
  uint64_t v41 = v102;
  uint64_t v40 = v103;
  (*(void (**)(void *, void, uint64_t))(v102 + 104))(v39, *MEMORY[0x263F74278], v103);
  swift_retain();
  uint64_t v42 = v107;
  sub_23CA0E220();
  (*(void (**)(void *, uint64_t))(v41 + 8))(v39, v40);
  SiriTimeMeasurement.logDelta()();
  int v43 = v100;
  sub_23C9D6238(v42, (uint64_t)v100, &qword_268BBEC18);
  uint64_t v44 = v42;
  uint64_t v45 = v38;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    int v46 = *v43;
    id v47 = v46;
    id v48 = v46;
    int v49 = sub_23CA0E3F0();
    os_log_type_t v50 = sub_23CA0E700();
    if (os_log_type_enabled(v49, v50))
    {
      int v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      uint64_t v108 = (uint64_t)v46;
      v109[0] = v52;
      *(_DWORD *)int v51 = 136315138;
      id v53 = v46;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
      uint64_t v54 = sub_23CA0E4F0();
      uint64_t v108 = sub_23C9BC474(v54, v55, v109);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23C9B6000, v49, v50, "Resolve reference from SRR was unsuccessful: %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v52, -1, -1);
      MEMORY[0x23ECEDBE0](v51, -1, -1);
    }
    else
    {
    }
    uint64_t v72 = (void *)sub_23CA0CBF0();
    sub_23C9FDB84((uint64_t)v72, 1, 0, 0x90u);

    sub_23C9BAA2C(v44, &qword_268BBEC18);
    sub_23C9BC760(v38);
  }
  else
  {
    uint64_t v57 = v90;
    uint64_t v56 = v91;
    uint64_t v58 = v93;
    (*(void (**)(char *, void **, uint64_t))(v90 + 32))(v93, v43, v91);
    int v59 = v85;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v85, v58, v56);
    if ((*(unsigned int (**)(char *, uint64_t))(v57 + 88))(v59, v56) == *MEMORY[0x263F742B8])
    {
      (*(void (**)(char *, uint64_t))(v57 + 96))(v59, v56);
      uint64_t v60 = v82;
      int v61 = v89;
      uint64_t v62 = v83;
      (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v89, v59, v83);
      int v63 = v81;
      (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v81, v61, v62);
      uint64_t v64 = sub_23CA0E3F0();
      os_log_type_t v65 = sub_23CA0E710();
      if (os_log_type_enabled(v64, v65))
      {
        os_log_t v105 = v64;
        uint64_t v66 = v60;
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v104 = (void *)swift_slowAlloc();
        v109[0] = (uint64_t)v104;
        *(_DWORD *)uint64_t v67 = 136315138;
        sub_23C9F8EB0();
        uint64_t v68 = sub_23CA0EB80();
        uint64_t v108 = sub_23C9BC474(v68, v69, v109);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease();
        uint64_t v70 = *(void (**)(char *, uint64_t))(v66 + 8);
        v70(v63, v62);
        uint64_t v64 = v105;
        _os_log_impl(&dword_23C9B6000, v105, v65, "Resolve reference from SRR was successful with resolved entity match: %s", v67, 0xCu);
        id v71 = v104;
        swift_arrayDestroy();
        uint64_t v58 = v93;
        MEMORY[0x23ECEDBE0](v71, -1, -1);
        MEMORY[0x23ECEDBE0](v67, -1, -1);
      }
      else
      {
        uint64_t v70 = *(void (**)(char *, uint64_t))(v60 + 8);
        v70(v63, v62);
      }

      uint64_t v78 = (uint64_t)v84;
      uint64_t v79 = v89;
      sub_23CA0E420();
      v70(v79, v62);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v56);
      sub_23C9BAA2C(v107, &qword_268BBEC18);
      sub_23C9BC760(v106);
      uint64_t v80 = v92;
      sub_23C9BAA2C(v92, &qword_268BBEC10);
      v87(v78, 0, 1, v88);
      sub_23C9F8E48(v78, v80);
    }
    else
    {
      uint64_t v73 = sub_23CA0E3F0();
      os_log_type_t v74 = sub_23CA0E710();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v75 = 0;
        _os_log_impl(&dword_23C9B6000, v73, v74, "Resolve reference from SRR was successful but returned ambiguous or empty matches", v75, 2u);
        MEMORY[0x23ECEDBE0](v75, -1, -1);
      }

      uint64_t v76 = *(void (**)(char *, uint64_t))(v57 + 8);
      v76(v58, v56);
      sub_23C9BAA2C(v44, &qword_268BBEC18);
      sub_23C9BC760(v45);
      uint64_t v77 = v92;
      sub_23C9BAA2C(v92, &qword_268BBEC10);
      v87(v77, 1, 1, v88);
      v76(v59, v56);
    }
  }
}

uint64_t SiriReferenceResolutionResolver.getAlarmEntityFromDateTime()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC10);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23CA0DB60();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0DD70();
  swift_allocObject();
  sub_23CA0DD60();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F730A0], v3);
  sub_23CA0DD50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23CA0DD40();
  swift_allocObject();
  uint64_t v7 = sub_23CA0DD30();
  swift_retain();
  sub_23CA0D980();
  swift_release();
  uint64_t v8 = MEMORY[0x23ECEC120](v7);
  if (!v8)
  {
    if (qword_268BBDEF8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_23CA0E410();
    __swift_project_value_buffer(v11, (uint64_t)qword_268BBEBD0);
    uint64_t v12 = sub_23CA0E3F0();
    os_log_type_t v13 = sub_23CA0E710();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_23C9B6000, v12, v13, "Creation of was common_DateTime entity was unsuccessful", v14, 2u);
      MEMORY[0x23ECEDBE0](v14, -1, -1);
      swift_release();
      swift_release();
    }
    else
    {

      swift_release();
      swift_release();
    }
    return 0;
  }
  SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(v8, (uint64_t)v2);
  uint64_t v9 = sub_23CA0E460();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9) == 1)
  {
    swift_release();
    swift_release();
    swift_release();
    sub_23C9BAA2C((uint64_t)v2, &qword_268BBEC10);
    return 0;
  }
  uint64_t v15 = RREntity.alarmEntity()();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v2, v9);
  return v15;
}

uint64_t RREntity.alarmEntity()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0E450();
  sub_23CA0DB10();
  sub_23CA0D990();
  swift_release();
  if (!v22) {
    return 0;
  }
  if (!sub_23CA0DAD0() || (uint64_t v3 = sub_23CA0DFF0(), swift_release(), !v3) || (v4 = sub_23CA0E040(), swift_release(), !v4))
  {
LABEL_15:
    swift_release();
    return 0;
  }
  uint64_t v5 = sub_23CA0DF80();
  if (v6 & 1) != 0 || (uint64_t v7 = v5, v8 = sub_23CA0DF90(), (v9))
  {
    swift_release();
    goto LABEL_15;
  }
  uint64_t v10 = v8;
  if (qword_268BBDEF8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_23CA0E410();
  __swift_project_value_buffer(v11, (uint64_t)qword_268BBEBD0);
  uint64_t v12 = sub_23CA0E3F0();
  os_log_type_t v13 = sub_23CA0E710();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_23C9B6000, v12, v13, "Creating a UsoEntity_common_Alarm instance from returned SRR result", v14, 2u);
    MEMORY[0x23ECEDBE0](v14, -1, -1);
  }

  sub_23CA0DAC0();
  swift_allocObject();
  uint64_t v15 = sub_23CA0DAB0();
  uint64_t v16 = sub_23CA0D940();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = (unsigned int *)MEMORY[0x263F72B48];
  if (v7 >= 12) {
    uint64_t v18 = (unsigned int *)MEMORY[0x263F72B50];
  }
  (*(void (**)(char *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v2, *v18, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v2, 0, 1, v16);
  if (sub_23CA0DB00())
  {
    uint64_t v19 = sub_23CA0D910();
    swift_release();
  }
  else
  {
    uint64_t v19 = 0;
  }
  sub_23C9F8F08(v7, v10, (uint64_t)v2, v19);
  swift_release();
  sub_23C9BAA2C((uint64_t)v2, &qword_268BBEC28);
  sub_23CA0DAA0();
  swift_release();
  MEMORY[0x23ECEC120](v15);
  sub_23CA0D7E0();
  sub_23CA0D990();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_23C9F8E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23C9F8EB0()
{
  unint64_t result = qword_268BBEC20;
  if (!qword_268BBEC20)
  {
    sub_23CA0E430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEC20);
  }
  return result;
}

uint64_t sub_23C9F8F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a4;
  uint64_t v24 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEC28);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23CA0D940();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0DBA0();
  swift_allocObject();
  uint64_t v11 = sub_23CA0DB90();
  sub_23CA0DB80();
  swift_allocObject();
  sub_23CA0DB90();
  sub_23CA0DB80();
  sub_23CA0DDC0();
  swift_allocObject();
  sub_23CA0DDB0();
  swift_retain();
  sub_23CA0DD80();
  v22[1] = v11;
  swift_release();
  swift_retain();
  sub_23CA0DDA0();
  swift_release();
  sub_23C9D6238(v24, (uint64_t)v6, &qword_268BBEC28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23C9BAA2C((uint64_t)v6, &qword_268BBEC28);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_23CA0DC10();
    swift_allocObject();
    sub_23CA0DC00();
    sub_23CA0DBF0();
    swift_retain();
    sub_23CA0DD90();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v12 = v23;
  sub_23CA0DBE0();
  swift_allocObject();
  uint64_t v13 = sub_23CA0DBD0();
  swift_retain();
  sub_23CA0DBC0();
  swift_release();
  if (v12)
  {
    sub_23CA0DA60();
    swift_allocObject();
    swift_retain();
    sub_23CA0DA50();
    if (sub_23CA0D780())
    {
      sub_23CA0D870();
      char v15 = v14;
      swift_release();
      if ((v15 & 1) == 0)
      {
        swift_allocObject();
        sub_23CA0DB90();
        sub_23CA0DB80();
        swift_retain();
        sub_23CA0DA20();
        swift_release_n();
      }
    }
    if (sub_23CA0D790())
    {
      uint64_t v16 = sub_23CA0DA70();
      swift_release();
      if (v16)
      {
        sub_23CA0D870();
        char v18 = v17;
        swift_release();
        if ((v18 & 1) == 0)
        {
          swift_allocObject();
          sub_23CA0DB90();
          sub_23CA0DB80();
          sub_23CA0DD10();
          swift_allocObject();
          sub_23CA0DD00();
          swift_retain();
          sub_23CA0DCF0();
          swift_release();
          swift_retain();
          sub_23CA0DA30();
          swift_release();
          swift_release_n();
        }
      }
    }
    if (sub_23CA0D7A0())
    {
      sub_23CA0D870();
      char v20 = v19;
      swift_release();
      if ((v20 & 1) == 0)
      {
        swift_allocObject();
        sub_23CA0DB90();
        sub_23CA0DB80();
        swift_retain();
        sub_23CA0DA40();
        swift_release_n();
      }
    }
    swift_retain();
    sub_23CA0DBB0();
    swift_release();
    swift_release_n();
  }
  swift_release();
  swift_release();
  swift_release();
  return v13;
}

ValueMetadata *type metadata accessor for SiriReferenceResolutionResolver()
{
  return &type metadata for SiriReferenceResolutionResolver;
}

uint64_t DeviceUnit.isRemote.getter()
{
  uint64_t v0 = sub_23CA0E2D0();
  uint64_t result = 1;
  if (v0 <= 1999)
  {
    if (v0)
    {
      if (v0 == 1000) {
        return result;
      }
      return 0;
    }
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_23CA0E410();
    __swift_project_value_buffer(v2, (uint64_t)qword_268BBEC30);
    uint64_t v3 = sub_23CA0E3F0();
    os_log_type_t v4 = sub_23CA0E710();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_23C9B6000, v3, v4, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v5, 2u);
      MEMORY[0x23ECEDBE0](v5, -1, -1);
    }

    return 1;
  }
  else if (v0 != 2000 && v0 != 3000)
  {
    return 0;
  }
  return result;
}

uint64_t DeviceUnit.shouldDismissSilently.getter()
{
  uint64_t v0 = sub_23CA0E2D0();
  if (v0 <= 1999)
  {
    if (v0 && v0 != 1000) {
      goto LABEL_20;
    }
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23CA0E410();
    __swift_project_value_buffer(v6, (uint64_t)qword_268BBEC30);
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v7 = sub_23CA0E710();
    if (!os_log_type_enabled(v2, v7)) {
      goto LABEL_25;
    }
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    uint64_t v8 = "Firing alarm/timer is on far/unknown device: will dismiss with dialog.";
LABEL_24:
    _os_log_impl(&dword_23C9B6000, v2, v7, v8, v4, 2u);
    uint64_t v11 = 0;
LABEL_31:
    MEMORY[0x23ECEDBE0](v4, -1, -1);
    goto LABEL_33;
  }
  if (v0 == 2000 || v0 == 3000)
  {
    if ((_s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0() & 1) == 0)
    {
      if (qword_268BBDF08 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_23CA0E410();
      __swift_project_value_buffer(v12, (uint64_t)qword_268BBEC30);
      uint64_t v2 = sub_23CA0E3F0();
      os_log_type_t v3 = sub_23CA0E710();
      if (os_log_type_enabled(v2, v3))
      {
        os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v4 = 0;
        uint64_t v5 = "Firing alarm/timer is on nearby device: will dismiss silently with no dialog.";
        goto LABEL_30;
      }
LABEL_32:
      uint64_t v11 = 1;
      goto LABEL_33;
    }
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_23CA0E410();
    __swift_project_value_buffer(v9, (uint64_t)qword_268BBEC30);
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v7 = sub_23CA0E710();
    if (!os_log_type_enabled(v2, v7)) {
      goto LABEL_25;
    }
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    uint64_t v8 = "Firing alarm/timer is on nearby communal device: will dismiss with dialog.";
    goto LABEL_24;
  }
  if (v0 == 4000)
  {
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_23CA0E410();
    __swift_project_value_buffer(v1, (uint64_t)qword_268BBEC30);
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v3 = sub_23CA0E710();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      uint64_t v5 = "Firing alarm/timer is on local device: will dismiss them silently with no dialog.";
LABEL_30:
      _os_log_impl(&dword_23C9B6000, v2, v3, v5, v4, 2u);
      uint64_t v11 = 1;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
LABEL_20:
  if (qword_268BBDF08 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23CA0E410();
  __swift_project_value_buffer(v10, (uint64_t)qword_268BBEC30);
  uint64_t v2 = sub_23CA0E3F0();
  os_log_type_t v7 = sub_23CA0E700();
  if (os_log_type_enabled(v2, v7))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    uint64_t v8 = "Firing alarm/timer is on unhandled proximity device. This is a programming error and needs to be handled. Defau"
         "lting to non-silent dismissal.";
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v11 = 0;
LABEL_33:

  return v11;
}

uint64_t DeviceUnit.shouldPromptForConfirmation.getter()
{
  uint64_t v0 = sub_23CA0E2D0();
  if (v0 <= 1999)
  {
    if (!v0 || v0 == 1000)
    {
      if (qword_268BBDF08 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_23CA0E410();
      __swift_project_value_buffer(v6, (uint64_t)qword_268BBEC30);
      uint64_t v2 = sub_23CA0E3F0();
      os_log_type_t v7 = sub_23CA0E710();
      if (os_log_type_enabled(v2, v7))
      {
        os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v4 = 0;
        uint64_t v8 = "Firing alarm/timer is not near local device: will require confirmation";
LABEL_25:
        _os_log_impl(&dword_23C9B6000, v2, v7, v8, v4, 2u);
        uint64_t v10 = 1;
        goto LABEL_26;
      }
LABEL_27:
      uint64_t v10 = 1;
      goto LABEL_28;
    }
LABEL_21:
    if (qword_268BBDF08 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_23CA0E410();
    __swift_project_value_buffer(v11, (uint64_t)qword_268BBEC30);
    uint64_t v2 = sub_23CA0E3F0();
    os_log_type_t v7 = sub_23CA0E700();
    if (os_log_type_enabled(v2, v7))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      uint64_t v8 = "Firing alarm/timer reported unhandled proximity: will require confirmation – This is an error for an unhandle"
           "d proximity case";
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  if (v0 != 2000 && v0 != 3000)
  {
    if (v0 == 4000)
    {
      if (qword_268BBDF08 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_23CA0E410();
      __swift_project_value_buffer(v1, (uint64_t)qword_268BBEC30);
      uint64_t v2 = sub_23CA0E3F0();
      os_log_type_t v3 = sub_23CA0E710();
      if (os_log_type_enabled(v2, v3))
      {
        os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v4 = 0;
        uint64_t v5 = "Firing alarm/timer is on local device: will skip confirmation";
LABEL_19:
        _os_log_impl(&dword_23C9B6000, v2, v3, v5, v4, 2u);
        uint64_t v10 = 0;
LABEL_26:
        MEMORY[0x23ECEDBE0](v4, -1, -1);
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (qword_268BBDF08 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_23CA0E410();
  __swift_project_value_buffer(v9, (uint64_t)qword_268BBEC30);
  uint64_t v2 = sub_23CA0E3F0();
  os_log_type_t v3 = sub_23CA0E710();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    uint64_t v5 = "Firing alarm/timer is on nearby device: will skip confirmation";
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v10 = 0;
LABEL_28:

  return v10;
}

BOOL DeviceUnit.isLocal.getter()
{
  sub_23CA0E2D0();
  uint64_t v0 = sub_23CA0E3E0();
  return v0 == sub_23CA0E3E0();
}

uint64_t sub_23C9F9BF0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEC30);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEC30);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  os_log_type_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23C9F9CB8()
{
  return DeviceUnit.shouldDismissSilently.getter() & 1;
}

uint64_t sub_23C9F9CE0()
{
  return DeviceUnit.shouldPromptForConfirmation.getter() & 1;
}

uint64_t sub_23C9F9D08()
{
  return DeviceUnit.isRemote.getter() & 1;
}

BOOL sub_23C9F9D30()
{
  sub_23CA0E2D0();
  uint64_t v0 = sub_23CA0E3E0();
  return v0 == sub_23CA0E3E0();
}

uint64_t sub_23C9F9D6C()
{
  return _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0() & 1;
}

uint64_t dispatch thunk of HALDevice.shouldDismissSilently.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HALDevice.shouldPromptForConfirmation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HALDevice.isRemote.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HALDevice.isLocal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HALDevice.isCommunal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t TipKitSiriTimeSource.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_23C9F9EAC(a1);
}

unint64_t TipKitSiriTimeSource.rawValue.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_23C9F9E20()
{
  return sub_23C9F9F38();
}

uint64_t sub_23C9F9E3C()
{
  return sub_23CA0E520();
}

uint64_t sub_23C9F9E58()
{
  return sub_23C9F9FC0();
}

uint64_t sub_23C9F9E74@<X0>(BOOL *a1@<X8>)
{
  return sub_23C9FA018(a1);
}

void sub_23C9F9E80(void *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000023CA157B0;
}

uint64_t TipKitSiriTimeContext.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_23C9F9EAC(a1);
}

uint64_t sub_23C9F9EAC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

unint64_t TipKitSiriTimeContext.rawValue.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_23C9F9F1C()
{
  return sub_23C9F9F38();
}

uint64_t sub_23C9F9F38()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9F9F88()
{
  return sub_23CA0E520();
}

uint64_t sub_23C9F9FA4()
{
  return sub_23C9F9FC0();
}

uint64_t sub_23C9F9FC0()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9FA00C@<X0>(BOOL *a1@<X8>)
{
  return sub_23C9FA018(a1);
}

uint64_t sub_23C9FA018@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23CA0EA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_23C9FA068(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000023CA157E0;
}

unint64_t sub_23C9FA090()
{
  unint64_t result = qword_268BBEC48;
  if (!qword_268BBEC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEC48);
  }
  return result;
}

unint64_t sub_23C9FA0E8()
{
  unint64_t result = qword_268BBEC50;
  if (!qword_268BBEC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEC50);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipKitSiriTimeSource()
{
  return &type metadata for TipKitSiriTimeSource;
}

unsigned char *_s16SiriTimeInternal20TipKitSiriTimeSourceOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23C9FA1ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipKitSiriTimeContext()
{
  return &type metadata for TipKitSiriTimeContext;
}

ValueMetadata *type metadata accessor for TipKitDonationService()
{
  return &type metadata for TipKitDonationService;
}

uint64_t sub_23C9FA234()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEC58);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEC58);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t UsoEntity_common_Alarm.eligibleForTimerReformation.getter()
{
  uint64_t v0 = sub_23CA0D960();
  uint64_t v98 = *(void **)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v79 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECA0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB98);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (unint64_t)&v79 - v11;
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v79 - v13;
  char v15 = (void *)UsoEntity_common_Alarm.relativeOffsetInMinutes.getter();
  if (!v15
    || (uint64_t v16 = v15,
        objc_msgSend(v15, sel_doubleValue),
        double v18 = v17,
        v16,
        char v19 = self,
        objc_msgSend(v19, sel_minimumDuration),
        v20 >= v18))
  {
    if (qword_268BBDF10 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_23CA0E410();
    __swift_project_value_buffer(v27, (uint64_t)qword_268BBEC58);
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v24 = sub_23CA0E710();
    if (!os_log_type_enabled(v23, v24)) {
      goto LABEL_14;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    uint64_t v26 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (no valid relative duration)";
LABEL_12:
    uint64_t v28 = v23;
    os_log_type_t v29 = v24;
LABEL_13:
    _os_log_impl(&dword_23C9B6000, v28, v29, v26, v25, 2u);
    MEMORY[0x23ECEDBE0](v25, -1, -1);
LABEL_14:

    return 0;
  }
  objc_msgSend(v19, sel_maxReformationDuration);
  if (v21 < v18)
  {
    if (qword_268BBDF10 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_23CA0E410();
    __swift_project_value_buffer(v22, (uint64_t)qword_268BBEC58);
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v24 = sub_23CA0E710();
    if (!os_log_type_enabled(v23, v24)) {
      goto LABEL_14;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    uint64_t v26 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (maxReformationDuration)";
    goto LABEL_12;
  }
  uint64_t v97 = v5;
  uint64_t v31 = sub_23CA0D7D0();
  uint64_t v89 = v9;
  uint64_t v95 = v14;
  unint64_t v96 = v12;
  uint64_t v88 = v2;
  uint64_t v93 = v3;
  if (!v31 || (unint64_t v32 = sub_23CA0DCC0(), swift_release(), !v32))
  {
    uint64_t v35 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_36;
  }
  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_23CA0E9C0();
    if (v33) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v33)
    {
LABEL_19:
      if (v33 < 1)
      {
        __break(1u);
LABEL_78:
        swift_bridgeObjectRetain();
        uint64_t result = sub_23CA0E9C0();
        uint64_t v53 = result;
        if (result) {
          goto LABEL_49;
        }
        goto LABEL_79;
      }
      uint64_t v34 = 0;
      uint64_t v35 = (void *)MEMORY[0x263F8EE78];
      do
      {
        if ((v32 & 0xC000000000000001) != 0)
        {
          uint64_t v36 = MEMORY[0x23ECED190](v34, v32);
        }
        else
        {
          uint64_t v36 = *(void *)(v32 + 8 * v34 + 32);
          swift_retain();
        }
        uint64_t v99 = v36;
        sub_23C9FB014((uint64_t)&v100);
        swift_release();
        if (*((void *)&v101 + 1))
        {
          sub_23C9C6860(&v100, v102);
          sub_23C9C6860(v102, &v100);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v35 = sub_23C9CE3DC(0, v35[2] + 1, 1, v35);
          }
          unint64_t v38 = v35[2];
          unint64_t v37 = v35[3];
          if (v38 >= v37 >> 1) {
            uint64_t v35 = sub_23C9CE3DC((void *)(v37 > 1), v38 + 1, 1, v35);
          }
          v35[2] = v38 + 1;
          sub_23C9C6860(&v100, &v35[4 * v38 + 4]);
        }
        else
        {
          sub_23C9BAA2C((uint64_t)&v100, &qword_268BBE988);
        }
        ++v34;
      }
      while (v33 != v34);
      goto LABEL_35;
    }
  }
  uint64_t v35 = (void *)MEMORY[0x263F8EE78];
LABEL_35:
  swift_bridgeObjectRelease_n();
LABEL_36:
  if (qword_268BBDF10 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_23CA0E410();
  uint64_t v40 = __swift_project_value_buffer(v39, (uint64_t)qword_268BBEC58);
  swift_bridgeObjectRetain_n();
  uint64_t v41 = sub_23CA0E3F0();
  os_log_type_t v42 = sub_23CA0E6F0();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v92 = v0;
  if (v43)
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v94 = v40;
    uint64_t v45 = (uint8_t *)v44;
    uint64_t v46 = swift_slowAlloc();
    *(void *)&v102[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v91 = v45 + 4;
    uint64_t v47 = swift_bridgeObjectRetain();
    uint64_t v48 = MEMORY[0x23ECECE40](v47, MEMORY[0x263F8EE58] + 8);
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    *(void *)&long long v100 = sub_23C9BC474(v48, v50, (uint64_t *)v102);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C9B6000, v41, v42, "UsoEntity_common_Alarm.eligibleForTimerReformation – recurrenceDateTimes: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v46, -1, -1);
    uint64_t v40 = v94;
    MEMORY[0x23ECEDBE0](v45, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v51 = v35[2];
  swift_bridgeObjectRelease();
  if (v51)
  {
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v24 = sub_23CA0E710();
    if (!os_log_type_enabled(v23, v24)) {
      goto LABEL_14;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    uint64_t v26 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (day recurrences found)";
    goto LABEL_12;
  }
  uint64_t v94 = v40;
  if (!sub_23CA0D7D0()
    || (uint64_t v52 = sub_23CA0DCE0(), swift_release(), !v52)
    || (unint64_t v12 = sub_23CA0D930(), swift_release(), !v12))
  {
    uint64_t v57 = (void *)MEMORY[0x263F8EE78];
LABEL_81:
    uint64_t v75 = v57[2];
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_23CA0E3F0();
    os_log_type_t v76 = sub_23CA0E710();
    BOOL v77 = os_log_type_enabled(v23, v76);
    if (v75)
    {
      if (!v77) {
        goto LABEL_14;
      }
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      os_log_type_t v29 = v76;
      uint64_t v26 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (period recurrences found)";
      uint64_t v28 = v23;
      goto LABEL_13;
    }
    if (v77)
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl(&dword_23C9B6000, v23, v76, "UsoEntity_common_Alarm.eligibleForTimerReformation = true", v78, 2u);
      MEMORY[0x23ECEDBE0](v78, -1, -1);
    }

    return 1;
  }
  if (v12 >> 62) {
    goto LABEL_78;
  }
  uint64_t v53 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v53)
  {
LABEL_79:
    uint64_t v57 = (void *)MEMORY[0x263F8EE78];
LABEL_80:
    swift_bridgeObjectRelease_n();
    goto LABEL_81;
  }
LABEL_49:
  if (v53 >= 1)
  {
    uint64_t v54 = 0;
    unint64_t v55 = v12 & 0xC000000000000001;
    unsigned int v84 = *MEMORY[0x263F72B80];
    uint64_t v83 = (void (**)(unint64_t, void, uint64_t))(v98 + 13);
    uint64_t v82 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v98 + 7);
    uint64_t v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 6);
    uint64_t v79 = (void (**)(char *, uint64_t, uint64_t))(v98 + 4);
    uint64_t v80 = (void (**)(uint64_t, uint64_t))(v98 + 1);
    uint64_t v57 = (void *)MEMORY[0x263F8EE78];
    unint64_t v87 = v12;
    uint64_t v86 = v53;
    unint64_t v85 = v12 & 0xC000000000000001;
    os_log_type_t v81 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 6);
    while (1)
    {
      if (v55)
      {
        uint64_t v58 = MEMORY[0x23ECED190](v54, v12);
      }
      else
      {
        uint64_t v58 = *(void *)(v12 + 8 * v54 + 32);
        swift_retain();
      }
      sub_23CA0D730();
      if (!*(void *)&v102[0]) {
        goto LABEL_68;
      }
      uint64_t v59 = sub_23CA0DCA0();
      if (v59) {
        break;
      }
      swift_release();
LABEL_68:
      long long v100 = 0u;
      long long v101 = 0u;
LABEL_69:
      swift_release();
      if (*((void *)&v101 + 1))
      {
        sub_23C9C6860(&v100, v102);
        sub_23C9C6860(v102, &v100);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v57 = sub_23C9CE3DC(0, v57[2] + 1, 1, v57);
        }
        unint64_t v74 = v57[2];
        unint64_t v73 = v57[3];
        if (v74 >= v73 >> 1) {
          uint64_t v57 = sub_23C9CE3DC((void *)(v73 > 1), v74 + 1, 1, v57);
        }
        id v57[2] = v74 + 1;
        sub_23C9C6860(&v100, &v57[4 * v74 + 4]);
      }
      else
      {
        sub_23C9BAA2C((uint64_t)&v100, &qword_268BBE988);
      }
      if (v53 == ++v54) {
        goto LABEL_80;
      }
    }
    uint64_t v91 = (uint8_t *)v58;
    uint64_t v98 = v57;
    uint64_t v60 = (uint64_t)v95;
    uint64_t v90 = v59;
    sub_23CA0D950();
    uint64_t v61 = v96;
    uint64_t v62 = v92;
    (*v83)(v96, v84, v92);
    (*v82)(v61, 0, 1, v62);
    uint64_t v63 = (uint64_t)v97;
    uint64_t v64 = (uint64_t)&v97[*(int *)(v93 + 48)];
    sub_23C9D6238(v60, (uint64_t)v97, &qword_268BBEB98);
    sub_23C9D6238(v61, v64, &qword_268BBEB98);
    os_log_type_t v65 = *v56;
    if ((*v56)(v63, 1, v62) == 1)
    {
      sub_23C9BAA2C(v61, &qword_268BBEB98);
      sub_23C9BAA2C(v60, &qword_268BBEB98);
      unsigned int v66 = v65(v64, 1, v62);
      unint64_t v12 = v87;
      uint64_t v53 = v86;
      if (v66 == 1)
      {
        sub_23C9BAA2C((uint64_t)v97, &qword_268BBEB98);
        unint64_t v55 = v85;
        uint64_t v57 = v98;
        goto LABEL_66;
      }
    }
    else
    {
      uint64_t v67 = (uint64_t)v89;
      sub_23C9D6238(v63, (uint64_t)v89, &qword_268BBEB98);
      if (v65(v64, 1, v62) != 1)
      {
        uint64_t v68 = v67;
        unint64_t v69 = v88;
        (*v79)(v88, v64, v62);
        sub_23C9FB6B0(&qword_268BBECA8, MEMORY[0x263F72BC8]);
        char v70 = sub_23CA0E4B0();
        id v71 = *v80;
        (*v80)((uint64_t)v69, v62);
        sub_23C9BAA2C(v96, &qword_268BBEB98);
        sub_23C9BAA2C((uint64_t)v95, &qword_268BBEB98);
        v71(v68, v62);
        sub_23C9BAA2C(v63, &qword_268BBEB98);
        unint64_t v12 = v87;
        uint64_t v53 = v86;
        unint64_t v55 = v85;
        uint64_t v56 = v81;
        uint64_t v57 = v98;
        if (v70)
        {
LABEL_66:
          uint64_t v72 = sub_23CA0DCB0();
          swift_release();
          if (!v72)
          {
            *((void *)&v101 + 1) = sub_23CA0D970();
            swift_release();
            *(void *)&long long v100 = v90;
            goto LABEL_69;
          }
        }
LABEL_67:
        swift_release();
        swift_release();
        goto LABEL_68;
      }
      sub_23C9BAA2C(v96, &qword_268BBEB98);
      sub_23C9BAA2C((uint64_t)v95, &qword_268BBEB98);
      (*v80)(v67, v62);
      unint64_t v12 = v87;
      uint64_t v53 = v86;
      uint64_t v56 = v81;
    }
    sub_23C9BAA2C((uint64_t)v97, &qword_268BBECA0);
    unint64_t v55 = v85;
    uint64_t v57 = v98;
    goto LABEL_67;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C9FB014@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECB0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v38[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_23CA0DAF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v47 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v49 = &v38[-v11];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v48 = &v38[-v13];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = &v38[-v15];
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  char v19 = &v38[-v18];
  MEMORY[0x270FA5388](v17);
  unint64_t v55 = (uint64_t *)&v38[-v20];
  uint64_t result = sub_23CA0D730();
  if (!v53) {
    goto LABEL_12;
  }
  uint64_t v50 = v1;
  if (sub_23CA0D910())
  {
    uint64_t v22 = sub_23CA0D7B0();
    swift_release();
    if (v22)
    {
      *(void *)(a1 + 24) = sub_23CA0D9A0();
      uint64_t result = swift_release();
      *(void *)a1 = v22;
      return result;
    }
  }
  if (!sub_23CA0D8C0())
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_11;
  }
  sub_23CA0DAE0();
  swift_release();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_11:
    swift_release();
    uint64_t result = sub_23C9BAA2C((uint64_t)v5, &qword_268BBECB0);
    goto LABEL_12;
  }
  uint64_t v44 = *(void (**)(uint64_t *, unsigned char *, uint64_t))(v7 + 32);
  v44(v55, v5, v6);
  uint64_t v23 = *MEMORY[0x263F72F38];
  os_log_type_t v42 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 104);
  uint64_t v43 = v7 + 104;
  v42(v19, v23, v6);
  uint64_t v24 = sub_23C9FB6B0(&qword_268BBECB8, MEMORY[0x263F72F48]);
  sub_23CA0E580();
  uint64_t v41 = v24;
  sub_23CA0E580();
  uint64_t v45 = v7 + 32;
  if (v53 == v51 && v54 == v52) {
    LODWORD(v46) = 1;
  }
  else {
    LODWORD(v46) = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = v7;
  uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v26(v19, v6);
  os_log_type_t v29 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v25 + 16);
  uint64_t v27 = v25 + 16;
  uint64_t v28 = v29;
  uint64_t v30 = v55;
  v29(v16, v55, v6);
  if (v46) {
    goto LABEL_18;
  }
  uint64_t v46 = v26;
  uint64_t v40 = v27;
  v42(v48, *MEMORY[0x263F72F30], v6);
  sub_23CA0E580();
  sub_23CA0E580();
  if (v53 != v51 || v54 != v52)
  {
    int v39 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = v46;
    v46(v48, v6);
    v26(v16, v6);
    uint64_t v31 = v49;
    uint64_t v30 = v55;
    v28(v49, v55, v6);
    if (v39) {
      goto LABEL_19;
    }
    uint64_t v33 = v47;
    v42(v47, *MEMORY[0x263F72F40], v6);
    sub_23CA0E580();
    sub_23CA0E580();
    if (v53 == v51 && v54 == v52)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v34 = v46;
      v46(v33, v6);
      uint64_t v30 = v55;
      v34(v31, v6);
      goto LABEL_20;
    }
    char v35 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v36 = v33;
    unint64_t v37 = v46;
    v46(v36, v6);
    v37(v31, v6);
    uint64_t v30 = v55;
    if (v35) {
      goto LABEL_20;
    }
    v37(v55, v6);
    uint64_t result = swift_release();
LABEL_12:
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return result;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v26 = v46;
  v46(v48, v6);
  uint64_t v30 = v55;
LABEL_18:
  v26(v16, v6);
  uint64_t v31 = v49;
  v28(v49, v30, v6);
LABEL_19:
  v26(v31, v6);
LABEL_20:
  *(void *)(a1 + 24) = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
  v44(boxed_opaque_existential_1, v30, v6);
  return swift_release();
}

uint64_t sub_23C9FB6B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9FB6F8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000031;
  unint64_t v4 = 0x800000023CA15060;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000034;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Timer.Disambiguation";
      goto LABEL_8;
    case 2:
      unint64_t v3 = 0xD000000000000042;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Alarm.ReformedAlarmIntentFromTimer";
      goto LABEL_8;
    case 3:
      uint64_t v6 = "com.apple.siri.DirectInvocation.Timer.Stop";
      goto LABEL_6;
    case 4:
      uint64_t v6 = "com.apple.siri.DirectInvocation.Timer.Undo";
LABEL_6:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD00000000000002ALL;
      break;
    case 5:
      unint64_t v3 = 0xD000000000000036;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Timer.HandleVerbAction";
LABEL_8:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000031;
  unint64_t v8 = 0x800000023CA15060;
  switch(a2)
  {
    case 1:
      unint64_t v9 = 0xD000000000000034;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Timer.Disambiguation";
      goto LABEL_18;
    case 2:
      unint64_t v9 = 0xD000000000000042;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Alarm.ReformedAlarmIntentFromTimer";
      goto LABEL_18;
    case 3:
      uint64_t v11 = "com.apple.siri.DirectInvocation.Timer.Stop";
      goto LABEL_14;
    case 4:
      uint64_t v11 = "com.apple.siri.DirectInvocation.Timer.Undo";
LABEL_14:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD00000000000002ALL;
      goto LABEL_15;
    case 5:
      unint64_t v9 = 0xD000000000000036;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Timer.HandleVerbAction";
LABEL_18:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      if (v3 == v9) {
        goto LABEL_19;
      }
      goto LABEL_21;
    default:
LABEL_15:
      if (v3 != v7) {
        goto LABEL_21;
      }
LABEL_19:
      if (v4 == v8) {
        char v12 = 1;
      }
      else {
LABEL_21:
      }
        char v12 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_23C9FB8C0(char a1, char a2)
{
  if (*(void *)&aVerb_3[8 * a1] == *(void *)&aVerb_3[8 * a2] && qword_23CA112A8[a1] == qword_23CA112A8[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23C9FB948(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000031;
  unint64_t v4 = 0x800000023CA15210;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000034;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Alarm.Disambiguation";
      goto LABEL_8;
    case 2:
      uint64_t v6 = "com.apple.siri.DirectInvocation.Alarm.Stop";
      goto LABEL_5;
    case 3:
      uint64_t v6 = "com.apple.siri.DirectInvocation.Alarm.Undo";
LABEL_5:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD00000000000002ALL;
      break;
    case 4:
      unint64_t v3 = 0xD000000000000036;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Alarm.HandleVerbAction";
      goto LABEL_8;
    case 5:
      unint64_t v3 = 0xD000000000000042;
      uint64_t v5 = "com.apple.siri.DirectInvocation.Alarm.ReformedAlarmIntentFromTimer";
LABEL_8:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000031;
  unint64_t v8 = 0x800000023CA15210;
  switch(a2)
  {
    case 1:
      unint64_t v9 = 0xD000000000000034;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Alarm.Disambiguation";
      goto LABEL_18;
    case 2:
      uint64_t v11 = "com.apple.siri.DirectInvocation.Alarm.Stop";
      goto LABEL_13;
    case 3:
      uint64_t v11 = "com.apple.siri.DirectInvocation.Alarm.Undo";
LABEL_13:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD00000000000002ALL;
      goto LABEL_14;
    case 4:
      unint64_t v9 = 0xD000000000000036;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Alarm.HandleVerbAction";
      goto LABEL_18;
    case 5:
      unint64_t v9 = 0xD000000000000042;
      uint64_t v10 = "com.apple.siri.DirectInvocation.Alarm.ReformedAlarmIntentFromTimer";
LABEL_18:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      if (v3 == v9) {
        goto LABEL_19;
      }
      goto LABEL_21;
    default:
LABEL_14:
      if (v3 != v7) {
        goto LABEL_21;
      }
LABEL_19:
      if (v4 == v8) {
        char v12 = 1;
      }
      else {
LABEL_21:
      }
        char v12 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_23C9FBB10(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000023CA15330;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xED00006465737365;
      unint64_t v5 = 0x72506E6F74747562;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x64496D72616C61;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xEE00796C746E656CLL;
      unint64_t v5 = 0x6953656C646E6168;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6C6562616CLL;
      break;
    case 6:
      unint64_t v3 = 0xEE0073746E656E6FLL;
      unint64_t v5 = 0x706D6F4365746164;
      break;
    case 7:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1920298856;
      break;
    case 8:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6574756E696DLL;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1651664246;
      break;
  }
  unint64_t v6 = 0x800000023CA15330;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED00006465737365;
      if (v5 == 0x72506E6F74747562) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x64496D72616C61) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      goto LABEL_24;
    case 4:
      unint64_t v6 = 0xEE00796C746E656CLL;
      if (v5 != 0x6953656C646E6168) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6C6562616CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v6 = 0xEE0073746E656E6FLL;
      if (v5 != 0x706D6F4365746164) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v2 = 1920298856;
LABEL_24:
      if (v5 == v2) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 8:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6574756E696DLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1651664246) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_23C9FBDEC(char a1, char a2)
{
  if (*(void *)&aClock_4[8 * a1] == *(void *)&aClock_4[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_23C9FBE54(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C65636E6163;
  }
  else {
    uint64_t v3 = 7562617;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C65636E6163;
  }
  else {
    uint64_t v5 = 7562617;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23C9FBEEC(char a1, char a2)
{
  if (*(void *)&aSleep_4[8 * a1] == *(void *)&aSleep_4[8 * a2] && qword_23CA11338[a1] == qword_23CA11338[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23C9FBF74(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000014;
  unint64_t v4 = 0x800000023CA153B0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x616572436F646E55;
      goto LABEL_5;
    case 2:
      unint64_t v3 = 0x656C65446F646E55;
LABEL_5:
      unint64_t v4 = 0xEF72656D69546574;
      break;
    case 3:
      break;
    case 4:
      uint64_t v5 = "INCreateTimerIntent";
      goto LABEL_11;
    case 5:
      unint64_t v3 = 0x616572436F646E55;
      goto LABEL_9;
    case 6:
      unint64_t v3 = 0x656C65446F646E55;
LABEL_9:
      unint64_t v4 = 0xEF6D72616C416574;
      break;
    case 7:
      uint64_t v5 = "INCreateAlarmIntent";
LABEL_11:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000013;
      break;
    case 8:
      unint64_t v3 = 0xD000000000000015;
      unint64_t v4 = 0x800000023CA15430;
      break;
    default:
      unint64_t v3 = 0x54746E6572727543;
      unint64_t v4 = 0xEB000000006B7361;
      break;
  }
  unint64_t v6 = 0xD000000000000014;
  unint64_t v7 = 0x800000023CA153B0;
  switch(a2)
  {
    case 1:
      uint64_t v8 = 0x616572436F646E55;
      goto LABEL_18;
    case 2:
      uint64_t v8 = 0x656C65446F646E55;
LABEL_18:
      unint64_t v7 = 0xEF72656D69546574;
      if (v3 != v8) {
        goto LABEL_31;
      }
      goto LABEL_28;
    case 3:
      goto LABEL_27;
    case 4:
      unint64_t v9 = "INCreateTimerIntent";
      goto LABEL_26;
    case 5:
      uint64_t v10 = 0x616572436F646E55;
      goto LABEL_23;
    case 6:
      uint64_t v10 = 0x656C65446F646E55;
LABEL_23:
      unint64_t v7 = 0xEF6D72616C416574;
      if (v3 != v10) {
        goto LABEL_31;
      }
      goto LABEL_28;
    case 7:
      unint64_t v9 = "INCreateAlarmIntent";
LABEL_26:
      unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      unint64_t v6 = 0xD000000000000013;
LABEL_27:
      if (v3 == v6) {
        goto LABEL_28;
      }
      goto LABEL_31;
    case 8:
      unint64_t v7 = 0x800000023CA15430;
      if (v3 != 0xD000000000000015) {
        goto LABEL_31;
      }
      goto LABEL_28;
    default:
      unint64_t v7 = 0xEB000000006B7361;
      if (v3 != 0x54746E6572727543) {
        goto LABEL_31;
      }
LABEL_28:
      if (v4 == v7) {
        char v11 = 1;
      }
      else {
LABEL_31:
      }
        char v11 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

uint64_t sub_23C9FC248(uint64_t a1, uint64_t a2)
{
  return sub_23C9FC260(a1, a2, (uint64_t (*)(void))SiriTimeEventSender.ReasonDescription.rawValue.getter);
}

uint64_t sub_23C9FC260(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_23CA0ECB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_23C9FC304(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x800000023CA14F00;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000018;
      uint64_t v6 = "com.apple.NanoWorldClock";
      goto LABEL_8;
    case 2:
      unint64_t v5 = 0x6C7070612E6D6F63;
      unint64_t v3 = 0xEF6B636F6C632E65;
      break;
    case 3:
      unint64_t v5 = 0xD00000000000001BLL;
      uint64_t v6 = "com.apple.private.NanoTimer";
      goto LABEL_8;
    case 4:
      unint64_t v5 = 0xD000000000000013;
      uint64_t v6 = "com.apple.NanoAlarm";
      goto LABEL_8;
    case 5:
      unint64_t v5 = 0xD000000000000010;
      uint64_t v6 = "com.apple.Health";
      goto LABEL_8;
    case 6:
      unint64_t v5 = 0xD00000000000001FLL;
      uint64_t v6 = "com.apple.NanoSleep.watchkitapp";
LABEL_8:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 7:
      uint64_t v7 = "com.apple.siri.SiriTimeInternal.TimerIntentsExtension";
      goto LABEL_11;
    case 8:
      uint64_t v7 = "com.apple.siri.SiriTimeInternal.AlarmIntentsExtension";
LABEL_11:
      unint64_t v3 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000035;
      break;
    default:
      break;
  }
  unint64_t v8 = 0x800000023CA14F00;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000018;
      char v9 = "com.apple.NanoWorldClock";
      goto LABEL_20;
    case 2:
      unint64_t v8 = 0xEF6B636F6C632E65;
      if (v5 != 0x6C7070612E6D6F63) {
        goto LABEL_27;
      }
      goto LABEL_22;
    case 3:
      unint64_t v2 = 0xD00000000000001BLL;
      char v9 = "com.apple.private.NanoTimer";
      goto LABEL_20;
    case 4:
      unint64_t v2 = 0xD000000000000013;
      char v9 = "com.apple.NanoAlarm";
      goto LABEL_20;
    case 5:
      unint64_t v2 = 0xD000000000000010;
      char v9 = "com.apple.Health";
      goto LABEL_20;
    case 6:
      unint64_t v2 = 0xD00000000000001FLL;
      char v9 = "com.apple.NanoSleep.watchkitapp";
LABEL_20:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      goto LABEL_21;
    case 7:
      char v11 = "com.apple.siri.SiriTimeInternal.TimerIntentsExtension";
      goto LABEL_26;
    case 8:
      char v11 = "com.apple.siri.SiriTimeInternal.AlarmIntentsExtension";
LABEL_26:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      if (v5 != 0xD000000000000035) {
        goto LABEL_27;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_27;
      }
LABEL_22:
      if (v3 == v8) {
        char v10 = 1;
      }
      else {
LABEL_27:
      }
        char v10 = sub_23CA0ECB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10 & 1;
  }
}

uint64_t sub_23C9FC570()
{
  uint64_t result = 0;
  switch(*v0)
  {
    case 1:
    case 0xE:
      return 0x6C654472656D6954;
    case 2:
    case 0xF:
      uint64_t v2 = 0x4472656D6954;
      goto LABEL_13;
    case 3:
    case 0x10:
      uint64_t v3 = 0x5572656D6954;
      goto LABEL_10;
    case 4:
    case 5:
    case 0x11:
    case 0x12:
    case 0x21:
      return 0xD000000000000010;
    case 6:
    case 0x13:
      return 0xD000000000000015;
    case 7:
    case 0x15:
      return 0x7465466D72616C41;
    case 8:
    case 0x16:
      return 0x6464416D72616C41;
    case 9:
    case 0x17:
      uint64_t v3 = 0x556D72616C41;
LABEL_10:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6470000000000000;
      break;
    case 0xA:
    case 0x18:
      uint64_t result = 0x6D65526D72616C41;
      break;
    case 0xB:
    case 0x19:
      uint64_t v2 = 0x446D72616C41;
LABEL_13:
      uint64_t result = v2 & 0xFFFFFFFFFFFFLL | 0x7369000000000000;
      break;
    case 0xC:
    case 0x1A:
      uint64_t result = 0x6F6E536D72616C41;
      break;
    case 0x14:
      uint64_t result = 0xD000000000000013;
      break;
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
    case 0x23:
      return result;
    case 0x22:
      uint64_t result = 0x737365536576694CLL;
      break;
    default:
      uint64_t result = 0x64644172656D6954;
      break;
  }
  return result;
}

SiriTimeInternal::SiriTimeMeasurement::LogDescription_optional __swiftcall SiriTimeMeasurement.LogDescription.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_23CA0ECD0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 18;
  switch(v3)
  {
    case 0:
      goto LABEL_20;
    case 1:
      char v5 = 1;
      goto LABEL_20;
    case 2:
      char v5 = 2;
      goto LABEL_20;
    case 3:
      char v5 = 3;
      goto LABEL_20;
    case 4:
      char v5 = 4;
      goto LABEL_20;
    case 5:
      char v5 = 5;
      goto LABEL_20;
    case 6:
      char v5 = 6;
      goto LABEL_20;
    case 7:
      char v5 = 7;
      goto LABEL_20;
    case 8:
      char v5 = 8;
      goto LABEL_20;
    case 9:
      char v5 = 9;
      goto LABEL_20;
    case 10:
      char v5 = 10;
      goto LABEL_20;
    case 11:
      char v5 = 11;
      goto LABEL_20;
    case 12:
      char v5 = 12;
      goto LABEL_20;
    case 13:
      char v5 = 13;
      goto LABEL_20;
    case 14:
      char v5 = 14;
      goto LABEL_20;
    case 15:
      char v5 = 15;
      goto LABEL_20;
    case 16:
      char v5 = 16;
      goto LABEL_20;
    case 17:
      char v5 = 17;
LABEL_20:
      char v6 = v5;
      break;
    case 18:
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    case 33:
      char v6 = 33;
      break;
    case 34:
      char v6 = 34;
      break;
    case 35:
      char v6 = 35;
      break;
    default:
      char v6 = 36;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

uint64_t sub_23C9FCAA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C9FC260(*a1, *a2, (uint64_t (*)(void))SiriTimeMeasurement.LogDescription.rawValue.getter) & 1;
}

uint64_t sub_23C9FCADC()
{
  return sub_23CA0ED20();
}

uint64_t sub_23C9FCB44()
{
  SiriTimeMeasurement.LogDescription.rawValue.getter();
  sub_23CA0E520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C9FCBA8()
{
  return sub_23CA0ED20();
}

SiriTimeInternal::SiriTimeMeasurement::LogDescription_optional sub_23C9FCC0C(Swift::String *a1)
{
  return SiriTimeMeasurement.LogDescription.init(rawValue:)(*a1);
}

unint64_t sub_23C9FCC18@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriTimeMeasurement.LogDescription.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

double sub_23C9FCC40()
{
  v1[1] = *(mach_timebase_info *)MEMORY[0x263EF8340];
  v1[0] = 0;
  mach_timebase_info(v1);
  double result = *(double *)v1;
  qword_268BBECC0 = (uint64_t)v1[0];
  return result;
}

void sub_23C9FCCA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECF0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = 1026;
  switch(*(unsigned char *)(v0 + 8))
  {
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1A:
      uint64_t v3 = 1028;
      goto LABEL_4;
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
    case 0x23:
      return;
    case 0x21:
    case 0x22:
      goto LABEL_4;
    default:
      uint64_t v3 = 1027;
LABEL_4:
      char v17 = *(unsigned char *)(v0 + 8);
      sub_23C9FC570();
      if (!v4) {
        return;
      }
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC08]), sel_init);
      if (v5)
      {
        id v16 = v5;
        id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC20]), sel_init);
        if (v6)
        {
          id v15 = v6;
          id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF8]), sel_init);
          if (v7)
          {
            unint64_t v8 = v7;
            objc_msgSend(v15, sel_setDomainExecutionType_, v3);
            objc_msgSend(v16, sel_setStartedOrChanged_, v15);
            objc_msgSend(v16, sel_setContextId_, *(void *)(v0 + *(int *)(type metadata accessor for SiriTimeMeasurement() + 36)));
            objc_msgSend(v8, sel_setFlowDomainExecutionContext_, v16);
            sub_23CA0D050();
            id v9 = v8;
            uint64_t v10 = sub_23CA0D040();
            uint64_t v11 = sub_23CA0E660();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v2, 1, 1, v11);
            char v12 = (void *)swift_allocObject();
            v12[2] = 0;
            uint64_t v12[3] = 0;
            v12[4] = v10;
            swift_retain();
            sub_23C9FD294((uint64_t)v2, (uint64_t)&unk_268BBED00, (uint64_t)v12);

            swift_release();
            swift_release();
            sub_23C9BAA2C((uint64_t)v2, &qword_268BBECF0);
            return;
          }
          swift_bridgeObjectRelease();

          id v13 = v15;
        }
        else
        {
          swift_bridgeObjectRelease();
          id v13 = v16;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      return;
  }
}

uint64_t SiriTimeMeasurement.setBreachThreshold(_:logSubtype:)(uint64_t *a1, double a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v6 = type metadata accessor for SiriTimeMeasurement();
  id v7 = (uint64_t *)(v2 + *(int *)(v6 + 28));
  uint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  sub_23C9E1A50(v4, v5);
  uint64_t result = sub_23C9FE030(v8, v9);
  *id v7 = v4;
  v7[1] = v5;
  *(double *)(v2 + *(int *)(v6 + 32)) = a2;
  return result;
}

uint64_t sub_23C9FD0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return MEMORY[0x270FA2498](sub_23C9FD0D0, 0, 0);
}

uint64_t sub_23C9FD0D0()
{
  sub_23CA0CFB0();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_23C9FD198;
  uint64_t v4 = v0[7];
  return MEMORY[0x270F66DC0](v4, v1, v2);
}

uint64_t sub_23C9FD198()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9FECC8, 0, 0);
}

uint64_t sub_23C9FD294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECF0);
  MEMORY[0x270FA5388]();
  id v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C9FE9FC(a1, (uint64_t)v7);
  uint64_t v8 = sub_23CA0E660();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_23C9BAA2C((uint64_t)v7, &qword_268BBECF0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_23CA0E630();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23CA0E650();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

void sub_23C9FD480()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECF0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v4 = *(unsigned __int8 *)(v0 + 8);
  if (v4 < 0x1B || ((1 << v4) & 0x9F8000000) == 0)
  {
    char v18 = *(unsigned char *)(v0 + 8);
    sub_23C9FC570();
    if (v5)
    {
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC08]), sel_init);
      if (v6)
      {
        id v17 = v6;
        id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC10]), sel_init);
        if (v7)
        {
          id v16 = v7;
          id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF8]), sel_init);
          if (v8)
          {
            uint64_t v9 = v8;
            objc_msgSend(v16, sel_setExists_, 1);
            objc_msgSend(v17, sel_setEnded_, v16);
            objc_msgSend(v17, sel_setContextId_, *(void *)(v0 + *(int *)(type metadata accessor for SiriTimeMeasurement() + 36)));
            objc_msgSend(v9, sel_setFlowDomainExecutionContext_, v17);
            sub_23CA0D050();
            id v10 = v9;
            uint64_t v11 = sub_23CA0D040();
            uint64_t v12 = sub_23CA0E660();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
            uint64_t v13 = (void *)swift_allocObject();
            _OWORD v13[2] = 0;
            v13[3] = 0;
            v13[4] = v11;
            swift_retain();
            sub_23C9FD294((uint64_t)v3, (uint64_t)&unk_268BBED20, (uint64_t)v13);

            swift_release();
            swift_release();
            sub_23C9BAA2C((uint64_t)v3, &qword_268BBECF0);
            return;
          }
          swift_bridgeObjectRelease();

          id v14 = v16;
        }
        else
        {
          swift_bridgeObjectRelease();
          id v14 = v17;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t sub_23C9FD76C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return MEMORY[0x270FA2498](sub_23C9FD78C, 0, 0);
}

uint64_t sub_23C9FD78C()
{
  sub_23CA0CFB0();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_23C9FD854;
  uint64_t v4 = v0[7];
  return MEMORY[0x270F66DC0](v4, v1, v2);
}

uint64_t sub_23C9FD854()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23C9FD950, 0, 0);
}

uint64_t sub_23C9FD950()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23C9FD9B0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23C9FDA8C;
  return v6(a1);
}

uint64_t sub_23C9FDA8C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23C9FDB84(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  unsigned __int8 v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  sub_23C9FEB54(a1, a2, a3, a4, (uint64_t (*)(void))sub_23C9E1A50, (uint64_t (*)(void))sub_23C9E1AFC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1C00, sub_23C9E2788);
  if (qword_268BBDEB0 != -1) {
    swift_once();
  }
  if (byte_268BC2CF8 == 1)
  {
    if (qword_268BBDEA0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23CA0E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_268BBE770);
    uint64_t v9 = sub_23CA0E3F0();
    os_log_type_t v10 = sub_23CA0E700();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_23C9B6000, v9, v10, "SiriTime initiating AutoBugCapture report...", v11, 2u);
      MEMORY[0x23ECEDBE0](v11, -1, -1);
    }

    uint64_t v12 = v4 >> 4;
    unint64_t v13 = 0x800000023CA16280;
    uint64_t v14 = 0xD000000000000013;
    switch(v12)
    {
      case 1:
        uint64_t v15 = 0x4972656D6954;
        goto LABEL_13;
      case 2:
        uint64_t v16 = 0x5272656D6954;
        goto LABEL_15;
      case 3:
        uint64_t v15 = 0x496D72616C41;
LABEL_13:
        uint64_t v14 = v15 & 0xFFFFFFFFFFFFLL | 0x746E000000000000;
        unint64_t v13 = 0xEB00000000746E65;
        break;
      case 4:
        uint64_t v16 = 0x526D72616C41;
LABEL_15:
        uint64_t v14 = v16 & 0xFFFFFFFFFFFFLL | 0x7365000000000000;
        unint64_t v13 = 0xED000065736E6F70;
        break;
      case 5:
        uint64_t v17 = 0x5572656D6954;
        goto LABEL_18;
      case 6:
        uint64_t v17 = 0x556D72616C41;
LABEL_18:
        uint64_t v14 = v17 & 0xFFFFFFFFFFFFLL | 0x646E000000000000;
        unint64_t v13 = 0xE90000000000006FLL;
        break;
      case 7:
        unint64_t v13 = 0xEE0074726F624164;
        uint64_t v14 = 0x656C646E61686E55;
        break;
      case 8:
        unint64_t v13 = 0xEB00000000726579;
        uint64_t v14 = 0x614C676F6C616944;
        break;
      case 9:
        unint64_t v13 = 0xEA00000000007963;
        uint64_t v14 = 0x6E65646E65706544;
        break;
      case 10:
        break;
      default:
        unint64_t v13 = 0xE600000000000000;
        uint64_t v14 = 0x676E696D6954;
        break;
    }
    unint64_t v18 = ABCReport.subType.getter();
    uint64_t v20 = v19;
    unint64_t v21 = ABCReport.context.getter();
    uint64_t v23 = v22;
    if (qword_268BBDEA8 != -1) {
      swift_once();
    }
    sub_23CA0E0D0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_23CA0E0C0();
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v14;
    v24[3] = v13;
    v24[4] = v18;
    v24[5] = v20;
    v24[6] = v21;
    v24[7] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23CA0E0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    uint64_t v7 = a1;
    uint64_t v6 = a2;
    uint64_t v5 = a3;
    unsigned __int8 v4 = a4;
  }
  return sub_23C9FEB54(v7, v6, v5, v4, (uint64_t (*)(void))sub_23C9E1A64, (uint64_t (*)(void))sub_23C9E1A78, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_23C9E1A8C, sub_23C9E2784);
}

uint64_t sub_23C9FE030(uint64_t a1, unint64_t a2)
{
  if (a2 != 2) {
    return sub_23C9E1A64(a1, a2);
  }
  return a1;
}

unint64_t sub_23C9FE044()
{
  unint64_t result = qword_268BBECD0;
  if (!qword_268BBECD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBECD0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriTimeMeasurement(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned __int8 v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unsigned __int8 v4 = *a2;
    unsigned __int8 v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = a3[6];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_23CA0E410();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (uint64_t)a2 + v11;
    unint64_t v14 = *(void *)(v13 + 8);
    if (v14 <= 2)
    {
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    }
    else
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *((void *)v12 + 1) = v14;
      swift_bridgeObjectRetain();
    }
    uint64_t v16 = a3[9];
    *(void *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v17 = *(void **)((char *)a2 + v16);
    *(void *)((char *)v4 + v16) = v17;
    id v18 = v17;
  }
  return v4;
}

uint64_t assignWithCopy for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA0E410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  unint64_t v13 = *(void *)(a1 + v10 + 8);
  unint64_t v14 = *(void *)(a2 + v10 + 8);
  if (v13 == 2)
  {
    if (v14 > 2) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (v14 == 2)
  {
    sub_23C9FE328((uint64_t)v11);
    goto LABEL_11;
  }
  if (v13 >= 2)
  {
    if (v14 >= 2)
    {
      *uint64_t v11 = *v12;
      v11[1] = v12[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_23C9BAA2C((uint64_t)v11, &qword_268BBECD8);
    goto LABEL_11;
  }
  if (v14 < 2)
  {
LABEL_11:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    goto LABEL_12;
  }
LABEL_8:
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
LABEL_12:
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v15 = a3[9];
  uint64_t v16 = *(void **)(a2 + v15);
  uint64_t v17 = *(void **)(a1 + v15);
  *(void *)(a1 + v15) = v16;
  id v18 = v16;

  return a1;
}

uint64_t sub_23C9FE328(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA0E410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA0E410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  unint64_t v13 = *(void *)(a1 + v10 + 8);
  unint64_t v14 = *(void *)(a2 + v10 + 8);
  if (v13 != 2)
  {
    if (v14 == 2)
    {
      sub_23C9FE328((uint64_t)v11);
    }
    else if (v13 >= 2)
    {
      if (v14 >= 2)
      {
        *uint64_t v11 = *v12;
        v11[1] = v14;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_23C9BAA2C((uint64_t)v11, &qword_268BBECD8);
    }
  }
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
LABEL_8:
  uint64_t v15 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v16 = *(void **)(a1 + v15);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);

  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeMeasurement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23C9FE564);
}

uint64_t sub_23C9FE564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23CA0E410();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SiriTimeMeasurement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23C9FE63C);
}

uint64_t sub_23C9FE63C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_23CA0E410();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_23C9FE6FC()
{
  uint64_t result = sub_23CA0E410();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTimeMeasurement.LogDescription(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDD) {
    goto LABEL_17;
  }
  if (a2 + 35 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 35) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 35;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x24;
  int v8 = v6 - 36;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriTimeMeasurement.LogDescription(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDC)
  {
    unsigned int v6 = ((a2 - 221) >> 8) + 1;
    *uint64_t result = a2 + 35;
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
        JUMPOUT(0x23C9FE914);
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
          *uint64_t result = a2 + 35;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeMeasurement.LogDescription()
{
  return &type metadata for SiriTimeMeasurement.LogDescription;
}

uint64_t sub_23C9FE950()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_23C9E84D4;
  v3[7] = v2;
  return MEMORY[0x270FA2498](sub_23C9FD0D0, 0, 0);
}

uint64_t sub_23C9FE9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBECF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C9FEA64()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C9FEA9C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23C9C8C60;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268BBED08 + dword_268BBED08);
  return v6(a1, v4);
}

uint64_t sub_23C9FEB54(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, void), uint64_t (*a8)(void))
{
  switch(a4 >> 4)
  {
    case 0:
      uint64_t result = a5();
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      uint64_t result = a6();
      break;
    case 7:
      uint64_t result = a7(result, a2, a3, a4 & 0xF);
      break;
    case 8:
      uint64_t result = a8();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C9FEBD0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23C9FEC1C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_23C9C8C60;
  v3[7] = v2;
  return MEMORY[0x270FA2498](sub_23C9FD78C, 0, 0);
}

void sub_23C9FECCC()
{
  unk_268BBED36 = -4864;
}

uint64_t static SiriTimePluginModel.bundleName.getter()
{
  if (qword_268BBDF20 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268BBED28;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t SiriTimePluginModel.snippetHidden(for:idiom:)()
{
  uint64_t v1 = sub_23CA0E0A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SiriTimePluginModel(0);
  MEMORY[0x270FA5388](v5 - 8);
  BOOL v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA01480(v0, (uint64_t)v7, type metadata accessor for SiriTimePluginModel);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F75620], v1);
  char v8 = sub_23CA0E090();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_23C9FF640((uint64_t)v7, type metadata accessor for SiriTimePluginModel);
  return v8 & 1;
}

uint64_t type metadata accessor for SiriTimePluginModel(uint64_t a1)
{
  return sub_23C9D68A4(a1, (uint64_t *)&unk_268BBEE70);
}

uint64_t sub_23C9FEF08(char a1)
{
  if (a1) {
    return 0x6C655372656D6974;
  }
  else {
    return 0x6C754D72656D6974;
  }
}

BOOL sub_23C9FEF50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23C9FEF70()
{
  return sub_23C9FEF08(*v0);
}

uint64_t sub_23C9FEF78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA073B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C9FEFA0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C9FEFAC(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF598();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9FEFE8(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF598();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23C9FF024(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF6A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9FF060(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF6A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23C9FF09C(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF5EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9FF0D8(uint64_t a1)
{
  unint64_t v2 = sub_23C9FF5EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriTimePluginModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED38);
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v25 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for TimerSelectorModel(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v24 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED40);
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriTimePluginModel(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED48);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C9FF598();
  sub_23CA0ED40();
  sub_23CA01480(v28, (uint64_t)v10, type metadata accessor for SiriTimePluginModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = v24;
    sub_23C9FFDB0((uint64_t)v10, v24, type metadata accessor for TimerSelectorModel);
    char v31 = 1;
    sub_23C9FF5EC();
    uint64_t v16 = v25;
    sub_23CA0EAF0();
    sub_23C9FFD68(&qword_268BBED60, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
    uint64_t v17 = v27;
    sub_23CA0EB50();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v17);
    sub_23C9FF640(v15, type metadata accessor for TimerSelectorModel);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    uint64_t v19 = *v10;
    char v30 = 0;
    sub_23C9FF6A0();
    sub_23CA0EAF0();
    uint64_t v29 = v19;
    sub_23C9FF6F4();
    uint64_t v20 = v22;
    sub_23CA0EB50();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for TimerSelectorModel(uint64_t a1)
{
  return sub_23C9D68A4(a1, (uint64_t *)&unk_268BBEE90);
}

unint64_t sub_23C9FF598()
{
  unint64_t result = qword_268BBED50;
  if (!qword_268BBED50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBED50);
  }
  return result;
}

unint64_t sub_23C9FF5EC()
{
  unint64_t result = qword_268BBED58;
  if (!qword_268BBED58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBED58);
  }
  return result;
}

uint64_t sub_23C9FF640(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23C9FF6A0()
{
  unint64_t result = qword_268BBED68;
  if (!qword_268BBED68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBED68);
  }
  return result;
}

unint64_t sub_23C9FF6F4()
{
  unint64_t result = qword_268BBED70;
  if (!qword_268BBED70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBED70);
  }
  return result;
}

uint64_t SiriTimePluginModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED78);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v47 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED80);
  uint64_t v41 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBED88);
  uint64_t v44 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SiriTimePluginModel(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v37 - v15;
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v37 - v17;
  uint64_t v19 = a1[3];
  uint64_t v48 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23C9FF598();
  uint64_t v20 = v49;
  sub_23CA0ED30();
  if (v20) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  }
  unint64_t v37 = v16;
  unint64_t v38 = v18;
  int v39 = v13;
  uint64_t v21 = v45;
  uint64_t v22 = v46;
  uint64_t v23 = v47;
  uint64_t v49 = v10;
  uint64_t v24 = sub_23CA0EAC0();
  uint64_t v25 = v9;
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v31 = sub_23CA0E940();
    swift_allocError();
    uint64_t v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE580);
    uint64_t *v33 = v49;
    sub_23CA0EA40();
    sub_23CA0E930();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, *MEMORY[0x263F8DCB0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v7);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    char v52 = 1;
    sub_23C9FF5EC();
    uint64_t v26 = v23;
    sub_23CA0EA30();
    type metadata accessor for TimerSelectorModel(0);
    sub_23C9FFD68(&qword_268BBED90, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
    uint64_t v27 = (uint64_t)v39;
    uint64_t v28 = v42;
    sub_23CA0EAB0();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v7);
    uint64_t v29 = (uint64_t)v48;
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = v27;
  }
  else
  {
    char v51 = 0;
    sub_23C9FF6A0();
    sub_23CA0EA30();
    sub_23C9FFE18();
    sub_23CA0EAB0();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v7);
    uint64_t v29 = (uint64_t)v48;
    char v35 = v37;
    *unint64_t v37 = v50;
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = (uint64_t)v35;
  }
  uint64_t v36 = (uint64_t)v38;
  sub_23C9FFDB0(v30, (uint64_t)v38, type metadata accessor for SiriTimePluginModel);
  sub_23C9FFDB0(v36, v40, type metadata accessor for SiriTimePluginModel);
  return __swift_destroy_boxed_opaque_existential_1Tm(v29);
}

uint64_t sub_23C9FFD68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9FFDB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_23C9FFE18()
{
  unint64_t result = qword_268BBED98;
  if (!qword_268BBED98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBED98);
  }
  return result;
}

uint64_t sub_23C9FFE6C()
{
  if (qword_268BBDF20 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268BBED28;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_23C9FFED8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimePluginModel.init(from:)(a1, a2);
}

uint64_t sub_23C9FFEF0(void *a1)
{
  return SiriTimePluginModel.encode(to:)(a1);
}

uint64_t TimerSnippetModel.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TimerSnippetModel.timers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*TimerSnippetModel.timers.modify())()
{
  return nullsub_1;
}

SiriTimeInternal::TimerSnippetModel __swiftcall TimerSnippetModel.init(timers:)(SiriTimeInternal::TimerSnippetModel timers)
{
  v1->timers._rawValue = timers.timers._rawValue;
  return timers;
}

uint64_t TimerSnippetModel.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA00110();
  sub_23CA0ED30();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDB0);
    sub_23CA00310(&qword_268BBEDB8, &qword_268BBEDC0);
    sub_23CA0EAB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

unint64_t sub_23CA00110()
{
  unint64_t result = qword_268BBEDA8;
  if (!qword_268BBEDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEDA8);
  }
  return result;
}

uint64_t type metadata accessor for SiriTimerSnippetModel(uint64_t a1)
{
  return sub_23C9D68A4(a1, (uint64_t *)&unk_268BBEE80);
}

uint64_t TimerSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA00110();
  sub_23CA0ED40();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDB0);
  sub_23CA00310(&qword_268BBEDD0, &qword_268BBEDD8);
  sub_23CA0EB50();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23CA00310(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBEDB0);
    sub_23C9FFD68(a2, (void (*)(uint64_t))type metadata accessor for SiriTimerSnippetModel);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA003A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA074BC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23CA003D4(uint64_t a1)
{
  unint64_t v2 = sub_23CA00110();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23CA00410(uint64_t a1)
{
  unint64_t v2 = sub_23CA00110();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23CA0044C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return TimerSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23CA00464(void *a1)
{
  return TimerSnippetModel.encode(to:)(a1);
}

uint64_t SiriTimerSnippetModel.timerIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.timerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.timerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.directInvocationUri.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.directInvocationPayload.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.punchoutURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriTimerSnippetModel(0);
  return sub_23C9D6238(v1 + *(int *)(v3 + 28), a1, &qword_268BBEAF0);
}

uint64_t SiriTimerSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28);
  return sub_23C9D78EC(a1, v3);
}

uint64_t (*SiriTimerSnippetModel.punchoutURL.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.label.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.label.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36));
}

uint64_t SiriTimerSnippetModel.duration.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.duration.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.remainingTime.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40));
}

uint64_t SiriTimerSnippetModel.remainingTime.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 40);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.remainingTime.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.state.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 44));
}

uint64_t SiriTimerSnippetModel.state.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 44);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.state.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.init(timerIdentifier:directInvocation:label:duration:remainingTime:state:punchoutURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, void *a9@<X8>, unsigned __int8 a10, uint64_t a11, unsigned __int8 a12, uint64_t a13)
{
  uint64_t v58 = a8;
  int v57 = a7;
  uint64_t v55 = a5;
  uint64_t v56 = a6;
  uint64_t v53 = a13;
  uint64_t v54 = a4;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE6F0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = &v44[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = &v44[-v21];
  uint64_t v23 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  a9[3] = 0;
  a9[4] = 0;
  a9[2] = 0;
  uint64_t v24 = (uint64_t)a9 + v23[7];
  uint64_t v25 = sub_23CA0CC40();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  uint64_t v51 = v24;
  v26(v24, 1, 1, v25);
  uint64_t v27 = (void *)((char *)a9 + v23[8]);
  void *v27 = 0;
  v27[1] = 0;
  uint64_t v28 = (char *)a9 + v23[9];
  *(void *)uint64_t v28 = 0;
  uint64_t v50 = v28;
  v28[8] = 1;
  uint64_t v29 = (char *)a9 + v23[10];
  *(void *)uint64_t v29 = 0;
  uint64_t v49 = v29;
  v29[8] = 1;
  uint64_t v30 = (char *)a9 + v23[11];
  *(void *)uint64_t v30 = 0;
  uint64_t v48 = v30;
  v30[8] = 1;
  *a9 = a1;
  a9[1] = a2;
  uint64_t v52 = a3;
  sub_23C9D6238(a3, (uint64_t)v22, &qword_268BBE6F0);
  uint64_t v31 = sub_23CA0D430();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v32 + 48);
  if (v33(v22, 1, v31) == 1)
  {
    sub_23C9BAA2C((uint64_t)v22, &qword_268BBE6F0);
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v34 = sub_23CA0D410();
    uint64_t v35 = v36;
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v22, v31);
  }
  int v47 = a12;
  uint64_t v46 = a11;
  int v45 = a10;
  swift_bridgeObjectRelease();
  a9[2] = v34;
  a9[3] = v35;
  uint64_t v37 = v52;
  sub_23C9D6238(v52, (uint64_t)v20, &qword_268BBE6F0);
  if (v33(v20, 1, v31) == 1)
  {
    sub_23C9BAA2C(v37, &qword_268BBE6F0);
    sub_23C9BAA2C((uint64_t)v20, &qword_268BBE6F0);
    uint64_t v38 = 0;
  }
  else
  {
    uint64_t v38 = sub_23CA0D420();
    sub_23C9BAA2C(v37, &qword_268BBE6F0);
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v20, v31);
  }
  swift_bridgeObjectRelease();
  a9[4] = v38;
  sub_23C9D78EC(v53, v51);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v40 = v55;
  void *v27 = v54;
  v27[1] = v40;
  uint64_t v41 = v50;
  *uint64_t v50 = v56;
  *((unsigned char *)v41 + 8) = v57 & 1;
  uint64_t v42 = v49;
  void *v49 = v58;
  *((unsigned char *)v42 + 8) = v45 & 1;
  uint64_t v43 = v48;
  *uint64_t v48 = v46;
  *((unsigned char *)v43 + 8) = v47 & 1;
  return result;
}

uint64_t SiriTimerSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v53 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE8);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v52 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v58 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDF0);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14[3] = 0;
  v14[4] = 0;
  v14[2] = 0;
  uint64_t v15 = (uint64_t)v14 + v12[9];
  uint64_t v16 = sub_23CA0CC40();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v60 = v15;
  v17(v15, 1, 1, v16);
  uint64_t v18 = (uint64_t *)((char *)v14 + v12[10]);
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v62 = v14;
  uint64_t v63 = v18;
  uint64_t v19 = (char *)v14 + v12[11];
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = (char *)v14 + v12[12];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;
  uint64_t v21 = (uint64_t *)((char *)v14 + v12[13]);
  *uint64_t v21 = 0;
  *((unsigned char *)v21 + 8) = 1;
  uint64_t v22 = a1[3];
  uint64_t v61 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_23CA013D8();
  uint64_t v23 = v64;
  sub_23CA0ED30();
  if (v23)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v61);
    uint64_t v30 = v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23C9BAA2C(v30, &qword_268BBEAF0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = v19;
    uint64_t v51 = v21;
    uint64_t v64 = v16;
    uint64_t v25 = v57;
    uint64_t v26 = (uint64_t)v58;
    char v71 = 0;
    uint64_t v27 = v10;
    uint64_t v28 = sub_23CA0EA50();
    if (v29) {
      uint64_t v32 = v28;
    }
    else {
      uint64_t v32 = 0;
    }
    unint64_t v33 = 0xE000000000000000;
    if (v29) {
      unint64_t v33 = v29;
    }
    uint64_t v34 = v62;
    *uint64_t v62 = v32;
    v34[1] = v33;
    char v70 = 1;
    uint64_t v35 = sub_23CA0EA50();
    uint64_t v36 = v63;
    v34[2] = v35;
    v34[3] = v37;
    char v69 = 3;
    *uint64_t v36 = sub_23CA0EA50();
    v36[1] = v38;
    char v68 = 4;
    *(void *)uint64_t v24 = sub_23CA0EA70();
    v24[8] = v39 & 1;
    char v67 = 5;
    *(void *)uint64_t v20 = sub_23CA0EA70();
    v20[8] = v40 & 1;
    char v66 = 6;
    uint64_t v41 = sub_23CA0EA80();
    uint64_t v42 = v51;
    *uint64_t v51 = v41;
    *((unsigned char *)v42 + 8) = v43 & 1;
    char v65 = 7;
    sub_23C9FFD68(&qword_268BBE600, MEMORY[0x263F06EA8]);
    sub_23CA0EA90();
    uint64_t v44 = v25;
    uint64_t v64 = (uint64_t)v27;
    sub_23C9D78EC(v26, v60);
    int v45 = v61;
    __swift_project_boxed_opaque_existential_1(v61, v61[3]);
    sub_23CA0142C();
    uint64_t v46 = v53;
    sub_23CA0ED30();
    uint64_t v48 = v54;
    uint64_t v47 = v55;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v46, 0, 1, v55);
    uint64_t v49 = (uint64_t)v52;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v52, v46, v47);
    uint64_t v50 = sub_23CA014E8(v49);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v64, v59);
    swift_bridgeObjectRelease();
    v34[4] = v50;
    sub_23CA01480((uint64_t)v34, v56, type metadata accessor for SiriTimerSnippetModel);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
    return sub_23C9FF640((uint64_t)v34, type metadata accessor for SiriTimerSnippetModel);
  }
}

unint64_t sub_23CA013D8()
{
  unint64_t result = qword_268BBEDF8;
  if (!qword_268BBEDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEDF8);
  }
  return result;
}

unint64_t sub_23CA0142C()
{
  unint64_t result = qword_268BBEE00;
  if (!qword_268BBEE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEE00);
  }
  return result;
}

uint64_t sub_23CA01480(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23CA014E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v95 = (char *)v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v101 = (void *)sub_23C9D466C(MEMORY[0x263F8EE78]);
  uint64_t v98 = v5;
  uint64_t v8 = sub_23CA0EAC0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    return (uint64_t)v101;
  }
  uint64_t v97 = v4;
  unint64_t v96 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v94 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v93 = (void (**)(char *, uint64_t))(v6 + 8);
  v92[1] = v8;
  uint64_t v10 = (unsigned char *)(v8 + 56);
  uint64_t v99 = a1;
  while (1)
  {
    uint64_t v12 = *((void *)v10 - 3);
    uint64_t v13 = *((void *)v10 - 2);
    uint64_t v14 = *((void *)v10 - 1);
    char v15 = *v10;
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_23CA0EA80();
    if ((v17 & 1) == 0) {
      break;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    uint64_t v28 = sub_23CA0EA70();
    if ((v29 & 1) == 0)
    {
      uint64_t v106 = MEMORY[0x263F8D538];
      *(void *)&long long v104 = v28;
      sub_23C9C6860(&v104, &v103);
      uint64_t v30 = v101;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v102 = v30;
      unint64_t v21 = sub_23CA06B98(v12, v13);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      uint64_t v35 = v33 + v34;
      if (__OFADD__(v33, v34)) {
        goto LABEL_66;
      }
      char v36 = v32;
      if (v30[3] >= v35)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_23CA07050();
        }
      }
      else
      {
        sub_23CA06CE4(v35, isUniquelyReferenced_nonNull_native);
        unint64_t v37 = sub_23CA06B98(v12, v13);
        if ((v36 & 1) != (v38 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v37;
      }
      uint64_t v75 = v102;
      long long v101 = v102;
      if ((v36 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        unint64_t v87 = (uint64_t *)(v101[6] + 16 * v21);
        *unint64_t v87 = v12;
        v87[1] = v13;
        sub_23C9C6860(&v103, (_OWORD *)(v101[7] + 32 * v21));
        BOOL v77 = v101;
        uint64_t v88 = v101[2];
        BOOL v79 = __OFADD__(v88, 1);
        uint64_t v80 = v88 + 1;
        if (v79) {
          goto LABEL_71;
        }
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    uint64_t v39 = sub_23CA0EA50();
    if (v40)
    {
      uint64_t v106 = MEMORY[0x263F8D310];
      *(void *)&long long v104 = v39;
      *((void *)&v104 + 1) = v40;
      sub_23C9C6860(&v104, &v103);
      uint64_t v42 = v101;
      char v43 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v102 = v42;
      unint64_t v21 = sub_23CA06B98(v12, v13);
      uint64_t v45 = v42[2];
      BOOL v46 = (v44 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_64;
      }
      char v48 = v44;
      if (v42[3] >= v47)
      {
        if ((v43 & 1) == 0) {
          sub_23CA07050();
        }
      }
      else
      {
        sub_23CA06CE4(v47, v43);
        unint64_t v49 = sub_23CA06B98(v12, v13);
        if ((v48 & 1) != (v50 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v49;
      }
      uint64_t v75 = v102;
      long long v101 = v102;
      if ((v48 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        os_log_type_t v81 = (uint64_t *)(v101[6] + 16 * v21);
        uint64_t *v81 = v12;
        v81[1] = v13;
        sub_23C9C6860(&v103, (_OWORD *)(v101[7] + 32 * v21));
        BOOL v77 = v101;
        uint64_t v82 = v101[2];
        BOOL v79 = __OFADD__(v82, 1);
        uint64_t v80 = v82 + 1;
        if (v79) {
          goto LABEL_69;
        }
        goto LABEL_61;
      }
LABEL_3:
      uint64_t v11 = (_OWORD *)(v75[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
      sub_23C9C6860(&v103, v11);
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    char v41 = sub_23CA0EA60();
    if (v41 != 2)
    {
      uint64_t v106 = MEMORY[0x263F8D4F8];
      LOBYTE(v104) = v41 & 1;
      sub_23C9C6860(&v104, &v103);
      char v66 = v101;
      char v67 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v102 = v66;
      unint64_t v21 = sub_23CA06B98(v12, v13);
      uint64_t v69 = v66[2];
      BOOL v70 = (v68 & 1) == 0;
      uint64_t v71 = v69 + v70;
      if (__OFADD__(v69, v70)) {
        goto LABEL_67;
      }
      char v72 = v68;
      if (v66[3] >= v71)
      {
        if ((v67 & 1) == 0) {
          sub_23CA07050();
        }
      }
      else
      {
        sub_23CA06CE4(v71, v67);
        unint64_t v73 = sub_23CA06B98(v12, v13);
        if ((v72 & 1) != (v74 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v73;
      }
      uint64_t v75 = v102;
      long long v101 = v102;
      if ((v72 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        uint64_t v89 = (uint64_t *)(v101[6] + 16 * v21);
        *uint64_t v89 = v12;
        v89[1] = v13;
        sub_23C9C6860(&v103, (_OWORD *)(v101[7] + 32 * v21));
        BOOL v77 = v101;
        uint64_t v90 = v101[2];
        BOOL v79 = __OFADD__(v90, 1);
        uint64_t v80 = v90 + 1;
        if (v79) {
          goto LABEL_72;
        }
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    uint64_t v100 = v9;
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    sub_23CA0142C();
    uint64_t v51 = v97;
    uint64_t v52 = v98;
    sub_23CA0EA30();
    (*v96)(v51, 0, 1, v52);
    uint64_t v53 = v95;
    (*v94)(v95, v51, v52);
    uint64_t v54 = sub_23CA014E8(v53);
    uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF48);
    *(void *)&long long v104 = v54;
    sub_23C9C6860(&v104, &v103);
    uint64_t v55 = v101;
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v55;
    unint64_t v58 = sub_23CA06B98(v12, v13);
    uint64_t v59 = v55[2];
    BOOL v60 = (v57 & 1) == 0;
    uint64_t v61 = v59 + v60;
    if (__OFADD__(v59, v60)) {
      goto LABEL_65;
    }
    char v62 = v57;
    uint64_t v63 = v52;
    if (v55[3] >= v61)
    {
      uint64_t v9 = v100;
      if ((v56 & 1) == 0) {
        sub_23CA07050();
      }
    }
    else
    {
      sub_23CA06CE4(v61, v56);
      unint64_t v64 = sub_23CA06B98(v12, v13);
      uint64_t v9 = v100;
      if ((v62 & 1) != (v65 & 1)) {
        goto LABEL_73;
      }
      unint64_t v58 = v64;
    }
    long long v101 = v102;
    if (v62)
    {
      uint64_t v83 = (_OWORD *)(v102[7] + 32 * v58);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v83);
      sub_23C9C6860(&v103, v83);
    }
    else
    {
      v102[(v58 >> 6) + 8] |= 1 << v58;
      unsigned int v84 = (uint64_t *)(v101[6] + 16 * v58);
      *unsigned int v84 = v12;
      v84[1] = v13;
      sub_23C9C6860(&v103, (_OWORD *)(v101[7] + 32 * v58));
      uint64_t v85 = v101[2];
      BOOL v79 = __OFADD__(v85, 1);
      uint64_t v86 = v85 + 1;
      if (v79) {
        goto LABEL_70;
      }
      v101[2] = v86;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v93)(v95, v63);
LABEL_5:
    v10 += 32;
    if (!--v9) {
      goto LABEL_62;
    }
  }
  uint64_t v106 = MEMORY[0x263F8D6C8];
  *(void *)&long long v104 = v16;
  sub_23C9C6860(&v104, &v103);
  uint64_t v18 = v101;
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v102 = v18;
  unint64_t v21 = sub_23CA06B98(v12, v13);
  uint64_t v22 = v18[2];
  BOOL v23 = (v20 & 1) == 0;
  uint64_t v24 = v22 + v23;
  if (!__OFADD__(v22, v23))
  {
    char v25 = v20;
    if (v18[3] >= v24)
    {
      if ((v19 & 1) == 0) {
        sub_23CA07050();
      }
    }
    else
    {
      sub_23CA06CE4(v24, v19);
      unint64_t v26 = sub_23CA06B98(v12, v13);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_73;
      }
      unint64_t v21 = v26;
    }
    uint64_t v75 = v102;
    long long v101 = v102;
    if (v25) {
      goto LABEL_3;
    }
    v102[(v21 >> 6) + 8] |= 1 << v21;
    os_log_type_t v76 = (uint64_t *)(v101[6] + 16 * v21);
    uint64_t *v76 = v12;
    v76[1] = v13;
    sub_23C9C6860(&v103, (_OWORD *)(v101[7] + 32 * v21));
    BOOL v77 = v101;
    uint64_t v78 = v101[2];
    BOOL v79 = __OFADD__(v78, 1);
    uint64_t v80 = v78 + 1;
    if (v79) {
      goto LABEL_68;
    }
LABEL_61:
    v77[2] = v80;
    swift_bridgeObjectRetain();
    goto LABEL_4;
  }
  __break(1u);
LABEL_64:
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
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  uint64_t result = sub_23CA0ECF0();
  __break(1u);
  return result;
}

uint64_t SiriTimerSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE08);
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE10);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA013D8();
  sub_23CA0ED40();
  LOBYTE(v28) = 0;
  uint64_t v10 = v27;
  sub_23CA0EB10();
  if (v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v24 = v5;
  uint64_t v27 = v7;
  long long v28 = *(_OWORD *)(v1 + 16);
  char v29 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE18);
  sub_23CA024DC(&qword_268BBEE20, &qword_268BBEE18);
  sub_23CA0EB50();
  BOOL v23 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  long long v28 = *(_OWORD *)(v1 + v23[8]);
  char v29 = 3;
  sub_23CA0EB50();
  uint64_t v12 = v27;
  uint64_t v13 = (uint64_t *)(v1 + v23[9]);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  *(void *)&long long v28 = v14;
  BYTE8(v28) = (_BYTE)v13;
  char v29 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE28);
  sub_23CA024DC(&qword_268BBEE30, &qword_268BBEE28);
  sub_23CA0EB50();
  char v15 = (uint64_t *)(v1 + v23[10]);
  uint64_t v16 = *v15;
  LOBYTE(v15) = *((unsigned char *)v15 + 8);
  *(void *)&long long v28 = v16;
  BYTE8(v28) = (_BYTE)v15;
  char v29 = 5;
  sub_23CA0EB50();
  char v17 = (uint64_t *)(v1 + v23[11]);
  uint64_t v18 = *v17;
  LOBYTE(v17) = *((unsigned char *)v17 + 8);
  *(void *)&long long v28 = v18;
  BYTE8(v28) = (_BYTE)v17;
  char v29 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE7E0);
  sub_23CA024DC(&qword_268BBEE38, &qword_268BBE7E0);
  sub_23CA0EB50();
  LOBYTE(v28) = 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
  sub_23CA02540();
  sub_23CA0EB50();
  uint64_t v19 = *(void *)(v1 + 32);
  if (!v19) {
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v9, v6);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA0142C();
  char v20 = v9;
  uint64_t v21 = (uint64_t)v24;
  sub_23CA0ED40();
  sub_23CA025E4(v21, v19);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v21, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v20, v6);
}

uint64_t sub_23CA024DC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_23CA02540()
{
  unint64_t result = qword_268BBEE40;
  if (!qword_268BBEE40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBEAF0);
    sub_23C9FFD68(&qword_268BBE5D8, MEMORY[0x263F06EA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEE40);
  }
  return result;
}

uint64_t sub_23CA025E4(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE08);
  MEMORY[0x270FA5388](v32);
  long long v28 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v27 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v30 = MEMORY[0x263F8EE58] + 8;
  while (v9)
  {
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_23:
    char v17 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    if (*(void *)(a2 + 16))
    {
      swift_bridgeObjectRetain_n();
      unint64_t v20 = sub_23CA06B98(v18, v19);
      if (v21)
      {
        sub_23C9BC704(*(void *)(a2 + 56) + 32 * v20, (uint64_t)&v41);
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      swift_bridgeObjectRetain();
    }
    sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
    if (v40)
    {
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v37 = v18;
      uint64_t v38 = v19;
      uint64_t v39 = 0;
      LOBYTE(v40) = 1;
      sub_23CA0EB10();
      if (v2)
      {
        swift_bridgeObjectRelease();
LABEL_65:
        sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
LABEL_34:
      sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
      if (v40)
      {
        if (swift_dynamicCast())
        {
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_23CA0EB40();
          if (v2) {
            goto LABEL_65;
          }
          goto LABEL_5;
        }
      }
      else
      {
        sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
      }
      sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
      if (v40)
      {
        if (swift_dynamicCast())
        {
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_23CA0EB30();
          if (v2) {
            goto LABEL_65;
          }
          goto LABEL_5;
        }
      }
      else
      {
        sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
      }
      sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
      if (!v40)
      {
        sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
        goto LABEL_48;
      }
      if (swift_dynamicCast())
      {
        uint64_t v37 = v18;
        uint64_t v38 = v19;
        uint64_t v39 = 0;
        LOBYTE(v40) = 1;
        sub_23CA0EB20();
        if (v2) {
          goto LABEL_65;
        }
LABEL_5:
        sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
LABEL_48:
        sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
        if (v40)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF48);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_53;
          }
          uint64_t v22 = v6;
          uint64_t v29 = v33;
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_23CA0142C();
          BOOL v23 = v28;
          uint64_t v24 = v32;
          sub_23CA0EAF0();
          swift_bridgeObjectRelease();
          sub_23CA025E4(v23, v29);
          swift_bridgeObjectRelease();
          (*v27)(v23, v24);
          uint64_t result = sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
          if (v2) {
            return swift_release();
          }
          uint64_t v6 = v22;
        }
        else
        {
          sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
LABEL_53:
          sub_23C9D6238((uint64_t)&v41, (uint64_t)&v37, &qword_268BBE988);
          if (!v40)
          {
            sub_23C9BAA2C((uint64_t)&v37, &qword_268BBE988);
            goto LABEL_58;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF40);
          if (swift_dynamicCast())
          {
            uint64_t v25 = v33;
            uint64_t v33 = v18;
            uint64_t v34 = v19;
            uint64_t v35 = 0;
            char v36 = 1;
            sub_23CA0EAE0();
            swift_bridgeObjectRelease();
            sub_23CA02CE4((uint64_t)&v37, v25);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v37);
            uint64_t result = sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
            if (v2) {
              return swift_release();
            }
          }
          else
          {
LABEL_58:
            uint64_t v37 = v18;
            uint64_t v38 = v19;
            uint64_t v39 = 0;
            LOBYTE(v40) = 1;
            sub_23CA0EB60();
            sub_23C9BAA2C((uint64_t)&v41, &qword_268BBE988);
            uint64_t result = swift_bridgeObjectRelease();
            if (v2) {
              return swift_release();
            }
          }
        }
      }
    }
  }
  if (__OFADD__(v11++, 1))
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v11 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v11);
  if (v15)
  {
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_23;
  }
  int64_t v16 = v11 + 1;
  if (v11 + 1 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 2;
  if (v11 + 2 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 3;
  if (v11 + 3 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 4;
  if (v11 + 4 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 5;
  if (v11 + 5 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
LABEL_21:
    int64_t v11 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v31) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_23CA02CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE08);
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v10 = *(void *)(a2 + 16);
  if (!v10) {
    return result;
  }
  uint64_t v19 = result;
  unint64_t v20 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a2 + 32;
  uint64_t v18 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v21 = a2;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_23C9BC704(v11, (uint64_t)v24);
    sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
    if (!swift_dynamicCast()) {
      break;
    }
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_23CA0EC40();
    if (v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
    swift_bridgeObjectRelease();
LABEL_5:
    v11 += 32;
    if (!--v10) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_23CA0EC70();
    goto LABEL_4;
  }
  sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_23CA0EC60();
    goto LABEL_4;
  }
  sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_23CA0EC50();
LABEL_4:
    uint64_t v3 = v12;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
    if (v12) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_5;
  }
  sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF48);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v23;
    uint64_t v14 = *(void *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 32);
    __swift_mutable_project_boxed_opaque_existential_1(a1, v14);
    sub_23CA0142C();
    unint64_t v15 = v20;
    sub_23CA0EC20();
    sub_23CA025E4(v15, v13);
    if (v3)
    {
      swift_bridgeObjectRelease();
      (*v18)(v15, v19);
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    (*v18)(v15, v19);
    goto LABEL_21;
  }
  sub_23C9BC704((uint64_t)v24, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF40);
  if (!swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_23CA0EC80();
    if (v3) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v16 = v23;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_23CA0EC30();
  sub_23CA02CE4(v22, v16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
LABEL_21:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
LABEL_23:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  return swift_bridgeObjectRelease();
}

void *sub_23CA03184(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_23CA0EC00() & 1) == 0)
  {
    uint64_t v11 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v25 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    uint64_t v24 = (void (**)(char *, uint64_t))(v6 + 8);
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
      uint64_t v12 = sub_23CA0EBC0();
      if (v13)
      {
        uint64_t v27 = MEMORY[0x263F8D310];
        *(void *)&long long v26 = v12;
        *((void *)&v26 + 1) = v13;
      }
      else
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        uint64_t v14 = sub_23CA0EBF0();
        if ((v15 & 1) == 0)
        {
          uint64_t v16 = MEMORY[0x263F8D6C8];
LABEL_14:
          uint64_t v27 = v16;
          *(void *)&long long v26 = v14;
          goto LABEL_22;
        }
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        uint64_t v14 = sub_23CA0EBE0();
        if ((v17 & 1) == 0)
        {
          uint64_t v16 = MEMORY[0x263F8D538];
          goto LABEL_14;
        }
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        char v18 = sub_23CA0EBD0();
        if (v18 == 2)
        {
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
          sub_23CA0142C();
          sub_23CA0EBA0();
          (*v11)(v4, 0, 1, v5);
          (*v25)(v8, v4, v5);
          uint64_t v19 = sub_23CA014E8(v8);
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEF48);
          *(void *)&long long v26 = v19;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_23C9CE3DC(0, v9[2] + 1, 1, v9);
          }
          unint64_t v21 = v9[2];
          unint64_t v20 = v9[3];
          if (v21 >= v20 >> 1) {
            uint64_t v9 = sub_23C9CE3DC((void *)(v20 > 1), v21 + 1, 1, v9);
          }
          void v9[2] = v21 + 1;
          sub_23C9C6860(&v26, &v9[4 * v21 + 4]);
          (*v24)(v8, v5);
          goto LABEL_5;
        }
        uint64_t v27 = MEMORY[0x263F8D4F8];
        LOBYTE(v26) = v18 & 1;
      }
LABEL_22:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_23C9CE3DC(0, v9[2] + 1, 1, v9);
      }
      unint64_t v23 = v9[2];
      unint64_t v22 = v9[3];
      if (v23 >= v22 >> 1) {
        uint64_t v9 = sub_23C9CE3DC((void *)(v22 > 1), v23 + 1, 1, v9);
      }
      void v9[2] = v23 + 1;
      sub_23C9C6860(&v26, &v9[4 * v23 + 4]);
LABEL_5:
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      if (sub_23CA0EC00()) {
        return v9;
      }
    }
  }
  return (void *)MEMORY[0x263F8EE78];
}

unint64_t sub_23CA03770(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 4:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 5:
      unint64_t result = 0x6E696E69616D6572;
      break;
    case 6:
      unint64_t result = 0x6574617473;
      break;
    case 7:
      unint64_t result = 0x74756F68636E7570;
      break;
    default:
      unint64_t result = 0x65644972656D6974;
      break;
  }
  return result;
}

unint64_t sub_23CA03890()
{
  return sub_23CA03770(*v0);
}

uint64_t sub_23CA03898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA07550(a1, a2);
  *a3 = result;
  return result;
}

void sub_23CA038C0(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23CA038CC(uint64_t a1)
{
  unint64_t v2 = sub_23CA013D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23CA03908(uint64_t a1)
{
  unint64_t v2 = sub_23CA013D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23CA03944@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimerSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23CA0395C(void *a1)
{
  return SiriTimerSnippetModel.encode(to:)(a1);
}

uint64_t sub_23CA03974()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23CA039A4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

uint64_t sub_23CA039B8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_23CA039C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_23CA0EB80();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_23CA03A20(uint64_t a1)
{
  unint64_t v2 = sub_23CA0142C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23CA03A5C(uint64_t a1)
{
  unint64_t v2 = sub_23CA0142C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TimerSelectorModel.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TimerSelectorModel.timers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*TimerSelectorModel.timers.modify())()
{
  return nullsub_1;
}

uint64_t TimerSelectorModel.header.getter()
{
  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  sub_23CA0CE90();
  return v1;
}

uint64_t sub_23CA03B38@<X0>(void *a1@<X8>)
{
  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t result = sub_23CA0CE90();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23CA03B98()
{
  return sub_23CA0CEA0();
}

uint64_t TimerSelectorModel.header.setter()
{
  return sub_23CA0CEA0();
}

void (*TimerSelectorModel.header.modify(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  v2[4] = sub_23CA0CE80();
  return sub_23C9D77B0;
}

uint64_t TimerSelectorModel.init(timers:header:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for TimerSelectorModel(0);
  return sub_23CA0CE70();
}

uint64_t sub_23CA03D2C(char a1)
{
  if (a1) {
    return 0x726564616568;
  }
  else {
    return 0x7372656D6974;
  }
}

uint64_t sub_23CA03D54()
{
  return sub_23CA03D2C(*v0);
}

uint64_t sub_23CA03D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA07898(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23CA03D84(uint64_t a1)
{
  unint64_t v2 = sub_23CA04000();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23CA03DC0(uint64_t a1)
{
  unint64_t v2 = sub_23CA04000();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TimerSelectorModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA04000();
  sub_23CA0ED40();
  uint64_t v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDB0);
  sub_23CA00310(&qword_268BBEDD0, &qword_268BBEDD8);
  sub_23CA0EB50();
  if (!v2)
  {
    type metadata accessor for TimerSelectorModel(0);
    int v10[6] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    sub_23C9D8A64(&qword_268BBE5B8);
    sub_23CA0EB50();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23CA04000()
{
  unint64_t result = qword_268BBEE50;
  if (!qword_268BBEE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEE50);
  }
  return result;
}

uint64_t TimerSelectorModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v22 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEE58);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TimerSelectorModel(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA04000();
  sub_23CA0ED30();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  unint64_t v21 = a1;
  uint64_t v11 = v10;
  uint64_t v13 = v24;
  uint64_t v12 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEDB0);
  char v28 = 0;
  sub_23CA00310(&qword_268BBEDB8, &qword_268BBEDC0);
  uint64_t v14 = v26;
  sub_23CA0EAB0();
  uint64_t v19 = v11;
  uint64_t v20 = v29;
  *(void *)uint64_t v11 = v29;
  char v27 = 1;
  sub_23C9D8A64(&qword_268BBE5F0);
  sub_23CA0EAB0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  uint64_t v15 = *(int *)(v8 + 20);
  uint64_t v16 = (uint64_t)v19;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v19[v15], v5, v12);
  sub_23CA01480(v16, v23, type metadata accessor for TimerSelectorModel);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  return sub_23C9FF640(v16, type metadata accessor for TimerSelectorModel);
}

uint64_t sub_23CA043DC()
{
  return sub_23C9FFD68(&qword_268BBEE60, (void (*)(uint64_t))type metadata accessor for SiriTimePluginModel);
}

uint64_t sub_23CA04424()
{
  return sub_23C9FFD68(&qword_268BBEE68, (void (*)(uint64_t))type metadata accessor for SiriTimePluginModel);
}

uint64_t sub_23CA04474()
{
  return sub_23C9FFD68(&qword_268BBED90, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
}

uint64_t sub_23CA044BC()
{
  return sub_23C9FFD68(&qword_268BBED60, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
}

uint64_t sub_23CA04504@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TimerSelectorModel.init(from:)(a1, a2);
}

uint64_t sub_23CA0451C(void *a1)
{
  return TimerSelectorModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimePluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      swift_bridgeObjectRetain();
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SiriTimePluginModel(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v4 = a1 + *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *initializeWithCopy for SiriTimePluginModel(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *a1 = *a2;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    swift_bridgeObjectRetain();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for SiriTimePluginModel(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_23C9FF640((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      swift_bridgeObjectRetain();
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_23C9FF640((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_23CA04AF8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23CA04B08()
{
  uint64_t result = type metadata accessor for TimerSelectorModel(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerSnippetModel()
{
  return &type metadata for TimerSnippetModel;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[7];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[4] = a2[4];
    uint64_t v11 = sub_23CA0CC40();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
      memcpy(__dst, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v15 = a3[8];
    uint64_t v16 = a3[9];
    char v17 = (uint64_t *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *char v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)v4 + v16;
    unint64_t v21 = (char *)a2 + v16;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = a3[10];
    uint64_t v23 = a3[11];
    uint64_t v24 = (char *)v4 + v22;
    uint64_t v25 = (char *)a2 + v22;
    *(void *)uint64_t v24 = *(void *)v25;
    v24[8] = v25[8];
    uint64_t v26 = (char *)v4 + v23;
    char v27 = (char *)a2 + v23;
    *(void *)uint64_t v26 = *(void *)v27;
    v26[8] = v27[8];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for SiriTimerSnippetModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_23CA0CC40();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  a1[4] = a2[4];
  uint64_t v7 = a3[7];
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = sub_23CA0CC40();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (void *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (char *)a1 + v14;
  uint64_t v19 = (char *)a2 + v14;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v20;
  uint64_t v23 = (char *)a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  uint64_t v24 = (char *)a1 + v21;
  uint64_t v25 = (char *)a2 + v21;
  *(void *)uint64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
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
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23CA0CC40();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *(void *)v20;
  v19[8] = v20[8];
  *(void *)uint64_t v19 = v21;
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  LOBYTE(v21) = v24[8];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v21;
  uint64_t v25 = a3[11];
  uint64_t v26 = (char *)a1 + v25;
  char v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  return a1;
}

uint64_t initializeWithTake for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_23CA0CC40();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v14 = *(void *)v15;
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  return a1;
}

void *assignWithTake for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_23CA0CC40();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = a3[10];
  uint64_t v24 = (char *)a1 + v22;
  uint64_t v25 = (char *)a2 + v22;
  *(void *)uint64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  uint64_t v26 = (char *)a1 + v23;
  char v27 = (char *)a2 + v23;
  *(void *)uint64_t v26 = *(void *)v27;
  v26[8] = v27[8];
  uint64_t v28 = a3[11];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *(void *)uint64_t v29 = *(void *)v30;
  v29[8] = v30[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23CA0568C);
}

uint64_t sub_23CA0568C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23CA05754);
}

uint64_t sub_23CA05754(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEAF0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_23CA05800()
{
  sub_23CA058BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_23CA058BC()
{
  if (!qword_268BBE648)
  {
    sub_23CA0CC40();
    unint64_t v0 = sub_23CA0E7A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268BBE648);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t destroy for TimerSelectorModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  swift_bridgeObjectRetain();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *assignWithCopy for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *initializeWithTake for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23CA05C9C);
}

uint64_t sub_23CA05C9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23CA05D64);
}

void *sub_23CA05D64(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE590);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_23CA05E10()
{
  sub_23C9DB088();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for TimerSelectorModel.CodingKeys()
{
  return &type metadata for TimerSelectorModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x23CA06020);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimerSnippetModel.CodingKeys()
{
  return &type metadata for SiriTimerSnippetModel.CodingKeys;
}

uint64_t destroy for JSONCodingKeys()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSONCodingKeys(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSONCodingKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSONCodingKeys()
{
  return &type metadata for JSONCodingKeys;
}

ValueMetadata *type metadata accessor for TimerSnippetModel.CodingKeys()
{
  return &type metadata for TimerSnippetModel.CodingKeys;
}

unsigned char *_s16SiriTimeInternal18TimerSelectorModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CA062C4);
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

ValueMetadata *type metadata accessor for SiriTimePluginModel.CodingKeys()
{
  return &type metadata for SiriTimePluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerMultiCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerMultiCodingKeys;
}

unsigned char *_s16SiriTimeInternal17TimerSnippetModelV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23CA063A8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerSelectorCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys;
}

unint64_t sub_23CA063E4()
{
  unint64_t result = qword_268BBEEA0;
  if (!qword_268BBEEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEA0);
  }
  return result;
}

unint64_t sub_23CA0643C()
{
  unint64_t result = qword_268BBEEA8;
  if (!qword_268BBEEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEA8);
  }
  return result;
}

unint64_t sub_23CA06494()
{
  unint64_t result = qword_268BBEEB0;
  if (!qword_268BBEEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEB0);
  }
  return result;
}

unint64_t sub_23CA064EC()
{
  unint64_t result = qword_268BBEEB8;
  if (!qword_268BBEEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEB8);
  }
  return result;
}

unint64_t sub_23CA06544()
{
  unint64_t result = qword_268BBEEC0;
  if (!qword_268BBEEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEC0);
  }
  return result;
}

unint64_t sub_23CA0659C()
{
  unint64_t result = qword_268BBEEC8;
  if (!qword_268BBEEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEC8);
  }
  return result;
}

unint64_t sub_23CA065F4()
{
  unint64_t result = qword_268BBEED0;
  if (!qword_268BBEED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEED0);
  }
  return result;
}

unint64_t sub_23CA0664C()
{
  unint64_t result = qword_268BBEED8;
  if (!qword_268BBEED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEED8);
  }
  return result;
}

unint64_t sub_23CA066A4()
{
  unint64_t result = qword_268BBEEE0;
  if (!qword_268BBEEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEE0);
  }
  return result;
}

unint64_t sub_23CA066FC()
{
  unint64_t result = qword_268BBEEE8;
  if (!qword_268BBEEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEE8);
  }
  return result;
}

unint64_t sub_23CA06754()
{
  unint64_t result = qword_268BBEEF0;
  if (!qword_268BBEEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEF0);
  }
  return result;
}

unint64_t sub_23CA067AC()
{
  unint64_t result = qword_268BBEEF8;
  if (!qword_268BBEEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEEF8);
  }
  return result;
}

unint64_t sub_23CA06804()
{
  unint64_t result = qword_268BBEF00;
  if (!qword_268BBEF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF00);
  }
  return result;
}

unint64_t sub_23CA0685C()
{
  unint64_t result = qword_268BBEF08;
  if (!qword_268BBEF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF08);
  }
  return result;
}

unint64_t sub_23CA068B4()
{
  unint64_t result = qword_268BBEF10;
  if (!qword_268BBEF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF10);
  }
  return result;
}

unint64_t sub_23CA0690C()
{
  unint64_t result = qword_268BBEF18;
  if (!qword_268BBEF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF18);
  }
  return result;
}

unint64_t sub_23CA06964()
{
  unint64_t result = qword_268BBEF20;
  if (!qword_268BBEF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF20);
  }
  return result;
}

unint64_t sub_23CA069BC()
{
  unint64_t result = qword_268BBEF28;
  if (!qword_268BBEF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF28);
  }
  return result;
}

unint64_t sub_23CA06A14()
{
  unint64_t result = qword_268BBEF30;
  if (!qword_268BBEF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF30);
  }
  return result;
}

unint64_t sub_23CA06A6C()
{
  unint64_t result = qword_268BBEF38;
  if (!qword_268BBEF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF38);
  }
  return result;
}

unint64_t sub_23CA06AC4(uint64_t a1)
{
  sub_23CA0DFD0();
  unint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F6D6D8];
  sub_23C9FFD68(&qword_268BBEF58, MEMORY[0x263F6D6D8]);
  uint64_t v3 = sub_23CA0E4A0();
  return sub_23C9C65DC(a1, v3, MEMORY[0x263F6D6D8], &qword_268BBEF60, v2, MEMORY[0x263F6D6E8]);
}

unint64_t sub_23CA06B98(uint64_t a1, uint64_t a2)
{
  sub_23CA0ED00();
  sub_23CA0E520();
  uint64_t v4 = sub_23CA0ED20();
  return sub_23C9C677C(a1, a2, v4);
}

unint64_t sub_23CA06C10(uint64_t a1)
{
  sub_23CA0CD10();
  unint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F07508];
  sub_23C9FFD68((unint64_t *)&qword_268BBE6A8, MEMORY[0x263F07508]);
  uint64_t v3 = sub_23CA0E4A0();
  return sub_23C9C65DC(a1, v3, MEMORY[0x263F07508], &qword_268BBE9B0, v2, MEMORY[0x263F07528]);
}

uint64_t sub_23CA06CE4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE518);
  uint64_t v6 = sub_23CA0E9E0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_23C9C6860(v24, v35);
      }
      else
      {
        sub_23C9BC704((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23CA0ED00();
      sub_23CA0E520();
      uint64_t result = sub_23CA0ED20();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      int v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *int v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_23C9C6860(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_23CA06FE4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_23C9C6860(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_23CA07050()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE518);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23CA0E9D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_23C9BC704(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_23C9C6860(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

_OWORD *sub_23CA07238@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _OWORD *a5@<X8>)
{
  uint64_t v6 = (void **)v5;
  unint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_23CA06B98(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a4 & 1) == 0)
  {
    if (v19 >= v17 && (a4 & 1) == 0)
    {
      sub_23CA07050();
      goto LABEL_7;
    }
    sub_23CA06CE4(v17, a4 & 1);
    unint64_t v23 = sub_23CA06B98(a2, a3);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_23CA0ECF0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v6;
  if (v18)
  {
LABEL_8:
    sub_23C9C6860((_OWORD *)(v20[7] + 32 * v14), a5);
    uint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
    return sub_23C9C6860(a1, v21);
  }
LABEL_13:
  sub_23CA06FE4(v14, a2, a3, a1, v20);
  *a5 = 0u;
  a5[1] = 0u;
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_23CA073B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C754D72656D6974 && a2 == 0xEA00000000006974;
  if (v3 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C655372656D6974 && a2 == 0xED0000726F746365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23CA074BC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23CA0753C()
{
  return 0x7372656D6974;
}

uint64_t sub_23CA07550(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65644972656D6974 && a2 == 0xEF7265696669746ELL;
  if (v3 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023CA16870 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023CA16890 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E696E69616D6572 && a2 == 0xED0000656D695467 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74756F68636E7570 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_23CA07898(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7372656D6974 && a2 == 0xE600000000000000;
  if (v3 || (sub_23CA0ECB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA0ECB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
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

uint64_t sub_23CA079C4()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23CA07A14()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEF68);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEF68);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t UnsupportedAppNotInstalledFlow.init(domain:patternExecutor:legacyBuilder:)@<X0>(char *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  char v6 = *a1;
  sub_23C9BB9E8(a2, a4);
  *(unsigned char *)(a4 + 40) = v6;
  return sub_23C9BB9E8(a3, a4 + 48);
}

uint64_t UnsupportedAppNotInstalledFlow.on(input:)()
{
  return 1;
}

uint64_t UnsupportedAppNotInstalledFlow.execute(completion:)()
{
  sub_23CA07B90();
  return sub_23CA0CF60();
}

unint64_t sub_23CA07B90()
{
  unint64_t result = qword_268BBEF80;
  if (!qword_268BBEF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBEF80);
  }
  return result;
}

uint64_t UnsupportedAppNotInstalledFlow.execute()(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_23CA0D380();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_23CA0D1E0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v5 = sub_23CA0CD10();
  v2[22] = v5;
  v2[23] = *(void *)(v5 - 8);
  v2[24] = swift_task_alloc();
  uint64_t v6 = sub_23CA0E410();
  v2[25] = v6;
  v2[26] = *(void *)(v6 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = type metadata accessor for SiriTimeMeasurement();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  v2[31] = swift_task_alloc();
  uint64_t v7 = sub_23CA0D100();
  v2[32] = v7;
  v2[33] = *(void *)(v7 - 8);
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA07E84, 0, 0);
}

uint64_t sub_23CA07E84()
{
  if (qword_268BBDF28 != -1) {
    swift_once();
  }
  *(void *)(v0 + 280) = __swift_project_value_buffer(*(void *)(v0 + 200), (uint64_t)qword_268BBEF68);
  uint64_t v1 = sub_23CA0E3F0();
  os_log_type_t v2 = sub_23CA0E710();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_23C9B6000, v1, v2, "In UnsupportedClockAppNotInstalledFlow.execute()", v3, 2u);
    MEMORY[0x23ECEDBE0](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 120);

  char v5 = *(unsigned char *)(v4 + 40);
  sub_23CA0D0D0();
  if (qword_268BBE6C0)
  {
    uint64_t v6 = qword_268BBE6C0;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    uint64_t v6 = swift_allocObject();
    sub_23CA0D450();
    qword_268BBE6C0 = v6;
    swift_retain();
    swift_release();
  }
  uint64_t v7 = *(void *)(v0 + 248);
  sub_23CA0E160();
  sub_23C9BFAA4(v6 + 16, v0 + 16);
  swift_retain();
  swift_release();
  uint64_t v8 = sub_23CA0E150();
  *(void *)(v0 + 288) = v8;
  unsigned __int8 v9 = AppInstallUtil.isAppInstalled.getter();
  AppInstallUtil.appStorePunchout(installOnly:)((v9 & 1) == 0, v7);
  if (SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()())
  {
    uint64_t v37 = v8;
    uint64_t v40 = *(void *)(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 232);
    uint64_t v36 = *(void *)(v0 + 240);
    uint64_t v11 = *(int **)(v0 + 224);
    uint64_t v13 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v15 = *(void *)(v0 + 184);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v31 = *(void *)(v0 + 176);
    uint64_t v34 = *(void *)(v0 + 216);
    uint64_t v35 = *(void *)(v0 + 120);
    int64_t v33 = *(void (**)(void))(v12 + 16);
    v33();
    uint64_t v32 = mach_absolute_time();
    *(_OWORD *)(v10 + v11[7]) = xmmword_23CA0F8E0;
    *(void *)(v10 + v11[8]) = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v30 = v11[9];
    sub_23CA0CD00();
    id v16 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
    uint64_t v17 = (void *)sub_23CA0CCE0();
    id v18 = objc_msgSend(v16, sel_initWithNSUUID_, v17);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v31);
    *(void *)(v10 + v30) = v18;
    *(unsigned char *)(v10 + 8) = 30;
    ((void (*)(uint64_t, uint64_t, uint64_t))v33)(v10 + v11[6], v34, v13);
    *(void *)uint64_t v10 = v32;
    sub_23C9FCCA4();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v34, v13);
    sub_23C9D43CC(v10, v36);
    sub_23C9BFAA4(v35, v0 + 56);
    uint64_t v19 = *(void *)(v0 + 80);
    uint64_t v20 = *(void *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v19);
    uint64_t v21 = swift_task_alloc();
    *(void *)(v0 + 296) = v21;
    *(void *)(v21 + 16) = v40;
    *(void *)(v21 + 24) = v37;
    uint64_t v38 = (uint64_t (*)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v20 + 8)
                                                                                             + **(int **)(v20 + 8));
    int64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 304) = v22;
    *int64_t v22 = v0;
    v22[1] = sub_23CA083A4;
    return v38(sub_23CA0915C, v21, v19, v20);
  }
  else
  {
    char v24 = *(void **)(v0 + 120);
    uint64_t v25 = v24[9];
    uint64_t v26 = v24[10];
    __swift_project_boxed_opaque_existential_1(v24 + 6, v25);
    *(unsigned char *)(v0 + 360) = v5;
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 + 8)
                                                                                       + **(int **)(v26 + 8));
    unint64_t v27 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v27;
    void *v27 = v0;
    v27[1] = sub_23CA08878;
    uint64_t v28 = *(void *)(v0 + 272);
    uint64_t v29 = *(void *)(v0 + 112);
    return v39(v29, v0 + 360, v8, v28, v25, v26);
  }
}

uint64_t sub_23CA083A4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 312) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    char v5 = sub_23CA08A7C;
  }
  else
  {
    *(void *)(v4 + 320) = a1;
    swift_task_dealloc();
    char v5 = sub_23CA084EC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_23CA084EC()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[18];
  sub_23CA0D1D0();
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v1, v2, 0, 0, 0, 0, 0, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[41] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_23CA085CC;
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[18];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v6, v5);
}

uint64_t sub_23CA085CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 144);
  uint64_t v3 = *(void *)(*(void *)v1 + 136);
  uint64_t v4 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_23CA0872C, 0, 0);
}

uint64_t sub_23CA0872C()
{
  uint64_t v1 = (void *)v0[40];
  uint64_t v2 = v0[30];
  uint64_t v4 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[19];
  sub_23CA0D180();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  swift_release();
  sub_23C9BC760(v2);
  uint64_t v6 = v0[31];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  sub_23CA0905C(v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_23CA08878()
{
  *(void *)(*(void *)v1 + 352) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_23CA08CF8;
  }
  else {
    uint64_t v2 = sub_23CA0898C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23CA0898C()
{
  swift_release();
  uint64_t v1 = v0[31];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  sub_23CA0905C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_23CA08A7C()
{
  uint64_t v15 = v0;
  sub_23C9BC760(v0[30]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  uint64_t v1 = (void *)v0[39];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_23CA0E3F0();
  os_log_type_t v5 = sub_23CA0E700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v14 = v7;
    v0[12] = v1;
    id v8 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
    uint64_t v9 = sub_23CA0E4F0();
    v0[13] = sub_23C9BC474(v9, v10, &v14);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C9B6000, v4, v5, "Error executing DialogEngine: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v7, -1, -1);
    MEMORY[0x23ECEDBE0](v6, -1, -1);
  }
  else
  {
  }
  sub_23CA0D190();
  swift_release();
  uint64_t v11 = v0[31];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  sub_23CA0905C(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_23CA08CF8()
{
  uint64_t v15 = v0;
  uint64_t v1 = (void *)v0[44];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_23CA0E3F0();
  os_log_type_t v5 = sub_23CA0E700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v14 = v7;
    v0[12] = v1;
    id v8 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
    uint64_t v9 = sub_23CA0E4F0();
    v0[13] = sub_23C9BC474(v9, v10, &v14);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C9B6000, v4, v5, "Error executing DialogEngine: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v7, -1, -1);
    MEMORY[0x23ECEDBE0](v6, -1, -1);
  }
  else
  {
  }
  sub_23CA0D190();
  swift_release();
  uint64_t v11 = v0[31];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  sub_23CA0905C(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_23CA08F60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA09764(a2, (uint64_t)v6);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, v7, v8);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(a1, v9);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  uint64_t v12 = swift_retain();
  return v11(v12, v9, v10);
}

uint64_t sub_23CA0905C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA090C0(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_23C9C8C60;
  return UnsupportedAppNotInstalledFlow.execute()(a1);
}

uint64_t sub_23CA0915C(uint64_t a1)
{
  return sub_23CA08F60(a1, *(void *)(v1 + 16));
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.buttonPunchoutAction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.buttonPunchoutAction.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.buttonPunchoutAction.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.device.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.device.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of UnsupportedAppPatternParameters.device.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of UnsupportedAppPatternExecutor.appNotInstalledPatternExecution(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23CA092E8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23CA092E8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of UnsupportedAppNotInstalledLegacyDialogBuilder.generatePunchout(domain:device:dialogPhase:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_23C9C8C60;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t destroy for UnsupportedAppNotInstalledFlow(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 48);
}

uint64_t initializeWithCopy for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 48, a2 + 48);
  return a1;
}

uint64_t assignWithCopy for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnsupportedAppNotInstalledFlow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsupportedAppNotInstalledFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsupportedAppNotInstalledFlow()
{
  return &type metadata for UnsupportedAppNotInstalledFlow;
}

uint64_t sub_23CA09764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBEB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static SiriTimeLog.logger(category:)()
{
  swift_bridgeObjectRetain();
  return sub_23CA0E400();
}

uint64_t static SiriTimeLog.osLogObject(category:)()
{
  return sub_23CA0E780();
}

unint64_t sub_23CA098A0()
{
  unint64_t result = qword_268BBEFD0;
  if (!qword_268BBEFD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BBEFD0);
  }
  return result;
}

uint64_t sub_23CA098E0()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BC2D00);
  __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  return sub_23CA0E400();
}

uint64_t sub_23CA09964()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEFB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268BBEFB0);
  return sub_23CA0E400();
}

uint64_t static SiriTimeLog.clockFlow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA09AA8(qword_268BBDF38, (uint64_t)qword_268BBEFB0, a1);
}

uint64_t sub_23CA09A04()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_26AEB9500);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AEB9500);
  return sub_23CA0E400();
}

uint64_t static SiriTimeLog.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA09AA8(&qword_26AEB9520, (uint64_t)qword_26AEB9500, a1);
}

uint64_t sub_23CA09AA8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23CA0E410();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_23CA09B40()
{
  sub_23CA098A0();
  uint64_t result = sub_23CA0E780();
  qword_268BBEFC8 = result;
  return result;
}

id static SiriTimeLog.siriTimeFrameworkOSLogObject.getter()
{
  if (qword_268BBDF48 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_268BBEFC8;
  return v0;
}

ValueMetadata *type metadata accessor for SiriTimeLog()
{
  return &type metadata for SiriTimeLog;
}

uint64_t PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_23CA0D380();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA09CDC, 0, 0);
}

uint64_t sub_23CA09CDC()
{
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[3], v0[4], 0, 0, 0, 0, 0, v0[9]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA09D94;
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[5];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v2, v3);
}

uint64_t sub_23CA09D94(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_23CA09EF4, 0, 0);
}

uint64_t sub_23CA09EF4()
{
  sub_23CA0D180();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23CA09F70()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBEFD8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBEFD8);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t PatternExecutionResult.generatePatternOutput(manifest:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_23C9C8C60;
  return OutputGenerationManifest.generatePatternOutput(result:measure:)(a1, v3, a3);
}

uint64_t PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = v5;
  *(unsigned char *)(v6 + 96) = a5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 16) = a1;
  uint64_t v7 = sub_23CA0D380();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA0A1B8, 0, 0);
}

uint64_t sub_23CA0A1B8()
{
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(*(void *)(v0 + 24), *(void *)(v0 + 32), 0, 0, 0, 0, *(unsigned __int8 *)(v0 + 96), *(void *)(v0 + 72));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA0A274;
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 16);
  return OutputGenerationManifest.generatePatternOutput(result:measure:)(v4, v2, v3);
}

uint64_t sub_23CA0A274()
{
  uint64_t v2 = *(void *)(*v1 + 72);
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *v1;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_23CA0A41C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_23CA0A41C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PatternExecutionResult.generateStandardPatternResponse(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  uint64_t v6 = sub_23CA0D380();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA0A548, 0, 0);
}

uint64_t sub_23CA0A548()
{
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[10], v0[11], 0, 0, 0, 0, 0, v0[16]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA0A608;
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  return OutputGenerationManifest.generatePatternOutput(result:measure:)((uint64_t)(v0 + 2), v2, v3);
}

uint64_t sub_23CA0A608()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  uint64_t v3 = *(void *)(*(void *)v1 + 120);
  uint64_t v4 = *(void *)(*(void *)v1 + 112);
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_23CA0A7EC;
  }
  else {
    uint64_t v5 = sub_23CA0A778;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_23CA0A778()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_23C9BB9E8((long long *)(v0 + 16), v1);
  *(unsigned char *)(v1 + 40) = 0;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23CA0A7EC()
{
  id v18 = v0;
  if (qword_268BBDF50 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_23CA0E410();
  __swift_project_value_buffer(v2, (uint64_t)qword_268BBEFD8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23CA0E3F0();
  os_log_type_t v6 = sub_23CA0E700();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[18];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[7] = v8;
    id v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBE398);
    uint64_t v12 = sub_23CA0E4F0();
    v0[8] = sub_23C9BC474(v12, v13, &v17);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C9B6000, v5, v6, "Failed to generate #Response response: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v10, -1, -1);
    MEMORY[0x23ECEDBE0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = v0[9];
  *(void *)uint64_t v14 = v0[18];
  *(unsigned char *)(v14 + 40) = 1;
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t PatternExecutionResult.generateFlow(manifest:measure:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = sub_23CA0D100();
  v3[9] = swift_task_alloc();
  uint64_t v4 = sub_23CA0D380();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA0AB10, 0, 0);
}

uint64_t sub_23CA0AB10()
{
  uint64_t v32 = v0;
  if (qword_268BBDF50 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v5 = (void *)v0[7];
  uint64_t v6 = sub_23CA0E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BBEFD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  id v7 = v5;
  uint64_t v8 = sub_23CA0E3F0();
  os_log_type_t v9 = sub_23CA0E710();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[11];
  uint64_t v12 = v0[12];
  uint64_t v13 = v0[10];
  if (v10)
  {
    uint64_t v14 = (void *)v0[7];
    uint64_t v29 = v0[10];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v31[0] = v30;
    *(_DWORD *)uint64_t v15 = 136315394;
    id v16 = objc_msgSend(v14, sel_patternId);
    uint64_t v17 = sub_23CA0E4D0();
    log = v8;
    unint64_t v19 = v18;

    v0[3] = sub_23C9BC474(v17, v19, v31);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v15 + 12) = 2080;
    sub_23CA0D300();
    uint64_t v20 = sub_23CA0E4F0();
    v0[4] = sub_23C9BC474(v20, v21, v31);
    sub_23CA0E7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v29);
    _os_log_impl(&dword_23C9B6000, log, v9, "generateFlowPatternResponse #Response flow response for pattern %s, dialogPhase: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEDBE0](v30, -1, -1);
    MEMORY[0x23ECEDBE0](v15, -1, -1);
  }
  else
  {
    int64_t v22 = (void *)v0[7];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  }
  sub_23CA0D2F0();
  uint64_t v23 = sub_23CA0D200();
  swift_allocObject();
  uint64_t v24 = sub_23CA0D1F0();
  v31[3] = v23;
  v31[4] = MEMORY[0x263F6FB30];
  v31[0] = v24;
  sub_23CA0CF30();
  swift_allocObject();
  v0[2] = sub_23CA0CF20();
  uint64_t v25 = sub_23CA0CF40();
  SiriTimeMeasurement.logDelta()();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(uint64_t))v0[1];
  return v26(v25);
}

uint64_t PatternExecutionResult.generateFlow(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_23CA0D380();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23CA0AF6C, 0, 0);
}

uint64_t sub_23CA0AF6C()
{
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[2], v0[3], 0, 0, 0, 0, 0, v0[8]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA0B024;
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[4];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v2, v3);
}

uint64_t sub_23CA0B024(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *(void *)(*v1 + 48);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  return v6(a1);
}

uint64_t static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X8>)
{
  LODWORD(v131) = a7;
  unint64_t v141 = a4;
  unint64_t v142 = a6;
  uint64_t v132 = a2;
  uint64_t v133 = a5;
  uint64_t v139 = a3;
  uint64_t v134 = a8;
  uint64_t v140 = sub_23CA0E410();
  uint64_t v136 = *(void *)(v140 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v140);
  uint64_t v130 = ((char *)v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v128 = (char *)v125 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v125 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v125 - v16;
  unint64_t v18 = sub_23CA0D100();
  Class isa = v18[-1].isa;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  int64_t v22 = (char *)v125 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v129 = (char *)v125 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  unint64_t v27 = (char *)v125 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v125 - v28;
  uint64_t v30 = (uint64_t (*)(char *, uint64_t, NSObject *))*((void *)isa + 2);
  uint64_t v137 = a1;
  uint64_t v138 = v30;
  uint64_t v135 = (uint64_t)isa + 16;
  v30((char *)v125 - v28, a1, v18);
  sub_23CA0D0F0();
  sub_23C9BD370();
  char v31 = sub_23CA0E4B0();
  uint64_t v32 = (void (*)(char *, NSObject *))*((void *)isa + 1);
  v32(v27, v18);
  if (v31)
  {
    uint64_t v130 = v18;
    uint64_t v131 = v27;
    v32(v29, v18);
    if (qword_268BBDF58 != -1) {
      swift_once();
    }
    uint64_t v33 = v140;
    uint64_t v34 = __swift_project_value_buffer(v140, (uint64_t)qword_268BBF028);
    uint64_t v35 = v136;
    (*(void (**)(char *, uint64_t, uint64_t))(v136 + 16))(v17, v34, v33);
    unint64_t v36 = v142;
    swift_bridgeObjectRetain_n();
    unint64_t v37 = v141;
    swift_bridgeObjectRetain_n();
    uint64_t v38 = sub_23CA0E3F0();
    os_log_type_t v39 = sub_23CA0E710();
    BOOL v40 = os_log_type_enabled(v38, v39);
    uint64_t v41 = v139;
    if (v40)
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v129 = (char *)swift_slowAlloc();
      v143[0] = (uint64_t)v129;
      *(_DWORD *)uint64_t v42 = 136315394;
      if (v37) {
        uint64_t v43 = v41;
      }
      else {
        uint64_t v43 = 7104878;
      }
      if (v37) {
        unint64_t v44 = v141;
      }
      else {
        unint64_t v44 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v144 = sub_23C9BC474(v43, v44, v143);
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      uint64_t v45 = v133;
      if (v142) {
        uint64_t v46 = v133;
      }
      else {
        uint64_t v46 = 7104878;
      }
      if (v142) {
        unint64_t v47 = v142;
      }
      else {
        unint64_t v47 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v48 = v46;
      uint64_t v41 = v139;
      uint64_t v144 = sub_23C9BC474(v48, v47, v143);
      unint64_t v37 = v141;
      unint64_t v36 = v142;
      sub_23CA0E7C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C9B6000, v38, v39, "Creating manifest for clarification dialog phase with listenAfterSpeaking = true, sessionID %s, responseViewId %s", (uint8_t *)v42, 0x16u);
      unint64_t v49 = v129;
      swift_arrayDestroy();
      MEMORY[0x23ECEDBE0](v49, -1, -1);
      MEMORY[0x23ECEDBE0](v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v140);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v33);
      uint64_t v45 = v133;
    }
    uint64_t v72 = v138(v131, v137, v130);
    MEMORY[0x270FA5388](v72);
    v125[-6] = v132;
    v125[-5] = v41;
    v125[-4] = v37;
    v125[-3] = v45;
    v125[-2] = v36;
  }
  else
  {
    sub_23CA0D0E0();
    char v50 = sub_23CA0E4B0();
    v32(v27, v18);
    uint64_t v51 = v18;
    if (v50)
    {
      v32(v29, v18);
      if (qword_268BBDF58 != -1) {
        swift_once();
      }
      uint64_t v52 = v140;
      uint64_t v53 = __swift_project_value_buffer(v140, (uint64_t)qword_268BBF028);
      uint64_t v54 = v136;
      (*(void (**)(char *, uint64_t, uint64_t))(v136 + 16))(v15, v53, v52);
      unint64_t v55 = v142;
      swift_bridgeObjectRetain_n();
      unint64_t v56 = v141;
      swift_bridgeObjectRetain_n();
      char v57 = sub_23CA0E3F0();
      os_log_type_t v58 = sub_23CA0E710();
      BOOL v59 = os_log_type_enabled(v57, v58);
      uint64_t v60 = v139;
      if (v59)
      {
        uint64_t v61 = swift_slowAlloc();
        uint64_t v131 = v27;
        uint64_t v62 = v61;
        uint64_t v129 = (char *)swift_slowAlloc();
        v143[0] = (uint64_t)v129;
        *(_DWORD *)uint64_t v62 = 136315394;
        if (v56) {
          uint64_t v63 = v60;
        }
        else {
          uint64_t v63 = 7104878;
        }
        uint64_t v130 = v51;
        uint64_t v64 = v54;
        if (v56) {
          unint64_t v65 = v141;
        }
        else {
          unint64_t v65 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain();
        uint64_t v144 = sub_23C9BC474(v63, v65, v143);
        sub_23CA0E7C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v62 + 12) = 2080;
        uint64_t v66 = v133;
        if (v142) {
          uint64_t v67 = v133;
        }
        else {
          uint64_t v67 = 7104878;
        }
        if (v142) {
          unint64_t v68 = v142;
        }
        else {
          unint64_t v68 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain();
        uint64_t v69 = v67;
        unint64_t v56 = v141;
        uint64_t v144 = sub_23C9BC474(v69, v68, v143);
        unint64_t v55 = v142;
        sub_23CA0E7C0();
        swift_bridgeObjectRelease_n();
        uint64_t v60 = v139;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C9B6000, v57, v58, "Creating manifest for confirmation dialog phase with listenAfterSpeaking = true, sessionID %s, responseViewId %s", (uint8_t *)v62, 0x16u);
        BOOL v70 = v129;
        swift_arrayDestroy();
        MEMORY[0x23ECEDBE0](v70, -1, -1);
        uint64_t v71 = v62;
        unint64_t v27 = v131;
        MEMORY[0x23ECEDBE0](v71, -1, -1);

        (*(void (**)(char *, uint64_t))(v64 + 8))(v15, v140);
        uint64_t v51 = v130;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v52);
        uint64_t v66 = v133;
      }
      uint64_t v77 = v138(v27, v137, v51);
      MEMORY[0x270FA5388](v77);
      v125[-6] = v132;
      v125[-5] = v60;
      v125[-4] = v56;
      v125[-3] = v66;
      v125[-2] = v55;
    }
    else
    {
      sub_23CA0D0D0();
      char v73 = sub_23CA0E4B0();
      v32(v27, v51);
      v32(v29, v51);
      unint64_t v74 = v142;
      uint64_t v75 = v137;
      if ((v73 & 1) == 0 || (v131 & 1) == 0) {
        goto LABEL_61;
      }
      uint64_t v131 = v27;
      if (qword_268BBE6C0)
      {
        uint64_t v76 = qword_268BBE6C0;
      }
      else
      {
        type metadata accessor for ApplicationContext();
        uint64_t v76 = swift_allocObject();
        sub_23CA0D450();
        qword_268BBE6C0 = v76;
        swift_retain();
        swift_release();
      }
      sub_23C9BFAA4(v76 + 16, (uint64_t)v143);
      swift_retain();
      swift_release();
      __swift_project_boxed_opaque_existential_1(v143, v143[3]);
      char v78 = sub_23CA0D0B0();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v143);
      unint64_t v27 = v131;
      if (v78)
      {
        if (qword_268BBDF58 != -1) {
          swift_once();
        }
        uint64_t v79 = v140;
        uint64_t v80 = __swift_project_value_buffer(v140, (uint64_t)qword_268BBF028);
        os_log_type_t v81 = v128;
        (*(void (**)(char *, uint64_t, uint64_t))(v136 + 16))(v128, v80, v79);
        uint64_t v82 = v51;
        uint64_t v83 = v51;
        unsigned int v84 = (void (*)(char *, char *, NSObject *))v138;
        v138(v129, v75, v83);
        swift_bridgeObjectRetain_n();
        unint64_t v85 = v141;
        swift_bridgeObjectRetain_n();
        uint64_t v86 = sub_23CA0E3F0();
        os_log_type_t v87 = sub_23CA0E710();
        uint64_t v130 = v86;
        int v127 = v87;
        if (os_log_type_enabled(v86, v87))
        {
          uint64_t v88 = swift_slowAlloc();
          uint64_t v126 = swift_slowAlloc();
          v143[0] = v126;
          *(_DWORD *)uint64_t v88 = 136315650;
          v125[1] = v88 + 4;
          uint64_t v89 = v129;
          v84(v131, v129, v82);
          uint64_t v90 = sub_23CA0E4F0();
          uint64_t v144 = sub_23C9BC474(v90, v91, v143);
          sub_23CA0E7C0();
          swift_bridgeObjectRelease();
          v32(v89, v82);
          *(_WORD *)(v88 + 12) = 2080;
          uint64_t v92 = v139;
          if (v85) {
            uint64_t v93 = v139;
          }
          else {
            uint64_t v93 = 7104878;
          }
          if (v85) {
            unint64_t v94 = v85;
          }
          else {
            unint64_t v94 = 0xE300000000000000;
          }
          swift_bridgeObjectRetain();
          uint64_t v144 = sub_23C9BC474(v93, v94, v143);
          sub_23CA0E7C0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v88 + 22) = 2080;
          if (v142) {
            uint64_t v95 = v133;
          }
          else {
            uint64_t v95 = 7104878;
          }
          uint64_t v96 = v133;
          if (v142) {
            unint64_t v97 = v142;
          }
          else {
            unint64_t v97 = 0xE300000000000000;
          }
          swift_bridgeObjectRetain();
          uint64_t v98 = v95;
          unint64_t v74 = v142;
          uint64_t v144 = sub_23C9BC474(v98, v97, v143);
          unsigned int v84 = (void (*)(char *, char *, NSObject *))v138;
          sub_23CA0E7C0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          uint64_t v99 = v130;
          _os_log_impl(&dword_23C9B6000, v130, (os_log_type_t)v127, "Using default dialog manifest with assistant dismissal for %s with session ID %s, responseViewId %s", (uint8_t *)v88, 0x20u);
          uint64_t v100 = v126;
          swift_arrayDestroy();
          MEMORY[0x23ECEDBE0](v100, -1, -1);
          uint64_t v101 = v88;
          unint64_t v27 = v131;
          MEMORY[0x23ECEDBE0](v101, -1, -1);

          (*(void (**)(char *, uint64_t))(v136 + 8))(v128, v140);
        }
        else
        {
          v32(v129, v82);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v136 + 8))(v81, v140);
          uint64_t v96 = v133;
          uint64_t v92 = v139;
        }
        uint64_t v123 = ((uint64_t (*)(char *, uint64_t, NSObject *))v84)(v27, v137, v82);
        MEMORY[0x270FA5388](v123);
        v125[-6] = v132;
        v125[-5] = v92;
        v125[-4] = v85;
        v125[-3] = v96;
        v125[-2] = v74;
      }
      else
      {
LABEL_61:
        if (qword_268BBDF58 != -1) {
          swift_once();
        }
        uint64_t v102 = v140;
        uint64_t v103 = __swift_project_value_buffer(v140, (uint64_t)qword_268BBF028);
        (*(void (**)(NSObject *, uint64_t, uint64_t))(v136 + 16))(v130, v103, v102);
        v138(v22, v75, v51);
        unint64_t v104 = v142;
        swift_bridgeObjectRetain_n();
        unint64_t v105 = v141;
        swift_bridgeObjectRetain_n();
        uint64_t v106 = sub_23CA0E3F0();
        os_log_type_t v107 = sub_23CA0E710();
        int v108 = v107;
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v109 = swift_slowAlloc();
          uint64_t v131 = v27;
          uint64_t v110 = v109;
          uint64_t v129 = (char *)swift_slowAlloc();
          v143[0] = (uint64_t)v129;
          *(_DWORD *)uint64_t v110 = 136315650;
          v138(v131, (uint64_t)v22, v51);
          uint64_t v111 = sub_23CA0E4F0();
          LODWORD(v128) = v108;
          uint64_t v144 = sub_23C9BC474(v111, v112, v143);
          sub_23CA0E7C0();
          swift_bridgeObjectRelease();
          v32(v22, v51);
          *(_WORD *)(v110 + 12) = 2080;
          uint64_t v113 = v139;
          if (v141) {
            uint64_t v114 = v139;
          }
          else {
            uint64_t v114 = 7104878;
          }
          if (v141) {
            unint64_t v115 = v141;
          }
          else {
            unint64_t v115 = 0xE300000000000000;
          }
          swift_bridgeObjectRetain();
          uint64_t v144 = sub_23C9BC474(v114, v115, v143);
          sub_23CA0E7C0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v110 + 22) = 2080;
          if (v142) {
            uint64_t v116 = v133;
          }
          else {
            uint64_t v116 = 7104878;
          }
          uint64_t v117 = v133;
          if (v142) {
            unint64_t v118 = v142;
          }
          else {
            unint64_t v118 = 0xE300000000000000;
          }
          swift_bridgeObjectRetain();
          uint64_t v119 = v116;
          unint64_t v104 = v142;
          uint64_t v144 = sub_23C9BC474(v119, v118, v143);
          sub_23CA0E7C0();
          swift_bridgeObjectRelease_n();
          unint64_t v105 = v141;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23C9B6000, v106, (os_log_type_t)v128, "Using default dialog manifest for %s with session ID %s, responseViewId %s", (uint8_t *)v110, 0x20u);
          os_log_t v120 = v129;
          swift_arrayDestroy();
          MEMORY[0x23ECEDBE0](v120, -1, -1);
          uint64_t v121 = v110;
          unint64_t v27 = v131;
          MEMORY[0x23ECEDBE0](v121, -1, -1);

          (*(void (**)(NSObject *, uint64_t))(v136 + 8))(v130, v140);
        }
        else
        {
          v32(v22, v51);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(NSObject *, uint64_t))(v136 + 8))(v130, v140);
          uint64_t v117 = v133;
          uint64_t v113 = v139;
        }
        uint64_t v122 = v138(v27, v137, v51);
        MEMORY[0x270FA5388](v122);
        v125[-6] = v132;
        v125[-5] = v113;
        v125[-4] = v105;
        v125[-3] = v117;
        v125[-2] = v104;
      }
    }
  }
  return sub_23CA0D310();
}

uint64_t sub_23CA0C2C8()
{
  uint64_t v0 = sub_23CA0E410();
  __swift_allocate_value_buffer(v0, qword_268BBF028);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268BBF028);
  if (qword_268BBDF30 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268BC2D00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23CA0C390(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBF048);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CA0D120();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0D360();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F6FA28], v6);
  sub_23CA0D320();
  uint64_t v10 = sub_23CA0D1E0();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v5, a2, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  sub_23CA0D340();
  swift_bridgeObjectRetain();
  sub_23CA0D370();
  swift_bridgeObjectRetain();
  return sub_23CA0D330();
}

uint64_t sub_23CA0C584(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBF048);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA0D360();
  uint64_t v6 = sub_23CA0D1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_23CA0D340();
  swift_bridgeObjectRetain();
  sub_23CA0D370();
  swift_bridgeObjectRetain();
  return sub_23CA0D330();
}

uint64_t sub_23CA0C6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBF048);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CA0D1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_23CA0D340();
  swift_bridgeObjectRetain();
  sub_23CA0D370();
  swift_bridgeObjectRetain();
  sub_23CA0D330();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBDF88);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_23CA0F560;
  *(void *)(v8 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F10]), sel_init);
  v10[1] = v8;
  sub_23CA0E5D0();
  return sub_23CA0D350();
}

uint64_t sub_23CA0C880(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBF048);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CA0D1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_23CA0D340();
  swift_bridgeObjectRetain();
  sub_23CA0D370();
  swift_bridgeObjectRetain();
  return sub_23CA0D330();
}

uint64_t sub_23CA0C9C8(uint64_t a1)
{
  return sub_23CA0CA28(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA0C880);
}

uint64_t sub_23CA0C9E0(uint64_t a1)
{
  return sub_23CA0CA28(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA0C6D4);
}

uint64_t sub_23CA0C9F8(uint64_t a1)
{
  return sub_23CA0CA28(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA0C584);
}

uint64_t sub_23CA0CA10(uint64_t a1)
{
  return sub_23CA0CA28(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA0C390);
}

uint64_t sub_23CA0CA28(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_23CA0CA40()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_23CA0CA50()
{
  return MEMORY[0x270EEE0F0]();
}

uint64_t sub_23CA0CA60()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_23CA0CA70()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23CA0CA80()
{
  return MEMORY[0x270EEE6C8]();
}

uint64_t sub_23CA0CA90()
{
  return MEMORY[0x270EEE6E0]();
}

uint64_t sub_23CA0CAA0()
{
  return MEMORY[0x270EEE708]();
}

uint64_t sub_23CA0CAB0()
{
  return MEMORY[0x270EEE718]();
}

uint64_t sub_23CA0CAC0()
{
  return MEMORY[0x270EEE730]();
}

uint64_t sub_23CA0CAD0()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_23CA0CAE0()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_23CA0CAF0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_23CA0CB00()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_23CA0CB10()
{
  return MEMORY[0x270EEE7A0]();
}

uint64_t sub_23CA0CB20()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_23CA0CB30()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_23CA0CB40()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_23CA0CB50()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_23CA0CB60()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_23CA0CB70()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_23CA0CB80()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_23CA0CB90()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_23CA0CBA0()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_23CA0CBB0()
{
  return MEMORY[0x270EEE868]();
}

uint64_t sub_23CA0CBC0()
{
  return MEMORY[0x270EEE880]();
}

uint64_t sub_23CA0CBD0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_23CA0CBE0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_23CA0CBF0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23CA0CC00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23CA0CC10()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23CA0CC20()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23CA0CC30()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23CA0CC40()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23CA0CC50()
{
  return MEMORY[0x270EEFF80]();
}

uint64_t sub_23CA0CC60()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_23CA0CC70()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23CA0CC80()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_23CA0CC90()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_23CA0CCA0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23CA0CCB0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23CA0CCC0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_23CA0CCD0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_23CA0CCE0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_23CA0CCF0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_23CA0CD00()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23CA0CD10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23CA0CD20()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_23CA0CD30()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23CA0CD40()
{
  return MEMORY[0x270EF1070]();
}

uint64_t sub_23CA0CD50()
{
  return MEMORY[0x270EF1090]();
}

uint64_t sub_23CA0CD60()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23CA0CD70()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_23CA0CD80()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_23CA0CD90()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_23CA0CDA0()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_23CA0CDB0()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_23CA0CDC0()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_23CA0CDD0()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_23CA0CDE0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_23CA0CDF0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_23CA0CE00()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_23CA0CE10()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_23CA0CE20()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23CA0CE30()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_23CA0CE40()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23CA0CE50()
{
  return MEMORY[0x270F739D8]();
}

uint64_t _s16SiriTimeInternal0aB16FeatureFlagsImplV19isTimerSmartEnabledSbyF_0()
{
  return MEMORY[0x270F741D8]();
}

uint64_t sub_23CA0CE70()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_23CA0CE80()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_23CA0CE90()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_23CA0CEA0()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_23CA0CEB0()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_23CA0CEF0()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_23CA0CF00()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_23CA0CF20()
{
  return MEMORY[0x270F669D0]();
}

uint64_t sub_23CA0CF30()
{
  return MEMORY[0x270F669D8]();
}

uint64_t sub_23CA0CF40()
{
  return MEMORY[0x270F66A00]();
}

uint64_t sub_23CA0CF50()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_23CA0CF60()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_23CA0CF70()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_23CA0CF90()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_23CA0CFA0()
{
  return MEMORY[0x270F66D30]();
}

uint64_t sub_23CA0CFB0()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_23CA0CFC0()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_23CA0CFE0()
{
  return MEMORY[0x270F66F50]();
}

uint64_t sub_23CA0CFF0()
{
  return MEMORY[0x270F66F58]();
}

uint64_t sub_23CA0D000()
{
  return MEMORY[0x270F66F60]();
}

uint64_t sub_23CA0D010()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_23CA0D020()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_23CA0D030()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_23CA0D040()
{
  return MEMORY[0x270F67050]();
}

uint64_t sub_23CA0D050()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_23CA0D060()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_23CA0D070()
{
  return MEMORY[0x270F67198]();
}

uint64_t sub_23CA0D080()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_23CA0D090()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_23CA0D0A0()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_23CA0D0B0()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_23CA0D0C0()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_23CA0D0D0()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_23CA0D0E0()
{
  return MEMORY[0x270F672F8]();
}

uint64_t sub_23CA0D0F0()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_23CA0D100()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_23CA0D110()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_23CA0D120()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_23CA0D130()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_23CA0D140()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_23CA0D150()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_23CA0D160()
{
  return MEMORY[0x270F67650]();
}

uint64_t sub_23CA0D170()
{
  return MEMORY[0x270F67658]();
}

uint64_t sub_23CA0D180()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_23CA0D190()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_23CA0D1A0()
{
  return MEMORY[0x270F67790]();
}

uint64_t sub_23CA0D1B0()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_23CA0D1C0()
{
  return MEMORY[0x270F677A8]();
}

uint64_t sub_23CA0D1D0()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_23CA0D1E0()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_23CA0D1F0()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_23CA0D200()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_23CA0D210()
{
  return MEMORY[0x270F67898]();
}

uint64_t sub_23CA0D220()
{
  return MEMORY[0x270F678A0]();
}

uint64_t sub_23CA0D230()
{
  return MEMORY[0x270F678B0]();
}

uint64_t sub_23CA0D240()
{
  return MEMORY[0x270F678B8]();
}

uint64_t sub_23CA0D250()
{
  return MEMORY[0x270F678D0]();
}

uint64_t sub_23CA0D260()
{
  return MEMORY[0x270F67928]();
}

uint64_t sub_23CA0D270()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_23CA0D280()
{
  return MEMORY[0x270F67A58]();
}

uint64_t sub_23CA0D290()
{
  return MEMORY[0x270F67A60]();
}

uint64_t sub_23CA0D2B0()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_23CA0D2C0()
{
  return MEMORY[0x270F67C68]();
}

uint64_t sub_23CA0D2D0()
{
  return MEMORY[0x270F67CA0]();
}

uint64_t sub_23CA0D2E0()
{
  return MEMORY[0x270F67CA8]();
}

uint64_t sub_23CA0D2F0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_23CA0D300()
{
  return MEMORY[0x270F67E38]();
}

uint64_t sub_23CA0D310()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_23CA0D320()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_23CA0D330()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_23CA0D340()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_23CA0D350()
{
  return MEMORY[0x270F67EC0]();
}

uint64_t sub_23CA0D360()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_23CA0D370()
{
  return MEMORY[0x270F67ED8]();
}

uint64_t sub_23CA0D380()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_23CA0D390()
{
  return MEMORY[0x270F68178]();
}

uint64_t sub_23CA0D3A0()
{
  return MEMORY[0x270F68180]();
}

uint64_t sub_23CA0D3B0()
{
  return MEMORY[0x270F68188]();
}

uint64_t sub_23CA0D3C0()
{
  return MEMORY[0x270F68190]();
}

uint64_t sub_23CA0D3D0()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_23CA0D3E0()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_23CA0D3F0()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_23CA0D400()
{
  return MEMORY[0x270F68250]();
}

uint64_t sub_23CA0D410()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_23CA0D420()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_23CA0D430()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_23CA0D440()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_23CA0D450()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_23CA0D460()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_23CA0D470()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_23CA0D480()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_23CA0D490()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_23CA0D4A0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_23CA0D4B0()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_23CA0D4C0()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_23CA0D4D0()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_23CA0D4E0()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_23CA0D4F0()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_23CA0D500()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_23CA0D510()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_23CA0D520()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_23CA0D530()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_23CA0D540()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_23CA0D550()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_23CA0D560()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_23CA0D570()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_23CA0D580()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_23CA0D590()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_23CA0D5A0()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_23CA0D5B0()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_23CA0D5C0()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_23CA0D5D0()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_23CA0D5E0()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_23CA0D5F0()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_23CA0D600()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_23CA0D610()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_23CA0D620()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_23CA0D630()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_23CA0D640()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_23CA0D650()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_23CA0D660()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_23CA0D670()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_23CA0D680()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_23CA0D690()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_23CA0D6A0()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_23CA0D6B0()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_23CA0D6C0()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_23CA0D6D0()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_23CA0D6E0()
{
  return MEMORY[0x270F6CA30]();
}

uint64_t sub_23CA0D6F0()
{
  return MEMORY[0x270F65408]();
}

uint64_t sub_23CA0D700()
{
  return MEMORY[0x270F65410]();
}

uint64_t sub_23CA0D710()
{
  return MEMORY[0x270F6CBF0]();
}

uint64_t sub_23CA0D720()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_23CA0D730()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_23CA0D740()
{
  return MEMORY[0x270F6CD68]();
}

uint64_t sub_23CA0D750()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_23CA0D760()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_23CA0D770()
{
  return MEMORY[0x270F6CDB0]();
}

uint64_t sub_23CA0D780()
{
  return MEMORY[0x270F6CF20]();
}

uint64_t sub_23CA0D790()
{
  return MEMORY[0x270F6CF30]();
}

uint64_t sub_23CA0D7A0()
{
  return MEMORY[0x270F6CF40]();
}

uint64_t sub_23CA0D7B0()
{
  return MEMORY[0x270F6CF48]();
}

uint64_t sub_23CA0D7C0()
{
  return MEMORY[0x270F6CFD0]();
}

uint64_t sub_23CA0D7D0()
{
  return MEMORY[0x270F6CFD8]();
}

uint64_t sub_23CA0D7E0()
{
  return MEMORY[0x270F6CFE0]();
}

uint64_t sub_23CA0D7F0()
{
  return MEMORY[0x270F6D030]();
}

uint64_t sub_23CA0D800()
{
  return MEMORY[0x270F6D038]();
}

uint64_t sub_23CA0D810()
{
  return MEMORY[0x270F6D040]();
}

uint64_t sub_23CA0D820()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_23CA0D830()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t sub_23CA0D840()
{
  return MEMORY[0x270F6D108]();
}

uint64_t sub_23CA0D850()
{
  return MEMORY[0x270F6D110]();
}

uint64_t sub_23CA0D860()
{
  return MEMORY[0x270F6D118]();
}

uint64_t sub_23CA0D870()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_23CA0D880()
{
  return MEMORY[0x270F6D128]();
}

uint64_t sub_23CA0D890()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_23CA0D8A0()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_23CA0D8B0()
{
  return MEMORY[0x270F65440]();
}

uint64_t sub_23CA0D8C0()
{
  return MEMORY[0x270F6D240]();
}

uint64_t sub_23CA0D8D0()
{
  return MEMORY[0x270F6D248]();
}

uint64_t sub_23CA0D8E0()
{
  return MEMORY[0x270F6D250]();
}

uint64_t sub_23CA0D8F0()
{
  return MEMORY[0x270F6D258]();
}

uint64_t sub_23CA0D900()
{
  return MEMORY[0x270F6D260]();
}

uint64_t sub_23CA0D910()
{
  return MEMORY[0x270F6D268]();
}

uint64_t sub_23CA0D920()
{
  return MEMORY[0x270F6D278]();
}

uint64_t sub_23CA0D930()
{
  return MEMORY[0x270F6D288]();
}

uint64_t sub_23CA0D940()
{
  return MEMORY[0x270F6D2C0]();
}

uint64_t sub_23CA0D950()
{
  return MEMORY[0x270F6D310]();
}

uint64_t sub_23CA0D960()
{
  return MEMORY[0x270F6D318]();
}

uint64_t sub_23CA0D970()
{
  return MEMORY[0x270F6D320]();
}

uint64_t sub_23CA0D980()
{
  return MEMORY[0x270F6D3E0]();
}

uint64_t sub_23CA0D990()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_23CA0D9A0()
{
  return MEMORY[0x270F6D418]();
}

uint64_t sub_23CA0D9B0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_23CA0D9C0()
{
  return MEMORY[0x270F6D600]();
}

uint64_t sub_23CA0D9D0()
{
  return MEMORY[0x270F6D610]();
}

uint64_t sub_23CA0D9E0()
{
  return MEMORY[0x270F6D620]();
}

uint64_t sub_23CA0D9F0()
{
  return MEMORY[0x270F6D628]();
}

uint64_t sub_23CA0DA00()
{
  return MEMORY[0x270F6D678]();
}

uint64_t sub_23CA0DA10()
{
  return MEMORY[0x270F6D690]();
}

uint64_t sub_23CA0DA20()
{
  return MEMORY[0x270F6D6B8]();
}

uint64_t sub_23CA0DA30()
{
  return MEMORY[0x270F6D6C8]();
}

uint64_t sub_23CA0DA40()
{
  return MEMORY[0x270F6D6D0]();
}

uint64_t sub_23CA0DA50()
{
  return MEMORY[0x270F6D6D8]();
}

uint64_t sub_23CA0DA60()
{
  return MEMORY[0x270F6D6E0]();
}

uint64_t sub_23CA0DA70()
{
  return MEMORY[0x270F6D768]();
}

uint64_t sub_23CA0DA80()
{
  return MEMORY[0x270F6D7F0]();
}

uint64_t sub_23CA0DA90()
{
  return MEMORY[0x270F6D820]();
}

uint64_t sub_23CA0DAA0()
{
  return MEMORY[0x270F6D868]();
}

uint64_t sub_23CA0DAB0()
{
  return MEMORY[0x270F6D870]();
}

uint64_t sub_23CA0DAC0()
{
  return MEMORY[0x270F6D878]();
}

uint64_t sub_23CA0DAD0()
{
  return MEMORY[0x270F65450]();
}

uint64_t sub_23CA0DAE0()
{
  return MEMORY[0x270F6DBD8]();
}

uint64_t sub_23CA0DAF0()
{
  return MEMORY[0x270F6DBE0]();
}

uint64_t sub_23CA0DB00()
{
  return MEMORY[0x270F6DC00]();
}

uint64_t sub_23CA0DB10()
{
  return MEMORY[0x270F6DC18]();
}

uint64_t sub_23CA0DB20()
{
  return MEMORY[0x270F6DC38]();
}

uint64_t sub_23CA0DB30()
{
  return MEMORY[0x270F6DC40]();
}

uint64_t sub_23CA0DB40()
{
  return MEMORY[0x270F6DC48]();
}

uint64_t sub_23CA0DB50()
{
  return MEMORY[0x270F6DC50]();
}

uint64_t sub_23CA0DB60()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_23CA0DB70()
{
  return MEMORY[0x270F6DD30]();
}

uint64_t sub_23CA0DB80()
{
  return MEMORY[0x270F6DD78]();
}

uint64_t sub_23CA0DB90()
{
  return MEMORY[0x270F6DD88]();
}

uint64_t sub_23CA0DBA0()
{
  return MEMORY[0x270F6DD90]();
}

uint64_t sub_23CA0DBB0()
{
  return MEMORY[0x270F6DFA8]();
}

uint64_t sub_23CA0DBC0()
{
  return MEMORY[0x270F6DFB0]();
}

uint64_t sub_23CA0DBD0()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_23CA0DBE0()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_23CA0DBF0()
{
  return MEMORY[0x270F6DFF8]();
}

uint64_t sub_23CA0DC00()
{
  return MEMORY[0x270F6E000]();
}

uint64_t sub_23CA0DC10()
{
  return MEMORY[0x270F6E008]();
}

uint64_t sub_23CA0DC20()
{
  return MEMORY[0x270F6E0D8]();
}

uint64_t sub_23CA0DC30()
{
  return MEMORY[0x270F6E0E0]();
}

uint64_t sub_23CA0DC40()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t sub_23CA0DC50()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_23CA0DC60()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_23CA0DC70()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t sub_23CA0DC80()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t sub_23CA0DC90()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t sub_23CA0DCA0()
{
  return MEMORY[0x270F6E4D8]();
}

uint64_t sub_23CA0DCB0()
{
  return MEMORY[0x270F6E4E0]();
}

uint64_t sub_23CA0DCC0()
{
  return MEMORY[0x270F6E4F0]();
}

uint64_t sub_23CA0DCD0()
{
  return MEMORY[0x270F65468]();
}

uint64_t sub_23CA0DCE0()
{
  return MEMORY[0x270F6E4F8]();
}

uint64_t sub_23CA0DCF0()
{
  return MEMORY[0x270F6E5E0]();
}

uint64_t sub_23CA0DD00()
{
  return MEMORY[0x270F6E5E8]();
}

uint64_t sub_23CA0DD10()
{
  return MEMORY[0x270F6E5F0]();
}

uint64_t sub_23CA0DD20()
{
  return MEMORY[0x270F6E710]();
}

uint64_t sub_23CA0DD30()
{
  return MEMORY[0x270F6EA48]();
}

uint64_t sub_23CA0DD40()
{
  return MEMORY[0x270F6EA50]();
}

uint64_t sub_23CA0DD50()
{
  return MEMORY[0x270F6EAD0]();
}

uint64_t sub_23CA0DD60()
{
  return MEMORY[0x270F6EAE0]();
}

uint64_t sub_23CA0DD70()
{
  return MEMORY[0x270F6EAE8]();
}

uint64_t sub_23CA0DD80()
{
  return MEMORY[0x270F6ED78]();
}

uint64_t sub_23CA0DD90()
{
  return MEMORY[0x270F6ED80]();
}

uint64_t sub_23CA0DDA0()
{
  return MEMORY[0x270F6ED88]();
}

uint64_t sub_23CA0DDB0()
{
  return MEMORY[0x270F6ED90]();
}

uint64_t sub_23CA0DDC0()
{
  return MEMORY[0x270F6ED98]();
}

uint64_t sub_23CA0DDD0()
{
  return MEMORY[0x270F6F280]();
}

uint64_t sub_23CA0DDE0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_23CA0DDF0()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_23CA0DE00()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_23CA0DE10()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_23CA0DE20()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_23CA0DE30()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_23CA0DE40()
{
  return MEMORY[0x270F65950]();
}

uint64_t sub_23CA0DE50()
{
  return MEMORY[0x270F65958]();
}

uint64_t sub_23CA0DE60()
{
  return MEMORY[0x270F65960]();
}

uint64_t sub_23CA0DE70()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_23CA0DE80()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_23CA0DE90()
{
  return MEMORY[0x270F659C8]();
}

uint64_t sub_23CA0DEA0()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_23CA0DEB0()
{
  return MEMORY[0x270F659E0]();
}

uint64_t sub_23CA0DEC0()
{
  return MEMORY[0x270F659E8]();
}

uint64_t sub_23CA0DED0()
{
  return MEMORY[0x270F659F0]();
}

uint64_t sub_23CA0DEE0()
{
  return MEMORY[0x270F65C40]();
}

uint64_t sub_23CA0DEF0()
{
  return MEMORY[0x270F65C80]();
}

uint64_t sub_23CA0DF00()
{
  return MEMORY[0x270F65C88]();
}

uint64_t sub_23CA0DF10()
{
  return MEMORY[0x270F65C90]();
}

uint64_t sub_23CA0DF20()
{
  return MEMORY[0x270F65CA0]();
}

uint64_t sub_23CA0DF30()
{
  return MEMORY[0x270F65CB0]();
}

uint64_t sub_23CA0DF40()
{
  return MEMORY[0x270F65CC0]();
}

uint64_t sub_23CA0DF50()
{
  return MEMORY[0x270F65CD0]();
}

uint64_t sub_23CA0DF60()
{
  return MEMORY[0x270F65CD8]();
}

uint64_t sub_23CA0DF70()
{
  return MEMORY[0x270F65CE0]();
}

uint64_t sub_23CA0DF80()
{
  return MEMORY[0x270F65CE8]();
}

uint64_t sub_23CA0DF90()
{
  return MEMORY[0x270F65CF0]();
}

uint64_t sub_23CA0DFA0()
{
  return MEMORY[0x270F65CF8]();
}

uint64_t sub_23CA0DFB0()
{
  return MEMORY[0x270F65D00]();
}

uint64_t sub_23CA0DFC0()
{
  return MEMORY[0x270F65D08]();
}

uint64_t sub_23CA0DFD0()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_23CA0DFE0()
{
  return MEMORY[0x270F65D48]();
}

uint64_t sub_23CA0DFF0()
{
  return MEMORY[0x270F65D78]();
}

uint64_t sub_23CA0E000()
{
  return MEMORY[0x270F65DA0]();
}

uint64_t sub_23CA0E010()
{
  return MEMORY[0x270F65DB0]();
}

uint64_t sub_23CA0E020()
{
  return MEMORY[0x270F65DF0]();
}

uint64_t sub_23CA0E030()
{
  return MEMORY[0x270F65E00]();
}

uint64_t sub_23CA0E040()
{
  return MEMORY[0x270F65E08]();
}

uint64_t sub_23CA0E050()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_23CA0E060()
{
  return MEMORY[0x270F683F8]();
}

uint64_t sub_23CA0E070()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_23CA0E080()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_23CA0E090()
{
  return MEMORY[0x270F729D8]();
}

uint64_t sub_23CA0E0A0()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_23CA0E0B0()
{
  return MEMORY[0x270F72C28]();
}

uint64_t sub_23CA0E0C0()
{
  return MEMORY[0x270F72C30]();
}

uint64_t sub_23CA0E0D0()
{
  return MEMORY[0x270F72C38]();
}

uint64_t sub_23CA0E0E0()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t sub_23CA0E0F0()
{
  return MEMORY[0x270F64EF0]();
}

uint64_t sub_23CA0E100()
{
  return MEMORY[0x270F64F08]();
}

uint64_t sub_23CA0E110()
{
  return MEMORY[0x270F64F10]();
}

uint64_t sub_23CA0E120()
{
  return MEMORY[0x270F64F18]();
}

uint64_t sub_23CA0E130()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_23CA0E140()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_23CA0E150()
{
  return MEMORY[0x270F64FF8]();
}

uint64_t sub_23CA0E160()
{
  return MEMORY[0x270F650C8]();
}

uint64_t sub_23CA0E170()
{
  return MEMORY[0x270F650F0]();
}

uint64_t sub_23CA0E180()
{
  return MEMORY[0x270F650F8]();
}

uint64_t sub_23CA0E190()
{
  return MEMORY[0x270F65100]();
}

uint64_t sub_23CA0E1A0()
{
  return MEMORY[0x270F65110]();
}

uint64_t sub_23CA0E1B0()
{
  return MEMORY[0x270F65118]();
}

uint64_t sub_23CA0E1C0()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_23CA0E1D0()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_23CA0E1E0()
{
  return MEMORY[0x270F653C8]();
}

uint64_t sub_23CA0E1F0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_23CA0E200()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_23CA0E210()
{
  return MEMORY[0x270F70700]();
}

uint64_t sub_23CA0E220()
{
  return MEMORY[0x270F70718]();
}

uint64_t sub_23CA0E230()
{
  return MEMORY[0x270F72DF0]();
}

uint64_t sub_23CA0E240()
{
  return MEMORY[0x270F72DF8]();
}

uint64_t sub_23CA0E250()
{
  return MEMORY[0x270F72E08]();
}

uint64_t sub_23CA0E260()
{
  return MEMORY[0x270F72E18]();
}

uint64_t sub_23CA0E270()
{
  return MEMORY[0x270F72E20]();
}

uint64_t sub_23CA0E280()
{
  return MEMORY[0x270F72E28]();
}

uint64_t sub_23CA0E290()
{
  return MEMORY[0x270F72E30]();
}

uint64_t _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0()
{
  return MEMORY[0x270F72E38]();
}

uint64_t sub_23CA0E2B0()
{
  return MEMORY[0x270F72E48]();
}

uint64_t sub_23CA0E2C0()
{
  return MEMORY[0x270F72E50]();
}

uint64_t sub_23CA0E2D0()
{
  return MEMORY[0x270F72E78]();
}

uint64_t sub_23CA0E2E0()
{
  return MEMORY[0x270F72E80]();
}

uint64_t sub_23CA0E2F0()
{
  return MEMORY[0x270F72E88]();
}

uint64_t sub_23CA0E300()
{
  return MEMORY[0x270F72E98]();
}

uint64_t sub_23CA0E310()
{
  return MEMORY[0x270F72EA0]();
}

uint64_t sub_23CA0E320()
{
  return MEMORY[0x270F72EA8]();
}

uint64_t sub_23CA0E330()
{
  return MEMORY[0x270F72EC0]();
}

uint64_t sub_23CA0E340()
{
  return MEMORY[0x270F72EC8]();
}

uint64_t sub_23CA0E370()
{
  return MEMORY[0x270F72EF0]();
}

uint64_t sub_23CA0E380()
{
  return MEMORY[0x270F72EF8]();
}

uint64_t sub_23CA0E390()
{
  return MEMORY[0x270F72F00]();
}

uint64_t sub_23CA0E3A0()
{
  return MEMORY[0x270F72F10]();
}

uint64_t sub_23CA0E3B0()
{
  return MEMORY[0x270F72F18]();
}

uint64_t sub_23CA0E3C0()
{
  return MEMORY[0x270F72F88]();
}

uint64_t sub_23CA0E3D0()
{
  return MEMORY[0x270F72F90]();
}

uint64_t sub_23CA0E3E0()
{
  return MEMORY[0x270F72FA0]();
}

uint64_t sub_23CA0E3F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23CA0E400()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23CA0E410()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23CA0E420()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_23CA0E430()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_23CA0E440()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_23CA0E450()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_23CA0E460()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_23CA0E470()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_23CA0E480()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23CA0E490()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_23CA0E4A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23CA0E4B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23CA0E4C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23CA0E4D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23CA0E4E0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23CA0E4F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23CA0E500()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_23CA0E510()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_23CA0E520()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23CA0E530()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23CA0E540()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_23CA0E550()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23CA0E560()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23CA0E580()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_23CA0E590()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23CA0E5A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23CA0E5B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23CA0E5C0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23CA0E5D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23CA0E5E0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23CA0E5F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23CA0E600()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23CA0E610()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_23CA0E620()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23CA0E630()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23CA0E640()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23CA0E650()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23CA0E660()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23CA0E670()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_23CA0E680()
{
  return MEMORY[0x270F9DD70]();
}

uint64_t sub_23CA0E690()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t sub_23CA0E6A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23CA0E6B0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_23CA0E6C0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_23CA0E6D0()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_23CA0E6E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23CA0E6F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23CA0E700()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23CA0E710()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23CA0E720()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_23CA0E730()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23CA0E740()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_23CA0E750()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23CA0E760()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_23CA0E770()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_23CA0E780()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23CA0E790()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_23CA0E7A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23CA0E7B0()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_23CA0E7C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23CA0E7D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23CA0E7E0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_23CA0E7F0()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_23CA0E800()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_23CA0E810()
{
  return MEMORY[0x270EF2518]();
}

uint64_t sub_23CA0E820()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_23CA0E830()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23CA0E840()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_23CA0E850()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_23CA0E860()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_23CA0E870()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_23CA0E880()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_23CA0E890()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23CA0E8A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23CA0E8B0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_23CA0E8C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23CA0E8D0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_23CA0E8E0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_23CA0E8F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23CA0E900()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23CA0E910()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23CA0E920()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23CA0E930()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_23CA0E940()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_23CA0E950()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23CA0E960()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_23CA0E970()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_23CA0E980()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_23CA0E990()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_23CA0E9A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23CA0E9B0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_23CA0E9C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23CA0E9D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23CA0E9E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23CA0E9F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23CA0EA00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23CA0EA10()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23CA0EA20()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_23CA0EA30()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_23CA0EA40()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_23CA0EA50()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23CA0EA60()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_23CA0EA70()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_23CA0EA80()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_23CA0EA90()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23CA0EAA0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23CA0EAB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23CA0EAC0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_23CA0EAD0()
{
  return MEMORY[0x270F9F370]();
}

uint64_t sub_23CA0EAE0()
{
  return MEMORY[0x270F9F388]();
}

uint64_t sub_23CA0EAF0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_23CA0EB00()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_23CA0EB10()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23CA0EB20()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_23CA0EB30()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_23CA0EB40()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23CA0EB50()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23CA0EB60()
{
  return MEMORY[0x270F9F4A0]();
}

uint64_t sub_23CA0EB70()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23CA0EB80()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23CA0EBA0()
{
  return MEMORY[0x270F9F508]();
}

uint64_t sub_23CA0EBB0()
{
  return MEMORY[0x270F9F510]();
}

uint64_t sub_23CA0EBC0()
{
  return MEMORY[0x270F9F528]();
}

uint64_t sub_23CA0EBD0()
{
  return MEMORY[0x270F9F530]();
}

uint64_t sub_23CA0EBE0()
{
  return MEMORY[0x270F9F538]();
}

uint64_t sub_23CA0EBF0()
{
  return MEMORY[0x270F9F540]();
}

uint64_t sub_23CA0EC00()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_23CA0EC10()
{
  return MEMORY[0x270F9F5A8]();
}

uint64_t sub_23CA0EC20()
{
  return MEMORY[0x270F9F600]();
}

uint64_t sub_23CA0EC30()
{
  return MEMORY[0x270F9F608]();
}

uint64_t sub_23CA0EC40()
{
  return MEMORY[0x270F9F630]();
}

uint64_t sub_23CA0EC50()
{
  return MEMORY[0x270F9F638]();
}

uint64_t sub_23CA0EC60()
{
  return MEMORY[0x270F9F640]();
}

uint64_t sub_23CA0EC70()
{
  return MEMORY[0x270F9F650]();
}

uint64_t sub_23CA0EC80()
{
  return MEMORY[0x270F9F680]();
}

uint64_t sub_23CA0EC90()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_23CA0ECA0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23CA0ECB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23CA0ECC0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_23CA0ECD0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_23CA0ECE0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23CA0ECF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23CA0ED00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23CA0ED10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23CA0ED20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23CA0ED30()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23CA0ED40()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}