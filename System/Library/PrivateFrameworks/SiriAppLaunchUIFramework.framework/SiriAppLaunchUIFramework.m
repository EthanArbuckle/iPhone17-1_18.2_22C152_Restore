uint64_t sub_25C52F4E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  id v26;
  id v27;
  uint64_t result;
  char *v30;
  objc_super v33;
  void *v34;

  *(void *)&v4[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_adamIds] = a1;
  v6 = *(void *)(a1 + 16);
  if (v6)
  {
    type metadata accessor for ASCLockupEventManager();
    v7 = v4;
    swift_bridgeObjectRetain();
    v8 = (void *)MEMORY[0x263F8EE80];
    v9 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v11 = *(v9 - 1);
      v10 = *v9;
      v12 = swift_allocObject();
      v13 = MEMORY[0x263F8EE78];
      *(void *)(v12 + 16) = MEMORY[0x263F8EE78];
      *(void *)(v12 + 24) = v13;
      swift_bridgeObjectRetain();
      swift_isUniquelyReferenced_nonNull_native();
      v34 = v8;
      v14 = sub_25C531560(v11, v10);
      if (__OFADD__(v8[2], (v15 & 1) == 0)) {
        break;
      }
      v16 = v14;
      v17 = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF608);
      if (sub_25C53F428())
      {
        v18 = sub_25C531560(v11, v10);
        if ((v17 & 1) != (v19 & 1)) {
          goto LABEL_17;
        }
        v16 = v18;
      }
      v8 = v34;
      if (v17)
      {
        *(void *)(v34[7] + 8 * v16) = v12;
        swift_release();
      }
      else
      {
        v34[(v16 >> 6) + 8] |= 1 << v16;
        v20 = (uint64_t *)(v8[6] + 16 * v16);
        *v20 = v11;
        v20[1] = v10;
        *(void *)(v8[7] + 8 * v16) = v12;
        v21 = v8[2];
        v22 = __OFADD__(v21, 1);
        v23 = v21 + 1;
        if (v22) {
          goto LABEL_16;
        }
        v8[2] = v23;
        swift_bridgeObjectRetain();
      }
      v9 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v6) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_25C53F488();
    __break(1u);
  }
  else
  {
    v24 = v4;
    swift_bridgeObjectRetain();
    v8 = (void *)MEMORY[0x263F8EE80];
LABEL_14:
    swift_bridgeObjectRelease();
    *(void *)&v30[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupEventManagers] = v8;
    *(void *)&v30[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_context] = a2;
    v25 = (uint64_t *)&v30[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler];
    *v25 = a3;
    v25[1] = a4;
    v26 = a2;
    sub_25C53161C(a3);

    v33.receiver = v30;
    v33.super_class = (Class)type metadata accessor for AppResultsViewFeedbackDelegate();
    v27 = objc_msgSendSuper2(&v33, sel_init);
    sub_25C53162C(a3);

    return (uint64_t)v27;
  }
  return result;
}

void sub_25C52F750()
{
  OUTLINED_FUNCTION_4();
  v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25C53EF98();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  if (qword_26A5AF578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v7, (uint64_t)qword_26A5B03A0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3();
  v10();
  id v11 = v2;
  swift_bridgeObjectRetain();
  id v12 = v2;
  swift_bridgeObjectRetain();
  v13 = sub_25C53EF88();
  os_log_type_t v14 = sub_25C53F398();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v21 = v6;
    uint64_t v15 = swift_slowAlloc();
    v20 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412546;
    id v16 = v2;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_7(v17);
    sub_25C53F3E8();
    void *v20 = v17;

    *(_WORD *)(v15 + 12) = 2080;
    if (v4) {
      uint64_t v18 = v21;
    }
    else {
      uint64_t v18 = 7104878;
    }
    if (v4) {
      unint64_t v19 = v4;
    }
    else {
      unint64_t v19 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_25C530DA8(v18, v19, &v22);
    sub_25C53F3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C52D000, v13, v14, "AppResultsViewFeedbackDelegate.lockupView didFailRequestWithError: %@ forAdamId: %s", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF620);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    uint64_t v6 = v21;
    OUTLINED_FUNCTION_1();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
  }
  if (v4 && sub_25C530718(v6, v4))
  {
    if (sub_25C531EAC((void *)1) != 5) {
      sub_25C5302D0();
    }
    swift_release();
  }
  OUTLINED_FUNCTION_5();
}

void sub_25C52FB14()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_25C53EF98();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  if (qword_26A5AF578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v6, (uint64_t)qword_26A5B03A0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3();
  v9();
  swift_bridgeObjectRetain_n();
  v10 = sub_25C53EF88();
  os_log_type_t v11 = sub_25C53F398();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)id v12 = 136315138;
    uint64_t v18 = v6;
    if (v3) {
      uint64_t v13 = v5;
    }
    else {
      uint64_t v13 = 7104878;
    }
    if (v3) {
      unint64_t v14 = v3;
    }
    else {
      unint64_t v14 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_25C530DA8(v13, v14, &v19);
    OUTLINED_FUNCTION_7(v15);
    sub_25C53F3E8();
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v0;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C52D000, v10, v11, "AppResultsViewFeedbackDelegate.lockupViewEngaged forAdamId: %s", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v0, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  }
  uint64_t v17 = *(void (**)(uint64_t))(v1
                                       + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler);
  if (v17) {
    v17(v16);
  }
  if (v3 && sub_25C530718(v5, v3))
  {
    if (sub_25C531EAC(0) != 5) {
      sub_25C5302D0();
    }
    swift_release();
  }
  OUTLINED_FUNCTION_5();
}

void sub_25C52FE2C()
{
  OUTLINED_FUNCTION_4();
  uint64_t v40 = v0;
  unint64_t v2 = v1;
  uint64_t v44 = v4;
  uint64_t v45 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25C53EF98();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v36 - v13;
  if (qword_26A5AF578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v7, (uint64_t)qword_26A5B03A0);
  OUTLINED_FUNCTION_8();
  uint64_t v42 = v15;
  uint64_t v43 = v16;
  uint64_t v41 = v17;
  OUTLINED_FUNCTION_3();
  v18();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_25C53EF88();
  os_log_type_t v20 = sub_25C53F398();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v39 = v7;
    uint64_t v22 = v21;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v47 = v36;
    *(_DWORD *)uint64_t v22 = 136315394;
    v37 = v12;
    uint64_t v38 = v9;
    if (v6) {
      uint64_t v23 = v45;
    }
    else {
      uint64_t v23 = 7104878;
    }
    if (v6) {
      unint64_t v24 = v6;
    }
    else {
      unint64_t v24 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_25C530DA8(v23, v24, &v47);
    OUTLINED_FUNCTION_7(v25);
    sub_25C53F3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    if (v2) {
      uint64_t v26 = v44;
    }
    else {
      uint64_t v26 = 7104878;
    }
    if (v2) {
      unint64_t v27 = v2;
    }
    else {
      unint64_t v27 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_25C530DA8(v26, v27, &v47);
    id v12 = v37;
    uint64_t v9 = v38;
    sub_25C53F3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C52D000, v19, v20, "AppResultsViewFeedbackDelegate.lockupView forAdamId: %s state: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    uint64_t v7 = v39;
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  v28(v14, v7);
  if (v6 && v2 && sub_25C530718(v45, v6))
  {
    v29 = (void *)sub_25C53F338();
    int v30 = sub_25C531EAC(v29);

    if (v30 != 5) {
      sub_25C5302D0();
    }
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_3();
    v32(v31);
    v33 = sub_25C53EF88();
    os_log_type_t v34 = sub_25C53F3B8();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_25C52D000, v33, v34, "AppResultsViewFeedbackDelegate.lockupView missing adamId or ascAppState for lockupView update", v35, 2u);
      OUTLINED_FUNCTION_1();
    }

    v28(v12, v7);
  }
  OUTLINED_FUNCTION_5();
}

void sub_25C5302D0()
{
  OUTLINED_FUNCTION_4();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  char v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF610);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v9 = v8 - v7;
  sub_25C53F238();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v11;
  uint64_t v36 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v14 = v13 - v12;
  sub_25C53ED88();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v16;
  uint64_t v34 = v15;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v37 = v18 - v17;
  uint64_t v19 = sub_25C53EF98();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  if (qword_26A5AF578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v19, (uint64_t)qword_26A5B03A0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3();
  v22();
  swift_bridgeObjectRetain_n();
  uint64_t v23 = sub_25C53EF88();
  os_log_type_t v32 = sub_25C53F3A8();
  if (os_log_type_enabled(v23, v32))
  {
    uint64_t v31 = v14;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315394;
    unint64_t v25 = sub_25C531A0C(v6);
    uint64_t v27 = sub_25C530DA8(v25, v26, &v38);
    OUTLINED_FUNCTION_7(v27);
    sub_25C53F3E8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_25C530DA8(v4, v2, &v38);
    sub_25C53F3E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C52D000, v23, v32, "AppResultsViewFeedbackDelegate.emitInteractionEvent %s forAdamId: %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    uint64_t v14 = v31;
    OUTLINED_FUNCTION_1();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v0, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v0, v19);
  }
  sub_25C531A0C(v6);
  (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v37, *MEMORY[0x263F771B0], v34);
  (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v14, *MEMORY[0x263F77610], v36);
  sub_25C53F1F8();
  uint64_t v28 = sub_25C53F208();
  __swift_storeEnumTagSinglePayload(v9, 0, 1, v28);
  sub_25C53079C(v4, v2);
  id v29 = objc_allocWithZone((Class)sub_25C53F308());
  int v30 = (void *)sub_25C53F2F8();
  sub_25C53F318();

  OUTLINED_FUNCTION_5();
}

uint64_t sub_25C530718(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupEventManagers);
  if (!*(void *)(v3 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25C531560(a1, a2);
  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
    swift_retain();
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25C53079C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_25C5307C8(a1, a2, *(void **)(v2 + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_adamIds));
  if (v4) {
    return -1;
  }
  return result;
}

uint64_t sub_25C5307C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_25C53F478() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_25C53F478();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

void sub_25C5308B0()
{
}

id sub_25C5308F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppResultsViewFeedbackDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppResultsViewFeedbackDelegate()
{
  return self;
}

uint64_t sub_25C5309B8()
{
  return sub_25C530C90(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_25C5309EC(uint64_t a1, id *a2)
{
  uint64_t result = sub_25C53F348();
  *a2 = 0;
  return result;
}

uint64_t sub_25C530A68(uint64_t a1, id *a2)
{
  char v3 = sub_25C53F358();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25C530AE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C530B10();
  *a1 = result;
  return result;
}

uint64_t sub_25C530B10()
{
  sub_25C53F368();
  uint64_t v0 = sub_25C53F338();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C530B48()
{
  return sub_25C531C10();
}

uint64_t sub_25C530B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25C53F338();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25C530B9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C532A3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25C530BC8(uint64_t a1)
{
  uint64_t v2 = sub_25C531918(&qword_26A5AF648);
  uint64_t v3 = sub_25C531918((unint64_t *)&unk_26A5AF650);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25C530C60()
{
  return sub_25C530C90(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_25C530C90(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_25C53F368();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C530CD0()
{
  return sub_25C530CD8();
}

uint64_t sub_25C530CD8()
{
  sub_25C53F368();
  sub_25C53F378();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C530D2C()
{
  return sub_25C530D34();
}

uint64_t sub_25C530D34()
{
  sub_25C53F368();
  sub_25C53F498();
  sub_25C53F378();
  uint64_t v0 = sub_25C53F4A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C530DA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C530E7C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C5317D0((uint64_t)v12, *a3);
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
      sub_25C5317D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25C530E7C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C530FD4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C53F3F8();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C5310AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C53F418();
    if (!v8)
    {
      uint64_t result = sub_25C53F438();
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

void *sub_25C530FD4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C53F448();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C5310AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C531144(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C531320(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C531320((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C531144(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C53F388();
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
  unint64_t v3 = sub_25C5312B8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C53F408();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C53F448();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C53F438();
  __break(1u);
  return result;
}

void *sub_25C5312B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF618);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C531320(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF618);
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
  char v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C5314D0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C5313F8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C5313F8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C53F448();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C5314D0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C53F448();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_25C531560(uint64_t a1, uint64_t a2)
{
  sub_25C53F498();
  sub_25C53F378();
  uint64_t v4 = sub_25C53F4A8();
  return sub_25C53163C(a1, a2, v4);
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

uint64_t sub_25C53161C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C53162C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_25C53163C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C53F478() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25C53F478() & 1) == 0);
    }
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25C5317D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for ASCAppState()
{
  if (!qword_26A5AF628)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5AF628);
    }
  }
}

uint64_t sub_25C53187C()
{
  return sub_25C531918(&qword_26A5AF630);
}

uint64_t sub_25C5318B0()
{
  return sub_25C531918(&qword_26A5AF638);
}

uint64_t sub_25C5318E4()
{
  return sub_25C531918(&qword_26A5AF640);
}

uint64_t sub_25C531918(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ASCAppState();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x261189600);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result)
{
  *(void *)(v1 - 96) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

unint64_t sub_25C531A0C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x536C6C6174736E69;
      break;
    case 3:
      unint64_t result = 0x656E65704F707061;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C531AC4(void *a1, void *a2)
{
  if (!a1)
  {
    if (!a2)
    {
LABEL_6:
      char v4 = 1;
      return v4 & 1;
    }
LABEL_8:
    char v4 = 0;
    return v4 & 1;
  }
  if (a1 == (void *)1)
  {
    if (a2 != (void *)1) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ((unint64_t)a2 < 2) {
    goto LABEL_8;
  }
  uint64_t v5 = sub_25C53F368();
  uint64_t v7 = v6;
  if (v5 == sub_25C53F368() && v7 == v8) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25C53F478();
  }
  sub_25C532A40(a1);
  sub_25C532A40(a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C532A50(a2);
  sub_25C532A50(a1);
  return v4 & 1;
}

uint64_t sub_25C531BAC()
{
  unint64_t v0 = sub_25C53F468();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25C531BF8(void **a1, void **a2)
{
  return sub_25C531AC4(*a1, *a2);
}

uint64_t sub_25C531C04(char *a1, char *a2)
{
  return sub_25C531C98(*a1, *a2);
}

uint64_t sub_25C531C10()
{
  uint64_t v0 = sub_25C53F368();
  uint64_t v2 = v1;
  if (v0 == sub_25C53F368() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25C53F478();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25C531C98(char a1, char a2)
{
  unint64_t v3 = sub_25C531A0C(a1);
  uint64_t v5 = v4;
  if (v3 == sub_25C531A0C(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25C53F478();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25C531D20()
{
  return sub_25C531D28(*v0);
}

uint64_t sub_25C531D28(char a1)
{
  return sub_25C53F4A8();
}

uint64_t sub_25C531D8C(uint64_t a1)
{
  return sub_25C531D94(a1, *v1);
}

uint64_t sub_25C531D94(uint64_t a1, char a2)
{
  sub_25C531A0C(a2);
  sub_25C53F378();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C531DE8(uint64_t a1)
{
  return sub_25C531DF0(a1, *v1);
}

uint64_t sub_25C531DF0(uint64_t a1, char a2)
{
  return sub_25C53F4A8();
}

uint64_t sub_25C531E50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C531BAC();
  *a1 = result;
  return result;
}

unint64_t sub_25C531E80@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25C531A0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25C531EAC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C53205C(a1);
  swift_beginAccess();
  sub_25C532A40(a1);
  sub_25C532A60((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C532BE8);
  uint64_t v5 = *(void *)(*(void *)(v1 + 16) + 16);
  sub_25C532ABC(v5, (uint64_t (*)(BOOL))sub_25C532BE8);
  uint64_t v6 = *(void *)(v1 + 16);
  *(void *)(v6 + 16) = v5 + 1;
  *(void *)(v6 + 8 * v5 + 32) = a1;
  swift_endAccess();
  if (v4 == 5) {
    return 5;
  }
  uint64_t v7 = (uint64_t *)(v1 + 24);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9 || (int v10 = *(unsigned __int8 *)(v9 + v8 + 31), v10 == 5))
  {
LABEL_10:
    swift_beginAccess();
    sub_25C532A60((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C532B04);
    uint64_t v17 = *(void *)(*v7 + 16);
    sub_25C532ABC(v17, (uint64_t (*)(BOOL))sub_25C532B04);
    uint64_t v18 = *v7;
    *(void *)(v18 + 16) = v17 + 1;
    *(unsigned char *)(v18 + v17 + 32) = v4;
    swift_endAccess();
    return v4;
  }
  unint64_t v11 = sub_25C531A0C(v10);
  uint64_t v13 = v12;
  if (v11 == sub_25C531A0C(v4) && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = OUTLINED_FUNCTION_0_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
  }
  return 5;
}

uint64_t sub_25C53205C(void *a1)
{
  if (!a1)
  {
    if (sub_25C532400()) {
      return 3;
    }
    if (sub_25C532268()) {
      return 1;
    }
    return 5;
  }
  if (a1 == (void *)1) {
    return 4;
  }
  sub_25C53F368();
  if (v2 == OUTLINED_FUNCTION_3_0() && v1 == v5)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
  if (v2) {
    goto LABEL_30;
  }
  sub_25C53F368();
  if (v2 == OUTLINED_FUNCTION_3_0() && v1 == v7)
  {
    OUTLINED_FUNCTION_6_0();
    sub_25C532A50(a1);
LABEL_30:
    BOOL v13 = sub_25C532210();
    sub_25C532A50(a1);
    if (v13) {
      return 0;
    }
    return 5;
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
  sub_25C532A50(a1);
  if (v2) {
    goto LABEL_30;
  }
  sub_25C53F368();
  if (v2 == OUTLINED_FUNCTION_3_0() && v1 == v9) {
    goto LABEL_33;
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
  sub_25C532A50(a1);
  if (v2) {
    goto LABEL_34;
  }
  sub_25C53F368();
  if (v2 == OUTLINED_FUNCTION_3_0() && v1 == v11)
  {
LABEL_33:
    OUTLINED_FUNCTION_6_0();
    sub_25C532A50(a1);
  }
  else
  {
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_1_0();
    swift_bridgeObjectRelease();
    sub_25C532A50(a1);
    if ((v2 & 1) == 0)
    {
      sub_25C532A50(a1);
      return 5;
    }
  }
LABEL_34:
  BOOL v14 = sub_25C532268();
  sub_25C532A50(a1);
  if (v14) {
    return 2;
  }
  return 5;
}

BOOL sub_25C532210()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = (uint64_t *)(v1 + 32);
  uint64_t v4 = v2 - 1;
  do
  {
    uint64_t v5 = v4;
    uint64_t v6 = *v3++;
    BOOL result = v6 == 0;
    if (!v6) {
      break;
    }
    --v4;
  }
  while (v5);
  return result;
}

BOOL sub_25C532268()
{
  BOOL v1 = sub_25C532210();
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void **)(v2 + 8 * v4 + 32);
    if ((unint64_t)v5 < 2) {
      goto LABEL_14;
    }
    uint64_t v6 = sub_25C53F368();
    uint64_t v8 = v7;
    if (v6 == sub_25C53F368() && v8 == v9) {
      break;
    }
    char v11 = OUTLINED_FUNCTION_4_0();
    sub_25C532A40(v5);
    sub_25C532A40(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_18;
    }
    uint64_t v12 = sub_25C53F368();
    uint64_t v14 = v13;
    if (v12 == sub_25C53F368() && v14 == v15) {
      goto LABEL_17;
    }
    char v17 = OUTLINED_FUNCTION_4_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C532A50(v5);
    sub_25C532A50(v5);
    if (v17) {
      goto LABEL_19;
    }
LABEL_14:
    if (v3 == ++v4)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  sub_25C532A40(v5);
  sub_25C532A40(v5);
LABEL_17:
  swift_bridgeObjectRelease_n();
LABEL_18:
  sub_25C532A50(v5);
  sub_25C532A50(v5);
LABEL_19:
  swift_bridgeObjectRelease_n();
  return v1;
}

uint64_t sub_25C532400()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = *(void **)(v1 + 8 * v3 + 32);
    if ((unint64_t)v4 < 2) {
      goto LABEL_14;
    }
    uint64_t v5 = sub_25C53F368();
    uint64_t v7 = v6;
    if (v5 == sub_25C53F368() && v7 == v8) {
      break;
    }
    char v10 = OUTLINED_FUNCTION_5_0();
    sub_25C532A40(v4);
    sub_25C532A40(v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_19;
    }
    uint64_t v11 = sub_25C53F368();
    uint64_t v13 = v12;
    if (v11 == sub_25C53F368() && v13 == v14) {
      goto LABEL_18;
    }
    char v16 = OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C532A50(v4);
    sub_25C532A50(v4);
    if (v16) {
      goto LABEL_20;
    }
LABEL_14:
    if (v2 == ++v3)
    {
      uint64_t v17 = 0;
      goto LABEL_21;
    }
  }
  sub_25C532A40(v4);
  sub_25C532A40(v4);
LABEL_18:
  swift_bridgeObjectRelease_n();
LABEL_19:
  sub_25C532A50(v4);
  sub_25C532A50(v4);
LABEL_20:
  uint64_t v17 = 1;
LABEL_21:
  swift_bridgeObjectRelease_n();
  return v17;
}

uint64_t sub_25C532588()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C5325B0()
{
  sub_25C532588();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for ASCLockupEventManager()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *BOOL result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ASCLockupEventManager.InstrumentationEvent(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ASCLockupEventManager.InstrumentationEvent(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *BOOL result = a2 + 4;
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
        JUMPOUT(0x25C53276CLL);
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
          *BOOL result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_25C532794(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C5327A0(unsigned char *result, char a2)
{
  *BOOL result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASCLockupEventManager.InstrumentationEvent()
{
  return &type metadata for ASCLockupEventManager.InstrumentationEvent;
}

void *initializeBufferWithCopyOfBuffer for ASCLockupEventManager.DetailedEvent(void *a1, void **a2)
{
  int v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for ASCLockupEventManager.DetailedEvent(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for ASCLockupEventManager.DetailedEvent(void **a1, void **a2)
{
  int v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *BOOL result = *a2;
  return result;
}

void **assignWithTake for ASCLockupEventManager.DetailedEvent(void **a1, unint64_t *a2)
{
  int v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ASCLockupEventManager.DetailedEvent(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ASCLockupEventManager.DetailedEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)BOOL result = 0;
    *(_DWORD *)BOOL result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)BOOL result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25C5329A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25C5329BC(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *BOOL result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ASCLockupEventManager.DetailedEvent()
{
  return &type metadata for ASCLockupEventManager.DetailedEvent;
}

unint64_t sub_25C5329F0()
{
  unint64_t result = qword_26A5AF720;
  if (!qword_26A5AF720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF720);
  }
  return result;
}

id sub_25C532A40(id result)
{
  if ((unint64_t)result >= 2) {
    return result;
  }
  return result;
}

void sub_25C532A50(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

uint64_t sub_25C532A60(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    uint64_t *v1 = result;
  }
  return result;
}

uint64_t sub_25C532ABC(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

char *sub_25C532B04(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF728);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25C5314D0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C532CD8(0, v8, v12, a4);
  }
  return v10;
}

char *sub_25C532BE8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF730);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25C532EC0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C532DC8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_25C532CD8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  uint64_t result = (char *)sub_25C53F448();
  __break(1u);
  return result;
}

uint64_t sub_25C532DC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C53F448();
  __break(1u);
  return result;
}

char *sub_25C532EC0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C53F448();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_25C53F478();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  sub_25C532A40(v0);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_25C53F368();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_25C53F478();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_25C53F478();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  sub_25C532A40(v0);
  return swift_bridgeObjectRelease_n();
}

uint64_t *sub_25C53306C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C53F1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(sub_25C53EED8() + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = &v10[v12];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_25C5331CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v5 + *(int *)(sub_25C53EED8() + 20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t sub_25C5332C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EED8() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C5333D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EED8() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C5334E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EED8() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C5335F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EED8() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C533704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C533718);
}

uint64_t sub_25C533718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C53EED8();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25C5337BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C5337D0);
}

uint64_t sub_25C5337D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C53EED8();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for AppDisambiguationView()
{
  uint64_t result = qword_26A5AF748;
  if (!qword_26A5AF748) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C53389C()
{
  uint64_t result = sub_25C53F1E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53EED8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C533964()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C533980()
{
  uint64_t v0 = type metadata accessor for AppDisambiguationView();
  uint64_t v1 = OUTLINED_FUNCTION_4_1(v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF758);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C534F94();
  swift_allocObject();
  sub_25C535200();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF760);
  sub_25C534E2C(&qword_26A5AF768, &qword_26A5AF760);
  sub_25C53F228();
  sub_25C534E2C(&qword_26A5AF770, &qword_26A5AF758);
  sub_25C53F138();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25C533BA0()
{
  uint64_t v0 = type metadata accessor for AppDisambiguationView();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_25C53F2C8();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  MEMORY[0x261188C10](v2);
  sub_25C53F2B8();
  sub_25C534F94();
  swift_allocObject();
  sub_25C535200();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF778);
  sub_25C534BD8();
  return sub_25C53F288();
}

uint64_t sub_25C533D74()
{
  uint64_t v0 = type metadata accessor for AppDisambiguationView();
  MEMORY[0x270FA5388](v0 - 8);
  sub_25C53EEC8();
  swift_getKeyPath();
  sub_25C534F94();
  swift_allocObject();
  sub_25C535200();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF790);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF798);
  sub_25C534E2C(&qword_26A5AF7A0, &qword_26A5AF790);
  sub_25C534E70(&qword_26A5AF7A8, MEMORY[0x263F6C830]);
  sub_25C53F2A8();
  sub_25C534E70(&qword_26A5AF788, MEMORY[0x263F77720]);
  swift_getOpaqueTypeConformance2();
  return sub_25C53F178();
}

uint64_t sub_25C533FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v53 = a1;
  uint64_t v70 = a3;
  uint64_t v3 = sub_25C53EE08();
  uint64_t v62 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v63 = v4;
  v67 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppDisambiguationView();
  uint64_t v57 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v58 = v6;
  v59 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C53F2A8();
  uint64_t v68 = *(void *)(v7 - 8);
  uint64_t v69 = v7;
  MEMORY[0x270FA5388](v7);
  v66 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF798);
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  MEMORY[0x270FA5388](v9);
  v60 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7B0);
  MEMORY[0x270FA5388](v55);
  v54 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C53ED68();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25C53EDB8();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25C53F1A8();
  uint64_t v72 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7B8);
  uint64_t v52 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53EDF8();
  v50 = v18;
  sub_25C53EDA8();
  swift_bridgeObjectRelease();
  sub_25C53F1B8();
  uint64_t v24 = *MEMORY[0x263F76620];
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  uint64_t v46 = v12;
  v51(v15, v24, v12);
  uint64_t v25 = sub_25C534E70(&qword_26A5AF7C0, MEMORY[0x263F77558]);
  sub_25C53F0D8();
  unint64_t v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v48 = v13 + 8;
  v49 = v26;
  v26(v15, v12);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v72 + 8);
  v72 += 8;
  uint64_t v47 = v27;
  uint64_t v44 = v19;
  v27(v21, v19);
  uint64_t v97 = v19;
  uint64_t v98 = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v71;
  uint64_t v56 = sub_25C53F0B8();
  uint64_t v29 = v52;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v52 + 8);
  v45(v23, v28);
  sub_25C53ED98();
  sub_25C53F1B8();
  uint64_t v30 = v46;
  v51(v15, *MEMORY[0x263F76618], v46);
  uint64_t v31 = v44;
  sub_25C53F0D8();
  v49(v15, v30);
  v47(v21, v31);
  uint64_t v32 = (uint64_t)v54;
  uint64_t v33 = v71;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v54, v23, v71);
  *(void *)(v32 + *(int *)(v55 + 36)) = 0x3FD999999999999ALL;
  v45(v23, v33);
  sub_25C534EB8();
  uint64_t v34 = sub_25C53F0B8();
  uint64_t v35 = sub_25C5352DC(v32, &qword_26A5AF7B0);
  uint64_t v36 = MEMORY[0x261188B40](v35);
  uint64_t v99 = MEMORY[0x263F8D310];
  uint64_t v100 = MEMORY[0x263F77998];
  uint64_t v97 = v36;
  uint64_t v98 = v37;
  uint64_t v96 = 0;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v93 = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  char v38 = sub_25C53EDC8();
  uint64_t v72 = v34;
  if (v38) {
    uint64_t v39 = swift_retain();
  }
  else {
    uint64_t v39 = sub_25C53F0B8();
  }
  uint64_t v89 = MEMORY[0x263F1B720];
  uint64_t v90 = MEMORY[0x263F774B0];
  uint64_t v87 = 0;
  uint64_t v88 = v39;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v84 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v81 = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v74 = MEMORY[0x263F1B720];
  uint64_t v75 = MEMORY[0x263F774B0];
  uint64_t v73 = v56;
  swift_retain();
  uint64_t v40 = v66;
  sub_25C53F298();
  sub_25C534F94();
  sub_25C534F94();
  swift_allocObject();
  sub_25C535200();
  sub_25C535200();
  sub_25C534E70(&qword_26A5AF788, MEMORY[0x263F77720]);
  uint64_t v41 = v60;
  uint64_t v42 = v69;
  sub_25C53F0E8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v40, v42);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v64 + 32))(v70, v41, v65);
}

uint64_t sub_25C5348D8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53F1C8();
  uint64_t v9 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25C5352DC((uint64_t)v8, &qword_26A5AF7F0);
  }
  sub_25C53EDD8();
  uint64_t v11 = sub_25C53ED78();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  uint64_t v12 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_25C53F2D8();
  sub_25C5352DC((uint64_t)v2, &qword_26A5AF7E0);
  sub_25C5352DC((uint64_t)v5, &qword_26A5AF7E8);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_25C534AD4()
{
  return sub_25C53F128();
}

uint64_t sub_25C534AF8()
{
  return sub_25C534B74((uint64_t (*)(uint64_t))sub_25C533BA0);
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

uint64_t sub_25C534B5C()
{
  return sub_25C534B74((uint64_t (*)(uint64_t))sub_25C533D74);
}

uint64_t sub_25C534B74(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_2_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

unint64_t sub_25C534BD8()
{
  unint64_t result = qword_26A5AF780;
  if (!qword_26A5AF780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF778);
    sub_25C53F2A8();
    sub_25C534E70(&qword_26A5AF788, MEMORY[0x263F77720]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF780);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 16) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v9();
  sub_25C53EED8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v10();
  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_25C534DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_2_1(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_25C533FC8(a1, v7, a2);
}

uint64_t sub_25C534E2C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C534E70(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C534EB8()
{
  unint64_t result = qword_26A5AF7C8;
  if (!qword_26A5AF7C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF7B0);
    sub_25C53F1A8();
    sub_25C534E70(&qword_26A5AF7C0, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF7C8);
  }
  return result;
}

uint64_t sub_25C534F94()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_0();
  v3(v2);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_25C534FE8()
{
  uint64_t v1 = *(void *)(type metadata accessor for AppDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  sub_25C53EE08();
  OUTLINED_FUNCTION_3_1();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = ((((v2 + 16) & ~v2) + v3 + v8) & ~v8) + *(void *)(v7 + 64);
  uint64_t v10 = v2 | v8 | 7;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_1_1();
  uint64_t v13 = *(void (**)(void))(v12 + 8);
  OUTLINED_FUNCTION_7_0();
  v13();
  sub_25C53EED8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF740);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v14();
  OUTLINED_FUNCTION_7_0();
  v13();
  OUTLINED_FUNCTION_7_0();
  v13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v16();
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_25C535200()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_0();
  v3(v2);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25C535254()
{
  uint64_t v0 = type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_4_1(v0);
  uint64_t v1 = sub_25C53EE08();
  OUTLINED_FUNCTION_2_1(v1);
  return sub_25C5348D8();
}

uint64_t sub_25C5352DC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v3();
  return a1;
}

uint64_t sub_25C535328()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return 0;
}

uint64_t *sub_25C53545C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(sub_25C53EE38() + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_25C53F1E8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v20 = *(void **)v18;
    uint64_t v19 = *((void *)v18 + 1);
    *uint64_t v17 = v20;
    v17[1] = v19;
    id v21 = v20;
  }
  return a1;
}

void sub_25C5355DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(sub_25C53EE38() + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  uint64_t v8 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_25C5356E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EE38() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v19 = *(void **)v17;
  uint64_t v18 = *(void *)(v17 + 8);
  *uint64_t v16 = v19;
  v16[1] = v18;
  id v20 = v19;
  return a1;
}

uint64_t sub_25C535818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EE38() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void **)(a1 + v15);
  uint64_t v19 = *(void **)v17;
  *uint64_t v16 = *(void *)v17;
  id v20 = v19;

  v16[1] = *(void *)(v17 + 8);
  return a1;
}

uint64_t sub_25C535958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EE38() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25C535A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EE38() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = *(void **)(a1 + v15);
  *uint64_t v16 = *v17;

  v16[1] = v17[1];
  return a1;
}

uint64_t sub_25C535BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C535BCC);
}

uint64_t sub_25C535BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53EE38();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t sub_25C535C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C535CA0);
}

void sub_25C535CA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53EE38();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_25C53F1E8();
    OUTLINED_FUNCTION_5_1();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for AppOffloadedView()
{
  uint64_t result = qword_26A5AF808;
  if (!qword_26A5AF808) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C535D98()
{
  uint64_t result = sub_25C53EE38();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53F1E8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C535E68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C535E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AppOffloadedView();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF818);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25C53EE38();
  uint64_t v22 = MEMORY[0x263F6C840];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  sub_25C53652C(v1, (uint64_t)boxed_opaque_existential_1, MEMORY[0x263F6C848]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF820);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_25C53FD70;
  *(void *)(v12 + 32) = sub_25C53EE28();
  *(void *)(v12 + 40) = v13;
  int v14 = *(void **)(v1 + *(int *)(v4 + 32));
  if (v14)
  {
    sub_25C53652C(v1, (uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AppOffloadedView);
    unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v16 = swift_allocObject();
    sub_25C5366E4((uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
    objc_allocWithZone((Class)type metadata accessor for AppResultsViewFeedbackDelegate());
    uint64_t v17 = sub_25C52F4E8(v12, v14, (uint64_t)sub_25C536748, v16);
    sub_25C5367A8(&v20, (uint64_t)v23);
    uint64_t v24 = v17;
    sub_25C5367C0();
    sub_25C53F138();
    sub_25C53680C((uint64_t)v23);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v10, v7);
  }
  else
  {
    sub_25C53F328();
    sub_25C5364DC();
    uint64_t result = sub_25C53EFB8();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C536148()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = sub_25C53ED78();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53EE18();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    uint64_t v16 = &qword_26A5AF7E8;
    uint64_t v17 = (uint64_t)v11;
    return sub_25C5352DC(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  type metadata accessor for AppOffloadedView();
  sub_25C53F1C8();
  uint64_t v18 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v16 = &qword_26A5AF7F0;
    uint64_t v17 = (uint64_t)v5;
    return sub_25C5352DC(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  uint64_t v20 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v20);
  sub_25C53F2D8();
  sub_25C5352DC((uint64_t)v2, &qword_26A5AF7E0);
  sub_25C5352DC((uint64_t)v9, &qword_26A5AF7E8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v5, v18);
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

unint64_t sub_25C5364DC()
{
  unint64_t result = qword_26A5AF828;
  if (!qword_26A5AF828)
  {
    sub_25C53F328();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF828);
  }
  return result;
}

uint64_t sub_25C53652C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C536594()
{
  uint64_t v1 = (int *)(type metadata accessor for AppOffloadedView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F8);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v7();
  sub_25C53EE38();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF800);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v8();
  sub_25C53F1E8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v9();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C5366E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppOffloadedView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C536748()
{
  type metadata accessor for AppOffloadedView();
  return sub_25C536148();
}

uint64_t sub_25C5367A8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25C5367C0()
{
  unint64_t result = qword_26A5AF830;
  if (!qword_26A5AF830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF830);
  }
  return result;
}

uint64_t sub_25C53680C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C536860()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_25C5368AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C53EF98();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - v6;
  if (qword_26A5AF578 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5B03A0);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9(v7, v8, v2);
  uint64_t v10 = sub_25C53EF88();
  os_log_type_t v11 = sub_25C53F398();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25C52D000, v10, v11, "AppSearchResultsBridgingView.makeUIViewController: returning SearchFoundation card for rendering app result view", v12, 2u);
    MEMORY[0x261189600](v12, -1, -1);
  }

  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v7, v2);
  uint64_t v14 = v1[3];
  uint64_t v15 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v14);
  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  sub_25C5370A4();
  uint64_t v17 = (void *)v1[5];
  id v18 = v16;
  id v19 = v17;
  id v20 = sub_25C536BF4(v16, (uint64_t)v17);
  if (!v20)
  {
    uint64_t v24 = v29;
    v9(v29, v8, v2);
    uint64_t v25 = sub_25C53EF88();
    os_log_type_t v26 = sub_25C53F3C8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25C52D000, v25, v26, "AppSearchResultsBridgingView.makeNSViewController: did not get back a rendered SearchUICardViewController from SearchUI, failing...", v27, 2u);
      MEMORY[0x261189600](v27, -1, -1);
    }

    v13(v24, v2);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67C28]), sel_init);
    goto LABEL_11;
  }
  id v21 = v20;
  objc_msgSend(v20, sel_setScrollEnabled_, 0);
  id result = objc_msgSend(v21, sel_view);
  if (result)
  {
    id v23 = result;
    objc_msgSend(result, sel__setOverrideVibrancyTrait_, 0);

    id v18 = v23;
LABEL_11:

    return v21;
  }
  __break(1u);
  return result;
}

id sub_25C536BF4(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCard_feedbackListener_, a1, a2);

  swift_unknownObjectRelease();
  return v3;
}

id sub_25C536C54()
{
  id v0 = sub_25C5368AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8A0);
  sub_25C53F068();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

id sub_25C536CC4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator());
  return objc_msgSend(v0, sel_init);
}

double sub_25C536CF8(uint64_t a1, char a2, int a3, int a4, id a5)
{
  objc_msgSend(a5, sel_preferredContentSize);
  double v8 = *(double *)&a1;
  if (a2) {
    double v8 = 100.0;
  }
  if (result == 0.0) {
    return v8;
  }
  return result;
}

void sub_25C536D74(void *a1)
{
  if (!a1)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v1 = objc_msgSend(a1, sel_view);
  if (!v1)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v2 = v1;
  objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
}

id sub_25C536E40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25C536E98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppSearchResultsBridgingView.Coordinator()
{
  return self;
}

uint64_t sub_25C536EF0()
{
  return MEMORY[0x263F1BB58];
}

id sub_25C536F08@<X0>(void *a1@<X8>)
{
  id result = sub_25C536CC4();
  *a1 = result;
  return result;
}

double sub_25C536F30(uint64_t a1, char a2, int a3, char a4, void *a5)
{
  return sub_25C536CF8(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_25C536F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25C5370F4();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25C536FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25C5370F4();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25C537034()
{
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25C5370A4()
{
  unint64_t result = qword_26A5AF8A8;
  if (!qword_26A5AF8A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5AF8A8);
  }
  return result;
}

uint64_t sub_25C5370E4(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_25C5370F4()
{
  unint64_t result = qword_26A5AF8B0;
  if (!qword_26A5AF8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF8B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppSearchResultsBridgingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AppSearchResultsBridgingView(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for AppSearchResultsBridgingView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for AppSearchResultsBridgingView(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  long long v4 = (void *)a2[5];
  uint64_t v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  id v6 = v4;

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
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        os_log_type_t v11 = *(uint64_t (**)(void))(v10 + 24);
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

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppSearchResultsBridgingView(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSearchResultsBridgingView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for AppSearchResultsBridgingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSearchResultsBridgingView()
{
  return &type metadata for AppSearchResultsBridgingView;
}

uint64_t *sub_25C537578(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(sub_25C53EEA8() + 20);
    int v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_25C53F1E8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    id v18 = (char *)a2 + v16;
    id v20 = *(void **)v18;
    uint64_t v19 = *((void *)v18 + 1);
    *uint64_t v17 = v20;
    v17[1] = v19;
    id v21 = v20;
  }
  return a1;
}

void sub_25C5376F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(sub_25C53EEA8() + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  uint64_t v8 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  int v9 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_25C537804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EEA8() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v19 = *(void **)v17;
  uint64_t v18 = *(void *)(v17 + 8);
  *uint64_t v16 = v19;
  v16[1] = v18;
  id v20 = v19;
  return a1;
}

uint64_t sub_25C537934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EEA8() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void **)(a1 + v15);
  uint64_t v19 = *(void **)v17;
  *uint64_t v16 = *(void *)v17;
  id v20 = v19;

  v16[1] = *(void *)(v17 + 8);
  return a1;
}

uint64_t sub_25C537A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EEA8() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25C537B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(sub_25C53EEA8() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = *(void **)(a1 + v15);
  *uint64_t v16 = *v17;

  v16[1] = v17[1];
  return a1;
}

uint64_t sub_25C537CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C537CE8);
}

uint64_t sub_25C537CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53EEA8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t sub_25C537DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C537DBC);
}

void sub_25C537DBC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53EEA8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_25C53F1E8();
    OUTLINED_FUNCTION_5_1();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for AppSearchResultsView()
{
  uint64_t result = qword_26A5AF8D0;
  if (!qword_26A5AF8D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C537EB4()
{
  uint64_t result = sub_25C53EEA8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53F1E8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C537F84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C537FA0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8E0);
  MEMORY[0x270FA5388](v1 - 8);
  long long v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8E8);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v3 = sub_25C53EFD8();
  *((void *)v3 + 1) = 0;
  v3[16] = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8F0);
  sub_25C5380F0(v0, (uint64_t)&v3[*(int *)(v8 + 44)]);
  sub_25C538FE0((uint64_t)v3, (uint64_t)v7, &qword_26A5AF8E0);
  *(_WORD *)&v7[*(int *)(v4 + 36)] = 256;
  sub_25C5395F0((uint64_t)v3, &qword_26A5AF8E0);
  sub_25C538EE4();
  sub_25C53F138();
  return sub_25C5395F0((uint64_t)v7, &qword_26A5AF8E8);
}

uint64_t sub_25C5380F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v97 = a2;
  uint64_t v3 = type metadata accessor for AppSearchResultsView();
  uint64_t v4 = v3 - 8;
  uint64_t v92 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v93 = v5;
  uint64_t v94 = (uint64_t)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_25C53ED68();
  uint64_t v84 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  long long v82 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C53EDB8();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v72 = (uint64_t)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_25C53F1A8();
  uint64_t v76 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7B8);
  uint64_t v77 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v73 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_25C53F278();
  uint64_t v86 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  long long v83 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF908);
  MEMORY[0x270FA5388](v78);
  long long v79 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF910);
  MEMORY[0x270FA5388](v90);
  uint64_t v88 = (uint64_t)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF918);
  uint64_t v91 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v89 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF920);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25C53EE78();
  uint64_t v75 = *(void *)(v19 - 8);
  uint64_t v20 = *(void *)(v75 + 64);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v81 = (uint64_t)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v23 = (char *)&v71 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF928);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v95 = (uint64_t)&v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v71 - v27;
  *((void *)&v106 + 1) = sub_25C53EEA8();
  *(void *)&long long v107 = MEMORY[0x263F6C858];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v105);
  sub_25C539030(a1, (uint64_t)boxed_opaque_existential_1, MEMORY[0x263F6C860]);
  uint64_t v30 = sub_25C53EE88();
  uint64_t v31 = a1;
  uint64_t v32 = *(void **)(a1 + *(int *)(v4 + 32));
  if (v32)
  {
    uint64_t v33 = v30;
    objc_allocWithZone((Class)type metadata accessor for AppResultsViewFeedbackDelegate());
    uint64_t v34 = sub_25C52F4E8(v33, v32, 0, 0);
    sub_25C5367A8(&v105, (uint64_t)&v102);
    *((void *)&v104 + 1) = v34;
    long long v105 = v102;
    long long v106 = v103;
    long long v107 = v104;
    sub_25C53EE98();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19) == 1)
    {
      sub_25C5395F0((uint64_t)v18, &qword_26A5AF920);
      uint64_t v35 = 1;
      uint64_t v36 = v96;
    }
    else
    {
      uint64_t v71 = (void (*)(void))MEMORY[0x263F6C850];
      sub_25C5392D4((uint64_t)v18, (uint64_t)v23, MEMORY[0x263F6C850]);
      sub_25C53EE48();
      sub_25C53EDA8();
      swift_bridgeObjectRelease();
      uint64_t v37 = v10;
      sub_25C53F1B8();
      uint64_t v38 = *MEMORY[0x263F76618];
      uint64_t v72 = v31;
      uint64_t v39 = v84;
      uint64_t v40 = v82;
      uint64_t v41 = v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 104))(v82, v38, v85);
      uint64_t v42 = sub_25C53954C(&qword_26A5AF7C0, MEMORY[0x263F77558]);
      uint64_t v43 = v73;
      uint64_t v44 = v74;
      sub_25C53F0D8();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v37, v44);
      *(void *)&long long v102 = v44;
      *((void *)&v102 + 1) = v42;
      swift_getOpaqueTypeConformance2();
      uint64_t v45 = v80;
      uint64_t v46 = sub_25C53F0B8();
      uint64_t v47 = (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v43, v45);
      *((void *)&v103 + 1) = MEMORY[0x263F1B720];
      *(void *)&long long v104 = MEMORY[0x263F774B0];
      *(void *)&long long v102 = v46;
      uint64_t v48 = MEMORY[0x261188BB0](v47);
      uint64_t v100 = MEMORY[0x263F8D310];
      uint64_t v101 = MEMORY[0x263F77998];
      uint64_t v98 = v48;
      uint64_t v99 = v49;
      v50 = v83;
      sub_25C53F268();
      LOBYTE(v46) = sub_25C53F078();
      uint64_t v51 = v86;
      uint64_t v52 = (uint64_t)v79;
      uint64_t v53 = v87;
      (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v79, v50, v87);
      uint64_t v54 = v52 + *(int *)(v78 + 36);
      *(unsigned char *)uint64_t v54 = v46;
      *(_OWORD *)(v54 + 8) = 0u;
      *(_OWORD *)(v54 + 24) = 0u;
      *(unsigned char *)(v54 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v53);
      uint64_t v55 = sub_25C53F188();
      uint64_t v57 = v56;
      sub_25C53F148();
      uint64_t v58 = sub_25C53F158();
      swift_release();
      uint64_t v59 = v88;
      sub_25C538FE0(v52, v88, &qword_26A5AF908);
      v60 = (uint64_t *)(v59 + *(int *)(v90 + 36));
      uint64_t *v60 = v58;
      v60[1] = v55;
      v60[2] = v57;
      sub_25C5395F0(v52, &qword_26A5AF908);
      uint64_t v61 = v94;
      sub_25C539030(v72, v94, (void (*)(void))type metadata accessor for AppSearchResultsView);
      uint64_t v62 = v81;
      sub_25C539030((uint64_t)v23, v81, MEMORY[0x263F6C850]);
      unint64_t v63 = (*(unsigned __int8 *)(v92 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
      unint64_t v64 = (v93 + *(unsigned __int8 *)(v75 + 80) + v63) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
      uint64_t v65 = swift_allocObject();
      sub_25C5392D4(v61, v65 + v63, (void (*)(void))type metadata accessor for AppSearchResultsView);
      sub_25C5392D4(v62, v65 + v64, v71);
      sub_25C539400();
      v66 = v89;
      sub_25C53F0E8();
      swift_release();
      sub_25C5395F0(v59, &qword_26A5AF910);
      sub_25C539594((uint64_t)v23);
      uint64_t v36 = v96;
      (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v28, v66, v96);
      uint64_t v35 = 0;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v28, v35, 1, v36);
    sub_25C538F84((uint64_t)&v105, (uint64_t)&v102);
    uint64_t v67 = v95;
    sub_25C538FE0((uint64_t)v28, v95, &qword_26A5AF928);
    uint64_t v68 = v97;
    sub_25C538F84((uint64_t)&v102, v97);
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF930);
    sub_25C538FE0(v67, v68 + *(int *)(v69 + 48), &qword_26A5AF928);
    sub_25C5395F0((uint64_t)v28, &qword_26A5AF928);
    sub_25C53680C((uint64_t)&v105);
    sub_25C5395F0(v67, &qword_26A5AF928);
    return sub_25C53680C((uint64_t)&v102);
  }
  else
  {
    sub_25C53F328();
    sub_25C53954C((unint64_t *)&qword_26A5AF828, MEMORY[0x263F77980]);
    uint64_t result = sub_25C53EFB8();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C538CDC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppSearchResultsView();
  sub_25C53F1C8();
  uint64_t v9 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25C5395F0((uint64_t)v8, &qword_26A5AF7F0);
  }
  sub_25C53EE68();
  uint64_t v11 = sub_25C53ED78();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  uint64_t v12 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_25C53F2D8();
  sub_25C5395F0((uint64_t)v2, &qword_26A5AF7E0);
  sub_25C5395F0((uint64_t)v5, &qword_26A5AF7E8);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

unint64_t sub_25C538EE4()
{
  unint64_t result = qword_26A5AF8F8;
  if (!qword_26A5AF8F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF8E8);
    sub_25C534E2C(&qword_26A5AF900, &qword_26A5AF8E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF8F8);
  }
  return result;
}

uint64_t sub_25C538F84(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C538FE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = OUTLINED_FUNCTION_3_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C539030(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = OUTLINED_FUNCTION_3_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C539084()
{
  uint64_t v1 = (int *)(type metadata accessor for AppSearchResultsView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = (int *)(sub_25C53EE78() - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = v7 + *(void *)(*(void *)v5 + 64);
  uint64_t v9 = v2 | v6 | 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v10();
  sub_25C53EEA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF8C8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v11();
  sub_25C53F1E8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v12();

  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_1_1();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v15(v0 + v7, v13);
  v15(v0 + v7 + v5[7], v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v16();
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25C5392D4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C539334()
{
  type metadata accessor for AppSearchResultsView();
  sub_25C53EE78();
  return sub_25C538CDC();
}

unint64_t sub_25C539400()
{
  unint64_t result = qword_26A5AF938;
  if (!qword_26A5AF938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF910);
    sub_25C5394A0();
    sub_25C534E2C(&qword_26A5AF950, &qword_26A5AF958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF938);
  }
  return result;
}

unint64_t sub_25C5394A0()
{
  unint64_t result = qword_26A5AF940;
  if (!qword_26A5AF940)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF908);
    sub_25C53954C(&qword_26A5AF948, MEMORY[0x263F776B8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF940);
  }
  return result;
}

uint64_t sub_25C53954C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C539594(uint64_t a1)
{
  uint64_t v2 = sub_25C53EE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C5395F0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v3();
  return a1;
}

uint64_t sub_25C539640()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t *sub_25C5396B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C53F1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(sub_25C53EF08() + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = &v10[v12];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_25C539810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v5 + *(int *)(sub_25C53EF08() + 20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t sub_25C539908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EF08() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C539A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EF08() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C539B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EF08() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C539C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25C53EF08() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C539D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C539D5C);
}

uint64_t sub_25C539D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C53EF08();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25C539DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C539DEC);
}

uint64_t sub_25C539DEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C53EF08();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ButtonFallbackView()
{
  uint64_t result = qword_26A5AF960;
  if (!qword_26A5AF960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C539EB8()
{
  uint64_t result = sub_25C53F1E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53EF08();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C539F80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C539F9C()
{
  uint64_t v1 = type metadata accessor for ButtonFallbackView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25C53A7F0(v0, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25C53A858((uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF970);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF978);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF980);
  uint64_t v8 = sub_25C53F218();
  uint64_t v9 = sub_25C534E2C(&qword_26A5AF988, &qword_26A5AF980);
  unint64_t v10 = sub_25C53A90C();
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  unint64_t v16 = v10;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v6;
  uint64_t v14 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  return sub_25C53F228();
}

uint64_t sub_25C53A168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_25C53F218();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ButtonFallbackView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF980);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF978);
  uint64_t v14 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53A7F0(a1, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25C53A858((uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  uint64_t v28 = a1;
  sub_25C53F168();
  sub_25C53EFE8();
  uint64_t v19 = sub_25C534E2C(&qword_26A5AF988, &qword_26A5AF980);
  unint64_t v20 = sub_25C53A90C();
  uint64_t v21 = v25;
  sub_25C53F118();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v29 = v10;
  uint64_t v30 = v21;
  uint64_t v31 = v19;
  unint64_t v32 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v24;
  sub_25C53F138();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v22);
}

uint64_t sub_25C53A508()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53F1C8();
  uint64_t v9 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25C5352DC((uint64_t)v8, &qword_26A5AF7F0);
  }
  type metadata accessor for ButtonFallbackView();
  sub_25C53EEF8();
  uint64_t v11 = sub_25C53ED78();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  uint64_t v12 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_25C53F2D8();
  sub_25C5352DC((uint64_t)v2, &qword_26A5AF7E0);
  sub_25C5352DC((uint64_t)v5, &qword_26A5AF7E8);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_25C53A704@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for ButtonFallbackView();
  MEMORY[0x261188C40]();
  sub_25C53AAEC();
  uint64_t v2 = sub_25C53F0A8();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_25C53F088();
  uint64_t v7 = sub_25C53F098();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_25C53AB38(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_25C53A7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonFallbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C53A858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonFallbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C53A8BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ButtonFallbackView();
  OUTLINED_FUNCTION_2_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25C53A168(v5, a1);
}

unint64_t sub_25C53A90C()
{
  unint64_t result = qword_26A5AF990;
  if (!qword_26A5AF990)
  {
    sub_25C53F218();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF990);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = *(void *)(type metadata accessor for ButtonFallbackView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v6();
  sub_25C53EF08();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_1();
  v7();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25C53AAA4()
{
  uint64_t v0 = type metadata accessor for ButtonFallbackView();
  OUTLINED_FUNCTION_2_1(v0);
  return sub_25C53A508();
}

uint64_t sub_25C53AAE4@<X0>(uint64_t a1@<X8>)
{
  return sub_25C53A704(a1);
}

unint64_t sub_25C53AAEC()
{
  unint64_t result = qword_26A5AF998;
  if (!qword_26A5AF998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF998);
  }
  return result;
}

uint64_t sub_25C53AB38(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25C53AB48()
{
  return sub_25C534E2C(&qword_26A5AF9A0, &qword_26A5AF9A8);
}

uint64_t *sub_25C53AB84(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C53F1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
    unint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v20(v9, v10, v11);
    uint64_t v12 = (int *)sub_25C53EF18();
    uint64_t v13 = v12[5];
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
    unint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v20(&v9[v12[6]], &v10[v12[6]], v11);
    v17(&v9[v12[7]], &v10[v12[7]], v16);
  }
  return a1;
}

uint64_t sub_25C53AD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = (int *)sub_25C53EF18();
  uint64_t v9 = v5 + v8[5];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v13)((void *)(v10 - 8), v9, v10);
  v7(v5 + v8[6], v6);
  uint64_t v11 = v5 + v8[7];
  return v13(v11, v10);
}

uint64_t sub_25C53AEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25C53EF18();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t sub_25C53B030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25C53EF18();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t sub_25C53B1B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25C53EF18();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t sub_25C53B330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25C53EF18();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t sub_25C53B4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C53B4C4);
}

uint64_t sub_25C53B4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C53EF18();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25C53B540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C53B554);
}

uint64_t sub_25C53B554(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C53EF18();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result = qword_26A5AF9B0;
  if (!qword_26A5AF9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C53B620()
{
  uint64_t result = sub_25C53F1E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53EF18();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C53B6E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C53B704@<X0>(uint64_t a1@<X8>)
{
  uint64_t v75 = a1;
  uint64_t v70 = sub_25C53F198();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for ConfirmationView();
  uint64_t v9 = OUTLINED_FUNCTION_4_1(v8);
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF980);
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v15;
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6();
  uint64_t v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9C0);
  OUTLINED_FUNCTION_0();
  uint64_t v73 = v21;
  uint64_t v74 = v20;
  uint64_t v23 = *(void *)(v22 + 64);
  uint64_t v24 = MEMORY[0x270FA5388](v20);
  uint64_t v72 = (char *)v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v71 = (char *)v63 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v69 = (char *)v63 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v68 = (char *)v63 - v29;
  v63[0] = v1;
  unint64_t v64 = v14;
  sub_25C53C0DC(v1, (uint64_t)v14);
  uint64_t v30 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v66 = ((v30 + 16) & ~v30) + v13;
  uint64_t v67 = (v30 + 16) & ~v30;
  uint64_t v31 = v67;
  uint64_t v65 = v30 | 7;
  uint64_t v32 = swift_allocObject();
  sub_25C53C144((uint64_t)v14, v32 + v31);
  uint64_t v79 = v1;
  sub_25C53F168();
  uint64_t v33 = *(void (**)(uint64_t, void, uint64_t))(v3 + 104);
  uint64_t v34 = v7;
  uint64_t v35 = v7;
  uint64_t v36 = v70;
  v33(v35, *MEMORY[0x263F774E0], v70);
  v63[3] = sub_25C534E2C(&qword_26A5AF988, &qword_26A5AF980);
  uint64_t v37 = v76;
  sub_25C53F0C8();
  uint64_t v38 = *(void *)(v3 + 8);
  v63[1] = v3 + 8;
  v63[2] = v38;
  OUTLINED_FUNCTION_6_1();
  v39();
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
  v77 += 8;
  v40(v19, v37);
  uint64_t v41 = v63[0];
  uint64_t v42 = (uint64_t)v64;
  sub_25C53C0DC(v63[0], (uint64_t)v64);
  uint64_t v43 = swift_allocObject();
  sub_25C53C144(v42, v43 + v67);
  uint64_t v78 = v41;
  sub_25C53F168();
  v33(v34, *MEMORY[0x263F774D8], v36);
  uint64_t v44 = v69;
  uint64_t v45 = v76;
  sub_25C53F0C8();
  OUTLINED_FUNCTION_6_1();
  v46();
  v40(v19, v45);
  uint64_t v48 = v73;
  uint64_t v47 = v74;
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  v50 = v71;
  uint64_t v51 = v68;
  v49(v71, v68, v74);
  uint64_t v52 = v72;
  uint64_t v53 = v44;
  v49(v72, v44, v47);
  uint64_t v54 = *(unsigned __int8 *)(v48 + 80);
  uint64_t v55 = (v54 + 16) & ~v54;
  uint64_t v56 = (v23 + v54 + v55) & ~v54;
  uint64_t v57 = swift_allocObject();
  uint64_t v58 = *(void (**)(uint64_t, char *, uint64_t))(v48 + 32);
  v58(v57 + v55, v50, v47);
  v58(v57 + v56, v52, v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9C8);
  uint64_t v59 = sub_25C53F258();
  unint64_t v60 = sub_25C53C588();
  uint64_t v80 = v59;
  unint64_t v81 = v60;
  swift_getOpaqueTypeConformance2();
  sub_25C53F228();
  uint64_t v61 = *(void (**)(char *, uint64_t))(v48 + 8);
  v61(v53, v47);
  return ((uint64_t (*)(char *, uint64_t))v61)(v51, v47);
}

uint64_t sub_25C53BCB8(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v14 = v13 - v12;
  sub_25C53F1C8();
  uint64_t v15 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1) {
    return sub_25C5395F0(v14, &qword_26A5AF7F0);
  }
  type metadata accessor for ConfirmationView();
  a2();
  uint64_t v17 = sub_25C53ED78();
  __swift_storeEnumTagSinglePayload(v10, 0, 1, v17);
  uint64_t v18 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v18);
  sub_25C53F2D8();
  sub_25C5395F0(v6, &qword_26A5AF7E0);
  sub_25C5395F0(v10, &qword_26A5AF7E8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
}

uint64_t sub_25C53BEA4@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for ConfirmationView();
  a1();
  sub_25C53AAEC();
  uint64_t result = sub_25C53F0A8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_25C53BF20()
{
  uint64_t v0 = sub_25C53F258();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9C0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF980);
  uint64_t v5 = sub_25C534E2C(&qword_26A5AF988, &qword_26A5AF980);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  swift_getOpaqueTypeConformance2();
  uint64_t v6 = sub_25C53F0B8();
  uint64_t v7 = MEMORY[0x263F1B720];
  uint64_t v8 = MEMORY[0x263F774B0];
  uint64_t v14 = MEMORY[0x263F1B720];
  uint64_t v15 = MEMORY[0x263F774B0];
  uint64_t v12 = v6;
  uint64_t v9 = sub_25C53F0B8();
  v11[3] = v7;
  v11[4] = v8;
  v11[0] = v9;
  sub_25C53F248();
  sub_25C53C588();
  sub_25C53F138();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25C53C0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C53C144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C53C1A8()
{
  return sub_25C53C3B8(MEMORY[0x263F6C880]);
}

uint64_t sub_25C53C1C0@<X0>(uint64_t a1@<X8>)
{
  return sub_25C53BEA4(MEMORY[0x263F6C878], a1);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for ConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v16 = v2 | 7;
  uint64_t v17 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v4 = v0 + v3;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v5();
  uint64_t v6 = v4 + v1[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  uint64_t v10 = (int *)sub_25C53EF18();
  uint64_t v11 = v6 + v10[5];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_1_1();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v11, v12);
  v9(v6 + v10[6], v7);
  v14(v6 + v10[7], v12);
  return MEMORY[0x270FA0238](v0, v17, v16);
}

uint64_t sub_25C53C3A0()
{
  return sub_25C53C3B8(MEMORY[0x263F6C890]);
}

uint64_t sub_25C53C3B8(void (*a1)(void))
{
  uint64_t v3 = *(void *)(type metadata accessor for ConfirmationView() - 8);
  return sub_25C53BCB8(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_25C53C41C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C53BEA4(MEMORY[0x263F6C888], a1);
}

uint64_t sub_25C53C44C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9C0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  uint64_t v9 = v8 + v6;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v7);
}

uint64_t sub_25C53C50C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9C0);
  OUTLINED_FUNCTION_4_1(v0);
  return sub_25C53BF20();
}

unint64_t sub_25C53C588()
{
  unint64_t result = qword_26A5AF9D0;
  if (!qword_26A5AF9D0)
  {
    sub_25C53F258();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AF9D0);
  }
  return result;
}

uint64_t sub_25C53C5D8()
{
  return sub_25C534E2C(&qword_26A5AF9D8, &qword_26A5AF9E0);
}

uint64_t *sub_25C53C614(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C53F1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = sub_25C53EF38();
    *(void *)&v9[*(int *)(v12 + 20)] = *(void *)&v10[*(int *)(v12 + 20)];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C53C738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_25C53EF38();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C53C7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = sub_25C53EF38();
  *(void *)(v8 + *(int *)(v11 + 20)) = *(void *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C53C8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = sub_25C53EF38();
  *(void *)(v8 + *(int *)(v11 + 20)) = *(void *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C53C9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = sub_25C53EF38();
  *(void *)(v8 + *(int *)(v11 + 20)) = *(void *)(v9 + *(int *)(v11 + 20));
  return a1;
}

uint64_t sub_25C53CA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C53F1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = sub_25C53EF38();
  *(void *)(v8 + *(int *)(v11 + 20)) = *(void *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C53CB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C53CB68);
}

uint64_t sub_25C53CB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C53EF38();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25C53CBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C53CBF8);
}

uint64_t sub_25C53CBF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C53F1E8();
  OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C53EF38();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for DeviceDisambiguationView()
{
  uint64_t result = qword_26A5AF9E8;
  if (!qword_26A5AF9E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C53CCC4()
{
  uint64_t result = sub_25C53F1E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C53EF38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C53CD8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C53CDA8()
{
  uint64_t v0 = type metadata accessor for DeviceDisambiguationView();
  uint64_t v1 = OUTLINED_FUNCTION_4_1(v0);
  MEMORY[0x270FA5388](v1);
  sub_25C53DDB8();
  swift_allocObject();
  sub_25C53DFF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF9F8);
  sub_25C534E2C(&qword_26A5AFA00, &qword_26A5AF9F8);
  return sub_25C53F228();
}

uint64_t sub_25C53CEE0()
{
  uint64_t v0 = type metadata accessor for DeviceDisambiguationView();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_25C53F2C8();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  MEMORY[0x261188C80](v2);
  sub_25C53F2B8();
  sub_25C53DDB8();
  swift_allocObject();
  sub_25C53DFF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AFA08);
  sub_25C53DAD8();
  return sub_25C53F288();
}

uint64_t sub_25C53D0B4()
{
  uint64_t v0 = type metadata accessor for DeviceDisambiguationView();
  MEMORY[0x270FA5388](v0 - 8);
  sub_25C53EF38();
  swift_getKeyPath();
  sub_25C53DDB8();
  swift_allocObject();
  sub_25C53DFF8();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AFA18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AFA20);
  sub_25C534E2C(&qword_26A5AFA28, &qword_26A5AFA18);
  sub_25C53DD70(&qword_26A5AFA30, MEMORY[0x263F6C8A8]);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF798);
  sub_25C53F2A8();
  sub_25C53DD70(&qword_26A5AF788, MEMORY[0x263F77720]);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return sub_25C53F178();
}

uint64_t sub_25C53D358@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v26 = a2;
  uint64_t v2 = sub_25C53EF68();
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v19[1] = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DeviceDisambiguationView();
  v19[0] = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_25C53EDB8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v20 = sub_25C53F2A8();
  uint64_t v22 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF798);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v24 = v8;
  uint64_t v25 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x261188CB0](v10);
  uint64_t v51 = MEMORY[0x263F8D310];
  uint64_t v52 = MEMORY[0x263F77998];
  uint64_t v49 = v13;
  uint64_t v50 = v14;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  sub_25C53ED98();
  v27[3] = sub_25C53F1A8();
  v27[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v27);
  sub_25C53F1B8();
  sub_25C53F298();
  sub_25C53DDB8();
  sub_25C53DDB8();
  swift_allocObject();
  sub_25C53DFF8();
  sub_25C53DFF8();
  uint64_t v15 = sub_25C53DD70(&qword_26A5AF788, MEMORY[0x263F77720]);
  uint64_t v16 = v20;
  sub_25C53F0E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v16);
  uint64_t v49 = v16;
  uint64_t v50 = v15;
  swift_getOpaqueTypeConformance2();
  uint64_t v17 = v24;
  sub_25C53F138();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v12, v17);
}

uint64_t sub_25C53D844()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C53F1C8();
  uint64_t v9 = sub_25C53F2E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25C5395F0((uint64_t)v8, &qword_26A5AF7F0);
  }
  sub_25C53EF48();
  uint64_t v11 = sub_25C53ED78();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  uint64_t v12 = sub_25C53F238();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_25C53F2D8();
  sub_25C5395F0((uint64_t)v2, &qword_26A5AF7E0);
  sub_25C5395F0((uint64_t)v5, &qword_26A5AF7E8);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_25C53DA40()
{
  return sub_25C53DA74((uint64_t (*)(uint64_t))sub_25C53CEE0);
}

uint64_t sub_25C53DA5C()
{
  return sub_25C53DA74((uint64_t (*)(uint64_t))sub_25C53D0B4);
}

uint64_t sub_25C53DA74(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for DeviceDisambiguationView();
  OUTLINED_FUNCTION_2_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

unint64_t sub_25C53DAD8()
{
  unint64_t result = qword_26A5AFA10;
  if (!qword_26A5AFA10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AFA08);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AF798);
    sub_25C53F2A8();
    sub_25C53DD70(&qword_26A5AF788, MEMORY[0x263F77720]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AFA10);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = *(void *)(type metadata accessor for DeviceDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v6();
  sub_25C53EF38();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25C53DD10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DeviceDisambiguationView();
  OUTLINED_FUNCTION_2_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25C53D358(v5, a1);
}

uint64_t sub_25C53DD70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C53DDB8()
{
  uint64_t v2 = OUTLINED_FUNCTION_6_2();
  v3(v2);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_25C53DE0C()
{
  uint64_t v1 = *(void *)(type metadata accessor for DeviceDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(sub_25C53EF68() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = ((((v2 + 16) & ~v2) + v3 + v5) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v2 | v5 | 7;
  sub_25C53F1E8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF738);
  OUTLINED_FUNCTION_1_1();
  uint64_t v10 = *(void (**)(void))(v9 + 8);
  OUTLINED_FUNCTION_7_0();
  v10();
  sub_25C53EF38();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
  v10();
  OUTLINED_FUNCTION_7_0();
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AF7D8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_1();
  v11();
  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_25C53DFF8()
{
  uint64_t v2 = OUTLINED_FUNCTION_6_2();
  v3(v2);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25C53E04C()
{
  uint64_t v0 = type metadata accessor for DeviceDisambiguationView();
  OUTLINED_FUNCTION_4_1(v0);
  uint64_t v1 = sub_25C53EF68();
  OUTLINED_FUNCTION_2_1(v1);
  return sub_25C53D844();
}

uint64_t sub_25C53E0D4()
{
  return sub_25C534E2C(&qword_26A5AFA38, &qword_26A5AFA40);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return 0;
}

uint64_t sub_25C53E124()
{
  sub_25C53E188();
  uint64_t result = sub_25C53F3D8();
  qword_26A5B0398 = result;
  return result;
}

unint64_t sub_25C53E188()
{
  unint64_t result = qword_26A5AFA48;
  if (!qword_26A5AFA48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5AFA48);
  }
  return result;
}

uint64_t static SnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v68 = type metadata accessor for AppOffloadedView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_2();
  uint64_t v67 = v2;
  OUTLINED_FUNCTION_3_3();
  uint64_t v3 = sub_25C53EE38();
  uint64_t v4 = OUTLINED_FUNCTION_4_2(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_2();
  uint64_t v66 = v5;
  OUTLINED_FUNCTION_3_3();
  uint64_t v65 = type metadata accessor for AppSearchResultsView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_2();
  uint64_t v64 = v7;
  OUTLINED_FUNCTION_3_3();
  uint64_t v8 = sub_25C53EEA8();
  uint64_t v9 = OUTLINED_FUNCTION_4_2(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_2();
  uint64_t v63 = v10;
  OUTLINED_FUNCTION_3_3();
  uint64_t v62 = type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_2();
  uint64_t v61 = v12;
  OUTLINED_FUNCTION_3_3();
  uint64_t v13 = sub_25C53EF18();
  uint64_t v14 = OUTLINED_FUNCTION_4_2(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_2();
  uint64_t v60 = v15;
  OUTLINED_FUNCTION_3_3();
  uint64_t v59 = type metadata accessor for DeviceDisambiguationView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_6();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_25C53EF38();
  uint64_t v21 = OUTLINED_FUNCTION_4_2(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_2();
  uint64_t v58 = v22;
  OUTLINED_FUNCTION_3_3();
  uint64_t v23 = type metadata accessor for ButtonFallbackView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_6();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = sub_25C53EF08();
  uint64_t v29 = OUTLINED_FUNCTION_4_2(v28);
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_6();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_6();
  uint64_t v37 = v36 - v35;
  uint64_t v38 = sub_25C53EED8();
  uint64_t v39 = OUTLINED_FUNCTION_4_2(v38);
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_6();
  uint64_t v42 = v41 - v40;
  sub_25C53EF78();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_6();
  uint64_t v46 = v45 - v44;
  sub_25C53EB3C(a1, v45 - v44, MEMORY[0x263F6C8B8]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_25C53EADC(v46, v32, MEMORY[0x263F6C870]);
      sub_25C53EB3C(v32, v27 + *(int *)(v23 + 20), MEMORY[0x263F6C870]);
      sub_25C53F1D8();
      sub_25C53EB9C(&qword_26A5AFA70, (void (*)(uint64_t))type metadata accessor for ButtonFallbackView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v27, (void (*)(void))type metadata accessor for ButtonFallbackView);
      uint64_t v49 = (void (*)(void))MEMORY[0x263F6C870];
      uint64_t v50 = v32;
      break;
    case 2u:
      uint64_t v42 = v58;
      sub_25C53EADC(v46, v58, MEMORY[0x263F6C8A0]);
      sub_25C53EB3C(v58, v19 + *(int *)(v59 + 20), MEMORY[0x263F6C8A0]);
      sub_25C53F1D8();
      sub_25C53EB9C(&qword_26A5AFA68, (void (*)(uint64_t))type metadata accessor for DeviceDisambiguationView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v19, (void (*)(void))type metadata accessor for DeviceDisambiguationView);
      uint64_t v48 = (void (*)(void))MEMORY[0x263F6C8A0];
      goto LABEL_6;
    case 3u:
      uint64_t v42 = v60;
      sub_25C53EADC(v46, v60, MEMORY[0x263F6C898]);
      sub_25C53EB3C(v60, v61 + *(int *)(v62 + 20), MEMORY[0x263F6C898]);
      sub_25C53F1D8();
      sub_25C53EB9C(&qword_26A5AFA60, (void (*)(uint64_t))type metadata accessor for ConfirmationView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v61, (void (*)(void))type metadata accessor for ConfirmationView);
      uint64_t v48 = (void (*)(void))MEMORY[0x263F6C898];
      goto LABEL_6;
    case 4u:
      uint64_t v51 = v63;
      sub_25C53EADC(v46, v63, MEMORY[0x263F6C860]);
      sub_25C53EB3C(v63, v64, MEMORY[0x263F6C860]);
      sub_25C53F1D8();
      uint64_t v52 = (uint64_t *)(v64 + *(int *)(v65 + 24));
      sub_25C53F328();
      sub_25C53EB9C((unint64_t *)&qword_26A5AF828, MEMORY[0x263F77980]);
      *uint64_t v52 = sub_25C53EFC8();
      v52[1] = v53;
      sub_25C53EB9C(&qword_26A5AFA58, (void (*)(uint64_t))type metadata accessor for AppSearchResultsView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v64, (void (*)(void))type metadata accessor for AppSearchResultsView);
      uint64_t v54 = (void (*)(void))MEMORY[0x263F6C860];
      goto LABEL_9;
    case 5u:
      uint64_t v51 = v66;
      sub_25C53EADC(v46, v66, MEMORY[0x263F6C848]);
      sub_25C53EB3C(v66, v67, MEMORY[0x263F6C848]);
      sub_25C53F1D8();
      uint64_t v55 = (uint64_t *)(v67 + *(int *)(v68 + 24));
      sub_25C53F328();
      sub_25C53EB9C((unint64_t *)&qword_26A5AF828, MEMORY[0x263F77980]);
      *uint64_t v55 = sub_25C53EFC8();
      v55[1] = v56;
      sub_25C53EB9C(&qword_26A5AFA50, (void (*)(uint64_t))type metadata accessor for AppOffloadedView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v67, (void (*)(void))type metadata accessor for AppOffloadedView);
      uint64_t v54 = (void (*)(void))MEMORY[0x263F6C848];
LABEL_9:
      uint64_t v49 = v54;
      uint64_t v50 = v51;
      break;
    default:
      sub_25C53EADC(v46, v42, MEMORY[0x263F6C868]);
      sub_25C53EB3C(v42, v37 + *(int *)(v33 + 20), MEMORY[0x263F6C868]);
      sub_25C53F1D8();
      sub_25C53EB9C(&qword_26A5AFA78, (void (*)(uint64_t))type metadata accessor for AppDisambiguationView);
      uint64_t v47 = sub_25C53F0B8();
      sub_25C53EBE4(v37, (void (*)(void))type metadata accessor for AppDisambiguationView);
      uint64_t v48 = (void (*)(void))MEMORY[0x263F6C868];
LABEL_6:
      uint64_t v49 = v48;
      uint64_t v50 = v42;
      break;
  }
  sub_25C53EBE4(v50, v49);
  return v47;
}

uint64_t sub_25C53EADC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C53EB3C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C53EB9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C53EBE4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

ValueMetadata *type metadata accessor for SnippetProvider()
{
  return &type metadata for SnippetProvider;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25C53EC78()
{
  uint64_t v0 = sub_25C53EF98();
  __swift_allocate_value_buffer(v0, qword_26A5B03A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5B03A0);
  if (qword_26A5AF570 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A5B0398;
  return sub_25C53EFA8();
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

uint64_t sub_25C53ED68()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_25C53ED78()
{
  return MEMORY[0x270F74128]();
}

uint64_t sub_25C53ED88()
{
  return MEMORY[0x270F755D0]();
}

uint64_t sub_25C53ED98()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_25C53EDA8()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_25C53EDB8()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25C53EDC8()
{
  return MEMORY[0x270F639C0]();
}

uint64_t sub_25C53EDD8()
{
  return MEMORY[0x270F639C8]();
}

uint64_t sub_25C53EDE8()
{
  return MEMORY[0x270F639D0]();
}

uint64_t sub_25C53EDF8()
{
  return MEMORY[0x270F639D8]();
}

uint64_t sub_25C53EE08()
{
  return MEMORY[0x270F639E0]();
}

uint64_t sub_25C53EE18()
{
  return MEMORY[0x270F639E8]();
}

uint64_t sub_25C53EE28()
{
  return MEMORY[0x270F639F0]();
}

uint64_t sub_25C53EE38()
{
  return MEMORY[0x270F639F8]();
}

uint64_t sub_25C53EE48()
{
  return MEMORY[0x270F63A00]();
}

uint64_t sub_25C53EE58()
{
  return MEMORY[0x270F63A08]();
}

uint64_t sub_25C53EE68()
{
  return MEMORY[0x270F63A10]();
}

uint64_t sub_25C53EE78()
{
  return MEMORY[0x270F63A18]();
}

uint64_t sub_25C53EE88()
{
  return MEMORY[0x270F63A20]();
}

uint64_t sub_25C53EE98()
{
  return MEMORY[0x270F63A28]();
}

uint64_t sub_25C53EEA8()
{
  return MEMORY[0x270F63A30]();
}

uint64_t sub_25C53EEB8()
{
  return MEMORY[0x270F63A38]();
}

uint64_t sub_25C53EEC8()
{
  return MEMORY[0x270F63A40]();
}

uint64_t sub_25C53EED8()
{
  return MEMORY[0x270F63A48]();
}

uint64_t sub_25C53EEE8()
{
  return MEMORY[0x270F63A50]();
}

uint64_t sub_25C53EEF8()
{
  return MEMORY[0x270F63A58]();
}

uint64_t sub_25C53EF08()
{
  return MEMORY[0x270F63A60]();
}

uint64_t sub_25C53EF18()
{
  return MEMORY[0x270F63A68]();
}

uint64_t sub_25C53EF28()
{
  return MEMORY[0x270F63A70]();
}

uint64_t sub_25C53EF38()
{
  return MEMORY[0x270F63A78]();
}

uint64_t sub_25C53EF48()
{
  return MEMORY[0x270F63A80]();
}

uint64_t sub_25C53EF58()
{
  return MEMORY[0x270F63A88]();
}

uint64_t sub_25C53EF68()
{
  return MEMORY[0x270F63A90]();
}

uint64_t sub_25C53EF78()
{
  return MEMORY[0x270F63A98]();
}

uint64_t sub_25C53EF88()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C53EF98()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C53EFA8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25C53EFB8()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25C53EFC8()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25C53EFD8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25C53EFE8()
{
  return MEMORY[0x270F75928]();
}

uint64_t sub_25C53EFF8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25C53F008()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25C53F028()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25C53F038()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25C53F048()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25C53F068()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_25C53F078()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25C53F088()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25C53F098()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25C53F0A8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25C53F0B8()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25C53F0C8()
{
  return MEMORY[0x270F75970]();
}

uint64_t sub_25C53F0D8()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_25C53F0E8()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_25C53F0F8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C53F108()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C53F118()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25C53F128()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C53F138()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_25C53F148()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25C53F158()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_25C53F168()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25C53F178()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25C53F188()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25C53F198()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_25C53F1A8()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_25C53F1B8()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_25C53F1C8()
{
  return MEMORY[0x270F75B90]();
}

uint64_t sub_25C53F1D8()
{
  return MEMORY[0x270F75BA8]();
}

uint64_t sub_25C53F1E8()
{
  return MEMORY[0x270F75BB8]();
}

uint64_t sub_25C53F1F8()
{
  return MEMORY[0x270F75BC8]();
}

uint64_t sub_25C53F208()
{
  return MEMORY[0x270F75BD0]();
}

uint64_t sub_25C53F218()
{
  return MEMORY[0x270F75BF8]();
}

uint64_t sub_25C53F228()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25C53F238()
{
  return MEMORY[0x270F75C68]();
}

uint64_t sub_25C53F248()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_25C53F258()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_25C53F268()
{
  return MEMORY[0x270F75CF8]();
}

uint64_t sub_25C53F278()
{
  return MEMORY[0x270F75D18]();
}

uint64_t sub_25C53F288()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_25C53F298()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_25C53F2A8()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_25C53F2B8()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_25C53F2C8()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_25C53F2D8()
{
  return MEMORY[0x270F75EF0]();
}

uint64_t sub_25C53F2E8()
{
  return MEMORY[0x270F75F00]();
}

uint64_t sub_25C53F2F8()
{
  return MEMORY[0x270F75F58]();
}

uint64_t sub_25C53F308()
{
  return MEMORY[0x270F75F60]();
}

uint64_t sub_25C53F318()
{
  return MEMORY[0x270F76210]();
}

uint64_t sub_25C53F328()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25C53F338()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C53F348()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25C53F358()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25C53F368()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C53F378()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C53F388()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C53F398()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C53F3A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C53F3B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C53F3C8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C53F3D8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C53F3E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C53F3F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C53F408()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C53F418()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C53F428()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C53F438()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C53F448()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C53F468()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C53F478()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C53F488()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C53F498()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C53F4A8()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}